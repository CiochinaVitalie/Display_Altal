_HP_display:
;Gauge.c,35 :: 		void HP_display(int pressure)
; pressure start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; pressure end address is: 0 (R0)
; pressure start address is: 0 (R0)
;Gauge.c,41 :: 		HP_pressure = pressure*10.0 + 5;
VMOV	S1, R0
VCVT.F32	#1, S1, S1
; pressure end address is: 0 (R0)
VMOV.F32	S0, #10
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #5
VADD.F32	S1, S1, S0
; HP_pressure start address is: 8 (R2)
VMOV.F32	S2, S1
;Gauge.c,42 :: 		if(old_HP_pressure !=HP_pressure){ old_HP_pressure= HP_pressure;}
MOVW	R1, #lo_addr(_old_HP_pressure+0)
MOVT	R1, #hi_addr(_old_HP_pressure+0)
VLDR	#1, S0, [R1, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	EQ
BEQ	L_HP_display0
MOVW	R1, #lo_addr(_old_HP_pressure+0)
MOVT	R1, #hi_addr(_old_HP_pressure+0)
VSTR	#1, S2, [R1, #0]
IT	AL
BAL	L_HP_display1
; HP_pressure end address is: 8 (R2)
L_HP_display0:
;Gauge.c,43 :: 		else return;
IT	AL
BAL	L_end_HP_display
L_HP_display1:
;Gauge.c,45 :: 		DrawImage(&HP1_gauge);
; HP_pressure start address is: 8 (R2)
VSTR	#1, S2, [SP, #4]
MOVW	R0, #lo_addr(_HP1_gauge+0)
MOVT	R0, #hi_addr(_HP1_gauge+0)
BL	_DrawImage+0
VLDR	#1, S2, [SP, #4]
;Gauge.c,47 :: 		TFT_Set_Pen(CL_BLUE, 2);
MOVS	R1, #2
MOVW	R0, #31
BL	_TFT_Set_Pen+0
;Gauge.c,49 :: 		if( HP_pressure <= 0.0f )
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	GT
BGT	L_HP_display2
; HP_pressure end address is: 8 (R2)
;Gauge.c,52 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_sin+0
VMOV.F32	S1, #5
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17148
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
STRH	R2, [R1, #0]
;Gauge.c,54 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
VMOV.F32	S0, #5
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
STRH	R2, [R1, #0]
;Gauge.c,56 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_sin+0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S1, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17148
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
STRH	R2, [R1, #0]
;Gauge.c,58 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S0, R1
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
STRH	R2, [R1, #0]
;Gauge.c,59 :: 		}
IT	AL
BAL	L_HP_display3
L_HP_display2:
;Gauge.c,60 :: 		else if( HP_pressure >= 360.0f )
; HP_pressure start address is: 8 (R2)
MOVW	R1, #0
MOVT	R1, #17332
VMOV	S0, R1
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_HP_display4
; HP_pressure end address is: 8 (R2)
;Gauge.c,63 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_sin+0
VMOV.F32	S1, #5
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17148
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
STRH	R2, [R1, #0]
;Gauge.c,65 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
VMOV.F32	S0, #5
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
STRH	R2, [R1, #0]
;Gauge.c,67 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_sin+0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S1, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17148
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
STRH	R2, [R1, #0]
;Gauge.c,69 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S0, R1
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
STRH	R2, [R1, #0]
;Gauge.c,70 :: 		}
IT	AL
BAL	L_HP_display5
L_HP_display4:
;Gauge.c,73 :: 		current_line.x1 = ( int )( X_CENTER_HP + ( INNER_RADIUS * sin( (HP_pressure +180)*
; HP_pressure start address is: 8 (R2)
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
;Gauge.c,74 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VSTR	#1, S2, [SP, #4]
BL	_sin+0
VLDR	#1, S2, [SP, #4]
VMOV.F32	S1, #5
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17148
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
STRH	R2, [R1, #0]
;Gauge.c,75 :: 		current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( (HP_pressure +180) *
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
;Gauge.c,76 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VSTR	#1, S2, [SP, #4]
BL	_cos+0
VLDR	#1, S2, [SP, #4]
VNEG.F32	S1, S0
VMOV.F32	S0, #5
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
STRH	R2, [R1, #0]
;Gauge.c,77 :: 		current_line.x2 = ( int )( X_CENTER_HP + ( OUTER_RADIUS * sin( (HP_pressure +180) *
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
;Gauge.c,78 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VSTR	#1, S2, [SP, #4]
BL	_sin+0
VLDR	#1, S2, [SP, #4]
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S1, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17148
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
STRH	R2, [R1, #0]
;Gauge.c,79 :: 		current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( (HP_pressure +180) *
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
; HP_pressure end address is: 8 (R2)
;Gauge.c,80 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
BL	_cos+0
VNEG.F32	S1, S0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S0, R1
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
STRH	R2, [R1, #0]
;Gauge.c,81 :: 		}
L_HP_display5:
L_HP_display3:
;Gauge.c,84 :: 		TFT_Line( current_line.x1, current_line.y1, current_line.x2, current_line.y2 );
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
LDRSH	R4, [R1, #0]
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
LDRSH	R3, [R1, #0]
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R4
BL	_TFT_Line+0
;Gauge.c,85 :: 		}
L_end_HP_display:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _HP_display
_LP_display:
;Gauge.c,87 :: 		void LP_display(int pressure)
; pressure start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; pressure end address is: 0 (R0)
; pressure start address is: 0 (R0)
;Gauge.c,94 :: 		LP_pressure = pressure * 33.3 + 42;
VMOV	S1, R0
VCVT.F32	#1, S1, S1
; pressure end address is: 0 (R0)
MOVW	R1, #13107
MOVT	R1, #16901
VMOV	S0, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #16936
VMOV	S0, R1
VADD.F32	S1, S1, S0
; LP_pressure start address is: 8 (R2)
VMOV.F32	S2, S1
;Gauge.c,95 :: 		if( old_LP_pressure != LP_pressure){ old_LP_pressure= LP_pressure;}
MOVW	R1, #lo_addr(_old_LP_pressure+0)
MOVT	R1, #hi_addr(_old_LP_pressure+0)
VLDR	#1, S0, [R1, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	EQ
BEQ	L_LP_display6
MOVW	R1, #lo_addr(_old_LP_pressure+0)
MOVT	R1, #hi_addr(_old_LP_pressure+0)
VSTR	#1, S2, [R1, #0]
IT	AL
BAL	L_LP_display7
; LP_pressure end address is: 8 (R2)
L_LP_display6:
;Gauge.c,96 :: 		else return;
IT	AL
BAL	L_end_LP_display
L_LP_display7:
;Gauge.c,98 :: 		DrawImage(&LP1_gauge);
; LP_pressure start address is: 8 (R2)
VSTR	#1, S2, [SP, #4]
MOVW	R0, #lo_addr(_LP1_gauge+0)
MOVT	R0, #hi_addr(_LP1_gauge+0)
BL	_DrawImage+0
VLDR	#1, S2, [SP, #4]
;Gauge.c,100 :: 		TFT_Set_Pen(CL_BLUE, 2);
MOVS	R1, #2
MOVW	R0, #31
BL	_TFT_Set_Pen+0
;Gauge.c,102 :: 		if(  LP_pressure <= 0.0f )
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	GT
BGT	L_LP_display8
; LP_pressure end address is: 8 (R2)
;Gauge.c,105 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_sin+0
VMOV.F32	S1, #5
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17324
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
STRH	R2, [R1, #0]
;Gauge.c,107 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
VMOV.F32	S0, #5
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
STRH	R2, [R1, #0]
;Gauge.c,109 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_sin+0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S1, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17324
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
STRH	R2, [R1, #0]
;Gauge.c,111 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #42401
MOVT	R1, #16462
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S0, R1
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
STRH	R2, [R1, #0]
;Gauge.c,112 :: 		}
IT	AL
BAL	L_LP_display9
L_LP_display8:
;Gauge.c,113 :: 		else if( LP_pressure >= 360.0f )
; LP_pressure start address is: 8 (R2)
MOVW	R1, #0
MOVT	R1, #17332
VMOV	S0, R1
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_LP_display10
; LP_pressure end address is: 8 (R2)
;Gauge.c,116 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_sin+0
VMOV.F32	S1, #5
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17324
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
STRH	R2, [R1, #0]
;Gauge.c,118 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
VMOV.F32	S0, #5
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
STRH	R2, [R1, #0]
;Gauge.c,120 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_sin+0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S1, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17324
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
STRH	R2, [R1, #0]
;Gauge.c,122 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #38921
MOVT	R1, #16452
VMOV	S0, R1
BL	_cos+0
VNEG.F32	S1, S0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S0, R1
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
STRH	R2, [R1, #0]
;Gauge.c,123 :: 		}
IT	AL
BAL	L_LP_display11
L_LP_display10:
;Gauge.c,126 :: 		current_line.x1 = ( int )( X_CENTER_LP + ( INNER_RADIUS * sin( ( LP_pressure + 180)*
; LP_pressure start address is: 8 (R2)
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
;Gauge.c,127 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VSTR	#1, S2, [SP, #4]
BL	_sin+0
VLDR	#1, S2, [SP, #4]
VMOV.F32	S1, #5
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17324
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
STRH	R2, [R1, #0]
;Gauge.c,128 :: 		current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( ( LP_pressure + 180) *
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
;Gauge.c,129 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VSTR	#1, S2, [SP, #4]
BL	_cos+0
VLDR	#1, S2, [SP, #4]
VNEG.F32	S1, S0
VMOV.F32	S0, #5
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
STRH	R2, [R1, #0]
;Gauge.c,130 :: 		current_line.x2 = ( int )( X_CENTER_LP + ( OUTER_RADIUS * sin( ( LP_pressure + 180) *
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
;Gauge.c,131 :: 		( PI / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VSTR	#1, S2, [SP, #4]
BL	_sin+0
VLDR	#1, S2, [SP, #4]
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S1, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17324
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
STRH	R2, [R1, #0]
;Gauge.c,132 :: 		current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( ( LP_pressure + 180) *
MOVW	R1, #0
MOVT	R1, #17204
VMOV	S0, R1
VADD.F32	S1, S2, S0
; LP_pressure end address is: 8 (R2)
;Gauge.c,133 :: 		( PI  / 180.0f ) ) ) );
MOVW	R1, #64053
MOVT	R1, #15502
VMOV	S0, R1
VMUL.F32	S0, S1, S0
BL	_cos+0
VNEG.F32	S1, S0
MOVW	R1, #0
MOVT	R1, #17056
VMOV	S0, R1
VMUL.F32	S1, S0, S1
MOV	R1, #1124073472
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
STRH	R2, [R1, #0]
;Gauge.c,134 :: 		}
L_LP_display11:
L_LP_display9:
;Gauge.c,137 :: 		TFT_Line( current_line.x1, current_line.y1, current_line.x2, current_line.y2 );
MOVW	R1, #lo_addr(_current_line+6)
MOVT	R1, #hi_addr(_current_line+6)
LDRSH	R4, [R1, #0]
MOVW	R1, #lo_addr(_current_line+4)
MOVT	R1, #hi_addr(_current_line+4)
LDRSH	R3, [R1, #0]
MOVW	R1, #lo_addr(_current_line+2)
MOVT	R1, #hi_addr(_current_line+2)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(_current_line+0)
MOVT	R1, #hi_addr(_current_line+0)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R4
BL	_TFT_Line+0
;Gauge.c,140 :: 		}
L_end_LP_display:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _LP_display
