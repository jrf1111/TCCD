* Encoding: UTF-8.
*THIS CODE USES INTERNAL DEFINTION.  FIRST GEN IF BOTH MOM AND DAD HAVE NO COLLEGE.
*This definition is mainly used internally for reports such as the exetended campus profiles.

*Defintions:
M-NOHS - Mother - No High School
M-SMHS - Mother - Some High School
M-HSGD - Mother - HS Grad or GED
M-SMCL - Mother - Some College
M-CLBD - Mother- Bachelor's Degree
M-CLAD - Mother - Advanced Degree
M-NRSP - Mother - No Response



Numeric FatherLevel.
IF(FatherEducLevel=" ") FatherLevel=3.
IF(FatherEducLevel="F-CLAD") FatherLevel=1.
IF(FatherEducLevel="F-CLBD") FatherLevel=1.
IF(FatherEducLevel="F-HSGD") FatherLevel=2.
IF(FatherEducLevel="F-NOHS") FatherLevel=2.
IF(FatherEducLevel="F-NRSP") FatherLevel=3.
IF(FatherEducLevel="F-SMCL") FatherLevel=1.
IF(FatherEducLevel="F-SMHS") FatherLevel=2.
EXECUTE.

VALUE LABELS FatherLevel
1 'College'
2 'No College'
3 'Unknown'.
EXECUTE.



Numeric MotherLevel.
IF(MotherEducLevel=" ") MotherLevel=3.
IF(MotherEducLevel="M-CLAD") MotherLevel=1.
IF(MotherEducLevel="M-CLBD") MotherLevel=1.
IF(MotherEducLevel="M-HSGD") MotherLevel=2.
IF(MotherEducLevel="M-NOHS") MotherLevel=2.
IF(MotherEducLevel="M-NRSP") MotherLevel=3.
IF(MotherEducLevel="M-SMCL") MotherLevel=1.
IF(MotherEducLevel="M-SMHS") MotherLevel=2.
EXECUTE.

VALUE LABELS MotherLevel
1 'College'
2 'No College'
3 'Unknown'.
EXECUTE.


String FirstGen (A10).
IF(FatherLevel=1 and MotherLevel=1) FirstGen='No'.
IF(FatherLevel=1 and MotherLevel=2) FirstGen='No'.
IF(FatherLevel=1 and MotherLevel=3) FirstGen='No'.
IF(FatherLevel=2 and MotherLevel=1) FirstGen='No'.
IF(FatherLevel=2 and MotherLevel=2) FirstGen='aYes'.
IF(FatherLevel=2 and MotherLevel=3) FirstGen='zUnknown'.
IF(FatherLevel=3 and MotherLevel=1) FirstGen='No'.
IF(FatherLevel=3 and MotherLevel=2) FirstGen='zUnknown'.
IF(FatherLevel=3 and MotherLevel=3) FirstGen='zUnknown'.
EXECUTE.


***************************************************************************************************************************** FED.
.
* THIS USES FED DEFINTION.  FIRST GEN IF BOTH MOM & DAD DO NOT HAVE BACHELORS.
*This definition is used for grant requests.
*Note that Some College has been recoded as "No College".



Numeric FatherLevel.
IF(FatherEducLevel=" ") FatherLevel=3.
IF(FatherEducLevel="F-CLAD") FatherLevel=1.
IF(FatherEducLevel="F-CLBD") FatherLevel=1.
IF(FatherEducLevel="F-HSGD") FatherLevel=2.
IF(FatherEducLevel="F-NOHS") FatherLevel=2.
IF(FatherEducLevel="F-NRSP") FatherLevel=3.
IF(FatherEducLevel="F-SMCL") FatherLevel=2.
IF(FatherEducLevel="F-SMHS") FatherLevel=2.
EXECUTE.

VALUE LABELS FatherLevel
1 'College'
2 'No College'
3 'Unknown'.
EXECUTE.



Numeric MotherLevel.
IF(MotherEducLevel=" ") MotherLevel=3.
IF(MotherEducLevel="M-CLAD") MotherLevel=1.
IF(MotherEducLevel="M-CLBD") MotherLevel=1.
IF(MotherEducLevel="M-HSGD") MotherLevel=2.
IF(MotherEducLevel="M-NOHS") MotherLevel=2.
IF(MotherEducLevel="M-NRSP") MotherLevel=3.
IF(MotherEducLevel="M-SMCL") MotherLevel=2.
IF(MotherEducLevel="M-SMHS") MotherLevel=2.
EXECUTE.

VALUE LABELS MotherLevel
1 'College'
2 'No College'
3 'Unknown'.
EXECUTE.


String FirstGen (A10).
IF(FatherLevel=1 and MotherLevel=1) FirstGen='No'.
IF(FatherLevel=1 and MotherLevel=2) FirstGen='No'.
IF(FatherLevel=1 and MotherLevel=3) FirstGen='No'.
IF(FatherLevel=2 and MotherLevel=1) FirstGen='No'.
IF(FatherLevel=2 and MotherLevel=2) FirstGen='aYes'.
IF(FatherLevel=2 and MotherLevel=3) FirstGen='zUnknown'.
IF(FatherLevel=3 and MotherLevel=1) FirstGen='No'.
IF(FatherLevel=3 and MotherLevel=2) FirstGen='zUnknown'.
IF(FatherLevel=3 and MotherLevel=3) FirstGen='zUnknown'.
EXECUTE.

