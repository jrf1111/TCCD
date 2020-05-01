*Updated for TCCD on 03-08-2013.

NUMERIC YRsToDegreeGR (F2.1).
NUMERIC SEMsToDegreeGR (F3.1).
DO IF  (Orig_start_month=8 &  Degree_month = 12).
COMPUTE YRsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)+.3).
COMPUTE SEMsToDegreeGR = (((DEGREE_YEAR - ORIG_START_YEAR) * 3)+1).
ELSE IF  (Orig_start_month=8 &  Degree_month = 5).
COMPUTE YRsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)-.3).
COMPUTE SEMsToDegreeGR = (((DEGREE_YEAR - ORIG_START_YEAR)* 3)-1).
ELSE IF  (Orig_start_month=8 &  Degree_month = 8).
COMPUTE YRsToDegreeGR = (DEGREE_YEAR - ORIG_START_YEAR).
COMPUTE SEMsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)* 3).
ELSE IF (Orig_start_month=1 &  Degree_month = 5).
COMPUTE YRsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)+.3).
COMPUTE SEMsToDegreeGR = (((DEGREE_YEAR - ORIG_START_YEAR) *3)+1).
ELSE IF (Orig_start_month=1 &  Degree_month = 8).
COMPUTE YRsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)+.6).
COMPUTE SEMsToDegreeGR = (((DEGREE_YEAR - ORIG_START_YEAR)* 3)+2).
ELSE IF (Orig_start_month=1 &  Degree_month = 12).
COMPUTE YRsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)+1).
COMPUTE SEMsToDegreeGR = (((DEGREE_YEAR - ORIG_START_YEAR)* 3)+3).
ELSE IF (Orig_start_month=5 &  Degree_month = 8).
COMPUTE YRsToDegreeGR =(( DEGREE_YEAR - ORIG_START_YEAR)+.3).
COMPUTE SEMsToDegreeGR = (((DEGREE_YEAR - ORIG_START_YEAR) * 3)+1).
ELSE IF (Orig_start_month=5 &  Degree_month = 12).
COMPUTE YRsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)+.6).
COMPUTE SEMsToDegreeGR = (((DEGREE_YEAR - ORIG_START_YEAR)* 3)+2).
ELSE IF   (Orig_start_month=5 &  Degree_month = 5).
COMPUTE YRsToDegreeGR = (DEGREE_YEAR - ORIG_START_YEAR).
COMPUTE SEMsToDegreeGR = ((DEGREE_YEAR - ORIG_START_YEAR)* 3).
END IF.
EXECUTE.

