*Convert SSN to DATATEL ID for International students, students without SSN's.
STRING  SSN_CBM001 (A7).
IF  (CHAR.SUBSTR(SSN,1,2)='88') SSN_CBM001=CHAR.SUBSTR(SSN,3,9).
EXECUTE.
