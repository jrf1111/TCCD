* Encoding: UTF-8.

USE ALL.
COMPUTE filter_$=(Child = 1 & (AcadYear = '2017-2018'  | AcadYear='2016-2017' | AcadYear = 
    '2015-2016' | AcadYear = '2014-2015' | AcadYear = '2013-2014')).
VARIABLE LABELS filter_$ "Child = 1 & (AcadYear = '2017-2018'  | AcadYear='2016-2017' | AcadYear "+
    "= '2015-2016' | AcadYear = '2014-2015' | AcadYear = '2013-2014') (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* 1. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business AcadYear DISPLAY=LABEL
  /TABLE Child [C] > Course [C] BY AcadYear [C][COUNT F40.0]
  /CATEGORIES VARIABLES=Child AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Small Business'.


* 2. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=Child AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Small Business Course Grades'.


* 3. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business Gender AcadYear Passing_course Retained_in_course DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > Gender [C] BY AcadYear [C] > (Passing_course [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business Gender AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Small Business Course pass rate'.


* 4. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business Gender AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > Gender [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Small Business Gender AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Small Business Course Grades by Gender'.


* 5. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business Gender AcadYear Passing_course Retained_in_course DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > Gender [C] BY AcadYear [C] > (Passing_course [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business Gender AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Small Business Course pass rate by Gender'.


*6. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business FT_PT AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > FT_PT [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Small Business FT_PT AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Small Business Course Grades by FT_PT'.

* 7. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business FT_PT AcadYear Passing_course Retained_in_course DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > FT_PT [C] BY AcadYear [C] > (Passing_course [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business FT_PT AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Small Business Course pass rate by FT_PT'.


* 8. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business newEthnicity AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > newEthnicity [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Small Business AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Small Business Course Grades by Ethnicity'.


* 9. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business newEthnicity AcadYear Passing_course Retained_in_course 
    DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > newEthnicity [C] BY AcadYear [C] > (Passing_course [C][COUNT 
    F40.0, ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Small Business Course pass rate by Ethnicity'.


* Encoding: UTF-8.

USE ALL.
COMPUTE filter_$=(Child = 0 & (AcadYear = '2017-2018'  | AcadYear='2016-2017' | AcadYear = 
    '2015-2016' | AcadYear = '2014-2015' | AcadYear = '2013-2014')).
VARIABLE LABELS filter_$ "Child = 1 & (AcadYear = '2017-2018'  | AcadYear='2016-2017' | AcadYear "+
    "= '2015-2016' | AcadYear = '2014-2015' | AcadYear = '2013-2014') (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* 1. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business AcadYear DISPLAY=LABEL
  /TABLE Child [C] > Course [C] BY AcadYear [C][COUNT F40.0]
  /CATEGORIES VARIABLES=Child AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Mental Health'.


* 2. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1]
  /CATEGORIES VARIABLES=Child AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Mental Health Course Grades'.


* 3. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business Gender AcadYear Passing_course Retained_in_course DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > Gender [C] BY AcadYear [C] > (Passing_course [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business Gender AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Mental Health Course  pass rate'.


* 4. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business Gender AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > Gender [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Small Business Gender AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Mental Health Course Grades by Gender'.


* 5. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business Gender AcadYear Passing_course Retained_in_course DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > Gender [C] BY AcadYear [C] > (Passing_course [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business Gender AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Mental Health Course pass rate by Gender'.


*6. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business FT_PT AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > FT_PT [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Small Business FT_PT AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Mental Health Course Grades by FT_PT'.

* 7. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business FT_PT AcadYear Passing_course Retained_in_course DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > FT_PT [C] BY AcadYear [C] > (Passing_course [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business FT_PT AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Mental Health Course pass rate by FT_PT'.


* 8. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business newEthnicity AcadYear VerifiedGrade DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > newEthnicity [C] BY AcadYear [C] > VerifiedGrade [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Small Business AcadYear VerifiedGrade ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /TITLES
    TITLE='Mental Health Course Grades by Ethnicity'.


* 9. Custom Tables.
CTABLES
  /VLABELS VARIABLES=Small Business newEthnicity AcadYear Passing_course Retained_in_course 
    DISPLAY=LABEL
  /TABLE Child [C] > Course [C] > newEthnicity [C] BY AcadYear [C] > (Passing_course [C][COUNT 
    F40.0, ROWPCT.COUNT PCT40.1] + Retained_in_course [C][COUNT F40.0, ROWPCT.COUNT PCT40.1])
  /CATEGORIES VARIABLES=Small Business AcadYear ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=newEthnicity Retained_in_course ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='Mental Health Course pass rate by Ethnicity'.








