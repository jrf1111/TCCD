* Encoding: UTF-8.
compute VetStatus = 0.
execute.

if (militarystatuses = 'A') VetStatus = 1.
if (militarystatuses = 'G') VetStatus = 1.
if (militarystatuses = 'R') VetStatus = 1.
if (veterantype = 'POTH') VetStatus = 1.
if (veterantype = 'PSDV') VetStatus = 1.
if (veterantype = 'PVVE') VetStatus = 1.
if (veterantype = 'REAP') VetStatus = 1.
if (veterantype = 'V106') VetStatus = 1.
if (veterantype = 'VA30') VetStatus = 1.
if (veterantype = 'VA31') VetStatus = 1.
if (veterantype = 'VA32') VetStatus = 1.
if (veterantype = 'VA33') VetStatus = 1.
if (veterantype = 'VAHL') VetStatus = 1.
if (veterantype = 'VAHS') VetStatus = 1.
if (veterantype = 'VAHZ') VetStatus = 1.
if (veterantype = 'VRAP') VetStatus = 1.
execute. 
