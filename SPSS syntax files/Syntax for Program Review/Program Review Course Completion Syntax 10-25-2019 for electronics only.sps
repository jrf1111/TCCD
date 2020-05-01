* Encoding: UTF-8.
*No Audit Grades.
*USE ALL.
*COMPUTE filter_$=((VerifiedGrade ~= 'AU' | VerifiedGrade ~= 'WA') & (AcadYear ~= '2018-2019')).
*VARIABLE LABELS filter_$ "(VerifiedGrade ~= 'AU' | VerifiedGrade ~= 'WA') & (AcadYear ~= '2018-2019') (FILTER)".
*VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
*FORMATS filter_$ (f1.0).
*FILTER BY filter_$.
*EXECUTE.



USE ALL.
COMPUTE filter_$=((Course_prefix = 'CETT' | Course_prefix = 'RBTC' | Course_prefix = 'EECT' | 
    Course_prefix = 'CSIR' | Course_prefix = 'ELMT' | Course_prefix = 'EECT' | Course_prefix = 'ENGR' | 
    Course_prefix = 'TECM' | Course_prefix = 'INCR' | Course_prefix = 'HYDR' | Course_prefix = 'ELPT' | 
    Course_prefix = 'PTRT' | Course_prefix = 'WIND' | Course_prefix = 'ENER' ) & (VerifiedGrade ~= 'AU' 
    &     VerifiedGrade ~= 'WA')).
VARIABLE LABELS filter_$ "(Course_prefix = 'CETT' | Course_prefix = 'RBTC' | Course_prefix = "+
    "'EECT' | Course_prefix = 'CSIR' | Course_prefix = 'ELMT' | Course_prefix = 'EECT' | "+
    "Course_prefix = 'ENGR' | Course_prefix = 'TECM' | Course_prefix = 'INCR' | Course_prefix =... "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName AcadYear DISPLAY=LABEL
  /TABLE CourseName [C] BY AcadYear [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=CourseName AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Electronics course counts'.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE CourseName [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=CourseName AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Electronics course grades'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName AcadYear Passing_course DISPLAY=LABEL
  /TABLE CourseName [C] BY AcadYear [C] > Passing_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=CourseName AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Electronics pass rates'.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName Gender AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE CourseName [C] > Gender BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=CourseName Gender AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Electronics course grade by gender'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName Gender AcadYear Passing_course DISPLAY=LABEL
  /TABLE CourseName [C] > Gender BY AcadYear [C] > Passing_course [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=CourseName Gender AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Electronics gender pass rates' .



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName FT_PT AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE CourseName > FT_PT BY AcadYear > VerifiedGrade [COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=CourseName FT_PT AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Electronics Grade Distribution by FT_PT'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName FT_PT AcadYear Passing_course DISPLAY=LABEL
  /TABLE CourseName [C] > FT_PT [C] BY AcadYear [C] > Passing_course [COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=CourseName FT_PT AcadYear Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Electronics pass rate by FT_PT'.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName newEthnicity AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE CourseName [C] > newEthnicity BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=CourseName AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Electronics course grade by ethnicity'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName newEthnicity AcadYear Passing_course DISPLAY=LABEL
  /TABLE CourseName [C] > newEthnicity BY AcadYear [C] > Passing_course [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=CourseName AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Electronics Ethnicity pass rate'.






