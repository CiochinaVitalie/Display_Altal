_Tone1:
;Controller_events_code.c,38 :: 		void Tone1() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,39 :: 		Sound_Play(659, 35);   //
MOVS	R1, #35
MOVW	R0, #659
BL	_Sound_Play+0
;Controller_events_code.c,40 :: 		}
L_end_Tone1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone1
_Tone2:
;Controller_events_code.c,41 :: 		void Tone2() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,42 :: 		Sound_Play(698, 50);   //
MOVS	R1, #50
MOVW	R0, #698
BL	_Sound_Play+0
;Controller_events_code.c,43 :: 		}
L_end_Tone2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone2
_Tone3:
;Controller_events_code.c,44 :: 		void Tone3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,45 :: 		Sound_Play(784, 70);   //
MOVS	R1, #70
MOVW	R0, #784
BL	_Sound_Play+0
;Controller_events_code.c,46 :: 		}
L_end_Tone3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone3
_BLED_Fade_Out:
;Controller_events_code.c,47 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,50 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
; i end address is: 4 (R1)
L_BLED_Fade_Out0:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_BLED_Fade_Out1
;Controller_events_code.c,51 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,52 :: 		Delay_us(500);
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
;Controller_events_code.c,50 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,53 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out0
L_BLED_Fade_Out1:
;Controller_events_code.c,54 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,55 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;Controller_events_code.c,56 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,59 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
; i end address is: 4 (R1)
L_BLED_Fade_In5:
; i start address is: 4 (R1)
CMP	R1, #255
IT	CS
BCS	L_BLED_Fade_In6
;Controller_events_code.c,60 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,61 :: 		Delay_us(500);
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
;Controller_events_code.c,59 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,62 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In5
L_BLED_Fade_In6:
;Controller_events_code.c,63 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,64 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_BackToHome:
;Controller_events_code.c,68 :: 		void BackToHome(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,69 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,70 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,71 :: 		DrawScreen(&HOME);
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
BL	_DrawScreen+0
;Controller_events_code.c,72 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,73 :: 		}
L_end_BackToHome:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackToHome
_goToBack:
;Controller_events_code.c,74 :: 		void goToBack(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,75 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,78 :: 		if( num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_goToBack10
;Controller_events_code.c,80 :: 		if(CurrentScreen == &SYSTEM_SET)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack11
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack12
L_goToBack11:
;Controller_events_code.c,81 :: 		else if (CurrentScreen==&ERRORS)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack13
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack14
L_goToBack13:
;Controller_events_code.c,82 :: 		else if (CurrentScreen==&SENSOR1)                {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack15
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack16
L_goToBack15:
;Controller_events_code.c,83 :: 		else if (CurrentScreen==&SETTINGS)               {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack17
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack18
L_goToBack17:
;Controller_events_code.c,84 :: 		else if (CurrentScreen==&ENERGY)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack19
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack20
L_goToBack19:
;Controller_events_code.c,85 :: 		else if(CurrentScreen == &EEV)                   {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack21
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack22
L_goToBack21:
;Controller_events_code.c,86 :: 		else if(CurrentScreen == &DELAY_MENU)            {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack23
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack24
L_goToBack23:
;Controller_events_code.c,87 :: 		else if(CurrentScreen == &LIMITS1)               {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack25
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack26
L_goToBack25:
;Controller_events_code.c,88 :: 		else if(CurrentScreen == &SYSTEM_EVENTS)         {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack27
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack28
L_goToBack27:
;Controller_events_code.c,89 :: 		else if (CurrentScreen==&LIMITS2)                {BLED_Fade_Out();DrawScreen(&LIMITS1);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack29
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack30
L_goToBack29:
;Controller_events_code.c,90 :: 		else if (CurrentScreen==&LIMITS3)                {BLED_Fade_Out();DrawScreen(&LIMITS2);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack31
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack32
L_goToBack31:
;Controller_events_code.c,91 :: 		else if (CurrentScreen==&LIMITS4)                {BLED_Fade_Out();DrawScreen(&LIMITS3);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack33
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack34
L_goToBack33:
;Controller_events_code.c,92 :: 		else if (CurrentScreen==&LIMITS5)                {BLED_Fade_Out();DrawScreen(&LIMITS4);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack35
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack36
L_goToBack35:
;Controller_events_code.c,93 :: 		else if (CurrentScreen==&MODE2)                  {BLED_Fade_Out();DrawScreen(&MODE);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack37
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
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
;Controller_events_code.c,94 :: 		}
IT	AL
BAL	L_goToBack38
L_goToBack10:
;Controller_events_code.c,95 :: 		else num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
L_goToBack38:
;Controller_events_code.c,98 :: 		}
L_end_goToBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _goToBack
_nextPage:
;Controller_events_code.c,99 :: 		void nextPage()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,101 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,103 :: 		if( num_page==0 && two_compressors_mode)  num_page=1;
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__nextPage374
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__nextPage373
L__nextPage372:
MOVS	R1, #1
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
L__nextPage374:
L__nextPage373:
;Controller_events_code.c,104 :: 		if (CurrentScreen==&LIMITS1){BLED_Fade_Out();DrawScreen(&LIMITS2);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage42
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage43
L_nextPage42:
;Controller_events_code.c,105 :: 		else if (CurrentScreen==&LIMITS2){BLED_Fade_Out();DrawScreen(&LIMITS3);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage44
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage45
L_nextPage44:
;Controller_events_code.c,106 :: 		else if (CurrentScreen==&LIMITS3){BLED_Fade_Out();DrawScreen(&LIMITS4);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage46
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage47
L_nextPage46:
;Controller_events_code.c,107 :: 		else if (CurrentScreen==&LIMITS4){BLED_Fade_Out();DrawScreen(&LIMITS5);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage48
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage49
L_nextPage48:
;Controller_events_code.c,108 :: 		else if (CurrentScreen==&MODE){BLED_Fade_Out();DrawScreen(&MODE2);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage50
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
L_nextPage50:
L_nextPage49:
L_nextPage47:
L_nextPage45:
L_nextPage43:
;Controller_events_code.c,110 :: 		}
L_end_nextPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nextPage
_selectPage:
;Controller_events_code.c,111 :: 		void selectPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,116 :: 		if (lastScreen!=CurrentScreen) {countPacket=1; lastScreen=CurrentScreen;  }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(selectPage_lastScreen_L0+0)
MOVT	R0, #hi_addr(selectPage_lastScreen_L0+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_selectPage51
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(selectPage_lastScreen_L0+0)
MOVT	R0, #hi_addr(selectPage_lastScreen_L0+0)
STR	R1, [R0, #0]
L_selectPage51:
;Controller_events_code.c,117 :: 		if (CurrentScreen==&HOME)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage52
;Controller_events_code.c,120 :: 		main_page();
BL	_main_page+0
;Controller_events_code.c,121 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage53
;Controller_events_code.c,123 :: 		case 1:reciev_data_packet(BAC_TEMP,2); break;
L_selectPage55:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage54
;Controller_events_code.c,124 :: 		case 2:reciev_data_packet(SOURC_IN_1,2);break;
L_selectPage56:
MOVS	R1, #2
MOVW	R0, #151
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage54
;Controller_events_code.c,125 :: 		case 3:countPacket=1;break;
L_selectPage57:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage54
;Controller_events_code.c,126 :: 		}
L_selectPage53:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage55
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage56
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage57
L_selectPage54:
;Controller_events_code.c,127 :: 		}
IT	AL
BAL	L_selectPage58
L_selectPage52:
;Controller_events_code.c,129 :: 		else if(CurrentScreen==&SENSOR1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage59
;Controller_events_code.c,131 :: 		sensor_1(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_sensor_1+0
;Controller_events_code.c,133 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage60
;Controller_events_code.c,135 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage61
;Controller_events_code.c,137 :: 		case 1: reciev_data_packet(BAC_TEMP,2);break;
L_selectPage63:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage62
;Controller_events_code.c,138 :: 		case 2: reciev_data_packet(CONDENS_TEMP_1,12);break;
L_selectPage64:
MOVS	R1, #12
MOVW	R0, #91
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage62
;Controller_events_code.c,139 :: 		case 3:  countPacket=1;break;
L_selectPage65:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage62
;Controller_events_code.c,140 :: 		}
L_selectPage61:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage63
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage64
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage65
L_selectPage62:
;Controller_events_code.c,141 :: 		if(strcmp(CircleButton10.Caption,"1")!=0){CircleButton10.Caption="1";DrawCircleButton(&CircleButton10);  }
MOVW	R1, #lo_addr(?lstr1_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr1_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage66
MOVW	R1, #lo_addr(?lstr2_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr2_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton10+0)
MOVT	R0, #hi_addr(_CircleButton10+0)
BL	_DrawCircleButton+0
L_selectPage66:
;Controller_events_code.c,142 :: 		}
IT	AL
BAL	L_selectPage67
L_selectPage60:
;Controller_events_code.c,145 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage68
;Controller_events_code.c,147 :: 		case 1: reciev_data_packet(BAC_TEMP,2);break;
L_selectPage70:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage69
;Controller_events_code.c,148 :: 		case 2: reciev_data_packet(CONDENS_TEMP_2,12);break;
L_selectPage71:
MOVS	R1, #12
MOVW	R0, #92
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage69
;Controller_events_code.c,149 :: 		case 3:  countPacket=1;break;
L_selectPage72:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage69
;Controller_events_code.c,150 :: 		}
L_selectPage68:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage70
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage71
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage72
L_selectPage69:
;Controller_events_code.c,151 :: 		if(strcmp(CircleButton10.Caption,"2")!=0) {CircleButton10.Caption="2";DrawCircleButton(&CircleButton10);Back_b10.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr3_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr3_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage73
MOVW	R1, #lo_addr(?lstr4_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr4_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton10+0)
MOVT	R0, #hi_addr(_CircleButton10+0)
BL	_DrawCircleButton+0
MOVW	R1, #lo_addr(_goToBack+0)
MOVT	R1, #hi_addr(_goToBack+0)
MOVW	R0, #lo_addr(_Back_b10+60)
MOVT	R0, #hi_addr(_Back_b10+60)
STR	R1, [R0, #0]
L_selectPage73:
;Controller_events_code.c,152 :: 		}
L_selectPage67:
;Controller_events_code.c,153 :: 		}
IT	AL
BAL	L_selectPage74
L_selectPage59:
;Controller_events_code.c,156 :: 		else if(CurrentScreen==&GAUGE1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage75
;Controller_events_code.c,158 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage76
;Controller_events_code.c,160 :: 		LP_display(system_reg[LOW_PRESS_1]),HP_display(system_reg[HIGH_PRESS_1]);reciev_data_packet(HIGH_PRESS_1,2);
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
;Controller_events_code.c,161 :: 		if(strcmp(CircleButton8.Caption,"1")!=0) {CircleButton8.Caption="1";DrawCircleButton(&CircleButton8);Next_b2.Caption="NEXT";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=nextPage;}
MOVW	R1, #lo_addr(?lstr5_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr5_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage77
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
L_selectPage77:
;Controller_events_code.c,162 :: 		}
IT	AL
BAL	L_selectPage78
L_selectPage76:
;Controller_events_code.c,165 :: 		LP_display(system_reg[LOW_PRESS_2]),HP_display(system_reg[HIGH_PRESS_2]);reciev_data_packet(HIGH_PRESS_2,2);
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
;Controller_events_code.c,166 :: 		if(strcmp(CircleButton8.Caption,"2")!=0){CircleButton8.Caption="2";DrawCircleButton(&CircleButton8);Next_b2.Caption="BACK";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr8_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr8_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage79
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
L_selectPage79:
;Controller_events_code.c,167 :: 		}
L_selectPage78:
;Controller_events_code.c,168 :: 		}
IT	AL
BAL	L_selectPage80
L_selectPage75:
;Controller_events_code.c,169 :: 		else if(CurrentScreen==&EEV)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage81
;Controller_events_code.c,171 :: 		count_steps(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_count_steps+0
;Controller_events_code.c,172 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage82
;Controller_events_code.c,174 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage83
;Controller_events_code.c,176 :: 		case 1:reciev_data_packet(TRV_STEPS_1,1); break;
L_selectPage85:
MOVS	R1, #1
MOVW	R0, #61
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage84
;Controller_events_code.c,177 :: 		case 2:reciev_data_packet(S_HEAT_1,1); break;
L_selectPage86:
MOVS	R1, #1
MOVW	R0, #121
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage84
;Controller_events_code.c,178 :: 		case 3:  countPacket=1;break;
L_selectPage87:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage84
;Controller_events_code.c,179 :: 		}
L_selectPage83:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage85
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage86
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage87
L_selectPage84:
;Controller_events_code.c,180 :: 		}
IT	AL
BAL	L_selectPage88
L_selectPage82:
;Controller_events_code.c,183 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage89
;Controller_events_code.c,185 :: 		case 1:reciev_data_packet(TRV_STEPS_2,1); break;
L_selectPage91:
MOVS	R1, #1
MOVW	R0, #62
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage90
;Controller_events_code.c,186 :: 		case 2:reciev_data_packet(S_HEAT_2,1); break;
L_selectPage92:
MOVS	R1, #1
MOVW	R0, #122
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage90
;Controller_events_code.c,187 :: 		case 3:  countPacket=1;break;
L_selectPage93:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage90
;Controller_events_code.c,188 :: 		}
L_selectPage89:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage91
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage92
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage93
L_selectPage90:
;Controller_events_code.c,189 :: 		}
L_selectPage88:
;Controller_events_code.c,190 :: 		}
IT	AL
BAL	L_selectPage94
L_selectPage81:
;Controller_events_code.c,192 :: 		else if(CurrentScreen==&SYSTEM_EVENTS)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage95
;Controller_events_code.c,194 :: 		working_time(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_working_time+0
;Controller_events_code.c,195 :: 		if(num_page==0) {
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage96
;Controller_events_code.c,196 :: 		reciev_data_packet(TIM_P_HEAT_1,4);
MOVS	R1, #4
MOVW	R0, #351
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,197 :: 		if(strcmp(CircleButton6.Caption,"1")!=0) {CircleButton6.Caption="1";DrawCircleButton(&CircleButton6);}
MOVW	R1, #lo_addr(?lstr11_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr11_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage97
MOVW	R1, #lo_addr(?lstr12_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr12_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton6+0)
MOVT	R0, #hi_addr(_CircleButton6+0)
BL	_DrawCircleButton+0
L_selectPage97:
;Controller_events_code.c,198 :: 		}
IT	AL
BAL	L_selectPage98
L_selectPage96:
;Controller_events_code.c,200 :: 		reciev_data_packet(TIM_P_HEAT_2,4);
MOVS	R1, #4
MOVW	R0, #352
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,201 :: 		if(strcmp(CircleButton6.Caption,"2")!=0) {CircleButton6.Caption="2";DrawCircleButton(&CircleButton6);Back_b7.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr13_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr13_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage99
MOVW	R1, #lo_addr(?lstr14_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr14_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton6+0)
MOVT	R0, #hi_addr(_CircleButton6+0)
BL	_DrawCircleButton+0
MOVW	R1, #lo_addr(_goToBack+0)
MOVT	R1, #hi_addr(_goToBack+0)
MOVW	R0, #lo_addr(_Back_b7+60)
MOVT	R0, #hi_addr(_Back_b7+60)
STR	R1, [R0, #0]
L_selectPage99:
;Controller_events_code.c,202 :: 		}
L_selectPage98:
;Controller_events_code.c,204 :: 		}
IT	AL
BAL	L_selectPage100
L_selectPage95:
;Controller_events_code.c,205 :: 		else if(CurrentScreen==&Schema1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage101
;Controller_events_code.c,207 :: 		schema1_page();
BL	_schema1_page+0
;Controller_events_code.c,208 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage102
;Controller_events_code.c,210 :: 		case 1:reciev_data_packet(BAC_TEMP,2); break;
L_selectPage104:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage103
;Controller_events_code.c,211 :: 		case 2:reciev_data_packet(CONDENS_TEMP_1,11); break;
L_selectPage105:
MOVS	R1, #11
MOVW	R0, #91
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage103
;Controller_events_code.c,212 :: 		case 3:reciev_data_packet(COM_STATE_1,5); break;
L_selectPage106:
MOVS	R1, #5
MOVW	R0, #11
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage103
;Controller_events_code.c,213 :: 		case 4:  countPacket=1;break;
L_selectPage107:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage103
;Controller_events_code.c,214 :: 		}
L_selectPage102:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage104
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage105
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage106
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage107
L_selectPage103:
;Controller_events_code.c,215 :: 		}
IT	AL
BAL	L_selectPage108
L_selectPage101:
;Controller_events_code.c,216 :: 		else if (CurrentScreen==&Schema2)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage109
;Controller_events_code.c,218 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage110
;Controller_events_code.c,220 :: 		case 1:reciev_data_packet(BAC_TEMP,2); break;
L_selectPage112:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,221 :: 		case 2:reciev_data_packet(CONDENS_TEMP_2,11); break;
L_selectPage113:
MOVS	R1, #11
MOVW	R0, #92
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,222 :: 		case 3:reciev_data_packet(COM_STATE_2,5); break;
L_selectPage114:
MOVS	R1, #5
MOVW	R0, #12
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,223 :: 		case 4:  countPacket=1;break;
L_selectPage115:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,224 :: 		}
L_selectPage110:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage112
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage113
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage114
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage115
L_selectPage111:
;Controller_events_code.c,226 :: 		}
L_selectPage109:
L_selectPage108:
L_selectPage100:
L_selectPage94:
L_selectPage80:
L_selectPage74:
L_selectPage58:
;Controller_events_code.c,228 :: 		}
L_end_selectPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _selectPage
_Main_OFFOnClick:
;Controller_events_code.c,231 :: 		void Main_OFFOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,233 :: 		if ((unsigned long)Main_OFF.Picture_Name == main_off_bmp)
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
LDR	R1, [R0, #0]
MOVW	R0, #8080
MOVT	R0, #8
CMP	R1, R0
IT	NE
BNE	L_Main_OFFOnClick116
;Controller_events_code.c,235 :: 		Main_OFF.Picture_Name = main_on_bmp;
MOVW	R1, #64494
MOVT	R1, #7
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,236 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Controller_events_code.c,237 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,238 :: 		Messages_Label.Caption = "SYSTEM  ON";
MOVW	R1, #lo_addr(?lstr15_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr15_Controller_events_code+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_events_code.c,239 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_events_code.c,240 :: 		SYSTEM_ON=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,241 :: 		system_reg[POWER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,243 :: 		}
IT	AL
BAL	L_Main_OFFOnClick117
L_Main_OFFOnClick116:
;Controller_events_code.c,245 :: 		Main_OFF.Picture_Name = main_off_bmp;
MOVW	R1, #8080
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,246 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,247 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,248 :: 		Messages_Label.Caption = "SYSTEM  OFF";
MOVW	R1, #lo_addr(?lstr16_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr16_Controller_events_code+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_events_code.c,249 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_events_code.c,250 :: 		SYSTEM_ON=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,251 :: 		system_reg[POWER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,252 :: 		}
L_Main_OFFOnClick117:
;Controller_events_code.c,254 :: 		send_data_packet(POWER,2);
MOVS	R1, #2
MOVW	R0, #310
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,256 :: 		}
L_end_Main_OFFOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Main_OFFOnClick
_bar_heatingOnClick:
;Controller_events_code.c,257 :: 		void bar_heatingOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,260 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 )
MOVW	R1, #lo_addr(?lstr17_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr17_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick118
;Controller_events_code.c,262 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr18_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr18_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,263 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,264 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,266 :: 		system_reg[COOL]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,267 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,269 :: 		}
IT	AL
BAL	L_bar_heatingOnClick119
L_bar_heatingOnClick118:
;Controller_events_code.c,270 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0)
MOVW	R1, #lo_addr(?lstr19_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr19_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick120
;Controller_events_code.c,272 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr20_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr20_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,273 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,274 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,276 :: 		system_reg[HEAT]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,277 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,278 :: 		}
L_bar_heatingOnClick120:
L_bar_heatingOnClick119:
;Controller_events_code.c,280 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 ) {
MOVW	R1, #lo_addr(?lstr21_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr21_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick121
;Controller_events_code.c,281 :: 		send_data_packet(COOL,2);
MOVS	R1, #2
MOVW	R0, #190
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,283 :: 		}
L_bar_heatingOnClick121:
;Controller_events_code.c,285 :: 		}
L_end_bar_heatingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bar_heatingOnClick
_DHW_SetingOnClick:
;Controller_events_code.c,286 :: 		void DHW_SetingOnClick()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,289 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_DHW_SetingOnClick122
;Controller_events_code.c,290 :: 		Set_Dhw_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,291 :: 		Set_Dhw_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,292 :: 		DHW_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,293 :: 		DHW_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,294 :: 		DHW_DOWN.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,295 :: 		DHW_DOWN.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,296 :: 		DHW_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,297 :: 		DHW_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,298 :: 		dhw_temp_main.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_temp_main+27)
MOVT	R0, #hi_addr(_dhw_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,299 :: 		dhw_temp_main.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_temp_main+28)
MOVT	R0, #hi_addr(_dhw_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,300 :: 		dhw_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,301 :: 		dhw_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,302 :: 		dhw_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,303 :: 		dhw_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,304 :: 		dhw_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,305 :: 		dhw_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,306 :: 		BoxRound2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,307 :: 		BoxRound2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,308 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,310 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,311 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,312 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_SetingOnClick377
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_SetingOnClick376
L__DHW_SetingOnClick375:
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
L__DHW_SetingOnClick377:
L__DHW_SetingOnClick376:
;Controller_events_code.c,313 :: 		DHW_Seting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr22_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr22_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,314 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,315 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,317 :: 		DrawRoundButton(&DHW_UP);
MOVW	R0, #lo_addr(_DHW_UP+0)
MOVT	R0, #hi_addr(_DHW_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,318 :: 		DrawRoundButton(&DHW_DOWN);
MOVW	R0, #lo_addr(_DHW_DOWN+0)
MOVT	R0, #hi_addr(_DHW_DOWN+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,319 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,320 :: 		count_push++;
MOVW	R1, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,321 :: 		}
IT	AL
BAL	L_DHW_SetingOnClick126
L_DHW_SetingOnClick122:
;Controller_events_code.c,323 :: 		Set_Dhw_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,324 :: 		Set_Dhw_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,325 :: 		DHW_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,326 :: 		DHW_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,327 :: 		DHW_DOWN.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,328 :: 		DHW_DOWN.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,329 :: 		DHW_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,330 :: 		DHW_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,331 :: 		dhw_temp_main.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_temp_main+27)
MOVT	R0, #hi_addr(_dhw_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,332 :: 		dhw_temp_main.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_temp_main+28)
MOVT	R0, #hi_addr(_dhw_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,333 :: 		dhw_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,334 :: 		dhw_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,335 :: 		dhw_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,336 :: 		dhw_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,337 :: 		dhw_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,338 :: 		dhw_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,339 :: 		BoxRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,340 :: 		BoxRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,341 :: 		DHW_Seting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr23_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr23_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,343 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,344 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,345 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,346 :: 		DrawRoundButton (& ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,347 :: 		DrawImage(&dhw_icon);
MOVW	R0, #lo_addr(_dhw_icon+0)
MOVT	R0, #hi_addr(_dhw_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,348 :: 		DrawRoundButton(&bar_DHW);
MOVW	R0, #lo_addr(_bar_DHW+0)
MOVT	R0, #hi_addr(_bar_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,349 :: 		DrawLabel (&dhw_temp_main);
MOVW	R0, #lo_addr(_dhw_temp_main+0)
MOVT	R0, #hi_addr(_dhw_temp_main+0)
BL	_DrawLabel+0
;Controller_events_code.c,350 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,351 :: 		DrawLabel(&dhw_point);
MOVW	R0, #lo_addr(_dhw_point+0)
MOVT	R0, #hi_addr(_dhw_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,352 :: 		DrawLabel(&dhw_celc);
MOVW	R0, #lo_addr(_dhw_celc+0)
MOVT	R0, #hi_addr(_dhw_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,353 :: 		send_data_packet(SET_DHW,1);
MOVS	R1, #1
MOVW	R0, #330
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,357 :: 		}
L_DHW_SetingOnClick126:
;Controller_events_code.c,360 :: 		}
L_end_DHW_SetingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_SetingOnClick
_Heat_SettingOnClick:
;Controller_events_code.c,361 :: 		void Heat_SettingOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,365 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick127
;Controller_events_code.c,366 :: 		Set_Heat_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,367 :: 		Set_Heat_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,368 :: 		HEAT_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,369 :: 		HEAT_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,370 :: 		HEAT_Down.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,371 :: 		HEAT_Down.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,372 :: 		TEMP_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,373 :: 		TEMP_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,374 :: 		heat_temp_main.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_temp_main+27)
MOVT	R0, #hi_addr(_heat_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,375 :: 		heat_temp_main.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_temp_main+28)
MOVT	R0, #hi_addr(_heat_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,376 :: 		heat_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,377 :: 		heat_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,378 :: 		heat_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,379 :: 		heat_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,380 :: 		heat_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,381 :: 		heat_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,382 :: 		heatBox.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heatBox+18)
MOVT	R0, #hi_addr(_heatBox+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,383 :: 		heatBox.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heatBox+19)
MOVT	R0, #hi_addr(_heatBox+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,384 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0 )IntToStr(system_reg[SET_HEAT], txt);
MOVW	R1, #lo_addr(?lstr24_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr24_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick128
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
IT	AL
BAL	L_Heat_SettingOnClick129
L_Heat_SettingOnClick128:
;Controller_events_code.c,385 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0) IntToStr(system_reg[SET_COOL], txt);
MOVW	R1, #lo_addr(?lstr25_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr25_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick130
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
L_Heat_SettingOnClick130:
L_Heat_SettingOnClick129:
;Controller_events_code.c,386 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,387 :: 		strncpy(TEMP_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,388 :: 		if(system_reg[SET_HEAT]<10 && system_reg[SET_HEAT]>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__Heat_SettingOnClick380
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__Heat_SettingOnClick379
L__Heat_SettingOnClick378:
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
L__Heat_SettingOnClick380:
L__Heat_SettingOnClick379:
;Controller_events_code.c,389 :: 		Heat_Setting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr26_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr26_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,390 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,391 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,392 :: 		DrawRoundButton(&HEAT_UP);
MOVW	R0, #lo_addr(_HEAT_UP+0)
MOVT	R0, #hi_addr(_HEAT_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,393 :: 		DrawRoundButton(&HEAT_DOWN);
MOVW	R0, #lo_addr(_HEAT_Down+0)
MOVT	R0, #hi_addr(_HEAT_Down+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,394 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,395 :: 		count_push++;
MOVW	R1, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,396 :: 		}
IT	AL
BAL	L_Heat_SettingOnClick134
L_Heat_SettingOnClick127:
;Controller_events_code.c,398 :: 		Set_Heat_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,399 :: 		Set_Heat_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,400 :: 		HEAT_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,401 :: 		HEAT_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,402 :: 		HEAT_Down.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,403 :: 		HEAT_Down.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,404 :: 		TEMP_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,405 :: 		TEMP_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,406 :: 		heat_temp_main.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_temp_main+27)
MOVT	R0, #hi_addr(_heat_temp_main+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,407 :: 		heat_temp_main.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_temp_main+28)
MOVT	R0, #hi_addr(_heat_temp_main+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,408 :: 		heat_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,409 :: 		heat_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,410 :: 		heat_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,411 :: 		heat_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,412 :: 		heat_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,413 :: 		heat_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,414 :: 		heatBox.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heatBox+18)
MOVT	R0, #hi_addr(_heatBox+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,415 :: 		heatBox.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heatBox+19)
MOVT	R0, #hi_addr(_heatBox+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,417 :: 		Heat_Setting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr27_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr27_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,418 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,419 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,420 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,421 :: 		DrawRoundButton (& ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,422 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,423 :: 		DrawLabel (&heat_temp_main);
MOVW	R0, #lo_addr(_heat_temp_main+0)
MOVT	R0, #hi_addr(_heat_temp_main+0)
BL	_DrawLabel+0
;Controller_events_code.c,424 :: 		DrawCircle(&heat_led);
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,425 :: 		DrawLabel(&heat_point);
MOVW	R0, #lo_addr(_heat_point+0)
MOVT	R0, #hi_addr(_heat_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,426 :: 		DrawLabel(&heat_celc);
MOVW	R0, #lo_addr(_heat_celc+0)
MOVT	R0, #hi_addr(_heat_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,427 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 ){ DrawImage(&heat_icon);send_data_packet(SET_HEAT,1);/*adressReg= SET_HEAT;nomReg =1;*/}
MOVW	R1, #lo_addr(?lstr28_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr28_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick135
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #340
SXTH	R0, R0
BL	_send_data_packet+0
IT	AL
BAL	L_Heat_SettingOnClick136
L_Heat_SettingOnClick135:
;Controller_events_code.c,428 :: 		else  {DrawImage(&cool_icon);send_data_packet(SET_COOL,1);/*adressReg= SET_COOL;nomReg =1;*/}
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #320
SXTH	R0, R0
BL	_send_data_packet+0
L_Heat_SettingOnClick136:
;Controller_events_code.c,429 :: 		}
L_Heat_SettingOnClick134:
;Controller_events_code.c,432 :: 		}
L_end_Heat_SettingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Heat_SettingOnClick
_Click_HEAT:
;Controller_events_code.c,434 :: 		void Click_HEAT()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,436 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 )
MOVW	R1, #lo_addr(?lstr29_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr29_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT137
;Controller_events_code.c,438 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr30_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr30_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,439 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,440 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,441 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,442 :: 		UART2_Write_Text("OFF");
MOVW	R0, #lo_addr(?lstr31_Controller_events_code+0)
MOVT	R0, #hi_addr(?lstr31_Controller_events_code+0)
BL	_UART2_Write_Text+0
;Controller_events_code.c,443 :: 		}
IT	AL
BAL	L_Click_HEAT138
L_Click_HEAT137:
;Controller_events_code.c,445 :: 		{   if(strcmp(bar_heating.Caption,"HEATING")==0 ){system_reg[HEAT]=1;system_reg[COOL]=0;}
MOVW	R1, #lo_addr(?lstr32_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr32_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT139
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
BAL	L_Click_HEAT140
L_Click_HEAT139:
;Controller_events_code.c,446 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0 ){system_reg[HEAT]=0;system_reg[COOL]=1;}
MOVW	R1, #lo_addr(?lstr33_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr33_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT141
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
L_Click_HEAT141:
L_Click_HEAT140:
;Controller_events_code.c,447 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr34_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr34_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,448 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,450 :: 		}
L_Click_HEAT138:
;Controller_events_code.c,452 :: 		send_data_packet(COOL,2);
MOVS	R1, #2
MOVW	R0, #190
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,454 :: 		}
L_end_Click_HEAT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_HEAT
_Click_DHW:
;Controller_events_code.c,455 :: 		void Click_DHW()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,458 :: 		if (strcmp(ON_OFF_DHW.Caption,"ON")==0)
MOVW	R1, #lo_addr(?lstr35_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr35_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_DHW142
;Controller_events_code.c,460 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr36_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr36_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,461 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,462 :: 		system_reg[HEATWATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,463 :: 		}
IT	AL
BAL	L_Click_DHW143
L_Click_DHW142:
;Controller_events_code.c,466 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr37_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr37_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,467 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,468 :: 		system_reg[HEATWATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,469 :: 		}
L_Click_DHW143:
;Controller_events_code.c,471 :: 		send_data_packet(HEATWATER,1);
MOVS	R1, #1
MOVW	R0, #210
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,472 :: 		}
L_end_Click_DHW:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_DHW
_MainBut1OnUp:
;Controller_events_code.c,473 :: 		void MainBut1OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,474 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,475 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,476 :: 		Image25.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,477 :: 		DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,478 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,480 :: 		}
L_end_MainBut1OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnUp
_MainBut1OnPress:
;Controller_events_code.c,481 :: 		void MainBut1OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,482 :: 		Image25.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,483 :: 		DrawImage(&Image25);
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
BL	_DrawImage+0
;Controller_events_code.c,484 :: 		}
L_end_MainBut1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnPress
_MainBut2OnUp:
;Controller_events_code.c,485 :: 		void MainBut2OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,486 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,487 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,488 :: 		Image40.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,489 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp385
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp384
L__MainBut2OnUp383:
;Controller_events_code.c,490 :: 		DrawScreen (&Schema2);
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
BL	_DrawScreen+0
;Controller_events_code.c,491 :: 		}
IT	AL
BAL	L_MainBut2OnUp147
;Controller_events_code.c,489 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
L__MainBut2OnUp385:
L__MainBut2OnUp384:
;Controller_events_code.c,492 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp387
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp386
L__MainBut2OnUp382:
;Controller_events_code.c,493 :: 		DrawScreen (&AIR_TWO);
MOVW	R0, #lo_addr(_AIR_TWO+0)
MOVT	R0, #hi_addr(_AIR_TWO+0)
BL	_DrawScreen+0
;Controller_events_code.c,494 :: 		}
IT	AL
BAL	L_MainBut2OnUp151
;Controller_events_code.c,492 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
L__MainBut2OnUp387:
L__MainBut2OnUp386:
;Controller_events_code.c,495 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp389
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp388
L__MainBut2OnUp381:
;Controller_events_code.c,496 :: 		DrawScreen(&Schema1);//DrawScreen (&AIR_ONE);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,497 :: 		}
IT	AL
BAL	L_MainBut2OnUp155
;Controller_events_code.c,495 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
L__MainBut2OnUp389:
L__MainBut2OnUp388:
;Controller_events_code.c,499 :: 		DrawScreen(&Schema1);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,500 :: 		}
L_MainBut2OnUp155:
L_MainBut2OnUp151:
L_MainBut2OnUp147:
;Controller_events_code.c,502 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,504 :: 		}
L_end_MainBut2OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnUp
_MainBut2OnPress:
;Controller_events_code.c,505 :: 		void MainBut2OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,506 :: 		Image40.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,507 :: 		DrawImage(&Image40);
MOVW	R0, #lo_addr(_Image40+0)
MOVT	R0, #hi_addr(_Image40+0)
BL	_DrawImage+0
;Controller_events_code.c,509 :: 		}
L_end_MainBut2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnPress
_MainBut3OnUp:
;Controller_events_code.c,510 :: 		void MainBut3OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,511 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,512 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,513 :: 		Image44.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,514 :: 		DrawScreen(&DEVICES);
MOVW	R0, #lo_addr(_DEVICES+0)
MOVT	R0, #hi_addr(_DEVICES+0)
BL	_DrawScreen+0
;Controller_events_code.c,515 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,517 :: 		}
L_end_MainBut3OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnUp
_MainBut3OnPress:
;Controller_events_code.c,518 :: 		void MainBut3OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,519 :: 		Image44.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,520 :: 		DrawImage(&Image44);
MOVW	R0, #lo_addr(_Image44+0)
MOVT	R0, #hi_addr(_Image44+0)
BL	_DrawImage+0
;Controller_events_code.c,521 :: 		}
L_end_MainBut3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnPress
_MainBut4OnUp:
;Controller_events_code.c,522 :: 		void MainBut4OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,523 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,524 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,525 :: 		Image61.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,526 :: 		old_HP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_HP_pressure+0)
MOVT	R0, #hi_addr(_old_HP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,527 :: 		old_LP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_LP_pressure+0)
MOVT	R0, #hi_addr(_old_LP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,528 :: 		DrawScreen(&GAUGE1);
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
BL	_DrawScreen+0
;Controller_events_code.c,529 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,530 :: 		}
L_end_MainBut4OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnUp
_MainBut4OnPress:
;Controller_events_code.c,531 :: 		void MainBut4OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,532 :: 		Image61.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,533 :: 		DrawImage(&Image61);
MOVW	R0, #lo_addr(_Image61+0)
MOVT	R0, #hi_addr(_Image61+0)
BL	_DrawImage+0
;Controller_events_code.c,534 :: 		}
L_end_MainBut4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnPress
_MainBut5OnUp:
;Controller_events_code.c,535 :: 		void MainBut5OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,536 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,537 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,538 :: 		Image87.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,539 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,540 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,541 :: 		}
L_end_MainBut5OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnUp
_MainBut5OnPress:
;Controller_events_code.c,542 :: 		void MainBut5OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,543 :: 		Image87.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,544 :: 		DrawImage(&Image87);
MOVW	R0, #lo_addr(_Image87+0)
MOVT	R0, #hi_addr(_Image87+0)
BL	_DrawImage+0
;Controller_events_code.c,545 :: 		}
L_end_MainBut5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnPress
_DHW_UPOnClick:
;Controller_events_code.c,546 :: 		void  DHW_UPOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,548 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,549 :: 		system_reg[SET_DHW]++;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,550 :: 		if(system_reg[SET_DHW]>system_reg[HEAT_MAX]) system_reg[SET_DHW]=system_reg[HEAT_MAX];
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L_DHW_UPOnClick156
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_UPOnClick156:
;Controller_events_code.c,551 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,552 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,553 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,554 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_UPOnClick392
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_UPOnClick391
L__DHW_UPOnClick390:
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
L__DHW_UPOnClick392:
L__DHW_UPOnClick391:
;Controller_events_code.c,555 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,556 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,557 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_DHW_UPOnClick160:
SUBS	R7, R7, #1
BNE	L_DHW_UPOnClick160
NOP
NOP
NOP
;Controller_events_code.c,558 :: 		}
L_end_DHW_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_UPOnClick
_DHW_DOWNOnClick:
;Controller_events_code.c,559 :: 		void DHW_DOWNOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,561 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,562 :: 		system_reg[SET_DHW]--;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,563 :: 		if(system_reg[SET_DHW]<system_reg[HEAT_MIN]) system_reg[SET_DHW]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_DHW_DOWNOnClick162
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_DOWNOnClick162:
;Controller_events_code.c,564 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,565 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,566 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,567 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_DOWNOnClick395
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_DOWNOnClick394
L__DHW_DOWNOnClick393:
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
L__DHW_DOWNOnClick395:
L__DHW_DOWNOnClick394:
;Controller_events_code.c,568 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,569 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,570 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_DHW_DOWNOnClick166:
SUBS	R7, R7, #1
BNE	L_DHW_DOWNOnClick166
NOP
NOP
NOP
;Controller_events_code.c,572 :: 		}
L_end_DHW_DOWNOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_DOWNOnClick
_HEAT_UPOnClick:
;Controller_events_code.c,573 :: 		void HEAT_UPOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,576 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,578 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr38_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr38_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick168
;Controller_events_code.c,579 :: 		system_reg[SET_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+680)
MOVT	R1, #hi_addr(_system_reg+680)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,580 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,581 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,582 :: 		}
IT	AL
BAL	L_HEAT_UPOnClick169
L_HEAT_UPOnClick168:
;Controller_events_code.c,583 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr39_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr39_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick170
;Controller_events_code.c,584 :: 		system_reg[SET_COOL]++;
MOVW	R1, #lo_addr(_system_reg+640)
MOVT	R1, #hi_addr(_system_reg+640)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,586 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,587 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,588 :: 		}
L_HEAT_UPOnClick170:
L_HEAT_UPOnClick169:
;Controller_events_code.c,589 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,590 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,591 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_UPOnClick398
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_UPOnClick397
L__HEAT_UPOnClick396:
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
L__HEAT_UPOnClick398:
L__HEAT_UPOnClick397:
;Controller_events_code.c,592 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,593 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,594 :: 		}
L_end_HEAT_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_UPOnClick
_HEAT_DownOnClick:
;Controller_events_code.c,595 :: 		void HEAT_DownOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,598 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,599 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr40_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr40_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick174
;Controller_events_code.c,600 :: 		system_reg[SET_HEAT]--;
MOVW	R2, #lo_addr(_system_reg+680)
MOVT	R2, #hi_addr(_system_reg+680)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,601 :: 		if(system_reg[SET_HEAT]<system_reg[HEAT_MIN]) system_reg[SET_HEAT]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick175
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick175:
;Controller_events_code.c,602 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,603 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,604 :: 		}
IT	AL
BAL	L_HEAT_DownOnClick176
L_HEAT_DownOnClick174:
;Controller_events_code.c,605 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr41_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr41_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick177
;Controller_events_code.c,606 :: 		system_reg[SET_COOL]--;
MOVW	R2, #lo_addr(_system_reg+640)
MOVT	R2, #hi_addr(_system_reg+640)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,607 :: 		if(system_reg[SET_COOL]<system_reg[COOL_MIN]) system_reg[SET_COOL]=system_reg[COOL_MIN];
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick178
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick178:
;Controller_events_code.c,608 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,609 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,610 :: 		}
L_HEAT_DownOnClick177:
L_HEAT_DownOnClick176:
;Controller_events_code.c,611 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,612 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,613 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_DownOnClick401
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_DownOnClick400
L__HEAT_DownOnClick399:
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
L__HEAT_DownOnClick401:
L__HEAT_DownOnClick400:
;Controller_events_code.c,614 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,615 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,617 :: 		}
L_end_HEAT_DownOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_DownOnClick
_user_settingOnUp:
;Controller_events_code.c,619 :: 		void user_settingOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,620 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,621 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,622 :: 		Image105.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,623 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,624 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,625 :: 		}
L_end_user_settingOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnUp
_user_settingOnPress:
;Controller_events_code.c,626 :: 		void  user_settingOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,627 :: 		Image105.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,628 :: 		DrawImage(&Image105);
MOVW	R0, #lo_addr(_Image105+0)
MOVT	R0, #hi_addr(_Image105+0)
BL	_DrawImage+0
;Controller_events_code.c,629 :: 		}
L_end_user_settingOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnPress
_user_set_timeOnPress:
;Controller_events_code.c,630 :: 		void user_set_timeOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,631 :: 		Image39.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,632 :: 		DrawImage(&Image39);
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
BL	_DrawImage+0
;Controller_events_code.c,633 :: 		}
L_end_user_set_timeOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnPress
_user_set_timeOnUp:
;Controller_events_code.c,634 :: 		void user_set_timeOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,635 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,636 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,637 :: 		Image39.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,639 :: 		DrawScreen(&SetRTC);
MOVW	R0, #lo_addr(_SetRTC+0)
MOVT	R0, #hi_addr(_SetRTC+0)
BL	_DrawScreen+0
;Controller_events_code.c,640 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,641 :: 		}
L_end_user_set_timeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnUp
_user_check_temperatureOnPress:
;Controller_events_code.c,643 :: 		void user_check_temperatureOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,644 :: 		Image48.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,645 :: 		DrawImage(&Image48);
MOVW	R0, #lo_addr(_Image48+0)
MOVT	R0, #hi_addr(_Image48+0)
BL	_DrawImage+0
;Controller_events_code.c,646 :: 		}
L_end_user_check_temperatureOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnPress
_user_check_temperatureOnUp:
;Controller_events_code.c,647 :: 		void user_check_temperatureOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,648 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,649 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,650 :: 		Image48.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,651 :: 		strcpy(S_Brine_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr42_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr42_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,652 :: 		strcpy(S_Brine_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr43_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr43_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,653 :: 		strcpy(S_Heat_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr44_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr44_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,654 :: 		strcpy(S_Heat_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr45_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr45_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,655 :: 		strcpy(S_Compressor_1.Caption ,"000");
MOVW	R1, #lo_addr(?lstr46_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr46_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Compressor_1+24)
MOVT	R0, #hi_addr(_S_Compressor_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,656 :: 		strcpy(S_Superheat_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr47_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr47_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Superheat_1+24)
MOVT	R0, #hi_addr(_S_Superheat_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,657 :: 		strcpy( S_Subcool_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr48_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr48_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Subcool_1+24)
MOVT	R0, #hi_addr(_S_Subcool_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,658 :: 		strcpy(S_DHW.Caption,"00");
MOVW	R1, #lo_addr(?lstr49_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr49_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_DHW+24)
MOVT	R0, #hi_addr(_S_DHW+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,659 :: 		strcpy(SS_tank.Caption,"00");
MOVW	R1, #lo_addr(?lstr50_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr50_Controller_events_code+0)
MOVW	R0, #lo_addr(_SS_tank+24)
MOVT	R0, #hi_addr(_SS_tank+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,660 :: 		strcpy(S_condenser_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr51_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr51_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_condenser_1+24)
MOVT	R0, #hi_addr(_S_condenser_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,661 :: 		strcpy(S_High_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr52_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr52_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_High_Pressure_1+24)
MOVT	R0, #hi_addr(_S_High_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,662 :: 		strcpy(S_Low_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr53_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr53_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,663 :: 		DrawScreen(&SENSOR1);
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
BL	_DrawScreen+0
;Controller_events_code.c,664 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,665 :: 		}
L_end_user_check_temperatureOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnUp
_user_set_LANOnPress:
;Controller_events_code.c,666 :: 		void user_set_LANOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,667 :: 		Image49.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,668 :: 		DrawImage(&Image49);
MOVW	R0, #lo_addr(_Image49+0)
MOVT	R0, #hi_addr(_Image49+0)
BL	_DrawImage+0
;Controller_events_code.c,669 :: 		}
L_end_user_set_LANOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnPress
_user_set_LANOnUp:
;Controller_events_code.c,670 :: 		void user_set_LANOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,671 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,672 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,673 :: 		Image49.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,674 :: 		DrawScreen(&Ethernet);
MOVW	R0, #lo_addr(_Ethernet+0)
MOVT	R0, #hi_addr(_Ethernet+0)
BL	_DrawScreen+0
;Controller_events_code.c,675 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,676 :: 		}
L_end_user_set_LANOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnUp
_user_check_errorsOnPress:
;Controller_events_code.c,677 :: 		void user_check_errorsOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,678 :: 		Image50.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,679 :: 		DrawImage(&Image50);
MOVW	R0, #lo_addr(_Image50+0)
MOVT	R0, #hi_addr(_Image50+0)
BL	_DrawImage+0
;Controller_events_code.c,680 :: 		}
L_end_user_check_errorsOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnPress
_user_check_errorsOnUp:
;Controller_events_code.c,681 :: 		void user_check_errorsOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,682 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,683 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,684 :: 		Image50.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,685 :: 		DrawScreen(&ERRORS);
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
BL	_DrawScreen+0
;Controller_events_code.c,686 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,687 :: 		}
L_end_user_check_errorsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnUp
_user_set_timersOnPress:
;Controller_events_code.c,688 :: 		void user_set_timersOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,689 :: 		Image51.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,690 :: 		DrawImage(&Image51);
MOVW	R0, #lo_addr(_Image51+0)
MOVT	R0, #hi_addr(_Image51+0)
BL	_DrawImage+0
;Controller_events_code.c,691 :: 		}
L_end_user_set_timersOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnPress
_user_set_timersOnUp:
;Controller_events_code.c,692 :: 		void user_set_timersOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,693 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,694 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,695 :: 		Image51.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,696 :: 		DrawScreen(&TIMERS);
MOVW	R0, #lo_addr(_TIMERS+0)
MOVT	R0, #hi_addr(_TIMERS+0)
BL	_DrawScreen+0
;Controller_events_code.c,697 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,698 :: 		}
L_end_user_set_timersOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnUp
_user_hysterezisOnPress:
;Controller_events_code.c,699 :: 		void user_hysterezisOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,700 :: 		Image60.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,701 :: 		DrawImage(&Image60);
MOVW	R0, #lo_addr(_Image60+0)
MOVT	R0, #hi_addr(_Image60+0)
BL	_DrawImage+0
;Controller_events_code.c,702 :: 		}
L_end_user_hysterezisOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnPress
_user_hysterezisOnUp:
;Controller_events_code.c,703 :: 		void user_hysterezisOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,704 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,705 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,706 :: 		Image60.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,707 :: 		DrawScreen(&SETTINGS);
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
BL	_DrawScreen+0
;Controller_events_code.c,708 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,709 :: 		}
L_end_user_hysterezisOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnUp
_User_history_checkOnPress:
;Controller_events_code.c,710 :: 		void User_history_checkOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,711 :: 		Image52.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,712 :: 		DrawImage(&Image52);
MOVW	R0, #lo_addr(_Image52+0)
MOVT	R0, #hi_addr(_Image52+0)
BL	_DrawImage+0
;Controller_events_code.c,713 :: 		}
L_end_User_history_checkOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnPress
_User_history_checkOnUp:
;Controller_events_code.c,714 :: 		void User_history_checkOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,715 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,716 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,717 :: 		Image52.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,718 :: 		DrawScreen(&EVENTS);
MOVW	R0, #lo_addr(_EVENTS+0)
MOVT	R0, #hi_addr(_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,719 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,720 :: 		}
L_end_User_history_checkOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnUp
_user_energyOnUp:
;Controller_events_code.c,722 :: 		void user_energyOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,723 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,724 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,725 :: 		Image54.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,726 :: 		DrawScreen(&ENERGY);
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
BL	_DrawScreen+0
;Controller_events_code.c,727 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,728 :: 		}
L_end_user_energyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnUp
_user_energyOnPress:
;Controller_events_code.c,729 :: 		void user_energyOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,730 :: 		Image54.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,731 :: 		DrawImage(&Image54);
MOVW	R0, #lo_addr(_Image54+0)
MOVT	R0, #hi_addr(_Image54+0)
BL	_DrawImage+0
;Controller_events_code.c,732 :: 		}
L_end_user_energyOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnPress
_admin_set_systemOnUp:
;Controller_events_code.c,733 :: 		void admin_set_systemOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,734 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,735 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,736 :: 		Image55.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,738 :: 		DrawScreen (&SYSTEM_SET);
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
;Controller_events_code.c,739 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,740 :: 		}
L_end_admin_set_systemOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnUp
_admin_set_systemOnPress:
;Controller_events_code.c,741 :: 		void  admin_set_systemOnPress (){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,742 :: 		Image55.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,743 :: 		DrawImage(&Image55);
MOVW	R0, #lo_addr(_Image55+0)
MOVT	R0, #hi_addr(_Image55+0)
BL	_DrawImage+0
;Controller_events_code.c,744 :: 		}
L_end_admin_set_systemOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnPress
_furnanceUP:
;Controller_events_code.c,745 :: 		void furnanceUP(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,746 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,747 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,748 :: 		Image56.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,749 :: 		DrawScreen(&FURNANCE);
MOVW	R0, #lo_addr(_FURNANCE+0)
MOVT	R0, #hi_addr(_FURNANCE+0)
BL	_DrawScreen+0
;Controller_events_code.c,750 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,751 :: 		}
L_end_furnanceUP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceUP
_furnanceDown:
;Controller_events_code.c,752 :: 		void furnanceDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,753 :: 		Image56.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,754 :: 		DrawImage(&Image56);
MOVW	R0, #lo_addr(_Image56+0)
MOVT	R0, #hi_addr(_Image56+0)
BL	_DrawImage+0
;Controller_events_code.c,755 :: 		}
L_end_furnanceDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceDown
_user_defrostOnUp:
;Controller_events_code.c,756 :: 		void user_defrostOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,757 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,758 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,759 :: 		Image57.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,760 :: 		DrawScreen(&DEFROST);
MOVW	R0, #lo_addr(_DEFROST+0)
MOVT	R0, #hi_addr(_DEFROST+0)
BL	_DrawScreen+0
;Controller_events_code.c,761 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,762 :: 		}
L_end_user_defrostOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnUp
_user_defrostOnPress:
;Controller_events_code.c,763 :: 		void user_defrostOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,764 :: 		Image57.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,765 :: 		DrawImage(&Image57);
MOVW	R0, #lo_addr(_Image57+0)
MOVT	R0, #hi_addr(_Image57+0)
BL	_DrawImage+0
;Controller_events_code.c,766 :: 		}
L_end_user_defrostOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnPress
_DEC_EEV1OnPress:
;Controller_events_code.c,818 :: 		void DEC_EEV1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,820 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,822 :: 		if(Red_bar.Position >= Red_bar.Min + 5) {
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
BCC	L_DEC_EEV1OnPress182
;Controller_events_code.c,825 :: 		Red_bar.Position -= 5;
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
LDRH	R0, [R1, #0]
SUBS	R0, R0, #5
STRH	R0, [R1, #0]
;Controller_events_code.c,827 :: 		DrawProgressBar(&Red_bar);
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_DrawProgressBar+0
;Controller_events_code.c,828 :: 		Delay_ms (50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_DEC_EEV1OnPress183:
SUBS	R7, R7, #1
BNE	L_DEC_EEV1OnPress183
NOP
NOP
NOP
;Controller_events_code.c,829 :: 		}
L_DEC_EEV1OnPress182:
;Controller_events_code.c,830 :: 		}
L_end_DEC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DEC_EEV1OnPress
_INC_EEV1OnPress:
;Controller_events_code.c,831 :: 		void INC_EEV1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,832 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,833 :: 		if(Red_bar.Position <= Red_bar.Max - 5) {
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
BHI	L_INC_EEV1OnPress185
;Controller_events_code.c,834 :: 		Red_bar.Position += 5;
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #5
STRH	R0, [R1, #0]
;Controller_events_code.c,835 :: 		UpdatePBPosition(&Red_bar);
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_UpdatePBPosition+0
;Controller_events_code.c,836 :: 		Delay_ms (50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_INC_EEV1OnPress186:
SUBS	R7, R7, #1
BNE	L_INC_EEV1OnPress186
NOP
NOP
NOP
;Controller_events_code.c,837 :: 		}
L_INC_EEV1OnPress185:
;Controller_events_code.c,838 :: 		}
L_end_INC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _INC_EEV1OnPress
_Set_Trv:
;Controller_events_code.c,840 :: 		void Set_Trv() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,842 :: 		system_reg[TRV_CORRECT_1]=Red_bar.Position - system_reg[TRV_STEPS_1];
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
;Controller_events_code.c,846 :: 		send_data_packet(TRV_CORRECT_1,1);
MOVS	R1, #1
MOVW	R0, #3
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,847 :: 		}
L_end_Set_Trv:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Trv
__1OnClick:
;Controller_events_code.c,850 :: 		void _1OnClick() {
;Controller_events_code.c,852 :: 		}
L_end__1OnClick:
BX	LR
; end of __1OnClick
__2OnClick:
;Controller_events_code.c,854 :: 		void _2OnClick() {
;Controller_events_code.c,856 :: 		}
L_end__2OnClick:
BX	LR
; end of __2OnClick
__3OnClick:
;Controller_events_code.c,858 :: 		void _3OnClick() {
;Controller_events_code.c,860 :: 		}
L_end__3OnClick:
BX	LR
; end of __3OnClick
__4OnClick:
;Controller_events_code.c,862 :: 		void _4OnClick() {
;Controller_events_code.c,864 :: 		}
L_end__4OnClick:
BX	LR
; end of __4OnClick
__5OnClick:
;Controller_events_code.c,866 :: 		void _5OnClick() {
;Controller_events_code.c,868 :: 		}
L_end__5OnClick:
BX	LR
; end of __5OnClick
__6OnClick:
;Controller_events_code.c,870 :: 		void _6OnClick() {
;Controller_events_code.c,872 :: 		}
L_end__6OnClick:
BX	LR
; end of __6OnClick
__7OnClick:
;Controller_events_code.c,874 :: 		void _7OnClick() {
;Controller_events_code.c,876 :: 		}
L_end__7OnClick:
BX	LR
; end of __7OnClick
__8OnClick:
;Controller_events_code.c,878 :: 		void _8OnClick() {
;Controller_events_code.c,880 :: 		}
L_end__8OnClick:
BX	LR
; end of __8OnClick
__9OnClick:
;Controller_events_code.c,882 :: 		void _9OnClick() {
;Controller_events_code.c,884 :: 		}
L_end__9OnClick:
BX	LR
; end of __9OnClick
__0OnClick:
;Controller_events_code.c,886 :: 		void _0OnClick() {
;Controller_events_code.c,888 :: 		}
L_end__0OnClick:
BX	LR
; end of __0OnClick
__QOnClick:
;Controller_events_code.c,890 :: 		void _QOnClick() {
;Controller_events_code.c,892 :: 		}
L_end__QOnClick:
BX	LR
; end of __QOnClick
__WOnClick:
;Controller_events_code.c,894 :: 		void _WOnClick() {
;Controller_events_code.c,896 :: 		}
L_end__WOnClick:
BX	LR
; end of __WOnClick
__EOnClick:
;Controller_events_code.c,898 :: 		void _EOnClick() {
;Controller_events_code.c,900 :: 		}
L_end__EOnClick:
BX	LR
; end of __EOnClick
__ROnClick:
;Controller_events_code.c,902 :: 		void _ROnClick() {
;Controller_events_code.c,904 :: 		}
L_end__ROnClick:
BX	LR
; end of __ROnClick
__TOnClick:
;Controller_events_code.c,906 :: 		void _TOnClick() {
;Controller_events_code.c,908 :: 		}
L_end__TOnClick:
BX	LR
; end of __TOnClick
__YOnClick:
;Controller_events_code.c,910 :: 		void _YOnClick() {
;Controller_events_code.c,912 :: 		}
L_end__YOnClick:
BX	LR
; end of __YOnClick
__UOnClick:
;Controller_events_code.c,914 :: 		void _UOnClick() {
;Controller_events_code.c,916 :: 		}
L_end__UOnClick:
BX	LR
; end of __UOnClick
__IOnClick:
;Controller_events_code.c,918 :: 		void _IOnClick() {
;Controller_events_code.c,920 :: 		}
L_end__IOnClick:
BX	LR
; end of __IOnClick
__OOnClick:
;Controller_events_code.c,922 :: 		void _OOnClick() {
;Controller_events_code.c,924 :: 		}
L_end__OOnClick:
BX	LR
; end of __OOnClick
__POnClick:
;Controller_events_code.c,926 :: 		void _POnClick() {
;Controller_events_code.c,928 :: 		}
L_end__POnClick:
BX	LR
; end of __POnClick
__AOnClick:
;Controller_events_code.c,930 :: 		void _AOnClick() {
;Controller_events_code.c,932 :: 		}
L_end__AOnClick:
BX	LR
; end of __AOnClick
__SOnClick:
;Controller_events_code.c,934 :: 		void _SOnClick() {
;Controller_events_code.c,936 :: 		}
L_end__SOnClick:
BX	LR
; end of __SOnClick
__DOnClick:
;Controller_events_code.c,938 :: 		void _DOnClick() {
;Controller_events_code.c,940 :: 		}
L_end__DOnClick:
BX	LR
; end of __DOnClick
__FOnClick:
;Controller_events_code.c,942 :: 		void _FOnClick() {
;Controller_events_code.c,944 :: 		}
L_end__FOnClick:
BX	LR
; end of __FOnClick
__GOnClick:
;Controller_events_code.c,946 :: 		void _GOnClick() {
;Controller_events_code.c,948 :: 		}
L_end__GOnClick:
BX	LR
; end of __GOnClick
__HOnClick:
;Controller_events_code.c,950 :: 		void _HOnClick() {
;Controller_events_code.c,952 :: 		}
L_end__HOnClick:
BX	LR
; end of __HOnClick
__JOnClick:
;Controller_events_code.c,954 :: 		void _JOnClick() {
;Controller_events_code.c,956 :: 		}
L_end__JOnClick:
BX	LR
; end of __JOnClick
__KOnClick:
;Controller_events_code.c,958 :: 		void _KOnClick() {
;Controller_events_code.c,960 :: 		}
L_end__KOnClick:
BX	LR
; end of __KOnClick
__LOnClick:
;Controller_events_code.c,962 :: 		void _LOnClick() {
;Controller_events_code.c,964 :: 		}
L_end__LOnClick:
BX	LR
; end of __LOnClick
__ZOnClick:
;Controller_events_code.c,966 :: 		void _ZOnClick() {
;Controller_events_code.c,968 :: 		}
L_end__ZOnClick:
BX	LR
; end of __ZOnClick
__XOnClick:
;Controller_events_code.c,970 :: 		void _XOnClick() {
;Controller_events_code.c,972 :: 		}
L_end__XOnClick:
BX	LR
; end of __XOnClick
__COnClick:
;Controller_events_code.c,974 :: 		void _COnClick() {
;Controller_events_code.c,976 :: 		}
L_end__COnClick:
BX	LR
; end of __COnClick
__VOnClick:
;Controller_events_code.c,978 :: 		void _VOnClick() {
;Controller_events_code.c,980 :: 		}
L_end__VOnClick:
BX	LR
; end of __VOnClick
__BOnClick:
;Controller_events_code.c,982 :: 		void _BOnClick() {
;Controller_events_code.c,984 :: 		}
L_end__BOnClick:
BX	LR
; end of __BOnClick
__NOnClick:
;Controller_events_code.c,986 :: 		void _NOnClick() {
;Controller_events_code.c,988 :: 		}
L_end__NOnClick:
BX	LR
; end of __NOnClick
__MOnClick:
;Controller_events_code.c,990 :: 		void _MOnClick() {
;Controller_events_code.c,992 :: 		}
L_end__MOnClick:
BX	LR
; end of __MOnClick
__CommaOnClick:
;Controller_events_code.c,994 :: 		void _CommaOnClick() {
;Controller_events_code.c,996 :: 		}
L_end__CommaOnClick:
BX	LR
; end of __CommaOnClick
__ColonOnClick:
;Controller_events_code.c,998 :: 		void _ColonOnClick() {
;Controller_events_code.c,1000 :: 		}
L_end__ColonOnClick:
BX	LR
; end of __ColonOnClick
__SlashOnClick:
;Controller_events_code.c,1002 :: 		void _SlashOnClick() {
;Controller_events_code.c,1004 :: 		}
L_end__SlashOnClick:
BX	LR
; end of __SlashOnClick
__DELOnClick:
;Controller_events_code.c,1006 :: 		void _DELOnClick() {
;Controller_events_code.c,1008 :: 		}
L_end__DELOnClick:
BX	LR
; end of __DELOnClick
_ClearOnPress:
;Controller_events_code.c,1010 :: 		void ClearOnPress() {
;Controller_events_code.c,1012 :: 		}
L_end_ClearOnPress:
BX	LR
; end of _ClearOnPress
_CAPS_SwitchOnClick:
;Controller_events_code.c,1014 :: 		void CAPS_SwitchOnClick() {
;Controller_events_code.c,1016 :: 		}
L_end_CAPS_SwitchOnClick:
BX	LR
; end of _CAPS_SwitchOnClick
_SPACEOnClick:
;Controller_events_code.c,1018 :: 		void SPACEOnClick() {
;Controller_events_code.c,1020 :: 		}
L_end_SPACEOnClick:
BX	LR
; end of _SPACEOnClick
_ENTEROnClick:
;Controller_events_code.c,1022 :: 		void ENTEROnClick() {
;Controller_events_code.c,1024 :: 		}
L_end_ENTEROnClick:
BX	LR
; end of _ENTEROnClick
_SetDateAndTimeOnClick:
;Controller_events_code.c,1026 :: 		void SetDateAndTimeOnClick(){
;Controller_events_code.c,1028 :: 		}
L_end_SetDateAndTimeOnClick:
BX	LR
; end of _SetDateAndTimeOnClick
_OneYearUpOnClick:
;Controller_events_code.c,1029 :: 		void OneYearUpOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1032 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1033 :: 		tenYearU++;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1034 :: 		if (tenYearU > 9)
CMP	R0, #9
IT	LS
BLS	L_OneYearUpOnClick188
;Controller_events_code.c,1035 :: 		tenYearU = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_OneYearUpOnClick188:
;Controller_events_code.c,1036 :: 		ByteToStr(tenYearU, temp);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1037 :: 		res = Ltrim(temp);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1038 :: 		strcpy(OneYear.Caption, res);
MOVW	R1, #lo_addr(_OneYear+16)
MOVT	R1, #hi_addr(_OneYear+16)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1039 :: 		DrawButton(&OneYearUp);
MOVW	R0, #lo_addr(_OneYearUp+0)
MOVT	R0, #hi_addr(_OneYearUp+0)
BL	_DrawButton+0
;Controller_events_code.c,1040 :: 		DrawButton(&OneYearDwn);
MOVW	R0, #lo_addr(_OneYearDwn+0)
MOVT	R0, #hi_addr(_OneYearDwn+0)
BL	_DrawButton+0
;Controller_events_code.c,1041 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,1042 :: 		}
L_end_OneYearUpOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearUpOnClick
_OneYearDwnOnClick:
;Controller_events_code.c,1043 :: 		void OneYearDwnOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1046 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1047 :: 		tenYearU--;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,1048 :: 		if (My_Date.RTC_Year_Tens < 0)
MOVW	R0, #lo_addr(_My_Date+5)
MOVT	R0, #hi_addr(_My_Date+5)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	CS
BCS	L_OneYearDwnOnClick189
;Controller_events_code.c,1049 :: 		tenYearU = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_OneYearDwnOnClick189:
;Controller_events_code.c,1050 :: 		ByteToStr(tenYearU, temp);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1051 :: 		res = Ltrim(temp);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1052 :: 		strcpy(OneYear.Caption, res);
MOVW	R1, #lo_addr(_OneYear+16)
MOVT	R1, #hi_addr(_OneYear+16)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1053 :: 		DrawButton(&OneYearUp);
MOVW	R0, #lo_addr(_OneYearUp+0)
MOVT	R0, #hi_addr(_OneYearUp+0)
BL	_DrawButton+0
;Controller_events_code.c,1054 :: 		DrawButton(&OneYearDwn);
MOVW	R0, #lo_addr(_OneYearDwn+0)
MOVT	R0, #hi_addr(_OneYearDwn+0)
BL	_DrawButton+0
;Controller_events_code.c,1055 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,1056 :: 		}
L_end_OneYearDwnOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearDwnOnClick
_OneYearUpOnUp:
;Controller_events_code.c,1057 :: 		void OneYearUpOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1058 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,1059 :: 		}
L_end_OneYearUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearUpOnUp
_OneYearUpOnPress:
;Controller_events_code.c,1060 :: 		void OneYearUpOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1061 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,1062 :: 		}
L_end_OneYearUpOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearUpOnPress
_OneYearDwnOnUp:
;Controller_events_code.c,1063 :: 		void OneYearDwnOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1064 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,1065 :: 		}
L_end_OneYearDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearDwnOnUp
_OneYearDwnOnPress:
;Controller_events_code.c,1066 :: 		void OneYearDwnOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1067 :: 		DrawLabel(&OneYear);
MOVW	R0, #lo_addr(_OneYear+0)
MOVT	R0, #hi_addr(_OneYear+0)
BL	_DrawLabel+0
;Controller_events_code.c,1068 :: 		}
L_end_OneYearDwnOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OneYearDwnOnPress
_TenYearUpOnClick:
;Controller_events_code.c,1070 :: 		void TenYearUpOnClick() {
;Controller_events_code.c,1071 :: 		}
L_end_TenYearUpOnClick:
BX	LR
; end of _TenYearUpOnClick
_TenYearDwnOnClick:
;Controller_events_code.c,1072 :: 		void TenYearDwnOnClick() {
;Controller_events_code.c,1073 :: 		}
L_end_TenYearDwnOnClick:
BX	LR
; end of _TenYearDwnOnClick
_TenYearUpOnUp:
;Controller_events_code.c,1074 :: 		void TenYearUpOnUp() {
;Controller_events_code.c,1076 :: 		}
L_end_TenYearUpOnUp:
BX	LR
; end of _TenYearUpOnUp
_TenYearDwnOnUp:
;Controller_events_code.c,1077 :: 		void TenYearDwnOnUp() {
;Controller_events_code.c,1078 :: 		}
L_end_TenYearDwnOnUp:
BX	LR
; end of _TenYearDwnOnUp
_TenYearDwnOnPress:
;Controller_events_code.c,1079 :: 		void TenYearDwnOnPress() {
;Controller_events_code.c,1080 :: 		}
L_end_TenYearDwnOnPress:
BX	LR
; end of _TenYearDwnOnPress
_TenYearUpOnPress:
;Controller_events_code.c,1081 :: 		void TenYearUpOnPress() {
;Controller_events_code.c,1083 :: 		}
L_end_TenYearUpOnPress:
BX	LR
; end of _TenYearUpOnPress
_MonthDateUpOnClick:
;Controller_events_code.c,1085 :: 		void MonthDateUpOnClick() {
;Controller_events_code.c,1087 :: 		}
L_end_MonthDateUpOnClick:
BX	LR
; end of _MonthDateUpOnClick
_MonthDateUpOnUp:
;Controller_events_code.c,1088 :: 		void MonthDateUpOnUp() {
;Controller_events_code.c,1090 :: 		}
L_end_MonthDateUpOnUp:
BX	LR
; end of _MonthDateUpOnUp
_MonthDateUpOnPress:
;Controller_events_code.c,1091 :: 		void MonthDateUpOnPress() {
;Controller_events_code.c,1093 :: 		}
L_end_MonthDateUpOnPress:
BX	LR
; end of _MonthDateUpOnPress
_MonthDateDwnOnClick:
;Controller_events_code.c,1094 :: 		void MonthDateDwnOnClick() {
;Controller_events_code.c,1096 :: 		}
L_end_MonthDateDwnOnClick:
BX	LR
; end of _MonthDateDwnOnClick
_MonthDateDwnOnUp:
;Controller_events_code.c,1097 :: 		void MonthDateDwnOnUp() {
;Controller_events_code.c,1099 :: 		}
L_end_MonthDateDwnOnUp:
BX	LR
; end of _MonthDateDwnOnUp
_MonthDateDwnOnPress:
;Controller_events_code.c,1100 :: 		void MonthDateDwnOnPress() {
;Controller_events_code.c,1101 :: 		}
L_end_MonthDateDwnOnPress:
BX	LR
; end of _MonthDateDwnOnPress
_TenDayUpOnClick:
;Controller_events_code.c,1102 :: 		void TenDayUpOnClick() {
;Controller_events_code.c,1104 :: 		}
L_end_TenDayUpOnClick:
BX	LR
; end of _TenDayUpOnClick
_TenDayDwnOnClick:
;Controller_events_code.c,1105 :: 		void TenDayDwnOnClick() {
;Controller_events_code.c,1107 :: 		}
L_end_TenDayDwnOnClick:
BX	LR
; end of _TenDayDwnOnClick
_TenDayUpOnUp:
;Controller_events_code.c,1109 :: 		void TenDayUpOnUp() {
;Controller_events_code.c,1111 :: 		}
L_end_TenDayUpOnUp:
BX	LR
; end of _TenDayUpOnUp
_TenDayDwnOnUp:
;Controller_events_code.c,1113 :: 		void TenDayDwnOnUp() {
;Controller_events_code.c,1115 :: 		}
L_end_TenDayDwnOnUp:
BX	LR
; end of _TenDayDwnOnUp
_TenDayUpOnPress:
;Controller_events_code.c,1117 :: 		void TenDayUpOnPress() {
;Controller_events_code.c,1119 :: 		}
L_end_TenDayUpOnPress:
BX	LR
; end of _TenDayUpOnPress
_TenDayDwnOnPress:
;Controller_events_code.c,1121 :: 		void TenDayDwnOnPress() {
;Controller_events_code.c,1123 :: 		}
L_end_TenDayDwnOnPress:
BX	LR
; end of _TenDayDwnOnPress
_OneDayUpOnClick:
;Controller_events_code.c,1124 :: 		void OneDayUpOnClick() {
;Controller_events_code.c,1126 :: 		}
L_end_OneDayUpOnClick:
BX	LR
; end of _OneDayUpOnClick
_OneDayDwnOnClick:
;Controller_events_code.c,1128 :: 		void OneDayDwnOnClick() {
;Controller_events_code.c,1130 :: 		}
L_end_OneDayDwnOnClick:
BX	LR
; end of _OneDayDwnOnClick
_OneDayUpOnUp:
;Controller_events_code.c,1132 :: 		void OneDayUpOnUp() {
;Controller_events_code.c,1134 :: 		}
L_end_OneDayUpOnUp:
BX	LR
; end of _OneDayUpOnUp
_OneDayDwnOnUp:
;Controller_events_code.c,1136 :: 		void OneDayDwnOnUp() {
;Controller_events_code.c,1138 :: 		}
L_end_OneDayDwnOnUp:
BX	LR
; end of _OneDayDwnOnUp
_OneDayUpOnPress:
;Controller_events_code.c,1140 :: 		void OneDayUpOnPress() {
;Controller_events_code.c,1142 :: 		}
L_end_OneDayUpOnPress:
BX	LR
; end of _OneDayUpOnPress
_OneDayDwnOnPress:
;Controller_events_code.c,1144 :: 		void OneDayDwnOnPress() {
;Controller_events_code.c,1146 :: 		}
L_end_OneDayDwnOnPress:
BX	LR
; end of _OneDayDwnOnPress
_Day_unitUpOnClick:
;Controller_events_code.c,1147 :: 		void Day_unitUpOnClick() {
;Controller_events_code.c,1149 :: 		}
L_end_Day_unitUpOnClick:
BX	LR
; end of _Day_unitUpOnClick
_Day_unitDwnOnClick:
;Controller_events_code.c,1151 :: 		void Day_unitDwnOnClick() {
;Controller_events_code.c,1153 :: 		}
L_end_Day_unitDwnOnClick:
BX	LR
; end of _Day_unitDwnOnClick
_Day_unitUpOnUp:
;Controller_events_code.c,1155 :: 		void Day_unitUpOnUp() {
;Controller_events_code.c,1157 :: 		}
L_end_Day_unitUpOnUp:
BX	LR
; end of _Day_unitUpOnUp
_Day_unitDwnOnUp:
;Controller_events_code.c,1159 :: 		void Day_unitDwnOnUp() {
;Controller_events_code.c,1161 :: 		}
L_end_Day_unitDwnOnUp:
BX	LR
; end of _Day_unitDwnOnUp
_Day_unitUpOnPress:
;Controller_events_code.c,1163 :: 		void Day_unitUpOnPress() {
;Controller_events_code.c,1165 :: 		}
L_end_Day_unitUpOnPress:
BX	LR
; end of _Day_unitUpOnPress
_Day_unitDwnOnPress:
;Controller_events_code.c,1167 :: 		void Day_unitDwnOnPress() {
;Controller_events_code.c,1169 :: 		}
L_end_Day_unitDwnOnPress:
BX	LR
; end of _Day_unitDwnOnPress
_Unit_hoursUpOnClick:
;Controller_events_code.c,1171 :: 		void Unit_hoursUpOnClick() {
;Controller_events_code.c,1173 :: 		}
L_end_Unit_hoursUpOnClick:
BX	LR
; end of _Unit_hoursUpOnClick
_Unit_hoursDwnOnClick:
;Controller_events_code.c,1175 :: 		void Unit_hoursDwnOnClick() {
;Controller_events_code.c,1177 :: 		}
L_end_Unit_hoursDwnOnClick:
BX	LR
; end of _Unit_hoursDwnOnClick
_Unit_hoursUpOnUp:
;Controller_events_code.c,1178 :: 		void Unit_hoursUpOnUp() {
;Controller_events_code.c,1180 :: 		}
L_end_Unit_hoursUpOnUp:
BX	LR
; end of _Unit_hoursUpOnUp
_Unit_hoursDwnOnUp:
;Controller_events_code.c,1181 :: 		void Unit_hoursDwnOnUp() {
;Controller_events_code.c,1183 :: 		}
L_end_Unit_hoursDwnOnUp:
BX	LR
; end of _Unit_hoursDwnOnUp
_Unit_hoursUpOnPress:
;Controller_events_code.c,1184 :: 		void Unit_hoursUpOnPress() {
;Controller_events_code.c,1186 :: 		}
L_end_Unit_hoursUpOnPress:
BX	LR
; end of _Unit_hoursUpOnPress
_Unit_hoursDwnOnPress:
;Controller_events_code.c,1187 :: 		void Unit_hoursDwnOnPress() {
;Controller_events_code.c,1189 :: 		}
L_end_Unit_hoursDwnOnPress:
BX	LR
; end of _Unit_hoursDwnOnPress
_Ten_minutesUpOnClick:
;Controller_events_code.c,1190 :: 		void Ten_minutesUpOnClick() {
;Controller_events_code.c,1192 :: 		}
L_end_Ten_minutesUpOnClick:
BX	LR
; end of _Ten_minutesUpOnClick
_Ten_minutesDwnOnClick:
;Controller_events_code.c,1193 :: 		void Ten_minutesDwnOnClick() {
;Controller_events_code.c,1195 :: 		}
L_end_Ten_minutesDwnOnClick:
BX	LR
; end of _Ten_minutesDwnOnClick
_Ten_minutesUpOnUp:
;Controller_events_code.c,1196 :: 		void Ten_minutesUpOnUp() {
;Controller_events_code.c,1198 :: 		}
L_end_Ten_minutesUpOnUp:
BX	LR
; end of _Ten_minutesUpOnUp
_Ten_minutesDwnOnUp:
;Controller_events_code.c,1199 :: 		void Ten_minutesDwnOnUp() {
;Controller_events_code.c,1201 :: 		}
L_end_Ten_minutesDwnOnUp:
BX	LR
; end of _Ten_minutesDwnOnUp
_Ten_minutesUpOnPress:
;Controller_events_code.c,1202 :: 		void Ten_minutesUpOnPress() {
;Controller_events_code.c,1204 :: 		}
L_end_Ten_minutesUpOnPress:
BX	LR
; end of _Ten_minutesUpOnPress
_Ten_minutesDwnOnPress:
;Controller_events_code.c,1205 :: 		void Ten_minutesDwnOnPress() {
;Controller_events_code.c,1207 :: 		}
L_end_Ten_minutesDwnOnPress:
BX	LR
; end of _Ten_minutesDwnOnPress
_Unit_minutesUpOnClick:
;Controller_events_code.c,1208 :: 		void Unit_minutesUpOnClick() {
;Controller_events_code.c,1210 :: 		}
L_end_Unit_minutesUpOnClick:
BX	LR
; end of _Unit_minutesUpOnClick
_Unit_minutesDwnOnClick:
;Controller_events_code.c,1212 :: 		void Unit_minutesDwnOnClick() {
;Controller_events_code.c,1214 :: 		}
L_end_Unit_minutesDwnOnClick:
BX	LR
; end of _Unit_minutesDwnOnClick
_Unit_minutesUpOnUp:
;Controller_events_code.c,1216 :: 		void Unit_minutesUpOnUp(){
;Controller_events_code.c,1218 :: 		}
L_end_Unit_minutesUpOnUp:
BX	LR
; end of _Unit_minutesUpOnUp
_Unit_minutesDwnOnUp:
;Controller_events_code.c,1220 :: 		void Unit_minutesDwnOnUp(){
;Controller_events_code.c,1222 :: 		}
L_end_Unit_minutesDwnOnUp:
BX	LR
; end of _Unit_minutesDwnOnUp
_Unit_minutesUpOnPress:
;Controller_events_code.c,1224 :: 		void Unit_minutesUpOnPress() {
;Controller_events_code.c,1226 :: 		}
L_end_Unit_minutesUpOnPress:
BX	LR
; end of _Unit_minutesUpOnPress
_Unit_minutesDwnOnPress:
;Controller_events_code.c,1228 :: 		void Unit_minutesDwnOnPress() {
;Controller_events_code.c,1230 :: 		}
L_end_Unit_minutesDwnOnPress:
BX	LR
; end of _Unit_minutesDwnOnPress
_Admin_SetOnClick:
;Controller_events_code.c,1233 :: 		void Admin_SetOnClick(){
;Controller_events_code.c,1234 :: 		}
L_end_Admin_SetOnClick:
BX	LR
; end of _Admin_SetOnClick
_system_passOnDown:
;Controller_events_code.c,1236 :: 		void system_passOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1237 :: 		Image83.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1238 :: 		DrawImage(&Image83);
MOVW	R0, #lo_addr(_Image83+0)
MOVT	R0, #hi_addr(_Image83+0)
BL	_DrawImage+0
;Controller_events_code.c,1239 :: 		}
L_end_system_passOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnDown
_system_passOnUp:
;Controller_events_code.c,1241 :: 		void system_passOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1242 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1243 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1244 :: 		Image83.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1245 :: 		DrawScreen(&PASSWORD);
MOVW	R0, #lo_addr(_PASSWORD+0)
MOVT	R0, #hi_addr(_PASSWORD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1246 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1247 :: 		}
L_end_system_passOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnUp
_ModeSetOnUp:
;Controller_events_code.c,1249 :: 		void ModeSetOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1250 :: 		if (SYSTEM_ON == false) {
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_ModeSetOnUp190
;Controller_events_code.c,1251 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1252 :: 		strcpy(System_Set_Message.Caption, " ");
MOVW	R1, #lo_addr(?lstr54_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr54_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1253 :: 		Image300.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1254 :: 		System_Set_Message.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1255 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1256 :: 		}
IT	AL
BAL	L_ModeSetOnUp191
L_ModeSetOnUp190:
;Controller_events_code.c,1258 :: 		strcpy(System_Set_Message.Caption, "Please  OFF  system  power!");
MOVW	R1, #lo_addr(?lstr55_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr55_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1259 :: 		Image300.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1260 :: 		DrawImage (&Image300);
MOVW	R0, #lo_addr(_Image300+0)
MOVT	R0, #hi_addr(_Image300+0)
BL	_DrawImage+0
;Controller_events_code.c,1261 :: 		System_Set_Message.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1262 :: 		DrawButton (&System_Set_Message);
MOVW	R0, #lo_addr(_System_Set_Message+0)
MOVT	R0, #hi_addr(_System_Set_Message+0)
BL	_DrawButton+0
;Controller_events_code.c,1263 :: 		}
L_ModeSetOnUp191:
;Controller_events_code.c,1264 :: 		}
L_end_ModeSetOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnUp
_ModeSetOnDown:
;Controller_events_code.c,1266 :: 		void ModeSetOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1267 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1268 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1269 :: 		}
L_end_ModeSetOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnDown
_system_EEVOnDown:
;Controller_events_code.c,1271 :: 		void system_EEVOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1272 :: 		Image89.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1273 :: 		DrawImage(&Image89);
MOVW	R0, #lo_addr(_Image89+0)
MOVT	R0, #hi_addr(_Image89+0)
BL	_DrawImage+0
;Controller_events_code.c,1274 :: 		}
L_end_system_EEVOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnDown
_system_EEVOnUp:
;Controller_events_code.c,1276 :: 		void system_EEVOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1277 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1278 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1280 :: 		Image89.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1281 :: 		DrawScreen(&EEV);
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
BL	_DrawScreen+0
;Controller_events_code.c,1282 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1284 :: 		}
L_end_system_EEVOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnUp
_system_modeOnDown:
;Controller_events_code.c,1286 :: 		void system_modeOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1287 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1288 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1289 :: 		}
L_end_system_modeOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnDown
_system_modeOnUp:
;Controller_events_code.c,1291 :: 		void system_modeOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1292 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1293 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1294 :: 		Image85.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1295 :: 		DrawScreen(&MODE);
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
;Controller_events_code.c,1296 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1297 :: 		}
L_end_system_modeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnUp
_system_delayOnUp:
;Controller_events_code.c,1299 :: 		void system_delayOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1300 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1301 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1302 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1303 :: 		DrawScreen(&DELAY_MENU);
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,1304 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1305 :: 		}
L_end_system_delayOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnUp
_system_delayOnDown:
;Controller_events_code.c,1306 :: 		void system_delayOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1307 :: 		Image90.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1308 :: 		DrawImage(&Image90);
MOVW	R0, #lo_addr(_Image90+0)
MOVT	R0, #hi_addr(_Image90+0)
BL	_DrawImage+0
;Controller_events_code.c,1309 :: 		}
L_end_system_delayOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnDown
_system_graphOnDown:
;Controller_events_code.c,1311 :: 		void system_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1312 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1313 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1314 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1315 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1316 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1317 :: 		}
L_end_system_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnDown
_system_graphOnUp:
;Controller_events_code.c,1319 :: 		void system_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1320 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1321 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1323 :: 		}
L_end_system_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnUp
_system_microSDOnDown:
;Controller_events_code.c,1324 :: 		void system_microSDOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1325 :: 		Image88.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1326 :: 		DrawImage(&Image88);
MOVW	R0, #lo_addr(_Image88+0)
MOVT	R0, #hi_addr(_Image88+0)
BL	_DrawImage+0
;Controller_events_code.c,1327 :: 		}
L_end_system_microSDOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnDown
_system_microSDOnUp:
;Controller_events_code.c,1329 :: 		void system_microSDOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1330 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1331 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1332 :: 		Image88.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1333 :: 		DrawScreen(&MICRO_SD);
MOVW	R0, #lo_addr(_MICRO_SD+0)
MOVT	R0, #hi_addr(_MICRO_SD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1334 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1335 :: 		}
L_end_system_microSDOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnUp
_system_limitsOnDown:
;Controller_events_code.c,1338 :: 		void system_limitsOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1339 :: 		Image91.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1340 :: 		DrawImage(&Image91);
MOVW	R0, #lo_addr(_Image91+0)
MOVT	R0, #hi_addr(_Image91+0)
BL	_DrawImage+0
;Controller_events_code.c,1341 :: 		}
L_end_system_limitsOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnDown
_system_limitsOnUp:
;Controller_events_code.c,1343 :: 		void system_limitsOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1344 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1345 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1346 :: 		Image91.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1347 :: 		DrawScreen(&LIMITS1);
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
;Controller_events_code.c,1348 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1349 :: 		}
L_end_system_limitsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnUp
_ssytem_graphOnDown:
;Controller_events_code.c,1351 :: 		void ssytem_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1352 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1353 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1354 :: 		}
L_end_ssytem_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnDown
_ssytem_graphOnUp:
;Controller_events_code.c,1356 :: 		void ssytem_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1357 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1358 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1359 :: 		Image92.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1360 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1361 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1362 :: 		}
L_end_ssytem_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnUp
_system_historyOnDown:
;Controller_events_code.c,1364 :: 		void system_historyOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1365 :: 		Image93.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1366 :: 		DrawImage(&Image93);
MOVW	R0, #lo_addr(_Image93+0)
MOVT	R0, #hi_addr(_Image93+0)
BL	_DrawImage+0
;Controller_events_code.c,1367 :: 		}
L_end_system_historyOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnDown
_system_historyOnUp:
;Controller_events_code.c,1369 :: 		void system_historyOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1370 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1371 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1372 :: 		Image93.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1373 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,1374 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1375 :: 		}
L_end_system_historyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnUp
_Delay_Source_DOWNOnUp:
;Controller_events_code.c,1378 :: 		void Delay_Source_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1379 :: 		Image306.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1380 :: 		Delay_Source_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1381 :: 		DrawImage(&Delay_Source_DOWN);
MOVW	R0, #lo_addr(_Delay_Source_DOWN+0)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1382 :: 		}
L_end_Delay_Source_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_DOWNOnUp
_Delay_Source_DOWNOnPress:
;Controller_events_code.c,1383 :: 		void Delay_Source_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1386 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1387 :: 		Image306.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1388 :: 		Delay_Source_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1389 :: 		DrawImage(&Image306);
MOVW	R0, #lo_addr(_Image306+0)
MOVT	R0, #hi_addr(_Image306+0)
BL	_DrawImage+0
;Controller_events_code.c,1392 :: 		system_reg[SOURS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1393 :: 		if (system_reg[SOURS_DEL] <0) system_reg[SOURS_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_Source_DOWNOnPress192
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_DOWNOnPress192:
;Controller_events_code.c,1394 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1395 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1396 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1397 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1398 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_Source_DOWNOnPress193:
SUBS	R7, R7, #1
BNE	L_Delay_Source_DOWNOnPress193
NOP
NOP
NOP
;Controller_events_code.c,1399 :: 		}
L_end_Delay_Source_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_DOWNOnPress
_Delay_Source_UPOnUp:
;Controller_events_code.c,1400 :: 		void Delay_Source_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1401 :: 		Image312.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1402 :: 		Delay_Source_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1403 :: 		DrawImage(&Delay_Source_UP);
MOVW	R0, #lo_addr(_Delay_Source_UP+0)
MOVT	R0, #hi_addr(_Delay_Source_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1405 :: 		}
L_end_Delay_Source_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_UPOnUp
_Delay_Source_UPOnPress:
;Controller_events_code.c,1406 :: 		void Delay_Source_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1409 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1410 :: 		Image312.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1411 :: 		Delay_Source_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1412 :: 		DrawImage(&Image312);
MOVW	R0, #lo_addr(_Image312+0)
MOVT	R0, #hi_addr(_Image312+0)
BL	_DrawImage+0
;Controller_events_code.c,1413 :: 		system_reg[SOURS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1414 :: 		if (system_reg[SOURS_DEL] >99) system_reg[SOURS_DEL] = 99;
CMP	R0, #99
IT	LE
BLE	L_Delay_Source_UPOnPress195
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_UPOnPress195:
;Controller_events_code.c,1415 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1416 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1417 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1418 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1419 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_Source_UPOnPress196:
SUBS	R7, R7, #1
BNE	L_Delay_Source_UPOnPress196
NOP
NOP
NOP
;Controller_events_code.c,1420 :: 		}
L_end_Delay_Source_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_UPOnPress
_Delay_Source_SETOnUp:
;Controller_events_code.c,1421 :: 		void Delay_Source_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1422 :: 		Delay_Source_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1423 :: 		Image344.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1424 :: 		DrawImage (&Delay_Source_SET);
MOVW	R0, #lo_addr(_Delay_Source_SET+0)
MOVT	R0, #hi_addr(_Delay_Source_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1425 :: 		}
L_end_Delay_Source_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnUp
_Delay_Source_SETOnDown:
;Controller_events_code.c,1426 :: 		void Delay_Source_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1427 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1431 :: 		send_data_packet(SOURS_DEL,1);
MOVS	R1, #1
MOVW	R0, #30
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1432 :: 		Delay_Source_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1433 :: 		Image344.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1434 :: 		DrawImage (&Image344);
MOVW	R0, #lo_addr(_Image344+0)
MOVT	R0, #hi_addr(_Image344+0)
BL	_DrawImage+0
;Controller_events_code.c,1435 :: 		}
L_end_Delay_Source_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnDown
_Delay_heat_pump_DOWNOnUp:
;Controller_events_code.c,1437 :: 		void Delay_heat_pump_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1438 :: 		Image307.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1439 :: 		Delay_heat_pump_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1440 :: 		DrawImage(&Delay_heat_pump_DOWN);
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1442 :: 		}
L_end_Delay_heat_pump_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_DOWNOnUp
_Delay_heat_pump_DOWNOnPress:
;Controller_events_code.c,1443 :: 		void Delay_heat_pump_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1446 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1447 :: 		Image307.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1448 :: 		Delay_heat_pump_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1449 :: 		DrawImage(&Image307);
MOVW	R0, #lo_addr(_Image307+0)
MOVT	R0, #hi_addr(_Image307+0)
BL	_DrawImage+0
;Controller_events_code.c,1452 :: 		system_reg[HEAT_DEL]--;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1453 :: 		if (system_reg[HEAT_DEL] <0) system_reg[HEAT_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_heat_pump_DOWNOnPress198
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_DOWNOnPress198:
;Controller_events_code.c,1454 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1455 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1456 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1457 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1458 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_heat_pump_DOWNOnPress199:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_DOWNOnPress199
NOP
NOP
NOP
;Controller_events_code.c,1459 :: 		}
L_end_Delay_heat_pump_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_DOWNOnPress
_Delay_heat_pump_upOnUp:
;Controller_events_code.c,1460 :: 		void Delay_heat_pump_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1461 :: 		Image313.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1462 :: 		Delay_heat_pump_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1463 :: 		DrawImage(&Delay_heat_pump_up);
MOVW	R0, #lo_addr(_Delay_heat_pump_up+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1464 :: 		}
L_end_Delay_heat_pump_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_upOnUp
_Delay_heat_pump_upOnPress:
;Controller_events_code.c,1465 :: 		void Delay_heat_pump_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1468 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1469 :: 		Image313.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1470 :: 		Delay_heat_pump_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1471 :: 		DrawImage(&Image313);
MOVW	R0, #lo_addr(_Image313+0)
MOVT	R0, #hi_addr(_Image313+0)
BL	_DrawImage+0
;Controller_events_code.c,1474 :: 		system_reg[HEAT_DEL]++;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1475 :: 		if (system_reg[HEAT_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_heat_pump_upOnPress201
;Controller_events_code.c,1476 :: 		system_reg[HEAT_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_upOnPress201:
;Controller_events_code.c,1477 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1478 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1479 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1480 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1481 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_heat_pump_upOnPress202:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_upOnPress202
NOP
NOP
NOP
;Controller_events_code.c,1483 :: 		}
L_end_Delay_heat_pump_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_upOnPress
_Delay_heat_pump_SETOnUp:
;Controller_events_code.c,1484 :: 		void Delay_heat_pump_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1485 :: 		Delay_heat_pump_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1486 :: 		Image345.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1487 :: 		DrawImage (&Delay_heat_pump_SET);
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1488 :: 		}
L_end_Delay_heat_pump_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnUp
_Delay_heat_pump_SETOnDown:
;Controller_events_code.c,1489 :: 		void Delay_heat_pump_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1490 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1494 :: 		send_data_packet(HEAT_DEL,1);
MOVS	R1, #1
MOVW	R0, #20
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1495 :: 		Delay_heat_pump_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1496 :: 		Image345.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1497 :: 		DrawImage (&Image345);
MOVW	R0, #lo_addr(_Image345+0)
MOVT	R0, #hi_addr(_Image345+0)
BL	_DrawImage+0
;Controller_events_code.c,1498 :: 		}
L_end_Delay_heat_pump_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnDown
_Delay_reversing_DOWNOnUp:
;Controller_events_code.c,1500 :: 		void Delay_reversing_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1501 :: 		Image308.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1502 :: 		Delay_reversing_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1503 :: 		DrawImage(&Delay_reversing_DOWN);
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+0)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1504 :: 		}
L_end_Delay_reversing_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_DOWNOnUp
_Delay_reversing_DOWNOnPress:
;Controller_events_code.c,1505 :: 		void Delay_reversing_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1508 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1509 :: 		Image308.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1510 :: 		Delay_reversing_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1511 :: 		DrawImage(&Image308);
MOVW	R0, #lo_addr(_Image308+0)
MOVT	R0, #hi_addr(_Image308+0)
BL	_DrawImage+0
;Controller_events_code.c,1514 :: 		system_reg[REVERS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1515 :: 		if (system_reg[REVERS_DEL] <0)
CMP	R0, #0
IT	GE
BGE	L_Delay_reversing_DOWNOnPress204
;Controller_events_code.c,1516 :: 		system_reg[REVERS_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_DOWNOnPress204:
;Controller_events_code.c,1517 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1518 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1519 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1520 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1521 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_reversing_DOWNOnPress205:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_DOWNOnPress205
NOP
NOP
NOP
;Controller_events_code.c,1522 :: 		}
L_end_Delay_reversing_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_DOWNOnPress
_Delay_reversing_UPOnUp:
;Controller_events_code.c,1523 :: 		void Delay_reversing_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1524 :: 		Image314.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1525 :: 		Delay_reversing_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1526 :: 		DrawImage(&Delay_reversing_UP);
MOVW	R0, #lo_addr(_Delay_reversing_UP+0)
MOVT	R0, #hi_addr(_Delay_reversing_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1527 :: 		}
L_end_Delay_reversing_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_UPOnUp
_Delay_reversing_UPOnPress:
;Controller_events_code.c,1528 :: 		void Delay_reversing_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1531 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1532 :: 		Image314.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1533 :: 		Delay_reversing_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1534 :: 		DrawImage(&Image314);
MOVW	R0, #lo_addr(_Image314+0)
MOVT	R0, #hi_addr(_Image314+0)
BL	_DrawImage+0
;Controller_events_code.c,1537 :: 		system_reg[REVERS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1538 :: 		if (system_reg[REVERS_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_reversing_UPOnPress207
;Controller_events_code.c,1539 :: 		system_reg[REVERS_DEL] = 99 ;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_UPOnPress207:
;Controller_events_code.c,1540 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1541 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1542 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1543 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1544 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_reversing_UPOnPress208:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_UPOnPress208
NOP
NOP
NOP
;Controller_events_code.c,1545 :: 		}
L_end_Delay_reversing_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_UPOnPress
_Delay_reversing_SETOnUp:
;Controller_events_code.c,1546 :: 		void Delay_reversing_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1547 :: 		Delay_reversing_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1548 :: 		Image346.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1549 :: 		DrawImage (&Delay_reversing_SET);
MOVW	R0, #lo_addr(_Delay_reversing_SET+0)
MOVT	R0, #hi_addr(_Delay_reversing_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1550 :: 		}
L_end_Delay_reversing_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnUp
_Delay_reversing_SETOnDown:
;Controller_events_code.c,1551 :: 		void Delay_reversing_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1552 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1556 :: 		send_data_packet(REVERS_DEL,1);
MOVS	R1, #1
MOVW	R0, #40
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1557 :: 		Delay_reversing_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1558 :: 		Image346.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1559 :: 		DrawImage (&Image346);
MOVW	R0, #lo_addr(_Image346+0)
MOVT	R0, #hi_addr(_Image346+0)
BL	_DrawImage+0
;Controller_events_code.c,1560 :: 		}
L_end_Delay_reversing_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnDown
_Delay_trv_DOWNOnUp:
;Controller_events_code.c,1562 :: 		void Delay_trv_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1563 :: 		Image309.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1564 :: 		Delay_trv_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1565 :: 		DrawImage(&Delay_trv_DOWN);
MOVW	R0, #lo_addr(_Delay_trv_DOWN+0)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1566 :: 		}
L_end_Delay_trv_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_DOWNOnUp
_Delay_trv_DOWNOnPress:
;Controller_events_code.c,1567 :: 		void Delay_trv_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1570 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1571 :: 		Image309.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1572 :: 		Delay_trv_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1573 :: 		DrawImage(&Image309);
MOVW	R0, #lo_addr(_Image309+0)
MOVT	R0, #hi_addr(_Image309+0)
BL	_DrawImage+0
;Controller_events_code.c,1576 :: 		system_reg[TRV_DEL]--;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1577 :: 		if (system_reg[TRV_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_trv_DOWNOnPress210
;Controller_events_code.c,1578 :: 		system_reg[TRV_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_DOWNOnPress210:
;Controller_events_code.c,1579 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1580 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1581 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1582 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1583 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_trv_DOWNOnPress211:
SUBS	R7, R7, #1
BNE	L_Delay_trv_DOWNOnPress211
NOP
NOP
NOP
;Controller_events_code.c,1584 :: 		}
L_end_Delay_trv_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_DOWNOnPress
_Delay_trv_UPOnUp:
;Controller_events_code.c,1585 :: 		void Delay_trv_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1586 :: 		Image315.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1587 :: 		Delay_trv_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1588 :: 		DrawImage(&Delay_trv_up);
MOVW	R0, #lo_addr(_Delay_trv_up+0)
MOVT	R0, #hi_addr(_Delay_trv_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1589 :: 		}
L_end_Delay_trv_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_UPOnUp
_Delay_trv_UPOnPress:
;Controller_events_code.c,1590 :: 		void Delay_trv_UPOnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1593 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1594 :: 		Image315.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1595 :: 		Delay_trv_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1596 :: 		DrawImage(&Image315);
MOVW	R0, #lo_addr(_Image315+0)
MOVT	R0, #hi_addr(_Image315+0)
BL	_DrawImage+0
;Controller_events_code.c,1599 :: 		system_reg[TRV_DEL]++;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1600 :: 		if (system_reg[TRV_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_trv_UPOnPress213
;Controller_events_code.c,1601 :: 		system_reg[TRV_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_UPOnPress213:
;Controller_events_code.c,1602 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1603 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1604 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1605 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1606 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_trv_UPOnPress214:
SUBS	R7, R7, #1
BNE	L_Delay_trv_UPOnPress214
NOP
NOP
NOP
;Controller_events_code.c,1607 :: 		}
L_end_Delay_trv_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_UPOnPress
_Delay_EEV_SETOnUp:
;Controller_events_code.c,1608 :: 		void Delay_EEV_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1609 :: 		Delay_EEV_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1610 :: 		Image347.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1611 :: 		DrawImage (&Delay_EEV_SET);
MOVW	R0, #lo_addr(_Delay_EEV_SET+0)
MOVT	R0, #hi_addr(_Delay_EEV_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1612 :: 		}
L_end_Delay_EEV_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnUp
_Delay_EEV_SETOnDown:
;Controller_events_code.c,1613 :: 		void Delay_EEV_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1614 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1618 :: 		send_data_packet(TRV_DEL,1);
MOVS	R1, #1
MOVW	R0, #420
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1619 :: 		Delay_EEV_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1620 :: 		Image347.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1621 :: 		DrawImage (&Image347);
MOVW	R0, #lo_addr(_Image347+0)
MOVT	R0, #hi_addr(_Image347+0)
BL	_DrawImage+0
;Controller_events_code.c,1622 :: 		}
L_end_Delay_EEV_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnDown
_Delay_DHW_valve_DOWNOnUp:
;Controller_events_code.c,1624 :: 		void Delay_DHW_valve_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1625 :: 		Image310.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1626 :: 		Delay_DHW_valve_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1627 :: 		DrawImage(&Delay_DHW_valve_DOWN);
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1628 :: 		}
L_end_Delay_DHW_valve_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_DOWNOnUp
_Delay_DHW_valve_DOWNOnPress:
;Controller_events_code.c,1629 :: 		void Delay_DHW_valve_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1632 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1633 :: 		Image310.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1634 :: 		Delay_DHW_valve_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1635 :: 		DrawImage(&Image310);
MOVW	R0, #lo_addr(_Image310+0)
MOVT	R0, #hi_addr(_Image310+0)
BL	_DrawImage+0
;Controller_events_code.c,1638 :: 		system_reg[THREE_WAY_DEL]--;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1639 :: 		if (system_reg[THREE_WAY_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_DHW_valve_DOWNOnPress216
;Controller_events_code.c,1640 :: 		system_reg[THREE_WAY_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_DOWNOnPress216:
;Controller_events_code.c,1641 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1642 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1643 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1644 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1645 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_DHW_valve_DOWNOnPress217:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_DOWNOnPress217
NOP
NOP
NOP
;Controller_events_code.c,1646 :: 		}
L_end_Delay_DHW_valve_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_DOWNOnPress
_Delay_DHW_valve_UPOnUp:
;Controller_events_code.c,1647 :: 		void Delay_DHW_valve_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1648 :: 		Image316.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1649 :: 		Delay_DHW_valve_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1650 :: 		DrawImage(&Delay_DHW_valve_UP);
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1651 :: 		}
L_end_Delay_DHW_valve_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_UPOnUp
_Delay_DHW_valve_UPOnPress:
;Controller_events_code.c,1652 :: 		void Delay_DHW_valve_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1655 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1656 :: 		Image316.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1657 :: 		Delay_DHW_valve_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1658 :: 		DrawImage(&Image316);
MOVW	R0, #lo_addr(_Image316+0)
MOVT	R0, #hi_addr(_Image316+0)
BL	_DrawImage+0
;Controller_events_code.c,1661 :: 		system_reg[THREE_WAY_DEL]++;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1662 :: 		if (system_reg[THREE_WAY_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_DHW_valve_UPOnPress219
;Controller_events_code.c,1663 :: 		system_reg[THREE_WAY_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_UPOnPress219:
;Controller_events_code.c,1664 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1665 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1666 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1667 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1668 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_DHW_valve_UPOnPress220:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_UPOnPress220
NOP
NOP
NOP
;Controller_events_code.c,1669 :: 		}
L_end_Delay_DHW_valve_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_UPOnPress
_Delay_DHW_valve_SETOnUp:
;Controller_events_code.c,1670 :: 		void Delay_DHW_valve_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1671 :: 		Delay_DHW_valve_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1672 :: 		Image348.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1673 :: 		DrawImage (&Delay_DHW_valve_SET);
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1674 :: 		}
L_end_Delay_DHW_valve_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnUp
_Delay_DHW_valve_SETOnDown:
;Controller_events_code.c,1675 :: 		void Delay_DHW_valve_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1676 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1680 :: 		send_data_packet(THREE_WAY_DEL,1);
MOVS	R1, #1
MOVW	R0, #50
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1681 :: 		Delay_DHW_valve_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1682 :: 		Image348.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1683 :: 		DrawImage (&Image348);
MOVW	R0, #lo_addr(_Image348+0)
MOVT	R0, #hi_addr(_Image348+0)
BL	_DrawImage+0
;Controller_events_code.c,1684 :: 		}
L_end_Delay_DHW_valve_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnDown
_Delay_compressor_DOWNOnUp:
;Controller_events_code.c,1686 :: 		void Delay_compressor_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1687 :: 		Image311.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1688 :: 		Delay_compressor_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1689 :: 		DrawImage(&Delay_compressor_DOWN);
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+0)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1690 :: 		}
L_end_Delay_compressor_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_DOWNOnUp
_Delay_compressor_DOWNOnPress:
;Controller_events_code.c,1691 :: 		void Delay_compressor_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1694 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1695 :: 		Image311.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1696 :: 		Delay_compressor_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1697 :: 		DrawImage(&Image311);
MOVW	R0, #lo_addr(_Image311+0)
MOVT	R0, #hi_addr(_Image311+0)
BL	_DrawImage+0
;Controller_events_code.c,1700 :: 		system_reg[COMP_DEL]--;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1701 :: 		if (system_reg[COMP_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_compressor_DOWNOnPress222
;Controller_events_code.c,1702 :: 		system_reg[COMP_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_DOWNOnPress222:
;Controller_events_code.c,1703 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1704 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1705 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1706 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1707 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_compressor_DOWNOnPress223:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_DOWNOnPress223
NOP
NOP
NOP
;Controller_events_code.c,1708 :: 		}
L_end_Delay_compressor_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_DOWNOnPress
_Delay_compressor_UPOnUp:
;Controller_events_code.c,1709 :: 		void Delay_compressor_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1710 :: 		Image317.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1711 :: 		Delay_compressor_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1712 :: 		DrawImage(&Delay_compressor_UP);
MOVW	R0, #lo_addr(_Delay_compressor_UP+0)
MOVT	R0, #hi_addr(_Delay_compressor_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1713 :: 		}
L_end_Delay_compressor_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_UPOnUp
_Delay_compressor_UPOnPress:
;Controller_events_code.c,1714 :: 		void Delay_compressor_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1717 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1718 :: 		Image317.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1719 :: 		Delay_compressor_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1720 :: 		DrawImage(&Image317);
MOVW	R0, #lo_addr(_Image317+0)
MOVT	R0, #hi_addr(_Image317+0)
BL	_DrawImage+0
;Controller_events_code.c,1723 :: 		system_reg[COMP_DEL]++;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1724 :: 		if (system_reg[COMP_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_compressor_UPOnPress225
;Controller_events_code.c,1725 :: 		system_reg[COMP_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_UPOnPress225:
;Controller_events_code.c,1726 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1727 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1728 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1729 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1730 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Delay_compressor_UPOnPress226:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_UPOnPress226
NOP
NOP
NOP
;Controller_events_code.c,1731 :: 		}
L_end_Delay_compressor_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_UPOnPress
_Delay_compressor_SETOnUp:
;Controller_events_code.c,1732 :: 		void Delay_compressor_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1733 :: 		Delay_compressor_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1734 :: 		Image349.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1735 :: 		DrawImage (&Delay_compressor_SET);
MOVW	R0, #lo_addr(_Delay_compressor_SET+0)
MOVT	R0, #hi_addr(_Delay_compressor_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1736 :: 		}
L_end_Delay_compressor_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnUp
_Delay_compressor_SETOnDown:
;Controller_events_code.c,1737 :: 		void Delay_compressor_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1738 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1742 :: 		send_data_packet(COMP_DEL,1);
MOVS	R1, #1
MOVW	R0, #10
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1743 :: 		Delay_compressor_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1744 :: 		Image349.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1745 :: 		DrawImage (&Image349);
MOVW	R0, #lo_addr(_Image349+0)
MOVT	R0, #hi_addr(_Image349+0)
BL	_DrawImage+0
;Controller_events_code.c,1746 :: 		}
L_end_Delay_compressor_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnDown
_Down_1_OnUp:
;Controller_events_code.c,1749 :: 		void Down_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1750 :: 		Image200.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1751 :: 		Down_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1752 :: 		DrawImage(&Down_1_);
MOVW	R0, #lo_addr(_Down_1_+0)
MOVT	R0, #hi_addr(_Down_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1753 :: 		}
L_end_Down_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_1_OnUp
_Down_1_OnPress:
;Controller_events_code.c,1754 :: 		void Down_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1756 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1757 :: 		Image200.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1758 :: 		Down_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1759 :: 		DrawImage(&Image200);
MOVW	R0, #lo_addr(_Image200+0)
MOVT	R0, #hi_addr(_Image200+0)
BL	_DrawImage+0
;Controller_events_code.c,1760 :: 		system_reg[HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1761 :: 		if (system_reg[HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_1_OnPress228
;Controller_events_code.c,1762 :: 		system_reg[HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Down_1_OnPress228:
;Controller_events_code.c,1763 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1764 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1765 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1766 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1767 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_1_OnPress229:
SUBS	R7, R7, #1
BNE	L_Down_1_OnPress229
NOP
NOP
NOP
;Controller_events_code.c,1768 :: 		}
L_end_Down_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_1_OnPress
_Up_1_OnUp:
;Controller_events_code.c,1769 :: 		void Up_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1770 :: 		Image218.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1771 :: 		Up_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1772 :: 		DrawImage(&Up_1_);
MOVW	R0, #lo_addr(_Up_1_+0)
MOVT	R0, #hi_addr(_Up_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1773 :: 		}
L_end_Up_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_1_OnUp
_Up_1_OnPress:
;Controller_events_code.c,1774 :: 		void Up_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1776 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1777 :: 		Image218.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1778 :: 		Up_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1779 :: 		DrawImage(&Image218);
MOVW	R0, #lo_addr(_Image218+0)
MOVT	R0, #hi_addr(_Image218+0)
BL	_DrawImage+0
;Controller_events_code.c,1780 :: 		system_reg[HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1781 :: 		if (system_reg[HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_1_OnPress231
;Controller_events_code.c,1782 :: 		system_reg[HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Up_1_OnPress231:
;Controller_events_code.c,1783 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1784 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1785 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1786 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1787 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_1_OnPress232:
SUBS	R7, R7, #1
BNE	L_Up_1_OnPress232
NOP
NOP
NOP
;Controller_events_code.c,1788 :: 		}
L_end_Up_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_1_OnPress
_Down_2_OnUp:
;Controller_events_code.c,1789 :: 		void Down_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1790 :: 		Image205.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1791 :: 		Down_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1792 :: 		DrawImage(&Down_2_);
MOVW	R0, #lo_addr(_Down_2_+0)
MOVT	R0, #hi_addr(_Down_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1793 :: 		}
L_end_Down_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_2_OnUp
_Down_2_OnPress:
;Controller_events_code.c,1795 :: 		void Down_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1797 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1798 :: 		Image205.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1799 :: 		Down_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1800 :: 		DrawImage(&Image205);
MOVW	R0, #lo_addr(_Image205+0)
MOVT	R0, #hi_addr(_Image205+0)
BL	_DrawImage+0
;Controller_events_code.c,1802 :: 		system_reg[HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1803 :: 		if (system_reg[HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_2_OnPress234
;Controller_events_code.c,1804 :: 		system_reg[HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Down_2_OnPress234:
;Controller_events_code.c,1805 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1806 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1807 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1808 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1809 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_2_OnPress235:
SUBS	R7, R7, #1
BNE	L_Down_2_OnPress235
NOP
NOP
NOP
;Controller_events_code.c,1810 :: 		}
L_end_Down_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_2_OnPress
_Up_2_OnPress:
;Controller_events_code.c,1811 :: 		void Up_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1813 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1814 :: 		Image219.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1815 :: 		Up_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1816 :: 		DrawImage(&Image219);
MOVW	R0, #lo_addr(_Image219+0)
MOVT	R0, #hi_addr(_Image219+0)
BL	_DrawImage+0
;Controller_events_code.c,1818 :: 		system_reg[HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1819 :: 		if (system_reg[HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_2_OnPress237
;Controller_events_code.c,1820 :: 		system_reg[HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Up_2_OnPress237:
;Controller_events_code.c,1821 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1822 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1823 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1824 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1825 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_2_OnPress238:
SUBS	R7, R7, #1
BNE	L_Up_2_OnPress238
NOP
NOP
NOP
;Controller_events_code.c,1826 :: 		}
L_end_Up_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_2_OnPress
_Up_2_OnUp:
;Controller_events_code.c,1827 :: 		void Up_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1828 :: 		Image219.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1829 :: 		Up_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1830 :: 		DrawImage(&Up_2_);
MOVW	R0, #lo_addr(_Up_2_+0)
MOVT	R0, #hi_addr(_Up_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1831 :: 		}
L_end_Up_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_2_OnUp
_Down_3_OnPress:
;Controller_events_code.c,1833 :: 		void Down_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1835 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1836 :: 		Image206.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1837 :: 		Down_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1838 :: 		DrawImage(&Image206);
MOVW	R0, #lo_addr(_Image206+0)
MOVT	R0, #hi_addr(_Image206+0)
BL	_DrawImage+0
;Controller_events_code.c,1840 :: 		system_reg[EXAUST_MAX]--;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1841 :: 		if (system_reg[EXAUST_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_3_OnPress240
;Controller_events_code.c,1842 :: 		system_reg[EXAUST_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Down_3_OnPress240:
;Controller_events_code.c,1843 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1844 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1845 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1846 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1847 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_3_OnPress241:
SUBS	R7, R7, #1
BNE	L_Down_3_OnPress241
NOP
NOP
NOP
;Controller_events_code.c,1848 :: 		}
L_end_Down_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_3_OnPress
_Down_3_OnUp:
;Controller_events_code.c,1849 :: 		void Down_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1850 :: 		Image206.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1851 :: 		Down_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1852 :: 		DrawImage(&Down_3_);
MOVW	R0, #lo_addr(_Down_3_+0)
MOVT	R0, #hi_addr(_Down_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1853 :: 		}
L_end_Down_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_3_OnUp
_Up_3_OnPress:
;Controller_events_code.c,1854 :: 		void Up_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1856 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1857 :: 		Image220.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1858 :: 		Up_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1859 :: 		DrawImage(&Image220);
MOVW	R0, #lo_addr(_Image220+0)
MOVT	R0, #hi_addr(_Image220+0)
BL	_DrawImage+0
;Controller_events_code.c,1860 :: 		system_reg[EXAUST_MAX]++;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1861 :: 		if(system_reg[EXAUST_MAX]>115)
CMP	R0, #115
IT	LE
BLE	L_Up_3_OnPress243
;Controller_events_code.c,1862 :: 		system_reg[EXAUST_MAX] = 115;
MOVS	R1, #115
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Up_3_OnPress243:
;Controller_events_code.c,1863 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1864 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1865 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1866 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1867 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_3_OnPress244:
SUBS	R7, R7, #1
BNE	L_Up_3_OnPress244
NOP
NOP
NOP
;Controller_events_code.c,1868 :: 		}
L_end_Up_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_3_OnPress
_Up_3_OnUp:
;Controller_events_code.c,1869 :: 		void Up_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1870 :: 		Image220.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1871 :: 		Up_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1872 :: 		DrawImage(&Up_3_);
MOVW	R0, #lo_addr(_Up_3_+0)
MOVT	R0, #hi_addr(_Up_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,1873 :: 		}
L_end_Up_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_3_OnUp
_Down_4_OnPress:
;Controller_events_code.c,1874 :: 		void Down_4_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1876 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1877 :: 		Image207.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1878 :: 		Down_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1879 :: 		DrawImage(&Image207);
MOVW	R0, #lo_addr(_Image207+0)
MOVT	R0, #hi_addr(_Image207+0)
BL	_DrawImage+0
;Controller_events_code.c,1881 :: 		system_reg[SOURS_MIN]--;
MOVW	R2, #lo_addr(_system_reg+880)
MOVT	R2, #hi_addr(_system_reg+880)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,1882 :: 		if (system_reg[SOURS_MIN] < -10)
MVN	R0, #9
CMP	R1, R0
IT	GE
BGE	L_Down_4_OnPress246
;Controller_events_code.c,1883 :: 		system_reg[SOURS_MIN] = -10;
MOVW	R1, #65526
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Down_4_OnPress246:
;Controller_events_code.c,1884 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1885 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1886 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1887 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1888 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_4_OnPress247:
SUBS	R7, R7, #1
BNE	L_Down_4_OnPress247
NOP
NOP
NOP
;Controller_events_code.c,1889 :: 		}
L_end_Down_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_4_OnPress
_Up_4_OnPress:
;Controller_events_code.c,1890 :: 		void Up_4_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1892 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1893 :: 		Image221.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1894 :: 		Up_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1895 :: 		DrawImage(&Image221);
MOVW	R0, #lo_addr(_Image221+0)
MOVT	R0, #hi_addr(_Image221+0)
BL	_DrawImage+0
;Controller_events_code.c,1897 :: 		system_reg[SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+880)
MOVT	R1, #hi_addr(_system_reg+880)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1898 :: 		if (system_reg[SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_4_OnPress249
;Controller_events_code.c,1899 :: 		system_reg[SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Up_4_OnPress249:
;Controller_events_code.c,1900 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1901 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1902 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1903 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1904 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_4_OnPress250:
SUBS	R7, R7, #1
BNE	L_Up_4_OnPress250
NOP
NOP
NOP
;Controller_events_code.c,1906 :: 		}
L_end_Up_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_4_OnPress
_Down_4_OnUp:
;Controller_events_code.c,1907 :: 		void Down_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1908 :: 		Image207.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1909 :: 		Down_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1910 :: 		DrawImage(&Down_4_);
MOVW	R0, #lo_addr(_Down_4_+0)
MOVT	R0, #hi_addr(_Down_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1911 :: 		}
L_end_Down_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_4_OnUp
_Up_4_OnUp:
;Controller_events_code.c,1912 :: 		void Up_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1913 :: 		Image221.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1914 :: 		Up_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1915 :: 		DrawImage(&Up_4_);
MOVW	R0, #lo_addr(_Up_4_+0)
MOVT	R0, #hi_addr(_Up_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,1916 :: 		}
L_end_Up_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_4_OnUp
_Down_5_OnUp:
;Controller_events_code.c,1917 :: 		void Down_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1918 :: 		Image208.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1919 :: 		Down_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1920 :: 		DrawImage(&Down_5_);
MOVW	R0, #lo_addr(_Down_5_+0)
MOVT	R0, #hi_addr(_Down_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,1921 :: 		}
L_end_Down_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_5_OnUp
_Down_5_OnPress:
;Controller_events_code.c,1922 :: 		void Down_5_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1924 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1925 :: 		Image208.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1926 :: 		Down_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1927 :: 		DrawImage(&Image208);
MOVW	R0, #lo_addr(_Image208+0)
MOVT	R0, #hi_addr(_Image208+0)
BL	_DrawImage+0
;Controller_events_code.c,1928 :: 		system_reg[SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1929 :: 		if (system_reg[SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_5_OnPress252
;Controller_events_code.c,1930 :: 		system_reg[SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Down_5_OnPress252:
;Controller_events_code.c,1931 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1932 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1933 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1934 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1935 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_5_OnPress253:
SUBS	R7, R7, #1
BNE	L_Down_5_OnPress253
NOP
NOP
NOP
;Controller_events_code.c,1936 :: 		}
L_end_Down_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_5_OnPress
_Up_5_OnPress:
;Controller_events_code.c,1937 :: 		void Up_5_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1939 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1940 :: 		Image222.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1941 :: 		Up_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1942 :: 		DrawImage(&Image222);
MOVW	R0, #lo_addr(_Image222+0)
MOVT	R0, #hi_addr(_Image222+0)
BL	_DrawImage+0
;Controller_events_code.c,1943 :: 		system_reg[SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1944 :: 		if (system_reg[SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_5_OnPress255
;Controller_events_code.c,1945 :: 		system_reg[SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Up_5_OnPress255:
;Controller_events_code.c,1946 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1947 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1948 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1949 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1950 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_5_OnPress256:
SUBS	R7, R7, #1
BNE	L_Up_5_OnPress256
NOP
NOP
NOP
;Controller_events_code.c,1951 :: 		}
L_end_Up_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_5_OnPress
_Up_5_OnUp:
;Controller_events_code.c,1952 :: 		void Up_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1953 :: 		Image222.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1954 :: 		Up_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1955 :: 		DrawImage(&Up_5_);
MOVW	R0, #lo_addr(_Up_5_+0)
MOVT	R0, #hi_addr(_Up_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,1956 :: 		}
L_end_Up_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_5_OnUp
_Down_6_OnPress:
;Controller_events_code.c,1957 :: 		void Down_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1959 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1960 :: 		Image209.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1961 :: 		Down_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1962 :: 		DrawImage(&Image209);
MOVW	R0, #lo_addr(_Image209+0)
MOVT	R0, #hi_addr(_Image209+0)
BL	_DrawImage+0
;Controller_events_code.c,1963 :: 		system_reg[DEL_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1964 :: 		if (system_reg[DEL_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_6_OnPress258
;Controller_events_code.c,1965 :: 		system_reg[DEL_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Down_6_OnPress258:
;Controller_events_code.c,1966 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1967 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1968 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1969 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1970 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_6_OnPress259:
SUBS	R7, R7, #1
BNE	L_Down_6_OnPress259
NOP
NOP
NOP
;Controller_events_code.c,1971 :: 		}
L_end_Down_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_6_OnPress
_Down_6_OnUp:
;Controller_events_code.c,1972 :: 		void Down_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1973 :: 		Image209.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1974 :: 		Down_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1975 :: 		DrawImage(&Down_6_);
MOVW	R0, #lo_addr(_Down_6_+0)
MOVT	R0, #hi_addr(_Down_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,1976 :: 		}
L_end_Down_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_6_OnUp
_Up_6_OnPress:
;Controller_events_code.c,1977 :: 		void Up_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1979 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1980 :: 		Image223.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1981 :: 		Up_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1982 :: 		DrawImage(&Image223);
MOVW	R0, #lo_addr(_Image223+0)
MOVT	R0, #hi_addr(_Image223+0)
BL	_DrawImage+0
;Controller_events_code.c,1983 :: 		system_reg[DEL_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1984 :: 		if (system_reg[DEL_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_6_OnPress261
;Controller_events_code.c,1985 :: 		system_reg[DEL_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Up_6_OnPress261:
;Controller_events_code.c,1986 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1987 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1988 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1989 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1990 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_6_OnPress262:
SUBS	R7, R7, #1
BNE	L_Up_6_OnPress262
NOP
NOP
NOP
;Controller_events_code.c,1991 :: 		}
L_end_Up_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_6_OnPress
_Up_6_OnUp:
;Controller_events_code.c,1992 :: 		void Up_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1993 :: 		Image223.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1994 :: 		Up_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1995 :: 		DrawImage(&Up_6_);
MOVW	R0, #lo_addr(_Up_6_+0)
MOVT	R0, #hi_addr(_Up_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,1996 :: 		}
L_end_Up_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_6_OnUp
_Set_1_OnDown:
;Controller_events_code.c,1997 :: 		void Set_1_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1998 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2002 :: 		send_data_packet(HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #90
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2003 :: 		Set_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2004 :: 		Image246.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2005 :: 		DrawImage (&Image246);
MOVW	R0, #lo_addr(_Image246+0)
MOVT	R0, #hi_addr(_Image246+0)
BL	_DrawImage+0
;Controller_events_code.c,2006 :: 		}
L_end_Set_1_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnDown
_Set_1_OnUp:
;Controller_events_code.c,2007 :: 		void Set_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2008 :: 		Set_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2009 :: 		Image246.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2010 :: 		DrawImage (&Set_1_);
MOVW	R0, #lo_addr(_Set_1_+0)
MOVT	R0, #hi_addr(_Set_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,2011 :: 		}
L_end_Set_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnUp
_Set_2_OnDown:
;Controller_events_code.c,2012 :: 		void Set_2_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2013 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2017 :: 		send_data_packet(HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #80
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2018 :: 		Set_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2019 :: 		Image247.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2020 :: 		DrawImage (&Image247);
MOVW	R0, #lo_addr(_Image247+0)
MOVT	R0, #hi_addr(_Image247+0)
BL	_DrawImage+0
;Controller_events_code.c,2021 :: 		}
L_end_Set_2_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnDown
_Set_2_OnUp:
;Controller_events_code.c,2022 :: 		void Set_2_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2023 :: 		Set_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2024 :: 		Image247.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2025 :: 		DrawImage (&Set_2_);
MOVW	R0, #lo_addr(_Set_2_+0)
MOVT	R0, #hi_addr(_Set_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,2026 :: 		}
L_end_Set_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnUp
_Set_3_OnDown:
;Controller_events_code.c,2028 :: 		void Set_3_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2029 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2033 :: 		send_data_packet(EXAUST_MAX,1);
MOVS	R1, #1
MOVW	R0, #180
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2034 :: 		Set_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2035 :: 		Image248.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2036 :: 		DrawImage (&Image248);
MOVW	R0, #lo_addr(_Image248+0)
MOVT	R0, #hi_addr(_Image248+0)
BL	_DrawImage+0
;Controller_events_code.c,2037 :: 		}
L_end_Set_3_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnDown
_Set_3_OnUp:
;Controller_events_code.c,2038 :: 		void Set_3_OnUp()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2039 :: 		Set_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2040 :: 		Image248.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2041 :: 		DrawImage (&Set_3_);
MOVW	R0, #lo_addr(_Set_3_+0)
MOVT	R0, #hi_addr(_Set_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,2042 :: 		}
L_end_Set_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnUp
_Set_4_OnDown:
;Controller_events_code.c,2043 :: 		void Set_4_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2044 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2048 :: 		send_data_packet(SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #440
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2049 :: 		Set_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2050 :: 		Image249.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2051 :: 		DrawImage (&Image249);
MOVW	R0, #lo_addr(_Image249+0)
MOVT	R0, #hi_addr(_Image249+0)
BL	_DrawImage+0
;Controller_events_code.c,2052 :: 		}
L_end_Set_4_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnDown
_Set_4_OnUp:
;Controller_events_code.c,2054 :: 		void Set_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2055 :: 		Set_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2056 :: 		Image249.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2057 :: 		DrawImage (&Set_4_);
MOVW	R0, #lo_addr(_Set_4_+0)
MOVT	R0, #hi_addr(_Set_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,2058 :: 		}
L_end_Set_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnUp
_Set_5_OnDown:
;Controller_events_code.c,2060 :: 		void Set_5_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2061 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2065 :: 		send_data_packet(SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #430
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2066 :: 		Set_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2067 :: 		Image250.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2068 :: 		DrawImage (&Image250);
MOVW	R0, #lo_addr(_Image250+0)
MOVT	R0, #hi_addr(_Image250+0)
BL	_DrawImage+0
;Controller_events_code.c,2069 :: 		}
L_end_Set_5_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnDown
_Set_5_OnUp:
;Controller_events_code.c,2070 :: 		void Set_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2071 :: 		Set_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2072 :: 		Image250.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2073 :: 		DrawImage (&Set_5_);
MOVW	R0, #lo_addr(_Set_5_+0)
MOVT	R0, #hi_addr(_Set_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2074 :: 		}
L_end_Set_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnUp
_Furnance_HP_OFF_save_ondown:
;Controller_events_code.c,2075 :: 		void Furnance_HP_OFF_save_ondown() {
;Controller_events_code.c,2077 :: 		}
L_end_Furnance_HP_OFF_save_ondown:
BX	LR
; end of _Furnance_HP_OFF_save_ondown
_Set_6_OnUp:
;Controller_events_code.c,2078 :: 		void Set_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2079 :: 		Set_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2080 :: 		Image251.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2081 :: 		DrawImage (&Set_6_);
MOVW	R0, #lo_addr(_Set_6_+0)
MOVT	R0, #hi_addr(_Set_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2082 :: 		}
L_end_Set_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnUp
_Set_6_OnDown:
;Controller_events_code.c,2083 :: 		void Set_6_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2084 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2088 :: 		send_data_packet(DEL_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #110
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2089 :: 		Set_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2090 :: 		Image251.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2091 :: 		DrawImage (&Image251);
MOVW	R0, #lo_addr(_Image251+0)
MOVT	R0, #hi_addr(_Image251+0)
BL	_DrawImage+0
;Controller_events_code.c,2092 :: 		}
L_end_Set_6_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnDown
_Down_7_OnUp:
;Controller_events_code.c,2094 :: 		void Down_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2095 :: 		Image210.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2096 :: 		Down_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2097 :: 		DrawImage(&Down_7_);
MOVW	R0, #lo_addr(_Down_7_+0)
MOVT	R0, #hi_addr(_Down_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2098 :: 		}
L_end_Down_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_7_OnUp
_Down_7_OnPress:
;Controller_events_code.c,2099 :: 		void Down_7_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2101 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2102 :: 		Image210.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2103 :: 		Down_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2104 :: 		DrawImage(&Image210);
MOVW	R0, #lo_addr(_Image210+0)
MOVT	R0, #hi_addr(_Image210+0)
BL	_DrawImage+0
;Controller_events_code.c,2105 :: 		system_reg[DEL_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2106 :: 		if (system_reg[DEL_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_7_OnPress264
;Controller_events_code.c,2107 :: 		system_reg[DEL_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Down_7_OnPress264:
;Controller_events_code.c,2108 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2109 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2110 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2111 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2112 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_7_OnPress265:
SUBS	R7, R7, #1
BNE	L_Down_7_OnPress265
NOP
NOP
NOP
;Controller_events_code.c,2113 :: 		}
L_end_Down_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_7_OnPress
_Up_7_OnPress:
;Controller_events_code.c,2115 :: 		void Up_7_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2117 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2118 :: 		Image224.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2119 :: 		Up_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2120 :: 		DrawImage(&Image224);
MOVW	R0, #lo_addr(_Image224+0)
MOVT	R0, #hi_addr(_Image224+0)
BL	_DrawImage+0
;Controller_events_code.c,2121 :: 		system_reg[DEL_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2122 :: 		if (system_reg[DEL_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_7_OnPress267
;Controller_events_code.c,2123 :: 		system_reg[DEL_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Up_7_OnPress267:
;Controller_events_code.c,2124 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2125 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2126 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2127 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2128 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_7_OnPress268:
SUBS	R7, R7, #1
BNE	L_Up_7_OnPress268
NOP
NOP
NOP
;Controller_events_code.c,2130 :: 		}
L_end_Up_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_7_OnPress
_Up_7_OnUp:
;Controller_events_code.c,2132 :: 		void Up_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2133 :: 		Image224.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2134 :: 		Up_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2135 :: 		DrawImage(&Up_7_);
MOVW	R0, #lo_addr(_Up_7_+0)
MOVT	R0, #hi_addr(_Up_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2137 :: 		}
L_end_Up_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_7_OnUp
_Down_8_OnPress:
;Controller_events_code.c,2139 :: 		void Down_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2141 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2142 :: 		Image211.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2143 :: 		Down_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2144 :: 		DrawImage(&Image211);
MOVW	R0, #lo_addr(_Image211+0)
MOVT	R0, #hi_addr(_Image211+0)
BL	_DrawImage+0
;Controller_events_code.c,2145 :: 		system_reg[DEL_DHW_MIN]--;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2146 :: 		if (system_reg[DEL_DHW_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_8_OnPress270
;Controller_events_code.c,2147 :: 		system_reg[DEL_DHW_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Down_8_OnPress270:
;Controller_events_code.c,2148 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2149 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2150 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2151 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2152 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_8_OnPress271:
SUBS	R7, R7, #1
BNE	L_Down_8_OnPress271
NOP
NOP
NOP
;Controller_events_code.c,2153 :: 		}
L_end_Down_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_8_OnPress
_Down_8_OnUp:
;Controller_events_code.c,2155 :: 		void Down_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2156 :: 		Image211.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2157 :: 		Down_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2158 :: 		DrawImage(&Down_8_);
MOVW	R0, #lo_addr(_Down_8_+0)
MOVT	R0, #hi_addr(_Down_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2159 :: 		}
L_end_Down_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_8_OnUp
_Up_8_OnPress:
;Controller_events_code.c,2161 :: 		void Up_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2163 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2164 :: 		Image225.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2165 :: 		Up_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2166 :: 		DrawImage(&Image225);
MOVW	R0, #lo_addr(_Image225+0)
MOVT	R0, #hi_addr(_Image225+0)
BL	_DrawImage+0
;Controller_events_code.c,2167 :: 		system_reg[DEL_DHW_MIN]++;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2168 :: 		if (system_reg[DEL_DHW_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_8_OnPress273
;Controller_events_code.c,2169 :: 		system_reg[DEL_DHW_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Up_8_OnPress273:
;Controller_events_code.c,2170 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2171 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2172 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2173 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2174 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_8_OnPress274:
SUBS	R7, R7, #1
BNE	L_Up_8_OnPress274
NOP
NOP
NOP
;Controller_events_code.c,2175 :: 		}
L_end_Up_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_8_OnPress
_Up_8_OnUp:
;Controller_events_code.c,2177 :: 		void Up_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2178 :: 		Image225.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2179 :: 		Up_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2180 :: 		DrawImage(&Up_8_);
MOVW	R0, #lo_addr(_Up_8_+0)
MOVT	R0, #hi_addr(_Up_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2181 :: 		}
L_end_Up_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_8_OnUp
_Down_9_OnPress:
;Controller_events_code.c,2183 :: 		void Down_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2185 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2186 :: 		Image214.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2187 :: 		Down_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2188 :: 		DrawImage(&Image214);
MOVW	R0, #lo_addr(_Image214+0)
MOVT	R0, #hi_addr(_Image214+0)
BL	_DrawImage+0
;Controller_events_code.c,2189 :: 		system_reg[DEL_DHW_MAX]--;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2190 :: 		if (system_reg[DEL_DHW_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_9_OnPress276
;Controller_events_code.c,2191 :: 		system_reg[DEL_DHW_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Down_9_OnPress276:
;Controller_events_code.c,2192 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2193 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2194 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2195 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2196 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_9_OnPress277:
SUBS	R7, R7, #1
BNE	L_Down_9_OnPress277
NOP
NOP
NOP
;Controller_events_code.c,2197 :: 		}
L_end_Down_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_9_OnPress
_Down_9_OnUp:
;Controller_events_code.c,2199 :: 		void Down_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2200 :: 		Image214.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2201 :: 		Down_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2202 :: 		DrawImage(&Down_9_);
MOVW	R0, #lo_addr(_Down_9_+0)
MOVT	R0, #hi_addr(_Down_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2203 :: 		}
L_end_Down_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_9_OnUp
_Up_9_OnPress:
;Controller_events_code.c,2205 :: 		void Up_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2207 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2208 :: 		Image228.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2209 :: 		Up_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2210 :: 		DrawImage(&Image228);
MOVW	R0, #lo_addr(_Image228+0)
MOVT	R0, #hi_addr(_Image228+0)
BL	_DrawImage+0
;Controller_events_code.c,2211 :: 		system_reg[DEL_DHW_MAX]++;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2212 :: 		if (system_reg[DEL_DHW_MAX] > 99)
CMP	R0, #99
IT	LE
BLE	L_Up_9_OnPress279
;Controller_events_code.c,2213 :: 		system_reg[DEL_DHW_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Up_9_OnPress279:
;Controller_events_code.c,2214 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2215 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2216 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2217 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2218 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_9_OnPress280:
SUBS	R7, R7, #1
BNE	L_Up_9_OnPress280
NOP
NOP
NOP
;Controller_events_code.c,2219 :: 		}
L_end_Up_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_9_OnPress
_Up_9_OnUp:
;Controller_events_code.c,2221 :: 		void Up_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2222 :: 		Image228.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2223 :: 		Up_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2224 :: 		DrawImage(&Up_9_);
MOVW	R0, #lo_addr(_Up_9_+0)
MOVT	R0, #hi_addr(_Up_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2225 :: 		}
L_end_Up_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_9_OnUp
_Down_10_OnPress:
;Controller_events_code.c,2226 :: 		void Down_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2228 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2229 :: 		Image212.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2230 :: 		Down_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2231 :: 		DrawImage(&Image212);
MOVW	R0, #lo_addr(_Image212+0)
MOVT	R0, #hi_addr(_Image212+0)
BL	_DrawImage+0
;Controller_events_code.c,2232 :: 		system_reg[DEL_SOURS_MIN]--;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2233 :: 		if (system_reg[DEL_SOURS_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_10_OnPress282
;Controller_events_code.c,2234 :: 		system_reg[DEL_SOURS_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Down_10_OnPress282:
;Controller_events_code.c,2235 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2236 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2237 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2238 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2239 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_10_OnPress283:
SUBS	R7, R7, #1
BNE	L_Down_10_OnPress283
NOP
NOP
NOP
;Controller_events_code.c,2240 :: 		}
L_end_Down_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_10_OnPress
_Down_10_OnUp:
;Controller_events_code.c,2242 :: 		void Down_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2243 :: 		Image212.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2244 :: 		Down_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2245 :: 		DrawImage(&Down_10_);
MOVW	R0, #lo_addr(_Down_10_+0)
MOVT	R0, #hi_addr(_Down_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2246 :: 		}
L_end_Down_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_10_OnUp
_Up_10_OnPress:
;Controller_events_code.c,2248 :: 		void Up_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2250 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2251 :: 		Image226.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2252 :: 		Up_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2253 :: 		DrawImage(&Image226);
MOVW	R0, #lo_addr(_Image226+0)
MOVT	R0, #hi_addr(_Image226+0)
BL	_DrawImage+0
;Controller_events_code.c,2254 :: 		system_reg[DEL_SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2255 :: 		if (system_reg[DEL_SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_10_OnPress285
;Controller_events_code.c,2256 :: 		system_reg[DEL_SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Up_10_OnPress285:
;Controller_events_code.c,2257 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2258 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2259 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2260 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2261 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_10_OnPress286:
SUBS	R7, R7, #1
BNE	L_Up_10_OnPress286
NOP
NOP
NOP
;Controller_events_code.c,2262 :: 		}
L_end_Up_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_10_OnPress
_Up_10_OnUp:
;Controller_events_code.c,2264 :: 		void Up_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2265 :: 		Image226.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2266 :: 		Up_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2267 :: 		DrawImage(&Up_10_);
MOVW	R0, #lo_addr(_Up_10_+0)
MOVT	R0, #hi_addr(_Up_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2268 :: 		}
L_end_Up_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_10_OnUp
_Down_11_OnPress:
;Controller_events_code.c,2269 :: 		void Down_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2271 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2272 :: 		Image213.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2273 :: 		Down_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2274 :: 		DrawImage(&Image213);
MOVW	R0, #lo_addr(_Image213+0)
MOVT	R0, #hi_addr(_Image213+0)
BL	_DrawImage+0
;Controller_events_code.c,2275 :: 		system_reg[DEL_SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2276 :: 		if (system_reg[DEL_SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_11_OnPress288
;Controller_events_code.c,2277 :: 		system_reg[DEL_SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Down_11_OnPress288:
;Controller_events_code.c,2278 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2279 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2280 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2281 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2282 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_11_OnPress289:
SUBS	R7, R7, #1
BNE	L_Down_11_OnPress289
NOP
NOP
NOP
;Controller_events_code.c,2283 :: 		}
L_end_Down_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_11_OnPress
_Down_11_OnUp:
;Controller_events_code.c,2285 :: 		void Down_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2286 :: 		Image213.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2287 :: 		Down_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2288 :: 		DrawImage(&Down_11_);
MOVW	R0, #lo_addr(_Down_11_+0)
MOVT	R0, #hi_addr(_Down_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2290 :: 		}
L_end_Down_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_11_OnUp
_Up_11_OnPress:
;Controller_events_code.c,2292 :: 		void Up_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2294 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2295 :: 		Image227.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2296 :: 		Up_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2297 :: 		DrawImage(&Image227);
MOVW	R0, #lo_addr(_Image227+0)
MOVT	R0, #hi_addr(_Image227+0)
BL	_DrawImage+0
;Controller_events_code.c,2298 :: 		system_reg[DEL_SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2299 :: 		if (system_reg[DEL_SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_11_OnPress291
;Controller_events_code.c,2300 :: 		system_reg[DEL_SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Up_11_OnPress291:
;Controller_events_code.c,2301 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2302 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2303 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2304 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2305 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_11_OnPress292:
SUBS	R7, R7, #1
BNE	L_Up_11_OnPress292
NOP
NOP
NOP
;Controller_events_code.c,2306 :: 		}
L_end_Up_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_11_OnPress
_Up_11_OnUp:
;Controller_events_code.c,2308 :: 		void Up_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2309 :: 		Image227.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2310 :: 		Up_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2311 :: 		DrawImage(&Up_11_);
MOVW	R0, #lo_addr(_Up_11_+0)
MOVT	R0, #hi_addr(_Up_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2312 :: 		}
L_end_Up_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_11_OnUp
_Down_12_OnPress:
;Controller_events_code.c,2317 :: 		void Down_12_OnPress() {
;Controller_events_code.c,2319 :: 		}
L_end_Down_12_OnPress:
BX	LR
; end of _Down_12_OnPress
_Down_12_OnUp:
;Controller_events_code.c,2321 :: 		void Down_12_OnUp() {
;Controller_events_code.c,2323 :: 		}
L_end_Down_12_OnUp:
BX	LR
; end of _Down_12_OnUp
_Up_12_OnPress:
;Controller_events_code.c,2325 :: 		void Up_12_OnPress() {
;Controller_events_code.c,2327 :: 		}
L_end_Up_12_OnPress:
BX	LR
; end of _Up_12_OnPress
_Up_12_OnUp:
;Controller_events_code.c,2329 :: 		void Up_12_OnUp() {
;Controller_events_code.c,2331 :: 		}
L_end_Up_12_OnUp:
BX	LR
; end of _Up_12_OnUp
_Set_7_OnUp:
;Controller_events_code.c,2332 :: 		void Set_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2333 :: 		Set_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2334 :: 		Image252.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2335 :: 		DrawImage (&Set_7_);
MOVW	R0, #lo_addr(_Set_7_+0)
MOVT	R0, #hi_addr(_Set_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2336 :: 		}
L_end_Set_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnUp
_Set_7_OnDown:
;Controller_events_code.c,2337 :: 		void Set_7_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2338 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2342 :: 		send_data_packet(DEL_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #100
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2343 :: 		Set_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2344 :: 		Image252.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2345 :: 		DrawImage (&Image252);
MOVW	R0, #lo_addr(_Image252+0)
MOVT	R0, #hi_addr(_Image252+0)
BL	_DrawImage+0
;Controller_events_code.c,2346 :: 		}
L_end_Set_7_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnDown
_Set_8_OnDown:
;Controller_events_code.c,2348 :: 		void Set_8_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2349 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2353 :: 		send_data_packet(DEL_DHW_MIN,1);
MOVS	R1, #1
MOVW	R0, #460
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2354 :: 		Set_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2355 :: 		Image253.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2356 :: 		DrawImage (&Image253);
MOVW	R0, #lo_addr(_Image253+0)
MOVT	R0, #hi_addr(_Image253+0)
BL	_DrawImage+0
;Controller_events_code.c,2357 :: 		}
L_end_Set_8_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnDown
_Set_8_OnUp:
;Controller_events_code.c,2359 :: 		void Set_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2360 :: 		Set_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2361 :: 		Image253.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2362 :: 		DrawImage (&Set_8_);
MOVW	R0, #lo_addr(_Set_8_+0)
MOVT	R0, #hi_addr(_Set_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2363 :: 		}
L_end_Set_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnUp
_Set_9_OnUp:
;Controller_events_code.c,2365 :: 		void Set_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2366 :: 		Set_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2367 :: 		Image256.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2368 :: 		DrawImage (&Set_9_);
MOVW	R0, #lo_addr(_Set_9_+0)
MOVT	R0, #hi_addr(_Set_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2369 :: 		}
L_end_Set_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnUp
_Set_9_OnDown:
;Controller_events_code.c,2370 :: 		void Set_9_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2371 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2375 :: 		send_data_packet(DEL_DHW_MAX,1);
MOVS	R1, #1
MOVW	R0, #450
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2376 :: 		Set_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2377 :: 		Image256.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2378 :: 		DrawImage (&Image256);
MOVW	R0, #lo_addr(_Image256+0)
MOVT	R0, #hi_addr(_Image256+0)
BL	_DrawImage+0
;Controller_events_code.c,2379 :: 		}
L_end_Set_9_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnDown
_Set_10_OnDown:
;Controller_events_code.c,2380 :: 		void Set_10_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2381 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2385 :: 		send_data_packet(DEL_SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #130
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2386 :: 		Set_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2387 :: 		Image254.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2388 :: 		DrawImage (&Image254);
MOVW	R0, #lo_addr(_Image254+0)
MOVT	R0, #hi_addr(_Image254+0)
BL	_DrawImage+0
;Controller_events_code.c,2389 :: 		}
L_end_Set_10_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnDown
_Set_10_OnUp:
;Controller_events_code.c,2391 :: 		void Set_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2392 :: 		Set_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2393 :: 		Image254.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2394 :: 		DrawImage (&Set_10_);
MOVW	R0, #lo_addr(_Set_10_+0)
MOVT	R0, #hi_addr(_Set_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2395 :: 		}
L_end_Set_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnUp
_Set_11_OnDown:
;Controller_events_code.c,2396 :: 		void Set_11_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2397 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2401 :: 		send_data_packet(DEL_SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #120
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2402 :: 		Set_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2403 :: 		Image255.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2404 :: 		DrawImage (&Image255);
MOVW	R0, #lo_addr(_Image255+0)
MOVT	R0, #hi_addr(_Image255+0)
BL	_DrawImage+0
;Controller_events_code.c,2405 :: 		}
L_end_Set_11_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnDown
_Set_11_OnUp:
;Controller_events_code.c,2406 :: 		void Set_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2407 :: 		Set_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2408 :: 		Image255.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2409 :: 		DrawImage (&Set_11_);
MOVW	R0, #lo_addr(_Set_11_+0)
MOVT	R0, #hi_addr(_Set_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2410 :: 		}
L_end_Set_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnUp
_Set_12_OnDown:
;Controller_events_code.c,2412 :: 		void Set_12_OnDown() {
;Controller_events_code.c,2414 :: 		}
L_end_Set_12_OnDown:
BX	LR
; end of _Set_12_OnDown
_Set_12_OnUp:
;Controller_events_code.c,2415 :: 		void Set_12_OnUp() {
;Controller_events_code.c,2417 :: 		}
L_end_Set_12_OnUp:
BX	LR
; end of _Set_12_OnUp
_Down_19_OnPress:
;Controller_events_code.c,2421 :: 		void Down_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2423 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2424 :: 		Image243.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2425 :: 		Down_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2426 :: 		DrawImage(&Image243);
MOVW	R0, #lo_addr(_Image243+0)
MOVT	R0, #hi_addr(_Image243+0)
BL	_DrawImage+0
;Controller_events_code.c,2427 :: 		system_reg[S_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2428 :: 		if (system_reg[S_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_19_OnPress294
;Controller_events_code.c,2429 :: 		system_reg[S_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Down_19_OnPress294:
;Controller_events_code.c,2430 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2431 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2432 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2433 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2434 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_19_OnPress295:
SUBS	R7, R7, #1
BNE	L_Down_19_OnPress295
NOP
NOP
NOP
;Controller_events_code.c,2435 :: 		}
L_end_Down_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_19_OnPress
_Down_19_OnUp:
;Controller_events_code.c,2436 :: 		void Down_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2437 :: 		Image243.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2438 :: 		Down_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2439 :: 		DrawImage(&Down_19_);
MOVW	R0, #lo_addr(_Down_19_+0)
MOVT	R0, #hi_addr(_Down_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2440 :: 		}
L_end_Down_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_19_OnUp
_Up_19_OnPress:
;Controller_events_code.c,2441 :: 		void Up_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2443 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2444 :: 		Image236.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2445 :: 		Up_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2446 :: 		DrawImage(&Image236);
MOVW	R0, #lo_addr(_Image236+0)
MOVT	R0, #hi_addr(_Image236+0)
BL	_DrawImage+0
;Controller_events_code.c,2447 :: 		system_reg[S_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2448 :: 		if (system_reg[S_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_19_OnPress297
;Controller_events_code.c,2449 :: 		system_reg[S_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Up_19_OnPress297:
;Controller_events_code.c,2450 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2451 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2452 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2453 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2454 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_19_OnPress298:
SUBS	R7, R7, #1
BNE	L_Up_19_OnPress298
NOP
NOP
NOP
;Controller_events_code.c,2455 :: 		}
L_end_Up_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_19_OnPress
_Up_19_OnUp:
;Controller_events_code.c,2456 :: 		void Up_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2457 :: 		Image236.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2458 :: 		Up_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2459 :: 		DrawImage(&Up_19_);
MOVW	R0, #lo_addr(_Up_19_+0)
MOVT	R0, #hi_addr(_Up_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2460 :: 		}
L_end_Up_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_19_OnUp
_Down_20_OnPress:
;Controller_events_code.c,2461 :: 		void Down_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2463 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2464 :: 		Image244.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2465 :: 		Down_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2466 :: 		DrawImage(&Image244);
MOVW	R0, #lo_addr(_Image244+0)
MOVT	R0, #hi_addr(_Image244+0)
BL	_DrawImage+0
;Controller_events_code.c,2467 :: 		system_reg[S_COOL_MIN]--;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2468 :: 		if (system_reg[S_COOL_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_20_OnPress300
;Controller_events_code.c,2469 :: 		system_reg[S_COOL_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Down_20_OnPress300:
;Controller_events_code.c,2470 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2471 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2472 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2473 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2474 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_20_OnPress301:
SUBS	R7, R7, #1
BNE	L_Down_20_OnPress301
NOP
NOP
NOP
;Controller_events_code.c,2475 :: 		}
L_end_Down_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_20_OnPress
_Down_20_OnUp:
;Controller_events_code.c,2476 :: 		void Down_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2477 :: 		Image244.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2478 :: 		Down_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2479 :: 		DrawImage(&Down_20_);
MOVW	R0, #lo_addr(_Down_20_+0)
MOVT	R0, #hi_addr(_Down_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2480 :: 		}
L_end_Down_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_20_OnUp
_Up_20_OnPress:
;Controller_events_code.c,2481 :: 		void Up_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2483 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2484 :: 		Image237.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2485 :: 		Up_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2486 :: 		DrawImage(&Image237);
MOVW	R0, #lo_addr(_Image237+0)
MOVT	R0, #hi_addr(_Image237+0)
BL	_DrawImage+0
;Controller_events_code.c,2487 :: 		system_reg[S_COOL_MIN]++;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2488 :: 		if (system_reg[S_COOL_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_20_OnPress303
;Controller_events_code.c,2489 :: 		system_reg[S_COOL_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Up_20_OnPress303:
;Controller_events_code.c,2490 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2491 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2492 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2493 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2494 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_20_OnPress304:
SUBS	R7, R7, #1
BNE	L_Up_20_OnPress304
NOP
NOP
NOP
;Controller_events_code.c,2495 :: 		}
L_end_Up_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_20_OnPress
_Up_20_OnUp:
;Controller_events_code.c,2496 :: 		void Up_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2497 :: 		Image237.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2498 :: 		Up_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2499 :: 		DrawImage(&Up_20_);
MOVW	R0, #lo_addr(_Up_20_+0)
MOVT	R0, #hi_addr(_Up_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2500 :: 		}
L_end_Up_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_20_OnUp
_Down_21_OnPress:
;Controller_events_code.c,2501 :: 		void Down_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2503 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2504 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2505 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2506 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2507 :: 		system_reg[S_COOL_MAX]--;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2508 :: 		if (system_reg[S_COOL_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_21_OnPress306
;Controller_events_code.c,2509 :: 		system_reg[S_COOL_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Down_21_OnPress306:
;Controller_events_code.c,2510 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2511 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2512 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2513 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2514 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_21_OnPress307:
SUBS	R7, R7, #1
BNE	L_Down_21_OnPress307
NOP
NOP
NOP
;Controller_events_code.c,2515 :: 		}
L_end_Down_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_21_OnPress
_Down_21_OnUp:
;Controller_events_code.c,2516 :: 		void Down_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2517 :: 		Image245.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image245+20)
MOVT	R0, #hi_addr(_Image245+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2518 :: 		Down_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_21_+20)
MOVT	R0, #hi_addr(_Down_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2519 :: 		DrawImage(&Down_21_);
MOVW	R0, #lo_addr(_Down_21_+0)
MOVT	R0, #hi_addr(_Down_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2520 :: 		}
L_end_Down_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_21_OnUp
_Up_21_OnPress:
;Controller_events_code.c,2521 :: 		void Up_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2523 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2524 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2525 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2526 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2527 :: 		system_reg[S_COOL_MAX]++;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2528 :: 		if (system_reg[S_COOL_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_21_OnPress309
;Controller_events_code.c,2529 :: 		system_reg[S_COOL_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Up_21_OnPress309:
;Controller_events_code.c,2530 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2531 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2532 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2533 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2534 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_21_OnPress310:
SUBS	R7, R7, #1
BNE	L_Up_21_OnPress310
NOP
NOP
NOP
;Controller_events_code.c,2535 :: 		}
L_end_Up_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_21_OnPress
_Up_21_OnUp:
;Controller_events_code.c,2536 :: 		void Up_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2537 :: 		Image238.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2538 :: 		Up_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2539 :: 		DrawImage(&Up_21_);
MOVW	R0, #lo_addr(_Up_21_+0)
MOVT	R0, #hi_addr(_Up_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2540 :: 		}
L_end_Up_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_21_OnUp
_Down_22_OnPress:
;Controller_events_code.c,2542 :: 		void Down_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2544 :: 		Image24.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2545 :: 		Down_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2546 :: 		DrawImage(&Image24);
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
BL	_DrawImage+0
;Controller_events_code.c,2547 :: 		system_reg[HP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2548 :: 		if (system_reg[HP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_22_OnPress312
;Controller_events_code.c,2549 :: 		system_reg[HP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Down_22_OnPress312:
;Controller_events_code.c,2550 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2551 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2552 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2553 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2554 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_22_OnPress313:
SUBS	R7, R7, #1
BNE	L_Down_22_OnPress313
NOP
NOP
NOP
;Controller_events_code.c,2555 :: 		}
L_end_Down_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_22_OnPress
_Down_22_OnUp:
;Controller_events_code.c,2556 :: 		void Down_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2557 :: 		Image24.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2558 :: 		Down_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2559 :: 		DrawImage(&Down_22_);
MOVW	R0, #lo_addr(_Down_22_+0)
MOVT	R0, #hi_addr(_Down_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2561 :: 		}
L_end_Down_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_22_OnUp
_Up_22_OnPress:
;Controller_events_code.c,2562 :: 		void Up_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2564 :: 		Image53.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2565 :: 		Up_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2566 :: 		DrawImage(&Image53);
MOVW	R0, #lo_addr(_Image53+0)
MOVT	R0, #hi_addr(_Image53+0)
BL	_DrawImage+0
;Controller_events_code.c,2567 :: 		system_reg[HP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2568 :: 		if (system_reg[HP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_22_OnPress315
;Controller_events_code.c,2569 :: 		system_reg[HP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Up_22_OnPress315:
;Controller_events_code.c,2570 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2571 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2572 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2573 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2574 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_22_OnPress316:
SUBS	R7, R7, #1
BNE	L_Up_22_OnPress316
NOP
NOP
NOP
;Controller_events_code.c,2575 :: 		}
L_end_Up_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_22_OnPress
_Up_22_OnUp:
;Controller_events_code.c,2576 :: 		void Up_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2577 :: 		Image53.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2578 :: 		Up_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2579 :: 		DrawImage(&Up_22_);
MOVW	R0, #lo_addr(_Up_22_+0)
MOVT	R0, #hi_addr(_Up_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2580 :: 		}
L_end_Up_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_22_OnUp
_Down_23_OnPress:
;Controller_events_code.c,2581 :: 		void Down_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2583 :: 		Image86.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2584 :: 		Down_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2585 :: 		DrawImage(&Image86);
MOVW	R0, #lo_addr(_Image86+0)
MOVT	R0, #hi_addr(_Image86+0)
BL	_DrawImage+0
;Controller_events_code.c,2586 :: 		system_reg[HP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2587 :: 		if (system_reg[HP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_23_OnPress318
;Controller_events_code.c,2588 :: 		system_reg[HP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Down_23_OnPress318:
;Controller_events_code.c,2589 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2590 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2591 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2592 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2593 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_23_OnPress319:
SUBS	R7, R7, #1
BNE	L_Down_23_OnPress319
NOP
NOP
NOP
;Controller_events_code.c,2594 :: 		}
L_end_Down_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_23_OnPress
_Down_23_OnUp:
;Controller_events_code.c,2595 :: 		void Down_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2596 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2597 :: 		Down_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2598 :: 		DrawImage(&Down_23_);
MOVW	R0, #lo_addr(_Down_23_+0)
MOVT	R0, #hi_addr(_Down_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2600 :: 		}
L_end_Down_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_23_OnUp
_Up_23_OnPress:
;Controller_events_code.c,2601 :: 		void Up_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2603 :: 		Image95.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image95+20)
MOVT	R0, #hi_addr(_Image95+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2604 :: 		Up_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2605 :: 		DrawImage(&Image95);
MOVW	R0, #lo_addr(_Image95+0)
MOVT	R0, #hi_addr(_Image95+0)
BL	_DrawImage+0
;Controller_events_code.c,2606 :: 		system_reg[HP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2607 :: 		if (system_reg[HP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_23_OnPress321
;Controller_events_code.c,2608 :: 		system_reg[HP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Up_23_OnPress321:
;Controller_events_code.c,2609 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2610 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2611 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2612 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2613 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_23_OnPress322:
SUBS	R7, R7, #1
BNE	L_Up_23_OnPress322
NOP
NOP
NOP
;Controller_events_code.c,2614 :: 		}
L_end_Up_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_23_OnPress
_Up_23_OnUp:
;Controller_events_code.c,2615 :: 		void Up_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2616 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2617 :: 		Up_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2618 :: 		DrawImage(&Up_23_);
MOVW	R0, #lo_addr(_Up_23_+0)
MOVT	R0, #hi_addr(_Up_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2619 :: 		}
L_end_Up_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_23_OnUp
_Set_19_OnUp:
;Controller_events_code.c,2621 :: 		void Set_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2622 :: 		Set_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2623 :: 		Image264.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2624 :: 		DrawImage (&Set_19_);
MOVW	R0, #lo_addr(_Set_19_+0)
MOVT	R0, #hi_addr(_Set_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2625 :: 		}
L_end_Set_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnUp
_Set_19_OnDown:
;Controller_events_code.c,2626 :: 		void void Set_19_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2627 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2631 :: 		send_data_packet(S_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #280
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2632 :: 		Set_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2633 :: 		Image264.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2634 :: 		DrawImage (&Image264);
MOVW	R0, #lo_addr(_Image264+0)
MOVT	R0, #hi_addr(_Image264+0)
BL	_DrawImage+0
;Controller_events_code.c,2635 :: 		}
L_end_Set_19_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnDown
_Set_20_OnDown:
;Controller_events_code.c,2636 :: 		void Set_20_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2637 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2641 :: 		send_data_packet(S_COOL_MIN,1);
MOVS	R1, #1
MOVW	R0, #270
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2642 :: 		Set_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2643 :: 		Image265.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2644 :: 		DrawImage (&Image265);
MOVW	R0, #lo_addr(_Image265+0)
MOVT	R0, #hi_addr(_Image265+0)
BL	_DrawImage+0
;Controller_events_code.c,2645 :: 		}
L_end_Set_20_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnDown
_Set_20_OnUp:
;Controller_events_code.c,2646 :: 		void Set_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2647 :: 		Set_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2648 :: 		Image265.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2649 :: 		DrawImage (&Set_20_);
MOVW	R0, #lo_addr(_Set_20_+0)
MOVT	R0, #hi_addr(_Set_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2650 :: 		}
L_end_Set_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnUp
_Set_21_OnDown:
;Controller_events_code.c,2651 :: 		void Set_21_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2652 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2656 :: 		send_data_packet(S_COOL_MAX,1);
MOVS	R1, #1
MOVW	R0, #260
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2657 :: 		Set_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2658 :: 		Image266.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2659 :: 		DrawImage (&Image266);
MOVW	R0, #lo_addr(_Image266+0)
MOVT	R0, #hi_addr(_Image266+0)
BL	_DrawImage+0
;Controller_events_code.c,2660 :: 		}
L_end_Set_21_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnDown
_Set_21_OnUp:
;Controller_events_code.c,2661 :: 		void Set_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2662 :: 		Set_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2663 :: 		Image266.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2664 :: 		DrawImage (&Set_21_);
MOVW	R0, #lo_addr(_Set_21_+0)
MOVT	R0, #hi_addr(_Set_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2665 :: 		}
L_end_Set_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnUp
_Set_22_OnDown:
;Controller_events_code.c,2666 :: 		void Set_22_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2667 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2671 :: 		send_data_packet(HP_MAX,1);
MOVS	R1, #1
MOVW	R0, #220
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2672 :: 		Set_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2673 :: 		Image34.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2674 :: 		DrawImage (&Image34);
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
BL	_DrawImage+0
;Controller_events_code.c,2675 :: 		}
L_end_Set_22_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnDown
_Set_22_OnUp:
;Controller_events_code.c,2677 :: 		void Set_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2678 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2679 :: 		Set_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2680 :: 		Image34.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2681 :: 		DrawImage (&Set_22_);
MOVW	R0, #lo_addr(_Set_22_+0)
MOVT	R0, #hi_addr(_Set_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2682 :: 		}
L_end_Set_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnUp
_Set_23_OnDown:
;Controller_events_code.c,2683 :: 		void Set_23_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2684 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2688 :: 		send_data_packet(HP_MIN,1);
MOVS	R1, #1
MOVW	R0, #240
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2689 :: 		Set_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2690 :: 		Image33.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2691 :: 		DrawImage (&Image33);
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
BL	_DrawImage+0
;Controller_events_code.c,2692 :: 		}
L_end_Set_23_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnDown
_Set_23_OnUp:
;Controller_events_code.c,2693 :: 		void Set_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2694 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2695 :: 		Set_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2696 :: 		Image33.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2697 :: 		DrawImage (&Set_23_);
MOVW	R0, #lo_addr(_Set_23_+0)
MOVT	R0, #hi_addr(_Set_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2698 :: 		}
L_end_Set_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnUp
_One_CompressorsOnClick:
;Controller_events_code.c,2701 :: 		void One_CompressorsOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2702 :: 		num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2703 :: 		if ((unsigned long)One_Compressors.Picture_Name == Compressor1_jpg)
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
LDR	R1, [R0, #0]
MOVW	R0, #24408
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_One_CompressorsOnClick324
;Controller_events_code.c,2705 :: 		One_Compressors.Picture_Name = Compressor2_jpg;
MOVW	R1, #18396
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2706 :: 		Two_Compressors.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Two_Compressors+20)
MOVT	R0, #hi_addr(_Two_Compressors+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2707 :: 		DrawImage(&Two_Compressors);
MOVW	R0, #lo_addr(_Two_Compressors+0)
MOVT	R0, #hi_addr(_Two_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2708 :: 		system_reg[NOMB_COMPRESSORS]=2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2709 :: 		two_compressors_mode=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2710 :: 		}
IT	AL
BAL	L_One_CompressorsOnClick325
L_One_CompressorsOnClick324:
;Controller_events_code.c,2712 :: 		One_Compressors.Picture_Name = Compressor1_jpg;
MOVW	R1, #24408
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2713 :: 		One_Compressors.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_One_Compressors+20)
MOVT	R0, #hi_addr(_One_Compressors+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2714 :: 		DrawImage(&One_Compressors);
MOVW	R0, #lo_addr(_One_Compressors+0)
MOVT	R0, #hi_addr(_One_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2715 :: 		system_reg[NOMB_COMPRESSORS]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2716 :: 		two_compressors_mode=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2717 :: 		}
L_One_CompressorsOnClick325:
;Controller_events_code.c,2718 :: 		send_data_packet(NOMB_COMPRESSORS,1);
MOVS	R1, #1
MOVW	R0, #400
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2721 :: 		Delay_ms (300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_One_CompressorsOnClick326:
SUBS	R7, R7, #1
BNE	L_One_CompressorsOnClick326
NOP
NOP
NOP
;Controller_events_code.c,2722 :: 		}
L_end_One_CompressorsOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _One_CompressorsOnClick
_Reversing_ON_HEATOnClick:
;Controller_events_code.c,2724 :: 		void Reversing_ON_HEATOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2725 :: 		if ((unsigned long)Reversing_ON_HEAT.Picture_Name == but_ON_jpg)
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
LDR	R1, [R0, #0]
MOVW	R0, #27414
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_Reversing_ON_HEATOnClick328
;Controller_events_code.c,2727 :: 		Reversing_ON_HEAT.Picture_Name = but_OFF_jpg;
MOVW	R1, #21402
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2728 :: 		DrawImage(&Reversing_Heat_OFF);
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+0)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,2729 :: 		system_reg[REVERS_MOD]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2731 :: 		}
IT	AL
BAL	L_Reversing_ON_HEATOnClick329
L_Reversing_ON_HEATOnClick328:
;Controller_events_code.c,2733 :: 		Reversing_ON_HEAT.Picture_Name = but_ON_jpg;
MOVW	R1, #27414
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2734 :: 		DrawImage(&Reversing_ON_HEAT);
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+0)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+0)
BL	_DrawImage+0
;Controller_events_code.c,2735 :: 		system_reg[REVERS_MOD]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2736 :: 		}
L_Reversing_ON_HEATOnClick329:
;Controller_events_code.c,2737 :: 		send_data_packet(REVERS_MOD,1);
MOVS	R1, #1
MOVW	R0, #410
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2738 :: 		Delay_ms (300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_Reversing_ON_HEATOnClick330:
SUBS	R7, R7, #1
BNE	L_Reversing_ON_HEATOnClick330
NOP
NOP
NOP
;Controller_events_code.c,2739 :: 		}
L_end_Reversing_ON_HEATOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Reversing_ON_HEATOnClick
_Flow_Source__Sensor_ONOnClick:
;Controller_events_code.c,2740 :: 		void Flow_Source__Sensor_ONOnClick(){
;Controller_events_code.c,2742 :: 		}
L_end_Flow_Source__Sensor_ONOnClick:
BX	LR
; end of _Flow_Source__Sensor_ONOnClick
_Flow_Source__Heat1_ONOnClick:
;Controller_events_code.c,2743 :: 		void Flow_Source__Heat1_ONOnClick() {
;Controller_events_code.c,2745 :: 		}
L_end_Flow_Source__Heat1_ONOnClick:
BX	LR
; end of _Flow_Source__Heat1_ONOnClick
_Flow_Source__Heat2_ONOnClick:
;Controller_events_code.c,2746 :: 		void Flow_Source__Heat2_ONOnClick() {
;Controller_events_code.c,2748 :: 		}
L_end_Flow_Source__Heat2_ONOnClick:
BX	LR
; end of _Flow_Source__Heat2_ONOnClick
_Power_380VOnClick:
;Controller_events_code.c,2749 :: 		void Power_380VOnClick() {
;Controller_events_code.c,2751 :: 		}
L_end_Power_380VOnClick:
BX	LR
; end of _Power_380VOnClick
_furnance_Mode_onOnClick:
;Controller_events_code.c,2754 :: 		void furnance_Mode_onOnClick() {
;Controller_events_code.c,2756 :: 		}
L_end_furnance_Mode_onOnClick:
BX	LR
; end of _furnance_Mode_onOnClick
_Furnance_start_temp_DownOnUp:
;Controller_events_code.c,2758 :: 		void Furnance_start_temp_DownOnUp() {
;Controller_events_code.c,2760 :: 		}
L_end_Furnance_start_temp_DownOnUp:
BX	LR
; end of _Furnance_start_temp_DownOnUp
_Furnance_start_temp_DownOnPress:
;Controller_events_code.c,2761 :: 		void Furnance_start_temp_DownOnPress() {
;Controller_events_code.c,2763 :: 		}
L_end_Furnance_start_temp_DownOnPress:
BX	LR
; end of _Furnance_start_temp_DownOnPress
_Furnance_HP_OFF_DowmOnUp:
;Controller_events_code.c,2764 :: 		void Furnance_HP_OFF_DowmOnUp() {
;Controller_events_code.c,2766 :: 		}
L_end_Furnance_HP_OFF_DowmOnUp:
BX	LR
; end of _Furnance_HP_OFF_DowmOnUp
_Furnance_HP_OFF_DowmOnPress:
;Controller_events_code.c,2767 :: 		void Furnance_HP_OFF_DowmOnPress() {
;Controller_events_code.c,2769 :: 		}
L_end_Furnance_HP_OFF_DowmOnPress:
BX	LR
; end of _Furnance_HP_OFF_DowmOnPress
_Furnance_HP_OFF_UPOnUp:
;Controller_events_code.c,2770 :: 		void Furnance_HP_OFF_UPOnUp() {
;Controller_events_code.c,2772 :: 		}
L_end_Furnance_HP_OFF_UPOnUp:
BX	LR
; end of _Furnance_HP_OFF_UPOnUp
_Furnance_HP_OFF_UPOnPress:
;Controller_events_code.c,2773 :: 		void Furnance_HP_OFF_UPOnPress() {
;Controller_events_code.c,2775 :: 		}
L_end_Furnance_HP_OFF_UPOnPress:
BX	LR
; end of _Furnance_HP_OFF_UPOnPress
_Furnance_off_downOnUp:
;Controller_events_code.c,2777 :: 		void Furnance_off_downOnUp() {
;Controller_events_code.c,2779 :: 		}
L_end_Furnance_off_downOnUp:
BX	LR
; end of _Furnance_off_downOnUp
_Furnance_off_downOnPress:
;Controller_events_code.c,2780 :: 		void Furnance_off_downOnPress() {
;Controller_events_code.c,2782 :: 		}
L_end_Furnance_off_downOnPress:
BX	LR
; end of _Furnance_off_downOnPress
_Furnance_off_upOnUp:
;Controller_events_code.c,2783 :: 		void Furnance_off_upOnUp() {
;Controller_events_code.c,2785 :: 		}
L_end_Furnance_off_upOnUp:
BX	LR
; end of _Furnance_off_upOnUp
_Furnance_off_upOnPress:
;Controller_events_code.c,2786 :: 		void Furnance_off_upOnPress() {
;Controller_events_code.c,2788 :: 		}
L_end_Furnance_off_upOnPress:
BX	LR
; end of _Furnance_off_upOnPress
_Furnance_off_save_onup:
;Controller_events_code.c,2789 :: 		void Furnance_off_save_onup() {
;Controller_events_code.c,2791 :: 		}
L_end_Furnance_off_save_onup:
BX	LR
; end of _Furnance_off_save_onup
_Furnance_off_save_ondown:
;Controller_events_code.c,2792 :: 		void Furnance_off_save_ondown() {
;Controller_events_code.c,2794 :: 		}
L_end_Furnance_off_save_ondown:
BX	LR
; end of _Furnance_off_save_ondown
_Furnance_time_downOnUp:
;Controller_events_code.c,2795 :: 		void Furnance_time_downOnUp() {
;Controller_events_code.c,2797 :: 		}
L_end_Furnance_time_downOnUp:
BX	LR
; end of _Furnance_time_downOnUp
_Furnance_time_downOnPress:
;Controller_events_code.c,2798 :: 		void Furnance_time_downOnPress() {
;Controller_events_code.c,2800 :: 		}
L_end_Furnance_time_downOnPress:
BX	LR
; end of _Furnance_time_downOnPress
_Furnance_time_upOnUp:
;Controller_events_code.c,2801 :: 		void Furnance_time_upOnUp() {
;Controller_events_code.c,2803 :: 		}
L_end_Furnance_time_upOnUp:
BX	LR
; end of _Furnance_time_upOnUp
_Furnance_time_upOnPress:
;Controller_events_code.c,2804 :: 		void Furnance_time_upOnPress() {
;Controller_events_code.c,2806 :: 		}
L_end_Furnance_time_upOnPress:
BX	LR
; end of _Furnance_time_upOnPress
_furnance_time_OFFOnClick:
;Controller_events_code.c,2807 :: 		void furnance_time_OFFOnClick() {
;Controller_events_code.c,2809 :: 		}
L_end_furnance_time_OFFOnClick:
BX	LR
; end of _furnance_time_OFFOnClick
_Furnance_HP_OFF_save_onup:
;Controller_events_code.c,2810 :: 		void Furnance_HP_OFF_save_onup(){
;Controller_events_code.c,2811 :: 		}
L_end_Furnance_HP_OFF_save_onup:
BX	LR
; end of _Furnance_HP_OFF_save_onup
_Furnance_start_temp_UPOnUp:
;Controller_events_code.c,2812 :: 		void Furnance_start_temp_UPOnUp(){
;Controller_events_code.c,2813 :: 		}
L_end_Furnance_start_temp_UPOnUp:
BX	LR
; end of _Furnance_start_temp_UPOnUp
_Furnance_start_temp_UPOnPress:
;Controller_events_code.c,2814 :: 		void Furnance_start_temp_UPOnPress(){
;Controller_events_code.c,2815 :: 		}
L_end_Furnance_start_temp_UPOnPress:
BX	LR
; end of _Furnance_start_temp_UPOnPress
_SetIPAddressOnClick:
;Controller_events_code.c,2818 :: 		void SetIPAddressOnClick() {
;Controller_events_code.c,2820 :: 		}
L_end_SetIPAddressOnClick:
BX	LR
; end of _SetIPAddressOnClick
_SetMaskOnClick:
;Controller_events_code.c,2822 :: 		void SetMaskOnClick() {
;Controller_events_code.c,2824 :: 		}
L_end_SetMaskOnClick:
BX	LR
; end of _SetMaskOnClick
_SetDNSOnClick:
;Controller_events_code.c,2826 :: 		void SetDNSOnClick() {
;Controller_events_code.c,2828 :: 		}
L_end_SetDNSOnClick:
BX	LR
; end of _SetDNSOnClick
_LAN_Key_1OnClick:
;Controller_events_code.c,2830 :: 		void LAN_Key_1OnClick() {
;Controller_events_code.c,2832 :: 		}
L_end_LAN_Key_1OnClick:
BX	LR
; end of _LAN_Key_1OnClick
_LAN_Key_2OnClick:
;Controller_events_code.c,2834 :: 		void LAN_Key_2OnClick() {
;Controller_events_code.c,2836 :: 		}
L_end_LAN_Key_2OnClick:
BX	LR
; end of _LAN_Key_2OnClick
_LAN_Key_3OnClick:
;Controller_events_code.c,2838 :: 		void LAN_Key_3OnClick() {
;Controller_events_code.c,2840 :: 		}
L_end_LAN_Key_3OnClick:
BX	LR
; end of _LAN_Key_3OnClick
_LAN_Key_4OnClick:
;Controller_events_code.c,2842 :: 		void LAN_Key_4OnClick() {
;Controller_events_code.c,2844 :: 		}
L_end_LAN_Key_4OnClick:
BX	LR
; end of _LAN_Key_4OnClick
_LAN_Key_5OnClick:
;Controller_events_code.c,2846 :: 		void LAN_Key_5OnClick() {
;Controller_events_code.c,2848 :: 		}
L_end_LAN_Key_5OnClick:
BX	LR
; end of _LAN_Key_5OnClick
_LAN_Key_6OnClick:
;Controller_events_code.c,2850 :: 		void LAN_Key_6OnClick() {
;Controller_events_code.c,2852 :: 		}
L_end_LAN_Key_6OnClick:
BX	LR
; end of _LAN_Key_6OnClick
_LAN_Key_7OnClick:
;Controller_events_code.c,2854 :: 		void LAN_Key_7OnClick() {
;Controller_events_code.c,2856 :: 		}
L_end_LAN_Key_7OnClick:
BX	LR
; end of _LAN_Key_7OnClick
_LAN_Key_8OnClick:
;Controller_events_code.c,2858 :: 		void LAN_Key_8OnClick() {
;Controller_events_code.c,2860 :: 		}
L_end_LAN_Key_8OnClick:
BX	LR
; end of _LAN_Key_8OnClick
_LAN_Key_9OnClick:
;Controller_events_code.c,2862 :: 		void LAN_Key_9OnClick() {
;Controller_events_code.c,2864 :: 		}
L_end_LAN_Key_9OnClick:
BX	LR
; end of _LAN_Key_9OnClick
_LAN_Key_0OnClick:
;Controller_events_code.c,2866 :: 		void LAN_Key_0OnClick() {
;Controller_events_code.c,2868 :: 		}
L_end_LAN_Key_0OnClick:
BX	LR
; end of _LAN_Key_0OnClick
_LAN_Key_DotOnClick:
;Controller_events_code.c,2870 :: 		void LAN_Key_DotOnClick() {
;Controller_events_code.c,2872 :: 		}
L_end_LAN_Key_DotOnClick:
BX	LR
; end of _LAN_Key_DotOnClick
_LAN_Key_ClearOnClick:
;Controller_events_code.c,2874 :: 		void LAN_Key_ClearOnClick() {
;Controller_events_code.c,2876 :: 		}
L_end_LAN_Key_ClearOnClick:
BX	LR
; end of _LAN_Key_ClearOnClick
_LANSetOnClick:
;Controller_events_code.c,2878 :: 		void LANSetOnClick() {
;Controller_events_code.c,2880 :: 		}
L_end_LANSetOnClick:
BX	LR
; end of _LANSetOnClick
_SetGateWayOnClick:
;Controller_events_code.c,2881 :: 		void SetGateWayOnClick(){
;Controller_events_code.c,2882 :: 		}
L_end_SetGateWayOnClick:
BX	LR
; end of _SetGateWayOnClick
_Hyst_Heat_downOnUp:
;Controller_events_code.c,2884 :: 		void Hyst_Heat_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2885 :: 		Hyst_Heat_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2886 :: 		Image114.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2887 :: 		DrawImage(&Hyst_Heat_down);
MOVW	R0, #lo_addr(_Hyst_Heat_down+0)
MOVT	R0, #hi_addr(_Hyst_Heat_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2888 :: 		}
L_end_Hyst_Heat_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_downOnUp
_Hyst_Heat_downOnPress:
;Controller_events_code.c,2889 :: 		void Hyst_Heat_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2891 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2892 :: 		Hyst_Heat_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2893 :: 		Image114.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2894 :: 		DrawImage(&Image114);
MOVW	R0, #lo_addr(_Image114+0)
MOVT	R0, #hi_addr(_Image114+0)
BL	_DrawImage+0
;Controller_events_code.c,2895 :: 		system_reg[DIFF_HEAT]--;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2896 :: 		if (system_reg[DIFF_HEAT] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Heat_downOnPress332
;Controller_events_code.c,2897 :: 		system_reg[DIFF_HEAT] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_downOnPress332:
;Controller_events_code.c,2898 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2899 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2900 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2901 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2902 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Heat_downOnPress333:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_downOnPress333
NOP
NOP
NOP
;Controller_events_code.c,2903 :: 		}
L_end_Hyst_Heat_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_downOnPress
_Hyst_Heat_upOnUp:
;Controller_events_code.c,2904 :: 		void Hyst_Heat_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2905 :: 		Hyst_Heat_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2906 :: 		Image121.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2907 :: 		DrawImage(&Hyst_Heat_up);
MOVW	R0, #lo_addr(_Hyst_Heat_up+0)
MOVT	R0, #hi_addr(_Hyst_Heat_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2908 :: 		}
L_end_Hyst_Heat_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_upOnUp
_Hyst_Heat_upOnPress:
;Controller_events_code.c,2909 :: 		void Hyst_Heat_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2911 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2912 :: 		Hyst_Heat_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2913 :: 		Image121.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2914 :: 		DrawImage(&Image121);
MOVW	R0, #lo_addr(_Image121+0)
MOVT	R0, #hi_addr(_Image121+0)
BL	_DrawImage+0
;Controller_events_code.c,2915 :: 		system_reg[DIFF_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2916 :: 		if (system_reg[DIFF_HEAT] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Heat_upOnPress335
;Controller_events_code.c,2917 :: 		system_reg[DIFF_HEAT] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_upOnPress335:
;Controller_events_code.c,2918 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2919 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2920 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2921 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2922 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Heat_upOnPress336:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_upOnPress336
NOP
NOP
NOP
;Controller_events_code.c,2923 :: 		}
L_end_Hyst_Heat_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_upOnPress
_Hyst_Cool_downOnUp:
;Controller_events_code.c,2924 :: 		void Hyst_Cool_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2925 :: 		Hyst_Cool_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2926 :: 		Image115.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2927 :: 		DrawImage(&Hyst_Cool_down);
MOVW	R0, #lo_addr(_Hyst_Cool_down+0)
MOVT	R0, #hi_addr(_Hyst_Cool_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2928 :: 		}
L_end_Hyst_Cool_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_downOnUp
_Hyst_Cool_downOnPress:
;Controller_events_code.c,2929 :: 		void Hyst_Cool_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2931 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2932 :: 		Hyst_Cool_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2933 :: 		Image115.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2934 :: 		DrawImage(&Image115);
MOVW	R0, #lo_addr(_Image115+0)
MOVT	R0, #hi_addr(_Image115+0)
BL	_DrawImage+0
;Controller_events_code.c,2935 :: 		system_reg[DIFF_COOL]--;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2936 :: 		if (system_reg[DIFF_COOL] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Cool_downOnPress338
;Controller_events_code.c,2937 :: 		system_reg[DIFF_COOL] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_downOnPress338:
;Controller_events_code.c,2938 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2939 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2940 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2941 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2942 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Cool_downOnPress339:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_downOnPress339
NOP
NOP
NOP
;Controller_events_code.c,2943 :: 		}
L_end_Hyst_Cool_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_downOnPress
_Hyst_Cool_upOnUp:
;Controller_events_code.c,2944 :: 		void Hyst_Cool_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2945 :: 		Hyst_Cool_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2946 :: 		Image122.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2947 :: 		DrawImage(&Hyst_Cool_up);
MOVW	R0, #lo_addr(_Hyst_Cool_up+0)
MOVT	R0, #hi_addr(_Hyst_Cool_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2949 :: 		}
L_end_Hyst_Cool_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_upOnUp
_Hyst_Cool_upOnPress:
;Controller_events_code.c,2950 :: 		void Hyst_Cool_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2952 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2953 :: 		Hyst_Cool_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2954 :: 		Image122.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2955 :: 		DrawImage(&Image122);
MOVW	R0, #lo_addr(_Image122+0)
MOVT	R0, #hi_addr(_Image122+0)
BL	_DrawImage+0
;Controller_events_code.c,2956 :: 		system_reg[DIFF_COOL]++;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2957 :: 		if (system_reg[DIFF_COOL] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Cool_upOnPress341
;Controller_events_code.c,2958 :: 		system_reg[DIFF_COOL] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_upOnPress341:
;Controller_events_code.c,2959 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2960 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2961 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2962 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2963 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_Cool_upOnPress342:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_upOnPress342
NOP
NOP
NOP
;Controller_events_code.c,2964 :: 		}
L_end_Hyst_Cool_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_upOnPress
_Hyst_DHW_downOnUp:
;Controller_events_code.c,2965 :: 		void Hyst_DHW_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2966 :: 		Hyst_DHW_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2967 :: 		Image116.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2968 :: 		DrawImage(&Hyst_DHW_down);
MOVW	R0, #lo_addr(_Hyst_DHW_down+0)
MOVT	R0, #hi_addr(_Hyst_DHW_down+0)
BL	_DrawImage+0
;Controller_events_code.c,2969 :: 		}
L_end_Hyst_DHW_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_downOnUp
_Hyst_DHW_downOnPress:
;Controller_events_code.c,2970 :: 		void Hyst_DHW_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2972 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2973 :: 		Hyst_DHW_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2974 :: 		Image116.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2975 :: 		DrawImage(&Image116);
MOVW	R0, #lo_addr(_Image116+0)
MOVT	R0, #hi_addr(_Image116+0)
BL	_DrawImage+0
;Controller_events_code.c,2976 :: 		system_reg[DIFF_DHW]--;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2977 :: 		if (system_reg[DIFF_DHW] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_DHW_downOnPress344
;Controller_events_code.c,2978 :: 		system_reg[DIFF_DHW] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_downOnPress344:
;Controller_events_code.c,2979 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2980 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2981 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2982 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2983 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_DHW_downOnPress345:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_downOnPress345
NOP
NOP
NOP
;Controller_events_code.c,2984 :: 		}
L_end_Hyst_DHW_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_downOnPress
_Hyst_DHW_upOnUp:
;Controller_events_code.c,2985 :: 		void Hyst_DHW_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2986 :: 		Hyst_DHW_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2987 :: 		Image123.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2988 :: 		DrawImage(&Hyst_DHW_up);
MOVW	R0, #lo_addr(_Hyst_DHW_up+0)
MOVT	R0, #hi_addr(_Hyst_DHW_up+0)
BL	_DrawImage+0
;Controller_events_code.c,2989 :: 		}
L_end_Hyst_DHW_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_upOnUp
_Hyst_DHW_upOnPress:
;Controller_events_code.c,2990 :: 		void Hyst_DHW_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2992 :: 		Hyst_DHW_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2993 :: 		Image123.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2994 :: 		DrawImage(&Image123);
MOVW	R0, #lo_addr(_Image123+0)
MOVT	R0, #hi_addr(_Image123+0)
BL	_DrawImage+0
;Controller_events_code.c,2995 :: 		system_reg[DIFF_DHW]++;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2996 :: 		if (system_reg[DIFF_DHW] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_DHW_upOnPress347
;Controller_events_code.c,2997 :: 		system_reg[DIFF_DHW] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_upOnPress347:
;Controller_events_code.c,2998 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2999 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3000 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3001 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3002 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Hyst_DHW_upOnPress348:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_upOnPress348
NOP
NOP
NOP
;Controller_events_code.c,3003 :: 		}
L_end_Hyst_DHW_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_upOnPress
_Set_heat_onup:
;Controller_events_code.c,3004 :: 		void Set_heat_onup(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3005 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3006 :: 		Image135.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3007 :: 		Image128.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3008 :: 		DrawImage (&Image135);
MOVW	R0, #lo_addr(_Image135+0)
MOVT	R0, #hi_addr(_Image135+0)
BL	_DrawImage+0
;Controller_events_code.c,3009 :: 		}
L_end_Set_heat_onup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_onup
_Set_heat_OnDown:
;Controller_events_code.c,3010 :: 		void Set_heat_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3011 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3015 :: 		send_data_packet (DIFF_HEAT,1);
MOVS	R1, #1
MOVW	R0, #160
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3016 :: 		Image135.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3017 :: 		Image128.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3018 :: 		DrawImage (&Image128);
MOVW	R0, #lo_addr(_Image128+0)
MOVT	R0, #hi_addr(_Image128+0)
BL	_DrawImage+0
;Controller_events_code.c,3019 :: 		}
L_end_Set_heat_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_OnDown
_Set_cool_OnUp:
;Controller_events_code.c,3020 :: 		void Set_cool_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3021 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3022 :: 		Image138.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3023 :: 		Image129.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3024 :: 		DrawImage (&Image138);
MOVW	R0, #lo_addr(_Image138+0)
MOVT	R0, #hi_addr(_Image138+0)
BL	_DrawImage+0
;Controller_events_code.c,3025 :: 		}
L_end_Set_cool_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnUp
_Set_cool_OnDown:
;Controller_events_code.c,3026 :: 		void Set_cool_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3027 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3031 :: 		send_data_packet (DIFF_COOL,1);
MOVS	R1, #1
MOVW	R0, #140
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3032 :: 		Image138.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3033 :: 		Image129.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3034 :: 		DrawImage (&Image129);
MOVW	R0, #lo_addr(_Image129+0)
MOVT	R0, #hi_addr(_Image129+0)
BL	_DrawImage+0
;Controller_events_code.c,3035 :: 		}
L_end_Set_cool_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnDown
_Set_dhw_OnUp:
;Controller_events_code.c,3036 :: 		void Set_dhw_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3037 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3038 :: 		Set_DHW_HY.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3039 :: 		Image130.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3040 :: 		DrawImage (&Set_DHW_HY);
MOVW	R0, #lo_addr(_Set_DHW_HY+0)
MOVT	R0, #hi_addr(_Set_DHW_HY+0)
BL	_DrawImage+0
;Controller_events_code.c,3041 :: 		}
L_end_Set_dhw_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnUp
_Set_dhw_OnDown:
;Controller_events_code.c,3042 :: 		void Set_dhw_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3043 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3047 :: 		send_data_packet (DIFF_DHW,1);
MOVS	R1, #1
MOVW	R0, #150
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3048 :: 		Set_DHW_HY.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3049 :: 		Image130.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3050 :: 		DrawImage (&Image130);
MOVW	R0, #lo_addr(_Image130+0)
MOVT	R0, #hi_addr(_Image130+0)
BL	_DrawImage+0
;Controller_events_code.c,3051 :: 		}
L_end_Set_dhw_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnDown
_DEC_EEV2OnPress:
;Controller_events_code.c,3054 :: 		void DEC_EEV2OnPress() {
;Controller_events_code.c,3056 :: 		}
L_end_DEC_EEV2OnPress:
BX	LR
; end of _DEC_EEV2OnPress
_INC_EEV2OnPress:
;Controller_events_code.c,3057 :: 		void INC_EEV2OnPress() {
;Controller_events_code.c,3059 :: 		}
L_end_INC_EEV2OnPress:
BX	LR
; end of _INC_EEV2OnPress
_EEV2DownOnUp:
;Controller_events_code.c,3060 :: 		void EEV2DownOnUp() {
;Controller_events_code.c,3062 :: 		}
L_end_EEV2DownOnUp:
BX	LR
; end of _EEV2DownOnUp
_EEV2DownOnDown:
;Controller_events_code.c,3064 :: 		void EEV2DownOnDown() {
;Controller_events_code.c,3066 :: 		}
L_end_EEV2DownOnDown:
BX	LR
; end of _EEV2DownOnDown
_EEV2UpOnUp:
;Controller_events_code.c,3067 :: 		void EEV2UpOnUp() {
;Controller_events_code.c,3069 :: 		}
L_end_EEV2UpOnUp:
BX	LR
; end of _EEV2UpOnUp
_EEV2UpOnDown:
;Controller_events_code.c,3070 :: 		void EEV2UpOnDown() {
;Controller_events_code.c,3072 :: 		}
L_end_EEV2UpOnDown:
BX	LR
; end of _EEV2UpOnDown
_EEV2_AutoOnClick:
;Controller_events_code.c,3073 :: 		void EEV2_AutoOnClick() {
;Controller_events_code.c,3075 :: 		}
L_end_EEV2_AutoOnClick:
BX	LR
; end of _EEV2_AutoOnClick
_Mode_ground_onOnClick:
;Controller_events_code.c,3077 :: 		void  Mode_ground_onOnClick () {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3078 :: 		if ((unsigned long)Mode_ground_on.Picture_Name == mode_brine_jpg)
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
LDR	R1, [R0, #0]
MOVW	R0, #59698
MOVT	R0, #65
CMP	R1, R0
IT	NE
BNE	L_Mode_ground_onOnClick350
;Controller_events_code.c,3080 :: 		Mode_ground_on.Picture_Name = mode_air_jpg;
MOVW	R1, #52012
MOVT	R1, #65
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3081 :: 		DrawImage(&Mode_air_on);
MOVW	R0, #lo_addr(_Mode_air_on+0)
MOVT	R0, #hi_addr(_Mode_air_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3082 :: 		system_reg[AIRE_TO_WATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3083 :: 		ground_heat_pump=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3084 :: 		}
IT	AL
BAL	L_Mode_ground_onOnClick351
L_Mode_ground_onOnClick350:
;Controller_events_code.c,3086 :: 		Mode_ground_on.Picture_Name = mode_brine_jpg;
MOVW	R1, #59698
MOVT	R1, #65
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3087 :: 		DrawImage(&Mode_ground_on);
MOVW	R0, #lo_addr(_Mode_ground_on+0)
MOVT	R0, #hi_addr(_Mode_ground_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3088 :: 		system_reg[AIRE_TO_WATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3089 :: 		ground_heat_pump=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3090 :: 		}
L_Mode_ground_onOnClick351:
;Controller_events_code.c,3091 :: 		send_data_packet(AIRE_TO_WATER,1);
MOVS	R1, #1
MOVW	R0, #170
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3092 :: 		Delay_ms (300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_Mode_ground_onOnClick352:
SUBS	R7, R7, #1
BNE	L_Mode_ground_onOnClick352
NOP
NOP
NOP
;Controller_events_code.c,3093 :: 		}
L_end_Mode_ground_onOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Mode_ground_onOnClick
_Down_24_OnPress:
;Controller_events_code.c,3100 :: 		void Down_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3102 :: 		Image99.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3103 :: 		Image17.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3104 :: 		DrawImage(&Image99);
MOVW	R0, #lo_addr(_Image99+0)
MOVT	R0, #hi_addr(_Image99+0)
BL	_DrawImage+0
;Controller_events_code.c,3105 :: 		system_reg[LP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3106 :: 		if (system_reg[LP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_24_OnPress354
;Controller_events_code.c,3107 :: 		system_reg[LP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Down_24_OnPress354:
;Controller_events_code.c,3108 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3109 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3110 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3111 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3112 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_24_OnPress355:
SUBS	R7, R7, #1
BNE	L_Down_24_OnPress355
NOP
NOP
NOP
;Controller_events_code.c,3114 :: 		}
L_end_Down_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_24_OnPress
_Down_24_OnUp:
;Controller_events_code.c,3115 :: 		void Down_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3116 :: 		Image99.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3117 :: 		Image17.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3118 :: 		DrawImage(&Image17);
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
BL	_DrawImage+0
;Controller_events_code.c,3119 :: 		}
L_end_Down_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_24_OnUp
_Up_24_OnPress:
;Controller_events_code.c,3120 :: 		void Up_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3122 :: 		Image100.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3123 :: 		Image12.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3124 :: 		DrawImage(&Image100);
MOVW	R0, #lo_addr(_Image100+0)
MOVT	R0, #hi_addr(_Image100+0)
BL	_DrawImage+0
;Controller_events_code.c,3125 :: 		system_reg[LP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3126 :: 		if (system_reg[LP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_24_OnPress357
;Controller_events_code.c,3127 :: 		system_reg[LP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Up_24_OnPress357:
;Controller_events_code.c,3128 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3129 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3130 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3131 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3132 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_24_OnPress358:
SUBS	R7, R7, #1
BNE	L_Up_24_OnPress358
NOP
NOP
NOP
;Controller_events_code.c,3134 :: 		}
L_end_Up_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_24_OnPress
_Up_24_OnUp:
;Controller_events_code.c,3135 :: 		void Up_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3136 :: 		Image100.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3137 :: 		Image12.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3138 :: 		DrawImage(&Image12);
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
BL	_DrawImage+0
;Controller_events_code.c,3139 :: 		}
L_end_Up_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_24_OnUp
_Down_25_OnPress:
;Controller_events_code.c,3140 :: 		void Down_25_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3142 :: 		Image280.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3143 :: 		Image18.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3144 :: 		DrawImage(&Image280);
MOVW	R0, #lo_addr(_Image280+0)
MOVT	R0, #hi_addr(_Image280+0)
BL	_DrawImage+0
;Controller_events_code.c,3145 :: 		system_reg[LP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3146 :: 		if (system_reg[LP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_25_OnPress360
;Controller_events_code.c,3147 :: 		system_reg[LP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Down_25_OnPress360:
;Controller_events_code.c,3148 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3149 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3150 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3151 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3152 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_25_OnPress361:
SUBS	R7, R7, #1
BNE	L_Down_25_OnPress361
NOP
NOP
NOP
;Controller_events_code.c,3154 :: 		}
L_end_Down_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_25_OnPress
_Down_25_OnUp:
;Controller_events_code.c,3155 :: 		void Down_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3156 :: 		Image280.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3157 :: 		Image18.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3158 :: 		DrawImage(&Image18);
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
BL	_DrawImage+0
;Controller_events_code.c,3160 :: 		}
L_end_Down_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_25_OnUp
_Up_25_OnPress:
;Controller_events_code.c,3161 :: 		void Up_25_OnPress(){
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Controller_events_code.c,3163 :: 		Image281.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3164 :: 		Image14.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3165 :: 		DrawImage(&Image281);
MOVW	R0, #lo_addr(_Image281+0)
MOVT	R0, #hi_addr(_Image281+0)
BL	_DrawImage+0
;Controller_events_code.c,3166 :: 		system_reg[LP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3167 :: 		if (system_reg[LP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_25_OnPress363
;Controller_events_code.c,3168 :: 		system_reg[LP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Up_25_OnPress363:
;Controller_events_code.c,3169 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3170 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3171 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3172 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3173 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_25_OnPress364:
SUBS	R7, R7, #1
BNE	L_Up_25_OnPress364
NOP
NOP
NOP
;Controller_events_code.c,3174 :: 		}
L_end_Up_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Up_25_OnPress
_Up_25_OnUp:
;Controller_events_code.c,3175 :: 		void Up_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3176 :: 		Image281.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3177 :: 		Image14.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3178 :: 		DrawImage(&Image14);
MOVW	R0, #lo_addr(_Image14+0)
MOVT	R0, #hi_addr(_Image14+0)
BL	_DrawImage+0
;Controller_events_code.c,3179 :: 		}
L_end_Up_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_25_OnUp
_Down_26_OnPress:
;Controller_events_code.c,3180 :: 		void Down_26_OnPress() {
;Controller_events_code.c,3182 :: 		}
L_end_Down_26_OnPress:
BX	LR
; end of _Down_26_OnPress
_Down_26_OnUp:
;Controller_events_code.c,3183 :: 		void Down_26_OnUp() {
;Controller_events_code.c,3185 :: 		}
L_end_Down_26_OnUp:
BX	LR
; end of _Down_26_OnUp
_UP_26_OnPress:
;Controller_events_code.c,3186 :: 		void UP_26_OnPress() {
;Controller_events_code.c,3188 :: 		}
L_end_UP_26_OnPress:
BX	LR
; end of _UP_26_OnPress
_UP_26_OnUp:
;Controller_events_code.c,3189 :: 		void UP_26_OnUp() {
;Controller_events_code.c,3191 :: 		}
L_end_UP_26_OnUp:
BX	LR
; end of _UP_26_OnUp
_Set_24_OnDown:
;Controller_events_code.c,3192 :: 		void Set_24_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3193 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3197 :: 		send_data_packet(LP_MAX,1);
MOVS	R1, #1
MOVW	R0, #230
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3198 :: 		Image279.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3199 :: 		Image29.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3200 :: 		DrawImage (&Image29);
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
BL	_DrawImage+0
;Controller_events_code.c,3201 :: 		}
L_end_Set_24_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnDown
_Set_24_OnUp:
;Controller_events_code.c,3202 :: 		void Set_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3203 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3204 :: 		Image279.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3205 :: 		Image29.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3206 :: 		DrawImage (&Image279);
MOVW	R0, #lo_addr(_Image279+0)
MOVT	R0, #hi_addr(_Image279+0)
BL	_DrawImage+0
;Controller_events_code.c,3207 :: 		}
L_end_Set_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnUp
_Set_25_OnDown:
;Controller_events_code.c,3208 :: 		void Set_25_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3209 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3213 :: 		send_data_packet(LP_MIN,1);
MOVS	R1, #1
MOVW	R0, #250
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3214 :: 		Image282.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3215 :: 		Image22.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3216 :: 		DrawImage (&Image22);
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
BL	_DrawImage+0
;Controller_events_code.c,3217 :: 		}
L_end_Set_25_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnDown
_Set_25_OnUp:
;Controller_events_code.c,3218 :: 		void Set_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3219 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3220 :: 		Image282.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3221 :: 		Image22.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3222 :: 		DrawImage (&Image282);
MOVW	R0, #lo_addr(_Image282+0)
MOVT	R0, #hi_addr(_Image282+0)
BL	_DrawImage+0
;Controller_events_code.c,3223 :: 		}
L_end_Set_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnUp
_Set_26_OnDown:
;Controller_events_code.c,3224 :: 		void Set_26_OnDown() {
;Controller_events_code.c,3226 :: 		}
L_end_Set_26_OnDown:
BX	LR
; end of _Set_26_OnDown
_Set_26_OnUp:
;Controller_events_code.c,3227 :: 		void Set_26_OnUp() {
;Controller_events_code.c,3229 :: 		}
L_end_Set_26_OnUp:
BX	LR
; end of _Set_26_OnUp
_Set_phase_check:
;Controller_events_code.c,3230 :: 		void Set_phase_check(){
;Controller_events_code.c,3232 :: 		}
L_end_Set_phase_check:
BX	LR
; end of _Set_phase_check
_Set_voltage_check:
;Controller_events_code.c,3233 :: 		void Set_voltage_check(){
;Controller_events_code.c,3235 :: 		}
L_end_Set_voltage_check:
BX	LR
; end of _Set_voltage_check
_Down_13_OnUp:
;Controller_events_code.c,3238 :: 		void Down_13_OnUp() {
;Controller_events_code.c,3240 :: 		}
L_end_Down_13_OnUp:
BX	LR
; end of _Down_13_OnUp
_Down_13_OnPress:
;Controller_events_code.c,3241 :: 		void Down_13_OnPress() {
;Controller_events_code.c,3242 :: 		}
L_end_Down_13_OnPress:
BX	LR
; end of _Down_13_OnPress
_Up_13_OnPress:
;Controller_events_code.c,3243 :: 		void Up_13_OnPress() {
;Controller_events_code.c,3245 :: 		}
L_end_Up_13_OnPress:
BX	LR
; end of _Up_13_OnPress
_Up_13_OnUp:
;Controller_events_code.c,3246 :: 		void Up_13_OnUp() {
;Controller_events_code.c,3248 :: 		}
L_end_Up_13_OnUp:
BX	LR
; end of _Up_13_OnUp
_Down_14_OnPress:
;Controller_events_code.c,3250 :: 		void Down_14_OnPress() {
;Controller_events_code.c,3252 :: 		}
L_end_Down_14_OnPress:
BX	LR
; end of _Down_14_OnPress
_Down_14_OnUp:
;Controller_events_code.c,3253 :: 		void Down_14_OnUp() {
;Controller_events_code.c,3255 :: 		}
L_end_Down_14_OnUp:
BX	LR
; end of _Down_14_OnUp
_Up_14_OnPress:
;Controller_events_code.c,3256 :: 		void Up_14_OnPress() {
;Controller_events_code.c,3258 :: 		}
L_end_Up_14_OnPress:
BX	LR
; end of _Up_14_OnPress
_Up_14_OnUp:
;Controller_events_code.c,3259 :: 		void Up_14_OnUp() {
;Controller_events_code.c,3261 :: 		}
L_end_Up_14_OnUp:
BX	LR
; end of _Up_14_OnUp
_Down_15_OnPress:
;Controller_events_code.c,3262 :: 		void Down_15_OnPress() {
;Controller_events_code.c,3264 :: 		}
L_end_Down_15_OnPress:
BX	LR
; end of _Down_15_OnPress
_Down_15_OnUp:
;Controller_events_code.c,3265 :: 		void Down_15_OnUp() {
;Controller_events_code.c,3267 :: 		}
L_end_Down_15_OnUp:
BX	LR
; end of _Down_15_OnUp
_Up_15_OnPress:
;Controller_events_code.c,3268 :: 		void Up_15_OnPress() {
;Controller_events_code.c,3270 :: 		}
L_end_Up_15_OnPress:
BX	LR
; end of _Up_15_OnPress
_Up_15_OnUp:
;Controller_events_code.c,3271 :: 		void Up_15_OnUp() {
;Controller_events_code.c,3273 :: 		}
L_end_Up_15_OnUp:
BX	LR
; end of _Up_15_OnUp
_Down_16_OnPress:
;Controller_events_code.c,3274 :: 		void Down_16_OnPress() {
;Controller_events_code.c,3276 :: 		}
L_end_Down_16_OnPress:
BX	LR
; end of _Down_16_OnPress
_Down_16_OnUp:
;Controller_events_code.c,3277 :: 		void Down_16_OnUp() {
;Controller_events_code.c,3279 :: 		}
L_end_Down_16_OnUp:
BX	LR
; end of _Down_16_OnUp
_Up_16_OnPress:
;Controller_events_code.c,3280 :: 		void Up_16_OnPress() {
;Controller_events_code.c,3282 :: 		}
L_end_Up_16_OnPress:
BX	LR
; end of _Up_16_OnPress
_Up_16_OnUp:
;Controller_events_code.c,3283 :: 		void Up_16_OnUp() {
;Controller_events_code.c,3285 :: 		}
L_end_Up_16_OnUp:
BX	LR
; end of _Up_16_OnUp
_Down_17_OnPress:
;Controller_events_code.c,3286 :: 		void Down_17_OnPress() {      // Electric heater preset setting
;Controller_events_code.c,3288 :: 		}
L_end_Down_17_OnPress:
BX	LR
; end of _Down_17_OnPress
_Down_17_OnUp:
;Controller_events_code.c,3289 :: 		void Down_17_OnUp() {
;Controller_events_code.c,3291 :: 		}
L_end_Down_17_OnUp:
BX	LR
; end of _Down_17_OnUp
_Up_17_OnPress:
;Controller_events_code.c,3292 :: 		void Up_17_OnPress() {
;Controller_events_code.c,3294 :: 		}
L_end_Up_17_OnPress:
BX	LR
; end of _Up_17_OnPress
_Up_17_OnUp:
;Controller_events_code.c,3295 :: 		void Up_17_OnUp() {
;Controller_events_code.c,3297 :: 		}
L_end_Up_17_OnUp:
BX	LR
; end of _Up_17_OnUp
_Down_18_OnPress:
;Controller_events_code.c,3298 :: 		void Down_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3300 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3301 :: 		Image481.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3302 :: 		Down_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3303 :: 		DrawImage(&Image481);
MOVW	R0, #lo_addr(_Image481+0)
MOVT	R0, #hi_addr(_Image481+0)
BL	_DrawImage+0
;Controller_events_code.c,3304 :: 		system_reg[S_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3305 :: 		if (system_reg[S_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_18_OnPress366
;Controller_events_code.c,3306 :: 		system_reg[S_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Down_18_OnPress366:
;Controller_events_code.c,3307 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3308 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3309 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3310 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3311 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Down_18_OnPress367:
SUBS	R7, R7, #1
BNE	L_Down_18_OnPress367
NOP
NOP
NOP
;Controller_events_code.c,3312 :: 		}
L_end_Down_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_18_OnPress
_Down_18_OnUp:
;Controller_events_code.c,3313 :: 		void Down_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3314 :: 		Image481.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3315 :: 		Down_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3316 :: 		DrawImage(&Down_18_);
MOVW	R0, #lo_addr(_Down_18_+0)
MOVT	R0, #hi_addr(_Down_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3317 :: 		}
L_end_Down_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_18_OnUp
_Up_18_OnPress:
;Controller_events_code.c,3318 :: 		void Up_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3320 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,3321 :: 		Image477.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3322 :: 		Up_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3323 :: 		DrawImage(&Image477);
MOVW	R0, #lo_addr(_Image477+0)
MOVT	R0, #hi_addr(_Image477+0)
BL	_DrawImage+0
;Controller_events_code.c,3324 :: 		system_reg[S_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3325 :: 		if (system_reg[S_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_18_OnPress369
;Controller_events_code.c,3326 :: 		system_reg[S_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Up_18_OnPress369:
;Controller_events_code.c,3327 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3328 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3329 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3330 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3331 :: 		Delay_ms (100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_Up_18_OnPress370:
SUBS	R7, R7, #1
BNE	L_Up_18_OnPress370
NOP
NOP
NOP
;Controller_events_code.c,3332 :: 		}
L_end_Up_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_18_OnPress
_Up_18_OnUp:
;Controller_events_code.c,3333 :: 		void Up_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3334 :: 		Image477.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3335 :: 		Up_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3336 :: 		DrawImage(&Up_18_);
MOVW	R0, #lo_addr(_Up_18_+0)
MOVT	R0, #hi_addr(_Up_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3337 :: 		}
L_end_Up_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_18_OnUp
_Set_15_OnUp:
;Controller_events_code.c,3338 :: 		void Set_15_OnUp() {
;Controller_events_code.c,3340 :: 		}
L_end_Set_15_OnUp:
BX	LR
; end of _Set_15_OnUp
_Set_15_OnDown:
;Controller_events_code.c,3341 :: 		void Set_15_OnDown() {
;Controller_events_code.c,3343 :: 		}
L_end_Set_15_OnDown:
BX	LR
; end of _Set_15_OnDown
_Set_16_OnUp:
;Controller_events_code.c,3344 :: 		void Set_16_OnUp() {
;Controller_events_code.c,3346 :: 		}
L_end_Set_16_OnUp:
BX	LR
; end of _Set_16_OnUp
_Set_16_OnDown:
;Controller_events_code.c,3347 :: 		void Set_16_OnDown() {
;Controller_events_code.c,3349 :: 		}
L_end_Set_16_OnDown:
BX	LR
; end of _Set_16_OnDown
_Set_17_OnUp:
;Controller_events_code.c,3350 :: 		void Set_17_OnUp () {
;Controller_events_code.c,3352 :: 		}
L_end_Set_17_OnUp:
BX	LR
; end of _Set_17_OnUp
_Set_17_OnDown:
;Controller_events_code.c,3353 :: 		void Set_17_OnDown() {
;Controller_events_code.c,3355 :: 		}
L_end_Set_17_OnDown:
BX	LR
; end of _Set_17_OnDown
_Set_18_OnUp:
;Controller_events_code.c,3356 :: 		void Set_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3357 :: 		Set_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3358 :: 		Image485.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3359 :: 		DrawImage (&Set_18_);
MOVW	R0, #lo_addr(_Set_18_+0)
MOVT	R0, #hi_addr(_Set_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3360 :: 		}
L_end_Set_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnUp
_Set_18_OnDown:
;Controller_events_code.c,3361 :: 		void Set_18_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3362 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3364 :: 		send_data_packet(S_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #290
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3365 :: 		Set_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3366 :: 		Image485.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3367 :: 		DrawImage (&Image485);
MOVW	R0, #lo_addr(_Image485+0)
MOVT	R0, #hi_addr(_Image485+0)
BL	_DrawImage+0
;Controller_events_code.c,3368 :: 		}
L_end_Set_18_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnDown
_Set_14_OnDown:
;Controller_events_code.c,3369 :: 		void Set_14_OnDown() {
;Controller_events_code.c,3371 :: 		}
L_end_Set_14_OnDown:
BX	LR
; end of _Set_14_OnDown
_Set_14_OnUp:
;Controller_events_code.c,3372 :: 		void Set_14_OnUp(){
;Controller_events_code.c,3373 :: 		}
L_end_Set_14_OnUp:
BX	LR
; end of _Set_14_OnUp
_Set_13_OnUp:
;Controller_events_code.c,3374 :: 		void Set_13_OnUp() {
;Controller_events_code.c,3376 :: 		}
L_end_Set_13_OnUp:
BX	LR
; end of _Set_13_OnUp
_Set_13_OnDown:
;Controller_events_code.c,3377 :: 		void Set_13_OnDown() {
;Controller_events_code.c,3379 :: 		}
L_end_Set_13_OnDown:
BX	LR
; end of _Set_13_OnDown
