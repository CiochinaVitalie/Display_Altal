_main_page:
;Pages.c,10 :: 		void main_page(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,17 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
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
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page159
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page158
L__main_page157:
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
L__main_page159:
L__main_page158:
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
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
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
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page161
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page160
L__main_page156:
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
L__main_page161:
L__main_page160:
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
MOVW	R0, #lo_addr(_system_reg+322)
MOVT	R0, #hi_addr(_system_reg+322)
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
MOVW	R0, #lo_addr(_system_reg+322)
MOVT	R0, #hi_addr(_system_reg+322)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page163
MOVW	R0, #lo_addr(_system_reg+322)
MOVT	R0, #hi_addr(_system_reg+322)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page162
L__main_page155:
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
L__main_page163:
L__main_page162:
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
MOVW	R0, #lo_addr(_system_reg+302)
MOVT	R0, #hi_addr(_system_reg+302)
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
MOVW	R0, #lo_addr(_system_reg+302)
MOVT	R0, #hi_addr(_system_reg+302)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page165
MOVW	R0, #lo_addr(_system_reg+302)
MOVT	R0, #hi_addr(_system_reg+302)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page164
L__main_page154:
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
L__main_page165:
L__main_page164:
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
;Pages.c,53 :: 		if(system_reg[THREE_STATE]==1){
MOVW	R0, #lo_addr(_system_reg+102)
MOVT	R0, #hi_addr(_system_reg+102)
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
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
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
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
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
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage170
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__startPage169
L__startPage168:
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
L__startPage170:
L__startPage169:
;Pages.c,79 :: 		if(system_reg[HEAT]==1 && system_reg[COOL]==0) {ON_OFF_Heat_Cool.Caption = "ON"; bar_heating.Caption = "HEATING";DrawRoundButton(&bar_heating);DrawImage(&heat_icon);}
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__startPage172
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage171
L__startPage167:
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
L__startPage172:
L__startPage171:
;Pages.c,80 :: 		if(system_reg[HEAT]==0 && system_reg[COOL]==0) ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage174
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage173
L__startPage166:
MOVW	R1, #lo_addr(?lstr5_Pages+0)
MOVT	R1, #hi_addr(?lstr5_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
L__startPage174:
L__startPage173:
;Pages.c,81 :: 		if(system_reg[HEATWATER]==0)ON_OFF_DHW.Caption = "OFF";
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
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
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
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
;Pages.c,94 :: 		IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,95 :: 		if(strncmp(txt,S_Brine_Inlet_1.Caption,2)!=0){strncpy(S_Brine_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Inlet_1);}
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
;Pages.c,96 :: 		IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+322)
MOVT	R1, #hi_addr(_system_reg+322)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,97 :: 		if(strncmp(txt,S_Brine_Outlet_1.Caption,2)!=0){strncpy(S_Brine_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Outlet_1);}
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
;Pages.c,98 :: 		IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+262)
MOVT	R1, #hi_addr(_system_reg+262)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,99 :: 		if(strncmp(txt,S_Heat_Inlet_1.Caption,2)!=0){strncpy(S_Heat_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Inlet_1);}
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
;Pages.c,100 :: 		IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,101 :: 		if(strncmp(txt,S_Heat_Outlet_1.Caption,2)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Outlet_1);}
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
;Pages.c,102 :: 		IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+402)
MOVT	R1, #hi_addr(_system_reg+402)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,103 :: 		if(system_reg[EXAUST_TEMP_1]<100){
MOVW	R1, #lo_addr(_system_reg+402)
MOVT	R1, #hi_addr(_system_reg+402)
LDRSH	R1, [R1, #0]
CMP	R1, #100
IT	GE
BGE	L_sensor_136
;Pages.c,104 :: 		if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
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
;Pages.c,105 :: 		S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
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
;Pages.c,106 :: 		DrawRoundButton(&S_Compressor_1);
MOVW	R0, #lo_addr(_S_Compressor_1+0)
MOVT	R0, #hi_addr(_S_Compressor_1+0)
BL	_DrawRoundButton+0
;Pages.c,107 :: 		strncpy(S_Compressor_1.Caption, txt, 3);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,108 :: 		}
L_sensor_137:
;Pages.c,109 :: 		}
IT	AL
BAL	L_sensor_138
L_sensor_136:
;Pages.c,110 :: 		else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
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
;Pages.c,111 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,112 :: 		if(strncmp(txt,S_Superheat_1.Caption,2)!=0){strncpy(S_Superheat_1.Caption, txt, 2);DrawRoundButton(&S_Superheat_1);}
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
;Pages.c,113 :: 		IntToStr(system_reg[S_COOL_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+222)
MOVT	R1, #hi_addr(_system_reg+222)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,114 :: 		if(strncmp(txt,S_Subcool_1.Caption,2)!=0){strncpy(S_Subcool_1.Caption, txt, 2);DrawRoundButton(&S_Subcool_1);}
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
;Pages.c,115 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+162)
MOVT	R1, #hi_addr(_system_reg+162)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,116 :: 		if(strncmp(txt,S_DHW.Caption,2)!=0){strncpy(S_DHW.Caption, txt, 2);DrawRoundButton(&S_DHW);}
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
;Pages.c,117 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+142)
MOVT	R1, #hi_addr(_system_reg+142)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,118 :: 		if(strncmp(txt,SS_tank.Caption,2)!=0){strncpy(SS_tank.Caption, txt, 2);DrawRoundButton(&SS_tank);}
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
;Pages.c,119 :: 		IntToStr(system_reg[CONDENS_TEMP_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,120 :: 		if(strncmp(txt,S_condenser_1.Caption,2)!=0){strncpy(S_condenser_1.Caption, txt, 2);DrawRoundButton(&S_condenser_1);}
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
;Pages.c,121 :: 		IntToStr(system_reg[SUCT_TEMP_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,122 :: 		if(strncmp(txt,S_suction_1.Caption,2)!=0){strncpy(S_suction_1.Caption, txt, 2);DrawRoundButton(&S_suction_1);}
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
;Pages.c,123 :: 		IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+342)
MOVT	R1, #hi_addr(_system_reg+342)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,124 :: 		if(strncmp(txt,S_High_Pressure_1.Caption,2)!=0){strncpy(S_High_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_High_Pressure_1);}
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
;Pages.c,125 :: 		IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+362)
MOVT	R1, #hi_addr(_system_reg+362)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,126 :: 		if(strncmp(txt,S_Low_Pressure_1.Caption,2)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_Low_Pressure_1);}
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
;Pages.c,127 :: 		}
IT	AL
BAL	L_sensor_148
L_sensor_131:
;Pages.c,128 :: 		else if(num_page==1)
; num_page start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_sensor_149
; num_page end address is: 0 (R0)
;Pages.c,130 :: 		IntToStr(system_reg[SOURC_IN_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,131 :: 		if(strncmp(txt,S_Brine_Inlet_1.Caption,2)!=0){strncpy(S_Brine_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Inlet_1);}
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
BEQ	L_sensor_150
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
L_sensor_150:
;Pages.c,132 :: 		IntToStr(system_reg[SOURC_OUT_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+324)
MOVT	R1, #hi_addr(_system_reg+324)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,133 :: 		if(strncmp(txt,S_Brine_Outlet_1.Caption,2)!=0){strncpy(S_Brine_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Outlet_1);}
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
BEQ	L_sensor_151
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
L_sensor_151:
;Pages.c,134 :: 		IntToStr(system_reg[HEAT_IN_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+264)
MOVT	R1, #hi_addr(_system_reg+264)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,135 :: 		if(strncmp(txt,S_Heat_Inlet_1.Caption,2)!=0){strncpy(S_Heat_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Inlet_1);}
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
BEQ	L_sensor_152
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
L_sensor_152:
;Pages.c,136 :: 		IntToStr(system_reg[HEAT_OUT_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+284)
MOVT	R1, #hi_addr(_system_reg+284)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,137 :: 		if(strncmp(txt,S_Heat_Outlet_1.Caption,2)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Outlet_1);}
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
BEQ	L_sensor_153
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
L_sensor_153:
;Pages.c,138 :: 		IntToStr(system_reg[EXAUST_TEMP_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+404)
MOVT	R1, #hi_addr(_system_reg+404)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,139 :: 		if(system_reg[EXAUST_TEMP_2]<100){
MOVW	R1, #lo_addr(_system_reg+404)
MOVT	R1, #hi_addr(_system_reg+404)
LDRSH	R1, [R1, #0]
CMP	R1, #100
IT	GE
BGE	L_sensor_154
;Pages.c,140 :: 		if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
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
BEQ	L_sensor_155
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
;Pages.c,141 :: 		S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
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
;Pages.c,142 :: 		DrawRoundButton(&S_Compressor_1);
MOVW	R0, #lo_addr(_S_Compressor_1+0)
MOVT	R0, #hi_addr(_S_Compressor_1+0)
BL	_DrawRoundButton+0
;Pages.c,143 :: 		strncpy(S_Compressor_1.Caption, txt, 3);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,144 :: 		}
L_sensor_155:
;Pages.c,145 :: 		}
IT	AL
BAL	L_sensor_156
L_sensor_154:
;Pages.c,146 :: 		else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
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
BEQ	L_sensor_157
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
L_sensor_157:
L_sensor_156:
;Pages.c,147 :: 		IntToStr(system_reg[S_HEAT_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,148 :: 		if(strncmp(txt,S_Superheat_1.Caption,2)!=0){strncpy(S_Superheat_1.Caption, txt, 2);DrawRoundButton(&S_Superheat_1);}
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
BEQ	L_sensor_158
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
L_sensor_158:
;Pages.c,149 :: 		IntToStr(system_reg[S_COOL_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+224)
MOVT	R1, #hi_addr(_system_reg+224)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,150 :: 		if(strncmp(txt,S_Subcool_1.Caption,2)!=0){strncpy(S_Subcool_1.Caption, txt, 2);DrawRoundButton(&S_Subcool_1);}
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
BEQ	L_sensor_159
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
L_sensor_159:
;Pages.c,151 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+162)
MOVT	R1, #hi_addr(_system_reg+162)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,152 :: 		if(strncmp(txt,S_DHW.Caption,2)!=0){strncpy(S_DHW.Caption, txt, 2);DrawRoundButton(&S_DHW);}
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
BEQ	L_sensor_160
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
L_sensor_160:
;Pages.c,153 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+142)
MOVT	R1, #hi_addr(_system_reg+142)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,154 :: 		if(strncmp(txt,SS_tank.Caption,2)!=0){strncpy(SS_tank.Caption, txt, 2);DrawRoundButton(&SS_tank);}
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
BEQ	L_sensor_161
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
L_sensor_161:
;Pages.c,155 :: 		IntToStr(system_reg[CONDENS_TEMP_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,156 :: 		if(strncmp(txt,S_condenser_1.Caption,2)!=0){strncpy(S_condenser_1.Caption, txt, 2);DrawRoundButton(&S_condenser_1);}
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
BEQ	L_sensor_162
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
L_sensor_162:
;Pages.c,157 :: 		IntToStr(system_reg[SUCT_TEMP_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,158 :: 		if(strncmp(txt,S_suction_1.Caption,2)!=0){strncpy(S_suction_1.Caption, txt, 2);DrawRoundButton(&S_suction_1);}
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
BEQ	L_sensor_163
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
L_sensor_163:
;Pages.c,159 :: 		IntToStr(system_reg[HIGH_PRESS_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+344)
MOVT	R1, #hi_addr(_system_reg+344)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,160 :: 		if(strncmp(txt,S_High_Pressure_1.Caption,2)!=0){strncpy(S_High_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_High_Pressure_1);}
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
BEQ	L_sensor_164
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
L_sensor_164:
;Pages.c,161 :: 		IntToStr(system_reg[LOW_PRESS_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+364)
MOVT	R1, #hi_addr(_system_reg+364)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,162 :: 		if(strncmp(txt,S_Low_Pressure_1.Caption,2)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_Low_Pressure_1);}
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
BEQ	L_sensor_165
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
L_sensor_165:
;Pages.c,163 :: 		}
L_sensor_149:
L_sensor_148:
;Pages.c,164 :: 		}
L_end_sensor_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _sensor_1
_data_eeprom:
;Pages.c,165 :: 		void data_eeprom(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,169 :: 		IntToStr(system_reg[COMP_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,170 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,171 :: 		IntToStr(system_reg[SOURS_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,172 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,173 :: 		IntToStr(system_reg[HEAT_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,174 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,175 :: 		IntToStr(system_reg[REVERS_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,176 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,177 :: 		IntToStr(system_reg[TRV_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,178 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,179 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,180 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,182 :: 		IntToStr(system_reg[HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,183 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,184 :: 		IntToStr(system_reg[HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,185 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,186 :: 		IntToStr(system_reg[EXAUST_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,187 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,188 :: 		IntToStr(system_reg[SOURS_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,189 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,190 :: 		IntToStr(system_reg[SOURS_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,191 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,192 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,193 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,195 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,196 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,197 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,198 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,199 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,200 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,201 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,202 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,203 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,204 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,206 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,207 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,209 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,210 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,211 :: 		IntToStr(system_reg[S_COOL_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,212 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,213 :: 		IntToStr(system_reg[S_COOL_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,214 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,215 :: 		IntToStr(system_reg[HP_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,216 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,217 :: 		IntToStr(system_reg[HP_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,218 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,220 :: 		IntToStr(system_reg[LP_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,221 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,222 :: 		IntToStr(system_reg[LP_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,223 :: 		strncpy(Set_min_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,225 :: 		IntToStr(system_reg[DIFF_HEAT], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,226 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,227 :: 		IntToStr(system_reg[DIFF_COOL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,228 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,229 :: 		IntToStr(system_reg[DIFF_DHW], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,230 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,233 :: 		if(system_reg[POWER]==1){
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom66
;Pages.c,234 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Pages.c,236 :: 		}
IT	AL
BAL	L_data_eeprom67
L_data_eeprom66:
;Pages.c,238 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Pages.c,240 :: 		}
L_data_eeprom67:
;Pages.c,242 :: 		if(system_reg[COOL]==1){
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom68
;Pages.c,243 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr8_Pages+0)
MOVT	R1, #hi_addr(?lstr8_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Pages.c,244 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Pages.c,245 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Pages.c,246 :: 		}
IT	AL
BAL	L_data_eeprom69
L_data_eeprom68:
;Pages.c,247 :: 		else if( system_reg[HEAT]==1 ){
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom70
;Pages.c,248 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr9_Pages+0)
MOVT	R1, #hi_addr(?lstr9_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Pages.c,249 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Pages.c,250 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Pages.c,251 :: 		}
L_data_eeprom70:
L_data_eeprom69:
;Pages.c,253 :: 		if( system_reg[HEAT]==1 || system_reg[COOL]==1){
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__data_eeprom178
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__data_eeprom177
IT	AL
BAL	L_data_eeprom73
L__data_eeprom178:
L__data_eeprom177:
;Pages.c,254 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr10_Pages+0)
MOVT	R1, #hi_addr(?lstr10_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Pages.c,255 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,256 :: 		}
IT	AL
BAL	L_data_eeprom74
L_data_eeprom73:
;Pages.c,257 :: 		else if(system_reg[HEAT]==0 && system_reg[COOL]==0){
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__data_eeprom180
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__data_eeprom179
L__data_eeprom175:
;Pages.c,258 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr11_Pages+0)
MOVT	R1, #hi_addr(?lstr11_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Pages.c,259 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,257 :: 		else if(system_reg[HEAT]==0 && system_reg[COOL]==0){
L__data_eeprom180:
L__data_eeprom179:
;Pages.c,260 :: 		}
L_data_eeprom74:
;Pages.c,262 :: 		if(system_reg[HEATWATER]==0){
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_data_eeprom78
;Pages.c,263 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr12_Pages+0)
MOVT	R1, #hi_addr(?lstr12_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Pages.c,264 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,265 :: 		}
IT	AL
BAL	L_data_eeprom79
L_data_eeprom78:
;Pages.c,266 :: 		else if(system_reg[HEATWATER]==1){
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom80
;Pages.c,267 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr13_Pages+0)
MOVT	R1, #hi_addr(?lstr13_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Pages.c,268 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,270 :: 		}
L_data_eeprom80:
L_data_eeprom79:
;Pages.c,271 :: 		if(system_reg[NOMB_COMPRESSORS]==1){ Two_Compressors.Visible= 0;One_Compressors.Visible = 1;  }
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom81
MOVS	R1, #0
MOVW	R0, #lo_addr(_Two_Compressors+20)
MOVT	R0, #hi_addr(_Two_Compressors+20)
STRB	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_One_Compressors+20)
MOVT	R0, #hi_addr(_One_Compressors+20)
STRB	R1, [R0, #0]
IT	AL
BAL	L_data_eeprom82
L_data_eeprom81:
;Pages.c,272 :: 		else  if(system_reg[NOMB_COMPRESSORS]==2)  { Two_Compressors.Visible= 1;One_Compressors.Visible = 0;  }
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_data_eeprom83
MOVS	R1, #1
MOVW	R0, #lo_addr(_Two_Compressors+20)
MOVT	R0, #hi_addr(_Two_Compressors+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_One_Compressors+20)
MOVT	R0, #hi_addr(_One_Compressors+20)
STRB	R1, [R0, #0]
L_data_eeprom83:
L_data_eeprom82:
;Pages.c,273 :: 		}
L_end_data_eeprom:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _data_eeprom
_count_steps:
;Pages.c,274 :: 		void count_steps(unsigned char num_page){
; num_page start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; num_page end address is: 0 (R0)
; num_page start address is: 0 (R0)
;Pages.c,276 :: 		if(num_page==0)
CMP	R0, #0
IT	NE
BNE	L_count_steps84
; num_page end address is: 0 (R0)
;Pages.c,278 :: 		IntToStr(system_reg[TRV_STEPS_1], txt);Ltrim(txt);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+122)
MOVT	R1, #hi_addr(_system_reg+122)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,279 :: 		if(system_reg[TRV_STEPS_1]<100){
MOVW	R1, #lo_addr(_system_reg+122)
MOVT	R1, #hi_addr(_system_reg+122)
LDRSH	R1, [R1, #0]
CMP	R1, #100
IT	GE
BGE	L_count_steps85
;Pages.c,280 :: 		if(strncmp(txt,EEV1_value.Caption,2)!=0){strncpy(EEV1_value.Caption, txt, 2);
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps86
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
STR	R1, [SP, #12]
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,281 :: 		EEV1_value.Caption[2]=EEV1_value.Caption[1];EEV1_value.Caption[1]=EEV1_value.Caption[0];EEV1_value.Caption[0]='0';
MOVW	R3, #lo_addr(_EEV1_value+24)
MOVT	R3, #hi_addr(_EEV1_value+24)
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
;Pages.c,282 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Pages.c,283 :: 		strncpy(EEV1_value.Caption, txt, 3);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,284 :: 		}}
L_count_steps86:
IT	AL
BAL	L_count_steps87
L_count_steps85:
;Pages.c,285 :: 		else{if(strncmp(txt,EEV1_value.Caption,3)!=0){strncpy(EEV1_value.Caption, txt, 3);DrawRoundButton(&EEV1_value);} }
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps88
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
L_count_steps88:
L_count_steps87:
;Pages.c,286 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,287 :: 		if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
MOVW	R1, #lo_addr(_EEV1_superheat+24)
MOVT	R1, #hi_addr(_EEV1_superheat+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps89
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_superheat+24)
MOVT	R1, #hi_addr(_EEV1_superheat+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_EEV1_superheat+0)
MOVT	R0, #hi_addr(_EEV1_superheat+0)
BL	_DrawRoundButton+0
L_count_steps89:
;Pages.c,288 :: 		}
IT	AL
BAL	L_count_steps90
L_count_steps84:
;Pages.c,291 :: 		IntToStr(system_reg[TRV_STEPS_2], txt);Ltrim(txt);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+124)
MOVT	R1, #hi_addr(_system_reg+124)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,292 :: 		if(system_reg[TRV_STEPS_2]<100){
MOVW	R1, #lo_addr(_system_reg+124)
MOVT	R1, #hi_addr(_system_reg+124)
LDRSH	R1, [R1, #0]
CMP	R1, #100
IT	GE
BGE	L_count_steps91
;Pages.c,293 :: 		if(strncmp(txt,EEV1_value.Caption,2)!=0){strncpy(EEV1_value.Caption, txt, 2);
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps92
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
STR	R1, [SP, #12]
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,294 :: 		EEV1_value.Caption[2]=EEV1_value.Caption[1];EEV1_value.Caption[1]=EEV1_value.Caption[0];EEV1_value.Caption[0]='0';
MOVW	R3, #lo_addr(_EEV1_value+24)
MOVT	R3, #hi_addr(_EEV1_value+24)
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
;Pages.c,295 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Pages.c,296 :: 		strncpy(EEV1_value.Caption, txt, 3);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,297 :: 		}}
L_count_steps92:
IT	AL
BAL	L_count_steps93
L_count_steps91:
;Pages.c,298 :: 		else{if(strncmp(txt,EEV1_value.Caption,3)!=0){strncpy(EEV1_value.Caption, txt, 3);DrawRoundButton(&EEV1_value);} }
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps94
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
L_count_steps94:
L_count_steps93:
;Pages.c,299 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,300 :: 		if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
MOVW	R1, #lo_addr(_EEV1_superheat+24)
MOVT	R1, #hi_addr(_EEV1_superheat+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_count_steps95
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_superheat+24)
MOVT	R1, #hi_addr(_EEV1_superheat+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_EEV1_superheat+0)
MOVT	R0, #hi_addr(_EEV1_superheat+0)
BL	_DrawRoundButton+0
L_count_steps95:
;Pages.c,301 :: 		}
L_count_steps90:
;Pages.c,302 :: 		}
L_end_count_steps:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _count_steps
_working_time:
;Pages.c,304 :: 		void working_time(unsigned char num_page){
; num_page start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; num_page end address is: 0 (R0)
; num_page start address is: 0 (R0)
;Pages.c,306 :: 		if(num_page==0)
CMP	R0, #0
IT	NE
BNE	L_working_time96
; num_page end address is: 0 (R0)
;Pages.c,308 :: 		IntToStr(system_reg[TIM_COM_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+682)
MOVT	R1, #hi_addr(_system_reg+682)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,309 :: 		if(strncmp(txt,Time_compressor1.Caption,7)!=0){strcpy(Time_compressor1.Caption, txt);DrawRoundButton(&Time_compressor1);}
MOVW	R1, #lo_addr(_Time_compressor1+24)
MOVT	R1, #hi_addr(_Time_compressor1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time97
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_compressor1+24)
MOVT	R1, #hi_addr(_Time_compressor1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_compressor1+0)
MOVT	R0, #hi_addr(_Time_compressor1+0)
BL	_DrawRoundButton+0
L_working_time97:
;Pages.c,310 :: 		IntToStr(system_reg[TIM_REV_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+762)
MOVT	R1, #hi_addr(_system_reg+762)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,311 :: 		if(strncmp(txt,Time_reversing1.Caption,7)!=0){strcpy(Time_reversing1.Caption, txt);DrawRoundButton(&Time_reversing1);}
MOVW	R1, #lo_addr(_Time_reversing1+24)
MOVT	R1, #hi_addr(_Time_reversing1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time98
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_reversing1+24)
MOVT	R1, #hi_addr(_Time_reversing1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_reversing1+0)
MOVT	R0, #hi_addr(_Time_reversing1+0)
BL	_DrawRoundButton+0
L_working_time98:
;Pages.c,312 :: 		IntToStr(system_reg[TIM_P_SOURS_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+742)
MOVT	R1, #hi_addr(_system_reg+742)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,313 :: 		if(strncmp(txt,Time_source1.Caption,7)!=0){strcpy(Time_source1.Caption, txt);DrawRoundButton(&Time_source1);}
MOVW	R1, #lo_addr(_Time_source1+24)
MOVT	R1, #hi_addr(_Time_source1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time99
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_source1+24)
MOVT	R1, #hi_addr(_Time_source1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_source1+0)
MOVT	R0, #hi_addr(_Time_source1+0)
BL	_DrawRoundButton+0
L_working_time99:
;Pages.c,314 :: 		IntToStr(system_reg[TIM_P_HEAT_1], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+702)
MOVT	R1, #hi_addr(_system_reg+702)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,315 :: 		if(strncmp(txt,Time_heat1.Caption,7)!=0){strcpy(Time_heat1.Caption, txt);DrawRoundButton(&Time_heat1);}
MOVW	R1, #lo_addr(_Time_heat1+24)
MOVT	R1, #hi_addr(_Time_heat1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time100
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_heat1+24)
MOVT	R1, #hi_addr(_Time_heat1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_heat1+0)
MOVT	R0, #hi_addr(_Time_heat1+0)
BL	_DrawRoundButton+0
L_working_time100:
;Pages.c,316 :: 		}
IT	AL
BAL	L_working_time101
L_working_time96:
;Pages.c,319 :: 		IntToStr(system_reg[TIM_COM_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+684)
MOVT	R1, #hi_addr(_system_reg+684)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,320 :: 		if(strncmp(txt,Time_compressor1.Caption,7)!=0){strcpy(Time_compressor1.Caption, txt);DrawRoundButton(&Time_compressor1);}
MOVW	R1, #lo_addr(_Time_compressor1+24)
MOVT	R1, #hi_addr(_Time_compressor1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time102
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_compressor1+24)
MOVT	R1, #hi_addr(_Time_compressor1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_compressor1+0)
MOVT	R0, #hi_addr(_Time_compressor1+0)
BL	_DrawRoundButton+0
L_working_time102:
;Pages.c,321 :: 		IntToStr(system_reg[TIM_REV_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+764)
MOVT	R1, #hi_addr(_system_reg+764)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,322 :: 		if(strncmp(txt,Time_reversing1.Caption,7)!=0){strcpy(Time_reversing1.Caption, txt);DrawRoundButton(&Time_reversing1);}
MOVW	R1, #lo_addr(_Time_reversing1+24)
MOVT	R1, #hi_addr(_Time_reversing1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time103
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_reversing1+24)
MOVT	R1, #hi_addr(_Time_reversing1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_reversing1+0)
MOVT	R0, #hi_addr(_Time_reversing1+0)
BL	_DrawRoundButton+0
L_working_time103:
;Pages.c,323 :: 		IntToStr(system_reg[TIM_P_SOURS_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+744)
MOVT	R1, #hi_addr(_system_reg+744)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,324 :: 		if(strncmp(txt,Time_source1.Caption,7)!=0){strcpy(Time_source1.Caption, txt);DrawRoundButton(&Time_source1);}
MOVW	R1, #lo_addr(_Time_source1+24)
MOVT	R1, #hi_addr(_Time_source1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time104
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_source1+24)
MOVT	R1, #hi_addr(_Time_source1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_source1+0)
MOVT	R0, #hi_addr(_Time_source1+0)
BL	_DrawRoundButton+0
L_working_time104:
;Pages.c,325 :: 		IntToStr(system_reg[TIM_P_HEAT_2], txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+704)
MOVT	R1, #hi_addr(_system_reg+704)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,326 :: 		if(strncmp(txt,Time_heat1.Caption,7)!=0){strcpy(Time_heat1.Caption, txt);DrawRoundButton(&Time_heat1);}
MOVW	R1, #lo_addr(_Time_heat1+24)
MOVT	R1, #hi_addr(_Time_heat1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #7
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_working_time105
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_Time_heat1+24)
MOVT	R1, #hi_addr(_Time_heat1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
MOVW	R0, #lo_addr(_Time_heat1+0)
MOVT	R0, #hi_addr(_Time_heat1+0)
BL	_DrawRoundButton+0
L_working_time105:
;Pages.c,327 :: 		}
L_working_time101:
;Pages.c,328 :: 		}
L_end_working_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _working_time
_schema1_page:
;Pages.c,330 :: 		void schema1_page(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Pages.c,333 :: 		if(system_reg[COM_STATE_1]==1) DrawImage(&Image76);
MOVW	R0, #lo_addr(_system_reg+22)
MOVT	R0, #hi_addr(_system_reg+22)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page106
MOVW	R0, #lo_addr(_Image76+0)
MOVT	R0, #hi_addr(_Image76+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page107
L_schema1_page106:
;Pages.c,334 :: 		else DrawImage(&Image119);
MOVW	R0, #lo_addr(_Image119+0)
MOVT	R0, #hi_addr(_Image119+0)
BL	_DrawImage+0
L_schema1_page107:
;Pages.c,335 :: 		if(system_reg[PUMP_HEAT_STATE_1]==1) DrawImage(&Image75);
MOVW	R0, #lo_addr(_system_reg+62)
MOVT	R0, #hi_addr(_system_reg+62)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page108
MOVW	R0, #lo_addr(_Image75+0)
MOVT	R0, #hi_addr(_Image75+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page109
L_schema1_page108:
;Pages.c,336 :: 		else DrawImage(&Image124);
MOVW	R0, #lo_addr(_Image124+0)
MOVT	R0, #hi_addr(_Image124+0)
BL	_DrawImage+0
L_schema1_page109:
;Pages.c,337 :: 		if(system_reg[PUMP_SOURS_STATE_1]==1) DrawImage(&Image74);
MOVW	R0, #lo_addr(_system_reg+42)
MOVT	R0, #hi_addr(_system_reg+42)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page110
MOVW	R0, #lo_addr(_Image74+0)
MOVT	R0, #hi_addr(_Image74+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page111
L_schema1_page110:
;Pages.c,338 :: 		else DrawImage(&Image117);
MOVW	R0, #lo_addr(_Image117+0)
MOVT	R0, #hi_addr(_Image117+0)
BL	_DrawImage+0
L_schema1_page111:
;Pages.c,339 :: 		if(system_reg[REV_STATE_1]==1) DrawImage(&Image73);
MOVW	R0, #lo_addr(_system_reg+82)
MOVT	R0, #hi_addr(_system_reg+82)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page112
MOVW	R0, #lo_addr(_Image73+0)
MOVT	R0, #hi_addr(_Image73+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page113
L_schema1_page112:
;Pages.c,340 :: 		else DrawImage(&Image118);
MOVW	R0, #lo_addr(_Image118+0)
MOVT	R0, #hi_addr(_Image118+0)
BL	_DrawImage+0
L_schema1_page113:
;Pages.c,341 :: 		if(system_reg[THREE_STATE]==1) DrawImage(&Image77);
MOVW	R0, #lo_addr(_system_reg+102)
MOVT	R0, #hi_addr(_system_reg+102)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page114
MOVW	R0, #lo_addr(_Image77+0)
MOVT	R0, #hi_addr(_Image77+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page115
L_schema1_page114:
;Pages.c,342 :: 		else DrawImage(&Image120);
MOVW	R0, #lo_addr(_Image120+0)
MOVT	R0, #hi_addr(_Image120+0)
BL	_DrawImage+0
L_schema1_page115:
;Pages.c,343 :: 		IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+302)
MOVT	R0, #hi_addr(_system_reg+302)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,344 :: 		if(strncmp(txt,S_Brine_In_1.Caption,2)!=0){strncpy(S_Brine_In_1.Caption, txt, 2);DrawButton(&S_Brine_In_1);}
MOVW	R0, #lo_addr(_S_Brine_In_1+24)
MOVT	R0, #hi_addr(_S_Brine_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page116
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
L_schema1_page116:
;Pages.c,345 :: 		IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+322)
MOVT	R0, #hi_addr(_system_reg+322)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,346 :: 		if(strncmp(txt,S_Brine_Out_1.Caption,2)!=0){strncpy(S_Brine_Out_1.Caption, txt, 2);DrawButton(&S_Brine_Out_1);}
MOVW	R0, #lo_addr(_S_Brine_Out_1+24)
MOVT	R0, #hi_addr(_S_Brine_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page117
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
L_schema1_page117:
;Pages.c,347 :: 		IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+262)
MOVT	R0, #hi_addr(_system_reg+262)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,348 :: 		if(strncmp(txt,S_Heat_In_1.Caption,2)!=0){strncpy(S_Heat_In_1.Caption, txt, 2);DrawButton(&S_Heat_In_1);}
MOVW	R0, #lo_addr(_S_Heat_In_1+24)
MOVT	R0, #hi_addr(_S_Heat_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page118
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
L_schema1_page118:
;Pages.c,349 :: 		IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+282)
MOVT	R0, #hi_addr(_system_reg+282)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,350 :: 		if(strncmp(txt,S_Heat_Out_1.Caption,2)!=0){strncpy(S_Heat_Out_1.Caption, txt, 2);DrawButton(&S_Heat_Out_1);}
MOVW	R0, #lo_addr(_S_Heat_Out_1+24)
MOVT	R0, #hi_addr(_S_Heat_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page119
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
L_schema1_page119:
;Pages.c,351 :: 		IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+402)
MOVT	R0, #hi_addr(_system_reg+402)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,352 :: 		if(system_reg[HEAT_OUT_1]<100){
MOVW	R0, #lo_addr(_system_reg+282)
MOVT	R0, #hi_addr(_system_reg+282)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L_schema1_page120
;Pages.c,353 :: 		if(strncmp(txt,S_ComprEx_1.Caption,2)!=0){strncpy(S_ComprEx_1.Caption, txt, 2);
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page121
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
STR	R0, [SP, #12]
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,354 :: 		S_ComprEx_1.Caption[2]=S_ComprEx_1.Caption[1];S_ComprEx_1.Caption[1]=S_ComprEx_1.Caption[0];S_ComprEx_1.Caption[0]='0';
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
;Pages.c,355 :: 		DrawRoundButton(&S_ComprEx_1);
MOVW	R0, #lo_addr(_S_ComprEx_1+0)
MOVT	R0, #hi_addr(_S_ComprEx_1+0)
BL	_DrawRoundButton+0
;Pages.c,356 :: 		strncpy(S_ComprEx_1.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,357 :: 		}
L_schema1_page121:
;Pages.c,358 :: 		}
IT	AL
BAL	L_schema1_page122
L_schema1_page120:
;Pages.c,359 :: 		else{if(strncmp(txt,S_ComprEx_1.Caption,3)!=0){strncpy(S_ComprEx_1.Caption, txt, 3);DrawButton(&S_ComprEx_1);} }
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page123
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
L_schema1_page123:
L_schema1_page122:
;Pages.c,360 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+242)
MOVT	R0, #hi_addr(_system_reg+242)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,361 :: 		if(strncmp(txt,S_SH_1.Caption,2)!=0){strncpy(S_SH_1.Caption, txt, 2);DrawButton(&S_SH_1);}
MOVW	R0, #lo_addr(_S_SH_1+24)
MOVT	R0, #hi_addr(_S_SH_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page124
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
L_schema1_page124:
;Pages.c,365 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,366 :: 		if(strncmp(txt,Sens_DHW.Caption,2)!=0){strncpy(Sens_DHW.Caption, txt, 2);DrawButton(&Sens_DHW);}
MOVW	R0, #lo_addr(_Sens_DHW+24)
MOVT	R0, #hi_addr(_Sens_DHW+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page125
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
L_schema1_page125:
;Pages.c,367 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
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
BEQ	L_schema1_page126
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
L_schema1_page126:
;Pages.c,369 :: 		IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+342)
MOVT	R0, #hi_addr(_system_reg+342)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,370 :: 		if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
MOVW	R0, #lo_addr(_S_High_Press_1+24)
MOVT	R0, #hi_addr(_S_High_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page127
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
L_schema1_page127:
;Pages.c,371 :: 		IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+362)
MOVT	R0, #hi_addr(_system_reg+362)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,372 :: 		if(strncmp(txt,S_Low_Press_1.Caption,2)!=0){strncpy(S_Low_Press_1.Caption, txt, 2);DrawButton(&S_Low_Press_1);}
MOVW	R0, #lo_addr(_S_Low_Press_1+24)
MOVT	R0, #hi_addr(_S_Low_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page128
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
L_schema1_page128:
;Pages.c,373 :: 		}
L_end_schema1_page:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _schema1_page
_schema2_page:
;Pages.c,375 :: 		void schema2_page(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Pages.c,378 :: 		if(system_reg[COM_STATE_1]==1) DrawImage(&Image166);
MOVW	R0, #lo_addr(_system_reg+22)
MOVT	R0, #hi_addr(_system_reg+22)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page129
MOVW	R0, #lo_addr(_Image166+0)
MOVT	R0, #hi_addr(_Image166+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page130
L_schema2_page129:
;Pages.c,379 :: 		else DrawImage(&Image181);
MOVW	R0, #lo_addr(_Image181+0)
MOVT	R0, #hi_addr(_Image181+0)
BL	_DrawImage+0
L_schema2_page130:
;Pages.c,380 :: 		if(system_reg[COM_STATE_2]==1) DrawImage(&Image276);
MOVW	R0, #lo_addr(_system_reg+24)
MOVT	R0, #hi_addr(_system_reg+24)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page131
MOVW	R0, #lo_addr(_Image276+0)
MOVT	R0, #hi_addr(_Image276+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page132
L_schema2_page131:
;Pages.c,381 :: 		else DrawImage(&Image275);
MOVW	R0, #lo_addr(_Image275+0)
MOVT	R0, #hi_addr(_Image275+0)
BL	_DrawImage+0
L_schema2_page132:
;Pages.c,382 :: 		if(system_reg[PUMP_HEAT_STATE_1]==1) DrawImage(&Image75);
MOVW	R0, #lo_addr(_system_reg+62)
MOVT	R0, #hi_addr(_system_reg+62)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page133
MOVW	R0, #lo_addr(_Image75+0)
MOVT	R0, #hi_addr(_Image75+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page134
L_schema2_page133:
;Pages.c,383 :: 		else DrawImage(&Image124);
MOVW	R0, #lo_addr(_Image124+0)
MOVT	R0, #hi_addr(_Image124+0)
BL	_DrawImage+0
L_schema2_page134:
;Pages.c,384 :: 		if(system_reg[PUMP_SOURS_STATE_1]==1) DrawImage(&Image74);
MOVW	R0, #lo_addr(_system_reg+42)
MOVT	R0, #hi_addr(_system_reg+42)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page135
MOVW	R0, #lo_addr(_Image74+0)
MOVT	R0, #hi_addr(_Image74+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page136
L_schema2_page135:
;Pages.c,385 :: 		else DrawImage(&Image117);
MOVW	R0, #lo_addr(_Image117+0)
MOVT	R0, #hi_addr(_Image117+0)
BL	_DrawImage+0
L_schema2_page136:
;Pages.c,386 :: 		if(system_reg[REV_STATE_1]==1) DrawImage(&Image73);
MOVW	R0, #lo_addr(_system_reg+82)
MOVT	R0, #hi_addr(_system_reg+82)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page137
MOVW	R0, #lo_addr(_Image73+0)
MOVT	R0, #hi_addr(_Image73+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page138
L_schema2_page137:
;Pages.c,387 :: 		else DrawImage(&Image118);
MOVW	R0, #lo_addr(_Image118+0)
MOVT	R0, #hi_addr(_Image118+0)
BL	_DrawImage+0
L_schema2_page138:
;Pages.c,388 :: 		if(system_reg[THREE_STATE]==1) DrawImage(&Image77);
MOVW	R0, #lo_addr(_system_reg+102)
MOVT	R0, #hi_addr(_system_reg+102)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page139
MOVW	R0, #lo_addr(_Image77+0)
MOVT	R0, #hi_addr(_Image77+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page140
L_schema2_page139:
;Pages.c,389 :: 		else DrawImage(&Image120);
MOVW	R0, #lo_addr(_Image120+0)
MOVT	R0, #hi_addr(_Image120+0)
BL	_DrawImage+0
L_schema2_page140:
;Pages.c,390 :: 		IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+302)
MOVT	R0, #hi_addr(_system_reg+302)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,391 :: 		if(strncmp(txt,S_Brine_In_1.Caption,2)!=0){strncpy(S_Brine_In_1.Caption, txt, 2);DrawButton(&S_Brine_In_1);}
MOVW	R0, #lo_addr(_S_Brine_In_1+24)
MOVT	R0, #hi_addr(_S_Brine_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page141
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
L_schema2_page141:
;Pages.c,392 :: 		IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+322)
MOVT	R0, #hi_addr(_system_reg+322)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,393 :: 		if(strncmp(txt,S_Brine_Out_1.Caption,2)!=0){strncpy(S_Brine_Out_1.Caption, txt, 2);DrawButton(&S_Brine_Out_1);}
MOVW	R0, #lo_addr(_S_Brine_Out_1+24)
MOVT	R0, #hi_addr(_S_Brine_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page142
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
L_schema2_page142:
;Pages.c,394 :: 		IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+262)
MOVT	R0, #hi_addr(_system_reg+262)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,395 :: 		if(strncmp(txt,S_Heat_In_1.Caption,2)!=0){strncpy(S_Heat_In_1.Caption, txt, 2);DrawButton(&S_Heat_In_1);}
MOVW	R0, #lo_addr(_S_Heat_In_1+24)
MOVT	R0, #hi_addr(_S_Heat_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page143
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
L_schema2_page143:
;Pages.c,396 :: 		IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+282)
MOVT	R0, #hi_addr(_system_reg+282)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,397 :: 		if(strncmp(txt,S_Heat_Out_1.Caption,2)!=0){strncpy(S_Heat_Out_1.Caption, txt, 2);DrawButton(&S_Heat_Out_1);}
MOVW	R0, #lo_addr(_S_Heat_Out_1+24)
MOVT	R0, #hi_addr(_S_Heat_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page144
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
L_schema2_page144:
;Pages.c,398 :: 		IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+402)
MOVT	R0, #hi_addr(_system_reg+402)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,399 :: 		if(system_reg[HEAT_OUT_1]<100){
MOVW	R0, #lo_addr(_system_reg+282)
MOVT	R0, #hi_addr(_system_reg+282)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L_schema2_page145
;Pages.c,400 :: 		if(strncmp(txt,S_ComprEx_1.Caption,2)!=0){strncpy(S_ComprEx_1.Caption, txt, 2);
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page146
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
STR	R0, [SP, #12]
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,401 :: 		S_ComprEx_1.Caption[2]=S_ComprEx_1.Caption[1];S_ComprEx_1.Caption[1]=S_ComprEx_1.Caption[0];S_ComprEx_1.Caption[0]='0';
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
;Pages.c,402 :: 		DrawRoundButton(&S_ComprEx_1);
MOVW	R0, #lo_addr(_S_ComprEx_1+0)
MOVT	R0, #hi_addr(_S_ComprEx_1+0)
BL	_DrawRoundButton+0
;Pages.c,403 :: 		strncpy(S_ComprEx_1.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,404 :: 		}
L_schema2_page146:
;Pages.c,405 :: 		}
IT	AL
BAL	L_schema2_page147
L_schema2_page145:
;Pages.c,406 :: 		else{if(strncmp(txt,S_ComprEx_1.Caption,3)!=0){strncpy(S_ComprEx_1.Caption, txt, 3);DrawButton(&S_ComprEx_1);} }
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page148
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
L_schema2_page148:
L_schema2_page147:
;Pages.c,407 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+242)
MOVT	R0, #hi_addr(_system_reg+242)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,408 :: 		if(strncmp(txt,S_SH_1.Caption,2)!=0){strncpy(S_SH_1.Caption, txt, 2);DrawButton(&S_SH_1);}
MOVW	R0, #lo_addr(_S_SH_1+24)
MOVT	R0, #hi_addr(_S_SH_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page149
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
L_schema2_page149:
;Pages.c,412 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,413 :: 		if(strncmp(txt,Sens_DHW.Caption,2)!=0){strncpy(Sens_DHW.Caption, txt, 2);DrawButton(&Sens_DHW);}
MOVW	R0, #lo_addr(_Sens_DHW+24)
MOVT	R0, #hi_addr(_Sens_DHW+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page150
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
L_schema2_page150:
;Pages.c,414 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,415 :: 		if(strncmp(txt,S_tank.Caption,2)!=0){strncpy(S_tank.Caption, txt, 2);DrawButton(&S_tank);}
MOVW	R0, #lo_addr(_S_tank+24)
MOVT	R0, #hi_addr(_S_tank+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page151
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
L_schema2_page151:
;Pages.c,416 :: 		IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+342)
MOVT	R0, #hi_addr(_system_reg+342)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,417 :: 		if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
MOVW	R0, #lo_addr(_S_High_Press_1+24)
MOVT	R0, #hi_addr(_S_High_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page152
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
L_schema2_page152:
;Pages.c,418 :: 		IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+362)
MOVT	R0, #hi_addr(_system_reg+362)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,419 :: 		if(strncmp(txt,S_Low_Press_1.Caption,2)!=0){strncpy(S_Low_Press_1.Caption, txt, 2);DrawButton(&S_Low_Press_1);}
MOVW	R0, #lo_addr(_S_Low_Press_1+24)
MOVT	R0, #hi_addr(_S_Low_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page153
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
L_schema2_page153:
;Pages.c,420 :: 		}
L_end_schema2_page:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _schema2_page
