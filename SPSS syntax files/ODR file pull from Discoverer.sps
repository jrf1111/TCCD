*ODR File pull.
GET DATA
  /TYPE=TXT
  /FILE="T:\ODR_Files_from_Discoverer\ODR 2013SP 03-07-2013.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  StudentCohortsId F7.0
  TermId A6
  AllStudents A1
  AuditOnly A1
  CreditNoauditNodual A1
  DualCreditOnly F1.0
  FticNoauditNodual A1
  FticNoauditNodualDegreeseek A1
  Lupdate A11
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
  CoreComplete F1.0
  DevCourses A1
  DevEdOnly A1
  DevEsol F1.0
  DevMath A1
  DevRead A1
  DevWrit A1
  Ethnic F2.0
  EthDesc A29
  FtPt A2
  Gender A1
  GpaSUM F5.3
  GradAa F1.0
  GradAas F1.0
  GradAat F1.0
  GradCrt F1.0
  GradFos F1.0
  HighSchoolId F7.0
  HighSchoolName A33
  Hispanic A3
  HispDesc A19
  Race A2
  RaceDesc A25
  ReportType A3
  StandingProbation F1.0
  StandingSuspension F1.0
  StudentsId F7.0
  TermStanding F4.0
  TotalCh F3.0
  TotalChCmpl F2.0
  TotalChCmplDevmath F1.0
  TotalChCmplDevwrit F1.0
  TotalChDevmath F2.0
  TotalChDevwrit F2.0
  TotalChPassing F2.0
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
  TsiWaiverExemption A1
  TsiWrite A2
  Zipcode F5.0.
CACHE.
EXECUTE.

