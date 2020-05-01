* Encoding: UTF-8.
Numeric InODR2007FL.
COMPUTE InODR2007FL=0.
IF(TermId='2007FL') InODR2007FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2007FL=MAX(InODR2007FL).

Numeric InODR2008FL.
COMPUTE InODR2008FL=0.
IF(TermId='2008FL') InODR2008FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2008FL=MAX(InODR2008FL).

Numeric InODR2009FL.
COMPUTE InODR2009FL=0.
IF(TermId='2009FL') InODR2009FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2009FL=MAX(InODR2009FL).

Numeric InODR2010FL.
COMPUTE InODR2010FL=0.
IF(TermId='2010FL') InODR2010FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2010FL=MAX(InODR2010FL).

Numeric InODR2011FL.
COMPUTE InODR2011FL=0.
IF(TermId='2011FL') InODR2011FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2011FL=MAX(InODR2011FL).

Numeric InODR2012FL.
COMPUTE InODR2012FL=0.
IF(TermId='2012FL') InODR2012FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2012FL=MAX(InODR2012FL).

Numeric InODR2013FL.
COMPUTE InODR2013FL=0.
IF(TermId='2013FL') InODR2013FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2013FL=MAX(InODR2013FL).

Numeric InODR2014FL.
COMPUTE InODR2014FL=0.
IF(TermId='2014FL') InODR2014FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2014FL=MAX(InODR2014FL).

Numeric InODR2015FL.
COMPUTE InODR2015FL=0.
IF(TermId='2015FL') InODR2015FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2015FL=MAX(InODR2015FL).

Numeric InODR2016FL.
COMPUTE InODR2016FL=0.
IF(TermId='2016FL') InODR2016FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2016FL=MAX(InODR2016FL).


Numeric InODR2017FL.
COMPUTE InODR2017FL=0.
IF(TermId='2017FL') InODR2017FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2017FL=MAX(InODR2017FL).

Numeric InODR2018FL.
COMPUTE InODR2018FL=0.
IF(TermId='2018FL') InODR2018FL=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /InODR2018FL=MAX(InODR2018FL).




Numeric RetainedOneYear.
COMPUTE RetainedOneYear=0.
IF(TermId='2007FL' and InODR2008FL=1) RetainedOneYear=1.
IF(TermId='2008FL' and InODR2009FL=1) RetainedOneYear=1.
IF(TermId='2009FL' and InODR2010FL=1) RetainedOneYear=1.
IF(TermId='2010FL' and InODR2011FL=1) RetainedOneYear=1.
IF(TermId='2011FL' and InODR2012FL=1) RetainedOneYear=1.
IF(TermId='2012FL' and InODR2013FL=1) RetainedOneYear=1.
IF(TermId='2013FL' and InODR2014FL=1) RetainedOneYear=1.
IF(TermId='2014FL' and InODR2015FL=1) RetainedOneYear=1.
IF(TermId='2015FL' and InODR2016FL=1) RetainedOneYear=1.
IF(TermId='2016FL' and InODR2017FL=1) RetainedOneYear=1.
IF(TermId='2017FL' and InODR2018FL=1) RetainedOneYear=1.
EXECUTE.


Numeric RetainedTwoYear.
COMPUTE RetainedTwoYear=0.
IF(TermId='2007FL' and InODR2009FL=1) RetainedTwoYear=1.
IF(TermId='2008FL' and InODR2010FL=1) RetainedTwoYear=1.
IF(TermId='2009FL' and InODR2011FL=1) RetainedTwoYear=1.
IF(TermId='2010FL' and InODR2012FL=1) RetainedTwoYear=1.
IF(TermId='2011FL' and InODR2013FL=1) RetainedTwoYear=1.
IF(TermId='2012FL' and InODR2014FL=1) RetainedTwoYear=1.
IF(TermId='2013FL' and InODR2015FL=1) RetainedTwoYear=1.
IF(TermId='2014FL' and InODR2016FL=1) RetainedTwoYear=1.
IF(TermId='2015FL' and InODR2017FL=1) RetainedTwoYear=1.
IF(TermId='2016FL' and InODR2018FL=1) RetainedTwoYear=1.
EXECUTE.


