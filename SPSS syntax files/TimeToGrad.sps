* Encoding: UTF-8.
STRING GradTerm (A6).
COMPUTE GradTerm=Term.
If(CHAR.SUBSTR(Term,5,2)='Q1') GradTerm=CONCAT(CHAR.SUBSTR(Term,1,4),"FL").
If(CHAR.SUBSTR(Term,5,2)='Q2' or CHAR.SUBSTR(Term,5,2)='Q3'  ) GradTerm=CONCAT(CHAR.SUBSTR(Term,1,4),"SP").
If(CHAR.SUBSTR(Term,5,2)='Q4') GradTerm=CONCAT(CHAR.SUBSTR(Term,1,4),"SU").
EXECUTE.

Numeric GradTerm_num.
IF(GradTerm = '1/1968') GradTerm_num = 1.
IF(GradTerm = '2/1968') GradTerm_num = 2.
IF(GradTerm = '3/1968') GradTerm_num = 3.
IF(GradTerm = '4/1968') GradTerm_num = 3.
IF(GradTerm = '1/1969') GradTerm_num = 4.
IF(GradTerm = '2/1969') GradTerm_num = 5.
IF(GradTerm = '3/1969') GradTerm_num = 6.
IF(GradTerm = '4/1969') GradTerm_num = 6.
IF(GradTerm = '1/1970') GradTerm_num = 7.
IF(GradTerm = '2/1970') GradTerm_num = 8.
IF(GradTerm = '3/1970') GradTerm_num = 9.
IF(GradTerm = '4/1970') GradTerm_num = 9.
IF(GradTerm = '1/1971') GradTerm_num = 10.
IF(GradTerm = '2/1971') GradTerm_num = 11.
IF(GradTerm = '3/1971') GradTerm_num = 12.
IF(GradTerm = '4/1971') GradTerm_num = 12.
IF(GradTerm = '1/1972') GradTerm_num = 13.
IF(GradTerm = '2/1972') GradTerm_num = 14.
IF(GradTerm = '3/1972') GradTerm_num = 15.
IF(GradTerm = '4/1972') GradTerm_num = 15.
IF(GradTerm = '1/1973') GradTerm_num = 16.
IF(GradTerm = '2/1973') GradTerm_num = 17.
IF(GradTerm = '3/1973') GradTerm_num = 18.
IF(GradTerm = '4/1973') GradTerm_num = 18.
IF(GradTerm = '1/1974') GradTerm_num = 19.
IF(GradTerm = '2/1974') GradTerm_num = 20.
IF(GradTerm = '3/1974') GradTerm_num = 21.
IF(GradTerm = '4/1974') GradTerm_num = 21.
IF(GradTerm = '1/1975') GradTerm_num = 22.
IF(GradTerm = '2/1975') GradTerm_num = 23.
IF(GradTerm = '3/1975') GradTerm_num = 24.
IF(GradTerm = '4/1975') GradTerm_num = 24.
IF(GradTerm = '1/1976') GradTerm_num = 25.
IF(GradTerm = '2/1976') GradTerm_num = 26.
IF(GradTerm = '3/1976') GradTerm_num = 27.
IF(GradTerm = '4/1976') GradTerm_num = 27.
IF(GradTerm = '1/1977') GradTerm_num = 28.
IF(GradTerm = '2/1977') GradTerm_num = 29.
IF(GradTerm = '3/1977') GradTerm_num = 30.
IF(GradTerm = '4/1977') GradTerm_num = 30.
IF(GradTerm = '1/1978') GradTerm_num = 31.
IF(GradTerm = '2/1978') GradTerm_num = 32.
IF(GradTerm = '3/1978') GradTerm_num = 33.
IF(GradTerm = '4/1978') GradTerm_num = 33.
IF(GradTerm = '1/1979') GradTerm_num = 34.
IF(GradTerm = '2/1979') GradTerm_num = 35.
IF(GradTerm = '3/1979') GradTerm_num = 36.
IF(GradTerm = '4/1979') GradTerm_num = 36.
IF(GradTerm = '1/1980') GradTerm_num = 37.
IF(GradTerm = '2/1980') GradTerm_num = 38.
IF(GradTerm = '3/1980') GradTerm_num = 39.
IF(GradTerm = '4/1980') GradTerm_num = 39.
IF(GradTerm = '1/1981') GradTerm_num = 40.
IF(GradTerm = '2/1981') GradTerm_num = 41.
IF(GradTerm = '3/1981') GradTerm_num = 42.
IF(GradTerm = '4/1981') GradTerm_num = 42.
IF(GradTerm = '1/1982') GradTerm_num = 43.
IF(GradTerm = '2/1982') GradTerm_num = 44.
IF(GradTerm = '3/1982') GradTerm_num = 45.
IF(GradTerm = '4/1982') GradTerm_num = 45.
IF(GradTerm = '1/1983') GradTerm_num = 46.
IF(GradTerm = '2/1983') GradTerm_num = 47.
IF(GradTerm = '3/1983') GradTerm_num = 48.
IF(GradTerm = '4/1983') GradTerm_num = 48.
IF(GradTerm = '1/1984') GradTerm_num = 49.
IF(GradTerm = '2/1984') GradTerm_num = 50.
IF(GradTerm = '3/1984') GradTerm_num = 51.
IF(GradTerm = '4/1984') GradTerm_num = 51.
IF(GradTerm = '1/1985') GradTerm_num = 52.
IF(GradTerm = '2/1985') GradTerm_num = 53.
IF(GradTerm = '3/1985') GradTerm_num = 54.
IF(GradTerm = '4/1985') GradTerm_num = 54.
IF(GradTerm = '1/1986') GradTerm_num = 55.
IF(GradTerm = '2/1986') GradTerm_num = 56.
IF(GradTerm = '3/1986') GradTerm_num = 57.
IF(GradTerm = '4/1986') GradTerm_num = 57.
IF(GradTerm = '1/1987') GradTerm_num = 58.
IF(GradTerm = '2/1987') GradTerm_num = 59.
IF(GradTerm = '3/1987') GradTerm_num = 60.
IF(GradTerm = '4/1987') GradTerm_num = 60.
IF(GradTerm = '1/1988') GradTerm_num = 61.
IF(GradTerm = '2/1988') GradTerm_num = 62.
IF(GradTerm = '3/1988') GradTerm_num = 63.
IF(GradTerm = '4/1988') GradTerm_num = 63.
IF(GradTerm = '1/1989') GradTerm_num = 64.
IF(GradTerm = '2/1989') GradTerm_num = 65.
IF(GradTerm = '3/1989') GradTerm_num = 66.
IF(GradTerm = '4/1989') GradTerm_num = 66.
IF(GradTerm = '1/1990') GradTerm_num = 67.
IF(GradTerm = '2/1990') GradTerm_num = 68.
IF(GradTerm = '3/1990') GradTerm_num = 69.
IF(GradTerm = '4/1990') GradTerm_num = 69.
IF(GradTerm = '1/1991') GradTerm_num = 70.
IF(GradTerm = '2/1991') GradTerm_num = 71.
IF(GradTerm = '3/1991') GradTerm_num = 72.
IF(GradTerm = '4/1991') GradTerm_num = 72.
IF(GradTerm = '1/1992') GradTerm_num = 73.
IF(GradTerm = '2/1992') GradTerm_num = 74.
IF(GradTerm = '3/1992') GradTerm_num = 75.
IF(GradTerm = '4/1992') GradTerm_num = 75.
IF(GradTerm = '1/1993') GradTerm_num = 76.
IF(GradTerm = '2/1993') GradTerm_num = 77.
IF(GradTerm = '3/1993') GradTerm_num = 78.
IF(GradTerm = '4/1993') GradTerm_num = 78.
IF(GradTerm = '1/1994') GradTerm_num = 79.
IF(GradTerm = '2/1994') GradTerm_num = 80.
IF(GradTerm = '3/1994') GradTerm_num = 81.
IF(GradTerm = '4/1994') GradTerm_num = 81.
IF(GradTerm = '1/1995') GradTerm_num = 82.
IF(GradTerm = '2/1995') GradTerm_num = 83.
IF(GradTerm = '3/1995') GradTerm_num = 84.
IF(GradTerm = '4/1995') GradTerm_num = 84.
IF(GradTerm = '1/1996') GradTerm_num = 85.
IF(GradTerm = '2/1996') GradTerm_num = 86.
IF(GradTerm = '3/1996') GradTerm_num = 87.
IF(GradTerm = '4/1996') GradTerm_num = 87.
IF(GradTerm = '1/1997') GradTerm_num = 88.
IF(GradTerm = '2/1997') GradTerm_num = 89.
IF(GradTerm = '3/1997') GradTerm_num = 90.
IF(GradTerm = '4/1997') GradTerm_num = 90.
IF(GradTerm = '1/1998') GradTerm_num = 91.
IF(GradTerm = '2/1998') GradTerm_num = 92.
IF(GradTerm = '3/1998') GradTerm_num = 93.
IF(GradTerm = '4/1998') GradTerm_num = 93.
IF(GradTerm = '1/1999') GradTerm_num = 94.
IF(GradTerm = '2/1999') GradTerm_num = 95.
IF(GradTerm = '3/1999') GradTerm_num = 96.
IF(GradTerm = '4/1999') GradTerm_num = 96.
IF(GradTerm = '1/2000') GradTerm_num = 97.
IF(GradTerm = '2/2000') GradTerm_num = 98.
IF(GradTerm = '3/2000') GradTerm_num = 99.
IF(GradTerm = '4/2000') GradTerm_num = 99.
IF(GradTerm = '1/2001') GradTerm_num = 100.
IF(GradTerm = '2/2001') GradTerm_num = 101.
IF(GradTerm = '3/2001') GradTerm_num = 102.
IF(GradTerm = '4/2001') GradTerm_num = 102.
IF(GradTerm = '1/2002') GradTerm_num = 103.
IF(GradTerm = '2/2002') GradTerm_num = 104.
IF(GradTerm = '3/2002') GradTerm_num = 105.
IF(GradTerm = '4/2002') GradTerm_num = 105.
IF(GradTerm = '1/2003') GradTerm_num = 106.
IF(GradTerm = '2/2003') GradTerm_num = 107.
IF(GradTerm = '3/2003') GradTerm_num = 108.
IF(GradTerm = '4/2003') GradTerm_num = 108.
IF(GradTerm = '1/2004') GradTerm_num = 109.
IF(GradTerm = '2004SP') GradTerm_num = 110.
IF(GradTerm = '2004SU') GradTerm_num = 111.
IF(GradTerm = '2004FL') GradTerm_num = 112.
IF(GradTerm = '2005SP') GradTerm_num = 113.
IF(GradTerm = '2005SU') GradTerm_num = 114.
IF(GradTerm = '2005FL') GradTerm_num = 115.
IF(GradTerm = '2006SP') GradTerm_num = 116.
IF(GradTerm = '2006SU') GradTerm_num = 117.
IF(GradTerm = '2006FL') GradTerm_num = 118.
IF(GradTerm = '2007SP') GradTerm_num = 119.
IF(GradTerm = '2007SU') GradTerm_num = 120.
IF(GradTerm = '2007FL') GradTerm_num = 121.
IF(GradTerm = '2008SP') GradTerm_num = 122.
IF(GradTerm = '2008SU') GradTerm_num = 123.
IF(GradTerm = '2008FL') GradTerm_num = 124.
IF(GradTerm = '2009SP') GradTerm_num = 125.
IF(GradTerm = '2009SU') GradTerm_num = 126.
IF(GradTerm = '2009FL') GradTerm_num = 127.
IF(GradTerm = '2010SP') GradTerm_num = 128.
IF(GradTerm = '2010SU') GradTerm_num = 129.
IF(GradTerm = '2010FL') GradTerm_num = 130.
IF(GradTerm = '2011SP') GradTerm_num = 131.
IF(GradTerm = '2011SU') GradTerm_num = 132.
IF(GradTerm = '2011FL') GradTerm_num = 133.
IF(GradTerm = '2012SP') GradTerm_num = 134.
IF(GradTerm = '2012SU') GradTerm_num = 135.
IF(GradTerm = '2012FL') GradTerm_num = 136.
IF(GradTerm = '2013SP') GradTerm_num = 137.
IF(GradTerm = '2013SU') GradTerm_num = 138.
IF(GradTerm = '2013FL') GradTerm_num = 139.
IF(GradTerm = '2014SP') GradTerm_num = 140.
IF(GradTerm = '2014SU') GradTerm_num = 141.
IF(GradTerm = '2014FL') GradTerm_num = 142.
IF(GradTerm = '2015SP') GradTerm_num = 143.
IF(GradTerm = '2015SU') GradTerm_num = 144.
IF(GradTerm = '2015FL') GradTerm_num = 145.
IF(GradTerm = '2016SP') GradTerm_num = 146.
IF(GradTerm = '2016SU') GradTerm_num = 147.
IF(GradTerm = '2016FL') GradTerm_num = 148.
IF(GradTerm = '2017SP') GradTerm_num = 149.
IF(GradTerm = '2017SU') GradTerm_num = 150.
IF(GradTerm = '2017FL') GradTerm_num = 151.
IF(GradTerm = '2018SP') GradTerm_num = 152.
IF(GradTerm = '2018SU') GradTerm_num = 153.
IF(GradTerm = '2018FL') GradTerm_num = 154.
IF(GradTerm = '2019SP') GradTerm_num = 155.
IF(GradTerm = '2019SU') GradTerm_num = 156.
IF(GradTerm = '2019FL') GradTerm_num = 157.
EXECUTE.

