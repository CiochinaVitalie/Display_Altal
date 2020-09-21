_Tone1:
;Controller_events_code.c,48 :: 		void Tone1() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,49 :: 		Sound_Play(659, 35);   //
MOVS	R1, #35
MOVW	R0, #659
BL	_Sound_Play+0
;Controller_events_code.c,50 :: 		}
L_end_Tone1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone1
_Tone2:
;Controller_events_code.c,51 :: 		void Tone2() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,52 :: 		Sound_Play(698, 50);   //
MOVS	R1, #50
MOVW	R0, #698
BL	_Sound_Play+0
;Controller_events_code.c,53 :: 		}
L_end_Tone2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone2
_Tone3:
;Controller_events_code.c,54 :: 		void Tone3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,55 :: 		Sound_Play(784, 70);   //
MOVS	R1, #70
MOVW	R0, #784
BL	_Sound_Play+0
;Controller_events_code.c,56 :: 		}
L_end_Tone3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone3
_BLED_Fade_Out:
;Controller_events_code.c,57 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,60 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
; i end address is: 4 (R1)
L_BLED_Fade_Out0:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_BLED_Fade_Out1
;Controller_events_code.c,61 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,62 :: 		Delay_us(500);
MOVW	R7, #24998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_Out3:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_Out3
NOP
NOP
NOP
;Controller_events_code.c,60 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,63 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out0
L_BLED_Fade_Out1:
;Controller_events_code.c,64 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,65 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;Controller_events_code.c,66 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,69 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
; i end address is: 4 (R1)
L_BLED_Fade_In5:
; i start address is: 4 (R1)
CMP	R1, #255
IT	CS
BCS	L_BLED_Fade_In6
;Controller_events_code.c,70 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,71 :: 		Delay_us(500);
MOVW	R7, #24998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_In8:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_In8
NOP
NOP
NOP
;Controller_events_code.c,69 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,72 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In5
L_BLED_Fade_In6:
;Controller_events_code.c,73 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,74 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_BackToHome:
;Controller_events_code.c,78 :: 		void BackToHome(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,79 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,80 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,81 :: 		DrawScreen(&HOME);
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
BL	_DrawScreen+0
;Controller_events_code.c,82 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,83 :: 		}
L_end_BackToHome:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackToHome
_goToBack:
;Controller_events_code.c,84 :: 		void goToBack(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,85 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,88 :: 		if( num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_goToBack10
;Controller_events_code.c,90 :: 		if(CurrentScreen == &SYSTEM_SET)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In(); }
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
;Controller_events_code.c,91 :: 		else if (CurrentScreen==&ERRORS)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,92 :: 		else if (CurrentScreen==&SENSOR1)                {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,93 :: 		else if (CurrentScreen==&SETTINGS)               {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,94 :: 		else if (CurrentScreen==&ENERGY)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,95 :: 		else if (CurrentScreen==&DEFROST)                {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_DEFROST+0)
MOVT	R0, #hi_addr(_DEFROST+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack21
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack22
L_goToBack21:
;Controller_events_code.c,96 :: 		else if (CurrentScreen==&SetRTC)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SetRTC+0)
MOVT	R0, #hi_addr(_SetRTC+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack23
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack24
L_goToBack23:
;Controller_events_code.c,97 :: 		else if(CurrentScreen == &EEV)                   {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
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
;Controller_events_code.c,98 :: 		else if(CurrentScreen == &MODE)                  {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
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
;Controller_events_code.c,99 :: 		else if(CurrentScreen == &DELAY_MENU)            {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack29
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack30
L_goToBack29:
;Controller_events_code.c,100 :: 		else if(CurrentScreen == &LIMITS1)               {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack31
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack32
L_goToBack31:
;Controller_events_code.c,101 :: 		else if(CurrentScreen == &SYSTEM_EVENTS)         {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack33
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack34
L_goToBack33:
;Controller_events_code.c,102 :: 		else if (CurrentScreen==&LIMITS2)                {BLED_Fade_Out();DrawScreen(&LIMITS1);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack35
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack36
L_goToBack35:
;Controller_events_code.c,103 :: 		else if (CurrentScreen==&LIMITS3)                {BLED_Fade_Out();DrawScreen(&LIMITS2);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack37
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack38
L_goToBack37:
;Controller_events_code.c,104 :: 		else if (CurrentScreen==&LIMITS4)                {BLED_Fade_Out();DrawScreen(&LIMITS3);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack39
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack40
L_goToBack39:
;Controller_events_code.c,105 :: 		else if (CurrentScreen==&LIMITS5)                {BLED_Fade_Out();DrawScreen(&LIMITS4);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack41
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack42
L_goToBack41:
;Controller_events_code.c,106 :: 		else if (CurrentScreen==&MODE2)                  {BLED_Fade_Out();DrawScreen(&MODE);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack43
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
L_goToBack43:
L_goToBack42:
L_goToBack40:
L_goToBack38:
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
;Controller_events_code.c,107 :: 		}
IT	AL
BAL	L_goToBack44
L_goToBack10:
;Controller_events_code.c,108 :: 		else num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
L_goToBack44:
;Controller_events_code.c,111 :: 		}
L_end_goToBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _goToBack
_nextPage:
;Controller_events_code.c,112 :: 		void nextPage()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,114 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,116 :: 		if( num_page==0 && two_compressors_mode)  num_page=1;
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__nextPage467
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__nextPage466
L__nextPage465:
MOVS	R1, #1
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
L__nextPage467:
L__nextPage466:
;Controller_events_code.c,117 :: 		if (CurrentScreen==&LIMITS1){BLED_Fade_Out();DrawScreen(&LIMITS2);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage48
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage49
L_nextPage48:
;Controller_events_code.c,118 :: 		else if (CurrentScreen==&LIMITS2){BLED_Fade_Out();DrawScreen(&LIMITS3);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage50
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage51
L_nextPage50:
;Controller_events_code.c,119 :: 		else if (CurrentScreen==&LIMITS3){BLED_Fade_Out();DrawScreen(&LIMITS4);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage52
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage53
L_nextPage52:
;Controller_events_code.c,120 :: 		else if (CurrentScreen==&LIMITS4){BLED_Fade_Out();DrawScreen(&LIMITS5);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage54
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage55
L_nextPage54:
;Controller_events_code.c,121 :: 		else if (CurrentScreen==&MODE){BLED_Fade_Out();DrawScreen(&MODE2);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage56
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
L_nextPage56:
L_nextPage55:
L_nextPage53:
L_nextPage51:
L_nextPage49:
;Controller_events_code.c,123 :: 		}
L_end_nextPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nextPage
_selectPage:
;Controller_events_code.c,124 :: 		void selectPage(){
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Controller_events_code.c,129 :: 		if (lastScreen!=CurrentScreen) {countPacket=1; lastScreen=CurrentScreen;  }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(selectPage_lastScreen_L0+0)
MOVT	R0, #hi_addr(selectPage_lastScreen_L0+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_selectPage57
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
L_selectPage57:
;Controller_events_code.c,130 :: 		if (CurrentScreen==&HOME)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage58
;Controller_events_code.c,133 :: 		main_page();
BL	_main_page+0
;Controller_events_code.c,134 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage59
;Controller_events_code.c,136 :: 		case 1:reciev_data_packet(BAC_TEMP,5); break;
L_selectPage61:
MOVS	R1, #5
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage60
;Controller_events_code.c,142 :: 		case 2:countPacket=1;break;
L_selectPage62:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage60
;Controller_events_code.c,143 :: 		}
L_selectPage59:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage61
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage62
L_selectPage60:
;Controller_events_code.c,144 :: 		}
IT	AL
BAL	L_selectPage63
L_selectPage58:
;Controller_events_code.c,146 :: 		else if(CurrentScreen==&SENSOR1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage64
;Controller_events_code.c,148 :: 		sensor_1(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_sensor_1+0
;Controller_events_code.c,150 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage65
;Controller_events_code.c,152 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage66
;Controller_events_code.c,154 :: 		case 1: reciev_data_packet(BAC_TEMP,14);break;//
L_selectPage68:
MOVS	R1, #14
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage67
;Controller_events_code.c,156 :: 		case 2:  countPacket=1;break;
L_selectPage69:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage67
;Controller_events_code.c,157 :: 		}
L_selectPage66:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage68
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage69
L_selectPage67:
;Controller_events_code.c,158 :: 		if(strcmp(CircleButton10.Caption,"1")!=0){CircleButton10.Caption="1";DrawCircleButton(&CircleButton10);  }
MOVW	R1, #lo_addr(?lstr1_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr1_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage70
MOVW	R1, #lo_addr(?lstr2_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr2_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton10+0)
MOVT	R0, #hi_addr(_CircleButton10+0)
BL	_DrawCircleButton+0
L_selectPage70:
;Controller_events_code.c,159 :: 		}
IT	AL
BAL	L_selectPage71
L_selectPage65:
;Controller_events_code.c,162 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage72
;Controller_events_code.c,164 :: 		case 1: reciev_data_packet(BAC_TEMP,2);break;
L_selectPage74:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage73
;Controller_events_code.c,165 :: 		case 2: reciev_data_packet(SOURC_IN_2,12);break;
L_selectPage75:
MOVS	R1, #12
MOVW	R0, #92
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage73
;Controller_events_code.c,166 :: 		case 3:  countPacket=1;break;
L_selectPage76:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage73
;Controller_events_code.c,167 :: 		}
L_selectPage72:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage74
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage75
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage76
L_selectPage73:
;Controller_events_code.c,168 :: 		if(strcmp(CircleButton10.Caption,"2")!=0) {CircleButton10.Caption="2";DrawCircleButton(&CircleButton10);Back_b10.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr3_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr3_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage77
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
L_selectPage77:
;Controller_events_code.c,169 :: 		}
L_selectPage71:
;Controller_events_code.c,170 :: 		}
IT	AL
BAL	L_selectPage78
L_selectPage64:
;Controller_events_code.c,173 :: 		else if(CurrentScreen==&GAUGE1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage79
;Controller_events_code.c,175 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage80
;Controller_events_code.c,177 :: 		LP_display(system_reg[LOW_PRESS_1]),HP_display(system_reg[HIGH_PRESS_1]);reciev_data_packet(HIGH_PRESS_1,2);
MOVW	R0, #lo_addr(_system_reg+382)
MOVT	R0, #hi_addr(_system_reg+382)
LDRSH	R0, [R0, #0]
BL	_LP_display+0
MOVW	R0, #lo_addr(_system_reg+362)
MOVT	R0, #hi_addr(_system_reg+362)
LDRSH	R0, [R0, #0]
BL	_HP_display+0
MOVS	R1, #2
MOVW	R0, #181
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,178 :: 		if(strcmp(CircleButton8.Caption,"1")!=0) {CircleButton8.Caption="1";DrawCircleButton(&CircleButton8);Next_b2.Caption="NEXT";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=nextPage;}
MOVW	R1, #lo_addr(?lstr5_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr5_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage81
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
L_selectPage81:
;Controller_events_code.c,179 :: 		}
IT	AL
BAL	L_selectPage82
L_selectPage80:
;Controller_events_code.c,182 :: 		LP_display(system_reg[LOW_PRESS_2]),HP_display(system_reg[HIGH_PRESS_2]);reciev_data_packet(HIGH_PRESS_2,2);
MOVW	R0, #lo_addr(_system_reg+384)
MOVT	R0, #hi_addr(_system_reg+384)
LDRSH	R0, [R0, #0]
BL	_LP_display+0
MOVW	R0, #lo_addr(_system_reg+364)
MOVT	R0, #hi_addr(_system_reg+364)
LDRSH	R0, [R0, #0]
BL	_HP_display+0
MOVS	R1, #2
MOVW	R0, #182
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,183 :: 		if(strcmp(CircleButton8.Caption,"2")!=0){CircleButton8.Caption="2";DrawCircleButton(&CircleButton8);Next_b2.Caption="BACK";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr8_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr8_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage83
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
L_selectPage83:
;Controller_events_code.c,184 :: 		}
L_selectPage82:
;Controller_events_code.c,185 :: 		}
IT	AL
BAL	L_selectPage84
L_selectPage79:
;Controller_events_code.c,186 :: 		else if(CurrentScreen==&EEV)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage85
;Controller_events_code.c,188 :: 		count_steps(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_count_steps+0
;Controller_events_code.c,189 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage86
;Controller_events_code.c,191 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage87
;Controller_events_code.c,193 :: 		case 1:reciev_data_packet(TRV_STEPS_1,1); break;
L_selectPage89:
MOVS	R1, #1
MOVW	R0, #61
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage88
;Controller_events_code.c,194 :: 		case 2:reciev_data_packet(S_HEAT_1,1); break;
L_selectPage90:
MOVS	R1, #1
MOVW	R0, #151
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage88
;Controller_events_code.c,195 :: 		case 3:reciev_data_packet(TRV_CORRECT_1,1); break;
L_selectPage91:
MOVS	R1, #1
MOVW	R0, #391
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage88
;Controller_events_code.c,196 :: 		case 4:  countPacket=1;break;
L_selectPage92:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage88
;Controller_events_code.c,197 :: 		}
L_selectPage87:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage89
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage90
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage91
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage92
L_selectPage88:
;Controller_events_code.c,198 :: 		if(strcmp(CircleButton9.Caption,"1")!=0) {
MOVW	R1, #lo_addr(?lstr11_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr11_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage93
;Controller_events_code.c,199 :: 		CircleButton9.Caption="1";DrawCircleButton(&CircleButton9);
MOVW	R1, #lo_addr(?lstr12_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr12_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton9+0)
MOVT	R0, #hi_addr(_CircleButton9+0)
BL	_DrawCircleButton+0
;Controller_events_code.c,200 :: 		IntToStr(system_reg[TRV_CORRECT_1], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,201 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,202 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,203 :: 		Red_bar.Position = system_reg[TRV_STEPS_1]; UpdatePBPosition(&Red_bar);
MOVW	R0, #lo_addr(_system_reg+122)
MOVT	R0, #hi_addr(_system_reg+122)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Red_bar+44)
MOVT	R0, #hi_addr(_Red_bar+44)
STRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_UpdatePBPosition+0
;Controller_events_code.c,204 :: 		}
L_selectPage93:
;Controller_events_code.c,205 :: 		}
IT	AL
BAL	L_selectPage94
L_selectPage86:
;Controller_events_code.c,208 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage95
;Controller_events_code.c,210 :: 		case 1:reciev_data_packet(TRV_STEPS_2,1); break;
L_selectPage97:
MOVS	R1, #1
MOVW	R0, #62
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage96
;Controller_events_code.c,211 :: 		case 2:reciev_data_packet(S_HEAT_2,1); break;
L_selectPage98:
MOVS	R1, #1
MOVW	R0, #152
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage96
;Controller_events_code.c,212 :: 		case 3:reciev_data_packet(TRV_CORRECT_2,1); break;
L_selectPage99:
MOVS	R1, #1
MOVW	R0, #392
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage96
;Controller_events_code.c,213 :: 		case 4:  countPacket=1;break;
L_selectPage100:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage96
;Controller_events_code.c,214 :: 		}
L_selectPage95:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage97
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage98
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage99
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage100
L_selectPage96:
;Controller_events_code.c,215 :: 		if(strcmp(CircleButton9.Caption,"2")!=0) {
MOVW	R1, #lo_addr(?lstr13_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr13_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage101
;Controller_events_code.c,216 :: 		CircleButton9.Caption="2";DrawCircleButton(&CircleButton9);
MOVW	R1, #lo_addr(?lstr14_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr14_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton9+0)
MOVT	R0, #hi_addr(_CircleButton9+0)
BL	_DrawCircleButton+0
;Controller_events_code.c,217 :: 		IntToStr(system_reg[TRV_CORRECT_2], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,218 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,219 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,220 :: 		Red_bar.Position = system_reg[TRV_STEPS_2]; UpdatePBPosition(&Red_bar);
MOVW	R0, #lo_addr(_system_reg+124)
MOVT	R0, #hi_addr(_system_reg+124)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Red_bar+44)
MOVT	R0, #hi_addr(_Red_bar+44)
STRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_UpdatePBPosition+0
;Controller_events_code.c,221 :: 		Back_b2.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(_goToBack+0)
MOVT	R1, #hi_addr(_goToBack+0)
MOVW	R0, #lo_addr(_Back_b2+60)
MOVT	R0, #hi_addr(_Back_b2+60)
STR	R1, [R0, #0]
L_selectPage101:
;Controller_events_code.c,222 :: 		}
L_selectPage94:
;Controller_events_code.c,223 :: 		}
IT	AL
BAL	L_selectPage102
L_selectPage85:
;Controller_events_code.c,225 :: 		else if(CurrentScreen==&SYSTEM_EVENTS)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage103
;Controller_events_code.c,227 :: 		working_time(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_working_time+0
;Controller_events_code.c,228 :: 		if(num_page==0) {
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage104
;Controller_events_code.c,229 :: 		reciev_data_packet(TIM_COM_1,4);
MOVS	R1, #4
MOVW	R0, #341
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,230 :: 		if(strcmp(CircleButton6.Caption,"1")!=0) {CircleButton6.Caption="1";DrawCircleButton(&CircleButton6);}
MOVW	R1, #lo_addr(?lstr15_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr15_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage105
MOVW	R1, #lo_addr(?lstr16_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr16_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton6+0)
MOVT	R0, #hi_addr(_CircleButton6+0)
BL	_DrawCircleButton+0
L_selectPage105:
;Controller_events_code.c,231 :: 		}
IT	AL
BAL	L_selectPage106
L_selectPage104:
;Controller_events_code.c,233 :: 		reciev_data_packet(TIM_COM_2,4);
MOVS	R1, #4
MOVW	R0, #342
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,234 :: 		if(strcmp(CircleButton6.Caption,"2")!=0) {CircleButton6.Caption="2";DrawCircleButton(&CircleButton6);Back_b7.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr17_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr17_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage107
MOVW	R1, #lo_addr(?lstr18_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr18_Controller_events_code+0)
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
L_selectPage107:
;Controller_events_code.c,235 :: 		}
L_selectPage106:
;Controller_events_code.c,237 :: 		}
IT	AL
BAL	L_selectPage108
L_selectPage103:
;Controller_events_code.c,238 :: 		else if(CurrentScreen==&Schema1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage109
;Controller_events_code.c,240 :: 		schema1_page();
BL	_schema1_page+0
;Controller_events_code.c,241 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage110
;Controller_events_code.c,243 :: 		case 1:reciev_data_packet(BAC_TEMP,2); break;
L_selectPage112:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,244 :: 		case 2:reciev_data_packet(CONDENS_TEMP_1,11); break;
L_selectPage113:
MOVS	R1, #11
MOVW	R0, #121
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,245 :: 		case 3:reciev_data_packet(COM_STATE_1,5); break;
L_selectPage114:
MOVS	R1, #5
MOVW	R0, #11
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,246 :: 		case 4:  countPacket=1;break;
L_selectPage115:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage111
;Controller_events_code.c,247 :: 		}
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
;Controller_events_code.c,248 :: 		}
IT	AL
BAL	L_selectPage116
L_selectPage109:
;Controller_events_code.c,249 :: 		else if (CurrentScreen==&Schema2)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage117
;Controller_events_code.c,251 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage118
;Controller_events_code.c,253 :: 		case 1:reciev_data_packet(BAC_TEMP,2); break;
L_selectPage120:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage119
;Controller_events_code.c,254 :: 		case 2:reciev_data_packet(CONDENS_TEMP_2,11); break;
L_selectPage121:
MOVS	R1, #11
MOVW	R0, #122
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage119
;Controller_events_code.c,255 :: 		case 3:reciev_data_packet(COM_STATE_2,5); break;
L_selectPage122:
MOVS	R1, #5
MOVW	R0, #12
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage119
;Controller_events_code.c,256 :: 		case 4:  countPacket=1;break;
L_selectPage123:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage119
;Controller_events_code.c,257 :: 		}
L_selectPage118:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage120
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage121
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage122
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage123
L_selectPage119:
;Controller_events_code.c,259 :: 		}
L_selectPage117:
L_selectPage116:
L_selectPage108:
L_selectPage102:
L_selectPage84:
L_selectPage78:
L_selectPage63:
;Controller_events_code.c,261 :: 		}
L_end_selectPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _selectPage
_Main_OFFOnClick:
;Controller_events_code.c,264 :: 		void Main_OFFOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,266 :: 		if ((unsigned long)Main_OFF.Picture_Name == main_off_bmp)
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
LDR	R1, [R0, #0]
MOVW	R0, #19268
MOVT	R0, #8
CMP	R1, R0
IT	NE
BNE	L_Main_OFFOnClick124
;Controller_events_code.c,268 :: 		Main_OFF.Picture_Name = main_on_bmp;
MOVW	R1, #10146
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,269 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Controller_events_code.c,273 :: 		SYSTEM_ON=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,274 :: 		system_reg[POWER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,276 :: 		}
IT	AL
BAL	L_Main_OFFOnClick125
L_Main_OFFOnClick124:
;Controller_events_code.c,278 :: 		Main_OFF.Picture_Name = main_off_bmp;
MOVW	R1, #19268
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,279 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,283 :: 		SYSTEM_ON=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,284 :: 		system_reg[POWER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,285 :: 		}
L_Main_OFFOnClick125:
;Controller_events_code.c,287 :: 		send_data_packet(POWER,2);
MOVS	R1, #2
MOVW	R0, #310
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,289 :: 		}
L_end_Main_OFFOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Main_OFFOnClick
_bar_heatingOnClick:
;Controller_events_code.c,290 :: 		void bar_heatingOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,293 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 )
MOVW	R1, #lo_addr(?lstr19_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr19_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick126
;Controller_events_code.c,295 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr20_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr20_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,296 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,297 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,299 :: 		system_reg[COOL]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,300 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,302 :: 		}
IT	AL
BAL	L_bar_heatingOnClick127
L_bar_heatingOnClick126:
;Controller_events_code.c,303 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0)
MOVW	R1, #lo_addr(?lstr21_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr21_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick128
;Controller_events_code.c,305 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr22_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr22_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,306 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,307 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,309 :: 		system_reg[HEAT]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,310 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,311 :: 		}
L_bar_heatingOnClick128:
L_bar_heatingOnClick127:
;Controller_events_code.c,313 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 ) {
MOVW	R1, #lo_addr(?lstr23_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr23_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick129
;Controller_events_code.c,314 :: 		send_data_packet(COOL,2);
MOVS	R1, #2
MOVW	R0, #190
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,316 :: 		}
L_bar_heatingOnClick129:
;Controller_events_code.c,318 :: 		}
L_end_bar_heatingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bar_heatingOnClick
_DHW_SetingOnClick:
;Controller_events_code.c,319 :: 		void DHW_SetingOnClick()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,322 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_DHW_SetingOnClick130
;Controller_events_code.c,323 :: 		Set_Dhw_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,324 :: 		Set_Dhw_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,325 :: 		DHW_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,326 :: 		DHW_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,327 :: 		DHW_DOWN.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,328 :: 		DHW_DOWN.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,329 :: 		DHW_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,330 :: 		DHW_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,331 :: 		dhw_T.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_T+18)
MOVT	R0, #hi_addr(_dhw_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,332 :: 		dhw_T.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_T+19)
MOVT	R0, #hi_addr(_dhw_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,333 :: 		dhw_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,334 :: 		dhw_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,335 :: 		dhw_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,336 :: 		dhw_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,337 :: 		dhw_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,338 :: 		dhw_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,339 :: 		dhw_dec.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_dec+18)
MOVT	R0, #hi_addr(_dhw_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,340 :: 		dhw_dec.Active         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_dec+19)
MOVT	R0, #hi_addr(_dhw_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,341 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,343 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,344 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,345 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_SetingOnClick470
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_SetingOnClick469
L__DHW_SetingOnClick468:
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
L__DHW_SetingOnClick470:
L__DHW_SetingOnClick469:
;Controller_events_code.c,346 :: 		DHW_Seting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr24_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr24_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,347 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,348 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,350 :: 		DrawRoundButton(&DHW_UP);
MOVW	R0, #lo_addr(_DHW_UP+0)
MOVT	R0, #hi_addr(_DHW_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,351 :: 		DrawRoundButton(&DHW_DOWN);
MOVW	R0, #lo_addr(_DHW_DOWN+0)
MOVT	R0, #hi_addr(_DHW_DOWN+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,352 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,353 :: 		count_push++;
MOVW	R1, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,354 :: 		}
IT	AL
BAL	L_DHW_SetingOnClick134
L_DHW_SetingOnClick130:
;Controller_events_code.c,356 :: 		Set_Dhw_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,357 :: 		Set_Dhw_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,358 :: 		DHW_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,359 :: 		DHW_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,360 :: 		DHW_DOWN.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,361 :: 		DHW_DOWN.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,362 :: 		DHW_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,363 :: 		DHW_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,364 :: 		dhw_T.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_T+18)
MOVT	R0, #hi_addr(_dhw_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,365 :: 		dhw_T.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_T+19)
MOVT	R0, #hi_addr(_dhw_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,366 :: 		dhw_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,367 :: 		dhw_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,368 :: 		dhw_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,369 :: 		dhw_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,370 :: 		dhw_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,371 :: 		dhw_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,372 :: 		dhw_dec.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_dec+18)
MOVT	R0, #hi_addr(_dhw_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,373 :: 		dhw_dec.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_dec+19)
MOVT	R0, #hi_addr(_dhw_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,374 :: 		DHW_Seting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr25_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr25_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,376 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,377 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,378 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,379 :: 		DrawRoundButton (& ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,380 :: 		DrawImage(&dhw_icon);
MOVW	R0, #lo_addr(_dhw_icon+0)
MOVT	R0, #hi_addr(_dhw_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,381 :: 		DrawRoundButton(&bar_DHW);
MOVW	R0, #lo_addr(_bar_DHW+0)
MOVT	R0, #hi_addr(_bar_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,382 :: 		DrawRoundButton(&dhw_T);
MOVW	R0, #lo_addr(_dhw_T+0)
MOVT	R0, #hi_addr(_dhw_T+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,383 :: 		DrawRoundButton(&dhw_dec);
MOVW	R0, #lo_addr(_dhw_dec+0)
MOVT	R0, #hi_addr(_dhw_dec+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,385 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,386 :: 		DrawLabel(&dhw_point);
MOVW	R0, #lo_addr(_dhw_point+0)
MOVT	R0, #hi_addr(_dhw_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,387 :: 		DrawLabel(&dhw_celc);
MOVW	R0, #lo_addr(_dhw_celc+0)
MOVT	R0, #hi_addr(_dhw_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,388 :: 		send_data_packet(SET_DHW,1);
MOVS	R1, #1
MOVW	R0, #330
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,392 :: 		}
L_DHW_SetingOnClick134:
;Controller_events_code.c,395 :: 		}
L_end_DHW_SetingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_SetingOnClick
_Heat_SettingOnClick:
;Controller_events_code.c,396 :: 		void Heat_SettingOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,400 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick135
;Controller_events_code.c,401 :: 		Set_Heat_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,402 :: 		Set_Heat_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,403 :: 		HEAT_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,404 :: 		HEAT_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,405 :: 		HEAT_Down.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,406 :: 		HEAT_Down.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,407 :: 		TEMP_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,408 :: 		TEMP_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,409 :: 		heat_T.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_T+18)
MOVT	R0, #hi_addr(_heat_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,410 :: 		heat_T.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_T+19)
MOVT	R0, #hi_addr(_heat_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,411 :: 		heat_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,412 :: 		heat_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,413 :: 		heat_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,414 :: 		heat_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,415 :: 		heat_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,416 :: 		heat_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,417 :: 		heat_dec.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_dec+19)
MOVT	R0, #hi_addr(_heat_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,418 :: 		heat_dec.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_dec+18)
MOVT	R0, #hi_addr(_heat_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,419 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0 )IntToStr(system_reg[SET_HEAT], txt);
MOVW	R1, #lo_addr(?lstr26_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr26_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick136
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
IT	AL
BAL	L_Heat_SettingOnClick137
L_Heat_SettingOnClick136:
;Controller_events_code.c,420 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0) IntToStr(system_reg[SET_COOL], txt);
MOVW	R1, #lo_addr(?lstr27_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr27_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick138
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
L_Heat_SettingOnClick138:
L_Heat_SettingOnClick137:
;Controller_events_code.c,421 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,422 :: 		strncpy(TEMP_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,423 :: 		if(system_reg[SET_HEAT]<10 && system_reg[SET_HEAT]>=0 && strcmp(bar_heating.Caption,"HEATING")==0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__Heat_SettingOnClick475
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__Heat_SettingOnClick474
MOVW	R1, #lo_addr(?lstr28_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr28_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__Heat_SettingOnClick473
L__Heat_SettingOnClick472:
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
IT	AL
BAL	L_Heat_SettingOnClick142
L__Heat_SettingOnClick475:
L__Heat_SettingOnClick474:
L__Heat_SettingOnClick473:
;Controller_events_code.c,424 :: 		else if(system_reg[SET_COOL]<10 && system_reg[SET_COOL]>=0 && strcmp(bar_heating.Caption,"COOLING")==0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__Heat_SettingOnClick478
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__Heat_SettingOnClick477
MOVW	R1, #lo_addr(?lstr29_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr29_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__Heat_SettingOnClick476
L__Heat_SettingOnClick471:
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
L__Heat_SettingOnClick478:
L__Heat_SettingOnClick477:
L__Heat_SettingOnClick476:
L_Heat_SettingOnClick142:
;Controller_events_code.c,425 :: 		Heat_Setting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr30_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr30_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,426 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,427 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,428 :: 		DrawRoundButton(&HEAT_UP);
MOVW	R0, #lo_addr(_HEAT_UP+0)
MOVT	R0, #hi_addr(_HEAT_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,429 :: 		DrawRoundButton(&HEAT_DOWN);
MOVW	R0, #lo_addr(_HEAT_Down+0)
MOVT	R0, #hi_addr(_HEAT_Down+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,430 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,431 :: 		count_push++;
MOVW	R1, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,432 :: 		}
IT	AL
BAL	L_Heat_SettingOnClick146
L_Heat_SettingOnClick135:
;Controller_events_code.c,434 :: 		Set_Heat_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,435 :: 		Set_Heat_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,436 :: 		HEAT_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,437 :: 		HEAT_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,438 :: 		HEAT_Down.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,439 :: 		HEAT_Down.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,440 :: 		TEMP_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,441 :: 		TEMP_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,442 :: 		heat_T.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_T+18)
MOVT	R0, #hi_addr(_heat_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,443 :: 		heat_T.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_T+19)
MOVT	R0, #hi_addr(_heat_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,444 :: 		heat_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,445 :: 		heat_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,446 :: 		heat_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,447 :: 		heat_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,448 :: 		heat_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,449 :: 		heat_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,450 :: 		heat_dec.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_dec+19)
MOVT	R0, #hi_addr(_heat_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,451 :: 		heat_dec.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_dec+18)
MOVT	R0, #hi_addr(_heat_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,452 :: 		Heat_Setting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr31_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr31_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,453 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,454 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,455 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,456 :: 		DrawRoundButton (& ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,457 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,458 :: 		DrawRoundButton(&heat_T);
MOVW	R0, #lo_addr(_heat_T+0)
MOVT	R0, #hi_addr(_heat_T+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,459 :: 		DrawRoundButton(&heat_dec);
MOVW	R0, #lo_addr(_heat_dec+0)
MOVT	R0, #hi_addr(_heat_dec+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,461 :: 		DrawCircle(&heat_led);
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,462 :: 		DrawLabel(&heat_point);
MOVW	R0, #lo_addr(_heat_point+0)
MOVT	R0, #hi_addr(_heat_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,463 :: 		DrawLabel(&heat_celc);
MOVW	R0, #lo_addr(_heat_celc+0)
MOVT	R0, #hi_addr(_heat_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,464 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 ){ DrawImage(&heat_icon);send_data_packet(SET_HEAT,1);/*adressReg= SET_HEAT;nomReg =1;*/}
MOVW	R1, #lo_addr(?lstr32_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr32_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick147
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #340
SXTH	R0, R0
BL	_send_data_packet+0
IT	AL
BAL	L_Heat_SettingOnClick148
L_Heat_SettingOnClick147:
;Controller_events_code.c,465 :: 		else  {DrawImage(&cool_icon);send_data_packet(SET_COOL,1);/*adressReg= SET_COOL;nomReg =1;*/}
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #320
SXTH	R0, R0
BL	_send_data_packet+0
L_Heat_SettingOnClick148:
;Controller_events_code.c,466 :: 		}
L_Heat_SettingOnClick146:
;Controller_events_code.c,470 :: 		}
L_end_Heat_SettingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Heat_SettingOnClick
_Click_HEAT:
;Controller_events_code.c,472 :: 		void Click_HEAT()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,474 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 )
MOVW	R1, #lo_addr(?lstr33_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr33_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT149
;Controller_events_code.c,476 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr34_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr34_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,477 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,478 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,479 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,480 :: 		UART2_Write_Text("OFF");
MOVW	R0, #lo_addr(?lstr35_Controller_events_code+0)
MOVT	R0, #hi_addr(?lstr35_Controller_events_code+0)
BL	_UART2_Write_Text+0
;Controller_events_code.c,481 :: 		}
IT	AL
BAL	L_Click_HEAT150
L_Click_HEAT149:
;Controller_events_code.c,483 :: 		{   if(strcmp(bar_heating.Caption,"HEATING")==0 ){system_reg[HEAT]=1;system_reg[COOL]=0;}
MOVW	R1, #lo_addr(?lstr36_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr36_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT151
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
BAL	L_Click_HEAT152
L_Click_HEAT151:
;Controller_events_code.c,484 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0 ){system_reg[HEAT]=0;system_reg[COOL]=1;}
MOVW	R1, #lo_addr(?lstr37_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr37_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT153
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
L_Click_HEAT153:
L_Click_HEAT152:
;Controller_events_code.c,485 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr38_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr38_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,486 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,488 :: 		}
L_Click_HEAT150:
;Controller_events_code.c,490 :: 		send_data_packet(COOL,2);
MOVS	R1, #2
MOVW	R0, #190
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,492 :: 		}
L_end_Click_HEAT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_HEAT
_Click_DHW:
;Controller_events_code.c,493 :: 		void Click_DHW()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,496 :: 		if (strcmp(ON_OFF_DHW.Caption,"ON")==0)
MOVW	R1, #lo_addr(?lstr39_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr39_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_DHW154
;Controller_events_code.c,498 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr40_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr40_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,499 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,500 :: 		system_reg[HEATWATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,501 :: 		}
IT	AL
BAL	L_Click_DHW155
L_Click_DHW154:
;Controller_events_code.c,504 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr41_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr41_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,505 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,506 :: 		system_reg[HEATWATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,507 :: 		}
L_Click_DHW155:
;Controller_events_code.c,509 :: 		send_data_packet(HEATWATER,1);
MOVS	R1, #1
MOVW	R0, #210
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,510 :: 		}
L_end_Click_DHW:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_DHW
_MainBut1OnUp:
;Controller_events_code.c,511 :: 		void MainBut1OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,512 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,513 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,514 :: 		Image25.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,515 :: 		DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,516 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,518 :: 		}
L_end_MainBut1OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnUp
_MainBut1OnPress:
;Controller_events_code.c,519 :: 		void MainBut1OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,520 :: 		Image25.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,521 :: 		DrawImage(&Image25);
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
BL	_DrawImage+0
;Controller_events_code.c,522 :: 		}
L_end_MainBut1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnPress
_MainBut2OnUp:
;Controller_events_code.c,523 :: 		void MainBut2OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,524 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,525 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,526 :: 		Image40.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,527 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp483
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp482
L__MainBut2OnUp481:
;Controller_events_code.c,528 :: 		DrawScreen (&Schema2);
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
BL	_DrawScreen+0
;Controller_events_code.c,529 :: 		}
IT	AL
BAL	L_MainBut2OnUp159
;Controller_events_code.c,527 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
L__MainBut2OnUp483:
L__MainBut2OnUp482:
;Controller_events_code.c,530 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp485
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp484
L__MainBut2OnUp480:
;Controller_events_code.c,531 :: 		DrawScreen (&AIR_TWO);
MOVW	R0, #lo_addr(_AIR_TWO+0)
MOVT	R0, #hi_addr(_AIR_TWO+0)
BL	_DrawScreen+0
;Controller_events_code.c,532 :: 		}
IT	AL
BAL	L_MainBut2OnUp163
;Controller_events_code.c,530 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
L__MainBut2OnUp485:
L__MainBut2OnUp484:
;Controller_events_code.c,533 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp487
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp486
L__MainBut2OnUp479:
;Controller_events_code.c,534 :: 		DrawScreen(&Schema1);//DrawScreen (&AIR_ONE);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,535 :: 		}
IT	AL
BAL	L_MainBut2OnUp167
;Controller_events_code.c,533 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
L__MainBut2OnUp487:
L__MainBut2OnUp486:
;Controller_events_code.c,537 :: 		DrawScreen(&Schema1);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,538 :: 		}
L_MainBut2OnUp167:
L_MainBut2OnUp163:
L_MainBut2OnUp159:
;Controller_events_code.c,540 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,542 :: 		}
L_end_MainBut2OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnUp
_MainBut2OnPress:
;Controller_events_code.c,543 :: 		void MainBut2OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,544 :: 		Image40.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,545 :: 		DrawImage(&Image40);
MOVW	R0, #lo_addr(_Image40+0)
MOVT	R0, #hi_addr(_Image40+0)
BL	_DrawImage+0
;Controller_events_code.c,547 :: 		}
L_end_MainBut2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnPress
_MainBut3OnUp:
;Controller_events_code.c,548 :: 		void MainBut3OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,549 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,550 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,551 :: 		Image44.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,552 :: 		DrawScreen(&DEVICES);
MOVW	R0, #lo_addr(_DEVICES+0)
MOVT	R0, #hi_addr(_DEVICES+0)
BL	_DrawScreen+0
;Controller_events_code.c,553 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,555 :: 		}
L_end_MainBut3OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnUp
_MainBut3OnPress:
;Controller_events_code.c,556 :: 		void MainBut3OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,557 :: 		Image44.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,558 :: 		DrawImage(&Image44);
MOVW	R0, #lo_addr(_Image44+0)
MOVT	R0, #hi_addr(_Image44+0)
BL	_DrawImage+0
;Controller_events_code.c,559 :: 		}
L_end_MainBut3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnPress
_MainBut4OnUp:
;Controller_events_code.c,560 :: 		void MainBut4OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,561 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,562 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,563 :: 		Image61.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,564 :: 		old_HP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_HP_pressure+0)
MOVT	R0, #hi_addr(_old_HP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,565 :: 		old_LP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_LP_pressure+0)
MOVT	R0, #hi_addr(_old_LP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,566 :: 		DrawScreen(&GAUGE1);
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
BL	_DrawScreen+0
;Controller_events_code.c,567 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,568 :: 		}
L_end_MainBut4OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnUp
_MainBut4OnPress:
;Controller_events_code.c,569 :: 		void MainBut4OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,570 :: 		Image61.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,571 :: 		DrawImage(&Image61);
MOVW	R0, #lo_addr(_Image61+0)
MOVT	R0, #hi_addr(_Image61+0)
BL	_DrawImage+0
;Controller_events_code.c,572 :: 		}
L_end_MainBut4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnPress
_MainBut5OnUp:
;Controller_events_code.c,573 :: 		void MainBut5OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,574 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,575 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,576 :: 		Image87.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,577 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,578 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,579 :: 		}
L_end_MainBut5OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnUp
_MainBut5OnPress:
;Controller_events_code.c,580 :: 		void MainBut5OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,581 :: 		Image87.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,582 :: 		DrawImage(&Image87);
MOVW	R0, #lo_addr(_Image87+0)
MOVT	R0, #hi_addr(_Image87+0)
BL	_DrawImage+0
;Controller_events_code.c,583 :: 		}
L_end_MainBut5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnPress
_DHW_UPOnClick:
;Controller_events_code.c,584 :: 		void  DHW_UPOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,586 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,587 :: 		system_reg[SET_DHW]++;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,588 :: 		if(system_reg[SET_DHW]>system_reg[HEAT_MAX]) system_reg[SET_DHW]=system_reg[HEAT_MAX];
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L_DHW_UPOnClick168
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_UPOnClick168:
;Controller_events_code.c,589 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,590 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,591 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,592 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_UPOnClick490
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_UPOnClick489
L__DHW_UPOnClick488:
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
L__DHW_UPOnClick490:
L__DHW_UPOnClick489:
;Controller_events_code.c,593 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,594 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,595 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_DHW_UPOnClick172:
SUBS	R7, R7, #1
BNE	L_DHW_UPOnClick172
NOP
NOP
NOP
;Controller_events_code.c,596 :: 		}
L_end_DHW_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_UPOnClick
_DHW_DOWNOnClick:
;Controller_events_code.c,597 :: 		void DHW_DOWNOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,599 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,600 :: 		system_reg[SET_DHW]--;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,601 :: 		if(system_reg[SET_DHW]<system_reg[HEAT_MIN]) system_reg[SET_DHW]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_DHW_DOWNOnClick174
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_DOWNOnClick174:
;Controller_events_code.c,602 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,603 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,604 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,605 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_DOWNOnClick493
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_DOWNOnClick492
L__DHW_DOWNOnClick491:
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
L__DHW_DOWNOnClick493:
L__DHW_DOWNOnClick492:
;Controller_events_code.c,606 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,607 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,608 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_DHW_DOWNOnClick178:
SUBS	R7, R7, #1
BNE	L_DHW_DOWNOnClick178
NOP
NOP
NOP
;Controller_events_code.c,610 :: 		}
L_end_DHW_DOWNOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_DOWNOnClick
_HEAT_UPOnClick:
;Controller_events_code.c,611 :: 		void HEAT_UPOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,614 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,616 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr42_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr42_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick180
;Controller_events_code.c,617 :: 		system_reg[SET_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+680)
MOVT	R1, #hi_addr(_system_reg+680)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,618 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,619 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,620 :: 		}
IT	AL
BAL	L_HEAT_UPOnClick181
L_HEAT_UPOnClick180:
;Controller_events_code.c,621 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr43_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr43_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick182
;Controller_events_code.c,622 :: 		system_reg[SET_COOL]++;
MOVW	R1, #lo_addr(_system_reg+640)
MOVT	R1, #hi_addr(_system_reg+640)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,624 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,625 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,626 :: 		}
L_HEAT_UPOnClick182:
L_HEAT_UPOnClick181:
;Controller_events_code.c,627 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,628 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,629 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_UPOnClick496
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_UPOnClick495
L__HEAT_UPOnClick494:
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
L__HEAT_UPOnClick496:
L__HEAT_UPOnClick495:
;Controller_events_code.c,630 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,631 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,632 :: 		}
L_end_HEAT_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_UPOnClick
_HEAT_DownOnClick:
;Controller_events_code.c,633 :: 		void HEAT_DownOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,636 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,637 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr44_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr44_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick186
;Controller_events_code.c,638 :: 		system_reg[SET_HEAT]--;
MOVW	R2, #lo_addr(_system_reg+680)
MOVT	R2, #hi_addr(_system_reg+680)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,639 :: 		if(system_reg[SET_HEAT]<system_reg[HEAT_MIN]) system_reg[SET_HEAT]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick187
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick187:
;Controller_events_code.c,640 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,641 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,642 :: 		}
IT	AL
BAL	L_HEAT_DownOnClick188
L_HEAT_DownOnClick186:
;Controller_events_code.c,643 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr45_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr45_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick189
;Controller_events_code.c,644 :: 		system_reg[SET_COOL]--;
MOVW	R2, #lo_addr(_system_reg+640)
MOVT	R2, #hi_addr(_system_reg+640)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,645 :: 		if(system_reg[SET_COOL]<system_reg[COOL_MIN]) system_reg[SET_COOL]=system_reg[COOL_MIN];
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick190
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick190:
;Controller_events_code.c,646 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,647 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,648 :: 		}
L_HEAT_DownOnClick189:
L_HEAT_DownOnClick188:
;Controller_events_code.c,649 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,650 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,651 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_DownOnClick499
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_DownOnClick498
L__HEAT_DownOnClick497:
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
L__HEAT_DownOnClick499:
L__HEAT_DownOnClick498:
;Controller_events_code.c,652 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,653 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,655 :: 		}
L_end_HEAT_DownOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_DownOnClick
_user_settingOnUp:
;Controller_events_code.c,657 :: 		void user_settingOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,658 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,659 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,660 :: 		Image105.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,661 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,662 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,663 :: 		}
L_end_user_settingOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnUp
_user_settingOnPress:
;Controller_events_code.c,664 :: 		void  user_settingOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,665 :: 		Image105.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,666 :: 		DrawImage(&Image105);
MOVW	R0, #lo_addr(_Image105+0)
MOVT	R0, #hi_addr(_Image105+0)
BL	_DrawImage+0
;Controller_events_code.c,667 :: 		}
L_end_user_settingOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnPress
_user_set_timeOnPress:
;Controller_events_code.c,668 :: 		void user_set_timeOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,669 :: 		Image39.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,670 :: 		DrawImage(&Image39);
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
BL	_DrawImage+0
;Controller_events_code.c,671 :: 		}
L_end_user_set_timeOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnPress
_user_set_timeOnUp:
;Controller_events_code.c,672 :: 		void user_set_timeOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,673 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,674 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,675 :: 		Image39.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,677 :: 		DrawScreen(&SetRTC);
MOVW	R0, #lo_addr(_SetRTC+0)
MOVT	R0, #hi_addr(_SetRTC+0)
BL	_DrawScreen+0
;Controller_events_code.c,678 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,679 :: 		}
L_end_user_set_timeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnUp
_user_check_temperatureOnPress:
;Controller_events_code.c,681 :: 		void user_check_temperatureOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,682 :: 		Image48.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,683 :: 		DrawImage(&Image48);
MOVW	R0, #lo_addr(_Image48+0)
MOVT	R0, #hi_addr(_Image48+0)
BL	_DrawImage+0
;Controller_events_code.c,684 :: 		}
L_end_user_check_temperatureOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnPress
_user_check_temperatureOnUp:
;Controller_events_code.c,685 :: 		void user_check_temperatureOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,686 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,687 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,688 :: 		Image48.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,689 :: 		strcpy(S_Brine_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr46_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr46_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,690 :: 		strcpy(S_Brine_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr47_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr47_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,691 :: 		strcpy(S_Heat_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr48_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr48_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,692 :: 		strcpy(S_Heat_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr49_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr49_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,693 :: 		strcpy(S_Compressor_1.Caption ,"000");
MOVW	R1, #lo_addr(?lstr50_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr50_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Compressor_1+24)
MOVT	R0, #hi_addr(_S_Compressor_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,694 :: 		strcpy(S_Superheat_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr51_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr51_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Superheat_1+24)
MOVT	R0, #hi_addr(_S_Superheat_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,695 :: 		strcpy( S_Subcool_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr52_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr52_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Subcool_1+24)
MOVT	R0, #hi_addr(_S_Subcool_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,696 :: 		strcpy(S_DHW.Caption,"00");
MOVW	R1, #lo_addr(?lstr53_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr53_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_DHW+24)
MOVT	R0, #hi_addr(_S_DHW+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,697 :: 		strcpy(SS_tank.Caption,"00");
MOVW	R1, #lo_addr(?lstr54_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr54_Controller_events_code+0)
MOVW	R0, #lo_addr(_SS_tank+24)
MOVT	R0, #hi_addr(_SS_tank+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,698 :: 		strcpy(S_condenser_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr55_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr55_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_condenser_1+24)
MOVT	R0, #hi_addr(_S_condenser_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,699 :: 		strcpy(S_High_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr56_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr56_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_High_Pressure_1+24)
MOVT	R0, #hi_addr(_S_High_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,700 :: 		strcpy(S_Low_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr57_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr57_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,701 :: 		DrawScreen(&SENSOR1);
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
BL	_DrawScreen+0
;Controller_events_code.c,702 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,703 :: 		}
L_end_user_check_temperatureOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnUp
_user_set_LANOnPress:
;Controller_events_code.c,704 :: 		void user_set_LANOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,705 :: 		Image49.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,706 :: 		DrawImage(&Image49);
MOVW	R0, #lo_addr(_Image49+0)
MOVT	R0, #hi_addr(_Image49+0)
BL	_DrawImage+0
;Controller_events_code.c,707 :: 		}
L_end_user_set_LANOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnPress
_user_set_LANOnUp:
;Controller_events_code.c,708 :: 		void user_set_LANOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,709 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,710 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,711 :: 		Image49.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,712 :: 		DrawScreen(&Ethernet);
MOVW	R0, #lo_addr(_Ethernet+0)
MOVT	R0, #hi_addr(_Ethernet+0)
BL	_DrawScreen+0
;Controller_events_code.c,713 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,714 :: 		}
L_end_user_set_LANOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnUp
_user_check_errorsOnPress:
;Controller_events_code.c,715 :: 		void user_check_errorsOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,716 :: 		Image50.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,717 :: 		DrawImage(&Image50);
MOVW	R0, #lo_addr(_Image50+0)
MOVT	R0, #hi_addr(_Image50+0)
BL	_DrawImage+0
;Controller_events_code.c,718 :: 		}
L_end_user_check_errorsOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnPress
_user_check_errorsOnUp:
;Controller_events_code.c,719 :: 		void user_check_errorsOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,720 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,721 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,722 :: 		Image50.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,723 :: 		DrawScreen(&ERRORS);
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
BL	_DrawScreen+0
;Controller_events_code.c,724 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,725 :: 		}
L_end_user_check_errorsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnUp
_user_set_timersOnPress:
;Controller_events_code.c,726 :: 		void user_set_timersOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,727 :: 		Image51.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,728 :: 		DrawImage(&Image51);
MOVW	R0, #lo_addr(_Image51+0)
MOVT	R0, #hi_addr(_Image51+0)
BL	_DrawImage+0
;Controller_events_code.c,729 :: 		}
L_end_user_set_timersOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnPress
_user_set_timersOnUp:
;Controller_events_code.c,730 :: 		void user_set_timersOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,731 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,732 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,733 :: 		Image51.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,734 :: 		DrawScreen(&TIMERS);
MOVW	R0, #lo_addr(_TIMERS+0)
MOVT	R0, #hi_addr(_TIMERS+0)
BL	_DrawScreen+0
;Controller_events_code.c,735 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,736 :: 		}
L_end_user_set_timersOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnUp
_user_hysterezisOnPress:
;Controller_events_code.c,737 :: 		void user_hysterezisOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,738 :: 		Image60.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,739 :: 		DrawImage(&Image60);
MOVW	R0, #lo_addr(_Image60+0)
MOVT	R0, #hi_addr(_Image60+0)
BL	_DrawImage+0
;Controller_events_code.c,740 :: 		}
L_end_user_hysterezisOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnPress
_user_hysterezisOnUp:
;Controller_events_code.c,741 :: 		void user_hysterezisOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,742 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,743 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,744 :: 		Image60.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,745 :: 		DrawScreen(&SETTINGS);
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
BL	_DrawScreen+0
;Controller_events_code.c,746 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,747 :: 		}
L_end_user_hysterezisOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnUp
_User_history_checkOnPress:
;Controller_events_code.c,748 :: 		void User_history_checkOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,749 :: 		Image52.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,750 :: 		DrawImage(&Image52);
MOVW	R0, #lo_addr(_Image52+0)
MOVT	R0, #hi_addr(_Image52+0)
BL	_DrawImage+0
;Controller_events_code.c,751 :: 		}
L_end_User_history_checkOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnPress
_User_history_checkOnUp:
;Controller_events_code.c,752 :: 		void User_history_checkOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,753 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,754 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,755 :: 		Image52.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,756 :: 		DrawScreen(&EVENTS);
MOVW	R0, #lo_addr(_EVENTS+0)
MOVT	R0, #hi_addr(_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,757 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,758 :: 		}
L_end_User_history_checkOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnUp
_user_energyOnUp:
;Controller_events_code.c,760 :: 		void user_energyOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,761 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,762 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,763 :: 		Image54.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,764 :: 		DrawScreen(&ENERGY);
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
BL	_DrawScreen+0
;Controller_events_code.c,765 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,766 :: 		}
L_end_user_energyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnUp
_user_energyOnPress:
;Controller_events_code.c,767 :: 		void user_energyOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,768 :: 		Image54.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,769 :: 		DrawImage(&Image54);
MOVW	R0, #lo_addr(_Image54+0)
MOVT	R0, #hi_addr(_Image54+0)
BL	_DrawImage+0
;Controller_events_code.c,770 :: 		}
L_end_user_energyOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnPress
_admin_set_systemOnUp:
;Controller_events_code.c,771 :: 		void admin_set_systemOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,772 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,773 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,774 :: 		Image55.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,776 :: 		DrawScreen (&SYSTEM_SET);
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
;Controller_events_code.c,777 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,778 :: 		}
L_end_admin_set_systemOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnUp
_admin_set_systemOnPress:
;Controller_events_code.c,779 :: 		void  admin_set_systemOnPress (){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,780 :: 		Image55.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,781 :: 		DrawImage(&Image55);
MOVW	R0, #lo_addr(_Image55+0)
MOVT	R0, #hi_addr(_Image55+0)
BL	_DrawImage+0
;Controller_events_code.c,782 :: 		}
L_end_admin_set_systemOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnPress
_furnanceUP:
;Controller_events_code.c,783 :: 		void furnanceUP(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,784 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,785 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,786 :: 		Image56.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,787 :: 		DrawScreen(&FURNANCE);
MOVW	R0, #lo_addr(_FURNANCE+0)
MOVT	R0, #hi_addr(_FURNANCE+0)
BL	_DrawScreen+0
;Controller_events_code.c,788 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,789 :: 		}
L_end_furnanceUP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceUP
_furnanceDown:
;Controller_events_code.c,790 :: 		void furnanceDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,791 :: 		Image56.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,792 :: 		DrawImage(&Image56);
MOVW	R0, #lo_addr(_Image56+0)
MOVT	R0, #hi_addr(_Image56+0)
BL	_DrawImage+0
;Controller_events_code.c,793 :: 		}
L_end_furnanceDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceDown
_user_defrostOnUp:
;Controller_events_code.c,794 :: 		void user_defrostOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,795 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,796 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,797 :: 		Image57.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,798 :: 		DrawScreen(&DEFROST);
MOVW	R0, #lo_addr(_DEFROST+0)
MOVT	R0, #hi_addr(_DEFROST+0)
BL	_DrawScreen+0
;Controller_events_code.c,799 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,800 :: 		}
L_end_user_defrostOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnUp
_user_defrostOnPress:
;Controller_events_code.c,801 :: 		void user_defrostOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,802 :: 		Image57.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,803 :: 		DrawImage(&Image57);
MOVW	R0, #lo_addr(_Image57+0)
MOVT	R0, #hi_addr(_Image57+0)
BL	_DrawImage+0
;Controller_events_code.c,804 :: 		}
L_end_user_defrostOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnPress
_DEC_EEV1OnPress:
;Controller_events_code.c,856 :: 		void DEC_EEV1OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,858 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,860 :: 		incTRV--;
MOVW	R1, #lo_addr(_incTRV+0)
MOVT	R1, #hi_addr(_incTRV+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,863 :: 		if(num_page==0) { if(system_reg[TRV_CORRECT_1]<0)system_reg[TRV_CORRECT_1]=0; IntToStr(system_reg[TRV_CORRECT_1]+incTRV, txt); }
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_DEC_EEV1OnPress194
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	GE
BGE	L_DEC_EEV1OnPress195
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
STRH	R1, [R0, #0]
L_DEC_EEV1OnPress195:
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
LDRSH	R0, [R0, #0]
ADDS	R0, R0, R1
MOV	R1, R2
BL	_IntToStr+0
IT	AL
BAL	L_DEC_EEV1OnPress196
L_DEC_EEV1OnPress194:
;Controller_events_code.c,864 :: 		else {if(system_reg[TRV_CORRECT_2]<0)system_reg[TRV_CORRECT_2]=0;IntToStr(system_reg[TRV_CORRECT_2]+incTRV, txt); }
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	GE
BGE	L_DEC_EEV1OnPress197
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
STRH	R1, [R0, #0]
L_DEC_EEV1OnPress197:
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
LDRSH	R0, [R0, #0]
ADDS	R0, R0, R1
MOV	R1, R2
BL	_IntToStr+0
L_DEC_EEV1OnPress196:
;Controller_events_code.c,865 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,866 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,867 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,875 :: 		Delay_ms (50);
MOVW	R7, #9630
MOVT	R7, #38
NOP
NOP
L_DEC_EEV1OnPress198:
SUBS	R7, R7, #1
BNE	L_DEC_EEV1OnPress198
NOP
NOP
NOP
;Controller_events_code.c,877 :: 		}
L_end_DEC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DEC_EEV1OnPress
_INC_EEV1OnPress:
;Controller_events_code.c,878 :: 		void INC_EEV1OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,881 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,883 :: 		incTRV++;
MOVW	R1, #lo_addr(_incTRV+0)
MOVT	R1, #hi_addr(_incTRV+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,886 :: 		if(num_page==0) {if(system_reg[TRV_CORRECT_1]>240)system_reg[TRV_CORRECT_1]=240;IntToStr(system_reg[TRV_CORRECT_1]+incTRV, txt); }
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_INC_EEV1OnPress200
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	LE
BLE	L_INC_EEV1OnPress201
MOVS	R1, #240
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
STRH	R1, [R0, #0]
L_INC_EEV1OnPress201:
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
LDRSH	R0, [R0, #0]
ADDS	R0, R0, R1
MOV	R1, R2
BL	_IntToStr+0
IT	AL
BAL	L_INC_EEV1OnPress202
L_INC_EEV1OnPress200:
;Controller_events_code.c,887 :: 		else {if(system_reg[TRV_CORRECT_2]>240)system_reg[TRV_CORRECT_2]=240;IntToStr(system_reg[TRV_CORRECT_2]+incTRV, txt); }
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
LDRSH	R0, [R0, #0]
CMP	R0, #240
IT	LE
BLE	L_INC_EEV1OnPress203
MOVS	R1, #240
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
STRH	R1, [R0, #0]
L_INC_EEV1OnPress203:
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
LDRSH	R0, [R0, #0]
ADDS	R0, R0, R1
MOV	R1, R2
BL	_IntToStr+0
L_INC_EEV1OnPress202:
;Controller_events_code.c,888 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,889 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,890 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,894 :: 		Delay_ms (50);
MOVW	R7, #9630
MOVT	R7, #38
NOP
NOP
L_INC_EEV1OnPress204:
SUBS	R7, R7, #1
BNE	L_INC_EEV1OnPress204
NOP
NOP
NOP
;Controller_events_code.c,896 :: 		}
L_end_INC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _INC_EEV1OnPress
_Set_Trv:
;Controller_events_code.c,898 :: 		void Set_Trv() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,899 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Set_Trv206
;Controller_events_code.c,901 :: 		system_reg[TRV_CORRECT_1]+= incTRV;
MOVW	R3, #lo_addr(_incTRV+0)
MOVT	R3, #hi_addr(_incTRV+0)
LDRSH	R2, [R3, #0]
MOVW	R1, #lo_addr(_system_reg+782)
MOVT	R1, #hi_addr(_system_reg+782)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;Controller_events_code.c,902 :: 		incTRV=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R3, #0]
;Controller_events_code.c,903 :: 		send_data_packet(TRV_CORRECT_1,1);
MOVS	R1, #1
MOVW	R0, #391
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,904 :: 		}
IT	AL
BAL	L_Set_Trv207
L_Set_Trv206:
;Controller_events_code.c,907 :: 		system_reg[TRV_CORRECT_2]+= incTRV;
MOVW	R3, #lo_addr(_incTRV+0)
MOVT	R3, #hi_addr(_incTRV+0)
LDRSH	R2, [R3, #0]
MOVW	R1, #lo_addr(_system_reg+784)
MOVT	R1, #hi_addr(_system_reg+784)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;Controller_events_code.c,908 :: 		incTRV=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R3, #0]
;Controller_events_code.c,909 :: 		send_data_packet(TRV_CORRECT_2,1);
MOVS	R1, #1
MOVW	R0, #392
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,910 :: 		}
L_Set_Trv207:
;Controller_events_code.c,911 :: 		}
L_end_Set_Trv:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Trv
__1OnClick:
;Controller_events_code.c,914 :: 		void _1OnClick() {
;Controller_events_code.c,916 :: 		}
L_end__1OnClick:
BX	LR
; end of __1OnClick
__2OnClick:
;Controller_events_code.c,918 :: 		void _2OnClick() {
;Controller_events_code.c,920 :: 		}
L_end__2OnClick:
BX	LR
; end of __2OnClick
__3OnClick:
;Controller_events_code.c,922 :: 		void _3OnClick() {
;Controller_events_code.c,924 :: 		}
L_end__3OnClick:
BX	LR
; end of __3OnClick
__4OnClick:
;Controller_events_code.c,926 :: 		void _4OnClick() {
;Controller_events_code.c,928 :: 		}
L_end__4OnClick:
BX	LR
; end of __4OnClick
__5OnClick:
;Controller_events_code.c,930 :: 		void _5OnClick() {
;Controller_events_code.c,932 :: 		}
L_end__5OnClick:
BX	LR
; end of __5OnClick
__6OnClick:
;Controller_events_code.c,934 :: 		void _6OnClick() {
;Controller_events_code.c,936 :: 		}
L_end__6OnClick:
BX	LR
; end of __6OnClick
__7OnClick:
;Controller_events_code.c,938 :: 		void _7OnClick() {
;Controller_events_code.c,940 :: 		}
L_end__7OnClick:
BX	LR
; end of __7OnClick
__8OnClick:
;Controller_events_code.c,942 :: 		void _8OnClick() {
;Controller_events_code.c,944 :: 		}
L_end__8OnClick:
BX	LR
; end of __8OnClick
__9OnClick:
;Controller_events_code.c,946 :: 		void _9OnClick() {
;Controller_events_code.c,948 :: 		}
L_end__9OnClick:
BX	LR
; end of __9OnClick
__0OnClick:
;Controller_events_code.c,950 :: 		void _0OnClick() {
;Controller_events_code.c,952 :: 		}
L_end__0OnClick:
BX	LR
; end of __0OnClick
__QOnClick:
;Controller_events_code.c,954 :: 		void _QOnClick() {
;Controller_events_code.c,956 :: 		}
L_end__QOnClick:
BX	LR
; end of __QOnClick
__WOnClick:
;Controller_events_code.c,958 :: 		void _WOnClick() {
;Controller_events_code.c,960 :: 		}
L_end__WOnClick:
BX	LR
; end of __WOnClick
__EOnClick:
;Controller_events_code.c,962 :: 		void _EOnClick() {
;Controller_events_code.c,964 :: 		}
L_end__EOnClick:
BX	LR
; end of __EOnClick
__ROnClick:
;Controller_events_code.c,966 :: 		void _ROnClick() {
;Controller_events_code.c,968 :: 		}
L_end__ROnClick:
BX	LR
; end of __ROnClick
__TOnClick:
;Controller_events_code.c,970 :: 		void _TOnClick() {
;Controller_events_code.c,972 :: 		}
L_end__TOnClick:
BX	LR
; end of __TOnClick
__YOnClick:
;Controller_events_code.c,974 :: 		void _YOnClick() {
;Controller_events_code.c,976 :: 		}
L_end__YOnClick:
BX	LR
; end of __YOnClick
__UOnClick:
;Controller_events_code.c,978 :: 		void _UOnClick() {
;Controller_events_code.c,980 :: 		}
L_end__UOnClick:
BX	LR
; end of __UOnClick
__IOnClick:
;Controller_events_code.c,982 :: 		void _IOnClick() {
;Controller_events_code.c,984 :: 		}
L_end__IOnClick:
BX	LR
; end of __IOnClick
__OOnClick:
;Controller_events_code.c,986 :: 		void _OOnClick() {
;Controller_events_code.c,988 :: 		}
L_end__OOnClick:
BX	LR
; end of __OOnClick
__POnClick:
;Controller_events_code.c,990 :: 		void _POnClick() {
;Controller_events_code.c,992 :: 		}
L_end__POnClick:
BX	LR
; end of __POnClick
__AOnClick:
;Controller_events_code.c,994 :: 		void _AOnClick() {
;Controller_events_code.c,996 :: 		}
L_end__AOnClick:
BX	LR
; end of __AOnClick
__SOnClick:
;Controller_events_code.c,998 :: 		void _SOnClick() {
;Controller_events_code.c,1000 :: 		}
L_end__SOnClick:
BX	LR
; end of __SOnClick
__DOnClick:
;Controller_events_code.c,1002 :: 		void _DOnClick() {
;Controller_events_code.c,1004 :: 		}
L_end__DOnClick:
BX	LR
; end of __DOnClick
__FOnClick:
;Controller_events_code.c,1006 :: 		void _FOnClick() {
;Controller_events_code.c,1008 :: 		}
L_end__FOnClick:
BX	LR
; end of __FOnClick
__GOnClick:
;Controller_events_code.c,1010 :: 		void _GOnClick() {
;Controller_events_code.c,1012 :: 		}
L_end__GOnClick:
BX	LR
; end of __GOnClick
__HOnClick:
;Controller_events_code.c,1014 :: 		void _HOnClick() {
;Controller_events_code.c,1016 :: 		}
L_end__HOnClick:
BX	LR
; end of __HOnClick
__JOnClick:
;Controller_events_code.c,1018 :: 		void _JOnClick() {
;Controller_events_code.c,1020 :: 		}
L_end__JOnClick:
BX	LR
; end of __JOnClick
__KOnClick:
;Controller_events_code.c,1022 :: 		void _KOnClick() {
;Controller_events_code.c,1024 :: 		}
L_end__KOnClick:
BX	LR
; end of __KOnClick
__LOnClick:
;Controller_events_code.c,1026 :: 		void _LOnClick() {
;Controller_events_code.c,1028 :: 		}
L_end__LOnClick:
BX	LR
; end of __LOnClick
__ZOnClick:
;Controller_events_code.c,1030 :: 		void _ZOnClick() {
;Controller_events_code.c,1032 :: 		}
L_end__ZOnClick:
BX	LR
; end of __ZOnClick
__XOnClick:
;Controller_events_code.c,1034 :: 		void _XOnClick() {
;Controller_events_code.c,1036 :: 		}
L_end__XOnClick:
BX	LR
; end of __XOnClick
__COnClick:
;Controller_events_code.c,1038 :: 		void _COnClick() {
;Controller_events_code.c,1040 :: 		}
L_end__COnClick:
BX	LR
; end of __COnClick
__VOnClick:
;Controller_events_code.c,1042 :: 		void _VOnClick() {
;Controller_events_code.c,1044 :: 		}
L_end__VOnClick:
BX	LR
; end of __VOnClick
__BOnClick:
;Controller_events_code.c,1046 :: 		void _BOnClick() {
;Controller_events_code.c,1048 :: 		}
L_end__BOnClick:
BX	LR
; end of __BOnClick
__NOnClick:
;Controller_events_code.c,1050 :: 		void _NOnClick() {
;Controller_events_code.c,1052 :: 		}
L_end__NOnClick:
BX	LR
; end of __NOnClick
__MOnClick:
;Controller_events_code.c,1054 :: 		void _MOnClick() {
;Controller_events_code.c,1056 :: 		}
L_end__MOnClick:
BX	LR
; end of __MOnClick
__CommaOnClick:
;Controller_events_code.c,1058 :: 		void _CommaOnClick() {
;Controller_events_code.c,1060 :: 		}
L_end__CommaOnClick:
BX	LR
; end of __CommaOnClick
__ColonOnClick:
;Controller_events_code.c,1062 :: 		void _ColonOnClick() {
;Controller_events_code.c,1064 :: 		}
L_end__ColonOnClick:
BX	LR
; end of __ColonOnClick
__SlashOnClick:
;Controller_events_code.c,1066 :: 		void _SlashOnClick() {
;Controller_events_code.c,1068 :: 		}
L_end__SlashOnClick:
BX	LR
; end of __SlashOnClick
__DELOnClick:
;Controller_events_code.c,1070 :: 		void _DELOnClick() {
;Controller_events_code.c,1072 :: 		}
L_end__DELOnClick:
BX	LR
; end of __DELOnClick
_ClearOnPress:
;Controller_events_code.c,1074 :: 		void ClearOnPress() {
;Controller_events_code.c,1076 :: 		}
L_end_ClearOnPress:
BX	LR
; end of _ClearOnPress
_CAPS_SwitchOnClick:
;Controller_events_code.c,1078 :: 		void CAPS_SwitchOnClick() {
;Controller_events_code.c,1080 :: 		}
L_end_CAPS_SwitchOnClick:
BX	LR
; end of _CAPS_SwitchOnClick
_SPACEOnClick:
;Controller_events_code.c,1082 :: 		void SPACEOnClick() {
;Controller_events_code.c,1084 :: 		}
L_end_SPACEOnClick:
BX	LR
; end of _SPACEOnClick
_ENTEROnClick:
;Controller_events_code.c,1086 :: 		void ENTEROnClick() {
;Controller_events_code.c,1088 :: 		}
L_end_ENTEROnClick:
BX	LR
; end of _ENTEROnClick
_SetDateAndTimeOnClick:
;Controller_events_code.c,1090 :: 		void SetDateAndTimeOnClick(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1114 :: 		if (Set_MyRTCC() == 0)return;
BL	_Set_MyRTCC+0
CMP	R0, #0
IT	NE
BNE	L_SetDateAndTimeOnClick208
IT	AL
BAL	L_end_SetDateAndTimeOnClick
L_SetDateAndTimeOnClick208:
;Controller_events_code.c,1116 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1117 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
BL	_DrawScreen+0
;Controller_events_code.c,1120 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1122 :: 		}
L_end_SetDateAndTimeOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SetDateAndTimeOnClick
_OneYearUpOnClick:
;Controller_events_code.c,1123 :: 		void OneYearUpOnClick(){
;Controller_events_code.c,1125 :: 		}
L_end_OneYearUpOnClick:
BX	LR
; end of _OneYearUpOnClick
_OneYearDwnOnClick:
;Controller_events_code.c,1126 :: 		void OneYearDwnOnClick(){
;Controller_events_code.c,1128 :: 		}
L_end_OneYearDwnOnClick:
BX	LR
; end of _OneYearDwnOnClick
_OneYearUpOnUp:
;Controller_events_code.c,1129 :: 		void OneYearUpOnUp(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1133 :: 		oneYearU++;
MOVW	R1, #lo_addr(_oneYearU+0)
MOVT	R1, #hi_addr(_oneYearU+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1134 :: 		if (oneYearU > 9)oneYearU=0;
CMP	R0, #9
IT	LE
BLE	L_OneYearUpOnUp209
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
STRB	R1, [R0, #0]
L_OneYearUpOnUp209:
;Controller_events_code.c,1135 :: 		ByteToStr(oneYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1136 :: 		res=Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1137 :: 		strcpy(Button3.Caption,res );
MOVW	R1, #lo_addr(_Button3+24)
MOVT	R1, #hi_addr(_Button3+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1138 :: 		DrawButton(&Button3);
MOVW	R0, #lo_addr(_Button3+0)
MOVT	R0, #hi_addr(_Button3+0)
BL	_DrawButton+0
;Controller_events_code.c,1139 :: 		}
L_end_OneYearUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearUpOnUp
_OneYearUpOnPress:
;Controller_events_code.c,1140 :: 		void OneYearUpOnPress(){
;Controller_events_code.c,1142 :: 		}
L_end_OneYearUpOnPress:
BX	LR
; end of _OneYearUpOnPress
_OneYearDwnOnUp:
;Controller_events_code.c,1143 :: 		void OneYearDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1146 :: 		oneYearU--;
MOVW	R1, #lo_addr(_oneYearU+0)
MOVT	R1, #hi_addr(_oneYearU+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1147 :: 		if (oneYearU <0)oneYearU=9;
CMP	R0, #0
IT	GE
BGE	L_OneYearDwnOnUp210
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
STRB	R1, [R0, #0]
L_OneYearDwnOnUp210:
;Controller_events_code.c,1148 :: 		ByteToStr(oneYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1149 :: 		res = Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1150 :: 		strcpy(Button3.Caption, res);
MOVW	R1, #lo_addr(_Button3+24)
MOVT	R1, #hi_addr(_Button3+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1151 :: 		DrawButton(&Button3);
MOVW	R0, #lo_addr(_Button3+0)
MOVT	R0, #hi_addr(_Button3+0)
BL	_DrawButton+0
;Controller_events_code.c,1152 :: 		}
L_end_OneYearDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearDwnOnUp
_OneYearDwnOnPress:
;Controller_events_code.c,1153 :: 		void OneYearDwnOnPress() {
;Controller_events_code.c,1155 :: 		}
L_end_OneYearDwnOnPress:
BX	LR
; end of _OneYearDwnOnPress
_TenYearUpOnClick:
;Controller_events_code.c,1157 :: 		void TenYearUpOnClick() {
;Controller_events_code.c,1159 :: 		}
L_end_TenYearUpOnClick:
BX	LR
; end of _TenYearUpOnClick
_TenYearDwnOnClick:
;Controller_events_code.c,1160 :: 		void TenYearDwnOnClick() {
;Controller_events_code.c,1162 :: 		}
L_end_TenYearDwnOnClick:
BX	LR
; end of _TenYearDwnOnClick
_TenYearUpOnUp:
;Controller_events_code.c,1163 :: 		void TenYearUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1166 :: 		tenYearU++;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1167 :: 		if (tenYearU > 9)tenYearU=0;
CMP	R0, #9
IT	LE
BLE	L_TenYearUpOnUp211
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_TenYearUpOnUp211:
;Controller_events_code.c,1168 :: 		ByteToStr(tenYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1169 :: 		res =Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1170 :: 		strcpy(Button1.Caption,res);
MOVW	R1, #lo_addr(_Button1+24)
MOVT	R1, #hi_addr(_Button1+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1171 :: 		DrawButton(&Button1);
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
BL	_DrawButton+0
;Controller_events_code.c,1172 :: 		}
L_end_TenYearUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenYearUpOnUp
_TenYearDwnOnUp:
;Controller_events_code.c,1173 :: 		void TenYearDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1176 :: 		tenYearU--;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1177 :: 		if (tenYearU<0)tenYearU=9;
CMP	R0, #0
IT	GE
BGE	L_TenYearDwnOnUp212
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_TenYearDwnOnUp212:
;Controller_events_code.c,1178 :: 		ByteToStr(tenYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1179 :: 		res =  Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1180 :: 		strcpy(Button1.Caption,res);
MOVW	R1, #lo_addr(_Button1+24)
MOVT	R1, #hi_addr(_Button1+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1181 :: 		DrawButton(&Button1);
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
BL	_DrawButton+0
;Controller_events_code.c,1182 :: 		}
L_end_TenYearDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenYearDwnOnUp
_TenYearDwnOnPress:
;Controller_events_code.c,1183 :: 		void TenYearDwnOnPress() {
;Controller_events_code.c,1184 :: 		}
L_end_TenYearDwnOnPress:
BX	LR
; end of _TenYearDwnOnPress
_TenYearUpOnPress:
;Controller_events_code.c,1185 :: 		void TenYearUpOnPress() {
;Controller_events_code.c,1187 :: 		}
L_end_TenYearUpOnPress:
BX	LR
; end of _TenYearUpOnPress
_MonthDateUpOnClick:
;Controller_events_code.c,1189 :: 		void MonthDateUpOnClick() {
;Controller_events_code.c,1191 :: 		}
L_end_MonthDateUpOnClick:
BX	LR
; end of _MonthDateUpOnClick
_MonthDateUpOnUp:
;Controller_events_code.c,1192 :: 		void MonthDateUpOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1195 :: 		oneMonth++;
MOVW	R1, #lo_addr(_oneMonth+0)
MOVT	R1, #hi_addr(_oneMonth+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1196 :: 		if (oneMonth > 12)oneMonth=1;
CMP	R0, #12
IT	LE
BLE	L_MonthDateUpOnUp213
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
STRB	R1, [R0, #0]
L_MonthDateUpOnUp213:
;Controller_events_code.c,1197 :: 		switch (oneMonth)  {
IT	AL
BAL	L_MonthDateUpOnUp214
;Controller_events_code.c,1198 :: 		case 1 :  strcpy(Button4.Caption,"JAN");break;
L_MonthDateUpOnUp216:
MOVW	R1, #lo_addr(?lstr58_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr58_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1199 :: 		case 2 :  strcpy(Button4.Caption,"FAB");break;
L_MonthDateUpOnUp217:
MOVW	R1, #lo_addr(?lstr59_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr59_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1200 :: 		case 3 :  strcpy(Button4.Caption,"MAR");break;
L_MonthDateUpOnUp218:
MOVW	R1, #lo_addr(?lstr60_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr60_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1201 :: 		case 4 :  strcpy(Button4.Caption,"APR");break;
L_MonthDateUpOnUp219:
MOVW	R1, #lo_addr(?lstr61_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr61_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1202 :: 		case 5 :  strcpy(Button4.Caption,"MAY");break;
L_MonthDateUpOnUp220:
MOVW	R1, #lo_addr(?lstr62_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr62_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1203 :: 		case 6 :  strcpy(Button4.Caption,"JUN");break;
L_MonthDateUpOnUp221:
MOVW	R1, #lo_addr(?lstr63_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr63_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1204 :: 		case 7 :  strcpy(Button4.Caption,"JUL");break;
L_MonthDateUpOnUp222:
MOVW	R1, #lo_addr(?lstr64_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr64_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1205 :: 		case 8 :  strcpy(Button4.Caption,"AUG");break;
L_MonthDateUpOnUp223:
MOVW	R1, #lo_addr(?lstr65_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr65_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1206 :: 		case 9 :  strcpy(Button4.Caption,"SEP");break;
L_MonthDateUpOnUp224:
MOVW	R1, #lo_addr(?lstr66_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr66_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1207 :: 		case 10 : strcpy(Button4.Caption,"OCT");break;
L_MonthDateUpOnUp225:
MOVW	R1, #lo_addr(?lstr67_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr67_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1208 :: 		case 11 : strcpy(Button4.Caption,"NOV");break;
L_MonthDateUpOnUp226:
MOVW	R1, #lo_addr(?lstr68_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr68_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1209 :: 		case 12 : strcpy(Button4.Caption,"DEC");break;
L_MonthDateUpOnUp227:
MOVW	R1, #lo_addr(?lstr69_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr69_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp215
;Controller_events_code.c,1210 :: 		}
L_MonthDateUpOnUp214:
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_MonthDateUpOnUp216
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_MonthDateUpOnUp217
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_MonthDateUpOnUp218
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_MonthDateUpOnUp219
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_MonthDateUpOnUp220
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_MonthDateUpOnUp221
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_MonthDateUpOnUp222
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_MonthDateUpOnUp223
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_MonthDateUpOnUp224
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_MonthDateUpOnUp225
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L_MonthDateUpOnUp226
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L_MonthDateUpOnUp227
L_MonthDateUpOnUp215:
;Controller_events_code.c,1212 :: 		DrawButton(&Button4);
MOVW	R0, #lo_addr(_Button4+0)
MOVT	R0, #hi_addr(_Button4+0)
BL	_DrawButton+0
;Controller_events_code.c,1213 :: 		}
L_end_MonthDateUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MonthDateUpOnUp
_MonthDateUpOnPress:
;Controller_events_code.c,1214 :: 		void MonthDateUpOnPress() {
;Controller_events_code.c,1216 :: 		}
L_end_MonthDateUpOnPress:
BX	LR
; end of _MonthDateUpOnPress
_MonthDateDwnOnClick:
;Controller_events_code.c,1217 :: 		void MonthDateDwnOnClick() {
;Controller_events_code.c,1222 :: 		}
L_end_MonthDateDwnOnClick:
BX	LR
; end of _MonthDateDwnOnClick
_MonthDateDwnOnUp:
;Controller_events_code.c,1223 :: 		void MonthDateDwnOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1225 :: 		oneMonth--;
MOVW	R1, #lo_addr(_oneMonth+0)
MOVT	R1, #hi_addr(_oneMonth+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1226 :: 		if (oneMonth <0)oneMonth=12;
CMP	R0, #0
IT	GE
BGE	L_MonthDateDwnOnUp228
MOVS	R1, #12
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
STRB	R1, [R0, #0]
L_MonthDateDwnOnUp228:
;Controller_events_code.c,1227 :: 		strcpy(Button4.Caption,"SEP");
MOVW	R1, #lo_addr(?lstr70_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr70_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1228 :: 		switch (oneMonth)  {
IT	AL
BAL	L_MonthDateDwnOnUp229
;Controller_events_code.c,1229 :: 		case 1 : strcpy(Button4.Caption,"JAN");break;
L_MonthDateDwnOnUp231:
MOVW	R1, #lo_addr(?lstr71_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr71_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1230 :: 		case 2 : strcpy(Button4.Caption,"FAB");break;
L_MonthDateDwnOnUp232:
MOVW	R1, #lo_addr(?lstr72_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr72_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1231 :: 		case 3 : strcpy(Button4.Caption,"MAR");break;
L_MonthDateDwnOnUp233:
MOVW	R1, #lo_addr(?lstr73_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr73_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1232 :: 		case 4 : strcpy(Button4.Caption,"APR");break;
L_MonthDateDwnOnUp234:
MOVW	R1, #lo_addr(?lstr74_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr74_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1233 :: 		case 5 : strcpy(Button4.Caption,"MAY");break;
L_MonthDateDwnOnUp235:
MOVW	R1, #lo_addr(?lstr75_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr75_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1234 :: 		case 6 : strcpy(Button4.Caption,"JUN");break;
L_MonthDateDwnOnUp236:
MOVW	R1, #lo_addr(?lstr76_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr76_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1235 :: 		case 7 : strcpy(Button4.Caption,"JUL");break;
L_MonthDateDwnOnUp237:
MOVW	R1, #lo_addr(?lstr77_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr77_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1236 :: 		case 8 : strcpy(Button4.Caption,"AUG");break;
L_MonthDateDwnOnUp238:
MOVW	R1, #lo_addr(?lstr78_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr78_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1237 :: 		case 9 : strcpy(Button4.Caption,"SEP");break;
L_MonthDateDwnOnUp239:
MOVW	R1, #lo_addr(?lstr79_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr79_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1238 :: 		case 10 : strcpy(Button4.Caption,"OCT");break;
L_MonthDateDwnOnUp240:
MOVW	R1, #lo_addr(?lstr80_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr80_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1239 :: 		case 11 : strcpy(Button4.Caption,"NOV");break;
L_MonthDateDwnOnUp241:
MOVW	R1, #lo_addr(?lstr81_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr81_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1240 :: 		case 12 : strcpy(Button4.Caption,"DEC");break;
L_MonthDateDwnOnUp242:
MOVW	R1, #lo_addr(?lstr82_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr82_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp230
;Controller_events_code.c,1241 :: 		}
L_MonthDateDwnOnUp229:
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_MonthDateDwnOnUp231
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_MonthDateDwnOnUp232
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_MonthDateDwnOnUp233
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_MonthDateDwnOnUp234
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_MonthDateDwnOnUp235
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_MonthDateDwnOnUp236
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_MonthDateDwnOnUp237
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_MonthDateDwnOnUp238
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_MonthDateDwnOnUp239
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_MonthDateDwnOnUp240
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L_MonthDateDwnOnUp241
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L_MonthDateDwnOnUp242
L_MonthDateDwnOnUp230:
;Controller_events_code.c,1242 :: 		DrawButton(&Button4);
MOVW	R0, #lo_addr(_Button4+0)
MOVT	R0, #hi_addr(_Button4+0)
BL	_DrawButton+0
;Controller_events_code.c,1243 :: 		}
L_end_MonthDateDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MonthDateDwnOnUp
_MonthDateDwnOnPress:
;Controller_events_code.c,1244 :: 		void MonthDateDwnOnPress() {
;Controller_events_code.c,1245 :: 		}
L_end_MonthDateDwnOnPress:
BX	LR
; end of _MonthDateDwnOnPress
_TenDayUpOnClick:
;Controller_events_code.c,1247 :: 		void TenDayUpOnClick() {
;Controller_events_code.c,1249 :: 		}
L_end_TenDayUpOnClick:
BX	LR
; end of _TenDayUpOnClick
_TenDayDwnOnClick:
;Controller_events_code.c,1250 :: 		void TenDayDwnOnClick() {
;Controller_events_code.c,1252 :: 		}
L_end_TenDayDwnOnClick:
BX	LR
; end of _TenDayDwnOnClick
_TenDayUpOnUp:
;Controller_events_code.c,1254 :: 		void TenDayUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1256 :: 		tenDayU++;
MOVW	R1, #lo_addr(_tenDayU+0)
MOVT	R1, #hi_addr(_tenDayU+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1257 :: 		if (tenDayU > 9)tenDayU=0;
CMP	R0, #9
IT	LE
BLE	L_TenDayUpOnUp243
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
STRB	R1, [R0, #0]
L_TenDayUpOnUp243:
;Controller_events_code.c,1258 :: 		ByteToStr(tenDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1259 :: 		strcpy(Button8.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button8+24)
MOVT	R1, #hi_addr(_Button8+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1260 :: 		DrawButton(&Button8);
MOVW	R0, #lo_addr(_Button8+0)
MOVT	R0, #hi_addr(_Button8+0)
BL	_DrawButton+0
;Controller_events_code.c,1261 :: 		}
L_end_TenDayUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenDayUpOnUp
_TenDayDwnOnUp:
;Controller_events_code.c,1263 :: 		void TenDayDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1265 :: 		tenDayU--;
MOVW	R1, #lo_addr(_tenDayU+0)
MOVT	R1, #hi_addr(_tenDayU+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1266 :: 		if (tenDayU <0)tenDayU=9;
CMP	R0, #0
IT	GE
BGE	L_TenDayDwnOnUp244
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
STRB	R1, [R0, #0]
L_TenDayDwnOnUp244:
;Controller_events_code.c,1267 :: 		ByteToStr(tenDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1268 :: 		strcpy(Button8.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button8+24)
MOVT	R1, #hi_addr(_Button8+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1269 :: 		DrawButton(&Button8);
MOVW	R0, #lo_addr(_Button8+0)
MOVT	R0, #hi_addr(_Button8+0)
BL	_DrawButton+0
;Controller_events_code.c,1270 :: 		}
L_end_TenDayDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenDayDwnOnUp
_TenDayUpOnPress:
;Controller_events_code.c,1272 :: 		void TenDayUpOnPress() {
;Controller_events_code.c,1274 :: 		}
L_end_TenDayUpOnPress:
BX	LR
; end of _TenDayUpOnPress
_TenDayDwnOnPress:
;Controller_events_code.c,1276 :: 		void TenDayDwnOnPress() {
;Controller_events_code.c,1278 :: 		}
L_end_TenDayDwnOnPress:
BX	LR
; end of _TenDayDwnOnPress
_OneDayUpOnClick:
;Controller_events_code.c,1280 :: 		void OneDayUpOnClick() {
;Controller_events_code.c,1282 :: 		}
L_end_OneDayUpOnClick:
BX	LR
; end of _OneDayUpOnClick
_OneDayDwnOnClick:
;Controller_events_code.c,1284 :: 		void OneDayDwnOnClick() {
;Controller_events_code.c,1286 :: 		}
L_end_OneDayDwnOnClick:
BX	LR
; end of _OneDayDwnOnClick
_OneDayUpOnUp:
;Controller_events_code.c,1288 :: 		void OneDayUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1290 :: 		oneDayU++;
MOVW	R1, #lo_addr(_oneDayU+0)
MOVT	R1, #hi_addr(_oneDayU+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1291 :: 		if (oneDayU > 9)oneDayU=0;
CMP	R0, #9
IT	LE
BLE	L_OneDayUpOnUp245
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
STRB	R1, [R0, #0]
L_OneDayUpOnUp245:
;Controller_events_code.c,1292 :: 		ByteToStr(oneDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1293 :: 		strcpy(Button12.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button12+24)
MOVT	R1, #hi_addr(_Button12+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1294 :: 		DrawButton(&Button12);
MOVW	R0, #lo_addr(_Button12+0)
MOVT	R0, #hi_addr(_Button12+0)
BL	_DrawButton+0
;Controller_events_code.c,1295 :: 		}
L_end_OneDayUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneDayUpOnUp
_OneDayDwnOnUp:
;Controller_events_code.c,1297 :: 		void OneDayDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1299 :: 		oneDayU--;
MOVW	R1, #lo_addr(_oneDayU+0)
MOVT	R1, #hi_addr(_oneDayU+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1300 :: 		if (oneDayU <0)oneDayU=9;
CMP	R0, #0
IT	GE
BGE	L_OneDayDwnOnUp246
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
STRB	R1, [R0, #0]
L_OneDayDwnOnUp246:
;Controller_events_code.c,1301 :: 		ByteToStr(oneDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1302 :: 		strcpy(Button12.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button12+24)
MOVT	R1, #hi_addr(_Button12+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1303 :: 		DrawButton(&Button12);
MOVW	R0, #lo_addr(_Button12+0)
MOVT	R0, #hi_addr(_Button12+0)
BL	_DrawButton+0
;Controller_events_code.c,1304 :: 		}
L_end_OneDayDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneDayDwnOnUp
_OneDayUpOnPress:
;Controller_events_code.c,1306 :: 		void OneDayUpOnPress() {
;Controller_events_code.c,1308 :: 		}
L_end_OneDayUpOnPress:
BX	LR
; end of _OneDayUpOnPress
_OneDayDwnOnPress:
;Controller_events_code.c,1310 :: 		void OneDayDwnOnPress() {
;Controller_events_code.c,1312 :: 		}
L_end_OneDayDwnOnPress:
BX	LR
; end of _OneDayDwnOnPress
_Day_unitUpOnClick:
;Controller_events_code.c,1314 :: 		void Day_unitUpOnClick() {
;Controller_events_code.c,1316 :: 		}
L_end_Day_unitUpOnClick:
BX	LR
; end of _Day_unitUpOnClick
_Day_unitDwnOnClick:
;Controller_events_code.c,1318 :: 		void Day_unitDwnOnClick() {
;Controller_events_code.c,1320 :: 		}
L_end_Day_unitDwnOnClick:
BX	LR
; end of _Day_unitDwnOnClick
_Day_unitUpOnUp:
;Controller_events_code.c,1322 :: 		void Day_unitUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1324 :: 		tenHour++;
MOVW	R1, #lo_addr(_tenHour+0)
MOVT	R1, #hi_addr(_tenHour+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1325 :: 		if (tenHour > 9)tenHour=0;
CMP	R0, #9
IT	LE
BLE	L_Day_unitUpOnUp247
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
STRB	R1, [R0, #0]
L_Day_unitUpOnUp247:
;Controller_events_code.c,1326 :: 		ByteToStr(tenHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1327 :: 		strcpy(Button21.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button21+24)
MOVT	R1, #hi_addr(_Button21+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1328 :: 		DrawButton(&Button21);
MOVW	R0, #lo_addr(_Button21+0)
MOVT	R0, #hi_addr(_Button21+0)
BL	_DrawButton+0
;Controller_events_code.c,1329 :: 		}
L_end_Day_unitUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Day_unitUpOnUp
_Day_unitDwnOnUp:
;Controller_events_code.c,1331 :: 		void Day_unitDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1333 :: 		tenHour--;
MOVW	R1, #lo_addr(_tenHour+0)
MOVT	R1, #hi_addr(_tenHour+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1334 :: 		if (tenHour <0)tenHour=9;
CMP	R0, #0
IT	GE
BGE	L_Day_unitDwnOnUp248
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
STRB	R1, [R0, #0]
L_Day_unitDwnOnUp248:
;Controller_events_code.c,1335 :: 		ByteToStr(tenHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1336 :: 		strcpy(Button21.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button21+24)
MOVT	R1, #hi_addr(_Button21+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1337 :: 		DrawButton(&Button21);
MOVW	R0, #lo_addr(_Button21+0)
MOVT	R0, #hi_addr(_Button21+0)
BL	_DrawButton+0
;Controller_events_code.c,1338 :: 		}
L_end_Day_unitDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Day_unitDwnOnUp
_Day_unitUpOnPress:
;Controller_events_code.c,1340 :: 		void Day_unitUpOnPress() {
;Controller_events_code.c,1342 :: 		}
L_end_Day_unitUpOnPress:
BX	LR
; end of _Day_unitUpOnPress
_Day_unitDwnOnPress:
;Controller_events_code.c,1344 :: 		void Day_unitDwnOnPress() {
;Controller_events_code.c,1346 :: 		}
L_end_Day_unitDwnOnPress:
BX	LR
; end of _Day_unitDwnOnPress
_Unit_hoursUpOnClick:
;Controller_events_code.c,1348 :: 		void Unit_hoursUpOnClick() {
;Controller_events_code.c,1350 :: 		}
L_end_Unit_hoursUpOnClick:
BX	LR
; end of _Unit_hoursUpOnClick
_Unit_hoursDwnOnClick:
;Controller_events_code.c,1352 :: 		void Unit_hoursDwnOnClick() {
;Controller_events_code.c,1354 :: 		}
L_end_Unit_hoursDwnOnClick:
BX	LR
; end of _Unit_hoursDwnOnClick
_Unit_hoursUpOnUp:
;Controller_events_code.c,1355 :: 		void Unit_hoursUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1357 :: 		oneHour++;
MOVW	R1, #lo_addr(_oneHour+0)
MOVT	R1, #hi_addr(_oneHour+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1358 :: 		if (oneHour > 9)oneHour=0;
CMP	R0, #9
IT	LE
BLE	L_Unit_hoursUpOnUp249
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
STRB	R1, [R0, #0]
L_Unit_hoursUpOnUp249:
;Controller_events_code.c,1359 :: 		ByteToStr(oneHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1360 :: 		strcpy(Button24.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button24+24)
MOVT	R1, #hi_addr(_Button24+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1361 :: 		DrawButton(&Button24);
MOVW	R0, #lo_addr(_Button24+0)
MOVT	R0, #hi_addr(_Button24+0)
BL	_DrawButton+0
;Controller_events_code.c,1362 :: 		}
L_end_Unit_hoursUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_hoursUpOnUp
_Unit_hoursDwnOnUp:
;Controller_events_code.c,1363 :: 		void Unit_hoursDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1365 :: 		oneHour--;
MOVW	R1, #lo_addr(_oneHour+0)
MOVT	R1, #hi_addr(_oneHour+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1366 :: 		if (oneHour <0)oneHour=9;
CMP	R0, #0
IT	GE
BGE	L_Unit_hoursDwnOnUp250
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
STRB	R1, [R0, #0]
L_Unit_hoursDwnOnUp250:
;Controller_events_code.c,1367 :: 		ByteToStr(oneHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1368 :: 		strcpy(Button24.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button24+24)
MOVT	R1, #hi_addr(_Button24+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1369 :: 		DrawButton(&Button24);
MOVW	R0, #lo_addr(_Button24+0)
MOVT	R0, #hi_addr(_Button24+0)
BL	_DrawButton+0
;Controller_events_code.c,1370 :: 		}
L_end_Unit_hoursDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_hoursDwnOnUp
_Unit_hoursUpOnPress:
;Controller_events_code.c,1371 :: 		void Unit_hoursUpOnPress() {
;Controller_events_code.c,1373 :: 		}
L_end_Unit_hoursUpOnPress:
BX	LR
; end of _Unit_hoursUpOnPress
_Unit_hoursDwnOnPress:
;Controller_events_code.c,1374 :: 		void Unit_hoursDwnOnPress() {
;Controller_events_code.c,1376 :: 		}
L_end_Unit_hoursDwnOnPress:
BX	LR
; end of _Unit_hoursDwnOnPress
_Ten_minutesUpOnClick:
;Controller_events_code.c,1378 :: 		void Ten_minutesUpOnClick() {
;Controller_events_code.c,1380 :: 		}
L_end_Ten_minutesUpOnClick:
BX	LR
; end of _Ten_minutesUpOnClick
_Ten_minutesDwnOnClick:
;Controller_events_code.c,1381 :: 		void Ten_minutesDwnOnClick() {
;Controller_events_code.c,1383 :: 		}
L_end_Ten_minutesDwnOnClick:
BX	LR
; end of _Ten_minutesDwnOnClick
_Ten_minutesUpOnUp:
;Controller_events_code.c,1384 :: 		void Ten_minutesUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1386 :: 		tenMinute++;
MOVW	R1, #lo_addr(_tenMinute+0)
MOVT	R1, #hi_addr(_tenMinute+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1387 :: 		if (tenMinute > 9)tenMinute=0;
CMP	R0, #9
IT	LE
BLE	L_Ten_minutesUpOnUp251
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
STRB	R1, [R0, #0]
L_Ten_minutesUpOnUp251:
;Controller_events_code.c,1388 :: 		ByteToStr(tenMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1389 :: 		strcpy(Button40.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button40+24)
MOVT	R1, #hi_addr(_Button40+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1390 :: 		DrawButton(&Button40);
MOVW	R0, #lo_addr(_Button40+0)
MOVT	R0, #hi_addr(_Button40+0)
BL	_DrawButton+0
;Controller_events_code.c,1391 :: 		}
L_end_Ten_minutesUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Ten_minutesUpOnUp
_Ten_minutesDwnOnUp:
;Controller_events_code.c,1392 :: 		void Ten_minutesDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1394 :: 		tenMinute--;
MOVW	R1, #lo_addr(_tenMinute+0)
MOVT	R1, #hi_addr(_tenMinute+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1395 :: 		if (tenMinute <0)tenMinute=9;
CMP	R0, #0
IT	GE
BGE	L_Ten_minutesDwnOnUp252
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
STRB	R1, [R0, #0]
L_Ten_minutesDwnOnUp252:
;Controller_events_code.c,1396 :: 		ByteToStr(tenMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1397 :: 		strcpy(Button40.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button40+24)
MOVT	R1, #hi_addr(_Button40+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1398 :: 		DrawButton(&Button40);
MOVW	R0, #lo_addr(_Button40+0)
MOVT	R0, #hi_addr(_Button40+0)
BL	_DrawButton+0
;Controller_events_code.c,1399 :: 		}
L_end_Ten_minutesDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Ten_minutesDwnOnUp
_Ten_minutesUpOnPress:
;Controller_events_code.c,1400 :: 		void Ten_minutesUpOnPress() {
;Controller_events_code.c,1402 :: 		}
L_end_Ten_minutesUpOnPress:
BX	LR
; end of _Ten_minutesUpOnPress
_Ten_minutesDwnOnPress:
;Controller_events_code.c,1403 :: 		void Ten_minutesDwnOnPress() {
;Controller_events_code.c,1405 :: 		}
L_end_Ten_minutesDwnOnPress:
BX	LR
; end of _Ten_minutesDwnOnPress
_Unit_minutesUpOnClick:
;Controller_events_code.c,1407 :: 		void Unit_minutesUpOnClick() {
;Controller_events_code.c,1409 :: 		}
L_end_Unit_minutesUpOnClick:
BX	LR
; end of _Unit_minutesUpOnClick
_Unit_minutesDwnOnClick:
;Controller_events_code.c,1411 :: 		void Unit_minutesDwnOnClick() {
;Controller_events_code.c,1413 :: 		}
L_end_Unit_minutesDwnOnClick:
BX	LR
; end of _Unit_minutesDwnOnClick
_Unit_minutesUpOnUp:
;Controller_events_code.c,1415 :: 		void Unit_minutesUpOnUp(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1417 :: 		oneMinute++;
MOVW	R1, #lo_addr(_oneMinute+0)
MOVT	R1, #hi_addr(_oneMinute+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1418 :: 		if (oneMinute > 9)oneMinute=0;
CMP	R0, #9
IT	LE
BLE	L_Unit_minutesUpOnUp253
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
STRB	R1, [R0, #0]
L_Unit_minutesUpOnUp253:
;Controller_events_code.c,1419 :: 		ByteToStr(oneMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1420 :: 		strcpy(Button43.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button43+24)
MOVT	R1, #hi_addr(_Button43+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1421 :: 		DrawButton(&Button43);
MOVW	R0, #lo_addr(_Button43+0)
MOVT	R0, #hi_addr(_Button43+0)
BL	_DrawButton+0
;Controller_events_code.c,1422 :: 		}
L_end_Unit_minutesUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_minutesUpOnUp
_Unit_minutesDwnOnUp:
;Controller_events_code.c,1424 :: 		void Unit_minutesDwnOnUp(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1426 :: 		oneMinute--;
MOVW	R1, #lo_addr(_oneMinute+0)
MOVT	R1, #hi_addr(_oneMinute+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1427 :: 		if (oneMinute <0)oneMinute=9;
CMP	R0, #0
IT	GE
BGE	L_Unit_minutesDwnOnUp254
MOVS	R1, #9
SXTB	R1, R1
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
STRB	R1, [R0, #0]
L_Unit_minutesDwnOnUp254:
;Controller_events_code.c,1428 :: 		ByteToStr(oneMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
LDRSB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1429 :: 		strcpy(Button43.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button43+24)
MOVT	R1, #hi_addr(_Button43+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1430 :: 		DrawButton(&Button43);
MOVW	R0, #lo_addr(_Button43+0)
MOVT	R0, #hi_addr(_Button43+0)
BL	_DrawButton+0
;Controller_events_code.c,1431 :: 		}
L_end_Unit_minutesDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_minutesDwnOnUp
_Unit_minutesUpOnPress:
;Controller_events_code.c,1433 :: 		void Unit_minutesUpOnPress() {
;Controller_events_code.c,1435 :: 		}
L_end_Unit_minutesUpOnPress:
BX	LR
; end of _Unit_minutesUpOnPress
_Unit_minutesDwnOnPress:
;Controller_events_code.c,1437 :: 		void Unit_minutesDwnOnPress() {
;Controller_events_code.c,1439 :: 		}
L_end_Unit_minutesDwnOnPress:
BX	LR
; end of _Unit_minutesDwnOnPress
_Admin_SetOnClick:
;Controller_events_code.c,1442 :: 		void Admin_SetOnClick(){
;Controller_events_code.c,1443 :: 		}
L_end_Admin_SetOnClick:
BX	LR
; end of _Admin_SetOnClick
_system_passOnDown:
;Controller_events_code.c,1445 :: 		void system_passOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1446 :: 		Image83.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1447 :: 		DrawImage(&Image83);
MOVW	R0, #lo_addr(_Image83+0)
MOVT	R0, #hi_addr(_Image83+0)
BL	_DrawImage+0
;Controller_events_code.c,1448 :: 		}
L_end_system_passOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnDown
_system_passOnUp:
;Controller_events_code.c,1450 :: 		void system_passOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1451 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1452 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1453 :: 		Image83.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1454 :: 		DrawScreen(&PASSWORD);
MOVW	R0, #lo_addr(_PASSWORD+0)
MOVT	R0, #hi_addr(_PASSWORD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1455 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1456 :: 		}
L_end_system_passOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnUp
_ModeSetOnUp:
;Controller_events_code.c,1458 :: 		void ModeSetOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1459 :: 		if (SYSTEM_ON == false) {
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_ModeSetOnUp255
;Controller_events_code.c,1460 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1461 :: 		strcpy(System_Set_Message.Caption, " ");
MOVW	R1, #lo_addr(?lstr83_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr83_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1462 :: 		Image300.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1463 :: 		System_Set_Message.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1464 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1465 :: 		}
IT	AL
BAL	L_ModeSetOnUp256
L_ModeSetOnUp255:
;Controller_events_code.c,1467 :: 		strcpy(System_Set_Message.Caption, "Please  OFF  system  power!");
MOVW	R1, #lo_addr(?lstr84_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr84_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1468 :: 		Image300.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1469 :: 		DrawImage (&Image300);
MOVW	R0, #lo_addr(_Image300+0)
MOVT	R0, #hi_addr(_Image300+0)
BL	_DrawImage+0
;Controller_events_code.c,1470 :: 		System_Set_Message.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1471 :: 		DrawButton (&System_Set_Message);
MOVW	R0, #lo_addr(_System_Set_Message+0)
MOVT	R0, #hi_addr(_System_Set_Message+0)
BL	_DrawButton+0
;Controller_events_code.c,1472 :: 		}
L_ModeSetOnUp256:
;Controller_events_code.c,1473 :: 		}
L_end_ModeSetOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnUp
_ModeSetOnDown:
;Controller_events_code.c,1475 :: 		void ModeSetOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1476 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1477 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1478 :: 		}
L_end_ModeSetOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnDown
_system_EEVOnDown:
;Controller_events_code.c,1480 :: 		void system_EEVOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1481 :: 		Image89.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1482 :: 		DrawImage(&Image89);
MOVW	R0, #lo_addr(_Image89+0)
MOVT	R0, #hi_addr(_Image89+0)
BL	_DrawImage+0
;Controller_events_code.c,1483 :: 		reciev_data_packet(TRV_CORRECT_1,1);
MOVS	R1, #1
MOVW	R0, #391
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,1484 :: 		Delay_ms(300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_system_EEVOnDown257:
SUBS	R7, R7, #1
BNE	L_system_EEVOnDown257
NOP
NOP
NOP
;Controller_events_code.c,1485 :: 		}
L_end_system_EEVOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnDown
_system_EEVOnUp:
;Controller_events_code.c,1487 :: 		void system_EEVOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1489 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1490 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1491 :: 		incTRV = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1494 :: 		Image89.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1495 :: 		DrawScreen(&EEV);
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
BL	_DrawScreen+0
;Controller_events_code.c,1496 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1498 :: 		}
L_end_system_EEVOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnUp
_system_modeOnDown:
;Controller_events_code.c,1500 :: 		void system_modeOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1501 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1502 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1503 :: 		}
L_end_system_modeOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnDown
_system_modeOnUp:
;Controller_events_code.c,1505 :: 		void system_modeOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1506 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1507 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1508 :: 		Image85.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1509 :: 		DrawScreen(&MODE);
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
;Controller_events_code.c,1510 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1511 :: 		}
L_end_system_modeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnUp
_system_delayOnUp:
;Controller_events_code.c,1513 :: 		void system_delayOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1514 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1515 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1516 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1517 :: 		DrawScreen(&DELAY_MENU);
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,1518 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1519 :: 		}
L_end_system_delayOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnUp
_system_delayOnDown:
;Controller_events_code.c,1520 :: 		void system_delayOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1521 :: 		Image90.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1522 :: 		DrawImage(&Image90);
MOVW	R0, #lo_addr(_Image90+0)
MOVT	R0, #hi_addr(_Image90+0)
BL	_DrawImage+0
;Controller_events_code.c,1523 :: 		}
L_end_system_delayOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnDown
_system_graphOnDown:
;Controller_events_code.c,1525 :: 		void system_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1526 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1527 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1528 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1529 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1530 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1531 :: 		}
L_end_system_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnDown
_system_graphOnUp:
;Controller_events_code.c,1533 :: 		void system_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1534 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1535 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1537 :: 		}
L_end_system_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnUp
_system_microSDOnDown:
;Controller_events_code.c,1538 :: 		void system_microSDOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1539 :: 		Image88.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1540 :: 		DrawImage(&Image88);
MOVW	R0, #lo_addr(_Image88+0)
MOVT	R0, #hi_addr(_Image88+0)
BL	_DrawImage+0
;Controller_events_code.c,1541 :: 		}
L_end_system_microSDOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnDown
_system_microSDOnUp:
;Controller_events_code.c,1543 :: 		void system_microSDOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1544 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1545 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1546 :: 		Image88.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1547 :: 		DrawScreen(&MICRO_SD);
MOVW	R0, #lo_addr(_MICRO_SD+0)
MOVT	R0, #hi_addr(_MICRO_SD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1548 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1549 :: 		}
L_end_system_microSDOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnUp
_system_limitsOnDown:
;Controller_events_code.c,1552 :: 		void system_limitsOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1553 :: 		Image91.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1554 :: 		DrawImage(&Image91);
MOVW	R0, #lo_addr(_Image91+0)
MOVT	R0, #hi_addr(_Image91+0)
BL	_DrawImage+0
;Controller_events_code.c,1555 :: 		}
L_end_system_limitsOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnDown
_system_limitsOnUp:
;Controller_events_code.c,1557 :: 		void system_limitsOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1558 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1559 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1560 :: 		Image91.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1561 :: 		DrawScreen(&LIMITS1);
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
;Controller_events_code.c,1562 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1563 :: 		}
L_end_system_limitsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnUp
_ssytem_graphOnDown:
;Controller_events_code.c,1565 :: 		void ssytem_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1566 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1567 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1568 :: 		}
L_end_ssytem_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnDown
_ssytem_graphOnUp:
;Controller_events_code.c,1570 :: 		void ssytem_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1571 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1572 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1573 :: 		Image92.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1574 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1575 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1576 :: 		}
L_end_ssytem_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnUp
_system_historyOnDown:
;Controller_events_code.c,1578 :: 		void system_historyOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1579 :: 		Image93.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1580 :: 		DrawImage(&Image93);
MOVW	R0, #lo_addr(_Image93+0)
MOVT	R0, #hi_addr(_Image93+0)
BL	_DrawImage+0
;Controller_events_code.c,1581 :: 		}
L_end_system_historyOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnDown
_system_historyOnUp:
;Controller_events_code.c,1583 :: 		void system_historyOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1584 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1585 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1586 :: 		Image93.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1587 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,1588 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1589 :: 		}
L_end_system_historyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnUp
_Delay_Source_DOWNOnUp:
;Controller_events_code.c,1592 :: 		void Delay_Source_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1593 :: 		Image306.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1594 :: 		Delay_Source_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1595 :: 		DrawImage(&Delay_Source_DOWN);
MOVW	R0, #lo_addr(_Delay_Source_DOWN+0)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1596 :: 		}
L_end_Delay_Source_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_DOWNOnUp
_Delay_Source_DOWNOnPress:
;Controller_events_code.c,1597 :: 		void Delay_Source_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1600 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1601 :: 		Image306.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1602 :: 		Delay_Source_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1603 :: 		DrawImage(&Image306);
MOVW	R0, #lo_addr(_Image306+0)
MOVT	R0, #hi_addr(_Image306+0)
BL	_DrawImage+0
;Controller_events_code.c,1606 :: 		system_reg[SOURS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1607 :: 		if (system_reg[SOURS_DEL] <0) system_reg[SOURS_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_Source_DOWNOnPress259
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_DOWNOnPress259:
;Controller_events_code.c,1608 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1609 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1610 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1611 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1612 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_Source_DOWNOnPress260:
SUBS	R7, R7, #1
BNE	L_Delay_Source_DOWNOnPress260
NOP
NOP
NOP
;Controller_events_code.c,1613 :: 		}
L_end_Delay_Source_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_DOWNOnPress
_Delay_Source_UPOnUp:
;Controller_events_code.c,1614 :: 		void Delay_Source_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1615 :: 		Image312.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1616 :: 		Delay_Source_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1617 :: 		DrawImage(&Delay_Source_UP);
MOVW	R0, #lo_addr(_Delay_Source_UP+0)
MOVT	R0, #hi_addr(_Delay_Source_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1619 :: 		}
L_end_Delay_Source_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_UPOnUp
_Delay_Source_UPOnPress:
;Controller_events_code.c,1620 :: 		void Delay_Source_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1623 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1624 :: 		Image312.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1625 :: 		Delay_Source_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1626 :: 		DrawImage(&Image312);
MOVW	R0, #lo_addr(_Image312+0)
MOVT	R0, #hi_addr(_Image312+0)
BL	_DrawImage+0
;Controller_events_code.c,1627 :: 		system_reg[SOURS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1628 :: 		if (system_reg[SOURS_DEL] >99) system_reg[SOURS_DEL] = 99;
CMP	R0, #99
IT	LE
BLE	L_Delay_Source_UPOnPress262
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_UPOnPress262:
;Controller_events_code.c,1629 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1630 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1631 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1632 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1633 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_Source_UPOnPress263:
SUBS	R7, R7, #1
BNE	L_Delay_Source_UPOnPress263
NOP
NOP
NOP
;Controller_events_code.c,1634 :: 		}
L_end_Delay_Source_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_UPOnPress
_Delay_Source_SETOnUp:
;Controller_events_code.c,1635 :: 		void Delay_Source_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1636 :: 		Delay_Source_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1637 :: 		Image344.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1638 :: 		DrawImage (&Delay_Source_SET);
MOVW	R0, #lo_addr(_Delay_Source_SET+0)
MOVT	R0, #hi_addr(_Delay_Source_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1639 :: 		}
L_end_Delay_Source_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnUp
_Delay_Source_SETOnDown:
;Controller_events_code.c,1640 :: 		void Delay_Source_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1641 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1645 :: 		send_data_packet(SOURS_DEL,1);
MOVS	R1, #1
MOVW	R0, #30
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1646 :: 		Delay_Source_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1647 :: 		Image344.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1648 :: 		DrawImage (&Image344);
MOVW	R0, #lo_addr(_Image344+0)
MOVT	R0, #hi_addr(_Image344+0)
BL	_DrawImage+0
;Controller_events_code.c,1649 :: 		}
L_end_Delay_Source_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnDown
_Delay_heat_pump_DOWNOnUp:
;Controller_events_code.c,1651 :: 		void Delay_heat_pump_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1652 :: 		Image307.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1653 :: 		Delay_heat_pump_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1654 :: 		DrawImage(&Delay_heat_pump_DOWN);
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1656 :: 		}
L_end_Delay_heat_pump_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_DOWNOnUp
_Delay_heat_pump_DOWNOnPress:
;Controller_events_code.c,1657 :: 		void Delay_heat_pump_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1660 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1661 :: 		Image307.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1662 :: 		Delay_heat_pump_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1663 :: 		DrawImage(&Image307);
MOVW	R0, #lo_addr(_Image307+0)
MOVT	R0, #hi_addr(_Image307+0)
BL	_DrawImage+0
;Controller_events_code.c,1666 :: 		system_reg[HEAT_DEL]--;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1667 :: 		if (system_reg[HEAT_DEL] <0) system_reg[HEAT_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_heat_pump_DOWNOnPress265
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_DOWNOnPress265:
;Controller_events_code.c,1668 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1669 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1670 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1671 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1672 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_heat_pump_DOWNOnPress266:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_DOWNOnPress266
NOP
NOP
NOP
;Controller_events_code.c,1673 :: 		}
L_end_Delay_heat_pump_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_DOWNOnPress
_Delay_heat_pump_upOnUp:
;Controller_events_code.c,1674 :: 		void Delay_heat_pump_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1675 :: 		Image313.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1676 :: 		Delay_heat_pump_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1677 :: 		DrawImage(&Delay_heat_pump_up);
MOVW	R0, #lo_addr(_Delay_heat_pump_up+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1678 :: 		}
L_end_Delay_heat_pump_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_upOnUp
_Delay_heat_pump_upOnPress:
;Controller_events_code.c,1679 :: 		void Delay_heat_pump_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1682 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1683 :: 		Image313.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1684 :: 		Delay_heat_pump_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1685 :: 		DrawImage(&Image313);
MOVW	R0, #lo_addr(_Image313+0)
MOVT	R0, #hi_addr(_Image313+0)
BL	_DrawImage+0
;Controller_events_code.c,1688 :: 		system_reg[HEAT_DEL]++;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1689 :: 		if (system_reg[HEAT_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_heat_pump_upOnPress268
;Controller_events_code.c,1690 :: 		system_reg[HEAT_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_upOnPress268:
;Controller_events_code.c,1691 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1692 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1693 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1694 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1695 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_heat_pump_upOnPress269:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_upOnPress269
NOP
NOP
NOP
;Controller_events_code.c,1697 :: 		}
L_end_Delay_heat_pump_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_upOnPress
_Delay_heat_pump_SETOnUp:
;Controller_events_code.c,1698 :: 		void Delay_heat_pump_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1699 :: 		Delay_heat_pump_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1700 :: 		Image345.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1701 :: 		DrawImage (&Delay_heat_pump_SET);
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1702 :: 		}
L_end_Delay_heat_pump_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnUp
_Delay_heat_pump_SETOnDown:
;Controller_events_code.c,1703 :: 		void Delay_heat_pump_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1704 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1708 :: 		send_data_packet(HEAT_DEL,1);
MOVS	R1, #1
MOVW	R0, #20
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1709 :: 		Delay_heat_pump_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1710 :: 		Image345.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1711 :: 		DrawImage (&Image345);
MOVW	R0, #lo_addr(_Image345+0)
MOVT	R0, #hi_addr(_Image345+0)
BL	_DrawImage+0
;Controller_events_code.c,1712 :: 		}
L_end_Delay_heat_pump_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnDown
_Delay_reversing_DOWNOnUp:
;Controller_events_code.c,1714 :: 		void Delay_reversing_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1715 :: 		Image308.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1716 :: 		Delay_reversing_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1717 :: 		DrawImage(&Delay_reversing_DOWN);
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+0)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1718 :: 		}
L_end_Delay_reversing_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_DOWNOnUp
_Delay_reversing_DOWNOnPress:
;Controller_events_code.c,1719 :: 		void Delay_reversing_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1722 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1723 :: 		Image308.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1724 :: 		Delay_reversing_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1725 :: 		DrawImage(&Image308);
MOVW	R0, #lo_addr(_Image308+0)
MOVT	R0, #hi_addr(_Image308+0)
BL	_DrawImage+0
;Controller_events_code.c,1728 :: 		system_reg[REVERS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1729 :: 		if (system_reg[REVERS_DEL] <0)
CMP	R0, #0
IT	GE
BGE	L_Delay_reversing_DOWNOnPress271
;Controller_events_code.c,1730 :: 		system_reg[REVERS_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_DOWNOnPress271:
;Controller_events_code.c,1731 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1732 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1733 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1734 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1735 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_reversing_DOWNOnPress272:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_DOWNOnPress272
NOP
NOP
NOP
;Controller_events_code.c,1736 :: 		}
L_end_Delay_reversing_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_DOWNOnPress
_Delay_reversing_UPOnUp:
;Controller_events_code.c,1737 :: 		void Delay_reversing_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1738 :: 		Image314.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1739 :: 		Delay_reversing_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1740 :: 		DrawImage(&Delay_reversing_UP);
MOVW	R0, #lo_addr(_Delay_reversing_UP+0)
MOVT	R0, #hi_addr(_Delay_reversing_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1741 :: 		}
L_end_Delay_reversing_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_UPOnUp
_Delay_reversing_UPOnPress:
;Controller_events_code.c,1742 :: 		void Delay_reversing_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1745 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1746 :: 		Image314.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1747 :: 		Delay_reversing_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1748 :: 		DrawImage(&Image314);
MOVW	R0, #lo_addr(_Image314+0)
MOVT	R0, #hi_addr(_Image314+0)
BL	_DrawImage+0
;Controller_events_code.c,1751 :: 		system_reg[REVERS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1752 :: 		if (system_reg[REVERS_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_reversing_UPOnPress274
;Controller_events_code.c,1753 :: 		system_reg[REVERS_DEL] = 99 ;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_UPOnPress274:
;Controller_events_code.c,1754 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1755 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1756 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1757 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1758 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_reversing_UPOnPress275:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_UPOnPress275
NOP
NOP
NOP
;Controller_events_code.c,1759 :: 		}
L_end_Delay_reversing_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_UPOnPress
_Delay_reversing_SETOnUp:
;Controller_events_code.c,1760 :: 		void Delay_reversing_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1761 :: 		Delay_reversing_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1762 :: 		Image346.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1763 :: 		DrawImage (&Delay_reversing_SET);
MOVW	R0, #lo_addr(_Delay_reversing_SET+0)
MOVT	R0, #hi_addr(_Delay_reversing_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1764 :: 		}
L_end_Delay_reversing_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnUp
_Delay_reversing_SETOnDown:
;Controller_events_code.c,1765 :: 		void Delay_reversing_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1766 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1770 :: 		send_data_packet(REVERS_DEL,1);
MOVS	R1, #1
MOVW	R0, #40
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1771 :: 		Delay_reversing_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1772 :: 		Image346.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1773 :: 		DrawImage (&Image346);
MOVW	R0, #lo_addr(_Image346+0)
MOVT	R0, #hi_addr(_Image346+0)
BL	_DrawImage+0
;Controller_events_code.c,1774 :: 		}
L_end_Delay_reversing_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnDown
_Delay_trv_DOWNOnUp:
;Controller_events_code.c,1776 :: 		void Delay_trv_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1777 :: 		Image309.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1778 :: 		Delay_trv_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1779 :: 		DrawImage(&Delay_trv_DOWN);
MOVW	R0, #lo_addr(_Delay_trv_DOWN+0)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1780 :: 		}
L_end_Delay_trv_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_DOWNOnUp
_Delay_trv_DOWNOnPress:
;Controller_events_code.c,1781 :: 		void Delay_trv_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1784 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1785 :: 		Image309.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1786 :: 		Delay_trv_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1787 :: 		DrawImage(&Image309);
MOVW	R0, #lo_addr(_Image309+0)
MOVT	R0, #hi_addr(_Image309+0)
BL	_DrawImage+0
;Controller_events_code.c,1790 :: 		system_reg[TRV_DEL]--;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1791 :: 		if (system_reg[TRV_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_trv_DOWNOnPress277
;Controller_events_code.c,1792 :: 		system_reg[TRV_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_DOWNOnPress277:
;Controller_events_code.c,1793 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1794 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1795 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1796 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1797 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_trv_DOWNOnPress278:
SUBS	R7, R7, #1
BNE	L_Delay_trv_DOWNOnPress278
NOP
NOP
NOP
;Controller_events_code.c,1798 :: 		}
L_end_Delay_trv_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_DOWNOnPress
_Delay_trv_UPOnUp:
;Controller_events_code.c,1799 :: 		void Delay_trv_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1800 :: 		Image315.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1801 :: 		Delay_trv_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1802 :: 		DrawImage(&Delay_trv_up);
MOVW	R0, #lo_addr(_Delay_trv_up+0)
MOVT	R0, #hi_addr(_Delay_trv_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1803 :: 		}
L_end_Delay_trv_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_UPOnUp
_Delay_trv_UPOnPress:
;Controller_events_code.c,1804 :: 		void Delay_trv_UPOnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1807 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1808 :: 		Image315.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1809 :: 		Delay_trv_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1810 :: 		DrawImage(&Image315);
MOVW	R0, #lo_addr(_Image315+0)
MOVT	R0, #hi_addr(_Image315+0)
BL	_DrawImage+0
;Controller_events_code.c,1813 :: 		system_reg[TRV_DEL]++;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1814 :: 		if (system_reg[TRV_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_trv_UPOnPress280
;Controller_events_code.c,1815 :: 		system_reg[TRV_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_UPOnPress280:
;Controller_events_code.c,1816 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1817 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1818 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1819 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1820 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_trv_UPOnPress281:
SUBS	R7, R7, #1
BNE	L_Delay_trv_UPOnPress281
NOP
NOP
NOP
;Controller_events_code.c,1821 :: 		}
L_end_Delay_trv_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_UPOnPress
_Delay_EEV_SETOnUp:
;Controller_events_code.c,1822 :: 		void Delay_EEV_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1823 :: 		Delay_EEV_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1824 :: 		Image347.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1825 :: 		DrawImage (&Delay_EEV_SET);
MOVW	R0, #lo_addr(_Delay_EEV_SET+0)
MOVT	R0, #hi_addr(_Delay_EEV_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1826 :: 		}
L_end_Delay_EEV_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnUp
_Delay_EEV_SETOnDown:
;Controller_events_code.c,1827 :: 		void Delay_EEV_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1828 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1832 :: 		send_data_packet(TRV_DEL,1);
MOVS	R1, #1
MOVW	R0, #420
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1833 :: 		Delay_EEV_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1834 :: 		Image347.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1835 :: 		DrawImage (&Image347);
MOVW	R0, #lo_addr(_Image347+0)
MOVT	R0, #hi_addr(_Image347+0)
BL	_DrawImage+0
;Controller_events_code.c,1836 :: 		}
L_end_Delay_EEV_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnDown
_Delay_DHW_valve_DOWNOnUp:
;Controller_events_code.c,1838 :: 		void Delay_DHW_valve_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1839 :: 		Image310.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1840 :: 		Delay_DHW_valve_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1841 :: 		DrawImage(&Delay_DHW_valve_DOWN);
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1842 :: 		}
L_end_Delay_DHW_valve_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_DOWNOnUp
_Delay_DHW_valve_DOWNOnPress:
;Controller_events_code.c,1843 :: 		void Delay_DHW_valve_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1846 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1847 :: 		Image310.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1848 :: 		Delay_DHW_valve_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1849 :: 		DrawImage(&Image310);
MOVW	R0, #lo_addr(_Image310+0)
MOVT	R0, #hi_addr(_Image310+0)
BL	_DrawImage+0
;Controller_events_code.c,1852 :: 		system_reg[THREE_WAY_DEL]--;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1853 :: 		if (system_reg[THREE_WAY_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_DHW_valve_DOWNOnPress283
;Controller_events_code.c,1854 :: 		system_reg[THREE_WAY_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_DOWNOnPress283:
;Controller_events_code.c,1855 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1856 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1857 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1858 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1859 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_DHW_valve_DOWNOnPress284:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_DOWNOnPress284
NOP
NOP
NOP
;Controller_events_code.c,1860 :: 		}
L_end_Delay_DHW_valve_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_DOWNOnPress
_Delay_DHW_valve_UPOnUp:
;Controller_events_code.c,1861 :: 		void Delay_DHW_valve_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1862 :: 		Image316.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1863 :: 		Delay_DHW_valve_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1864 :: 		DrawImage(&Delay_DHW_valve_UP);
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1865 :: 		}
L_end_Delay_DHW_valve_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_UPOnUp
_Delay_DHW_valve_UPOnPress:
;Controller_events_code.c,1866 :: 		void Delay_DHW_valve_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1869 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1870 :: 		Image316.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1871 :: 		Delay_DHW_valve_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1872 :: 		DrawImage(&Image316);
MOVW	R0, #lo_addr(_Image316+0)
MOVT	R0, #hi_addr(_Image316+0)
BL	_DrawImage+0
;Controller_events_code.c,1875 :: 		system_reg[THREE_WAY_DEL]++;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1876 :: 		if (system_reg[THREE_WAY_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_DHW_valve_UPOnPress286
;Controller_events_code.c,1877 :: 		system_reg[THREE_WAY_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_UPOnPress286:
;Controller_events_code.c,1878 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1879 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1880 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1881 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1882 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_DHW_valve_UPOnPress287:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_UPOnPress287
NOP
NOP
NOP
;Controller_events_code.c,1883 :: 		}
L_end_Delay_DHW_valve_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_UPOnPress
_Delay_DHW_valve_SETOnUp:
;Controller_events_code.c,1884 :: 		void Delay_DHW_valve_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1885 :: 		Delay_DHW_valve_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1886 :: 		Image348.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1887 :: 		DrawImage (&Delay_DHW_valve_SET);
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1888 :: 		}
L_end_Delay_DHW_valve_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnUp
_Delay_DHW_valve_SETOnDown:
;Controller_events_code.c,1889 :: 		void Delay_DHW_valve_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1890 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1894 :: 		send_data_packet(THREE_WAY_DEL,1);
MOVS	R1, #1
MOVW	R0, #50
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1895 :: 		Delay_DHW_valve_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1896 :: 		Image348.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1897 :: 		DrawImage (&Image348);
MOVW	R0, #lo_addr(_Image348+0)
MOVT	R0, #hi_addr(_Image348+0)
BL	_DrawImage+0
;Controller_events_code.c,1898 :: 		}
L_end_Delay_DHW_valve_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnDown
_Delay_compressor_DOWNOnUp:
;Controller_events_code.c,1900 :: 		void Delay_compressor_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1901 :: 		Image311.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1902 :: 		Delay_compressor_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1903 :: 		DrawImage(&Delay_compressor_DOWN);
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+0)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1904 :: 		}
L_end_Delay_compressor_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_DOWNOnUp
_Delay_compressor_DOWNOnPress:
;Controller_events_code.c,1905 :: 		void Delay_compressor_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1908 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1909 :: 		Image311.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1910 :: 		Delay_compressor_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1911 :: 		DrawImage(&Image311);
MOVW	R0, #lo_addr(_Image311+0)
MOVT	R0, #hi_addr(_Image311+0)
BL	_DrawImage+0
;Controller_events_code.c,1914 :: 		system_reg[COMP_DEL]--;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1915 :: 		if (system_reg[COMP_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_compressor_DOWNOnPress289
;Controller_events_code.c,1916 :: 		system_reg[COMP_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_DOWNOnPress289:
;Controller_events_code.c,1917 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1918 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1919 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1920 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1921 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_compressor_DOWNOnPress290:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_DOWNOnPress290
NOP
NOP
NOP
;Controller_events_code.c,1922 :: 		}
L_end_Delay_compressor_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_DOWNOnPress
_Delay_compressor_UPOnUp:
;Controller_events_code.c,1923 :: 		void Delay_compressor_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1924 :: 		Image317.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1925 :: 		Delay_compressor_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1926 :: 		DrawImage(&Delay_compressor_UP);
MOVW	R0, #lo_addr(_Delay_compressor_UP+0)
MOVT	R0, #hi_addr(_Delay_compressor_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1927 :: 		}
L_end_Delay_compressor_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_UPOnUp
_Delay_compressor_UPOnPress:
;Controller_events_code.c,1928 :: 		void Delay_compressor_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1931 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1932 :: 		Image317.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1933 :: 		Delay_compressor_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1934 :: 		DrawImage(&Image317);
MOVW	R0, #lo_addr(_Image317+0)
MOVT	R0, #hi_addr(_Image317+0)
BL	_DrawImage+0
;Controller_events_code.c,1937 :: 		system_reg[COMP_DEL]++;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1938 :: 		if (system_reg[COMP_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_compressor_UPOnPress292
;Controller_events_code.c,1939 :: 		system_reg[COMP_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_UPOnPress292:
;Controller_events_code.c,1940 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1941 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1942 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1943 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1944 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_compressor_UPOnPress293:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_UPOnPress293
NOP
NOP
NOP
;Controller_events_code.c,1945 :: 		}
L_end_Delay_compressor_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_UPOnPress
_Delay_compressor_SETOnUp:
;Controller_events_code.c,1946 :: 		void Delay_compressor_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1947 :: 		Delay_compressor_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1948 :: 		Image349.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1949 :: 		DrawImage (&Delay_compressor_SET);
MOVW	R0, #lo_addr(_Delay_compressor_SET+0)
MOVT	R0, #hi_addr(_Delay_compressor_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1950 :: 		}
L_end_Delay_compressor_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnUp
_Delay_compressor_SETOnDown:
;Controller_events_code.c,1951 :: 		void Delay_compressor_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1952 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1956 :: 		send_data_packet(COMP_DEL,1);
MOVS	R1, #1
MOVW	R0, #10
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1957 :: 		Delay_compressor_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1958 :: 		Image349.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1959 :: 		DrawImage (&Image349);
MOVW	R0, #lo_addr(_Image349+0)
MOVT	R0, #hi_addr(_Image349+0)
BL	_DrawImage+0
;Controller_events_code.c,1960 :: 		}
L_end_Delay_compressor_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnDown
_Down_1_OnUp:
;Controller_events_code.c,1963 :: 		void Down_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1964 :: 		Image200.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1965 :: 		Down_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1966 :: 		DrawImage(&Down_1_);
MOVW	R0, #lo_addr(_Down_1_+0)
MOVT	R0, #hi_addr(_Down_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1967 :: 		}
L_end_Down_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_1_OnUp
_Down_1_OnPress:
;Controller_events_code.c,1968 :: 		void Down_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1970 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1971 :: 		Image200.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1972 :: 		Down_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1973 :: 		DrawImage(&Image200);
MOVW	R0, #lo_addr(_Image200+0)
MOVT	R0, #hi_addr(_Image200+0)
BL	_DrawImage+0
;Controller_events_code.c,1974 :: 		system_reg[HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1975 :: 		if (system_reg[HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_1_OnPress295
;Controller_events_code.c,1976 :: 		system_reg[HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Down_1_OnPress295:
;Controller_events_code.c,1977 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1978 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1979 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1980 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1981 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_1_OnPress296:
SUBS	R7, R7, #1
BNE	L_Down_1_OnPress296
NOP
NOP
NOP
;Controller_events_code.c,1982 :: 		}
L_end_Down_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_1_OnPress
_Up_1_OnUp:
;Controller_events_code.c,1983 :: 		void Up_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1984 :: 		Image218.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1985 :: 		Up_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1986 :: 		DrawImage(&Up_1_);
MOVW	R0, #lo_addr(_Up_1_+0)
MOVT	R0, #hi_addr(_Up_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1987 :: 		}
L_end_Up_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_1_OnUp
_Up_1_OnPress:
;Controller_events_code.c,1988 :: 		void Up_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1990 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1991 :: 		Image218.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1992 :: 		Up_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1993 :: 		DrawImage(&Image218);
MOVW	R0, #lo_addr(_Image218+0)
MOVT	R0, #hi_addr(_Image218+0)
BL	_DrawImage+0
;Controller_events_code.c,1994 :: 		system_reg[HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1995 :: 		if (system_reg[HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_1_OnPress298
;Controller_events_code.c,1996 :: 		system_reg[HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Up_1_OnPress298:
;Controller_events_code.c,1997 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1998 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1999 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2000 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2001 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_1_OnPress299:
SUBS	R7, R7, #1
BNE	L_Up_1_OnPress299
NOP
NOP
NOP
;Controller_events_code.c,2002 :: 		}
L_end_Up_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_1_OnPress
_Down_2_OnUp:
;Controller_events_code.c,2003 :: 		void Down_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2004 :: 		Image205.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2005 :: 		Down_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2006 :: 		DrawImage(&Down_2_);
MOVW	R0, #lo_addr(_Down_2_+0)
MOVT	R0, #hi_addr(_Down_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,2007 :: 		}
L_end_Down_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_2_OnUp
_Down_2_OnPress:
;Controller_events_code.c,2009 :: 		void Down_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2011 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2012 :: 		Image205.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2013 :: 		Down_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2014 :: 		DrawImage(&Image205);
MOVW	R0, #lo_addr(_Image205+0)
MOVT	R0, #hi_addr(_Image205+0)
BL	_DrawImage+0
;Controller_events_code.c,2016 :: 		system_reg[HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2017 :: 		if (system_reg[HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_2_OnPress301
;Controller_events_code.c,2018 :: 		system_reg[HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Down_2_OnPress301:
;Controller_events_code.c,2019 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2020 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2021 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2022 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2023 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_2_OnPress302:
SUBS	R7, R7, #1
BNE	L_Down_2_OnPress302
NOP
NOP
NOP
;Controller_events_code.c,2024 :: 		}
L_end_Down_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_2_OnPress
_Up_2_OnPress:
;Controller_events_code.c,2025 :: 		void Up_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2027 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2028 :: 		Image219.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2029 :: 		Up_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2030 :: 		DrawImage(&Image219);
MOVW	R0, #lo_addr(_Image219+0)
MOVT	R0, #hi_addr(_Image219+0)
BL	_DrawImage+0
;Controller_events_code.c,2032 :: 		system_reg[HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2033 :: 		if (system_reg[HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_2_OnPress304
;Controller_events_code.c,2034 :: 		system_reg[HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Up_2_OnPress304:
;Controller_events_code.c,2035 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2036 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2037 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2038 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2039 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_2_OnPress305:
SUBS	R7, R7, #1
BNE	L_Up_2_OnPress305
NOP
NOP
NOP
;Controller_events_code.c,2040 :: 		}
L_end_Up_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_2_OnPress
_Up_2_OnUp:
;Controller_events_code.c,2041 :: 		void Up_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2042 :: 		Image219.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2043 :: 		Up_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2044 :: 		DrawImage(&Up_2_);
MOVW	R0, #lo_addr(_Up_2_+0)
MOVT	R0, #hi_addr(_Up_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,2045 :: 		}
L_end_Up_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_2_OnUp
_Down_3_OnPress:
;Controller_events_code.c,2047 :: 		void Down_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2049 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2050 :: 		Image206.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2051 :: 		Down_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2052 :: 		DrawImage(&Image206);
MOVW	R0, #lo_addr(_Image206+0)
MOVT	R0, #hi_addr(_Image206+0)
BL	_DrawImage+0
;Controller_events_code.c,2054 :: 		system_reg[EXAUST_MAX]--;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2055 :: 		if (system_reg[EXAUST_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_3_OnPress307
;Controller_events_code.c,2056 :: 		system_reg[EXAUST_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Down_3_OnPress307:
;Controller_events_code.c,2057 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2058 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2059 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2060 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2061 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_3_OnPress308:
SUBS	R7, R7, #1
BNE	L_Down_3_OnPress308
NOP
NOP
NOP
;Controller_events_code.c,2062 :: 		}
L_end_Down_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_3_OnPress
_Down_3_OnUp:
;Controller_events_code.c,2063 :: 		void Down_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2064 :: 		Image206.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2065 :: 		Down_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2066 :: 		DrawImage(&Down_3_);
MOVW	R0, #lo_addr(_Down_3_+0)
MOVT	R0, #hi_addr(_Down_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,2067 :: 		}
L_end_Down_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_3_OnUp
_Up_3_OnPress:
;Controller_events_code.c,2068 :: 		void Up_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2070 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2071 :: 		Image220.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2072 :: 		Up_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2073 :: 		DrawImage(&Image220);
MOVW	R0, #lo_addr(_Image220+0)
MOVT	R0, #hi_addr(_Image220+0)
BL	_DrawImage+0
;Controller_events_code.c,2074 :: 		system_reg[EXAUST_MAX]++;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2075 :: 		if(system_reg[EXAUST_MAX]>115)
CMP	R0, #115
IT	LE
BLE	L_Up_3_OnPress310
;Controller_events_code.c,2076 :: 		system_reg[EXAUST_MAX] = 115;
MOVS	R1, #115
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Up_3_OnPress310:
;Controller_events_code.c,2077 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2078 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2079 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2080 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2081 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_3_OnPress311:
SUBS	R7, R7, #1
BNE	L_Up_3_OnPress311
NOP
NOP
NOP
;Controller_events_code.c,2082 :: 		}
L_end_Up_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_3_OnPress
_Up_3_OnUp:
;Controller_events_code.c,2083 :: 		void Up_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2084 :: 		Image220.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2085 :: 		Up_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2086 :: 		DrawImage(&Up_3_);
MOVW	R0, #lo_addr(_Up_3_+0)
MOVT	R0, #hi_addr(_Up_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,2087 :: 		}
L_end_Up_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_3_OnUp
_Down_4_OnPress:
;Controller_events_code.c,2088 :: 		void Down_4_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2090 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2091 :: 		Image207.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2092 :: 		Down_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2093 :: 		DrawImage(&Image207);
MOVW	R0, #lo_addr(_Image207+0)
MOVT	R0, #hi_addr(_Image207+0)
BL	_DrawImage+0
;Controller_events_code.c,2095 :: 		system_reg[SOURS_MIN]--;
MOVW	R2, #lo_addr(_system_reg+880)
MOVT	R2, #hi_addr(_system_reg+880)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,2096 :: 		if (system_reg[SOURS_MIN] < -30)
MVN	R0, #29
CMP	R1, R0
IT	GE
BGE	L_Down_4_OnPress313
;Controller_events_code.c,2097 :: 		system_reg[SOURS_MIN] = -30;
MOVW	R1, #65506
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Down_4_OnPress313:
;Controller_events_code.c,2098 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2099 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2100 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2101 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2102 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_4_OnPress314:
SUBS	R7, R7, #1
BNE	L_Down_4_OnPress314
NOP
NOP
NOP
;Controller_events_code.c,2103 :: 		}
L_end_Down_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_4_OnPress
_Up_4_OnPress:
;Controller_events_code.c,2104 :: 		void Up_4_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2106 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2107 :: 		Image221.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2108 :: 		Up_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2109 :: 		DrawImage(&Image221);
MOVW	R0, #lo_addr(_Image221+0)
MOVT	R0, #hi_addr(_Image221+0)
BL	_DrawImage+0
;Controller_events_code.c,2111 :: 		system_reg[SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+880)
MOVT	R1, #hi_addr(_system_reg+880)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2112 :: 		if (system_reg[SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_4_OnPress316
;Controller_events_code.c,2113 :: 		system_reg[SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Up_4_OnPress316:
;Controller_events_code.c,2114 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2115 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2116 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2117 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2118 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_4_OnPress317:
SUBS	R7, R7, #1
BNE	L_Up_4_OnPress317
NOP
NOP
NOP
;Controller_events_code.c,2120 :: 		}
L_end_Up_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_4_OnPress
_Down_4_OnUp:
;Controller_events_code.c,2121 :: 		void Down_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2122 :: 		Image207.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2123 :: 		Down_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2124 :: 		DrawImage(&Down_4_);
MOVW	R0, #lo_addr(_Down_4_+0)
MOVT	R0, #hi_addr(_Down_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,2125 :: 		}
L_end_Down_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_4_OnUp
_Up_4_OnUp:
;Controller_events_code.c,2126 :: 		void Up_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2127 :: 		Image221.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2128 :: 		Up_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2129 :: 		DrawImage(&Up_4_);
MOVW	R0, #lo_addr(_Up_4_+0)
MOVT	R0, #hi_addr(_Up_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,2130 :: 		}
L_end_Up_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_4_OnUp
_Down_5_OnUp:
;Controller_events_code.c,2131 :: 		void Down_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2132 :: 		Image208.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2133 :: 		Down_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2134 :: 		DrawImage(&Down_5_);
MOVW	R0, #lo_addr(_Down_5_+0)
MOVT	R0, #hi_addr(_Down_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2135 :: 		}
L_end_Down_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_5_OnUp
_Down_5_OnPress:
;Controller_events_code.c,2136 :: 		void Down_5_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2138 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2139 :: 		Image208.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2140 :: 		Down_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2141 :: 		DrawImage(&Image208);
MOVW	R0, #lo_addr(_Image208+0)
MOVT	R0, #hi_addr(_Image208+0)
BL	_DrawImage+0
;Controller_events_code.c,2142 :: 		system_reg[SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2143 :: 		if (system_reg[SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_5_OnPress319
;Controller_events_code.c,2144 :: 		system_reg[SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Down_5_OnPress319:
;Controller_events_code.c,2145 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2146 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2147 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2148 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2149 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_5_OnPress320:
SUBS	R7, R7, #1
BNE	L_Down_5_OnPress320
NOP
NOP
NOP
;Controller_events_code.c,2150 :: 		}
L_end_Down_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_5_OnPress
_Up_5_OnPress:
;Controller_events_code.c,2151 :: 		void Up_5_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2153 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2154 :: 		Image222.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2155 :: 		Up_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2156 :: 		DrawImage(&Image222);
MOVW	R0, #lo_addr(_Image222+0)
MOVT	R0, #hi_addr(_Image222+0)
BL	_DrawImage+0
;Controller_events_code.c,2157 :: 		system_reg[SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2158 :: 		if (system_reg[SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_5_OnPress322
;Controller_events_code.c,2159 :: 		system_reg[SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Up_5_OnPress322:
;Controller_events_code.c,2160 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2161 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2162 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2163 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2164 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_5_OnPress323:
SUBS	R7, R7, #1
BNE	L_Up_5_OnPress323
NOP
NOP
NOP
;Controller_events_code.c,2165 :: 		}
L_end_Up_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_5_OnPress
_Up_5_OnUp:
;Controller_events_code.c,2166 :: 		void Up_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2167 :: 		Image222.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2168 :: 		Up_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2169 :: 		DrawImage(&Up_5_);
MOVW	R0, #lo_addr(_Up_5_+0)
MOVT	R0, #hi_addr(_Up_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2170 :: 		}
L_end_Up_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_5_OnUp
_Down_6_OnPress:
;Controller_events_code.c,2171 :: 		void Down_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2173 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2174 :: 		Image209.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2175 :: 		Down_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2176 :: 		DrawImage(&Image209);
MOVW	R0, #lo_addr(_Image209+0)
MOVT	R0, #hi_addr(_Image209+0)
BL	_DrawImage+0
;Controller_events_code.c,2177 :: 		system_reg[DEL_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2178 :: 		if (system_reg[DEL_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_6_OnPress325
;Controller_events_code.c,2179 :: 		system_reg[DEL_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Down_6_OnPress325:
;Controller_events_code.c,2180 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2181 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2182 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2183 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2184 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_6_OnPress326:
SUBS	R7, R7, #1
BNE	L_Down_6_OnPress326
NOP
NOP
NOP
;Controller_events_code.c,2185 :: 		}
L_end_Down_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_6_OnPress
_Down_6_OnUp:
;Controller_events_code.c,2186 :: 		void Down_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2187 :: 		Image209.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2188 :: 		Down_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2189 :: 		DrawImage(&Down_6_);
MOVW	R0, #lo_addr(_Down_6_+0)
MOVT	R0, #hi_addr(_Down_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2190 :: 		}
L_end_Down_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_6_OnUp
_Up_6_OnPress:
;Controller_events_code.c,2191 :: 		void Up_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2193 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2194 :: 		Image223.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2195 :: 		Up_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2196 :: 		DrawImage(&Image223);
MOVW	R0, #lo_addr(_Image223+0)
MOVT	R0, #hi_addr(_Image223+0)
BL	_DrawImage+0
;Controller_events_code.c,2197 :: 		system_reg[DEL_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2198 :: 		if (system_reg[DEL_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_6_OnPress328
;Controller_events_code.c,2199 :: 		system_reg[DEL_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Up_6_OnPress328:
;Controller_events_code.c,2200 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2201 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2202 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2203 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2204 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_6_OnPress329:
SUBS	R7, R7, #1
BNE	L_Up_6_OnPress329
NOP
NOP
NOP
;Controller_events_code.c,2205 :: 		}
L_end_Up_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_6_OnPress
_Up_6_OnUp:
;Controller_events_code.c,2206 :: 		void Up_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2207 :: 		Image223.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2208 :: 		Up_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2209 :: 		DrawImage(&Up_6_);
MOVW	R0, #lo_addr(_Up_6_+0)
MOVT	R0, #hi_addr(_Up_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2210 :: 		}
L_end_Up_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_6_OnUp
_Set_1_OnDown:
;Controller_events_code.c,2211 :: 		void Set_1_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2212 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2216 :: 		send_data_packet(HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #90
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2217 :: 		Set_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2218 :: 		Image246.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2219 :: 		DrawImage (&Image246);
MOVW	R0, #lo_addr(_Image246+0)
MOVT	R0, #hi_addr(_Image246+0)
BL	_DrawImage+0
;Controller_events_code.c,2220 :: 		}
L_end_Set_1_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnDown
_Set_1_OnUp:
;Controller_events_code.c,2221 :: 		void Set_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2222 :: 		Set_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2223 :: 		Image246.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2224 :: 		DrawImage (&Set_1_);
MOVW	R0, #lo_addr(_Set_1_+0)
MOVT	R0, #hi_addr(_Set_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,2225 :: 		}
L_end_Set_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnUp
_Set_2_OnDown:
;Controller_events_code.c,2226 :: 		void Set_2_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2227 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2231 :: 		send_data_packet(HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #80
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2232 :: 		Set_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2233 :: 		Image247.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2234 :: 		DrawImage (&Image247);
MOVW	R0, #lo_addr(_Image247+0)
MOVT	R0, #hi_addr(_Image247+0)
BL	_DrawImage+0
;Controller_events_code.c,2235 :: 		}
L_end_Set_2_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnDown
_Set_2_OnUp:
;Controller_events_code.c,2236 :: 		void Set_2_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2237 :: 		Set_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2238 :: 		Image247.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2239 :: 		DrawImage (&Set_2_);
MOVW	R0, #lo_addr(_Set_2_+0)
MOVT	R0, #hi_addr(_Set_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,2240 :: 		}
L_end_Set_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnUp
_Set_3_OnDown:
;Controller_events_code.c,2242 :: 		void Set_3_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2243 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2247 :: 		send_data_packet(EXAUST_MAX,1);
MOVS	R1, #1
MOVW	R0, #180
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2248 :: 		Set_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2249 :: 		Image248.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2250 :: 		DrawImage (&Image248);
MOVW	R0, #lo_addr(_Image248+0)
MOVT	R0, #hi_addr(_Image248+0)
BL	_DrawImage+0
;Controller_events_code.c,2251 :: 		}
L_end_Set_3_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnDown
_Set_3_OnUp:
;Controller_events_code.c,2252 :: 		void Set_3_OnUp()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2253 :: 		Set_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2254 :: 		Image248.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2255 :: 		DrawImage (&Set_3_);
MOVW	R0, #lo_addr(_Set_3_+0)
MOVT	R0, #hi_addr(_Set_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,2256 :: 		}
L_end_Set_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnUp
_Set_4_OnDown:
;Controller_events_code.c,2257 :: 		void Set_4_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2258 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2262 :: 		send_data_packet(SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #440
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2263 :: 		Set_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2264 :: 		Image249.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2265 :: 		DrawImage (&Image249);
MOVW	R0, #lo_addr(_Image249+0)
MOVT	R0, #hi_addr(_Image249+0)
BL	_DrawImage+0
;Controller_events_code.c,2266 :: 		}
L_end_Set_4_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnDown
_Set_4_OnUp:
;Controller_events_code.c,2268 :: 		void Set_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2269 :: 		Set_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2270 :: 		Image249.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2271 :: 		DrawImage (&Set_4_);
MOVW	R0, #lo_addr(_Set_4_+0)
MOVT	R0, #hi_addr(_Set_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,2272 :: 		}
L_end_Set_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnUp
_Set_5_OnDown:
;Controller_events_code.c,2274 :: 		void Set_5_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2275 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2279 :: 		send_data_packet(SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #430
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2280 :: 		Set_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2281 :: 		Image250.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2282 :: 		DrawImage (&Image250);
MOVW	R0, #lo_addr(_Image250+0)
MOVT	R0, #hi_addr(_Image250+0)
BL	_DrawImage+0
;Controller_events_code.c,2283 :: 		}
L_end_Set_5_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnDown
_Set_5_OnUp:
;Controller_events_code.c,2284 :: 		void Set_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2285 :: 		Set_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2286 :: 		Image250.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2287 :: 		DrawImage (&Set_5_);
MOVW	R0, #lo_addr(_Set_5_+0)
MOVT	R0, #hi_addr(_Set_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2288 :: 		}
L_end_Set_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnUp
_Furnance_HP_OFF_save_ondown:
;Controller_events_code.c,2289 :: 		void Furnance_HP_OFF_save_ondown() {
;Controller_events_code.c,2291 :: 		}
L_end_Furnance_HP_OFF_save_ondown:
BX	LR
; end of _Furnance_HP_OFF_save_ondown
_Set_6_OnUp:
;Controller_events_code.c,2292 :: 		void Set_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2293 :: 		Set_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2294 :: 		Image251.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2295 :: 		DrawImage (&Set_6_);
MOVW	R0, #lo_addr(_Set_6_+0)
MOVT	R0, #hi_addr(_Set_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2296 :: 		}
L_end_Set_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnUp
_Set_6_OnDown:
;Controller_events_code.c,2297 :: 		void Set_6_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2298 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2302 :: 		send_data_packet(DEL_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #110
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2303 :: 		Set_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2304 :: 		Image251.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2305 :: 		DrawImage (&Image251);
MOVW	R0, #lo_addr(_Image251+0)
MOVT	R0, #hi_addr(_Image251+0)
BL	_DrawImage+0
;Controller_events_code.c,2306 :: 		}
L_end_Set_6_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnDown
_Down_7_OnUp:
;Controller_events_code.c,2308 :: 		void Down_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2309 :: 		Image210.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2310 :: 		Down_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2311 :: 		DrawImage(&Down_7_);
MOVW	R0, #lo_addr(_Down_7_+0)
MOVT	R0, #hi_addr(_Down_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2312 :: 		}
L_end_Down_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_7_OnUp
_Down_7_OnPress:
;Controller_events_code.c,2313 :: 		void Down_7_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2315 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2316 :: 		Image210.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2317 :: 		Down_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2318 :: 		DrawImage(&Image210);
MOVW	R0, #lo_addr(_Image210+0)
MOVT	R0, #hi_addr(_Image210+0)
BL	_DrawImage+0
;Controller_events_code.c,2319 :: 		system_reg[DEL_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2320 :: 		if (system_reg[DEL_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_7_OnPress331
;Controller_events_code.c,2321 :: 		system_reg[DEL_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Down_7_OnPress331:
;Controller_events_code.c,2322 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2323 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2324 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2325 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2326 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_7_OnPress332:
SUBS	R7, R7, #1
BNE	L_Down_7_OnPress332
NOP
NOP
NOP
;Controller_events_code.c,2327 :: 		}
L_end_Down_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_7_OnPress
_Up_7_OnPress:
;Controller_events_code.c,2329 :: 		void Up_7_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2331 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2332 :: 		Image224.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2333 :: 		Up_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2334 :: 		DrawImage(&Image224);
MOVW	R0, #lo_addr(_Image224+0)
MOVT	R0, #hi_addr(_Image224+0)
BL	_DrawImage+0
;Controller_events_code.c,2335 :: 		system_reg[DEL_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2336 :: 		if (system_reg[DEL_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_7_OnPress334
;Controller_events_code.c,2337 :: 		system_reg[DEL_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Up_7_OnPress334:
;Controller_events_code.c,2338 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2339 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2340 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2341 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2342 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_7_OnPress335:
SUBS	R7, R7, #1
BNE	L_Up_7_OnPress335
NOP
NOP
NOP
;Controller_events_code.c,2344 :: 		}
L_end_Up_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_7_OnPress
_Up_7_OnUp:
;Controller_events_code.c,2346 :: 		void Up_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2347 :: 		Image224.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2348 :: 		Up_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2349 :: 		DrawImage(&Up_7_);
MOVW	R0, #lo_addr(_Up_7_+0)
MOVT	R0, #hi_addr(_Up_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2351 :: 		}
L_end_Up_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_7_OnUp
_Down_8_OnPress:
;Controller_events_code.c,2353 :: 		void Down_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2355 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2356 :: 		Image211.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2357 :: 		Down_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2358 :: 		DrawImage(&Image211);
MOVW	R0, #lo_addr(_Image211+0)
MOVT	R0, #hi_addr(_Image211+0)
BL	_DrawImage+0
;Controller_events_code.c,2359 :: 		system_reg[DEL_DHW_MIN]--;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2360 :: 		if (system_reg[DEL_DHW_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_8_OnPress337
;Controller_events_code.c,2361 :: 		system_reg[DEL_DHW_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Down_8_OnPress337:
;Controller_events_code.c,2362 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2363 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2364 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2365 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2366 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_8_OnPress338:
SUBS	R7, R7, #1
BNE	L_Down_8_OnPress338
NOP
NOP
NOP
;Controller_events_code.c,2367 :: 		}
L_end_Down_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_8_OnPress
_Down_8_OnUp:
;Controller_events_code.c,2369 :: 		void Down_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2370 :: 		Image211.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2371 :: 		Down_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2372 :: 		DrawImage(&Down_8_);
MOVW	R0, #lo_addr(_Down_8_+0)
MOVT	R0, #hi_addr(_Down_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2373 :: 		}
L_end_Down_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_8_OnUp
_Up_8_OnPress:
;Controller_events_code.c,2375 :: 		void Up_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2377 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2378 :: 		Image225.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2379 :: 		Up_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2380 :: 		DrawImage(&Image225);
MOVW	R0, #lo_addr(_Image225+0)
MOVT	R0, #hi_addr(_Image225+0)
BL	_DrawImage+0
;Controller_events_code.c,2381 :: 		system_reg[DEL_DHW_MIN]++;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2382 :: 		if (system_reg[DEL_DHW_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_8_OnPress340
;Controller_events_code.c,2383 :: 		system_reg[DEL_DHW_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Up_8_OnPress340:
;Controller_events_code.c,2384 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2385 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2386 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2387 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2388 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_8_OnPress341:
SUBS	R7, R7, #1
BNE	L_Up_8_OnPress341
NOP
NOP
NOP
;Controller_events_code.c,2389 :: 		}
L_end_Up_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_8_OnPress
_Up_8_OnUp:
;Controller_events_code.c,2391 :: 		void Up_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2392 :: 		Image225.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2393 :: 		Up_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2394 :: 		DrawImage(&Up_8_);
MOVW	R0, #lo_addr(_Up_8_+0)
MOVT	R0, #hi_addr(_Up_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2395 :: 		}
L_end_Up_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_8_OnUp
_Down_9_OnPress:
;Controller_events_code.c,2397 :: 		void Down_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2399 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2400 :: 		Image214.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2401 :: 		Down_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2402 :: 		DrawImage(&Image214);
MOVW	R0, #lo_addr(_Image214+0)
MOVT	R0, #hi_addr(_Image214+0)
BL	_DrawImage+0
;Controller_events_code.c,2403 :: 		system_reg[DEL_DHW_MAX]--;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2404 :: 		if (system_reg[DEL_DHW_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_9_OnPress343
;Controller_events_code.c,2405 :: 		system_reg[DEL_DHW_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Down_9_OnPress343:
;Controller_events_code.c,2406 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2407 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2408 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2409 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2410 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_9_OnPress344:
SUBS	R7, R7, #1
BNE	L_Down_9_OnPress344
NOP
NOP
NOP
;Controller_events_code.c,2411 :: 		}
L_end_Down_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_9_OnPress
_Down_9_OnUp:
;Controller_events_code.c,2413 :: 		void Down_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2414 :: 		Image214.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2415 :: 		Down_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2416 :: 		DrawImage(&Down_9_);
MOVW	R0, #lo_addr(_Down_9_+0)
MOVT	R0, #hi_addr(_Down_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2417 :: 		}
L_end_Down_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_9_OnUp
_Up_9_OnPress:
;Controller_events_code.c,2419 :: 		void Up_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2421 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2422 :: 		Image228.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2423 :: 		Up_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2424 :: 		DrawImage(&Image228);
MOVW	R0, #lo_addr(_Image228+0)
MOVT	R0, #hi_addr(_Image228+0)
BL	_DrawImage+0
;Controller_events_code.c,2425 :: 		system_reg[DEL_DHW_MAX]++;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2426 :: 		if (system_reg[DEL_DHW_MAX] > 99)
CMP	R0, #99
IT	LE
BLE	L_Up_9_OnPress346
;Controller_events_code.c,2427 :: 		system_reg[DEL_DHW_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Up_9_OnPress346:
;Controller_events_code.c,2428 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2429 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2430 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2431 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2432 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_9_OnPress347:
SUBS	R7, R7, #1
BNE	L_Up_9_OnPress347
NOP
NOP
NOP
;Controller_events_code.c,2433 :: 		}
L_end_Up_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_9_OnPress
_Up_9_OnUp:
;Controller_events_code.c,2435 :: 		void Up_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2436 :: 		Image228.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2437 :: 		Up_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2438 :: 		DrawImage(&Up_9_);
MOVW	R0, #lo_addr(_Up_9_+0)
MOVT	R0, #hi_addr(_Up_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2439 :: 		}
L_end_Up_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_9_OnUp
_Down_10_OnPress:
;Controller_events_code.c,2440 :: 		void Down_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2442 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2443 :: 		Image212.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2444 :: 		Down_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2445 :: 		DrawImage(&Image212);
MOVW	R0, #lo_addr(_Image212+0)
MOVT	R0, #hi_addr(_Image212+0)
BL	_DrawImage+0
;Controller_events_code.c,2446 :: 		system_reg[DEL_SOURS_MIN]--;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2447 :: 		if (system_reg[DEL_SOURS_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_10_OnPress349
;Controller_events_code.c,2448 :: 		system_reg[DEL_SOURS_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Down_10_OnPress349:
;Controller_events_code.c,2449 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2450 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2451 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2452 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2453 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_10_OnPress350:
SUBS	R7, R7, #1
BNE	L_Down_10_OnPress350
NOP
NOP
NOP
;Controller_events_code.c,2454 :: 		}
L_end_Down_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_10_OnPress
_Down_10_OnUp:
;Controller_events_code.c,2456 :: 		void Down_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2457 :: 		Image212.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2458 :: 		Down_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2459 :: 		DrawImage(&Down_10_);
MOVW	R0, #lo_addr(_Down_10_+0)
MOVT	R0, #hi_addr(_Down_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2460 :: 		}
L_end_Down_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_10_OnUp
_Up_10_OnPress:
;Controller_events_code.c,2462 :: 		void Up_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2464 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2465 :: 		Image226.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2466 :: 		Up_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2467 :: 		DrawImage(&Image226);
MOVW	R0, #lo_addr(_Image226+0)
MOVT	R0, #hi_addr(_Image226+0)
BL	_DrawImage+0
;Controller_events_code.c,2468 :: 		system_reg[DEL_SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2469 :: 		if (system_reg[DEL_SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_10_OnPress352
;Controller_events_code.c,2470 :: 		system_reg[DEL_SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Up_10_OnPress352:
;Controller_events_code.c,2471 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2472 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2473 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2474 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2475 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_10_OnPress353:
SUBS	R7, R7, #1
BNE	L_Up_10_OnPress353
NOP
NOP
NOP
;Controller_events_code.c,2476 :: 		}
L_end_Up_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_10_OnPress
_Up_10_OnUp:
;Controller_events_code.c,2478 :: 		void Up_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2479 :: 		Image226.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2480 :: 		Up_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2481 :: 		DrawImage(&Up_10_);
MOVW	R0, #lo_addr(_Up_10_+0)
MOVT	R0, #hi_addr(_Up_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2482 :: 		}
L_end_Up_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_10_OnUp
_Down_11_OnPress:
;Controller_events_code.c,2483 :: 		void Down_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2485 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2486 :: 		Image213.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2487 :: 		Down_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2488 :: 		DrawImage(&Image213);
MOVW	R0, #lo_addr(_Image213+0)
MOVT	R0, #hi_addr(_Image213+0)
BL	_DrawImage+0
;Controller_events_code.c,2489 :: 		system_reg[DEL_SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2490 :: 		if (system_reg[DEL_SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_11_OnPress355
;Controller_events_code.c,2491 :: 		system_reg[DEL_SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Down_11_OnPress355:
;Controller_events_code.c,2492 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2493 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2494 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2495 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2496 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_11_OnPress356:
SUBS	R7, R7, #1
BNE	L_Down_11_OnPress356
NOP
NOP
NOP
;Controller_events_code.c,2497 :: 		}
L_end_Down_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_11_OnPress
_Down_11_OnUp:
;Controller_events_code.c,2499 :: 		void Down_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2500 :: 		Image213.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2501 :: 		Down_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2502 :: 		DrawImage(&Down_11_);
MOVW	R0, #lo_addr(_Down_11_+0)
MOVT	R0, #hi_addr(_Down_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2504 :: 		}
L_end_Down_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_11_OnUp
_Up_11_OnPress:
;Controller_events_code.c,2506 :: 		void Up_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2508 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2509 :: 		Image227.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2510 :: 		Up_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2511 :: 		DrawImage(&Image227);
MOVW	R0, #lo_addr(_Image227+0)
MOVT	R0, #hi_addr(_Image227+0)
BL	_DrawImage+0
;Controller_events_code.c,2512 :: 		system_reg[DEL_SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2513 :: 		if (system_reg[DEL_SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_11_OnPress358
;Controller_events_code.c,2514 :: 		system_reg[DEL_SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Up_11_OnPress358:
;Controller_events_code.c,2515 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2516 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2517 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2518 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2519 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_11_OnPress359:
SUBS	R7, R7, #1
BNE	L_Up_11_OnPress359
NOP
NOP
NOP
;Controller_events_code.c,2520 :: 		}
L_end_Up_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_11_OnPress
_Up_11_OnUp:
;Controller_events_code.c,2522 :: 		void Up_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2523 :: 		Image227.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2524 :: 		Up_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2525 :: 		DrawImage(&Up_11_);
MOVW	R0, #lo_addr(_Up_11_+0)
MOVT	R0, #hi_addr(_Up_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2526 :: 		}
L_end_Up_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_11_OnUp
_Down_12_OnPress:
;Controller_events_code.c,2531 :: 		void Down_12_OnPress() {
;Controller_events_code.c,2533 :: 		}
L_end_Down_12_OnPress:
BX	LR
; end of _Down_12_OnPress
_Down_12_OnUp:
;Controller_events_code.c,2535 :: 		void Down_12_OnUp() {
;Controller_events_code.c,2537 :: 		}
L_end_Down_12_OnUp:
BX	LR
; end of _Down_12_OnUp
_Up_12_OnPress:
;Controller_events_code.c,2539 :: 		void Up_12_OnPress() {
;Controller_events_code.c,2541 :: 		}
L_end_Up_12_OnPress:
BX	LR
; end of _Up_12_OnPress
_Up_12_OnUp:
;Controller_events_code.c,2543 :: 		void Up_12_OnUp() {
;Controller_events_code.c,2545 :: 		}
L_end_Up_12_OnUp:
BX	LR
; end of _Up_12_OnUp
_Set_7_OnUp:
;Controller_events_code.c,2546 :: 		void Set_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2547 :: 		Set_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2548 :: 		Image252.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2549 :: 		DrawImage (&Set_7_);
MOVW	R0, #lo_addr(_Set_7_+0)
MOVT	R0, #hi_addr(_Set_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2550 :: 		}
L_end_Set_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnUp
_Set_7_OnDown:
;Controller_events_code.c,2551 :: 		void Set_7_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2552 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2556 :: 		send_data_packet(DEL_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #100
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2557 :: 		Set_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2558 :: 		Image252.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2559 :: 		DrawImage (&Image252);
MOVW	R0, #lo_addr(_Image252+0)
MOVT	R0, #hi_addr(_Image252+0)
BL	_DrawImage+0
;Controller_events_code.c,2560 :: 		}
L_end_Set_7_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnDown
_Set_8_OnDown:
;Controller_events_code.c,2562 :: 		void Set_8_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2563 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2567 :: 		send_data_packet(DEL_DHW_MIN,1);
MOVS	R1, #1
MOVW	R0, #460
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2568 :: 		Set_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2569 :: 		Image253.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2570 :: 		DrawImage (&Image253);
MOVW	R0, #lo_addr(_Image253+0)
MOVT	R0, #hi_addr(_Image253+0)
BL	_DrawImage+0
;Controller_events_code.c,2571 :: 		}
L_end_Set_8_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnDown
_Set_8_OnUp:
;Controller_events_code.c,2573 :: 		void Set_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2574 :: 		Set_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2575 :: 		Image253.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2576 :: 		DrawImage (&Set_8_);
MOVW	R0, #lo_addr(_Set_8_+0)
MOVT	R0, #hi_addr(_Set_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2577 :: 		}
L_end_Set_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnUp
_Set_9_OnUp:
;Controller_events_code.c,2579 :: 		void Set_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2580 :: 		Set_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2581 :: 		Image256.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2582 :: 		DrawImage (&Set_9_);
MOVW	R0, #lo_addr(_Set_9_+0)
MOVT	R0, #hi_addr(_Set_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2583 :: 		}
L_end_Set_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnUp
_Set_9_OnDown:
;Controller_events_code.c,2584 :: 		void Set_9_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2585 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2589 :: 		send_data_packet(DEL_DHW_MAX,1);
MOVS	R1, #1
MOVW	R0, #450
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2590 :: 		Set_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2591 :: 		Image256.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2592 :: 		DrawImage (&Image256);
MOVW	R0, #lo_addr(_Image256+0)
MOVT	R0, #hi_addr(_Image256+0)
BL	_DrawImage+0
;Controller_events_code.c,2593 :: 		}
L_end_Set_9_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnDown
_Set_10_OnDown:
;Controller_events_code.c,2594 :: 		void Set_10_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2595 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2599 :: 		send_data_packet(DEL_SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #130
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2600 :: 		Set_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2601 :: 		Image254.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2602 :: 		DrawImage (&Image254);
MOVW	R0, #lo_addr(_Image254+0)
MOVT	R0, #hi_addr(_Image254+0)
BL	_DrawImage+0
;Controller_events_code.c,2603 :: 		}
L_end_Set_10_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnDown
_Set_10_OnUp:
;Controller_events_code.c,2605 :: 		void Set_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2606 :: 		Set_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2607 :: 		Image254.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2608 :: 		DrawImage (&Set_10_);
MOVW	R0, #lo_addr(_Set_10_+0)
MOVT	R0, #hi_addr(_Set_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2609 :: 		}
L_end_Set_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnUp
_Set_11_OnDown:
;Controller_events_code.c,2610 :: 		void Set_11_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2611 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2615 :: 		send_data_packet(DEL_SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #120
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2616 :: 		Set_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2617 :: 		Image255.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2618 :: 		DrawImage (&Image255);
MOVW	R0, #lo_addr(_Image255+0)
MOVT	R0, #hi_addr(_Image255+0)
BL	_DrawImage+0
;Controller_events_code.c,2619 :: 		}
L_end_Set_11_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnDown
_Set_11_OnUp:
;Controller_events_code.c,2620 :: 		void Set_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2621 :: 		Set_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2622 :: 		Image255.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2623 :: 		DrawImage (&Set_11_);
MOVW	R0, #lo_addr(_Set_11_+0)
MOVT	R0, #hi_addr(_Set_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2624 :: 		}
L_end_Set_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnUp
_Set_12_OnDown:
;Controller_events_code.c,2626 :: 		void Set_12_OnDown() {
;Controller_events_code.c,2628 :: 		}
L_end_Set_12_OnDown:
BX	LR
; end of _Set_12_OnDown
_Set_12_OnUp:
;Controller_events_code.c,2629 :: 		void Set_12_OnUp() {
;Controller_events_code.c,2631 :: 		}
L_end_Set_12_OnUp:
BX	LR
; end of _Set_12_OnUp
_Down_19_OnPress:
;Controller_events_code.c,2635 :: 		void Down_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2637 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2638 :: 		Image243.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2639 :: 		Down_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2640 :: 		DrawImage(&Image243);
MOVW	R0, #lo_addr(_Image243+0)
MOVT	R0, #hi_addr(_Image243+0)
BL	_DrawImage+0
;Controller_events_code.c,2641 :: 		system_reg[S_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2642 :: 		if (system_reg[S_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_19_OnPress361
;Controller_events_code.c,2643 :: 		system_reg[S_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Down_19_OnPress361:
;Controller_events_code.c,2644 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2645 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2646 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2647 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2648 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_19_OnPress362:
SUBS	R7, R7, #1
BNE	L_Down_19_OnPress362
NOP
NOP
NOP
;Controller_events_code.c,2649 :: 		}
L_end_Down_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_19_OnPress
_Down_19_OnUp:
;Controller_events_code.c,2650 :: 		void Down_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2651 :: 		Image243.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2652 :: 		Down_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2653 :: 		DrawImage(&Down_19_);
MOVW	R0, #lo_addr(_Down_19_+0)
MOVT	R0, #hi_addr(_Down_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2654 :: 		}
L_end_Down_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_19_OnUp
_Up_19_OnPress:
;Controller_events_code.c,2655 :: 		void Up_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2657 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2658 :: 		Image236.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2659 :: 		Up_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2660 :: 		DrawImage(&Image236);
MOVW	R0, #lo_addr(_Image236+0)
MOVT	R0, #hi_addr(_Image236+0)
BL	_DrawImage+0
;Controller_events_code.c,2661 :: 		system_reg[S_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2662 :: 		if (system_reg[S_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_19_OnPress364
;Controller_events_code.c,2663 :: 		system_reg[S_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Up_19_OnPress364:
;Controller_events_code.c,2664 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2665 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2666 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2667 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2668 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_19_OnPress365:
SUBS	R7, R7, #1
BNE	L_Up_19_OnPress365
NOP
NOP
NOP
;Controller_events_code.c,2669 :: 		}
L_end_Up_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_19_OnPress
_Up_19_OnUp:
;Controller_events_code.c,2670 :: 		void Up_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2671 :: 		Image236.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2672 :: 		Up_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2673 :: 		DrawImage(&Up_19_);
MOVW	R0, #lo_addr(_Up_19_+0)
MOVT	R0, #hi_addr(_Up_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2674 :: 		}
L_end_Up_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_19_OnUp
_Down_20_OnPress:
;Controller_events_code.c,2675 :: 		void Down_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2677 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2678 :: 		Image244.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2679 :: 		Down_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2680 :: 		DrawImage(&Image244);
MOVW	R0, #lo_addr(_Image244+0)
MOVT	R0, #hi_addr(_Image244+0)
BL	_DrawImage+0
;Controller_events_code.c,2681 :: 		system_reg[S_COOL_MIN]--;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2682 :: 		if (system_reg[S_COOL_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_20_OnPress367
;Controller_events_code.c,2683 :: 		system_reg[S_COOL_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Down_20_OnPress367:
;Controller_events_code.c,2684 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2685 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2686 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2687 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2688 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_20_OnPress368:
SUBS	R7, R7, #1
BNE	L_Down_20_OnPress368
NOP
NOP
NOP
;Controller_events_code.c,2689 :: 		}
L_end_Down_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_20_OnPress
_Down_20_OnUp:
;Controller_events_code.c,2690 :: 		void Down_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2691 :: 		Image244.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2692 :: 		Down_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2693 :: 		DrawImage(&Down_20_);
MOVW	R0, #lo_addr(_Down_20_+0)
MOVT	R0, #hi_addr(_Down_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2694 :: 		}
L_end_Down_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_20_OnUp
_Up_20_OnPress:
;Controller_events_code.c,2695 :: 		void Up_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2697 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2698 :: 		Image237.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2699 :: 		Up_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2700 :: 		DrawImage(&Image237);
MOVW	R0, #lo_addr(_Image237+0)
MOVT	R0, #hi_addr(_Image237+0)
BL	_DrawImage+0
;Controller_events_code.c,2701 :: 		system_reg[S_COOL_MIN]++;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2702 :: 		if (system_reg[S_COOL_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_20_OnPress370
;Controller_events_code.c,2703 :: 		system_reg[S_COOL_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Up_20_OnPress370:
;Controller_events_code.c,2704 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2705 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2706 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2707 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2708 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_20_OnPress371:
SUBS	R7, R7, #1
BNE	L_Up_20_OnPress371
NOP
NOP
NOP
;Controller_events_code.c,2709 :: 		}
L_end_Up_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_20_OnPress
_Up_20_OnUp:
;Controller_events_code.c,2710 :: 		void Up_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2711 :: 		Image237.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2712 :: 		Up_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2713 :: 		DrawImage(&Up_20_);
MOVW	R0, #lo_addr(_Up_20_+0)
MOVT	R0, #hi_addr(_Up_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2714 :: 		}
L_end_Up_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_20_OnUp
_Down_21_OnPress:
;Controller_events_code.c,2715 :: 		void Down_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2717 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2718 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2719 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2720 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2721 :: 		system_reg[S_COOL_MAX]--;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2722 :: 		if (system_reg[S_COOL_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_21_OnPress373
;Controller_events_code.c,2723 :: 		system_reg[S_COOL_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Down_21_OnPress373:
;Controller_events_code.c,2724 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2725 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2726 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2727 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2728 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_21_OnPress374:
SUBS	R7, R7, #1
BNE	L_Down_21_OnPress374
NOP
NOP
NOP
;Controller_events_code.c,2729 :: 		}
L_end_Down_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_21_OnPress
_Down_21_OnUp:
;Controller_events_code.c,2730 :: 		void Down_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2731 :: 		Image245.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image245+20)
MOVT	R0, #hi_addr(_Image245+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2732 :: 		Down_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_21_+20)
MOVT	R0, #hi_addr(_Down_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2733 :: 		DrawImage(&Down_21_);
MOVW	R0, #lo_addr(_Down_21_+0)
MOVT	R0, #hi_addr(_Down_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2734 :: 		}
L_end_Down_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_21_OnUp
_Up_21_OnPress:
;Controller_events_code.c,2735 :: 		void Up_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2737 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2738 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2739 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2740 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2741 :: 		system_reg[S_COOL_MAX]++;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2742 :: 		if (system_reg[S_COOL_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_21_OnPress376
;Controller_events_code.c,2743 :: 		system_reg[S_COOL_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Up_21_OnPress376:
;Controller_events_code.c,2744 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2745 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2746 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2747 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2748 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_21_OnPress377:
SUBS	R7, R7, #1
BNE	L_Up_21_OnPress377
NOP
NOP
NOP
;Controller_events_code.c,2749 :: 		}
L_end_Up_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_21_OnPress
_Up_21_OnUp:
;Controller_events_code.c,2750 :: 		void Up_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2751 :: 		Image238.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2752 :: 		Up_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2753 :: 		DrawImage(&Up_21_);
MOVW	R0, #lo_addr(_Up_21_+0)
MOVT	R0, #hi_addr(_Up_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2754 :: 		}
L_end_Up_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_21_OnUp
_Down_22_OnPress:
;Controller_events_code.c,2756 :: 		void Down_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2758 :: 		Image24.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2759 :: 		Down_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2760 :: 		DrawImage(&Image24);
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
BL	_DrawImage+0
;Controller_events_code.c,2761 :: 		system_reg[HP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2762 :: 		if (system_reg[HP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_22_OnPress379
;Controller_events_code.c,2763 :: 		system_reg[HP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Down_22_OnPress379:
;Controller_events_code.c,2764 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2765 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2766 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2767 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2768 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_22_OnPress380:
SUBS	R7, R7, #1
BNE	L_Down_22_OnPress380
NOP
NOP
NOP
;Controller_events_code.c,2769 :: 		}
L_end_Down_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_22_OnPress
_Down_22_OnUp:
;Controller_events_code.c,2770 :: 		void Down_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2771 :: 		Image24.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2772 :: 		Down_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2773 :: 		DrawImage(&Down_22_);
MOVW	R0, #lo_addr(_Down_22_+0)
MOVT	R0, #hi_addr(_Down_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2775 :: 		}
L_end_Down_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_22_OnUp
_Up_22_OnPress:
;Controller_events_code.c,2776 :: 		void Up_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2778 :: 		Image53.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2779 :: 		Up_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2780 :: 		DrawImage(&Image53);
MOVW	R0, #lo_addr(_Image53+0)
MOVT	R0, #hi_addr(_Image53+0)
BL	_DrawImage+0
;Controller_events_code.c,2781 :: 		system_reg[HP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2782 :: 		if (system_reg[HP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_22_OnPress382
;Controller_events_code.c,2783 :: 		system_reg[HP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Up_22_OnPress382:
;Controller_events_code.c,2784 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2785 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2786 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2787 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2788 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_22_OnPress383:
SUBS	R7, R7, #1
BNE	L_Up_22_OnPress383
NOP
NOP
NOP
;Controller_events_code.c,2789 :: 		}
L_end_Up_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_22_OnPress
_Up_22_OnUp:
;Controller_events_code.c,2790 :: 		void Up_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2791 :: 		Image53.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2792 :: 		Up_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2793 :: 		DrawImage(&Up_22_);
MOVW	R0, #lo_addr(_Up_22_+0)
MOVT	R0, #hi_addr(_Up_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2794 :: 		}
L_end_Up_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_22_OnUp
_Down_23_OnPress:
;Controller_events_code.c,2795 :: 		void Down_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2797 :: 		Image86.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2798 :: 		Down_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2799 :: 		DrawImage(&Image86);
MOVW	R0, #lo_addr(_Image86+0)
MOVT	R0, #hi_addr(_Image86+0)
BL	_DrawImage+0
;Controller_events_code.c,2800 :: 		system_reg[HP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2801 :: 		if (system_reg[HP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_23_OnPress385
;Controller_events_code.c,2802 :: 		system_reg[HP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Down_23_OnPress385:
;Controller_events_code.c,2803 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2804 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2805 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2806 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2807 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_23_OnPress386:
SUBS	R7, R7, #1
BNE	L_Down_23_OnPress386
NOP
NOP
NOP
;Controller_events_code.c,2808 :: 		}
L_end_Down_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_23_OnPress
_Down_23_OnUp:
;Controller_events_code.c,2809 :: 		void Down_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2810 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2811 :: 		Down_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2812 :: 		DrawImage(&Down_23_);
MOVW	R0, #lo_addr(_Down_23_+0)
MOVT	R0, #hi_addr(_Down_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2814 :: 		}
L_end_Down_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_23_OnUp
_Up_23_OnPress:
;Controller_events_code.c,2815 :: 		void Up_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2817 :: 		Image95.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image95+20)
MOVT	R0, #hi_addr(_Image95+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2818 :: 		Up_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2819 :: 		DrawImage(&Image95);
MOVW	R0, #lo_addr(_Image95+0)
MOVT	R0, #hi_addr(_Image95+0)
BL	_DrawImage+0
;Controller_events_code.c,2820 :: 		system_reg[HP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2821 :: 		if (system_reg[HP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_23_OnPress388
;Controller_events_code.c,2822 :: 		system_reg[HP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Up_23_OnPress388:
;Controller_events_code.c,2823 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2824 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2825 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2826 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2827 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_23_OnPress389:
SUBS	R7, R7, #1
BNE	L_Up_23_OnPress389
NOP
NOP
NOP
;Controller_events_code.c,2828 :: 		}
L_end_Up_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_23_OnPress
_Up_23_OnUp:
;Controller_events_code.c,2829 :: 		void Up_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2830 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2831 :: 		Up_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2832 :: 		DrawImage(&Up_23_);
MOVW	R0, #lo_addr(_Up_23_+0)
MOVT	R0, #hi_addr(_Up_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2833 :: 		}
L_end_Up_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_23_OnUp
_Set_19_OnUp:
;Controller_events_code.c,2835 :: 		void Set_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2836 :: 		Set_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2837 :: 		Image264.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2838 :: 		DrawImage (&Set_19_);
MOVW	R0, #lo_addr(_Set_19_+0)
MOVT	R0, #hi_addr(_Set_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2839 :: 		}
L_end_Set_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnUp
_Set_19_OnDown:
;Controller_events_code.c,2840 :: 		void void Set_19_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2841 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2845 :: 		send_data_packet(S_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #280
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2846 :: 		Set_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2847 :: 		Image264.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2848 :: 		DrawImage (&Image264);
MOVW	R0, #lo_addr(_Image264+0)
MOVT	R0, #hi_addr(_Image264+0)
BL	_DrawImage+0
;Controller_events_code.c,2849 :: 		}
L_end_Set_19_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnDown
_Set_20_OnDown:
;Controller_events_code.c,2850 :: 		void Set_20_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2851 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2855 :: 		send_data_packet(S_COOL_MIN,1);
MOVS	R1, #1
MOVW	R0, #270
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2856 :: 		Set_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2857 :: 		Image265.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2858 :: 		DrawImage (&Image265);
MOVW	R0, #lo_addr(_Image265+0)
MOVT	R0, #hi_addr(_Image265+0)
BL	_DrawImage+0
;Controller_events_code.c,2859 :: 		}
L_end_Set_20_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnDown
_Set_20_OnUp:
;Controller_events_code.c,2860 :: 		void Set_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2861 :: 		Set_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2862 :: 		Image265.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2863 :: 		DrawImage (&Set_20_);
MOVW	R0, #lo_addr(_Set_20_+0)
MOVT	R0, #hi_addr(_Set_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2864 :: 		}
L_end_Set_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnUp
_Set_21_OnDown:
;Controller_events_code.c,2865 :: 		void Set_21_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2866 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2870 :: 		send_data_packet(S_COOL_MAX,1);
MOVS	R1, #1
MOVW	R0, #260
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2871 :: 		Set_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2872 :: 		Image266.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2873 :: 		DrawImage (&Image266);
MOVW	R0, #lo_addr(_Image266+0)
MOVT	R0, #hi_addr(_Image266+0)
BL	_DrawImage+0
;Controller_events_code.c,2874 :: 		}
L_end_Set_21_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnDown
_Set_21_OnUp:
;Controller_events_code.c,2875 :: 		void Set_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2876 :: 		Set_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2877 :: 		Image266.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2878 :: 		DrawImage (&Set_21_);
MOVW	R0, #lo_addr(_Set_21_+0)
MOVT	R0, #hi_addr(_Set_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2879 :: 		}
L_end_Set_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnUp
_Set_22_OnDown:
;Controller_events_code.c,2880 :: 		void Set_22_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2881 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2885 :: 		send_data_packet(HP_MAX,1);
MOVS	R1, #1
MOVW	R0, #220
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2886 :: 		Set_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2887 :: 		Image34.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2888 :: 		DrawImage (&Image34);
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
BL	_DrawImage+0
;Controller_events_code.c,2889 :: 		}
L_end_Set_22_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnDown
_Set_22_OnUp:
;Controller_events_code.c,2891 :: 		void Set_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2892 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2893 :: 		Set_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2894 :: 		Image34.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2895 :: 		DrawImage (&Set_22_);
MOVW	R0, #lo_addr(_Set_22_+0)
MOVT	R0, #hi_addr(_Set_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2896 :: 		}
L_end_Set_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnUp
_Set_23_OnDown:
;Controller_events_code.c,2897 :: 		void Set_23_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2898 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2902 :: 		send_data_packet(HP_MIN,1);
MOVS	R1, #1
MOVW	R0, #240
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2903 :: 		Set_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2904 :: 		Image33.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2905 :: 		DrawImage (&Image33);
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
BL	_DrawImage+0
;Controller_events_code.c,2906 :: 		}
L_end_Set_23_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnDown
_Set_23_OnUp:
;Controller_events_code.c,2907 :: 		void Set_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2908 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2909 :: 		Set_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2910 :: 		Image33.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2911 :: 		DrawImage (&Set_23_);
MOVW	R0, #lo_addr(_Set_23_+0)
MOVT	R0, #hi_addr(_Set_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2912 :: 		}
L_end_Set_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnUp
_One_CompressorsOnClick:
;Controller_events_code.c,2915 :: 		void One_CompressorsOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2916 :: 		num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2917 :: 		if ((unsigned long)One_Compressors.Picture_Name == Compressor1_jpg)
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
LDR	R1, [R0, #0]
MOVW	R0, #35596
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_One_CompressorsOnClick391
;Controller_events_code.c,2919 :: 		One_Compressors.Picture_Name = Compressor2_jpg;
MOVW	R1, #29584
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2920 :: 		Two_Compressors.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Two_Compressors+20)
MOVT	R0, #hi_addr(_Two_Compressors+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2921 :: 		DrawImage(&Two_Compressors);
MOVW	R0, #lo_addr(_Two_Compressors+0)
MOVT	R0, #hi_addr(_Two_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2922 :: 		system_reg[NOMB_COMPRESSORS]=2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2923 :: 		two_compressors_mode=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2924 :: 		}
IT	AL
BAL	L_One_CompressorsOnClick392
L_One_CompressorsOnClick391:
;Controller_events_code.c,2926 :: 		One_Compressors.Picture_Name = Compressor1_jpg;
MOVW	R1, #35596
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2927 :: 		One_Compressors.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_One_Compressors+20)
MOVT	R0, #hi_addr(_One_Compressors+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2928 :: 		DrawImage(&One_Compressors);
MOVW	R0, #lo_addr(_One_Compressors+0)
MOVT	R0, #hi_addr(_One_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2929 :: 		system_reg[NOMB_COMPRESSORS]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2930 :: 		two_compressors_mode=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2931 :: 		}
L_One_CompressorsOnClick392:
;Controller_events_code.c,2932 :: 		send_data_packet(NOMB_COMPRESSORS,1);
MOVS	R1, #1
MOVW	R0, #400
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2935 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_One_CompressorsOnClick393:
SUBS	R7, R7, #1
BNE	L_One_CompressorsOnClick393
NOP
NOP
NOP
;Controller_events_code.c,2936 :: 		}
L_end_One_CompressorsOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _One_CompressorsOnClick
_Reversing_ON_HEATOnClick:
;Controller_events_code.c,2938 :: 		void Reversing_ON_HEATOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2939 :: 		if ((unsigned long)Reversing_ON_HEAT.Picture_Name == but_ON_jpg)
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
LDR	R1, [R0, #0]
MOVW	R0, #38602
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_Reversing_ON_HEATOnClick395
;Controller_events_code.c,2941 :: 		Reversing_ON_HEAT.Picture_Name = but_OFF_jpg;
MOVW	R1, #32590
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2942 :: 		Reversing_Heat_OFF.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+20)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2943 :: 		DrawImage(&Reversing_Heat_OFF);
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+0)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,2944 :: 		system_reg[REVERS_MOD]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2946 :: 		}
IT	AL
BAL	L_Reversing_ON_HEATOnClick396
L_Reversing_ON_HEATOnClick395:
;Controller_events_code.c,2948 :: 		Reversing_ON_HEAT.Picture_Name = but_ON_jpg;
MOVW	R1, #38602
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2949 :: 		Reversing_ON_HEAT.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+20)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2950 :: 		DrawImage(&Reversing_ON_HEAT);
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+0)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+0)
BL	_DrawImage+0
;Controller_events_code.c,2951 :: 		system_reg[REVERS_MOD]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2952 :: 		}
L_Reversing_ON_HEATOnClick396:
;Controller_events_code.c,2953 :: 		send_data_packet(REVERS_MOD,1);
MOVS	R1, #1
MOVW	R0, #410
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2954 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_Reversing_ON_HEATOnClick397:
SUBS	R7, R7, #1
BNE	L_Reversing_ON_HEATOnClick397
NOP
NOP
NOP
;Controller_events_code.c,2955 :: 		}
L_end_Reversing_ON_HEATOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Reversing_ON_HEATOnClick
_Flow_Source__Sensor_ONOnClick:
;Controller_events_code.c,2956 :: 		void Flow_Source__Sensor_ONOnClick(){
;Controller_events_code.c,2958 :: 		}
L_end_Flow_Source__Sensor_ONOnClick:
BX	LR
; end of _Flow_Source__Sensor_ONOnClick
_Flow_Source__Heat1_ONOnClick:
;Controller_events_code.c,2959 :: 		void Flow_Source__Heat1_ONOnClick() {
;Controller_events_code.c,2961 :: 		}
L_end_Flow_Source__Heat1_ONOnClick:
BX	LR
; end of _Flow_Source__Heat1_ONOnClick
_Flow_Source__Heat2_ONOnClick:
;Controller_events_code.c,2962 :: 		void Flow_Source__Heat2_ONOnClick() {
;Controller_events_code.c,2964 :: 		}
L_end_Flow_Source__Heat2_ONOnClick:
BX	LR
; end of _Flow_Source__Heat2_ONOnClick
_Power_380VOnClick:
;Controller_events_code.c,2965 :: 		void Power_380VOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2966 :: 		if ((unsigned long)Power_380V.Picture_Name == but_380_on_jpg)
MOVW	R0, #lo_addr(_Power_380V+16)
MOVT	R0, #hi_addr(_Power_380V+16)
LDR	R1, [R0, #0]
MOVW	R0, #41608
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_Power_380VOnClick399
;Controller_events_code.c,2968 :: 		Power_380V.Picture_Name = but_220_on_jpg;
MOVW	R1, #26778
MOVT	R1, #50
MOVW	R0, #lo_addr(_Power_380V+16)
MOVT	R0, #hi_addr(_Power_380V+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2969 :: 		Power_220V.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_220V+20)
MOVT	R0, #hi_addr(_Power_220V+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2970 :: 		DrawImage(&Power_220V);
MOVW	R0, #lo_addr(_Power_220V+0)
MOVT	R0, #hi_addr(_Power_220V+0)
BL	_DrawImage+0
;Controller_events_code.c,2971 :: 		system_reg[POWER_380]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+940)
MOVT	R0, #hi_addr(_system_reg+940)
STRH	R1, [R0, #0]
;Controller_events_code.c,2973 :: 		}
IT	AL
BAL	L_Power_380VOnClick400
L_Power_380VOnClick399:
;Controller_events_code.c,2975 :: 		Power_380V.Picture_Name = but_380_on_jpg;
MOVW	R1, #41608
MOVT	R1, #50
MOVW	R0, #lo_addr(_Power_380V+16)
MOVT	R0, #hi_addr(_Power_380V+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2976 :: 		Power_380V.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_380V+20)
MOVT	R0, #hi_addr(_Power_380V+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2977 :: 		DrawImage(&Power_380V);
MOVW	R0, #lo_addr(_Power_380V+0)
MOVT	R0, #hi_addr(_Power_380V+0)
BL	_DrawImage+0
;Controller_events_code.c,2978 :: 		system_reg[POWER_380]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+940)
MOVT	R0, #hi_addr(_system_reg+940)
STRH	R1, [R0, #0]
;Controller_events_code.c,2979 :: 		}
L_Power_380VOnClick400:
;Controller_events_code.c,2980 :: 		send_data_packet(POWER_380,1);
MOVS	R1, #1
MOVW	R0, #470
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2981 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_Power_380VOnClick401:
SUBS	R7, R7, #1
BNE	L_Power_380VOnClick401
NOP
NOP
NOP
;Controller_events_code.c,2985 :: 		}
L_end_Power_380VOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Power_380VOnClick
_furnance_Mode_onOnClick:
;Controller_events_code.c,2988 :: 		void furnance_Mode_onOnClick() {
;Controller_events_code.c,2990 :: 		}
L_end_furnance_Mode_onOnClick:
BX	LR
; end of _furnance_Mode_onOnClick
_Furnance_start_temp_DownOnUp:
;Controller_events_code.c,2992 :: 		void Furnance_start_temp_DownOnUp() {
;Controller_events_code.c,2994 :: 		}
L_end_Furnance_start_temp_DownOnUp:
BX	LR
; end of _Furnance_start_temp_DownOnUp
_Furnance_start_temp_DownOnPress:
;Controller_events_code.c,2995 :: 		void Furnance_start_temp_DownOnPress() {
;Controller_events_code.c,2997 :: 		}
L_end_Furnance_start_temp_DownOnPress:
BX	LR
; end of _Furnance_start_temp_DownOnPress
_Furnance_HP_OFF_DowmOnUp:
;Controller_events_code.c,2998 :: 		void Furnance_HP_OFF_DowmOnUp() {
;Controller_events_code.c,3000 :: 		}
L_end_Furnance_HP_OFF_DowmOnUp:
BX	LR
; end of _Furnance_HP_OFF_DowmOnUp
_Furnance_HP_OFF_DowmOnPress:
;Controller_events_code.c,3001 :: 		void Furnance_HP_OFF_DowmOnPress() {
;Controller_events_code.c,3003 :: 		}
L_end_Furnance_HP_OFF_DowmOnPress:
BX	LR
; end of _Furnance_HP_OFF_DowmOnPress
_Furnance_HP_OFF_UPOnUp:
;Controller_events_code.c,3004 :: 		void Furnance_HP_OFF_UPOnUp() {
;Controller_events_code.c,3006 :: 		}
L_end_Furnance_HP_OFF_UPOnUp:
BX	LR
; end of _Furnance_HP_OFF_UPOnUp
_Furnance_HP_OFF_UPOnPress:
;Controller_events_code.c,3007 :: 		void Furnance_HP_OFF_UPOnPress() {
;Controller_events_code.c,3009 :: 		}
L_end_Furnance_HP_OFF_UPOnPress:
BX	LR
; end of _Furnance_HP_OFF_UPOnPress
_Furnance_off_downOnUp:
;Controller_events_code.c,3011 :: 		void Furnance_off_downOnUp() {
;Controller_events_code.c,3013 :: 		}
L_end_Furnance_off_downOnUp:
BX	LR
; end of _Furnance_off_downOnUp
_Furnance_off_downOnPress:
;Controller_events_code.c,3014 :: 		void Furnance_off_downOnPress() {
;Controller_events_code.c,3016 :: 		}
L_end_Furnance_off_downOnPress:
BX	LR
; end of _Furnance_off_downOnPress
_Furnance_off_upOnUp:
;Controller_events_code.c,3017 :: 		void Furnance_off_upOnUp() {
;Controller_events_code.c,3019 :: 		}
L_end_Furnance_off_upOnUp:
BX	LR
; end of _Furnance_off_upOnUp
_Furnance_off_upOnPress:
;Controller_events_code.c,3020 :: 		void Furnance_off_upOnPress() {
;Controller_events_code.c,3022 :: 		}
L_end_Furnance_off_upOnPress:
BX	LR
; end of _Furnance_off_upOnPress
_Furnance_off_save_onup:
;Controller_events_code.c,3023 :: 		void Furnance_off_save_onup() {
;Controller_events_code.c,3025 :: 		}
L_end_Furnance_off_save_onup:
BX	LR
; end of _Furnance_off_save_onup
_Furnance_off_save_ondown:
;Controller_events_code.c,3026 :: 		void Furnance_off_save_ondown() {
;Controller_events_code.c,3028 :: 		}
L_end_Furnance_off_save_ondown:
BX	LR
; end of _Furnance_off_save_ondown
_Furnance_time_downOnUp:
;Controller_events_code.c,3029 :: 		void Furnance_time_downOnUp() {
;Controller_events_code.c,3031 :: 		}
L_end_Furnance_time_downOnUp:
BX	LR
; end of _Furnance_time_downOnUp
_Furnance_time_downOnPress:
;Controller_events_code.c,3032 :: 		void Furnance_time_downOnPress() {
;Controller_events_code.c,3034 :: 		}
L_end_Furnance_time_downOnPress:
BX	LR
; end of _Furnance_time_downOnPress
_Furnance_time_upOnUp:
;Controller_events_code.c,3035 :: 		void Furnance_time_upOnUp() {
;Controller_events_code.c,3037 :: 		}
L_end_Furnance_time_upOnUp:
BX	LR
; end of _Furnance_time_upOnUp
_Furnance_time_upOnPress:
;Controller_events_code.c,3038 :: 		void Furnance_time_upOnPress() {
;Controller_events_code.c,3040 :: 		}
L_end_Furnance_time_upOnPress:
BX	LR
; end of _Furnance_time_upOnPress
_furnance_time_OFFOnClick:
;Controller_events_code.c,3041 :: 		void furnance_time_OFFOnClick() {
;Controller_events_code.c,3043 :: 		}
L_end_furnance_time_OFFOnClick:
BX	LR
; end of _furnance_time_OFFOnClick
_Furnance_HP_OFF_save_onup:
;Controller_events_code.c,3044 :: 		void Furnance_HP_OFF_save_onup(){
;Controller_events_code.c,3045 :: 		}
L_end_Furnance_HP_OFF_save_onup:
BX	LR
; end of _Furnance_HP_OFF_save_onup
_Furnance_start_temp_UPOnUp:
;Controller_events_code.c,3046 :: 		void Furnance_start_temp_UPOnUp(){
;Controller_events_code.c,3047 :: 		}
L_end_Furnance_start_temp_UPOnUp:
BX	LR
; end of _Furnance_start_temp_UPOnUp
_Furnance_start_temp_UPOnPress:
;Controller_events_code.c,3048 :: 		void Furnance_start_temp_UPOnPress(){
;Controller_events_code.c,3049 :: 		}
L_end_Furnance_start_temp_UPOnPress:
BX	LR
; end of _Furnance_start_temp_UPOnPress
_SetIPAddressOnClick:
;Controller_events_code.c,3052 :: 		void SetIPAddressOnClick() {
;Controller_events_code.c,3054 :: 		}
L_end_SetIPAddressOnClick:
BX	LR
; end of _SetIPAddressOnClick
_SetMaskOnClick:
;Controller_events_code.c,3056 :: 		void SetMaskOnClick() {
;Controller_events_code.c,3058 :: 		}
L_end_SetMaskOnClick:
BX	LR
; end of _SetMaskOnClick
_SetDNSOnClick:
;Controller_events_code.c,3060 :: 		void SetDNSOnClick() {
;Controller_events_code.c,3062 :: 		}
L_end_SetDNSOnClick:
BX	LR
; end of _SetDNSOnClick
_LAN_Key_1OnClick:
;Controller_events_code.c,3064 :: 		void LAN_Key_1OnClick() {
;Controller_events_code.c,3066 :: 		}
L_end_LAN_Key_1OnClick:
BX	LR
; end of _LAN_Key_1OnClick
_LAN_Key_2OnClick:
;Controller_events_code.c,3068 :: 		void LAN_Key_2OnClick() {
;Controller_events_code.c,3070 :: 		}
L_end_LAN_Key_2OnClick:
BX	LR
; end of _LAN_Key_2OnClick
_LAN_Key_3OnClick:
;Controller_events_code.c,3072 :: 		void LAN_Key_3OnClick() {
;Controller_events_code.c,3074 :: 		}
L_end_LAN_Key_3OnClick:
BX	LR
; end of _LAN_Key_3OnClick
_LAN_Key_4OnClick:
;Controller_events_code.c,3076 :: 		void LAN_Key_4OnClick() {
;Controller_events_code.c,3078 :: 		}
L_end_LAN_Key_4OnClick:
BX	LR
; end of _LAN_Key_4OnClick
_LAN_Key_5OnClick:
;Controller_events_code.c,3080 :: 		void LAN_Key_5OnClick() {
;Controller_events_code.c,3082 :: 		}
L_end_LAN_Key_5OnClick:
BX	LR
; end of _LAN_Key_5OnClick
_LAN_Key_6OnClick:
;Controller_events_code.c,3084 :: 		void LAN_Key_6OnClick() {
;Controller_events_code.c,3086 :: 		}
L_end_LAN_Key_6OnClick:
BX	LR
; end of _LAN_Key_6OnClick
_LAN_Key_7OnClick:
;Controller_events_code.c,3088 :: 		void LAN_Key_7OnClick() {
;Controller_events_code.c,3090 :: 		}
L_end_LAN_Key_7OnClick:
BX	LR
; end of _LAN_Key_7OnClick
_LAN_Key_8OnClick:
;Controller_events_code.c,3092 :: 		void LAN_Key_8OnClick() {
;Controller_events_code.c,3094 :: 		}
L_end_LAN_Key_8OnClick:
BX	LR
; end of _LAN_Key_8OnClick
_LAN_Key_9OnClick:
;Controller_events_code.c,3096 :: 		void LAN_Key_9OnClick() {
;Controller_events_code.c,3098 :: 		}
L_end_LAN_Key_9OnClick:
BX	LR
; end of _LAN_Key_9OnClick
_LAN_Key_0OnClick:
;Controller_events_code.c,3100 :: 		void LAN_Key_0OnClick() {
;Controller_events_code.c,3102 :: 		}
L_end_LAN_Key_0OnClick:
BX	LR
; end of _LAN_Key_0OnClick
_LAN_Key_DotOnClick:
;Controller_events_code.c,3104 :: 		void LAN_Key_DotOnClick() {
;Controller_events_code.c,3106 :: 		}
L_end_LAN_Key_DotOnClick:
BX	LR
; end of _LAN_Key_DotOnClick
_LAN_Key_ClearOnClick:
;Controller_events_code.c,3108 :: 		void LAN_Key_ClearOnClick() {
;Controller_events_code.c,3110 :: 		}
L_end_LAN_Key_ClearOnClick:
BX	LR
; end of _LAN_Key_ClearOnClick
_LANSetOnClick:
;Controller_events_code.c,3112 :: 		void LANSetOnClick() {
;Controller_events_code.c,3114 :: 		}
L_end_LANSetOnClick:
BX	LR
; end of _LANSetOnClick
_SetGateWayOnClick:
;Controller_events_code.c,3115 :: 		void SetGateWayOnClick(){
;Controller_events_code.c,3116 :: 		}
L_end_SetGateWayOnClick:
BX	LR
; end of _SetGateWayOnClick
_Hyst_Heat_downOnUp:
;Controller_events_code.c,3118 :: 		void Hyst_Heat_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3119 :: 		Hyst_Heat_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3120 :: 		Image114.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3121 :: 		DrawImage(&Hyst_Heat_down);
MOVW	R0, #lo_addr(_Hyst_Heat_down+0)
MOVT	R0, #hi_addr(_Hyst_Heat_down+0)
BL	_DrawImage+0
;Controller_events_code.c,3122 :: 		}
L_end_Hyst_Heat_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_downOnUp
_Hyst_Heat_downOnPress:
;Controller_events_code.c,3123 :: 		void Hyst_Heat_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3125 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3126 :: 		Hyst_Heat_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3127 :: 		Image114.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3128 :: 		DrawImage(&Image114);
MOVW	R0, #lo_addr(_Image114+0)
MOVT	R0, #hi_addr(_Image114+0)
BL	_DrawImage+0
;Controller_events_code.c,3129 :: 		system_reg[DIFF_HEAT]--;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3130 :: 		if (system_reg[DIFF_HEAT] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Heat_downOnPress403
;Controller_events_code.c,3131 :: 		system_reg[DIFF_HEAT] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_downOnPress403:
;Controller_events_code.c,3132 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3133 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3134 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3135 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3136 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Heat_downOnPress404:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_downOnPress404
NOP
NOP
NOP
;Controller_events_code.c,3137 :: 		}
L_end_Hyst_Heat_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_downOnPress
_Hyst_Heat_upOnUp:
;Controller_events_code.c,3138 :: 		void Hyst_Heat_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3139 :: 		Hyst_Heat_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3140 :: 		Image121.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3141 :: 		DrawImage(&Hyst_Heat_up);
MOVW	R0, #lo_addr(_Hyst_Heat_up+0)
MOVT	R0, #hi_addr(_Hyst_Heat_up+0)
BL	_DrawImage+0
;Controller_events_code.c,3142 :: 		}
L_end_Hyst_Heat_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_upOnUp
_Hyst_Heat_upOnPress:
;Controller_events_code.c,3143 :: 		void Hyst_Heat_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3145 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3146 :: 		Hyst_Heat_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3147 :: 		Image121.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3148 :: 		DrawImage(&Image121);
MOVW	R0, #lo_addr(_Image121+0)
MOVT	R0, #hi_addr(_Image121+0)
BL	_DrawImage+0
;Controller_events_code.c,3149 :: 		system_reg[DIFF_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3150 :: 		if (system_reg[DIFF_HEAT] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Heat_upOnPress406
;Controller_events_code.c,3151 :: 		system_reg[DIFF_HEAT] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_upOnPress406:
;Controller_events_code.c,3152 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3153 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3154 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3155 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3156 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Heat_upOnPress407:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_upOnPress407
NOP
NOP
NOP
;Controller_events_code.c,3157 :: 		}
L_end_Hyst_Heat_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_upOnPress
_Hyst_Cool_downOnUp:
;Controller_events_code.c,3158 :: 		void Hyst_Cool_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3159 :: 		Hyst_Cool_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3160 :: 		Image115.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3161 :: 		DrawImage(&Hyst_Cool_down);
MOVW	R0, #lo_addr(_Hyst_Cool_down+0)
MOVT	R0, #hi_addr(_Hyst_Cool_down+0)
BL	_DrawImage+0
;Controller_events_code.c,3162 :: 		}
L_end_Hyst_Cool_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_downOnUp
_Hyst_Cool_downOnPress:
;Controller_events_code.c,3163 :: 		void Hyst_Cool_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3165 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3166 :: 		Hyst_Cool_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3167 :: 		Image115.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3168 :: 		DrawImage(&Image115);
MOVW	R0, #lo_addr(_Image115+0)
MOVT	R0, #hi_addr(_Image115+0)
BL	_DrawImage+0
;Controller_events_code.c,3169 :: 		system_reg[DIFF_COOL]--;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3170 :: 		if (system_reg[DIFF_COOL] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Cool_downOnPress409
;Controller_events_code.c,3171 :: 		system_reg[DIFF_COOL] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_downOnPress409:
;Controller_events_code.c,3172 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3173 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3174 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3175 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3176 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Cool_downOnPress410:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_downOnPress410
NOP
NOP
NOP
;Controller_events_code.c,3177 :: 		}
L_end_Hyst_Cool_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_downOnPress
_Hyst_Cool_upOnUp:
;Controller_events_code.c,3178 :: 		void Hyst_Cool_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3179 :: 		Hyst_Cool_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3180 :: 		Image122.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3181 :: 		DrawImage(&Hyst_Cool_up);
MOVW	R0, #lo_addr(_Hyst_Cool_up+0)
MOVT	R0, #hi_addr(_Hyst_Cool_up+0)
BL	_DrawImage+0
;Controller_events_code.c,3183 :: 		}
L_end_Hyst_Cool_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_upOnUp
_Hyst_Cool_upOnPress:
;Controller_events_code.c,3184 :: 		void Hyst_Cool_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3186 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3187 :: 		Hyst_Cool_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3188 :: 		Image122.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3189 :: 		DrawImage(&Image122);
MOVW	R0, #lo_addr(_Image122+0)
MOVT	R0, #hi_addr(_Image122+0)
BL	_DrawImage+0
;Controller_events_code.c,3190 :: 		system_reg[DIFF_COOL]++;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3191 :: 		if (system_reg[DIFF_COOL] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Cool_upOnPress412
;Controller_events_code.c,3192 :: 		system_reg[DIFF_COOL] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_upOnPress412:
;Controller_events_code.c,3193 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3194 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3195 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3196 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3197 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Cool_upOnPress413:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_upOnPress413
NOP
NOP
NOP
;Controller_events_code.c,3198 :: 		}
L_end_Hyst_Cool_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_upOnPress
_Hyst_DHW_downOnUp:
;Controller_events_code.c,3199 :: 		void Hyst_DHW_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3200 :: 		Hyst_DHW_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3201 :: 		Image116.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3202 :: 		DrawImage(&Hyst_DHW_down);
MOVW	R0, #lo_addr(_Hyst_DHW_down+0)
MOVT	R0, #hi_addr(_Hyst_DHW_down+0)
BL	_DrawImage+0
;Controller_events_code.c,3203 :: 		}
L_end_Hyst_DHW_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_downOnUp
_Hyst_DHW_downOnPress:
;Controller_events_code.c,3204 :: 		void Hyst_DHW_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3206 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3207 :: 		Hyst_DHW_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3208 :: 		Image116.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3209 :: 		DrawImage(&Image116);
MOVW	R0, #lo_addr(_Image116+0)
MOVT	R0, #hi_addr(_Image116+0)
BL	_DrawImage+0
;Controller_events_code.c,3210 :: 		system_reg[DIFF_DHW]--;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3211 :: 		if (system_reg[DIFF_DHW] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_DHW_downOnPress415
;Controller_events_code.c,3212 :: 		system_reg[DIFF_DHW] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_downOnPress415:
;Controller_events_code.c,3213 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3214 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3215 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3216 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3217 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_DHW_downOnPress416:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_downOnPress416
NOP
NOP
NOP
;Controller_events_code.c,3218 :: 		}
L_end_Hyst_DHW_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_downOnPress
_Hyst_DHW_upOnUp:
;Controller_events_code.c,3219 :: 		void Hyst_DHW_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3220 :: 		Hyst_DHW_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3221 :: 		Image123.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3222 :: 		DrawImage(&Hyst_DHW_up);
MOVW	R0, #lo_addr(_Hyst_DHW_up+0)
MOVT	R0, #hi_addr(_Hyst_DHW_up+0)
BL	_DrawImage+0
;Controller_events_code.c,3223 :: 		}
L_end_Hyst_DHW_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_upOnUp
_Hyst_DHW_upOnPress:
;Controller_events_code.c,3224 :: 		void Hyst_DHW_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3226 :: 		Hyst_DHW_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3227 :: 		Image123.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3228 :: 		DrawImage(&Image123);
MOVW	R0, #lo_addr(_Image123+0)
MOVT	R0, #hi_addr(_Image123+0)
BL	_DrawImage+0
;Controller_events_code.c,3229 :: 		system_reg[DIFF_DHW]++;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3230 :: 		if (system_reg[DIFF_DHW] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_DHW_upOnPress418
;Controller_events_code.c,3231 :: 		system_reg[DIFF_DHW] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_upOnPress418:
;Controller_events_code.c,3232 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3233 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3234 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3235 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3236 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_DHW_upOnPress419:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_upOnPress419
NOP
NOP
NOP
;Controller_events_code.c,3237 :: 		}
L_end_Hyst_DHW_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_upOnPress
_Set_heat_onup:
;Controller_events_code.c,3238 :: 		void Set_heat_onup(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3239 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3240 :: 		Image135.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3241 :: 		Image128.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3242 :: 		DrawImage (&Image135);
MOVW	R0, #lo_addr(_Image135+0)
MOVT	R0, #hi_addr(_Image135+0)
BL	_DrawImage+0
;Controller_events_code.c,3243 :: 		}
L_end_Set_heat_onup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_onup
_Set_heat_OnDown:
;Controller_events_code.c,3244 :: 		void Set_heat_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3245 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3249 :: 		send_data_packet (DIFF_HEAT,1);
MOVS	R1, #1
MOVW	R0, #160
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3250 :: 		Image135.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3251 :: 		Image128.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3252 :: 		DrawImage (&Image128);
MOVW	R0, #lo_addr(_Image128+0)
MOVT	R0, #hi_addr(_Image128+0)
BL	_DrawImage+0
;Controller_events_code.c,3253 :: 		}
L_end_Set_heat_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_OnDown
_Set_cool_OnUp:
;Controller_events_code.c,3254 :: 		void Set_cool_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3255 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3256 :: 		Image138.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3257 :: 		Image129.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3258 :: 		DrawImage (&Image138);
MOVW	R0, #lo_addr(_Image138+0)
MOVT	R0, #hi_addr(_Image138+0)
BL	_DrawImage+0
;Controller_events_code.c,3259 :: 		}
L_end_Set_cool_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnUp
_Set_cool_OnDown:
;Controller_events_code.c,3260 :: 		void Set_cool_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3261 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3265 :: 		send_data_packet (DIFF_COOL,1);
MOVS	R1, #1
MOVW	R0, #140
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3266 :: 		Image138.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3267 :: 		Image129.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3268 :: 		DrawImage (&Image129);
MOVW	R0, #lo_addr(_Image129+0)
MOVT	R0, #hi_addr(_Image129+0)
BL	_DrawImage+0
;Controller_events_code.c,3269 :: 		}
L_end_Set_cool_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnDown
_Set_dhw_OnUp:
;Controller_events_code.c,3270 :: 		void Set_dhw_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3271 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3272 :: 		Set_DHW_HY.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3273 :: 		Image130.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3274 :: 		DrawImage (&Set_DHW_HY);
MOVW	R0, #lo_addr(_Set_DHW_HY+0)
MOVT	R0, #hi_addr(_Set_DHW_HY+0)
BL	_DrawImage+0
;Controller_events_code.c,3275 :: 		}
L_end_Set_dhw_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnUp
_Set_dhw_OnDown:
;Controller_events_code.c,3276 :: 		void Set_dhw_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3277 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3281 :: 		send_data_packet (DIFF_DHW,1);
MOVS	R1, #1
MOVW	R0, #150
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3282 :: 		Set_DHW_HY.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3283 :: 		Image130.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3284 :: 		DrawImage (&Image130);
MOVW	R0, #lo_addr(_Image130+0)
MOVT	R0, #hi_addr(_Image130+0)
BL	_DrawImage+0
;Controller_events_code.c,3285 :: 		}
L_end_Set_dhw_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnDown
_DEC_EEV2OnPress:
;Controller_events_code.c,3288 :: 		void DEC_EEV2OnPress() {
;Controller_events_code.c,3290 :: 		}
L_end_DEC_EEV2OnPress:
BX	LR
; end of _DEC_EEV2OnPress
_INC_EEV2OnPress:
;Controller_events_code.c,3291 :: 		void INC_EEV2OnPress() {
;Controller_events_code.c,3293 :: 		}
L_end_INC_EEV2OnPress:
BX	LR
; end of _INC_EEV2OnPress
_EEV2DownOnUp:
;Controller_events_code.c,3294 :: 		void EEV2DownOnUp() {
;Controller_events_code.c,3296 :: 		}
L_end_EEV2DownOnUp:
BX	LR
; end of _EEV2DownOnUp
_EEV2DownOnDown:
;Controller_events_code.c,3298 :: 		void EEV2DownOnDown() {
;Controller_events_code.c,3300 :: 		}
L_end_EEV2DownOnDown:
BX	LR
; end of _EEV2DownOnDown
_EEV2UpOnUp:
;Controller_events_code.c,3301 :: 		void EEV2UpOnUp() {
;Controller_events_code.c,3303 :: 		}
L_end_EEV2UpOnUp:
BX	LR
; end of _EEV2UpOnUp
_EEV2UpOnDown:
;Controller_events_code.c,3304 :: 		void EEV2UpOnDown() {
;Controller_events_code.c,3306 :: 		}
L_end_EEV2UpOnDown:
BX	LR
; end of _EEV2UpOnDown
_EEV2_AutoOnClick:
;Controller_events_code.c,3307 :: 		void EEV2_AutoOnClick() {
;Controller_events_code.c,3309 :: 		}
L_end_EEV2_AutoOnClick:
BX	LR
; end of _EEV2_AutoOnClick
_Mode_ground_onOnClick:
;Controller_events_code.c,3311 :: 		void  Mode_ground_onOnClick () {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3312 :: 		if ((unsigned long)Mode_ground_on.Picture_Name == mode_brine_jpg)
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
LDR	R1, [R0, #0]
MOVW	R0, #5350
MOVT	R0, #66
CMP	R1, R0
IT	NE
BNE	L_Mode_ground_onOnClick421
;Controller_events_code.c,3314 :: 		Mode_ground_on.Picture_Name = mode_air_jpg;
MOVW	R1, #63200
MOVT	R1, #65
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3315 :: 		Mode_air_on.Visible= 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Mode_air_on+20)
MOVT	R0, #hi_addr(_Mode_air_on+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3316 :: 		DrawImage(&Mode_air_on);
MOVW	R0, #lo_addr(_Mode_air_on+0)
MOVT	R0, #hi_addr(_Mode_air_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3317 :: 		system_reg[AIRE_TO_WATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3318 :: 		ground_heat_pump=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3319 :: 		}
IT	AL
BAL	L_Mode_ground_onOnClick422
L_Mode_ground_onOnClick421:
;Controller_events_code.c,3321 :: 		Mode_ground_on.Picture_Name = mode_brine_jpg;
MOVW	R1, #5350
MOVT	R1, #66
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3322 :: 		Mode_ground_on.Visible= 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Mode_ground_on+20)
MOVT	R0, #hi_addr(_Mode_ground_on+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3323 :: 		DrawImage(&Mode_ground_on);
MOVW	R0, #lo_addr(_Mode_ground_on+0)
MOVT	R0, #hi_addr(_Mode_ground_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3324 :: 		system_reg[AIRE_TO_WATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3325 :: 		ground_heat_pump=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3326 :: 		}
L_Mode_ground_onOnClick422:
;Controller_events_code.c,3327 :: 		send_data_packet(AIRE_TO_WATER,1);
MOVS	R1, #1
MOVW	R0, #170
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3328 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_Mode_ground_onOnClick423:
SUBS	R7, R7, #1
BNE	L_Mode_ground_onOnClick423
NOP
NOP
NOP
;Controller_events_code.c,3329 :: 		}
L_end_Mode_ground_onOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Mode_ground_onOnClick
_Down_24_OnPress:
;Controller_events_code.c,3336 :: 		void Down_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3338 :: 		Image99.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3339 :: 		Image17.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3340 :: 		DrawImage(&Image99);
MOVW	R0, #lo_addr(_Image99+0)
MOVT	R0, #hi_addr(_Image99+0)
BL	_DrawImage+0
;Controller_events_code.c,3341 :: 		system_reg[LP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3342 :: 		if (system_reg[LP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_24_OnPress425
;Controller_events_code.c,3343 :: 		system_reg[LP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Down_24_OnPress425:
;Controller_events_code.c,3344 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3345 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3346 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3347 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3348 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_24_OnPress426:
SUBS	R7, R7, #1
BNE	L_Down_24_OnPress426
NOP
NOP
NOP
;Controller_events_code.c,3350 :: 		}
L_end_Down_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_24_OnPress
_Down_24_OnUp:
;Controller_events_code.c,3351 :: 		void Down_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3352 :: 		Image99.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3353 :: 		Image17.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3354 :: 		DrawImage(&Image17);
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
BL	_DrawImage+0
;Controller_events_code.c,3355 :: 		}
L_end_Down_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_24_OnUp
_Up_24_OnPress:
;Controller_events_code.c,3356 :: 		void Up_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3358 :: 		Image100.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3359 :: 		Image12.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3360 :: 		DrawImage(&Image100);
MOVW	R0, #lo_addr(_Image100+0)
MOVT	R0, #hi_addr(_Image100+0)
BL	_DrawImage+0
;Controller_events_code.c,3361 :: 		system_reg[LP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3362 :: 		if (system_reg[LP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_24_OnPress428
;Controller_events_code.c,3363 :: 		system_reg[LP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Up_24_OnPress428:
;Controller_events_code.c,3364 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3365 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3366 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3367 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3368 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_24_OnPress429:
SUBS	R7, R7, #1
BNE	L_Up_24_OnPress429
NOP
NOP
NOP
;Controller_events_code.c,3370 :: 		}
L_end_Up_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_24_OnPress
_Up_24_OnUp:
;Controller_events_code.c,3371 :: 		void Up_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3372 :: 		Image100.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3373 :: 		Image12.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3374 :: 		DrawImage(&Image12);
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
BL	_DrawImage+0
;Controller_events_code.c,3375 :: 		}
L_end_Up_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_24_OnUp
_Down_25_OnPress:
;Controller_events_code.c,3376 :: 		void Down_25_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3378 :: 		Image280.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3379 :: 		Image18.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3380 :: 		DrawImage(&Image280);
MOVW	R0, #lo_addr(_Image280+0)
MOVT	R0, #hi_addr(_Image280+0)
BL	_DrawImage+0
;Controller_events_code.c,3381 :: 		system_reg[LP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3382 :: 		if (system_reg[LP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_25_OnPress431
;Controller_events_code.c,3383 :: 		system_reg[LP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Down_25_OnPress431:
;Controller_events_code.c,3384 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3385 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3386 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3387 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3388 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_25_OnPress432:
SUBS	R7, R7, #1
BNE	L_Down_25_OnPress432
NOP
NOP
NOP
;Controller_events_code.c,3390 :: 		}
L_end_Down_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_25_OnPress
_Down_25_OnUp:
;Controller_events_code.c,3391 :: 		void Down_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3392 :: 		Image280.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3393 :: 		Image18.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3394 :: 		DrawImage(&Image18);
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
BL	_DrawImage+0
;Controller_events_code.c,3396 :: 		}
L_end_Down_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_25_OnUp
_Up_25_OnPress:
;Controller_events_code.c,3397 :: 		void Up_25_OnPress(){
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Controller_events_code.c,3399 :: 		Image281.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3400 :: 		Image14.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3401 :: 		DrawImage(&Image281);
MOVW	R0, #lo_addr(_Image281+0)
MOVT	R0, #hi_addr(_Image281+0)
BL	_DrawImage+0
;Controller_events_code.c,3402 :: 		system_reg[LP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3403 :: 		if (system_reg[LP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_25_OnPress434
;Controller_events_code.c,3404 :: 		system_reg[LP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Up_25_OnPress434:
;Controller_events_code.c,3405 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3406 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3407 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3408 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3409 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_25_OnPress435:
SUBS	R7, R7, #1
BNE	L_Up_25_OnPress435
NOP
NOP
NOP
;Controller_events_code.c,3410 :: 		}
L_end_Up_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Up_25_OnPress
_Up_25_OnUp:
;Controller_events_code.c,3411 :: 		void Up_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3412 :: 		Image281.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3413 :: 		Image14.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3414 :: 		DrawImage(&Image14);
MOVW	R0, #lo_addr(_Image14+0)
MOVT	R0, #hi_addr(_Image14+0)
BL	_DrawImage+0
;Controller_events_code.c,3415 :: 		}
L_end_Up_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_25_OnUp
_Down_26_OnPress:
;Controller_events_code.c,3416 :: 		void Down_26_OnPress() {
;Controller_events_code.c,3418 :: 		}
L_end_Down_26_OnPress:
BX	LR
; end of _Down_26_OnPress
_Down_26_OnUp:
;Controller_events_code.c,3419 :: 		void Down_26_OnUp() {
;Controller_events_code.c,3421 :: 		}
L_end_Down_26_OnUp:
BX	LR
; end of _Down_26_OnUp
_UP_26_OnPress:
;Controller_events_code.c,3422 :: 		void UP_26_OnPress() {
;Controller_events_code.c,3424 :: 		}
L_end_UP_26_OnPress:
BX	LR
; end of _UP_26_OnPress
_UP_26_OnUp:
;Controller_events_code.c,3425 :: 		void UP_26_OnUp() {
;Controller_events_code.c,3427 :: 		}
L_end_UP_26_OnUp:
BX	LR
; end of _UP_26_OnUp
_Set_24_OnDown:
;Controller_events_code.c,3428 :: 		void Set_24_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3429 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3433 :: 		send_data_packet(LP_MAX,1);
MOVS	R1, #1
MOVW	R0, #230
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3434 :: 		Image279.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3435 :: 		Image29.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3436 :: 		DrawImage (&Image29);
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
BL	_DrawImage+0
;Controller_events_code.c,3437 :: 		}
L_end_Set_24_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnDown
_Set_24_OnUp:
;Controller_events_code.c,3438 :: 		void Set_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3439 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3440 :: 		Image279.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3441 :: 		Image29.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3442 :: 		DrawImage (&Image279);
MOVW	R0, #lo_addr(_Image279+0)
MOVT	R0, #hi_addr(_Image279+0)
BL	_DrawImage+0
;Controller_events_code.c,3443 :: 		}
L_end_Set_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnUp
_Set_25_OnDown:
;Controller_events_code.c,3444 :: 		void Set_25_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3445 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3449 :: 		send_data_packet(LP_MIN,1);
MOVS	R1, #1
MOVW	R0, #250
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3450 :: 		Image282.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3451 :: 		Image22.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3452 :: 		DrawImage (&Image22);
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
BL	_DrawImage+0
;Controller_events_code.c,3453 :: 		}
L_end_Set_25_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnDown
_Set_25_OnUp:
;Controller_events_code.c,3454 :: 		void Set_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3455 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3456 :: 		Image282.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3457 :: 		Image22.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3458 :: 		DrawImage (&Image282);
MOVW	R0, #lo_addr(_Image282+0)
MOVT	R0, #hi_addr(_Image282+0)
BL	_DrawImage+0
;Controller_events_code.c,3459 :: 		}
L_end_Set_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnUp
_Set_26_OnDown:
;Controller_events_code.c,3460 :: 		void Set_26_OnDown() {
;Controller_events_code.c,3462 :: 		}
L_end_Set_26_OnDown:
BX	LR
; end of _Set_26_OnDown
_Set_26_OnUp:
;Controller_events_code.c,3463 :: 		void Set_26_OnUp() {
;Controller_events_code.c,3465 :: 		}
L_end_Set_26_OnUp:
BX	LR
; end of _Set_26_OnUp
_Set_phase_check:
;Controller_events_code.c,3466 :: 		void Set_phase_check(){
;Controller_events_code.c,3468 :: 		}
L_end_Set_phase_check:
BX	LR
; end of _Set_phase_check
_Set_voltage_check:
;Controller_events_code.c,3469 :: 		void Set_voltage_check(){
;Controller_events_code.c,3471 :: 		}
L_end_Set_voltage_check:
BX	LR
; end of _Set_voltage_check
_Down_13_OnUp:
;Controller_events_code.c,3474 :: 		void Down_13_OnUp() {
;Controller_events_code.c,3476 :: 		}
L_end_Down_13_OnUp:
BX	LR
; end of _Down_13_OnUp
_Down_13_OnPress:
;Controller_events_code.c,3477 :: 		void Down_13_OnPress() {
;Controller_events_code.c,3478 :: 		}
L_end_Down_13_OnPress:
BX	LR
; end of _Down_13_OnPress
_Up_13_OnPress:
;Controller_events_code.c,3479 :: 		void Up_13_OnPress() {
;Controller_events_code.c,3481 :: 		}
L_end_Up_13_OnPress:
BX	LR
; end of _Up_13_OnPress
_Up_13_OnUp:
;Controller_events_code.c,3482 :: 		void Up_13_OnUp() {
;Controller_events_code.c,3484 :: 		}
L_end_Up_13_OnUp:
BX	LR
; end of _Up_13_OnUp
_Down_14_OnPress:
;Controller_events_code.c,3486 :: 		void Down_14_OnPress() {
;Controller_events_code.c,3488 :: 		}
L_end_Down_14_OnPress:
BX	LR
; end of _Down_14_OnPress
_Down_14_OnUp:
;Controller_events_code.c,3489 :: 		void Down_14_OnUp() {
;Controller_events_code.c,3491 :: 		}
L_end_Down_14_OnUp:
BX	LR
; end of _Down_14_OnUp
_Up_14_OnPress:
;Controller_events_code.c,3492 :: 		void Up_14_OnPress() {
;Controller_events_code.c,3494 :: 		}
L_end_Up_14_OnPress:
BX	LR
; end of _Up_14_OnPress
_Up_14_OnUp:
;Controller_events_code.c,3495 :: 		void Up_14_OnUp() {
;Controller_events_code.c,3497 :: 		}
L_end_Up_14_OnUp:
BX	LR
; end of _Up_14_OnUp
_Down_15_OnPress:
;Controller_events_code.c,3498 :: 		void Down_15_OnPress() {
;Controller_events_code.c,3500 :: 		}
L_end_Down_15_OnPress:
BX	LR
; end of _Down_15_OnPress
_Down_15_OnUp:
;Controller_events_code.c,3501 :: 		void Down_15_OnUp() {
;Controller_events_code.c,3503 :: 		}
L_end_Down_15_OnUp:
BX	LR
; end of _Down_15_OnUp
_Up_15_OnPress:
;Controller_events_code.c,3504 :: 		void Up_15_OnPress() {
;Controller_events_code.c,3506 :: 		}
L_end_Up_15_OnPress:
BX	LR
; end of _Up_15_OnPress
_Up_15_OnUp:
;Controller_events_code.c,3507 :: 		void Up_15_OnUp() {
;Controller_events_code.c,3509 :: 		}
L_end_Up_15_OnUp:
BX	LR
; end of _Up_15_OnUp
_Down_16_OnPress:
;Controller_events_code.c,3510 :: 		void Down_16_OnPress() {
;Controller_events_code.c,3512 :: 		}
L_end_Down_16_OnPress:
BX	LR
; end of _Down_16_OnPress
_Down_16_OnUp:
;Controller_events_code.c,3513 :: 		void Down_16_OnUp() {
;Controller_events_code.c,3515 :: 		}
L_end_Down_16_OnUp:
BX	LR
; end of _Down_16_OnUp
_Up_16_OnPress:
;Controller_events_code.c,3516 :: 		void Up_16_OnPress() {
;Controller_events_code.c,3518 :: 		}
L_end_Up_16_OnPress:
BX	LR
; end of _Up_16_OnPress
_Up_16_OnUp:
;Controller_events_code.c,3519 :: 		void Up_16_OnUp() {
;Controller_events_code.c,3521 :: 		}
L_end_Up_16_OnUp:
BX	LR
; end of _Up_16_OnUp
_Down_17_OnPress:
;Controller_events_code.c,3522 :: 		void Down_17_OnPress() {      // Electric heater preset setting
;Controller_events_code.c,3524 :: 		}
L_end_Down_17_OnPress:
BX	LR
; end of _Down_17_OnPress
_Down_17_OnUp:
;Controller_events_code.c,3525 :: 		void Down_17_OnUp() {
;Controller_events_code.c,3527 :: 		}
L_end_Down_17_OnUp:
BX	LR
; end of _Down_17_OnUp
_Up_17_OnPress:
;Controller_events_code.c,3528 :: 		void Up_17_OnPress() {
;Controller_events_code.c,3530 :: 		}
L_end_Up_17_OnPress:
BX	LR
; end of _Up_17_OnPress
_Up_17_OnUp:
;Controller_events_code.c,3531 :: 		void Up_17_OnUp() {
;Controller_events_code.c,3533 :: 		}
L_end_Up_17_OnUp:
BX	LR
; end of _Up_17_OnUp
_Down_18_OnPress:
;Controller_events_code.c,3534 :: 		void Down_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3536 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3537 :: 		Image481.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3538 :: 		Down_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3539 :: 		DrawImage(&Image481);
MOVW	R0, #lo_addr(_Image481+0)
MOVT	R0, #hi_addr(_Image481+0)
BL	_DrawImage+0
;Controller_events_code.c,3540 :: 		system_reg[S_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3541 :: 		if (system_reg[S_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_18_OnPress437
;Controller_events_code.c,3542 :: 		system_reg[S_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Down_18_OnPress437:
;Controller_events_code.c,3543 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3544 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3545 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3546 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3547 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_18_OnPress438:
SUBS	R7, R7, #1
BNE	L_Down_18_OnPress438
NOP
NOP
NOP
;Controller_events_code.c,3548 :: 		}
L_end_Down_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_18_OnPress
_Down_18_OnUp:
;Controller_events_code.c,3549 :: 		void Down_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3550 :: 		Image481.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3551 :: 		Down_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3552 :: 		DrawImage(&Down_18_);
MOVW	R0, #lo_addr(_Down_18_+0)
MOVT	R0, #hi_addr(_Down_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3553 :: 		}
L_end_Down_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_18_OnUp
_Up_18_OnPress:
;Controller_events_code.c,3554 :: 		void Up_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3556 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,3557 :: 		Image477.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3558 :: 		Up_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3559 :: 		DrawImage(&Image477);
MOVW	R0, #lo_addr(_Image477+0)
MOVT	R0, #hi_addr(_Image477+0)
BL	_DrawImage+0
;Controller_events_code.c,3560 :: 		system_reg[S_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3561 :: 		if (system_reg[S_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_18_OnPress440
;Controller_events_code.c,3562 :: 		system_reg[S_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Up_18_OnPress440:
;Controller_events_code.c,3563 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3564 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3565 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3566 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3567 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_18_OnPress441:
SUBS	R7, R7, #1
BNE	L_Up_18_OnPress441
NOP
NOP
NOP
;Controller_events_code.c,3568 :: 		}
L_end_Up_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_18_OnPress
_Up_18_OnUp:
;Controller_events_code.c,3569 :: 		void Up_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3570 :: 		Image477.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3571 :: 		Up_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3572 :: 		DrawImage(&Up_18_);
MOVW	R0, #lo_addr(_Up_18_+0)
MOVT	R0, #hi_addr(_Up_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3573 :: 		}
L_end_Up_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_18_OnUp
_Set_15_OnUp:
;Controller_events_code.c,3574 :: 		void Set_15_OnUp() {
;Controller_events_code.c,3576 :: 		}
L_end_Set_15_OnUp:
BX	LR
; end of _Set_15_OnUp
_Set_15_OnDown:
;Controller_events_code.c,3577 :: 		void Set_15_OnDown() {
;Controller_events_code.c,3579 :: 		}
L_end_Set_15_OnDown:
BX	LR
; end of _Set_15_OnDown
_Set_16_OnUp:
;Controller_events_code.c,3580 :: 		void Set_16_OnUp() {
;Controller_events_code.c,3582 :: 		}
L_end_Set_16_OnUp:
BX	LR
; end of _Set_16_OnUp
_Set_16_OnDown:
;Controller_events_code.c,3583 :: 		void Set_16_OnDown() {
;Controller_events_code.c,3585 :: 		}
L_end_Set_16_OnDown:
BX	LR
; end of _Set_16_OnDown
_Set_17_OnUp:
;Controller_events_code.c,3586 :: 		void Set_17_OnUp () {
;Controller_events_code.c,3588 :: 		}
L_end_Set_17_OnUp:
BX	LR
; end of _Set_17_OnUp
_Set_17_OnDown:
;Controller_events_code.c,3589 :: 		void Set_17_OnDown() {
;Controller_events_code.c,3591 :: 		}
L_end_Set_17_OnDown:
BX	LR
; end of _Set_17_OnDown
_Set_18_OnUp:
;Controller_events_code.c,3592 :: 		void Set_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3593 :: 		Set_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3594 :: 		Image485.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3595 :: 		DrawImage (&Set_18_);
MOVW	R0, #lo_addr(_Set_18_+0)
MOVT	R0, #hi_addr(_Set_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3596 :: 		}
L_end_Set_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnUp
_Set_18_OnDown:
;Controller_events_code.c,3597 :: 		void Set_18_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3598 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3600 :: 		send_data_packet(S_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #290
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3601 :: 		Set_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3602 :: 		Image485.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3603 :: 		DrawImage (&Image485);
MOVW	R0, #lo_addr(_Image485+0)
MOVT	R0, #hi_addr(_Image485+0)
BL	_DrawImage+0
;Controller_events_code.c,3604 :: 		}
L_end_Set_18_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnDown
_Set_14_OnDown:
;Controller_events_code.c,3605 :: 		void Set_14_OnDown() {
;Controller_events_code.c,3607 :: 		}
L_end_Set_14_OnDown:
BX	LR
; end of _Set_14_OnDown
_Set_14_OnUp:
;Controller_events_code.c,3608 :: 		void Set_14_OnUp(){
;Controller_events_code.c,3609 :: 		}
L_end_Set_14_OnUp:
BX	LR
; end of _Set_14_OnUp
_Set_13_OnUp:
;Controller_events_code.c,3610 :: 		void Set_13_OnUp() {
;Controller_events_code.c,3612 :: 		}
L_end_Set_13_OnUp:
BX	LR
; end of _Set_13_OnUp
_Set_13_OnDown:
;Controller_events_code.c,3613 :: 		void Set_13_OnDown() {
;Controller_events_code.c,3615 :: 		}
L_end_Set_13_OnDown:
BX	LR
; end of _Set_13_OnDown
_dec_def:
;Controller_events_code.c,3623 :: 		void dec_def() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3625 :: 		system_reg[TIME_BETWEEN_DEF]--;
MOVW	R1, #lo_addr(_system_reg+960)
MOVT	R1, #hi_addr(_system_reg+960)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3626 :: 		if (system_reg[TIME_BETWEEN_DEF] < 0)
CMP	R0, #0
IT	GE
BGE	L_dec_def443
;Controller_events_code.c,3627 :: 		system_reg[TIME_BETWEEN_DEF] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
STRH	R1, [R0, #0]
L_dec_def443:
;Controller_events_code.c,3628 :: 		IntToStr(system_reg[TIME_BETWEEN_DEF], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3629 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3630 :: 		strncpy(Defrost_on_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_time+24)
MOVT	R0, #hi_addr(_Defrost_on_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3631 :: 		DrawRoundButton(&Defrost_on_time);
MOVW	R0, #lo_addr(_Defrost_on_time+0)
MOVT	R0, #hi_addr(_Defrost_on_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3632 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_dec_def444:
SUBS	R7, R7, #1
BNE	L_dec_def444
NOP
NOP
NOP
;Controller_events_code.c,3633 :: 		}
L_end_dec_def:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _dec_def
_time_def_dec:
;Controller_events_code.c,3635 :: 		void time_def_dec() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3637 :: 		system_reg[TIME_DEFROST]--;
MOVW	R1, #lo_addr(_system_reg+720)
MOVT	R1, #hi_addr(_system_reg+720)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3638 :: 		if (system_reg[TIME_DEFROST] < 0)
CMP	R0, #0
IT	GE
BGE	L_time_def_dec446
;Controller_events_code.c,3639 :: 		system_reg[TIME_DEFROST] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+720)
MOVT	R0, #hi_addr(_system_reg+720)
STRH	R1, [R0, #0]
L_time_def_dec446:
;Controller_events_code.c,3640 :: 		IntToStr(system_reg[TIME_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+720)
MOVT	R0, #hi_addr(_system_reg+720)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3641 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3642 :: 		strncpy(Defrost_off_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_time+24)
MOVT	R0, #hi_addr(_Defrost_off_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3643 :: 		DrawRoundButton(&Defrost_off_time);
MOVW	R0, #lo_addr(_Defrost_off_time+0)
MOVT	R0, #hi_addr(_Defrost_off_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3644 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_time_def_dec447:
SUBS	R7, R7, #1
BNE	L_time_def_dec447
NOP
NOP
NOP
;Controller_events_code.c,3645 :: 		}
L_end_time_def_dec:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _time_def_dec
_temp_on_dec:
;Controller_events_code.c,3647 :: 		void temp_on_dec() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3649 :: 		system_reg[TEMP_DEFROST]--;
MOVW	R1, #lo_addr(_system_reg+700)
MOVT	R1, #hi_addr(_system_reg+700)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3650 :: 		if (system_reg[TEMP_DEFROST] < 0)
CMP	R0, #0
IT	GE
BGE	L_temp_on_dec449
;Controller_events_code.c,3651 :: 		system_reg[TEMP_DEFROST] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
STRH	R1, [R0, #0]
L_temp_on_dec449:
;Controller_events_code.c,3652 :: 		IntToStr(system_reg[TEMP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3653 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3654 :: 		strncpy(Defrost_on_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_temperature+24)
MOVT	R0, #hi_addr(_Defrost_on_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3655 :: 		DrawRoundButton(&Defrost_on_temperature);
MOVW	R0, #lo_addr(_Defrost_on_temperature+0)
MOVT	R0, #hi_addr(_Defrost_on_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3656 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_temp_on_dec450:
SUBS	R7, R7, #1
BNE	L_temp_on_dec450
NOP
NOP
NOP
;Controller_events_code.c,3657 :: 		}
L_end_temp_on_dec:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_on_dec
_temp_off_dec:
;Controller_events_code.c,3659 :: 		void temp_off_dec() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3661 :: 		system_reg[TEMP_STOP_DEFROST]--;
MOVW	R1, #lo_addr(_system_reg+760)
MOVT	R1, #hi_addr(_system_reg+760)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3662 :: 		if (system_reg[TEMP_STOP_DEFROST] < 0)
CMP	R0, #0
IT	GE
BGE	L_temp_off_dec452
;Controller_events_code.c,3663 :: 		system_reg[TEMP_STOP_DEFROST] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
STRH	R1, [R0, #0]
L_temp_off_dec452:
;Controller_events_code.c,3664 :: 		IntToStr(system_reg[TEMP_STOP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3665 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3666 :: 		strncpy(Defrost_off_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_temperature+24)
MOVT	R0, #hi_addr(_Defrost_off_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3667 :: 		DrawRoundButton(&Defrost_off_temperature);
MOVW	R0, #lo_addr(_Defrost_off_temperature+0)
MOVT	R0, #hi_addr(_Defrost_off_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3668 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_temp_off_dec453:
SUBS	R7, R7, #1
BNE	L_temp_off_dec453
NOP
NOP
NOP
;Controller_events_code.c,3669 :: 		}
L_end_temp_off_dec:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_off_dec
_hum_dec:
;Controller_events_code.c,3671 :: 		void hum_dec() {
;Controller_events_code.c,3673 :: 		}
L_end_hum_dec:
BX	LR
; end of _hum_dec
_inc_def:
;Controller_events_code.c,3675 :: 		void inc_def() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3677 :: 		system_reg[TIME_BETWEEN_DEF]++;
MOVW	R1, #lo_addr(_system_reg+960)
MOVT	R1, #hi_addr(_system_reg+960)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3678 :: 		if (system_reg[TIME_BETWEEN_DEF] > 99)
CMP	R0, #99
IT	LE
BLE	L_inc_def455
;Controller_events_code.c,3679 :: 		system_reg[TIME_BETWEEN_DEF] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
STRH	R1, [R0, #0]
L_inc_def455:
;Controller_events_code.c,3680 :: 		IntToStr(system_reg[TIME_BETWEEN_DEF], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3681 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3682 :: 		strncpy(Defrost_on_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_time+24)
MOVT	R0, #hi_addr(_Defrost_on_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3683 :: 		DrawRoundButton(&Defrost_on_time);
MOVW	R0, #lo_addr(_Defrost_on_time+0)
MOVT	R0, #hi_addr(_Defrost_on_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3684 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_inc_def456:
SUBS	R7, R7, #1
BNE	L_inc_def456
NOP
NOP
NOP
;Controller_events_code.c,3685 :: 		}
L_end_inc_def:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _inc_def
_time_def_inc:
;Controller_events_code.c,3687 :: 		void time_def_inc() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3689 :: 		system_reg[TIME_DEFROST]++;
MOVW	R1, #lo_addr(_system_reg+720)
MOVT	R1, #hi_addr(_system_reg+720)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3690 :: 		if (system_reg[TIME_DEFROST] >99)
CMP	R0, #99
IT	LE
BLE	L_time_def_inc458
;Controller_events_code.c,3691 :: 		system_reg[TIME_BETWEEN_DEF] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
STRH	R1, [R0, #0]
L_time_def_inc458:
;Controller_events_code.c,3692 :: 		IntToStr(system_reg[TIME_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+720)
MOVT	R0, #hi_addr(_system_reg+720)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3693 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3694 :: 		strncpy(Defrost_off_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_time+24)
MOVT	R0, #hi_addr(_Defrost_off_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3695 :: 		DrawRoundButton(&Defrost_off_time);
MOVW	R0, #lo_addr(_Defrost_off_time+0)
MOVT	R0, #hi_addr(_Defrost_off_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3696 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_time_def_inc459:
SUBS	R7, R7, #1
BNE	L_time_def_inc459
NOP
NOP
NOP
;Controller_events_code.c,3697 :: 		}
L_end_time_def_inc:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _time_def_inc
_temp_on_inc:
;Controller_events_code.c,3699 :: 		void temp_on_inc() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3701 :: 		system_reg[TEMP_DEFROST]++;
MOVW	R1, #lo_addr(_system_reg+700)
MOVT	R1, #hi_addr(_system_reg+700)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3702 :: 		if (system_reg[TEMP_DEFROST] >99)
CMP	R0, #99
IT	LE
BLE	L_temp_on_inc461
;Controller_events_code.c,3703 :: 		system_reg[TEMP_DEFROST] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
STRH	R1, [R0, #0]
L_temp_on_inc461:
;Controller_events_code.c,3704 :: 		IntToStr(system_reg[TEMP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3705 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3706 :: 		strncpy(Defrost_on_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_temperature+24)
MOVT	R0, #hi_addr(_Defrost_on_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3707 :: 		DrawRoundButton(&Defrost_on_temperature);
MOVW	R0, #lo_addr(_Defrost_on_temperature+0)
MOVT	R0, #hi_addr(_Defrost_on_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3708 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_temp_on_inc462:
SUBS	R7, R7, #1
BNE	L_temp_on_inc462
NOP
NOP
NOP
;Controller_events_code.c,3709 :: 		}
L_end_temp_on_inc:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_on_inc
_temp_off_inc:
;Controller_events_code.c,3711 :: 		void temp_off_inc() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3713 :: 		system_reg[TEMP_STOP_DEFROST]++;
MOVW	R1, #lo_addr(_system_reg+760)
MOVT	R1, #hi_addr(_system_reg+760)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3714 :: 		if (system_reg[TEMP_STOP_DEFROST] >99)
CMP	R0, #99
IT	LE
BLE	L_temp_off_inc464
;Controller_events_code.c,3715 :: 		system_reg[TEMP_STOP_DEFROST] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
STRH	R1, [R0, #0]
L_temp_off_inc464:
;Controller_events_code.c,3716 :: 		IntToStr(system_reg[TEMP_STOP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3717 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3718 :: 		strncpy(Defrost_off_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_temperature+24)
MOVT	R0, #hi_addr(_Defrost_off_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3719 :: 		DrawRoundButton(&Defrost_off_temperature);
MOVW	R0, #lo_addr(_Defrost_off_temperature+0)
MOVT	R0, #hi_addr(_Defrost_off_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3720 :: 		}
L_end_temp_off_inc:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_off_inc
_hum_inc:
;Controller_events_code.c,3722 :: 		void hum_inc() {
;Controller_events_code.c,3724 :: 		}
L_end_hum_inc:
BX	LR
; end of _hum_inc
_hum_set:
;Controller_events_code.c,3730 :: 		void hum_set() {
;Controller_events_code.c,3732 :: 		}
L_end_hum_set:
BX	LR
; end of _hum_set
_SetUPttimDef:
;Controller_events_code.c,3734 :: 		void SetUPttimDef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3736 :: 		Defrost_set1.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set1+20)
MOVT	R0, #hi_addr(_Defrost_set1+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3737 :: 		Image355.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image355+20)
MOVT	R0, #hi_addr(_Image355+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3738 :: 		DrawImage (&Defrost_set1);
MOVW	R0, #lo_addr(_Defrost_set1+0)
MOVT	R0, #hi_addr(_Defrost_set1+0)
BL	_DrawImage+0
;Controller_events_code.c,3739 :: 		}
L_end_SetUPttimDef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SetUPttimDef
_SetdownttimDef:
;Controller_events_code.c,3741 :: 		void SetdownttimDef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3742 :: 		Defrost_set1.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set1+20)
MOVT	R0, #hi_addr(_Defrost_set1+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3743 :: 		Image355.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image355+20)
MOVT	R0, #hi_addr(_Image355+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3744 :: 		DrawImage (&Image355);
MOVW	R0, #lo_addr(_Image355+0)
MOVT	R0, #hi_addr(_Image355+0)
BL	_DrawImage+0
;Controller_events_code.c,3745 :: 		send_data_packet(TIME_BETWEEN_DEF,1);
MOVS	R1, #1
MOVW	R0, #480
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3746 :: 		}
L_end_SetdownttimDef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SetdownttimDef
_Setdownintdef:
;Controller_events_code.c,3748 :: 		void Setdownintdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3749 :: 		Defrost_set2.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set2+20)
MOVT	R0, #hi_addr(_Defrost_set2+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3750 :: 		Image381.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image381+20)
MOVT	R0, #hi_addr(_Image381+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3751 :: 		DrawImage (&Image381);
MOVW	R0, #lo_addr(_Image381+0)
MOVT	R0, #hi_addr(_Image381+0)
BL	_DrawImage+0
;Controller_events_code.c,3752 :: 		send_data_packet(TIME_DEFROST,1);
MOVS	R1, #1
MOVW	R0, #360
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3754 :: 		}
L_end_Setdownintdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setdownintdef
_Setupintdef:
;Controller_events_code.c,3756 :: 		void Setupintdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3757 :: 		Defrost_set2.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set2+20)
MOVT	R0, #hi_addr(_Defrost_set2+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3758 :: 		Image381.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image381+20)
MOVT	R0, #hi_addr(_Image381+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3759 :: 		DrawImage (&Defrost_set2);
MOVW	R0, #lo_addr(_Defrost_set2+0)
MOVT	R0, #hi_addr(_Defrost_set2+0)
BL	_DrawImage+0
;Controller_events_code.c,3761 :: 		}
L_end_Setupintdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setupintdef
_Setuptempdef:
;Controller_events_code.c,3763 :: 		void Setuptempdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3764 :: 		Defrost_set3.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set3+20)
MOVT	R0, #hi_addr(_Defrost_set3+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3765 :: 		Image384.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image384+20)
MOVT	R0, #hi_addr(_Image384+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3766 :: 		DrawImage (&Defrost_set3);
MOVW	R0, #lo_addr(_Defrost_set3+0)
MOVT	R0, #hi_addr(_Defrost_set3+0)
BL	_DrawImage+0
;Controller_events_code.c,3768 :: 		}
L_end_Setuptempdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setuptempdef
_Setdowntempdef:
;Controller_events_code.c,3770 :: 		void Setdowntempdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3771 :: 		Defrost_set3.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set3+20)
MOVT	R0, #hi_addr(_Defrost_set3+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3772 :: 		Image384.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image384+20)
MOVT	R0, #hi_addr(_Image384+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3773 :: 		DrawImage (&Image384);
MOVW	R0, #lo_addr(_Image384+0)
MOVT	R0, #hi_addr(_Image384+0)
BL	_DrawImage+0
;Controller_events_code.c,3774 :: 		send_data_packet(TEMP_DEFROST,1);
MOVS	R1, #1
MOVW	R0, #350
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3775 :: 		}
L_end_Setdowntempdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setdowntempdef
_temp_off_set:
;Controller_events_code.c,3777 :: 		void temp_off_set() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3778 :: 		Defrost_set4.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set4+20)
MOVT	R0, #hi_addr(_Defrost_set4+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3779 :: 		Image388.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image388+20)
MOVT	R0, #hi_addr(_Image388+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3780 :: 		DrawImage (&Image388);
MOVW	R0, #lo_addr(_Image388+0)
MOVT	R0, #hi_addr(_Image388+0)
BL	_DrawImage+0
;Controller_events_code.c,3781 :: 		send_data_packet(TEMP_STOP_DEFROST,1);
MOVS	R1, #1
MOVW	R0, #380
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3782 :: 		}
L_end_temp_off_set:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _temp_off_set
_temp_on_set:
;Controller_events_code.c,3784 :: 		void temp_on_set() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3785 :: 		Defrost_set4.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set4+20)
MOVT	R0, #hi_addr(_Defrost_set4+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3786 :: 		Image388.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image388+20)
MOVT	R0, #hi_addr(_Image388+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3787 :: 		DrawImage (&Defrost_set4);
MOVW	R0, #lo_addr(_Defrost_set4+0)
MOVT	R0, #hi_addr(_Defrost_set4+0)
BL	_DrawImage+0
;Controller_events_code.c,3789 :: 		}
L_end_temp_on_set:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _temp_on_set
_pushDEF:
;Controller_events_code.c,3790 :: 		void pushDEF(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3791 :: 		system_reg[PUSH_DEFROS]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+786)
MOVT	R0, #hi_addr(_system_reg+786)
STRH	R1, [R0, #0]
;Controller_events_code.c,3792 :: 		send_data_packet(PUSH_DEFROS,1);
MOVS	R1, #1
MOVW	R0, #393
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3793 :: 		}
L_end_pushDEF:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _pushDEF
