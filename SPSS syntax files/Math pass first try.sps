SORT CASES BY Id(A) StcTerm(A).

* Identify Duplicate Cases.
SORT CASES BY Id(A).
MATCH FILES
  /FILE=*
  /BY Id
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst InDupGrp.
VARIABLE LABELS  PrimaryLast 'Indicator of each last matching case as Primary' MatchSequence 
    'Sequential count of matching cases'.
VALUE LABELS  PrimaryLast 0 'Duplicate Case' 1 'Primary Case'.
VARIABLE LEVEL  PrimaryLast (ORDINAL) /MatchSequence (SCALE).
FREQUENCIES VARIABLES=PrimaryLast MatchSequence.
EXECUTE.


USE ALL.
COMPUTE filter_$=(Term_num < 27 & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X' & MatchSequence = 0).
VARIABLE LABELS filter_$ "Term_num < 27 & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X'  & MatchSequence= 0 "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm MatchSequence Passing_course DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm [C] > MatchSequence [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY 
    Passing_course [C]
  /CATEGORIES VARIABLES=Campus MatchSequence Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Mod MATH-0108 ATD FTIC students, per semester, per campus, % of students who passed the '+
    'course in their first attempt'.

FREQUENCIES VARIABLES=TERM_ID FTIC_NOAUDIT_NODUAL_DEGREESEEK MatchSequence
  /ORDER=ANALYSIS.



*Mod Math.





*Calculate 1-year dev.
COMPUTE win_1_yr_0325=Term_num - Term_num_0325.
VARIABLE LABELS  win_1_yr_0325 'win_1_yr_0325'.
EXECUTE.

STRING Passing_dev_1_yr_0325 (A8).
RECODE win_1_yr_0325 (0 thru 3='Yes') (ELSE='No') INTO Passing_dev_1_yr_0325.
VARIABLE LABELS  Passing_dev_1_yr_0325 'Passing dev 0325 within 1 year'.
EXECUTE.

*check number of passing grades.
USE ALL.
COMPUTE filter_$=(MatchSequence = 0 & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X' & Passing_course = 
    'Yes').
VARIABLE LABELS filter_$ "MatchSequence = 0 & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X' & "+
    "Passing_course = 'Yes' (FILTER)".
VALUE LABELS filter_$ 0 'No.

******************THIS SECTION IS STSC*****************************************.

*Calculate 1-SEM STSC.
COMPUTE In_1_sem_0111=Term_num - Term_num_0111.
VARIABLE LABELS  In_1_sem_0111 'win_1_yr_0111'.
EXECUTE.

STRING Passing_STSC_1_sem_0111 (A8).
RECODE In_1_sem_0111 (0 thru 1='Yes') (ELSE='No') INTO Passing_STSC_1_sem_0111.
VARIABLE LABELS  Passing_STSC_1_sem_0111 'Passing STSC within 1 semester_111'.
EXECUTE.

*check number of passing grades.
USE ALL.
COMPUTE filter_$=(Term_num < 27 & MatchSequence = 0 & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X' & Passing_course = 
    'Yes').
VARIABLE LABELS filter_$ "Term_num < 27 & MatchSequence = 0 & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X' & "+
    "Passing_course = 'Yes' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm Passing_course DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course [C]    
  /CATEGORIES VARIABLES=Campus Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Percentage of students who passed Mod MATH-0109 Developmental Course on their first attempt and '+
    'who had been enrolled in and passed the STSC-0111 course within the same or previous semester'.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm Passing_course Passing_STSC_1_sem_0111  DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course [C] > 
    Passing_STSC_1_sem_0111  [C]
  /CATEGORIES VARIABLES=Campus Passing_course Passing_STSC_1_sem_0111  ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Percentage of students who passed Mod MATH-0109 Developmental Course on their first attempt and '+
    'who had been enrolled in and passed the STSC-0111 course within the same or previous semester'.


FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm Passing_course DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course [C]  
   /CATEGORIES VARIABLES=Campus Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Percentage of students who passed ENGL-1301 Gateway Course on their first attempt and '+
    'who had been enrolled in and passed the prerequisite ENGL-0325 course within the previous year'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm Passing_course Passing_dev_1_yr_0325 DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course [C] > 
    Passing_dev_1_yr_0325 [C]
  /CATEGORIES VARIABLES=Campus Passing_course Passing_dev_1_yr_0325 ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
   TITLE='Percentage of students who passed ENGL-1301 Gateway Course on their first attempt and '+
    'who had been enrolled in and passed the prerequisite ENGL-0325 course within the previous year'.










* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm_0350 Passing_course_0350 DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm_0350 [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course_0350 [C]  
    /CATEGORIES VARIABLES=Campus Passing_course_0350 ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm_0350 ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Percentage of students who passed MATH-0350 Gateway Course on their first attempt and '+
    'who had been enrolled in and passed the STSC-0111 course within the same or previous semester'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm_0350 Passing_course_0350 Passing_STSC_1_sem_0111 DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm_0350 [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course_0350 [C] > 
    Passing_STSC_1_sem_0111 [C]
  /CATEGORIES VARIABLES=Campus Passing_course_0350 Passing_STSC_1_sem_0111 ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm_0350 ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Percentage of students who passed MATH-0350 Gateway Course on their first attempt and '+
    'who had been enrolled in and passed the STSC-0111 course within the same or previous semester'.
