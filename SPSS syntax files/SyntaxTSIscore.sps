
*Switch Date to Date variable type. DO THIS BY HAND ie NOT IN CODE
*REMOVE MISSING.



STRING TestArea(A4).
DO IF (Test='A.TSIA.M01' OR Test='P.TSIA.M01').
COMPUTE TestArea='MATH'.
ELSE IF (Test='A.TSIA.R01' OR Test='P.TSIA.R01').
COMPUTE TestArea="READ".
ELSE IF (Test='A.TSIA.W01' OR Test='P.TSIA.W01').
COMPUTE TestArea="WRIT".
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

Numeric FirstReadScore.
IF(TestArea="READ") FirstReadScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstReadScore=MAX(FirstReadScore).

Numeric FirstWritScore.
IF(TestArea="WRIT") FirstWritScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstWritScore=MAX(FirstWritScore).

Numeric FirstEssaScore.
IF(TestArea="ESSA") FirstEssaScore=Score_first.
EXECUTE.
AGGREGATE
/OUTFILE=*MODE=ADDVARIABLES OVERWRITE=YES
/BREAK=Id
/FirstEssaScore=MAX(FirstEssaScore).




Numeric MathPlace.
DO IF(FirstMathScore LE 335).
COMPUTE MathPlace=1.
Else IF(FirstMathScore GE 336 AND FirstMathScore LE 339).
COMPUTE MathPlace=2.
Else IF(FirstMathScore GE 340 AND FirstMathScore LE 349).
COMPUTE MathPlace=3.
ELSE IF(FirstMathScore GE 350 ).
COMPUTE MathPlace=4.
END IF.
EXECUTE.
VALUE LABELS MathPlace
1 'ABE - 310-335'
2 'Math 0361 - 336-339'
3 'Math 0362 - 340-349'
4 'College Level - 350-390'.


Numeric ReadPlace.
DO IF(FirstReadScore LE 341).
COMPUTE ReadPlace=1.
Else IF(FirstReadScore GE 342 AND FirstReadScore LE 348).
COMPUTE ReadPlace=2.
Else IF(FirstReadScore GE 349 AND FirstReadScore LE 350).
COMPUTE ReadPlace=3.
Else IF(FirstReadScore GE 351).
COMPUTE ReadPlace=4.
END IF.
EXECUTE.
VALUE LABELS ReadPlace
1 'ABE - 310-341'
2 'Reading 0361 - 342-348'
3 'INRW-0399 349-350'
4 'College Level - 351-390'.



Numeric EngPlace.
DO IF (FirstEssaScore GE 5).
COMPUTE EngPlace=4.
ELSE IF (FirstEssaScore =4 AND FirstWritScore GE 363).
COMPUTE EngPlace=4.
ELSE IF (FirstEssaScore =4 AND FirstWritScore GE 360 AND FirstWritScore LE 362).
COMPUTE EngPlace=3.
ELSE IF (FirstEssaScore LE 4 AND FirstWritScore GE 350 AND FirstWritScore LE 359).
COMPUTE EngPlace=2.
ELSE IF (FirstEssaScore LE 4 AND FirstWritScore LE 349).
COMPUTE EngPlace=1.
END IF.
EXECUTE.
VALUE LABELS EngPlace
1 'ABE - Essay 0-4 and 310-349'
2.'English 0324 - Essay 0-4 and 350-359'
3 'INRW - Essay 4 and 360-362'
4 'College Level - Essay 4 and 363-390 or Essay 5-8 and Any Score'.
EXECUTE.












