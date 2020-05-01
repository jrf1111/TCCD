

* This calculates age from birthdate in the IRP file.

*This calculation pulls birth year as a string.
String  BirthYr_S (A4).
COMPUTE BirthYr_S=CHAR.SUBSTR(BirthDate,8,4).
VARIABLE LABELS  BirthYr_S 'Birth Year_S'.
EXECUTE.

*This calculation pulls birth day as a string.
STRING  BirthDA_S (A2).
COMPUTE BirthDA_S=CHAR.SUBSTR(BirthDate,1,2).
VARIABLE LABELS  BirthDA_S 'Birth Day_S'.
EXECUTE.

*This calculation pulls birth Month as a string.
String BirthMO_ST(A3).
COMPUTE BirthMO_ST=CHAR.SUBSTR(BirthDate,4,3).
VARIABLE LABELS  BirthMO_ST 'Birth Month String'.
EXECUTE.

*This converts birth month into numeirc values but still as a string.
STRING Birth_Mo_S (A2).
RECODE BirthMO_ST ('Jan'='01') ('Feb'='02') ('Mar'='03') ('Apr'='04') ('May'='05') ('Jun'='06') 
    ('Jul'='07') ('Aug'='08') ('Sep'='09') ('Oct'='10') ('Nov'='11')  ('Dec'='12') INTO Birth_Mo_S.
VARIABLE LABELS Birth_Mo_S 'Birth Month_S'.
EXECUTE.

*these next three calculations convert the string variables to numeric values for calculating.

COMPUTE BirthYr=NUMBER(BirthYr_S,F4.0).
VARIABLE LABELS  BirthYr 'Birth Year'.
EXECUTE.

COMPUTE BirthMO=NUMBER(Birth_Mo_S,f2.0).
VARIABLE LABELS  BirthMO 'Birth Month'.
EXECUTE.

COMPUTE BirthDA=NUMBER(BirthDA_S,f2.0).
EXECUTE.


*age computation when you have day, month, and year.

COMPUTE  age2=(((((365.25*(2012-1))+(9*30.4)+(24))-(((BIRTHMO-1)*30.4)+(BIRTHDA)+((BIRTHYR-1)*365.25))))/365.25).
Execute.
