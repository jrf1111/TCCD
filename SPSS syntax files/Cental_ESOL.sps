* Encoding: UTF-8.
COMPUTE esol_309_P=CourseName = 'ESOL-0309' & Passing_course = 'Yes'. 
VARIABLE LABELS  esol_309_P 'esol_309_P'. 
EXECUTE. 
SORT CASES BY esol_309_P (D). 


COMPUTE esol_312_P=CourseName = 'ESOL-0312' & Passing_course = 'Yes'. 
VARIABLE LABELS  esol_312_P 'esol_312_P'. 
EXECUTE. 

COMPUTE INRW_0399_P=CourseName = 'INRW-0399' & Passing_course = 'Yes'. 
VARIABLE LABELS  INRW_0399_P 'INRW_0399_P'. 
EXECUTE. 

AGGREGATE 
  /OUTFILE=* MODE=ADDVARIABLES 
  /BREAK=Id 
  /esol_309_P_sum=SUM(esol_309_P)
  /esol_312_P_sum=SUM(esol_312_P) 
  /INRW_0399_P_sum=SUM(INRW_0399_P).
execute.
 
COMPUTE Only_ESOL_0309=esol_309_P_sum>=1 & esol_312_P_sum=0. 
VARIABLE LABELS  Only_ESOL_0309 'Only_ESOL_0309'. 
EXECUTE.

COMPUTE Only_ESOL_0312=esol_312_P_sum >= 1 & esol_309_P_sum=0. 
VARIABLE LABELS  Only_ESOL_0312 'Only_ESOL_0312'. 
EXECUTE. 

SORT CASES BY esol_312_P_sum (D). 
COMPUTE both_ESOL=(esol_312_P_sum>=1& esol_309_P_sum >= 1). 
VARIABLE LABELS  both_ESOL 'both_ESOL'. 
EXECUTE.

FREQUENCIES VARIABLES=both_ESOL 
  /ORDER=ANALYSIS.

COMPUTE Gateway_course=CourseName = 'HIST-1301'  | CourseName='ENGL-1301' | CourseName='GOVT-2305'.
VARIABLE LABELS  Gateway_course 'Gateway_course'.
EXECUTE.


COMPUTE SE_INRW_only2=CampusName = 'SE' & INRW_0399_P_sum>0.
EXECUTE.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=Id
  /SE_INRW_only_sum=SUM(SE_INRW_only).


COMPUTE SE_ESOL_0309_only=Only_ESOL_0309 > 0 & ResponsibleCampus = 'SE'.
VARIABLE LABELS  SE_ESOL_0309_only 'SE_ESOL_0309_only'.
EXECUTE.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=Id
  /SE_ESOL_0309_only_sum=SUM(SE_ESOL_0309_only).

COMPUTE SE_ESOL_03129_only=Only_ESOL_0312 > 0 & ResponsibleCampus = 'SE'.
VARIABLE LABELS  SE_ESOL_0312_only 'SE_ESOL_0312_only'.
EXECUTE.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=Id
  /SE_ESOL_0312_only_sum=SUM(SE_ESOL_0312_only).
*Table 1 ESOL success and SE.

USE ALL.
COMPUTE filter_$=((CourseName = 'ESOL-0309' | CourseName='ESOL-0312') & CampusName = 'SE').
VARIABLE LABELS filter_$ "(CourseName = 'ESOL-0309' | CourseName='ESOL-0312') & CampusName = "+
    "'SE' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName VerifiedGrade Passing_course DISPLAY=LABEL
  /TABLE CourseName [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY VerifiedGrade + Passing_course
  /CATEGORIES VARIABLES=CourseName ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=VerifiedGrade Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Students Enrolled in ESOL-0309 or ESOL-0312 at SE Campus 2011FL to 2016SU'.

*Table 2 Success in Gateway based on ESOL.
USE ALL.
COMPUTE filter_$=(ResponsibleCampus = 'SE' & (esol_309_P_sum>0  |  esol_312_P_sum >0 )  & 
    Gateway_course = 1).
VARIABLE LABELS filter_$ "ResponsibleCampus = 'SE' & (esol_309_P_sum>0  |  esol_312_P_sum >0 )  "+
    "& Gateway_course = 1 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName both_ESOL Only_ESOL_0309 Only_ESOL_0312 Passing_course DISPLAY=LABEL    
  /TABLE CourseName [C] > (both_ESOL [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Only_ESOL_0309 
    [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Only_ESOL_0312 [C][COUNT F40.0, ROWPCT.COUNT PCT40.1]) BY 
    Passing_course [C]
  /CATEGORIES VARIABLES=CourseName ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=both_ESOL Only_ESOL_0309 Only_ESOL_0312 Passing_course ORDER=A KEY=VALUE 
    EMPTY=EXCLUDE
  /TITLES
    TITLE='Success in Gateway Courses for Students who took  and passed ESOL-0309 and/or '+
    'ESOL-0312 at SE Campus Fall 2011 to Summer 2016				' ''.

*Table 3.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName VerifiedGrade Passing_course DISPLAY=LABEL
  /TABLE CourseName [C] > VerifiedGrade [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course [C]
  /CATEGORIES VARIABLES=CourseName ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=VerifiedGrade Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Success in Gateway Courses for Students who took  and passed ESOL-0309 and/or '+
    'ESOL-0312 at SE Campus Fall 2011 to Summer 2016				' ''.

*Table 4.

USE ALL.
COMPUTE filter_$=(ResponsibleCampus = 'SE' & (INRW_0399_P_sum>0 )  & Gateway_course = 1).
VARIABLE LABELS filter_$ "ResponsibleCampus = 'SE' & (INRW_0399_P_sum>0 )  & Gateway_course = 1 "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName VerifiedGrade Passing_course DISPLAY=LABEL
  /TABLE CourseName [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY VerifiedGrade [C] + Passing_course [C]    
  /CATEGORIES VARIABLES=CourseName ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=VerifiedGrade Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Success in Gateway Courses for Students who took  and passed INRW-0399 at SE Campus '+
    'Fall 2011 to Summer 2016				' ''.


*Table 5

COMPUTE INRW_all_P=CourseName = 'INRW-0399'  & Passing_course = 'Yes'.
VARIABLE LABELS  INRW_all_P 'INRW_all_P'.
EXECUTE.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=Id
  /INRW_all_P_sum=SUM(INRW_all_P).



USE ALL.
COMPUTE filter_$=(INRW_all_P_sum>0 & Gateway_course = 1).
VARIABLE LABELS filter_$ 'INRW_all_P_sum>0 & Gateway_course = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName VerifiedGrade Passing_course DISPLAY=LABEL
  /TABLE CourseName [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY VerifiedGrade [C] + Passing_course [C]    
  /CATEGORIES VARIABLES=CourseName ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=VerifiedGrade Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Success in Gateway Courses for Students who took  and passed INRW-0399 at All Campuses '+
    'Fall 2011 to Summer 2016				' ''.





* Custom Tables.
CTABLES
  /VLABELS VARIABLES=CourseName Passing_course DISPLAY=LABEL
  /TABLE CourseName [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY Passing_course
  /CATEGORIES VARIABLES=CourseName ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Success in Gateway Courses for students who took and passed INRW-0399 (All Campuses)'.