VALUE LABELS GradTerm_num
1 '1967FL'
2 '1968SP'
3 '1968SU'
3 '1968SU'
4 '1968FL'
5 '1969SP'
6 '1969SU'
6 '1969SU'
7 '1969FL'
8 '1970SP'
9 '1970SU'
9 '1970SU'
10 '1970FL'
11 '1971SP'
12 '1971SU'
12 '1971SU'
13 '1971FL'
14 '1972SP'
15 '1972SU'
15 '1972SU'
16 '1972FL'
17 '1973SP'
18 '1973SU'
18 '1973SU'
19 '1973FL'
20 '1974SP'
21 '1974SU'
21 '1974SU'
22 '1974FL'
23 '1975SP'
24 '1975SU'
24 '1975SU'
25 '1975FL'
26 '1976SP'
27 '1976SU'
27 '1976SU'
28 '1976FL'
29 '1977SP'
30 '1977SU'
30 '1977SU'
31 '1977FL'
32 '1978SP'
33 '1978SU'
33 '1978SU'
34 '1978FL'
35 '1979SP'
36 '1979SU'
36 '1979SU'
37 '1979FL'
38 '1980SP'
39 '1980SU'
39 '1980SU'
40 '1980FL'
41 '1981SP'
42 '1981SU'
42 '1981SU'
43 '1981FL'
44 '1982SP'
45 '1982SU'
45 '1982SU'
46 '1982FL'
47 '1983SP'
48 '1983SU'
48 '1983SU'
49 '1983FL'
50 '1984SP'
51 '1984SU'
51 '1984SU'
52 '1984FL'
53 '1985SP'
54 '1985SU'
54 '1985SU'
55 '1985FL'
56 '1986SP'
57 '1986SU'
57 '1986SU'
58 '1986FL'
59 '1987SP'
60 '1987SU'
60 '1987SU'
61 '1987FL'
62 '1988SP'
63 '1988SU'
63 '1988SU'
64 '1988FL'
65 '1989SP'
66 '1989SU'
66 '1989SU'
67 '1989FL'
68 '1990SP'
69 '1990SU'
69 '1990SU'
70 '1990FL'
71 '1991SP'
72 '1991SU'
72 '1991SU'
73 '1991FL'
74 '1992SP'
75 '1992SU'
75 '1992SU'
76 '1992FL'
77 '1993SP'
78 '1993SU'
78 '1993SU'
79 '1993FL'
80 '1994SP'
81 '1994SU'
81 '1994SU'
82 '1994FL'
83 '1995SP'
84 '1995SU'
84 '1995SU'
85 '1995FL'
86 '1996SP'
87 '1996SU'
87 '1996SU'
88 '1996FL'
89 '1997SP'
90 '1997SU'
90 '1997SU'
91 '1997FL'
92 '1998SP'
93 '1998SU'
93 '1998SU'
94 '1998FL'
95 '1999SP'
96 '1999SU'
96 '1999SU'
97 '1999FL'
98 '2000SP'
99 '2000SU'
99 '2000SU'
100 '2000FL'
101 '2001SP'
102 '2001SU'
102 '2001SU'
103 '2001FL'
104 '2002SP'
105 '2002SU'
105 '2002SU'
106 '2002FL'
107 '2003SP'
108 '2003SU'
108 '2003SU'
109 '2003FL'
110 '2004SP'
111 '2004SU'
112 '2004FL'
113 '2005SP'
114 '2005SU'
115 '2005FL'
116 '2006SP'
117 '2006SU'
118 '2006FL'
119 '2007SP'
120 '2007SU'
121 '2007FL'
122 '2008SP'
123 '2008SU'
124 '2008FL'
125 '2009SP'
126 '2009SU'
127 '2009FL'
128 '2010SP'
129 '2010SU'
130 '2010FL'
131 '2011SP'
132 '2011SU'
133 '2011FL'
134 '2012SP'
135 '2012SU'
136 '2012FL'
137 '2013SP'
138 '2013SU'
139 '2013FL'
140 '2014SP'
141 '2014SU'
142 '2014FL'
143 '2015SP'
144 '2015SU'
145 '2015FL'
146 '2016SP'
147 '2016SU'
148 '2016FL'
149 '2017SP'
150 '2017SU'
151 '2017FL'
152 '2018SP'
153 '2018SU'
154 '2018FL'
155 '2019SP'
156 '2019SU'
157 '2019FL'.
EXECUTE.













