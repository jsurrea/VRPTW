\ Model Master Problem
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  30.46309242345563 theta[1] + 36 theta[2] + 44.7213595499958 theta[3]
   + 50 theta[4] + 41.23105625617661 theta[5] + 22.3606797749979 theta[6]
   + 42.42640687119285 theta[7] + 52.49761899362675 theta[8]
   + 64.03124237432849 theta[9] + 50.99019513592785 theta[10]
   + 67.08203932499369 theta[11] + 30 theta[12]
   + 22.3606797749979 theta[13] + 64.03124237432849 theta[14]
   + 60.8276253029822 theta[15] + 58.309518948453 theta[16]
   + 60.8276253029822 theta[17] + 31.62277660168379 theta[18]
   + 64.03124237432849 theta[19] + 63.24555320336759 theta[20]
   + 36.05551275463989 theta[21] + 53.85164807134504 theta[22]
   + 72.11102550927978 theta[23] + 60 theta[24]
   + 67.08203932499369 theta[25] + 129.9214600159999 theta[26]
   + 129.9214600159999 theta[27] + 113.4699200006326 theta[28]
   + 113.4699200006326 theta[29] + 134.408196730823 theta[30]
   + 160.6810399676743 theta[31]
Subject To
 lambda[1]: theta[1] + theta[28] + theta[29] = 1
 lambda[2]: theta[2] = 1
 lambda[3]: theta[3] + theta[31] = 1
 lambda[4]: theta[4] + theta[26] + theta[27] + theta[30] = 1
 lambda[5]: theta[5] + theta[26] + theta[27] + theta[30] + theta[31] = 1
 lambda[6]: theta[6] = 1
 lambda[7]: theta[7] + theta[28] + theta[29] = 1
 lambda[8]: theta[8] = 1
 lambda[9]: theta[9] = 1
 lambda[10]: theta[10] + theta[28] + theta[29] = 1
 lambda[11]: theta[11] + theta[28] + theta[29] + theta[31] = 1
 lambda[12]: theta[12] = 1
 lambda[13]: theta[13] = 1
 lambda[14]: theta[14] + theta[26] + theta[27] + theta[30] = 1
 lambda[15]: theta[15] + theta[26] + theta[27] + theta[30] = 1
 lambda[16]: theta[16] = 1
 lambda[17]: theta[17] = 1
 lambda[18]: theta[18] = 1
 lambda[19]: theta[19] + theta[28] + theta[29] + theta[31] = 1
 lambda[20]: theta[20] + theta[28] + theta[29] = 1
 lambda[21]: theta[21] = 1
 lambda[22]: theta[22] + theta[26] + theta[27] + theta[30] = 1
 lambda[23]: theta[23] = 1
 lambda[24]: theta[24] + theta[30] + theta[31] = 1
 lambda[25]: theta[25] + theta[26] + theta[27] + theta[31] = 1
Bounds
 theta[1] <= 1
 theta[2] <= 1
 theta[3] <= 1
 theta[4] <= 1
 theta[5] <= 1
 theta[6] <= 1
 theta[7] <= 1
 theta[8] <= 1
 theta[9] <= 1
 theta[10] <= 1
 theta[11] <= 1
 theta[12] <= 1
 theta[13] <= 1
 theta[14] <= 1
 theta[15] <= 1
 theta[16] <= 1
 theta[17] <= 1
 theta[18] <= 1
 theta[19] <= 1
 theta[20] <= 1
 theta[21] <= 1
 theta[22] <= 1
 theta[23] <= 1
 theta[24] <= 1
 theta[25] <= 1
 theta[26] <= 1
 theta[27] <= 1
 theta[28] <= 1
 theta[29] <= 1
 theta[30] <= 1
 theta[31] <= 1
End
