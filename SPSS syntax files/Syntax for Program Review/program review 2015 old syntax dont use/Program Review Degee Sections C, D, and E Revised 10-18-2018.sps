* Encoding: UTF-8.

String AA_CRT (A8).
RECODE AcadDegree ('OSA'='3. OSA') ('MSA'='4. MSA') ('FOS'='5. FOS') ('CRT'='1. CRT') ('CNW'='1. CRT') 
    ('CES'='1. CRT') ('CAT'='1. CRT') ('CNF'='6. CNF') (ELSE='2. AA') INTO AA_CRT.
VARIABLE LABELS  AA_CRT 'AA_CRT'.
EXECUTE.

RECODE Gender ('M'='2. M') ('F'='1. F').
EXECUTE.

**Library.
USE ALL.
COMPUTE filter_$=((Categories = 'Library' & CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  
    ( AcademicYear = '2013-2014' | AcademicYear = '2014-2015' | AcademicYear 
    = '2015-2016' | AcademicYear = '2016-2017' | AcademicYear = '2017-2018') &  (AA_CRT = '2. AA' | 
    AA_CRT = '1. CRT')).
VARIABLE LABELS filter_$ "(Categories = 'Library' & "+
    "CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  (AcademicYear = "+
    "'2013-2014' | AcademicYear = '2014-2015' | AcademicYear = '2015-2016' | AcademicYear = "+
    "'2016-2017' | AcademicYear = '201... (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=AcademicYear Categories ACAD_PROGRAMS_ID AA_CRT
  /ORDER=ANALYSIS.

* Custom Tables. Degrees earned by gender and ethnicity.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender AcademicYear AA_CRT DISPLAY=LABEL
  /TABLE newEthnicity + Gender BY AcademicYear > AA_CRT [COUNT F40.0]
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AcademicYear AA_CRT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Library Degrees 2014-2015 to 2018-2019'.

* Custom Tables. AVG number of non-dev hours at degree.
USE ALL.
COMPUTE filter_$=((Categories = Library & CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  
    (AcademicYear = '2015-2016' | AcademicYear = '2016-2017' | AcademicYear = '2017-2018') &  (AA_CRT = '2. AA' | 
    AA_CRT = '1. CRT')).
VARIABLE LABELS filter_$ "(Categories = Library & "+
    "CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  (AcademicYear = '2015-2016' | AcademicYear = "+
    "'2016-2017' | AcademicYear = '201... (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender AcademicYear AA_CRT HrsCmplNodev DISPLAY=LABEL
  /TABLE newEthnicity [C] + Gender [C] BY AcademicYear [C] > AA_CRT [C] > HrsCmplNodev [S][MEAN, 
    COUNT F40.0]
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AcademicYear AA_CRT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Library AVG Num Non Dev Hours at Graduation'.

*Graduated in 4.
USE ALL.
COMPUTE filter_$=(((Categories = Library & CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&     
     (AcademicYear = '2016-2017' | AcademicYear = '2017-2018') &  (AA_CRT = '2. AA' |     AA_CRT = 
    '1. CRT'))).
VARIABLE LABELS filter_$ "((Categories = Library & "+
    "CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&      (AcademicYear = '2016-2017' | AcademicYear = "+
    "'2017-2018') &  (AA_CRT = '2. AA' |     AA_CRT = '1. CRT')) (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender AcademicYear AA_CRT Grad_in_four DISPLAY=LABEL
  /TABLE newEthnicity [C] + Gender [C] BY AcademicYear [C] > AA_CRT [C] > Grad_in_four 
    [C][ROWPCT.COUNT PCT40.1, COUNT F40.0]
  /CATEGORIES VARIABLES=newEthnicity Grad_in_four ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender AA_CRT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AcademicYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE=' Library Graduated in 4 years'.
**********************************************************************************************************************************************************************************************************
**Psychiatric/Mental Health Services.
USE ALL.
COMPUTE filter_$=((Categories = 'Psychiatric/Mental Health Services' & CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  
    ( AcademicYear = '2013-2014' | AcademicYear = '2014-2015' | AcademicYear 
    = '2015-2016' | AcademicYear = '2016-2017' | AcademicYear = '2017-2018') &  (AA_CRT = '2. AA' | 
    AA_CRT = '1. CRT')).
VARIABLE LABELS filter_$ "(Categories = 'Psychiatric/Mental Health Services' & "+
    "CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  (AcademicYear = "+
    "'2013-2014' | AcademicYear = '2014-2015' | AcademicYear = '2015-2016' | AcademicYear = "+
    "'2016-2017' | AcademicYear = '201... (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=AcademicYear Categories ACAD_PROGRAMS_ID AA_CRT
  /ORDER=ANALYSIS.

* Custom Tables. Degrees earned by gender and ethnicity.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender AcademicYear AA_CRT DISPLAY=LABEL
  /TABLE newEthnicity + Gender BY AcademicYear > AA_CRT [COUNT F40.0]
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AcademicYear AA_CRT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Mental Health Degrees 2013-2014 to 2017-2018'.

* Custom Tables. AVG number of non-dev hours at degree.
USE ALL.
COMPUTE filter_$=((Categories = 'Psychiatric/Mental Health Services' & CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  
    (AcademicYear = '2015-2016' | AcademicYear = '2016-2017' | AcademicYear = '2017-2018') &  (AA_CRT = '2. AA' | 
    AA_CRT = '1. CRT')).
VARIABLE LABELS filter_$ "(Categories = 'Psychiatric/Mental Health Services' & "+
    "CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&  (AcademicYear = '2015-2016' | AcademicYear = "+
    "'2016-2017' | AcademicYear = '201... (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender AcademicYear AA_CRT HrsCmplNodev DISPLAY=LABEL
  /TABLE newEthnicity [C] + Gender [C] BY AcademicYear [C] > AA_CRT [C] > HrsCmplNodev [S][MEAN, 
    COUNT F40.0]
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AcademicYear AA_CRT ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE=' Mental Health AVG Num Non Dev Hours at Graduation'.

*Graduated in 4.
USE ALL.
COMPUTE filter_$=(((Categories = 'Psychiatric/Mental Health Services' & CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&     
     (AcademicYear = '2016-2017' | AcademicYear = '2017-2018') &  (AA_CRT = '2. AA' |     AA_CRT = 
    '1. CRT'))).
VARIABLE LABELS filter_$ "((Categories = 'Psychiatric/Mental Health Services' & "+
    "CHAR.INDEX(ACAD_PROGRAMS_ID,'EDUC')=0 )&      (AcademicYear = '2016-2017' | AcademicYear = "+
    "'2017-2018') &  (AA_CRT = '2. AA' |     AA_CRT = '1. CRT')) (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender AcademicYear AA_CRT Grad_in_four DISPLAY=LABEL
  /TABLE newEthnicity [C] + Gender [C] BY AcademicYear [C] > AA_CRT [C] > Grad_in_four 
    [C][ROWPCT.COUNT PCT40.1, COUNT F40.0]
  /CATEGORIES VARIABLES=newEthnicity Grad_in_four ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender AA_CRT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AcademicYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE=' Mental Health Graduated in 4 years'.