STRING StartTerm (A6).
IF(FticOir  NE " " and CHAR.SUBSTR(Term,5,1) NE 'Q') StartTerm=FticOir.
If( FticOir  NE " " and  CHAR.SUBSTR(Term,5,2)='Q1') GradTerm=CONCAT(CHAR.SUBSTR(FticOir,1,4),"FL").
If( FticOir  NE " " and  CHAR.SUBSTR(Term,5,2)='Q2' or CHAR.SUBSTR(Term,5,2)='Q3'  ) GradTerm=CONCAT(CHAR.SUBSTR(FticOir,1,4),"SP").
If( FticOir  NE " " and CHAR.SUBSTR(Term,5,2)='Q4') GradTerm=CONCAT(CHAR.SUBSTR(FticOir,1,4),"SU").
IF(FticOir =" " and CHAR.SUBSTR(Term,5,1) NE 'Q') StartTerm=TccFirstTerm.
If( FticOir =" " and  CHAR.SUBSTR(Term,5,2)='Q1') GradTerm=CONCAT(CHAR.SUBSTR(TccFirstTerm,1,4),"FL").
If( FticOir =" " and  CHAR.SUBSTR(Term,5,2)='Q2' or CHAR.SUBSTR(Term,5,2)='Q3'  ) GradTerm=CONCAT(CHAR.SUBSTR(TccFirstTerm,1,4),"SP").
If( FticOir =" " and CHAR.SUBSTR(Term,5,2)='Q4') GradTerm=CONCAT(CHAR.SUBSTR(TccFirstTerm,1,4),"SU").
EXECUTE.


