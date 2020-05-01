* Encoding: UTF-8.
* Encoding: .

*USE ALL.
*COMPUTE filter_$=(CIP = 15.1301 & DegreeTerm_num >= 18 
    & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11')).
*VARIABLE LABELS filter_$ "CIP = 15.0301 & "+
    "DegreeTerm_num >= 18 & (Degree_Acad_year = 'AY2009-10' | Degree_Acad_year = 'AY 2010-11') "+
    "(FILTER)".
*VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
*FORMATS filter_$ (f1.0).
*FILTER BY filter_$.
*EXECUTE.

COMPUTE filter_$=(Categories = 'Library').
VARIABLE LABELS filter_$ "Categories = 'Library' (FILTER)".
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
    TITLE='Libraryn 4 years'.


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

USE ALL.
COMPUTE filter_$=(Categories = 'Library' & FticNoauditNodualDegreeseek = 'X').
VARIABLE LABELS filter_$ "Categories = 'Library' & FticNoauditNodualDegreeseek = "+
    "'X' (FILTER)".
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
    TITLE='Libraryn SCH at Graduation'.
************************************************************************.

* Encoding: UTF-8.
USE ALL.
COMPUTE filter_$=(Categories = 'Library' & FticNoauditNodualDegreeseek = 'X').
VARIABLE LABELS filter_$ "Categories = 'Library' & FticNoauditNodualDegreeseek = "+
    "'X' (FILTER)".
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
    TITLE='Library 4 years'.

