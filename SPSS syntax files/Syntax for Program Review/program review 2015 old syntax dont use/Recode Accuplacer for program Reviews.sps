*Math STNC_NON_COURSE Elementary Algebra First.
USE ALL.
COMPUTE filter_$=(STNC_NON_COURSE = 'A.ACUP.M01' | STNC_NON_COURSE = 'P.ACUP.M01' | STNC_NON_COURSE = 'P.ACUP.ME1').
VARIABLE LABELS filter_$ "STNC_NON_COURSE = 'A.ACUP.M01' | STNC_NON_COURSE = 'P.ACUP.M01' | STNC_NON_COURSE = 'P.ACUP.ME1' (FILTER)".    
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=STNC_NON_COURSE
  /ORDER=ANALYSIS.

*Delete all not elementary Algebra.
FILTER OFF.
USE ALL.
SELECT IF (STNC_NON_COURSE = 'A.ACUP.M01' | STNC_NON_COURSE = 'P.ACUP.M01' | STNC_NON_COURSE = 'P.ACUP.ME1').
EXECUTE.

FREQUENCIES VARIABLES=STNC_NON_COURSE
  /ORDER=ANALYSIS.

*Recode Accuplace scores in Elementary Math.
RECODE STNC_SCORE (Lowest thru 62.999=0) (63 thru Highest=1) INTO Passing_STNC_SCOREAM.
VARIABLE LABELS  Passing_STNC_SCOREAM 'Passing Score Elementary Algebra Math'.
EXECUTE.

Value Labels Passing_STNC_SCOREAM
1 'Passing Score Math-EA'
0 'Not a Passing Score Math-EA'.

*Sort Ascending so highest score is primary when identifying duplicates as primary 
SORT CASES BY STNC_PERSON_ID(A) STNC_SCORE(A).


* Identify Duplicate Cases.
SORT CASES BY STNC_PERSON_ID(A) STNC_SCORE(A).
MATCH FILES
  /FILE=*
  /BY STNC_PERSON_ID STNC_SCORE
  /FIRST=PrimaryFirst
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

*Delete Duplicates.
FILTER OFF.
USE ALL.
SELECT IF (PrimaryLast = 1).
EXECUTE.

*Now this math file is ready to merge into the ORD files.


*Recode Accuplace scores in Sentence Skills Writing.
RECODE Score_W (Lowest thru 79.999=0) (80 thru Highest=1) INTO Passing_Score_W.
VARIABLE LABELS  Passing_Score_W 'Passing Score Writing'.
EXECUTE.

Value Labels Passing_Score_W
1 'Passing Score Writing'
0 'Not a Passing Score Writing'.

*Recode Accuplace scores in Essay Writing.
IF  (SCORE_E >=6 | (SCORE_E = 5 & Score_W >= 80)) Passing_E=1.
IF  ( (SCORE_E = 5 & Score_W< 80)) Passing_E=0.
IF  (SCORE_E<5) Passing_E=0.
VARIABLE LABELS  Passing_E 'Passing Essay'.
EXECUTE.

Value Labels Passing_E
1 'Passing Score Essay'
0 'Not a Passing Score Essay'.



*Recode Accuplace scores in Reading.
RECODE Score_R (Lowest thru 77.999=0) (78 thru Highest=1) INTO Passing_Score_R.
VARIABLE LABELS  Passing_Score_R 'Passing Score Reading'.
EXECUTE.

Value Labels Passing_Score_R
1 'Passing Score Reading'
0 'Not a Passing Score Reading'.



*Select Reading Scores for all majors

USE ALL.
COMPUTE filter_$=(( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_R > 0).
VARIABLE LABELS filter_$ "( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_R > 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=Major
  /ORDER=ANALYSIS.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Major TermId Score_R Passing_Score_R DISPLAY=LABEL
  /TABLE Major [C] > TermId [C] BY Score_R [S][MEAN] + Passing_Score_R [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=Major TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_R ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Passing Accuplacer Reading Scores'.


*Essay scores.

USE ALL.
COMPUTE filter_$=(( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_R > 0).
VARIABLE LABELS filter_$ "( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_R > 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Major TermId Score_E Passing_Score_E DISPLAY=LABEL
  /TABLE Major [C] > TermId [C] BY Score_E [S][MEAN] + Passing_Score_E [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=Major TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_E ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Passing Accuplacer Essay Scores'.


*Select writing scores.
USE ALL.
COMPUTE filter_$=(( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_W > 0).
VARIABLE LABELS filter_$ "( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_W > 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Major TermId Score_W Passing_Score_W DISPLAY=LABEL
  /TABLE Major [C] > TermId [C] BY Score_W [S][MEAN] + Passing_Score_W [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=Major TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_W ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Passing Accuplacer Writing Scores'.

*Select math scores.
USE ALL.
COMPUTE filter_$=(( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_EAM > 0).
VARIABLE LABELS filter_$ "( Major = 'FIRI' | Major = 'FIRP') & FticNoauditNodual = 'X' & Score_EAM > 0 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Major TermId Score_R Passing_Score_R DISPLAY=LABEL
  /TABLE Major [C] > TermId [C] BY Score_R [S][MEAN] + Passing_Score_R [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=Major TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_Score_R ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Passing Accuplacer Math Scores'.




* Custom Tables.
CTABLES
  /VLABELS VARIABLES=SCORE_W Passing_Score_W DISPLAY=LABEL
  /TABLE BY SCORE_W [S][MEAN, COUNT F40.0] + Passing_Score_W [C][COUNT F40.0]
  /CATEGORIES VARIABLES=Passing_Score_W ORDER=A KEY=VALUE EMPTY=INCLUDE.