Numeric StartTerm_num.
IF(StartTerm = '1/1968') StartTerm_num = 1.
IF(StartTerm = '2/1968') StartTerm_num = 2.
IF(StartTerm = '3/1968') StartTerm_num = 3.
IF(StartTerm = '4/1968') StartTerm_num = 3.
IF(StartTerm = '1/1969') StartTerm_num = 4.
IF(StartTerm = '2/1969') StartTerm_num = 5.
IF(StartTerm = '3/1969') StartTerm_num = 6.
IF(StartTerm = '4/1969') StartTerm_num = 6.
IF(StartTerm = '1/1970') StartTerm_num = 7.
IF(StartTerm = '2/1970') StartTerm_num = 8.
IF(StartTerm = '3/1970') StartTerm_num = 9.
IF(StartTerm = '4/1970') StartTerm_num = 9.
IF(StartTerm = '1/1971') StartTerm_num = 10.
IF(StartTerm = '2/1971') StartTerm_num = 11.
IF(StartTerm = '3/1971') StartTerm_num = 12.
IF(StartTerm = '4/1971') StartTerm_num = 12.
IF(StartTerm = '1/1972') StartTerm_num = 13.
IF(StartTerm = '2/1972') StartTerm_num = 14.
IF(StartTerm = '3/1972') StartTerm_num = 15.
IF(StartTerm = '4/1972') StartTerm_num = 15.
IF(StartTerm = '1/1973') StartTerm_num = 16.
IF(StartTerm = '2/1973') StartTerm_num = 17.
IF(StartTerm = '3/1973') StartTerm_num = 18.
IF(StartTerm = '4/1973') StartTerm_num = 18.
IF(StartTerm = '1/1974') StartTerm_num = 19.
IF(StartTerm = '2/1974') StartTerm_num = 20.
IF(StartTerm = '3/1974') StartTerm_num = 21.
IF(StartTerm = '4/1974') StartTerm_num = 21.
IF(StartTerm = '1/1975') StartTerm_num = 22.
IF(StartTerm = '2/1975') StartTerm_num = 23.
IF(StartTerm = '3/1975') StartTerm_num = 24.
IF(StartTerm = '4/1975') StartTerm_num = 24.
IF(StartTerm = '1/1976') StartTerm_num = 25.
IF(StartTerm = '2/1976') StartTerm_num = 26.
IF(StartTerm = '3/1976') StartTerm_num = 27.
IF(StartTerm = '4/1976') StartTerm_num = 27.
IF(StartTerm = '1/1977') StartTerm_num = 28.
IF(StartTerm = '2/1977') StartTerm_num = 29.
IF(StartTerm = '3/1977') StartTerm_num = 30.
IF(StartTerm = '4/1977') StartTerm_num = 30.
IF(StartTerm = '1/1978') StartTerm_num = 31.
IF(StartTerm = '2/1978') StartTerm_num = 32.
IF(StartTerm = '3/1978') StartTerm_num = 33.
IF(StartTerm = '4/1978') StartTerm_num = 33.
IF(StartTerm = '1/1979') StartTerm_num = 34.
IF(StartTerm = '2/1979') StartTerm_num = 35.
IF(StartTerm = '3/1979') StartTerm_num = 36.
IF(StartTerm = '4/1979') StartTerm_num = 36.
IF(StartTerm = '1/1980') StartTerm_num = 37.
IF(StartTerm = '2/1980') StartTerm_num = 38.
IF(StartTerm = '3/1980') StartTerm_num = 39.
IF(StartTerm = '4/1980') StartTerm_num = 39.
IF(StartTerm = '1/1981') StartTerm_num = 40.
IF(StartTerm = '2/1981') StartTerm_num = 41.
IF(StartTerm = '3/1981') StartTerm_num = 42.
IF(StartTerm = '4/1981') StartTerm_num = 42.
IF(StartTerm = '1/1982') StartTerm_num = 43.
IF(StartTerm = '2/1982') StartTerm_num = 44.
IF(StartTerm = '3/1982') StartTerm_num = 45.
IF(StartTerm = '4/1982') StartTerm_num = 45.
IF(StartTerm = '1/1983') StartTerm_num = 46.
IF(StartTerm = '2/1983') StartTerm_num = 47.
IF(StartTerm = '3/1983') StartTerm_num = 48.
IF(StartTerm = '4/1983') StartTerm_num = 48.
IF(StartTerm = '1/1984') StartTerm_num = 49.
IF(StartTerm = '2/1984') StartTerm_num = 50.
IF(StartTerm = '3/1984') StartTerm_num = 51.
IF(StartTerm = '4/1984') StartTerm_num = 51.
IF(StartTerm = '1/1985') StartTerm_num = 52.
IF(StartTerm = '2/1985') StartTerm_num = 53.
IF(StartTerm = '3/1985') StartTerm_num = 54.
IF(StartTerm = '4/1985') StartTerm_num = 54.
IF(StartTerm = '1/1986') StartTerm_num = 55.
IF(StartTerm = '2/1986') StartTerm_num = 56.
IF(StartTerm = '3/1986') StartTerm_num = 57.
IF(StartTerm = '4/1986') StartTerm_num = 57.
IF(StartTerm = '1/1987') StartTerm_num = 58.
IF(StartTerm = '2/1987') StartTerm_num = 59.
IF(StartTerm = '3/1987') StartTerm_num = 60.
IF(StartTerm = '4/1987') StartTerm_num = 60.
IF(StartTerm = '1/1988') StartTerm_num = 61.
IF(StartTerm = '2/1988') StartTerm_num = 62.
IF(StartTerm = '3/1988') StartTerm_num = 63.
IF(StartTerm = '4/1988') StartTerm_num = 63.
IF(StartTerm = '1/1989') StartTerm_num = 64.
IF(StartTerm = '2/1989') StartTerm_num = 65.
IF(StartTerm = '3/1989') StartTerm_num = 66.
IF(StartTerm = '4/1989') StartTerm_num = 66.
IF(StartTerm = '1/1990') StartTerm_num = 67.
IF(StartTerm = '2/1990') StartTerm_num = 68.
IF(StartTerm = '3/1990') StartTerm_num = 69.
IF(StartTerm = '4/1990') StartTerm_num = 69.
IF(StartTerm = '1/1991') StartTerm_num = 70.
IF(StartTerm = '2/1991') StartTerm_num = 71.
IF(StartTerm = '3/1991') StartTerm_num = 72.
IF(StartTerm = '4/1991') StartTerm_num = 72.
IF(StartTerm = '1/1992') StartTerm_num = 73.
IF(StartTerm = '2/1992') StartTerm_num = 74.
IF(StartTerm = '3/1992') StartTerm_num = 75.
IF(StartTerm = '4/1992') StartTerm_num = 75.
IF(StartTerm = '1/1993') StartTerm_num = 76.
IF(StartTerm = '2/1993') StartTerm_num = 77.
IF(StartTerm = '3/1993') StartTerm_num = 78.
IF(StartTerm = '4/1993') StartTerm_num = 78.
IF(StartTerm = '1/1994') StartTerm_num = 79.
IF(StartTerm = '2/1994') StartTerm_num = 80.
IF(StartTerm = '3/1994') StartTerm_num = 81.
IF(StartTerm = '4/1994') StartTerm_num = 81.
IF(StartTerm = '1/1995') StartTerm_num = 82.
IF(StartTerm = '2/1995') StartTerm_num = 83.
IF(StartTerm = '3/1995') StartTerm_num = 84.
IF(StartTerm = '4/1995') StartTerm_num = 84.
IF(StartTerm = '1/1996') StartTerm_num = 85.
IF(StartTerm = '2/1996') StartTerm_num = 86.
IF(StartTerm = '3/1996') StartTerm_num = 87.
IF(StartTerm = '4/1996') StartTerm_num = 87.
IF(StartTerm = '1/1997') StartTerm_num = 88.
IF(StartTerm = '2/1997') StartTerm_num = 89.
IF(StartTerm = '3/1997') StartTerm_num = 90.
IF(StartTerm = '4/1997') StartTerm_num = 90.
IF(StartTerm = '1/1998') StartTerm_num = 91.
IF(StartTerm = '2/1998') StartTerm_num = 92.
IF(StartTerm = '3/1998') StartTerm_num = 93.
IF(StartTerm = '4/1998') StartTerm_num = 93.
IF(StartTerm = '1/1999') StartTerm_num = 94.
IF(StartTerm = '2/1999') StartTerm_num = 95.
IF(StartTerm = '3/1999') StartTerm_num = 96.
IF(StartTerm = '4/1999') StartTerm_num = 96.
IF(StartTerm = '1/2000') StartTerm_num = 97.
IF(StartTerm = '2/2000') StartTerm_num = 98.
IF(StartTerm = '3/2000') StartTerm_num = 99.
IF(StartTerm = '4/2000') StartTerm_num = 99.
IF(StartTerm = '1/2001') StartTerm_num = 100.
IF(StartTerm = '2/2001') StartTerm_num = 101.
IF(StartTerm = '3/2001') StartTerm_num = 102.
IF(StartTerm = '4/2001') StartTerm_num = 102.
IF(StartTerm = '1/2002') StartTerm_num = 103.
IF(StartTerm = '2/2002') StartTerm_num = 104.
IF(StartTerm = '3/2002') StartTerm_num = 105.
IF(StartTerm = '4/2002') StartTerm_num = 105.
IF(StartTerm = '1/2003') StartTerm_num = 106.
IF(StartTerm = '2/2003') StartTerm_num = 107.
IF(StartTerm = '3/2003') StartTerm_num = 108.
IF(StartTerm = '4/2003') StartTerm_num = 108.
IF(StartTerm = '1/2004') StartTerm_num = 109.
IF(StartTerm = '2004SP') StartTerm_num = 110.
IF(StartTerm = '2004SU') StartTerm_num = 111.
IF(StartTerm = '2004FL') StartTerm_num = 112.
IF(StartTerm = '2005SP') StartTerm_num = 113.
IF(StartTerm = '2005SU') StartTerm_num = 114.
IF(StartTerm = '2005FL') StartTerm_num = 115.
IF(StartTerm = '2006SP') StartTerm_num = 116.
IF(StartTerm = '2006SU') StartTerm_num = 117.
IF(StartTerm = '2006FL') StartTerm_num = 118.
IF(StartTerm = '2007SP') StartTerm_num = 119.
IF(StartTerm = '2007SU') StartTerm_num = 120.
IF(StartTerm = '2007FL') StartTerm_num = 121.
IF(StartTerm = '2008SP') StartTerm_num = 122.
IF(StartTerm = '2008SU') StartTerm_num = 123.
IF(StartTerm = '2008FL') StartTerm_num = 124.
IF(StartTerm = '2009SP') StartTerm_num = 125.
IF(StartTerm = '2009SU') StartTerm_num = 126.
IF(StartTerm = '2009FL') StartTerm_num = 127.
IF(StartTerm = '2010SP') StartTerm_num = 128.
IF(StartTerm = '2010SU') StartTerm_num = 129.
IF(StartTerm = '2010FL') StartTerm_num = 130.
IF(StartTerm = '2011SP') StartTerm_num = 131.
IF(StartTerm = '2011SU') StartTerm_num = 132.
IF(StartTerm = '2011FL') StartTerm_num = 133.
IF(StartTerm = '2012SP') StartTerm_num = 134.
IF(StartTerm = '2012SU') StartTerm_num = 135.
IF(StartTerm = '2012FL') StartTerm_num = 136.
IF(StartTerm = '2013SP') StartTerm_num = 137.
IF(StartTerm = '2013SU') StartTerm_num = 138.
IF(StartTerm = '2013FL') StartTerm_num = 139.
IF(StartTerm = '2014SP') StartTerm_num = 140.
IF(StartTerm = '2014SU') StartTerm_num = 141.
IF(StartTerm = '2014FL') StartTerm_num = 142.
IF(StartTerm = '2015SP') StartTerm_num = 143.
IF(StartTerm = '2015SU') StartTerm_num = 144.
IF(StartTerm = '2015FL') StartTerm_num = 145.
IF(StartTerm = '2016SP') StartTerm_num = 146.
IF(StartTerm = '2016SU') StartTerm_num = 147.
IF(StartTerm = '2016FL') StartTerm_num = 148.
IF(StartTerm = '2017SP') StartTerm_num = 149.
IF(StartTerm = '2017SU') StartTerm_num = 150.
IF(StartTerm = '2017FL') StartTerm_num = 151.
IF(StartTerm = '2018SP') StartTerm_num = 152.
IF(StartTerm = '2018SU') StartTerm_num = 153.
IF(StartTerm = '2018FL') StartTerm_num = 154.
IF(StartTerm = '2019SP') StartTerm_num = 155.
IF(StartTerm = '2019SU') StartTerm_num = 156.
IF(StartTerm = '2019FL') StartTerm_num = 157.
EXECUTE.

