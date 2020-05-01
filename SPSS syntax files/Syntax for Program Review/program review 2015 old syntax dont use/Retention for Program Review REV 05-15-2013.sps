USE ALL.
COMPUTE filter_$=(FticNoauditNodual = 'X' & Program = 'ASCI.D001.UG').
VARIABLE LABELS filter_$ "FticNoauditNodual = 'X' & Program = 'ASCI.D001.UG' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity Enrolled_in_2012FL DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] BY Enrolled_in_2012FL [C][COUNT F40.0]
  /CATEGORIES VARIABLES=Gender Enrolled_in_2012FL ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Retention of Associate of Science (AS) FTIC Students Fall 2011 to Fall 2012'.