* Encoding: UTF-8.
* vet status =1 means they are veterans and not dependent vet status-2 menas they are dependents.
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
if (militarystatuses = 'D') VetStatus = 2.
if (militarystatuses = 'X') VetStatus = 2.
if (militarystatuses = 'I') VetStatus = 2.
if (veterantype = 'VA35') VetStatus = 2.
if (veterantype = 'VADL') VetStatus = 2.
if (veterantype = 'VAHD') VetStatus = 2.
execute. 

Value Labels  VetStatus
0 'Not a Veteran'
1 'Veteran'
2 'Dependent'.




*Updated Wednesday February 6 2019.
* vet status =1 means they are veterans and not dependent vet status-2 means they are dependents.
compute VetStatus = 0.
execute.
if (militarystatuses = 'A') VetStatus = 1.
if (militarystatuses = 'G') VetStatus = 1.
if (militarystatuses = 'R') VetStatus = 1.
if (SmvVetbenEligCode = 'V') VetStatus = 1.
if (SmvVetbenEligCode = 'A') VetStatus = 1.
if (militarystatuses = 'D') VetStatus = 2.
if (militarystatuses = 'X') VetStatus = 2.
if (militarystatuses = 'I') VetStatus = 2.
if (SmvVetbenEligCode = 'S') VetStatus = 2.
if (SmvVetbenEligCode = 'D') VetStatus = 2.
execute. 

 

Value Labels  VetStatus
0 'Not a Veteran'
1 'Veteran'
2 'Dependent'.