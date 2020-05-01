*Removed terms not fall 2007 forward.
FILTER OFF.
USE ALL.
SELECT IF (Term_num >= 12 & CHAR.SUBSTR(TermId,5,2)='FL').
EXECUTE.

*Table for degree data.Change IN_ACCT_BUS to whatever you are working on.
* Custom Tables. 
CTABLES 
  /VLABELS VARIABLES=TermId Division OdegType Acad_year_D In_CS_IS DISPLAY=LABEL 
  /TABLE TermId [C] > Division > OdegType [C][COUNT F40.0] BY Acad_year_D [C] + In_CS_IS [C] 
  /CATEGORIES VARIABLES=TermId Division ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CATEGORIES VARIABLES=OdegType Acad_year_D ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE 
  /CATEGORIES VARIABLES=In_CS_IS ORDER=A KEY=VALUE EMPTY=INCLUDE
 /TITLES
    TITLE=' Program Completion Rates for Computer Science\Information Systems at SE Campus 2007 to 2013'.



