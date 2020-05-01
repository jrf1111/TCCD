* Encoding: UTF-8.

*Convert Terms to a numeric value for calculations.
Numeric Term_num (F2.0).
RECODE TERM_ID ('2004SP'=1) ('2004SU'=2) ('2004FL'=3) ('2005SP'=4) ('2005SU'=5) ('2005FL'=6) 
    ('2006SP'=7) ('2006SU'=8) ('2006FL'=9) ('2007SP'=10) ('2007SU'=11) ('2007FL'=12) ('2008SP'=13) 
    ('2008SU'=14) ('2008FL'=15) ('2009SP'=16) ('2009SU'=17) ('2009FL'=18) ('2010SP'=19) 
    ('2010SU'=20) ('2010FL'=21) ('2011SP'=22) ('2011SU'=23) ('2011FL'=24) ('2012SP'=25) 
    ('2012SU'=26) ('2012FL'=27) ('2013SP'=28) ('2013SU'=29) ('2013FL'=30)  ('2014SP'=31) ('2014SU'=32)
 ('2014FL'=33) ('2015SP'=34) ('2015SU'=35) ('2015FL'=36) ('2016SP'=37) ('2016SU'=38) ('2016FL' =39) ('2017SP'=40) 
('2017SU'=41) ('2017FL'=42) ('2018SP'=43) ('2018SU'=44)  ('2018FL'=45)  ('2019SP'=46) ('2019SU'=47) ('2019FL'=48) ('2020SP'=49) 
('2020SU'=50) ('2016SP'=37)  ('2016SU'=38) ('2016FL'=39) ('2017SP'=40) ('2017SU'=41) ('2017FL'=42) ('2018SP'=43) ('2018SU'=43) ('2018FL'=44) INTO Term_num.
VARIABLE LABELS  Term_num 'Term (numeric)'.
EXECUTE.

*ConvertSCT term to TERM.
String Term (A6).
COMPUTE Term=CHAR.SUBSTR(TERM_ID,5,2).
VARIABLE LABELS  Term 'Term (FL SP SU)'.
EXECUTE.

*Recodes to simpler to read English.
RECODE Term ('FL'='Fall') ('SP'='Spring') ('SU'='Summer').
EXECUTE.

*If the variable "TERMID" has NO space in it use this one.
*Convert Terms to a numeric value for calculations.
Numeric Term_num (F2.0).
RECODE TERMID ('2004SP'=1) ('2004SU'=2) ('2004FL'=3) ('2005SP'=4) ('2005SU'=5) ('2005FL'=6) 
    ('2006SP'=7) ('2006SU'=8) ('2006FL'=9) ('2007SP'=10) ('2007SU'=11) ('2007FL'=12) ('2008SP'=13) 
    ('2008SU'=14) ('2008FL'=15) ('2009SP'=16) ('2009SU'=17) ('2009FL'=18) ('2010SP'=19) 
    ('2010SU'=20) ('2010FL'=21) ('2011SP'=22) ('2011SU'=23) ('2011FL'=24) ('2012SP'=25) 
    ('2012SU'=26) ('2012FL'=27) ('2013SP'=28) ('2013SU'=29) ('2013FL'=30)  ('2014SP'=31)
 ('2014SU'=32) ('2014FL'=33) ('2015SP'=34)('2015SU'=35) ('2015FL'=36) ('2016SP'=37) ('2016SU'=38) ('2016FL' =39)
 ('2017SP'=40) ('2017SU'=41) ('2017FL'=42) ('2018SP'=43) ('2018SU'=44)  ('2018FL'=45)  ('2019SP'=46) ('2019SU'=47) ('2019FL'=48) ('2020SP'=49) ('2020SU'=50) ('2016SP'=37) ('2016SU'=38) ('2016FL'=39) ('2017SP'=40) ('2017SU'=41)
('2017FL'=42) ('2018SP'=43) ('2018SU'=43) ('2018FL'=44) ('2019SP'=45) ('2019SU'=46) ('2019FL'=46)
 INTO Term_num.
VARIABLE LABELS  Term_num 'Term (numeric)'.
EXECUTE.

*ConvertSCT term to TERM.
*Convert Terms to a numeric value for calculations.
Numeric Term_num(F2.0).
RECODE StcTerm ('2004SP'=1) ('2004SU'=2) ('2004FL'=3) ('2005SP'=4) ('2005SU'=5) ('2005FL'=6) 
    ('2006SP'=7) ('2006SU'=8) ('2006FL'=9) ('2007SP'=10) ('2007SU'=11) ('2007FL'=12) ('2008SP'=13) 
    ('2008SU'=14) ('2008FL'=15) ('2009SP'=16) ('2009SU'=17) ('2009FL'=18) ('2010SP'=19) 
    ('2010SU'=20) ('2010FL'=21) ('2011SP'=22) ('2011SU'=23) ('2011FL'=24) ('2012SP'=25) 
    ('2012SU'=26) ('2012FL'=27) ('2013SP'=28) ('2013SU'=29) ('2013FL'=30)  ('2014SP'=31) ('2014SU'=32) ('2014FL'=33) 
 ('2015SP'=34) ('2015SU'=35) ('2015FL'=36) ('2016SP'=37) ('2016SU'=38) ('2016FL' =39) ('2017SP'=40) ('2017SU'=41) ('2017FL'=42) 
