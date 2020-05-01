*Calculations to create time and semester to degree from the Table: Coll_Production_Acad_credentials in Golden.

Value  Labels Award_level 1 'CRT' 3 'AAS'.
execute.

*First Convert Degree Term in Table: Coll_Production_Acad_credentials Degree Term is labeled as Acad_Term.
*Convert ACAD_Terms to a numeric value for calculations.
Numeric DegreeTerm_num (F2.0).
RECODE  Acad_Term ('2004SP'=1) ('2004SU'=2) ('2004FL'=3) ('2005SP'=4) ('2005SU'=5) ('2005FL'=6) 
    ('2006SP'=7) ('2006SU'=8) ('2006FL'=9) ('2007SP'=10) ('2007SU'=11) ('2007FL'=12) ('2008SP'=13) 
    ('2008SU'=14) ('2008FL'=15) ('2009SP'=16) ('2009SU'=17) ('2009FL'=18) ('2010SP'=19) 
    ('2010SU'=20) ('2010FL'=21) ('2011SP'=22) ('2011SU'=23) ('2011FL'=24) ('2012SP'=25) 
    ('2012SU'=26) ('2012FL'=27) ('2013SP'=28) ('2013SU'=29) ('2013FL'=30)  ('2014SP'=31) ('2014SU'=32) ('2014FL'=33) INTO DegreeTerm_num.
VARIABLE LABELS  DegreeTerm_num ' Degree Term (numeric)'.
EXECUTE.

*Convert Acad_terms to TERM.
String Degree_Term (A6).
COMPUTE Degree_Term=CHAR.SUBSTR(Acad_Term,5,2).
VARIABLE LABELS Degree_Term ' Degree Term (FL SP SU)'.
EXECUTE.

*Recodes to simpler to read English.
RECODE Degree_Term ('FL'='Fall') ('SP'='Spring') ('SU'='Summer').
EXECUTE.

USE ALL.
STRING Acad_year_degree (A14).
RECODE DegreeTerm_num (1 thru 2='AY2003-04') (3 thru 5='AY2004-05')(6 thru 8='AY2005-06') (9 thru 11='AY2006-07') (12 thru 14='AY2007-08') (15 thru 17='AY2008-09') (18 thru 20='AY2009-10')
 (21 thru 23='AY2010-11') (24 thru 26='AY2011-12')  (27 thru 29='AY2012-13') (30 thru 32='AY2013-14')(33 thru 35='AY2014-15')  INTO Acad_year_degree.
VARIABLE LABELS  Acad_year_degree 'Academic Year of Degree'.
EXECUTE.

***********************************************************************************************************************************************************************************************
*Recode start date and degree terms into numbers to calculate.


* Date and Time Wizard: Yeardegree.
COMPUTE  ORIG_START_YEAR=XDATE.YEAR(ACAD_START_DATE).
VARIABLE LABELS  ORIG_START_YEAR " ORIG_START_YEAR".
VARIABLE LEVEL  ORIG_START_YEAR(SCALE).
FORMATS  ORIG_START_YEAR(F8.0).
VARIABLE WIDTH  ORIG_START_YEAR(8).
EXECUTE.

* Date and Time Wizard: Months_degree.
COMPUTE Orig_start_month=XDATE.MONTH(ACAD_START_DATE).
VARIABLE LABELS Orig_start_month "Orig_start_month".
VARIABLE LEVEL Orig_start_month(SCALE).
FORMATS Orig_start_month(F8.0).
VARIABLE WIDTHOrig_start_month(8).
EXECUTE.


IF  (CHAR.SUBSTR(ACAD_TERM,5,2) ='SP') Degree_month=5.
if  (CHAR.SUBSTR(ACAD_TERM,5,2) ='SU') Degree_month=8.
if (CHAR.SUBSTR(ACAD_TERM,5,2) ='FL') Degree_month=12.
EXECUTE.
VARIABLE LABELS  Degree_month 'Degree_month'.

Compute Degree_year = NUMBER((CHAR.SUBSTR(ACAD_TERM,1,4)),F4).
VARIABLE LABELS Degree_year 'Degree year'.
Execute.

*Start date.

IF  (CHAR.SUBSTR(TERMID,5,2) ='SP') Orig_start_month=1.
if  (CHAR.SUBSTR(TERMID,5,2) ='SU') Orig_start_month=5.
if (CHAR.SUBSTR(TERMID,5,2) ='FL') Orig_start_month=8.
EXECUTE.
VARIABLE LABELS  Orig_start_month 'Orig_start_month'.

Compute ORIG_START_YEAR = NUMBER((CHAR.SUBSTR(TERMID,1,4)),F4).
VARIABLE LABELS ORIG_START_YEAR 'ORIG_START_YEAR'.
Execute.

*******************************************************************************************************************************************************************************************************************************
*The time to degree and semester to degree calculation.
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

*This section is count of degrees by gender and ethnicity.

*Choose dates 2008FL forward.
USE ALL.
COMPUTE filter_$=(DegreeTerm_num >= 15).
VARIABLE LABELS filter_$ 'DegreeTerm_num >= 15 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Acad_year_degree AWARD_LEVEL DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Acad_year_degree [C] > AWARD_LEVEL [C][COUNT F40.0]
  /CATEGORIES VARIABLES=GENDER ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=ETHNICITY Acad_year_degree AWARD_LEVEL ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Welding degrees 2008-2013'.

*This section is Time to degree be gender and ethnicity by FTIC.

USE ALL.
COMPUTE filter_$=(DegreeTerm_num >= 24 ).
VARIABLE LABELS filter_$ "DegreeTerm_num >= 24 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Acad_year_degree AWARD_LEVEL YRsToDegreeGR DISPLAY=LABEL
  /TABLE GENDER [C] + ETHNICITY [C] BY Acad_year_degree [C] > AWARD_LEVEL [C] > YRsToDegreeGR 
    [S][MEAN, COUNT F40.0]
  /CATEGORIES VARIABLES=GENDER Acad_year_degree ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=ETHNICITY ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AWARD_LEVEL ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /TITLES
    TITLE='Welding Degrees Time to Degree 2011-12 and 2012-13'.


*This is for AVG SCH at graduation.
* Custom Tables.
CTABLES
  /VLABELS VARIABLES=GENDER ETHNICITY Acad_year_degree AWARD_LEVEL HrsCmplNodevSUM DISPLAY=LABEL
  /TABLE GENDER + ETHNICITY BY Acad_year_degree > AWARD_LEVEL > HrsCmplNodevSUM [MEAN, COUNT F40.0]
  /CATEGORIES VARIABLES=GENDER Acad_year_degree ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=ETHNICITY ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=AWARD_LEVEL ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /TITLES
    TITLE='AVG SCH Welding at Graduation'.
