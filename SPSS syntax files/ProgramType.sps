* Encoding: UTF-8.
STRING Type (A15).
IF(Prog = 'AA.' ) Type = 'Transfer'.
IF(Prog = 'AAS' ) Type = 'Technical'.
IF(Prog = 'AAT' ) Type = 'Transfer'.
IF(Prog = 'AS.' ) Type = 'Transfer'.
IF(Prog = 'CAT' ) Type = 'Technical'.
IF(Prog = 'CE.' ) Type = 'Technical'.
IF(Prog = 'CES' ) Type = 'Technical'.
IF(Prog = 'CNF' ) Type = 'Technical'.
IF(Prog = 'CRT' ) Type = 'Technical'.
IF(Prog = 'Dua' ) Type = 'DC/ECHS'.
IF(Prog = 'Ear' ) Type = 'DC/ECHS'.
IF(Prog = 'FOS' ) Type = 'FOS'.
IF(Prog = 'OSA' ) Type = 'Technical'.
IF(Prog = 'Spe' ) Type = 'Technical'.
IF(Prog = 'Tra' ) Type = 'Undeclared'.
IF(Prog = 'Und' ) Type = 'Undeclared'.
EXECUTE.




Numeric Transfer.
COMPUTE Transfer=0.
IF(Type='Transfer') Transfer=1.
EXECUTE.

Numeric Technical.
COMPUTE Technical=0.
IF(Type='Technical') Technical=1.
EXECUTE.


Numeric DCECHS.
COMPUTE DCECHS=0.
IF(Type='DC/ECHS') DCECHS=1.
EXECUTE.


AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITE=YES
  /BREAK=Id Term
  /Transfer=MAX(Transfer) 
  /Technical=MAX(Technical) 
  /DCECHS=MAX(DCECHS).



Numeric Group.
Compute Group=4.
IF(Transfer=1 and Technical=0) Group=1.
IF(Transfer=0 and Technical=1) Group=2.
IF(Transfer=1 and Technical=1) Group=3.
EXECUTE.
VALUE LABELS Group
1 'Transfer'
2 'Technical'
3 'Both'
4 'Other'.
EXECUTE.


