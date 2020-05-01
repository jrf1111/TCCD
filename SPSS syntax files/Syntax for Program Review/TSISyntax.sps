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

