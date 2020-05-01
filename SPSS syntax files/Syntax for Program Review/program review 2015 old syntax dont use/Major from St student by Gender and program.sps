
*Data pulled from St Student by gender and program.
USE ALL.
COMPUTE filter_$=((Program = 'AUTC.D001.UG' | Program = 'AUTC.T001.UG' | Program = 'AUTC.T002.UG') 
    & Term='2008FL').
VARIABLE LABELS filter_$ "(Program = 'AUTC.D001.UG' | Program = 'AUTC.T001.UG' | Program = "+
    "'AUTC.T002.UG') & Term='2008FL' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=Program Term
  /ORDER=ANALYSIS.


* Identify Duplicate Cases.
SORT CASES BY Id(A) Program(A).
MATCH FILES
  /FILE=*
  /BY Id
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



FREQUENCIES VARIABLES=Program Term
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=((Program = 'AUTC.D001.UG' | Program = 'AUTC.T001.UG' | Program = 'AUTC.T002.UG') 
    & Term='2008FL'  & PrimaryLast = 1).
VARIABLE LABELS filter_$ "(Program = 'AUTC.D001.UG' | Program = 'AUTC.T001.UG' | Program = "+
    "'AUTC.T002.UG') & Term='2008FL'  & PrimaryLast = 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



FREQUENCIES VARIABLES=Program Term EthDesc Gender
  /ORDER=ANALYSIS.
