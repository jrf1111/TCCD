* Encoding: UTF-8.

GET DATA  /TYPE=TXT
  /FILE="T:\ODR\ODR 2011 to 2016SP\odr sp 2012 to 2016.csv"
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
  Age A2
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
  HighSchoolName A35
  Hispanic A3
  HispDesc A19
  Race A2
  RaceDesc A25
  ReportType A3
  StandingProbation A1
  StandingSuspension A1
  StudentsId A7
  TermStanding A4
  TotalCh F3.0
  TotalChCmpl F3.0
  TotalChCmplDevmath F3.0
  TotalChCmplDevwrit F3.0
  TotalChDevmath F2.0
  TotalChDevwrit F1.0
  TotalChPassing F1.0
  TotalChPassingDevmath F1.0
  TotalChPassingDevwrit F1.0
  TotalNbrEnrollments F1.0
  TotalSemHrs F2.0
  TsiMath A2
  TsiMet A1
  TsiMetMath A1
  TsiMetRead A1
  TsiMetWrit A1
  TsiRead A2
  PellStatus A1
  StuHomeLocation A2
  TsiWaiverExemption A1
  TsiWrite A2
  Zipcode A5.
CACHE.
EXECUTE.

