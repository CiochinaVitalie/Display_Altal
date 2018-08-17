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
;Controller_events_code.c,76 :: 		if( num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_goToBack10
;Controller_events_code.c,78 :: 		if(CurrentScreen == &SYSTEM_SET)DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack11
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack12
L_goToBack11:
;Controller_events_code.c,79 :: 		else if (CurrentScreen==&ERRORS)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack13
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack14
L_goToBack13:
;Controller_events_code.c,80 :: 		else if (CurrentScreen==&SENSOR1)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack15
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack16
L_goToBack15:
;Controller_events_code.c,81 :: 		else if (CurrentScreen==&SETTINGS)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack17
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack18
L_goToBack17:
;Controller_events_code.c,82 :: 		else if (CurrentScreen==&ENERGY)  DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack19
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack20
L_goToBack19:
;Controller_events_code.c,83 :: 		else if(CurrentScreen == &EEV) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack21
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack22
L_goToBack21:
;Controller_events_code.c,84 :: 		else if(CurrentScreen == &DELAY_MENU) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack23
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack24
L_goToBack23:
;Controller_events_code.c,85 :: 		else if(CurrentScreen == &LIMITS1) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack25
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack26
L_goToBack25:
;Controller_events_code.c,86 :: 		else if(CurrentScreen == &SYSTEM_EVENTS) DrawScreen(&SYSTEM_SET);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack27
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack28
L_goToBack27:
;Controller_events_code.c,87 :: 		else if (CurrentScreen==&LIMITS2)  DrawScreen(&LIMITS1);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack29
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack30
L_goToBack29:
;Controller_events_code.c,88 :: 		else if (CurrentScreen==&LIMITS3)  DrawScreen(&LIMITS2);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack31
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack32
L_goToBack31:
;Controller_events_code.c,89 :: 		else if (CurrentScreen==&LIMITS4)  DrawScreen(&LIMITS3);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack33
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack34
L_goToBack33:
;Controller_events_code.c,90 :: 		else if (CurrentScreen==&LIMITS5)  DrawScreen(&LIMITS4);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack35
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
IT	AL
BAL	L_goToBack36
L_goToBack35:
;Controller_events_code.c,91 :: 		else if (CurrentScreen==&MODE2)    DrawScreen(&MODE);
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack37
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
L_goToBack37:
L_goToBack36:
L_goToBack34:
L_goToBack32:
L_goToBack30:
L_goToBack28:
L_goToBack26:
L_goToBack24:
L_goToBack22:
L_goToBack20:
L_goToBack18:
L_goToBack16:
L_goToBack14:
L_goToBack12:
;Controller_events_code.c,92 :: 		}
IT	AL
BAL	L_goToBack38
L_goToBack10:
;Controller_events_code.c,93 :: 		else   num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
L_goToBack38:
;Controller_events_code.c,94 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,95 :: 		}
L_end_goToBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _goToBack
_nextPage:
;Controller_events_code.c,96 :: 		void nextPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,97 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,99 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,100 :: 		if (CurrentScreen==&LIMITS1){DrawScreen(&LIMITS2);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage39
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
IT	AL
BAL	L_nextPage40
L_nextPage39:
;Controller_events_code.c,101 :: 		else if (CurrentScreen==&LIMITS2){DrawScreen(&LIMITS3);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage41
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
IT	AL
BAL	L_nextPage42
L_nextPage41:
;Controller_events_code.c,102 :: 		else if (CurrentScreen==&LIMITS3){DrawScreen(&LIMITS4);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage43
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
IT	AL
BAL	L_nextPage44
L_nextPage43:
;Controller_events_code.c,103 :: 		else if (CurrentScreen==&LIMITS4){DrawScreen(&LIMITS5);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage45
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
BL	_DrawScreen+0
IT	AL
BAL	L_nextPage46
L_nextPage45:
;Controller_events_code.c,104 :: 		else if (CurrentScreen==&MODE){DrawScreen(&MODE2);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage47
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
BL	_DrawScreen+0
L_nextPage47:
L_nextPage46:
L_nextPage44:
L_nextPage42:
L_nextPage40:
;Controller_events_code.c,105 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,106 :: 		}
L_end_nextPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nextPage
_selectPage:
;Controller_events_code.c,107 :: 		void selectPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,111 :: 		if (CurrentScreen==&HOME)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage48
;Controller_events_code.c,113 :: 		main_page();
BL	_main_page+0
;Controller_events_code.c,114 :: 		reciev_data_packet(BAC_TEMP,2);
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,115 :: 		reciev_data_packet(SOURC_IN_1,2);
MOVS	R1, #2
MOVW	R0, #151
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,116 :: 		}
IT	AL
BAL	L_selectPage49
L_selectPage48:
;Controller_events_code.c,118 :: 		else if(CurrentScreen==&SENSOR1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage50
;Controller_events_code.c,120 :: 		sensor_1(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_sensor_1+0
;Controller_events_code.c,121 :: 		reciev_data_packet(BAC_TEMP,2);
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,122 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage51
;Controller_events_code.c,124 :: 		reciev_data_packet(CONDENS_TEMP_1,12);
MOVS	R1, #12
MOVW	R0, #91
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,125 :: 		if(strcmp(CircleButton10.Caption,"1")!=0){CircleButton10.Caption="1";DrawCircleButton(&CircleButton10);  }
MOVW	R1, #lo_addr(?lstr1_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr1_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage52
MOVW	R1, #lo_addr(?lstr2_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr2_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton10+0)
MOVT	R0, #hi_addr(_CircleButton10+0)
BL	_DrawCircleButton+0
L_selectPage52:
;Controller_events_code.c,126 :: 		}
IT	AL
BAL	L_selectPage53
L_selectPage51:
;Controller_events_code.c,128 :: 		{reciev_data_packet(CONDENS_TEMP_2,12);
MOVS	R1, #12
MOVW	R0, #92
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,129 :: 		if(strcmp(CircleButton10.Caption,"2")!=0) {CircleButton10.Caption="2";DrawCircleButton(&CircleButton10);}
MOVW	R1, #lo_addr(?lstr3_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr3_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage54
MOVW	R1, #lo_addr(?lstr4_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr4_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton10+0)
MOVT	R0, #hi_addr(_CircleButton10+0)
BL	_DrawCircleButton+0
L_selectPage54:
;Controller_events_code.c,130 :: 		}
L_selectPage53:
;Controller_events_code.c,131 :: 		}
IT	AL
BAL	L_selectPage55
L_selectPage50:
;Controller_events_code.c,134 :: 		else if(CurrentScreen==&GAUGE1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage56
;Controller_events_code.c,136 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage57
;Controller_events_code.c,138 :: 		LP_display(system_reg[LOW_PRESS_1]),HP_display(system_reg[HIGH_PRESS_1]);reciev_data_packet(HIGH_PRESS_1,2);
MOVW	R0, #lo_addr(_system_reg+362)
MOVT	R0, #hi_addr(_system_reg+362)
LDRSH	R0, [R0, #0]
BL	_LP_display+0
MOVW	R0, #lo_addr(_system_reg+342)
MOVT	R0, #hi_addr(_system_reg+342)
LDRSH	R0, [R0, #0]
BL	_HP_display+0
MOVS	R1, #2
MOVW	R0, #171
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,139 :: 		if(strcmp(CircleButton8.Caption,"1")!=0) {CircleButton8.Caption="1";DrawCircleButton(&CircleButton8);Next_b2.Caption="NEXT";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=nextPage;}
MOVW	R1, #lo_addr(?lstr5_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr5_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage58
MOVW	R1, #lo_addr(?lstr6_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr6_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton8+0)
MOVT	R0, #hi_addr(_CircleButton8+0)
BL	_DrawCircleButton+0
MOVW	R1, #lo_addr(?lstr7_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr7_Controller_events_code+0)
MOVW	R0, #lo_addr(_Next_b2+24)
MOVT	R0, #hi_addr(_Next_b2+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Next_b2+0)
MOVT	R0, #hi_addr(_Next_b2+0)
BL	_DrawRoundButton+0
MOVW	R1, #lo_addr(_nextPage+0)
MOVT	R1, #hi_addr(_nextPage+0)
MOVW	R0, #lo_addr(_Next_b2+60)
MOVT	R0, #hi_addr(_Next_b2+60)
STR	R1, [R0, #0]
L_selectPage58:
;Controller_events_code.c,140 :: 		}
IT	AL
BAL	L_selectPage59
L_selectPage57:
;Controller_events_code.c,143 :: 		LP_display(system_reg[LOW_PRESS_2]),HP_display(system_reg[HIGH_PRESS_2]);reciev_data_packet(HIGH_PRESS_2,2);
MOVW	R0, #lo_addr(_system_reg+364)
MOVT	R0, #hi_addr(_system_reg+364)
LDRSH	R0, [R0, #0]
BL	_LP_display+0
MOVW	R0, #lo_addr(_system_reg+344)
MOVT	R0, #hi_addr(_system_reg+344)
LDRSH	R0, [R0, #0]
BL	_HP_display+0
MOVS	R1, #2
MOVW	R0, #172
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,144 :: 		if(strcmp(CircleButton8.Caption,"2")!=0){CircleButton8.Caption="2";DrawCircleButton(&CircleButton8);Next_b2.Caption="BACK";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr8_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr8_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage60
MOVW	R1, #lo_addr(?lstr9_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr9_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton8+0)
MOVT	R0, #hi_addr(_CircleButton8+0)
BL	_DrawCircleButton+0
MOVW	R1, #lo_addr(?lstr10_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr10_Controller_events_code+0)
MOVW	R0, #lo_addr(_Next_b2+24)
MOVT	R0, #hi_addr(_Next_b2+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Next_b2+0)
MOVT	R0, #hi_addr(_Next_b2+0)
BL	_DrawRoundButton+0
MOVW	R1, #lo_addr(_goToBack+0)
MOVT	R1, #hi_addr(_goToBack+0)
MOVW	R0, #lo_addr(_Next_b2+60)
MOVT	R0, #hi_addr(_Next_b2+60)
STR	R1, [R0, #0]
L_selectPage60:
;Controller_events_code.c,145 :: 		}
L_selectPage59:
;Controller_events_code.c,146 :: 		}
IT	AL
BAL	L_selectPage61
L_selectPage56:
;Controller_events_code.c,147 :: 		else if(CurrentScreen==&EEV){ count_steps(num_page); reciev_data_packet(S_HEAT_1,3);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage62
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_count_steps+0
MOVS	R1, #3
MOVW	R0, #121
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage63
L_selectPage62:
;Controller_events_code.c,148 :: 		else if(CurrentScreen==&SYSTEM_EVENTS){working_time(num_page);reciev_data_packet(TIM_P_HEAT_1,5);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage64
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_working_time+0
MOVS	R1, #5
MOVW	R0, #351
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage65
L_selectPage64:
;Controller_events_code.c,149 :: 		else if(CurrentScreen==&Schema1){schema1_page();reciev_data_packet(DHW_TEMP,32);}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage66
BL	_schema1_page+0
MOVS	R1, #32
MOVW	R0, #81
SXTH	R0, R0
BL	_reciev_data_packet+0
L_selectPage66:
L_selectPage65:
L_selectPage63:
L_selectPage61:
L_selectPage55:
L_selectPage49:
;Controller_events_code.c,150 :: 		}
L_end_selectPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _selectPage
_Main_OFFOnClick:
;Controller_events_code.c,153 :: 		void Main_OFFOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,155 :: 		if ((unsigned long)Main_OFF.Picture_Name == main_off_bmp)
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
LDR	R1, [R0, #0]
MOVW	R0, #8080
MOVT	R0, #8
CMP	R1, R0
IT	NE
BNE	L_Main_OFFOnClick67
;Controller_events_code.c,157 :: 		Main_OFF.Picture_Name = main_on_bmp;
MOVW	R1, #64494
MOVT	R1, #7
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,158 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Controller_events_code.c,159 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,160 :: 		Messages_Label.Caption = "SYSTEM  ON";
MOVW	R1, #lo_addr(?lstr11_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr11_Controller_events_code+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_events_code.c,161 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_events_code.c,162 :: 		SYSTEM_ON=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,163 :: 		system_reg[POWER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,165 :: 		}
IT	AL
BAL	L_Main_OFFOnClick68
L_Main_OFFOnClick67:
;Controller_events_code.c,167 :: 		Main_OFF.Picture_Name = main_off_bmp;
MOVW	R1, #8080
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,168 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,169 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,170 :: 		Messages_Label.Caption = "SYSTEM  OFF";
MOVW	R1, #lo_addr(?lstr12_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr12_Controller_events_code+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_events_code.c,171 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_events_code.c,172 :: 		SYSTEM_ON=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,173 :: 		system_reg[POWER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,175 :: 		}
L_Main_OFFOnClick68:
;Controller_events_code.c,177 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,178 :: 		send_data_packet(POWER,1);
MOVS	R1, #1
MOVW	R0, #310
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,179 :: 		adressReg= POWER;
MOVW	R1, #310
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,180 :: 		nomReg =1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,181 :: 		}
L_end_Main_OFFOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Main_OFFOnClick
_bar_heatingOnClick:
;Controller_events_code.c,182 :: 		void bar_heatingOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,185 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 )
MOVW	R1, #lo_addr(?lstr13_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr13_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick69
;Controller_events_code.c,187 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr14_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr14_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,188 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,189 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,191 :: 		system_reg[COOL]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,192 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,194 :: 		}
IT	AL
BAL	L_bar_heatingOnClick70
L_bar_heatingOnClick69:
;Controller_events_code.c,195 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0 )
MOVW	R1, #lo_addr(?lstr15_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr15_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick71
;Controller_events_code.c,197 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr16_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr16_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,198 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,199 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,201 :: 		system_reg[HEAT]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,202 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,204 :: 		}
L_bar_heatingOnClick71:
L_bar_heatingOnClick70:
;Controller_events_code.c,206 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 ) {send_data_packet(HEAT,2);
MOVW	R1, #lo_addr(?lstr17_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr17_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick72
MOVS	R1, #2
MOVW	R0, #200
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,207 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,208 :: 		adressReg= HEAT;
MOVW	R1, #200
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,209 :: 		nomReg =2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,210 :: 		}
L_bar_heatingOnClick72:
;Controller_events_code.c,212 :: 		}
L_end_bar_heatingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bar_heatingOnClick
_DHW_SetingOnClick:
;Controller_events_code.c,213 :: 		void DHW_SetingOnClick()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,216 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_DHW_SetingOnClick73
;Controller_events_code.c,217 :: 		Set_Dhw_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,218 :: 		Set_Dhw_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,219 :: 		DHW_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,220 :: 		DHW_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,221 :: 		DHW_DOWN.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,222 :: 		DHW_DOWN.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,223 :: 		DHW_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,224 :: 		DHW_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,225 :: 		dhw_temp_main.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_temp_main+27)
MOVT	R0, #hi_addr(_dhw_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,226 :: 		dhw_temp_main.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_temp_main+28)
MOVT	R0, #hi_addr(_dhw_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,227 :: 		dhw_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,228 :: 		dhw_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,229 :: 		dhw_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,230 :: 		dhw_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,231 :: 		dhw_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,232 :: 		dhw_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,233 :: 		BoxRound2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,234 :: 		BoxRound2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,235 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,237 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,238 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,239 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_SetingOnClick325
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_SetingOnClick324
L__DHW_SetingOnClick323:
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
L__DHW_SetingOnClick325:
L__DHW_SetingOnClick324:
;Controller_events_code.c,240 :: 		DHW_Seting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr18_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr18_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,241 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,242 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,244 :: 		DrawRoundButton(&DHW_UP);
MOVW	R0, #lo_addr(_DHW_UP+0)
MOVT	R0, #hi_addr(_DHW_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,245 :: 		DrawRoundButton(&DHW_DOWN);
MOVW	R0, #lo_addr(_DHW_DOWN+0)
MOVT	R0, #hi_addr(_DHW_DOWN+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,246 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,247 :: 		count_push++;
MOVW	R1, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,248 :: 		}
IT	AL
BAL	L_DHW_SetingOnClick77
L_DHW_SetingOnClick73:
;Controller_events_code.c,250 :: 		Set_Dhw_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,251 :: 		Set_Dhw_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,252 :: 		DHW_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,253 :: 		DHW_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,254 :: 		DHW_DOWN.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,255 :: 		DHW_DOWN.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,256 :: 		DHW_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,257 :: 		DHW_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,258 :: 		dhw_temp_main.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_temp_main+27)
MOVT	R0, #hi_addr(_dhw_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,259 :: 		dhw_temp_main.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_temp_main+28)
MOVT	R0, #hi_addr(_dhw_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,260 :: 		dhw_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,261 :: 		dhw_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,262 :: 		dhw_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,263 :: 		dhw_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,264 :: 		dhw_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,265 :: 		dhw_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,266 :: 		BoxRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,267 :: 		BoxRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,268 :: 		DHW_Seting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr19_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr19_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,270 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,271 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,272 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,273 :: 		DrawRoundButton (& ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,274 :: 		DrawImage(&dhw_icon);
MOVW	R0, #lo_addr(_dhw_icon+0)
MOVT	R0, #hi_addr(_dhw_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,275 :: 		DrawRoundButton(&bar_DHW);
MOVW	R0, #lo_addr(_bar_DHW+0)
MOVT	R0, #hi_addr(_bar_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,276 :: 		DrawLabel (&dhw_temp_main);
MOVW	R0, #lo_addr(_dhw_temp_main+0)
MOVT	R0, #hi_addr(_dhw_temp_main+0)
BL	_DrawLabel+0
;Controller_events_code.c,277 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,278 :: 		DrawLabel(&dhw_point);
MOVW	R0, #lo_addr(_dhw_point+0)
MOVT	R0, #hi_addr(_dhw_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,279 :: 		DrawLabel(&dhw_celc);
MOVW	R0, #lo_addr(_dhw_celc+0)
MOVT	R0, #hi_addr(_dhw_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,280 :: 		send_data_packet(SET_DHW,1);
MOVS	R1, #1
MOVW	R0, #330
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,281 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,282 :: 		adressReg= SET_DHW;
MOVW	R1, #330
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,283 :: 		nomReg =1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,284 :: 		}
L_DHW_SetingOnClick77:
;Controller_events_code.c,287 :: 		}
L_end_DHW_SetingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_SetingOnClick
_Heat_SettingOnClick:
;Controller_events_code.c,288 :: 		void Heat_SettingOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,292 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick78
;Controller_events_code.c,293 :: 		Set_Heat_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,294 :: 		Set_Heat_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,295 :: 		HEAT_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,296 :: 		HEAT_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,297 :: 		HEAT_Down.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,298 :: 		HEAT_Down.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,299 :: 		TEMP_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,300 :: 		TEMP_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,301 :: 		heat_temp_main.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_temp_main+27)
MOVT	R0, #hi_addr(_heat_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,302 :: 		heat_temp_main.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_temp_main+28)
MOVT	R0, #hi_addr(_heat_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,303 :: 		heat_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,304 :: 		heat_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,305 :: 		heat_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,306 :: 		heat_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,307 :: 		heat_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,308 :: 		heat_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,309 :: 		heatBox.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heatBox+18)
MOVT	R0, #hi_addr(_heatBox+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,310 :: 		heatBox.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heatBox+19)
MOVT	R0, #hi_addr(_heatBox+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,311 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0 )IntToStr(system_reg[SET_HEAT], txt);
MOVW	R1, #lo_addr(?lstr20_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr20_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick79
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
IT	AL
BAL	L_Heat_SettingOnClick80
L_Heat_SettingOnClick79:
;Controller_events_code.c,312 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0) IntToStr(system_reg[SET_COOL], txt);
MOVW	R1, #lo_addr(?lstr21_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr21_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick81
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
L_Heat_SettingOnClick81:
L_Heat_SettingOnClick80:
;Controller_events_code.c,313 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,314 :: 		strncpy(TEMP_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,315 :: 		if(system_reg[SET_HEAT]<10 && system_reg[SET_HEAT]>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__Heat_SettingOnClick328
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__Heat_SettingOnClick327
L__Heat_SettingOnClick326:
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
L__Heat_SettingOnClick328:
L__Heat_SettingOnClick327:
;Controller_events_code.c,316 :: 		Heat_Setting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr22_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr22_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,317 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,318 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,319 :: 		DrawRoundButton(&HEAT_UP);
MOVW	R0, #lo_addr(_HEAT_UP+0)
MOVT	R0, #hi_addr(_HEAT_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,320 :: 		DrawRoundButton(&HEAT_DOWN);
MOVW	R0, #lo_addr(_HEAT_Down+0)
MOVT	R0, #hi_addr(_HEAT_Down+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,321 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,322 :: 		count_push++;
MOVW	R1, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,323 :: 		}
IT	AL
BAL	L_Heat_SettingOnClick85
L_Heat_SettingOnClick78:
;Controller_events_code.c,325 :: 		Set_Heat_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,326 :: 		Set_Heat_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,327 :: 		HEAT_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,328 :: 		HEAT_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,329 :: 		HEAT_Down.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,330 :: 		HEAT_Down.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,331 :: 		TEMP_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,332 :: 		TEMP_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,333 :: 		heat_temp_main.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_temp_main+27)
MOVT	R0, #hi_addr(_heat_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,334 :: 		heat_temp_main.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_temp_main+28)
MOVT	R0, #hi_addr(_heat_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,335 :: 		heat_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,336 :: 		heat_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,337 :: 		heat_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,338 :: 		heat_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,339 :: 		heat_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,340 :: 		heat_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,341 :: 		heatBox.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heatBox+18)
MOVT	R0, #hi_addr(_heatBox+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,342 :: 		heatBox.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heatBox+19)
MOVT	R0, #hi_addr(_heatBox+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,344 :: 		Heat_Setting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr23_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr23_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,345 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,346 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,347 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,348 :: 		DrawRoundButton (& ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,349 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,350 :: 		DrawLabel (&heat_temp_main);
MOVW	R0, #lo_addr(_heat_temp_main+0)
MOVT	R0, #hi_addr(_heat_temp_main+0)
BL	_DrawLabel+0
;Controller_events_code.c,351 :: 		DrawCircle(&heat_led);
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,352 :: 		DrawLabel(&heat_point);
MOVW	R0, #lo_addr(_heat_point+0)
MOVT	R0, #hi_addr(_heat_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,353 :: 		DrawLabel(&heat_celc);
MOVW	R0, #lo_addr(_heat_celc+0)
MOVT	R0, #hi_addr(_heat_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,354 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 ){ DrawImage(&heat_icon);send_data_packet(SET_HEAT,1);adressReg= SET_HEAT;nomReg =1;}
MOVW	R1, #lo_addr(?lstr24_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr24_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick86
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #340
SXTH	R0, R0
BL	_send_data_packet+0
MOVW	R1, #340
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Heat_SettingOnClick87
L_Heat_SettingOnClick86:
;Controller_events_code.c,355 :: 		else  {DrawImage(&cool_icon);send_data_packet(SET_COOL,1);adressReg= SET_COOL;nomReg =1;}
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #320
SXTH	R0, R0
BL	_send_data_packet+0
MOVW	R1, #320
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
L_Heat_SettingOnClick87:
;Controller_events_code.c,356 :: 		}
L_Heat_SettingOnClick85:
;Controller_events_code.c,357 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,359 :: 		}
L_end_Heat_SettingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Heat_SettingOnClick
_Click_HEAT:
;Controller_events_code.c,361 :: 		void Click_HEAT()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,363 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 )
MOVW	R1, #lo_addr(?lstr25_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr25_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT88
;Controller_events_code.c,365 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr26_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr26_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,366 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,367 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,368 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,369 :: 		}
IT	AL
BAL	L_Click_HEAT89
L_Click_HEAT88:
;Controller_events_code.c,371 :: 		{   if(strcmp(bar_heating.Caption,"HEATING")==0 ){system_reg[HEAT]=1;system_reg[COOL]=0;}
MOVW	R1, #lo_addr(?lstr27_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr27_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT90
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
IT	AL
BAL	L_Click_HEAT91
L_Click_HEAT90:
;Controller_events_code.c,372 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0 ){system_reg[HEAT]=0;system_reg[COOL]=1;}
MOVW	R1, #lo_addr(?lstr28_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr28_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT92
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
L_Click_HEAT92:
L_Click_HEAT91:
;Controller_events_code.c,373 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr29_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr29_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,374 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,376 :: 		}
L_Click_HEAT89:
;Controller_events_code.c,377 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,378 :: 		adressReg= HEAT;
MOVW	R1, #200
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,379 :: 		nomReg =2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,380 :: 		send_data_packet(HEAT,2);
MOVS	R1, #2
MOVW	R0, #200
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,382 :: 		}
L_end_Click_HEAT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_HEAT
_Click_DHW:
;Controller_events_code.c,383 :: 		void Click_DHW()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,386 :: 		if (strcmp(ON_OFF_DHW.Caption,"ON")==0)
MOVW	R1, #lo_addr(?lstr30_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr30_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_DHW93
;Controller_events_code.c,388 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr31_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr31_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,389 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,390 :: 		system_reg[HEATWATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,391 :: 		}
IT	AL
BAL	L_Click_DHW94
L_Click_DHW93:
;Controller_events_code.c,394 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr32_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr32_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,395 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,396 :: 		system_reg[HEATWATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,397 :: 		}
L_Click_DHW94:
;Controller_events_code.c,398 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,399 :: 		adressReg= HEATWATER;
MOVW	R1, #210
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,400 :: 		nomReg =1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,401 :: 		send_data_packet(HEATWATER,1);
MOVS	R1, #1
MOVW	R0, #210
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,402 :: 		}
L_end_Click_DHW:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_DHW
_MainBut1OnUp:
;Controller_events_code.c,403 :: 		void MainBut1OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,404 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,405 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,406 :: 		Image25.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,407 :: 		DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,408 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,410 :: 		}
L_end_MainBut1OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnUp
_MainBut1OnPress:
;Controller_events_code.c,411 :: 		void MainBut1OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,412 :: 		Image25.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,413 :: 		DrawImage(&Image25);
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
BL	_DrawImage+0
;Controller_events_code.c,414 :: 		}
L_end_MainBut1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnPress
_MainBut2OnUp:
;Controller_events_code.c,415 :: 		void MainBut2OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,416 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,417 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,418 :: 		Image40.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,419 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp333
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp332
L__MainBut2OnUp331:
;Controller_events_code.c,420 :: 		DrawScreen (&Schema2);
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
BL	_DrawScreen+0
;Controller_events_code.c,421 :: 		}
IT	AL
BAL	L_MainBut2OnUp98
;Controller_events_code.c,419 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
L__MainBut2OnUp333:
L__MainBut2OnUp332:
;Controller_events_code.c,422 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp335
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp334
L__MainBut2OnUp330:
;Controller_events_code.c,423 :: 		DrawScreen (&AIR_TWO);
MOVW	R0, #lo_addr(_AIR_TWO+0)
MOVT	R0, #hi_addr(_AIR_TWO+0)
BL	_DrawScreen+0
;Controller_events_code.c,424 :: 		}
IT	AL
BAL	L_MainBut2OnUp102
;Controller_events_code.c,422 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
L__MainBut2OnUp335:
L__MainBut2OnUp334:
;Controller_events_code.c,425 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp337
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp336
L__MainBut2OnUp329:
;Controller_events_code.c,426 :: 		DrawScreen(&Schema1);//DrawScreen (&AIR_ONE);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,427 :: 		}
IT	AL
BAL	L_MainBut2OnUp106
;Controller_events_code.c,425 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
L__MainBut2OnUp337:
L__MainBut2OnUp336:
;Controller_events_code.c,429 :: 		DrawScreen(&Schema1);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,430 :: 		}
L_MainBut2OnUp106:
L_MainBut2OnUp102:
L_MainBut2OnUp98:
;Controller_events_code.c,432 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,434 :: 		}
L_end_MainBut2OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnUp
_MainBut2OnPress:
;Controller_events_code.c,435 :: 		void MainBut2OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,436 :: 		Image40.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,437 :: 		DrawImage(&Image40);
MOVW	R0, #lo_addr(_Image40+0)
MOVT	R0, #hi_addr(_Image40+0)
BL	_DrawImage+0
;Controller_events_code.c,439 :: 		}
L_end_MainBut2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnPress
_MainBut3OnUp:
;Controller_events_code.c,440 :: 		void MainBut3OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,441 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,442 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,443 :: 		Image44.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,444 :: 		DrawScreen(&DEVICES);
MOVW	R0, #lo_addr(_DEVICES+0)
MOVT	R0, #hi_addr(_DEVICES+0)
BL	_DrawScreen+0
;Controller_events_code.c,445 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,447 :: 		}
L_end_MainBut3OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnUp
_MainBut3OnPress:
;Controller_events_code.c,448 :: 		void MainBut3OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,449 :: 		Image44.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,450 :: 		DrawImage(&Image44);
MOVW	R0, #lo_addr(_Image44+0)
MOVT	R0, #hi_addr(_Image44+0)
BL	_DrawImage+0
;Controller_events_code.c,451 :: 		}
L_end_MainBut3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnPress
_MainBut4OnUp:
;Controller_events_code.c,452 :: 		void MainBut4OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,453 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,454 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,455 :: 		Image61.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,456 :: 		old_HP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_HP_pressure+0)
MOVT	R0, #hi_addr(_old_HP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,457 :: 		old_LP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_LP_pressure+0)
MOVT	R0, #hi_addr(_old_LP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,458 :: 		DrawScreen(&GAUGE1);
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
BL	_DrawScreen+0
;Controller_events_code.c,459 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,460 :: 		}
L_end_MainBut4OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnUp
_MainBut4OnPress:
;Controller_events_code.c,461 :: 		void MainBut4OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,462 :: 		Image61.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,463 :: 		DrawImage(&Image61);
MOVW	R0, #lo_addr(_Image61+0)
MOVT	R0, #hi_addr(_Image61+0)
BL	_DrawImage+0
;Controller_events_code.c,464 :: 		}
L_end_MainBut4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnPress
_MainBut5OnUp:
;Controller_events_code.c,465 :: 		void MainBut5OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,466 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,467 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,468 :: 		Image87.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,469 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,470 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,471 :: 		}
L_end_MainBut5OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnUp
_MainBut5OnPress:
;Controller_events_code.c,472 :: 		void MainBut5OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,473 :: 		Image87.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,474 :: 		DrawImage(&Image87);
MOVW	R0, #lo_addr(_Image87+0)
MOVT	R0, #hi_addr(_Image87+0)
BL	_DrawImage+0
;Controller_events_code.c,475 :: 		}
L_end_MainBut5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnPress
_DHW_UPOnClick:
;Controller_events_code.c,476 :: 		void  DHW_UPOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,478 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,479 :: 		system_reg[SET_DHW]++;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,480 :: 		if(system_reg[SET_DHW]>system_reg[HEAT_MAX]) system_reg[SET_DHW]=system_reg[HEAT_MAX];
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L_DHW_UPOnClick107
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_UPOnClick107:
;Controller_events_code.c,481 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,482 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,483 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,484 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_UPOnClick340
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_UPOnClick339
L__DHW_UPOnClick338:
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
L__DHW_UPOnClick340:
L__DHW_UPOnClick339:
;Controller_events_code.c,485 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,486 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,487 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_DHW_UPOnClick111:
SUBS	R7, R7, #1
BNE	L_DHW_UPOnClick111
NOP
NOP
NOP
;Controller_events_code.c,488 :: 		}
L_end_DHW_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_UPOnClick
_DHW_DOWNOnClick:
;Controller_events_code.c,489 :: 		void DHW_DOWNOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,491 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,492 :: 		system_reg[SET_DHW]--;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,493 :: 		if(system_reg[SET_DHW]<system_reg[HEAT_MIN]) system_reg[SET_DHW]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_DHW_DOWNOnClick113
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_DOWNOnClick113:
;Controller_events_code.c,494 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,495 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,496 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,497 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_DOWNOnClick343
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_DOWNOnClick342
L__DHW_DOWNOnClick341:
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
L__DHW_DOWNOnClick343:
L__DHW_DOWNOnClick342:
;Controller_events_code.c,498 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,499 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,500 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_DHW_DOWNOnClick117:
SUBS	R7, R7, #1
BNE	L_DHW_DOWNOnClick117
NOP
NOP
NOP
;Controller_events_code.c,502 :: 		}
L_end_DHW_DOWNOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_DOWNOnClick
_HEAT_UPOnClick:
;Controller_events_code.c,503 :: 		void HEAT_UPOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,506 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,508 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr33_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr33_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick119
;Controller_events_code.c,509 :: 		system_reg[SET_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+680)
MOVT	R1, #hi_addr(_system_reg+680)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,510 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,511 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,512 :: 		}
IT	AL
BAL	L_HEAT_UPOnClick120
L_HEAT_UPOnClick119:
;Controller_events_code.c,513 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr34_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr34_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick121
;Controller_events_code.c,514 :: 		system_reg[SET_COOL]++;
MOVW	R1, #lo_addr(_system_reg+640)
MOVT	R1, #hi_addr(_system_reg+640)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,516 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,517 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,518 :: 		}
L_HEAT_UPOnClick121:
L_HEAT_UPOnClick120:
;Controller_events_code.c,519 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,520 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,521 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_UPOnClick346
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_UPOnClick345
L__HEAT_UPOnClick344:
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
L__HEAT_UPOnClick346:
L__HEAT_UPOnClick345:
;Controller_events_code.c,522 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,523 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,524 :: 		}
L_end_HEAT_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_UPOnClick
_HEAT_DownOnClick:
;Controller_events_code.c,525 :: 		void HEAT_DownOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,528 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,529 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr35_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr35_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick125
;Controller_events_code.c,530 :: 		system_reg[SET_HEAT]--;
MOVW	R2, #lo_addr(_system_reg+680)
MOVT	R2, #hi_addr(_system_reg+680)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,531 :: 		if(system_reg[SET_HEAT]<system_reg[HEAT_MIN]) system_reg[SET_HEAT]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick126
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick126:
;Controller_events_code.c,532 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,533 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,534 :: 		}
IT	AL
BAL	L_HEAT_DownOnClick127
L_HEAT_DownOnClick125:
;Controller_events_code.c,535 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr36_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr36_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick128
;Controller_events_code.c,536 :: 		system_reg[SET_COOL]--;
MOVW	R2, #lo_addr(_system_reg+640)
MOVT	R2, #hi_addr(_system_reg+640)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,537 :: 		if(system_reg[SET_COOL]<system_reg[COOL_MIN]) system_reg[SET_COOL]=system_reg[COOL_MIN];
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick129
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick129:
;Controller_events_code.c,538 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,539 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,540 :: 		}
L_HEAT_DownOnClick128:
L_HEAT_DownOnClick127:
;Controller_events_code.c,541 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,542 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,543 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_DownOnClick349
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_DownOnClick348
L__HEAT_DownOnClick347:
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
L__HEAT_DownOnClick349:
L__HEAT_DownOnClick348:
;Controller_events_code.c,544 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,545 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,547 :: 		}
L_end_HEAT_DownOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_DownOnClick
_user_settingOnUp:
;Controller_events_code.c,549 :: 		void user_settingOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,550 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,551 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,552 :: 		Image105.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,553 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,554 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,555 :: 		}
L_end_user_settingOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnUp
_user_settingOnPress:
;Controller_events_code.c,556 :: 		void  user_settingOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,557 :: 		Image105.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,558 :: 		DrawImage(&Image105);
MOVW	R0, #lo_addr(_Image105+0)
MOVT	R0, #hi_addr(_Image105+0)
BL	_DrawImage+0
;Controller_events_code.c,559 :: 		}
L_end_user_settingOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnPress
_user_set_timeOnPress:
;Controller_events_code.c,560 :: 		void user_set_timeOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,561 :: 		Image39.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,562 :: 		DrawImage(&Image39);
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
BL	_DrawImage+0
;Controller_events_code.c,563 :: 		}
L_end_user_set_timeOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnPress
_user_set_timeOnUp:
;Controller_events_code.c,564 :: 		void user_set_timeOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,565 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,566 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,567 :: 		Image39.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,569 :: 		DrawScreen(&SetRTC);
MOVW	R0, #lo_addr(_SetRTC+0)
MOVT	R0, #hi_addr(_SetRTC+0)
BL	_DrawScreen+0
;Controller_events_code.c,570 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,571 :: 		}
L_end_user_set_timeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnUp
_user_check_temperatureOnPress:
;Controller_events_code.c,573 :: 		void user_check_temperatureOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,574 :: 		Image48.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,575 :: 		DrawImage(&Image48);
MOVW	R0, #lo_addr(_Image48+0)
MOVT	R0, #hi_addr(_Image48+0)
BL	_DrawImage+0
;Controller_events_code.c,576 :: 		}
L_end_user_check_temperatureOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnPress
_user_check_temperatureOnUp:
;Controller_events_code.c,577 :: 		void user_check_temperatureOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,578 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,579 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,580 :: 		Image48.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,581 :: 		strcpy(S_Brine_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr37_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr37_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,582 :: 		strcpy(S_Brine_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr38_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr38_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,583 :: 		strcpy(S_Heat_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr39_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr39_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,584 :: 		strcpy(S_Heat_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr40_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr40_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,585 :: 		strcpy(S_Compressor_1.Caption ,"000");
MOVW	R1, #lo_addr(?lstr41_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr41_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Compressor_1+24)
MOVT	R0, #hi_addr(_S_Compressor_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,586 :: 		strcpy(S_Superheat_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr42_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr42_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Superheat_1+24)
MOVT	R0, #hi_addr(_S_Superheat_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,587 :: 		strcpy( S_Subcool_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr43_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr43_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Subcool_1+24)
MOVT	R0, #hi_addr(_S_Subcool_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,588 :: 		strcpy(S_DHW.Caption,"00");
MOVW	R1, #lo_addr(?lstr44_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr44_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_DHW+24)
MOVT	R0, #hi_addr(_S_DHW+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,589 :: 		strcpy(SS_tank.Caption,"00");
MOVW	R1, #lo_addr(?lstr45_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr45_Controller_events_code+0)
MOVW	R0, #lo_addr(_SS_tank+24)
MOVT	R0, #hi_addr(_SS_tank+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,590 :: 		strcpy(S_condenser_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr46_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr46_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_condenser_1+24)
MOVT	R0, #hi_addr(_S_condenser_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,591 :: 		strcpy(S_High_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr47_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr47_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_High_Pressure_1+24)
MOVT	R0, #hi_addr(_S_High_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,592 :: 		strcpy(S_Low_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr48_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr48_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,593 :: 		DrawScreen(&SENSOR1);
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
BL	_DrawScreen+0
;Controller_events_code.c,594 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,595 :: 		}
L_end_user_check_temperatureOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnUp
_user_set_LANOnPress:
;Controller_events_code.c,596 :: 		void user_set_LANOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,597 :: 		Image49.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,598 :: 		DrawImage(&Image49);
MOVW	R0, #lo_addr(_Image49+0)
MOVT	R0, #hi_addr(_Image49+0)
BL	_DrawImage+0
;Controller_events_code.c,599 :: 		}
L_end_user_set_LANOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnPress
_user_set_LANOnUp:
;Controller_events_code.c,600 :: 		void user_set_LANOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,601 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,602 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,603 :: 		Image49.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,604 :: 		DrawScreen(&Ethernet);
MOVW	R0, #lo_addr(_Ethernet+0)
MOVT	R0, #hi_addr(_Ethernet+0)
BL	_DrawScreen+0
;Controller_events_code.c,605 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,606 :: 		}
L_end_user_set_LANOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnUp
_user_check_errorsOnPress:
;Controller_events_code.c,607 :: 		void user_check_errorsOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,608 :: 		Image50.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,609 :: 		DrawImage(&Image50);
MOVW	R0, #lo_addr(_Image50+0)
MOVT	R0, #hi_addr(_Image50+0)
BL	_DrawImage+0
;Controller_events_code.c,610 :: 		}
L_end_user_check_errorsOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnPress
_user_check_errorsOnUp:
;Controller_events_code.c,611 :: 		void user_check_errorsOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,612 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,613 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,614 :: 		Image50.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,615 :: 		DrawScreen(&ERRORS);
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
BL	_DrawScreen+0
;Controller_events_code.c,616 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,617 :: 		}
L_end_user_check_errorsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnUp
_user_set_timersOnPress:
;Controller_events_code.c,618 :: 		void user_set_timersOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,619 :: 		Image51.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,620 :: 		DrawImage(&Image51);
MOVW	R0, #lo_addr(_Image51+0)
MOVT	R0, #hi_addr(_Image51+0)
BL	_DrawImage+0
;Controller_events_code.c,621 :: 		}
L_end_user_set_timersOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnPress
_user_set_timersOnUp:
;Controller_events_code.c,622 :: 		void user_set_timersOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,623 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,624 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,625 :: 		Image51.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,626 :: 		DrawScreen(&TIMERS);
MOVW	R0, #lo_addr(_TIMERS+0)
MOVT	R0, #hi_addr(_TIMERS+0)
BL	_DrawScreen+0
;Controller_events_code.c,627 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,628 :: 		}
L_end_user_set_timersOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnUp
_user_hysterezisOnPress:
;Controller_events_code.c,629 :: 		void user_hysterezisOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,630 :: 		Image60.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,631 :: 		DrawImage(&Image60);
MOVW	R0, #lo_addr(_Image60+0)
MOVT	R0, #hi_addr(_Image60+0)
BL	_DrawImage+0
;Controller_events_code.c,632 :: 		}
L_end_user_hysterezisOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnPress
_user_hysterezisOnUp:
;Controller_events_code.c,633 :: 		void user_hysterezisOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,634 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,635 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,636 :: 		Image60.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,637 :: 		DrawScreen(&SETTINGS);
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
BL	_DrawScreen+0
;Controller_events_code.c,638 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,639 :: 		}
L_end_user_hysterezisOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnUp
_User_history_checkOnPress:
;Controller_events_code.c,640 :: 		void User_history_checkOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,641 :: 		Image52.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,642 :: 		DrawImage(&Image52);
MOVW	R0, #lo_addr(_Image52+0)
MOVT	R0, #hi_addr(_Image52+0)
BL	_DrawImage+0
;Controller_events_code.c,643 :: 		}
L_end_User_history_checkOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnPress
_User_history_checkOnUp:
;Controller_events_code.c,644 :: 		void User_history_checkOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,645 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,646 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,647 :: 		Image52.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,648 :: 		DrawScreen(&EVENTS);
MOVW	R0, #lo_addr(_EVENTS+0)
MOVT	R0, #hi_addr(_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,649 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,650 :: 		}
L_end_User_history_checkOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnUp
_user_energyOnUp:
;Controller_events_code.c,652 :: 		void user_energyOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,653 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,654 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,655 :: 		Image54.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,656 :: 		DrawScreen(&ENERGY);
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
BL	_DrawScreen+0
;Controller_events_code.c,657 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,658 :: 		}
L_end_user_energyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnUp
_user_energyOnPress:
;Controller_events_code.c,659 :: 		void user_energyOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,660 :: 		Image54.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,661 :: 		DrawImage(&Image54);
MOVW	R0, #lo_addr(_Image54+0)
MOVT	R0, #hi_addr(_Image54+0)
BL	_DrawImage+0
;Controller_events_code.c,662 :: 		}
L_end_user_energyOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnPress
_admin_set_systemOnUp:
;Controller_events_code.c,663 :: 		void admin_set_systemOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,664 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,665 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,666 :: 		Image55.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,668 :: 		DrawScreen (&SYSTEM_SET);
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
;Controller_events_code.c,669 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,670 :: 		}
L_end_admin_set_systemOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnUp
_admin_set_systemOnPress:
;Controller_events_code.c,671 :: 		void  admin_set_systemOnPress (){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,672 :: 		Image55.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,673 :: 		DrawImage(&Image55);
MOVW	R0, #lo_addr(_Image55+0)
MOVT	R0, #hi_addr(_Image55+0)
BL	_DrawImage+0
;Controller_events_code.c,674 :: 		}
L_end_admin_set_systemOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnPress
_furnanceUP:
;Controller_events_code.c,675 :: 		void furnanceUP(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,676 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,677 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,678 :: 		Image56.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,679 :: 		DrawScreen(&FURNANCE);
MOVW	R0, #lo_addr(_FURNANCE+0)
MOVT	R0, #hi_addr(_FURNANCE+0)
BL	_DrawScreen+0
;Controller_events_code.c,680 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,681 :: 		}
L_end_furnanceUP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceUP
_furnanceDown:
;Controller_events_code.c,682 :: 		void furnanceDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,683 :: 		Image56.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,684 :: 		DrawImage(&Image56);
MOVW	R0, #lo_addr(_Image56+0)
MOVT	R0, #hi_addr(_Image56+0)
BL	_DrawImage+0
;Controller_events_code.c,685 :: 		}
L_end_furnanceDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceDown
_user_defrostOnUp:
;Controller_events_code.c,686 :: 		void user_defrostOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,687 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,688 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,689 :: 		Image57.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,690 :: 		DrawScreen(&DEFROST);
MOVW	R0, #lo_addr(_DEFROST+0)
MOVT	R0, #hi_addr(_DEFROST+0)
BL	_DrawScreen+0
;Controller_events_code.c,691 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,692 :: 		}
L_end_user_defrostOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnUp
_user_defrostOnPress:
;Controller_events_code.c,693 :: 		void user_defrostOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,694 :: 		Image57.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,695 :: 		DrawImage(&Image57);
MOVW	R0, #lo_addr(_Image57+0)
MOVT	R0, #hi_addr(_Image57+0)
BL	_DrawImage+0
;Controller_events_code.c,696 :: 		}
L_end_user_defrostOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnPress
_DEC_EEV1OnPress:
;Controller_events_code.c,748 :: 		void DEC_EEV1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,750 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,752 :: 		if(Red_bar.Position >= Red_bar.Min + 5) {
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
BCC	L_DEC_EEV1OnPress133
;Controller_events_code.c,755 :: 		Red_bar.Position -= 5;
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
LDRH	R0, [R1, #0]
SUBS	R0, R0, #5
STRH	R0, [R1, #0]
;Controller_events_code.c,757 :: 		DrawProgressBar(&Red_bar);
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_DrawProgressBar+0
;Controller_events_code.c,758 :: 		Delay_ms (50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_DEC_EEV1OnPress134:
SUBS	R7, R7, #1
BNE	L_DEC_EEV1OnPress134
NOP
NOP
NOP
;Controller_events_code.c,759 :: 		}
L_DEC_EEV1OnPress133:
;Controller_events_code.c,760 :: 		}
L_end_DEC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DEC_EEV1OnPress
_INC_EEV1OnPress:
;Controller_events_code.c,761 :: 		void INC_EEV1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,762 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,763 :: 		if(Red_bar.Position <= Red_bar.Max - 5) {
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
BHI	L_INC_EEV1OnPress136
;Controller_events_code.c,764 :: 		Red_bar.Position += 5;
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #5
STRH	R0, [R1, #0]
;Controller_events_code.c,765 :: 		UpdatePBPosition(&Red_bar);
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_UpdatePBPosition+0
;Controller_events_code.c,766 :: 		Delay_ms (50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_INC_EEV1OnPress137:
SUBS	R7, R7, #1
BNE	L_INC_EEV1OnPress137
NOP
NOP
NOP
;Controller_events_code.c,767 :: 		}
L_INC_EEV1OnPress136:
;Controller_events_code.c,768 :: 		}
L_end_INC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _INC_EEV1OnPress
_Set_Trv:
;Controller_events_code.c,770 :: 		void Set_Trv() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,772 :: 		system_reg[TRV_CORRECT_1]=Red_bar.Position - system_reg[TRV_STEPS_1];
MOVW	R0, #lo_addr(_system_reg+122)
MOVT	R0, #hi_addr(_system_reg+122)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Red_bar+44)
MOVT	R0, #hi_addr(_Red_bar+44)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_system_reg+6)
MOVT	R0, #hi_addr(_system_reg+6)
STRH	R1, [R0, #0]
;Controller_events_code.c,773 :: 		adressReg= TRV_CORRECT_1;
MOVW	R1, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,774 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,775 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,776 :: 		send_data_packet(TRV_CORRECT_1,1);
MOVS	R1, #1
MOVW	R0, #3
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,777 :: 		}
L_end_Set_Trv:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Trv
__1OnClick:
;Controller_events_code.c,780 :: 		void _1OnClick() {
;Controller_events_code.c,782 :: 		}
L_end__1OnClick:
BX	LR
; end of __1OnClick
__2OnClick:
;Controller_events_code.c,784 :: 		void _2OnClick() {
;Controller_events_code.c,786 :: 		}
L_end__2OnClick:
BX	LR
; end of __2OnClick
__3OnClick:
;Controller_events_code.c,788 :: 		void _3OnClick() {
;Controller_events_code.c,790 :: 		}
L_end__3OnClick:
BX	LR
; end of __3OnClick
__4OnClick:
;Controller_events_code.c,792 :: 		void _4OnClick() {
;Controller_events_code.c,794 :: 		}
L_end__4OnClick:
BX	LR
; end of __4OnClick
__5OnClick:
;Controller_events_code.c,796 :: 		void _5OnClick() {
;Controller_events_code.c,798 :: 		}
L_end__5OnClick:
BX	LR
; end of __5OnClick
__6OnClick:
;Controller_events_code.c,800 :: 		void _6OnClick() {
;Controller_events_code.c,802 :: 		}
L_end__6OnClick:
BX	LR
; end of __6OnClick
__7OnClick:
;Controller_events_code.c,804 :: 		void _7OnClick() {
;Controller_events_code.c,806 :: 		}
L_end__7OnClick:
BX	LR
; end of __7OnClick
__8OnClick:
;Controller_events_code.c,808 :: 		void _8OnClick() {
;Controller_events_code.c,810 :: 		}
L_end__8OnClick:
BX	LR
; end of __8OnClick
__9OnClick:
;Controller_events_code.c,812 :: 		void _9OnClick() {
;Controller_events_code.c,814 :: 		}
L_end__9OnClick:
BX	LR
; end of __9OnClick
__0OnClick:
;Controller_events_code.c,816 :: 		void _0OnClick() {
;Controller_events_code.c,818 :: 		}
L_end__0OnClick:
BX	LR
; end of __0OnClick
__QOnClick:
;Controller_events_code.c,820 :: 		void _QOnClick() {
;Controller_events_code.c,822 :: 		}
L_end__QOnClick:
BX	LR
; end of __QOnClick
__WOnClick:
;Controller_events_code.c,824 :: 		void _WOnClick() {
;Controller_events_code.c,826 :: 		}
L_end__WOnClick:
BX	LR
; end of __WOnClick
__EOnClick:
;Controller_events_code.c,828 :: 		void _EOnClick() {
;Controller_events_code.c,830 :: 		}
L_end__EOnClick:
BX	LR
; end of __EOnClick
__ROnClick:
;Controller_events_code.c,832 :: 		void _ROnClick() {
;Controller_events_code.c,834 :: 		}
L_end__ROnClick:
BX	LR
; end of __ROnClick
__TOnClick:
;Controller_events_code.c,836 :: 		void _TOnClick() {
;Controller_events_code.c,838 :: 		}
L_end__TOnClick:
BX	LR
; end of __TOnClick
__YOnClick:
;Controller_events_code.c,840 :: 		void _YOnClick() {
;Controller_events_code.c,842 :: 		}
L_end__YOnClick:
BX	LR
; end of __YOnClick
__UOnClick:
;Controller_events_code.c,844 :: 		void _UOnClick() {
;Controller_events_code.c,846 :: 		}
L_end__UOnClick:
BX	LR
; end of __UOnClick
__IOnClick:
;Controller_events_code.c,848 :: 		void _IOnClick() {
;Controller_events_code.c,850 :: 		}
L_end__IOnClick:
BX	LR
; end of __IOnClick
__OOnClick:
;Controller_events_code.c,852 :: 		void _OOnClick() {
;Controller_events_code.c,854 :: 		}
L_end__OOnClick:
BX	LR
; end of __OOnClick
__POnClick:
;Controller_events_code.c,856 :: 		void _POnClick() {
;Controller_events_code.c,858 :: 		}
L_end__POnClick:
BX	LR
; end of __POnClick
__AOnClick:
;Controller_events_code.c,860 :: 		void _AOnClick() {
;Controller_events_code.c,862 :: 		}
L_end__AOnClick:
BX	LR
; end of __AOnClick
__SOnClick:
;Controller_events_code.c,864 :: 		void _SOnClick() {
;Controller_events_code.c,866 :: 		}
L_end__SOnClick:
BX	LR
; end of __SOnClick
__DOnClick:
;Controller_events_code.c,868 :: 		void _DOnClick() {
;Controller_events_code.c,870 :: 		}
L_end__DOnClick:
BX	LR
; end of __DOnClick
__FOnClick:
;Controller_events_code.c,872 :: 		void _FOnClick() {
;Controller_events_code.c,874 :: 		}
L_end__FOnClick:
BX	LR
; end of __FOnClick
__GOnClick:
;Controller_events_code.c,876 :: 		void _GOnClick() {
;Controller_events_code.c,878 :: 		}
L_end__GOnClick:
BX	LR
; end of __GOnClick
__HOnClick:
;Controller_events_code.c,880 :: 		void _HOnClick() {
;Controller_events_code.c,882 :: 		}
L_end__HOnClick:
BX	LR
; end of __HOnClick
__JOnClick:
;Controller_events_code.c,884 :: 		void _JOnClick() {
;Controller_events_code.c,886 :: 		}
L_end__JOnClick:
BX	LR
; end of __JOnClick
__KOnClick:
;Controller_events_code.c,888 :: 		void _KOnClick() {
;Controller_events_code.c,890 :: 		}
L_end__KOnClick:
BX	LR
; end of __KOnClick
__LOnClick:
;Controller_events_code.c,892 :: 		void _LOnClick() {
;Controller_events_code.c,894 :: 		}
L_end__LOnClick:
BX	LR
; end of __LOnClick
__ZOnClick:
;Controller_events_code.c,896 :: 		void _ZOnClick() {
;Controller_events_code.c,898 :: 		}
L_end__ZOnClick:
BX	LR
; end of __ZOnClick
__XOnClick:
;Controller_events_code.c,900 :: 		void _XOnClick() {
;Controller_events_code.c,902 :: 		}
L_end__XOnClick:
BX	LR
; end of __XOnClick
__COnClick:
;Controller_events_code.c,904 :: 		void _COnClick() {
;Controller_events_code.c,906 :: 		}
L_end__COnClick:
BX	LR
; end of __COnClick
__VOnClick:
;Controller_events_code.c,908 :: 		void _VOnClick() {
;Controller_events_code.c,910 :: 		}
L_end__VOnClick:
BX	LR
; end of __VOnClick
__BOnClick:
;Controller_events_code.c,912 :: 		void _BOnClick() {
;Controller_events_code.c,914 :: 		}
L_end__BOnClick:
BX	LR
; end of __BOnClick
__NOnClick:
;Controller_events_code.c,916 :: 		void _NOnClick() {
;Controller_events_code.c,918 :: 		}
L_end__NOnClick:
BX	LR
; end of __NOnClick
__MOnClick:
;Controller_events_code.c,920 :: 		void _MOnClick() {
;Controller_events_code.c,922 :: 		}
L_end__MOnClick:
BX	LR
; end of __MOnClick
__CommaOnClick:
;Controller_events_code.c,924 :: 		void _CommaOnClick() {
;Controller_events_code.c,926 :: 		}
L_end__CommaOnClick:
BX	LR
; end of __CommaOnClick
__ColonOnClick:
;Controller_events_code.c,928 :: 		void _ColonOnClick() {
;Controller_events_code.c,930 :: 		}
L_end__ColonOnClick:
BX	LR
; end of __ColonOnClick
__SlashOnClick:
;Controller_events_code.c,932 :: 		void _SlashOnClick() {
;Controller_events_code.c,934 :: 		}
L_end__SlashOnClick:
BX	LR
; end of __SlashOnClick
__DELOnClick:
;Controller_events_code.c,936 :: 		void _DELOnClick() {
;Controller_events_code.c,938 :: 		}
L_end__DELOnClick:
BX	LR
; end of __DELOnClick
_ClearOnPress:
;Controller_events_code.c,940 :: 		void ClearOnPress() {
;Controller_events_code.c,942 :: 		}
L_end_ClearOnPress:
BX	LR
; end of _ClearOnPress
_CAPS_SwitchOnClick:
;Controller_events_code.c,944 :: 		void CAPS_SwitchOnClick() {
;Controller_events_code.c,946 :: 		}
L_end_CAPS_SwitchOnClick:
BX	LR
; end of _CAPS_SwitchOnClick
_SPACEOnClick:
;Controller_events_code.c,948 :: 		void SPACEOnClick() {
;Controller_events_code.c,950 :: 		}
L_end_SPACEOnClick:
BX	LR
; end of _SPACEOnClick
_ENTEROnClick:
;Controller_events_code.c,952 :: 		void ENTEROnClick() {
;Controller_events_code.c,954 :: 		}
L_end_ENTEROnClick:
BX	LR
; end of _ENTEROnClick
_SetDateAndTimeOnClick:
;Controller_events_code.c,956 :: 		void SetDateAndTimeOnClick(){
;Controller_events_code.c,958 :: 		}
L_end_SetDateAndTimeOnClick:
BX	LR
; end of _SetDateAndTimeOnClick
_OneYearUpOnClick:
;Controller_events_code.c,959 :: 		void OneYearUpOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,962 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,963 :: 		tenYearU++;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,964 :: 		if (tenYearU > 9)
CMP	R0, #9
IT	LS
BLS	L_OneYearUpOnClick139
;Controller_events_code.c,965 :: 		tenYearU = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_OneYearUpOnClick139:
;Controller_events_code.c,966 :: 		ByteToStr(tenYearU, temp);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,967 :: 		res = Ltrim(temp);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,968 :: 		strcpy(OneYear.Caption, res);
MOVW	R1, #lo_addr(_OneYear+16)
MOVT	R1, #hi_addr(_OneYear+16)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,969 :: 		DrawButton(&OneYearUp);
MOVW	R0, #lo_addr(_OneYearUp+0)
MOVT	R0, #hi_addr(_OneYearUp+0)
BL	_DrawButton+0
;Controller_events_code.c,970 :: 		DrawButton(&OneYearDwn);
MOVW	R0, #lo_addr(_OneYearDwn+0)
MOVT	R0, #hi_addr(_OneYearDwn+0)
BL	_DrawButton+0
;Controller_events_code.c,971 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,972 :: 		}
L_end_OneYearUpOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearUpOnClick
_OneYearDwnOnClick:
;Controller_events_code.c,973 :: 		void OneYearDwnOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,976 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,977 :: 		tenYearU--;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,978 :: 		if (My_Date.RTC_Year_Tens < 0)
MOVW	R0, #lo_addr(_My_Date+5)
MOVT	R0, #hi_addr(_My_Date+5)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CS
BCS	L_OneYearDwnOnClick140
;Controller_events_code.c,979 :: 		tenYearU = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_OneYearDwnOnClick140:
;Controller_events_code.c,980 :: 		ByteToStr(tenYearU, temp);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,981 :: 		res = Ltrim(temp);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,982 :: 		strcpy(OneYear.Caption, res);
MOVW	R1, #lo_addr(_OneYear+16)
MOVT	R1, #hi_addr(_OneYear+16)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,983 :: 		DrawButton(&OneYearUp);
MOVW	R0, #lo_addr(_OneYearUp+0)
MOVT	R0, #hi_addr(_OneYearUp+0)
BL	_DrawButton+0
;Controller_events_code.c,984 :: 		DrawButton(&OneYearDwn);
MOVW	R0, #lo_addr(_OneYearDwn+0)
MOVT	R0, #hi_addr(_OneYearDwn+0)
BL	_DrawButton+0
;Controller_events_code.c,985 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,986 :: 		}
L_end_OneYearDwnOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearDwnOnClick
_OneYearUpOnUp:
;Controller_events_code.c,987 :: 		void OneYearUpOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,988 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,989 :: 		}
L_end_OneYearUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearUpOnUp
_OneYearUpOnPress:
;Controller_events_code.c,990 :: 		void OneYearUpOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,991 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,992 :: 		}
L_end_OneYearUpOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearUpOnPress
_OneYearDwnOnUp:
;Controller_events_code.c,993 :: 		void OneYearDwnOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,994 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,995 :: 		}
L_end_OneYearDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearDwnOnUp
_OneYearDwnOnPress:
;Controller_events_code.c,996 :: 		void OneYearDwnOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,997 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,998 :: 		}
L_end_OneYearDwnOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearDwnOnPress
_TenYearUpOnClick:
;Controller_events_code.c,1000 :: 		void TenYearUpOnClick() {
;Controller_events_code.c,1001 :: 		}
L_end_TenYearUpOnClick:
BX	LR
; end of _TenYearUpOnClick
_TenYearDwnOnClick:
;Controller_events_code.c,1002 :: 		void TenYearDwnOnClick() {
;Controller_events_code.c,1003 :: 		}
L_end_TenYearDwnOnClick:
BX	LR
; end of _TenYearDwnOnClick
_TenYearUpOnUp:
;Controller_events_code.c,1004 :: 		void TenYearUpOnUp() {
;Controller_events_code.c,1006 :: 		}
L_end_TenYearUpOnUp:
BX	LR
; end of _TenYearUpOnUp
_TenYearDwnOnUp:
;Controller_events_code.c,1007 :: 		void TenYearDwnOnUp() {
;Controller_events_code.c,1008 :: 		}
L_end_TenYearDwnOnUp:
BX	LR
; end of _TenYearDwnOnUp
_TenYearDwnOnPress:
;Controller_events_code.c,1009 :: 		void TenYearDwnOnPress() {
;Controller_events_code.c,1010 :: 		}
L_end_TenYearDwnOnPress:
BX	LR
; end of _TenYearDwnOnPress
_TenYearUpOnPress:
;Controller_events_code.c,1011 :: 		void TenYearUpOnPress() {
;Controller_events_code.c,1013 :: 		}
L_end_TenYearUpOnPress:
BX	LR
; end of _TenYearUpOnPress
_MonthDateUpOnClick:
;Controller_events_code.c,1015 :: 		void MonthDateUpOnClick() {
;Controller_events_code.c,1017 :: 		}
L_end_MonthDateUpOnClick:
BX	LR
; end of _MonthDateUpOnClick
_MonthDateUpOnUp:
;Controller_events_code.c,1018 :: 		void MonthDateUpOnUp() {
;Controller_events_code.c,1020 :: 		}
L_end_MonthDateUpOnUp:
BX	LR
; end of _MonthDateUpOnUp
_MonthDateUpOnPress:
;Controller_events_code.c,1021 :: 		void MonthDateUpOnPress() {
;Controller_events_code.c,1023 :: 		}
L_end_MonthDateUpOnPress:
BX	LR
; end of _MonthDateUpOnPress
_MonthDateDwnOnClick:
;Controller_events_code.c,1024 :: 		void MonthDateDwnOnClick() {
;Controller_events_code.c,1026 :: 		}
L_end_MonthDateDwnOnClick:
BX	LR
; end of _MonthDateDwnOnClick
_MonthDateDwnOnUp:
;Controller_events_code.c,1027 :: 		void MonthDateDwnOnUp() {
;Controller_events_code.c,1029 :: 		}
L_end_MonthDateDwnOnUp:
BX	LR
; end of _MonthDateDwnOnUp
_MonthDateDwnOnPress:
;Controller_events_code.c,1030 :: 		void MonthDateDwnOnPress() {
;Controller_events_code.c,1031 :: 		}
L_end_MonthDateDwnOnPress:
BX	LR
; end of _MonthDateDwnOnPress
_TenDayUpOnClick:
;Controller_events_code.c,1032 :: 		void TenDayUpOnClick() {
;Controller_events_code.c,1034 :: 		}
L_end_TenDayUpOnClick:
BX	LR
; end of _TenDayUpOnClick
_TenDayDwnOnClick:
;Controller_events_code.c,1035 :: 		void TenDayDwnOnClick() {
;Controller_events_code.c,1037 :: 		}
L_end_TenDayDwnOnClick:
BX	LR
; end of _TenDayDwnOnClick
_TenDayUpOnUp:
;Controller_events_code.c,1039 :: 		void TenDayUpOnUp() {
;Controller_events_code.c,1041 :: 		}
L_end_TenDayUpOnUp:
BX	LR
; end of _TenDayUpOnUp
_TenDayDwnOnUp:
;Controller_events_code.c,1043 :: 		void TenDayDwnOnUp() {
;Controller_events_code.c,1045 :: 		}
L_end_TenDayDwnOnUp:
BX	LR
; end of _TenDayDwnOnUp
_TenDayUpOnPress:
;Controller_events_code.c,1047 :: 		void TenDayUpOnPress() {
;Controller_events_code.c,1049 :: 		}
L_end_TenDayUpOnPress:
BX	LR
; end of _TenDayUpOnPress
_TenDayDwnOnPress:
;Controller_events_code.c,1051 :: 		void TenDayDwnOnPress() {
;Controller_events_code.c,1053 :: 		}
L_end_TenDayDwnOnPress:
BX	LR
; end of _TenDayDwnOnPress
_OneDayUpOnClick:
;Controller_events_code.c,1054 :: 		void OneDayUpOnClick() {
;Controller_events_code.c,1056 :: 		}
L_end_OneDayUpOnClick:
BX	LR
; end of _OneDayUpOnClick
_OneDayDwnOnClick:
;Controller_events_code.c,1058 :: 		void OneDayDwnOnClick() {
;Controller_events_code.c,1060 :: 		}
L_end_OneDayDwnOnClick:
BX	LR
; end of _OneDayDwnOnClick
_OneDayUpOnUp:
;Controller_events_code.c,1062 :: 		void OneDayUpOnUp() {
;Controller_events_code.c,1064 :: 		}
L_end_OneDayUpOnUp:
BX	LR
; end of _OneDayUpOnUp
_OneDayDwnOnUp:
;Controller_events_code.c,1066 :: 		void OneDayDwnOnUp() {
;Controller_events_code.c,1068 :: 		}
L_end_OneDayDwnOnUp:
BX	LR
; end of _OneDayDwnOnUp
_OneDayUpOnPress:
;Controller_events_code.c,1070 :: 		void OneDayUpOnPress() {
;Controller_events_code.c,1072 :: 		}
L_end_OneDayUpOnPress:
BX	LR
; end of _OneDayUpOnPress
_OneDayDwnOnPress:
;Controller_events_code.c,1074 :: 		void OneDayDwnOnPress() {
;Controller_events_code.c,1076 :: 		}
L_end_OneDayDwnOnPress:
BX	LR
; end of _OneDayDwnOnPress
_Day_unitUpOnClick:
;Controller_events_code.c,1077 :: 		void Day_unitUpOnClick() {
;Controller_events_code.c,1079 :: 		}
L_end_Day_unitUpOnClick:
BX	LR
; end of _Day_unitUpOnClick
_Day_unitDwnOnClick:
;Controller_events_code.c,1081 :: 		void Day_unitDwnOnClick() {
;Controller_events_code.c,1083 :: 		}
L_end_Day_unitDwnOnClick:
BX	LR
; end of _Day_unitDwnOnClick
_Day_unitUpOnUp:
;Controller_events_code.c,1085 :: 		void Day_unitUpOnUp() {
;Controller_events_code.c,1087 :: 		}
L_end_Day_unitUpOnUp:
BX	LR
; end of _Day_unitUpOnUp
_Day_unitDwnOnUp:
;Controller_events_code.c,1089 :: 		void Day_unitDwnOnUp() {
;Controller_events_code.c,1091 :: 		}
L_end_Day_unitDwnOnUp:
BX	LR
; end of _Day_unitDwnOnUp
_Day_unitUpOnPress:
;Controller_events_code.c,1093 :: 		void Day_unitUpOnPress() {
;Controller_events_code.c,1095 :: 		}
L_end_Day_unitUpOnPress:
BX	LR
; end of _Day_unitUpOnPress
_Day_unitDwnOnPress:
;Controller_events_code.c,1097 :: 		void Day_unitDwnOnPress() {
;Controller_events_code.c,1099 :: 		}
L_end_Day_unitDwnOnPress:
BX	LR
; end of _Day_unitDwnOnPress
_Unit_hoursUpOnClick:
;Controller_events_code.c,1101 :: 		void Unit_hoursUpOnClick() {
;Controller_events_code.c,1103 :: 		}
L_end_Unit_hoursUpOnClick:
BX	LR
; end of _Unit_hoursUpOnClick
_Unit_hoursDwnOnClick:
;Controller_events_code.c,1105 :: 		void Unit_hoursDwnOnClick() {
;Controller_events_code.c,1107 :: 		}
L_end_Unit_hoursDwnOnClick:
BX	LR
; end of _Unit_hoursDwnOnClick
_Unit_hoursUpOnUp:
;Controller_events_code.c,1108 :: 		void Unit_hoursUpOnUp() {
;Controller_events_code.c,1110 :: 		}
L_end_Unit_hoursUpOnUp:
BX	LR
; end of _Unit_hoursUpOnUp
_Unit_hoursDwnOnUp:
;Controller_events_code.c,1111 :: 		void Unit_hoursDwnOnUp() {
;Controller_events_code.c,1113 :: 		}
L_end_Unit_hoursDwnOnUp:
BX	LR
; end of _Unit_hoursDwnOnUp
_Unit_hoursUpOnPress:
;Controller_events_code.c,1114 :: 		void Unit_hoursUpOnPress() {
;Controller_events_code.c,1116 :: 		}
L_end_Unit_hoursUpOnPress:
BX	LR
; end of _Unit_hoursUpOnPress
_Unit_hoursDwnOnPress:
;Controller_events_code.c,1117 :: 		void Unit_hoursDwnOnPress() {
;Controller_events_code.c,1119 :: 		}
L_end_Unit_hoursDwnOnPress:
BX	LR
; end of _Unit_hoursDwnOnPress
_Ten_minutesUpOnClick:
;Controller_events_code.c,1120 :: 		void Ten_minutesUpOnClick() {
;Controller_events_code.c,1122 :: 		}
L_end_Ten_minutesUpOnClick:
BX	LR
; end of _Ten_minutesUpOnClick
_Ten_minutesDwnOnClick:
;Controller_events_code.c,1123 :: 		void Ten_minutesDwnOnClick() {
;Controller_events_code.c,1125 :: 		}
L_end_Ten_minutesDwnOnClick:
BX	LR
; end of _Ten_minutesDwnOnClick
_Ten_minutesUpOnUp:
;Controller_events_code.c,1126 :: 		void Ten_minutesUpOnUp() {
;Controller_events_code.c,1128 :: 		}
L_end_Ten_minutesUpOnUp:
BX	LR
; end of _Ten_minutesUpOnUp
_Ten_minutesDwnOnUp:
;Controller_events_code.c,1129 :: 		void Ten_minutesDwnOnUp() {
;Controller_events_code.c,1131 :: 		}
L_end_Ten_minutesDwnOnUp:
BX	LR
; end of _Ten_minutesDwnOnUp
_Ten_minutesUpOnPress:
;Controller_events_code.c,1132 :: 		void Ten_minutesUpOnPress() {
;Controller_events_code.c,1134 :: 		}
L_end_Ten_minutesUpOnPress:
BX	LR
; end of _Ten_minutesUpOnPress
_Ten_minutesDwnOnPress:
;Controller_events_code.c,1135 :: 		void Ten_minutesDwnOnPress() {
;Controller_events_code.c,1137 :: 		}
L_end_Ten_minutesDwnOnPress:
BX	LR
; end of _Ten_minutesDwnOnPress
_Unit_minutesUpOnClick:
;Controller_events_code.c,1138 :: 		void Unit_minutesUpOnClick() {
;Controller_events_code.c,1140 :: 		}
L_end_Unit_minutesUpOnClick:
BX	LR
; end of _Unit_minutesUpOnClick
_Unit_minutesDwnOnClick:
;Controller_events_code.c,1142 :: 		void Unit_minutesDwnOnClick() {
;Controller_events_code.c,1144 :: 		}
L_end_Unit_minutesDwnOnClick:
BX	LR
; end of _Unit_minutesDwnOnClick
_Unit_minutesUpOnUp:
;Controller_events_code.c,1146 :: 		void Unit_minutesUpOnUp(){
;Controller_events_code.c,1148 :: 		}
L_end_Unit_minutesUpOnUp:
BX	LR
; end of _Unit_minutesUpOnUp
_Unit_minutesDwnOnUp:
;Controller_events_code.c,1150 :: 		void Unit_minutesDwnOnUp(){
;Controller_events_code.c,1152 :: 		}
L_end_Unit_minutesDwnOnUp:
BX	LR
; end of _Unit_minutesDwnOnUp
_Unit_minutesUpOnPress:
;Controller_events_code.c,1154 :: 		void Unit_minutesUpOnPress() {
;Controller_events_code.c,1156 :: 		}
L_end_Unit_minutesUpOnPress:
BX	LR
; end of _Unit_minutesUpOnPress
_Unit_minutesDwnOnPress:
;Controller_events_code.c,1158 :: 		void Unit_minutesDwnOnPress() {
;Controller_events_code.c,1160 :: 		}
L_end_Unit_minutesDwnOnPress:
BX	LR
; end of _Unit_minutesDwnOnPress
_Admin_SetOnClick:
;Controller_events_code.c,1163 :: 		void Admin_SetOnClick(){
;Controller_events_code.c,1164 :: 		}
L_end_Admin_SetOnClick:
BX	LR
; end of _Admin_SetOnClick
_system_passOnDown:
;Controller_events_code.c,1166 :: 		void system_passOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1167 :: 		Image83.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1168 :: 		DrawImage(&Image83);
MOVW	R0, #lo_addr(_Image83+0)
MOVT	R0, #hi_addr(_Image83+0)
BL	_DrawImage+0
;Controller_events_code.c,1169 :: 		}
L_end_system_passOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnDown
_system_passOnUp:
;Controller_events_code.c,1171 :: 		void system_passOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1172 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1173 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1174 :: 		Image83.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1175 :: 		DrawScreen(&PASSWORD);
MOVW	R0, #lo_addr(_PASSWORD+0)
MOVT	R0, #hi_addr(_PASSWORD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1176 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1177 :: 		}
L_end_system_passOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnUp
_ModeSetOnUp:
;Controller_events_code.c,1179 :: 		void ModeSetOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1180 :: 		if (SYSTEM_ON == false) {
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_ModeSetOnUp141
;Controller_events_code.c,1181 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1182 :: 		strcpy(System_Set_Message.Caption, " ");
MOVW	R1, #lo_addr(?lstr49_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr49_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1183 :: 		Image300.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1184 :: 		System_Set_Message.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1185 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1186 :: 		}
IT	AL
BAL	L_ModeSetOnUp142
L_ModeSetOnUp141:
;Controller_events_code.c,1188 :: 		strcpy(System_Set_Message.Caption, "Please  OFF  system  power!");
MOVW	R1, #lo_addr(?lstr50_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr50_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1189 :: 		Image300.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1190 :: 		DrawImage (&Image300);
MOVW	R0, #lo_addr(_Image300+0)
MOVT	R0, #hi_addr(_Image300+0)
BL	_DrawImage+0
;Controller_events_code.c,1191 :: 		System_Set_Message.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1192 :: 		DrawButton (&System_Set_Message);
MOVW	R0, #lo_addr(_System_Set_Message+0)
MOVT	R0, #hi_addr(_System_Set_Message+0)
BL	_DrawButton+0
;Controller_events_code.c,1193 :: 		}
L_ModeSetOnUp142:
;Controller_events_code.c,1194 :: 		}
L_end_ModeSetOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnUp
_ModeSetOnDown:
;Controller_events_code.c,1196 :: 		void ModeSetOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1197 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1198 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1199 :: 		}
L_end_ModeSetOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnDown
_system_EEVOnDown:
;Controller_events_code.c,1201 :: 		void system_EEVOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1202 :: 		Image89.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1203 :: 		DrawImage(&Image89);
MOVW	R0, #lo_addr(_Image89+0)
MOVT	R0, #hi_addr(_Image89+0)
BL	_DrawImage+0
;Controller_events_code.c,1204 :: 		}
L_end_system_EEVOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnDown
_system_EEVOnUp:
;Controller_events_code.c,1206 :: 		void system_EEVOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1207 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1208 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1210 :: 		Image89.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1211 :: 		DrawScreen(&EEV);
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
BL	_DrawScreen+0
;Controller_events_code.c,1212 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1214 :: 		}
L_end_system_EEVOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnUp
_system_modeOnDown:
;Controller_events_code.c,1216 :: 		void system_modeOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1217 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1218 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1219 :: 		}
L_end_system_modeOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnDown
_system_modeOnUp:
;Controller_events_code.c,1221 :: 		void system_modeOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1222 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1223 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1224 :: 		Image85.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1225 :: 		DrawScreen(&MODE);
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
;Controller_events_code.c,1226 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1227 :: 		}
L_end_system_modeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnUp
_system_delayOnUp:
;Controller_events_code.c,1229 :: 		void system_delayOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1230 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1231 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1232 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1233 :: 		DrawScreen(&DELAY_MENU);
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,1234 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1235 :: 		}
L_end_system_delayOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnUp
_system_delayOnDown:
;Controller_events_code.c,1236 :: 		void system_delayOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1237 :: 		Image90.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1238 :: 		DrawImage(&Image90);
MOVW	R0, #lo_addr(_Image90+0)
MOVT	R0, #hi_addr(_Image90+0)
BL	_DrawImage+0
;Controller_events_code.c,1239 :: 		}
L_end_system_delayOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnDown
_system_graphOnDown:
;Controller_events_code.c,1241 :: 		void system_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1242 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1243 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1244 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1245 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1246 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1247 :: 		}
L_end_system_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnDown
_system_graphOnUp:
;Controller_events_code.c,1249 :: 		void system_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1250 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1251 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1253 :: 		}
L_end_system_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnUp
_system_microSDOnDown:
;Controller_events_code.c,1254 :: 		void system_microSDOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1255 :: 		Image88.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1256 :: 		DrawImage(&Image88);
MOVW	R0, #lo_addr(_Image88+0)
MOVT	R0, #hi_addr(_Image88+0)
BL	_DrawImage+0
;Controller_events_code.c,1257 :: 		}
L_end_system_microSDOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnDown
_system_microSDOnUp:
;Controller_events_code.c,1259 :: 		void system_microSDOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1260 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1261 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1262 :: 		Image88.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1263 :: 		DrawScreen(&MICRO_SD);
MOVW	R0, #lo_addr(_MICRO_SD+0)
MOVT	R0, #hi_addr(_MICRO_SD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1264 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1265 :: 		}
L_end_system_microSDOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnUp
_system_limitsOnDown:
;Controller_events_code.c,1268 :: 		void system_limitsOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1269 :: 		Image91.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1270 :: 		DrawImage(&Image91);
MOVW	R0, #lo_addr(_Image91+0)
MOVT	R0, #hi_addr(_Image91+0)
BL	_DrawImage+0
;Controller_events_code.c,1271 :: 		}
L_end_system_limitsOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnDown
_system_limitsOnUp:
;Controller_events_code.c,1273 :: 		void system_limitsOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1274 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1275 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1276 :: 		Image91.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1277 :: 		DrawScreen(&LIMITS1);
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
;Controller_events_code.c,1278 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1279 :: 		}
L_end_system_limitsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnUp
_ssytem_graphOnDown:
;Controller_events_code.c,1281 :: 		void ssytem_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1282 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1283 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1284 :: 		}
L_end_ssytem_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnDown
_ssytem_graphOnUp:
;Controller_events_code.c,1286 :: 		void ssytem_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1287 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1288 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1289 :: 		Image92.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1290 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1291 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1292 :: 		}
L_end_ssytem_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnUp
_system_historyOnDown:
;Controller_events_code.c,1294 :: 		void system_historyOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1295 :: 		Image93.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1296 :: 		DrawImage(&Image93);
MOVW	R0, #lo_addr(_Image93+0)
MOVT	R0, #hi_addr(_Image93+0)
BL	_DrawImage+0
;Controller_events_code.c,1297 :: 		}
L_end_system_historyOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnDown
_system_historyOnUp:
;Controller_events_code.c,1299 :: 		void system_historyOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1300 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1301 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1302 :: 		Image93.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1303 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,1304 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1305 :: 		}
L_end_system_historyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnUp
_Delay_Source_DOWNOnUp:
;Controller_events_code.c,1308 :: 		void Delay_Source_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1309 :: 		Image306.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1310 :: 		Delay_Source_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1311 :: 		DrawImage(&Delay_Source_DOWN);
MOVW	R0, #lo_addr(_Delay_Source_DOWN+0)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1312 :: 		}
L_end_Delay_Source_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_DOWNOnUp
_Delay_Source_DOWNOnPress:
;Controller_events_code.c,1313 :: 		void Delay_Source_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1316 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1317 :: 		Image306.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1318 :: 		Delay_Source_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1319 :: 		DrawImage(&Image306);
MOVW	R0, #lo_addr(_Image306+0)
MOVT	R0, #hi_addr(_Image306+0)
BL	_DrawImage+0
;Controller_events_code.c,1322 :: 		system_reg[SOURS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1323 :: 		if (system_reg[SOURS_DEL] <0) system_reg[SOURS_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_Source_DOWNOnPress143
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_DOWNOnPress143:
;Controller_events_code.c,1324 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1325 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1326 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1327 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1328 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_Source_DOWNOnPress144:
SUBS	R7, R7, #1
BNE	L_Delay_Source_DOWNOnPress144
NOP
NOP
NOP
;Controller_events_code.c,1329 :: 		}
L_end_Delay_Source_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_DOWNOnPress
_Delay_Source_UPOnUp:
;Controller_events_code.c,1330 :: 		void Delay_Source_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1331 :: 		Image312.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1332 :: 		Delay_Source_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1333 :: 		DrawImage(&Delay_Source_UP);
MOVW	R0, #lo_addr(_Delay_Source_UP+0)
MOVT	R0, #hi_addr(_Delay_Source_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1335 :: 		}
L_end_Delay_Source_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_UPOnUp
_Delay_Source_UPOnPress:
;Controller_events_code.c,1336 :: 		void Delay_Source_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1339 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1340 :: 		Image312.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1341 :: 		Delay_Source_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1342 :: 		DrawImage(&Image312);
MOVW	R0, #lo_addr(_Image312+0)
MOVT	R0, #hi_addr(_Image312+0)
BL	_DrawImage+0
;Controller_events_code.c,1343 :: 		system_reg[SOURS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1344 :: 		if (system_reg[SOURS_DEL] >99) system_reg[SOURS_DEL] = 99;
CMP	R0, #99
IT	LE
BLE	L_Delay_Source_UPOnPress146
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_UPOnPress146:
;Controller_events_code.c,1345 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1346 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1347 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1348 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1349 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_Source_UPOnPress147:
SUBS	R7, R7, #1
BNE	L_Delay_Source_UPOnPress147
NOP
NOP
NOP
;Controller_events_code.c,1350 :: 		}
L_end_Delay_Source_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_UPOnPress
_Delay_Source_SETOnUp:
;Controller_events_code.c,1351 :: 		void Delay_Source_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1352 :: 		Delay_Source_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1353 :: 		Image344.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1354 :: 		DrawImage (&Delay_Source_SET);
MOVW	R0, #lo_addr(_Delay_Source_SET+0)
MOVT	R0, #hi_addr(_Delay_Source_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1355 :: 		}
L_end_Delay_Source_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnUp
_Delay_Source_SETOnDown:
;Controller_events_code.c,1356 :: 		void Delay_Source_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1357 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1358 :: 		adressReg= SOURS_DEL;
MOVW	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1359 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1360 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1361 :: 		send_data_packet(SOURS_DEL,1);
MOVS	R1, #1
MOVW	R0, #30
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1362 :: 		Delay_Source_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1363 :: 		Image344.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1364 :: 		DrawImage (&Image344);
MOVW	R0, #lo_addr(_Image344+0)
MOVT	R0, #hi_addr(_Image344+0)
BL	_DrawImage+0
;Controller_events_code.c,1365 :: 		}
L_end_Delay_Source_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnDown
_Delay_heat_pump_DOWNOnUp:
;Controller_events_code.c,1367 :: 		void Delay_heat_pump_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1368 :: 		Image307.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1369 :: 		Delay_heat_pump_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1370 :: 		DrawImage(&Delay_heat_pump_DOWN);
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1372 :: 		}
L_end_Delay_heat_pump_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_DOWNOnUp
_Delay_heat_pump_DOWNOnPress:
;Controller_events_code.c,1373 :: 		void Delay_heat_pump_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1376 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1377 :: 		Image307.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1378 :: 		Delay_heat_pump_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1379 :: 		DrawImage(&Image307);
MOVW	R0, #lo_addr(_Image307+0)
MOVT	R0, #hi_addr(_Image307+0)
BL	_DrawImage+0
;Controller_events_code.c,1382 :: 		system_reg[HEAT_DEL]--;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1383 :: 		if (system_reg[HEAT_DEL] <0) system_reg[HEAT_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_heat_pump_DOWNOnPress149
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_DOWNOnPress149:
;Controller_events_code.c,1384 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1385 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1386 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1387 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1388 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_heat_pump_DOWNOnPress150:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_DOWNOnPress150
NOP
NOP
NOP
;Controller_events_code.c,1389 :: 		}
L_end_Delay_heat_pump_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_DOWNOnPress
_Delay_heat_pump_upOnUp:
;Controller_events_code.c,1390 :: 		void Delay_heat_pump_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1391 :: 		Image313.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1392 :: 		Delay_heat_pump_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1393 :: 		DrawImage(&Delay_heat_pump_up);
MOVW	R0, #lo_addr(_Delay_heat_pump_up+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1394 :: 		}
L_end_Delay_heat_pump_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_upOnUp
_Delay_heat_pump_upOnPress:
;Controller_events_code.c,1395 :: 		void Delay_heat_pump_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1398 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1399 :: 		Image313.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1400 :: 		Delay_heat_pump_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1401 :: 		DrawImage(&Image313);
MOVW	R0, #lo_addr(_Image313+0)
MOVT	R0, #hi_addr(_Image313+0)
BL	_DrawImage+0
;Controller_events_code.c,1404 :: 		system_reg[HEAT_DEL]++;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1405 :: 		if (system_reg[HEAT_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_heat_pump_upOnPress152
;Controller_events_code.c,1406 :: 		system_reg[HEAT_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_upOnPress152:
;Controller_events_code.c,1407 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1408 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1409 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1410 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1411 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_heat_pump_upOnPress153:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_upOnPress153
NOP
NOP
NOP
;Controller_events_code.c,1413 :: 		}
L_end_Delay_heat_pump_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_upOnPress
_Delay_heat_pump_SETOnUp:
;Controller_events_code.c,1414 :: 		void Delay_heat_pump_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1415 :: 		Delay_heat_pump_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1416 :: 		Image345.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1417 :: 		DrawImage (&Delay_heat_pump_SET);
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1418 :: 		}
L_end_Delay_heat_pump_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnUp
_Delay_heat_pump_SETOnDown:
;Controller_events_code.c,1419 :: 		void Delay_heat_pump_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1420 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1421 :: 		adressReg= HEAT_DEL;
MOVW	R1, #20
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1422 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1423 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1424 :: 		send_data_packet(HEAT_DEL,1);
MOVS	R1, #1
MOVW	R0, #20
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1425 :: 		Delay_heat_pump_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1426 :: 		Image345.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1427 :: 		DrawImage (&Image345);
MOVW	R0, #lo_addr(_Image345+0)
MOVT	R0, #hi_addr(_Image345+0)
BL	_DrawImage+0
;Controller_events_code.c,1428 :: 		}
L_end_Delay_heat_pump_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnDown
_Delay_reversing_DOWNOnUp:
;Controller_events_code.c,1430 :: 		void Delay_reversing_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1431 :: 		Image308.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1432 :: 		Delay_reversing_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1433 :: 		DrawImage(&Delay_reversing_DOWN);
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+0)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1434 :: 		}
L_end_Delay_reversing_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_DOWNOnUp
_Delay_reversing_DOWNOnPress:
;Controller_events_code.c,1435 :: 		void Delay_reversing_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1438 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1439 :: 		Image308.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1440 :: 		Delay_reversing_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1441 :: 		DrawImage(&Image308);
MOVW	R0, #lo_addr(_Image308+0)
MOVT	R0, #hi_addr(_Image308+0)
BL	_DrawImage+0
;Controller_events_code.c,1444 :: 		system_reg[REVERS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1445 :: 		if (system_reg[REVERS_DEL] <0)
CMP	R0, #0
IT	GE
BGE	L_Delay_reversing_DOWNOnPress155
;Controller_events_code.c,1446 :: 		system_reg[REVERS_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_DOWNOnPress155:
;Controller_events_code.c,1447 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1448 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1449 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1450 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1451 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_reversing_DOWNOnPress156:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_DOWNOnPress156
NOP
NOP
NOP
;Controller_events_code.c,1452 :: 		}
L_end_Delay_reversing_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_DOWNOnPress
_Delay_reversing_UPOnUp:
;Controller_events_code.c,1453 :: 		void Delay_reversing_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1454 :: 		Image314.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1455 :: 		Delay_reversing_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1456 :: 		DrawImage(&Delay_reversing_UP);
MOVW	R0, #lo_addr(_Delay_reversing_UP+0)
MOVT	R0, #hi_addr(_Delay_reversing_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1457 :: 		}
L_end_Delay_reversing_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_UPOnUp
_Delay_reversing_UPOnPress:
;Controller_events_code.c,1458 :: 		void Delay_reversing_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1461 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1462 :: 		Image314.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1463 :: 		Delay_reversing_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1464 :: 		DrawImage(&Image314);
MOVW	R0, #lo_addr(_Image314+0)
MOVT	R0, #hi_addr(_Image314+0)
BL	_DrawImage+0
;Controller_events_code.c,1467 :: 		system_reg[REVERS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1468 :: 		if (system_reg[REVERS_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_reversing_UPOnPress158
;Controller_events_code.c,1469 :: 		system_reg[REVERS_DEL] = 99 ;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_UPOnPress158:
;Controller_events_code.c,1470 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1471 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1472 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1473 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1474 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_reversing_UPOnPress159:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_UPOnPress159
NOP
NOP
NOP
;Controller_events_code.c,1475 :: 		}
L_end_Delay_reversing_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_UPOnPress
_Delay_reversing_SETOnUp:
;Controller_events_code.c,1476 :: 		void Delay_reversing_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1477 :: 		Delay_reversing_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1478 :: 		Image346.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1479 :: 		DrawImage (&Delay_reversing_SET);
MOVW	R0, #lo_addr(_Delay_reversing_SET+0)
MOVT	R0, #hi_addr(_Delay_reversing_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1480 :: 		}
L_end_Delay_reversing_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnUp
_Delay_reversing_SETOnDown:
;Controller_events_code.c,1481 :: 		void Delay_reversing_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1482 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1483 :: 		adressReg= REVERS_DEL;
MOVW	R1, #40
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1484 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1485 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1486 :: 		send_data_packet(REVERS_DEL,1);
MOVS	R1, #1
MOVW	R0, #40
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1487 :: 		Delay_reversing_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1488 :: 		Image346.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1489 :: 		DrawImage (&Image346);
MOVW	R0, #lo_addr(_Image346+0)
MOVT	R0, #hi_addr(_Image346+0)
BL	_DrawImage+0
;Controller_events_code.c,1490 :: 		}
L_end_Delay_reversing_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnDown
_Delay_trv_DOWNOnUp:
;Controller_events_code.c,1492 :: 		void Delay_trv_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1493 :: 		Image309.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1494 :: 		Delay_trv_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1495 :: 		DrawImage(&Delay_trv_DOWN);
MOVW	R0, #lo_addr(_Delay_trv_DOWN+0)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1496 :: 		}
L_end_Delay_trv_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_DOWNOnUp
_Delay_trv_DOWNOnPress:
;Controller_events_code.c,1497 :: 		void Delay_trv_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1500 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1501 :: 		Image309.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1502 :: 		Delay_trv_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1503 :: 		DrawImage(&Image309);
MOVW	R0, #lo_addr(_Image309+0)
MOVT	R0, #hi_addr(_Image309+0)
BL	_DrawImage+0
;Controller_events_code.c,1506 :: 		system_reg[TRV_DEL]--;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1507 :: 		if (system_reg[TRV_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_trv_DOWNOnPress161
;Controller_events_code.c,1508 :: 		system_reg[TRV_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_DOWNOnPress161:
;Controller_events_code.c,1509 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1510 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1511 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1512 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1513 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_trv_DOWNOnPress162:
SUBS	R7, R7, #1
BNE	L_Delay_trv_DOWNOnPress162
NOP
NOP
NOP
;Controller_events_code.c,1514 :: 		}
L_end_Delay_trv_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_DOWNOnPress
_Delay_trv_UPOnUp:
;Controller_events_code.c,1515 :: 		void Delay_trv_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1516 :: 		Image315.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1517 :: 		Delay_trv_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1518 :: 		DrawImage(&Delay_trv_up);
MOVW	R0, #lo_addr(_Delay_trv_up+0)
MOVT	R0, #hi_addr(_Delay_trv_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1519 :: 		}
L_end_Delay_trv_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_UPOnUp
_Delay_trv_UPOnPress:
;Controller_events_code.c,1520 :: 		void Delay_trv_UPOnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1523 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1524 :: 		Image315.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1525 :: 		Delay_trv_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1526 :: 		DrawImage(&Image315);
MOVW	R0, #lo_addr(_Image315+0)
MOVT	R0, #hi_addr(_Image315+0)
BL	_DrawImage+0
;Controller_events_code.c,1529 :: 		system_reg[TRV_DEL]++;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1530 :: 		if (system_reg[TRV_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_trv_UPOnPress164
;Controller_events_code.c,1531 :: 		system_reg[TRV_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_UPOnPress164:
;Controller_events_code.c,1532 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1533 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1534 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1535 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1536 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_trv_UPOnPress165:
SUBS	R7, R7, #1
BNE	L_Delay_trv_UPOnPress165
NOP
NOP
NOP
;Controller_events_code.c,1537 :: 		}
L_end_Delay_trv_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_UPOnPress
_Delay_EEV_SETOnUp:
;Controller_events_code.c,1538 :: 		void Delay_EEV_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1539 :: 		Delay_EEV_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1540 :: 		Image347.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1541 :: 		DrawImage (&Delay_EEV_SET);
MOVW	R0, #lo_addr(_Delay_EEV_SET+0)
MOVT	R0, #hi_addr(_Delay_EEV_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1542 :: 		}
L_end_Delay_EEV_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnUp
_Delay_EEV_SETOnDown:
;Controller_events_code.c,1543 :: 		void Delay_EEV_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1544 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1545 :: 		adressReg= TRV_DEL;
MOVW	R1, #420
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1546 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1547 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1548 :: 		send_data_packet(TRV_DEL,1);
MOVS	R1, #1
MOVW	R0, #420
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1549 :: 		Delay_EEV_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1550 :: 		Image347.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1551 :: 		DrawImage (&Image347);
MOVW	R0, #lo_addr(_Image347+0)
MOVT	R0, #hi_addr(_Image347+0)
BL	_DrawImage+0
;Controller_events_code.c,1552 :: 		}
L_end_Delay_EEV_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnDown
_Delay_DHW_valve_DOWNOnUp:
;Controller_events_code.c,1554 :: 		void Delay_DHW_valve_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1555 :: 		Image310.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1556 :: 		Delay_DHW_valve_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1557 :: 		DrawImage(&Delay_DHW_valve_DOWN);
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1558 :: 		}
L_end_Delay_DHW_valve_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_DOWNOnUp
_Delay_DHW_valve_DOWNOnPress:
;Controller_events_code.c,1559 :: 		void Delay_DHW_valve_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1562 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1563 :: 		Image310.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1564 :: 		Delay_DHW_valve_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1565 :: 		DrawImage(&Image310);
MOVW	R0, #lo_addr(_Image310+0)
MOVT	R0, #hi_addr(_Image310+0)
BL	_DrawImage+0
;Controller_events_code.c,1568 :: 		system_reg[THREE_WAY_DEL]--;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1569 :: 		if (system_reg[THREE_WAY_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_DHW_valve_DOWNOnPress167
;Controller_events_code.c,1570 :: 		system_reg[THREE_WAY_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_DOWNOnPress167:
;Controller_events_code.c,1571 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1572 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1573 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1574 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1575 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_DHW_valve_DOWNOnPress168:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_DOWNOnPress168
NOP
NOP
NOP
;Controller_events_code.c,1576 :: 		}
L_end_Delay_DHW_valve_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_DOWNOnPress
_Delay_DHW_valve_UPOnUp:
;Controller_events_code.c,1577 :: 		void Delay_DHW_valve_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1578 :: 		Image316.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1579 :: 		Delay_DHW_valve_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1580 :: 		DrawImage(&Delay_DHW_valve_UP);
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1581 :: 		}
L_end_Delay_DHW_valve_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_UPOnUp
_Delay_DHW_valve_UPOnPress:
;Controller_events_code.c,1582 :: 		void Delay_DHW_valve_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1585 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1586 :: 		Image316.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1587 :: 		Delay_DHW_valve_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1588 :: 		DrawImage(&Image316);
MOVW	R0, #lo_addr(_Image316+0)
MOVT	R0, #hi_addr(_Image316+0)
BL	_DrawImage+0
;Controller_events_code.c,1591 :: 		system_reg[THREE_WAY_DEL]++;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1592 :: 		if (system_reg[THREE_WAY_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_DHW_valve_UPOnPress170
;Controller_events_code.c,1593 :: 		system_reg[THREE_WAY_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_UPOnPress170:
;Controller_events_code.c,1594 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1595 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1596 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1597 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1598 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_DHW_valve_UPOnPress171:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_UPOnPress171
NOP
NOP
NOP
;Controller_events_code.c,1599 :: 		}
L_end_Delay_DHW_valve_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_UPOnPress
_Delay_DHW_valve_SETOnUp:
;Controller_events_code.c,1600 :: 		void Delay_DHW_valve_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1601 :: 		Delay_DHW_valve_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1602 :: 		Image348.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1603 :: 		DrawImage (&Delay_DHW_valve_SET);
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1604 :: 		}
L_end_Delay_DHW_valve_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnUp
_Delay_DHW_valve_SETOnDown:
;Controller_events_code.c,1605 :: 		void Delay_DHW_valve_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1606 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1607 :: 		adressReg= THREE_WAY_DEL;
MOVW	R1, #50
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1608 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1609 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1610 :: 		send_data_packet(THREE_WAY_DEL,1);
MOVS	R1, #1
MOVW	R0, #50
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1611 :: 		Delay_DHW_valve_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1612 :: 		Image348.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1613 :: 		DrawImage (&Image348);
MOVW	R0, #lo_addr(_Image348+0)
MOVT	R0, #hi_addr(_Image348+0)
BL	_DrawImage+0
;Controller_events_code.c,1614 :: 		}
L_end_Delay_DHW_valve_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnDown
_Delay_compressor_DOWNOnUp:
;Controller_events_code.c,1616 :: 		void Delay_compressor_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1617 :: 		Image311.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1618 :: 		Delay_compressor_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1619 :: 		DrawImage(&Delay_compressor_DOWN);
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+0)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1620 :: 		}
L_end_Delay_compressor_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_DOWNOnUp
_Delay_compressor_DOWNOnPress:
;Controller_events_code.c,1621 :: 		void Delay_compressor_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1624 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1625 :: 		Image311.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1626 :: 		Delay_compressor_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1627 :: 		DrawImage(&Image311);
MOVW	R0, #lo_addr(_Image311+0)
MOVT	R0, #hi_addr(_Image311+0)
BL	_DrawImage+0
;Controller_events_code.c,1630 :: 		system_reg[COMP_DEL]--;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1631 :: 		if (system_reg[COMP_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_compressor_DOWNOnPress173
;Controller_events_code.c,1632 :: 		system_reg[COMP_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_DOWNOnPress173:
;Controller_events_code.c,1633 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1634 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1635 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1636 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1637 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_compressor_DOWNOnPress174:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_DOWNOnPress174
NOP
NOP
NOP
;Controller_events_code.c,1638 :: 		}
L_end_Delay_compressor_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_DOWNOnPress
_Delay_compressor_UPOnUp:
;Controller_events_code.c,1639 :: 		void Delay_compressor_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1640 :: 		Image317.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1641 :: 		Delay_compressor_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1642 :: 		DrawImage(&Delay_compressor_UP);
MOVW	R0, #lo_addr(_Delay_compressor_UP+0)
MOVT	R0, #hi_addr(_Delay_compressor_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1643 :: 		}
L_end_Delay_compressor_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_UPOnUp
_Delay_compressor_UPOnPress:
;Controller_events_code.c,1644 :: 		void Delay_compressor_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1647 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1648 :: 		Image317.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1649 :: 		Delay_compressor_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1650 :: 		DrawImage(&Image317);
MOVW	R0, #lo_addr(_Image317+0)
MOVT	R0, #hi_addr(_Image317+0)
BL	_DrawImage+0
;Controller_events_code.c,1653 :: 		system_reg[COMP_DEL]++;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1654 :: 		if (system_reg[COMP_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_compressor_UPOnPress176
;Controller_events_code.c,1655 :: 		system_reg[COMP_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_UPOnPress176:
;Controller_events_code.c,1656 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1657 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1658 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1659 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1660 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_compressor_UPOnPress177:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_UPOnPress177
NOP
NOP
NOP
;Controller_events_code.c,1661 :: 		}
L_end_Delay_compressor_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_UPOnPress
_Delay_compressor_SETOnUp:
;Controller_events_code.c,1662 :: 		void Delay_compressor_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1663 :: 		Delay_compressor_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1664 :: 		Image349.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1665 :: 		DrawImage (&Delay_compressor_SET);
MOVW	R0, #lo_addr(_Delay_compressor_SET+0)
MOVT	R0, #hi_addr(_Delay_compressor_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1666 :: 		}
L_end_Delay_compressor_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnUp
_Delay_compressor_SETOnDown:
;Controller_events_code.c,1667 :: 		void Delay_compressor_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1668 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1669 :: 		adressReg= COMP_DEL;
MOVW	R1, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1670 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1671 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1672 :: 		send_data_packet(COMP_DEL,1);
MOVS	R1, #1
MOVW	R0, #10
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1673 :: 		Delay_compressor_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1674 :: 		Image349.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1675 :: 		DrawImage (&Image349);
MOVW	R0, #lo_addr(_Image349+0)
MOVT	R0, #hi_addr(_Image349+0)
BL	_DrawImage+0
;Controller_events_code.c,1676 :: 		}
L_end_Delay_compressor_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnDown
_Down_1_OnUp:
;Controller_events_code.c,1679 :: 		void Down_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1680 :: 		Image200.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1681 :: 		Down_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1682 :: 		DrawImage(&Down_1_);
MOVW	R0, #lo_addr(_Down_1_+0)
MOVT	R0, #hi_addr(_Down_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1683 :: 		}
L_end_Down_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_1_OnUp
_Down_1_OnPress:
;Controller_events_code.c,1684 :: 		void Down_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1686 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1687 :: 		Image200.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1688 :: 		Down_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1689 :: 		DrawImage(&Image200);
MOVW	R0, #lo_addr(_Image200+0)
MOVT	R0, #hi_addr(_Image200+0)
BL	_DrawImage+0
;Controller_events_code.c,1690 :: 		system_reg[HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1691 :: 		if (system_reg[HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_1_OnPress179
;Controller_events_code.c,1692 :: 		system_reg[HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Down_1_OnPress179:
;Controller_events_code.c,1693 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1694 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1695 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1696 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1697 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_1_OnPress180:
SUBS	R7, R7, #1
BNE	L_Down_1_OnPress180
NOP
NOP
NOP
;Controller_events_code.c,1698 :: 		}
L_end_Down_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_1_OnPress
_Up_1_OnUp:
;Controller_events_code.c,1699 :: 		void Up_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1700 :: 		Image218.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1701 :: 		Up_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1702 :: 		DrawImage(&Up_1_);
MOVW	R0, #lo_addr(_Up_1_+0)
MOVT	R0, #hi_addr(_Up_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1703 :: 		}
L_end_Up_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_1_OnUp
_Up_1_OnPress:
;Controller_events_code.c,1704 :: 		void Up_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1706 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1707 :: 		Image218.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1708 :: 		Up_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1709 :: 		DrawImage(&Image218);
MOVW	R0, #lo_addr(_Image218+0)
MOVT	R0, #hi_addr(_Image218+0)
BL	_DrawImage+0
;Controller_events_code.c,1710 :: 		system_reg[HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1711 :: 		if (system_reg[HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_1_OnPress182
;Controller_events_code.c,1712 :: 		system_reg[HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Up_1_OnPress182:
;Controller_events_code.c,1713 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1714 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1715 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1716 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1717 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_1_OnPress183:
SUBS	R7, R7, #1
BNE	L_Up_1_OnPress183
NOP
NOP
NOP
;Controller_events_code.c,1718 :: 		}
L_end_Up_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_1_OnPress
_Down_2_OnUp:
;Controller_events_code.c,1719 :: 		void Down_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1720 :: 		Image205.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1721 :: 		Down_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1722 :: 		DrawImage(&Down_2_);
MOVW	R0, #lo_addr(_Down_2_+0)
MOVT	R0, #hi_addr(_Down_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1723 :: 		}
L_end_Down_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_2_OnUp
_Down_2_OnPress:
;Controller_events_code.c,1725 :: 		void Down_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1727 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1728 :: 		Image205.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1729 :: 		Down_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1730 :: 		DrawImage(&Image205);
MOVW	R0, #lo_addr(_Image205+0)
MOVT	R0, #hi_addr(_Image205+0)
BL	_DrawImage+0
;Controller_events_code.c,1732 :: 		system_reg[HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1733 :: 		if (system_reg[HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_2_OnPress185
;Controller_events_code.c,1734 :: 		system_reg[HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Down_2_OnPress185:
;Controller_events_code.c,1735 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1736 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1737 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1738 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1739 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_2_OnPress186:
SUBS	R7, R7, #1
BNE	L_Down_2_OnPress186
NOP
NOP
NOP
;Controller_events_code.c,1740 :: 		}
L_end_Down_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_2_OnPress
_Up_2_OnPress:
;Controller_events_code.c,1741 :: 		void Up_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1743 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1744 :: 		Image219.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1745 :: 		Up_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1746 :: 		DrawImage(&Image219);
MOVW	R0, #lo_addr(_Image219+0)
MOVT	R0, #hi_addr(_Image219+0)
BL	_DrawImage+0
;Controller_events_code.c,1748 :: 		system_reg[HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1749 :: 		if (system_reg[HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_2_OnPress188
;Controller_events_code.c,1750 :: 		system_reg[HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Up_2_OnPress188:
;Controller_events_code.c,1751 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1752 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1753 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1754 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1755 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_2_OnPress189:
SUBS	R7, R7, #1
BNE	L_Up_2_OnPress189
NOP
NOP
NOP
;Controller_events_code.c,1756 :: 		}
L_end_Up_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_2_OnPress
_Up_2_OnUp:
;Controller_events_code.c,1757 :: 		void Up_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1758 :: 		Image219.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1759 :: 		Up_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1760 :: 		DrawImage(&Up_2_);
MOVW	R0, #lo_addr(_Up_2_+0)
MOVT	R0, #hi_addr(_Up_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1761 :: 		}
L_end_Up_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_2_OnUp
_Down_3_OnPress:
;Controller_events_code.c,1763 :: 		void Down_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1765 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1766 :: 		Image206.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1767 :: 		Down_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1768 :: 		DrawImage(&Image206);
MOVW	R0, #lo_addr(_Image206+0)
MOVT	R0, #hi_addr(_Image206+0)
BL	_DrawImage+0
;Controller_events_code.c,1770 :: 		system_reg[EXAUST_MAX]--;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1771 :: 		if (system_reg[EXAUST_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_3_OnPress191
;Controller_events_code.c,1772 :: 		system_reg[EXAUST_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Down_3_OnPress191:
;Controller_events_code.c,1773 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1774 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1775 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1776 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1777 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_3_OnPress192:
SUBS	R7, R7, #1
BNE	L_Down_3_OnPress192
NOP
NOP
NOP
;Controller_events_code.c,1778 :: 		}
L_end_Down_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_3_OnPress
_Down_3_OnUp:
;Controller_events_code.c,1779 :: 		void Down_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1780 :: 		Image206.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1781 :: 		Down_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1782 :: 		DrawImage(&Down_3_);
MOVW	R0, #lo_addr(_Down_3_+0)
MOVT	R0, #hi_addr(_Down_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1783 :: 		}
L_end_Down_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_3_OnUp
_Up_3_OnPress:
;Controller_events_code.c,1784 :: 		void Up_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1786 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1787 :: 		Image220.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1788 :: 		Up_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1789 :: 		DrawImage(&Image220);
MOVW	R0, #lo_addr(_Image220+0)
MOVT	R0, #hi_addr(_Image220+0)
BL	_DrawImage+0
;Controller_events_code.c,1790 :: 		system_reg[EXAUST_MAX]++;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1791 :: 		if(system_reg[EXAUST_MAX]>115)
CMP	R0, #115
IT	LE
BLE	L_Up_3_OnPress194
;Controller_events_code.c,1792 :: 		system_reg[EXAUST_MAX] = 115;
MOVS	R1, #115
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Up_3_OnPress194:
;Controller_events_code.c,1793 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1794 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1795 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1796 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1797 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_3_OnPress195:
SUBS	R7, R7, #1
BNE	L_Up_3_OnPress195
NOP
NOP
NOP
;Controller_events_code.c,1798 :: 		}
L_end_Up_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_3_OnPress
_Up_3_OnUp:
;Controller_events_code.c,1799 :: 		void Up_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1800 :: 		Image220.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1801 :: 		Up_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1802 :: 		DrawImage(&Up_3_);
MOVW	R0, #lo_addr(_Up_3_+0)
MOVT	R0, #hi_addr(_Up_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1803 :: 		}
L_end_Up_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_3_OnUp
_Down_4_OnPress:
;Controller_events_code.c,1804 :: 		void Down_4_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1806 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1807 :: 		Image207.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1808 :: 		Down_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1809 :: 		DrawImage(&Image207);
MOVW	R0, #lo_addr(_Image207+0)
MOVT	R0, #hi_addr(_Image207+0)
BL	_DrawImage+0
;Controller_events_code.c,1811 :: 		system_reg[SOURS_MIN]--;
MOVW	R2, #lo_addr(_system_reg+880)
MOVT	R2, #hi_addr(_system_reg+880)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,1812 :: 		if (system_reg[SOURS_MIN] < -10)
MVN	R0, #9
CMP	R1, R0
IT	GE
BGE	L_Down_4_OnPress197
;Controller_events_code.c,1813 :: 		system_reg[SOURS_MIN] = -10;
MOVW	R1, #65526
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Down_4_OnPress197:
;Controller_events_code.c,1814 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1815 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1816 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1817 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1818 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_4_OnPress198:
SUBS	R7, R7, #1
BNE	L_Down_4_OnPress198
NOP
NOP
NOP
;Controller_events_code.c,1819 :: 		}
L_end_Down_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_4_OnPress
_Up_4_OnPress:
;Controller_events_code.c,1820 :: 		void Up_4_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1822 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1823 :: 		Image221.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1824 :: 		Up_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1825 :: 		DrawImage(&Image221);
MOVW	R0, #lo_addr(_Image221+0)
MOVT	R0, #hi_addr(_Image221+0)
BL	_DrawImage+0
;Controller_events_code.c,1827 :: 		system_reg[SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+880)
MOVT	R1, #hi_addr(_system_reg+880)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1828 :: 		if (system_reg[SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_4_OnPress200
;Controller_events_code.c,1829 :: 		system_reg[SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Up_4_OnPress200:
;Controller_events_code.c,1830 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1831 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1832 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1833 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1834 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_4_OnPress201:
SUBS	R7, R7, #1
BNE	L_Up_4_OnPress201
NOP
NOP
NOP
;Controller_events_code.c,1836 :: 		}
L_end_Up_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_4_OnPress
_Down_4_OnUp:
;Controller_events_code.c,1837 :: 		void Down_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1838 :: 		Image207.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1839 :: 		Down_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1840 :: 		DrawImage(&Down_4_);
MOVW	R0, #lo_addr(_Down_4_+0)
MOVT	R0, #hi_addr(_Down_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1841 :: 		}
L_end_Down_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_4_OnUp
_Up_4_OnUp:
;Controller_events_code.c,1842 :: 		void Up_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1843 :: 		Image221.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1844 :: 		Up_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1845 :: 		DrawImage(&Up_4_);
MOVW	R0, #lo_addr(_Up_4_+0)
MOVT	R0, #hi_addr(_Up_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1846 :: 		}
L_end_Up_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_4_OnUp
_Down_5_OnUp:
;Controller_events_code.c,1847 :: 		void Down_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1848 :: 		Image208.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1849 :: 		Down_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1850 :: 		DrawImage(&Down_5_);
MOVW	R0, #lo_addr(_Down_5_+0)
MOVT	R0, #hi_addr(_Down_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,1851 :: 		}
L_end_Down_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_5_OnUp
_Down_5_OnPress:
;Controller_events_code.c,1852 :: 		void Down_5_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1854 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1855 :: 		Image208.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1856 :: 		Down_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1857 :: 		DrawImage(&Image208);
MOVW	R0, #lo_addr(_Image208+0)
MOVT	R0, #hi_addr(_Image208+0)
BL	_DrawImage+0
;Controller_events_code.c,1858 :: 		system_reg[SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1859 :: 		if (system_reg[SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_5_OnPress203
;Controller_events_code.c,1860 :: 		system_reg[SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Down_5_OnPress203:
;Controller_events_code.c,1861 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1862 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1863 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1864 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1865 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_5_OnPress204:
SUBS	R7, R7, #1
BNE	L_Down_5_OnPress204
NOP
NOP
NOP
;Controller_events_code.c,1866 :: 		}
L_end_Down_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_5_OnPress
_Up_5_OnPress:
;Controller_events_code.c,1867 :: 		void Up_5_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1869 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1870 :: 		Image222.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1871 :: 		Up_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1872 :: 		DrawImage(&Image222);
MOVW	R0, #lo_addr(_Image222+0)
MOVT	R0, #hi_addr(_Image222+0)
BL	_DrawImage+0
;Controller_events_code.c,1873 :: 		system_reg[SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1874 :: 		if (system_reg[SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_5_OnPress206
;Controller_events_code.c,1875 :: 		system_reg[SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Up_5_OnPress206:
;Controller_events_code.c,1876 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1877 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1878 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1879 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1880 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_5_OnPress207:
SUBS	R7, R7, #1
BNE	L_Up_5_OnPress207
NOP
NOP
NOP
;Controller_events_code.c,1881 :: 		}
L_end_Up_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_5_OnPress
_Up_5_OnUp:
;Controller_events_code.c,1882 :: 		void Up_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1883 :: 		Image222.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1884 :: 		Up_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1885 :: 		DrawImage(&Up_5_);
MOVW	R0, #lo_addr(_Up_5_+0)
MOVT	R0, #hi_addr(_Up_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,1886 :: 		}
L_end_Up_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_5_OnUp
_Down_6_OnPress:
;Controller_events_code.c,1887 :: 		void Down_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1889 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1890 :: 		Image209.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1891 :: 		Down_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1892 :: 		DrawImage(&Image209);
MOVW	R0, #lo_addr(_Image209+0)
MOVT	R0, #hi_addr(_Image209+0)
BL	_DrawImage+0
;Controller_events_code.c,1893 :: 		system_reg[DEL_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1894 :: 		if (system_reg[DEL_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_6_OnPress209
;Controller_events_code.c,1895 :: 		system_reg[DEL_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Down_6_OnPress209:
;Controller_events_code.c,1896 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1897 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1898 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1899 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1900 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_6_OnPress210:
SUBS	R7, R7, #1
BNE	L_Down_6_OnPress210
NOP
NOP
NOP
;Controller_events_code.c,1901 :: 		}
L_end_Down_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_6_OnPress
_Down_6_OnUp:
;Controller_events_code.c,1902 :: 		void Down_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1903 :: 		Image209.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1904 :: 		Down_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1905 :: 		DrawImage(&Down_6_);
MOVW	R0, #lo_addr(_Down_6_+0)
MOVT	R0, #hi_addr(_Down_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,1906 :: 		}
L_end_Down_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_6_OnUp
_Up_6_OnPress:
;Controller_events_code.c,1907 :: 		void Up_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1909 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1910 :: 		Image223.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1911 :: 		Up_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1912 :: 		DrawImage(&Image223);
MOVW	R0, #lo_addr(_Image223+0)
MOVT	R0, #hi_addr(_Image223+0)
BL	_DrawImage+0
;Controller_events_code.c,1913 :: 		system_reg[DEL_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1914 :: 		if (system_reg[DEL_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_6_OnPress212
;Controller_events_code.c,1915 :: 		system_reg[DEL_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Up_6_OnPress212:
;Controller_events_code.c,1916 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1917 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1918 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1919 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1920 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_6_OnPress213:
SUBS	R7, R7, #1
BNE	L_Up_6_OnPress213
NOP
NOP
NOP
;Controller_events_code.c,1921 :: 		}
L_end_Up_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_6_OnPress
_Up_6_OnUp:
;Controller_events_code.c,1922 :: 		void Up_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1923 :: 		Image223.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1924 :: 		Up_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1925 :: 		DrawImage(&Up_6_);
MOVW	R0, #lo_addr(_Up_6_+0)
MOVT	R0, #hi_addr(_Up_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,1926 :: 		}
L_end_Up_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_6_OnUp
_Set_1_OnDown:
;Controller_events_code.c,1927 :: 		void Set_1_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1928 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1929 :: 		adressReg= HEAT_MIN;
MOVW	R1, #90
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1930 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1931 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1932 :: 		send_data_packet(HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #90
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1933 :: 		Set_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1934 :: 		Image246.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1935 :: 		DrawImage (&Image246);
MOVW	R0, #lo_addr(_Image246+0)
MOVT	R0, #hi_addr(_Image246+0)
BL	_DrawImage+0
;Controller_events_code.c,1936 :: 		}
L_end_Set_1_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnDown
_Set_1_OnUp:
;Controller_events_code.c,1937 :: 		void Set_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1938 :: 		Set_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1939 :: 		Image246.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1940 :: 		DrawImage (&Set_1_);
MOVW	R0, #lo_addr(_Set_1_+0)
MOVT	R0, #hi_addr(_Set_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1941 :: 		}
L_end_Set_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnUp
_Set_2_OnDown:
;Controller_events_code.c,1942 :: 		void Set_2_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1943 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1944 :: 		adressReg= HEAT_MAX;
MOVW	R1, #80
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1945 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1946 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1947 :: 		send_data_packet(HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #80
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1948 :: 		Set_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1949 :: 		Image247.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1950 :: 		DrawImage (&Image247);
MOVW	R0, #lo_addr(_Image247+0)
MOVT	R0, #hi_addr(_Image247+0)
BL	_DrawImage+0
;Controller_events_code.c,1951 :: 		}
L_end_Set_2_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnDown
_Set_2_OnUp:
;Controller_events_code.c,1952 :: 		void Set_2_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1953 :: 		Set_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1954 :: 		Image247.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1955 :: 		DrawImage (&Set_2_);
MOVW	R0, #lo_addr(_Set_2_+0)
MOVT	R0, #hi_addr(_Set_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1956 :: 		}
L_end_Set_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnUp
_Set_3_OnDown:
;Controller_events_code.c,1958 :: 		void Set_3_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1959 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1960 :: 		adressReg= EXAUST_MAX;
MOVW	R1, #180
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1961 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1962 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1963 :: 		send_data_packet(EXAUST_MAX,1);
MOVS	R1, #1
MOVW	R0, #180
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1964 :: 		Set_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1965 :: 		Image248.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1966 :: 		DrawImage (&Image248);
MOVW	R0, #lo_addr(_Image248+0)
MOVT	R0, #hi_addr(_Image248+0)
BL	_DrawImage+0
;Controller_events_code.c,1967 :: 		}
L_end_Set_3_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnDown
_Set_3_OnUp:
;Controller_events_code.c,1968 :: 		void Set_3_OnUp()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1969 :: 		Set_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1970 :: 		Image248.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1971 :: 		DrawImage (&Set_3_);
MOVW	R0, #lo_addr(_Set_3_+0)
MOVT	R0, #hi_addr(_Set_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1972 :: 		}
L_end_Set_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnUp
_Set_4_OnDown:
;Controller_events_code.c,1973 :: 		void Set_4_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1974 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1975 :: 		adressReg= SOURS_MIN;
MOVW	R1, #440
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1976 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1977 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1978 :: 		send_data_packet(SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #440
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1979 :: 		Set_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1980 :: 		Image249.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1981 :: 		DrawImage (&Image249);
MOVW	R0, #lo_addr(_Image249+0)
MOVT	R0, #hi_addr(_Image249+0)
BL	_DrawImage+0
;Controller_events_code.c,1982 :: 		}
L_end_Set_4_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnDown
_Set_4_OnUp:
;Controller_events_code.c,1984 :: 		void Set_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1985 :: 		Set_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1986 :: 		Image249.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1987 :: 		DrawImage (&Set_4_);
MOVW	R0, #lo_addr(_Set_4_+0)
MOVT	R0, #hi_addr(_Set_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1988 :: 		}
L_end_Set_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnUp
_Set_5_OnDown:
;Controller_events_code.c,1990 :: 		void Set_5_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1991 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1992 :: 		adressReg= SOURS_MAX;
MOVW	R1, #430
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1993 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1994 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1995 :: 		send_data_packet(SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #430
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1996 :: 		Set_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1997 :: 		Image250.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1998 :: 		DrawImage (&Image250);
MOVW	R0, #lo_addr(_Image250+0)
MOVT	R0, #hi_addr(_Image250+0)
BL	_DrawImage+0
;Controller_events_code.c,1999 :: 		}
L_end_Set_5_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnDown
_Set_5_OnUp:
;Controller_events_code.c,2000 :: 		void Set_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2001 :: 		Set_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2002 :: 		Image250.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2003 :: 		DrawImage (&Set_5_);
MOVW	R0, #lo_addr(_Set_5_+0)
MOVT	R0, #hi_addr(_Set_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2004 :: 		}
L_end_Set_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnUp
_Furnance_HP_OFF_save_ondown:
;Controller_events_code.c,2005 :: 		void Furnance_HP_OFF_save_ondown() {
;Controller_events_code.c,2007 :: 		}
L_end_Furnance_HP_OFF_save_ondown:
BX	LR
; end of _Furnance_HP_OFF_save_ondown
_Set_6_OnUp:
;Controller_events_code.c,2008 :: 		void Set_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2009 :: 		Set_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2010 :: 		Image251.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2011 :: 		DrawImage (&Set_6_);
MOVW	R0, #lo_addr(_Set_6_+0)
MOVT	R0, #hi_addr(_Set_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2012 :: 		}
L_end_Set_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnUp
_Set_6_OnDown:
;Controller_events_code.c,2013 :: 		void Set_6_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2014 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2015 :: 		adressReg= DEL_HEAT_MIN;
MOVW	R1, #110
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2016 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2017 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2018 :: 		send_data_packet(DEL_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #110
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2019 :: 		Set_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2020 :: 		Image251.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2021 :: 		DrawImage (&Image251);
MOVW	R0, #lo_addr(_Image251+0)
MOVT	R0, #hi_addr(_Image251+0)
BL	_DrawImage+0
;Controller_events_code.c,2022 :: 		}
L_end_Set_6_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnDown
_Down_7_OnUp:
;Controller_events_code.c,2024 :: 		void Down_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2025 :: 		Image210.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2026 :: 		Down_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2027 :: 		DrawImage(&Down_7_);
MOVW	R0, #lo_addr(_Down_7_+0)
MOVT	R0, #hi_addr(_Down_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2028 :: 		}
L_end_Down_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_7_OnUp
_Down_7_OnPress:
;Controller_events_code.c,2029 :: 		void Down_7_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2031 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2032 :: 		Image210.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2033 :: 		Down_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2034 :: 		DrawImage(&Image210);
MOVW	R0, #lo_addr(_Image210+0)
MOVT	R0, #hi_addr(_Image210+0)
BL	_DrawImage+0
;Controller_events_code.c,2035 :: 		system_reg[DEL_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2036 :: 		if (system_reg[DEL_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_7_OnPress215
;Controller_events_code.c,2037 :: 		system_reg[DEL_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Down_7_OnPress215:
;Controller_events_code.c,2038 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2039 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2040 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2041 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2042 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_7_OnPress216:
SUBS	R7, R7, #1
BNE	L_Down_7_OnPress216
NOP
NOP
NOP
;Controller_events_code.c,2043 :: 		}
L_end_Down_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_7_OnPress
_Up_7_OnPress:
;Controller_events_code.c,2045 :: 		void Up_7_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2047 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2048 :: 		Image224.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2049 :: 		Up_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2050 :: 		DrawImage(&Image224);
MOVW	R0, #lo_addr(_Image224+0)
MOVT	R0, #hi_addr(_Image224+0)
BL	_DrawImage+0
;Controller_events_code.c,2051 :: 		system_reg[DEL_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2052 :: 		if (system_reg[DEL_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_7_OnPress218
;Controller_events_code.c,2053 :: 		system_reg[DEL_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Up_7_OnPress218:
;Controller_events_code.c,2054 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2055 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2056 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2057 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2058 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_7_OnPress219:
SUBS	R7, R7, #1
BNE	L_Up_7_OnPress219
NOP
NOP
NOP
;Controller_events_code.c,2060 :: 		}
L_end_Up_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_7_OnPress
_Up_7_OnUp:
;Controller_events_code.c,2062 :: 		void Up_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2063 :: 		Image224.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2064 :: 		Up_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2065 :: 		DrawImage(&Up_7_);
MOVW	R0, #lo_addr(_Up_7_+0)
MOVT	R0, #hi_addr(_Up_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2067 :: 		}
L_end_Up_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_7_OnUp
_Down_8_OnPress:
;Controller_events_code.c,2069 :: 		void Down_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2071 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2072 :: 		Image211.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2073 :: 		Down_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2074 :: 		DrawImage(&Image211);
MOVW	R0, #lo_addr(_Image211+0)
MOVT	R0, #hi_addr(_Image211+0)
BL	_DrawImage+0
;Controller_events_code.c,2075 :: 		system_reg[DEL_DHW_MIN]--;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2076 :: 		if (system_reg[DEL_DHW_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_8_OnPress221
;Controller_events_code.c,2077 :: 		system_reg[DEL_DHW_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Down_8_OnPress221:
;Controller_events_code.c,2078 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2079 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2080 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2081 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2082 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_8_OnPress222:
SUBS	R7, R7, #1
BNE	L_Down_8_OnPress222
NOP
NOP
NOP
;Controller_events_code.c,2083 :: 		}
L_end_Down_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_8_OnPress
_Down_8_OnUp:
;Controller_events_code.c,2085 :: 		void Down_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2086 :: 		Image211.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2087 :: 		Down_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2088 :: 		DrawImage(&Down_8_);
MOVW	R0, #lo_addr(_Down_8_+0)
MOVT	R0, #hi_addr(_Down_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2089 :: 		}
L_end_Down_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_8_OnUp
_Up_8_OnPress:
;Controller_events_code.c,2091 :: 		void Up_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2093 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2094 :: 		Image225.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2095 :: 		Up_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2096 :: 		DrawImage(&Image225);
MOVW	R0, #lo_addr(_Image225+0)
MOVT	R0, #hi_addr(_Image225+0)
BL	_DrawImage+0
;Controller_events_code.c,2097 :: 		system_reg[DEL_DHW_MIN]++;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2098 :: 		if (system_reg[DEL_DHW_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_8_OnPress224
;Controller_events_code.c,2099 :: 		system_reg[DEL_DHW_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Up_8_OnPress224:
;Controller_events_code.c,2100 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2101 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2102 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2103 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2104 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_8_OnPress225:
SUBS	R7, R7, #1
BNE	L_Up_8_OnPress225
NOP
NOP
NOP
;Controller_events_code.c,2105 :: 		}
L_end_Up_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_8_OnPress
_Up_8_OnUp:
;Controller_events_code.c,2107 :: 		void Up_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2108 :: 		Image225.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2109 :: 		Up_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2110 :: 		DrawImage(&Up_8_);
MOVW	R0, #lo_addr(_Up_8_+0)
MOVT	R0, #hi_addr(_Up_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2111 :: 		}
L_end_Up_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_8_OnUp
_Down_9_OnPress:
;Controller_events_code.c,2113 :: 		void Down_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2115 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2116 :: 		Image214.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2117 :: 		Down_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2118 :: 		DrawImage(&Image214);
MOVW	R0, #lo_addr(_Image214+0)
MOVT	R0, #hi_addr(_Image214+0)
BL	_DrawImage+0
;Controller_events_code.c,2119 :: 		system_reg[DEL_DHW_MAX]--;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2120 :: 		if (system_reg[DEL_DHW_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_9_OnPress227
;Controller_events_code.c,2121 :: 		system_reg[DEL_DHW_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Down_9_OnPress227:
;Controller_events_code.c,2122 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2123 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2124 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2125 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2126 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_9_OnPress228:
SUBS	R7, R7, #1
BNE	L_Down_9_OnPress228
NOP
NOP
NOP
;Controller_events_code.c,2127 :: 		}
L_end_Down_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_9_OnPress
_Down_9_OnUp:
;Controller_events_code.c,2129 :: 		void Down_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2130 :: 		Image214.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2131 :: 		Down_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2132 :: 		DrawImage(&Down_9_);
MOVW	R0, #lo_addr(_Down_9_+0)
MOVT	R0, #hi_addr(_Down_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2133 :: 		}
L_end_Down_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_9_OnUp
_Up_9_OnPress:
;Controller_events_code.c,2135 :: 		void Up_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2137 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2138 :: 		Image228.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2139 :: 		Up_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2140 :: 		DrawImage(&Image228);
MOVW	R0, #lo_addr(_Image228+0)
MOVT	R0, #hi_addr(_Image228+0)
BL	_DrawImage+0
;Controller_events_code.c,2141 :: 		system_reg[DEL_DHW_MAX]++;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2142 :: 		if (system_reg[DEL_DHW_MAX] > 99)
CMP	R0, #99
IT	LE
BLE	L_Up_9_OnPress230
;Controller_events_code.c,2143 :: 		system_reg[DEL_DHW_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Up_9_OnPress230:
;Controller_events_code.c,2144 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2145 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2146 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2147 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2148 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_9_OnPress231:
SUBS	R7, R7, #1
BNE	L_Up_9_OnPress231
NOP
NOP
NOP
;Controller_events_code.c,2149 :: 		}
L_end_Up_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_9_OnPress
_Up_9_OnUp:
;Controller_events_code.c,2151 :: 		void Up_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2152 :: 		Image228.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2153 :: 		Up_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2154 :: 		DrawImage(&Up_9_);
MOVW	R0, #lo_addr(_Up_9_+0)
MOVT	R0, #hi_addr(_Up_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2155 :: 		}
L_end_Up_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_9_OnUp
_Down_10_OnPress:
;Controller_events_code.c,2156 :: 		void Down_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2158 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2159 :: 		Image212.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2160 :: 		Down_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2161 :: 		DrawImage(&Image212);
MOVW	R0, #lo_addr(_Image212+0)
MOVT	R0, #hi_addr(_Image212+0)
BL	_DrawImage+0
;Controller_events_code.c,2162 :: 		system_reg[DEL_SOURS_MIN]--;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2163 :: 		if (system_reg[DEL_SOURS_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_10_OnPress233
;Controller_events_code.c,2164 :: 		system_reg[DEL_SOURS_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Down_10_OnPress233:
;Controller_events_code.c,2165 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2166 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2167 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2168 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2169 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_10_OnPress234:
SUBS	R7, R7, #1
BNE	L_Down_10_OnPress234
NOP
NOP
NOP
;Controller_events_code.c,2170 :: 		}
L_end_Down_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_10_OnPress
_Down_10_OnUp:
;Controller_events_code.c,2172 :: 		void Down_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2173 :: 		Image212.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2174 :: 		Down_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2175 :: 		DrawImage(&Down_10_);
MOVW	R0, #lo_addr(_Down_10_+0)
MOVT	R0, #hi_addr(_Down_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2176 :: 		}
L_end_Down_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_10_OnUp
_Up_10_OnPress:
;Controller_events_code.c,2178 :: 		void Up_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2180 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2181 :: 		Image226.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2182 :: 		Up_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2183 :: 		DrawImage(&Image226);
MOVW	R0, #lo_addr(_Image226+0)
MOVT	R0, #hi_addr(_Image226+0)
BL	_DrawImage+0
;Controller_events_code.c,2184 :: 		system_reg[DEL_SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2185 :: 		if (system_reg[DEL_SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_10_OnPress236
;Controller_events_code.c,2186 :: 		system_reg[DEL_SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Up_10_OnPress236:
;Controller_events_code.c,2187 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2188 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2189 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2190 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2191 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_10_OnPress237:
SUBS	R7, R7, #1
BNE	L_Up_10_OnPress237
NOP
NOP
NOP
;Controller_events_code.c,2192 :: 		}
L_end_Up_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_10_OnPress
_Up_10_OnUp:
;Controller_events_code.c,2194 :: 		void Up_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2195 :: 		Image226.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2196 :: 		Up_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2197 :: 		DrawImage(&Up_10_);
MOVW	R0, #lo_addr(_Up_10_+0)
MOVT	R0, #hi_addr(_Up_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2198 :: 		}
L_end_Up_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_10_OnUp
_Down_11_OnPress:
;Controller_events_code.c,2199 :: 		void Down_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2201 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2202 :: 		Image213.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2203 :: 		Down_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2204 :: 		DrawImage(&Image213);
MOVW	R0, #lo_addr(_Image213+0)
MOVT	R0, #hi_addr(_Image213+0)
BL	_DrawImage+0
;Controller_events_code.c,2205 :: 		system_reg[DEL_SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2206 :: 		if (system_reg[DEL_SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_11_OnPress239
;Controller_events_code.c,2207 :: 		system_reg[DEL_SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Down_11_OnPress239:
;Controller_events_code.c,2208 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2209 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2210 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2211 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2212 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_11_OnPress240:
SUBS	R7, R7, #1
BNE	L_Down_11_OnPress240
NOP
NOP
NOP
;Controller_events_code.c,2213 :: 		}
L_end_Down_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_11_OnPress
_Down_11_OnUp:
;Controller_events_code.c,2215 :: 		void Down_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2216 :: 		Image213.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2217 :: 		Down_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2218 :: 		DrawImage(&Down_11_);
MOVW	R0, #lo_addr(_Down_11_+0)
MOVT	R0, #hi_addr(_Down_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2220 :: 		}
L_end_Down_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_11_OnUp
_Up_11_OnPress:
;Controller_events_code.c,2222 :: 		void Up_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2224 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2225 :: 		Image227.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2226 :: 		Up_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2227 :: 		DrawImage(&Image227);
MOVW	R0, #lo_addr(_Image227+0)
MOVT	R0, #hi_addr(_Image227+0)
BL	_DrawImage+0
;Controller_events_code.c,2228 :: 		system_reg[DEL_SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2229 :: 		if (system_reg[DEL_SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_11_OnPress242
;Controller_events_code.c,2230 :: 		system_reg[DEL_SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Up_11_OnPress242:
;Controller_events_code.c,2231 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2232 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2233 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2234 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2235 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_11_OnPress243:
SUBS	R7, R7, #1
BNE	L_Up_11_OnPress243
NOP
NOP
NOP
;Controller_events_code.c,2236 :: 		}
L_end_Up_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_11_OnPress
_Up_11_OnUp:
;Controller_events_code.c,2238 :: 		void Up_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2239 :: 		Image227.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2240 :: 		Up_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2241 :: 		DrawImage(&Up_11_);
MOVW	R0, #lo_addr(_Up_11_+0)
MOVT	R0, #hi_addr(_Up_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2242 :: 		}
L_end_Up_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_11_OnUp
_Down_12_OnPress:
;Controller_events_code.c,2247 :: 		void Down_12_OnPress() {
;Controller_events_code.c,2249 :: 		}
L_end_Down_12_OnPress:
BX	LR
; end of _Down_12_OnPress
_Down_12_OnUp:
;Controller_events_code.c,2251 :: 		void Down_12_OnUp() {
;Controller_events_code.c,2253 :: 		}
L_end_Down_12_OnUp:
BX	LR
; end of _Down_12_OnUp
_Up_12_OnPress:
;Controller_events_code.c,2255 :: 		void Up_12_OnPress() {
;Controller_events_code.c,2257 :: 		}
L_end_Up_12_OnPress:
BX	LR
; end of _Up_12_OnPress
_Up_12_OnUp:
;Controller_events_code.c,2259 :: 		void Up_12_OnUp() {
;Controller_events_code.c,2261 :: 		}
L_end_Up_12_OnUp:
BX	LR
; end of _Up_12_OnUp
_Set_7_OnUp:
;Controller_events_code.c,2262 :: 		void Set_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2263 :: 		Set_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2264 :: 		Image252.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2265 :: 		DrawImage (&Set_7_);
MOVW	R0, #lo_addr(_Set_7_+0)
MOVT	R0, #hi_addr(_Set_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2266 :: 		}
L_end_Set_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnUp
_Set_7_OnDown:
;Controller_events_code.c,2267 :: 		void Set_7_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2268 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2269 :: 		adressReg= DEL_HEAT_MAX;
MOVW	R1, #100
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2270 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2271 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2272 :: 		send_data_packet(DEL_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #100
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2273 :: 		Set_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2274 :: 		Image252.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2275 :: 		DrawImage (&Image252);
MOVW	R0, #lo_addr(_Image252+0)
MOVT	R0, #hi_addr(_Image252+0)
BL	_DrawImage+0
;Controller_events_code.c,2276 :: 		}
L_end_Set_7_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnDown
_Set_8_OnDown:
;Controller_events_code.c,2278 :: 		void Set_8_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2279 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2280 :: 		adressReg= DEL_DHW_MIN;
MOVW	R1, #460
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2281 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2282 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2283 :: 		send_data_packet(DEL_DHW_MIN,1);
MOVS	R1, #1
MOVW	R0, #460
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2284 :: 		Set_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2285 :: 		Image253.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2286 :: 		DrawImage (&Image253);
MOVW	R0, #lo_addr(_Image253+0)
MOVT	R0, #hi_addr(_Image253+0)
BL	_DrawImage+0
;Controller_events_code.c,2287 :: 		}
L_end_Set_8_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnDown
_Set_8_OnUp:
;Controller_events_code.c,2289 :: 		void Set_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2290 :: 		Set_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2291 :: 		Image253.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2292 :: 		DrawImage (&Set_8_);
MOVW	R0, #lo_addr(_Set_8_+0)
MOVT	R0, #hi_addr(_Set_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2293 :: 		}
L_end_Set_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnUp
_Set_9_OnUp:
;Controller_events_code.c,2295 :: 		void Set_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2296 :: 		Set_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2297 :: 		Image256.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2298 :: 		DrawImage (&Set_9_);
MOVW	R0, #lo_addr(_Set_9_+0)
MOVT	R0, #hi_addr(_Set_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2299 :: 		}
L_end_Set_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnUp
_Set_9_OnDown:
;Controller_events_code.c,2300 :: 		void Set_9_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2301 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2302 :: 		adressReg= DEL_DHW_MAX;
MOVW	R1, #450
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
;Controller_events_code.c,2305 :: 		send_data_packet(DEL_DHW_MAX,1);
MOVS	R1, #1
MOVW	R0, #450
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2306 :: 		Set_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2307 :: 		Image256.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2308 :: 		DrawImage (&Image256);
MOVW	R0, #lo_addr(_Image256+0)
MOVT	R0, #hi_addr(_Image256+0)
BL	_DrawImage+0
;Controller_events_code.c,2309 :: 		}
L_end_Set_9_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnDown
_Set_10_OnDown:
;Controller_events_code.c,2310 :: 		void Set_10_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2311 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2312 :: 		adressReg= DEL_SOURS_MIN;
MOVW	R1, #130
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2313 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2314 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2315 :: 		send_data_packet(DEL_SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #130
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2316 :: 		Set_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2317 :: 		Image254.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2318 :: 		DrawImage (&Image254);
MOVW	R0, #lo_addr(_Image254+0)
MOVT	R0, #hi_addr(_Image254+0)
BL	_DrawImage+0
;Controller_events_code.c,2319 :: 		}
L_end_Set_10_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnDown
_Set_10_OnUp:
;Controller_events_code.c,2321 :: 		void Set_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2322 :: 		Set_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2323 :: 		Image254.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2324 :: 		DrawImage (&Set_10_);
MOVW	R0, #lo_addr(_Set_10_+0)
MOVT	R0, #hi_addr(_Set_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2325 :: 		}
L_end_Set_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnUp
_Set_11_OnDown:
;Controller_events_code.c,2326 :: 		void Set_11_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2327 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2328 :: 		adressReg= DEL_SOURS_MAX;
MOVW	R1, #120
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2329 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2330 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2331 :: 		send_data_packet(DEL_SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #120
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2332 :: 		Set_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2333 :: 		Image255.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2334 :: 		DrawImage (&Image255);
MOVW	R0, #lo_addr(_Image255+0)
MOVT	R0, #hi_addr(_Image255+0)
BL	_DrawImage+0
;Controller_events_code.c,2335 :: 		}
L_end_Set_11_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnDown
_Set_11_OnUp:
;Controller_events_code.c,2336 :: 		void Set_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2337 :: 		Set_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2338 :: 		Image255.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2339 :: 		DrawImage (&Set_11_);
MOVW	R0, #lo_addr(_Set_11_+0)
MOVT	R0, #hi_addr(_Set_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2340 :: 		}
L_end_Set_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnUp
_Set_12_OnDown:
;Controller_events_code.c,2342 :: 		void Set_12_OnDown() {
;Controller_events_code.c,2344 :: 		}
L_end_Set_12_OnDown:
BX	LR
; end of _Set_12_OnDown
_Set_12_OnUp:
;Controller_events_code.c,2345 :: 		void Set_12_OnUp() {
;Controller_events_code.c,2347 :: 		}
L_end_Set_12_OnUp:
BX	LR
; end of _Set_12_OnUp
_Down_19_OnPress:
;Controller_events_code.c,2351 :: 		void Down_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2353 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2354 :: 		Image243.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2355 :: 		Down_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2356 :: 		DrawImage(&Image243);
MOVW	R0, #lo_addr(_Image243+0)
MOVT	R0, #hi_addr(_Image243+0)
BL	_DrawImage+0
;Controller_events_code.c,2357 :: 		system_reg[S_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2358 :: 		if (system_reg[S_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_19_OnPress245
;Controller_events_code.c,2359 :: 		system_reg[S_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Down_19_OnPress245:
;Controller_events_code.c,2360 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2361 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2362 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2363 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2364 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_19_OnPress246:
SUBS	R7, R7, #1
BNE	L_Down_19_OnPress246
NOP
NOP
NOP
;Controller_events_code.c,2365 :: 		}
L_end_Down_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_19_OnPress
_Down_19_OnUp:
;Controller_events_code.c,2366 :: 		void Down_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2367 :: 		Image243.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2368 :: 		Down_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2369 :: 		DrawImage(&Down_19_);
MOVW	R0, #lo_addr(_Down_19_+0)
MOVT	R0, #hi_addr(_Down_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2370 :: 		}
L_end_Down_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_19_OnUp
_Up_19_OnPress:
;Controller_events_code.c,2371 :: 		void Up_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2373 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2374 :: 		Image236.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2375 :: 		Up_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2376 :: 		DrawImage(&Image236);
MOVW	R0, #lo_addr(_Image236+0)
MOVT	R0, #hi_addr(_Image236+0)
BL	_DrawImage+0
;Controller_events_code.c,2377 :: 		system_reg[S_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2378 :: 		if (system_reg[S_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_19_OnPress248
;Controller_events_code.c,2379 :: 		system_reg[S_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Up_19_OnPress248:
;Controller_events_code.c,2380 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2381 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2382 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2383 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2384 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_19_OnPress249:
SUBS	R7, R7, #1
BNE	L_Up_19_OnPress249
NOP
NOP
NOP
;Controller_events_code.c,2385 :: 		}
L_end_Up_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_19_OnPress
_Up_19_OnUp:
;Controller_events_code.c,2386 :: 		void Up_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2387 :: 		Image236.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2388 :: 		Up_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2389 :: 		DrawImage(&Up_19_);
MOVW	R0, #lo_addr(_Up_19_+0)
MOVT	R0, #hi_addr(_Up_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2390 :: 		}
L_end_Up_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_19_OnUp
_Down_20_OnPress:
;Controller_events_code.c,2391 :: 		void Down_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2393 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2394 :: 		Image244.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2395 :: 		Down_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2396 :: 		DrawImage(&Image244);
MOVW	R0, #lo_addr(_Image244+0)
MOVT	R0, #hi_addr(_Image244+0)
BL	_DrawImage+0
;Controller_events_code.c,2397 :: 		system_reg[S_COOL_MIN]--;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2398 :: 		if (system_reg[S_COOL_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_20_OnPress251
;Controller_events_code.c,2399 :: 		system_reg[S_COOL_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Down_20_OnPress251:
;Controller_events_code.c,2400 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2401 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2402 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2403 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2404 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_20_OnPress252:
SUBS	R7, R7, #1
BNE	L_Down_20_OnPress252
NOP
NOP
NOP
;Controller_events_code.c,2405 :: 		}
L_end_Down_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_20_OnPress
_Down_20_OnUp:
;Controller_events_code.c,2406 :: 		void Down_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2407 :: 		Image244.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2408 :: 		Down_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2409 :: 		DrawImage(&Down_20_);
MOVW	R0, #lo_addr(_Down_20_+0)
MOVT	R0, #hi_addr(_Down_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2410 :: 		}
L_end_Down_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_20_OnUp
_Up_20_OnPress:
;Controller_events_code.c,2411 :: 		void Up_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2413 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2414 :: 		Image237.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2415 :: 		Up_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2416 :: 		DrawImage(&Image237);
MOVW	R0, #lo_addr(_Image237+0)
MOVT	R0, #hi_addr(_Image237+0)
BL	_DrawImage+0
;Controller_events_code.c,2417 :: 		system_reg[S_COOL_MIN]++;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2418 :: 		if (system_reg[S_COOL_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_20_OnPress254
;Controller_events_code.c,2419 :: 		system_reg[S_COOL_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Up_20_OnPress254:
;Controller_events_code.c,2420 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2421 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2422 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2423 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2424 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_20_OnPress255:
SUBS	R7, R7, #1
BNE	L_Up_20_OnPress255
NOP
NOP
NOP
;Controller_events_code.c,2425 :: 		}
L_end_Up_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_20_OnPress
_Up_20_OnUp:
;Controller_events_code.c,2426 :: 		void Up_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2427 :: 		Image237.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2428 :: 		Up_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2429 :: 		DrawImage(&Up_20_);
MOVW	R0, #lo_addr(_Up_20_+0)
MOVT	R0, #hi_addr(_Up_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2430 :: 		}
L_end_Up_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_20_OnUp
_Down_21_OnPress:
;Controller_events_code.c,2431 :: 		void Down_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2433 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2434 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2435 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2436 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2437 :: 		system_reg[S_COOL_MAX]--;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2438 :: 		if (system_reg[S_COOL_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_21_OnPress257
;Controller_events_code.c,2439 :: 		system_reg[S_COOL_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Down_21_OnPress257:
;Controller_events_code.c,2440 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2441 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2442 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2443 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2444 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_21_OnPress258:
SUBS	R7, R7, #1
BNE	L_Down_21_OnPress258
NOP
NOP
NOP
;Controller_events_code.c,2445 :: 		}
L_end_Down_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_21_OnPress
_Down_21_OnUp:
;Controller_events_code.c,2446 :: 		void Down_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2447 :: 		Image245.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image245+20)
MOVT	R0, #hi_addr(_Image245+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2448 :: 		Down_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_21_+20)
MOVT	R0, #hi_addr(_Down_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2449 :: 		DrawImage(&Down_21_);
MOVW	R0, #lo_addr(_Down_21_+0)
MOVT	R0, #hi_addr(_Down_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2450 :: 		}
L_end_Down_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_21_OnUp
_Up_21_OnPress:
;Controller_events_code.c,2451 :: 		void Up_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2453 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2454 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2455 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2456 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2457 :: 		system_reg[S_COOL_MAX]++;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2458 :: 		if (system_reg[S_COOL_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_21_OnPress260
;Controller_events_code.c,2459 :: 		system_reg[S_COOL_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Up_21_OnPress260:
;Controller_events_code.c,2460 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2461 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2462 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2463 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2464 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_21_OnPress261:
SUBS	R7, R7, #1
BNE	L_Up_21_OnPress261
NOP
NOP
NOP
;Controller_events_code.c,2465 :: 		}
L_end_Up_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_21_OnPress
_Up_21_OnUp:
;Controller_events_code.c,2466 :: 		void Up_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2467 :: 		Image238.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2468 :: 		Up_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2469 :: 		DrawImage(&Up_21_);
MOVW	R0, #lo_addr(_Up_21_+0)
MOVT	R0, #hi_addr(_Up_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2470 :: 		}
L_end_Up_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_21_OnUp
_Down_22_OnPress:
;Controller_events_code.c,2472 :: 		void Down_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2474 :: 		Image24.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2475 :: 		Down_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2476 :: 		DrawImage(&Image24);
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
BL	_DrawImage+0
;Controller_events_code.c,2477 :: 		system_reg[HP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2478 :: 		if (system_reg[HP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_22_OnPress263
;Controller_events_code.c,2479 :: 		system_reg[HP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Down_22_OnPress263:
;Controller_events_code.c,2480 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2481 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2482 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2483 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2484 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_22_OnPress264:
SUBS	R7, R7, #1
BNE	L_Down_22_OnPress264
NOP
NOP
NOP
;Controller_events_code.c,2485 :: 		}
L_end_Down_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_22_OnPress
_Down_22_OnUp:
;Controller_events_code.c,2486 :: 		void Down_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2487 :: 		Image24.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2488 :: 		Down_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2489 :: 		DrawImage(&Down_22_);
MOVW	R0, #lo_addr(_Down_22_+0)
MOVT	R0, #hi_addr(_Down_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2491 :: 		}
L_end_Down_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_22_OnUp
_Up_22_OnPress:
;Controller_events_code.c,2492 :: 		void Up_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2494 :: 		Image53.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2495 :: 		Up_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2496 :: 		DrawImage(&Image53);
MOVW	R0, #lo_addr(_Image53+0)
MOVT	R0, #hi_addr(_Image53+0)
BL	_DrawImage+0
;Controller_events_code.c,2497 :: 		system_reg[HP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2498 :: 		if (system_reg[HP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_22_OnPress266
;Controller_events_code.c,2499 :: 		system_reg[HP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Up_22_OnPress266:
;Controller_events_code.c,2500 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2501 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2502 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2503 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2504 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_22_OnPress267:
SUBS	R7, R7, #1
BNE	L_Up_22_OnPress267
NOP
NOP
NOP
;Controller_events_code.c,2505 :: 		}
L_end_Up_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_22_OnPress
_Up_22_OnUp:
;Controller_events_code.c,2506 :: 		void Up_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2507 :: 		Image53.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2508 :: 		Up_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2509 :: 		DrawImage(&Up_22_);
MOVW	R0, #lo_addr(_Up_22_+0)
MOVT	R0, #hi_addr(_Up_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2510 :: 		}
L_end_Up_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_22_OnUp
_Down_23_OnPress:
;Controller_events_code.c,2511 :: 		void Down_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2513 :: 		Image86.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2514 :: 		Down_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2515 :: 		DrawImage(&Image86);
MOVW	R0, #lo_addr(_Image86+0)
MOVT	R0, #hi_addr(_Image86+0)
BL	_DrawImage+0
;Controller_events_code.c,2516 :: 		system_reg[HP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2517 :: 		if (system_reg[HP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_23_OnPress269
;Controller_events_code.c,2518 :: 		system_reg[HP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Down_23_OnPress269:
;Controller_events_code.c,2519 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2520 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2521 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2522 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2523 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_23_OnPress270:
SUBS	R7, R7, #1
BNE	L_Down_23_OnPress270
NOP
NOP
NOP
;Controller_events_code.c,2524 :: 		}
L_end_Down_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_23_OnPress
_Down_23_OnUp:
;Controller_events_code.c,2525 :: 		void Down_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2526 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2527 :: 		Down_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2528 :: 		DrawImage(&Down_23_);
MOVW	R0, #lo_addr(_Down_23_+0)
MOVT	R0, #hi_addr(_Down_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2530 :: 		}
L_end_Down_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_23_OnUp
_Up_23_OnPress:
;Controller_events_code.c,2531 :: 		void Up_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2533 :: 		Image95.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image95+20)
MOVT	R0, #hi_addr(_Image95+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2534 :: 		Up_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2535 :: 		DrawImage(&Image95);
MOVW	R0, #lo_addr(_Image95+0)
MOVT	R0, #hi_addr(_Image95+0)
BL	_DrawImage+0
;Controller_events_code.c,2536 :: 		system_reg[HP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2537 :: 		if (system_reg[HP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_23_OnPress272
;Controller_events_code.c,2538 :: 		system_reg[HP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Up_23_OnPress272:
;Controller_events_code.c,2539 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2540 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2541 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2542 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2543 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_23_OnPress273:
SUBS	R7, R7, #1
BNE	L_Up_23_OnPress273
NOP
NOP
NOP
;Controller_events_code.c,2544 :: 		}
L_end_Up_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_23_OnPress
_Up_23_OnUp:
;Controller_events_code.c,2545 :: 		void Up_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2546 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2547 :: 		Up_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2548 :: 		DrawImage(&Up_23_);
MOVW	R0, #lo_addr(_Up_23_+0)
MOVT	R0, #hi_addr(_Up_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2549 :: 		}
L_end_Up_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_23_OnUp
_Set_19_OnUp:
;Controller_events_code.c,2551 :: 		void Set_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2552 :: 		Set_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2553 :: 		Image264.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2554 :: 		DrawImage (&Set_19_);
MOVW	R0, #lo_addr(_Set_19_+0)
MOVT	R0, #hi_addr(_Set_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2555 :: 		}
L_end_Set_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnUp
_Set_19_OnDown:
;Controller_events_code.c,2556 :: 		void void Set_19_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2557 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2558 :: 		adressReg= S_HEAT_MAX;
MOVW	R1, #280
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2559 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2560 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2561 :: 		send_data_packet(S_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #280
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2562 :: 		Set_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2563 :: 		Image264.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2564 :: 		DrawImage (&Image264);
MOVW	R0, #lo_addr(_Image264+0)
MOVT	R0, #hi_addr(_Image264+0)
BL	_DrawImage+0
;Controller_events_code.c,2565 :: 		}
L_end_Set_19_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnDown
_Set_20_OnDown:
;Controller_events_code.c,2566 :: 		void Set_20_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2567 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2568 :: 		adressReg= S_COOL_MIN;
MOVW	R1, #270
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2569 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2570 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2571 :: 		send_data_packet(S_COOL_MIN,1);
MOVS	R1, #1
MOVW	R0, #270
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2572 :: 		Set_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2573 :: 		Image265.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2574 :: 		DrawImage (&Image265);
MOVW	R0, #lo_addr(_Image265+0)
MOVT	R0, #hi_addr(_Image265+0)
BL	_DrawImage+0
;Controller_events_code.c,2575 :: 		}
L_end_Set_20_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnDown
_Set_20_OnUp:
;Controller_events_code.c,2576 :: 		void Set_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2577 :: 		Set_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2578 :: 		Image265.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2579 :: 		DrawImage (&Set_20_);
MOVW	R0, #lo_addr(_Set_20_+0)
MOVT	R0, #hi_addr(_Set_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2580 :: 		}
L_end_Set_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnUp
_Set_21_OnDown:
;Controller_events_code.c,2581 :: 		void Set_21_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2582 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2583 :: 		adressReg= S_COOL_MAX;
MOVW	R1, #260
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2584 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2585 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2586 :: 		send_data_packet(S_COOL_MAX,1);
MOVS	R1, #1
MOVW	R0, #260
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2587 :: 		Set_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2588 :: 		Image266.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2589 :: 		DrawImage (&Image266);
MOVW	R0, #lo_addr(_Image266+0)
MOVT	R0, #hi_addr(_Image266+0)
BL	_DrawImage+0
;Controller_events_code.c,2590 :: 		}
L_end_Set_21_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnDown
_Set_21_OnUp:
;Controller_events_code.c,2591 :: 		void Set_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2592 :: 		Set_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2593 :: 		Image266.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2594 :: 		DrawImage (&Set_21_);
MOVW	R0, #lo_addr(_Set_21_+0)
MOVT	R0, #hi_addr(_Set_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2595 :: 		}
L_end_Set_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnUp
_Set_22_OnDown:
;Controller_events_code.c,2596 :: 		void Set_22_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2597 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2598 :: 		adressReg= HP_MAX;
MOVW	R1, #220
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2599 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2600 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2601 :: 		send_data_packet(HP_MAX,1);
MOVS	R1, #1
MOVW	R0, #220
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2602 :: 		Set_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2603 :: 		Image34.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2604 :: 		DrawImage (&Image34);
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
BL	_DrawImage+0
;Controller_events_code.c,2605 :: 		}
L_end_Set_22_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnDown
_Set_22_OnUp:
;Controller_events_code.c,2607 :: 		void Set_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2608 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2609 :: 		Set_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2610 :: 		Image34.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2611 :: 		DrawImage (&Set_22_);
MOVW	R0, #lo_addr(_Set_22_+0)
MOVT	R0, #hi_addr(_Set_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2612 :: 		}
L_end_Set_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnUp
_Set_23_OnDown:
;Controller_events_code.c,2613 :: 		void Set_23_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2614 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2615 :: 		adressReg= HP_MIN;
MOVW	R1, #240
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2616 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2617 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2618 :: 		send_data_packet(HP_MIN,1);
MOVS	R1, #1
MOVW	R0, #240
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2619 :: 		Set_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2620 :: 		Image33.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2621 :: 		DrawImage (&Image33);
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
BL	_DrawImage+0
;Controller_events_code.c,2622 :: 		}
L_end_Set_23_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnDown
_Set_23_OnUp:
;Controller_events_code.c,2623 :: 		void Set_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2624 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2625 :: 		Set_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2626 :: 		Image33.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2627 :: 		DrawImage (&Set_23_);
MOVW	R0, #lo_addr(_Set_23_+0)
MOVT	R0, #hi_addr(_Set_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2628 :: 		}
L_end_Set_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnUp
_One_CompressorsOnClick:
;Controller_events_code.c,2631 :: 		void One_CompressorsOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2632 :: 		if ((unsigned long)One_Compressors.Picture_Name == Compressor1_jpg)
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
LDR	R1, [R0, #0]
MOVW	R0, #24408
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_One_CompressorsOnClick275
;Controller_events_code.c,2634 :: 		One_Compressors.Picture_Name = Compressor2_jpg;
MOVW	R1, #18396
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2635 :: 		DrawImage(&Two_Compressors);
MOVW	R0, #lo_addr(_Two_Compressors+0)
MOVT	R0, #hi_addr(_Two_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2636 :: 		system_reg[NOMB_COMPRESSORS]=2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2637 :: 		two_compressors_mode=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2638 :: 		}
IT	AL
BAL	L_One_CompressorsOnClick276
L_One_CompressorsOnClick275:
;Controller_events_code.c,2640 :: 		One_Compressors.Picture_Name = Compressor1_jpg;
MOVW	R1, #24408
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2641 :: 		DrawImage(&One_Compressors);
MOVW	R0, #lo_addr(_One_Compressors+0)
MOVT	R0, #hi_addr(_One_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2642 :: 		system_reg[NOMB_COMPRESSORS]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2643 :: 		two_compressors_mode=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2644 :: 		}
L_One_CompressorsOnClick276:
;Controller_events_code.c,2645 :: 		send_data_packet(NOMB_COMPRESSORS,1);
MOVS	R1, #1
MOVW	R0, #400
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2646 :: 		Delay_ms (300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_One_CompressorsOnClick277:
SUBS	R7, R7, #1
BNE	L_One_CompressorsOnClick277
NOP
NOP
NOP
;Controller_events_code.c,2647 :: 		}
L_end_One_CompressorsOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _One_CompressorsOnClick
_Reversing_ON_HEATOnClick:
;Controller_events_code.c,2649 :: 		void Reversing_ON_HEATOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2650 :: 		if ((unsigned long)Reversing_ON_HEAT.Picture_Name == but_ON_jpg)
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
LDR	R1, [R0, #0]
MOVW	R0, #27414
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_Reversing_ON_HEATOnClick279
;Controller_events_code.c,2652 :: 		Reversing_ON_HEAT.Picture_Name = but_OFF_jpg;
MOVW	R1, #21402
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2653 :: 		DrawImage(&Reversing_Heat_OFF);
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+0)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,2654 :: 		system_reg[REVERS_MOD]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2656 :: 		}
IT	AL
BAL	L_Reversing_ON_HEATOnClick280
L_Reversing_ON_HEATOnClick279:
;Controller_events_code.c,2658 :: 		Reversing_ON_HEAT.Picture_Name = but_ON_jpg;
MOVW	R1, #27414
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2659 :: 		DrawImage(&Reversing_ON_HEAT);
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+0)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+0)
BL	_DrawImage+0
;Controller_events_code.c,2660 :: 		system_reg[REVERS_MOD]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2661 :: 		}
L_Reversing_ON_HEATOnClick280:
;Controller_events_code.c,2662 :: 		send_data_packet(REVERS_MOD,1);
MOVS	R1, #1
MOVW	R0, #410
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2663 :: 		Delay_ms (300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_Reversing_ON_HEATOnClick281:
SUBS	R7, R7, #1
BNE	L_Reversing_ON_HEATOnClick281
NOP
NOP
NOP
;Controller_events_code.c,2664 :: 		}
L_end_Reversing_ON_HEATOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Reversing_ON_HEATOnClick
_Flow_Source__Sensor_ONOnClick:
;Controller_events_code.c,2665 :: 		void Flow_Source__Sensor_ONOnClick(){
;Controller_events_code.c,2667 :: 		}
L_end_Flow_Source__Sensor_ONOnClick:
BX	LR
; end of _Flow_Source__Sensor_ONOnClick
_Flow_Source__Heat1_ONOnClick:
;Controller_events_code.c,2668 :: 		void Flow_Source__Heat1_ONOnClick() {
;Controller_events_code.c,2670 :: 		}
L_end_Flow_Source__Heat1_ONOnClick:
BX	LR
; end of _Flow_Source__Heat1_ONOnClick
_Flow_Source__Heat2_ONOnClick:
;Controller_events_code.c,2671 :: 		void Flow_Source__Heat2_ONOnClick() {
;Controller_events_code.c,2673 :: 		}
L_end_Flow_Source__Heat2_ONOnClick:
BX	LR
; end of _Flow_Source__Heat2_ONOnClick
_Power_380VOnClick:
;Controller_events_code.c,2674 :: 		void Power_380VOnClick() {
;Controller_events_code.c,2676 :: 		}
L_end_Power_380VOnClick:
BX	LR
; end of _Power_380VOnClick
_furnance_Mode_onOnClick:
;Controller_events_code.c,2679 :: 		void furnance_Mode_onOnClick() {
;Controller_events_code.c,2681 :: 		}
L_end_furnance_Mode_onOnClick:
BX	LR
; end of _furnance_Mode_onOnClick
_Furnance_start_temp_DownOnUp:
;Controller_events_code.c,2683 :: 		void Furnance_start_temp_DownOnUp() {
;Controller_events_code.c,2685 :: 		}
L_end_Furnance_start_temp_DownOnUp:
BX	LR
; end of _Furnance_start_temp_DownOnUp
_Furnance_start_temp_DownOnPress:
;Controller_events_code.c,2686 :: 		void Furnance_start_temp_DownOnPress() {
;Controller_events_code.c,2688 :: 		}
L_end_Furnance_start_temp_DownOnPress:
BX	LR
; end of _Furnance_start_temp_DownOnPress
_Furnance_HP_OFF_DowmOnUp:
;Controller_events_code.c,2689 :: 		void Furnance_HP_OFF_DowmOnUp() {
;Controller_events_code.c,2691 :: 		}
L_end_Furnance_HP_OFF_DowmOnUp:
BX	LR
; end of _Furnance_HP_OFF_DowmOnUp
_Furnance_HP_OFF_DowmOnPress:
;Controller_events_code.c,2692 :: 		void Furnance_HP_OFF_DowmOnPress() {
;Controller_events_code.c,2694 :: 		}
L_end_Furnance_HP_OFF_DowmOnPress:
BX	LR
; end of _Furnance_HP_OFF_DowmOnPress
_Furnance_HP_OFF_UPOnUp:
;Controller_events_code.c,2695 :: 		void Furnance_HP_OFF_UPOnUp() {
;Controller_events_code.c,2697 :: 		}
L_end_Furnance_HP_OFF_UPOnUp:
BX	LR
; end of _Furnance_HP_OFF_UPOnUp
_Furnance_HP_OFF_UPOnPress:
;Controller_events_code.c,2698 :: 		void Furnance_HP_OFF_UPOnPress() {
;Controller_events_code.c,2700 :: 		}
L_end_Furnance_HP_OFF_UPOnPress:
BX	LR
; end of _Furnance_HP_OFF_UPOnPress
_Furnance_off_downOnUp:
;Controller_events_code.c,2702 :: 		void Furnance_off_downOnUp() {
;Controller_events_code.c,2704 :: 		}
L_end_Furnance_off_downOnUp:
BX	LR
; end of _Furnance_off_downOnUp
_Furnance_off_downOnPress:
;Controller_events_code.c,2705 :: 		void Furnance_off_downOnPress() {
;Controller_events_code.c,2707 :: 		}
L_end_Furnance_off_downOnPress:
BX	LR
; end of _Furnance_off_downOnPress
_Furnance_off_upOnUp:
;Controller_events_code.c,2708 :: 		void Furnance_off_upOnUp() {
;Controller_events_code.c,2710 :: 		}
L_end_Furnance_off_upOnUp:
BX	LR
; end of _Furnance_off_upOnUp
_Furnance_off_upOnPress:
;Controller_events_code.c,2711 :: 		void Furnance_off_upOnPress() {
;Controller_events_code.c,2713 :: 		}
L_end_Furnance_off_upOnPress:
BX	LR
; end of _Furnance_off_upOnPress
_Furnance_off_save_onup:
;Controller_events_code.c,2714 :: 		void Furnance_off_save_onup() {
;Controller_events_code.c,2716 :: 		}
L_end_Furnance_off_save_onup:
BX	LR
; end of _Furnance_off_save_onup
_Furnance_off_save_ondown:
;Controller_events_code.c,2717 :: 		void Furnance_off_save_ondown() {
;Controller_events_code.c,2719 :: 		}
L_end_Furnance_off_save_ondown:
BX	LR
; end of _Furnance_off_save_ondown
_Furnance_time_downOnUp:
;Controller_events_code.c,2720 :: 		void Furnance_time_downOnUp() {
;Controller_events_code.c,2722 :: 		}
L_end_Furnance_time_downOnUp:
BX	LR
; end of _Furnance_time_downOnUp
_Furnance_time_downOnPress:
;Controller_events_code.c,2723 :: 		void Furnance_time_downOnPress() {
;Controller_events_code.c,2725 :: 		}
L_end_Furnance_time_downOnPress:
BX	LR
; end of _Furnance_time_downOnPress
_Furnance_time_upOnUp:
;Controller_events_code.c,2726 :: 		void Furnance_time_upOnUp() {
;Controller_events_code.c,2728 :: 		}
L_end_Furnance_time_upOnUp:
BX	LR
; end of _Furnance_time_upOnUp
_Furnance_time_upOnPress:
;Controller_events_code.c,2729 :: 		void Furnance_time_upOnPress() {
;Controller_events_code.c,2731 :: 		}
L_end_Furnance_time_upOnPress:
BX	LR
; end of _Furnance_time_upOnPress
_furnance_time_OFFOnClick:
;Controller_events_code.c,2732 :: 		void furnance_time_OFFOnClick() {
;Controller_events_code.c,2734 :: 		}
L_end_furnance_time_OFFOnClick:
BX	LR
; end of _furnance_time_OFFOnClick
_Furnance_HP_OFF_save_onup:
;Controller_events_code.c,2735 :: 		void Furnance_HP_OFF_save_onup(){
;Controller_events_code.c,2736 :: 		}
L_end_Furnance_HP_OFF_save_onup:
BX	LR
; end of _Furnance_HP_OFF_save_onup
_Furnance_start_temp_UPOnUp:
;Controller_events_code.c,2737 :: 		void Furnance_start_temp_UPOnUp(){
;Controller_events_code.c,2738 :: 		}
L_end_Furnance_start_temp_UPOnUp:
BX	LR
; end of _Furnance_start_temp_UPOnUp
_Furnance_start_temp_UPOnPress:
;Controller_events_code.c,2739 :: 		void Furnance_start_temp_UPOnPress(){
;Controller_events_code.c,2740 :: 		}
L_end_Furnance_start_temp_UPOnPress:
BX	LR
; end of _Furnance_start_temp_UPOnPress
_SetIPAddressOnClick:
;Controller_events_code.c,2743 :: 		void SetIPAddressOnClick() {
;Controller_events_code.c,2745 :: 		}
L_end_SetIPAddressOnClick:
BX	LR
; end of _SetIPAddressOnClick
_SetMaskOnClick:
;Controller_events_code.c,2747 :: 		void SetMaskOnClick() {
;Controller_events_code.c,2749 :: 		}
L_end_SetMaskOnClick:
BX	LR
; end of _SetMaskOnClick
_SetDNSOnClick:
;Controller_events_code.c,2751 :: 		void SetDNSOnClick() {
;Controller_events_code.c,2753 :: 		}
L_end_SetDNSOnClick:
BX	LR
; end of _SetDNSOnClick
_LAN_Key_1OnClick:
;Controller_events_code.c,2755 :: 		void LAN_Key_1OnClick() {
;Controller_events_code.c,2757 :: 		}
L_end_LAN_Key_1OnClick:
BX	LR
; end of _LAN_Key_1OnClick
_LAN_Key_2OnClick:
;Controller_events_code.c,2759 :: 		void LAN_Key_2OnClick() {
;Controller_events_code.c,2761 :: 		}
L_end_LAN_Key_2OnClick:
BX	LR
; end of _LAN_Key_2OnClick
_LAN_Key_3OnClick:
;Controller_events_code.c,2763 :: 		void LAN_Key_3OnClick() {
;Controller_events_code.c,2765 :: 		}
L_end_LAN_Key_3OnClick:
BX	LR
; end of _LAN_Key_3OnClick
_LAN_Key_4OnClick:
;Controller_events_code.c,2767 :: 		void LAN_Key_4OnClick() {
;Controller_events_code.c,2769 :: 		}
L_end_LAN_Key_4OnClick:
BX	LR
; end of _LAN_Key_4OnClick
_LAN_Key_5OnClick:
;Controller_events_code.c,2771 :: 		void LAN_Key_5OnClick() {
;Controller_events_code.c,2773 :: 		}
L_end_LAN_Key_5OnClick:
BX	LR
; end of _LAN_Key_5OnClick
_LAN_Key_6OnClick:
;Controller_events_code.c,2775 :: 		void LAN_Key_6OnClick() {
;Controller_events_code.c,2777 :: 		}
L_end_LAN_Key_6OnClick:
BX	LR
; end of _LAN_Key_6OnClick
_LAN_Key_7OnClick:
;Controller_events_code.c,2779 :: 		void LAN_Key_7OnClick() {
;Controller_events_code.c,2781 :: 		}
L_end_LAN_Key_7OnClick:
BX	LR
; end of _LAN_Key_7OnClick
_LAN_Key_8OnClick:
;Controller_events_code.c,2783 :: 		void LAN_Key_8OnClick() {
;Controller_events_code.c,2785 :: 		}
L_end_LAN_Key_8OnClick:
BX	LR
; end of _LAN_Key_8OnClick
_LAN_Key_9OnClick:
;Controller_events_code.c,2787 :: 		void LAN_Key_9OnClick() {
;Controller_events_code.c,2789 :: 		}
L_end_LAN_Key_9OnClick:
BX	LR
; end of _LAN_Key_9OnClick
_LAN_Key_0OnClick:
;Controller_events_code.c,2791 :: 		void LAN_Key_0OnClick() {
;Controller_events_code.c,2793 :: 		}
L_end_LAN_Key_0OnClick:
BX	LR
; end of _LAN_Key_0OnClick
_LAN_Key_DotOnClick:
;Controller_events_code.c,2795 :: 		void LAN_Key_DotOnClick() {
;Controller_events_code.c,2797 :: 		}
L_end_LAN_Key_DotOnClick:
BX	LR
; end of _LAN_Key_DotOnClick
_LAN_Key_ClearOnClick:
;Controller_events_code.c,2799 :: 		void LAN_Key_ClearOnClick() {
;Controller_events_code.c,2801 :: 		}
L_end_LAN_Key_ClearOnClick:
BX	LR
; end of _LAN_Key_ClearOnClick
_LANSetOnClick:
;Controller_events_code.c,2803 :: 		void LANSetOnClick() {
;Controller_events_code.c,2805 :: 		}
L_end_LANSetOnClick:
BX	LR
; end of _LANSetOnClick
_SetGateWayOnClick:
;Controller_events_code.c,2806 :: 		void SetGateWayOnClick(){
;Controller_events_code.c,2807 :: 		}
L_end_SetGateWayOnClick:
BX	LR
; end of _SetGateWayOnClick
_Hyst_Heat_downOnUp:
;Controller_events_code.c,2809 :: 		void Hyst_Heat_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2810 :: 		Hyst_Heat_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2811 :: 		Image114.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2812 :: 		DrawImage(&Hyst_Heat_down);
MOVW	R0, #lo_addr(_Hyst_Heat_down+0)
MOVT	R0, #hi_addr(_Hyst_Heat_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2813 :: 		}
L_end_Hyst_Heat_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_downOnUp
_Hyst_Heat_downOnPress:
;Controller_events_code.c,2814 :: 		void Hyst_Heat_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2816 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2817 :: 		Hyst_Heat_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2818 :: 		Image114.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2819 :: 		DrawImage(&Image114);
MOVW	R0, #lo_addr(_Image114+0)
MOVT	R0, #hi_addr(_Image114+0)
BL	_DrawImage+0
;Controller_events_code.c,2820 :: 		system_reg[DIFF_HEAT]--;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2821 :: 		if (system_reg[DIFF_HEAT] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Heat_downOnPress283
;Controller_events_code.c,2822 :: 		system_reg[DIFF_HEAT] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_downOnPress283:
;Controller_events_code.c,2823 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2824 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2825 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2826 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2827 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Heat_downOnPress284:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_downOnPress284
NOP
NOP
NOP
;Controller_events_code.c,2828 :: 		}
L_end_Hyst_Heat_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_downOnPress
_Hyst_Heat_upOnUp:
;Controller_events_code.c,2829 :: 		void Hyst_Heat_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2830 :: 		Hyst_Heat_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2831 :: 		Image121.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2832 :: 		DrawImage(&Hyst_Heat_up);
MOVW	R0, #lo_addr(_Hyst_Heat_up+0)
MOVT	R0, #hi_addr(_Hyst_Heat_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2833 :: 		}
L_end_Hyst_Heat_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_upOnUp
_Hyst_Heat_upOnPress:
;Controller_events_code.c,2834 :: 		void Hyst_Heat_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2836 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2837 :: 		Hyst_Heat_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2838 :: 		Image121.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2839 :: 		DrawImage(&Image121);
MOVW	R0, #lo_addr(_Image121+0)
MOVT	R0, #hi_addr(_Image121+0)
BL	_DrawImage+0
;Controller_events_code.c,2840 :: 		system_reg[DIFF_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2841 :: 		if (system_reg[DIFF_HEAT] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Heat_upOnPress286
;Controller_events_code.c,2842 :: 		system_reg[DIFF_HEAT] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_upOnPress286:
;Controller_events_code.c,2843 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2844 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2845 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2846 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2847 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Heat_upOnPress287:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_upOnPress287
NOP
NOP
NOP
;Controller_events_code.c,2848 :: 		}
L_end_Hyst_Heat_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_upOnPress
_Hyst_Cool_downOnUp:
;Controller_events_code.c,2849 :: 		void Hyst_Cool_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2850 :: 		Hyst_Cool_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2851 :: 		Image115.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2852 :: 		DrawImage(&Hyst_Cool_down);
MOVW	R0, #lo_addr(_Hyst_Cool_down+0)
MOVT	R0, #hi_addr(_Hyst_Cool_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2853 :: 		}
L_end_Hyst_Cool_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_downOnUp
_Hyst_Cool_downOnPress:
;Controller_events_code.c,2854 :: 		void Hyst_Cool_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2856 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2857 :: 		Hyst_Cool_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2858 :: 		Image115.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2859 :: 		DrawImage(&Image115);
MOVW	R0, #lo_addr(_Image115+0)
MOVT	R0, #hi_addr(_Image115+0)
BL	_DrawImage+0
;Controller_events_code.c,2860 :: 		system_reg[DIFF_COOL]--;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2861 :: 		if (system_reg[DIFF_COOL] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Cool_downOnPress289
;Controller_events_code.c,2862 :: 		system_reg[DIFF_COOL] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_downOnPress289:
;Controller_events_code.c,2863 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2864 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2865 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2866 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2867 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Cool_downOnPress290:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_downOnPress290
NOP
NOP
NOP
;Controller_events_code.c,2868 :: 		}
L_end_Hyst_Cool_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_downOnPress
_Hyst_Cool_upOnUp:
;Controller_events_code.c,2869 :: 		void Hyst_Cool_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2870 :: 		Hyst_Cool_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2871 :: 		Image122.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2872 :: 		DrawImage(&Hyst_Cool_up);
MOVW	R0, #lo_addr(_Hyst_Cool_up+0)
MOVT	R0, #hi_addr(_Hyst_Cool_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2874 :: 		}
L_end_Hyst_Cool_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_upOnUp
_Hyst_Cool_upOnPress:
;Controller_events_code.c,2875 :: 		void Hyst_Cool_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2877 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2878 :: 		Hyst_Cool_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2879 :: 		Image122.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2880 :: 		DrawImage(&Image122);
MOVW	R0, #lo_addr(_Image122+0)
MOVT	R0, #hi_addr(_Image122+0)
BL	_DrawImage+0
;Controller_events_code.c,2881 :: 		system_reg[DIFF_COOL]++;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2882 :: 		if (system_reg[DIFF_COOL] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Cool_upOnPress292
;Controller_events_code.c,2883 :: 		system_reg[DIFF_COOL] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_upOnPress292:
;Controller_events_code.c,2884 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2885 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2886 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2887 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2888 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Cool_upOnPress293:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_upOnPress293
NOP
NOP
NOP
;Controller_events_code.c,2889 :: 		}
L_end_Hyst_Cool_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_upOnPress
_Hyst_DHW_downOnUp:
;Controller_events_code.c,2890 :: 		void Hyst_DHW_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2891 :: 		Hyst_DHW_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2892 :: 		Image116.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2893 :: 		DrawImage(&Hyst_DHW_down);
MOVW	R0, #lo_addr(_Hyst_DHW_down+0)
MOVT	R0, #hi_addr(_Hyst_DHW_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2894 :: 		}
L_end_Hyst_DHW_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_downOnUp
_Hyst_DHW_downOnPress:
;Controller_events_code.c,2895 :: 		void Hyst_DHW_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2897 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2898 :: 		Hyst_DHW_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2899 :: 		Image116.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2900 :: 		DrawImage(&Image116);
MOVW	R0, #lo_addr(_Image116+0)
MOVT	R0, #hi_addr(_Image116+0)
BL	_DrawImage+0
;Controller_events_code.c,2901 :: 		system_reg[DIFF_DHW]--;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2902 :: 		if (system_reg[DIFF_DHW] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_DHW_downOnPress295
;Controller_events_code.c,2903 :: 		system_reg[DIFF_DHW] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_downOnPress295:
;Controller_events_code.c,2904 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2905 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2906 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2907 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2908 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_DHW_downOnPress296:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_downOnPress296
NOP
NOP
NOP
;Controller_events_code.c,2909 :: 		}
L_end_Hyst_DHW_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_downOnPress
_Hyst_DHW_upOnUp:
;Controller_events_code.c,2910 :: 		void Hyst_DHW_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2911 :: 		Hyst_DHW_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2912 :: 		Image123.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2913 :: 		DrawImage(&Hyst_DHW_up);
MOVW	R0, #lo_addr(_Hyst_DHW_up+0)
MOVT	R0, #hi_addr(_Hyst_DHW_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2914 :: 		}
L_end_Hyst_DHW_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_upOnUp
_Hyst_DHW_upOnPress:
;Controller_events_code.c,2915 :: 		void Hyst_DHW_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2917 :: 		Hyst_DHW_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2918 :: 		Image123.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2919 :: 		DrawImage(&Image123);
MOVW	R0, #lo_addr(_Image123+0)
MOVT	R0, #hi_addr(_Image123+0)
BL	_DrawImage+0
;Controller_events_code.c,2920 :: 		system_reg[DIFF_DHW]++;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2921 :: 		if (system_reg[DIFF_DHW] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_DHW_upOnPress298
;Controller_events_code.c,2922 :: 		system_reg[DIFF_DHW] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_upOnPress298:
;Controller_events_code.c,2923 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2924 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2925 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2926 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2927 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_DHW_upOnPress299:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_upOnPress299
NOP
NOP
NOP
;Controller_events_code.c,2928 :: 		}
L_end_Hyst_DHW_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_upOnPress
_Set_heat_onup:
;Controller_events_code.c,2929 :: 		void Set_heat_onup(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2930 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2931 :: 		Image135.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2932 :: 		Image128.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2933 :: 		DrawImage (&Image135);
MOVW	R0, #lo_addr(_Image135+0)
MOVT	R0, #hi_addr(_Image135+0)
BL	_DrawImage+0
;Controller_events_code.c,2934 :: 		}
L_end_Set_heat_onup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_onup
_Set_heat_OnDown:
;Controller_events_code.c,2935 :: 		void Set_heat_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2936 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2937 :: 		adressReg= DIFF_HEAT;
MOVW	R1, #160
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2938 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2939 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2940 :: 		send_data_packet (DIFF_HEAT,1);
MOVS	R1, #1
MOVW	R0, #160
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2941 :: 		Image135.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2942 :: 		Image128.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2943 :: 		DrawImage (&Image128);
MOVW	R0, #lo_addr(_Image128+0)
MOVT	R0, #hi_addr(_Image128+0)
BL	_DrawImage+0
;Controller_events_code.c,2944 :: 		}
L_end_Set_heat_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_OnDown
_Set_cool_OnUp:
;Controller_events_code.c,2945 :: 		void Set_cool_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2946 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2947 :: 		Image138.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2948 :: 		Image129.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2949 :: 		DrawImage (&Image138);
MOVW	R0, #lo_addr(_Image138+0)
MOVT	R0, #hi_addr(_Image138+0)
BL	_DrawImage+0
;Controller_events_code.c,2950 :: 		}
L_end_Set_cool_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnUp
_Set_cool_OnDown:
;Controller_events_code.c,2951 :: 		void Set_cool_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2952 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2953 :: 		adressReg= DIFF_COOL;
MOVW	R1, #140
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2954 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2955 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2956 :: 		send_data_packet (DIFF_COOL,1);
MOVS	R1, #1
MOVW	R0, #140
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2957 :: 		Image138.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2958 :: 		Image129.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2959 :: 		DrawImage (&Image129);
MOVW	R0, #lo_addr(_Image129+0)
MOVT	R0, #hi_addr(_Image129+0)
BL	_DrawImage+0
;Controller_events_code.c,2960 :: 		}
L_end_Set_cool_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnDown
_Set_dhw_OnUp:
;Controller_events_code.c,2961 :: 		void Set_dhw_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2962 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2963 :: 		Set_DHW_HY.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2964 :: 		Image130.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2965 :: 		DrawImage (&Set_DHW_HY);
MOVW	R0, #lo_addr(_Set_DHW_HY+0)
MOVT	R0, #hi_addr(_Set_DHW_HY+0)
BL	_DrawImage+0
;Controller_events_code.c,2966 :: 		}
L_end_Set_dhw_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnUp
_Set_dhw_OnDown:
;Controller_events_code.c,2967 :: 		void Set_dhw_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2968 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2969 :: 		adressReg= DIFF_DHW;
MOVW	R1, #150
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,2970 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2971 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2972 :: 		send_data_packet (DIFF_DHW,1);
MOVS	R1, #1
MOVW	R0, #150
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2973 :: 		Set_DHW_HY.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2974 :: 		Image130.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2975 :: 		DrawImage (&Image130);
MOVW	R0, #lo_addr(_Image130+0)
MOVT	R0, #hi_addr(_Image130+0)
BL	_DrawImage+0
;Controller_events_code.c,2976 :: 		}
L_end_Set_dhw_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnDown
_DEC_EEV2OnPress:
;Controller_events_code.c,2979 :: 		void DEC_EEV2OnPress() {
;Controller_events_code.c,2981 :: 		}
L_end_DEC_EEV2OnPress:
BX	LR
; end of _DEC_EEV2OnPress
_INC_EEV2OnPress:
;Controller_events_code.c,2982 :: 		void INC_EEV2OnPress() {
;Controller_events_code.c,2984 :: 		}
L_end_INC_EEV2OnPress:
BX	LR
; end of _INC_EEV2OnPress
_EEV2DownOnUp:
;Controller_events_code.c,2985 :: 		void EEV2DownOnUp() {
;Controller_events_code.c,2987 :: 		}
L_end_EEV2DownOnUp:
BX	LR
; end of _EEV2DownOnUp
_EEV2DownOnDown:
;Controller_events_code.c,2989 :: 		void EEV2DownOnDown() {
;Controller_events_code.c,2991 :: 		}
L_end_EEV2DownOnDown:
BX	LR
; end of _EEV2DownOnDown
_EEV2UpOnUp:
;Controller_events_code.c,2992 :: 		void EEV2UpOnUp() {
;Controller_events_code.c,2994 :: 		}
L_end_EEV2UpOnUp:
BX	LR
; end of _EEV2UpOnUp
_EEV2UpOnDown:
;Controller_events_code.c,2995 :: 		void EEV2UpOnDown() {
;Controller_events_code.c,2997 :: 		}
L_end_EEV2UpOnDown:
BX	LR
; end of _EEV2UpOnDown
_EEV2_AutoOnClick:
;Controller_events_code.c,2998 :: 		void EEV2_AutoOnClick() {
;Controller_events_code.c,3000 :: 		}
L_end_EEV2_AutoOnClick:
BX	LR
; end of _EEV2_AutoOnClick
_Mode_ground_onOnClick:
;Controller_events_code.c,3002 :: 		void  Mode_ground_onOnClick () {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3003 :: 		if ((unsigned long)Mode_ground_on.Picture_Name == mode_brine_jpg)
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
LDR	R1, [R0, #0]
MOVW	R0, #59698
MOVT	R0, #65
CMP	R1, R0
IT	NE
BNE	L_Mode_ground_onOnClick301
;Controller_events_code.c,3005 :: 		Mode_ground_on.Picture_Name = mode_air_jpg;
MOVW	R1, #52012
MOVT	R1, #65
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3006 :: 		DrawImage(&Mode_air_on);
MOVW	R0, #lo_addr(_Mode_air_on+0)
MOVT	R0, #hi_addr(_Mode_air_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3007 :: 		system_reg[AIRE_TO_WATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3008 :: 		ground_heat_pump=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3009 :: 		}
IT	AL
BAL	L_Mode_ground_onOnClick302
L_Mode_ground_onOnClick301:
;Controller_events_code.c,3011 :: 		Mode_ground_on.Picture_Name = mode_brine_jpg;
MOVW	R1, #59698
MOVT	R1, #65
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3012 :: 		DrawImage(&Mode_ground_on);
MOVW	R0, #lo_addr(_Mode_ground_on+0)
MOVT	R0, #hi_addr(_Mode_ground_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3013 :: 		system_reg[AIRE_TO_WATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3014 :: 		ground_heat_pump=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3015 :: 		}
L_Mode_ground_onOnClick302:
;Controller_events_code.c,3016 :: 		send_data_packet(AIRE_TO_WATER,1);
MOVS	R1, #1
MOVW	R0, #170
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3017 :: 		Delay_ms (300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_Mode_ground_onOnClick303:
SUBS	R7, R7, #1
BNE	L_Mode_ground_onOnClick303
NOP
NOP
NOP
;Controller_events_code.c,3018 :: 		}
L_end_Mode_ground_onOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Mode_ground_onOnClick
_Down_24_OnPress:
;Controller_events_code.c,3025 :: 		void Down_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3027 :: 		Image99.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3028 :: 		Image17.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3029 :: 		DrawImage(&Image99);
MOVW	R0, #lo_addr(_Image99+0)
MOVT	R0, #hi_addr(_Image99+0)
BL	_DrawImage+0
;Controller_events_code.c,3030 :: 		system_reg[LP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3031 :: 		if (system_reg[LP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_24_OnPress305
;Controller_events_code.c,3032 :: 		system_reg[LP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Down_24_OnPress305:
;Controller_events_code.c,3033 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3034 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3035 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3036 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3037 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_24_OnPress306:
SUBS	R7, R7, #1
BNE	L_Down_24_OnPress306
NOP
NOP
NOP
;Controller_events_code.c,3039 :: 		}
L_end_Down_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_24_OnPress
_Down_24_OnUp:
;Controller_events_code.c,3040 :: 		void Down_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3041 :: 		Image99.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3042 :: 		Image17.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3043 :: 		DrawImage(&Image17);
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
BL	_DrawImage+0
;Controller_events_code.c,3044 :: 		}
L_end_Down_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_24_OnUp
_Up_24_OnPress:
;Controller_events_code.c,3045 :: 		void Up_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3047 :: 		Image100.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3048 :: 		Image12.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3049 :: 		DrawImage(&Image100);
MOVW	R0, #lo_addr(_Image100+0)
MOVT	R0, #hi_addr(_Image100+0)
BL	_DrawImage+0
;Controller_events_code.c,3050 :: 		system_reg[LP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3051 :: 		if (system_reg[LP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_24_OnPress308
;Controller_events_code.c,3052 :: 		system_reg[LP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Up_24_OnPress308:
;Controller_events_code.c,3053 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3054 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3055 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3056 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3057 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_24_OnPress309:
SUBS	R7, R7, #1
BNE	L_Up_24_OnPress309
NOP
NOP
NOP
;Controller_events_code.c,3059 :: 		}
L_end_Up_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_24_OnPress
_Up_24_OnUp:
;Controller_events_code.c,3060 :: 		void Up_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3061 :: 		Image100.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3062 :: 		Image12.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3063 :: 		DrawImage(&Image12);
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
BL	_DrawImage+0
;Controller_events_code.c,3064 :: 		}
L_end_Up_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_24_OnUp
_Down_25_OnPress:
;Controller_events_code.c,3065 :: 		void Down_25_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3067 :: 		Image280.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3068 :: 		Image18.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3069 :: 		DrawImage(&Image280);
MOVW	R0, #lo_addr(_Image280+0)
MOVT	R0, #hi_addr(_Image280+0)
BL	_DrawImage+0
;Controller_events_code.c,3070 :: 		system_reg[LP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3071 :: 		if (system_reg[LP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_25_OnPress311
;Controller_events_code.c,3072 :: 		system_reg[LP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Down_25_OnPress311:
;Controller_events_code.c,3073 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3074 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3075 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3076 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3077 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_25_OnPress312:
SUBS	R7, R7, #1
BNE	L_Down_25_OnPress312
NOP
NOP
NOP
;Controller_events_code.c,3079 :: 		}
L_end_Down_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_25_OnPress
_Down_25_OnUp:
;Controller_events_code.c,3080 :: 		void Down_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3081 :: 		Image280.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3082 :: 		Image18.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3083 :: 		DrawImage(&Image18);
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
BL	_DrawImage+0
;Controller_events_code.c,3085 :: 		}
L_end_Down_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_25_OnUp
_Up_25_OnPress:
;Controller_events_code.c,3086 :: 		void Up_25_OnPress(){
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Controller_events_code.c,3088 :: 		Image281.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3089 :: 		Image14.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3090 :: 		DrawImage(&Image281);
MOVW	R0, #lo_addr(_Image281+0)
MOVT	R0, #hi_addr(_Image281+0)
BL	_DrawImage+0
;Controller_events_code.c,3091 :: 		system_reg[LP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3092 :: 		if (system_reg[LP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_25_OnPress314
;Controller_events_code.c,3093 :: 		system_reg[LP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Up_25_OnPress314:
;Controller_events_code.c,3094 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3095 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3096 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3097 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3098 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_25_OnPress315:
SUBS	R7, R7, #1
BNE	L_Up_25_OnPress315
NOP
NOP
NOP
;Controller_events_code.c,3099 :: 		}
L_end_Up_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Up_25_OnPress
_Up_25_OnUp:
;Controller_events_code.c,3100 :: 		void Up_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3101 :: 		Image281.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3102 :: 		Image14.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3103 :: 		DrawImage(&Image14);
MOVW	R0, #lo_addr(_Image14+0)
MOVT	R0, #hi_addr(_Image14+0)
BL	_DrawImage+0
;Controller_events_code.c,3104 :: 		}
L_end_Up_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_25_OnUp
_Down_26_OnPress:
;Controller_events_code.c,3105 :: 		void Down_26_OnPress() {
;Controller_events_code.c,3107 :: 		}
L_end_Down_26_OnPress:
BX	LR
; end of _Down_26_OnPress
_Down_26_OnUp:
;Controller_events_code.c,3108 :: 		void Down_26_OnUp() {
;Controller_events_code.c,3110 :: 		}
L_end_Down_26_OnUp:
BX	LR
; end of _Down_26_OnUp
_UP_26_OnPress:
;Controller_events_code.c,3111 :: 		void UP_26_OnPress() {
;Controller_events_code.c,3113 :: 		}
L_end_UP_26_OnPress:
BX	LR
; end of _UP_26_OnPress
_UP_26_OnUp:
;Controller_events_code.c,3114 :: 		void UP_26_OnUp() {
;Controller_events_code.c,3116 :: 		}
L_end_UP_26_OnUp:
BX	LR
; end of _UP_26_OnUp
_Set_24_OnDown:
;Controller_events_code.c,3117 :: 		void Set_24_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3118 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3119 :: 		adressReg= LP_MAX;
MOVW	R1, #230
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,3120 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3121 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3122 :: 		send_data_packet(LP_MAX,1);
MOVS	R1, #1
MOVW	R0, #230
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3123 :: 		Image279.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3124 :: 		Image29.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3125 :: 		DrawImage (&Image29);
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
BL	_DrawImage+0
;Controller_events_code.c,3126 :: 		}
L_end_Set_24_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnDown
_Set_24_OnUp:
;Controller_events_code.c,3127 :: 		void Set_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3128 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3129 :: 		Image279.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3130 :: 		Image29.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3131 :: 		DrawImage (&Image279);
MOVW	R0, #lo_addr(_Image279+0)
MOVT	R0, #hi_addr(_Image279+0)
BL	_DrawImage+0
;Controller_events_code.c,3132 :: 		}
L_end_Set_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnUp
_Set_25_OnDown:
;Controller_events_code.c,3133 :: 		void Set_25_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3134 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3135 :: 		adressReg= LP_MIN;
MOVW	R1, #250
SXTH	R1, R1
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,3136 :: 		nomReg=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3137 :: 		pushButton=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3138 :: 		send_data_packet(LP_MIN,1);
MOVS	R1, #1
MOVW	R0, #250
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3139 :: 		Image282.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3140 :: 		Image22.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3141 :: 		DrawImage (&Image22);
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
BL	_DrawImage+0
;Controller_events_code.c,3142 :: 		}
L_end_Set_25_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnDown
_Set_25_OnUp:
;Controller_events_code.c,3143 :: 		void Set_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3144 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3145 :: 		Image282.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3146 :: 		Image22.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3147 :: 		DrawImage (&Image282);
MOVW	R0, #lo_addr(_Image282+0)
MOVT	R0, #hi_addr(_Image282+0)
BL	_DrawImage+0
;Controller_events_code.c,3148 :: 		}
L_end_Set_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnUp
_Set_26_OnDown:
;Controller_events_code.c,3149 :: 		void Set_26_OnDown() {
;Controller_events_code.c,3151 :: 		}
L_end_Set_26_OnDown:
BX	LR
; end of _Set_26_OnDown
_Set_26_OnUp:
;Controller_events_code.c,3152 :: 		void Set_26_OnUp() {
;Controller_events_code.c,3154 :: 		}
L_end_Set_26_OnUp:
BX	LR
; end of _Set_26_OnUp
_Set_phase_check:
;Controller_events_code.c,3155 :: 		void Set_phase_check(){
;Controller_events_code.c,3157 :: 		}
L_end_Set_phase_check:
BX	LR
; end of _Set_phase_check
_Set_voltage_check:
;Controller_events_code.c,3158 :: 		void Set_voltage_check(){
;Controller_events_code.c,3160 :: 		}
L_end_Set_voltage_check:
BX	LR
; end of _Set_voltage_check
_Down_13_OnUp:
;Controller_events_code.c,3163 :: 		void Down_13_OnUp() {
;Controller_events_code.c,3165 :: 		}
L_end_Down_13_OnUp:
BX	LR
; end of _Down_13_OnUp
_Down_13_OnPress:
;Controller_events_code.c,3166 :: 		void Down_13_OnPress() {
;Controller_events_code.c,3167 :: 		}
L_end_Down_13_OnPress:
BX	LR
; end of _Down_13_OnPress
_Up_13_OnPress:
;Controller_events_code.c,3168 :: 		void Up_13_OnPress() {
;Controller_events_code.c,3170 :: 		}
L_end_Up_13_OnPress:
BX	LR
; end of _Up_13_OnPress
_Up_13_OnUp:
;Controller_events_code.c,3171 :: 		void Up_13_OnUp() {
;Controller_events_code.c,3173 :: 		}
L_end_Up_13_OnUp:
BX	LR
; end of _Up_13_OnUp
_Down_14_OnPress:
;Controller_events_code.c,3175 :: 		void Down_14_OnPress() {
;Controller_events_code.c,3177 :: 		}
L_end_Down_14_OnPress:
BX	LR
; end of _Down_14_OnPress
_Down_14_OnUp:
;Controller_events_code.c,3178 :: 		void Down_14_OnUp() {
;Controller_events_code.c,3180 :: 		}
L_end_Down_14_OnUp:
BX	LR
; end of _Down_14_OnUp
_Up_14_OnPress:
;Controller_events_code.c,3181 :: 		void Up_14_OnPress() {
;Controller_events_code.c,3183 :: 		}
L_end_Up_14_OnPress:
BX	LR
; end of _Up_14_OnPress
_Up_14_OnUp:
;Controller_events_code.c,3184 :: 		void Up_14_OnUp() {
;Controller_events_code.c,3186 :: 		}
L_end_Up_14_OnUp:
BX	LR
; end of _Up_14_OnUp
_Down_15_OnPress:
;Controller_events_code.c,3187 :: 		void Down_15_OnPress() {
;Controller_events_code.c,3189 :: 		}
L_end_Down_15_OnPress:
BX	LR
; end of _Down_15_OnPress
_Down_15_OnUp:
;Controller_events_code.c,3190 :: 		void Down_15_OnUp() {
;Controller_events_code.c,3192 :: 		}
L_end_Down_15_OnUp:
BX	LR
; end of _Down_15_OnUp
_Up_15_OnPress:
;Controller_events_code.c,3193 :: 		void Up_15_OnPress() {
;Controller_events_code.c,3195 :: 		}
L_end_Up_15_OnPress:
BX	LR
; end of _Up_15_OnPress
_Up_15_OnUp:
;Controller_events_code.c,3196 :: 		void Up_15_OnUp() {
;Controller_events_code.c,3198 :: 		}
L_end_Up_15_OnUp:
BX	LR
; end of _Up_15_OnUp
_Down_16_OnPress:
;Controller_events_code.c,3199 :: 		void Down_16_OnPress() {
;Controller_events_code.c,3201 :: 		}
L_end_Down_16_OnPress:
BX	LR
; end of _Down_16_OnPress
_Down_16_OnUp:
;Controller_events_code.c,3202 :: 		void Down_16_OnUp() {
;Controller_events_code.c,3204 :: 		}
L_end_Down_16_OnUp:
BX	LR
; end of _Down_16_OnUp
_Up_16_OnPress:
;Controller_events_code.c,3205 :: 		void Up_16_OnPress() {
;Controller_events_code.c,3207 :: 		}
L_end_Up_16_OnPress:
BX	LR
; end of _Up_16_OnPress
_Up_16_OnUp:
;Controller_events_code.c,3208 :: 		void Up_16_OnUp() {
;Controller_events_code.c,3210 :: 		}
L_end_Up_16_OnUp:
BX	LR
; end of _Up_16_OnUp
_Down_17_OnPress:
;Controller_events_code.c,3211 :: 		void Down_17_OnPress() {      // Electric heater preset setting
;Controller_events_code.c,3213 :: 		}
L_end_Down_17_OnPress:
BX	LR
; end of _Down_17_OnPress
_Down_17_OnUp:
;Controller_events_code.c,3214 :: 		void Down_17_OnUp() {
;Controller_events_code.c,3216 :: 		}
L_end_Down_17_OnUp:
BX	LR
; end of _Down_17_OnUp
_Up_17_OnPress:
;Controller_events_code.c,3217 :: 		void Up_17_OnPress() {
;Controller_events_code.c,3219 :: 		}
L_end_Up_17_OnPress:
BX	LR
; end of _Up_17_OnPress
_Up_17_OnUp:
;Controller_events_code.c,3220 :: 		void Up_17_OnUp() {
;Controller_events_code.c,3222 :: 		}
L_end_Up_17_OnUp:
BX	LR
; end of _Up_17_OnUp
_Down_18_OnPress:
;Controller_events_code.c,3223 :: 		void Down_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3225 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3226 :: 		Image481.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3227 :: 		Down_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3228 :: 		DrawImage(&Image481);
MOVW	R0, #lo_addr(_Image481+0)
MOVT	R0, #hi_addr(_Image481+0)
BL	_DrawImage+0
;Controller_events_code.c,3229 :: 		system_reg[S_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3230 :: 		if (system_reg[S_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_18_OnPress317
;Controller_events_code.c,3231 :: 		system_reg[S_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Down_18_OnPress317:
;Controller_events_code.c,3232 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3233 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3234 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3235 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3236 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_18_OnPress318:
SUBS	R7, R7, #1
BNE	L_Down_18_OnPress318
NOP
NOP
NOP
;Controller_events_code.c,3237 :: 		}
L_end_Down_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_18_OnPress
_Down_18_OnUp:
;Controller_events_code.c,3238 :: 		void Down_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3239 :: 		Image481.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3240 :: 		Down_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3241 :: 		DrawImage(&Down_18_);
MOVW	R0, #lo_addr(_Down_18_+0)
MOVT	R0, #hi_addr(_Down_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3242 :: 		}
L_end_Down_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_18_OnUp
_Up_18_OnPress:
;Controller_events_code.c,3243 :: 		void Up_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3245 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,3246 :: 		Image477.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3247 :: 		Up_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3248 :: 		DrawImage(&Image477);
MOVW	R0, #lo_addr(_Image477+0)
MOVT	R0, #hi_addr(_Image477+0)
BL	_DrawImage+0
;Controller_events_code.c,3249 :: 		system_reg[S_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3250 :: 		if (system_reg[S_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_18_OnPress320
;Controller_events_code.c,3251 :: 		system_reg[S_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Up_18_OnPress320:
;Controller_events_code.c,3252 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3253 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3254 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3255 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3256 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_18_OnPress321:
SUBS	R7, R7, #1
BNE	L_Up_18_OnPress321
NOP
NOP
NOP
;Controller_events_code.c,3257 :: 		}
L_end_Up_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_18_OnPress
_Up_18_OnUp:
;Controller_events_code.c,3258 :: 		void Up_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3259 :: 		Image477.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3260 :: 		Up_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3261 :: 		DrawImage(&Up_18_);
MOVW	R0, #lo_addr(_Up_18_+0)
MOVT	R0, #hi_addr(_Up_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3262 :: 		}
L_end_Up_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_18_OnUp
_Set_15_OnUp:
;Controller_events_code.c,3263 :: 		void Set_15_OnUp() {
;Controller_events_code.c,3265 :: 		}
L_end_Set_15_OnUp:
BX	LR
; end of _Set_15_OnUp
_Set_15_OnDown:
;Controller_events_code.c,3266 :: 		void Set_15_OnDown() {
;Controller_events_code.c,3268 :: 		}
L_end_Set_15_OnDown:
BX	LR
; end of _Set_15_OnDown
_Set_16_OnUp:
;Controller_events_code.c,3269 :: 		void Set_16_OnUp() {
;Controller_events_code.c,3271 :: 		}
L_end_Set_16_OnUp:
BX	LR
; end of _Set_16_OnUp
_Set_16_OnDown:
;Controller_events_code.c,3272 :: 		void Set_16_OnDown() {
;Controller_events_code.c,3274 :: 		}
L_end_Set_16_OnDown:
BX	LR
; end of _Set_16_OnDown
_Set_17_OnUp:
;Controller_events_code.c,3275 :: 		void Set_17_OnUp () {
;Controller_events_code.c,3277 :: 		}
L_end_Set_17_OnUp:
BX	LR
; end of _Set_17_OnUp
_Set_17_OnDown:
;Controller_events_code.c,3278 :: 		void Set_17_OnDown() {
;Controller_events_code.c,3280 :: 		}
L_end_Set_17_OnDown:
BX	LR
; end of _Set_17_OnDown
_Set_18_OnUp:
;Controller_events_code.c,3281 :: 		void Set_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3282 :: 		Set_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3283 :: 		Image485.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3284 :: 		DrawImage (&Set_18_);
MOVW	R0, #lo_addr(_Set_18_+0)
MOVT	R0, #hi_addr(_Set_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3285 :: 		}
L_end_Set_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnUp
_Set_18_OnDown:
;Controller_events_code.c,3286 :: 		void Set_18_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3287 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3289 :: 		send_data_packet(S_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #290
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3290 :: 		Set_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3291 :: 		Image485.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3292 :: 		DrawImage (&Image485);
MOVW	R0, #lo_addr(_Image485+0)
MOVT	R0, #hi_addr(_Image485+0)
BL	_DrawImage+0
;Controller_events_code.c,3293 :: 		}
L_end_Set_18_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnDown
_Set_14_OnDown:
;Controller_events_code.c,3294 :: 		void Set_14_OnDown() {
;Controller_events_code.c,3296 :: 		}
L_end_Set_14_OnDown:
BX	LR
; end of _Set_14_OnDown
_Set_14_OnUp:
;Controller_events_code.c,3297 :: 		void Set_14_OnUp(){
;Controller_events_code.c,3298 :: 		}
L_end_Set_14_OnUp:
BX	LR
; end of _Set_14_OnUp
_Set_13_OnUp:
;Controller_events_code.c,3299 :: 		void Set_13_OnUp() {
;Controller_events_code.c,3301 :: 		}
L_end_Set_13_OnUp:
BX	LR
; end of _Set_13_OnUp
_Set_13_OnDown:
;Controller_events_code.c,3302 :: 		void Set_13_OnDown() {
;Controller_events_code.c,3304 :: 		}
L_end_Set_13_OnDown:
BX	LR
; end of _Set_13_OnDown
