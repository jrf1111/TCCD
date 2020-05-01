* Encoding: UTF-8.

*Recode Grades into passing where passing equals A B or C.
String Passing_course (A3).
RECODE GrdGradeVerified ('A'='Yes') ('B'='Yes') ('C'='Yes') ('CR'='Yes') (ELSE='No') INTO Passing_course.
VARIABLE LABELS  Passing_course 'Received a passing grade'.
EXECUTE.


RECODE GrdGradeVerified (CONVERT)  ('A'=1) ('B'=1) ('C'=1) ('D'=1) ('F'=1) ('CR'=1) (ELSE=0) INTO Retained_in_course.
VARIABLE LABELS  Retained_in_course 'Retained in course'.
EXECUTE.

Value labels  Retained_in_course
1 'Yes' 0 'No'.
Execute.

*Recode Grades grade verified into passing where passing equals A B or C Use with ST Student Enrollment Data or for SI report .
String Passing_course (A3).
RECODE VerifiedGrade ('A'='Yes') ('B'='Yes') ('C'='Yes') ('CR'='Yes') (ELSE='No') INTO Passing_course.
VARIABLE LABELS  Passing_course 'Received a passing grade'.
EXECUTE.

RECODE VerifiedGrade (CONVERT)  ('A'=1) ('B'=1) ('C'=1) ('D'=1) ('F'=1) ('CR'=1) (ELSE=0) INTO Retained_in_course.
VARIABLE LABELS  Retained_in_course 'Retained in course'.
EXECUTE.

Value labels  Retained_in_course
1 'Yes' 0 'No'.
Execute.

CROSSTABS
  /TABLES=VerifiedGrade BY Passing_course Retained_in_course
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

*Recode Grades grade verified into passing where passing equals A B or C.
String Passing_course (A3).
RECODE GradeVerified ('A'='Yes') ('B'='Yes') ('C'='Yes') ('CR'='Yes') (ELSE='No') INTO Passing_course.
VARIABLE VerifiedGrade LABELS  Passing_course 'Received a passing grade'.
EXECUTE.


RECODE VerifiedGrade (CONVERT)  ('A'=1) ('B'=1) ('C'=1) ('D'=1) ('F'=1) ('CR'=1) (ELSE=0) INTO Retained_in_course.
VARIABLE LABELS  Retained_in_course 'Retained in course'.
EXECUTE.

Value labels  Retained_in_course
1 'Yes' 0 'No'.
Execute.

