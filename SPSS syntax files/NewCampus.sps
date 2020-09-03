STRING NewCampus (A2).
IF(ResponsibleCampus NE 'TR') NewCampus=ResponsibleCampus.
IF(ResponsibleCampus EQ 'TR' and TccConnect EQ 'Y' ) NewCampus="CN".
IF(ResponsibleCampus EQ 'TR' and TccConnect NE 'Y' ) NewCampus="TR".
EXECUTE.