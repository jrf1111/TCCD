USE ALL.
COMPUTE filter_$=( Acad_year_degree = 'AY2010-11'  | Acad_year_degree = 'AY2011-12'  | 
    Acad_year_degree = 'AY2012-13').
VARIABLE LABELS filter_$ " Acad_year_degree = 'AY2010-11'  | Acad_year_degree = 'AY2011-12'  | "+
    "Acad_year_degree = 'AY2012-13' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Acad_year_degree AWARD_LEVEL HrsCmplNodev DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Acad_year_degree [C] > AWARD_LEVEL [C] > HrsCmplNodev 
    [S][MEAN, COUNT F40.0]
  /CATEGORIES VARIABLES=GENDER ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Acad_year_degree ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=AWARD_LEVEL ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='WELD sch at graduation'.


DATASET ACTIVATE DataSet17.
COMPUTE major=CHAR.SUBSTR(AcadProgramId,1,4).
VARIABLE LABELS  major 'Major'.
EXECUTE.
