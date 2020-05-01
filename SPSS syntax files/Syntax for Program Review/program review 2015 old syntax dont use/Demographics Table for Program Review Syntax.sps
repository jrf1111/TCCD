* Encoding: UTF-8.

USE ALL.
COMPUTE filter_$=((Major = 'FIRP' | Major='FIRI') & TermId ~= "2007FL").
VARIABLE LABELS filter_$ '(Major = ''FIRI'' | Major="FIRI") & TermId ~= "2007FL" (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
Execute.


FREQUENCIES VARIABLES=AcadProgramId
  /ORDER=ANALYSIS.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity FtPt Age_range FticNoauditNodual ReturningAndTransfer
    TermId
    DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] + FtPt [C] + Age_range [C] + FticNoauditNodual [C] +
    ReturningAndTransfer [C] BY TermId [C][COUNT F40.0, COLPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=newEthnicity Age_range ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=FtPt FticNoauditNodual ReturningAndTransfer TermId ORDER=A KEY=VALUE
    EMPTY=EXCLUDE
    /TITLES
    TITLE='Demographics for Departmental Profile Cornerstone (fall 2012 to 2017).'

*Average Age.
* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Age TermId DISPLAY=LABEL
  /TABLE Age [S][MEAN] BY TermId [C]
  /CATEGORIES VARIABLES=TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE=' Cornerstone Avg Age'.





