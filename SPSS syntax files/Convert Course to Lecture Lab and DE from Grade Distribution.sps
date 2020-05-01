
*Convert Course to Lab and Lecture and DE.
COMPUTE Lab_course=CHAR.SUBSTR(StcCourseName,10,1)='L'.
VARIABLE LABELS  Lab_course 'Lab course'.
EXECUTE.

Value labels Lab_course
0 'Lecture' 1 'Lab'.

COMPUTE DE_course=CHAR.SUBSTR(section,2,1)='6'.
VARIABLE LABELS DE_Course 'DE course'.
EXECUTE.

Value labels DE_course
0 'Face-to-Face' 1 'Distance Learning'.