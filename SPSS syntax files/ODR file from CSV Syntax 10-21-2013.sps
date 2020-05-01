* Encoding: UTF-8.

GET DATA
  /TYPE=TXT
 /FILE="T:\ODR\ODR 2014FL to 2015FL\ODR 2015 SP SU FL.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  StudentCohortsId A7
  TermId A6
  AllStudents A1
  AuditOnly A1
  CreditNoauditNodual A1
  DualCreditOnly A1
  FticNoauditNodual A1
  FticNoauditNodualDegreeseek A1
  Lupdate DATE11
  ReturningAndTransfer A1
  AcadProgramId A12
  ProgramTitle A56
  AdmStatus A25
  AdmitStatus A3
  Age F2.0
  CollegeReady A1
  CollegeReadyMath A1
  CollegeReadyRead A1
  CollegeReadyWrit A1
  CompleteWithdrawal A1
  CoreComplete A1
  DevCourses A1
  DevEdOnly A1
  DevEsol A1
  DevMath A1
  DevRead A1
  DevWrit A1
  Ethnic A2
  EthDesc A29
  FtPt A2
  Gender A1
  GpaSUM F5.3
  GradAa A1
  GradAas A1
  GradAat A1
  GradCrt A1
  GradFos A1
  HighSchoolId A7
  HighSchoolName A33
  Hispanic A3
  HispDesc A20
  Race A2
  RaceDesc A20
  ReportType A3
  StandingProbation A1
  StandingSuspension A1
  StudentsId A7
  TermStanding A4
  TotalCh F3.0
  TotalChCmpl F3.0
  TotalChCmplDevmath F3.0
  TotalChCmplDevwrit F3.0
  TotalChDevmath F3.0
  TotalChDevwrit F3.0
  TotalChPassing F3.0
  TotalChPassingDevmath F3.0
  TotalChPassingDevwrit F3.0
  TotalNbrEnrollments F3.0
  TotalSemHrs F3.0
  TsiMath A1
  TsiMet A1
  TsiMetMath A1
  TsiMetRead A1
  TsiMetWrit A1
  TsiRead A1
  PellStatus A1
  StuHomeLocation A2
  TsiWaiverExemption A8
  TsiWrite A1
  Zipcode A5.
CACHE.
EXECUTE.

*New Race - Ethnicity Definition 09-16-2013 TCCD.

STRING  newEthnicity (A1).
DO IF Race='IN'.
compute newEthnicity='6'.
else IF Hispanic='HIS'. 
compute newEthnicity='3'.
else IF ((Hispanic='NHS' or Hispanic='EUN' or Hispanic="")   AND Race='WH').
 compute newEthnicity = '1'.
else IF ((Hispanic='NHS' or Hispanic='EUN' or Hispanic="")  AND Race='BL').
compute newEthnicity='2'.
else IF ((Hispanic='NHS' or Hispanic='EUN' or Hispanic="")  AND Race='AS').
compute newEthnicity='4'.
else IF ((Hispanic='NHS' or Hispanic='EUN' or Hispanic="")  AND Race='AN').
compute newEthnicity='5'.
else IF ((Hispanic='NHS' or Hispanic='EUN' or Hispanic="")  AND Race='HP').
compute newEthnicity='8'.
else IF ((Hispanic='NHS' or Hispanic='EUN' or Hispanic="")  AND Race='RU').
compute newEthnicity='7'.
else IF ((Hispanic='NHS' or Hispanic='EUN' or Hispanic="") AND Race='MR').
compute newEthnicity = '9'.
ELSE.
Compute newEthnicity='7'.
end IF.
VARIABLE LABELS  newEthnicity 'New Ethnicity'.
EXECUTE.

Value Labels  newEthnicity
1 'White'
2 'Black / African American'
3 'Hispanic Latino'
4 'Asian'
5 'American Indian / Alaska Native'
6 'International'
7 'Unknown / Not Reported'
8 'Native Hawaiian / Pacific Islander'
9 'Multiracial'.


*Recode Age into ranges  These match STAT Handbook Age ranges. 


RECODE Age (Lowest thru 20.9999=1) (21.00 thru 25.9999=2) (26.000 thru 30.9999=3) (31.00 thru 
    35.9999=4) (36.000 thru 40.9999=5) (41 thru Highest=6) INTO Age_range.
VARIABLE LABELS  Age_range 'Age Range'.
EXECUTE.

Value Labels Age_range
1 'Under 21'
2 '21 to 25'
3 '26 to 30'
4 '31 to 35'
5 '36 to 40'
6 ' Over 40'.


