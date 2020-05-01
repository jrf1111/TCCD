* Encoding: windows-1252.
*Departmental profile for program review source is fall ODR files.
USE ALL.
COMPUTE filter_$=(ProgramTitle = 'AA.Associate of Arts' & (TermId ~= '2005FL' & TermId ~= 
    '2006FL')).
VARIABLE LABELS filter_$ "ProgramTitle = 'AA.Associate of Arts' & (TermId ~= '2005FL' & "+
    "TermId ~= '2006FL') (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



FREQUENCIES VARIABLES=TERMId ProgramTitle AcadProgramId
  /ORDER=ANALYSIS.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity FtPt Age_range Minority AllStudents CreditNoauditNodual 
    ReturningAndTransfer FticNoauditNodual FticNoauditNodualDegreeseek DualCreditOnly AuditOnly TermId 
    DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] + FtPt [C] + Age_range [C] + Minority [C] +AllStudents [C] + 
    CreditNoauditNodual [C] + ReturningAndTransfer [C] + FticNoauditNodual [C] + 
    FticNoauditNodualDegreeseek [C] + DualCreditOnly [C] + AuditOnly [C] BY TermId [C][COUNT F40.0, 
    COLPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=newEthnicity Age_range ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=FtPt Minority AllStudents CreditNoauditNodual ReturningAndTransfer FticNoauditNodual 
    FticNoauditNodualDegreeseek DualCreditOnly AuditOnly TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
/TITLES
    TITLE='Demographics for Program Profile AA. Associate of Arts (Cornerstone)'.

RECODE newEthnicity ('1'='Non-minority') ('6'='Non-minority') ('7'='Non-minority') 
    (ELSE='Minority') INTO Minority.
VARIABLE LABELS  Minority 'Minority'.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Gender newEthnicity FtPt Age_range FticNoauditNodual ReturningAndTransfer 
    TermId 
    DISPLAY=LABEL
  /TABLE Gender [C] + newEthnicity [C] + FtPt [C] + Age_range [C] + FticNoauditNodual [C] + 
    ReturningAndTransfer [C] BY TermId [C][COUNT F40.0, COLPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Gender ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=newEthnicity Age_range ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=FtPt FticNoauditNodual ReturningAndTransfer TermId ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /TITLES
    TITLE='Demographics for Program Profile AA. Associate of Arts (Cornerstone)'.

 