Numeric RetainedThreeYear.
COMPUTE RetainedThreeYear=0.
IF(TermId='2007FL' and InODR2010FL=1) RetainedThreeYear=1.
IF(TermId='2008FL' and InODR2011FL=1) RetainedThreeYear=1.
IF(TermId='2009FL' and InODR2012FL=1) RetainedThreeYear=1.
IF(TermId='2010FL' and InODR2013FL=1) RetainedThreeYear=1.
IF(TermId='2011FL' and InODR2014FL=1) RetainedThreeYear=1.
IF(TermId='2012FL' and InODR2015FL=1) RetainedThreeYear=1.
IF(TermId='2013FL' and InODR2016FL=1) RetainedThreeYear=1.
IF(TermId='2014FL' and InODR2017FL=1) RetainedThreeYear=1.
IF(TermId='2015FL' and InODR2018FL=1) RetainedThreeYear=1.
EXECUTE.


Numeric RetainedFourYear.
COMPUTE RetainedFourYear=0.
IF(TermId='2007FL' and InODR2011FL=1) RetainedFourYear=1.
IF(TermId='2008FL' and InODR2012FL=1) RetainedFourYear=1.
IF(TermId='2009FL' and InODR2013FL=1) RetainedFourYear=1.
IF(TermId='2010FL' and InODR2014FL=1) RetainedFourYear=1.
IF(TermId='2011FL' and InODR2015FL=1) RetainedFourYear=1.
IF(TermId='2012FL' and InODR2016FL=1) RetainedFourYear=1.
IF(TermId='2013FL' and InODR2017FL=1) RetainedFourYear=1.
IF(TermId='2014FL' and InODR2018FL=1) RetainedFourYear=1.
EXECUTE.


Numeric RetainedFiveYear.
COMPUTE RetainedFiveYear=0.
IF(TermId='2007FL' and InODR2012FL=1) RetainedFiveYear=1.
IF(TermId='2008FL' and InODR2013FL=1) RetainedFiveYear=1.
IF(TermId='2009FL' and InODR2014FL=1) RetainedFiveYear=1.
IF(TermId='2010FL' and InODR2015FL=1) RetainedFiveYear=1.
IF(TermId='2011FL' and InODR2016FL=1) RetainedFiveYear=1.
IF(TermId='2012FL' and InODR2017FL=1) RetainedFiveYear=1.
IF(TermId='2013FL' and InODR2018FL=1) RetainedFiveYear=1.
EXECUTE.


Numeric RetainedSixYear.
COMPUTE RetainedSixYear=0.
IF(TermId='2007FL' and InODR2013FL=1) RetainedSixYear=1.
IF(TermId='2008FL' and InODR2014FL=1) RetainedSixYear=1.
IF(TermId='2009FL' and InODR2015FL=1) RetainedSixYear=1.
IF(TermId='2010FL' and InODR2016FL=1) RetainedSixYear=1.
IF(TermId='2011FL' and InODR2017FL=1) RetainedSixYear=1.
IF(TermId='2012FL' and InODR2018FL=1) RetainedSixYear=1.
EXECUTE.


Numeric RetainedSevenYear.
COMPUTE RetainedSevenYear=0.
IF(TermId='2007FL' and InODR2014FL=1) RetainedSevenYear=1.
IF(TermId='2008FL' and InODR2015FL=1) RetainedSevenYear=1.
IF(TermId='2009FL' and InODR2016FL=1) RetainedSevenYear=1.
IF(TermId='2010FL' and InODR2017FL=1) RetainedSevenYear=1.
IF(TermId='2011FL' and InODR2018FL=1) RetainedSevenYear=1.
EXECUTE.


Numeric RetainedEightYear.
COMPUTE RetainedEightYear=0.
IF(TermId='2007FL' and InODR2015FL=1) RetainedEightYear=1.
IF(TermId='2008FL' and InODR2016FL=1) RetainedEightYear=1.
IF(TermId='2009FL' and InODR2017FL=1) RetainedEightYear=1.
IF(TermId='2010FL' and InODR2018FL=1) RetainedEightYear=1.
EXECUTE.


Numeric RetainedNineYear.
COMPUTE RetainedNineYear=0.
IF(TermId='2007FL' and InODR2016FL=1) RetainedNineYear=1.
IF(TermId='2008FL' and InODR2017FL=1) RetainedNineYear=1.
IF(TermId='2009FL' and InODR2018FL=1) RetainedNineYear=1.
EXECUTE.


