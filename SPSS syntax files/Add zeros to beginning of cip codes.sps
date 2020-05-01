* Encoding: UTF-8.


CIP_1st_Major
CIP_2nd_major

STRING CIP_2nd_Major2 (A6).
COMPUTE CIP_2nd_Major2= STRING(CIP_2nd_major,F6.0).
EXECUTE .
IF length(ltrim(rtrim(CIP_2nd_Major2)))=1 CIP_2nd_Major2=concat('00000',ltrim(rtrim(CIP_2nd_Major2))).
IF length(ltrim(rtrim(CIP_2nd_Major2)))=2 CIP_2nd_Major2=concat('0000',ltrim(rtrim(CIP_2nd_Major2))).
IF length(ltrim(rtrim(CIP_2nd_Major2)))=3 CIP_2nd_Major2=concat('000',ltrim(rtrim(CIP_2nd_Major2))).
IF length(ltrim(rtrim(CIP_2nd_Major2)))=4 CIP_2nd_Major2=concat('00',ltrim(rtrim(CIP_2nd_Major2))).
IF length(ltrim(rtrim(CIP_2nd_Major2)))=5 CIP_2nd_Major2=concat('0',ltrim(rtrim(CIP_2nd_Major2))).
EXECUTE.
