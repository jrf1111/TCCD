

GET DATA
  /TYPE=TXT
  /FILE="T:\ODR\EOS from Discoverer\EOS 2014SP.csv"
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
  GradFos F1.0
  HighSchoolId A7
  HighSchoolName A33
  Hispanic A3
  HispDesc A19
  Race A2
  RaceDesc A25
  ReportType A3
  StandingProbation A1
  StandingSuspension A1
  StudentsId F7.0
  TermStanding A4
  TotalCh F3.0
  TotalChCmpl F3.0
  TotalChCmplDevmath F2.0
  TotalChCmplDevwrit F2.0
  TotalChDevmath F2.0
  TotalChDevwrit F2.0
  TotalChPassing F3.0
  TotalChPassingDevmath F2.0
  TotalChPassingDevwrit F2.0
  TotalNbrEnrollments F1.0
  TotalSemHrs F2.0
  TsiMath A2
  TsiMet A1
  TsiMetMath A1
  TsiMetRead A1
  TsiMetWrit A1
  TsiRead A2
  TsiWaiverExemption A1
  PellStatus A1
  StuHomeLocation A2
  TsiWrite A2
  Zipcode F5.0.
CACHE.
EXECUTE.
DATASET NAME DataSet26 WINDOW=FRONT.
