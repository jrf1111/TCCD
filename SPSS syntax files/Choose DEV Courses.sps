

USE ALL.
COMPUTE filter_$=(StcCourseName = 'MATH-0302' | StcCourseName = 'MATH-0304' | StcCourseName = 
    'MATH-0350' | StcCourseName = 'MATH-0361' | StcCourseName = '0363' | StcCourseName = 'RDNG-0361' | 
    StcCourseName = 'RDNG-0363' | StcCourseName = 'INRW-0399' | StcCourseName = 'ENGL-0324'  | 
    StcCourseName = 'ENGL-0325').
VARIABLE LABELS filter_$ "StcCourseName = 'MATH-0302' | StcCourseName = 'MATH-0304' | "+
    "StcCourseName = 'MATH-0350' | StcCourseName = 'MATH-0361' | StcCourseName = '0363' | "+
    "StcCourseName = 'RDNG-0361' | StcCourseName = 'RDNG-0363' | StcCourseName = 'INRW-0399' | "+
    "StcCou... (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
