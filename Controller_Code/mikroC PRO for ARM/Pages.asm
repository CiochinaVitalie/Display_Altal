_main_page:
;Pages.c,10 :: 		void main_page(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,17 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+874)
MOVT	R0, #hi_addr(_system_reg+874)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,19 :: 		if(strncmp(txt,dhw_temp_main.Caption,2)!=0){
MOVW	R0, #lo_addr(_dhw_temp_main+16)
MOVT	R0, #hi_addr(_dhw_temp_main+16)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page0
;Pages.c,20 :: 		strncpy(dhw_temp_main.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_dhw_temp_main+16)
MOVT	R0, #hi_addr(_dhw_temp_main+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,21 :: 		if(system_reg[DHW_TEMP]<10 && system_reg[DHW_TEMP]>=0){dhw_temp_main.Caption[1]=dhw_temp_main.Caption[0];dhw_temp_main.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+874)
MOVT	R0, #hi_addr(_system_reg+874)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page100
MOVW	R0, #lo_addr(_system_reg+874)
MOVT	R0, #hi_addr(_system_reg+874)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page99
L__main_page98:
MOVW	R2, #lo_addr(_dhw_temp_main+16)
MOVT	R2, #hi_addr(_dhw_temp_main+16)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
L__main_page100:
L__main_page99:
;Pages.c,22 :: 		DrawRoundBox(&BoxRound2);
MOVW	R0, #lo_addr(_BoxRound2+0)
MOVT	R0, #hi_addr(_BoxRound2+0)
BL	_DrawRoundBox+0
;Pages.c,23 :: 		DrawLabel (&dhw_temp_main);
MOVW	R0, #lo_addr(_dhw_temp_main+0)
MOVT	R0, #hi_addr(_dhw_temp_main+0)
BL	_DrawLabel+0
;Pages.c,24 :: 		}
L_main_page0:
;Pages.c,26 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+876)
MOVT	R0, #hi_addr(_system_reg+876)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,28 :: 		if(strncmp(txt,heat_temp_main.Caption,2)!=0){
MOVW	R0, #lo_addr(_heat_temp_main+16)
MOVT	R0, #hi_addr(_heat_temp_main+16)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page4
;Pages.c,29 :: 		strncpy(heat_temp_main.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_heat_temp_main+16)
MOVT	R0, #hi_addr(_heat_temp_main+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,30 :: 		if(system_reg[BAC_TEMP]<10 && system_reg[BAC_TEMP]>=0){heat_temp_main.Caption[1]=heat_temp_main.Caption[0];heat_temp_main.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+876)
MOVT	R0, #hi_addr(_system_reg+876)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page102
MOVW	R0, #lo_addr(_system_reg+876)
MOVT	R0, #hi_addr(_system_reg+876)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page101
L__main_page97:
MOVW	R2, #lo_addr(_heat_temp_main+16)
MOVT	R2, #hi_addr(_heat_temp_main+16)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
L__main_page102:
L__main_page101:
;Pages.c,31 :: 		DrawRoundBox(&heatBox);
MOVW	R0, #lo_addr(_heatBox+0)
MOVT	R0, #hi_addr(_heatBox+0)
BL	_DrawRoundBox+0
;Pages.c,32 :: 		DrawLabel (&heat_temp_main);
MOVW	R0, #lo_addr(_heat_temp_main+0)
MOVT	R0, #hi_addr(_heat_temp_main+0)
BL	_DrawLabel+0
;Pages.c,33 :: 		}
L_main_page4:
;Pages.c,35 :: 		IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+882)
MOVT	R0, #hi_addr(_system_reg+882)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,37 :: 		if(strncmp(txt,sourse_temp_output_main.Caption,2)!=0){
MOVW	R0, #lo_addr(_sourse_temp_output_main+16)
MOVT	R0, #hi_addr(_sourse_temp_output_main+16)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page8
;Pages.c,38 :: 		strncpy(sourse_temp_output_main.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_sourse_temp_output_main+16)
MOVT	R0, #hi_addr(_sourse_temp_output_main+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,39 :: 		if(system_reg[SOURC_OUT_1]<10 && system_reg[SOURC_OUT_1]>=0){sourse_temp_output_main.Caption[1]=sourse_temp_output_main.Caption[0];sourse_temp_output_main.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+882)
MOVT	R0, #hi_addr(_system_reg+882)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page104
MOVW	R0, #lo_addr(_system_reg+882)
MOVT	R0, #hi_addr(_system_reg+882)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page103
L__main_page96:
MOVW	R2, #lo_addr(_sourse_temp_output_main+16)
MOVT	R2, #hi_addr(_sourse_temp_output_main+16)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
L__main_page104:
L__main_page103:
;Pages.c,40 :: 		DrawRoundBox(&BoxRound4);
MOVW	R0, #lo_addr(_BoxRound4+0)
MOVT	R0, #hi_addr(_BoxRound4+0)
BL	_DrawRoundBox+0
;Pages.c,41 :: 		DrawLabel (&sourse_temp_output_main);
MOVW	R0, #lo_addr(_sourse_temp_output_main+0)
MOVT	R0, #hi_addr(_sourse_temp_output_main+0)
BL	_DrawLabel+0
;Pages.c,42 :: 		}
L_main_page8:
;Pages.c,44 :: 		IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+884)
MOVT	R0, #hi_addr(_system_reg+884)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,46 :: 		if(strncmp(txt,sourse_temp_input_main.Caption,2)!=0){
MOVW	R0, #lo_addr(_sourse_temp_input_main+16)
MOVT	R0, #hi_addr(_sourse_temp_input_main+16)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page12
;Pages.c,47 :: 		strncpy(sourse_temp_input_main.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_sourse_temp_input_main+16)
MOVT	R0, #hi_addr(_sourse_temp_input_main+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,48 :: 		if(system_reg[SOURC_IN_1]<10 && system_reg[SOURC_IN_1]>=0){sourse_temp_input_main.Caption[1]=sourse_temp_input_main.Caption[0];sourse_temp_input_main.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+884)
MOVT	R0, #hi_addr(_system_reg+884)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page106
MOVW	R0, #lo_addr(_system_reg+884)
MOVT	R0, #hi_addr(_system_reg+884)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page105
L__main_page95:
MOVW	R2, #lo_addr(_sourse_temp_input_main+16)
MOVT	R2, #hi_addr(_sourse_temp_input_main+16)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
L__main_page106:
L__main_page105:
;Pages.c,49 :: 		DrawRoundBox(&BoxRound3);
MOVW	R0, #lo_addr(_BoxRound3+0)
MOVT	R0, #hi_addr(_BoxRound3+0)
BL	_DrawRoundBox+0
;Pages.c,50 :: 		DrawLabel (&sourse_temp_input_main);
MOVW	R0, #lo_addr(_sourse_temp_input_main+0)
MOVT	R0, #hi_addr(_sourse_temp_input_main+0)
BL	_DrawLabel+0
;Pages.c,51 :: 		}
L_main_page12:
;Pages.c,53 :: 		if(system_reg[THREE_STATE_MAIN]==1){
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main_page16
;Pages.c,54 :: 		dhw_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_dhw_led+22)
MOVT	R0, #hi_addr(_dhw_led+22)
STRH	R1, [R0, #0]
;Pages.c,55 :: 		dhw_led.Gradient_End_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_dhw_led+24)
MOVT	R0, #hi_addr(_dhw_led+24)
STRH	R1, [R0, #0]
;Pages.c,56 :: 		dhw_led.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_dhw_led+26)
MOVT	R0, #hi_addr(_dhw_led+26)
STRH	R1, [R0, #0]
;Pages.c,57 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Pages.c,58 :: 		heat_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_heat_led+22)
MOVT	R0, #hi_addr(_heat_led+22)
STRH	R1, [R0, #0]
;Pages.c,59 :: 		heat_led.Gradient_End_Color = 0x0014;
MOVS	R1, #20
MOVW	R0, #lo_addr(_heat_led+24)
MOVT	R0, #hi_addr(_heat_led+24)
STRH	R1, [R0, #0]
;Pages.c,60 :: 		heat_led.Color           = 0x041F;
MOVW	R1, #1055
MOVW	R0, #lo_addr(_heat_led+26)
MOVT	R0, #hi_addr(_heat_led+26)
STRH	R1, [R0, #0]
;Pages.c,61 :: 		DrawCircle(&heat_led);}
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
IT	AL
BAL	L_main_page17
L_main_page16:
;Pages.c,63 :: 		heat_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_heat_led+22)
MOVT	R0, #hi_addr(_heat_led+22)
STRH	R1, [R0, #0]
;Pages.c,64 :: 		heat_led.Gradient_End_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_heat_led+24)
MOVT	R0, #hi_addr(_heat_led+24)
STRH	R1, [R0, #0]
;Pages.c,65 :: 		heat_led.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_heat_led+26)
MOVT	R0, #hi_addr(_heat_led+26)
STRH	R1, [R0, #0]
;Pages.c,66 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Pages.c,67 :: 		dhw_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_dhw_led+22)
MOVT	R0, #hi_addr(_dhw_led+22)
STRH	R1, [R0, #0]
;Pages.c,68 :: 		dhw_led.Gradient_End_Color = 0x0014;
MOVS	R1, #20
MOVW	R0, #lo_addr(_dhw_led+24)
MOVT	R0, #hi_addr(_dhw_led+24)
STRH	R1, [R0, #0]
;Pages.c,69 :: 		dhw_led.Color           = 0x041F;
MOVW	R1, #1055
MOVW	R0, #lo_addr(_dhw_led+26)
MOVT	R0, #hi_addr(_dhw_led+26)
STRH	R1, [R0, #0]
;Pages.c,70 :: 		DrawCircle(&heat_led);}
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
L_main_page17:
;Pages.c,72 :: 		}
L_end_main_page:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _main_page
_startPage:
;Pages.c,74 :: 		void startPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Pages.c,76 :: 		if(system_reg[POWER]==1) {Main_OFF.Picture_Name = main_on_bmp;DrawImage(&Main_ON); }
MOVW	R0, #lo_addr(_system_reg+1062)
MOVT	R0, #hi_addr(_system_reg+1062)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_startPage18
MOVW	R1, #64494
MOVT	R1, #7
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
L_startPage18:
;Pages.c,77 :: 		if(system_reg[POWER]==0){Main_OFF.Picture_Name = main_off_bmp;DrawImage(&Main_OFF);}
MOVW	R0, #lo_addr(_system_reg+1062)
MOVT	R0, #hi_addr(_system_reg+1062)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_startPage19
MOVW	R1, #8080
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
L_startPage19:
;Pages.c,78 :: 		if(system_reg[HEAT]==0 && system_reg[COOL]==1) {ON_OFF_Heat_Cool.Caption = "ON"; bar_heating.Caption = "COOLING";DrawRoundButton(&bar_heating);DrawImage(&cool_icon);}
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage111
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__startPage110
L__startPage109:
MOVW	R1, #lo_addr(?lstr1_Pages+0)
MOVT	R1, #hi_addr(?lstr1_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
MOVW	R1, #lo_addr(?lstr2_Pages+0)
MOVT	R1, #hi_addr(?lstr2_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
L__startPage111:
L__startPage110:
;Pages.c,79 :: 		if(system_reg[HEAT]==1 && system_reg[COOL]==0) {ON_OFF_Heat_Cool.Caption = "ON"; bar_heating.Caption = "HEATING";DrawRoundButton(&bar_heating);DrawImage(&heat_icon);}
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__startPage113
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage112
L__startPage108:
MOVW	R1, #lo_addr(?lstr3_Pages+0)
MOVT	R1, #hi_addr(?lstr3_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
MOVW	R1, #lo_addr(?lstr4_Pages+0)
MOVT	R1, #hi_addr(?lstr4_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
L__startPage113:
L__startPage112:
;Pages.c,80 :: 		if(system_reg[HEAT]==0 && system_reg[COOL]==0) ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage115
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage114
L__startPage107:
MOVW	R1, #lo_addr(?lstr5_Pages+0)
MOVT	R1, #hi_addr(?lstr5_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
L__startPage115:
L__startPage114:
;Pages.c,81 :: 		if(system_reg[HEATWATER]==0)ON_OFF_DHW.Caption = "OFF";
MOVW	R0, #lo_addr(_system_reg+1064)
MOVT	R0, #hi_addr(_system_reg+1064)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_startPage29
MOVW	R1, #lo_addr(?lstr6_Pages+0)
MOVT	R1, #hi_addr(?lstr6_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
L_startPage29:
;Pages.c,82 :: 		if(system_reg[HEATWATER]==1)ON_OFF_DHW.Caption = "ON";
MOVW	R0, #lo_addr(_system_reg+1064)
MOVT	R0, #hi_addr(_system_reg+1064)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_startPage30
MOVW	R1, #lo_addr(?lstr7_Pages+0)
MOVT	R1, #hi_addr(?lstr7_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
L_startPage30:
;Pages.c,83 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,84 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,86 :: 		}
L_end_startPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _startPage
_sensor_1:
;Pages.c,89 :: 		void sensor_1(unsigned char num_page){
; num_page start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; num_page end address is: 0 (R0)
; num_page start address is: 0 (R0)
;Pages.c,92 :: 		if(num_page==0)
CMP	R0, #0
IT	NE
BNE	L_sensor_131
; num_page end address is: 0 (R0)
;Pages.c,95 :: 		IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+884)
MOVT	R1, #hi_addr(_system_reg+884)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,97 :: 		if(strncmp(txt,S_Brine_Inlet_1.Caption,2)!=0){strncpy(S_Brine_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Inlet_1);}
MOVW	R1, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_132
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+0)
BL	_DrawRoundButton+0
L_sensor_132:
;Pages.c,100 :: 		IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+882)
MOVT	R1, #hi_addr(_system_reg+882)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,102 :: 		if(strncmp(txt,S_Brine_Outlet_1.Caption,2)!=0){strncpy(S_Brine_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Outlet_1);}
MOVW	R1, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_133
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+0)
BL	_DrawRoundButton+0
L_sensor_133:
;Pages.c,105 :: 		IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+888)
MOVT	R1, #hi_addr(_system_reg+888)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,107 :: 		if(strncmp(txt,S_Heat_Inlet_1.Caption,2)!=0){strncpy(S_Heat_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Inlet_1);}
MOVW	R1, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_134
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+0)
BL	_DrawRoundButton+0
L_sensor_134:
;Pages.c,110 :: 		IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+886)
MOVT	R1, #hi_addr(_system_reg+886)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,112 :: 		if(strncmp(txt,S_Heat_Outlet_1.Caption,2)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Outlet_1);}
MOVW	R1, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_135
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+0)
BL	_DrawRoundButton+0
L_sensor_135:
;Pages.c,115 :: 		IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+890)
MOVT	R1, #hi_addr(_system_reg+890)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,117 :: 		if(system_reg[EXAUST_TEMP_1]<100){
MOVW	R1, #lo_addr(_system_reg+890)
MOVT	R1, #hi_addr(_system_reg+890)
LDRSH	R1, [R1, #0]
CMP	R1, #100
IT	GE
BGE	L_sensor_136
;Pages.c,118 :: 		if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_137
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
STR	R1, [SP, #12]
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,119 :: 		S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
MOVW	R3, #lo_addr(_S_Compressor_1+24)
MOVT	R3, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R3, #0]
ADDS	R2, R1, #2
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #12]
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOV	R1, R3
LDR	R1, [R1, #0]
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
MOVS	R2, #48
MOV	R1, R3
LDR	R1, [R1, #0]
STRB	R2, [R1, #0]
;Pages.c,120 :: 		DrawRoundButton(&S_Compressor_1);
MOVW	R0, #lo_addr(_S_Compressor_1+0)
MOVT	R0, #hi_addr(_S_Compressor_1+0)
BL	_DrawRoundButton+0
;Pages.c,121 :: 		strncpy(S_Compressor_1.Caption, txt, 3);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,122 :: 		}
L_sensor_137:
;Pages.c,123 :: 		}
IT	AL
BAL	L_sensor_138
L_sensor_136:
;Pages.c,124 :: 		else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_139
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Compressor_1+0)
MOVT	R0, #hi_addr(_S_Compressor_1+0)
BL	_DrawRoundButton+0
L_sensor_139:
L_sensor_138:
;Pages.c,127 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,129 :: 		if(strncmp(txt,S_Superheat_1.Caption,2)!=0){strncpy(S_Superheat_1.Caption, txt, 2);DrawRoundButton(&S_Superheat_1);}
MOVW	R1, #lo_addr(_S_Superheat_1+24)
MOVT	R1, #hi_addr(_S_Superheat_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_140
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Superheat_1+24)
MOVT	R1, #hi_addr(_S_Superheat_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Superheat_1+0)
MOVT	R0, #hi_addr(_S_Superheat_1+0)
BL	_DrawRoundButton+0
L_sensor_140:
;Pages.c,132 :: 		IntToStr(system_reg[S_COOL_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+902)
MOVT	R1, #hi_addr(_system_reg+902)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,134 :: 		if(strncmp(txt,S_Subcool_1.Caption,2)!=0){strncpy(S_Subcool_1.Caption, txt, 2);DrawRoundButton(&S_Subcool_1);}
MOVW	R1, #lo_addr(_S_Subcool_1+24)
MOVT	R1, #hi_addr(_S_Subcool_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_141
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Subcool_1+24)
MOVT	R1, #hi_addr(_S_Subcool_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Subcool_1+0)
MOVT	R0, #hi_addr(_S_Subcool_1+0)
BL	_DrawRoundButton+0
L_sensor_141:
;Pages.c,139 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+874)
MOVT	R1, #hi_addr(_system_reg+874)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,141 :: 		if(strncmp(txt,S_DHW.Caption,2)!=0){strncpy(S_DHW.Caption, txt, 2);DrawRoundButton(&S_DHW);}
MOVW	R1, #lo_addr(_S_DHW+24)
MOVT	R1, #hi_addr(_S_DHW+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_142
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_DHW+24)
MOVT	R1, #hi_addr(_S_DHW+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_DHW+0)
MOVT	R0, #hi_addr(_S_DHW+0)
BL	_DrawRoundButton+0
L_sensor_142:
;Pages.c,144 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+876)
MOVT	R1, #hi_addr(_system_reg+876)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,146 :: 		if(strncmp(txt,SS_tank.Caption,2)!=0){strncpy(SS_tank.Caption, txt, 2);DrawRoundButton(&SS_tank);}
MOVW	R1, #lo_addr(_SS_tank+24)
MOVT	R1, #hi_addr(_SS_tank+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_143
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_SS_tank+24)
MOVT	R1, #hi_addr(_SS_tank+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_SS_tank+0)
MOVT	R0, #hi_addr(_SS_tank+0)
BL	_DrawRoundButton+0
L_sensor_143:
;Pages.c,149 :: 		IntToStr(system_reg[CONDENS_TEMP_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+898)
MOVT	R1, #hi_addr(_system_reg+898)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,151 :: 		if(strncmp(txt,S_condenser_1.Caption,2)!=0){strncpy(S_condenser_1.Caption, txt, 2);DrawRoundButton(&S_condenser_1);}
MOVW	R1, #lo_addr(_S_condenser_1+24)
MOVT	R1, #hi_addr(_S_condenser_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_144
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_condenser_1+24)
MOVT	R1, #hi_addr(_S_condenser_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_condenser_1+0)
MOVT	R0, #hi_addr(_S_condenser_1+0)
BL	_DrawRoundButton+0
L_sensor_144:
;Pages.c,154 :: 		IntToStr(system_reg[SUCT_TEMP_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+892)
MOVT	R1, #hi_addr(_system_reg+892)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,156 :: 		if(strncmp(txt,S_suction_1.Caption,2)!=0){strncpy(S_suction_1.Caption, txt, 2);DrawRoundButton(&S_suction_1);}
MOVW	R1, #lo_addr(_S_suction_1+24)
MOVT	R1, #hi_addr(_S_suction_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_145
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_suction_1+24)
MOVT	R1, #hi_addr(_S_suction_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_suction_1+0)
MOVT	R0, #hi_addr(_S_suction_1+0)
BL	_DrawRoundButton+0
L_sensor_145:
;Pages.c,159 :: 		IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+894)
MOVT	R1, #hi_addr(_system_reg+894)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,161 :: 		if(strncmp(txt,S_High_Pressure_1.Caption,2)!=0){strncpy(S_High_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_High_Pressure_1);}
MOVW	R1, #lo_addr(_S_High_Pressure_1+24)
MOVT	R1, #hi_addr(_S_High_Pressure_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_146
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_High_Pressure_1+24)
MOVT	R1, #hi_addr(_S_High_Pressure_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_High_Pressure_1+0)
MOVT	R0, #hi_addr(_S_High_Pressure_1+0)
BL	_DrawRoundButton+0
L_sensor_146:
;Pages.c,164 :: 		IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+896)
MOVT	R1, #hi_addr(_system_reg+896)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,166 :: 		if(strncmp(txt,S_Low_Pressure_1.Caption,2)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_Low_Pressure_1);}
MOVW	R1, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R1, #hi_addr(_S_Low_Pressure_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_147
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R1, #hi_addr(_S_Low_Pressure_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Low_Pressure_1+0)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+0)
BL	_DrawRoundButton+0
L_sensor_147:
;Pages.c,168 :: 		}
L_sensor_131:
;Pages.c,169 :: 		}
L_end_sensor_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _sensor_1
_data_eeprom:
;Pages.c,170 :: 		void data_eeprom(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,174 :: 		IntToStr(system_reg[COMP_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+996)
MOVT	R0, #hi_addr(_system_reg+996)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,175 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,176 :: 		IntToStr(system_reg[SOURS_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+998)
MOVT	R0, #hi_addr(_system_reg+998)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,177 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,178 :: 		IntToStr(system_reg[HEAT_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1002)
MOVT	R0, #hi_addr(_system_reg+1002)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,179 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,180 :: 		IntToStr(system_reg[REVERS_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1000)
MOVT	R0, #hi_addr(_system_reg+1000)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,181 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,182 :: 		IntToStr(system_reg[TRV_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1006)
MOVT	R0, #hi_addr(_system_reg+1006)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,183 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,184 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1004)
MOVT	R0, #hi_addr(_system_reg+1004)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,185 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,187 :: 		IntToStr(system_reg[HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,188 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,189 :: 		IntToStr(system_reg[HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1012)
MOVT	R0, #hi_addr(_system_reg+1012)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,190 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,191 :: 		IntToStr(system_reg[EXAUST_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1024)
MOVT	R0, #hi_addr(_system_reg+1024)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,192 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,193 :: 		IntToStr(system_reg[SOURS_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1018)
MOVT	R0, #hi_addr(_system_reg+1018)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,194 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,195 :: 		IntToStr(system_reg[SOURS_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1016)
MOVT	R0, #hi_addr(_system_reg+1016)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,196 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,197 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1044)
MOVT	R0, #hi_addr(_system_reg+1044)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,198 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,200 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1042)
MOVT	R0, #hi_addr(_system_reg+1042)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,201 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,202 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1010)
MOVT	R0, #hi_addr(_system_reg+1010)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,203 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,204 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1008)
MOVT	R0, #hi_addr(_system_reg+1008)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,205 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,206 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1048)
MOVT	R0, #hi_addr(_system_reg+1048)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,207 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,208 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1046)
MOVT	R0, #hi_addr(_system_reg+1046)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,209 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,211 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1026)
MOVT	R0, #hi_addr(_system_reg+1026)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,212 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,214 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1028)
MOVT	R0, #hi_addr(_system_reg+1028)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,215 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,216 :: 		IntToStr(system_reg[S_COOL_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1030)
MOVT	R0, #hi_addr(_system_reg+1030)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,217 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,218 :: 		IntToStr(system_reg[S_COOL_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1032)
MOVT	R0, #hi_addr(_system_reg+1032)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,219 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,220 :: 		IntToStr(system_reg[HP_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1036)
MOVT	R0, #hi_addr(_system_reg+1036)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,221 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,222 :: 		IntToStr(system_reg[HP_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1034)
MOVT	R0, #hi_addr(_system_reg+1034)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,223 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,225 :: 		IntToStr(system_reg[LP_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1040)
MOVT	R0, #hi_addr(_system_reg+1040)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,226 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,227 :: 		IntToStr(system_reg[LP_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1038)
MOVT	R0, #hi_addr(_system_reg+1038)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,228 :: 		strncpy(Set_min_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,230 :: 		IntToStr(system_reg[DIFF_HEAT], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1056)
MOVT	R0, #hi_addr(_system_reg+1056)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,231 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,232 :: 		IntToStr(system_reg[DIFF_COOL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1058)
MOVT	R0, #hi_addr(_system_reg+1058)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,233 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,234 :: 		IntToStr(system_reg[DIFF_DHW], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1060)
MOVT	R0, #hi_addr(_system_reg+1060)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,235 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,238 :: 		if(system_reg[POWER]==1){
MOVW	R0, #lo_addr(_system_reg+1062)
MOVT	R0, #hi_addr(_system_reg+1062)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom48
;Pages.c,239 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Pages.c,241 :: 		}
IT	AL
BAL	L_data_eeprom49
L_data_eeprom48:
;Pages.c,243 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Pages.c,245 :: 		}
L_data_eeprom49:
;Pages.c,247 :: 		if(system_reg[COOL]==1){
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom50
;Pages.c,248 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr8_Pages+0)
MOVT	R1, #hi_addr(?lstr8_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Pages.c,249 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Pages.c,250 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Pages.c,251 :: 		}
IT	AL
BAL	L_data_eeprom51
L_data_eeprom50:
;Pages.c,252 :: 		else if( system_reg[HEAT]==1 ){
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom52
;Pages.c,253 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr9_Pages+0)
MOVT	R1, #hi_addr(?lstr9_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Pages.c,254 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Pages.c,255 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Pages.c,256 :: 		}
L_data_eeprom52:
L_data_eeprom51:
;Pages.c,258 :: 		if( system_reg[HEAT]==1 || system_reg[COOL]==1){
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__data_eeprom119
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__data_eeprom118
IT	AL
BAL	L_data_eeprom55
L__data_eeprom119:
L__data_eeprom118:
;Pages.c,259 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr10_Pages+0)
MOVT	R1, #hi_addr(?lstr10_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Pages.c,260 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,261 :: 		}
IT	AL
BAL	L_data_eeprom56
L_data_eeprom55:
;Pages.c,262 :: 		else if(system_reg[HEAT]==0 && system_reg[COOL]==0){
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__data_eeprom121
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__data_eeprom120
L__data_eeprom116:
;Pages.c,263 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr11_Pages+0)
MOVT	R1, #hi_addr(?lstr11_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Pages.c,264 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,262 :: 		else if(system_reg[HEAT]==0 && system_reg[COOL]==0){
L__data_eeprom121:
L__data_eeprom120:
;Pages.c,265 :: 		}
L_data_eeprom56:
;Pages.c,267 :: 		if(system_reg[HEATWATER]==0){
MOVW	R0, #lo_addr(_system_reg+1064)
MOVT	R0, #hi_addr(_system_reg+1064)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_data_eeprom60
;Pages.c,268 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr12_Pages+0)
MOVT	R1, #hi_addr(?lstr12_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Pages.c,269 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,270 :: 		}
IT	AL
BAL	L_data_eeprom61
L_data_eeprom60:
;Pages.c,271 :: 		else if(system_reg[HEATWATER]==1){
MOVW	R0, #lo_addr(_system_reg+1064)
MOVT	R0, #hi_addr(_system_reg+1064)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom62
;Pages.c,272 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr13_Pages+0)
MOVT	R1, #hi_addr(?lstr13_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Pages.c,273 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,274 :: 		}
L_data_eeprom62:
L_data_eeprom61:
;Pages.c,275 :: 		}
L_end_data_eeprom:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _data_eeprom
_count_steps:
;Pages.c,276 :: 		void count_steps(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Pages.c,282 :: 		IntToStr(system_reg[TRV_STEPS_1], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+904)
MOVT	R0, #hi_addr(_system_reg+904)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,283 :: 		if(system_reg[TRV_STEPS_1]<100){
MOVW	R0, #lo_addr(_system_reg+904)
MOVT	R0, #hi_addr(_system_reg+904)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L_count_steps63
;Pages.c,284 :: 		if(strncmp(txt,EEV1_value.Caption,2)!=0){strncpy(EEV1_value.Caption, txt, 2);
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps64
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
STR	R0, [SP, #12]
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,285 :: 		EEV1_value.Caption[2]=EEV1_value.Caption[1];EEV1_value.Caption[1]=EEV1_value.Caption[0];EEV1_value.Caption[0]='0';
MOVW	R2, #lo_addr(_EEV1_value+24)
MOVT	R2, #hi_addr(_EEV1_value+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #2
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
LDR	R2, [SP, #12]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,286 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Pages.c,287 :: 		strncpy(EEV1_value.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,288 :: 		}}
L_count_steps64:
IT	AL
BAL	L_count_steps65
L_count_steps63:
;Pages.c,289 :: 		else{if(strncmp(txt,EEV1_value.Caption,3)!=0){strncpy(EEV1_value.Caption, txt, 3);DrawRoundButton(&EEV1_value);} }
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps66
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
L_count_steps66:
L_count_steps65:
;Pages.c,292 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,293 :: 		if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
MOVW	R0, #lo_addr(_EEV1_superheat+24)
MOVT	R0, #hi_addr(_EEV1_superheat+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps67
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_superheat+24)
MOVT	R0, #hi_addr(_EEV1_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_EEV1_superheat+0)
MOVT	R0, #hi_addr(_EEV1_superheat+0)
BL	_DrawRoundButton+0
L_count_steps67:
;Pages.c,295 :: 		}
L_end_count_steps:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _count_steps
_working_time:
;Pages.c,297 :: 		void working_time(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,299 :: 		IntToStr(system_reg[TIM_COM_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+914)
MOVT	R0, #hi_addr(_system_reg+914)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,300 :: 		if(strncmp(txt,Time_compressor1.Caption,7)!=0){strcpy(Time_compressor1.Caption, txt);DrawRoundButton(&Time_compressor1);}
MOVW	R0, #lo_addr(_Time_compressor1+24)
MOVT	R0, #hi_addr(_Time_compressor1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time68
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Time_compressor1+24)
MOVT	R0, #hi_addr(_Time_compressor1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_compressor1+0)
MOVT	R0, #hi_addr(_Time_compressor1+0)
BL	_DrawRoundButton+0
L_working_time68:
;Pages.c,301 :: 		IntToStr(system_reg[TIM_REV_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+912)
MOVT	R0, #hi_addr(_system_reg+912)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,302 :: 		if(strncmp(txt,Time_reversing1.Caption,7)!=0){strcpy(Time_reversing1.Caption, txt);DrawRoundButton(&Time_reversing1);}
MOVW	R0, #lo_addr(_Time_reversing1+24)
MOVT	R0, #hi_addr(_Time_reversing1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time69
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Time_reversing1+24)
MOVT	R0, #hi_addr(_Time_reversing1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_reversing1+0)
MOVT	R0, #hi_addr(_Time_reversing1+0)
BL	_DrawRoundButton+0
L_working_time69:
;Pages.c,303 :: 		IntToStr(system_reg[TIM_P_SOURS_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+910)
MOVT	R0, #hi_addr(_system_reg+910)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,304 :: 		if(strncmp(txt,Time_source1.Caption,7)!=0){strcpy(Time_source1.Caption, txt);DrawRoundButton(&Time_source1);}
MOVW	R0, #lo_addr(_Time_source1+24)
MOVT	R0, #hi_addr(_Time_source1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time70
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Time_source1+24)
MOVT	R0, #hi_addr(_Time_source1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_source1+0)
MOVT	R0, #hi_addr(_Time_source1+0)
BL	_DrawRoundButton+0
L_working_time70:
;Pages.c,305 :: 		IntToStr(system_reg[TIM_P_HEAT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+908)
MOVT	R0, #hi_addr(_system_reg+908)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,306 :: 		if(strncmp(txt,Time_heat1.Caption,7)!=0){strcpy(Time_heat1.Caption, txt);DrawRoundButton(&Time_heat1);}
MOVW	R0, #lo_addr(_Time_heat1+24)
MOVT	R0, #hi_addr(_Time_heat1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time71
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Time_heat1+24)
MOVT	R0, #hi_addr(_Time_heat1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_heat1+0)
MOVT	R0, #hi_addr(_Time_heat1+0)
BL	_DrawRoundButton+0
L_working_time71:
;Pages.c,307 :: 		}
L_end_working_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _working_time
_schema1_page:
;Pages.c,309 :: 		void schema1_page(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Pages.c,312 :: 		if(system_reg[COM_STATE_1]==1) DrawImage(&Image76);
MOVW	R0, #lo_addr(_system_reg+928)
MOVT	R0, #hi_addr(_system_reg+928)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page72
MOVW	R0, #lo_addr(_Image76+0)
MOVT	R0, #hi_addr(_Image76+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page73
L_schema1_page72:
;Pages.c,313 :: 		else DrawImage(&Image119);
MOVW	R0, #lo_addr(_Image119+0)
MOVT	R0, #hi_addr(_Image119+0)
BL	_DrawImage+0
L_schema1_page73:
;Pages.c,314 :: 		if(system_reg[PUMP_HEAT_STATE_1]==1) DrawImage(&Image75);
MOVW	R0, #lo_addr(_system_reg+930)
MOVT	R0, #hi_addr(_system_reg+930)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page74
MOVW	R0, #lo_addr(_Image75+0)
MOVT	R0, #hi_addr(_Image75+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page75
L_schema1_page74:
;Pages.c,315 :: 		else DrawImage(&Image124);
MOVW	R0, #lo_addr(_Image124+0)
MOVT	R0, #hi_addr(_Image124+0)
BL	_DrawImage+0
L_schema1_page75:
;Pages.c,316 :: 		if(system_reg[PUMP_SOURS_STATE_1]==1) DrawImage(&Image74);
MOVW	R0, #lo_addr(_system_reg+932)
MOVT	R0, #hi_addr(_system_reg+932)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page76
MOVW	R0, #lo_addr(_Image74+0)
MOVT	R0, #hi_addr(_Image74+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page77
L_schema1_page76:
;Pages.c,317 :: 		else DrawImage(&Image117);
MOVW	R0, #lo_addr(_Image117+0)
MOVT	R0, #hi_addr(_Image117+0)
BL	_DrawImage+0
L_schema1_page77:
;Pages.c,318 :: 		if(system_reg[REV_STATE_1]==1) DrawImage(&Image73);
MOVW	R0, #lo_addr(_system_reg+934)
MOVT	R0, #hi_addr(_system_reg+934)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page78
MOVW	R0, #lo_addr(_Image73+0)
MOVT	R0, #hi_addr(_Image73+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page79
L_schema1_page78:
;Pages.c,319 :: 		else DrawImage(&Image118);
MOVW	R0, #lo_addr(_Image118+0)
MOVT	R0, #hi_addr(_Image118+0)
BL	_DrawImage+0
L_schema1_page79:
;Pages.c,320 :: 		if(system_reg[THREE_STATE_1]==1) DrawImage(&Image77);
MOVW	R0, #lo_addr(_system_reg+936)
MOVT	R0, #hi_addr(_system_reg+936)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page80
MOVW	R0, #lo_addr(_Image77+0)
MOVT	R0, #hi_addr(_Image77+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page81
L_schema1_page80:
;Pages.c,321 :: 		else DrawImage(&Image120);
MOVW	R0, #lo_addr(_Image120+0)
MOVT	R0, #hi_addr(_Image120+0)
BL	_DrawImage+0
L_schema1_page81:
;Pages.c,323 :: 		IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+884)
MOVT	R0, #hi_addr(_system_reg+884)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,325 :: 		if(strncmp(txt,S_Brine_In_1.Caption,2)!=0){strncpy(S_Brine_In_1.Caption, txt, 2);DrawButton(&S_Brine_In_1);}
MOVW	R0, #lo_addr(_S_Brine_In_1+24)
MOVT	R0, #hi_addr(_S_Brine_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page82
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_Brine_In_1+24)
MOVT	R0, #hi_addr(_S_Brine_In_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Brine_In_1+0)
MOVT	R0, #hi_addr(_S_Brine_In_1+0)
BL	_DrawButton+0
L_schema1_page82:
;Pages.c,328 :: 		IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+882)
MOVT	R0, #hi_addr(_system_reg+882)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,330 :: 		if(strncmp(txt,S_Brine_Out_1.Caption,2)!=0){strncpy(S_Brine_Out_1.Caption, txt, 2);DrawButton(&S_Brine_Out_1);}
MOVW	R0, #lo_addr(_S_Brine_Out_1+24)
MOVT	R0, #hi_addr(_S_Brine_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page83
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_Brine_Out_1+24)
MOVT	R0, #hi_addr(_S_Brine_Out_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Brine_Out_1+0)
MOVT	R0, #hi_addr(_S_Brine_Out_1+0)
BL	_DrawButton+0
L_schema1_page83:
;Pages.c,333 :: 		IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+888)
MOVT	R0, #hi_addr(_system_reg+888)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,335 :: 		if(strncmp(txt,S_Heat_In_1.Caption,2)!=0){strncpy(S_Heat_In_1.Caption, txt, 2);DrawButton(&S_Heat_In_1);}
MOVW	R0, #lo_addr(_S_Heat_In_1+24)
MOVT	R0, #hi_addr(_S_Heat_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page84
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_Heat_In_1+24)
MOVT	R0, #hi_addr(_S_Heat_In_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_In_1+0)
MOVT	R0, #hi_addr(_S_Heat_In_1+0)
BL	_DrawButton+0
L_schema1_page84:
;Pages.c,338 :: 		IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+886)
MOVT	R0, #hi_addr(_system_reg+886)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,340 :: 		if(strncmp(txt,S_Heat_Out_1.Caption,2)!=0){strncpy(S_Heat_Out_1.Caption, txt, 2);DrawButton(&S_Heat_Out_1);}
MOVW	R0, #lo_addr(_S_Heat_Out_1+24)
MOVT	R0, #hi_addr(_S_Heat_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page85
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_Heat_Out_1+24)
MOVT	R0, #hi_addr(_S_Heat_Out_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_Out_1+0)
MOVT	R0, #hi_addr(_S_Heat_Out_1+0)
BL	_DrawButton+0
L_schema1_page85:
;Pages.c,343 :: 		IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+890)
MOVT	R0, #hi_addr(_system_reg+890)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,345 :: 		if(system_reg[HEAT_OUT_1]<100){
MOVW	R0, #lo_addr(_system_reg+886)
MOVT	R0, #hi_addr(_system_reg+886)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L_schema1_page86
;Pages.c,346 :: 		if(strncmp(txt,S_ComprEx_1.Caption,2)!=0){strncpy(S_ComprEx_1.Caption, txt, 2);
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page87
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
STR	R0, [SP, #12]
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,347 :: 		S_ComprEx_1.Caption[2]=S_ComprEx_1.Caption[1];S_ComprEx_1.Caption[1]=S_ComprEx_1.Caption[0];S_ComprEx_1.Caption[0]='0';
MOVW	R2, #lo_addr(_S_ComprEx_1+24)
MOVT	R2, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #2
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
LDR	R2, [SP, #12]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,348 :: 		DrawRoundButton(&S_ComprEx_1);
MOVW	R0, #lo_addr(_S_ComprEx_1+0)
MOVT	R0, #hi_addr(_S_ComprEx_1+0)
BL	_DrawRoundButton+0
;Pages.c,349 :: 		strncpy(S_ComprEx_1.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,350 :: 		}
L_schema1_page87:
;Pages.c,351 :: 		}
IT	AL
BAL	L_schema1_page88
L_schema1_page86:
;Pages.c,352 :: 		else{if(strncmp(txt,S_ComprEx_1.Caption,3)!=0){strncpy(S_ComprEx_1.Caption, txt, 3);DrawButton(&S_ComprEx_1);} }
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page89
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_ComprEx_1+0)
MOVT	R0, #hi_addr(_S_ComprEx_1+0)
BL	_DrawButton+0
L_schema1_page89:
L_schema1_page88:
;Pages.c,354 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,356 :: 		if(strncmp(txt,S_SH_1.Caption,2)!=0){strncpy(S_SH_1.Caption, txt, 2);DrawButton(&S_SH_1);}
MOVW	R0, #lo_addr(_S_SH_1+24)
MOVT	R0, #hi_addr(_S_SH_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page90
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_SH_1+24)
MOVT	R0, #hi_addr(_S_SH_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_SH_1+0)
MOVT	R0, #hi_addr(_S_SH_1+0)
BL	_DrawButton+0
L_schema1_page90:
;Pages.c,361 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+874)
MOVT	R0, #hi_addr(_system_reg+874)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,363 :: 		if(strncmp(txt,Sens_DHW.Caption,2)!=0){strncpy(Sens_DHW.Caption, txt, 2);DrawButton(&Sens_DHW);}
MOVW	R0, #lo_addr(_Sens_DHW+24)
MOVT	R0, #hi_addr(_Sens_DHW+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page91
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Sens_DHW+24)
MOVT	R0, #hi_addr(_Sens_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Sens_DHW+0)
MOVT	R0, #hi_addr(_Sens_DHW+0)
BL	_DrawButton+0
L_schema1_page91:
;Pages.c,366 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+876)
MOVT	R0, #hi_addr(_system_reg+876)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,368 :: 		if(strncmp(txt,S_tank.Caption,2)!=0){strncpy(S_tank.Caption, txt, 2);DrawButton(&S_tank);}
MOVW	R0, #lo_addr(_S_tank+24)
MOVT	R0, #hi_addr(_S_tank+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page92
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_tank+24)
MOVT	R0, #hi_addr(_S_tank+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_tank+0)
MOVT	R0, #hi_addr(_S_tank+0)
BL	_DrawButton+0
L_schema1_page92:
;Pages.c,371 :: 		IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+894)
MOVT	R0, #hi_addr(_system_reg+894)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,373 :: 		if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
MOVW	R0, #lo_addr(_S_High_Press_1+24)
MOVT	R0, #hi_addr(_S_High_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page93
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_High_Press_1+24)
MOVT	R0, #hi_addr(_S_High_Press_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_High_Press_1+0)
MOVT	R0, #hi_addr(_S_High_Press_1+0)
BL	_DrawButton+0
L_schema1_page93:
;Pages.c,376 :: 		IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+896)
MOVT	R0, #hi_addr(_system_reg+896)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,378 :: 		if(strncmp(txt,S_Low_Press_1.Caption,2)!=0){strncpy(S_Low_Press_1.Caption, txt, 2);DrawButton(&S_Low_Press_1);}
MOVW	R0, #lo_addr(_S_Low_Press_1+24)
MOVT	R0, #hi_addr(_S_Low_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page94
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_Low_Press_1+24)
MOVT	R0, #hi_addr(_S_Low_Press_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Low_Press_1+0)
MOVT	R0, #hi_addr(_S_Low_Press_1+0)
BL	_DrawButton+0
L_schema1_page94:
;Pages.c,379 :: 		}
L_end_schema1_page:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _schema1_page
