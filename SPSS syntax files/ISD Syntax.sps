* Encoding: UTF-8.
STRING HighSchool (A50).
COMPUTE HighSchool=HighSchool2.
If (HighSchool2= 'BENBROOK MIDDLEHIGH SCHOOL') HighSchool='BENBROOK MIDDLE/HIGH SCHOOL'.
EXECUTE.


string ISD (A30).
COMPUTE ISD="zUnknown ISD".
if (HighSchool = "ARLINGTON HIGH SCHOOL") ISD = "Arlington ISD". 
if (HighSchool = "ARLINGTON COLLEGIATE HS") ISD = "Arlington ISD". 
if (HighSchool = "AZLE HIGH SCHOOL") ISD = "Azle ISD". 
if (HighSchool = "C F BREWER HIGH SCHOOL") ISD = "White Settlement ISD". 
if (HighSchool = "CENTRAL HIGH SCHOOL") ISD = "Keller ISD". 
if (HighSchool = "CROWLEY HIGH SCHOOL") ISD = "Crowley ISD". 
if (HighSchool = "FAITH CHRISTIAN SCHOOL") ISD = "zUnknown ISD". 
if (HighSchool = "FELLOWSHIP ACADEMY") ISD = "zUnknown ISD". 
if (HighSchool = "FOSSIL RIDGE HIGH SCHOOL") ISD = "Keller ISD". 
if (HighSchool = "HARMONY SCIENCE ACADEMY") ISD = "zUnknown ISD". 
if (HighSchool = "JAMES BOWIE HIGH SCHOOL") ISD = "Arlington ISD". 
if (HighSchool = "JAMES W MARTIN HIGH SCHOOL") ISD = "Arlington ISD". 
if (HighSchool = "JUAN SEGUIN HIGH SCHOOL") ISD = "Arlington ISD". 
if (HighSchool = "KELLER HIGH SCHOOL") ISD = "Keller ISD".
if (HighSchool = "KENNEDALE HIGH SCHOOL") ISD = "Kennedale ISD".  
if (HighSchool = "LAMAR HIGH SCHOOL") ISD = "Arlington ISD". 
if (HighSchool = "MANSFIELD LEGACY HIGH SCHOOL") ISD = "Mansfield ISD". 
if (HighSchool = "Multiple High Schools") ISD = "zUnknown ISD". 
if (HighSchool = "No High School") ISD = "zUnknown ISD". 
if (HighSchool = "NORTH CROWLEY HIGH SCHOOL") ISD = "Crowley ISD". 
if (HighSchool = "NORTH SIDE HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "SAM HOUSTON HIGH SCHOOL") ISD = "Arlington ISD". 
if (HighSchool = "TEXAS ACADEMY BIOMEDICAL SCIENCES") ISD = "Fort Worth ISD". 
if (HighSchool = "TEXAS ACADEMY MATH SCIENCE") ISD = "zUnknown ISD". 
if (HighSchool = "TEXAS Unknown CEEB CODE") ISD = "zUnknown ISD". 
if (HighSchool = "TIMBER CREEK HIGH SCHOOL") ISD = "Keller ISD". 
if (HighSchool = "W E BOSWELL HIGH SCHOOL") ISD = "Eagle Mountain Saginaw ISD". 
if (HighSchool = "SAGINAW HIGH SCHOOL") ISD = "Eagle Mountain Saginaw ISD". 
if (HighSchool ="FELLOWSHIP CHRISTIAN ACADEMY" ) ISD = "zUnknown ISD". 
if (HighSchool ="OUT STATE HIGH SCHOOL" ) ISD = "zUnknown ISD". 
if (HighSchool ="HALTOM HIGH SCHOOL" ) ISD = "Birdville ISD". 



if (HighSchool ="BIRDVILLE HIGH SCHOOL") ISD= "Birdville ISD".
if (HighSchool ="CARROLL SENIOR HIGH SCHOOL") ISD="Carroll ISD".
if (HighSchool ="GRAPEVINE-COLLEYVILLE COLLEGIATE ACADEMY") ISD="Grapevine Colleyville ISD".
if (HighSchool ="COLLEYVILLE HERITAGE HIGH SCHOOL") ISD="Grapevine Colleyville ISD".
if (HighSchool ="DIAMOND HILL-JARVIS HIGH SCHOOL") ISD="Fort Worth ISD".
if (HighSchool ="FORT WORTH CHRISTIAN HIGH SCHOOL") ISD="zUnknown ISD".
if (HighSchool ="FRONTIER HIGH SCHOOL") ISD="Mansfield ISD".
if (HighSchool ="GRAPEVINE SENIOR HIGH SCHOOL") ISD="Grapevine Colleyville ISD".
if (HighSchool ="LAWRENCE D BELL HIGH SCHOOL") ISD="Hurst Euless Bedford ISD".
if (HighSchool ="MANSFIELD HIGH SCHOOL") ISD="Mansfield ISD".
if (HighSchool ="MANSFIELD LAKE RIDGE HIGH SCHOOL") ISD="Mansfield ISD".
if (HighSchool ="MANSFIELD SUMMIT HIGH SCHOOL") ISD="Mansfield ISD".
if (HighSchool ="MANSFIELD TIMBERVIEW HIGH SCHOOL") ISD="Mansfield ISD".
if (HighSchool ="POLYTECHNIC HIGH SCHOOL") ISD="Fort Worth ISD".
if (HighSchool ="RICHLAND SR HIGH SCHOOL") ISD="Birdville ISD".
if (HighSchool ="ROBERT L PASCHAL HIGH SCHOOL") ISD="Fort Worth ISD".
if (HighSchool ="TRIMBLE TECHNICAL HIGH SCHOOL") ISD="Fort Worth ISD".
if (HighSchool ="TRINITY HIGH SCHOOL") ISD="Hurst Euless Bedford ISD".

if (HighSchool ="O D WYATT SENIOR HIGH SCHOOL") ISD="Fort Worth ISD".
if (HighSchool ="SOUTH HILLS HIGH SCHOOL") ISD="Fort Worth ISD".
if (HighSchool ="SOUTHWEST HIGH SCHOOL") ISD="Fort Worth ISD".

if (HighSchool = "TEXAS HOME SCHOOL HS") ISD = "zUnknown ISD". 
if (HighSchool = "TEXAS VIRTUAL ACADEMY") ISD = "zUnknown ISD". 

if (HighSchool = "ALTERNATIVE EDUCATION CENTER") ISD = "zUnknown ISD". 
if (HighSchool = "ARLINGTON HEIGHTS CHRISTIAN ACADEM") ISD = "zUnknown ISD". 
if (HighSchool = "BOWIE HIGH SCHOOL") ISD = "zUnknown ISD". 
if (HighSchool = "CASTLEBERRY HIGH SCHOOL") ISD = "Castleberry ISD". 
if (HighSchool = "DUNBAR HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "EVERMAN JOE C BEAN HIGH SCHOOL") ISD = "Everman ISD". 
if (HighSchool = "AMON CARTER-RIVERSIDE HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "ARLINGTON HEIGHTS HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "CHISHOLM TRAIL HIGH SCHOOL") ISD = "Eagle Mountain Saginaw ISD". 
if (HighSchool = "COPPELL SENIOR HIGH SCHOOL") ISD = "Coppell ISD". 
if (HighSchool = "EASTERN HILLS HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "LAKE WORTH HIGH SCHOOL") ISD = "Lake Worth ISD". 
if (HighSchool = "BURLESON HIGH SCHOOL") ISD = "Burleson ISD". 
if (HighSchool = "JOSHUA HIGH SCHOOL") ISD = "Joshua ISD". 
if (HighSchool = "WESTERN HILLS HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "L V BERKNER HIGH SCHOOL") ISD = "Richardson ISD". 
if (HighSchool = "FWISD MARINE CREEK COLLEGIATE HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "A MACEO SMITH HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "BYRON NELSON HIGH SCHOOL") ISD = "Northwest ISD". 
if (HighSchool = "JOHN DUBISKI CAREER HIGH SCHOOL") ISD = "Grand Prairie ISD". 
if (HighSchool = "NORTHWEST HIGH SCHOOL") ISD = "Northwest ISD". 
if (HighSchool = "SOUTH GRAND PRAIRIE HIGH SCHOOL") ISD = "Grand Prairie ISD". 
if (HighSchool = "KENNEDALE ISD") ISD = "Kennedale ISD".  
if (HighSchool = "ALEDO HIGH SCHOOL") ISD = "Aledo ISD".  
if (HighSchool = "GRAND PRAIRIE HIGH SCHOOL") ISD = "Grand Prairie ISD". 
if (HighSchool = "BURLESON CENTENNIAL HIGH SCHOOL") ISD = "Burleson ISD". 
if (HighSchool = "MIDLOTHIAN HIGH SCHOOL") ISD = "Midlothian ISD". 
if (HighSchool = "WEATHERFORD HIGH SCHOOL") ISD = "Weatherford ISD". 
if (HighSchool = "CEDAR HILL HS") ISD = "Cedar Hill ISD". 
if (HighSchool = "DUNCANVILLE HIGH SCHOOL") ISD = "Duncanville ISD". 
if (HighSchool = "SUNSET HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "PLANO EAST SR HIGH SCHOOL") ISD = "Plano ISD". 
if (HighSchool = "FLOWER MOUND HIGH SCHOOL") ISD = "Lewisville ISD". 
if (HighSchool = "LAKEVIEW CENTENNIAL HIGH SCH") ISD = "Garland ISD". 
if (HighSchool = "NORTHSIDE HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "JOHN H GUYER HIGH SCHOOL") ISD = "Denton ISD". 
if (HighSchool = "NORTH MESQUITE HIGH SCHOOL") ISD = "Mesquite ISD". 
if (HighSchool = "RICHARDSON HIGH SCHOOL") ISD = "Richardson ISD". 
if (HighSchool = "JAMES M STEELE HIGH SCHOOL") ISD = "Northwest ISD". 
if (HighSchool = "LINCOLN HUMANITIES-COMMUNCATIONS") ISD = "Dallas ISD". 
if (HighSchool = "EDWARD S MARCUS HIGH SCHOOL") ISD = "Lewisville ISD". 
if (HighSchool = "FRANKLIN D ROOSEVELT HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "NORTH GARLAND HIGH SCHOOL") ISD = "Garland ISD". 
if (HighSchool = "PLANO SR HIGH SCHOOL") ISD = "Plano ISD". 
if (HighSchool = "BILLY C RYAN HIGH SCHOOL") ISD = "Denton ISD". 
if (HighSchool = "DENTON HIGH SCHOOL") ISD = "Denton ISD". 
if (HighSchool = "B T WASHINGTON HS PERFORM VISUAL") ISD = "Dallas ISD". 
if (HighSchool = "JAMES MADISON HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "WARREN T WHITE HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "HILLCREST HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "PLANO WEST SR HIGH SCHOOL") ISD = "Plano ISD". 
if (HighSchool = "R L TURNER HIGH SCHOOL") ISD = "Carrollton Farmers Branch ISD ". 
if (HighSchool = "SACHSE HIGH SCHOOL") ISD = "Garland ISD". 
if (HighSchool = "THOMAS JEFFERSON HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "W W SAMUELL HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "LAKE DALLAS HIGH SCHOOL") ISD = "Lake Dallas ISD". 
if (HighSchool = "CREEKVIEW HIGH SCHOOL") ISD = "Carrollton Farmers Branch ISD ". 
if (HighSchool = "H GRADY SPRUCE HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "LAKE HIGHLANDS HIGH SCHOOL") ISD = "Richardson ISD". 
if (HighSchool = "MESQUITE HIGH SCHOOL") ISD = "Mesquite ISD". 
if (HighSchool = "ROCKWALL HEATH HIGH SCHOOL") ISD = "Rockwall ISD". 
if (HighSchool = "ROCKWALL HIGH SCHOOL") ISD = "Rockwall ISD". 
if (HighSchool = "L G PINKSTON HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "NAAMAN FOREST HIGH SCHOOL") ISD = "Garland ISD". 
if (HighSchool = "POTEET HIGH SCHOOL") ISD = "Mesquite ISD". 
if (HighSchool = "SOUTH GARLAND HIGH SCHOOL") ISD = "Garland ISD". 
if (HighSchool = "WEST MESQUITE HIGH SCHOOL") ISD = "Mesquite ISD". 
if (HighSchool = "BRYAN ADAMS HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "FRED MOORE HIGH SCHOOL") ISD = "Denton ISD". 
if (HighSchool = "HEBRON HIGH SCHOOL") ISD = "Lewisville ISD". 
if (HighSchool = "NORTH DALLAS HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "FRISCO HIGH SCHOOL") ISD = "Frisco ISD". 
if (HighSchool = "DR JUSTIN WAKELAND HIGH SCHOOL") ISD = "Frisco ISD". 
if (HighSchool = "LIBERTY HIGH SCHOOL") ISD = "Frisco ISD". 
if (HighSchool = "CENTENNIAL HIGH SCHOOL") ISD = "Frisco ISD". 
if (HighSchool = "WOODROW WILSON HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "W H ADAMSON HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "BOOKER T WASHINGTON SENIOR HIGH S") ISD = "Dallas ISD". 
if (HighSchool = "GARLAND HIGH SCHOOL") ISD = "Garland ISD". 
if (HighSchool = "MESA HIGH SCHOOL") ISD = "White Settlement ISD". 
if (HighSchool = "CROSSROADS HIGH SCHOOL") ISD = "Burleson ISD". 
if (HighSchool = "NIMITZ HIGH SCHOOL") ISD = "Irving ISD". 
if (HighSchool = "MACARTHUR HIGH SCHOOL") ISD = "Irving ISD". 
if (HighSchool = "IRVING HIGH SCHOOL") ISD = "Irving ISD". 
if (HighSchool = "SKYLINE HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "VENTURE ALTERNATIVE HIGH SCHOOL") ISD = "Arlington ISD". 
if (HighSchool = "NEW LIVES SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "LEWISVILLE HIGH SCHOOL") ISD = "Lewisville ISD". 
if (HighSchool = "SOUTH OAK CLIFF HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "DAVID W CARTER HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "JUSTIN F KIMBALL HIGH SCHOOL") ISD = "Dallas ISD". 
if (HighSchool = "REACH HIGH SCHOOL") ISD = "Castleberry ISD". 
if (HighSchool = "WATSON LEARNING CENTER") ISD = "Eagle Mountain Saginaw ISD". 
if (HighSchool = "EVERMAN ACADEMY HIGH SCHOOL") ISD = "Everman ISD". 
if (HighSchool = "CROWLEY COLLEGIATE ACADEMY") ISD = "Crowley ISD". 
if (HighSchool = "TCC SO/FWISD COLLEGIATE HS") ISD = "Fort Worth ISD". 
if (HighSchool = "EVERMAN COLLEGIATE HIGH SCHOOL") ISD = "Everman ISD". 
if (HighSchool = "MANSFIELD COLLEGIATE HS IN TIMBERVIEW HS") ISD = "Mansfield ISD". 
if (HighSchool = "CLEBURNE HS") ISD = "Cleburne ISD". 
if (HighSchool = "BENBROOK MIDDLE/HIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "BENBROOK MIDDLEHIGH SCHOOL") ISD = "Fort Worth ISD". 
if (HighSchool = "YOUNG MENS LEADERSHIP ACADEMY") ISD = "Fort Worth ISD". 
if (HighSchool = "YOUNG WOMENS LEADERSHIP ACADEMY") ISD = "Fort Worth ISD". 
if (HighSchool= "FWISD MARINE CREEK COLLEGIATE HIGH SCHOOL") ISD= "Fort Worth ISD".
if (HighSchool = "V R EATON HIGH SCHOOL") ISD = "Northwest ISD". 
if (HighSchool = "ALVARADO HIGH SCHOOL") ISD = "Alvarado ISD". 
if (HighSchool = "ALL SAINTS EPISCOPAL SCHOOL") ISD = "yPrivate/Charter". 
if (HighSchool = "HARMONY SCIENCE ACADEMY") ISD = "yPrivate/Charter". 
if (HighSchool = "NOLAN CATHOLIC HIGH SCHOOL") ISD = "yPrivate/Charter". 
if (HighSchool = "WINFREE ACADEMY HIGH SCHOOL") ISD = "yPrivate/Charter". 
if (HighSchool = "INTERNATIONAL LEADERSHIP TEXAS KELLER HS") ISD = "yPrivate/Charter". 
if (HighSchool = "HARMONY SCHOOL INNOVATION") ISD = "yPrivate/Charter". 
if (HighSchool = "FELLOWSHIP ACADEMY") ISD = "yPrivate/Charter". 
if (HighSchool = "IL TEXAS ARLINGTON-GRAND PRAIRIE HS") ISD = "yPrivate/Charter". 
if (HighSchool = "CASSATA HIGH SCHOOL") ISD = "yPrivate/Charter". 
if (HighSchool = "FAITH CHRISTIAN SCHOOL") ISD = "yPrivate/Charter". 
if (HighSchool = "FORT WORTH CHRISTIAN HIGH SCHOOL") ISD = "yPrivate/Charter". 
if (HighSchool = "CHISHOLM TRAIL ACADEMY") ISD = "yPrivate/Charter". 
if (HighSchool = "BOWIE HIGH SCHOOL") ISD = "El Paso ISD". 
if (HighSchool = "SEGUIN HIGH SCHOOL") ISD = "Seguin ISD". 
if (HighSchool = "NAZARENE CHRISTIAN ACADEMY") ISD = "yPrivate/Charter". 
If (HighSchool= 'NORTHSIDE HIGH SCHOOL') ISD='Houston ISD'.
If (HighSchool= 'I M TERRELL HS') ISD='Fort Worth ISD'.
If (HighSchool= 'COLLEGIATE ACADEMY AT O. D. WYATT HIGH SCHOOL') ISD='Fort Worth ISD'.
EXECUTE.

Numeric IncludeISD.
COmpute IncludeISD=0.
if(ISD='Fort Worth ISD') IncludeISD=1.
if(ISD='Mansfield ISD') IncludeISD=1.
if(ISD='Arlington ISD') IncludeISD=1.
if(ISD='Keller ISD') IncludeISD=1.
if(ISD='Grapevine Colleyville ISD') IncludeISD=1.
if(ISD='Eagle Mountain Saginaw ISD') IncludeISD=1.
if(ISD='Carroll ISD') IncludeISD=1.
if(ISD='Hurst Euless Bedford ISD') IncludeISD=1.
if(ISD='Birdville ISD') IncludeISD=1.
if(ISD='Everman ISD') IncludeISD=1.
if(ISD='Crowley ISD') IncludeISD=1.
if(ISD='White Settlement ISD') IncludeISD=1.
if(ISD='Kennedale ISD') IncludeISD=1.
if(ISD='Castleberry ISD') IncludeISD=1.
if(ISD='Lake Worth ISD') IncludeISD=1.
if(ISD='Northwest ISD') IncludeISD=1.
if(ISD='Cleburne ISD') IncludeISD=1.
EXECUTE.

Numeric IncludeALL.
COmpute IncludeALL=0.
if(ISD='Fort Worth ISD') IncludeALL=1.
if(ISD='Mansfield ISD') IncludeALL=1.
if(ISD='Arlington ISD') IncludeALL=1.
if(ISD='Keller ISD') IncludeALL=1.
if(ISD='Grapevine Colleyville ISD') IncludeALL=1.
if(ISD='Eagle Mountain Saginaw ISD') IncludeALL=1.
if(ISD='Carroll ISD') IncludeALL=1.
if(ISD='Hurst Euless Bedford ISD') IncludeALL=1.
if(ISD='Birdville ISD') IncludeALL=1.
if(ISD='Everman ISD') IncludeALL=1.
if(ISD='Crowley ISD') IncludeALL=1.
if(ISD='White Settlement ISD') IncludeALL=1.
if(ISD='Kennedale ISD') IncludeALL=1.
if(ISD='Castleberry ISD') IncludeALL=1.
if(ISD='Lake Worth ISD') IncludeALL=1.
if(ISD='Northwest ISD') IncludeALL=1.
if(ISD='Cleburne ISD') IncludeALL=1.
IF(HighSchool='HARMONY SCIENCE ACADEMY') IncludeALL=1.
IF(HighSchool='NOLAN CATHOLIC HIGH SCHOOL') IncludeALL=1.
IF(HighSchool='WINFREE ACADEMY HIGH SCHOOL') IncludeALL=1.
IF(HighSchool='INTERNATIONAL LEADERSHIP TEXAS KELLER HS') IncludeALL=1.
IF(HighSchool='HARMONY SCHOOL INNOVATION') IncludeALL=1.
IF(HighSchool='FELLOWSHIP ACADEMY') IncludeALL=1.
IF(HighSchool='IL TEXAS ARLINGTON-GRAND PRAIRIE HS') IncludeALL=1.
IF(HighSchool='CASSATA HIGH SCHOOL') IncludeALL=1.
EXECUTE.












































































STRING ServiceArea (A2).
IF(ISD='Birdville ISD') ServiceArea='NE'.
IF(ISD='Carroll ISD') ServiceArea='NE'.
IF(ISD='Grapevine Colleyville ISD') ServiceArea='NE'.
IF(ISD='Hurst Euless Bedford ISD') ServiceArea='NE'.
IF(ISD='Azle ISD') ServiceArea='NW'.
IF(ISD='Eagle Mountain Saginaw ISD') ServiceArea='NW'.
IF(ISD='Fort Worth ISD' and HighSchool='DIAMOND HILL-JARVIS HIGH SCHOOL') ServiceArea='NW'.
IF(ISD='Lake Worth ISD') ServiceArea='NW'.
IF(ISD='Keller ISD') ServiceArea='NW'.
IF(ISD='Northwest ISD') ServiceArea='NW'.
IF(ISD='White Settlement ISD') ServiceArea='NW'.
IF(ISD='Crowley ISD') ServiceArea='SO'.
IF(ISD='Everman ISD') ServiceArea='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='BENBROOK MIDDLE/HIGH SCHOOL') ServiceArea='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='DUNBAR HIGH SCHOOL') ServiceArea='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='O D WYATT SENIOR HIGH SCHOOL') ServiceArea='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='POLYTECHNIC HIGH SCHOOL') ServiceArea='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='SOUTH HILLS HIGH SCHOOL') ServiceArea='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='SOUTHWEST HIGH SCHOOL') ServiceArea='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='YOUNG MENS LEADERSHIP ACADEMY') ServiceArea='SO'.
IF(ISD='Kennedale ISD') ServiceArea='SO'.
IF(ISD='Arlington ISD') ServiceArea='SE'.
IF(ISD='Mansfield ISD') ServiceArea='SE'.
IF(ISD='Castleberry ISD') ServiceArea='TR'.
IF(ISD='Cleburne ISD') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='AMON CARTER-RIVERSIDE HIGH SCHOOL') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='ARLINGTON HEIGHTS HIGH SCHOOL') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='EASTERN HILLS HIGH SCHOOL') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='NORTH SIDE HIGH SCHOOL') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='ROBERT L PASCHAL HIGH SCHOOL') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='TRIMBLE TECHNICAL HIGH SCHOOL') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='WESTERN HILLS HIGH SCHOOL') ServiceArea='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='YOUNG WOMENS LEADERSHIP ACADEMY') ServiceArea='TR'.
EXECUTE.

STRING ServiceAreawithPrivateCharter (A2).
IF(ISD='Birdville ISD') ServiceAreawithPrivateCharter='NE'.
IF(ISD='Carroll ISD') ServiceAreawithPrivateCharter='NE'.
IF(ISD='Grapevine Colleyville ISD') ServiceAreawithPrivateCharter='NE'.
IF(ISD='Hurst Euless Bedford ISD') ServiceAreawithPrivateCharter='NE'.
IF(ISD='Azle ISD') ServiceAreawithPrivateCharter='NW'.
IF(ISD='Eagle Mountain Saginaw ISD') ServiceAreawithPrivateCharter='NW'.
IF(ISD='Fort Worth ISD' and HighSchool='DIAMOND HILL-JARVIS HIGH SCHOOL') ServiceAreawithPrivateCharter='NW'.
IF(ISD='Lake Worth ISD') ServiceAreawithPrivateCharter='NW'.
IF(ISD='Keller ISD') ServiceAreawithPrivateCharter='NW'.
IF(ISD='Northwest ISD') ServiceAreawithPrivateCharter='NW'.
IF(ISD='White Settlement ISD') ServiceAreawithPrivateCharter='NW'.
IF(ISD='Crowley ISD') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Everman ISD') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='BENBROOK MIDDLE/HIGH SCHOOL') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='DUNBAR HIGH SCHOOL') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='O D WYATT SENIOR HIGH SCHOOL') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='POLYTECHNIC HIGH SCHOOL') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='SOUTH HILLS HIGH SCHOOL') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='SOUTHWEST HIGH SCHOOL') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Fort Worth ISD' and HighSchool='YOUNG MENS LEADERSHIP ACADEMY') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Kennedale ISD') ServiceAreawithPrivateCharter='SO'.
IF(ISD='Arlington ISD') ServiceAreawithPrivateCharter='SE'.
IF(ISD='Mansfield ISD') ServiceAreawithPrivateCharter='SE'.
IF(ISD='Castleberry ISD') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Cleburne ISD') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='AMON CARTER-RIVERSIDE HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='ARLINGTON HEIGHTS HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='EASTERN HILLS HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='NORTH SIDE HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='ROBERT L PASCHAL HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='TRIMBLE TECHNICAL HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='WESTERN HILLS HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
IF(ISD='Fort Worth ISD' and HighSchool='YOUNG WOMENS LEADERSHIP ACADEMY') ServiceAreawithPrivateCharter='TR'.
IF(HighSchool='HARMONY SCIENCE ACADEMY') ServiceAreawithPrivateCharter='NE'.
IF(HighSchool='NOLAN CATHOLIC HIGH SCHOOL') ServiceAreawithPrivateCharter='NE'.
IF(HighSchool='WINFREE ACADEMY HIGH SCHOOL') ServiceAreawithPrivateCharter='NE'.
IF(HighSchool='INTERNATIONAL LEADERSHIP TEXAS KELLER HS') ServiceAreawithPrivateCharter='NW'.
IF(HighSchool='HARMONY SCHOOL INNOVATION') ServiceAreawithPrivateCharter='SO'.
IF(HighSchool='FELLOWSHIP ACADEMY') ServiceAreawithPrivateCharter='SE'.
IF(HighSchool='IL TEXAS ARLINGTON-GRAND PRAIRIE HS') ServiceAreawithPrivateCharter='SE'.
IF(HighSchool='CASSATA HIGH SCHOOL') ServiceAreawithPrivateCharter='TR'.
EXECUTE.