VALUE LABELS StartTerm_num
1 '1967FL'
2 '1968SP'
3 '1968SU'
3 '1968SU'
4 '1968FL'
5 '1969SP'
6 '1969SU'
6 '1969SU'
7 '1969FL'
8 '1970SP'
9 '1970SU'
9 '1970SU'
10 '1970FL'
11 '1971SP'
12 '1971SU'
12 '1971SU'
13 '1971FL'
14 '1972SP'
15 '1972SU'
15 '1972SU'
16 '1972FL'
17 '1973SP'
18 '1973SU'
18 '1973SU'
19 '1973FL'
20 '1974SP'
21 '1974SU'
21 '1974SU'
22 '1974FL'
23 '1975SP'
24 '1975SU'
24 '1975SU'
25 '1975FL'
26 '1976SP'
27 '1976SU'
27 '1976SU'
28 '1976FL'
29 '1977SP'
30 '1977SU'
30 '1977SU'
31 '1977FL'
32 '1978SP'
33 '1978SU'
33 '1978SU'
34 '1978FL'
35 '1979SP'
36 '1979SU'
36 '1979SU'
37 '1979FL'
38 '1980SP'
39 '1980SU'
39 '1980SU'
40 '1980FL'
41 '1981SP'
42 '1981SU'
42 '1981SU'
43 '1981FL'
44 '1982SP'
45 '1982SU'
45 '1982SU'
46 '1982FL'
47 '1983SP'
48 '1983SU'
48 '1983SU'
49 '1983FL'
50 '1984SP'
51 '1984SU'
51 '1984SU'
52 '1984FL'
53 '1985SP'
54 '1985SU'
54 '1985SU'
55 '1985FL'
56 '1986SP'
57 '1986SU'
57 '1986SU'
58 '1986FL'
59 '1987SP'
60 '1987SU'
60 '1987SU'
61 '1987FL'
62 '1988SP'
63 '1988SU'
63 '1988SU'
64 '1988FL'
65 '1989SP'
66 '1989SU'
66 '1989SU'
67 '1989FL'
68 '1990SP'
69 '1990SU'
69 '1990SU'
70 '1990FL'
71 '1991SP'
72 '1991SU'
72 '1991SU'
73 '1991FL'
74 '1992SP'
75 '1992SU'
75 '1992SU'
76 '1992FL'
77 '1993SP'
78 '1993SU'
78 '1993SU'
79 '1993FL'
80 '1994SP'
81 '1994SU'
81 '1994SU'
82 '1994FL'
83 '1995SP'
84 '1995SU'
84 '1995SU'
85 '1995FL'
86 '1996SP'
87 '1996SU'
87 '1996SU'
88 '1996FL'
89 '1997SP'
90 '1997SU'
90 '1997SU'
91 '1997FL'
92 '1998SP'
93 '1998SU'
93 '1998SU'
94 '1998FL'
95 '1999SP'
96 '1999SU'
96 '1999SU'
97 '1999FL'
98 '2000SP'
99 '2000SU'
99 '2000SU'
100 '2000FL'
101 '2001SP'
102 '2001SU'
102 '2001SU'
103 '2001FL'
104 '2002SP'
105 '2002SU'
105 '2002SU'
106 '2002FL'
107 '2003SP'
108 '2003SU'
108 '2003SU'
109 '2003FL'
110 '2004SP'
111 '2004SU'
112 '2004FL'
113 '2005SP'
114 '2005SU'
115 '2005FL'
116 '2006SP'
117 '2006SU'
118 '2006FL'
119 '2007SP'
120 '2007SU'
121 '2007FL'
122 '2008SP'
123 '2008SU'
124 '2008FL'
125 '2009SP'
126 '2009SU'
127 '2009FL'
128 '2010SP'
129 '2010SU'
130 '2010FL'
131 '2011SP'
132 '2011SU'
133 '2011FL'
134 '2012SP'
135 '2012SU'
136 '2012FL'
137 '2013SP'
138 '2013SU'
139 '2013FL'
140 '2014SP'
141 '2014SU'
142 '2014FL'
143 '2015SP'
144 '2015SU'
145 '2015FL'
146 '2016SP'
147 '2016SU'
148 '2016FL'
149 '2017SP'
150 '2017SU'
151 '2017FL'
152 '2018SP'
153 '2018SU'
154 '2018FL'
155 '2019SP'
156 '2019SU'
157 '2019FL'.
EXECUTE.


Numeric TimetoCompletion.
Compute TimetoCompletion=(GradTerm_num-StartTerm_num+1)/3.
EXECUTE.



Numeric Group.
IF(TimetoCompletion GT 0 and TimetoCompletion  LT 1) Group=0.
IF(TimetoCompletion GE 1 and TimetoCompletion  LT 2) Group=1.
IF(TimetoCompletion GE 2 and TimetoCompletion  LT 3) Group=2.
IF(TimetoCompletion GE 3 and TimetoCompletion  LT 4) Group=3.
IF(TimetoCompletion GE 4 and TimetoCompletion  LT 5) Group=4.
IF(TimetoCompletion GE 5 and TimetoCompletion  LT 6) Group=5.
IF(TimetoCompletion GE 6 ) Group=6.
EXECUTE.

VALUE LABELS Group
0 'Less than 1 Year'
1 '1 to 1.99 Years'
2 '2 to 2.99 Years'
3 '3 to 3.99 Years'
4 '4 to 4.99 Years'
5 '5 to 5.99 Years'
6 '6 or More Years'.
EXECUTE.













































