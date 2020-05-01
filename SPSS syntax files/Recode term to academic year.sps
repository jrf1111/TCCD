* Encoding: UTF-8.


USE ALL.
STRING Acad_year (A14).
RECODE Term_num (1 thru 2='AY2003-04') (3 thru 5='AY2004-05')(6 thru 8='AY2005-06') (9 thru 11='AY2006-07') (12 thru 14='AY2007-08') (15 thru 17='AY2008-09') (18 thru 20='AY2009-10')
 (21 thru 23='AY2010-11') (24 thru 26='AY2011-12')  (27 thru 29='AY2012-13') (30 thru 32='AY2013-14') (33 thru 35='AY2014-15') (36 thru 38 ='AY2015-16') (39 thru 41='AY2016-17') 
 (42 thru 44='AY2017-18') (45 thru 47='AY2018-19') (49 thru 50='AY2019-20') (39 thru 41='AY2016-17')
 (42 thru 44='AY2017-18') (45 thru 47='AY2018-19') (49 thru 50='AY2019-20') INTO Acad_year.
VARIABLE LABELS  Acad_year 'Academic Year'.
EXECUTE.

USE ALL.
STRING Degree_Acad_year (A14).
RECODE DegreeTerm_num (1 thru 2='AY2003-04') (3 thru 5='AY2004-05')(6 thru 8='AY2005-06') (9 thru 11='AY2006-07') (12 thru 14='AY2007-08') (15 thru 17='AY2008-09') (18 thru 20='AY2009-10')
 (21 thru 23='AY 2010-11') (24 thru 26='AY 2011-12')  (27 thru 29='AY2012-13') (30 thru 32='AY2013-14')(33 thru 35='AY2014-15') (36 thru 38 ='AY2015-16') (39 thru 41='AY2016-17') 
 (42 thru 44='AY2017-18') (45 thru 47='AY2018-19') (49 thru 50='AY2019-20') INTO Degree_Acad_year.
VARIABLE LABELS  Degree_Acad_year 'Degree Academic Year'.
EXECUTE.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Passing_course Acad_year StcTerm DISPLAY=LABEL
  /TABLE Passing_course [C] BY Acad_year [C] > StcTerm [C][COUNT F40.0]
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Acad_year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='RDNG-0361 Check AY 2010-11 and AY 2011-12'.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=StcCourseName Passing_course Acad_year Term_num DISPLAY=LABEL
  /TABLE StcCourseName [C] > Passing_course [C][COUNT F40.0] BY Acad_year [C] > Term_num [C]
  /CATEGORIES VARIABLES=StcCourseName Acad_year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Term_num ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='ENGL ATD FTIC check Bonnie 12-10-2012'.



USE ALL.
COMPUTE filter_$=((Term_num >= 21 & Term_num < 27) & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X').
VARIABLE LABELS filter_$ "(Term_num >= 21 & Term_num < 27) & FTIC_NOAUDIT_NODUAL_DEGREESEEK = "+
    "'X' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



COMPUTE Term_ToNUM=STRING(Term_num,F2.0).
EXECUTE.

RECODE STSC_WIN_1SEM (0 thru 1=1) (ELSE=0) INTO Pass_STSC_WIN_1SEM.
VARIABLE LABELS  Pass_STSC_WIN_1SEM 'pass STSC within 1 semester'.
EXECUTE.

*STSC and courses syntax.

COMPUTE STSC_win_1sem=(Term_num - Term_num_STSC)>= 0 &(Term_num - Term_num_STSC) <= 1 .
VARIABLE LABELS  STSC_win_1sem 'STSC_ within 1 sem'.
EXECUTE.

RECODE STSC_win_1sem (SYSMIS=0).
EXECUTE.

value labels STSC_win_1sem
0 'No'
1 'Yes'.

USE ALL.
COMPUTE filter_$=(Passing_course = 'Yes'  & MatchSequence = 0 & ATD_FTIC = 1).
VARIABLE LABELS filter_$ "Passing_course = 'Yes'  & MatchSequence = 0 & ATD_FTIC = 1 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=Passing_course ATD_FTIC MatchSequence
  /ORDER=ANALYSIS.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Campus StcTerm STSC_win_1sem DISPLAY=LABEL
  /TABLE Campus [C] > StcTerm [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY STSC_win_1sem [C]
  /CATEGORIES VARIABLES=Campus ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=STSC_win_1sem ORDER=A KEY=VALUE EMPTY=INCLUDE.
