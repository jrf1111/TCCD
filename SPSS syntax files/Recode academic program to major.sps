*Recodes academic program to major.
Majors (A4).
COMPUTE Major=CHAR.SUBSTR(AcadProgramId,1,4).
VARIABLE LABELS  Major 'Major'.
EXECUTE.