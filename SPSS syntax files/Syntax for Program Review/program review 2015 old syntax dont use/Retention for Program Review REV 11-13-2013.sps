

USE ALL.
COMPUTE filter_$=((Major = 'FIRP'  | Major = 'FIRI') & FticNoauditNodual = 'X').
VARIABLE LABELS filter_$ "(Major = 'FIRP'  | Major = 'FIRI') & FticNoauditNodual = 'X' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=Major
  /ORDER=ANALYSIS.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender Enrolled_2009FL DISPLAY=LABEL
  /TABLE newEthnicity [C][COUNT F40.0] + Gender [C][COUNT F40.0] BY Enrolled_2009FL [C]
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Enrolled_2009FL ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='FIRE Program Review 2008FL FTIC returning in 2009FL'.
