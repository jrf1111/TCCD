
*Convert TSI met to numeric to calculate number of areas liable.
*A value of 1 means liable in that area a value of 0 means not liable in that area.

RECODE TsiMetMath (CONVERT) ('Y'=0) (ELSE=1) INTO TSImetmath_NUM.
VARIABLE LABELS  TSImetmath_NUM 'TSI met math num'.
EXECUTE.

RECODE TsiMetread (CONVERT) ('Y'=0) (ELSE=1) INTO TSImetread_NUM.
VARIABLE LABELS  TSImetread_NUM 'TSI met read num'.
EXECUTE.

RECODE TsiMetwrit (CONVERT) ('Y'=0) (ELSE=1) INTO TSImetwrit_NUM.
VARIABLE LABELS  TSImetwrit_NUM 'TSI met writ num'.
EXECUTE.

COMPUTE NoareasTSI_liable=TSImetmath_NUM + TSImetread_NUM + TSImetwrit_NUM.
VARIABLE LABELS NoareasTSI_liable 'Number of areas liable in TSI'.
EXECUTE.

Value labels NoareasTSI_liable
3  'Liable in 3 areas'
2  'Liable in 2 areas'
1  'Liable in 1 areas'
0  'Not Liable: TSI Met'.

*Liability in Reading and Writing.

COMPUTE Liable_in_R_W= TSImetread_NUM + TSImetwrit_NUM.
VARIABLE LABELS  Liable_in_R_W 'Liable in R and W'.
EXECUTE.

Value labels Liable_in_R_W
2  'Liable in both R and W'
1  'Liable in 1 areas'
0  'Not Liable in R or W'.