('2018SP'=43) ('2018SU'=44)  ('2018FL'=45)  ('2019SP'=46) ('2019SU'=47) ('2019FL'=48) ('2020SP'=49) ('2020SU'=50) INTO Term_num.
VARIABLE LABELS  Term_num 'Term (numeric)'.
EXECUTE.

*Convert ACAD_term to TERM.
*Convert Terms to a numeric value for calculations.
Numeric Term_num(F2.0).
RECODE Acad_Term ('2004SP'=1) ('2004SU'=2) ('2004FL'=3) ('2005SP'=4) ('2005SU'=5) ('2005FL'=6) 
    ('2006SP'=7) ('2006SU'=8) ('2006FL'=9) ('2007SP'=10) ('2007SU'=11) ('2007FL'=12) ('2008SP'=13) 
    ('2008SU'=14) ('2008FL'=15) ('2009SP'=16) ('2009SU'=17) ('2009FL'=18) ('2010SP'=19) 
    ('2010SU'=20) ('2010FL'=21) ('2011SP'=22) ('2011SU'=23) ('2011FL'=24) ('2012SP'=25) 
    ('2012SU'=26) ('2012FL'=27) ('2013SP'=28) ('2013SU'=29) ('2013FL'=30)  ('2014SP'=31)
 ('2014SU'=32) ('2014FL'=33) ('2015SP'=34) ('2015SU'=35) ('2015FL'=36) ('2016SP'=37) ('2016SU'=38) ('2016FL' =39)
 ('2017SP'=40) ('2017SU'=41) ('2017FL'=42) ('2018SP'=43) ('2018SU'=44)  ('2018FL'=45)  ('2019SP'=46) ('2019SU'=47) 
('2019FL'=48) ('2020SP'=49) ('2020SU'=50) ('2016SP'=37) ('2016SU'=38) ('2016FL' =39) ('2017SP'=40) ('2017SU'=41) ('2017FL'=42) ('2018SP'=43) ('2018SU'=44)
 ('2018FL'=45)  ('2019SP'=46) ('2019SU'=47) ('2019FL'=48) ('2020SP'=49) ('2020SU'=50) INTO DegreeTerm_num.
VARIABLE LABELS  DegreeTerm_num 'Degree Term (numeric)'.
EXECUTE.

*Convert ACADterm to TERM*.
*Convert Terms to a numeric value for calculations.
Numeric Term_num(F2.0).
RECODE AcadTerm ('2004SP'=1) ('2004SU'=2) ('2004FL'=3) ('2005SP'=4) ('2005SU'=5) ('2005FL'=6) 
    ('2006SP'=7) ('2006SU'=8) ('2006FL'=9) ('2007SP'=10) ('2007SU'=11) ('2007FL'=12) ('2008SP'=13) 
    ('2008SU'=14) ('2008FL'=15) ('2009SP'=16) ('2009SU'=17) ('2009FL'=18) ('2010SP'=19) 
    ('2010SU'=20) ('2010FL'=21) ('2011SP'=22) ('2011SU'=23) ('2011FL'=24) ('2012SP'=25) 
    ('2012SU'=26) ('2012FL'=27) ('2013SP'=28) ('2013SU'=29) ('2013FL'=30)  ('2014SP'=31) ('2014SU'=32) ('2014FL'=33)
 ('2015SP'=34) ('2015SU'=35) ('2015FL'=36) ('2016SP'=37) ('2016SU'=38) ('2016FL' =39) ('2017SP'=40) ('2017SU'=41) ('2017FL'=42) ('2018SP'=43) ('2018SU'=44)  ('2018FL'=45)
 ('2019SP'=46) ('2019SU'=47) ('2019FL'=48) ('2020SP'=49) ('2020SU'=50) INTO DegreeTerm_num.
VARIABLE LABELS  DegreeTerm_num 'Degree Term (numeric)'.
EXECUTE.

String Term (A6).
COMPUTE Term=CHAR.SUBSTR(Acad_Term,5,2).
VARIABLE LABELS  Term 'Term (FL SP SU)'.
EXECUTE.

*Recodes to simpler to read English.
RECODE Term ('FL'='Fall') ('SP'='Spring') ('SU'='Summer').
EXECUTE.



