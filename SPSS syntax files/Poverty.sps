* Encoding: UTF-8.

*Poverity Guidlines Jan 2018.
Numeric PovertyGuide.
IF(Year='2010') PovertyGuide=(FAFSAFamilySize-1)*3740+10830.
IF(Year='2011') PovertyGuide=(FAFSAFamilySize-1)*3820+10890.
IF(Year='2012') PovertyGuide=(FAFSAFamilySize-1)*3960+11170.
IF(Year='2013') PovertyGuide=(FAFSAFamilySize-1)*4020+11490.
IF(Year='2014') PovertyGuide=(FAFSAFamilySize-1)*4060+11670.
IF(Year='2015') PovertyGuide=(FAFSAFamilySize-1)*4160+11770.
IF(Year='2016' and FAFSAFamilySize LE 6) PovertyGuide=(FAFSAFamilySize-1)*4140+11880.
IF(Year='2016' and FAFSAFamilySize= 7) PovertyGuide=36730.
IF(Year='2016' and FAFSAFamilySize GE 8) PovertyGuide=(FAFSAFamilySize-7)*4160+36730.
IF(Year='2017') PovertyGuide=(FAFSAFamilySize-1)*4180+12060.
IF(Year='2018') PovertyGuide=(FAFSAFamilySize-1)*4320+12140.
IF(Year='2019') PovertyGuide=(FAFSAFamilySize-1)*4420+12490.
EXECUTE.

compute PovertyGuide_150 = PovertyGuide*1.5.
execute. 

compute PovertyFlag = 0. 
if (PovertyGuide_150 - FAFSATotalFamilyIncome >= 0) PovertyFlag = 1.
execute. 