Numeric RetainedTenYear.
COMPUTE RetainedTenYear=0.
IF(TermId='2007FL' and InODR2017FL=1) RetainedTenYear=1.
IF(TermId='2008FL' and InODR2018FL=1) RetainedTenYear=1.
EXECUTE.





DATASET ACTIVATE DataSet2.
FILTER OFF.
USE ALL.
SELECT IF (AcadDegree  ~= 'FOS' & AcadDegree  ~= 'MSA' & AcadDegree  ~= 'OSA' ).
EXECUTE.


Numeric StudentCohortsId.
Compute StudentCohortsId=Id.
EXECUTE.

String Term (A6).
COMPUTE Term=AcadTerm.
EXECUTE.




String AcademicYear (A9).
IF (Term='2007Q1' OR Term='2007Q2' OR Term='2008Q3' OR Term='2008Q4') AcademicYear='2007-2008'.
IF (Term='2008Q1' OR Term='2008Q2' OR Term='2009Q3' OR Term='2009Q4') AcademicYear='2008-2009'.
IF (Term='2009Q1' OR Term='2009Q2' OR Term='2010Q3' OR Term='2010Q4') AcademicYear='2009-2010'.
IF (Term='2010Q1' OR Term='2010Q2' OR Term='2011Q3' OR Term='2011Q4') AcademicYear='2010-2011'.
IF (Term='2011Q1' OR Term='2011Q2' OR Term='2012Q3' OR Term='2012Q4') AcademicYear='2011-2012'.
IF (Term='2012Q1' OR Term='2012Q2' OR Term='2013Q3' OR Term='2013Q4') AcademicYear='2012-2013'. 
IF (Term='2013Q1' OR Term='2013Q2' OR Term='2014Q3' OR Term='2014Q4') AcademicYear='2013-2014'.
IF (Term='2014Q1' OR Term='2014Q2' OR Term='2015Q3' OR Term='2015Q4') AcademicYear='2014-2015'.
IF (Term='2015Q1' OR Term='2015Q2' OR Term='2016Q3' OR Term='2016Q4') AcademicYear='2015-2016'.
IF (Term='2016Q1' OR Term='2016Q2' OR Term='2017Q3' OR Term='2017Q4') AcademicYear='2016-2017'.
IF (Term='2017Q1' OR Term='2017Q2' OR Term='2018Q3' OR Term='2018Q4') AcademicYear='2017-2018'.


IF (Term='2007FL' OR Term='2008SP' OR Term='2008SU' ) AcademicYear='2007-2008'.
IF (Term='2008FL' OR Term='2009SP' OR Term='2009SU' ) AcademicYear='2008-2009'.
IF (Term='2009FL' OR Term='2010SP' OR Term='2010SU' ) AcademicYear='2009-2010'.
IF (Term='2010FL' OR Term='2011SP' OR Term='2011SU' ) AcademicYear='2010-2011'.
IF (Term='2011FL' OR Term='2012SP' OR Term='2012SU' ) AcademicYear='2011-2012'.
IF (Term='2012FL' OR Term='2013SP' OR Term='2013SU' ) AcademicYear='2012-2013'.
IF (Term='2013FL' OR Term='2014SP' OR Term='2014SU' ) AcademicYear='2013-2014'.
IF (Term='2014FL' OR Term='2015SP' OR Term='2015SU' ) AcademicYear='2014-2015'.
IF (Term='2015FL' OR Term='2016SP' OR Term='2016SU' ) AcademicYear='2015-2016'.
IF (Term='2016FL' OR Term='2017SP' OR Term='2017SU' ) AcademicYear='2016-2017'.
IF (Term='2017FL' OR Term='2018SP' OR Term='2018SU' ) AcademicYear='2017-2018'.
EXECUTE.

Numeric Grad0708.
COMPUTE Grad0708=0.
IF(AcademicYear='2007-2008') Grad0708=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad0708=MAX(Grad0708).

Numeric Grad0809.
COMPUTE Grad0809=0.
IF(AcademicYear='2008-2009') Grad0809=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad0809=MAX(Grad0809).

