

GET DATA
  /TYPE=TXT
  /FILE="T:\_Darren_Ray\data_requests\0620\Retention table 2010 to 2012 ATD FTIC only.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  OdrStudentsId A7
  OdrTermId A6
  OdrReportType A3
  OdrGender A1
  OdrEthnic A2
  OdrHispanic A3
  OdrRace A2
  OdrAge A2
  OdrHighSchoolId A7
  OdrAcadProgramId A12
  OdrZipcode A5
  OdrCompleteWithdrawal A1
  OdrFtPt A2
  OdrTsiMet A1
  OdrTsiMetMath A1
  OdrTsiMetRead A1
  OdrTsiMetWrit A1
  OdrTsiWaiverExemption A1
  OdrCollegeReady A1
  OdrCollegeReadyMath A1
  OdrCollegeReadyRead A1
  OdrCollegeReadyWrit A1
  OdrAdmitStatus A3
  OdrDevEdOnly A1
  OdrCollLevelCourses A1
  OdrCollLevelMath A1
  OdrCollLevelRead A1
  OdrCollLevelWrit A1
  OdrDevCourses A1
  OdrDevMath A1
  OdrDevRead A1
  OdrDevWrit A1
  OdrDevEsol A1
  OdrTotalNbrEnrollments A1
  OdrTotalCh A3
  OdrTotalChCmpl A1
  OdrTotalChPassing A1
  OdrTotalChDevmath A2
  OdrTotalChCmplDevmath A1
  OdrTotalChPassingDevmath A1
  OdrTotalChDevread A2
  OdrTotalChCmplDevread A1
  OdrTotalChPassingDevread A1
  OdrTotalChDevwrit A2
  OdrTotalChCmplDevwrit A1
  OdrTotalChPassingDevwrit A1
  OdrTotalSemHrs A2
  OdrTermStanding A4
  OdrStandingProbation A1
  OdrStandingSuspension A1
  OdrGpa A5
  OdrGradAa A1
  OdrGradAas A1
  OdrGradAat A1
  OdrGradCrt A1
  OdrGradFos A1
  OdrCoreComplete A1
  OdrLupdate A11
  OdrTsiMath A2
  OdrTsiRead A2
  OdrTsiWrite A2
  OdrStuHomeLocation A2
  OdrPellGrant A1
  ScAllStudents A1
  ScAuditOnly A1
  ScCreditNoauditNodual A1
  ScDualCreditOnly A1
  ScFticNoauditNodual A1
  ScFticNoauditNodualDegseek A1
  ScReturningAndTransfer A1
  ScLupdate A11
  EosGpa A5
  EosAcadProgramId A12
  EosCreditHrs A2
  EosStuHomeLocation A2
  CrdPriorDualCredit A1
  CrdResidency A4
  CrdEthnic A25
  CrdEnrollDate A11
  CrdEnrollDays A2
  CrdIntent A5
  CrdDevReadSuccess A1
  CrdDevWritSuccess A1
  CrdDevMathSuccess A1
  CrdDevStscSuccess A1
  CrdEnrollStatus A2
  CrdKillCrsCnt A1
  CrdKillCrsYCnt A1
  CrdKillCrsNCnt A1
  CrdCourseDlrngCount A1
  CrdCourseWkendCount A1
  CrdCourseTradsCount A1
  CrdAdvised A1
  CrdCampusCount A1
  CrdSec8WeeksCnt A1
  CrdSec16WeeksCnt A1
  CrdSecOthWeeksCnt A1
  CrdNightCrsCnt A1
  CrdDayCrsCnt A1
  CrdWkendCrsCnt A1
  CrdNsorComplete A1
  CrdCollCrsCnt A1
  CrdDevCrsCnt A1
  CrdNsorOnly A1
  CrdCreateUser A4
  CrdCreated A11
  CrdUpdateUser A1
  CrdUpdated A1.
CACHE.
EXECUTE.
DATASET NAME DataSet13 WINDOW=FRONT.
