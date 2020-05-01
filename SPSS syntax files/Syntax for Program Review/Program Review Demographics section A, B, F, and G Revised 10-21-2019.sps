* Encoding: UTF-8.

*Encoding: UTF-8
****Program review October 2019.

String Ethnic_Minority (A3).
RECODE newEthnicity ('1'='No') ('7'='No') ('6'='No') (ELSE='Yes') INTO Ethnic_Minority.
VARIABLE LABELS  Ethnic_Minority 'Ethnic_Minority'.
EXECUTE.

STRING Age_Range (A12).
RECODE Age (Lowest thru 20.9999999='Under 21') (26.0000 thru 30.9999999='26 to 30') (21.0000 thru 
    25.9999999='21 to 25') (31.000 thru 35.999999='31 to 35') (36.000 thru 40.9999999='36 to 40') 
    (40.00000 thru Highest='Over 40') INTO Age_Range.
VARIABLE LABELS  Age_Range 'Age_Range'.
EXECUTE.


STRING ReturningAndTransfer (A20).
RECODE FticNoauditNodual ('X'='FTIC') (ELSE='ReturningAndTransfer') INTO ReturningAndTransfer.
VARIABLE LABELS  ReturningAndTransfer 'ReturningAndTransfer'.
EXECUTE.

**Mental Health Program.
* Encoding: UTF-8.

USE ALL.
COMPUTE filter_$=(CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1).
VARIABLE LABELS filter_$ "CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1 (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=ACAD_PROGRAM_ID Program_name
  /ORDER=ANALYSIS.


***Mental Health Program.
* Custom Tables.

CTABLES
  /VLABELS VARIABLES=FTPT newEthnicity Gender Ethnic_Minority FticNoauditNodual 
    ReturningAndTransfer Age_range Age Term 
    DISPLAY=LABEL
  /TABLE FTPT [C][COUNT F40.0,  COLPCT.COUNT  PCT40.1] + newEthnicity [C][COUNT F40.0, COLPCT.COUNT 
    PCT40.1] + Gender [C][COUNT F40.0, COLPCT.COUNT  PCT40.1] + 
    ReturningAndTransfer [C][COUNT F40.0, COLPCT.COUNT PCT40.1] + Age_range [C][COUNT F40.0, 
    COLPCT.COUNT PCT40.1] + Age [S][MEAN DOT40.0] BY Term [C]
  /CATEGORIES VARIABLES=FTPT ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ReturningAndTransfer Age_range 
    Term ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Mental Health Program Parts A and B'.

**********TSI LIability Section F.
**Mental Health Program.

USE ALL.
COMPUTE filter_$=(CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1 & FticNoauditNodual = 'X').
VARIABLE LABELS filter_$ "CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1 & FticNoauditNodual = "+
    "'X' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=FticNoauditNodual Term DISPLAY=LABEL
  /TABLE FticNoauditNodual [C] BY Term [C][COUNT F40.0]
  /CATEGORIES VARIABLES=FticNoauditNodual Term ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Mental Health Program FTIC'.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=TsiMetMath TsiMetRead TsiMetWrit NumbTSILiab Term DISPLAY=LABEL
  /TABLE TsiMetMath [C] + TsiMetRead [C] + TsiMetWrit [C] + NumbTSILiab [C] BY Term [C][COUNT 
    F40.0, COLPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=TsiMetMath TsiMetRead TsiMetWrit NumbTSILiab Term ORDER=A KEY=VALUE 
    EMPTY=EXCLUDE
  /TITLES
    TITLE='Mental Health Program FTIC TSI liability Section F'.


**********EOS GPA and Standing Section G and Section H.
**Mental Health Program

USE ALL.
COMPUTE filter_$=(CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1 & FticNoauditNodual = 'X').
VARIABLE LABELS filter_$ "CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1 & FticNoauditNodual = "+
    "'X' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=TermHoursAttempted
  /ORDER=ANALYSIS.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender Term TermGpa Good_standing DISPLAY=LABEL
  /TABLE newEthnicity [C] + Gender [C] BY Term [C] > (TermGpa [S][MEAN, COUNT F40.0] + 
    Good_standing [C][ROWPCT.COUNT PCT40.1, COUNT F40.0])
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Term Good_standing ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='EOS GPA and Standing Mental Health Program Section G and Section H'.


**********FTIC one Year Retention Section G Part II Retention.
**Mental Health Program.

USE ALL.
COMPUTE filter_$=(CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1 & FticNoauditNodual = 'X' ).
VARIABLE LABELS filter_$ "CATEGORIES = 'Psychiatric/Mental Health Services' & PrimaryLast = 1 & FticNoauditNodual = "+
    "'X' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=newEthnicity Gender Term RetainedOneYear DISPLAY=LABEL
  /TABLE newEthnicity [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] + Gender [C][COUNT F40.0, ROWPCT.COUNT 
    PCT40.1] BY Term [C] > RetainedOneYear [C]
  /CATEGORIES VARIABLES=newEthnicity ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Term ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=RetainedOneYear ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    TITLE='One Year Retention FTIC Mental Health Program Section G Part II'.




