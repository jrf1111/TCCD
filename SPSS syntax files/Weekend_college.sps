*Calculate if someone is a weekend college student.
*From ST_student_enrollment_data.

RECODE ManagementGroup ('WKEND'=1) (ELSE=0) INTO WKEND_grp.
VARIABLE LABELS  WKEND_grp 'Weekend Group'.
EXECUTE.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=StudentsId
  /WKEND_grp_max=MAX(WKEND_grp).

RECODE ManagementGroup ('DLRNG'=1) (ELSE=0) INTO DLRNG_grp.
VARIABLE LABELS DLRNG_grp 'Distance Learning Group'.
EXECUTE.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=StudentsId
  /DLRNG_grp_max=MAX(DLRNG_grp).


RECODE ManagementGroup ('WKEND'=0) ('DLRNG'=0) (ELSE=1) INTO FtoF_grp.
VARIABLE LABELS  FtoF_grp 'FtoF Group'.
EXECUTE.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES 
  /BREAK=StudentsId
  /FtoF_grp_max=MAX(FtoF_grp).


Numeric Course_delivery_grp.
DO IF(WKEND_GRP_MAX=0 AND DLRNG_GRP_MAX=0 AND FtoF_GRP_Max=1).
Compute Course_delivery_grp=1.
ELSE IF(WKEND_GRP_MAX=0 AND DLRNG_GRP_MAX=1 AND FtoF_GRP_Max=0).
Compute Course_delivery_grp=2.
ELSE IF(WKEND_GRP_MAX=1 AND DLRNG_GRP_MAX=0 AND FtoF_GRP_Max=0).
Compute Course_delivery_grp=3.
ELSE IF(WKEND_GRP_MAX=1 AND DLRNG_GRP_MAX=1 AND FtoF_GRP_Max=0).
Compute Course_delivery_grp=4.
ELSE IF(WKEND_GRP_MAX=1 AND DLRNG_GRP_MAX=1 AND FtoF_GRP_Max=1).
Compute Course_delivery_grp=5.
ELSE IF(WKEND_GRP_MAX=0 AND DLRNG_GRP_MAX=1 AND FtoF_GRP_Max=1).
Compute Course_delivery_grp=6.
ELSE IF(WKEND_GRP_MAX=1 AND DLRNG_GRP_MAX=0 AND FtoF_GRP_Max=1).
Compute Course_delivery_grp=7.
END IF.
VARIABLE LABELS Course_delivery_grp 'Course Delivery Group'.
Execute.

VALUE LABELS Course_delivery_grp
1 'Face to Face only'
2 'Distance Learning'
3 'Weekend College only'
4 'Weekend College and Distance Learning'
5 'Weekend College, Distance Learning and FtoF'
6 'Distance Learning and FtoF'
7 'Weekend College and FtoF'.



