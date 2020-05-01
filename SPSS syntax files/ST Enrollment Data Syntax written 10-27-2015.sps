* Encoding: UTF-8.


GET DATA  /TYPE=TXT
  /FILE="T:\Enrollment Reports\Enrollments fall 2015\course enrollments fall 2015.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  Sysdate DATE11
  TermStartDate DATE11
  AcadYear A9
  Term A16
  Id A7
  AcadStanding A3
  StcStatusDate DATE11
  StcStatusReason A6
  CourseTypes A6
  NumberOfWeeks F2.0
  StcStatus A3
  SemesterHours F1.0
  CourseSectionsId A6
  ContactHours F2.0
  CreditType A3
  SecShortTitle A90
  AcadLevel A2
  Dept A5
  CourseName A30
  CourseSection A15
  SecCrossListed A3
  TopicCode A4
  Course A30
  TccConnect A3
  ResponsibleCampus A2
  ManagementGroup A5
  SecLocation A6
  HighSchAssoc A21
  HighSchoolName A72
  Section F5.0
  SecSynonym F7.0
  SecStatus A3
  SecStatusDate DATE11
  FacultyId A7
  InstrMethod A9
  SecInstrMeth A9
  SecStartDate DATE11
  SecEndDate DATE11
  ReplacedCode A1
  SecCensusDate DATE11
  GradeExpireDate DATE11
  LabFlag A3
  AuditFlag A3
  Gender A1
  Ethnicity A2
  MiddleInitial A1
  Suffix A3
  Subject A4
  SectionId A6
  EthnicDescr A25
  Ethnics A19
  Races A25
  StpeOverloadPetition A1
  StalClass A5
  FatherEducLevel A6
  MotherEducLevel A6
  LastTccTerm A6
  SecOtherRestrictions A1
  StcUser10 A1
  Va A1
  SecUser17 A18
  HighSchool A35
  GradeReqdDropDate DATE11
  CensusDate DATE11
  FinalGrade A2
  VerifiedGrade A2
  Street1 A30
  Street2 A8
  City A20
  State A2
  Zip A10
  HomePhone A12
  EmailAddress A36
  BirthDate DATE11
  LastName A18
  FirstName A9
  CourseCategory A4
  CampusName A2
  PrivacyFlag A2.
CACHE.
EXECUTE.
DATASET NAME DataSet5 WINDOW=FRONT.
