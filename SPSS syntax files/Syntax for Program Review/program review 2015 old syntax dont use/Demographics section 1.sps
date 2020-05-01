* Encoding: UTF-8.


USE ALL.
COMPUTE filter_$=(Categories = 'Aircraft Maintenance' & PrimaryLast = 1 & Term = 'Fall').
VARIABLE LABELS filter_$ "Categories = 'Aircraft Maintenance' & PrimaryLast = 1 & Term = 'Fall' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



FREQUENCIES VARIABLES=AcadProgramId Program_name
  /ORDER=ANALYSIS.

String Ethnic_Minority (A3).
RECODE newEthnicity ('1'='No') ('7'='No') ('6'='No') (ELSE='Yes') INTO Ethnic_Minority.
VARIABLE LABELS  Ethnic_Minority 'Ethnic_Minority'.
EXECUTE.

STRING Age_range (A12). 
RECODE Age (Lowest thru 20.999='Under 21') (21 thru 25.999='21 to 25') (26 thru 30.999='26 to 30') 
    (31 thru 35.999='31 to 35') (36 thru 40.999='36 to 40') (41 thru Highest='Over 40') INTO Age_range. 
VARIABLE LABELS  Age_range 'Age_range'. 
EXECUTE. 



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term_ID 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + FticNoauditNodual [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term_ID [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender Ethnic_Minority FticNoauditNodual ReturningAndTransfer Age_range 
    Term_ID ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Aircraft Maintenance'.


*****Architecture...

USE ALL.
COMPUTE filter_$=(Categories = 'Architecture' & PrimaryLast = 1 & Term = 'Fall' & Program_name<> 'MSA.Architectural Technology'
 ).
VARIABLE LABELS filter_$ "Categories = 'Architecture' & PrimaryLast = 1 & Term = 'Fall' " & Program_name<> 'MSA.Architectural Technology' +
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



FREQUENCIES VARIABLES=AcadProgramId Program_name
  /ORDER=ANALYSIS.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term_ID 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + FticNoauditNodual [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term_ID [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender Ethnic_Minority FticNoauditNodual ReturningAndTransfer Age_range 
    Term_ID ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Architecture'.



***Drafting and CAD.


USE ALL.
COMPUTE filter_$=(Categories = 'Drafting and CAD' & PrimaryLast = 1 & Term = 'Fall').
VARIABLE LABELS filter_$ "Categories = 'Drafting and CAD' & PrimaryLast = 1 & Term = 'Fall' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=AcadProgramId Program_name
  /ORDER=ANALYSIS.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term_ID 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + FticNoauditNodual [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term_ID [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender Ethnic_Minority FticNoauditNodual ReturningAndTransfer Age_range 
    Term_ID ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Drafting and CAD'.

**Horticulture.

USE ALL.
COMPUTE filter_$=(Categories = 'Horticulture' & PrimaryLast = 1 & Term = 'Fall').
VARIABLE LABELS filter_$ "Categories = 'Horticulture' & PrimaryLast = 1 & Term = 'Fall' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=AcadProgramId Program_name
  /ORDER=ANALYSIS.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term_ID 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + FticNoauditNodual [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term_ID [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender Ethnic_Minority FticNoauditNodual ReturningAndTransfer Age_range 
    Term_ID ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Horticulture'.

**Hospital and Health Care Administrat.


USE ALL.
COMPUTE filter_$=(Categories = 'Hospital and Health Care Administrat' & PrimaryLast = 1 & Term = 'Fall').
VARIABLE LABELS filter_$ "Categories = 'Hospital and Health Care Administrat' & PrimaryLast = 1 & Term = 'Fall' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=AcadProgramId Program_name
  /ORDER=ANALYSIS.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term_ID 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + FticNoauditNodual [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term_ID [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender Ethnic_Minority FticNoauditNodual ReturningAndTransfer Age_range 
    Term_ID ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Long Term Care'.


**Real Estate..

USE ALL.
COMPUTE filter_$=(Categories = 'Real Estate' & PrimaryLast = 1 & Term = 'Fall').
VARIABLE LABELS filter_$ "Categories = 'Real Estate' & PrimaryLast = 1 & Term = 'Fall' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=AcadProgramId Program_name
  /ORDER=ANALYSIS.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term_ID 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + FticNoauditNodual [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term_ID [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender Ethnic_Minority FticNoauditNodual ReturningAndTransfer Age_range 
    Term_ID ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Real Estate'.

***
Surgical Technology/Technologis.

USE ALL.
COMPUTE filter_$=(Categories = 'Surgical Technology/Technologis' & PrimaryLast = 1 & Term = 'Fall').
VARIABLE LABELS filter_$ "Categories = 'Surgical Technology/Technologis' & PrimaryLast = 1 & Term = 'Fall' "+
    "(FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=AcadProgramId Program_name
  /ORDER=ANALYSIS.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term_ID 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + FticNoauditNodual [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    ROWPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term_ID [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender Ethnic_Minority FticNoauditNodual ReturningAndTransfer Age_range 
    Term_ID ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Surgical Technology/Technologies'.
*********************
* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FT_PT newEthnicity Gender Age_range FTIC Ethnic_Minority Term 
    DISPLAY=LABEL
  /TABLE FT_PT [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + newEthnicity [C][COUNT F40.0, COLPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, COLPCT.COUNT 
    PCT40.1] + FTIC [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Ethnic_Minority [C][COUNT F40.0, 
    COLPCT.COUNT PCT40.1] BY Term [C]
  /CATEGORIES VARIABLES=FT_PT Gender Age_range Ethnic_Minority ORDER=A KEY=VALUE EMPTY=EXCLUDE 
    TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity FTIC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=Term ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Program Review Program: Sign Language 2010-2015 (unduplicated headcount)'.



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Age Term DISPLAY=LABEL
  /TABLE Age [S][MEAN] BY Term [C]
  /CATEGORIES VARIABLES=Term ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Program Review Program:  Sign Language 2010-2015 (unduplicated headcount)'.
