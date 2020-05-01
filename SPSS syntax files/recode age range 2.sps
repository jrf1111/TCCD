
Recode Age into ranges  These match STAT Handbook Age ranges. 


RECODE Age (Lowest thru 20.9999=1) (21.00 thru 25.9999=2) (26.000 thru 30.9999=3) (31.00 thru 
    35.9999=4) (36.000 thru 40.9999=5) (41 thru Highest=6) INTO Age_range.
VARIABLE LABELS  Age_range 'Age Range'.
EXECUTE.

Value Labels Age_range
1 'Under 21'
2 '21 to 25'
3 '26 to 30'
4 '31 to 35'
5 '36 to 40'
6 ' Over 40'.




*Recode Age into ranges  These do not match STAT Handbook Age ranges. 


RECODE Age (Lowest thru 20.9999=1) (21.00 thru 25.9999=2) (26.000 thru 30.9999=3) (31.00 thru 
    35.9999=4) (36.000 thru 40.9999=5) (41 thru 50.9999=6) (51.000 thru 59.99=7) (60.000 thru highest=8) INTO Age_range2.
VARIABLE LABELS  Age_range2 'Age Range2'.
EXECUTE.

Value Labels Age_range2
1 'Under 21'
2 '21 to 25'
3 '26 to 30'
4 '31 to 35'
5 '36 to 40'
6 '41 to 50'
7 '51 to 60'
8 ' Over 60'.


