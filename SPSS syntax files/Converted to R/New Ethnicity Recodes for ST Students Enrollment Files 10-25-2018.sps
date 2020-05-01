* Encoding: UTF-8.
*New Race - Ethnicity Definition 07-19-2017 TCCD.

STRING  newEthnicity (A1).
DO IF Races='International'.
compute newEthnicity='6'.
else IF Ethnics='Hispanic/Latino'. 
compute newEthnicity='3'.
else IF ((Ethnics='Non Hispanic/Latino' or Ethnics='Ethnicity Unknown' or Ethnics="")   AND Races='White').
 compute newEthnicity = '1'.
else IF ((Ethnics='Non Hispanic/Latino' or Ethnics='Ethnicity Unknown'  or Ethnics="")  AND Races='Black or African American').
compute newEthnicity='2'.
else IF ((Ethnics='Non Hispanic/Latino' or Ethnics='Ethnicity Unknown'  or Ethnics="") AND Races='Asian').
compute newEthnicity='4'.
else IF ((Ethnics='Non Hispanic/Latino' or Ethnics='Ethnicity Unknown' or Ethnics="")  AND Races='American/Alaska Native').
compute newEthnicity='5'.
else IF ((Ethnics='Non Hispanic/Latino' or Ethnics='Ethnicity Unknown'  or Ethnics="") AND Races='Hawaiian/Pacific Islander').
compute newEthnicity='8'.
else IF ((Ethnics='Non Hispanic/Latino' or Ethnics='Ethnicity Unknown'  or Ethnics="")  AND Races='Race Unknown').
compute newEthnicity='7'.
else IF ((Ethnics='Non Hispanic/Latino' or Ethnics='Ethnicity Unknown'  or Ethnics="")  AND Races='Multi').
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



STRING new_ethnic_group (A28).
RECODE newEthnicity ('1'='1. White') ('2'='2. Black / African American') 
    ('3'='3. Hispanic Latino') (ELSE='4. Other') INTO new_ethnic_group.
VARIABLE LABELS  new_ethnic_group 'new_ethnic_group'.
EXECUTE.

String Test2 (A1).
IF Races='International'.
compute test2='6'.
 IF Ethnics='Hispanic/Latino'. 
compute test2='3'.
Execute.


STRING  newEthnicity3 (A1).
DO IF Races='International'.
compute newEthnicity3='6'.
else IF Ethnics='Hispanic/Latino'. 
compute newEthnicity3='3'.
else IF  Races='White'.
 compute newEthnicity3 = '1'.
else IF Races='Black or African American'.
compute newEthnicity3='2'.
else IF Races='Asian'.
compute newEthnicity3='4'.
else IF Races='American/Alaska Native'.
compute newEthnicity3='5'.
else IF Races='Hawaiian/Pacific Islander'.
compute newEthnicity3='8'.
else IF Races='Race Unknown'.
compute newEthnicity3='7'.
else IF Races='Multi'.
compute newEthnicity3 = '9'.
else if Races= 'ELF'.
Compute newEthnicity3='10'.
ELSE.
Compute newEthnicity3='7'.
end IF.
VARIABLE LABELS  newEthnicity3 'New Ethnicity3'.
EXECUTE.

Value Labels  newEthnicity3
1 'White'
2 'Black / African American'
3 'Hispanic Latino'
4 'Asian'
5 'American Indian / Alaska Native'
6 'International'
7 'Unknown / Not Reported'
8 'Native Hawaiian / Pacific Islander'
9 'Multiracial'
10 'ELF'.
Execute.
