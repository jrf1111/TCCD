*EOS GPA AS program.

USE ALL.
COMPUTE filter_$=(FticNoauditNodual = 'X' & Major = 'CONS' & cumulativeGPA > 0).
VARIABLE LABELS filter_$ "FticNoauditNodual = 'X' & Major = 'CONS' & cumulativeGPA > 0 "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity cumulativeGPA Good_standing DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] BY cumulativeGPA [S][MEAN, COUNT F40.0] + 
    Good_standing [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Good_standing ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Fall 2010 EOS GPA CONS Program'.



USE ALL.
COMPUTE filter_$=((AcadProgramId = 'AUTC.D001.UG'  | AcadProgramId= 'AUTC.T001.UG' | AcadProgramId 
    = 'AUTC.T002.UG') & FticNoauditNodual = 'X' & CumulativeGpa > 0).
VARIABLE LABELS filter_$ "(AcadProgramId = 'AUTC.D001.UG'  | AcadProgramId= 'AUTC.T001.UG' | "+
    "AcadProgramId = 'AUTC.T002.UG') & FticNoauditNodual = 'X' & CumulativeGpa > 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SAVE OUTFILE='T:\Program Review 2013-14\EOS GPA\ODR (all students) Fall 2008.sav'
  /COMPRESSED.
