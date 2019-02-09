_find_errors:
;Errors.c,9 :: 		void find_errors(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Errors.c,10 :: 		if(system_reg[ERRORS_1]==0){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_find_errors0
;Errors.c,12 :: 		}
L_find_errors0:
;Errors.c,13 :: 		if(system_reg[ERRORS_1]==11 || system_reg[ERRORS_2]==12){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L__find_errors191
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L__find_errors190
IT	AL
BAL	L_find_errors3
L__find_errors191:
L__find_errors190:
;Errors.c,14 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,15 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,16 :: 		if(system_reg[ERRORS_1]==11)strcpy( Label2.Caption,"No_Dhw_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #11
IT	NE
BNE	L_find_errors4
MOVW	R1, #lo_addr(?lstr1_Errors+0)
MOVT	R1, #hi_addr(?lstr1_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors5
L_find_errors4:
;Errors.c,17 :: 		else   strcpy( Label2.Caption,"No_Dhw_Sens_2 !");
MOVW	R1, #lo_addr(?lstr2_Errors+0)
MOVT	R1, #hi_addr(?lstr2_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors5:
;Errors.c,19 :: 		}
IT	AL
BAL	L_find_errors6
L_find_errors3:
;Errors.c,20 :: 		else if(system_reg[ERRORS_1]==21  || system_reg[ERRORS_2]==22){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #21
IT	EQ
BEQ	L__find_errors193
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #22
IT	EQ
BEQ	L__find_errors192
IT	AL
BAL	L_find_errors9
L__find_errors193:
L__find_errors192:
;Errors.c,21 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,22 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,23 :: 		if(system_reg[ERRORS_1]==21)strcpy( Label2.Caption,"No_Bac_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #21
IT	NE
BNE	L_find_errors10
MOVW	R1, #lo_addr(?lstr3_Errors+0)
MOVT	R1, #hi_addr(?lstr3_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors11
L_find_errors10:
;Errors.c,24 :: 		else   strcpy( Label2.Caption,"No_Bac_Sens_2 !");
MOVW	R1, #lo_addr(?lstr4_Errors+0)
MOVT	R1, #hi_addr(?lstr4_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors11:
;Errors.c,25 :: 		}
IT	AL
BAL	L_find_errors12
L_find_errors9:
;Errors.c,26 :: 		else if(system_reg[ERRORS_1]==31 || system_reg[ERRORS_2]==32){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #31
IT	EQ
BEQ	L__find_errors195
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #32
IT	EQ
BEQ	L__find_errors194
IT	AL
BAL	L_find_errors15
L__find_errors195:
L__find_errors194:
;Errors.c,27 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,28 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,29 :: 		if(system_reg[ERRORS_1]==31)strcpy( Label2.Caption,"No_Heat_Out_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #31
IT	NE
BNE	L_find_errors16
MOVW	R1, #lo_addr(?lstr5_Errors+0)
MOVT	R1, #hi_addr(?lstr5_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors17
L_find_errors16:
;Errors.c,30 :: 		else   strcpy( Label2.Caption,"No_Heat_Out_Sens_2 !");
MOVW	R1, #lo_addr(?lstr6_Errors+0)
MOVT	R1, #hi_addr(?lstr6_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors17:
;Errors.c,31 :: 		}
IT	AL
BAL	L_find_errors18
L_find_errors15:
;Errors.c,32 :: 		else if(system_reg[ERRORS_1]==41 || system_reg[ERRORS_2]==42){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #41
IT	EQ
BEQ	L__find_errors197
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #42
IT	EQ
BEQ	L__find_errors196
IT	AL
BAL	L_find_errors21
L__find_errors197:
L__find_errors196:
;Errors.c,33 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,34 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,35 :: 		if(system_reg[ERRORS_1]==41)strcpy( Label2.Caption,"No_Heat_In_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #41
IT	NE
BNE	L_find_errors22
MOVW	R1, #lo_addr(?lstr7_Errors+0)
MOVT	R1, #hi_addr(?lstr7_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors23
L_find_errors22:
;Errors.c,36 :: 		else   strcpy( Label2.Caption,"No_Heat_In_Sens_2 !");
MOVW	R1, #lo_addr(?lstr8_Errors+0)
MOVT	R1, #hi_addr(?lstr8_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors23:
;Errors.c,37 :: 		}
IT	AL
BAL	L_find_errors24
L_find_errors21:
;Errors.c,38 :: 		else if(system_reg[ERRORS_1]==51 || system_reg[ERRORS_2]==52){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #51
IT	EQ
BEQ	L__find_errors199
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #52
IT	EQ
BEQ	L__find_errors198
IT	AL
BAL	L_find_errors27
L__find_errors199:
L__find_errors198:
;Errors.c,39 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,40 :: 		if(system_reg[ERRORS_1]==51)strcpy( Label2.Caption,"No_Src_In_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #51
IT	NE
BNE	L_find_errors28
MOVW	R1, #lo_addr(?lstr9_Errors+0)
MOVT	R1, #hi_addr(?lstr9_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors29
L_find_errors28:
;Errors.c,41 :: 		else   strcpy( Label2.Caption,"No_Src_In_Sens_2 !");
MOVW	R1, #lo_addr(?lstr10_Errors+0)
MOVT	R1, #hi_addr(?lstr10_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors29:
;Errors.c,42 :: 		}
IT	AL
BAL	L_find_errors30
L_find_errors27:
;Errors.c,43 :: 		else if(system_reg[ERRORS_1]==61 || system_reg[ERRORS_2]==62){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #61
IT	EQ
BEQ	L__find_errors201
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #62
IT	EQ
BEQ	L__find_errors200
IT	AL
BAL	L_find_errors33
L__find_errors201:
L__find_errors200:
;Errors.c,44 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,45 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,46 :: 		if(system_reg[ERRORS_1]==61)strcpy( Label2.Caption,"No_Src_Out_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #61
IT	NE
BNE	L_find_errors34
MOVW	R1, #lo_addr(?lstr11_Errors+0)
MOVT	R1, #hi_addr(?lstr11_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors35
L_find_errors34:
;Errors.c,47 :: 		else   strcpy( Label2.Caption,"No_Src_Out_Sens_2 !");
MOVW	R1, #lo_addr(?lstr12_Errors+0)
MOVT	R1, #hi_addr(?lstr12_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors35:
;Errors.c,48 :: 		}
IT	AL
BAL	L_find_errors36
L_find_errors33:
;Errors.c,49 :: 		else if(system_reg[ERRORS_1]==71 || system_reg[ERRORS_2]==72){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #71
IT	EQ
BEQ	L__find_errors203
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #72
IT	EQ
BEQ	L__find_errors202
IT	AL
BAL	L_find_errors39
L__find_errors203:
L__find_errors202:
;Errors.c,50 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,51 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,52 :: 		if(system_reg[ERRORS_1]==71)strcpy( Label2.Caption,"No_Ex_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #71
IT	NE
BNE	L_find_errors40
MOVW	R1, #lo_addr(?lstr13_Errors+0)
MOVT	R1, #hi_addr(?lstr13_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors41
L_find_errors40:
;Errors.c,53 :: 		else   strcpy( Label2.Caption,"No_Ex_Sens_2 !");
MOVW	R1, #lo_addr(?lstr14_Errors+0)
MOVT	R1, #hi_addr(?lstr14_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors41:
;Errors.c,54 :: 		}
IT	AL
BAL	L_find_errors42
L_find_errors39:
;Errors.c,55 :: 		else if(system_reg[ERRORS_1]==81 || system_reg[ERRORS_2]==82){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #81
IT	EQ
BEQ	L__find_errors205
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #82
IT	EQ
BEQ	L__find_errors204
IT	AL
BAL	L_find_errors45
L__find_errors205:
L__find_errors204:
;Errors.c,56 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,57 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,59 :: 		if(system_reg[ERRORS_1]==81)strcpy( Label2.Caption,"No_Suc_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #81
IT	NE
BNE	L_find_errors46
MOVW	R1, #lo_addr(?lstr15_Errors+0)
MOVT	R1, #hi_addr(?lstr15_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors47
L_find_errors46:
;Errors.c,60 :: 		else   strcpy( Label2.Caption,"No_Suc_Sens_2 !");
MOVW	R1, #lo_addr(?lstr16_Errors+0)
MOVT	R1, #hi_addr(?lstr16_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors47:
;Errors.c,61 :: 		}
IT	AL
BAL	L_find_errors48
L_find_errors45:
;Errors.c,62 :: 		else if(system_reg[ERRORS_1]==91 || system_reg[ERRORS_2]==92){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #91
IT	EQ
BEQ	L__find_errors207
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #92
IT	EQ
BEQ	L__find_errors206
IT	AL
BAL	L_find_errors51
L__find_errors207:
L__find_errors206:
;Errors.c,63 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,64 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,65 :: 		if(system_reg[ERRORS_1]==91)strcpy( Label2.Caption,"No_Cond_Sens_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #91
IT	NE
BNE	L_find_errors52
MOVW	R1, #lo_addr(?lstr17_Errors+0)
MOVT	R1, #hi_addr(?lstr17_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors53
L_find_errors52:
;Errors.c,66 :: 		else   strcpy( Label2.Caption,"No_Cond_Sens_2 !");
MOVW	R1, #lo_addr(?lstr18_Errors+0)
MOVT	R1, #hi_addr(?lstr18_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors53:
;Errors.c,67 :: 		}
IT	AL
BAL	L_find_errors54
L_find_errors51:
;Errors.c,68 :: 		else if(system_reg[ERRORS_1]==101 || system_reg[ERRORS_2]==102){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #101
IT	EQ
BEQ	L__find_errors209
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #102
IT	EQ
BEQ	L__find_errors208
IT	AL
BAL	L_find_errors57
L__find_errors209:
L__find_errors208:
;Errors.c,69 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,70 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,71 :: 		if(system_reg[ERRORS_1]==101)strcpy( Label2.Caption,"Check_Heat_Flow_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #101
IT	NE
BNE	L_find_errors58
MOVW	R1, #lo_addr(?lstr19_Errors+0)
MOVT	R1, #hi_addr(?lstr19_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors59
L_find_errors58:
;Errors.c,72 :: 		else   strcpy( Label2.Caption,"Check_Heat_Flow_2 !");
MOVW	R1, #lo_addr(?lstr20_Errors+0)
MOVT	R1, #hi_addr(?lstr20_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors59:
;Errors.c,73 :: 		}
IT	AL
BAL	L_find_errors60
L_find_errors57:
;Errors.c,74 :: 		else if(system_reg[ERRORS_1]==111 || system_reg[ERRORS_2]==112){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #111
IT	EQ
BEQ	L__find_errors211
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #112
IT	EQ
BEQ	L__find_errors210
IT	AL
BAL	L_find_errors63
L__find_errors211:
L__find_errors210:
;Errors.c,75 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,76 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,77 :: 		if(system_reg[ERRORS_1]==81)strcpy( Label2.Caption,"Check_Src_Flow_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #81
IT	NE
BNE	L_find_errors64
MOVW	R1, #lo_addr(?lstr21_Errors+0)
MOVT	R1, #hi_addr(?lstr21_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors65
L_find_errors64:
;Errors.c,78 :: 		else   strcpy( Label2.Caption,"Check_Src_Flow_2 !");
MOVW	R1, #lo_addr(?lstr22_Errors+0)
MOVT	R1, #hi_addr(?lstr22_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors65:
;Errors.c,79 :: 		}
IT	AL
BAL	L_find_errors66
L_find_errors63:
;Errors.c,80 :: 		else if(system_reg[ERRORS_1]==121 || system_reg[ERRORS_2]==122){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #121
IT	EQ
BEQ	L__find_errors213
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #122
IT	EQ
BEQ	L__find_errors212
IT	AL
BAL	L_find_errors69
L__find_errors213:
L__find_errors212:
;Errors.c,81 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,82 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,83 :: 		if(system_reg[ERRORS_1]==121)strcpy( Label2.Caption,"Low_LowPressure_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #121
IT	NE
BNE	L_find_errors70
MOVW	R1, #lo_addr(?lstr23_Errors+0)
MOVT	R1, #hi_addr(?lstr23_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors71
L_find_errors70:
;Errors.c,84 :: 		else   strcpy( Label2.Caption,"Low_LowPressure_2 !");
MOVW	R1, #lo_addr(?lstr24_Errors+0)
MOVT	R1, #hi_addr(?lstr24_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors71:
;Errors.c,86 :: 		}
IT	AL
BAL	L_find_errors72
L_find_errors69:
;Errors.c,87 :: 		else if(system_reg[ERRORS_1]==131 || system_reg[ERRORS_2]==132){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #131
IT	EQ
BEQ	L__find_errors215
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #132
IT	EQ
BEQ	L__find_errors214
IT	AL
BAL	L_find_errors75
L__find_errors215:
L__find_errors214:
;Errors.c,88 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,89 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,90 :: 		if(system_reg[ERRORS_1]==131)strcpy( Label2.Caption,"High_LowPressure_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L_find_errors76
MOVW	R1, #lo_addr(?lstr25_Errors+0)
MOVT	R1, #hi_addr(?lstr25_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors77
L_find_errors76:
;Errors.c,91 :: 		else   strcpy( Label2.Caption,"High_LowPressure_2 !");
MOVW	R1, #lo_addr(?lstr26_Errors+0)
MOVT	R1, #hi_addr(?lstr26_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors77:
;Errors.c,92 :: 		}
IT	AL
BAL	L_find_errors78
L_find_errors75:
;Errors.c,93 :: 		else if(system_reg[ERRORS_1]==141 || system_reg[ERRORS_2]==142){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #141
IT	EQ
BEQ	L__find_errors217
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #142
IT	EQ
BEQ	L__find_errors216
IT	AL
BAL	L_find_errors81
L__find_errors217:
L__find_errors216:
;Errors.c,94 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,95 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption) );
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,96 :: 		if(system_reg[ERRORS_1]==141)strcpy( Label2.Caption,"High_HighPressure_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #141
IT	NE
BNE	L_find_errors82
MOVW	R1, #lo_addr(?lstr27_Errors+0)
MOVT	R1, #hi_addr(?lstr27_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors83
L_find_errors82:
;Errors.c,97 :: 		else   strcpy( Label2.Caption,"High_HighPressure_2 !");
MOVW	R1, #lo_addr(?lstr28_Errors+0)
MOVT	R1, #hi_addr(?lstr28_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors83:
;Errors.c,98 :: 		}
IT	AL
BAL	L_find_errors84
L_find_errors81:
;Errors.c,99 :: 		else if(system_reg[ERRORS_1]==151 || system_reg[ERRORS_2]==152){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #151
IT	EQ
BEQ	L__find_errors219
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #152
IT	EQ
BEQ	L__find_errors218
IT	AL
BAL	L_find_errors87
L__find_errors219:
L__find_errors218:
;Errors.c,100 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,101 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,102 :: 		if(system_reg[ERRORS_1]==151)strcpy( Label2.Caption,"Low_HighPressure_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #151
IT	NE
BNE	L_find_errors88
MOVW	R1, #lo_addr(?lstr29_Errors+0)
MOVT	R1, #hi_addr(?lstr29_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors89
L_find_errors88:
;Errors.c,103 :: 		else   strcpy( Label2.Caption,"Low_HighPressure_2 !");
MOVW	R1, #lo_addr(?lstr30_Errors+0)
MOVT	R1, #hi_addr(?lstr30_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors89:
;Errors.c,104 :: 		}
IT	AL
BAL	L_find_errors90
L_find_errors87:
;Errors.c,105 :: 		else if(system_reg[ERRORS_1]==161 || system_reg[ERRORS_2]==162){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #161
IT	EQ
BEQ	L__find_errors221
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #162
IT	EQ
BEQ	L__find_errors220
IT	AL
BAL	L_find_errors93
L__find_errors221:
L__find_errors220:
;Errors.c,106 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,107 :: 		strcpy( Label2.Caption,"High_Bac_Temp!");
MOVW	R1, #lo_addr(?lstr31_Errors+0)
MOVT	R1, #hi_addr(?lstr31_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,108 :: 		}
IT	AL
BAL	L_find_errors94
L_find_errors93:
;Errors.c,109 :: 		else if(system_reg[ERRORS_1]==171 || system_reg[ERRORS_2]==172){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #171
IT	EQ
BEQ	L__find_errors223
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #172
IT	EQ
BEQ	L__find_errors222
IT	AL
BAL	L_find_errors97
L__find_errors223:
L__find_errors222:
;Errors.c,110 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,111 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,112 :: 		strcpy( Label2.Caption,"Low_Bac_Temp!");
MOVW	R1, #lo_addr(?lstr32_Errors+0)
MOVT	R1, #hi_addr(?lstr32_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,113 :: 		}
IT	AL
BAL	L_find_errors98
L_find_errors97:
;Errors.c,114 :: 		else if(system_reg[ERRORS_1]==181 || system_reg[ERRORS_2]== 182){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #181
IT	EQ
BEQ	L__find_errors225
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #182
IT	EQ
BEQ	L__find_errors224
IT	AL
BAL	L_find_errors101
L__find_errors225:
L__find_errors224:
;Errors.c,115 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,116 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,117 :: 		if(system_reg[ERRORS_1]==181)strcpy( Label2.Caption,"SuperHeat_Low_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #181
IT	NE
BNE	L_find_errors102
MOVW	R1, #lo_addr(?lstr33_Errors+0)
MOVT	R1, #hi_addr(?lstr33_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors103
L_find_errors102:
;Errors.c,118 :: 		else   strcpy( Label2.Caption,"SuperHeat_Low_2 !");
MOVW	R1, #lo_addr(?lstr34_Errors+0)
MOVT	R1, #hi_addr(?lstr34_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors103:
;Errors.c,119 :: 		}
IT	AL
BAL	L_find_errors104
L_find_errors101:
;Errors.c,120 :: 		else if(system_reg[ERRORS_1]==191 || system_reg[ERRORS_2]==192){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #191
IT	EQ
BEQ	L__find_errors227
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #192
IT	EQ
BEQ	L__find_errors226
IT	AL
BAL	L_find_errors107
L__find_errors227:
L__find_errors226:
;Errors.c,121 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,122 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,123 :: 		if(system_reg[ERRORS_1]==191)strcpy( Label2.Caption,"SuperHeat_High_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #191
IT	NE
BNE	L_find_errors108
MOVW	R1, #lo_addr(?lstr35_Errors+0)
MOVT	R1, #hi_addr(?lstr35_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors109
L_find_errors108:
;Errors.c,124 :: 		else   strcpy( Label2.Caption,"SuperHeat_High_2 !");
MOVW	R1, #lo_addr(?lstr36_Errors+0)
MOVT	R1, #hi_addr(?lstr36_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors109:
;Errors.c,125 :: 		}
IT	AL
BAL	L_find_errors110
L_find_errors107:
;Errors.c,126 :: 		else if(system_reg[ERRORS_1]==201 || system_reg[ERRORS_2]==202){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #201
IT	EQ
BEQ	L__find_errors229
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #202
IT	EQ
BEQ	L__find_errors228
IT	AL
BAL	L_find_errors113
L__find_errors229:
L__find_errors228:
;Errors.c,127 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,128 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,129 :: 		if(system_reg[ERRORS_1]==201)strcpy( Label2.Caption,"SuperCool_Low_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #201
IT	NE
BNE	L_find_errors114
MOVW	R1, #lo_addr(?lstr37_Errors+0)
MOVT	R1, #hi_addr(?lstr37_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors115
L_find_errors114:
;Errors.c,130 :: 		else   strcpy( Label2.Caption,"SuperCool_Low_2 !");
MOVW	R1, #lo_addr(?lstr38_Errors+0)
MOVT	R1, #hi_addr(?lstr38_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors115:
;Errors.c,131 :: 		}
IT	AL
BAL	L_find_errors116
L_find_errors113:
;Errors.c,132 :: 		else if(system_reg[ERRORS_1]==211 || system_reg[ERRORS_2]==212){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #211
IT	EQ
BEQ	L__find_errors231
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #212
IT	EQ
BEQ	L__find_errors230
IT	AL
BAL	L_find_errors119
L__find_errors231:
L__find_errors230:
;Errors.c,133 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,134 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,135 :: 		if(system_reg[ERRORS_1]==211)strcpy( Label2.Caption,"SuperCool_High_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #211
IT	NE
BNE	L_find_errors120
MOVW	R1, #lo_addr(?lstr39_Errors+0)
MOVT	R1, #hi_addr(?lstr39_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors121
L_find_errors120:
;Errors.c,136 :: 		else   strcpy( Label2.Caption,"SuperCool_High_2 !");
MOVW	R1, #lo_addr(?lstr40_Errors+0)
MOVT	R1, #hi_addr(?lstr40_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors121:
;Errors.c,137 :: 		}
IT	AL
BAL	L_find_errors122
L_find_errors119:
;Errors.c,138 :: 		else if(system_reg[ERRORS_1]==221 || system_reg[ERRORS_2]==222){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #221
IT	EQ
BEQ	L__find_errors233
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #222
IT	EQ
BEQ	L__find_errors232
IT	AL
BAL	L_find_errors125
L__find_errors233:
L__find_errors232:
;Errors.c,139 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,140 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,141 :: 		if(system_reg[ERRORS_1]==221)strcpy( Label2.Caption,"Compressor_Is_Hot_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #221
IT	NE
BNE	L_find_errors126
MOVW	R1, #lo_addr(?lstr41_Errors+0)
MOVT	R1, #hi_addr(?lstr41_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors127
L_find_errors126:
;Errors.c,142 :: 		else   strcpy( Label2.Caption,"Compressor_Is_Hot_2 !");
MOVW	R1, #lo_addr(?lstr42_Errors+0)
MOVT	R1, #hi_addr(?lstr42_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors127:
;Errors.c,143 :: 		}
IT	AL
BAL	L_find_errors128
L_find_errors125:
;Errors.c,144 :: 		else if(system_reg[ERRORS_1]==231 || system_reg[ERRORS_2]==232){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #231
IT	EQ
BEQ	L__find_errors235
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #232
IT	EQ
BEQ	L__find_errors234
IT	AL
BAL	L_find_errors131
L__find_errors235:
L__find_errors234:
;Errors.c,145 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,146 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,147 :: 		if(system_reg[ERRORS_1]==231)strcpy( Label2.Caption,"Delta_Source_High_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #231
IT	NE
BNE	L_find_errors132
MOVW	R1, #lo_addr(?lstr43_Errors+0)
MOVT	R1, #hi_addr(?lstr43_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors133
L_find_errors132:
;Errors.c,148 :: 		else   strcpy( Label2.Caption,"Delta_Source_High_2 !");
MOVW	R1, #lo_addr(?lstr44_Errors+0)
MOVT	R1, #hi_addr(?lstr44_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors133:
;Errors.c,149 :: 		}
IT	AL
BAL	L_find_errors134
L_find_errors131:
;Errors.c,150 :: 		else if(system_reg[ERRORS_1]==241 || system_reg[ERRORS_2]==242){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #241
IT	EQ
BEQ	L__find_errors237
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #242
IT	EQ
BEQ	L__find_errors236
IT	AL
BAL	L_find_errors137
L__find_errors237:
L__find_errors236:
;Errors.c,151 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,152 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,153 :: 		if(system_reg[ERRORS_1]==241)strcpy( Label2.Caption,"Delta_Source_Low_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #241
IT	NE
BNE	L_find_errors138
MOVW	R1, #lo_addr(?lstr45_Errors+0)
MOVT	R1, #hi_addr(?lstr45_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors139
L_find_errors138:
;Errors.c,154 :: 		else   strcpy( Label2.Caption,"Delta_Source_Low_2 !");
MOVW	R1, #lo_addr(?lstr46_Errors+0)
MOVT	R1, #hi_addr(?lstr46_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors139:
;Errors.c,155 :: 		}
IT	AL
BAL	L_find_errors140
L_find_errors137:
;Errors.c,156 :: 		else if(system_reg[ERRORS_1]==251 || system_reg[ERRORS_2]==252){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #251
IT	EQ
BEQ	L__find_errors239
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #252
IT	EQ
BEQ	L__find_errors238
IT	AL
BAL	L_find_errors143
L__find_errors239:
L__find_errors238:
;Errors.c,157 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,158 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,159 :: 		if(system_reg[ERRORS_1]==251)strcpy( Label2.Caption,"Delta_Heat_High_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, #251
IT	NE
BNE	L_find_errors144
MOVW	R1, #lo_addr(?lstr47_Errors+0)
MOVT	R1, #hi_addr(?lstr47_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors145
L_find_errors144:
;Errors.c,160 :: 		else   strcpy( Label2.Caption,"Delta_Heat_High_2 !");
MOVW	R1, #lo_addr(?lstr48_Errors+0)
MOVT	R1, #hi_addr(?lstr48_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors145:
;Errors.c,162 :: 		}
IT	AL
BAL	L_find_errors146
L_find_errors143:
;Errors.c,163 :: 		else if(system_reg[ERRORS_1]==261 || system_reg[ERRORS_2]==262){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #261
CMP	R1, R0
IT	EQ
BEQ	L__find_errors241
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, #262
IT	EQ
BEQ	L__find_errors240
IT	AL
BAL	L_find_errors149
L__find_errors241:
L__find_errors240:
;Errors.c,164 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,165 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,166 :: 		if(system_reg[ERRORS_1]==261)strcpy( Label2.Caption,"Delta_Heat_Low_1 !");
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #261
CMP	R1, R0
IT	NE
BNE	L_find_errors150
MOVW	R1, #lo_addr(?lstr49_Errors+0)
MOVT	R1, #hi_addr(?lstr49_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_find_errors151
L_find_errors150:
;Errors.c,167 :: 		else   strcpy( Label2.Caption,"Delta_Heat_Low_2 !");
MOVW	R1, #lo_addr(?lstr50_Errors+0)
MOVT	R1, #hi_addr(?lstr50_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
L_find_errors151:
;Errors.c,168 :: 		}
IT	AL
BAL	L_find_errors152
L_find_errors149:
;Errors.c,169 :: 		else if(system_reg[ERRORS_1]==271){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #271
CMP	R1, R0
IT	NE
BNE	L_find_errors153
;Errors.c,170 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,171 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,172 :: 		strcpy( Label2.Caption,"No_Faza_A!");
MOVW	R1, #lo_addr(?lstr51_Errors+0)
MOVT	R1, #hi_addr(?lstr51_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,173 :: 		}
IT	AL
BAL	L_find_errors154
L_find_errors153:
;Errors.c,174 :: 		else if(system_reg[ERRORS_1]==281){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #281
CMP	R1, R0
IT	NE
BNE	L_find_errors155
;Errors.c,175 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,176 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,177 :: 		strcpy( Label2.Caption,"No_Faza_B!");
MOVW	R1, #lo_addr(?lstr52_Errors+0)
MOVT	R1, #hi_addr(?lstr52_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,178 :: 		}
IT	AL
BAL	L_find_errors156
L_find_errors155:
;Errors.c,179 :: 		else if(system_reg[ERRORS_1]==291){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #291
CMP	R1, R0
IT	NE
BNE	L_find_errors157
;Errors.c,180 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,181 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,182 :: 		strcpy( Label2.Caption,"No_Faza_C!");
MOVW	R1, #lo_addr(?lstr53_Errors+0)
MOVT	R1, #hi_addr(?lstr53_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,183 :: 		}
IT	AL
BAL	L_find_errors158
L_find_errors157:
;Errors.c,184 :: 		else if(system_reg[ERRORS_1]==301){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	NE
BNE	L_find_errors159
;Errors.c,185 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,186 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,187 :: 		strcpy( Label2.Caption,"Cross_Faza!");
MOVW	R1, #lo_addr(?lstr54_Errors+0)
MOVT	R1, #hi_addr(?lstr54_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,188 :: 		}
IT	AL
BAL	L_find_errors160
L_find_errors159:
;Errors.c,189 :: 		else if(system_reg[ERRORS_1]==401){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #401
CMP	R1, R0
IT	NE
BNE	L_find_errors161
;Errors.c,190 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,191 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,192 :: 		strcpy( Label2.Caption,"Source_Max!");
MOVW	R1, #lo_addr(?lstr55_Errors+0)
MOVT	R1, #hi_addr(?lstr55_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,194 :: 		}
IT	AL
BAL	L_find_errors162
L_find_errors161:
;Errors.c,195 :: 		else if(system_reg[ERRORS_1]==411){
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #411
CMP	R1, R0
IT	NE
BNE	L_find_errors163
;Errors.c,196 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,197 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,198 :: 		strcpy( Label2.Caption,"Source_Min!");
MOVW	R1, #lo_addr(?lstr56_Errors+0)
MOVT	R1, #hi_addr(?lstr56_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,199 :: 		}
L_find_errors163:
L_find_errors162:
L_find_errors160:
L_find_errors158:
L_find_errors156:
L_find_errors154:
L_find_errors152:
L_find_errors146:
L_find_errors140:
L_find_errors134:
L_find_errors128:
L_find_errors122:
L_find_errors116:
L_find_errors110:
L_find_errors104:
L_find_errors98:
L_find_errors94:
L_find_errors90:
L_find_errors84:
L_find_errors78:
L_find_errors72:
L_find_errors66:
L_find_errors60:
L_find_errors54:
L_find_errors48:
L_find_errors42:
L_find_errors36:
L_find_errors30:
L_find_errors24:
L_find_errors18:
L_find_errors12:
L_find_errors6:
;Errors.c,231 :: 		}
L_end_find_errors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _find_errors
