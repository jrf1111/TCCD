* Encoding: UTF-8.
String AcademicYear (A9).
DO IF (Term='2002Q1' OR Term='2002Q2' OR Term='2003Q3' OR Term='2003Q4').
COMPUTE AcademicYear='2003-2004'.
Else IF (Term='2003Q1' OR Term='2003Q2' OR Term='2004Q3' OR Term='2004Q4').
COMPUTE AcademicYear='2003-2004'.
Else IF (Term='2004Q1' OR Term='2004Q2' OR Term='2005Q3' OR Term='2005Q4').
COMPUTE AcademicYear='2004-2005'.
ELSE IF (Term='2005Q1' OR Term='2005Q2' OR Term='2006Q3' OR Term='2006Q4').
COMPUTE AcademicYear='2005-2006'.
ELSE IF (Term='2006Q1' OR Term='2006Q2' OR Term='2007Q3' OR Term='2007Q4').
COMPUTE AcademicYear='2006-2007'.
ELSE IF (Term='2007Q1' OR Term='2007Q2' OR Term='2008Q3' OR Term='2008Q4').
COMPUTE AcademicYear='2007-2008'.
ELSE IF (Term='2008Q1' OR Term='2008Q2' OR Term='2009Q3' OR Term='2009Q4').
COMPUTE AcademicYear='2008-2009'.
ELSE IF (Term='2009Q1' OR Term='2009Q2' OR Term='2010Q3' OR Term='2010Q4').
COMPUTE AcademicYear='2009-2010'.
ELSE IF (Term='2010Q1' OR Term='2010Q2' OR Term='2011Q3' OR Term='2011Q4').
COMPUTE AcademicYear='2010-2011'.
ELSE IF (Term='2011Q1' OR Term='2011Q2' OR Term='2012Q3' OR Term='2012Q4').
COMPUTE AcademicYear='2011-2012'.
ELSE IF (Term='2012Q1' OR Term='2012Q2' OR Term='2013Q3' OR Term='2013Q4').
COMPUTE AcademicYear='2012-2013'.
ELSE IF (Term='2013Q1' OR Term='2013Q2' OR Term='2014Q3' OR Term='2014Q4').
COMPUTE AcademicYear='2013-2014'.
ELSE IF (Term='2014Q1' OR Term='2014Q2' OR Term='2015Q3' OR Term='2015Q4').
COMPUTE AcademicYear='2014-2015'.
ELSE IF (Term='2015Q1' OR Term='2015Q2' OR Term='2016Q3' OR Term='2016Q4').
COMPUTE AcademicYear='2015-2016'.
ELSE IF (Term='2016Q1' OR Term='2016Q2' OR Term='2017Q3' OR Term='2017Q4').
COMPUTE AcademicYear='2016-2017'.
ELSE IF (Term='2017Q1' OR Term='2017Q2' OR Term='2018Q3' OR Term='2018Q4').
COMPUTE AcademicYear='2017-2018'.
ELSE IF (Term='2018Q1' OR Term='2018Q2' OR Term='2019Q3' OR Term='2019Q4').
COMPUTE AcademicYear='2018-2019'.
ELSE IF (Term='2019Q1' OR Term='2019Q2' OR Term='2020Q3' OR Term='2020Q4').
COMPUTE AcademicYear='2019-2020'.
END IF.
EXECUTE.



String AcademicYear (A9).
DO IF (Term='2004FL' OR Term='2005SP' OR Term='2005SU' ).
COMPUTE AcademicYear='2004-2005'.
ELSE IF (Term='2003FL' OR Term='2004SP' OR Term='2004SU' ).
COMPUTE AcademicYear='2003-2004'.
ELSE IF (Term='2005FL' OR Term='2006SP' OR Term='2006SU' ).
COMPUTE AcademicYear='2005-2006'.
ELSE IF (Term='2006FL' OR Term='2007SP' OR Term='2007SU' ).
COMPUTE AcademicYear='2006-2007'.
ELSE IF (Term='2007FL' OR Term='2008SP' OR Term='2008SU' ).
COMPUTE AcademicYear='2007-2008'.
ELSE IF (Term='2008FL' OR Term='2009SP' OR Term='2009SU' ).
COMPUTE AcademicYear='2008-2009'.
ELSE IF (Term='2009FL' OR Term='2010SP' OR Term='2010SU' ).
COMPUTE AcademicYear='2009-2010'.
ELSE IF (Term='2010FL' OR Term='2011SP' OR Term='2011SU' ).
COMPUTE AcademicYear='2010-2011'.
ELSE IF (Term='2011FL' OR Term='2012SP' OR Term='2012SU' ).
COMPUTE AcademicYear='2011-2012'.
ELSE IF (Term='2012FL' OR Term='2013SP' OR Term='2013SU' ).
COMPUTE AcademicYear='2012-2013'.
ELSE IF (Term='2013FL' OR Term='2014SP' OR Term='2014SU' ).
COMPUTE AcademicYear='2013-2014'.
ELSE IF (Term='2014FL' OR Term='2015SP' OR Term='2015SU' ).
COMPUTE AcademicYear='2014-2015'.
ELSE IF (Term='2015FL' OR Term='2016SP' OR Term='2016SU' ).
COMPUTE AcademicYear='2015-2016'.
ELSE IF (Term='2016FL' OR Term='2017SP' OR Term='2017SU' ).
COMPUTE AcademicYear='2016-2017'.
ELSE IF (Term='2017FL' OR Term='2018SP' OR Term='2018SU' ).
COMPUTE AcademicYear='2017-2018'.
ELSE IF (Term='2018FL' OR Term='2019SP' OR Term='2019SU' ).
COMPUTE AcademicYear='2018-2019'.
ELSE IF (Term='2019FL' OR Term='2020SP' OR Term='2020SU' ).
COMPUTE AcademicYear='2019-2020'.
END IF. 
EXECUTE.