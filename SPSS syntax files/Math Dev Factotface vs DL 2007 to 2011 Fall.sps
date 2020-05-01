
*select all Math-0302 courses.
USE ALL.
COMPUTE filter_$=(StcCourseName ='MATH-0302').
VARIABLE LABELS filter_$ "StcCourseName ='MATH-0302' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcCourseName DL_or_face_to_face GrdGradeVerified Passing_course 
    Retained_in_course DISPLAY=LABEL
  /TABLE Campus [C] > StcCourseName [C] > DL_or_face_to_face [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] 
    BY GrdGradeVerified [C] + Passing_course [C] + Retained_in_course [C]
  /CATEGORIES VARIABLES=Campus StcCourseName Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=DL_or_face_to_face ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=GrdGradeVerified ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Distance Learning versus Face-to-Face MATH-0302 Developmental Courses for Spring and Fall '+
    '2012'.


*select all Math-0304 courses.
USE ALL.
COMPUTE filter_$=(StcCourseName ='MATH-0304').
VARIABLE LABELS filter_$ "StcCourseName ='MATH-0304' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcCourseName DL_or_face_to_face GrdGradeVerified Passing_course 
    Retained_in_course DISPLAY=LABEL
  /TABLE Campus [C] > StcCourseName [C] > DL_or_face_to_face [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] 
    BY GrdGradeVerified [C] + Passing_course [C] + Retained_in_course [C]
  /CATEGORIES VARIABLES=Campus StcCourseName Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=DL_or_face_to_face ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=GrdGradeVerified ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
   TITLE='Distance Learning versus Face-to-Face MATH-0304 Developmental Courses for Spring and Fall '+
    '2012'.


*select all Math-0350 courses.
USE ALL.
COMPUTE filter_$=(StcCourseName ='MATH-0350').
VARIABLE LABELS filter_$ "StcCourseName ='MATH-0350' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcCourseName DL_or_face_to_face GrdGradeVerified Passing_course 
    Retained_in_course DISPLAY=LABEL
  /TABLE Campus [C] > StcCourseName [C] > DL_or_face_to_face [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] 
    BY GrdGradeVerified [C] + Passing_course [C] + Retained_in_course [C]
  /CATEGORIES VARIABLES=Campus StcCourseName Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=DL_or_face_to_face ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=GrdGradeVerified ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
   TITLE='Distance Learning versus Face-to-Face MATH-0350 Developmental Courses for Spring and Fall '+
    '2012'.

