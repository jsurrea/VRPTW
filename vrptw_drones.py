import numpy as np
import pandas as pd
from os import path
from tqdm import tqdm
from scipy.spatial import distance_matrix
from gurobi import Model, Column, quicksum, GRB

class MasterProblem:

    def __init__(self):
        """
        Crea una nueva instancia del problema maestro
        """

        self.model = Model("Master Problem")
        self.model.setParam("LogToConsole", 0)
        self.model.setAttr("ModelSense", GRB.MINIMIZE)

        # Se inicializa el MP asignando cada dron a un único cliente
        # Esto se traduce en una ruta por cada cliente
        # El costo de la ruta r es del de los arcos Bodega->i y i->Bodega
        # Además, se cumple que a_ir = 1 solo para i = r

        clientes = range(1, N + 1)  
        costos = 2 * t[0, 1:-1]  # Las distancias son simétricas. Se ignora la bodega.

        θ = self.model.addVars(
            clientes,  # i in N
            lb = 0,
            ub = 1,
            obj = costos,
            vtype = GRB.CONTINUOUS, 
            name = "theta",
        )

        self.model.addConstrs(
            (θ[i] == 1 for i in clientes),  # Crea una diagonal
            name = "lambda",
        )

    def update(self, coeffs, cost):
        """
        Actualiza el modelo añadiendo una nueva ruta y un costo asociado
        """

        column = Column(coeffs, self.model.getConstrs())
        self.model.addVar( 
            lb = 0,
            ub = 1,
            obj = cost,
            vtype = GRB.CONTINUOUS, 
            name = "theta[%d]" % (self.model.numVars + 1),
            column = column,
        )

    def __call__(self):
        """
        Ejecuta el problema maestro y retorna el valor de las variables duales
        """
        self.model.update()
        self.model.setParam("LogFile", path.join("LogFiles", "MP-%d.txt" % self.model.numVars))
        self.model.optimize()
        self.model.write(path.join("LP", "MP-%d.lp" % self.model.numVars))
        self.model.write(path.join("Solutions", "MP-%d.sol" % self.model.numVars))
        return self.model.getAttr("Pi", self.model.getConstrs())


class AuxiliarProblem:

    def __init__(self):
        """
        Crea una nueva instancia del problema auxiliar
        """

        self.model = Model("Auxiliar Problem")
        self.model.setParam("LogToConsole", 0)
        self.model.setAttr("ModelSense", GRB.MINIMIZE)
        self.numVars = N

        M = 1000  # Valor muy grande que "equivale" a infinito para el problema

        b = self.model.addVars(
            range(0, N + 1),  # i in V - {N+1}
            range(1, N + 2),  # j in V - {0}
            vtype = GRB.BINARY, 
            name = "b",
        )
        self.b = b  # Guardar las variables para actualizar la FO

        w = self.model.addVars(
            range(0, N + 2),
            lb = 0,
            ub = 230,  # 4 horas de batería
            obj = 0,
            vtype = GRB.CONTINUOUS,
            name = "w"
        )

        # Restricción Ad-hoc para evitar usar arcos que inicien y terminen en el mismo nodo
        self.model.addConstrs(
            (b[i%(N+1), i] == 0 for i in range(1, N + 2)),
            name = "AdHoc"
        )

        # Restricción Ad-hoc para acelerar el modelo
        self.model.addConstrs(
            (quicksum(b[i,j] for j in range(1, N + 2)) <= 1 for i in range(0, N + 1)),
            name = "SalidaNodo",
        )

        self.model.addConstr(
            quicksum(b[0,j] for j in range(1, N + 1)) == 1,
            name = "SalidaBodega",
        )

        self.model.addConstr(
            quicksum(b[i,N+1] for i in range(1, N + 1)) == 1,
            name = "LlegadaBodega",
        )

        self.model.addConstrs(
            (
                quicksum(b[i,j] for j in range(1, N + 2)) == quicksum(b[j,i] for j in range(0, N + 1))
                for i in range(1, N + 1)
            ),
            name = "Flujo",
        )

        self.model.addConstrs(
            (
                w[i] + s[i] + t[i,j] - w[j] <= (1 - b[i,j]) * M
                for i in range(0, N + 1) for j in range(1, N + 2)
            ),
            name = "Subtoures",
        )

        self.model.addConstrs(
            (
                df.a[i] * quicksum(b[i,j] for j in range(1, N + 2)) <= w[i]
                for i in range(0, N + 1)
            ),
            name = "TimeWindowLow"
        )

        self.model.addConstrs(
            (
                w[i] <= df.b[i] * quicksum(b[i,j] for j in range(1, N + 2))
                for i in range(0, N + 1)
            ),
            name = "TimeWindowHigh"
        )

    def __call__(self, λ):
        """
        Ejecuta el problema auxiliar a partir de las duales del MP
        """

        # Actualiza la FO ya que esta depende de λ
        self.model.setObjective(quicksum(
            (t[i,j] - (λ[i-1] if 1 <= i <= N else 0)) * self.b[i,j]
            for i in range(0, N + 1) for j in range(1, N + 2)
        ))  

        self.numVars += 1

        self.model.update()
        self.model.setParam("LogFile", path.join("LogFiles", "AP-%d.txt" % self.numVars))
        self.model.optimize()
        self.model.write(path.join("LP", "AP-%d.lp" % self.numVars))
        self.model.write(path.join("Solutions", "AP-%d.sol" % self.numVars))

        # Genera la columna, su costo asociado y el costo reducido 
        coeffs = [sum(self.b[i,j].x for j in range(1, N + 2)) for i in range(1, N + 1)]
        column_cost = sum(self.b[i,j].x * t[i,j] for i in range(0, N + 1) for j in range(1, N + 2))
        reduced_cost = self.model.getObjective().getValue()

        return coeffs, column_cost, reduced_cost


def read_data(path):
    """
    Lee los parámetros del archivo
    """
    df = pd.read_csv(path, sep = "\t")
    df = df.set_index("CUST NO.")
    df = df.rename(columns = {"READY TIME": "a", "DUE DATE": "b"})
    df.loc[N+1] = df.loc[0]
    coords = df[["X COORD.", "Y COORD."]]
    t = distance_matrix(coords, coords)
    pd.DataFrame(t, columns = df.index, index = df.index).to_excel("Distancias.xlsx")
    return df, t


if __name__ == "__main__":

    # Parámetros del modelo
    N = 25                                  # Número de clientes
    K = 25                                  # Número de drones disponibles
    s = [0] + [10] * N + [0]                # Tiempos de servicio
    df, t = read_data("Ruteo_drones.txt")   # Datos de los clientes y distancias

    mp = MasterProblem()
    ap = AuxiliarProblem()

    pbar = tqdm(desc = "Generación de columnas - VRPTW")
    while True:
        λ = mp()
        coeffs, column_cost, reduced_cost = ap(λ)
        if reduced_cost >= 0:
            break
        mp.update(coeffs, column_cost)
        pbar.update()
    pbar.close()
