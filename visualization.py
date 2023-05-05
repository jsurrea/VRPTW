import numpy as np
import pandas as pd
import plotly.graph_objects as go

# Para ejecutar este código, debe instalar la librería plotly

df = pd.read_csv("Ruteo_drones.txt", sep='\t', index_col="CUST NO.")
# Se agregan los valores de la variable w: En qué momento es visitado el cliente i
w = [
    [],
    [],
    [230,0,0,0,0,0,0,71,115,0,0,0,0,0,0,0,0,177,91,0,0,0,0,0,0,0],  # Ruta 43
    [230,0,0,0,169,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,52,1.0120809626481869e+02,8.0027756377319974e+01,0,0], # Ruta 71
    [230,0,0,1.1349509756796377e+02,0,0,0,0,0,8.8495097567963967e+01,0,0,53,0,0,0,0,0,0,0,0,0,0,0,161,186], # Ruta 72
    [230,0,40,0,0,0,0,0,0,0,0,0,0,179,0,7.9811388300841941e+01,0,0,0,0,0,0,0,0,0,0], # Ruta 74
    [230,0,0,0,0,24,119,0,0,0,0,0,0,0,54,0,9.0972243622680026e+01,0,0,0,0,0,0,0,0,0], # Ruta 83
    [230,181,0,0,0,0,0,0,0,0,114,8.3071067811864623e+01,0,0,0,0,0,0,0,66,1.3981138830084194e+02,0,0,0,0,0], # Ruta 84
]
routes = [
    [],  # Para evitar problemas de renderización con la primera ruta
    [],
    [0, 7, 18, 8, 17, 0],
    [0, 21, 23, 22, 4, 0],
    [0, 12, 9, 3, 24, 25, 0],
    [0, 2, 15, 13, 0],
    [0, 5, 14, 16, 6, 0],
    [0, 19, 11, 10, 20, 1, 0],
]
d = pd.read_excel("Distancias.xlsx", index_col=0)

# Función que halla el punto donde debe ubicarse el dron i en el tiempo t
def point_between(i,t):
    # Hallar tiempo de llegada al nodo
    wi = [0]
    for cust in routes[i][1:-1]:
        wi.append(w[i][cust])
    wi.append(w[i][0])
    # Hallar arco en el que me encuentro
    idx = 0
    for idx in range(len(wi)-1):
        if wi[idx] <= t <= wi[idx+1]:
            break
    # Hallar el punto entre los nodos
    x0, y0 = df.loc[routes[i][idx], ["X COORD.", "Y COORD."]]
    x1, y1 = df.loc[routes[i][idx+1], ["X COORD.", "Y COORD."]]
    total_time = wi[idx+1] - wi[idx]
    current_time = t - wi[idx]
    x = x0 + (x1 - x0) * current_time / total_time
    y = y0 + (y1 - y0) * current_time / total_time
    return x, y

# Configuración de la figura
fig_dict = {
    "data": [],
    "layout": {},
    "frames": []
}

# Configuración del layout
fig_dict["layout"]["title"] = "Ruteo de Drones Eléctricos"
fig_dict["layout"]["xaxis"] = {"range": [-10, 80]}
fig_dict["layout"]["yaxis"] = {"range": [0, 70]}
fig_dict["layout"]["hovermode"] = "closest"
fig_dict["layout"]["updatemenus"] = [
    {
        # Configuración de los botones de play y pause
        "buttons": [
            {
                "args": [None, {"frame": {"duration": 30, "redraw": False},
                                "fromcurrent": True, "transition": {"duration": 50,
                                                                    "easing": "quadratic-in-out"}}],
                "label": "Play",
                "method": "animate"
            },
            {
                "args": [[None], {"frame": {"duration": 0, "redraw": False},
                                  "mode": "immediate",
                                  "transition": {"duration": 0}}],
                "label": "Pause",
                "method": "animate"
            }
        ],
        "direction": "left",
        "pad": {"r": 10, "t": 87},
        "showactive": False,
        "type": "buttons",
        "x": 0.1,
        "xanchor": "right",
        "y": 0,
        "yanchor": "top"
    }
]

# Configuración de los sliders
sliders_dict = {
    "active": 0,
    "yanchor": "top",
    "xanchor": "left",
    "currentvalue": {
        "font": {"size": 20},
        "prefix": "Minutes since departure: ",
        "visible": True,
        "xanchor": "right"
    },
    "transition": {"duration": 50, "easing": "cubic-in-out"},
    "pad": {"b": 10, "t": 50},
    "len": 0.9,
    "x": 0.1,
    "y": 0,
    "steps": []
}

# Configuración del scatter plot
data_dict = {
    "x": df["X COORD."],
    "y": df["Y COORD."],
    "mode": "markers+text",
    "text": df.index,
    "textposition": "middle center",
    "showlegend": False,
    "marker": {
        "sizemode": "area",
        "sizeref": 0.02,
        "size": df["DEMAND"],
        "color": "rgba(0,0,0,0)"
    }
}

# Configuración de los edges
for route in routes:
    edge_dict = {
        "x": df.loc[route, "X COORD."],
        "y": df.loc[route, "Y COORD."],
        "mode": "lines",
        "line": {"width": 1, "color": "#888"},
        "hoverinfo": 'skip',
        "showlegend": False
    }
    fig_dict["data"].append(edge_dict)

fig_dict["data"].append(data_dict)

# Configuración de la animación
for t in np.linspace(0, 230, 231):
    frame = {"data": [], "name": f"{t:.2f}"}
    data_dict = {
        "x": df["X COORD."],
        "y": df["Y COORD."],
        "mode": "markers+text",
        "text": df.index,
        "textposition": "middle center",
        "showlegend": False,
        "marker": {
            "sizemode": "area",
            "sizeref": 0.02,
            "size": df["DEMAND"],
            "color": ["green" if df.loc[i, "READY TIME"] <= t <= df.loc[i, "DUE DATE"] else "red" for i in df.index],
        }
    }
    frame["data"].append(data_dict)

    # Configuración de los drones
    coords = [point_between(i,t) for i in range(len(routes)-6,len(routes))]
    x_dron = [x for x,y in coords]
    y_dron = [y for x,y in coords]
    dron_dict = {
        "x": x_dron,
        "y": y_dron,
        "mode": "markers",
        "hoverinfo": 'skip',
        "showlegend": False,
        "marker": {
            "sizemode": "area",
            "sizeref": 0.02,
            "size": 20,
            "color": "blue",
        }
    }
    frame["data"].append(dron_dict)

    fig_dict["frames"].append(frame)
    slider_step = {"args": [
        [f"{t:.2f}"],
        {"frame": {"duration": 30, "redraw": False},
         "mode": "immediate",
         "transition": {"duration": 50}}
    ],
        "label": f"{t:.2f}",
        "method": "animate"}
    sliders_dict["steps"].append(slider_step)


fig_dict["layout"]["sliders"] = [sliders_dict]

# Crear una figura y mostrarla en el navegador
fig = go.Figure(fig_dict)
fig.write_html("results.html", auto_open=True)
