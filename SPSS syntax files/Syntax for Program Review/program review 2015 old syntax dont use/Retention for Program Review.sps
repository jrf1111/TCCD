**Retention Table.

RECODE Enrolled_in_2012FL (SYSMIS=0).
EXECUTE.

USE ALL.
COMPUTE filter_$=(FticNoauditNodual = 'X' & ProgramTitle = 'AAS.Hotel and Restaurant Administration').
VARIABLE LABELS filter_$ "FticNoauditNodual = 'X' & ProgramTitle = 'AAS.Hotel and Restaurant Administration' "+
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
    TITLE='Retention of AA FTIC Students Fall 2011 to Fall 2012'.


USE ALL.
COMPUTE filter_$=(FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts')
VARIABLE LABELS filter_$ "FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts"
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity GpaSUM E801317_SUM DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] BY GpaSUM [S][MEAN, COUNT F40.0] + E801317_SUM [S][MEAN, 
    COUNT F40.0]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /TITLES
    TITLE='end of first semester fall 2010 FTIC AA. Associate of Arts'.

String In_Good_standing (A20).
RECODE EOS_GPA (2.000 thru Highest='In Good Standing') (0 thru 1.99999='Not In Good Standing') 
    (ELSE='N/A') INTO In_Good_standing.
VARIABLE LABELS  In_Good_standing 'In Good Standing'.
EXECUTE.


USE ALL.
COMPUTE filter_$=(FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts').
VARIABLE LABELS filter_$ "FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity GpaSUM In_Good_standing DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] BY GpaSUM [S][MEAN, COUNT F40.0] + In_Good_standing 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Gender In_Good_standing ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /TITLES
    TITLE='end of first semester fall 2012 FTIC '.


USE ALL.
COMPUTE filter_$=(FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts').
VARIABLE LABELS filter_$ "FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


USE ALL.
COMPUTE filter_$=(FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts' & EOS_GPA >= 0).
VARIABLE LABELS filter_$ "FticNoauditNodual = 'X' & ProgramTitle = 'AA.Associate of Arts' & "+
    "EOS_GPA >= 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity EOS_GPA DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] BY EOS_GPA [S][MEAN, COUNT F40.0]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='EOS GPA Fall 2012'.
