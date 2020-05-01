*Calculations to create time and semester to completion using to calculate time to complete TSI Liability

*compute .


***********************************************************************************************************************************************************************************************
*Recode start date and  terms into numbers to calculate.
Compute Orig_start_month.
IF  (CHAR.SUBSTR(TERM_ID,5,2) ='SP') Orig_start_month=1.
if  (CHAR.SUBSTR(TERM_ID,5,2) ='SU')  Orig_start_month=5.
if (CHAR.SUBSTR(TERM_ID,5,2) ='FL')  Orig_start_month=8.
EXECUTE.
VARIABLE LABELS   Orig_start_month ' Orig_start_month'.

COMPUTE ORIG_START_YEAR=NUMBER((CHAR.SUBSTR(TERM_ID,1,4)),F4).
VARIABLE LABELS  ORIG_START_YEAR 'Original Start Year'.
EXECUTE.

*****************************End Version 2***********************************************.

*******************************************************************************************************************************************************************************************************************************
*The time to COMPLETION and semester to COMPLETION calculation.
*Updated for TCCD on 03-08-2013.

NUMERIC YRsTocomplete (F2.1).

DO IF  (Orig_start_month=8 &  COMPLETION_month = 12).
COMPUTE YRsToCOMPLETION = ((COMPLETION_YEAR - ORIG_START_YEAR)+.3).
ELSE IF  (Orig_start_month=8 &  COMPLETION_month = 5).
COMPUTE YRsToCOMPLETION = ((COMPLETION_YEAR - ORIG_START_YEAR)-.3).
ELSE IF  (Orig_start_month=8 &  COMPLETION_month = 8).
COMPUTE YRsToCOMPLETION = (COMPLETION_YEAR - ORIG_START_YEAR).
ELSE IF (Orig_start_month=1 &  COMPLETION_month = 5).
COMPUTE YRsToCOMPLETION = ((COMPLETION_YEAR - ORIG_START_YEAR)+.3).
ELSE IF (Orig_start_month=1 &  COMPLETION_month = 8).
COMPUTE YRsToCOMPLETION = ((COMPLETION_YEAR - ORIG_START_YEAR)+.6).
ELSE IF (Orig_start_month=1 &  COMPLETION_month = 12).
COMPUTE YRsToCOMPLETION = ((COMPLETION_YEAR - ORIG_START_YEAR)+1).
ELSE IF (Orig_start_month=5 &  COMPLETION_month = 8).
COMPUTE YRsToCOMPLETION =(( COMPLETION_YEAR - ORIG_START_YEAR)+.3).
ELSE IF (Orig_start_month=5 &  COMPLETION_month = 12).
COMPUTE YRsToCOMPLETION = ((COMPLETION_YEAR - ORIG_START_YEAR)+.6).
ELSE IF   (Orig_start_month=5 &  COMPLETION_month = 5).
COMPUTE YRsToCOMPLETION = (COMPLETION_YEAR - ORIG_START_YEAR).
END IF.
EXECUTE.

*After merging FTIC into the COMPLETION file select AY 2008-09 to 2011-12.

USE ALL.
COMPUTE filter_$=(Acad_year_COMPLETION = 'AY2008-09' | Acad_year_COMPLETION = 'AY2009-10' | 
    Acad_year_COMPLETION = 'AY2010-11' | Acad_year_COMPLETION = 'AY2011-12').
VARIABLE LABELS filter_$ "Acad_year_COMPLETION = 'AY2008-09' | Acad_year_COMPLETION = 'AY2009-10' | "+
    "Acad_year_COMPLETION = 'AY2010-11' | Acad_year_COMPLETION = 'AY2011-12' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