Numeric Grad0910.
COMPUTE Grad0910=0.
IF(AcademicYear='2009-2010') Grad0910=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad0910=MAX(Grad0910).

Numeric Grad1011.
COMPUTE Grad1011=0.
IF(AcademicYear='2010-2011') Grad1011=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1011=MAX(Grad1011).

Numeric Grad1112.
COMPUTE Grad1112=0.
IF(AcademicYear='2011-2012') Grad1112=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1112=MAX(Grad1112).

Numeric Grad1213.
COMPUTE Grad1213=0.
IF(AcademicYear='2012-2013') Grad1213=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1213=MAX(Grad1213).

Numeric Grad1314.
COMPUTE Grad1314=0.
IF(AcademicYear='2013-2014') Grad1314=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1314=MAX(Grad1314).

Numeric Grad1415.
COMPUTE Grad1415=0.
IF(AcademicYear='2014-2015') Grad1415=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1415=MAX(Grad1415).

Numeric Grad1516.
COMPUTE Grad1516=0.
IF(AcademicYear='2015-2016') Grad1516=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1516=MAX(Grad1516).

Numeric Grad1617.
COMPUTE Grad1617=0.
IF(AcademicYear='2016-2017') Grad1617=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1617=MAX(Grad1617).

Numeric Grad1718.
COMPUTE Grad1718=0.
IF(AcademicYear='2017-2018') Grad1718=1.
EXECUTE.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=StudentCohortsId
  /Grad1718=MAX(Grad1718).

* Identify Duplicate Cases.
SORT CASES BY StudentCohortsId(A).
MATCH FILES
  /FILE=*
  /BY StudentCohortsId
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst InDupGrp MatchSequence.
VARIABLE LABELS  PrimaryLast 'Indicator of each last matching case as Primary'.
VALUE LABELS  PrimaryLast 0 'Duplicate Case' 1 'Primary Case'.
VARIABLE LEVEL  PrimaryLast (ORDINAL).
FREQUENCIES VARIABLES=PrimaryLast.
EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (PrimaryLast=1).
EXECUTE.

SORT CASES BY StudentCohortsId(A).


DATASET ACTIVATE DataSet1.
SORT CASES BY StudentCohortsId(A).



MATCH FILES /FILE=*
  /TABLE='DataSet2'
  /RENAME (AcadDegree AcademicYear AcadHonors AcadMajors AcadProgram AcadTerm AcpgCip AcpgTitle 
    AddressLine1 AddressLine2 City DateAwarded Ethnic Ethnics FirstName Gender HomePhone Id PrimaryLast 
    LastName OdegDesc OdegType OmajDesc PrivacyFlag Races Ssn State StprLocation StudentIntent Term 
    YearAwarded Zip = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 
    d23 d24 d25 d26 d27 d28 d29 d30 d31) 
  /BY StudentCohortsId
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 
    d25 d26 d27 d28 d29 d30 d31.
EXECUTE.




RECODE Grad0708 Grad0809 Grad0910 Grad1011 Grad1112 Grad1213 Grad1314 Grad1415 Grad1516 Grad1617 Grad1718
    (1=1) (ELSE=0).
EXECUTE.




Numeric GradOneYear.
COMPUTE GradOneYear=0.
IF(TermId='2007FL' and max(0,Grad0708)=1) GradOneYear=1.
IF(TermId='2008FL' and max(0,Grad0809)=1) GradOneYear=1.
IF(TermId='2009FL' and max(0,Grad0910)=1) GradOneYear=1.
IF(TermId='2010FL' and max(0,Grad1011)=1) GradOneYear=1.
IF(TermId='2011FL' and max(0,Grad1112)=1) GradOneYear=1.
IF(TermId='2012FL' and max(0,Grad1213)=1) GradOneYear=1.
IF(TermId='2013FL' and max(0,Grad1314)=1) GradOneYear=1.
IF(TermId='2014FL' and max(0,Grad1415)=1) GradOneYear=1.
IF(TermId='2015FL' and max(0,Grad1516)=1) GradOneYear=1.
IF(TermId='2016FL' and max(0,Grad1617)=1) GradOneYear=1.
IF(TermId='2017FL' and max(0,Grad1718)=1) GradOneYear=1.
EXECUTE.

