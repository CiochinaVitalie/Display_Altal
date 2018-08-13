_find_errors:
;Errors.c,9 :: 		void find_errors(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Errors.c,10 :: 		if(system_reg[ERRORS_1]==0){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_find_errors0
;Errors.c,12 :: 		}
L_find_errors0:
;Errors.c,13 :: 		if(system_reg[ERRORS_1]==10){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_find_errors1
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
;Errors.c,16 :: 		strcpy( Label2.Caption,"Heating_Outlet_sens !");
MOVW	R1, #lo_addr(?lstr1_Errors+0)
MOVT	R1, #hi_addr(?lstr1_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,18 :: 		}
IT	AL
BAL	L_find_errors2
L_find_errors1:
;Errors.c,19 :: 		else if(system_reg[ERRORS_1]==20){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	NE
BNE	L_find_errors3
;Errors.c,20 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,21 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,22 :: 		strcpy( Label2.Caption,"Heating_Inlet_sens !");
MOVW	R1, #lo_addr(?lstr2_Errors+0)
MOVT	R1, #hi_addr(?lstr2_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,24 :: 		}
IT	AL
BAL	L_find_errors4
L_find_errors3:
;Errors.c,25 :: 		else if(system_reg[ERRORS_1]==30){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	NE
BNE	L_find_errors5
;Errors.c,26 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,27 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,28 :: 		strcpy( Label2.Caption,"Source_Inlet_sens !");
MOVW	R1, #lo_addr(?lstr3_Errors+0)
MOVT	R1, #hi_addr(?lstr3_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,30 :: 		}
IT	AL
BAL	L_find_errors6
L_find_errors5:
;Errors.c,31 :: 		else if(system_reg[ERRORS_1]==40){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #40
IT	NE
BNE	L_find_errors7
;Errors.c,32 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,33 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,34 :: 		strcpy( Label2.Caption,"Source_Outlet_sens !");
MOVW	R1, #lo_addr(?lstr4_Errors+0)
MOVT	R1, #hi_addr(?lstr4_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,35 :: 		}
IT	AL
BAL	L_find_errors8
L_find_errors7:
;Errors.c,36 :: 		else if(system_reg[ERRORS_1]==50){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #50
IT	NE
BNE	L_find_errors9
;Errors.c,37 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,38 :: 		strcpy( Label2.Caption,"Exchaust_Comp_sens !");
MOVW	R1, #lo_addr(?lstr5_Errors+0)
MOVT	R1, #hi_addr(?lstr5_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,39 :: 		}
IT	AL
BAL	L_find_errors10
L_find_errors9:
;Errors.c,40 :: 		else if(system_reg[ERRORS_1]==60){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #60
IT	NE
BNE	L_find_errors11
;Errors.c,41 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,42 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,43 :: 		strcpy( Label2.Caption,"Suction_Comp_sens !");
MOVW	R1, #lo_addr(?lstr6_Errors+0)
MOVT	R1, #hi_addr(?lstr6_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,44 :: 		}
IT	AL
BAL	L_find_errors12
L_find_errors11:
;Errors.c,45 :: 		else if(system_reg[ERRORS_1]==70){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #70
IT	NE
BNE	L_find_errors13
;Errors.c,46 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,47 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,48 :: 		strcpy( Label2.Caption,"Condenser_T_sens !");
MOVW	R1, #lo_addr(?lstr7_Errors+0)
MOVT	R1, #hi_addr(?lstr7_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,49 :: 		}
IT	AL
BAL	L_find_errors14
L_find_errors13:
;Errors.c,50 :: 		else if(system_reg[ERRORS_1]==80){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #80
IT	NE
BNE	L_find_errors15
;Errors.c,51 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,52 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,53 :: 		strcpy( Label2.Caption,"Bac_T_sens !");
MOVW	R1, #lo_addr(?lstr8_Errors+0)
MOVT	R1, #hi_addr(?lstr8_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,54 :: 		}
IT	AL
BAL	L_find_errors16
L_find_errors15:
;Errors.c,55 :: 		else if(system_reg[ERRORS_1]==90){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L_find_errors17
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
;Errors.c,58 :: 		strcpy( Label2.Caption,"Dhw_T_sens !");
MOVW	R1, #lo_addr(?lstr9_Errors+0)
MOVT	R1, #hi_addr(?lstr9_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,59 :: 		}
IT	AL
BAL	L_find_errors18
L_find_errors17:
;Errors.c,60 :: 		else if(system_reg[ERRORS_1]==110){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #110
IT	NE
BNE	L_find_errors19
;Errors.c,61 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,62 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,63 :: 		strcpy( Label2.Caption,"Chek_Flow_sourse !");
MOVW	R1, #lo_addr(?lstr10_Errors+0)
MOVT	R1, #hi_addr(?lstr10_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,64 :: 		}
IT	AL
BAL	L_find_errors20
L_find_errors19:
;Errors.c,65 :: 		else if(system_reg[ERRORS_1]==120){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #120
IT	NE
BNE	L_find_errors21
;Errors.c,66 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,67 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,68 :: 		strcpy( Label2.Caption,"Chek_Flow_heat !");
MOVW	R1, #lo_addr(?lstr11_Errors+0)
MOVT	R1, #hi_addr(?lstr11_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,69 :: 		}
IT	AL
BAL	L_find_errors22
L_find_errors21:
;Errors.c,70 :: 		else if(system_reg[ERRORS_1]==130){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #130
IT	NE
BNE	L_find_errors23
;Errors.c,71 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,72 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,73 :: 		strcpy( Label2.Caption,"Low_LowPressure !");
MOVW	R1, #lo_addr(?lstr12_Errors+0)
MOVT	R1, #hi_addr(?lstr12_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,74 :: 		}
IT	AL
BAL	L_find_errors24
L_find_errors23:
;Errors.c,75 :: 		else if(system_reg[ERRORS_1]==140){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #140
IT	NE
BNE	L_find_errors25
;Errors.c,76 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,77 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,78 :: 		strcpy( Label2.Caption,"High_LowPressure !");
MOVW	R1, #lo_addr(?lstr13_Errors+0)
MOVT	R1, #hi_addr(?lstr13_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,79 :: 		}
IT	AL
BAL	L_find_errors26
L_find_errors25:
;Errors.c,80 :: 		else if(system_reg[ERRORS_1]==150){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #150
IT	NE
BNE	L_find_errors27
;Errors.c,81 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,82 :: 		strcpy( Label2.Caption,"Chek_Comp_Temp!");
MOVW	R1, #lo_addr(?lstr14_Errors+0)
MOVT	R1, #hi_addr(?lstr14_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,83 :: 		}
IT	AL
BAL	L_find_errors28
L_find_errors27:
;Errors.c,84 :: 		else if(system_reg[ERRORS_1]==160){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #160
IT	NE
BNE	L_find_errors29
;Errors.c,85 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,86 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,87 :: 		strcpy( Label2.Caption,"Source_Inlet_is_hight!");
MOVW	R1, #lo_addr(?lstr15_Errors+0)
MOVT	R1, #hi_addr(?lstr15_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,88 :: 		}
IT	AL
BAL	L_find_errors30
L_find_errors29:
;Errors.c,89 :: 		else if(system_reg[ERRORS_1]==170){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #170
IT	NE
BNE	L_find_errors31
;Errors.c,90 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,91 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,92 :: 		strcpy( Label2.Caption,"Source_Inlet_is_low!");
MOVW	R1, #lo_addr(?lstr16_Errors+0)
MOVT	R1, #hi_addr(?lstr16_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,93 :: 		}
IT	AL
BAL	L_find_errors32
L_find_errors31:
;Errors.c,94 :: 		else if(system_reg[ERRORS_1]==180){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #180
IT	NE
BNE	L_find_errors33
;Errors.c,95 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,96 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,97 :: 		strcpy( Label2.Caption,"Bac_Heat_is_hight!");
MOVW	R1, #lo_addr(?lstr17_Errors+0)
MOVT	R1, #hi_addr(?lstr17_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,98 :: 		}
IT	AL
BAL	L_find_errors34
L_find_errors33:
;Errors.c,99 :: 		else if(system_reg[ERRORS_1]==190){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #190
IT	NE
BNE	L_find_errors35
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
;Errors.c,102 :: 		strcpy( Label2.Caption,"Bac_Heat_is_low!");
MOVW	R1, #lo_addr(?lstr18_Errors+0)
MOVT	R1, #hi_addr(?lstr18_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,103 :: 		}
IT	AL
BAL	L_find_errors36
L_find_errors35:
;Errors.c,104 :: 		else if(system_reg[ERRORS_1]==200){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #200
IT	NE
BNE	L_find_errors37
;Errors.c,105 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,106 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,107 :: 		strcpy( Label2.Caption,"SuperHeat_is_hight!");
MOVW	R1, #lo_addr(?lstr19_Errors+0)
MOVT	R1, #hi_addr(?lstr19_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,108 :: 		}
IT	AL
BAL	L_find_errors38
L_find_errors37:
;Errors.c,109 :: 		else if(system_reg[ERRORS_1]==210){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #210
IT	NE
BNE	L_find_errors39
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
;Errors.c,112 :: 		strcpy( Label2.Caption,"SuperHeat_is_low!");
MOVW	R1, #lo_addr(?lstr20_Errors+0)
MOVT	R1, #hi_addr(?lstr20_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,113 :: 		}
IT	AL
BAL	L_find_errors40
L_find_errors39:
;Errors.c,114 :: 		else if(system_reg[ERRORS_1]==220){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #220
IT	NE
BNE	L_find_errors41
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
;Errors.c,117 :: 		strcpy( Label2.Caption,"SuperCool_is_low!");
MOVW	R1, #lo_addr(?lstr21_Errors+0)
MOVT	R1, #hi_addr(?lstr21_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,118 :: 		}
IT	AL
BAL	L_find_errors42
L_find_errors41:
;Errors.c,119 :: 		else if(system_reg[ERRORS_1]==230){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #230
IT	NE
BNE	L_find_errors43
;Errors.c,120 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,121 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,122 :: 		strcpy( Label2.Caption,"SuperCool_is_hight!");
MOVW	R1, #lo_addr(?lstr22_Errors+0)
MOVT	R1, #hi_addr(?lstr22_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,123 :: 		}
IT	AL
BAL	L_find_errors44
L_find_errors43:
;Errors.c,124 :: 		else if(system_reg[ERRORS_1]==240){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	NE
BNE	L_find_errors45
;Errors.c,125 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,126 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,127 :: 		strcpy( Label2.Caption,"Bac_Cool_Hight!");
MOVW	R1, #lo_addr(?lstr23_Errors+0)
MOVT	R1, #hi_addr(?lstr23_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,128 :: 		}
IT	AL
BAL	L_find_errors46
L_find_errors45:
;Errors.c,129 :: 		else if(system_reg[ERRORS_1]==250){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #250
IT	NE
BNE	L_find_errors47
;Errors.c,130 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,131 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,132 :: 		strcpy( Label2.Caption,"Bac_Cool_Low!");
MOVW	R1, #lo_addr(?lstr24_Errors+0)
MOVT	R1, #hi_addr(?lstr24_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,133 :: 		}
IT	AL
BAL	L_find_errors48
L_find_errors47:
;Errors.c,134 :: 		else if(system_reg[ERRORS_1]==260){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #260
IT	NE
BNE	L_find_errors49
;Errors.c,135 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,136 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,137 :: 		strcpy( Label2.Caption,"Hight_HightPress!");
MOVW	R1, #lo_addr(?lstr25_Errors+0)
MOVT	R1, #hi_addr(?lstr25_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,138 :: 		}
IT	AL
BAL	L_find_errors50
L_find_errors49:
;Errors.c,139 :: 		else if(system_reg[ERRORS_1]==270){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #270
IT	NE
BNE	L_find_errors51
;Errors.c,140 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,141 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,142 :: 		strcpy( Label2.Caption,"Low_HightPressure!");
MOVW	R1, #lo_addr(?lstr26_Errors+0)
MOVT	R1, #hi_addr(?lstr26_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,143 :: 		}
IT	AL
BAL	L_find_errors52
L_find_errors51:
;Errors.c,144 :: 		else if(system_reg[ERRORS_1]==280){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #280
IT	NE
BNE	L_find_errors53
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
;Errors.c,147 :: 		strcpy( Label2.Caption,"Delta_source_max!");
MOVW	R1, #lo_addr(?lstr27_Errors+0)
MOVT	R1, #hi_addr(?lstr27_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,148 :: 		}
IT	AL
BAL	L_find_errors54
L_find_errors53:
;Errors.c,149 :: 		else if(system_reg[ERRORS_1]==290){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #290
IT	NE
BNE	L_find_errors55
;Errors.c,150 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,151 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,152 :: 		strcpy( Label2.Caption,"Delta_source_min!");
MOVW	R1, #lo_addr(?lstr28_Errors+0)
MOVT	R1, #hi_addr(?lstr28_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,153 :: 		}
IT	AL
BAL	L_find_errors56
L_find_errors55:
;Errors.c,154 :: 		else if(system_reg[ERRORS_1]==300){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #300
IT	NE
BNE	L_find_errors57
;Errors.c,155 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,156 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,157 :: 		strcpy( Label2.Caption,"Delta_heating_max!");
MOVW	R1, #lo_addr(?lstr29_Errors+0)
MOVT	R1, #hi_addr(?lstr29_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,158 :: 		}
IT	AL
BAL	L_find_errors58
L_find_errors57:
;Errors.c,159 :: 		else if(system_reg[ERRORS_1]==310){
MOVW	R0, #lo_addr(_system_reg+878)
MOVT	R0, #hi_addr(_system_reg+878)
LDRSH	R0, [R0, #0]
CMP	R0, #310
IT	NE
BNE	L_find_errors59
;Errors.c,160 :: 		Label2.Font_Color=0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Errors.c,161 :: 		memset(Label2.Caption, 0, sizeof(Label2.Caption));
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #0
BL	_memset+0
;Errors.c,162 :: 		strcpy( Label2.Caption,"Delta_heating_min!");
MOVW	R1, #lo_addr(?lstr30_Errors+0)
MOVT	R1, #hi_addr(?lstr30_Errors+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Errors.c,163 :: 		}
L_find_errors59:
L_find_errors58:
L_find_errors56:
L_find_errors54:
L_find_errors52:
L_find_errors50:
L_find_errors48:
L_find_errors46:
L_find_errors44:
L_find_errors42:
L_find_errors40:
L_find_errors38:
L_find_errors36:
L_find_errors34:
L_find_errors32:
L_find_errors30:
L_find_errors28:
L_find_errors26:
L_find_errors24:
L_find_errors22:
L_find_errors20:
L_find_errors18:
L_find_errors16:
L_find_errors14:
L_find_errors12:
L_find_errors10:
L_find_errors8:
L_find_errors6:
L_find_errors4:
L_find_errors2:
;Errors.c,165 :: 		}
L_end_find_errors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _find_errors
