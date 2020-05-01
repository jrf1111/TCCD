*Age Calculation using the Date Wizard.

* Date and Time Wizard: Birth_date2.
COMPUTE Birth_date=number(BirthDate, DATE11).
VARIABLE LABELS Birth_date2 'Birth Date in date form'.
VARIABLE LEVEL  Birth_date2 (SCALE).
FORMATS Birth_date (ADATE10).
VARIABLE WIDTH  Birth_date(10).
EXECUTE.



* Date and Time Wizard: Age.
COMPUTE  Age=($TIME - Birth_date) / (365.25 * time.days(1)).
VARIABLE LABELS  Age "age".
VARIABLE LEVEL  Age (SCALE).
FORMATS  Age (F8.2).
VARIABLE WIDTH  Age(8).
EXECUTE.
