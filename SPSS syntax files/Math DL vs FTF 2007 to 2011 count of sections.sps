
* Identify Duplicate Cases.
SORT CASES BY StcCourseSectionNo(A).
MATCH FILES
  /FILE=*
  /BY StcCourseSectionNo
 /DROP = PrimaryLast  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst InDupGrp MatchSequence.
VARIABLE LABELS  PrimaryLast 'Indicator of each last matching case as Primary'.
VALUE LABELS  PrimaryLast 0 'Duplicate Case' 1 'Primary Case'.
VARIABLE LEVEL  PrimaryLast (ORDINAL).
FREQUENCIES VARIABLES=PrimaryLast.
EXECUTE.

USE ALL.
COMPUTE filter_$=(PrimaryLast = 1).
VARIABLE LABELS filter_$ 'PrimaryLast = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus DL_or_face_to_face DISPLAY=LABEL
  /TABLE Campus [C] > DL_or_face_to_face [C][COUNT F40.0]
  /CATEGORIES VARIABLES=Campus DL_or_face_to_face ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='DL vs F-T-F courses by campus Math 0304'.