* Encoding: UTF-8.
STRING ID(A7).
COMPUTE ID = STRING(StudentCohortsId,F7.0).
EXECUTE .
IF length(ltrim(rtrim(ID)))=1 ID=concat('000000',ltrim(rtrim(ID))).
IF length(ltrim(rtrim(ID)))=2 ID=concat('00000',ltrim(rtrim(ID))).
IF length(ltrim(rtrim(ID)))=3 ID=concat('0000',ltrim(rtrim(ID))).
IF length(ltrim(rtrim(ID)))=4 ID=concat('000',ltrim(rtrim(ID))).
IF length(ltrim(rtrim(ID)))=5 ID=concat('00',ltrim(rtrim(ID))).
IF length(ltrim(rtrim(ID)))=6 ID=concat('0',ltrim(rtrim(ID))).
EXECUTE.




STRING  new_ID (A13).
COMPUTE new_ID=CONCAT(Id,term).
VARIABLE LABELS  new_ID 'new_ID'.
EXECUTE.
