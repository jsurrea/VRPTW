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
   + 84.50244694346901 theta[49] + 94.98838843652445 theta[50]
   + 92.84000025714479 theta[51] + 109.4507790337794 theta[52]
   + 102.2385508478232 theta[53] + 100.1734216962585 theta[54]
   + 138.7386680408677 theta[55] + 97.30309884384735 theta[56]
   + 99.08326913195984 theta[57] + 94.59653241713673 theta[58]
   + 68.07503209227163 theta[59] + 67.67543745546287 theta[60]
   + 67.38016434065869 theta[61] + 79.62939596523421 theta[62]
   + 98.27472115413663 theta[63] + 76.80738717745309 theta[64]
   + 97.00796519048114 theta[65] + 83.58829537744853 theta[66]
   + 145.8950930334723 theta[67] + 93.39002055457729 theta[68]
   + 60.79561121502488 theta[69] + 91.64628309061109 theta[70]
   + 86.37798826586979 theta[71] + 118.1782528541917 theta[72]
   + 97.80238590156902 theta[73] + 62.18033988749895 theta[74]
   + 69.05239398327288 theta[75] + 77.85577734296183 theta[76]
   + 94.92890033813573 theta[77] + 88.07503209227161 theta[78]
   + 99.50826616831402 theta[79] + 118.0492858308109 theta[80]
Subject To
 lambda[1]: theta[1] + theta[28] + theta[29] + theta[32] + theta[47]
   + theta[48] + theta[52] + theta[53] + theta[63] + theta[64] + theta[73]
   + theta[77] = 1
 lambda[2]: theta[2] + theta[34] + theta[40] + theta[47] + theta[52]
   + theta[56] + theta[60] + theta[67] + theta[70] + theta[74] + theta[75]
   + theta[79] + theta[80] = 1
 lambda[3]: theta[3] + theta[31] + theta[33] + theta[34] + theta[47]
   + theta[52] + theta[55] + theta[61] + theta[64] + theta[67] + theta[72]
   + theta[76] + theta[79] + theta[80] = 1
 lambda[4]: theta[4] + theta[26] + theta[27] + theta[30] + theta[38]
   + theta[39] + theta[40] + theta[42] + theta[45] + theta[57] + theta[58]
   + theta[70] + theta[71] = 1
 lambda[5]: theta[5] + theta[26] + theta[27] + theta[30] + theta[31]
   + theta[37] + theta[44] + theta[46] + theta[51] + theta[54] + theta[56]
   + theta[59] + theta[66] + theta[68] + theta[69] + theta[78] = 1
 lambda[6]: theta[6] + theta[44] + theta[50] + theta[54] + theta[59]
   + theta[60] + theta[66] + theta[75] + theta[78] = 1
 lambda[7]: theta[7] + theta[28] + theta[29] + theta[32] + theta[35]
   + theta[41] + theta[43] + theta[77] = 1
 lambda[8]: theta[8] + theta[36] + theta[37] + theta[41] + theta[43]
   + theta[51] + theta[69] = 1
 lambda[9]: theta[9] + theta[34] + theta[49] + theta[53] + theta[63]
   + theta[64] + theta[72] + theta[76] = 1
 lambda[10]: theta[10] + theta[28] + theta[29] + theta[32] + theta[35]
   + theta[48] + theta[49] + theta[51] + theta[63] + theta[73] + theta[77]
   = 1
 lambda[11]: theta[11] + theta[28] + theta[29] + theta[31] + theta[32]
   + theta[35] + theta[36] + theta[73] = 1
 lambda[12]: theta[12] + theta[34] + theta[45] + theta[53] + theta[61]
   + theta[63] + theta[72] + theta[76] = 1
 lambda[13]: theta[13] + theta[38] + theta[39] + theta[40] + theta[50]
   + theta[54] + theta[56] + theta[59] + theta[62] + theta[66] + theta[74]
   + theta[75] + theta[78] = 1
 lambda[14]: theta[14] + theta[26] + theta[27] + theta[30] + theta[33]
   + theta[37] + theta[46] + theta[48] + theta[50] + theta[54] + theta[68]
   + theta[78] = 1
 lambda[15]: theta[15] + theta[26] + theta[27] + theta[30] + theta[33]
   + theta[38] + theta[39] + theta[40] + theta[42] + theta[46] + theta[48]
   + theta[54] + theta[60] + theta[65] + theta[67] + theta[74] = 1
 lambda[16]: theta[16] + theta[37] + theta[44] + theta[50] + theta[59]
   + theta[65] + theta[66] + theta[68] + theta[78] = 1
 lambda[17]: theta[17] + theta[35] + theta[36] + theta[37] + theta[41]
   + theta[43] + theta[44] + theta[46] + theta[65] + theta[68] = 1
 lambda[18]: theta[18] + theta[43] + theta[44] + theta[48] + theta[50]
   + theta[51] + theta[66] + theta[69] = 1
 lambda[19]: theta[19] + theta[28] + theta[29] + theta[31] + theta[32]
   + theta[35] + theta[36] + theta[41] + theta[73] + theta[77] = 1
 lambda[20]: theta[20] + theta[28] + theta[29] + theta[49] + theta[52]
   + theta[53] + theta[63] + theta[73] + theta[77] = 1
 lambda[21]: theta[21] + theta[45] + theta[47] + theta[52] + theta[53]
   + theta[55] + theta[56] + theta[57] + theta[58] + theta[61] + theta[62]
   + theta[71] + theta[75] + theta[79] + theta[80] = 1
 lambda[22]: theta[22] + theta[26] + theta[27] + theta[30] + theta[33]
   + theta[38] + theta[39] + theta[40] + theta[42] + theta[45] + theta[46]
   + theta[47] + theta[56] + theta[62] + theta[67] + theta[70] + theta[71]
   = 1
 lambda[23]: theta[23] + theta[38] + theta[39] + theta[42] + theta[55]
   + theta[57] + theta[58] + theta[62] + theta[70] + theta[71] = 1
 lambda[24]: theta[24] + theta[30] + theta[31] + theta[33] + theta[34]
   + theta[55] + theta[57] + theta[67] + theta[72] + theta[79] + theta[80]
   = 1
 lambda[25]: theta[25] + theta[26] + theta[27] + theta[31] + theta[33]
   + theta[34] + theta[55] + theta[58] + theta[67] + theta[72] + theta[80]
   = 1
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
 theta[49] <= 1
 theta[50] <= 1
 theta[51] <= 1
 theta[52] <= 1
 theta[53] <= 1
 theta[54] <= 1
 theta[55] <= 1
 theta[56] <= 1
 theta[57] <= 1
 theta[58] <= 1
 theta[59] <= 1
 theta[60] <= 1
 theta[61] <= 1
 theta[62] <= 1
 theta[63] <= 1
 theta[64] <= 1
 theta[65] <= 1
 theta[66] <= 1
 theta[67] <= 1
 theta[68] <= 1
 theta[69] <= 1
 theta[70] <= 1
 theta[71] <= 1
 theta[72] <= 1
 theta[73] <= 1
 theta[74] <= 1
 theta[75] <= 1
 theta[76] <= 1
 theta[77] <= 1
 theta[78] <= 1
 theta[79] <= 1
 theta[80] <= 1
End
