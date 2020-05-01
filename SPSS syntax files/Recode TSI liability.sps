* Encoding: UTF-8.
Numeric Areas_liable (f1).
IF  (TsiMetRead = 'N' & TsiMetMath='Y') Areas_liable=2.
IF  (TsiMetRead = 'N' &  Tsimetwrit='Y') Areas_liable=2.
IF  (TsiMetRead = 'Y' &  Tsimetwrit='N') Areas_liable=2.
IF  (TsiMetRead = 'Y' & TsiMetMath='N') Areas_liable=2.

IF  (TsiMetMath = 'N' &  Tsimetwrit='Y') Areas_liable=2.
IF  (TsiMetMath = 'Y' &  Tsimetwrit='N') Areas_liable=2.


IF  (TsiMetRead = 'Y' & TsiMetMath='Y') Areas_liable=1.
IF  (TsiMetRead = 'Y' &  Tsimetwrit='Y') Areas_liable=1.
IF  (Tsimetwrit='Y' & TsiMetMath='Y') Areas_liable=1.

IF  (TsiMetRead = 'Y' & TsiMetMath='Y'& Tsimetwrit='Y') Areas_liable=0.

IF  (TsiMetRead = 'N' & TsiMetMath='N' & Tsimetwrit='N') Areas_Liable=3.

EXECUTE.


STRING Good_standing (A8).
DO IF  (TermHoursAttempted > 0).
RECODE TermGpa (0 thru 1.9999='No') (2.00 thru Highest='Yes') INTO Good_standing.
END IF.
VARIABLE LABELS  Good_standing 'Good_standing'.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender Term Good_standing TermGpa DISPLAY=LABEL
  /TABLE newEthnicity [C] + Gender [C] BY Term [C] > (Good_standing [C][ROWPCT.COUNT PCT40.1, COUNT 
    F40.0] + TermGpa [S][MEAN, COUNT F40.0])
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Term ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Good_standing ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Architecture'.

USE ALL.
COMPUTE filter_$=(FTIC = 1 ).
VARIABLE LABELS filter_$ 'FTIC = 1  (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender Term Retained1Year DISPLAY=LABEL
  /TABLE newEthnicity [C] + Gender [C] BY Term [C] > Retained1Year [C][ROWPCT.COUNT PCT40.1, COUNT 
    F40.0]
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Term ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Retained1Year ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Architecture'.
