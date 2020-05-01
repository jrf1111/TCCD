
*Math.
USE ALL.
COMPUTE filter_$=((Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_EAM > 0).
VARIABLE LABELS filter_$ "(Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_EAM "+
    "> 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=TermId SCORE_EAM Passing_Score_EAM DISPLAY=LABEL
  /TABLE TermId [C] BY SCORE_EAM [S][MEAN, COUNT F40.0] + Passing_Score_EAM [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_EAM ORDER=A KEY=VALUE EMPTY=INCLUDE.




*Reading.
USE ALL.
COMPUTE filter_$=((Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_R > 0).
VARIABLE LABELS filter_$ "(Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_R "+
    "> 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=TermId SCORE_R Passing_Score_R DISPLAY=LABEL
  /TABLE TermId [C] BY SCORE_R [S][MEAN, COUNT F40.0] + Passing_Score_R [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_R ORDER=A KEY=VALUE EMPTY=INCLUDE.

*Writing.
USE ALL.
COMPUTE filter_$=((Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_W > 0).
VARIABLE LABELS filter_$ "(Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_W "+
    "> 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=TermId SCORE_W Passing_Score_W DISPLAY=LABEL
  /TABLE TermId [C] BY SCORE_W [S][MEAN, COUNT F40.0] + Passing_Score_W [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_W ORDER=A KEY=VALUE EMPTY=INCLUDE.


*Essay.
USE ALL.
COMPUTE filter_$=((Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_E > 0).
VARIABLE LABELS filter_$ "(Major = 'FIRP' | Major = 'FIRI') & FticNoauditNodual = 'X' & SCORE_E "+
    "> 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=TermId SCORE_E Passing_Score_E DISPLAY=LABEL
  /TABLE TermId [C] BY SCORE_E [S][MEAN, COUNT F40.0] + Passing_Score_E [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_E ORDER=A KEY=VALUE EMPTY=INCLUDE.
