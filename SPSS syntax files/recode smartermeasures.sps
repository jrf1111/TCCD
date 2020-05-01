String Tech_competency_grp (A20).
recode TECHCOMPPCT (lowest thru 79.99='79.99 or lower') (80.00 thru Highest ='80 or higher') into
Tech_competency_grp .
VARIABLE LABELS  Tech_competency_grp 'Technical competency group'.
EXECUTE.

String Reading_pct_grp (A20).
recode READINGPCT (lowest thru 59.99='Less than 60') (60='60') (70='70') (80='80') (90='90') (100='100') into
 Reading_pct_grp .
VARIABLE LABELS  Reading_pct_grp 'Reading percent group'.
EXECUTE.


STRING Tech_know_grp (A20).
RECODE TECHKNOWLEDGEPCT (Lowest thru 59.99='60.0 and below') (70.00 thru 79.99='70 to 79.99') 
    (60.00 thru 69.999='60.00 to 69.99') (80 thru 89.999='80.0 to 89.99') (90.00 thru 99.999='90 to '+
    '99.99') (100.00 thru Highest='100') INTO Tech_know_grp.
VARIABLE LABELS  Tech_know_grp 'Technical knowledge group'.
EXECUTE.

STRING Typing_pct_grp (A20).
RECODE TYPINGADJUSTEDWPM (Lowest thru 14.99='Less than 15 WPM') (15.00 thru 24.999='15 to 24.99 '+
    'WPM') (75 thru Highest='75 or more WPM') (25 thru 34.999='25 to 34.99 WPM') (35 thru 
    44.999='35 to 44.99 WPM') (45 thru 54.999='45 to 54.99 WPM') (55 thru 64.999='55 to 64.99 WPM') (65 
    thru 74.999='65 to 74.99 WPM') INTO Typing_pct_grp.
VARIABLE LABELS  Typing_pct_grp 'Typing Percent Group'.
EXECUTE.


***The "SOFT" Measures Recodes.

STRING Learning_Style_grp (A20).
RECODE LEARNSTYLESPCT (Lowest thru 39.99='39.9 and below') (40.00 thru 49.99='40 to 49.99') 
    (50.00 thru 59.999='50.00 to 59.99') (60 thru 69.999='60.0 to 69.99') (70.00 thru 79.999='70 to '+
    '79.99') ( 80.00 thru 89.999='80 to 89.99') (90.00 thru Highest='90 and above') INTO  Learning_Style_grp.
VARIABLE LABELS   Learning_Style_grp 'Learning styles group'.
EXECUTE.

STRING Life_Factors_grp (A20).
RECODE LIFEFACTORSPCT  
   (Lowest thru 59.999='59.9 and below') (60.00 thru 69.999 = '60 to 69.99') (70.00 thru 79.999='70 to '+
    '79.99') ( 80.00 thru 89.999='80 to 89.99') (90.00 thru Highest='90 and above') INTO  Life_Factors_grp.
VARIABLE LABELS   Life_Factors_grp ' Life Factors group'.
EXECUTE.

STRING Personal_Attribute_grp (A20).
RECODE PERSONALATTRIBUTESPCT 
   (Lowest thru 69.999 = 'Lowest to 69.99') (70.00 thru 79.999='70 to '+
    '79.99') ( 80.00 thru 89.999='80 to 89.99') (90.00 thru Highest='90 and above') INTO  Personal_Attribute_grp.
VARIABLE LABELS   Personal_Attribute_grp 'Personal Attribute group'.
EXECUTE.
*** End "SOFT" Measures Recodes.

COMPUTE DE_course=CHAR.SUBSTR(section,2,1)='6'.
VARIABLE LABELS DE_Course 'DE course'.
EXECUTE.

Value labels DE_course
0 'Face-to-Face' 1 'Distance Learning'.

RECODE VerifiedGrade ('A'=4) ('B'=3) ('C'=2) ('D'=1) ('F'=0) INTO Gradepoints.
VARIABLE LABELS  Gradepoints 'Grade points'.
EXECUTE.


COMPUTE GRDPNTS_2=(SemesterHours * Gradepoints).
VARIABLE LABELS  GRDPNTS_2 'GRDPNT 2'.
EXECUTE.


AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=Term Id
  /SemesterHours_sum=SUM(SemesterHours) 
  /GRDPNTS_2_sum=SUM(GRDPNTS_2).


COMPUTE Passed_all=READING = 'pass' & TYPING = 'pass' & TECHCOMP = 'pass' & TECHKNOWLEDGE = 'pass'.
VARIABLE LABELS  Psssed_all 'Passed all sections'.
EXECUTE.

VALUE LABELS  Passed_all
0 'No'
1 'Yes'.
execute.


USE ALL.
COMPUTE filter_$=(PrimaryLast = 1 & Took_SM_test = 1).
VARIABLE LABELS filter_$ 'PrimaryLast = 1 & Took_SM_test = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Tech_competency_grp Tech_know_grp Reading_pct_grp Typing_pct_grp 
    In_Good_Standing DISPLAY=LABEL
  /TABLE Tech_competency_grp [C] + Tech_know_grp [C] + Reading_pct_grp [C] + Typing_pct_grp [C] BY 
    In_Good_Standing [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Tech_competency_grp Tech_know_grp Reading_pct_grp Typing_pct_grp ORDER=A 
    KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=In_Good_Standing ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /TITLES
    TITLE='Fall 2012 SM students standing and SM test scores'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Took_SM_test GPA SemesterHours_sum DISPLAY=LABEL
  /TABLE Took_SM_test [C] BY GPA [S][MEAN] + SemesterHours_sum [S][MEAN]
  /CATEGORIES VARIABLES=Took_SM_test ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /TITLES
    TITLE='Fall 2012 SM and non-Sm GPA and SCH'.

*Tables with "SOFT" Measures.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Tech_competency_grp Tech_know_grp Reading_pct_grp Typing_pct_grp 
    Life_Factors_grp Learning_Style_grp Personal_Attribute_grp In_Good_Standing 
    DISPLAY=LABEL
  /TABLE Tech_competency_grp [C] + Tech_know_grp [C] + Reading_pct_grp [C] + Typing_pct_grp [C] + 
    Life_Factors_grp [C] + Learning_Style_grp [C] + Personal_Attribute_grp [C] BY In_Good_Standing 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Tech_competency_grp Tech_know_grp Reading_pct_grp Typing_pct_grp 
    Life_Factors_grp Learning_Style_grp Personal_Attribute_grp ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=In_Good_Standing ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /TITLES
    TITLE='Student Standing by SmarterMeasure Assessment Scores for Fall 2012' 'With '+
    'Assessment Scores and Life Factors, Learning Styles and Personal Attributes'.
