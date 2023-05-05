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
   + 160.6810399676743 theta[31] + 96.72245838342408 theta[32]
   + 162.7221025214784 theta[33] + 144.6090018819117 theta[34]
   + 135.3996240166166 theta[35] + 102.6743335497069 theta[36]
   + 119.1380689442625 theta[37] + 117.4117256181839 theta[38]
   + 117.4117256181839 theta[39] + 97.62896138003572 theta[40]
   + 99.74471761907211 theta[41] + 105.736288162721 theta[42]
   + 85.9957108731822 theta[43] + 115.7507003295752 theta[44]
   + 79.95352392457285 theta[45] + 147.373476931259 theta[46]
   + 104.632621945602 theta[47] + 137.3761341072385 theta[48]
Subject To
 lambda[1]: theta[1] + theta[28] + theta[29] + theta[32] + theta[47]
   + theta[48] = 1
 lambda[2]: theta[2] + theta[34] + theta[40] + theta[47] = 1
 lambda[3]: theta[3] + theta[31] + theta[33] + theta[34] + theta[47] = 1
 lambda[4]: theta[4] + theta[26] + theta[27] + theta[30] + theta[38]
   + theta[39] + theta[40] + theta[42] + theta[45] = 1
 lambda[5]: theta[5] + theta[26] + theta[27] + theta[30] + theta[31]
   + theta[37] + theta[44] + theta[46] = 1
 lambda[6]: theta[6] + theta[44] = 1
 lambda[7]: theta[7] + theta[28] + theta[29] + theta[32] + theta[35]
   + theta[41] + theta[43] = 1
 lambda[8]: theta[8] + theta[36] + theta[37] + theta[41] + theta[43] = 1
 lambda[9]: theta[9] + theta[34] = 1
 lambda[10]: theta[10] + theta[28] + theta[29] + theta[32] + theta[35]
   + theta[48] = 1
 lambda[11]: theta[11] + theta[28] + theta[29] + theta[31] + theta[32]
   + theta[35] + theta[36] = 1
 lambda[12]: theta[12] + theta[34] + theta[45] = 1
 lambda[13]: theta[13] + theta[38] + theta[39] + theta[40] = 1
 lambda[14]: theta[14] + theta[26] + theta[27] + theta[30] + theta[33]
   + theta[37] + theta[46] + theta[48] = 1
 lambda[15]: theta[15] + theta[26] + theta[27] + theta[30] + theta[33]
   + theta[38] + theta[39] + theta[40] + theta[42] + theta[46] + theta[48]
   = 1
 lambda[16]: theta[16] + theta[37] + theta[44] = 1
 lambda[17]: theta[17] + theta[35] + theta[36] + theta[37] + theta[41]
   + theta[43] + theta[44] + theta[46] = 1
 lambda[18]: theta[18] + theta[43] + theta[44] + theta[48] = 1
 lambda[19]: theta[19] + theta[28] + theta[29] + theta[31] + theta[32]
   + theta[35] + theta[36] + theta[41] = 1
 lambda[20]: theta[20] + theta[28] + theta[29] = 1
 lambda[21]: theta[21] + theta[45] + theta[47] = 1
 lambda[22]: theta[22] + theta[26] + theta[27] + theta[30] + theta[33]
   + theta[38] + theta[39] + theta[40] + theta[42] + theta[45] + theta[46]
   + theta[47] = 1
 lambda[23]: theta[23] + theta[38] + theta[39] + theta[42] = 1
 lambda[24]: theta[24] + theta[30] + theta[31] + theta[33] + theta[34] = 1
 lambda[25]: theta[25] + theta[26] + theta[27] + theta[31] + theta[33]
   + theta[34] = 1
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
 theta[32] <= 1
 theta[33] <= 1
 theta[34] <= 1
 theta[35] <= 1
 theta[36] <= 1
 theta[37] <= 1
 theta[38] <= 1
 theta[39] <= 1
 theta[40] <= 1
 theta[41] <= 1
 theta[42] <= 1
 theta[43] <= 1
 theta[44] <= 1
 theta[45] <= 1
 theta[46] <= 1
 theta[47] <= 1
 theta[48] <= 1
End
