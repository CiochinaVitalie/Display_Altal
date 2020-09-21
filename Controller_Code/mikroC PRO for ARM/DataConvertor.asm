_ReadHighPressure:
;DataConvertor.c,17 :: 		float  ReadHighPressure (int high_press){
; high_press start address is: 0 (R0)
; high_press end address is: 0 (R0)
; high_press start address is: 0 (R0)
;DataConvertor.c,18 :: 		return ((high_press - Low_Limit_HP) * HP_max/ (Hi_Limit_HP - Low_Limit_HP));
VMOV	S1, R0
VCVT.F32	#1, S1, S1
; high_press end address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #17100
VMOV	S0, R1
VSUB.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #16904
VMOV	S0, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17485
VMOV	S0, R1
VDIV.F32	S0, S1, S0
;DataConvertor.c,19 :: 		}
L_end_ReadHighPressure:
BX	LR
; end of _ReadHighPressure
_ReadLowPressure:
;DataConvertor.c,22 :: 		float  ReadLowPressure (int low_press){
; low_press start address is: 0 (R0)
; low_press end address is: 0 (R0)
; low_press start address is: 0 (R0)
;DataConvertor.c,23 :: 		return ((low_press - Low_Limit_LP) * LP_max/ (Hi_Limit_LP - Low_Limit_LP) );
VMOV	S1, R0
VCVT.F32	#1, S1, S1
; low_press end address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #17100
VMOV	S0, R1
VSUB.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17485
VMOV	S0, R1
VDIV.F32	S0, S1, S0
;DataConvertor.c,24 :: 		}
L_end_ReadLowPressure:
BX	LR
; end of _ReadLowPressure
_calc_temperature:
;DataConvertor.c,26 :: 		int calc_temperature(unsigned int adcsum) {
; adcsum start address is: 0 (R0)
; adcsum end address is: 0 (R0)
; adcsum start address is: 0 (R0)
;DataConvertor.c,29 :: 		uint8_t l = 0;
; l start address is: 16 (R4)
MOVS	R4, #0
;DataConvertor.c,31 :: 		r = (sizeof(termo_table) / sizeof(termo_table[0])) - 1;
; r start address is: 12 (R3)
MOVW	R3, #29
;DataConvertor.c,32 :: 		thigh = termo_table[r];
MOVS	R2, #58
MOVW	R1, #lo_addr(_termo_table+0)
MOVT	R1, #hi_addr(_termo_table+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
; thigh start address is: 8 (R2)
UXTH	R2, R1
;DataConvertor.c,35 :: 		if (adcsum <= thigh) {
CMP	R0, R1
IT	HI
BHI	L_calc_temperature0
; l end address is: 16 (R4)
;DataConvertor.c,37 :: 		if (adcsum < thigh)
CMP	R0, R2
IT	CS
BCS	L_calc_temperature1
; thigh end address is: 8 (R2)
; adcsum end address is: 0 (R0)
; r end address is: 12 (R3)
;DataConvertor.c,38 :: 		return TEMPERATURE_UNDER;
MOVW	R0, #1250
SXTH	R0, R0
IT	AL
BAL	L_end_calc_temperature
L_calc_temperature1:
;DataConvertor.c,40 :: 		return TEMPERATURE_TABLE_STEP * r + TEMPERATURE_TABLE_START;
; r start address is: 12 (R3)
MOVW	R1, #65486
MULS	R1, R3, R1
UXTH	R1, R1
; r end address is: 12 (R3)
ADDW	R1, R1, #1250
SXTH	R0, R1
IT	AL
BAL	L_end_calc_temperature
;DataConvertor.c,41 :: 		}
L_calc_temperature0:
;DataConvertor.c,42 :: 		tlow = termo_table[0];
; r start address is: 12 (R3)
; l start address is: 16 (R4)
; adcsum start address is: 0 (R0)
; tlow start address is: 8 (R2)
MOVW	R2, #1001
;DataConvertor.c,43 :: 		if (adcsum >= tlow) {
MOVW	R1, #1001
CMP	R0, R1
IT	CC
BCC	L_calc_temperature2
; l end address is: 16 (R4)
; r end address is: 12 (R3)
;DataConvertor.c,45 :: 		if (adcsum > tlow)
CMP	R0, R2
IT	LS
BLS	L_calc_temperature3
; tlow end address is: 8 (R2)
; adcsum end address is: 0 (R0)
;DataConvertor.c,46 :: 		return TEMPERATURE_OVER;
MOVW	R0, #65336
SXTH	R0, R0
IT	AL
BAL	L_end_calc_temperature
L_calc_temperature3:
;DataConvertor.c,48 :: 		return TEMPERATURE_TABLE_START;
MOVW	R0, #1250
SXTH	R0, R0
IT	AL
BAL	L_end_calc_temperature
;DataConvertor.c,49 :: 		}
L_calc_temperature2:
;DataConvertor.c,52 :: 		while ((r - l) > 1) {
; r start address is: 12 (R3)
; l start address is: 16 (R4)
; adcsum start address is: 0 (R0)
; l end address is: 16 (R4)
; r end address is: 12 (R3)
L_calc_temperature4:
; adcsum end address is: 0 (R0)
; r start address is: 12 (R3)
; l start address is: 16 (R4)
; adcsum start address is: 0 (R0)
SUB	R1, R3, R4
UXTH	R1, R1
CMP	R1, #1
IT	LS
BLS	L_calc_temperature5
;DataConvertor.c,53 :: 		uint8_t m = (l + r) >> 1;
ADDS	R1, R4, R3
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
; m start address is: 20 (R5)
UXTB	R5, R1
;DataConvertor.c,54 :: 		uint16_t mid = termo_table[m];
UXTB	R1, R1
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(_termo_table+0)
MOVT	R1, #hi_addr(_termo_table+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
;DataConvertor.c,55 :: 		if (adcsum > mid) {
CMP	R0, R1
IT	LS
BLS	L_calc_temperature6
; r end address is: 12 (R3)
;DataConvertor.c,56 :: 		r = m;
; r start address is: 4 (R1)
UXTB	R1, R5
; m end address is: 20 (R5)
;DataConvertor.c,57 :: 		} else {
UXTH	R3, R1
; r end address is: 4 (R1)
; l end address is: 16 (R4)
IT	AL
BAL	L_calc_temperature7
L_calc_temperature6:
;DataConvertor.c,58 :: 		l = m;
; r start address is: 12 (R3)
; l start address is: 4 (R1)
; m start address is: 20 (R5)
UXTB	R1, R5
; m end address is: 20 (R5)
; l end address is: 4 (R1)
; r end address is: 12 (R3)
UXTB	R4, R1
;DataConvertor.c,59 :: 		}
L_calc_temperature7:
;DataConvertor.c,60 :: 		}
; l start address is: 16 (R4)
; r start address is: 12 (R3)
IT	AL
BAL	L_calc_temperature4
L_calc_temperature5:
;DataConvertor.c,61 :: 		vl = termo_table[l];
LSLS	R2, R4, #1
MOVW	R1, #lo_addr(_termo_table+0)
MOVT	R1, #hi_addr(_termo_table+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
; vl start address is: 20 (R5)
UXTH	R5, R1
;DataConvertor.c,62 :: 		if (adcsum >= vl) {
CMP	R0, R1
IT	CC
BCC	L_calc_temperature8
; adcsum end address is: 0 (R0)
; r end address is: 12 (R3)
; vl end address is: 20 (R5)
;DataConvertor.c,63 :: 		return l * TEMPERATURE_TABLE_STEP + TEMPERATURE_TABLE_START;
MOVW	R1, #65486
SXTH	R1, R1
MULS	R1, R4, R1
SXTH	R1, R1
; l end address is: 16 (R4)
ADDW	R1, R1, #1250
SXTH	R0, R1
IT	AL
BAL	L_end_calc_temperature
;DataConvertor.c,64 :: 		}
L_calc_temperature8:
;DataConvertor.c,65 :: 		vr = termo_table[r];
; vl start address is: 20 (R5)
; r start address is: 12 (R3)
; adcsum start address is: 0 (R0)
LSLS	R2, R3, #1
MOVW	R1, #lo_addr(_termo_table+0)
MOVT	R1, #hi_addr(_termo_table+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
; vr start address is: 24 (R6)
UXTH	R6, R1
;DataConvertor.c,66 :: 		vd = vl - vr;
SUB	R2, R5, R1
UXTH	R2, R2
; vl end address is: 20 (R5)
; vd start address is: 16 (R4)
UXTH	R4, R2
;DataConvertor.c,67 :: 		res = TEMPERATURE_TABLE_START + r * TEMPERATURE_TABLE_STEP;
MOVW	R1, #65486
MULS	R1, R3, R1
UXTH	R1, R1
; r end address is: 12 (R3)
ADDW	R1, R1, #1250
; res start address is: 12 (R3)
SXTH	R3, R1
;DataConvertor.c,68 :: 		if (vd) {
CMP	R2, #0
IT	EQ
BEQ	L__calc_temperature10
;DataConvertor.c,70 :: 		res -= ((TEMPERATURE_TABLE_STEP * (int32_t)(adcsum - vr) + (vd >> 1)) / vd);
SUB	R1, R0, R6
UXTH	R1, R1
; adcsum end address is: 0 (R0)
; vr end address is: 24 (R6)
UXTH	R2, R1
MVN	R1, #49
MULS	R2, R1, R2
LSRS	R1, R4, #1
UXTH	R1, R1
ADDS	R1, R2, R1
SDIV	R1, R1, R4
; vd end address is: 16 (R4)
SUB	R1, R3, R1
; res end address is: 12 (R3)
; res start address is: 0 (R0)
SXTH	R0, R1
; res end address is: 0 (R0)
;DataConvertor.c,71 :: 		}
IT	AL
BAL	L_calc_temperature9
L__calc_temperature10:
;DataConvertor.c,68 :: 		if (vd) {
SXTH	R0, R3
;DataConvertor.c,71 :: 		}
L_calc_temperature9:
;DataConvertor.c,72 :: 		return res;
; res start address is: 0 (R0)
; res end address is: 0 (R0)
;DataConvertor.c,73 :: 		}
L_end_calc_temperature:
BX	LR
; end of _calc_temperature
