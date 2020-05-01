* Encoding: UTF-8.
Numeric NumbTSILiab.
COMPUTE NumbTSILiab=4.
IF(TsiMetMath="Y" AND TsiMetRead="Y" AND TsiMetWrit="Y")  NumbTSILiab=0.
IF(TsiMetMath="N" AND TsiMetRead="Y" AND TsiMetWrit="Y")  NumbTSILiab=1.
IF(TsiMetMath="Y" AND TsiMetRead="N" AND TsiMetWrit="Y")  NumbTSILiab=1.
IF(TsiMetMath="Y" AND TsiMetRead="Y" AND TsiMetWrit="N")  NumbTSILiab=1.
IF(TsiMetMath="N" AND TsiMetRead="N" AND TsiMetWrit="Y")  NumbTSILiab=2.
IF(TsiMetMath="Y" AND TsiMetRead="N" AND TsiMetWrit="N")  NumbTSILiab=2.
IF(TsiMetMath="N" AND TsiMetRead="Y" AND TsiMetWrit="N")  NumbTSILiab=2.
IF(TsiMetMath="N" AND TsiMetRead="N" AND TsiMetWrit="N")  NumbTSILiab=3.
EXECUTE.

Numeric TSIGroup.
Compute TSIGroup=9.
IF(TsiMetMath="Y" AND TsiMetRead="Y" AND TsiMetWrit="Y")  TSIGroup=1.
IF(TsiMetMath="N" AND TsiMetRead="Y" AND TsiMetWrit="Y")  TSIGroup=2.
IF(TsiMetMath="Y" AND TsiMetRead="N" AND TsiMetWrit="Y")  TSIGroup=3.
IF(TsiMetMath="Y" AND TsiMetRead="Y" AND TsiMetWrit="N")  TSIGroup=4.
IF(TsiMetMath="N" AND TsiMetRead="N" AND TsiMetWrit="Y")  TSIGroup=5.
IF(TsiMetMath="Y" AND TsiMetRead="N" AND TsiMetWrit="N")  TSIGroup=6.
IF(TsiMetMath="N" AND TsiMetRead="Y" AND TsiMetWrit="N")  TSIGroup=7.
IF(TsiMetMath="N" AND TsiMetRead="N" AND TsiMetWrit="N")  TSIGroup=8.
EXECUTE.

VALUE LABELS TSIGroup
1 'TSI Met'
2 'TSI Liable in Math'
3 'TSI Liable in Reading'
4 'TSI Liable in Writing'
5 'TSI Liable in Math and Reading'
6 'TSI Liable in Reading and Writing'
7 'TSI Liable in Math and Writing'
8 'TSI Liable in All Areas'.

