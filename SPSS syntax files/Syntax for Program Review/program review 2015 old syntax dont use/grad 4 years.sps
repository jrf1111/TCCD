* Encoding: UTF-8.
* Encoding: .

USE ALL.
COMPUTE filter_$=(CIP = 15.1301 & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "CIP = 15.0301 & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='ARCH 4 years'.


USE ALL.
COMPUTE filter_$=(CIP = 11.0901 & CHAR.SUBSTR(OMAJ_DESC,1,11)='Convergence'  & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2012-13' | Degree_Acad_year = 'AY2013-14' | Degree_Acad_year = 'AY2014-15')).
VARIABLE LABELS filter_$ "CIP = 11.0901 & CHAR.SUBSTR(OMAJ_DESC,1,11)='Convergence'  & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2012-13' | Degree_Acad_year = 'AY2013-14 |  Degree_Acad_year = 'AY2014-15') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*CAD.
USE ALL.
COMPUTE filter_$=(CIP = 15.907 & (DegreeTerm_num >= 27 & DegreeTerm_num < 36)).
VARIABLE LABELS filter_$ 'CIP = 15.907 & (DegreeTerm_num >= 27 & DegreeTerm_num < 36) (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT HrsCmplNodevMAX DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > HrsCmplNodevMAX
    [S][MEAN, COUNT F40.0]
  /CATEGORIES VARIABLES=GENDER ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='ARCH SCH at Graduation'.
************************************************************************.

* Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=(CIP = 15.1301 & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "CIP = 15.0301 & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='CAD 4 years'.


*SIGN.
* Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=(CIP = 16.1603 & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "CIP = 16.1603 & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables sign.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Sign Language 4 years'.

 *Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=(CIP = 15.0701 & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "CIP = 15.0701 & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables OSET.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='OSET 4 years'.

***Paralegal.
 *Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=(CIP = 22.0302 & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "CIP = 22.0302 & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables Paralegal.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Paralegal 4 years'.

***Respiratory.
 *Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=(CIP = 51.0908 & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "CIP = 22.0302 & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables RESP.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Respiratory Therapy 4 years'.

***CONS.
 *Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=((CIP = 15.1001 | CIP= 52.0205) & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "(CIP = 15.1001 | CIP= 52.0205) & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables CONS.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Construction 4 years'.


***Crim.
 *Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=((CIP = 43.0104 | CIP= 43.0107) & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "(CIP = 43.0104 | CIP= 43.0107) & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables Crim.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Criminal Justice 4 years'.

***Culi.
 *Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=((CIP = 52.0901 | CIP= 52.0903) & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "(CIP = 52.0901 | CIP= 52.0903) & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables Culi..
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Culinary Arts 4 years'.

***DIET.
 *Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=((CIP = 51.3101 | CIP= 51.3104) & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
VARIABLE LABELS filter_$ "(CIP = 51.3101 | CIP= 51.3104) & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables DIET.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Dietetics 4 years'.



USE ALL.
COMPUTE filter_$=(ACPG_CIP = '52.0201' | ACAD_PROGRAM_ID = '11.0101' | 
    ACAD_PROGRAM_ID='11.0201' | 'ACAD_PROGRAM_ID='15.1301'  | 'ACAD_PROGRAM_ID='51.0601'  | '+
    ''ACAD_PROGRAM_ID='51.0707'  | 'ACAD_PROGRAM_ID='51.0708' | 'ACAD_PROGRAM_ID='51.0714'  | 
    'ACAD_PROGRAM_ID='51.0713'  | 'ACAD_PROGRAM_ID='51.0805'  | 'ACAD_PROGRAM_ID='51.0907'  | '+
    ''ACAD_PROGRAM_ID='51.0908'  | 'ACAD_PROGRAM_ID='51.0909'  | 'ACAD_PROGRAM_ID='52.0101'  | 
    'ACAD_PROGRAM_ID='52.0201'  | 'ACAD_PROGRAM_ID='52.1299'  | 'ACAD_PROGRAM_ID='48.0501'  | '+
    ''ACAD_PROGRAM_ID='47.0607'  | 'ACAD_PROGRAM_ID='47.0608'  | 'ACAD_PROGRAM_ID='49.0205'  | 
    'ACAD_PROGRAM_ID='52.0204'  | 'ACAD_PROGRAM_ID='51.3101'  | 'ACAD_PROGRAM_ID='52.0101'  | '+
    ''ACAD_PROGRAM_ID='15.0303'  | 'ACAD_PROGRAM_ID='15.0403'  | 'ACAD_PROGRAM_ID='15.0501'  | 
    'ACAD_PROGRAM_ID='47.0603'  | 'ACAD_PROGRAM_ID='47.0604'  | 'ACAD_PROGRAM_ID='48.0508'  | '+
    ''ACAD_PROGRAM_ID='51.0911'  | 'ACAD_PROGRAM_ID='51.0999'  | 'ACAD_PROGRAM_ID='51.1601'  | 
    'ACAD_PROGRAM_ID='51.1614'  | 'ACAD_PROGRAM_ID='51.2308'  | 'ACAD_PROGRAM_ID='52.1299').
VARIABLE LABELS filter_$ "ACPG_CIP = '52.0201' | ACAD_PROGRAM_ID = '11.0101' | ACAD_PROGRAM_ID= "+
    "ACAD_PROGRAM_ID='11.0201' | 'ACAD_PROGRAM_ID='15.1301'  | 'ACAD_PROGRAM_ID='51.0601'  | "+
    "'ACAD_PROGRAM_ID='51.0707'  | 'ACAD_PROGRAM_ID='51.0708' | 'ACAD_PROGRAM_ID='51.071... (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


GET DATA  /TYPE=TXT
  /FILE="T:\Fact Book Committee\Data\Fall 2015\FB table with campuses run 04-19-2016.csv"
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
  FticDecode A39
  EthnicCode A5
  EthnicDesc A29
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
  Campus A2
  Flex F1.0
  new_ID A13
  NEWER_ID A15.
CACHE.
EXECUTE.
DATASET NAME DataSet11 WINDOW=FRONT.
