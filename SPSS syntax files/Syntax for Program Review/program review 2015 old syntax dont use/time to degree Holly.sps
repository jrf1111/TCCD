* Encoding: UTF-8.

Numeric GradOneYear.
COMPUTE GradOneYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708)=1) GradOneYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809)=1) GradOneYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910)=1) GradOneYear=1.
IF(FTICOIR='2010FL' and max(0,Grad1011)=1) GradOneYear=1.
IF(FTICOIR='2011FL' and max(0,Grad1112)=1) GradOneYear=1.
IF(FTICOIR='2012FL' and max(0,Grad1213)=1) GradOneYear=1.
IF(FTICOIR='2013FL' and max(0,Grad1314)=1) GradOneYear=1.
IF(FTICOIR='2014FL' and max(0,Grad1415)=1) GradOneYear=1.
IF(FTICOIR='2015FL' and max(0,Grad1516)=1) GradOneYear=1.
IF(FTICOIR='2016FL' and max(0,Grad1617)=1) GradOneYear=1.
EXECUTE.

Numeric GradTwoYear.
COMPUTE GradTwoYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809)=1) GradTwoYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910)=1) GradTwoYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910,Grad1011)=1) GradTwoYear=1.
IF(FTICOIR='2010FL' and max(0,Grad1011,Grad1112)=1) GradTwoYear=1.
IF(FTICOIR='2011FL' and max(0,Grad1112,Grad1213)=1) GradTwoYear=1.
IF(FTICOIR='2012FL' and max(0,Grad1213,Grad1314)=1) GradTwoYear=1.
IF(FTICOIR='2013FL' and max(0,Grad1314,Grad1415)=1) GradTwoYear=1.
IF(FTICOIR='2014FL' and max(0,Grad1415,Grad1516)=1) GradTwoYear=1.
IF(FTICOIR='2015FL' and max(0,Grad1516,Grad1617)=1) GradTwoYear=1.
EXECUTE.

Numeric GradThreeYear.
COMPUTE GradThreeYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910)=1) GradThreeYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910,Grad1011)=1) GradThreeYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910,Grad1011,Grad1112)=1) GradThreeYear=1.
IF(FTICOIR='2010FL' and max(0,Grad1011,Grad1112,Grad1213)=1) GradThreeYear=1.
IF(FTICOIR='2011FL' and max(0,Grad1112,Grad1213,Grad1314)=1) GradThreeYear=1.
IF(FTICOIR='2012FL' and max(0,Grad1213,Grad1314,Grad1415)=1) GradThreeYear=1.
IF(FTICOIR='2013FL' and max(0,Grad1314,Grad1415,Grad1516)=1) GradThreeYear=1.
IF(FTICOIR='2014FL' and max(0,Grad1415,Grad1516,Grad1617)=1) GradThreeYear=1.
EXECUTE.

Numeric GradFourYear.
COMPUTE GradFourYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011)=1) GradFourYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112)=1) GradFourYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213)=1) GradFourYear=1.
IF(FTICOIR='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradFourYear=1.
IF(FTICOIR='2011FL' and max(0,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradFourYear=1.
IF(FTICOIR='2012FL' and max(0,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradFourYear=1.
IF(FTICOIR='2013FL' and max(0,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradFourYear=1.
EXECUTE.

Numeric GradFiveYear.
COMPUTE GradFiveYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112)=1) GradFiveYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213)=1) GradFiveYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradFiveYear=1.
IF(FTICOIR='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradFiveYear=1.
IF(FTICOIR='2011FL' and max(0,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradFiveYear=1.
IF(FTICOIR='2012FL' and max(0,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradFiveYear=1.
EXECUTE.

Numeric GradSixYear.
COMPUTE GradSixYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213)=1) GradSixYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradSixYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradSixYear=1.
IF(FTICOIR='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradSixYear=1.
IF(FTICOIR='2011FL' and max(0,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradSixYear=1.
EXECUTE.

Numeric GradSevenYear.
COMPUTE GradSevenYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314)=1) GradSevenYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradSevenYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradSevenYear=1.
IF(FTICOIR='2010FL' and max(0,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradSevenYear=1.
EXECUTE.

Numeric GradEightYear.
COMPUTE GradEightYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415)=1) GradEightYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradEightYear=1.
IF(FTICOIR='2009FL' and max(0,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradEightYear=1.
EXECUTE.

Numeric GradNineYear.
COMPUTE GradNineYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516)=1) GradNineYear=1.
IF(FTICOIR='2008FL' and max(0,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradNineYear=1.
EXECUTE.

Numeric GradTenYear.
COMPUTE GradTenYear=0.
IF(FTICOIR='2007FL' and max(0,Grad0708,Grad0809,Grad0910,Grad1011,Grad1112,Grad1213,Grad1314,Grad1415,Grad1516,Grad1617)=1) GradTenYear=1.
EXECUTE.
