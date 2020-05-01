* Encoding: windows-1252.
*These age calculation are used when a specific month and year or month day and year are known. This calcuation is from one known date to another known date. Not from today's date.
*The reason being that one often wants to know the date at the time the file was created not verus todays date.

*the usual formula is COMPUTE  age=(((((365.25*(Year-1))+(Month*30.4)+(Day))-(((BIRTHMO-1)*30.4)+(BIRTHDA)+((BIRTHYR-1)*365.25))))/365.25).


*age computation when you have month and year.

COMPUTE age=(((((365.25*(2012-1))+(9*30.4))-(((BIRTHMO-1)*30.4)+((BIRTHYR-1)*365.25))))/365.25).
Execute.


*age computation when you have day, month, and year.

COMPUTE  age2=(((((365.25*(2012-1))+(9*30.4)+(24))-(((BIRTHMO-1)*30.4)+(BIRTHDA)+((BIRTHYR-1)*365.25))))/365.25).
Execute.

RECODE New_Age (Lowest thru 20.99999='20 or younger') (21 thru 25.99999='21 to 25') (26 thru 
    Highest='Over 25') INTO age_group.
VARIABLE LABELS  age_group 'age_group'.
EXECUTE.
