
*Switch Date to Date variable type. DO THIS BY HAND ie NOT IN CODE
*REMOVE MISSING.



STRING TestArea(A4).
DO IF (Test='A.TSIA.M01' OR Test='P.TSIA.M01').
COMPUTE TestArea='MATH'.
ELSE IF (Test='P.TSIA.ML1').
COMPUTE TestArea='MDNG'.
ELSE IF (Test='A.TSIA.R01' OR Test='P.TSIA.R01').
COMPUTE TestArea="READ".
ELSE IF (Test='P.TSIA.RL1').
COMPUTE TestArea="RDNG".
ELSE IF (Test='A.TSIA.W01' OR Test='P.TSIA.W01').
COMPUTE TestArea="WRIT".
ELSE IF ( Test='P.TSIA.WL1').
COMPUTE TestArea="WDNG".
ELSE IF (Test='A.TSIA.E01' OR Test='P.TSIA.E01').
COMPUTE TestArea="ESSA".
END IF.
EXECUTE.
.

SORT CASES BY Id(A) TestArea(A) Date(A).

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=Id TestArea
  /Score_first=FIRST(Score).

Numeric FirstMathScore.
IF(TestArea="MATH") FirstMathScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstMathScore=MAX(FirstMathScore).

Numeric FirstMathDiagScore.
IF(TestArea="MDNG") FirstMathDiagScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstMathDiagScore=MAX(FirstMathDiagScore).

Numeric FirstReadScore.
IF(TestArea="READ") FirstReadScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstReadScore=MAX(FirstReadScore).

Numeric FirstReadDiagScore.
IF(TestArea="RDNG") FirstReadDiagScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstReadDiagScore=MAX(FirstReadDiagScore).

Numeric FirstWritScore.
IF(TestArea="WRIT") FirstWritScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstWritScore=MAX(FirstWritScore).

Numeric FirstWritDiagScore.
IF(TestArea="WDNG") FirstWritDiagScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstWritDiagScore=MAX(FirstWritDiagScore).


Numeric FirstEssaScore.
IF(TestArea="ESSA") FirstEssaScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstEssaScore=MAX(FirstEssaScore).



Numeric MathPlace.
DO IF(FirstMathScore LE 335 AND FirstMathDiagScore LT 5).
COMPUTE MathPlace=1.
Else IF((FirstMathScore GE 336 AND FirstMathScore LE 339) OR (FirstMathScore LE 335 AND FirstMathDiagScore GE 5)).
COMPUTE MathPlace=2.
Else IF(FirstMathScore GE 340 AND FirstMathScore LE 349).
COMPUTE MathPlace=3.
ELSE IF(FirstMathScore GE 350 ).
COMPUTE MathPlace=4.
END IF.
EXECUTE.
VALUE LABELS MathPlace
1 'ABE'
2 'Math 0361'
3 'Math 0362'
4 'College Level'.


Numeric ReadPlace.
DO IF(FirstReadScore LE 341 AND FirstReadDiagScore LT 5).
COMPUTE ReadPlace=1.
Else IF((FirstReadScore GE 342 AND FirstReadScore LE 348) OR (FirstReadScore LE 341 AND FirstReadDiagScore GE 5)).
COMPUTE ReadPlace=2.
Else IF(FirstReadScore GE 349 AND FirstReadScore LE 350).
COMPUTE ReadPlace=3.
Else IF(FirstReadScore GE 351).
COMPUTE ReadPlace=4.
END IF.
EXECUTE.
VALUE LABELS ReadPlace
1 'ABE'
2 'Reading 0361'
3 'INRW-0399'
4 'College Level'.



Numeric EngPlace.
DO IF (FirstWritScore GE 363 AND FirstEssaScore GE 4).
COMPUTE EngPlace=4.
ELSE IF (FirstWritScore GE 363 AND FirstEssaScore LE 3).
COMPUTE EngPlace=2.
ELSE IF (FirstWritScore GE 350 AND FirstWritScore LE 362 AND FirstEssaScore GE 5).
COMPUTE EngPlace=4.
ELSE IF (FirstWritScore GE 360 AND FirstWritScore LE 362 AND FirstEssaScore=4).
COMPUTE EngPlace=3.
ELSE IF (FirstWritScore GE 350 AND FirstWritScore LE 359 AND FirstEssaScore=4).
COMPUTE EngPlace=2.
ELSE IF(FirstWritScore GE 350 AND FirstWritScore LE 362 AND FirstEssaScore LE 3).
COMPUTE EngPlace=2.
ELSE IF(FirstWritScore LE 349 AND FirstWritDiagScore GE 5 AND FirstEssaScore GE 5).
COMPUTE EngPlace=4.
ELSE IF(FirstWritScore LE 349 AND FirstWritDiagScore GE 5 AND FirstEssaScore LE 4).
COMPUTE EngPlace=2.
ELSE IF(FirstWritScore LE 349 AND FirstWritDiagScore=4 AND FirstEssaScore GE 5).
COMPUTE EngPlace=4. 
ELSE IF(FirstWritScore LE 349 AND FirstWritDiagScore=4 AND FirstEssaScore LE 4).
COMPUTE EngPlace=1.
ELSE IF (FirstWritScore LE 349 AND FirstWritDiagScore LE 3).
COMPUTE EngPlace=1.
END IF.
EXECUTE.
VALUE LABELS EngPlace
1 'ABE'
2.'English 0324'
3 'INRW 0399'
4 'College Level'.
EXECUTE.












