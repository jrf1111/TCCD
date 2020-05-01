* Encoding: windows-1252.
STRING I3_ssn(A9).
COMPUTE I3_ssn = STRING(nat_id,F9.0).
EXECUTE .
IF length(ltrim(rtrim(I3_ssn)))=1 I3_ssn=concat('00000000',ltrim(rtrim(I3_ssn))).
IF length(ltrim(rtrim(I3_ssn)))=2 I3_ssn=concat('0000000',ltrim(rtrim(I3_ssn))).
IF length(ltrim(rtrim(I3_ssn)))=3 I3_ssn=concat('000000',ltrim(rtrim(I3_ssn))).
IF length(ltrim(rtrim(I3_ssn)))=4 I3_ssn=concat('00000',ltrim(rtrim(I3_ssn))).
IF length(ltrim(rtrim(I3_ssn)))=5 I3_ssn=concat('0000',ltrim(rtrim(I3_ssn))).
IF length(ltrim(rtrim(I3_ssn)))=6 I3_ssn=concat('000',ltrim(rtrim(I3_ssn))).
IF length(ltrim(rtrim(I3_ssn)))=7 I3_ssn=concat('00',ltrim(rtrim(I3_ssn))).
IF length(ltrim(rtrim(I3_ssn)))=8 I3_ssn=concat('0',ltrim(rtrim(I3_ssn))).
EXECUTE.

