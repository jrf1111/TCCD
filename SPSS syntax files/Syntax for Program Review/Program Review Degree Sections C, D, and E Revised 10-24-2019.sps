* Encoding: UTF-8.

String AA_CRT (A8).
RECODE AcadDegree ('OSA'='3. OSA') ('MSA'='4. MSA') ('FOS'='5. FOS') ('CRT'='1. CRT') ('CNW'='1. CRT') 
    ('CES'='1. CRT') ('CAT'='1. CRT') ('CNF'='6. CNF') (ELSE='2. AA') INTO AA_CRT.
VARIABLE LABELS  AA_CRT 'AA_CRT'.
EXECUTE.

RECODE Gender ('M'='2. M') ('F'='1. F').
EXECUTE.

**Library.
*USE ALL.
*COMPUTE filter_$=((Categories = 'Library' & CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  
    ( AcademicYear = '2013-2014' | AcademicYear = '2014-2015' | AcademicYear 
    = '2015-2016' | AcademicYear = '2016-2017' | AcademicYear = '2017-2018') &  (AA_CRT = '2. AA' | 
    AA_CRT = '1. CRT')).
*VARIABLE LABELS filter_$ "(Categories = 'Library' & "+
    "CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  (AcademicYear = "+
    "'2013-2014' | AcademicYear = '2014-2015' | AcademicYear = '2015-2016' | AcademicYear = "+
    "'2016-2017' | AcademicYear = '201... (FILTER)".
*VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
*FORMATS filter_$ (f1.0).
*FILTER BY filter_$.
*EXECUTE.

**Architecture.
USE ALL.
COMPUTE filter_$=(Categories = 'Architecture'   & (AA_OR_CERT = '1. CRT' | AA_OR_CERT = '2. AA')).
VARIABLE LABELS filter_$ "Categories = 'Architecture   & (AA_CERT = '1. CRT' | AA_OR_CERT = "+
    "'2. AA') (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=Degree_Acad_year Categories ACAD_PROGRAMS_ID AA_OR_CERT
  /ORDER=ANALYSIS.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Degree_Acad_year AA_OR_CERT Grad_4_years DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Degree_Acad_year [C] > AA_OR_CERT [C] > Grad_4_years 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=GENDER Grad_4_years ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Degree_Acad_year AA_OR_CERT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='All Degrees in Architecture 4 years'.


*USE ALL.
*COMPUTE filter_$=(CIP = 11.0901 & CHAR.SUBSTR(OMAJ_DESC,1,11)='Convergence'  & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2012-13' | Degree_Acad_year = 'AY2013-14' | Degree_Acad_year = 'AY2014-15')).
*VARIABLE LABELS filter_$ "CIP = 11.0901 & CHAR.SUBSTR(OMAJ_DESC,1,11)='Convergence'  & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2012-13' | Degree_Acad_year = 'AY2013-14 |  Degree_Acad_year = 'AY2014-15') "+
    "(FILTER)".
*VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
*FORMATS filter_$ (f1.0).
*FILTER BY filter_$.
*EXECUTE.

*CAD.
*USE ALL.
*COMPUTE filter_$=(CIP = 15.907 & (DegreeTerm_num >= 27 & DegreeTerm_num < 36)).
*VARIABLE LABELS filter_$ 'CIP = 15.907 & (DegreeTerm_num >= 27 & DegreeTerm_num < 36) (FILTER)'.
*VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
*FORMATS filter_$ (f1.0).
*FILTER BY filter_$.
*EXECUTE.

**Architecture.
USE ALL.
COMPUTE filter_$=(Categories = 'Architecture'  & (AA_OR_CERT = '1. CRT' | AA_OR_CERT = '2. AA')).
VARIABLE LABELS filter_$ "Categories = 'Architecture   & (AA_CERT = '1. CRT' | AA_OR_CERT = "+
    "'2. AA') (FILTER)".
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
    TITLE='Architecture SCH at Graduation'.
************************************************************************.

* Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=(Categories = 'Architecture' & FticNoauditNodualDegreeseek = 'X' & (AA_OR_CERT = '1. CRT' | AA_OR_CERT = '2. AA')).
VARIABLE LABELS filter_$ "Categories = 'Architecture & FticNoauditNodualDegreeseek = "+
    "'X' & (AA_OR_CERT = '1. CRT' | AA_OR_CERT = '2. AA') (FILTER)".
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
    TITLE='Architecture 4 years'.