Numeric GradTwoYear.
COMPUTE GradTwoYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809)=1) GradTwoYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910)=1) GradTwoYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011)=1) GradTwoYear=1.
IF(TermId='2010FL' and max(0,Grad1011,Grad1112)=1) GradTwoYear=1.
IF(TermId='2011FL' and max(0,Grad1112,Grad1213)=1) GradTwoYear=1.
IF(TermId='2012FL' and max(0,Grad1213,Grad1314)=1) GradTwoYear=1.
IF(TermId='2013FL' and max(0,Grad1314,Grad1415)=1) GradTwoYear=1.
IF(TermId='2014FL' and max(0,Grad1415,Grad1516)=1) GradTwoYear=1.
IF(TermId='2015FL' and max(0,Grad1516,Grad1617)=1) GradTwoYear=1.
IF(TermId='2016FL' and max(0,Grad1617,Grad1718)=1) GradTwoYear=1.
EXECUTE.

Numeric GradThreeYear.
COMPUTE GradThreeYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910)=1) GradThreeYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011)=1) GradThreeYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011,Grad1112)=1) GradThreeYear=1.
IF(TermId='2010FL' and max(0,Grad1011,Grad1112,Grad1213)=1) GradThreeYear=1.
IF(TermId='2011FL' and max(0,Grad1112,Grad1213,Grad1314)=1) GradThreeYear=1.
IF(TermId='2012FL' and max(0,Grad1213,Grad1314,Grad1415)=1) GradThreeYear=1.
IF(TermId='2013FL' and max(0,Grad1314,Grad1415,Grad1516)=1) GradThreeYear=1.
IF(TermId='2014FL' and max(0,Grad1415,Grad1516,Grad1617)=1) GradThreeYear=1.
IF(TermId='2015FL' and max(0,Grad1516,Grad1617,Grad1718)=1) GradThreeYear=1.
EXECUTE.

Numeric GradFourYear.
COMPUTE GradFourYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011)=1) GradFourYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112)=1) GradFourYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213)=1) GradFourYear=1.
IF(TermId='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradFourYear=1.
IF(TermId='2011FL' and max(0,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradFourYear=1.
IF(TermId='2012FL' and max(0,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradFourYear=1.
IF(TermId='2013FL' and max(0,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradFourYear=1.
IF(TermId='2014FL' and max(0,Grad1415,Grad1516,Grad1617,Grad1718)=1) GradFourYear=1.
EXECUTE.

Numeric GradFiveYear.
COMPUTE GradFiveYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112)=1) GradFiveYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213)=1) GradFiveYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradFiveYear=1.
IF(TermId='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradFiveYear=1.
IF(TermId='2011FL' and max(0,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradFiveYear=1.
IF(TermId='2012FL' and max(0,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradFiveYear=1.
IF(TermId='2013FL' and max(0,Grad1314,Grad1415,Grad1516,Grad1617,Grad1718)=1) GradFiveYear=1.
EXECUTE.

Numeric GradSixYear.
COMPUTE GradSixYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213)=1) GradSixYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradSixYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradSixYear=1.
IF(TermId='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradSixYear=1.
IF(TermId='2011FL' and max(0,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradSixYear=1.
IF(TermId='2012FL' and max(0,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617,Grad1718)=1) GradSixYear=1.
EXECUTE.

Numeric GradSevenYear.
COMPUTE GradSevenYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradSevenYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradSevenYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradSevenYear=1.
IF(TermId='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradSevenYear=1.
IF(TermId='2011FL' and max(0,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617,Grad1718)=1) GradSevenYear=1.
EXECUTE.

Numeric GradEightYear.
COMPUTE GradEightYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradEightYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradEightYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradEightYear=1.
IF(TermId='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617,Grad1718)=1) GradEightYear=1.
EXECUTE.

Numeric GradNineYear.
COMPUTE GradNineYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradNineYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradNineYear=1.
IF(TermId='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617,Grad1718)=1) GradNineYear=1.
EXECUTE.

Numeric GradTenYear.
COMPUTE GradTenYear=0.
IF(TermId='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradTenYear=1.
IF(TermId='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617,Grad1718)=1) GradTenYear=1.
EXECUTE.






