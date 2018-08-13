_Tone1:
;Controller_events_code.c,36 :: 		void Tone1() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,37 :: 		Sound_Play(659, 35);   //
MOVS	R1, #35
MOVW	R0, #659
BL	_Sound_Play+0
;Controller_events_code.c,38 :: 		}
L_end_Tone1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone1
_Tone2:
;Controller_events_code.c,39 :: 		void Tone2() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,40 :: 		Sound_Play(698, 50);   //
MOVS	R1, #50
MOVW	R0, #698
BL	_Sound_Play+0
;Controller_events_code.c,41 :: 		}
L_end_Tone2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone2
_Tone3:
;Controller_events_code.c,42 :: 		void Tone3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,43 :: 		Sound_Play(784, 70);   //
MOVS	R1, #70
MOVW	R0, #784
BL	_Sound_Play+0
;Controller_events_code.c,44 :: 		}
L_end_Tone3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone3
_BLED_Fade_Out:
;Controller_events_code.c,45 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,48 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
; i end address is: 4 (R1)
L_BLED_Fade_Out0:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_BLED_Fade_Out1
;Controller_events_code.c,49 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,50 :: 		Delay_us(500);
MOVW	R7, #19998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_Out3:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_Out3
NOP
NOP
NOP
;Controller_events_code.c,48 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,51 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out0
L_BLED_Fade_Out1:
;Controller_events_code.c,52 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,53 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;Controller_events_code.c,54 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,57 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
; i end address is: 4 (R1)
L_BLED_Fade_In5:
; i start address is: 4 (R1)
CMP	R1, #255
IT	CS
BCS	L_BLED_Fade_In6
;Controller_events_code.c,58 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,59 :: 		Delay_us(500);
MOVW	R7, #19998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_In8:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_In8
NOP
NOP
NOP
;Controller_events_code.c,57 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,60 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In5
L_BLED_Fade_In6:
;Controller_events_code.c,61 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,62 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_BackToHome:
;Controller_events_code.c,66 :: 		void BackToHome(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,67 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,68 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,69 :: 		DrawScreen(&HOME);
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
BL	_DrawScreen+0
;Controller_events_code.c,70 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,71 :: 		}
L_end_BackToHome:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackToHome
_goToBack:
;Controller_events_code.c,72 :: 		void goToBack(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,73 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,74 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,75 :: 		num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,76 :: 		if(CurrentScreen == &SYSTEM_SET)DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack10
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack11
L_goToBack10:
;Controller_events_code.c,77 :: 		else if (CurrentScreen==&ERRORS)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack12
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack13
L_goToBack12:
;Controller_events_code.c,78 :: 		else if (CurrentScreen==&SENSOR1)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack14
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack15
L_goToBack14:
;Controller_events_code.c,79 :: 		else if (CurrentScreen==&SETTINGS)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack16
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack17
L_goToBack16:
;Controller_events_code.c,80 :: 		else if (CurrentScreen==&ENERGY)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack18
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack19
L_goToBack18:
;Controller_events_code.c,81 :: 		else if(CurrentScreen == &EEV) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack20
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack21
L_goToBack20:
;Controller_events_code.c,82 :: 		else if(CurrentScreen == &DELAY_MENU) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack22
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack23
L_goToBack22:
;Controller_events_code.c,83 :: 		else if(CurrentScreen == &LIMITS1) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack24
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack25
L_goToBack24:
;Controller_events_code.c,84 :: 		else if(CurrentScreen == &SYSTEM_EVENTS) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack26
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack27
L_goToBack26:
;Controller_events_code.c,85 :: 		else if (CurrentScreen==&LIMITS2)  DrawScreen(&LIMITS1);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack28
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack29
L_goToBack28:
;Controller_events_code.c,86 :: 		else if (CurrentScreen==&LIMITS3)  DrawScreen(&LIMITS2);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack30
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack31
L_goToBack30:
;Controller_events_code.c,87 :: 		else if (CurrentScreen==&LIMITS4)  DrawScreen(&LIMITS3);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack32
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack33
L_goToBack32:
;Controller_events_code.c,88 :: 		else if (CurrentScreen==&LIMITS5)  DrawScreen(&LIMITS4);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack34
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
L_goToBack34:
L_goToBack33:
L_goToBack31:
L_goToBack29:
L_goToBack27:
L_goToBack25:
L_goToBack23:
L_goToBack21:
L_goToBack19:
L_goToBack17:
L_goToBack15:
L_goToBack13:
L_goToBack11:
;Controller_events_code.c,90 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,91 :: 		}
L_end_goToBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _goToBack
_nextPage:
;Controller_events_code.c,92 :: 		void nextPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,93 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,94 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,95 :: 		num_page = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,96 :: 		if (CurrentScreen==&LIMITS1){DrawScreen(&LIMITS2);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage35
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
IT	AL
BAL	L_nextPage36
L_nextPage35:
;Controller_events_code.c,97 :: 		else if (CurrentScreen==&LIMITS2){DrawScreen(&LIMITS3);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage37
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
IT	AL
BAL	L_nextPage38
L_nextPage37:
;Controller_events_code.c,98 :: 		else if (CurrentScreen==&LIMITS3){DrawScreen(&LIMITS4);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage39
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
IT	AL
BAL	L_nextPage40
L_nextPage39:
;Controller_events_code.c,99 :: 		else if (CurrentScreen==&LIMITS4){DrawScreen(&LIMITS5);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage41
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
BL	_DrawScreen+0
L_nextPage41:
L_nextPage40:
L_nextPage38:
L_nextPage36:
;Controller_events_code.c,101 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,102 :: 		}
L_end_nextPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nextPage
_selectPage:
;Controller_events_code.c,103 :: 		void selectPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,107 :: 		if (CurrentScreen==&HOME)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage42
;Controller_events_code.c,109 :: 		main_page();
BL	_main_page+0
;Controller_events_code.c,110 :: 		reciev_data_packet(DHW_TEMP,6);
MOVS	R1, #6
MOVW	R0, #437
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,112 :: 		}
IT	AL
BAL	L_selectPage43
L_selectPage42:
;Controller_events_code.c,114 :: 		else if(CurrentScreen==&SENSOR1) {  sensor_1(0);reciev_data_packet(DHW_TEMP,16);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage44
MOVS	R0, #0
BL	_sensor_1+0
MOVS	R1, #16
MOVW	R0, #437
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,117 :: 		}
IT	AL
BAL	L_selectPage45
L_selectPage44:
;Controller_events_code.c,119 :: 		else if(CurrentScreen==&GAUGE1){LP_display(),HP_display();reciev_data_packet(HIGH_PRESS_1,2);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage46
BL	_LP_display+0
BL	_HP_display+0
MOVS	R1, #2
MOVW	R0, #447
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage47
L_selectPage46:
;Controller_events_code.c,120 :: 		else if(CurrentScreen==&EEV){ count_steps(); reciev_data_packet(S_HEAT_1,3);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage48
BL	_count_steps+0
MOVS	R1, #3
MOVW	R0, #450
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage49
L_selectPage48:
;Controller_events_code.c,121 :: 		else if(CurrentScreen==&SYSTEM_EVENTS){working_time();reciev_data_packet(TIM_P_HEAT_1,5);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage50
BL	_working_time+0
MOVS	R1, #5
MOVW	R0, #454
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage51
L_selectPage50:
;Controller_events_code.c,122 :: 		else if(CurrentScreen==&Schema1){schema1_page();reciev_data_packet(DHW_TEMP,32);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage52
BL	_schema1_page+0
MOVS	R1, #32
MOVW	R0, #437
SXTH	R0, R0
BL	_reciev_data_packet+0
L_selectPage52:
L_selectPage51:
L_selectPage49:
L_selectPage47:
L_selectPage45:
L_selectPage43:
;Controller_events_code.c,123 :: 		}
L_end_selectPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _selectPage
_Main_OFFOnClick:
;Controller_events_code.c,126 :: 		void Main_OFFOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,127 :: 		{  if(!pushButton){
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Main_OFFOnClick53
;Controller_events_code.c,128 :: 		if ((unsigned long)Main_OFF.Picture_Name == main_off_bmp)
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
LDR	R1, [R0, #0]
MOVW	R0, #8080
MOVT	R0, #8
CMP	R1, R0
IT	NE
BNE	L_Main_OFFOnClick54
;Controller_events_code.c,130 :: 		Main_OFF.Picture_Name = main_on_bmp;
MOVW	R1, #64494
MOVT	R1, #7
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,131 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Controller_events_code.c,132 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,133 :: 		Messages_Label.Caption = "SYSTEM  ON";
MOVW	R1, #lo_addr(?lstr1_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr1_Controller_events_code+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_events_code.c,134 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_events_code.c,135 :: 		SYSTEM_ON=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,136 :: 		system_reg[POWER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1062)
MOVT	R0, #hi_addr(_system_reg+1062)
STRH	R1, [R0, #0]
;Controller_events_code.c,138 :: 		}
IT	AL
BAL	L_Main_OFFOnClick55
L_Main_OFFOnClick54:
;Controller_events_code.c,140 :: 		Main_OFF.Picture_Name = main_off_bmp;
MOVW	R1, #8080
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,141 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,142 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,143 :: 		Messages_Label.Caption = "SYSTEM  OFF";
MOVW	R1, #lo_addr(?lstr2_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr2_Controller_events_code+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_events_code.c,144 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_events_code.c,145 :: 		SYSTEM_ON=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,146 :: 		system_reg[POWER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1062)
MOVT	R0, #hi_addr(_system_reg+1062)
STRH	R1, [R0, #0]
;Controller_events_code.c,148 :: 		}
L_Main_OFFOnClick55:
;Controller_events_code.c,150 :: 		}
L_Main_OFFOnClick53:
;Controller_events_code.c,151 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,152 :: 		send_data_packet(POWER,1);
MOVS	R1, #1
MOVW	R0, #531
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,153 :: 		adressReg= POWER;
MOVW	R1, #531
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,154 :: 		nomReg =1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,155 :: 		}
L_end_Main_OFFOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Main_OFFOnClick
_bar_heatingOnClick:
;Controller_events_code.c,156 :: 		void bar_heatingOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,159 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 )
MOVW	R1, #lo_addr(?lstr3_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr3_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick56
;Controller_events_code.c,161 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr4_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr4_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,162 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,163 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,165 :: 		system_reg[COOL]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
STRH	R1, [R0, #0]
;Controller_events_code.c,166 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
STRH	R1, [R0, #0]
;Controller_events_code.c,168 :: 		}
IT	AL
BAL	L_bar_heatingOnClick57
L_bar_heatingOnClick56:
;Controller_events_code.c,169 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0 )
MOVW	R1, #lo_addr(?lstr5_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr5_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick58
;Controller_events_code.c,171 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr6_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr6_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,172 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,173 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,175 :: 		system_reg[HEAT]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
STRH	R1, [R0, #0]
;Controller_events_code.c,176 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
STRH	R1, [R0, #0]
;Controller_events_code.c,178 :: 		}
L_bar_heatingOnClick58:
L_bar_heatingOnClick57:
;Controller_events_code.c,180 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 ) {send_data_packet(HEAT,2);
MOVW	R1, #lo_addr(?lstr7_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr7_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick59
MOVS	R1, #2
MOVW	R0, #533
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,181 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,182 :: 		adressReg= HEAT;
MOVW	R1, #533
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,183 :: 		nomReg =2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,184 :: 		}
L_bar_heatingOnClick59:
;Controller_events_code.c,186 :: 		}
L_end_bar_heatingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bar_heatingOnClick
_DHW_SetingOnClick:
;Controller_events_code.c,187 :: 		void DHW_SetingOnClick()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,190 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_DHW_SetingOnClick60
;Controller_events_code.c,191 :: 		Set_Dhw_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,192 :: 		Set_Dhw_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,193 :: 		DHW_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,194 :: 		DHW_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,195 :: 		DHW_DOWN.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,196 :: 		DHW_DOWN.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,197 :: 		DHW_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,198 :: 		DHW_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,199 :: 		dhw_temp_main.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_temp_main+27)
MOVT	R0, #hi_addr(_dhw_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,200 :: 		dhw_temp_main.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_temp_main+28)
MOVT	R0, #hi_addr(_dhw_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,201 :: 		dhw_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,202 :: 		dhw_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,203 :: 		dhw_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,204 :: 		dhw_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,205 :: 		dhw_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,206 :: 		dhw_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,207 :: 		BoxRound2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,208 :: 		BoxRound2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,209 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,211 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,212 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,213 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_SetingOnClick300
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_SetingOnClick299
L__DHW_SetingOnClick298:
MOVW	R2, #lo_addr(_DHW_Setting_value+16)
MOVT	R2, #hi_addr(_DHW_Setting_value+16)
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
L__DHW_SetingOnClick300:
L__DHW_SetingOnClick299:
;Controller_events_code.c,214 :: 		DHW_Seting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr8_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr8_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,215 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,216 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,218 :: 		DrawRoundButton(&DHW_UP);
MOVW	R0, #lo_addr(_DHW_UP+0)
MOVT	R0, #hi_addr(_DHW_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,219 :: 		DrawRoundButton(&DHW_DOWN);
MOVW	R0, #lo_addr(_DHW_DOWN+0)
MOVT	R0, #hi_addr(_DHW_DOWN+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,220 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,221 :: 		count_push++;
MOVW	R1, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,222 :: 		}
IT	AL
BAL	L_DHW_SetingOnClick64
L_DHW_SetingOnClick60:
;Controller_events_code.c,224 :: 		Set_Dhw_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,225 :: 		Set_Dhw_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,226 :: 		DHW_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,227 :: 		DHW_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,228 :: 		DHW_DOWN.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,229 :: 		DHW_DOWN.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,230 :: 		DHW_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,231 :: 		DHW_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,232 :: 		dhw_temp_main.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_temp_main+27)
MOVT	R0, #hi_addr(_dhw_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,233 :: 		dhw_temp_main.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_temp_main+28)
MOVT	R0, #hi_addr(_dhw_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,234 :: 		dhw_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,235 :: 		dhw_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,236 :: 		dhw_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,237 :: 		dhw_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,238 :: 		dhw_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,239 :: 		dhw_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,240 :: 		BoxRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,241 :: 		BoxRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,242 :: 		DHW_Seting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr9_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr9_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,244 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,245 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,246 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,247 :: 		DrawRoundButton (& ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,248 :: 		DrawImage(&dhw_icon);
MOVW	R0, #lo_addr(_dhw_icon+0)
MOVT	R0, #hi_addr(_dhw_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,249 :: 		DrawRoundButton(&bar_DHW);
MOVW	R0, #lo_addr(_bar_DHW+0)
MOVT	R0, #hi_addr(_bar_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,250 :: 		DrawLabel (&dhw_temp_main);
MOVW	R0, #lo_addr(_dhw_temp_main+0)
MOVT	R0, #hi_addr(_dhw_temp_main+0)
BL	_DrawLabel+0
;Controller_events_code.c,251 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,252 :: 		DrawLabel(&dhw_point);
MOVW	R0, #lo_addr(_dhw_point+0)
MOVT	R0, #hi_addr(_dhw_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,253 :: 		DrawLabel(&dhw_celc);
MOVW	R0, #lo_addr(_dhw_celc+0)
MOVT	R0, #hi_addr(_dhw_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,254 :: 		send_data_packet(SET_DHW,1);
MOVS	R1, #1
MOVW	R0, #527
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,255 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,256 :: 		adressReg= SET_DHW;
MOVW	R1, #527
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,257 :: 		nomReg =1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,258 :: 		}
L_DHW_SetingOnClick64:
;Controller_events_code.c,261 :: 		}
L_end_DHW_SetingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_SetingOnClick
_Heat_SettingOnClick:
;Controller_events_code.c,262 :: 		void Heat_SettingOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,266 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick65
;Controller_events_code.c,267 :: 		Set_Heat_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,268 :: 		Set_Heat_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,269 :: 		HEAT_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,270 :: 		HEAT_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,271 :: 		HEAT_Down.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,272 :: 		HEAT_Down.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,273 :: 		TEMP_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,274 :: 		TEMP_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,275 :: 		heat_temp_main.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_temp_main+27)
MOVT	R0, #hi_addr(_heat_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,276 :: 		heat_temp_main.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_temp_main+28)
MOVT	R0, #hi_addr(_heat_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,277 :: 		heat_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,278 :: 		heat_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,279 :: 		heat_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,280 :: 		heat_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,281 :: 		heat_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,282 :: 		heat_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,283 :: 		heatBox.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heatBox+18)
MOVT	R0, #hi_addr(_heatBox+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,284 :: 		heatBox.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heatBox+19)
MOVT	R0, #hi_addr(_heatBox+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,285 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0 )IntToStr(system_reg[SET_HEAT], txt);
MOVW	R1, #lo_addr(?lstr10_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr10_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick66
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1050)
MOVT	R0, #hi_addr(_system_reg+1050)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
IT	AL
BAL	L_Heat_SettingOnClick67
L_Heat_SettingOnClick66:
;Controller_events_code.c,286 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0) IntToStr(system_reg[SET_COOL], txt);
MOVW	R1, #lo_addr(?lstr11_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr11_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick68
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1052)
MOVT	R0, #hi_addr(_system_reg+1052)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
L_Heat_SettingOnClick68:
L_Heat_SettingOnClick67:
;Controller_events_code.c,287 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,288 :: 		strncpy(TEMP_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,289 :: 		if(system_reg[SET_HEAT]<10 && system_reg[SET_HEAT]>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+1050)
MOVT	R0, #hi_addr(_system_reg+1050)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__Heat_SettingOnClick303
MOVW	R0, #lo_addr(_system_reg+1050)
MOVT	R0, #hi_addr(_system_reg+1050)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__Heat_SettingOnClick302
L__Heat_SettingOnClick301:
MOVW	R2, #lo_addr(_TEMP_Setting_value+16)
MOVT	R2, #hi_addr(_TEMP_Setting_value+16)
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
L__Heat_SettingOnClick303:
L__Heat_SettingOnClick302:
;Controller_events_code.c,290 :: 		Heat_Setting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr12_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr12_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,291 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,292 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,293 :: 		DrawRoundButton(&HEAT_UP);
MOVW	R0, #lo_addr(_HEAT_UP+0)
MOVT	R0, #hi_addr(_HEAT_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,294 :: 		DrawRoundButton(&HEAT_DOWN);
MOVW	R0, #lo_addr(_HEAT_Down+0)
MOVT	R0, #hi_addr(_HEAT_Down+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,295 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,296 :: 		count_push++;
MOVW	R1, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,297 :: 		}
IT	AL
BAL	L_Heat_SettingOnClick72
L_Heat_SettingOnClick65:
;Controller_events_code.c,299 :: 		Set_Heat_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,300 :: 		Set_Heat_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,301 :: 		HEAT_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,302 :: 		HEAT_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,303 :: 		HEAT_Down.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,304 :: 		HEAT_Down.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,305 :: 		TEMP_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,306 :: 		TEMP_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,307 :: 		heat_temp_main.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_temp_main+27)
MOVT	R0, #hi_addr(_heat_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,308 :: 		heat_temp_main.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_temp_main+28)
MOVT	R0, #hi_addr(_heat_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,309 :: 		heat_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,310 :: 		heat_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,311 :: 		heat_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,312 :: 		heat_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,313 :: 		heat_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,314 :: 		heat_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,315 :: 		heatBox.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heatBox+18)
MOVT	R0, #hi_addr(_heatBox+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,316 :: 		heatBox.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heatBox+19)
MOVT	R0, #hi_addr(_heatBox+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,318 :: 		Heat_Setting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr13_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr13_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,319 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,320 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,321 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,322 :: 		DrawRoundButton (& ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,323 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,324 :: 		DrawLabel (&heat_temp_main);
MOVW	R0, #lo_addr(_heat_temp_main+0)
MOVT	R0, #hi_addr(_heat_temp_main+0)
BL	_DrawLabel+0
;Controller_events_code.c,325 :: 		DrawCircle(&heat_led);
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,326 :: 		DrawLabel(&heat_point);
MOVW	R0, #lo_addr(_heat_point+0)
MOVT	R0, #hi_addr(_heat_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,327 :: 		DrawLabel(&heat_celc);
MOVW	R0, #lo_addr(_heat_celc+0)
MOVT	R0, #hi_addr(_heat_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,328 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 ){ DrawImage(&heat_icon);send_data_packet(SET_HEAT,1);adressReg= SET_HEAT;nomReg =1;}
MOVW	R1, #lo_addr(?lstr14_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr14_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick73
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #525
SXTH	R0, R0
BL	_send_data_packet+0
MOVW	R1, #525
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Heat_SettingOnClick74
L_Heat_SettingOnClick73:
;Controller_events_code.c,329 :: 		else  {DrawImage(&cool_icon);send_data_packet(SET_COOL,1);adressReg= SET_COOL;nomReg =1;}
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #526
SXTH	R0, R0
BL	_send_data_packet+0
MOVW	R1, #526
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
L_Heat_SettingOnClick74:
;Controller_events_code.c,330 :: 		}
L_Heat_SettingOnClick72:
;Controller_events_code.c,331 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,333 :: 		}
L_end_Heat_SettingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Heat_SettingOnClick
_Click_HEAT:
;Controller_events_code.c,335 :: 		void Click_HEAT()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,337 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 )
MOVW	R1, #lo_addr(?lstr15_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr15_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT75
;Controller_events_code.c,339 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr16_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr16_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,340 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,341 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
STRH	R1, [R0, #0]
;Controller_events_code.c,342 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
STRH	R1, [R0, #0]
;Controller_events_code.c,343 :: 		}
IT	AL
BAL	L_Click_HEAT76
L_Click_HEAT75:
;Controller_events_code.c,345 :: 		{   if(strcmp(bar_heating.Caption,"HEATING")==0 ){system_reg[HEAT]=1;system_reg[COOL]=0;}
MOVW	R1, #lo_addr(?lstr17_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr17_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT77
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
STRH	R1, [R0, #0]
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
STRH	R1, [R0, #0]
IT	AL
BAL	L_Click_HEAT78
L_Click_HEAT77:
;Controller_events_code.c,346 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0 ){system_reg[HEAT]=0;system_reg[COOL]=1;}
MOVW	R1, #lo_addr(?lstr18_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr18_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT79
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1066)
MOVT	R0, #hi_addr(_system_reg+1066)
STRH	R1, [R0, #0]
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1068)
MOVT	R0, #hi_addr(_system_reg+1068)
STRH	R1, [R0, #0]
L_Click_HEAT79:
L_Click_HEAT78:
;Controller_events_code.c,347 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr19_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr19_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,348 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,350 :: 		}
L_Click_HEAT76:
;Controller_events_code.c,351 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,352 :: 		adressReg= HEAT;
MOVW	R1, #533
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,353 :: 		nomReg =2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,354 :: 		send_data_packet(HEAT,2);
MOVS	R1, #2
MOVW	R0, #533
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,356 :: 		}
L_end_Click_HEAT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_HEAT
_Click_DHW:
;Controller_events_code.c,357 :: 		void Click_DHW()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,360 :: 		if (strcmp(ON_OFF_DHW.Caption,"ON")==0)
MOVW	R1, #lo_addr(?lstr20_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr20_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_DHW80
;Controller_events_code.c,362 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr21_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr21_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,363 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,364 :: 		system_reg[HEATWATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1064)
MOVT	R0, #hi_addr(_system_reg+1064)
STRH	R1, [R0, #0]
;Controller_events_code.c,365 :: 		}
IT	AL
BAL	L_Click_DHW81
L_Click_DHW80:
;Controller_events_code.c,368 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr22_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr22_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,369 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,370 :: 		system_reg[HEATWATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1064)
MOVT	R0, #hi_addr(_system_reg+1064)
STRH	R1, [R0, #0]
;Controller_events_code.c,371 :: 		}
L_Click_DHW81:
;Controller_events_code.c,372 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,373 :: 		adressReg= HEATWATER;
MOVW	R1, #532
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,374 :: 		nomReg =1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,375 :: 		send_data_packet(HEATWATER,1);
MOVS	R1, #1
MOVW	R0, #532
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,376 :: 		}
L_end_Click_DHW:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_DHW
_MainBut1OnUp:
;Controller_events_code.c,377 :: 		void MainBut1OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,378 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,379 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,380 :: 		Image25.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,381 :: 		DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,382 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,384 :: 		}
L_end_MainBut1OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnUp
_MainBut1OnPress:
;Controller_events_code.c,385 :: 		void MainBut1OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,386 :: 		Image25.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,387 :: 		DrawImage(&Image25);
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
BL	_DrawImage+0
;Controller_events_code.c,388 :: 		}
L_end_MainBut1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnPress
_MainBut2OnUp:
;Controller_events_code.c,389 :: 		void MainBut2OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,390 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,391 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,392 :: 		Image40.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,393 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp308
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp307
L__MainBut2OnUp306:
;Controller_events_code.c,394 :: 		DrawScreen (&Schema2);
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
BL	_DrawScreen+0
;Controller_events_code.c,395 :: 		}
IT	AL
BAL	L_MainBut2OnUp85
;Controller_events_code.c,393 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
L__MainBut2OnUp308:
L__MainBut2OnUp307:
;Controller_events_code.c,396 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp310
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp309
L__MainBut2OnUp305:
;Controller_events_code.c,397 :: 		DrawScreen (&AIR_TWO);
MOVW	R0, #lo_addr(_AIR_TWO+0)
MOVT	R0, #hi_addr(_AIR_TWO+0)
BL	_DrawScreen+0
;Controller_events_code.c,398 :: 		}
IT	AL
BAL	L_MainBut2OnUp89
;Controller_events_code.c,396 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
L__MainBut2OnUp310:
L__MainBut2OnUp309:
;Controller_events_code.c,399 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp312
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp311
L__MainBut2OnUp304:
;Controller_events_code.c,400 :: 		DrawScreen(&Schema1);//DrawScreen (&AIR_ONE);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,401 :: 		}
IT	AL
BAL	L_MainBut2OnUp93
;Controller_events_code.c,399 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
L__MainBut2OnUp312:
L__MainBut2OnUp311:
;Controller_events_code.c,403 :: 		DrawScreen(&Schema1);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,404 :: 		}
L_MainBut2OnUp93:
L_MainBut2OnUp89:
L_MainBut2OnUp85:
;Controller_events_code.c,406 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,408 :: 		}
L_end_MainBut2OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnUp
_MainBut2OnPress:
;Controller_events_code.c,409 :: 		void MainBut2OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,410 :: 		Image40.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,411 :: 		DrawImage(&Image40);
MOVW	R0, #lo_addr(_Image40+0)
MOVT	R0, #hi_addr(_Image40+0)
BL	_DrawImage+0
;Controller_events_code.c,413 :: 		}
L_end_MainBut2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnPress
_MainBut3OnUp:
;Controller_events_code.c,414 :: 		void MainBut3OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,415 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,416 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,417 :: 		Image44.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,418 :: 		DrawScreen(&DEVICES);
MOVW	R0, #lo_addr(_DEVICES+0)
MOVT	R0, #hi_addr(_DEVICES+0)
BL	_DrawScreen+0
;Controller_events_code.c,419 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,421 :: 		}
L_end_MainBut3OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnUp
_MainBut3OnPress:
;Controller_events_code.c,422 :: 		void MainBut3OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,423 :: 		Image44.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,424 :: 		DrawImage(&Image44);
MOVW	R0, #lo_addr(_Image44+0)
MOVT	R0, #hi_addr(_Image44+0)
BL	_DrawImage+0
;Controller_events_code.c,425 :: 		}
L_end_MainBut3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnPress
_MainBut4OnUp:
;Controller_events_code.c,426 :: 		void MainBut4OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,427 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,428 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,429 :: 		Image61.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,430 :: 		old_HP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_HP_pressure+0)
MOVT	R0, #hi_addr(_old_HP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,431 :: 		old_LP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_LP_pressure+0)
MOVT	R0, #hi_addr(_old_LP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,432 :: 		DrawScreen(&GAUGE1);
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
BL	_DrawScreen+0
;Controller_events_code.c,433 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,434 :: 		}
L_end_MainBut4OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnUp
_MainBut4OnPress:
;Controller_events_code.c,435 :: 		void MainBut4OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,436 :: 		Image61.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,437 :: 		DrawImage(&Image61);
MOVW	R0, #lo_addr(_Image61+0)
MOVT	R0, #hi_addr(_Image61+0)
BL	_DrawImage+0
;Controller_events_code.c,438 :: 		}
L_end_MainBut4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnPress
_MainBut5OnUp:
;Controller_events_code.c,439 :: 		void MainBut5OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,440 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,441 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,442 :: 		Image87.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,443 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,444 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,445 :: 		}
L_end_MainBut5OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnUp
_MainBut5OnPress:
;Controller_events_code.c,446 :: 		void MainBut5OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,447 :: 		Image87.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,448 :: 		DrawImage(&Image87);
MOVW	R0, #lo_addr(_Image87+0)
MOVT	R0, #hi_addr(_Image87+0)
BL	_DrawImage+0
;Controller_events_code.c,449 :: 		}
L_end_MainBut5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnPress
_DHW_UPOnClick:
;Controller_events_code.c,450 :: 		void  DHW_UPOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,452 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,453 :: 		system_reg[SET_DHW]++;
MOVW	R2, #lo_addr(_system_reg+1054)
MOVT	R2, #hi_addr(_system_reg+1054)
LDRSH	R0, [R2, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,454 :: 		if(system_reg[SET_DHW]>system_reg[HEAT_MAX]) system_reg[SET_DHW]=system_reg[HEAT_MAX];
MOVW	R0, #lo_addr(_system_reg+1012)
MOVT	R0, #hi_addr(_system_reg+1012)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L_DHW_UPOnClick94
MOVW	R0, #lo_addr(_system_reg+1012)
MOVT	R0, #hi_addr(_system_reg+1012)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
STRH	R1, [R0, #0]
L_DHW_UPOnClick94:
;Controller_events_code.c,455 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,456 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,457 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,458 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_UPOnClick315
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_UPOnClick314
L__DHW_UPOnClick313:
MOVW	R2, #lo_addr(_DHW_Setting_value+16)
MOVT	R2, #hi_addr(_DHW_Setting_value+16)
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
L__DHW_UPOnClick315:
L__DHW_UPOnClick314:
;Controller_events_code.c,459 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,460 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,461 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_DHW_UPOnClick98:
SUBS	R7, R7, #1
BNE	L_DHW_UPOnClick98
NOP
NOP
NOP
;Controller_events_code.c,462 :: 		}
L_end_DHW_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_UPOnClick
_DHW_DOWNOnClick:
;Controller_events_code.c,463 :: 		void DHW_DOWNOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,465 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,466 :: 		system_reg[SET_DHW]--;
MOVW	R2, #lo_addr(_system_reg+1054)
MOVT	R2, #hi_addr(_system_reg+1054)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,467 :: 		if(system_reg[SET_DHW]<system_reg[HEAT_MIN]) system_reg[SET_DHW]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_DHW_DOWNOnClick100
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
STRH	R1, [R0, #0]
L_DHW_DOWNOnClick100:
;Controller_events_code.c,468 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,469 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,470 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,471 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_DOWNOnClick318
MOVW	R0, #lo_addr(_system_reg+1054)
MOVT	R0, #hi_addr(_system_reg+1054)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_DOWNOnClick317
L__DHW_DOWNOnClick316:
MOVW	R2, #lo_addr(_DHW_Setting_value+16)
MOVT	R2, #hi_addr(_DHW_Setting_value+16)
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
L__DHW_DOWNOnClick318:
L__DHW_DOWNOnClick317:
;Controller_events_code.c,472 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,473 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,474 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_DHW_DOWNOnClick104:
SUBS	R7, R7, #1
BNE	L_DHW_DOWNOnClick104
NOP
NOP
NOP
;Controller_events_code.c,476 :: 		}
L_end_DHW_DOWNOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_DOWNOnClick
_HEAT_UPOnClick:
;Controller_events_code.c,477 :: 		void HEAT_UPOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,480 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,482 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr23_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr23_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick106
;Controller_events_code.c,483 :: 		system_reg[SET_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+1050)
MOVT	R1, #hi_addr(_system_reg+1050)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,484 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,485 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+1050)
MOVT	R0, #hi_addr(_system_reg+1050)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,486 :: 		}
IT	AL
BAL	L_HEAT_UPOnClick107
L_HEAT_UPOnClick106:
;Controller_events_code.c,487 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr24_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr24_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick108
;Controller_events_code.c,488 :: 		system_reg[SET_COOL]++;
MOVW	R1, #lo_addr(_system_reg+1052)
MOVT	R1, #hi_addr(_system_reg+1052)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,490 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,491 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+1052)
MOVT	R0, #hi_addr(_system_reg+1052)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,492 :: 		}
L_HEAT_UPOnClick108:
L_HEAT_UPOnClick107:
;Controller_events_code.c,493 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,494 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,495 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_UPOnClick321
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_UPOnClick320
L__HEAT_UPOnClick319:
MOVW	R2, #lo_addr(_TEMP_Setting_value+16)
MOVT	R2, #hi_addr(_TEMP_Setting_value+16)
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
L__HEAT_UPOnClick321:
L__HEAT_UPOnClick320:
;Controller_events_code.c,496 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,497 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,498 :: 		}
L_end_HEAT_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_UPOnClick
_HEAT_DownOnClick:
;Controller_events_code.c,499 :: 		void HEAT_DownOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,502 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,503 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr25_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr25_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick112
;Controller_events_code.c,504 :: 		system_reg[SET_HEAT]--;
MOVW	R2, #lo_addr(_system_reg+1050)
MOVT	R2, #hi_addr(_system_reg+1050)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,505 :: 		if(system_reg[SET_HEAT]<system_reg[HEAT_MIN]) system_reg[SET_HEAT]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick113
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+1050)
MOVT	R0, #hi_addr(_system_reg+1050)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick113:
;Controller_events_code.c,506 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1050)
MOVT	R0, #hi_addr(_system_reg+1050)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,507 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+1050)
MOVT	R0, #hi_addr(_system_reg+1050)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,508 :: 		}
IT	AL
BAL	L_HEAT_DownOnClick114
L_HEAT_DownOnClick112:
;Controller_events_code.c,509 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr26_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr26_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick115
;Controller_events_code.c,510 :: 		system_reg[SET_COOL]--;
MOVW	R2, #lo_addr(_system_reg+1052)
MOVT	R2, #hi_addr(_system_reg+1052)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,511 :: 		if(system_reg[SET_COOL]<system_reg[COOL_MIN]) system_reg[SET_COOL]=system_reg[COOL_MIN];
MOVW	R0, #lo_addr(_system_reg+1022)
MOVT	R0, #hi_addr(_system_reg+1022)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick116
MOVW	R0, #lo_addr(_system_reg+1022)
MOVT	R0, #hi_addr(_system_reg+1022)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+1052)
MOVT	R0, #hi_addr(_system_reg+1052)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick116:
;Controller_events_code.c,512 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1052)
MOVT	R0, #hi_addr(_system_reg+1052)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,513 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+1052)
MOVT	R0, #hi_addr(_system_reg+1052)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,514 :: 		}
L_HEAT_DownOnClick115:
L_HEAT_DownOnClick114:
;Controller_events_code.c,515 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,516 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,517 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_DownOnClick324
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_DownOnClick323
L__HEAT_DownOnClick322:
MOVW	R2, #lo_addr(_TEMP_Setting_value+16)
MOVT	R2, #hi_addr(_TEMP_Setting_value+16)
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
L__HEAT_DownOnClick324:
L__HEAT_DownOnClick323:
;Controller_events_code.c,518 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,519 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,521 :: 		}
L_end_HEAT_DownOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_DownOnClick
_user_settingOnUp:
;Controller_events_code.c,523 :: 		void user_settingOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,524 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,525 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,526 :: 		Image105.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,527 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,528 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,529 :: 		}
L_end_user_settingOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnUp
_user_settingOnPress:
;Controller_events_code.c,530 :: 		void  user_settingOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,531 :: 		Image105.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,532 :: 		DrawImage(&Image105);
MOVW	R0, #lo_addr(_Image105+0)
MOVT	R0, #hi_addr(_Image105+0)
BL	_DrawImage+0
;Controller_events_code.c,533 :: 		}
L_end_user_settingOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnPress
_user_set_timeOnPress:
;Controller_events_code.c,534 :: 		void user_set_timeOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,535 :: 		Image39.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,536 :: 		DrawImage(&Image39);
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
BL	_DrawImage+0
;Controller_events_code.c,537 :: 		}
L_end_user_set_timeOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnPress
_user_set_timeOnUp:
;Controller_events_code.c,538 :: 		void user_set_timeOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,539 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,540 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,541 :: 		Image39.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,543 :: 		DrawScreen(&SetRTC);
MOVW	R0, #lo_addr(_SetRTC+0)
MOVT	R0, #hi_addr(_SetRTC+0)
BL	_DrawScreen+0
;Controller_events_code.c,544 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,545 :: 		}
L_end_user_set_timeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnUp
_user_check_temperatureOnPress:
;Controller_events_code.c,547 :: 		void user_check_temperatureOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,548 :: 		Image48.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,549 :: 		DrawImage(&Image48);
MOVW	R0, #lo_addr(_Image48+0)
MOVT	R0, #hi_addr(_Image48+0)
BL	_DrawImage+0
;Controller_events_code.c,550 :: 		}
L_end_user_check_temperatureOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnPress
_user_check_temperatureOnUp:
;Controller_events_code.c,551 :: 		void user_check_temperatureOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,552 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,553 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,554 :: 		Image48.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,555 :: 		strcpy(S_Brine_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr27_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr27_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,556 :: 		strcpy(S_Brine_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr28_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr28_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,557 :: 		strcpy(S_Heat_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr29_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr29_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,558 :: 		strcpy(S_Heat_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr30_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr30_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,559 :: 		strcpy(S_Compressor_1.Caption ,"000");
MOVW	R1, #lo_addr(?lstr31_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr31_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Compressor_1+24)
MOVT	R0, #hi_addr(_S_Compressor_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,560 :: 		strcpy(S_Superheat_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr32_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr32_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Superheat_1+24)
MOVT	R0, #hi_addr(_S_Superheat_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,561 :: 		strcpy( S_Subcool_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr33_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr33_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Subcool_1+24)
MOVT	R0, #hi_addr(_S_Subcool_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,562 :: 		strcpy(S_DHW.Caption,"00");
MOVW	R1, #lo_addr(?lstr34_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr34_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_DHW+24)
MOVT	R0, #hi_addr(_S_DHW+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,563 :: 		strcpy(SS_tank.Caption,"00");
MOVW	R1, #lo_addr(?lstr35_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr35_Controller_events_code+0)
MOVW	R0, #lo_addr(_SS_tank+24)
MOVT	R0, #hi_addr(_SS_tank+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,564 :: 		strcpy(S_condenser_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr36_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr36_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_condenser_1+24)
MOVT	R0, #hi_addr(_S_condenser_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,565 :: 		strcpy(S_High_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr37_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr37_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_High_Pressure_1+24)
MOVT	R0, #hi_addr(_S_High_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,566 :: 		strcpy(S_Low_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr38_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr38_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,567 :: 		DrawScreen(&SENSOR1);
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
BL	_DrawScreen+0
;Controller_events_code.c,568 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,569 :: 		}
L_end_user_check_temperatureOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnUp
_user_set_LANOnPress:
;Controller_events_code.c,570 :: 		void user_set_LANOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,571 :: 		Image49.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,572 :: 		DrawImage(&Image49);
MOVW	R0, #lo_addr(_Image49+0)
MOVT	R0, #hi_addr(_Image49+0)
BL	_DrawImage+0
;Controller_events_code.c,573 :: 		}
L_end_user_set_LANOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnPress
_user_set_LANOnUp:
;Controller_events_code.c,574 :: 		void user_set_LANOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,575 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,576 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,577 :: 		Image49.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,578 :: 		DrawScreen(&Ethernet);
MOVW	R0, #lo_addr(_Ethernet+0)
MOVT	R0, #hi_addr(_Ethernet+0)
BL	_DrawScreen+0
;Controller_events_code.c,579 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,580 :: 		}
L_end_user_set_LANOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnUp
_user_check_errorsOnPress:
;Controller_events_code.c,581 :: 		void user_check_errorsOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,582 :: 		Image50.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,583 :: 		DrawImage(&Image50);
MOVW	R0, #lo_addr(_Image50+0)
MOVT	R0, #hi_addr(_Image50+0)
BL	_DrawImage+0
;Controller_events_code.c,584 :: 		}
L_end_user_check_errorsOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnPress
_user_check_errorsOnUp:
;Controller_events_code.c,585 :: 		void user_check_errorsOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,586 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,587 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,588 :: 		Image50.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,589 :: 		DrawScreen(&ERRORS);
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
BL	_DrawScreen+0
;Controller_events_code.c,590 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,591 :: 		}
L_end_user_check_errorsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnUp
_user_set_timersOnPress:
;Controller_events_code.c,592 :: 		void user_set_timersOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,593 :: 		Image51.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,594 :: 		DrawImage(&Image51);
MOVW	R0, #lo_addr(_Image51+0)
MOVT	R0, #hi_addr(_Image51+0)
BL	_DrawImage+0
;Controller_events_code.c,595 :: 		}
L_end_user_set_timersOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnPress
_user_set_timersOnUp:
;Controller_events_code.c,596 :: 		void user_set_timersOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,597 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,598 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,599 :: 		Image51.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,600 :: 		DrawScreen(&TIMERS);
MOVW	R0, #lo_addr(_TIMERS+0)
MOVT	R0, #hi_addr(_TIMERS+0)
BL	_DrawScreen+0
;Controller_events_code.c,601 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,602 :: 		}
L_end_user_set_timersOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnUp
_user_hysterezisOnPress:
;Controller_events_code.c,603 :: 		void user_hysterezisOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,604 :: 		Image60.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,605 :: 		DrawImage(&Image60);
MOVW	R0, #lo_addr(_Image60+0)
MOVT	R0, #hi_addr(_Image60+0)
BL	_DrawImage+0
;Controller_events_code.c,606 :: 		}
L_end_user_hysterezisOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnPress
_user_hysterezisOnUp:
;Controller_events_code.c,607 :: 		void user_hysterezisOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,608 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,609 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,610 :: 		Image60.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,611 :: 		DrawScreen(&SETTINGS);
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
BL	_DrawScreen+0
;Controller_events_code.c,612 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,613 :: 		}
L_end_user_hysterezisOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnUp
_User_history_checkOnPress:
;Controller_events_code.c,614 :: 		void User_history_checkOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,615 :: 		Image52.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,616 :: 		DrawImage(&Image52);
MOVW	R0, #lo_addr(_Image52+0)
MOVT	R0, #hi_addr(_Image52+0)
BL	_DrawImage+0
;Controller_events_code.c,617 :: 		}
L_end_User_history_checkOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnPress
_User_history_checkOnUp:
;Controller_events_code.c,618 :: 		void User_history_checkOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,619 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,620 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,621 :: 		Image52.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,622 :: 		DrawScreen(&EVENTS);
MOVW	R0, #lo_addr(_EVENTS+0)
MOVT	R0, #hi_addr(_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,623 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,624 :: 		}
L_end_User_history_checkOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnUp
_user_energyOnUp:
;Controller_events_code.c,626 :: 		void user_energyOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,627 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,628 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,629 :: 		Image54.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,630 :: 		DrawScreen(&ENERGY);
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
BL	_DrawScreen+0
;Controller_events_code.c,631 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,632 :: 		}
L_end_user_energyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnUp
_user_energyOnPress:
;Controller_events_code.c,633 :: 		void user_energyOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,634 :: 		Image54.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,635 :: 		DrawImage(&Image54);
MOVW	R0, #lo_addr(_Image54+0)
MOVT	R0, #hi_addr(_Image54+0)
BL	_DrawImage+0
;Controller_events_code.c,636 :: 		}
L_end_user_energyOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnPress
_admin_set_systemOnUp:
;Controller_events_code.c,637 :: 		void admin_set_systemOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,638 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,639 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,640 :: 		Image55.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,642 :: 		DrawScreen (&SYSTEM_SET);
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
;Controller_events_code.c,643 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,644 :: 		}
L_end_admin_set_systemOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnUp
_admin_set_systemOnPress:
;Controller_events_code.c,645 :: 		void  admin_set_systemOnPress (){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,646 :: 		Image55.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,647 :: 		DrawImage(&Image55);
MOVW	R0, #lo_addr(_Image55+0)
MOVT	R0, #hi_addr(_Image55+0)
BL	_DrawImage+0
;Controller_events_code.c,648 :: 		}
L_end_admin_set_systemOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnPress
_furnanceUP:
;Controller_events_code.c,649 :: 		void furnanceUP(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,650 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,651 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,652 :: 		Image56.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,653 :: 		DrawScreen(&FURNANCE);
MOVW	R0, #lo_addr(_FURNANCE+0)
MOVT	R0, #hi_addr(_FURNANCE+0)
BL	_DrawScreen+0
;Controller_events_code.c,654 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,655 :: 		}
L_end_furnanceUP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceUP
_furnanceDown:
;Controller_events_code.c,656 :: 		void furnanceDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,657 :: 		Image56.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,658 :: 		DrawImage(&Image56);
MOVW	R0, #lo_addr(_Image56+0)
MOVT	R0, #hi_addr(_Image56+0)
BL	_DrawImage+0
;Controller_events_code.c,659 :: 		}
L_end_furnanceDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceDown
_user_defrostOnUp:
;Controller_events_code.c,660 :: 		void user_defrostOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,661 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,662 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,663 :: 		Image57.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,664 :: 		DrawScreen(&DEFROST);
MOVW	R0, #lo_addr(_DEFROST+0)
MOVT	R0, #hi_addr(_DEFROST+0)
BL	_DrawScreen+0
;Controller_events_code.c,665 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,666 :: 		}
L_end_user_defrostOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnUp
_user_defrostOnPress:
;Controller_events_code.c,667 :: 		void user_defrostOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,668 :: 		Image57.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,669 :: 		DrawImage(&Image57);
MOVW	R0, #lo_addr(_Image57+0)
MOVT	R0, #hi_addr(_Image57+0)
BL	_DrawImage+0
;Controller_events_code.c,670 :: 		}
L_end_user_defrostOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnPress
_DEC_EEV1OnPress:
;Controller_events_code.c,722 :: 		void DEC_EEV1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,724 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,726 :: 		if(Red_bar.Position >= Red_bar.Min + 5) {
MOVW	R0, #lo_addr(_Red_bar+40)
MOVT	R0, #hi_addr(_Red_bar+40)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #5
UXTH	R1, R1
MOVW	R0, #lo_addr(_Red_bar+44)
MOVT	R0, #hi_addr(_Red_bar+44)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_DEC_EEV1OnPress120
;Controller_events_code.c,729 :: 		Red_bar.Position -= 5;
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
LDRH	R0, [R1, #0]
SUBS	R0, R0, #5
STRH	R0, [R1, #0]
;Controller_events_code.c,731 :: 		DrawProgressBar(&Red_bar);
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_DrawProgressBar+0
;Controller_events_code.c,732 :: 		Delay_ms (50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_DEC_EEV1OnPress121:
SUBS	R7, R7, #1
BNE	L_DEC_EEV1OnPress121
NOP
NOP
NOP
;Controller_events_code.c,733 :: 		}
L_DEC_EEV1OnPress120:
;Controller_events_code.c,734 :: 		}
L_end_DEC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DEC_EEV1OnPress
_INC_EEV1OnPress:
;Controller_events_code.c,735 :: 		void INC_EEV1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,736 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,737 :: 		if(Red_bar.Position <= Red_bar.Max - 5) {
MOVW	R0, #lo_addr(_Red_bar+42)
MOVT	R0, #hi_addr(_Red_bar+42)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #5
UXTH	R1, R1
MOVW	R0, #lo_addr(_Red_bar+44)
MOVT	R0, #hi_addr(_Red_bar+44)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_INC_EEV1OnPress123
;Controller_events_code.c,738 :: 		Red_bar.Position += 5;
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #5
STRH	R0, [R1, #0]
;Controller_events_code.c,739 :: 		UpdatePBPosition(&Red_bar);
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_UpdatePBPosition+0
;Controller_events_code.c,740 :: 		Delay_ms (50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_INC_EEV1OnPress124:
SUBS	R7, R7, #1
BNE	L_INC_EEV1OnPress124
NOP
NOP
NOP
;Controller_events_code.c,741 :: 		}
L_INC_EEV1OnPress123:
;Controller_events_code.c,742 :: 		}
L_end_INC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _INC_EEV1OnPress
_Set_Trv:
;Controller_events_code.c,744 :: 		void Set_Trv() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,746 :: 		system_reg[TRV_CORRECT_1]=Red_bar.Position - system_reg[TRV_STEPS_1];
MOVW	R0, #lo_addr(_system_reg+904)
MOVT	R0, #hi_addr(_system_reg+904)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Red_bar+44)
MOVT	R0, #hi_addr(_Red_bar+44)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_system_reg+906)
MOVT	R0, #hi_addr(_system_reg+906)
STRH	R1, [R0, #0]
;Controller_events_code.c,747 :: 		adressReg= TRV_CORRECT_1;
MOVW	R1, #453
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,748 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,749 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,750 :: 		send_data_packet(TRV_CORRECT_1,1);
MOVS	R1, #1
MOVW	R0, #453
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,751 :: 		}
L_end_Set_Trv:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Trv
__1OnClick:
;Controller_events_code.c,754 :: 		void _1OnClick() {
;Controller_events_code.c,756 :: 		}
L_end__1OnClick:
BX	LR
; end of __1OnClick
__2OnClick:
;Controller_events_code.c,758 :: 		void _2OnClick() {
;Controller_events_code.c,760 :: 		}
L_end__2OnClick:
BX	LR
; end of __2OnClick
__3OnClick:
;Controller_events_code.c,762 :: 		void _3OnClick() {
;Controller_events_code.c,764 :: 		}
L_end__3OnClick:
BX	LR
; end of __3OnClick
__4OnClick:
;Controller_events_code.c,766 :: 		void _4OnClick() {
;Controller_events_code.c,768 :: 		}
L_end__4OnClick:
BX	LR
; end of __4OnClick
__5OnClick:
;Controller_events_code.c,770 :: 		void _5OnClick() {
;Controller_events_code.c,772 :: 		}
L_end__5OnClick:
BX	LR
; end of __5OnClick
__6OnClick:
;Controller_events_code.c,774 :: 		void _6OnClick() {
;Controller_events_code.c,776 :: 		}
L_end__6OnClick:
BX	LR
; end of __6OnClick
__7OnClick:
;Controller_events_code.c,778 :: 		void _7OnClick() {
;Controller_events_code.c,780 :: 		}
L_end__7OnClick:
BX	LR
; end of __7OnClick
__8OnClick:
;Controller_events_code.c,782 :: 		void _8OnClick() {
;Controller_events_code.c,784 :: 		}
L_end__8OnClick:
BX	LR
; end of __8OnClick
__9OnClick:
;Controller_events_code.c,786 :: 		void _9OnClick() {
;Controller_events_code.c,788 :: 		}
L_end__9OnClick:
BX	LR
; end of __9OnClick
__0OnClick:
;Controller_events_code.c,790 :: 		void _0OnClick() {
;Controller_events_code.c,792 :: 		}
L_end__0OnClick:
BX	LR
; end of __0OnClick
__QOnClick:
;Controller_events_code.c,794 :: 		void _QOnClick() {
;Controller_events_code.c,796 :: 		}
L_end__QOnClick:
BX	LR
; end of __QOnClick
__WOnClick:
;Controller_events_code.c,798 :: 		void _WOnClick() {
;Controller_events_code.c,800 :: 		}
L_end__WOnClick:
BX	LR
; end of __WOnClick
__EOnClick:
;Controller_events_code.c,802 :: 		void _EOnClick() {
;Controller_events_code.c,804 :: 		}
L_end__EOnClick:
BX	LR
; end of __EOnClick
__ROnClick:
;Controller_events_code.c,806 :: 		void _ROnClick() {
;Controller_events_code.c,808 :: 		}
L_end__ROnClick:
BX	LR
; end of __ROnClick
__TOnClick:
;Controller_events_code.c,810 :: 		void _TOnClick() {
;Controller_events_code.c,812 :: 		}
L_end__TOnClick:
BX	LR
; end of __TOnClick
__YOnClick:
;Controller_events_code.c,814 :: 		void _YOnClick() {
;Controller_events_code.c,816 :: 		}
L_end__YOnClick:
BX	LR
; end of __YOnClick
__UOnClick:
;Controller_events_code.c,818 :: 		void _UOnClick() {
;Controller_events_code.c,820 :: 		}
L_end__UOnClick:
BX	LR
; end of __UOnClick
__IOnClick:
;Controller_events_code.c,822 :: 		void _IOnClick() {
;Controller_events_code.c,824 :: 		}
L_end__IOnClick:
BX	LR
; end of __IOnClick
__OOnClick:
;Controller_events_code.c,826 :: 		void _OOnClick() {
;Controller_events_code.c,828 :: 		}
L_end__OOnClick:
BX	LR
; end of __OOnClick
__POnClick:
;Controller_events_code.c,830 :: 		void _POnClick() {
;Controller_events_code.c,832 :: 		}
L_end__POnClick:
BX	LR
; end of __POnClick
__AOnClick:
;Controller_events_code.c,834 :: 		void _AOnClick() {
;Controller_events_code.c,836 :: 		}
L_end__AOnClick:
BX	LR
; end of __AOnClick
__SOnClick:
;Controller_events_code.c,838 :: 		void _SOnClick() {
;Controller_events_code.c,840 :: 		}
L_end__SOnClick:
BX	LR
; end of __SOnClick
__DOnClick:
;Controller_events_code.c,842 :: 		void _DOnClick() {
;Controller_events_code.c,844 :: 		}
L_end__DOnClick:
BX	LR
; end of __DOnClick
__FOnClick:
;Controller_events_code.c,846 :: 		void _FOnClick() {
;Controller_events_code.c,848 :: 		}
L_end__FOnClick:
BX	LR
; end of __FOnClick
__GOnClick:
;Controller_events_code.c,850 :: 		void _GOnClick() {
;Controller_events_code.c,852 :: 		}
L_end__GOnClick:
BX	LR
; end of __GOnClick
__HOnClick:
;Controller_events_code.c,854 :: 		void _HOnClick() {
;Controller_events_code.c,856 :: 		}
L_end__HOnClick:
BX	LR
; end of __HOnClick
__JOnClick:
;Controller_events_code.c,858 :: 		void _JOnClick() {
;Controller_events_code.c,860 :: 		}
L_end__JOnClick:
BX	LR
; end of __JOnClick
__KOnClick:
;Controller_events_code.c,862 :: 		void _KOnClick() {
;Controller_events_code.c,864 :: 		}
L_end__KOnClick:
BX	LR
; end of __KOnClick
__LOnClick:
;Controller_events_code.c,866 :: 		void _LOnClick() {
;Controller_events_code.c,868 :: 		}
L_end__LOnClick:
BX	LR
; end of __LOnClick
__ZOnClick:
;Controller_events_code.c,870 :: 		void _ZOnClick() {
;Controller_events_code.c,872 :: 		}
L_end__ZOnClick:
BX	LR
; end of __ZOnClick
__XOnClick:
;Controller_events_code.c,874 :: 		void _XOnClick() {
;Controller_events_code.c,876 :: 		}
L_end__XOnClick:
BX	LR
; end of __XOnClick
__COnClick:
;Controller_events_code.c,878 :: 		void _COnClick() {
;Controller_events_code.c,880 :: 		}
L_end__COnClick:
BX	LR
; end of __COnClick
__VOnClick:
;Controller_events_code.c,882 :: 		void _VOnClick() {
;Controller_events_code.c,884 :: 		}
L_end__VOnClick:
BX	LR
; end of __VOnClick
__BOnClick:
;Controller_events_code.c,886 :: 		void _BOnClick() {
;Controller_events_code.c,888 :: 		}
L_end__BOnClick:
BX	LR
; end of __BOnClick
__NOnClick:
;Controller_events_code.c,890 :: 		void _NOnClick() {
;Controller_events_code.c,892 :: 		}
L_end__NOnClick:
BX	LR
; end of __NOnClick
__MOnClick:
;Controller_events_code.c,894 :: 		void _MOnClick() {
;Controller_events_code.c,896 :: 		}
L_end__MOnClick:
BX	LR
; end of __MOnClick
__CommaOnClick:
;Controller_events_code.c,898 :: 		void _CommaOnClick() {
;Controller_events_code.c,900 :: 		}
L_end__CommaOnClick:
BX	LR
; end of __CommaOnClick
__ColonOnClick:
;Controller_events_code.c,902 :: 		void _ColonOnClick() {
;Controller_events_code.c,904 :: 		}
L_end__ColonOnClick:
BX	LR
; end of __ColonOnClick
__SlashOnClick:
;Controller_events_code.c,906 :: 		void _SlashOnClick() {
;Controller_events_code.c,908 :: 		}
L_end__SlashOnClick:
BX	LR
; end of __SlashOnClick
__DELOnClick:
;Controller_events_code.c,910 :: 		void _DELOnClick() {
;Controller_events_code.c,912 :: 		}
L_end__DELOnClick:
BX	LR
; end of __DELOnClick
_ClearOnPress:
;Controller_events_code.c,914 :: 		void ClearOnPress() {
;Controller_events_code.c,916 :: 		}
L_end_ClearOnPress:
BX	LR
; end of _ClearOnPress
_CAPS_SwitchOnClick:
;Controller_events_code.c,918 :: 		void CAPS_SwitchOnClick() {
;Controller_events_code.c,920 :: 		}
L_end_CAPS_SwitchOnClick:
BX	LR
; end of _CAPS_SwitchOnClick
_SPACEOnClick:
;Controller_events_code.c,922 :: 		void SPACEOnClick() {
;Controller_events_code.c,924 :: 		}
L_end_SPACEOnClick:
BX	LR
; end of _SPACEOnClick
_ENTEROnClick:
;Controller_events_code.c,926 :: 		void ENTEROnClick() {
;Controller_events_code.c,928 :: 		}
L_end_ENTEROnClick:
BX	LR
; end of _ENTEROnClick
_SetDateAndTimeOnClick:
;Controller_events_code.c,930 :: 		void SetDateAndTimeOnClick(){
;Controller_events_code.c,932 :: 		}
L_end_SetDateAndTimeOnClick:
BX	LR
; end of _SetDateAndTimeOnClick
_OneYearUpOnClick:
;Controller_events_code.c,933 :: 		void OneYearUpOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,936 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,937 :: 		tenYearU++;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,938 :: 		if (tenYearU > 9)
CMP	R0, #9
IT	LS
BLS	L_OneYearUpOnClick126
;Controller_events_code.c,939 :: 		tenYearU = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_OneYearUpOnClick126:
;Controller_events_code.c,940 :: 		ByteToStr(tenYearU, temp);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,941 :: 		res = Ltrim(temp);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,942 :: 		strcpy(OneYear.Caption, res);
MOVW	R1, #lo_addr(_OneYear+16)
MOVT	R1, #hi_addr(_OneYear+16)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,943 :: 		DrawButton(&OneYearUp);
MOVW	R0, #lo_addr(_OneYearUp+0)
MOVT	R0, #hi_addr(_OneYearUp+0)
BL	_DrawButton+0
;Controller_events_code.c,944 :: 		DrawButton(&OneYearDwn);
MOVW	R0, #lo_addr(_OneYearDwn+0)
MOVT	R0, #hi_addr(_OneYearDwn+0)
BL	_DrawButton+0
;Controller_events_code.c,945 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,946 :: 		}
L_end_OneYearUpOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearUpOnClick
_OneYearDwnOnClick:
;Controller_events_code.c,947 :: 		void OneYearDwnOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,950 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,951 :: 		tenYearU--;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,952 :: 		if (My_Date.RTC_Year_Tens < 0)
MOVW	R0, #lo_addr(_My_Date+5)
MOVT	R0, #hi_addr(_My_Date+5)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CS
BCS	L_OneYearDwnOnClick127
;Controller_events_code.c,953 :: 		tenYearU = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_OneYearDwnOnClick127:
;Controller_events_code.c,954 :: 		ByteToStr(tenYearU, temp);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,955 :: 		res = Ltrim(temp);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,956 :: 		strcpy(OneYear.Caption, res);
MOVW	R1, #lo_addr(_OneYear+16)
MOVT	R1, #hi_addr(_OneYear+16)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,957 :: 		DrawButton(&OneYearUp);
MOVW	R0, #lo_addr(_OneYearUp+0)
MOVT	R0, #hi_addr(_OneYearUp+0)
BL	_DrawButton+0
;Controller_events_code.c,958 :: 		DrawButton(&OneYearDwn);
MOVW	R0, #lo_addr(_OneYearDwn+0)
MOVT	R0, #hi_addr(_OneYearDwn+0)
BL	_DrawButton+0
;Controller_events_code.c,959 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,960 :: 		}
L_end_OneYearDwnOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearDwnOnClick
_OneYearUpOnUp:
;Controller_events_code.c,961 :: 		void OneYearUpOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,962 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,963 :: 		}
L_end_OneYearUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearUpOnUp
_OneYearUpOnPress:
;Controller_events_code.c,964 :: 		void OneYearUpOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,965 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,966 :: 		}
L_end_OneYearUpOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearUpOnPress
_OneYearDwnOnUp:
;Controller_events_code.c,967 :: 		void OneYearDwnOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,968 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,969 :: 		}
L_end_OneYearDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearDwnOnUp
_OneYearDwnOnPress:
;Controller_events_code.c,970 :: 		void OneYearDwnOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,971 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,972 :: 		}
L_end_OneYearDwnOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearDwnOnPress
_TenYearUpOnClick:
;Controller_events_code.c,974 :: 		void TenYearUpOnClick() {
;Controller_events_code.c,975 :: 		}
L_end_TenYearUpOnClick:
BX	LR
; end of _TenYearUpOnClick
_TenYearDwnOnClick:
;Controller_events_code.c,976 :: 		void TenYearDwnOnClick() {
;Controller_events_code.c,977 :: 		}
L_end_TenYearDwnOnClick:
BX	LR
; end of _TenYearDwnOnClick
_TenYearUpOnUp:
;Controller_events_code.c,978 :: 		void TenYearUpOnUp() {
;Controller_events_code.c,980 :: 		}
L_end_TenYearUpOnUp:
BX	LR
; end of _TenYearUpOnUp
_TenYearDwnOnUp:
;Controller_events_code.c,981 :: 		void TenYearDwnOnUp() {
;Controller_events_code.c,982 :: 		}
L_end_TenYearDwnOnUp:
BX	LR
; end of _TenYearDwnOnUp
_TenYearDwnOnPress:
;Controller_events_code.c,983 :: 		void TenYearDwnOnPress() {
;Controller_events_code.c,984 :: 		}
L_end_TenYearDwnOnPress:
BX	LR
; end of _TenYearDwnOnPress
_TenYearUpOnPress:
;Controller_events_code.c,985 :: 		void TenYearUpOnPress() {
;Controller_events_code.c,987 :: 		}
L_end_TenYearUpOnPress:
BX	LR
; end of _TenYearUpOnPress
_MonthDateUpOnClick:
;Controller_events_code.c,989 :: 		void MonthDateUpOnClick() {
;Controller_events_code.c,991 :: 		}
L_end_MonthDateUpOnClick:
BX	LR
; end of _MonthDateUpOnClick
_MonthDateUpOnUp:
;Controller_events_code.c,992 :: 		void MonthDateUpOnUp() {
;Controller_events_code.c,994 :: 		}
L_end_MonthDateUpOnUp:
BX	LR
; end of _MonthDateUpOnUp
_MonthDateUpOnPress:
;Controller_events_code.c,995 :: 		void MonthDateUpOnPress() {
;Controller_events_code.c,997 :: 		}
L_end_MonthDateUpOnPress:
BX	LR
; end of _MonthDateUpOnPress
_MonthDateDwnOnClick:
;Controller_events_code.c,998 :: 		void MonthDateDwnOnClick() {
;Controller_events_code.c,1000 :: 		}
L_end_MonthDateDwnOnClick:
BX	LR
; end of _MonthDateDwnOnClick
_MonthDateDwnOnUp:
;Controller_events_code.c,1001 :: 		void MonthDateDwnOnUp() {
;Controller_events_code.c,1003 :: 		}
L_end_MonthDateDwnOnUp:
BX	LR
; end of _MonthDateDwnOnUp
_MonthDateDwnOnPress:
;Controller_events_code.c,1004 :: 		void MonthDateDwnOnPress() {
;Controller_events_code.c,1005 :: 		}
L_end_MonthDateDwnOnPress:
BX	LR
; end of _MonthDateDwnOnPress
_TenDayUpOnClick:
;Controller_events_code.c,1006 :: 		void TenDayUpOnClick() {
;Controller_events_code.c,1008 :: 		}
L_end_TenDayUpOnClick:
BX	LR
; end of _TenDayUpOnClick
_TenDayDwnOnClick:
;Controller_events_code.c,1009 :: 		void TenDayDwnOnClick() {
;Controller_events_code.c,1011 :: 		}
L_end_TenDayDwnOnClick:
BX	LR
; end of _TenDayDwnOnClick
_TenDayUpOnUp:
;Controller_events_code.c,1013 :: 		void TenDayUpOnUp() {
;Controller_events_code.c,1015 :: 		}
L_end_TenDayUpOnUp:
BX	LR
; end of _TenDayUpOnUp
_TenDayDwnOnUp:
;Controller_events_code.c,1017 :: 		void TenDayDwnOnUp() {
;Controller_events_code.c,1019 :: 		}
L_end_TenDayDwnOnUp:
BX	LR
; end of _TenDayDwnOnUp
_TenDayUpOnPress:
;Controller_events_code.c,1021 :: 		void TenDayUpOnPress() {
;Controller_events_code.c,1023 :: 		}
L_end_TenDayUpOnPress:
BX	LR
; end of _TenDayUpOnPress
_TenDayDwnOnPress:
;Controller_events_code.c,1025 :: 		void TenDayDwnOnPress() {
;Controller_events_code.c,1027 :: 		}
L_end_TenDayDwnOnPress:
BX	LR
; end of _TenDayDwnOnPress
_OneDayUpOnClick:
;Controller_events_code.c,1028 :: 		void OneDayUpOnClick() {
;Controller_events_code.c,1030 :: 		}
L_end_OneDayUpOnClick:
BX	LR
; end of _OneDayUpOnClick
_OneDayDwnOnClick:
;Controller_events_code.c,1032 :: 		void OneDayDwnOnClick() {
;Controller_events_code.c,1034 :: 		}
L_end_OneDayDwnOnClick:
BX	LR
; end of _OneDayDwnOnClick
_OneDayUpOnUp:
;Controller_events_code.c,1036 :: 		void OneDayUpOnUp() {
;Controller_events_code.c,1038 :: 		}
L_end_OneDayUpOnUp:
BX	LR
; end of _OneDayUpOnUp
_OneDayDwnOnUp:
;Controller_events_code.c,1040 :: 		void OneDayDwnOnUp() {
;Controller_events_code.c,1042 :: 		}
L_end_OneDayDwnOnUp:
BX	LR
; end of _OneDayDwnOnUp
_OneDayUpOnPress:
;Controller_events_code.c,1044 :: 		void OneDayUpOnPress() {
;Controller_events_code.c,1046 :: 		}
L_end_OneDayUpOnPress:
BX	LR
; end of _OneDayUpOnPress
_OneDayDwnOnPress:
;Controller_events_code.c,1048 :: 		void OneDayDwnOnPress() {
;Controller_events_code.c,1050 :: 		}
L_end_OneDayDwnOnPress:
BX	LR
; end of _OneDayDwnOnPress
_Day_unitUpOnClick:
;Controller_events_code.c,1051 :: 		void Day_unitUpOnClick() {
;Controller_events_code.c,1053 :: 		}
L_end_Day_unitUpOnClick:
BX	LR
; end of _Day_unitUpOnClick
_Day_unitDwnOnClick:
;Controller_events_code.c,1055 :: 		void Day_unitDwnOnClick() {
;Controller_events_code.c,1057 :: 		}
L_end_Day_unitDwnOnClick:
BX	LR
; end of _Day_unitDwnOnClick
_Day_unitUpOnUp:
;Controller_events_code.c,1059 :: 		void Day_unitUpOnUp() {
;Controller_events_code.c,1061 :: 		}
L_end_Day_unitUpOnUp:
BX	LR
; end of _Day_unitUpOnUp
_Day_unitDwnOnUp:
;Controller_events_code.c,1063 :: 		void Day_unitDwnOnUp() {
;Controller_events_code.c,1065 :: 		}
L_end_Day_unitDwnOnUp:
BX	LR
; end of _Day_unitDwnOnUp
_Day_unitUpOnPress:
;Controller_events_code.c,1067 :: 		void Day_unitUpOnPress() {
;Controller_events_code.c,1069 :: 		}
L_end_Day_unitUpOnPress:
BX	LR
; end of _Day_unitUpOnPress
_Day_unitDwnOnPress:
;Controller_events_code.c,1071 :: 		void Day_unitDwnOnPress() {
;Controller_events_code.c,1073 :: 		}
L_end_Day_unitDwnOnPress:
BX	LR
; end of _Day_unitDwnOnPress
_Unit_hoursUpOnClick:
;Controller_events_code.c,1075 :: 		void Unit_hoursUpOnClick() {
;Controller_events_code.c,1077 :: 		}
L_end_Unit_hoursUpOnClick:
BX	LR
; end of _Unit_hoursUpOnClick
_Unit_hoursDwnOnClick:
;Controller_events_code.c,1079 :: 		void Unit_hoursDwnOnClick() {
;Controller_events_code.c,1081 :: 		}
L_end_Unit_hoursDwnOnClick:
BX	LR
; end of _Unit_hoursDwnOnClick
_Unit_hoursUpOnUp:
;Controller_events_code.c,1082 :: 		void Unit_hoursUpOnUp() {
;Controller_events_code.c,1084 :: 		}
L_end_Unit_hoursUpOnUp:
BX	LR
; end of _Unit_hoursUpOnUp
_Unit_hoursDwnOnUp:
;Controller_events_code.c,1085 :: 		void Unit_hoursDwnOnUp() {
;Controller_events_code.c,1087 :: 		}
L_end_Unit_hoursDwnOnUp:
BX	LR
; end of _Unit_hoursDwnOnUp
_Unit_hoursUpOnPress:
;Controller_events_code.c,1088 :: 		void Unit_hoursUpOnPress() {
;Controller_events_code.c,1090 :: 		}
L_end_Unit_hoursUpOnPress:
BX	LR
; end of _Unit_hoursUpOnPress
_Unit_hoursDwnOnPress:
;Controller_events_code.c,1091 :: 		void Unit_hoursDwnOnPress() {
;Controller_events_code.c,1093 :: 		}
L_end_Unit_hoursDwnOnPress:
BX	LR
; end of _Unit_hoursDwnOnPress
_Ten_minutesUpOnClick:
;Controller_events_code.c,1094 :: 		void Ten_minutesUpOnClick() {
;Controller_events_code.c,1096 :: 		}
L_end_Ten_minutesUpOnClick:
BX	LR
; end of _Ten_minutesUpOnClick
_Ten_minutesDwnOnClick:
;Controller_events_code.c,1097 :: 		void Ten_minutesDwnOnClick() {
;Controller_events_code.c,1099 :: 		}
L_end_Ten_minutesDwnOnClick:
BX	LR
; end of _Ten_minutesDwnOnClick
_Ten_minutesUpOnUp:
;Controller_events_code.c,1100 :: 		void Ten_minutesUpOnUp() {
;Controller_events_code.c,1102 :: 		}
L_end_Ten_minutesUpOnUp:
BX	LR
; end of _Ten_minutesUpOnUp
_Ten_minutesDwnOnUp:
;Controller_events_code.c,1103 :: 		void Ten_minutesDwnOnUp() {
;Controller_events_code.c,1105 :: 		}
L_end_Ten_minutesDwnOnUp:
BX	LR
; end of _Ten_minutesDwnOnUp
_Ten_minutesUpOnPress:
;Controller_events_code.c,1106 :: 		void Ten_minutesUpOnPress() {
;Controller_events_code.c,1108 :: 		}
L_end_Ten_minutesUpOnPress:
BX	LR
; end of _Ten_minutesUpOnPress
_Ten_minutesDwnOnPress:
;Controller_events_code.c,1109 :: 		void Ten_minutesDwnOnPress() {
;Controller_events_code.c,1111 :: 		}
L_end_Ten_minutesDwnOnPress:
BX	LR
; end of _Ten_minutesDwnOnPress
_Unit_minutesUpOnClick:
;Controller_events_code.c,1112 :: 		void Unit_minutesUpOnClick() {
;Controller_events_code.c,1114 :: 		}
L_end_Unit_minutesUpOnClick:
BX	LR
; end of _Unit_minutesUpOnClick
_Unit_minutesDwnOnClick:
;Controller_events_code.c,1116 :: 		void Unit_minutesDwnOnClick() {
;Controller_events_code.c,1118 :: 		}
L_end_Unit_minutesDwnOnClick:
BX	LR
; end of _Unit_minutesDwnOnClick
_Unit_minutesUpOnUp:
;Controller_events_code.c,1120 :: 		void Unit_minutesUpOnUp(){
;Controller_events_code.c,1122 :: 		}
L_end_Unit_minutesUpOnUp:
BX	LR
; end of _Unit_minutesUpOnUp
_Unit_minutesDwnOnUp:
;Controller_events_code.c,1124 :: 		void Unit_minutesDwnOnUp(){
;Controller_events_code.c,1126 :: 		}
L_end_Unit_minutesDwnOnUp:
BX	LR
; end of _Unit_minutesDwnOnUp
_Unit_minutesUpOnPress:
;Controller_events_code.c,1128 :: 		void Unit_minutesUpOnPress() {
;Controller_events_code.c,1130 :: 		}
L_end_Unit_minutesUpOnPress:
BX	LR
; end of _Unit_minutesUpOnPress
_Unit_minutesDwnOnPress:
;Controller_events_code.c,1132 :: 		void Unit_minutesDwnOnPress() {
;Controller_events_code.c,1134 :: 		}
L_end_Unit_minutesDwnOnPress:
BX	LR
; end of _Unit_minutesDwnOnPress
_Admin_SetOnClick:
;Controller_events_code.c,1137 :: 		void Admin_SetOnClick(){
;Controller_events_code.c,1138 :: 		}
L_end_Admin_SetOnClick:
BX	LR
; end of _Admin_SetOnClick
_system_passOnDown:
;Controller_events_code.c,1140 :: 		void system_passOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1141 :: 		Image83.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1142 :: 		DrawImage(&Image83);
MOVW	R0, #lo_addr(_Image83+0)
MOVT	R0, #hi_addr(_Image83+0)
BL	_DrawImage+0
;Controller_events_code.c,1143 :: 		}
L_end_system_passOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnDown
_system_passOnUp:
;Controller_events_code.c,1145 :: 		void system_passOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1146 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1147 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1148 :: 		Image83.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1149 :: 		DrawScreen(&PASSWORD);
MOVW	R0, #lo_addr(_PASSWORD+0)
MOVT	R0, #hi_addr(_PASSWORD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1150 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1151 :: 		}
L_end_system_passOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnUp
_ModeSetOnUp:
;Controller_events_code.c,1153 :: 		void ModeSetOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1154 :: 		if (SYSTEM_ON == false) {
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_ModeSetOnUp128
;Controller_events_code.c,1155 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1156 :: 		strcpy(System_Set_Message.Caption, " ");
MOVW	R1, #lo_addr(?lstr39_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr39_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1157 :: 		Image300.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1158 :: 		System_Set_Message.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1159 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1160 :: 		}
IT	AL
BAL	L_ModeSetOnUp129
L_ModeSetOnUp128:
;Controller_events_code.c,1162 :: 		strcpy(System_Set_Message.Caption, "Please  OFF  system  power!");
MOVW	R1, #lo_addr(?lstr40_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr40_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1163 :: 		Image300.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1164 :: 		DrawImage (&Image300);
MOVW	R0, #lo_addr(_Image300+0)
MOVT	R0, #hi_addr(_Image300+0)
BL	_DrawImage+0
;Controller_events_code.c,1165 :: 		System_Set_Message.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1166 :: 		DrawButton (&System_Set_Message);
MOVW	R0, #lo_addr(_System_Set_Message+0)
MOVT	R0, #hi_addr(_System_Set_Message+0)
BL	_DrawButton+0
;Controller_events_code.c,1167 :: 		}
L_ModeSetOnUp129:
;Controller_events_code.c,1168 :: 		}
L_end_ModeSetOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnUp
_ModeSetOnDown:
;Controller_events_code.c,1170 :: 		void ModeSetOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1171 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1172 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1173 :: 		}
L_end_ModeSetOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnDown
_system_EEVOnDown:
;Controller_events_code.c,1175 :: 		void system_EEVOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1176 :: 		Image89.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1177 :: 		DrawImage(&Image89);
MOVW	R0, #lo_addr(_Image89+0)
MOVT	R0, #hi_addr(_Image89+0)
BL	_DrawImage+0
;Controller_events_code.c,1178 :: 		}
L_end_system_EEVOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnDown
_system_EEVOnUp:
;Controller_events_code.c,1180 :: 		void system_EEVOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1181 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1182 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1184 :: 		Image89.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1185 :: 		DrawScreen(&EEV);
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
BL	_DrawScreen+0
;Controller_events_code.c,1186 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1188 :: 		}
L_end_system_EEVOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnUp
_system_modeOnDown:
;Controller_events_code.c,1190 :: 		void system_modeOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1191 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1192 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1193 :: 		}
L_end_system_modeOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnDown
_system_modeOnUp:
;Controller_events_code.c,1195 :: 		void system_modeOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1196 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1197 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1198 :: 		Image85.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1199 :: 		DrawScreen(&MODE);
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
;Controller_events_code.c,1200 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1201 :: 		}
L_end_system_modeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnUp
_system_delayOnUp:
;Controller_events_code.c,1203 :: 		void system_delayOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1204 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1205 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1206 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1207 :: 		DrawScreen(&DELAY_MENU);
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,1208 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1209 :: 		}
L_end_system_delayOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnUp
_system_delayOnDown:
;Controller_events_code.c,1210 :: 		void system_delayOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1211 :: 		Image90.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1212 :: 		DrawImage(&Image90);
MOVW	R0, #lo_addr(_Image90+0)
MOVT	R0, #hi_addr(_Image90+0)
BL	_DrawImage+0
;Controller_events_code.c,1213 :: 		}
L_end_system_delayOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnDown
_system_graphOnDown:
;Controller_events_code.c,1215 :: 		void system_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1216 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1217 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1218 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1219 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1220 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1221 :: 		}
L_end_system_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnDown
_system_graphOnUp:
;Controller_events_code.c,1223 :: 		void system_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1224 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1225 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1227 :: 		}
L_end_system_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnUp
_system_microSDOnDown:
;Controller_events_code.c,1228 :: 		void system_microSDOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1229 :: 		Image88.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1230 :: 		DrawImage(&Image88);
MOVW	R0, #lo_addr(_Image88+0)
MOVT	R0, #hi_addr(_Image88+0)
BL	_DrawImage+0
;Controller_events_code.c,1231 :: 		}
L_end_system_microSDOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnDown
_system_microSDOnUp:
;Controller_events_code.c,1233 :: 		void system_microSDOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1234 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1235 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1236 :: 		Image88.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1237 :: 		DrawScreen(&MICRO_SD);
MOVW	R0, #lo_addr(_MICRO_SD+0)
MOVT	R0, #hi_addr(_MICRO_SD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1238 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1239 :: 		}
L_end_system_microSDOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnUp
_system_limitsOnDown:
;Controller_events_code.c,1242 :: 		void system_limitsOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1243 :: 		Image91.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1244 :: 		DrawImage(&Image91);
MOVW	R0, #lo_addr(_Image91+0)
MOVT	R0, #hi_addr(_Image91+0)
BL	_DrawImage+0
;Controller_events_code.c,1245 :: 		}
L_end_system_limitsOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnDown
_system_limitsOnUp:
;Controller_events_code.c,1247 :: 		void system_limitsOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1248 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1249 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1250 :: 		Image91.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1251 :: 		DrawScreen(&LIMITS1);
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
;Controller_events_code.c,1252 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1253 :: 		}
L_end_system_limitsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnUp
_ssytem_graphOnDown:
;Controller_events_code.c,1255 :: 		void ssytem_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1256 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1257 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1258 :: 		}
L_end_ssytem_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnDown
_ssytem_graphOnUp:
;Controller_events_code.c,1260 :: 		void ssytem_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1261 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1262 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1263 :: 		Image92.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1264 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1265 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1266 :: 		}
L_end_ssytem_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnUp
_system_historyOnDown:
;Controller_events_code.c,1268 :: 		void system_historyOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1269 :: 		Image93.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1270 :: 		DrawImage(&Image93);
MOVW	R0, #lo_addr(_Image93+0)
MOVT	R0, #hi_addr(_Image93+0)
BL	_DrawImage+0
;Controller_events_code.c,1271 :: 		}
L_end_system_historyOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnDown
_system_historyOnUp:
;Controller_events_code.c,1273 :: 		void system_historyOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1274 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1275 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1276 :: 		Image93.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1277 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,1278 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1279 :: 		}
L_end_system_historyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnUp
_Delay_Source_DOWNOnUp:
;Controller_events_code.c,1282 :: 		void Delay_Source_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1283 :: 		Image306.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1284 :: 		Delay_Source_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1285 :: 		DrawImage(&Delay_Source_DOWN);
MOVW	R0, #lo_addr(_Delay_Source_DOWN+0)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1286 :: 		}
L_end_Delay_Source_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_DOWNOnUp
_Delay_Source_DOWNOnPress:
;Controller_events_code.c,1287 :: 		void Delay_Source_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1290 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1291 :: 		Image306.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1292 :: 		Delay_Source_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1293 :: 		DrawImage(&Image306);
MOVW	R0, #lo_addr(_Image306+0)
MOVT	R0, #hi_addr(_Image306+0)
BL	_DrawImage+0
;Controller_events_code.c,1296 :: 		system_reg[SOURS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+998)
MOVT	R1, #hi_addr(_system_reg+998)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1297 :: 		if (system_reg[SOURS_DEL] <0) system_reg[SOURS_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_Source_DOWNOnPress130
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+998)
MOVT	R0, #hi_addr(_system_reg+998)
STRH	R1, [R0, #0]
L_Delay_Source_DOWNOnPress130:
;Controller_events_code.c,1298 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+998)
MOVT	R0, #hi_addr(_system_reg+998)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1299 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1300 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1301 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1302 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_Source_DOWNOnPress131:
SUBS	R7, R7, #1
BNE	L_Delay_Source_DOWNOnPress131
NOP
NOP
NOP
;Controller_events_code.c,1303 :: 		}
L_end_Delay_Source_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_DOWNOnPress
_Delay_Source_UPOnUp:
;Controller_events_code.c,1304 :: 		void Delay_Source_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1305 :: 		Image312.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1306 :: 		Delay_Source_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1307 :: 		DrawImage(&Delay_Source_UP);
MOVW	R0, #lo_addr(_Delay_Source_UP+0)
MOVT	R0, #hi_addr(_Delay_Source_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1309 :: 		}
L_end_Delay_Source_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_UPOnUp
_Delay_Source_UPOnPress:
;Controller_events_code.c,1310 :: 		void Delay_Source_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1313 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1314 :: 		Image312.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1315 :: 		Delay_Source_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1316 :: 		DrawImage(&Image312);
MOVW	R0, #lo_addr(_Image312+0)
MOVT	R0, #hi_addr(_Image312+0)
BL	_DrawImage+0
;Controller_events_code.c,1317 :: 		system_reg[SOURS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+998)
MOVT	R1, #hi_addr(_system_reg+998)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1318 :: 		if (system_reg[SOURS_DEL] >99) system_reg[SOURS_DEL] = 99;
CMP	R0, #99
IT	LE
BLE	L_Delay_Source_UPOnPress133
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+998)
MOVT	R0, #hi_addr(_system_reg+998)
STRH	R1, [R0, #0]
L_Delay_Source_UPOnPress133:
;Controller_events_code.c,1319 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+998)
MOVT	R0, #hi_addr(_system_reg+998)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1320 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1321 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1322 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1323 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_Source_UPOnPress134:
SUBS	R7, R7, #1
BNE	L_Delay_Source_UPOnPress134
NOP
NOP
NOP
;Controller_events_code.c,1324 :: 		}
L_end_Delay_Source_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_UPOnPress
_Delay_Source_SETOnUp:
;Controller_events_code.c,1325 :: 		void Delay_Source_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1326 :: 		Delay_Source_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1327 :: 		Image344.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1328 :: 		DrawImage (&Delay_Source_SET);
MOVW	R0, #lo_addr(_Delay_Source_SET+0)
MOVT	R0, #hi_addr(_Delay_Source_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1329 :: 		}
L_end_Delay_Source_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnUp
_Delay_Source_SETOnDown:
;Controller_events_code.c,1330 :: 		void Delay_Source_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1331 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1332 :: 		adressReg= SOURS_DEL;
MOVW	R1, #499
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1333 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1334 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1335 :: 		send_data_packet(SOURS_DEL,1);
MOVS	R1, #1
MOVW	R0, #499
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1336 :: 		Delay_Source_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1337 :: 		Image344.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1338 :: 		DrawImage (&Image344);
MOVW	R0, #lo_addr(_Image344+0)
MOVT	R0, #hi_addr(_Image344+0)
BL	_DrawImage+0
;Controller_events_code.c,1339 :: 		}
L_end_Delay_Source_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnDown
_Delay_heat_pump_DOWNOnUp:
;Controller_events_code.c,1341 :: 		void Delay_heat_pump_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1342 :: 		Image307.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1343 :: 		Delay_heat_pump_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1344 :: 		DrawImage(&Delay_heat_pump_DOWN);
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1346 :: 		}
L_end_Delay_heat_pump_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_DOWNOnUp
_Delay_heat_pump_DOWNOnPress:
;Controller_events_code.c,1347 :: 		void Delay_heat_pump_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1350 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1351 :: 		Image307.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1352 :: 		Delay_heat_pump_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1353 :: 		DrawImage(&Image307);
MOVW	R0, #lo_addr(_Image307+0)
MOVT	R0, #hi_addr(_Image307+0)
BL	_DrawImage+0
;Controller_events_code.c,1356 :: 		system_reg[HEAT_DEL]--;
MOVW	R1, #lo_addr(_system_reg+1002)
MOVT	R1, #hi_addr(_system_reg+1002)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1357 :: 		if (system_reg[HEAT_DEL] <0) system_reg[HEAT_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_heat_pump_DOWNOnPress136
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1002)
MOVT	R0, #hi_addr(_system_reg+1002)
STRH	R1, [R0, #0]
L_Delay_heat_pump_DOWNOnPress136:
;Controller_events_code.c,1358 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1002)
MOVT	R0, #hi_addr(_system_reg+1002)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1359 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1360 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1361 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1362 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_heat_pump_DOWNOnPress137:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_DOWNOnPress137
NOP
NOP
NOP
;Controller_events_code.c,1363 :: 		}
L_end_Delay_heat_pump_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_DOWNOnPress
_Delay_heat_pump_upOnUp:
;Controller_events_code.c,1364 :: 		void Delay_heat_pump_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1365 :: 		Image313.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1366 :: 		Delay_heat_pump_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1367 :: 		DrawImage(&Delay_heat_pump_up);
MOVW	R0, #lo_addr(_Delay_heat_pump_up+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1368 :: 		}
L_end_Delay_heat_pump_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_upOnUp
_Delay_heat_pump_upOnPress:
;Controller_events_code.c,1369 :: 		void Delay_heat_pump_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1372 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1373 :: 		Image313.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1374 :: 		Delay_heat_pump_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1375 :: 		DrawImage(&Image313);
MOVW	R0, #lo_addr(_Image313+0)
MOVT	R0, #hi_addr(_Image313+0)
BL	_DrawImage+0
;Controller_events_code.c,1378 :: 		system_reg[HEAT_DEL]++;
MOVW	R1, #lo_addr(_system_reg+1002)
MOVT	R1, #hi_addr(_system_reg+1002)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1379 :: 		if (system_reg[HEAT_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_heat_pump_upOnPress139
;Controller_events_code.c,1380 :: 		system_reg[HEAT_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1002)
MOVT	R0, #hi_addr(_system_reg+1002)
STRH	R1, [R0, #0]
L_Delay_heat_pump_upOnPress139:
;Controller_events_code.c,1381 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1002)
MOVT	R0, #hi_addr(_system_reg+1002)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1382 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1383 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1384 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1385 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_heat_pump_upOnPress140:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_upOnPress140
NOP
NOP
NOP
;Controller_events_code.c,1387 :: 		}
L_end_Delay_heat_pump_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_upOnPress
_Delay_heat_pump_SETOnUp:
;Controller_events_code.c,1388 :: 		void Delay_heat_pump_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1389 :: 		Delay_heat_pump_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1390 :: 		Image345.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1391 :: 		DrawImage (&Delay_heat_pump_SET);
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1392 :: 		}
L_end_Delay_heat_pump_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnUp
_Delay_heat_pump_SETOnDown:
;Controller_events_code.c,1393 :: 		void Delay_heat_pump_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1394 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1395 :: 		adressReg= HEAT_DEL;
MOVW	R1, #501
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1396 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1397 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1398 :: 		send_data_packet(HEAT_DEL,1);
MOVS	R1, #1
MOVW	R0, #501
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1399 :: 		Delay_heat_pump_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1400 :: 		Image345.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1401 :: 		DrawImage (&Image345);
MOVW	R0, #lo_addr(_Image345+0)
MOVT	R0, #hi_addr(_Image345+0)
BL	_DrawImage+0
;Controller_events_code.c,1402 :: 		}
L_end_Delay_heat_pump_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnDown
_Delay_reversing_DOWNOnUp:
;Controller_events_code.c,1404 :: 		void Delay_reversing_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1405 :: 		Image308.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1406 :: 		Delay_reversing_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1407 :: 		DrawImage(&Delay_reversing_DOWN);
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+0)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1408 :: 		}
L_end_Delay_reversing_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_DOWNOnUp
_Delay_reversing_DOWNOnPress:
;Controller_events_code.c,1409 :: 		void Delay_reversing_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1412 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1413 :: 		Image308.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1414 :: 		Delay_reversing_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1415 :: 		DrawImage(&Image308);
MOVW	R0, #lo_addr(_Image308+0)
MOVT	R0, #hi_addr(_Image308+0)
BL	_DrawImage+0
;Controller_events_code.c,1418 :: 		system_reg[REVERS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+1000)
MOVT	R1, #hi_addr(_system_reg+1000)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1419 :: 		if (system_reg[REVERS_DEL] <0)
CMP	R0, #0
IT	GE
BGE	L_Delay_reversing_DOWNOnPress142
;Controller_events_code.c,1420 :: 		system_reg[REVERS_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1000)
MOVT	R0, #hi_addr(_system_reg+1000)
STRH	R1, [R0, #0]
L_Delay_reversing_DOWNOnPress142:
;Controller_events_code.c,1421 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1000)
MOVT	R0, #hi_addr(_system_reg+1000)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1422 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1423 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1424 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1425 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_reversing_DOWNOnPress143:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_DOWNOnPress143
NOP
NOP
NOP
;Controller_events_code.c,1426 :: 		}
L_end_Delay_reversing_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_DOWNOnPress
_Delay_reversing_UPOnUp:
;Controller_events_code.c,1427 :: 		void Delay_reversing_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1428 :: 		Image314.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1429 :: 		Delay_reversing_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1430 :: 		DrawImage(&Delay_reversing_UP);
MOVW	R0, #lo_addr(_Delay_reversing_UP+0)
MOVT	R0, #hi_addr(_Delay_reversing_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1431 :: 		}
L_end_Delay_reversing_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_UPOnUp
_Delay_reversing_UPOnPress:
;Controller_events_code.c,1432 :: 		void Delay_reversing_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1435 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1436 :: 		Image314.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1437 :: 		Delay_reversing_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1438 :: 		DrawImage(&Image314);
MOVW	R0, #lo_addr(_Image314+0)
MOVT	R0, #hi_addr(_Image314+0)
BL	_DrawImage+0
;Controller_events_code.c,1441 :: 		system_reg[REVERS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+1000)
MOVT	R1, #hi_addr(_system_reg+1000)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1442 :: 		if (system_reg[REVERS_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_reversing_UPOnPress145
;Controller_events_code.c,1443 :: 		system_reg[REVERS_DEL] = 99 ;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1000)
MOVT	R0, #hi_addr(_system_reg+1000)
STRH	R1, [R0, #0]
L_Delay_reversing_UPOnPress145:
;Controller_events_code.c,1444 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1000)
MOVT	R0, #hi_addr(_system_reg+1000)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1445 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1446 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1447 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1448 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_reversing_UPOnPress146:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_UPOnPress146
NOP
NOP
NOP
;Controller_events_code.c,1449 :: 		}
L_end_Delay_reversing_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_UPOnPress
_Delay_reversing_SETOnUp:
;Controller_events_code.c,1450 :: 		void Delay_reversing_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1451 :: 		Delay_reversing_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1452 :: 		Image346.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1453 :: 		DrawImage (&Delay_reversing_SET);
MOVW	R0, #lo_addr(_Delay_reversing_SET+0)
MOVT	R0, #hi_addr(_Delay_reversing_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1454 :: 		}
L_end_Delay_reversing_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnUp
_Delay_reversing_SETOnDown:
;Controller_events_code.c,1455 :: 		void Delay_reversing_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1456 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1457 :: 		adressReg= REVERS_DEL;
MOVW	R1, #500
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1458 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1459 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1460 :: 		send_data_packet(REVERS_DEL,1);
MOVS	R1, #1
MOVW	R0, #500
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1461 :: 		Delay_reversing_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1462 :: 		Image346.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1463 :: 		DrawImage (&Image346);
MOVW	R0, #lo_addr(_Image346+0)
MOVT	R0, #hi_addr(_Image346+0)
BL	_DrawImage+0
;Controller_events_code.c,1464 :: 		}
L_end_Delay_reversing_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnDown
_Delay_trv_DOWNOnUp:
;Controller_events_code.c,1466 :: 		void Delay_trv_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1467 :: 		Image309.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1468 :: 		Delay_trv_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1469 :: 		DrawImage(&Delay_trv_DOWN);
MOVW	R0, #lo_addr(_Delay_trv_DOWN+0)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1470 :: 		}
L_end_Delay_trv_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_DOWNOnUp
_Delay_trv_DOWNOnPress:
;Controller_events_code.c,1471 :: 		void Delay_trv_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1474 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1475 :: 		Image309.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1476 :: 		Delay_trv_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1477 :: 		DrawImage(&Image309);
MOVW	R0, #lo_addr(_Image309+0)
MOVT	R0, #hi_addr(_Image309+0)
BL	_DrawImage+0
;Controller_events_code.c,1480 :: 		system_reg[TRV_DEL]--;
MOVW	R1, #lo_addr(_system_reg+1006)
MOVT	R1, #hi_addr(_system_reg+1006)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1481 :: 		if (system_reg[TRV_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_trv_DOWNOnPress148
;Controller_events_code.c,1482 :: 		system_reg[TRV_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1006)
MOVT	R0, #hi_addr(_system_reg+1006)
STRH	R1, [R0, #0]
L_Delay_trv_DOWNOnPress148:
;Controller_events_code.c,1483 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1006)
MOVT	R0, #hi_addr(_system_reg+1006)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1484 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1485 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1486 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1487 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_trv_DOWNOnPress149:
SUBS	R7, R7, #1
BNE	L_Delay_trv_DOWNOnPress149
NOP
NOP
NOP
;Controller_events_code.c,1488 :: 		}
L_end_Delay_trv_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_DOWNOnPress
_Delay_trv_UPOnUp:
;Controller_events_code.c,1489 :: 		void Delay_trv_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1490 :: 		Image315.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1491 :: 		Delay_trv_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1492 :: 		DrawImage(&Delay_trv_up);
MOVW	R0, #lo_addr(_Delay_trv_up+0)
MOVT	R0, #hi_addr(_Delay_trv_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1493 :: 		}
L_end_Delay_trv_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_UPOnUp
_Delay_trv_UPOnPress:
;Controller_events_code.c,1494 :: 		void Delay_trv_UPOnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1497 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1498 :: 		Image315.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1499 :: 		Delay_trv_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1500 :: 		DrawImage(&Image315);
MOVW	R0, #lo_addr(_Image315+0)
MOVT	R0, #hi_addr(_Image315+0)
BL	_DrawImage+0
;Controller_events_code.c,1503 :: 		system_reg[TRV_DEL]++;
MOVW	R1, #lo_addr(_system_reg+1006)
MOVT	R1, #hi_addr(_system_reg+1006)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1504 :: 		if (system_reg[TRV_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_trv_UPOnPress151
;Controller_events_code.c,1505 :: 		system_reg[TRV_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1006)
MOVT	R0, #hi_addr(_system_reg+1006)
STRH	R1, [R0, #0]
L_Delay_trv_UPOnPress151:
;Controller_events_code.c,1506 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1006)
MOVT	R0, #hi_addr(_system_reg+1006)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1507 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1508 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1509 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1510 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_trv_UPOnPress152:
SUBS	R7, R7, #1
BNE	L_Delay_trv_UPOnPress152
NOP
NOP
NOP
;Controller_events_code.c,1511 :: 		}
L_end_Delay_trv_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_UPOnPress
_Delay_EEV_SETOnUp:
;Controller_events_code.c,1512 :: 		void Delay_EEV_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1513 :: 		Delay_EEV_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1514 :: 		Image347.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1515 :: 		DrawImage (&Delay_EEV_SET);
MOVW	R0, #lo_addr(_Delay_EEV_SET+0)
MOVT	R0, #hi_addr(_Delay_EEV_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1516 :: 		}
L_end_Delay_EEV_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnUp
_Delay_EEV_SETOnDown:
;Controller_events_code.c,1517 :: 		void Delay_EEV_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1518 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1519 :: 		adressReg= TRV_DEL;
MOVW	R1, #503
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1520 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1521 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1522 :: 		send_data_packet(TRV_DEL,1);
MOVS	R1, #1
MOVW	R0, #503
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1523 :: 		Delay_EEV_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1524 :: 		Image347.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1525 :: 		DrawImage (&Image347);
MOVW	R0, #lo_addr(_Image347+0)
MOVT	R0, #hi_addr(_Image347+0)
BL	_DrawImage+0
;Controller_events_code.c,1526 :: 		}
L_end_Delay_EEV_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnDown
_Delay_DHW_valve_DOWNOnUp:
;Controller_events_code.c,1528 :: 		void Delay_DHW_valve_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1529 :: 		Image310.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1530 :: 		Delay_DHW_valve_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1531 :: 		DrawImage(&Delay_DHW_valve_DOWN);
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1532 :: 		}
L_end_Delay_DHW_valve_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_DOWNOnUp
_Delay_DHW_valve_DOWNOnPress:
;Controller_events_code.c,1533 :: 		void Delay_DHW_valve_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1536 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1537 :: 		Image310.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1538 :: 		Delay_DHW_valve_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1539 :: 		DrawImage(&Image310);
MOVW	R0, #lo_addr(_Image310+0)
MOVT	R0, #hi_addr(_Image310+0)
BL	_DrawImage+0
;Controller_events_code.c,1542 :: 		system_reg[THREE_WAY_DEL]--;
MOVW	R1, #lo_addr(_system_reg+1004)
MOVT	R1, #hi_addr(_system_reg+1004)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1543 :: 		if (system_reg[THREE_WAY_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_DHW_valve_DOWNOnPress154
;Controller_events_code.c,1544 :: 		system_reg[THREE_WAY_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1004)
MOVT	R0, #hi_addr(_system_reg+1004)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_DOWNOnPress154:
;Controller_events_code.c,1545 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1004)
MOVT	R0, #hi_addr(_system_reg+1004)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1546 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1547 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1548 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1549 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_DHW_valve_DOWNOnPress155:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_DOWNOnPress155
NOP
NOP
NOP
;Controller_events_code.c,1550 :: 		}
L_end_Delay_DHW_valve_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_DOWNOnPress
_Delay_DHW_valve_UPOnUp:
;Controller_events_code.c,1551 :: 		void Delay_DHW_valve_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1552 :: 		Image316.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1553 :: 		Delay_DHW_valve_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1554 :: 		DrawImage(&Delay_DHW_valve_UP);
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1555 :: 		}
L_end_Delay_DHW_valve_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_UPOnUp
_Delay_DHW_valve_UPOnPress:
;Controller_events_code.c,1556 :: 		void Delay_DHW_valve_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1559 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1560 :: 		Image316.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1561 :: 		Delay_DHW_valve_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1562 :: 		DrawImage(&Image316);
MOVW	R0, #lo_addr(_Image316+0)
MOVT	R0, #hi_addr(_Image316+0)
BL	_DrawImage+0
;Controller_events_code.c,1565 :: 		system_reg[THREE_WAY_DEL]++;
MOVW	R1, #lo_addr(_system_reg+1004)
MOVT	R1, #hi_addr(_system_reg+1004)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1566 :: 		if (system_reg[THREE_WAY_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_DHW_valve_UPOnPress157
;Controller_events_code.c,1567 :: 		system_reg[THREE_WAY_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1004)
MOVT	R0, #hi_addr(_system_reg+1004)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_UPOnPress157:
;Controller_events_code.c,1568 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1004)
MOVT	R0, #hi_addr(_system_reg+1004)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1569 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1570 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1571 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1572 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_DHW_valve_UPOnPress158:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_UPOnPress158
NOP
NOP
NOP
;Controller_events_code.c,1573 :: 		}
L_end_Delay_DHW_valve_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_UPOnPress
_Delay_DHW_valve_SETOnUp:
;Controller_events_code.c,1574 :: 		void Delay_DHW_valve_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1575 :: 		Delay_DHW_valve_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1576 :: 		Image348.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1577 :: 		DrawImage (&Delay_DHW_valve_SET);
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1578 :: 		}
L_end_Delay_DHW_valve_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnUp
_Delay_DHW_valve_SETOnDown:
;Controller_events_code.c,1579 :: 		void Delay_DHW_valve_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1580 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1581 :: 		adressReg= THREE_WAY_DEL;
MOVW	R1, #502
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1582 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1583 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1584 :: 		send_data_packet(THREE_WAY_DEL,1);
MOVS	R1, #1
MOVW	R0, #502
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1585 :: 		Delay_DHW_valve_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1586 :: 		Image348.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1587 :: 		DrawImage (&Image348);
MOVW	R0, #lo_addr(_Image348+0)
MOVT	R0, #hi_addr(_Image348+0)
BL	_DrawImage+0
;Controller_events_code.c,1588 :: 		}
L_end_Delay_DHW_valve_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnDown
_Delay_compressor_DOWNOnUp:
;Controller_events_code.c,1590 :: 		void Delay_compressor_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1591 :: 		Image311.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1592 :: 		Delay_compressor_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1593 :: 		DrawImage(&Delay_compressor_DOWN);
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+0)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1594 :: 		}
L_end_Delay_compressor_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_DOWNOnUp
_Delay_compressor_DOWNOnPress:
;Controller_events_code.c,1595 :: 		void Delay_compressor_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1598 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1599 :: 		Image311.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1600 :: 		Delay_compressor_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1601 :: 		DrawImage(&Image311);
MOVW	R0, #lo_addr(_Image311+0)
MOVT	R0, #hi_addr(_Image311+0)
BL	_DrawImage+0
;Controller_events_code.c,1604 :: 		system_reg[COMP_DEL]--;
MOVW	R1, #lo_addr(_system_reg+996)
MOVT	R1, #hi_addr(_system_reg+996)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1605 :: 		if (system_reg[COMP_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_compressor_DOWNOnPress160
;Controller_events_code.c,1606 :: 		system_reg[COMP_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+996)
MOVT	R0, #hi_addr(_system_reg+996)
STRH	R1, [R0, #0]
L_Delay_compressor_DOWNOnPress160:
;Controller_events_code.c,1607 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+996)
MOVT	R0, #hi_addr(_system_reg+996)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1608 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1609 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1610 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1611 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_compressor_DOWNOnPress161:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_DOWNOnPress161
NOP
NOP
NOP
;Controller_events_code.c,1612 :: 		}
L_end_Delay_compressor_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_DOWNOnPress
_Delay_compressor_UPOnUp:
;Controller_events_code.c,1613 :: 		void Delay_compressor_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1614 :: 		Image317.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1615 :: 		Delay_compressor_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1616 :: 		DrawImage(&Delay_compressor_UP);
MOVW	R0, #lo_addr(_Delay_compressor_UP+0)
MOVT	R0, #hi_addr(_Delay_compressor_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1617 :: 		}
L_end_Delay_compressor_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_UPOnUp
_Delay_compressor_UPOnPress:
;Controller_events_code.c,1618 :: 		void Delay_compressor_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1621 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1622 :: 		Image317.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1623 :: 		Delay_compressor_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1624 :: 		DrawImage(&Image317);
MOVW	R0, #lo_addr(_Image317+0)
MOVT	R0, #hi_addr(_Image317+0)
BL	_DrawImage+0
;Controller_events_code.c,1627 :: 		system_reg[COMP_DEL]++;
MOVW	R1, #lo_addr(_system_reg+996)
MOVT	R1, #hi_addr(_system_reg+996)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1628 :: 		if (system_reg[COMP_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_compressor_UPOnPress163
;Controller_events_code.c,1629 :: 		system_reg[COMP_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+996)
MOVT	R0, #hi_addr(_system_reg+996)
STRH	R1, [R0, #0]
L_Delay_compressor_UPOnPress163:
;Controller_events_code.c,1630 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+996)
MOVT	R0, #hi_addr(_system_reg+996)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1631 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1632 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1633 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1634 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_compressor_UPOnPress164:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_UPOnPress164
NOP
NOP
NOP
;Controller_events_code.c,1635 :: 		}
L_end_Delay_compressor_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_UPOnPress
_Delay_compressor_SETOnUp:
;Controller_events_code.c,1636 :: 		void Delay_compressor_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1637 :: 		Delay_compressor_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1638 :: 		Image349.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1639 :: 		DrawImage (&Delay_compressor_SET);
MOVW	R0, #lo_addr(_Delay_compressor_SET+0)
MOVT	R0, #hi_addr(_Delay_compressor_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1640 :: 		}
L_end_Delay_compressor_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnUp
_Delay_compressor_SETOnDown:
;Controller_events_code.c,1641 :: 		void Delay_compressor_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1642 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1643 :: 		adressReg= COMP_DEL;
MOVW	R1, #498
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1644 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1645 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1646 :: 		send_data_packet(COMP_DEL,1);
MOVS	R1, #1
MOVW	R0, #498
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1647 :: 		Delay_compressor_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1648 :: 		Image349.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1649 :: 		DrawImage (&Image349);
MOVW	R0, #lo_addr(_Image349+0)
MOVT	R0, #hi_addr(_Image349+0)
BL	_DrawImage+0
;Controller_events_code.c,1650 :: 		}
L_end_Delay_compressor_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnDown
_Down_1_OnUp:
;Controller_events_code.c,1653 :: 		void Down_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1654 :: 		Image200.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1655 :: 		Down_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1656 :: 		DrawImage(&Down_1_);
MOVW	R0, #lo_addr(_Down_1_+0)
MOVT	R0, #hi_addr(_Down_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1657 :: 		}
L_end_Down_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_1_OnUp
_Down_1_OnPress:
;Controller_events_code.c,1658 :: 		void Down_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1660 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1661 :: 		Image200.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1662 :: 		Down_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1663 :: 		DrawImage(&Image200);
MOVW	R0, #lo_addr(_Image200+0)
MOVT	R0, #hi_addr(_Image200+0)
BL	_DrawImage+0
;Controller_events_code.c,1664 :: 		system_reg[HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1014)
MOVT	R1, #hi_addr(_system_reg+1014)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1665 :: 		if (system_reg[HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_1_OnPress166
;Controller_events_code.c,1666 :: 		system_reg[HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
STRH	R1, [R0, #0]
L_Down_1_OnPress166:
;Controller_events_code.c,1667 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1668 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1669 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1670 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1671 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_1_OnPress167:
SUBS	R7, R7, #1
BNE	L_Down_1_OnPress167
NOP
NOP
NOP
;Controller_events_code.c,1672 :: 		}
L_end_Down_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_1_OnPress
_Up_1_OnUp:
;Controller_events_code.c,1673 :: 		void Up_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1674 :: 		Image218.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1675 :: 		Up_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1676 :: 		DrawImage(&Up_1_);
MOVW	R0, #lo_addr(_Up_1_+0)
MOVT	R0, #hi_addr(_Up_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1677 :: 		}
L_end_Up_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_1_OnUp
_Up_1_OnPress:
;Controller_events_code.c,1678 :: 		void Up_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1680 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1681 :: 		Image218.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1682 :: 		Up_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1683 :: 		DrawImage(&Image218);
MOVW	R0, #lo_addr(_Image218+0)
MOVT	R0, #hi_addr(_Image218+0)
BL	_DrawImage+0
;Controller_events_code.c,1684 :: 		system_reg[HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1014)
MOVT	R1, #hi_addr(_system_reg+1014)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1685 :: 		if (system_reg[HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_1_OnPress169
;Controller_events_code.c,1686 :: 		system_reg[HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
STRH	R1, [R0, #0]
L_Up_1_OnPress169:
;Controller_events_code.c,1687 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1014)
MOVT	R0, #hi_addr(_system_reg+1014)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1688 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1689 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1690 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1691 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_1_OnPress170:
SUBS	R7, R7, #1
BNE	L_Up_1_OnPress170
NOP
NOP
NOP
;Controller_events_code.c,1692 :: 		}
L_end_Up_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_1_OnPress
_Down_2_OnUp:
;Controller_events_code.c,1693 :: 		void Down_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1694 :: 		Image205.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1695 :: 		Down_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1696 :: 		DrawImage(&Down_2_);
MOVW	R0, #lo_addr(_Down_2_+0)
MOVT	R0, #hi_addr(_Down_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1697 :: 		}
L_end_Down_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_2_OnUp
_Down_2_OnPress:
;Controller_events_code.c,1699 :: 		void Down_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1701 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1702 :: 		Image205.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1703 :: 		Down_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1704 :: 		DrawImage(&Image205);
MOVW	R0, #lo_addr(_Image205+0)
MOVT	R0, #hi_addr(_Image205+0)
BL	_DrawImage+0
;Controller_events_code.c,1706 :: 		system_reg[HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1012)
MOVT	R1, #hi_addr(_system_reg+1012)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1707 :: 		if (system_reg[HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_2_OnPress172
;Controller_events_code.c,1708 :: 		system_reg[HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1012)
MOVT	R0, #hi_addr(_system_reg+1012)
STRH	R1, [R0, #0]
L_Down_2_OnPress172:
;Controller_events_code.c,1709 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1012)
MOVT	R0, #hi_addr(_system_reg+1012)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1710 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1711 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1712 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1713 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_2_OnPress173:
SUBS	R7, R7, #1
BNE	L_Down_2_OnPress173
NOP
NOP
NOP
;Controller_events_code.c,1714 :: 		}
L_end_Down_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_2_OnPress
_Up_2_OnPress:
;Controller_events_code.c,1715 :: 		void Up_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1717 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1718 :: 		Image219.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1719 :: 		Up_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1720 :: 		DrawImage(&Image219);
MOVW	R0, #lo_addr(_Image219+0)
MOVT	R0, #hi_addr(_Image219+0)
BL	_DrawImage+0
;Controller_events_code.c,1722 :: 		system_reg[HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1012)
MOVT	R1, #hi_addr(_system_reg+1012)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1723 :: 		if (system_reg[HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_2_OnPress175
;Controller_events_code.c,1724 :: 		system_reg[HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1012)
MOVT	R0, #hi_addr(_system_reg+1012)
STRH	R1, [R0, #0]
L_Up_2_OnPress175:
;Controller_events_code.c,1725 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1012)
MOVT	R0, #hi_addr(_system_reg+1012)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1726 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1727 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1728 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1729 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_2_OnPress176:
SUBS	R7, R7, #1
BNE	L_Up_2_OnPress176
NOP
NOP
NOP
;Controller_events_code.c,1730 :: 		}
L_end_Up_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_2_OnPress
_Up_2_OnUp:
;Controller_events_code.c,1731 :: 		void Up_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1732 :: 		Image219.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1733 :: 		Up_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1734 :: 		DrawImage(&Up_2_);
MOVW	R0, #lo_addr(_Up_2_+0)
MOVT	R0, #hi_addr(_Up_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1735 :: 		}
L_end_Up_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_2_OnUp
_Down_3_OnPress:
;Controller_events_code.c,1737 :: 		void Down_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1739 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1740 :: 		Image206.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1741 :: 		Down_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1742 :: 		DrawImage(&Image206);
MOVW	R0, #lo_addr(_Image206+0)
MOVT	R0, #hi_addr(_Image206+0)
BL	_DrawImage+0
;Controller_events_code.c,1744 :: 		system_reg[EXAUST_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1024)
MOVT	R1, #hi_addr(_system_reg+1024)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1745 :: 		if (system_reg[EXAUST_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_3_OnPress178
;Controller_events_code.c,1746 :: 		system_reg[EXAUST_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1024)
MOVT	R0, #hi_addr(_system_reg+1024)
STRH	R1, [R0, #0]
L_Down_3_OnPress178:
;Controller_events_code.c,1747 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1024)
MOVT	R0, #hi_addr(_system_reg+1024)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1748 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1749 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1750 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1751 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_3_OnPress179:
SUBS	R7, R7, #1
BNE	L_Down_3_OnPress179
NOP
NOP
NOP
;Controller_events_code.c,1752 :: 		}
L_end_Down_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_3_OnPress
_Down_3_OnUp:
;Controller_events_code.c,1753 :: 		void Down_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1754 :: 		Image206.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1755 :: 		Down_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1756 :: 		DrawImage(&Down_3_);
MOVW	R0, #lo_addr(_Down_3_+0)
MOVT	R0, #hi_addr(_Down_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1757 :: 		}
L_end_Down_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_3_OnUp
_Up_3_OnPress:
;Controller_events_code.c,1758 :: 		void Up_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1760 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1761 :: 		Image220.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1762 :: 		Up_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1763 :: 		DrawImage(&Image220);
MOVW	R0, #lo_addr(_Image220+0)
MOVT	R0, #hi_addr(_Image220+0)
BL	_DrawImage+0
;Controller_events_code.c,1764 :: 		system_reg[EXAUST_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1024)
MOVT	R1, #hi_addr(_system_reg+1024)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1765 :: 		if(system_reg[EXAUST_MAX]>115)
CMP	R0, #115
IT	LE
BLE	L_Up_3_OnPress181
;Controller_events_code.c,1766 :: 		system_reg[EXAUST_MAX] = 115;
MOVS	R1, #115
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1024)
MOVT	R0, #hi_addr(_system_reg+1024)
STRH	R1, [R0, #0]
L_Up_3_OnPress181:
;Controller_events_code.c,1767 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1024)
MOVT	R0, #hi_addr(_system_reg+1024)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1768 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1769 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1770 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1771 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_3_OnPress182:
SUBS	R7, R7, #1
BNE	L_Up_3_OnPress182
NOP
NOP
NOP
;Controller_events_code.c,1772 :: 		}
L_end_Up_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_3_OnPress
_Up_3_OnUp:
;Controller_events_code.c,1773 :: 		void Up_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1774 :: 		Image220.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1775 :: 		Up_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1776 :: 		DrawImage(&Up_3_);
MOVW	R0, #lo_addr(_Up_3_+0)
MOVT	R0, #hi_addr(_Up_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1777 :: 		}
L_end_Up_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_3_OnUp
_Down_4_OnPress:
;Controller_events_code.c,1778 :: 		void Down_4_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1780 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1781 :: 		Image207.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1782 :: 		Down_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1783 :: 		DrawImage(&Image207);
MOVW	R0, #lo_addr(_Image207+0)
MOVT	R0, #hi_addr(_Image207+0)
BL	_DrawImage+0
;Controller_events_code.c,1785 :: 		system_reg[SOURS_MIN]--;
MOVW	R2, #lo_addr(_system_reg+1018)
MOVT	R2, #hi_addr(_system_reg+1018)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,1786 :: 		if (system_reg[SOURS_MIN] < -10)
MVN	R0, #9
CMP	R1, R0
IT	GE
BGE	L_Down_4_OnPress184
;Controller_events_code.c,1787 :: 		system_reg[SOURS_MIN] = -10;
MOVW	R1, #65526
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1018)
MOVT	R0, #hi_addr(_system_reg+1018)
STRH	R1, [R0, #0]
L_Down_4_OnPress184:
;Controller_events_code.c,1788 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1018)
MOVT	R0, #hi_addr(_system_reg+1018)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1789 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1790 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1791 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1792 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_4_OnPress185:
SUBS	R7, R7, #1
BNE	L_Down_4_OnPress185
NOP
NOP
NOP
;Controller_events_code.c,1793 :: 		}
L_end_Down_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_4_OnPress
_Up_4_OnPress:
;Controller_events_code.c,1794 :: 		void Up_4_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1796 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1797 :: 		Image221.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1798 :: 		Up_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1799 :: 		DrawImage(&Image221);
MOVW	R0, #lo_addr(_Image221+0)
MOVT	R0, #hi_addr(_Image221+0)
BL	_DrawImage+0
;Controller_events_code.c,1801 :: 		system_reg[SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1018)
MOVT	R1, #hi_addr(_system_reg+1018)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1802 :: 		if (system_reg[SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_4_OnPress187
;Controller_events_code.c,1803 :: 		system_reg[SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1018)
MOVT	R0, #hi_addr(_system_reg+1018)
STRH	R1, [R0, #0]
L_Up_4_OnPress187:
;Controller_events_code.c,1804 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1018)
MOVT	R0, #hi_addr(_system_reg+1018)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1805 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1806 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1807 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1808 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_4_OnPress188:
SUBS	R7, R7, #1
BNE	L_Up_4_OnPress188
NOP
NOP
NOP
;Controller_events_code.c,1810 :: 		}
L_end_Up_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_4_OnPress
_Down_4_OnUp:
;Controller_events_code.c,1811 :: 		void Down_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1812 :: 		Image207.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1813 :: 		Down_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1814 :: 		DrawImage(&Down_4_);
MOVW	R0, #lo_addr(_Down_4_+0)
MOVT	R0, #hi_addr(_Down_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1815 :: 		}
L_end_Down_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_4_OnUp
_Up_4_OnUp:
;Controller_events_code.c,1816 :: 		void Up_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1817 :: 		Image221.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1818 :: 		Up_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1819 :: 		DrawImage(&Up_4_);
MOVW	R0, #lo_addr(_Up_4_+0)
MOVT	R0, #hi_addr(_Up_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1820 :: 		}
L_end_Up_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_4_OnUp
_Down_5_OnUp:
;Controller_events_code.c,1821 :: 		void Down_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1822 :: 		Image208.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1823 :: 		Down_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1824 :: 		DrawImage(&Down_5_);
MOVW	R0, #lo_addr(_Down_5_+0)
MOVT	R0, #hi_addr(_Down_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,1825 :: 		}
L_end_Down_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_5_OnUp
_Down_5_OnPress:
;Controller_events_code.c,1826 :: 		void Down_5_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1828 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1829 :: 		Image208.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1830 :: 		Down_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1831 :: 		DrawImage(&Image208);
MOVW	R0, #lo_addr(_Image208+0)
MOVT	R0, #hi_addr(_Image208+0)
BL	_DrawImage+0
;Controller_events_code.c,1832 :: 		system_reg[SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1016)
MOVT	R1, #hi_addr(_system_reg+1016)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1833 :: 		if (system_reg[SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_5_OnPress190
;Controller_events_code.c,1834 :: 		system_reg[SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1016)
MOVT	R0, #hi_addr(_system_reg+1016)
STRH	R1, [R0, #0]
L_Down_5_OnPress190:
;Controller_events_code.c,1835 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1016)
MOVT	R0, #hi_addr(_system_reg+1016)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1836 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1837 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1838 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1839 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_5_OnPress191:
SUBS	R7, R7, #1
BNE	L_Down_5_OnPress191
NOP
NOP
NOP
;Controller_events_code.c,1840 :: 		}
L_end_Down_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_5_OnPress
_Up_5_OnPress:
;Controller_events_code.c,1841 :: 		void Up_5_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1843 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1844 :: 		Image222.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1845 :: 		Up_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1846 :: 		DrawImage(&Image222);
MOVW	R0, #lo_addr(_Image222+0)
MOVT	R0, #hi_addr(_Image222+0)
BL	_DrawImage+0
;Controller_events_code.c,1847 :: 		system_reg[SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1016)
MOVT	R1, #hi_addr(_system_reg+1016)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1848 :: 		if (system_reg[SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_5_OnPress193
;Controller_events_code.c,1849 :: 		system_reg[SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1016)
MOVT	R0, #hi_addr(_system_reg+1016)
STRH	R1, [R0, #0]
L_Up_5_OnPress193:
;Controller_events_code.c,1850 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1016)
MOVT	R0, #hi_addr(_system_reg+1016)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1851 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1852 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1853 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1854 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_5_OnPress194:
SUBS	R7, R7, #1
BNE	L_Up_5_OnPress194
NOP
NOP
NOP
;Controller_events_code.c,1855 :: 		}
L_end_Up_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_5_OnPress
_Up_5_OnUp:
;Controller_events_code.c,1856 :: 		void Up_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1857 :: 		Image222.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1858 :: 		Up_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1859 :: 		DrawImage(&Up_5_);
MOVW	R0, #lo_addr(_Up_5_+0)
MOVT	R0, #hi_addr(_Up_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,1860 :: 		}
L_end_Up_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_5_OnUp
_Down_6_OnPress:
;Controller_events_code.c,1861 :: 		void Down_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1863 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1864 :: 		Image209.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1865 :: 		Down_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1866 :: 		DrawImage(&Image209);
MOVW	R0, #lo_addr(_Image209+0)
MOVT	R0, #hi_addr(_Image209+0)
BL	_DrawImage+0
;Controller_events_code.c,1867 :: 		system_reg[DEL_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1044)
MOVT	R1, #hi_addr(_system_reg+1044)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1868 :: 		if (system_reg[DEL_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_6_OnPress196
;Controller_events_code.c,1869 :: 		system_reg[DEL_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1044)
MOVT	R0, #hi_addr(_system_reg+1044)
STRH	R1, [R0, #0]
L_Down_6_OnPress196:
;Controller_events_code.c,1870 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1044)
MOVT	R0, #hi_addr(_system_reg+1044)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1871 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1872 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1873 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1874 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_6_OnPress197:
SUBS	R7, R7, #1
BNE	L_Down_6_OnPress197
NOP
NOP
NOP
;Controller_events_code.c,1875 :: 		}
L_end_Down_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_6_OnPress
_Down_6_OnUp:
;Controller_events_code.c,1876 :: 		void Down_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1877 :: 		Image209.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1878 :: 		Down_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1879 :: 		DrawImage(&Down_6_);
MOVW	R0, #lo_addr(_Down_6_+0)
MOVT	R0, #hi_addr(_Down_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,1880 :: 		}
L_end_Down_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_6_OnUp
_Up_6_OnPress:
;Controller_events_code.c,1881 :: 		void Up_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1883 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1884 :: 		Image223.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1885 :: 		Up_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1886 :: 		DrawImage(&Image223);
MOVW	R0, #lo_addr(_Image223+0)
MOVT	R0, #hi_addr(_Image223+0)
BL	_DrawImage+0
;Controller_events_code.c,1887 :: 		system_reg[DEL_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1044)
MOVT	R1, #hi_addr(_system_reg+1044)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1888 :: 		if (system_reg[DEL_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_6_OnPress199
;Controller_events_code.c,1889 :: 		system_reg[DEL_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1044)
MOVT	R0, #hi_addr(_system_reg+1044)
STRH	R1, [R0, #0]
L_Up_6_OnPress199:
;Controller_events_code.c,1890 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1044)
MOVT	R0, #hi_addr(_system_reg+1044)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1891 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1892 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1893 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1894 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_6_OnPress200:
SUBS	R7, R7, #1
BNE	L_Up_6_OnPress200
NOP
NOP
NOP
;Controller_events_code.c,1895 :: 		}
L_end_Up_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_6_OnPress
_Up_6_OnUp:
;Controller_events_code.c,1896 :: 		void Up_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1897 :: 		Image223.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1898 :: 		Up_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1899 :: 		DrawImage(&Up_6_);
MOVW	R0, #lo_addr(_Up_6_+0)
MOVT	R0, #hi_addr(_Up_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,1900 :: 		}
L_end_Up_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_6_OnUp
_Set_1_OnDown:
;Controller_events_code.c,1901 :: 		void Set_1_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1902 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1903 :: 		adressReg= HEAT_MIN;
MOVW	R1, #507
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1904 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1905 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1906 :: 		send_data_packet(HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #507
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1907 :: 		Set_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1908 :: 		Image246.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1909 :: 		DrawImage (&Image246);
MOVW	R0, #lo_addr(_Image246+0)
MOVT	R0, #hi_addr(_Image246+0)
BL	_DrawImage+0
;Controller_events_code.c,1910 :: 		}
L_end_Set_1_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnDown
_Set_1_OnUp:
;Controller_events_code.c,1911 :: 		void Set_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1912 :: 		Set_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1913 :: 		Image246.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1914 :: 		DrawImage (&Set_1_);
MOVW	R0, #lo_addr(_Set_1_+0)
MOVT	R0, #hi_addr(_Set_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1915 :: 		}
L_end_Set_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnUp
_Set_2_OnDown:
;Controller_events_code.c,1916 :: 		void Set_2_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1917 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1918 :: 		adressReg= HEAT_MAX;
MOVW	R1, #506
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1919 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1920 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1921 :: 		send_data_packet(HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #506
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1922 :: 		Set_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1923 :: 		Image247.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1924 :: 		DrawImage (&Image247);
MOVW	R0, #lo_addr(_Image247+0)
MOVT	R0, #hi_addr(_Image247+0)
BL	_DrawImage+0
;Controller_events_code.c,1925 :: 		}
L_end_Set_2_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnDown
_Set_2_OnUp:
;Controller_events_code.c,1926 :: 		void Set_2_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1927 :: 		Set_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1928 :: 		Image247.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1929 :: 		DrawImage (&Set_2_);
MOVW	R0, #lo_addr(_Set_2_+0)
MOVT	R0, #hi_addr(_Set_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1930 :: 		}
L_end_Set_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnUp
_Set_3_OnDown:
;Controller_events_code.c,1932 :: 		void Set_3_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1933 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1934 :: 		adressReg= EXAUST_MAX;
MOVW	R1, #512
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1935 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1936 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1937 :: 		send_data_packet(EXAUST_MAX,1);
MOVS	R1, #1
MOVW	R0, #512
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1938 :: 		Set_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1939 :: 		Image248.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1940 :: 		DrawImage (&Image248);
MOVW	R0, #lo_addr(_Image248+0)
MOVT	R0, #hi_addr(_Image248+0)
BL	_DrawImage+0
;Controller_events_code.c,1941 :: 		}
L_end_Set_3_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnDown
_Set_3_OnUp:
;Controller_events_code.c,1942 :: 		void Set_3_OnUp()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1943 :: 		Set_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1944 :: 		Image248.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1945 :: 		DrawImage (&Set_3_);
MOVW	R0, #lo_addr(_Set_3_+0)
MOVT	R0, #hi_addr(_Set_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1946 :: 		}
L_end_Set_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnUp
_Set_4_OnDown:
;Controller_events_code.c,1947 :: 		void Set_4_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1948 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1949 :: 		adressReg= SOURS_MIN;
MOVW	R1, #509
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1950 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1951 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1952 :: 		send_data_packet(SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #509
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1953 :: 		Set_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1954 :: 		Image249.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1955 :: 		DrawImage (&Image249);
MOVW	R0, #lo_addr(_Image249+0)
MOVT	R0, #hi_addr(_Image249+0)
BL	_DrawImage+0
;Controller_events_code.c,1956 :: 		}
L_end_Set_4_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnDown
_Set_4_OnUp:
;Controller_events_code.c,1958 :: 		void Set_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1959 :: 		Set_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1960 :: 		Image249.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1961 :: 		DrawImage (&Set_4_);
MOVW	R0, #lo_addr(_Set_4_+0)
MOVT	R0, #hi_addr(_Set_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1962 :: 		}
L_end_Set_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnUp
_Set_5_OnDown:
;Controller_events_code.c,1964 :: 		void Set_5_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1965 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1966 :: 		adressReg= SOURS_MAX;
MOVW	R1, #508
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1967 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1968 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1969 :: 		send_data_packet(SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #508
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1970 :: 		Set_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1971 :: 		Image250.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1972 :: 		DrawImage (&Image250);
MOVW	R0, #lo_addr(_Image250+0)
MOVT	R0, #hi_addr(_Image250+0)
BL	_DrawImage+0
;Controller_events_code.c,1973 :: 		}
L_end_Set_5_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnDown
_Set_5_OnUp:
;Controller_events_code.c,1974 :: 		void Set_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1975 :: 		Set_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1976 :: 		Image250.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1977 :: 		DrawImage (&Set_5_);
MOVW	R0, #lo_addr(_Set_5_+0)
MOVT	R0, #hi_addr(_Set_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,1978 :: 		}
L_end_Set_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnUp
_Furnance_HP_OFF_save_ondown:
;Controller_events_code.c,1979 :: 		void Furnance_HP_OFF_save_ondown() {
;Controller_events_code.c,1981 :: 		}
L_end_Furnance_HP_OFF_save_ondown:
BX	LR
; end of _Furnance_HP_OFF_save_ondown
_Set_6_OnUp:
;Controller_events_code.c,1982 :: 		void Set_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1983 :: 		Set_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1984 :: 		Image251.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1985 :: 		DrawImage (&Set_6_);
MOVW	R0, #lo_addr(_Set_6_+0)
MOVT	R0, #hi_addr(_Set_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,1986 :: 		}
L_end_Set_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnUp
_Set_6_OnDown:
;Controller_events_code.c,1987 :: 		void Set_6_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1988 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1989 :: 		adressReg= DEL_HEAT_MIN;
MOVW	R1, #522
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1990 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1991 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1992 :: 		send_data_packet(DEL_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #522
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1993 :: 		Set_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1994 :: 		Image251.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1995 :: 		DrawImage (&Image251);
MOVW	R0, #lo_addr(_Image251+0)
MOVT	R0, #hi_addr(_Image251+0)
BL	_DrawImage+0
;Controller_events_code.c,1996 :: 		}
L_end_Set_6_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnDown
_Down_7_OnUp:
;Controller_events_code.c,1998 :: 		void Down_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1999 :: 		Image210.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2000 :: 		Down_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2001 :: 		DrawImage(&Down_7_);
MOVW	R0, #lo_addr(_Down_7_+0)
MOVT	R0, #hi_addr(_Down_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2002 :: 		}
L_end_Down_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_7_OnUp
_Down_7_OnPress:
;Controller_events_code.c,2003 :: 		void Down_7_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2005 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2006 :: 		Image210.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2007 :: 		Down_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2008 :: 		DrawImage(&Image210);
MOVW	R0, #lo_addr(_Image210+0)
MOVT	R0, #hi_addr(_Image210+0)
BL	_DrawImage+0
;Controller_events_code.c,2009 :: 		system_reg[DEL_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1042)
MOVT	R1, #hi_addr(_system_reg+1042)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2010 :: 		if (system_reg[DEL_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_7_OnPress202
;Controller_events_code.c,2011 :: 		system_reg[DEL_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1042)
MOVT	R0, #hi_addr(_system_reg+1042)
STRH	R1, [R0, #0]
L_Down_7_OnPress202:
;Controller_events_code.c,2012 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1042)
MOVT	R0, #hi_addr(_system_reg+1042)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2013 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2014 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2015 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2016 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_7_OnPress203:
SUBS	R7, R7, #1
BNE	L_Down_7_OnPress203
NOP
NOP
NOP
;Controller_events_code.c,2017 :: 		}
L_end_Down_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_7_OnPress
_Up_7_OnPress:
;Controller_events_code.c,2019 :: 		void Up_7_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2021 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2022 :: 		Image224.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2023 :: 		Up_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2024 :: 		DrawImage(&Image224);
MOVW	R0, #lo_addr(_Image224+0)
MOVT	R0, #hi_addr(_Image224+0)
BL	_DrawImage+0
;Controller_events_code.c,2025 :: 		system_reg[DEL_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1042)
MOVT	R1, #hi_addr(_system_reg+1042)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2026 :: 		if (system_reg[DEL_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_7_OnPress205
;Controller_events_code.c,2027 :: 		system_reg[DEL_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1042)
MOVT	R0, #hi_addr(_system_reg+1042)
STRH	R1, [R0, #0]
L_Up_7_OnPress205:
;Controller_events_code.c,2028 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1042)
MOVT	R0, #hi_addr(_system_reg+1042)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2029 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2030 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2031 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2032 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_7_OnPress206:
SUBS	R7, R7, #1
BNE	L_Up_7_OnPress206
NOP
NOP
NOP
;Controller_events_code.c,2034 :: 		}
L_end_Up_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_7_OnPress
_Up_7_OnUp:
;Controller_events_code.c,2036 :: 		void Up_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2037 :: 		Image224.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2038 :: 		Up_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2039 :: 		DrawImage(&Up_7_);
MOVW	R0, #lo_addr(_Up_7_+0)
MOVT	R0, #hi_addr(_Up_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2041 :: 		}
L_end_Up_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_7_OnUp
_Down_8_OnPress:
;Controller_events_code.c,2043 :: 		void Down_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2045 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2046 :: 		Image211.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2047 :: 		Down_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2048 :: 		DrawImage(&Image211);
MOVW	R0, #lo_addr(_Image211+0)
MOVT	R0, #hi_addr(_Image211+0)
BL	_DrawImage+0
;Controller_events_code.c,2049 :: 		system_reg[DEL_DHW_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1010)
MOVT	R1, #hi_addr(_system_reg+1010)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2050 :: 		if (system_reg[DEL_DHW_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_8_OnPress208
;Controller_events_code.c,2051 :: 		system_reg[DEL_DHW_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1010)
MOVT	R0, #hi_addr(_system_reg+1010)
STRH	R1, [R0, #0]
L_Down_8_OnPress208:
;Controller_events_code.c,2052 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1010)
MOVT	R0, #hi_addr(_system_reg+1010)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2053 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2054 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2055 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2056 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_8_OnPress209:
SUBS	R7, R7, #1
BNE	L_Down_8_OnPress209
NOP
NOP
NOP
;Controller_events_code.c,2057 :: 		}
L_end_Down_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_8_OnPress
_Down_8_OnUp:
;Controller_events_code.c,2059 :: 		void Down_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2060 :: 		Image211.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2061 :: 		Down_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2062 :: 		DrawImage(&Down_8_);
MOVW	R0, #lo_addr(_Down_8_+0)
MOVT	R0, #hi_addr(_Down_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2063 :: 		}
L_end_Down_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_8_OnUp
_Up_8_OnPress:
;Controller_events_code.c,2065 :: 		void Up_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2067 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2068 :: 		Image225.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2069 :: 		Up_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2070 :: 		DrawImage(&Image225);
MOVW	R0, #lo_addr(_Image225+0)
MOVT	R0, #hi_addr(_Image225+0)
BL	_DrawImage+0
;Controller_events_code.c,2071 :: 		system_reg[DEL_DHW_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1010)
MOVT	R1, #hi_addr(_system_reg+1010)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2072 :: 		if (system_reg[DEL_DHW_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_8_OnPress211
;Controller_events_code.c,2073 :: 		system_reg[DEL_DHW_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1010)
MOVT	R0, #hi_addr(_system_reg+1010)
STRH	R1, [R0, #0]
L_Up_8_OnPress211:
;Controller_events_code.c,2074 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1010)
MOVT	R0, #hi_addr(_system_reg+1010)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2075 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2076 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2077 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2078 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_8_OnPress212:
SUBS	R7, R7, #1
BNE	L_Up_8_OnPress212
NOP
NOP
NOP
;Controller_events_code.c,2079 :: 		}
L_end_Up_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_8_OnPress
_Up_8_OnUp:
;Controller_events_code.c,2081 :: 		void Up_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2082 :: 		Image225.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2083 :: 		Up_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2084 :: 		DrawImage(&Up_8_);
MOVW	R0, #lo_addr(_Up_8_+0)
MOVT	R0, #hi_addr(_Up_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2085 :: 		}
L_end_Up_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_8_OnUp
_Down_9_OnPress:
;Controller_events_code.c,2087 :: 		void Down_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2089 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2090 :: 		Image214.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2091 :: 		Down_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2092 :: 		DrawImage(&Image214);
MOVW	R0, #lo_addr(_Image214+0)
MOVT	R0, #hi_addr(_Image214+0)
BL	_DrawImage+0
;Controller_events_code.c,2093 :: 		system_reg[DEL_DHW_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1008)
MOVT	R1, #hi_addr(_system_reg+1008)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2094 :: 		if (system_reg[DEL_DHW_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_9_OnPress214
;Controller_events_code.c,2095 :: 		system_reg[DEL_DHW_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1008)
MOVT	R0, #hi_addr(_system_reg+1008)
STRH	R1, [R0, #0]
L_Down_9_OnPress214:
;Controller_events_code.c,2096 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1008)
MOVT	R0, #hi_addr(_system_reg+1008)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2097 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2098 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2099 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2100 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_9_OnPress215:
SUBS	R7, R7, #1
BNE	L_Down_9_OnPress215
NOP
NOP
NOP
;Controller_events_code.c,2101 :: 		}
L_end_Down_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_9_OnPress
_Down_9_OnUp:
;Controller_events_code.c,2103 :: 		void Down_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2104 :: 		Image214.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2105 :: 		Down_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2106 :: 		DrawImage(&Down_9_);
MOVW	R0, #lo_addr(_Down_9_+0)
MOVT	R0, #hi_addr(_Down_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2107 :: 		}
L_end_Down_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_9_OnUp
_Up_9_OnPress:
;Controller_events_code.c,2109 :: 		void Up_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2111 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2112 :: 		Image228.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2113 :: 		Up_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2114 :: 		DrawImage(&Image228);
MOVW	R0, #lo_addr(_Image228+0)
MOVT	R0, #hi_addr(_Image228+0)
BL	_DrawImage+0
;Controller_events_code.c,2115 :: 		system_reg[DEL_DHW_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1008)
MOVT	R1, #hi_addr(_system_reg+1008)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2116 :: 		if (system_reg[DEL_DHW_MAX] > 99)
CMP	R0, #99
IT	LE
BLE	L_Up_9_OnPress217
;Controller_events_code.c,2117 :: 		system_reg[DEL_DHW_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1008)
MOVT	R0, #hi_addr(_system_reg+1008)
STRH	R1, [R0, #0]
L_Up_9_OnPress217:
;Controller_events_code.c,2118 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1008)
MOVT	R0, #hi_addr(_system_reg+1008)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2119 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2120 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2121 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2122 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_9_OnPress218:
SUBS	R7, R7, #1
BNE	L_Up_9_OnPress218
NOP
NOP
NOP
;Controller_events_code.c,2123 :: 		}
L_end_Up_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_9_OnPress
_Up_9_OnUp:
;Controller_events_code.c,2125 :: 		void Up_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2126 :: 		Image228.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2127 :: 		Up_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2128 :: 		DrawImage(&Up_9_);
MOVW	R0, #lo_addr(_Up_9_+0)
MOVT	R0, #hi_addr(_Up_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2129 :: 		}
L_end_Up_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_9_OnUp
_Down_10_OnPress:
;Controller_events_code.c,2130 :: 		void Down_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2132 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2133 :: 		Image212.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2134 :: 		Down_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2135 :: 		DrawImage(&Image212);
MOVW	R0, #lo_addr(_Image212+0)
MOVT	R0, #hi_addr(_Image212+0)
BL	_DrawImage+0
;Controller_events_code.c,2136 :: 		system_reg[DEL_SOURS_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1048)
MOVT	R1, #hi_addr(_system_reg+1048)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2137 :: 		if (system_reg[DEL_SOURS_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_10_OnPress220
;Controller_events_code.c,2138 :: 		system_reg[DEL_SOURS_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1048)
MOVT	R0, #hi_addr(_system_reg+1048)
STRH	R1, [R0, #0]
L_Down_10_OnPress220:
;Controller_events_code.c,2139 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1048)
MOVT	R0, #hi_addr(_system_reg+1048)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2140 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2141 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2142 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2143 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_10_OnPress221:
SUBS	R7, R7, #1
BNE	L_Down_10_OnPress221
NOP
NOP
NOP
;Controller_events_code.c,2144 :: 		}
L_end_Down_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_10_OnPress
_Down_10_OnUp:
;Controller_events_code.c,2146 :: 		void Down_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2147 :: 		Image212.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2148 :: 		Down_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2149 :: 		DrawImage(&Down_10_);
MOVW	R0, #lo_addr(_Down_10_+0)
MOVT	R0, #hi_addr(_Down_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2150 :: 		}
L_end_Down_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_10_OnUp
_Up_10_OnPress:
;Controller_events_code.c,2152 :: 		void Up_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2154 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2155 :: 		Image226.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2156 :: 		Up_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2157 :: 		DrawImage(&Image226);
MOVW	R0, #lo_addr(_Image226+0)
MOVT	R0, #hi_addr(_Image226+0)
BL	_DrawImage+0
;Controller_events_code.c,2158 :: 		system_reg[DEL_SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1048)
MOVT	R1, #hi_addr(_system_reg+1048)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2159 :: 		if (system_reg[DEL_SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_10_OnPress223
;Controller_events_code.c,2160 :: 		system_reg[DEL_SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1048)
MOVT	R0, #hi_addr(_system_reg+1048)
STRH	R1, [R0, #0]
L_Up_10_OnPress223:
;Controller_events_code.c,2161 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1048)
MOVT	R0, #hi_addr(_system_reg+1048)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2162 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2163 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2164 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2165 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_10_OnPress224:
SUBS	R7, R7, #1
BNE	L_Up_10_OnPress224
NOP
NOP
NOP
;Controller_events_code.c,2166 :: 		}
L_end_Up_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_10_OnPress
_Up_10_OnUp:
;Controller_events_code.c,2168 :: 		void Up_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2169 :: 		Image226.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2170 :: 		Up_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2171 :: 		DrawImage(&Up_10_);
MOVW	R0, #lo_addr(_Up_10_+0)
MOVT	R0, #hi_addr(_Up_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2172 :: 		}
L_end_Up_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_10_OnUp
_Down_11_OnPress:
;Controller_events_code.c,2173 :: 		void Down_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2175 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2176 :: 		Image213.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2177 :: 		Down_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2178 :: 		DrawImage(&Image213);
MOVW	R0, #lo_addr(_Image213+0)
MOVT	R0, #hi_addr(_Image213+0)
BL	_DrawImage+0
;Controller_events_code.c,2179 :: 		system_reg[DEL_SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1046)
MOVT	R1, #hi_addr(_system_reg+1046)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2180 :: 		if (system_reg[DEL_SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_11_OnPress226
;Controller_events_code.c,2181 :: 		system_reg[DEL_SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1046)
MOVT	R0, #hi_addr(_system_reg+1046)
STRH	R1, [R0, #0]
L_Down_11_OnPress226:
;Controller_events_code.c,2182 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1046)
MOVT	R0, #hi_addr(_system_reg+1046)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2183 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2184 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2185 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2186 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_11_OnPress227:
SUBS	R7, R7, #1
BNE	L_Down_11_OnPress227
NOP
NOP
NOP
;Controller_events_code.c,2187 :: 		}
L_end_Down_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_11_OnPress
_Down_11_OnUp:
;Controller_events_code.c,2189 :: 		void Down_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2190 :: 		Image213.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2191 :: 		Down_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2192 :: 		DrawImage(&Down_11_);
MOVW	R0, #lo_addr(_Down_11_+0)
MOVT	R0, #hi_addr(_Down_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2194 :: 		}
L_end_Down_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_11_OnUp
_Up_11_OnPress:
;Controller_events_code.c,2196 :: 		void Up_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2198 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2199 :: 		Image227.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2200 :: 		Up_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2201 :: 		DrawImage(&Image227);
MOVW	R0, #lo_addr(_Image227+0)
MOVT	R0, #hi_addr(_Image227+0)
BL	_DrawImage+0
;Controller_events_code.c,2202 :: 		system_reg[DEL_SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1046)
MOVT	R1, #hi_addr(_system_reg+1046)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2203 :: 		if (system_reg[DEL_SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_11_OnPress229
;Controller_events_code.c,2204 :: 		system_reg[DEL_SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1046)
MOVT	R0, #hi_addr(_system_reg+1046)
STRH	R1, [R0, #0]
L_Up_11_OnPress229:
;Controller_events_code.c,2205 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1046)
MOVT	R0, #hi_addr(_system_reg+1046)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2206 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2207 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2208 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2209 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_11_OnPress230:
SUBS	R7, R7, #1
BNE	L_Up_11_OnPress230
NOP
NOP
NOP
;Controller_events_code.c,2210 :: 		}
L_end_Up_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_11_OnPress
_Up_11_OnUp:
;Controller_events_code.c,2212 :: 		void Up_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2213 :: 		Image227.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2214 :: 		Up_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2215 :: 		DrawImage(&Up_11_);
MOVW	R0, #lo_addr(_Up_11_+0)
MOVT	R0, #hi_addr(_Up_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2216 :: 		}
L_end_Up_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_11_OnUp
_Down_12_OnPress:
;Controller_events_code.c,2221 :: 		void Down_12_OnPress() {
;Controller_events_code.c,2223 :: 		}
L_end_Down_12_OnPress:
BX	LR
; end of _Down_12_OnPress
_Down_12_OnUp:
;Controller_events_code.c,2225 :: 		void Down_12_OnUp() {
;Controller_events_code.c,2227 :: 		}
L_end_Down_12_OnUp:
BX	LR
; end of _Down_12_OnUp
_Up_12_OnPress:
;Controller_events_code.c,2229 :: 		void Up_12_OnPress() {
;Controller_events_code.c,2231 :: 		}
L_end_Up_12_OnPress:
BX	LR
; end of _Up_12_OnPress
_Up_12_OnUp:
;Controller_events_code.c,2233 :: 		void Up_12_OnUp() {
;Controller_events_code.c,2235 :: 		}
L_end_Up_12_OnUp:
BX	LR
; end of _Up_12_OnUp
_Set_7_OnUp:
;Controller_events_code.c,2236 :: 		void Set_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2237 :: 		Set_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2238 :: 		Image252.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2239 :: 		DrawImage (&Set_7_);
MOVW	R0, #lo_addr(_Set_7_+0)
MOVT	R0, #hi_addr(_Set_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2240 :: 		}
L_end_Set_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnUp
_Set_7_OnDown:
;Controller_events_code.c,2241 :: 		void Set_7_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2242 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2243 :: 		adressReg= DEL_HEAT_MAX;
MOVW	R1, #521
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2244 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2245 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2246 :: 		send_data_packet(DEL_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #521
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2247 :: 		Set_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2248 :: 		Image252.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2249 :: 		DrawImage (&Image252);
MOVW	R0, #lo_addr(_Image252+0)
MOVT	R0, #hi_addr(_Image252+0)
BL	_DrawImage+0
;Controller_events_code.c,2250 :: 		}
L_end_Set_7_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnDown
_Set_8_OnDown:
;Controller_events_code.c,2252 :: 		void Set_8_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2253 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2254 :: 		adressReg= DEL_DHW_MIN;
MOVW	R1, #505
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2255 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2256 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2257 :: 		send_data_packet(DEL_DHW_MIN,1);
MOVS	R1, #1
MOVW	R0, #505
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2258 :: 		Set_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2259 :: 		Image253.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2260 :: 		DrawImage (&Image253);
MOVW	R0, #lo_addr(_Image253+0)
MOVT	R0, #hi_addr(_Image253+0)
BL	_DrawImage+0
;Controller_events_code.c,2261 :: 		}
L_end_Set_8_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnDown
_Set_8_OnUp:
;Controller_events_code.c,2263 :: 		void Set_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2264 :: 		Set_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2265 :: 		Image253.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2266 :: 		DrawImage (&Set_8_);
MOVW	R0, #lo_addr(_Set_8_+0)
MOVT	R0, #hi_addr(_Set_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2267 :: 		}
L_end_Set_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnUp
_Set_9_OnUp:
;Controller_events_code.c,2269 :: 		void Set_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2270 :: 		Set_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2271 :: 		Image256.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2272 :: 		DrawImage (&Set_9_);
MOVW	R0, #lo_addr(_Set_9_+0)
MOVT	R0, #hi_addr(_Set_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2273 :: 		}
L_end_Set_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnUp
_Set_9_OnDown:
;Controller_events_code.c,2274 :: 		void Set_9_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2275 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2276 :: 		adressReg= DEL_DHW_MAX;
MOVW	R1, #504
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2277 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2278 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2279 :: 		send_data_packet(DEL_DHW_MAX,1);
MOVS	R1, #1
MOVW	R0, #504
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2280 :: 		Set_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2281 :: 		Image256.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2282 :: 		DrawImage (&Image256);
MOVW	R0, #lo_addr(_Image256+0)
MOVT	R0, #hi_addr(_Image256+0)
BL	_DrawImage+0
;Controller_events_code.c,2283 :: 		}
L_end_Set_9_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnDown
_Set_10_OnDown:
;Controller_events_code.c,2284 :: 		void Set_10_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2285 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2286 :: 		adressReg= DEL_SOURS_MIN;
MOVW	R1, #524
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2287 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2288 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2289 :: 		send_data_packet(DEL_SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #524
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2290 :: 		Set_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2291 :: 		Image254.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2292 :: 		DrawImage (&Image254);
MOVW	R0, #lo_addr(_Image254+0)
MOVT	R0, #hi_addr(_Image254+0)
BL	_DrawImage+0
;Controller_events_code.c,2293 :: 		}
L_end_Set_10_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnDown
_Set_10_OnUp:
;Controller_events_code.c,2295 :: 		void Set_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2296 :: 		Set_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2297 :: 		Image254.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2298 :: 		DrawImage (&Set_10_);
MOVW	R0, #lo_addr(_Set_10_+0)
MOVT	R0, #hi_addr(_Set_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2299 :: 		}
L_end_Set_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnUp
_Set_11_OnDown:
;Controller_events_code.c,2300 :: 		void Set_11_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2301 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2302 :: 		adressReg= DEL_SOURS_MAX;
MOVW	R1, #523
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2303 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2304 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2305 :: 		send_data_packet(DEL_SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #523
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2306 :: 		Set_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2307 :: 		Image255.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2308 :: 		DrawImage (&Image255);
MOVW	R0, #lo_addr(_Image255+0)
MOVT	R0, #hi_addr(_Image255+0)
BL	_DrawImage+0
;Controller_events_code.c,2309 :: 		}
L_end_Set_11_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnDown
_Set_11_OnUp:
;Controller_events_code.c,2310 :: 		void Set_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2311 :: 		Set_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2312 :: 		Image255.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2313 :: 		DrawImage (&Set_11_);
MOVW	R0, #lo_addr(_Set_11_+0)
MOVT	R0, #hi_addr(_Set_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2314 :: 		}
L_end_Set_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnUp
_Set_12_OnDown:
;Controller_events_code.c,2316 :: 		void Set_12_OnDown() {
;Controller_events_code.c,2318 :: 		}
L_end_Set_12_OnDown:
BX	LR
; end of _Set_12_OnDown
_Set_12_OnUp:
;Controller_events_code.c,2319 :: 		void Set_12_OnUp() {
;Controller_events_code.c,2321 :: 		}
L_end_Set_12_OnUp:
BX	LR
; end of _Set_12_OnUp
_Down_19_OnPress:
;Controller_events_code.c,2325 :: 		void Down_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2327 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2328 :: 		Image243.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2329 :: 		Down_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2330 :: 		DrawImage(&Image243);
MOVW	R0, #lo_addr(_Image243+0)
MOVT	R0, #hi_addr(_Image243+0)
BL	_DrawImage+0
;Controller_events_code.c,2331 :: 		system_reg[S_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1028)
MOVT	R1, #hi_addr(_system_reg+1028)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2332 :: 		if (system_reg[S_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_19_OnPress232
;Controller_events_code.c,2333 :: 		system_reg[S_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1028)
MOVT	R0, #hi_addr(_system_reg+1028)
STRH	R1, [R0, #0]
L_Down_19_OnPress232:
;Controller_events_code.c,2334 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1028)
MOVT	R0, #hi_addr(_system_reg+1028)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2335 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2336 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2337 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2338 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_19_OnPress233:
SUBS	R7, R7, #1
BNE	L_Down_19_OnPress233
NOP
NOP
NOP
;Controller_events_code.c,2339 :: 		}
L_end_Down_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_19_OnPress
_Down_19_OnUp:
;Controller_events_code.c,2340 :: 		void Down_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2341 :: 		Image243.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2342 :: 		Down_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2343 :: 		DrawImage(&Down_19_);
MOVW	R0, #lo_addr(_Down_19_+0)
MOVT	R0, #hi_addr(_Down_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2344 :: 		}
L_end_Down_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_19_OnUp
_Up_19_OnPress:
;Controller_events_code.c,2345 :: 		void Up_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2347 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2348 :: 		Image236.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2349 :: 		Up_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2350 :: 		DrawImage(&Image236);
MOVW	R0, #lo_addr(_Image236+0)
MOVT	R0, #hi_addr(_Image236+0)
BL	_DrawImage+0
;Controller_events_code.c,2351 :: 		system_reg[S_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1028)
MOVT	R1, #hi_addr(_system_reg+1028)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2352 :: 		if (system_reg[S_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_19_OnPress235
;Controller_events_code.c,2353 :: 		system_reg[S_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1028)
MOVT	R0, #hi_addr(_system_reg+1028)
STRH	R1, [R0, #0]
L_Up_19_OnPress235:
;Controller_events_code.c,2354 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1028)
MOVT	R0, #hi_addr(_system_reg+1028)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2355 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2356 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2357 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2358 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_19_OnPress236:
SUBS	R7, R7, #1
BNE	L_Up_19_OnPress236
NOP
NOP
NOP
;Controller_events_code.c,2359 :: 		}
L_end_Up_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_19_OnPress
_Up_19_OnUp:
;Controller_events_code.c,2360 :: 		void Up_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2361 :: 		Image236.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2362 :: 		Up_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2363 :: 		DrawImage(&Up_19_);
MOVW	R0, #lo_addr(_Up_19_+0)
MOVT	R0, #hi_addr(_Up_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2364 :: 		}
L_end_Up_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_19_OnUp
_Down_20_OnPress:
;Controller_events_code.c,2365 :: 		void Down_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2367 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2368 :: 		Image244.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2369 :: 		Down_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2370 :: 		DrawImage(&Image244);
MOVW	R0, #lo_addr(_Image244+0)
MOVT	R0, #hi_addr(_Image244+0)
BL	_DrawImage+0
;Controller_events_code.c,2371 :: 		system_reg[S_COOL_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1030)
MOVT	R1, #hi_addr(_system_reg+1030)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2372 :: 		if (system_reg[S_COOL_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_20_OnPress238
;Controller_events_code.c,2373 :: 		system_reg[S_COOL_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1030)
MOVT	R0, #hi_addr(_system_reg+1030)
STRH	R1, [R0, #0]
L_Down_20_OnPress238:
;Controller_events_code.c,2374 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1030)
MOVT	R0, #hi_addr(_system_reg+1030)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2375 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2376 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2377 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2378 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_20_OnPress239:
SUBS	R7, R7, #1
BNE	L_Down_20_OnPress239
NOP
NOP
NOP
;Controller_events_code.c,2379 :: 		}
L_end_Down_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_20_OnPress
_Down_20_OnUp:
;Controller_events_code.c,2380 :: 		void Down_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2381 :: 		Image244.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2382 :: 		Down_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2383 :: 		DrawImage(&Down_20_);
MOVW	R0, #lo_addr(_Down_20_+0)
MOVT	R0, #hi_addr(_Down_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2384 :: 		}
L_end_Down_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_20_OnUp
_Up_20_OnPress:
;Controller_events_code.c,2385 :: 		void Up_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2387 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2388 :: 		Image237.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2389 :: 		Up_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2390 :: 		DrawImage(&Image237);
MOVW	R0, #lo_addr(_Image237+0)
MOVT	R0, #hi_addr(_Image237+0)
BL	_DrawImage+0
;Controller_events_code.c,2391 :: 		system_reg[S_COOL_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1030)
MOVT	R1, #hi_addr(_system_reg+1030)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2392 :: 		if (system_reg[S_COOL_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_20_OnPress241
;Controller_events_code.c,2393 :: 		system_reg[S_COOL_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1030)
MOVT	R0, #hi_addr(_system_reg+1030)
STRH	R1, [R0, #0]
L_Up_20_OnPress241:
;Controller_events_code.c,2394 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1030)
MOVT	R0, #hi_addr(_system_reg+1030)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2395 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2396 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2397 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2398 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_20_OnPress242:
SUBS	R7, R7, #1
BNE	L_Up_20_OnPress242
NOP
NOP
NOP
;Controller_events_code.c,2399 :: 		}
L_end_Up_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_20_OnPress
_Up_20_OnUp:
;Controller_events_code.c,2400 :: 		void Up_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2401 :: 		Image237.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2402 :: 		Up_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2403 :: 		DrawImage(&Up_20_);
MOVW	R0, #lo_addr(_Up_20_+0)
MOVT	R0, #hi_addr(_Up_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2404 :: 		}
L_end_Up_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_20_OnUp
_Down_21_OnPress:
;Controller_events_code.c,2405 :: 		void Down_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2407 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2408 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2409 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2410 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2411 :: 		system_reg[S_COOL_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1032)
MOVT	R1, #hi_addr(_system_reg+1032)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2412 :: 		if (system_reg[S_COOL_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_21_OnPress244
;Controller_events_code.c,2413 :: 		system_reg[S_COOL_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1032)
MOVT	R0, #hi_addr(_system_reg+1032)
STRH	R1, [R0, #0]
L_Down_21_OnPress244:
;Controller_events_code.c,2414 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1032)
MOVT	R0, #hi_addr(_system_reg+1032)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2415 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2416 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2417 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2418 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_21_OnPress245:
SUBS	R7, R7, #1
BNE	L_Down_21_OnPress245
NOP
NOP
NOP
;Controller_events_code.c,2419 :: 		}
L_end_Down_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_21_OnPress
_Down_21_OnUp:
;Controller_events_code.c,2420 :: 		void Down_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2421 :: 		Image245.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image245+20)
MOVT	R0, #hi_addr(_Image245+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2422 :: 		Down_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_21_+20)
MOVT	R0, #hi_addr(_Down_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2423 :: 		DrawImage(&Down_21_);
MOVW	R0, #lo_addr(_Down_21_+0)
MOVT	R0, #hi_addr(_Down_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2424 :: 		}
L_end_Down_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_21_OnUp
_Up_21_OnPress:
;Controller_events_code.c,2425 :: 		void Up_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2427 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2428 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2429 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2430 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2431 :: 		system_reg[S_COOL_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1032)
MOVT	R1, #hi_addr(_system_reg+1032)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2432 :: 		if (system_reg[S_COOL_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_21_OnPress247
;Controller_events_code.c,2433 :: 		system_reg[S_COOL_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1032)
MOVT	R0, #hi_addr(_system_reg+1032)
STRH	R1, [R0, #0]
L_Up_21_OnPress247:
;Controller_events_code.c,2434 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1032)
MOVT	R0, #hi_addr(_system_reg+1032)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2435 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2436 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2437 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2438 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_21_OnPress248:
SUBS	R7, R7, #1
BNE	L_Up_21_OnPress248
NOP
NOP
NOP
;Controller_events_code.c,2439 :: 		}
L_end_Up_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_21_OnPress
_Up_21_OnUp:
;Controller_events_code.c,2440 :: 		void Up_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2441 :: 		Image238.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2442 :: 		Up_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2443 :: 		DrawImage(&Up_21_);
MOVW	R0, #lo_addr(_Up_21_+0)
MOVT	R0, #hi_addr(_Up_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2444 :: 		}
L_end_Up_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_21_OnUp
_Down_22_OnPress:
;Controller_events_code.c,2446 :: 		void Down_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2448 :: 		Image24.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2449 :: 		Down_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2450 :: 		DrawImage(&Image24);
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
BL	_DrawImage+0
;Controller_events_code.c,2451 :: 		system_reg[HP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1036)
MOVT	R1, #hi_addr(_system_reg+1036)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2452 :: 		if (system_reg[HP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_22_OnPress250
;Controller_events_code.c,2453 :: 		system_reg[HP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1036)
MOVT	R0, #hi_addr(_system_reg+1036)
STRH	R1, [R0, #0]
L_Down_22_OnPress250:
;Controller_events_code.c,2454 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1036)
MOVT	R0, #hi_addr(_system_reg+1036)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2455 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2456 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2457 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2458 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_22_OnPress251:
SUBS	R7, R7, #1
BNE	L_Down_22_OnPress251
NOP
NOP
NOP
;Controller_events_code.c,2459 :: 		}
L_end_Down_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_22_OnPress
_Down_22_OnUp:
;Controller_events_code.c,2460 :: 		void Down_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2461 :: 		Image24.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2462 :: 		Down_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2463 :: 		DrawImage(&Down_22_);
MOVW	R0, #lo_addr(_Down_22_+0)
MOVT	R0, #hi_addr(_Down_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2465 :: 		}
L_end_Down_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_22_OnUp
_Up_22_OnPress:
;Controller_events_code.c,2466 :: 		void Up_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2468 :: 		Image53.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2469 :: 		Up_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2470 :: 		DrawImage(&Image53);
MOVW	R0, #lo_addr(_Image53+0)
MOVT	R0, #hi_addr(_Image53+0)
BL	_DrawImage+0
;Controller_events_code.c,2471 :: 		system_reg[HP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1036)
MOVT	R1, #hi_addr(_system_reg+1036)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2472 :: 		if (system_reg[HP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_22_OnPress253
;Controller_events_code.c,2473 :: 		system_reg[HP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1036)
MOVT	R0, #hi_addr(_system_reg+1036)
STRH	R1, [R0, #0]
L_Up_22_OnPress253:
;Controller_events_code.c,2474 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1036)
MOVT	R0, #hi_addr(_system_reg+1036)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2475 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2476 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2477 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2478 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_22_OnPress254:
SUBS	R7, R7, #1
BNE	L_Up_22_OnPress254
NOP
NOP
NOP
;Controller_events_code.c,2479 :: 		}
L_end_Up_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_22_OnPress
_Up_22_OnUp:
;Controller_events_code.c,2480 :: 		void Up_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2481 :: 		Image53.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2482 :: 		Up_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2483 :: 		DrawImage(&Up_22_);
MOVW	R0, #lo_addr(_Up_22_+0)
MOVT	R0, #hi_addr(_Up_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2484 :: 		}
L_end_Up_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_22_OnUp
_Down_23_OnPress:
;Controller_events_code.c,2485 :: 		void Down_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2487 :: 		Image86.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2488 :: 		Down_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2489 :: 		DrawImage(&Image86);
MOVW	R0, #lo_addr(_Image86+0)
MOVT	R0, #hi_addr(_Image86+0)
BL	_DrawImage+0
;Controller_events_code.c,2490 :: 		system_reg[HP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1034)
MOVT	R1, #hi_addr(_system_reg+1034)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2491 :: 		if (system_reg[HP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_23_OnPress256
;Controller_events_code.c,2492 :: 		system_reg[HP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1034)
MOVT	R0, #hi_addr(_system_reg+1034)
STRH	R1, [R0, #0]
L_Down_23_OnPress256:
;Controller_events_code.c,2493 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1034)
MOVT	R0, #hi_addr(_system_reg+1034)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2494 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2495 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2496 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2497 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_23_OnPress257:
SUBS	R7, R7, #1
BNE	L_Down_23_OnPress257
NOP
NOP
NOP
;Controller_events_code.c,2498 :: 		}
L_end_Down_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_23_OnPress
_Down_23_OnUp:
;Controller_events_code.c,2499 :: 		void Down_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2500 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2501 :: 		Down_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2502 :: 		DrawImage(&Down_23_);
MOVW	R0, #lo_addr(_Down_23_+0)
MOVT	R0, #hi_addr(_Down_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2504 :: 		}
L_end_Down_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_23_OnUp
_Up_23_OnPress:
;Controller_events_code.c,2505 :: 		void Up_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2507 :: 		Image95.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image95+20)
MOVT	R0, #hi_addr(_Image95+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2508 :: 		Up_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2509 :: 		DrawImage(&Image95);
MOVW	R0, #lo_addr(_Image95+0)
MOVT	R0, #hi_addr(_Image95+0)
BL	_DrawImage+0
;Controller_events_code.c,2510 :: 		system_reg[HP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1034)
MOVT	R1, #hi_addr(_system_reg+1034)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2511 :: 		if (system_reg[HP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_23_OnPress259
;Controller_events_code.c,2512 :: 		system_reg[HP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1034)
MOVT	R0, #hi_addr(_system_reg+1034)
STRH	R1, [R0, #0]
L_Up_23_OnPress259:
;Controller_events_code.c,2513 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1034)
MOVT	R0, #hi_addr(_system_reg+1034)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2514 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2515 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2516 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2517 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_23_OnPress260:
SUBS	R7, R7, #1
BNE	L_Up_23_OnPress260
NOP
NOP
NOP
;Controller_events_code.c,2518 :: 		}
L_end_Up_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_23_OnPress
_Up_23_OnUp:
;Controller_events_code.c,2519 :: 		void Up_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2520 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2521 :: 		Up_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2522 :: 		DrawImage(&Up_23_);
MOVW	R0, #lo_addr(_Up_23_+0)
MOVT	R0, #hi_addr(_Up_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2523 :: 		}
L_end_Up_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_23_OnUp
_Set_19_OnUp:
;Controller_events_code.c,2525 :: 		void Set_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2526 :: 		Set_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2527 :: 		Image264.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2528 :: 		DrawImage (&Set_19_);
MOVW	R0, #lo_addr(_Set_19_+0)
MOVT	R0, #hi_addr(_Set_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2529 :: 		}
L_end_Set_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnUp
_Set_19_OnDown:
;Controller_events_code.c,2530 :: 		void void Set_19_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2531 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2532 :: 		adressReg= S_HEAT_MAX;
MOVW	R1, #514
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2533 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2534 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2535 :: 		send_data_packet(S_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #514
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2536 :: 		Set_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2537 :: 		Image264.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2538 :: 		DrawImage (&Image264);
MOVW	R0, #lo_addr(_Image264+0)
MOVT	R0, #hi_addr(_Image264+0)
BL	_DrawImage+0
;Controller_events_code.c,2539 :: 		}
L_end_Set_19_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnDown
_Set_20_OnDown:
;Controller_events_code.c,2540 :: 		void Set_20_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2541 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2542 :: 		adressReg= S_COOL_MIN;
MOVW	R1, #515
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2543 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2544 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2545 :: 		send_data_packet(S_COOL_MIN,1);
MOVS	R1, #1
MOVW	R0, #515
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2546 :: 		Set_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2547 :: 		Image265.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2548 :: 		DrawImage (&Image265);
MOVW	R0, #lo_addr(_Image265+0)
MOVT	R0, #hi_addr(_Image265+0)
BL	_DrawImage+0
;Controller_events_code.c,2549 :: 		}
L_end_Set_20_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnDown
_Set_20_OnUp:
;Controller_events_code.c,2550 :: 		void Set_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2551 :: 		Set_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2552 :: 		Image265.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2553 :: 		DrawImage (&Set_20_);
MOVW	R0, #lo_addr(_Set_20_+0)
MOVT	R0, #hi_addr(_Set_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2554 :: 		}
L_end_Set_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnUp
_Set_21_OnDown:
;Controller_events_code.c,2555 :: 		void Set_21_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2556 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2557 :: 		adressReg= S_COOL_MAX;
MOVW	R1, #516
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2558 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2559 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2560 :: 		send_data_packet(S_COOL_MAX,1);
MOVS	R1, #1
MOVW	R0, #516
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2561 :: 		Set_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2562 :: 		Image266.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2563 :: 		DrawImage (&Image266);
MOVW	R0, #lo_addr(_Image266+0)
MOVT	R0, #hi_addr(_Image266+0)
BL	_DrawImage+0
;Controller_events_code.c,2564 :: 		}
L_end_Set_21_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnDown
_Set_21_OnUp:
;Controller_events_code.c,2565 :: 		void Set_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2566 :: 		Set_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2567 :: 		Image266.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2568 :: 		DrawImage (&Set_21_);
MOVW	R0, #lo_addr(_Set_21_+0)
MOVT	R0, #hi_addr(_Set_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2569 :: 		}
L_end_Set_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnUp
_Set_22_OnDown:
;Controller_events_code.c,2570 :: 		void Set_22_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2571 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2572 :: 		adressReg= HP_MAX;
MOVW	R1, #518
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2573 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2574 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2575 :: 		send_data_packet(HP_MAX,1);
MOVS	R1, #1
MOVW	R0, #518
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2576 :: 		Set_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2577 :: 		Image34.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2578 :: 		DrawImage (&Image34);
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
BL	_DrawImage+0
;Controller_events_code.c,2579 :: 		}
L_end_Set_22_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnDown
_Set_22_OnUp:
;Controller_events_code.c,2581 :: 		void Set_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2582 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2583 :: 		Set_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2584 :: 		Image34.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2585 :: 		DrawImage (&Set_22_);
MOVW	R0, #lo_addr(_Set_22_+0)
MOVT	R0, #hi_addr(_Set_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2586 :: 		}
L_end_Set_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnUp
_Set_23_OnDown:
;Controller_events_code.c,2587 :: 		void Set_23_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2588 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2589 :: 		adressReg= HP_MIN;
MOVW	R1, #517
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2590 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2591 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2592 :: 		send_data_packet(HP_MIN,1);
MOVS	R1, #1
MOVW	R0, #517
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2593 :: 		Set_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2594 :: 		Image33.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2595 :: 		DrawImage (&Image33);
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
BL	_DrawImage+0
;Controller_events_code.c,2596 :: 		}
L_end_Set_23_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnDown
_Set_23_OnUp:
;Controller_events_code.c,2597 :: 		void Set_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2598 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2599 :: 		Set_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2600 :: 		Image33.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2601 :: 		DrawImage (&Set_23_);
MOVW	R0, #lo_addr(_Set_23_+0)
MOVT	R0, #hi_addr(_Set_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2602 :: 		}
L_end_Set_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnUp
_One_CompressorsOnClick:
;Controller_events_code.c,2605 :: 		void One_CompressorsOnClick() {
;Controller_events_code.c,2607 :: 		}
L_end_One_CompressorsOnClick:
BX	LR
; end of _One_CompressorsOnClick
_Reversing_ON_HEATOnClick:
;Controller_events_code.c,2609 :: 		void Reversing_ON_HEATOnClick() {
;Controller_events_code.c,2611 :: 		}
L_end_Reversing_ON_HEATOnClick:
BX	LR
; end of _Reversing_ON_HEATOnClick
_Flow_Source__Sensor_ONOnClick:
;Controller_events_code.c,2612 :: 		void Flow_Source__Sensor_ONOnClick(){
;Controller_events_code.c,2614 :: 		}
L_end_Flow_Source__Sensor_ONOnClick:
BX	LR
; end of _Flow_Source__Sensor_ONOnClick
_Flow_Source__Heat1_ONOnClick:
;Controller_events_code.c,2615 :: 		void Flow_Source__Heat1_ONOnClick() {
;Controller_events_code.c,2617 :: 		}
L_end_Flow_Source__Heat1_ONOnClick:
BX	LR
; end of _Flow_Source__Heat1_ONOnClick
_Flow_Source__Heat2_ONOnClick:
;Controller_events_code.c,2618 :: 		void Flow_Source__Heat2_ONOnClick() {
;Controller_events_code.c,2620 :: 		}
L_end_Flow_Source__Heat2_ONOnClick:
BX	LR
; end of _Flow_Source__Heat2_ONOnClick
_Power_380VOnClick:
;Controller_events_code.c,2621 :: 		void Power_380VOnClick() {
;Controller_events_code.c,2623 :: 		}
L_end_Power_380VOnClick:
BX	LR
; end of _Power_380VOnClick
_furnance_Mode_onOnClick:
;Controller_events_code.c,2626 :: 		void furnance_Mode_onOnClick() {
;Controller_events_code.c,2628 :: 		}
L_end_furnance_Mode_onOnClick:
BX	LR
; end of _furnance_Mode_onOnClick
_Furnance_start_temp_DownOnUp:
;Controller_events_code.c,2630 :: 		void Furnance_start_temp_DownOnUp() {
;Controller_events_code.c,2632 :: 		}
L_end_Furnance_start_temp_DownOnUp:
BX	LR
; end of _Furnance_start_temp_DownOnUp
_Furnance_start_temp_DownOnPress:
;Controller_events_code.c,2633 :: 		void Furnance_start_temp_DownOnPress() {
;Controller_events_code.c,2635 :: 		}
L_end_Furnance_start_temp_DownOnPress:
BX	LR
; end of _Furnance_start_temp_DownOnPress
_Furnance_HP_OFF_DowmOnUp:
;Controller_events_code.c,2636 :: 		void Furnance_HP_OFF_DowmOnUp() {
;Controller_events_code.c,2638 :: 		}
L_end_Furnance_HP_OFF_DowmOnUp:
BX	LR
; end of _Furnance_HP_OFF_DowmOnUp
_Furnance_HP_OFF_DowmOnPress:
;Controller_events_code.c,2639 :: 		void Furnance_HP_OFF_DowmOnPress() {
;Controller_events_code.c,2641 :: 		}
L_end_Furnance_HP_OFF_DowmOnPress:
BX	LR
; end of _Furnance_HP_OFF_DowmOnPress
_Furnance_HP_OFF_UPOnUp:
;Controller_events_code.c,2642 :: 		void Furnance_HP_OFF_UPOnUp() {
;Controller_events_code.c,2644 :: 		}
L_end_Furnance_HP_OFF_UPOnUp:
BX	LR
; end of _Furnance_HP_OFF_UPOnUp
_Furnance_HP_OFF_UPOnPress:
;Controller_events_code.c,2645 :: 		void Furnance_HP_OFF_UPOnPress() {
;Controller_events_code.c,2647 :: 		}
L_end_Furnance_HP_OFF_UPOnPress:
BX	LR
; end of _Furnance_HP_OFF_UPOnPress
_Furnance_off_downOnUp:
;Controller_events_code.c,2649 :: 		void Furnance_off_downOnUp() {
;Controller_events_code.c,2651 :: 		}
L_end_Furnance_off_downOnUp:
BX	LR
; end of _Furnance_off_downOnUp
_Furnance_off_downOnPress:
;Controller_events_code.c,2652 :: 		void Furnance_off_downOnPress() {
;Controller_events_code.c,2654 :: 		}
L_end_Furnance_off_downOnPress:
BX	LR
; end of _Furnance_off_downOnPress
_Furnance_off_upOnUp:
;Controller_events_code.c,2655 :: 		void Furnance_off_upOnUp() {
;Controller_events_code.c,2657 :: 		}
L_end_Furnance_off_upOnUp:
BX	LR
; end of _Furnance_off_upOnUp
_Furnance_off_upOnPress:
;Controller_events_code.c,2658 :: 		void Furnance_off_upOnPress() {
;Controller_events_code.c,2660 :: 		}
L_end_Furnance_off_upOnPress:
BX	LR
; end of _Furnance_off_upOnPress
_Furnance_off_save_onup:
;Controller_events_code.c,2661 :: 		void Furnance_off_save_onup() {
;Controller_events_code.c,2663 :: 		}
L_end_Furnance_off_save_onup:
BX	LR
; end of _Furnance_off_save_onup
_Furnance_off_save_ondown:
;Controller_events_code.c,2664 :: 		void Furnance_off_save_ondown() {
;Controller_events_code.c,2666 :: 		}
L_end_Furnance_off_save_ondown:
BX	LR
; end of _Furnance_off_save_ondown
_Furnance_time_downOnUp:
;Controller_events_code.c,2667 :: 		void Furnance_time_downOnUp() {
;Controller_events_code.c,2669 :: 		}
L_end_Furnance_time_downOnUp:
BX	LR
; end of _Furnance_time_downOnUp
_Furnance_time_downOnPress:
;Controller_events_code.c,2670 :: 		void Furnance_time_downOnPress() {
;Controller_events_code.c,2672 :: 		}
L_end_Furnance_time_downOnPress:
BX	LR
; end of _Furnance_time_downOnPress
_Furnance_time_upOnUp:
;Controller_events_code.c,2673 :: 		void Furnance_time_upOnUp() {
;Controller_events_code.c,2675 :: 		}
L_end_Furnance_time_upOnUp:
BX	LR
; end of _Furnance_time_upOnUp
_Furnance_time_upOnPress:
;Controller_events_code.c,2676 :: 		void Furnance_time_upOnPress() {
;Controller_events_code.c,2678 :: 		}
L_end_Furnance_time_upOnPress:
BX	LR
; end of _Furnance_time_upOnPress
_furnance_time_OFFOnClick:
;Controller_events_code.c,2679 :: 		void furnance_time_OFFOnClick() {
;Controller_events_code.c,2681 :: 		}
L_end_furnance_time_OFFOnClick:
BX	LR
; end of _furnance_time_OFFOnClick
_Furnance_HP_OFF_save_onup:
;Controller_events_code.c,2682 :: 		void Furnance_HP_OFF_save_onup(){
;Controller_events_code.c,2683 :: 		}
L_end_Furnance_HP_OFF_save_onup:
BX	LR
; end of _Furnance_HP_OFF_save_onup
_Furnance_start_temp_UPOnUp:
;Controller_events_code.c,2684 :: 		void Furnance_start_temp_UPOnUp(){
;Controller_events_code.c,2685 :: 		}
L_end_Furnance_start_temp_UPOnUp:
BX	LR
; end of _Furnance_start_temp_UPOnUp
_Furnance_start_temp_UPOnPress:
;Controller_events_code.c,2686 :: 		void Furnance_start_temp_UPOnPress(){
;Controller_events_code.c,2687 :: 		}
L_end_Furnance_start_temp_UPOnPress:
BX	LR
; end of _Furnance_start_temp_UPOnPress
_SetIPAddressOnClick:
;Controller_events_code.c,2690 :: 		void SetIPAddressOnClick() {
;Controller_events_code.c,2692 :: 		}
L_end_SetIPAddressOnClick:
BX	LR
; end of _SetIPAddressOnClick
_SetMaskOnClick:
;Controller_events_code.c,2694 :: 		void SetMaskOnClick() {
;Controller_events_code.c,2696 :: 		}
L_end_SetMaskOnClick:
BX	LR
; end of _SetMaskOnClick
_SetDNSOnClick:
;Controller_events_code.c,2698 :: 		void SetDNSOnClick() {
;Controller_events_code.c,2700 :: 		}
L_end_SetDNSOnClick:
BX	LR
; end of _SetDNSOnClick
_LAN_Key_1OnClick:
;Controller_events_code.c,2702 :: 		void LAN_Key_1OnClick() {
;Controller_events_code.c,2704 :: 		}
L_end_LAN_Key_1OnClick:
BX	LR
; end of _LAN_Key_1OnClick
_LAN_Key_2OnClick:
;Controller_events_code.c,2706 :: 		void LAN_Key_2OnClick() {
;Controller_events_code.c,2708 :: 		}
L_end_LAN_Key_2OnClick:
BX	LR
; end of _LAN_Key_2OnClick
_LAN_Key_3OnClick:
;Controller_events_code.c,2710 :: 		void LAN_Key_3OnClick() {
;Controller_events_code.c,2712 :: 		}
L_end_LAN_Key_3OnClick:
BX	LR
; end of _LAN_Key_3OnClick
_LAN_Key_4OnClick:
;Controller_events_code.c,2714 :: 		void LAN_Key_4OnClick() {
;Controller_events_code.c,2716 :: 		}
L_end_LAN_Key_4OnClick:
BX	LR
; end of _LAN_Key_4OnClick
_LAN_Key_5OnClick:
;Controller_events_code.c,2718 :: 		void LAN_Key_5OnClick() {
;Controller_events_code.c,2720 :: 		}
L_end_LAN_Key_5OnClick:
BX	LR
; end of _LAN_Key_5OnClick
_LAN_Key_6OnClick:
;Controller_events_code.c,2722 :: 		void LAN_Key_6OnClick() {
;Controller_events_code.c,2724 :: 		}
L_end_LAN_Key_6OnClick:
BX	LR
; end of _LAN_Key_6OnClick
_LAN_Key_7OnClick:
;Controller_events_code.c,2726 :: 		void LAN_Key_7OnClick() {
;Controller_events_code.c,2728 :: 		}
L_end_LAN_Key_7OnClick:
BX	LR
; end of _LAN_Key_7OnClick
_LAN_Key_8OnClick:
;Controller_events_code.c,2730 :: 		void LAN_Key_8OnClick() {
;Controller_events_code.c,2732 :: 		}
L_end_LAN_Key_8OnClick:
BX	LR
; end of _LAN_Key_8OnClick
_LAN_Key_9OnClick:
;Controller_events_code.c,2734 :: 		void LAN_Key_9OnClick() {
;Controller_events_code.c,2736 :: 		}
L_end_LAN_Key_9OnClick:
BX	LR
; end of _LAN_Key_9OnClick
_LAN_Key_0OnClick:
;Controller_events_code.c,2738 :: 		void LAN_Key_0OnClick() {
;Controller_events_code.c,2740 :: 		}
L_end_LAN_Key_0OnClick:
BX	LR
; end of _LAN_Key_0OnClick
_LAN_Key_DotOnClick:
;Controller_events_code.c,2742 :: 		void LAN_Key_DotOnClick() {
;Controller_events_code.c,2744 :: 		}
L_end_LAN_Key_DotOnClick:
BX	LR
; end of _LAN_Key_DotOnClick
_LAN_Key_ClearOnClick:
;Controller_events_code.c,2746 :: 		void LAN_Key_ClearOnClick() {
;Controller_events_code.c,2748 :: 		}
L_end_LAN_Key_ClearOnClick:
BX	LR
; end of _LAN_Key_ClearOnClick
_LANSetOnClick:
;Controller_events_code.c,2750 :: 		void LANSetOnClick() {
;Controller_events_code.c,2752 :: 		}
L_end_LANSetOnClick:
BX	LR
; end of _LANSetOnClick
_SetGateWayOnClick:
;Controller_events_code.c,2753 :: 		void SetGateWayOnClick(){
;Controller_events_code.c,2754 :: 		}
L_end_SetGateWayOnClick:
BX	LR
; end of _SetGateWayOnClick
_Hyst_Heat_downOnUp:
;Controller_events_code.c,2756 :: 		void Hyst_Heat_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2757 :: 		Hyst_Heat_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2758 :: 		Image114.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2759 :: 		DrawImage(&Hyst_Heat_down);
MOVW	R0, #lo_addr(_Hyst_Heat_down+0)
MOVT	R0, #hi_addr(_Hyst_Heat_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2760 :: 		}
L_end_Hyst_Heat_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_downOnUp
_Hyst_Heat_downOnPress:
;Controller_events_code.c,2761 :: 		void Hyst_Heat_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2763 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2764 :: 		Hyst_Heat_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2765 :: 		Image114.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2766 :: 		DrawImage(&Image114);
MOVW	R0, #lo_addr(_Image114+0)
MOVT	R0, #hi_addr(_Image114+0)
BL	_DrawImage+0
;Controller_events_code.c,2767 :: 		system_reg[DIFF_HEAT]--;
MOVW	R1, #lo_addr(_system_reg+1056)
MOVT	R1, #hi_addr(_system_reg+1056)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2768 :: 		if (system_reg[DIFF_HEAT] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Heat_downOnPress262
;Controller_events_code.c,2769 :: 		system_reg[DIFF_HEAT] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1056)
MOVT	R0, #hi_addr(_system_reg+1056)
STRH	R1, [R0, #0]
L_Hyst_Heat_downOnPress262:
;Controller_events_code.c,2770 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1056)
MOVT	R0, #hi_addr(_system_reg+1056)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2771 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2772 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2773 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2774 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Heat_downOnPress263:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_downOnPress263
NOP
NOP
NOP
;Controller_events_code.c,2775 :: 		}
L_end_Hyst_Heat_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_downOnPress
_Hyst_Heat_upOnUp:
;Controller_events_code.c,2776 :: 		void Hyst_Heat_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2777 :: 		Hyst_Heat_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2778 :: 		Image121.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2779 :: 		DrawImage(&Hyst_Heat_up);
MOVW	R0, #lo_addr(_Hyst_Heat_up+0)
MOVT	R0, #hi_addr(_Hyst_Heat_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2780 :: 		}
L_end_Hyst_Heat_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_upOnUp
_Hyst_Heat_upOnPress:
;Controller_events_code.c,2781 :: 		void Hyst_Heat_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2783 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2784 :: 		Hyst_Heat_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2785 :: 		Image121.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2786 :: 		DrawImage(&Image121);
MOVW	R0, #lo_addr(_Image121+0)
MOVT	R0, #hi_addr(_Image121+0)
BL	_DrawImage+0
;Controller_events_code.c,2787 :: 		system_reg[DIFF_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+1056)
MOVT	R1, #hi_addr(_system_reg+1056)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2788 :: 		if (system_reg[DIFF_HEAT] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Heat_upOnPress265
;Controller_events_code.c,2789 :: 		system_reg[DIFF_HEAT] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1056)
MOVT	R0, #hi_addr(_system_reg+1056)
STRH	R1, [R0, #0]
L_Hyst_Heat_upOnPress265:
;Controller_events_code.c,2790 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1056)
MOVT	R0, #hi_addr(_system_reg+1056)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2791 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2792 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2793 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2794 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Heat_upOnPress266:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_upOnPress266
NOP
NOP
NOP
;Controller_events_code.c,2795 :: 		}
L_end_Hyst_Heat_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_upOnPress
_Hyst_Cool_downOnUp:
;Controller_events_code.c,2796 :: 		void Hyst_Cool_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2797 :: 		Hyst_Cool_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2798 :: 		Image115.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2799 :: 		DrawImage(&Hyst_Cool_down);
MOVW	R0, #lo_addr(_Hyst_Cool_down+0)
MOVT	R0, #hi_addr(_Hyst_Cool_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2800 :: 		}
L_end_Hyst_Cool_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_downOnUp
_Hyst_Cool_downOnPress:
;Controller_events_code.c,2801 :: 		void Hyst_Cool_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2803 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2804 :: 		Hyst_Cool_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2805 :: 		Image115.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2806 :: 		DrawImage(&Image115);
MOVW	R0, #lo_addr(_Image115+0)
MOVT	R0, #hi_addr(_Image115+0)
BL	_DrawImage+0
;Controller_events_code.c,2807 :: 		system_reg[DIFF_COOL]--;
MOVW	R1, #lo_addr(_system_reg+1058)
MOVT	R1, #hi_addr(_system_reg+1058)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2808 :: 		if (system_reg[DIFF_COOL] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Cool_downOnPress268
;Controller_events_code.c,2809 :: 		system_reg[DIFF_COOL] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1058)
MOVT	R0, #hi_addr(_system_reg+1058)
STRH	R1, [R0, #0]
L_Hyst_Cool_downOnPress268:
;Controller_events_code.c,2810 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1058)
MOVT	R0, #hi_addr(_system_reg+1058)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2811 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2812 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2813 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2814 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Cool_downOnPress269:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_downOnPress269
NOP
NOP
NOP
;Controller_events_code.c,2815 :: 		}
L_end_Hyst_Cool_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_downOnPress
_Hyst_Cool_upOnUp:
;Controller_events_code.c,2816 :: 		void Hyst_Cool_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2817 :: 		Hyst_Cool_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2818 :: 		Image122.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2819 :: 		DrawImage(&Hyst_Cool_up);
MOVW	R0, #lo_addr(_Hyst_Cool_up+0)
MOVT	R0, #hi_addr(_Hyst_Cool_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2821 :: 		}
L_end_Hyst_Cool_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_upOnUp
_Hyst_Cool_upOnPress:
;Controller_events_code.c,2822 :: 		void Hyst_Cool_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2824 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2825 :: 		Hyst_Cool_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2826 :: 		Image122.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2827 :: 		DrawImage(&Image122);
MOVW	R0, #lo_addr(_Image122+0)
MOVT	R0, #hi_addr(_Image122+0)
BL	_DrawImage+0
;Controller_events_code.c,2828 :: 		system_reg[DIFF_COOL]++;
MOVW	R1, #lo_addr(_system_reg+1058)
MOVT	R1, #hi_addr(_system_reg+1058)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2829 :: 		if (system_reg[DIFF_COOL] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Cool_upOnPress271
;Controller_events_code.c,2830 :: 		system_reg[DIFF_COOL] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1058)
MOVT	R0, #hi_addr(_system_reg+1058)
STRH	R1, [R0, #0]
L_Hyst_Cool_upOnPress271:
;Controller_events_code.c,2831 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1058)
MOVT	R0, #hi_addr(_system_reg+1058)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2832 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2833 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2834 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2835 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Cool_upOnPress272:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_upOnPress272
NOP
NOP
NOP
;Controller_events_code.c,2836 :: 		}
L_end_Hyst_Cool_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_upOnPress
_Hyst_DHW_downOnUp:
;Controller_events_code.c,2837 :: 		void Hyst_DHW_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2838 :: 		Hyst_DHW_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2839 :: 		Image116.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2840 :: 		DrawImage(&Hyst_DHW_down);
MOVW	R0, #lo_addr(_Hyst_DHW_down+0)
MOVT	R0, #hi_addr(_Hyst_DHW_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2841 :: 		}
L_end_Hyst_DHW_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_downOnUp
_Hyst_DHW_downOnPress:
;Controller_events_code.c,2842 :: 		void Hyst_DHW_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2844 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2845 :: 		Hyst_DHW_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2846 :: 		Image116.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2847 :: 		DrawImage(&Image116);
MOVW	R0, #lo_addr(_Image116+0)
MOVT	R0, #hi_addr(_Image116+0)
BL	_DrawImage+0
;Controller_events_code.c,2848 :: 		system_reg[DIFF_DHW]--;
MOVW	R1, #lo_addr(_system_reg+1060)
MOVT	R1, #hi_addr(_system_reg+1060)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2849 :: 		if (system_reg[DIFF_DHW] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_DHW_downOnPress274
;Controller_events_code.c,2850 :: 		system_reg[DIFF_DHW] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1060)
MOVT	R0, #hi_addr(_system_reg+1060)
STRH	R1, [R0, #0]
L_Hyst_DHW_downOnPress274:
;Controller_events_code.c,2851 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1060)
MOVT	R0, #hi_addr(_system_reg+1060)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2852 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2853 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2854 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2855 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_DHW_downOnPress275:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_downOnPress275
NOP
NOP
NOP
;Controller_events_code.c,2856 :: 		}
L_end_Hyst_DHW_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_downOnPress
_Hyst_DHW_upOnUp:
;Controller_events_code.c,2857 :: 		void Hyst_DHW_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2858 :: 		Hyst_DHW_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2859 :: 		Image123.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2860 :: 		DrawImage(&Hyst_DHW_up);
MOVW	R0, #lo_addr(_Hyst_DHW_up+0)
MOVT	R0, #hi_addr(_Hyst_DHW_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2861 :: 		}
L_end_Hyst_DHW_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_upOnUp
_Hyst_DHW_upOnPress:
;Controller_events_code.c,2862 :: 		void Hyst_DHW_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2864 :: 		Hyst_DHW_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2865 :: 		Image123.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2866 :: 		DrawImage(&Image123);
MOVW	R0, #lo_addr(_Image123+0)
MOVT	R0, #hi_addr(_Image123+0)
BL	_DrawImage+0
;Controller_events_code.c,2867 :: 		system_reg[DIFF_DHW]++;
MOVW	R1, #lo_addr(_system_reg+1060)
MOVT	R1, #hi_addr(_system_reg+1060)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2868 :: 		if (system_reg[DIFF_DHW] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_DHW_upOnPress277
;Controller_events_code.c,2869 :: 		system_reg[DIFF_DHW] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1060)
MOVT	R0, #hi_addr(_system_reg+1060)
STRH	R1, [R0, #0]
L_Hyst_DHW_upOnPress277:
;Controller_events_code.c,2870 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1060)
MOVT	R0, #hi_addr(_system_reg+1060)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2871 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2872 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2873 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2874 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_DHW_upOnPress278:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_upOnPress278
NOP
NOP
NOP
;Controller_events_code.c,2875 :: 		}
L_end_Hyst_DHW_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_upOnPress
_Set_heat_onup:
;Controller_events_code.c,2876 :: 		void Set_heat_onup(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2877 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2878 :: 		Image135.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2879 :: 		Image128.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2880 :: 		DrawImage (&Image135);
MOVW	R0, #lo_addr(_Image135+0)
MOVT	R0, #hi_addr(_Image135+0)
BL	_DrawImage+0
;Controller_events_code.c,2881 :: 		}
L_end_Set_heat_onup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_onup
_Set_heat_OnDown:
;Controller_events_code.c,2882 :: 		void Set_heat_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2883 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2884 :: 		adressReg= DIFF_HEAT;
MOVW	R1, #528
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2885 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2886 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2887 :: 		send_data_packet (DIFF_HEAT,1);
MOVS	R1, #1
MOVW	R0, #528
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2888 :: 		Image135.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2889 :: 		Image128.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2890 :: 		DrawImage (&Image128);
MOVW	R0, #lo_addr(_Image128+0)
MOVT	R0, #hi_addr(_Image128+0)
BL	_DrawImage+0
;Controller_events_code.c,2891 :: 		}
L_end_Set_heat_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_OnDown
_Set_cool_OnUp:
;Controller_events_code.c,2892 :: 		void Set_cool_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2893 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2894 :: 		Image138.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2895 :: 		Image129.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2896 :: 		DrawImage (&Image138);
MOVW	R0, #lo_addr(_Image138+0)
MOVT	R0, #hi_addr(_Image138+0)
BL	_DrawImage+0
;Controller_events_code.c,2897 :: 		}
L_end_Set_cool_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnUp
_Set_cool_OnDown:
;Controller_events_code.c,2898 :: 		void Set_cool_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2899 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2900 :: 		adressReg= DIFF_COOL;
MOVW	R1, #529
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2901 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2902 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2903 :: 		send_data_packet (DIFF_COOL,1);
MOVS	R1, #1
MOVW	R0, #529
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2904 :: 		Image138.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2905 :: 		Image129.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2906 :: 		DrawImage (&Image129);
MOVW	R0, #lo_addr(_Image129+0)
MOVT	R0, #hi_addr(_Image129+0)
BL	_DrawImage+0
;Controller_events_code.c,2907 :: 		}
L_end_Set_cool_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnDown
_Set_dhw_OnUp:
;Controller_events_code.c,2908 :: 		void Set_dhw_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2909 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2910 :: 		Set_DHW_HY.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2911 :: 		Image130.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2912 :: 		DrawImage (&Set_DHW_HY);
MOVW	R0, #lo_addr(_Set_DHW_HY+0)
MOVT	R0, #hi_addr(_Set_DHW_HY+0)
BL	_DrawImage+0
;Controller_events_code.c,2913 :: 		}
L_end_Set_dhw_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnUp
_Set_dhw_OnDown:
;Controller_events_code.c,2914 :: 		void Set_dhw_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2915 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2916 :: 		adressReg= DIFF_DHW;
MOVW	R1, #530
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2917 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2918 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2919 :: 		send_data_packet (DIFF_DHW,1);
MOVS	R1, #1
MOVW	R0, #530
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2920 :: 		Set_DHW_HY.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2921 :: 		Image130.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2922 :: 		DrawImage (&Image130);
MOVW	R0, #lo_addr(_Image130+0)
MOVT	R0, #hi_addr(_Image130+0)
BL	_DrawImage+0
;Controller_events_code.c,2923 :: 		}
L_end_Set_dhw_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnDown
_DEC_EEV2OnPress:
;Controller_events_code.c,2926 :: 		void DEC_EEV2OnPress() {
;Controller_events_code.c,2928 :: 		}
L_end_DEC_EEV2OnPress:
BX	LR
; end of _DEC_EEV2OnPress
_INC_EEV2OnPress:
;Controller_events_code.c,2929 :: 		void INC_EEV2OnPress() {
;Controller_events_code.c,2931 :: 		}
L_end_INC_EEV2OnPress:
BX	LR
; end of _INC_EEV2OnPress
_EEV2DownOnUp:
;Controller_events_code.c,2932 :: 		void EEV2DownOnUp() {
;Controller_events_code.c,2934 :: 		}
L_end_EEV2DownOnUp:
BX	LR
; end of _EEV2DownOnUp
_EEV2DownOnDown:
;Controller_events_code.c,2936 :: 		void EEV2DownOnDown() {
;Controller_events_code.c,2938 :: 		}
L_end_EEV2DownOnDown:
BX	LR
; end of _EEV2DownOnDown
_EEV2UpOnUp:
;Controller_events_code.c,2939 :: 		void EEV2UpOnUp() {
;Controller_events_code.c,2941 :: 		}
L_end_EEV2UpOnUp:
BX	LR
; end of _EEV2UpOnUp
_EEV2UpOnDown:
;Controller_events_code.c,2942 :: 		void EEV2UpOnDown() {
;Controller_events_code.c,2944 :: 		}
L_end_EEV2UpOnDown:
BX	LR
; end of _EEV2UpOnDown
_EEV2_AutoOnClick:
;Controller_events_code.c,2945 :: 		void EEV2_AutoOnClick() {
;Controller_events_code.c,2947 :: 		}
L_end_EEV2_AutoOnClick:
BX	LR
; end of _EEV2_AutoOnClick
_Mode_ground_onOnClick:
;Controller_events_code.c,2949 :: 		void  Mode_ground_onOnClick () {
;Controller_events_code.c,2951 :: 		}
L_end_Mode_ground_onOnClick:
BX	LR
; end of _Mode_ground_onOnClick
_Down_24_OnPress:
;Controller_events_code.c,2958 :: 		void Down_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2960 :: 		Image99.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2961 :: 		Image17.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2962 :: 		DrawImage(&Image99);
MOVW	R0, #lo_addr(_Image99+0)
MOVT	R0, #hi_addr(_Image99+0)
BL	_DrawImage+0
;Controller_events_code.c,2963 :: 		system_reg[LP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+1040)
MOVT	R1, #hi_addr(_system_reg+1040)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2964 :: 		if (system_reg[LP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_24_OnPress280
;Controller_events_code.c,2965 :: 		system_reg[LP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1040)
MOVT	R0, #hi_addr(_system_reg+1040)
STRH	R1, [R0, #0]
L_Down_24_OnPress280:
;Controller_events_code.c,2966 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1040)
MOVT	R0, #hi_addr(_system_reg+1040)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2967 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2968 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2969 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2970 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_24_OnPress281:
SUBS	R7, R7, #1
BNE	L_Down_24_OnPress281
NOP
NOP
NOP
;Controller_events_code.c,2972 :: 		}
L_end_Down_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_24_OnPress
_Down_24_OnUp:
;Controller_events_code.c,2973 :: 		void Down_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2974 :: 		Image99.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2975 :: 		Image17.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2976 :: 		DrawImage(&Image17);
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
BL	_DrawImage+0
;Controller_events_code.c,2977 :: 		}
L_end_Down_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_24_OnUp
_Up_24_OnPress:
;Controller_events_code.c,2978 :: 		void Up_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2980 :: 		Image100.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2981 :: 		Image12.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2982 :: 		DrawImage(&Image100);
MOVW	R0, #lo_addr(_Image100+0)
MOVT	R0, #hi_addr(_Image100+0)
BL	_DrawImage+0
;Controller_events_code.c,2983 :: 		system_reg[LP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+1040)
MOVT	R1, #hi_addr(_system_reg+1040)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2984 :: 		if (system_reg[LP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_24_OnPress283
;Controller_events_code.c,2985 :: 		system_reg[LP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1040)
MOVT	R0, #hi_addr(_system_reg+1040)
STRH	R1, [R0, #0]
L_Up_24_OnPress283:
;Controller_events_code.c,2986 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1040)
MOVT	R0, #hi_addr(_system_reg+1040)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2987 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2988 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2989 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2990 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_24_OnPress284:
SUBS	R7, R7, #1
BNE	L_Up_24_OnPress284
NOP
NOP
NOP
;Controller_events_code.c,2992 :: 		}
L_end_Up_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_24_OnPress
_Up_24_OnUp:
;Controller_events_code.c,2993 :: 		void Up_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2994 :: 		Image100.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2995 :: 		Image12.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2996 :: 		DrawImage(&Image12);
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
BL	_DrawImage+0
;Controller_events_code.c,2997 :: 		}
L_end_Up_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_24_OnUp
_Down_25_OnPress:
;Controller_events_code.c,2998 :: 		void Down_25_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3000 :: 		Image280.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3001 :: 		Image18.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3002 :: 		DrawImage(&Image280);
MOVW	R0, #lo_addr(_Image280+0)
MOVT	R0, #hi_addr(_Image280+0)
BL	_DrawImage+0
;Controller_events_code.c,3003 :: 		system_reg[LP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1038)
MOVT	R1, #hi_addr(_system_reg+1038)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3004 :: 		if (system_reg[LP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_25_OnPress286
;Controller_events_code.c,3005 :: 		system_reg[LP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1038)
MOVT	R0, #hi_addr(_system_reg+1038)
STRH	R1, [R0, #0]
L_Down_25_OnPress286:
;Controller_events_code.c,3006 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1038)
MOVT	R0, #hi_addr(_system_reg+1038)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3007 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3008 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3009 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3010 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_25_OnPress287:
SUBS	R7, R7, #1
BNE	L_Down_25_OnPress287
NOP
NOP
NOP
;Controller_events_code.c,3012 :: 		}
L_end_Down_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_25_OnPress
_Down_25_OnUp:
;Controller_events_code.c,3013 :: 		void Down_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3014 :: 		Image280.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3015 :: 		Image18.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3016 :: 		DrawImage(&Image18);
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
BL	_DrawImage+0
;Controller_events_code.c,3018 :: 		}
L_end_Down_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_25_OnUp
_Up_25_OnPress:
;Controller_events_code.c,3019 :: 		void Up_25_OnPress(){
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Controller_events_code.c,3021 :: 		Image281.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3022 :: 		Image14.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3023 :: 		DrawImage(&Image281);
MOVW	R0, #lo_addr(_Image281+0)
MOVT	R0, #hi_addr(_Image281+0)
BL	_DrawImage+0
;Controller_events_code.c,3024 :: 		system_reg[LP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1038)
MOVT	R1, #hi_addr(_system_reg+1038)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3025 :: 		if (system_reg[LP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_25_OnPress289
;Controller_events_code.c,3026 :: 		system_reg[LP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1038)
MOVT	R0, #hi_addr(_system_reg+1038)
STRH	R1, [R0, #0]
L_Up_25_OnPress289:
;Controller_events_code.c,3027 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1038)
MOVT	R0, #hi_addr(_system_reg+1038)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3028 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3029 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3030 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3031 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_25_OnPress290:
SUBS	R7, R7, #1
BNE	L_Up_25_OnPress290
NOP
NOP
NOP
;Controller_events_code.c,3032 :: 		}
L_end_Up_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Up_25_OnPress
_Up_25_OnUp:
;Controller_events_code.c,3033 :: 		void Up_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3034 :: 		Image281.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3035 :: 		Image14.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3036 :: 		DrawImage(&Image14);
MOVW	R0, #lo_addr(_Image14+0)
MOVT	R0, #hi_addr(_Image14+0)
BL	_DrawImage+0
;Controller_events_code.c,3037 :: 		}
L_end_Up_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_25_OnUp
_Down_26_OnPress:
;Controller_events_code.c,3038 :: 		void Down_26_OnPress() {
;Controller_events_code.c,3040 :: 		}
L_end_Down_26_OnPress:
BX	LR
; end of _Down_26_OnPress
_Down_26_OnUp:
;Controller_events_code.c,3041 :: 		void Down_26_OnUp() {
;Controller_events_code.c,3043 :: 		}
L_end_Down_26_OnUp:
BX	LR
; end of _Down_26_OnUp
_UP_26_OnPress:
;Controller_events_code.c,3044 :: 		void UP_26_OnPress() {
;Controller_events_code.c,3046 :: 		}
L_end_UP_26_OnPress:
BX	LR
; end of _UP_26_OnPress
_UP_26_OnUp:
;Controller_events_code.c,3047 :: 		void UP_26_OnUp() {
;Controller_events_code.c,3049 :: 		}
L_end_UP_26_OnUp:
BX	LR
; end of _UP_26_OnUp
_Set_24_OnDown:
;Controller_events_code.c,3050 :: 		void Set_24_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3051 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3052 :: 		adressReg= LP_MAX;
MOVW	R1, #520
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,3053 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3054 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3055 :: 		send_data_packet(LP_MAX,1);
MOVS	R1, #1
MOVW	R0, #520
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3056 :: 		Image279.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3057 :: 		Image29.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3058 :: 		DrawImage (&Image29);
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
BL	_DrawImage+0
;Controller_events_code.c,3059 :: 		}
L_end_Set_24_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnDown
_Set_24_OnUp:
;Controller_events_code.c,3060 :: 		void Set_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3061 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3062 :: 		Image279.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3063 :: 		Image29.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3064 :: 		DrawImage (&Image279);
MOVW	R0, #lo_addr(_Image279+0)
MOVT	R0, #hi_addr(_Image279+0)
BL	_DrawImage+0
;Controller_events_code.c,3065 :: 		}
L_end_Set_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnUp
_Set_25_OnDown:
;Controller_events_code.c,3066 :: 		void Set_25_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3067 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3068 :: 		adressReg= LP_MIN;
MOVW	R1, #519
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,3069 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3070 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3071 :: 		send_data_packet(LP_MIN,1);
MOVS	R1, #1
MOVW	R0, #519
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3072 :: 		Image282.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3073 :: 		Image22.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3074 :: 		DrawImage (&Image22);
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
BL	_DrawImage+0
;Controller_events_code.c,3075 :: 		}
L_end_Set_25_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnDown
_Set_25_OnUp:
;Controller_events_code.c,3076 :: 		void Set_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3077 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3078 :: 		Image282.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3079 :: 		Image22.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3080 :: 		DrawImage (&Image282);
MOVW	R0, #lo_addr(_Image282+0)
MOVT	R0, #hi_addr(_Image282+0)
BL	_DrawImage+0
;Controller_events_code.c,3081 :: 		}
L_end_Set_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnUp
_Set_26_OnDown:
;Controller_events_code.c,3082 :: 		void Set_26_OnDown() {
;Controller_events_code.c,3084 :: 		}
L_end_Set_26_OnDown:
BX	LR
; end of _Set_26_OnDown
_Set_26_OnUp:
;Controller_events_code.c,3085 :: 		void Set_26_OnUp() {
;Controller_events_code.c,3087 :: 		}
L_end_Set_26_OnUp:
BX	LR
; end of _Set_26_OnUp
_Set_phase_check:
;Controller_events_code.c,3088 :: 		void Set_phase_check(){
;Controller_events_code.c,3090 :: 		}
L_end_Set_phase_check:
BX	LR
; end of _Set_phase_check
_Set_voltage_check:
;Controller_events_code.c,3091 :: 		void Set_voltage_check(){
;Controller_events_code.c,3093 :: 		}
L_end_Set_voltage_check:
BX	LR
; end of _Set_voltage_check
_Down_13_OnUp:
;Controller_events_code.c,3096 :: 		void Down_13_OnUp() {
;Controller_events_code.c,3098 :: 		}
L_end_Down_13_OnUp:
BX	LR
; end of _Down_13_OnUp
_Down_13_OnPress:
;Controller_events_code.c,3099 :: 		void Down_13_OnPress() {
;Controller_events_code.c,3100 :: 		}
L_end_Down_13_OnPress:
BX	LR
; end of _Down_13_OnPress
_Up_13_OnPress:
;Controller_events_code.c,3101 :: 		void Up_13_OnPress() {
;Controller_events_code.c,3103 :: 		}
L_end_Up_13_OnPress:
BX	LR
; end of _Up_13_OnPress
_Up_13_OnUp:
;Controller_events_code.c,3104 :: 		void Up_13_OnUp() {
;Controller_events_code.c,3106 :: 		}
L_end_Up_13_OnUp:
BX	LR
; end of _Up_13_OnUp
_Down_14_OnPress:
;Controller_events_code.c,3108 :: 		void Down_14_OnPress() {
;Controller_events_code.c,3110 :: 		}
L_end_Down_14_OnPress:
BX	LR
; end of _Down_14_OnPress
_Down_14_OnUp:
;Controller_events_code.c,3111 :: 		void Down_14_OnUp() {
;Controller_events_code.c,3113 :: 		}
L_end_Down_14_OnUp:
BX	LR
; end of _Down_14_OnUp
_Up_14_OnPress:
;Controller_events_code.c,3114 :: 		void Up_14_OnPress() {
;Controller_events_code.c,3116 :: 		}
L_end_Up_14_OnPress:
BX	LR
; end of _Up_14_OnPress
_Up_14_OnUp:
;Controller_events_code.c,3117 :: 		void Up_14_OnUp() {
;Controller_events_code.c,3119 :: 		}
L_end_Up_14_OnUp:
BX	LR
; end of _Up_14_OnUp
_Down_15_OnPress:
;Controller_events_code.c,3120 :: 		void Down_15_OnPress() {
;Controller_events_code.c,3122 :: 		}
L_end_Down_15_OnPress:
BX	LR
; end of _Down_15_OnPress
_Down_15_OnUp:
;Controller_events_code.c,3123 :: 		void Down_15_OnUp() {
;Controller_events_code.c,3125 :: 		}
L_end_Down_15_OnUp:
BX	LR
; end of _Down_15_OnUp
_Up_15_OnPress:
;Controller_events_code.c,3126 :: 		void Up_15_OnPress() {
;Controller_events_code.c,3128 :: 		}
L_end_Up_15_OnPress:
BX	LR
; end of _Up_15_OnPress
_Up_15_OnUp:
;Controller_events_code.c,3129 :: 		void Up_15_OnUp() {
;Controller_events_code.c,3131 :: 		}
L_end_Up_15_OnUp:
BX	LR
; end of _Up_15_OnUp
_Down_16_OnPress:
;Controller_events_code.c,3132 :: 		void Down_16_OnPress() {
;Controller_events_code.c,3134 :: 		}
L_end_Down_16_OnPress:
BX	LR
; end of _Down_16_OnPress
_Down_16_OnUp:
;Controller_events_code.c,3135 :: 		void Down_16_OnUp() {
;Controller_events_code.c,3137 :: 		}
L_end_Down_16_OnUp:
BX	LR
; end of _Down_16_OnUp
_Up_16_OnPress:
;Controller_events_code.c,3138 :: 		void Up_16_OnPress() {
;Controller_events_code.c,3140 :: 		}
L_end_Up_16_OnPress:
BX	LR
; end of _Up_16_OnPress
_Up_16_OnUp:
;Controller_events_code.c,3141 :: 		void Up_16_OnUp() {
;Controller_events_code.c,3143 :: 		}
L_end_Up_16_OnUp:
BX	LR
; end of _Up_16_OnUp
_Down_17_OnPress:
;Controller_events_code.c,3144 :: 		void Down_17_OnPress() {      // Electric heater preset setting
;Controller_events_code.c,3146 :: 		}
L_end_Down_17_OnPress:
BX	LR
; end of _Down_17_OnPress
_Down_17_OnUp:
;Controller_events_code.c,3147 :: 		void Down_17_OnUp() {
;Controller_events_code.c,3149 :: 		}
L_end_Down_17_OnUp:
BX	LR
; end of _Down_17_OnUp
_Up_17_OnPress:
;Controller_events_code.c,3150 :: 		void Up_17_OnPress() {
;Controller_events_code.c,3152 :: 		}
L_end_Up_17_OnPress:
BX	LR
; end of _Up_17_OnPress
_Up_17_OnUp:
;Controller_events_code.c,3153 :: 		void Up_17_OnUp() {
;Controller_events_code.c,3155 :: 		}
L_end_Up_17_OnUp:
BX	LR
; end of _Up_17_OnUp
_Down_18_OnPress:
;Controller_events_code.c,3156 :: 		void Down_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3158 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3159 :: 		Image481.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3160 :: 		Down_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3161 :: 		DrawImage(&Image481);
MOVW	R0, #lo_addr(_Image481+0)
MOVT	R0, #hi_addr(_Image481+0)
BL	_DrawImage+0
;Controller_events_code.c,3162 :: 		system_reg[S_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+1026)
MOVT	R1, #hi_addr(_system_reg+1026)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3163 :: 		if (system_reg[S_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_18_OnPress292
;Controller_events_code.c,3164 :: 		system_reg[S_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1026)
MOVT	R0, #hi_addr(_system_reg+1026)
STRH	R1, [R0, #0]
L_Down_18_OnPress292:
;Controller_events_code.c,3165 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1026)
MOVT	R0, #hi_addr(_system_reg+1026)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3166 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3167 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3168 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3169 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_18_OnPress293:
SUBS	R7, R7, #1
BNE	L_Down_18_OnPress293
NOP
NOP
NOP
;Controller_events_code.c,3170 :: 		}
L_end_Down_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_18_OnPress
_Down_18_OnUp:
;Controller_events_code.c,3171 :: 		void Down_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3172 :: 		Image481.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3173 :: 		Down_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3174 :: 		DrawImage(&Down_18_);
MOVW	R0, #lo_addr(_Down_18_+0)
MOVT	R0, #hi_addr(_Down_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3175 :: 		}
L_end_Down_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_18_OnUp
_Up_18_OnPress:
;Controller_events_code.c,3176 :: 		void Up_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3178 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,3179 :: 		Image477.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3180 :: 		Up_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3181 :: 		DrawImage(&Image477);
MOVW	R0, #lo_addr(_Image477+0)
MOVT	R0, #hi_addr(_Image477+0)
BL	_DrawImage+0
;Controller_events_code.c,3182 :: 		system_reg[S_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+1026)
MOVT	R1, #hi_addr(_system_reg+1026)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3183 :: 		if (system_reg[S_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_18_OnPress295
;Controller_events_code.c,3184 :: 		system_reg[S_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+1026)
MOVT	R0, #hi_addr(_system_reg+1026)
STRH	R1, [R0, #0]
L_Up_18_OnPress295:
;Controller_events_code.c,3185 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+1026)
MOVT	R0, #hi_addr(_system_reg+1026)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3186 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3187 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3188 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3189 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_18_OnPress296:
SUBS	R7, R7, #1
BNE	L_Up_18_OnPress296
NOP
NOP
NOP
;Controller_events_code.c,3190 :: 		}
L_end_Up_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_18_OnPress
_Up_18_OnUp:
;Controller_events_code.c,3191 :: 		void Up_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3192 :: 		Image477.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3193 :: 		Up_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3194 :: 		DrawImage(&Up_18_);
MOVW	R0, #lo_addr(_Up_18_+0)
MOVT	R0, #hi_addr(_Up_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3195 :: 		}
L_end_Up_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_18_OnUp
_Set_15_OnUp:
;Controller_events_code.c,3196 :: 		void Set_15_OnUp() {
;Controller_events_code.c,3198 :: 		}
L_end_Set_15_OnUp:
BX	LR
; end of _Set_15_OnUp
_Set_15_OnDown:
;Controller_events_code.c,3199 :: 		void Set_15_OnDown() {
;Controller_events_code.c,3201 :: 		}
L_end_Set_15_OnDown:
BX	LR
; end of _Set_15_OnDown
_Set_16_OnUp:
;Controller_events_code.c,3202 :: 		void Set_16_OnUp() {
;Controller_events_code.c,3204 :: 		}
L_end_Set_16_OnUp:
BX	LR
; end of _Set_16_OnUp
_Set_16_OnDown:
;Controller_events_code.c,3205 :: 		void Set_16_OnDown() {
;Controller_events_code.c,3207 :: 		}
L_end_Set_16_OnDown:
BX	LR
; end of _Set_16_OnDown
_Set_17_OnUp:
;Controller_events_code.c,3208 :: 		void Set_17_OnUp () {
;Controller_events_code.c,3210 :: 		}
L_end_Set_17_OnUp:
BX	LR
; end of _Set_17_OnUp
_Set_17_OnDown:
;Controller_events_code.c,3211 :: 		void Set_17_OnDown() {
;Controller_events_code.c,3213 :: 		}
L_end_Set_17_OnDown:
BX	LR
; end of _Set_17_OnDown
_Set_18_OnUp:
;Controller_events_code.c,3214 :: 		void Set_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3215 :: 		Set_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3216 :: 		Image485.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3217 :: 		DrawImage (&Set_18_);
MOVW	R0, #lo_addr(_Set_18_+0)
MOVT	R0, #hi_addr(_Set_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3218 :: 		}
L_end_Set_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnUp
_Set_18_OnDown:
;Controller_events_code.c,3219 :: 		void Set_18_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3220 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3222 :: 		send_data_packet(S_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #513
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3223 :: 		Set_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3224 :: 		Image485.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3225 :: 		DrawImage (&Image485);
MOVW	R0, #lo_addr(_Image485+0)
MOVT	R0, #hi_addr(_Image485+0)
BL	_DrawImage+0
;Controller_events_code.c,3226 :: 		}
L_end_Set_18_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnDown
_Set_14_OnDown:
;Controller_events_code.c,3227 :: 		void Set_14_OnDown() {
;Controller_events_code.c,3229 :: 		}
L_end_Set_14_OnDown:
BX	LR
; end of _Set_14_OnDown
_Set_14_OnUp:
;Controller_events_code.c,3230 :: 		void Set_14_OnUp(){
;Controller_events_code.c,3231 :: 		}
L_end_Set_14_OnUp:
BX	LR
; end of _Set_14_OnUp
_Set_13_OnUp:
;Controller_events_code.c,3232 :: 		void Set_13_OnUp() {
;Controller_events_code.c,3234 :: 		}
L_end_Set_13_OnUp:
BX	LR
; end of _Set_13_OnUp
_Set_13_OnDown:
;Controller_events_code.c,3235 :: 		void Set_13_OnDown() {
;Controller_events_code.c,3237 :: 		}
L_end_Set_13_OnDown:
BX	LR
; end of _Set_13_OnDown
