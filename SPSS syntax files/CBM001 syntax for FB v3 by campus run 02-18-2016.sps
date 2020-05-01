* Encoding: UTF-8.
GET DATA  /TYPE=TXT
  /FILE="T:\Fact Book Committee\Data\Fall 2015\CBM001 for FB version three by campus with Summer "+
    "FTIC flag run 02-18-2016.csv"
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  CbmYear A4
  CbmSemester A1
  TermCode A6
  StuId A7
  Ftic A6
  FticDecode A32
  EthnicCode A5
  EthnicDesc A29
  DobYyyy A4
  DobMm A2
  DobDd A2
  Gender A1
  SchAffectedLimit A4
  DevEdSch A4
  TechSch A4
  ChDevEdExcess A3
  SchTechNotFunded A4
  SchAcadNotFunded A4
  SchNotAffectedLimit A4
  New_Transfer A17
  Age F2.0
  Age_range A11
  Total_SCH F2.0
  FT_PT A9
  FTE_12 F5.2
  FTE_15 F5.2
  FticSummerFlag A1
  Fice A6
  Campus A2.
CACHE.
EXECUTE.

*create new id to remove duplicate by campus.
String New_ID (A13).
COMPUTE New_ID=CONCAT(StuId,TermCode).
VARIABLE LABELS  New_ID 'New_ID'.
EXECUTE.

SAVE OUTFILE='T:\Fact Book Committee\Data\Fall 2015\cBM001 for FB version three by campus with Summer FTIC flag run 02-18-2016.sav'
  /COMPRESSED.
*this section runs the tables for the basic demogaphics for the first part of the FB for all terms.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender EthnicDesc Age_range Age FT_PT New_Transfer TermCode 
    DISPLAY=LABEL
  /TABLE Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + EthnicDesc [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Age_range [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Age [S][MEAN COMMA40.1] + FT_PT 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + New_Transfer [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY 
    TermCode [C]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=EthnicDesc Age_range FT_PT New_Transfer TermCode ORDER=A KEY=VALUE 
    EMPTY=EXCLUDE
  /TITLES
    TITLE='Fact Book Tables Version One January 19, 2016'.

*This section of the syntax runs FTE 12 and FTE 15 for all terms.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTE_12 FTE_15 TermCode DISPLAY=LABEL
  /TABLE FTE_12 [S][COUNT F40.0, SUM] + FTE_15 [S][COUNT F40.0, SUM] BY TermCode [C]
  /CATEGORIES VARIABLES=TermCode ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Fact Book Tables Version One Part 2 January 19, 2016'.


GET DATA  /TYPE=TXT
  /FILE="T:\Fact Book Committee\Data\Fall 2015\CBM001 for FB version two with Summer FTIC flag "+
    "run 02-18-2016.csv"
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  CbmYear F4.0
  CbmSemester F1.0
  TermCode A6
  StuId F7.0
  Ftic F6.0
  FticDecode A42
  EthnicCode A5
  EthnicDesc A22
  DobYyyy F4.0
  DobMm F2.0
  DobDd F2.0
  Gender A1
  SchAffectedLimit F4.0
  DevEdSch F4.0
  TechSch F4.0
  ChDevEdExcess F3.0
  SchTechNotFunded F4.0
  SchAcadNotFunded F4.0
  SchNotAffectedLimit F4.0
  New_Transfer A17
  Age F2.0
  Age_range A11
  Total_SCH F2.0
  FT_PT A9
  FTE_12 A22
  FTE_15 A22
  FticSummerFlag A1
  Fice F6.0
  Campus A2.
CACHE.
EXECUTE.
DATASET NAME DataSet1 WINDOW=FRONT.

*create new id to remove duplicate by campus.
String New_ID (A13).
COMPUTE New_ID=CONCAT(StuId,TermCode).
VARIABLE LABELS  New_ID 'New_ID'.
EXECUTE.




