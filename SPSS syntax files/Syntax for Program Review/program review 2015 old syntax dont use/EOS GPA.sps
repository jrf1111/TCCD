String Good_standing (A22).
RECODE EOS_Gpa (Lowest thru 1.999='Not in Good Standing') (2.00 thru Highest='In Good '+
    'Standing') INTO Good_standing.
VARIABLE LABELS  Good_standing 'In Good Standing'.
EXECUTE.

USE ALL.
COMPUTE filter_$=(AcadProgramId = 'AART.D001.UG'   &  CumulativeHoursCompletedNonDev > 0).
VARIABLE LABELS filter_$ "AcadProgramId = 'AART.D001.UG'   &  CumulativeHoursCompletedNonDev > 0 "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


USE ALL.
COMPUTE filter_$=(HrsCmplNodev > 0 & (Major = 'AUTC' | Major = 'CONS' | Major = 'GINS' | Major = 
    'GRPH' | Major = 'WELD' | Major = 'CULI')).
VARIABLE LABELS filter_$ "HrsCmplNodev > 0 & (Major = 'AUTC' | Major = 'CONS' | Major = 'GINS' | "+
    "Major = 'GRPH' | Major = 'WELD' | Major = 'CULI') (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity CumulativeGpa Good_standing DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] BY CumulativeGpa [S][MEAN, COUNT F40.0] + Good_standing 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Good_standing ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='FIRE Program 2012 FL FTIC  EOS GPA'.






OUTPUT SAVE NAME=Document1
 OUTFILE='T:\Program Reviews 2013\Program Review 2013\AA\AA EOS GPA and Good Standing Final '+
    '04-08-2013.spv'
 LOCK=NO.


USE ALL.
COMPUTE filter_$=(HrsCmplNodev > 0 & (Major = 'AUTC' | Major = 'CONS' | Major = 'GINS' | Major = 
    'GRPH' | Major = 'WELD' | Major = 'CULI')).
VARIABLE LABELS filter_$ "HrsCmplNodev > 0 & (Major = 'AUTC' | Major = 'CONS' | Major = 'GINS' | "+
    "Major = 'GRPH' | Major = 'WELD' | Major = 'CULI') (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


USE ALL.
COMPUTE filter_$=((Major = 'FIRP' | Major = 'FIRI') & HrsCmplNodev > 0).
VARIABLE LABELS filter_$ "(Major = 'FIRP' | Major = 'FIRI') & HrsCmplNodev > 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Major Gender newEthnicity CumulativeGpa Good_standing DISPLAY=LABEL
  /TABLE Major [C] > (Gender [C] + newEthnicity [C]) BY CumulativeGpa [S][MEAN, COUNT F40.0] + 
    Good_standing [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Major Good_standing ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Fall 2011 EOS GPA six majors'.



