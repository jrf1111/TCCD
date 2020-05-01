* Encoding: UTF-8.


GET DATA  /TYPE=TXT
  /FILE="T:\MDRC Projects\ABE Study 2015\Data fall 2015\Historical data\ALL CE 2014Q1 Q2 2015Q1Q3Q4.csv"
  /ENCODING='Locale'
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
  Term A6
  Id A7
  AcadStanding A1
  StcStatusDate DATE11
  StcStatusReason A2
  CourseTypes A2
  NumberOfWeeks F2.0
  StcStatus A1
  SemesterHours F1.0
  CourseSectionsId A6
  ContactHours F2.0
  CreditType A1
  SecShortTitle A30
  AcadLevel A2
  Dept A5
  CourseName A10
  CourseSection A16
  SecCrossListed A1
  TopicCode A4
  Course A10
  TccConnect A1
  ResponsibleCampus A2
  ManagementGroup A5
  SecLocation A2
  HighSchAssoc A7
  HighSchoolName A24
  Section F5.0
  SecSynonym F7.0
  SecStatus A1
  SecStatusDate A11
  FacultyId F7.0
  InstrMethod A3
  SecInstrMeth A3
  SecStartDate A11
  SecEndDate A11
  ReplacedCode A1
  SecCensusDate A11
  GradeExpireDate DATE11
  LabFlag A1
  AuditFlag A1
  Gender A1
  Ethnicity A2
  MiddleInitial A1
  Suffix A2
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
  SecOtherRestrictions A5
  StcUser10 A1
  Va A1
  SecUser17 A18
  HighSchool A35
  GradeReqdDropDate DATE11
  CensusDate DATE11
  FinalGrade A2
  VerifiedGrade A2
  Street1 A30
  Street2 A1
  City A20
  State A2
  Zip A10
  HomePhone A12
  EmailAddress A36
  BirthDate A9
  LastName A18
  FirstName A11
  CourseCategory A4
  CampusName A2
  PrivacyFlag A2.
CACHE.
EXECUTE.



*Other enrollment Syntax.

GET DATA  /TYPE=TXT
  /FILE="T:\MDRC Projects\ABE Study 2015\Data fall 2015\Historical data\ALL CE 2014Q1 Q2 "+
    "2015Q1Q3Q4.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  Term A6
  Sysdate DATE11
  TermStartDate DATE11
  AcadYear A3
  StudentcohortId A7
  AcadStanding A1
  StcStatusDate DATE11
  StcStatusReason A1
  CourseTypes A2
  NumberOfWeeks A2
  StcStatus A1
  SemesterHours A1
  CourseSectionsId F6.0
  ContactHours F3.0
  CreditType A1
  SecShortTitle A30
  AcadLevel A2
  Dept A5
  CourseName A9
  CourseSection A15
  SecCrossListed A1
  TopicCode A4
  Course A9
  TccConnect A1
  ResponsibleCampus A2
  ManagementGroup A5
  SecLocation A2
  HighSchAssoc A1
  HighSchoolName A1
  Section A5
  SecSynonym A7
  SecStatus A1
  SecStatusDate DATE11
  FacultyId A7
  InstrMethod A3
  SecInstrMeth A3
  SecStartDate DATE11
  SecEndDate DATE11
  ReplacedCode A1
  SecCensusDate DATE11
  GradeExpireDate A1
  LabFlag A1
  AuditFlag A1
  Gender A1
  Ethnicity A2
  MiddleInitial A1
  Suffix A2
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
  HighSchool A32
  GradeReqdDropDate DATE11
  CensusDate DATE11
  FinalGrade A2
  VerifiedGrade A2
  Street1 A30
  Street2 A1
  City A20
  State A2
  Zip A10
  HomePhone A12
  EmailAddress A35
  BirthDate DATE11
  LastName A12
  FirstName A17
  CourseCategory A4
  CampusName A2
  PrivacyFlag A2.
CACHE.
EXECUTE.
DATASET NAME DataSet38 WINDOW=FRONT.
