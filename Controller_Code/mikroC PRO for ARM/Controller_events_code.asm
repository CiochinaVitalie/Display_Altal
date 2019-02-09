_Tone1:
;Controller_events_code.c,45 :: 		void Tone1() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,46 :: 		Sound_Play(659, 35);   //
MOVS	R1, #35
MOVW	R0, #659
BL	_Sound_Play+0
;Controller_events_code.c,47 :: 		}
L_end_Tone1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone1
_Tone2:
;Controller_events_code.c,48 :: 		void Tone2() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,49 :: 		Sound_Play(698, 50);   //
MOVS	R1, #50
MOVW	R0, #698
BL	_Sound_Play+0
;Controller_events_code.c,50 :: 		}
L_end_Tone2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone2
_Tone3:
;Controller_events_code.c,51 :: 		void Tone3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,52 :: 		Sound_Play(784, 70);   //
MOVS	R1, #70
MOVW	R0, #784
BL	_Sound_Play+0
;Controller_events_code.c,53 :: 		}
L_end_Tone3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Tone3
_BLED_Fade_Out:
;Controller_events_code.c,54 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,57 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
; i end address is: 4 (R1)
L_BLED_Fade_Out0:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_BLED_Fade_Out1
;Controller_events_code.c,58 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,59 :: 		Delay_us(500);
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
;Controller_events_code.c,57 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,60 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out0
L_BLED_Fade_Out1:
;Controller_events_code.c,61 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,62 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;Controller_events_code.c,63 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_events_code.c,66 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
; i end address is: 4 (R1)
L_BLED_Fade_In5:
; i start address is: 4 (R1)
CMP	R1, #255
IT	CS
BCS	L_BLED_Fade_In6
;Controller_events_code.c,67 :: 		TFT_Set_DBC_SSD1963(i);
STRB	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R1, [SP, #4]
;Controller_events_code.c,68 :: 		Delay_us(500);
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
;Controller_events_code.c,66 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
UXTB	R1, R1
;Controller_events_code.c,69 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In5
L_BLED_Fade_In6:
;Controller_events_code.c,70 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Controller_events_code.c,71 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_BackToHome:
;Controller_events_code.c,75 :: 		void BackToHome(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,76 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,77 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,78 :: 		DrawScreen(&HOME);
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
BL	_DrawScreen+0
;Controller_events_code.c,79 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,80 :: 		}
L_end_BackToHome:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackToHome
_goToBack:
;Controller_events_code.c,81 :: 		void goToBack(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,82 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,85 :: 		if( num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_goToBack10
;Controller_events_code.c,87 :: 		if(CurrentScreen == &SYSTEM_SET)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In(); }
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
;Controller_events_code.c,88 :: 		else if (CurrentScreen==&ERRORS)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,89 :: 		else if (CurrentScreen==&SENSOR1)                {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,90 :: 		else if (CurrentScreen==&SETTINGS)               {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,91 :: 		else if (CurrentScreen==&ENERGY)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,92 :: 		else if (CurrentScreen==&DEFROST)                 {BLED_Fade_Out();DrawScreen(&USER_MENU);BLED_Fade_In();}
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
;Controller_events_code.c,93 :: 		else if(CurrentScreen == &EEV)                   {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
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
;Controller_events_code.c,94 :: 		else if(CurrentScreen == &MODE)                   {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
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
;Controller_events_code.c,95 :: 		else if(CurrentScreen == &DELAY_MENU)            {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
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
;Controller_events_code.c,96 :: 		else if(CurrentScreen == &LIMITS1)               {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
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
;Controller_events_code.c,97 :: 		else if(CurrentScreen == &SYSTEM_EVENTS)         {BLED_Fade_Out();DrawScreen(&SYSTEM_SET);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
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
;Controller_events_code.c,98 :: 		else if (CurrentScreen==&LIMITS2)                {BLED_Fade_Out();DrawScreen(&LIMITS1);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack33
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack34
L_goToBack33:
;Controller_events_code.c,99 :: 		else if (CurrentScreen==&LIMITS3)                {BLED_Fade_Out();DrawScreen(&LIMITS2);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack35
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack36
L_goToBack35:
;Controller_events_code.c,100 :: 		else if (CurrentScreen==&LIMITS4)                {BLED_Fade_Out();DrawScreen(&LIMITS3);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack37
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack38
L_goToBack37:
;Controller_events_code.c,101 :: 		else if (CurrentScreen==&LIMITS5)                {BLED_Fade_Out();DrawScreen(&LIMITS4);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack39
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_goToBack40
L_goToBack39:
;Controller_events_code.c,102 :: 		else if (CurrentScreen==&MODE2)                  {BLED_Fade_Out();DrawScreen(&MODE);BLED_Fade_In(); }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
CMP	R1, R0
IT	NE
BNE	L_goToBack41
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
L_goToBack41:
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
;Controller_events_code.c,103 :: 		}
IT	AL
BAL	L_goToBack42
L_goToBack10:
;Controller_events_code.c,104 :: 		else num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
L_goToBack42:
;Controller_events_code.c,107 :: 		}
L_end_goToBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _goToBack
_nextPage:
;Controller_events_code.c,108 :: 		void nextPage()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,110 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,112 :: 		if( num_page==0 && two_compressors_mode)  num_page=1;
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__nextPage454
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__nextPage453
L__nextPage452:
MOVS	R1, #1
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
L__nextPage454:
L__nextPage453:
;Controller_events_code.c,113 :: 		if (CurrentScreen==&LIMITS1){BLED_Fade_Out();DrawScreen(&LIMITS2);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage46
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage47
L_nextPage46:
;Controller_events_code.c,114 :: 		else if (CurrentScreen==&LIMITS2){BLED_Fade_Out();DrawScreen(&LIMITS3);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS2+0)
MOVT	R0, #hi_addr(_LIMITS2+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage48
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage49
L_nextPage48:
;Controller_events_code.c,115 :: 		else if (CurrentScreen==&LIMITS3){BLED_Fade_Out();DrawScreen(&LIMITS4);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS3+0)
MOVT	R0, #hi_addr(_LIMITS3+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage50
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage51
L_nextPage50:
;Controller_events_code.c,116 :: 		else if (CurrentScreen==&LIMITS4){BLED_Fade_Out();DrawScreen(&LIMITS5);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_LIMITS4+0)
MOVT	R0, #hi_addr(_LIMITS4+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage52
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_LIMITS5+0)
MOVT	R0, #hi_addr(_LIMITS5+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
IT	AL
BAL	L_nextPage53
L_nextPage52:
;Controller_events_code.c,117 :: 		else if (CurrentScreen==&MODE){BLED_Fade_Out();DrawScreen(&MODE2);BLED_Fade_In();}
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
CMP	R1, R0
IT	NE
BNE	L_nextPage54
BL	_BLED_Fade_Out+0
MOVW	R0, #lo_addr(_MODE2+0)
MOVT	R0, #hi_addr(_MODE2+0)
BL	_DrawScreen+0
BL	_BLED_Fade_In+0
L_nextPage54:
L_nextPage53:
L_nextPage51:
L_nextPage49:
L_nextPage47:
;Controller_events_code.c,119 :: 		}
L_end_nextPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nextPage
_selectPage:
;Controller_events_code.c,120 :: 		void selectPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,125 :: 		if (lastScreen!=CurrentScreen) {countPacket=1; lastScreen=CurrentScreen;  }
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(selectPage_lastScreen_L0+0)
MOVT	R0, #hi_addr(selectPage_lastScreen_L0+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_selectPage55
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
L_selectPage55:
;Controller_events_code.c,126 :: 		if (CurrentScreen==&HOME)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_HOME+0)
MOVT	R0, #hi_addr(_HOME+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage56
;Controller_events_code.c,129 :: 		main_page();
BL	_main_page+0
;Controller_events_code.c,130 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage57
;Controller_events_code.c,132 :: 		case 1:reciev_data_packet(BAC_TEMP,5); break;
L_selectPage59:
MOVS	R1, #5
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage58
;Controller_events_code.c,138 :: 		case 2:countPacket=1;break;
L_selectPage60:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage58
;Controller_events_code.c,139 :: 		}
L_selectPage57:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage59
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage60
L_selectPage58:
;Controller_events_code.c,140 :: 		}
IT	AL
BAL	L_selectPage61
L_selectPage56:
;Controller_events_code.c,142 :: 		else if(CurrentScreen==&SENSOR1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage62
;Controller_events_code.c,144 :: 		sensor_1(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_sensor_1+0
;Controller_events_code.c,146 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage63
;Controller_events_code.c,148 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage64
;Controller_events_code.c,150 :: 		case 1: reciev_data_packet(BAC_TEMP,14);break;//
L_selectPage66:
MOVS	R1, #14
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage65
;Controller_events_code.c,152 :: 		case 2:  countPacket=1;break;
L_selectPage67:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage65
;Controller_events_code.c,153 :: 		}
L_selectPage64:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage66
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage67
L_selectPage65:
;Controller_events_code.c,154 :: 		if(strcmp(CircleButton10.Caption,"1")!=0){CircleButton10.Caption="1";DrawCircleButton(&CircleButton10);  }
MOVW	R1, #lo_addr(?lstr1_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr1_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage68
MOVW	R1, #lo_addr(?lstr2_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr2_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton10+0)
MOVT	R0, #hi_addr(_CircleButton10+0)
BL	_DrawCircleButton+0
L_selectPage68:
;Controller_events_code.c,155 :: 		}
IT	AL
BAL	L_selectPage69
L_selectPage63:
;Controller_events_code.c,158 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage70
;Controller_events_code.c,160 :: 		case 1: reciev_data_packet(BAC_TEMP,2);break;
L_selectPage72:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage71
;Controller_events_code.c,161 :: 		case 2: reciev_data_packet(SOURC_IN_2,11);break;
L_selectPage73:
MOVS	R1, #11
MOVW	R0, #92
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage71
;Controller_events_code.c,162 :: 		case 3:  countPacket=1;break;
L_selectPage74:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage71
;Controller_events_code.c,163 :: 		}
L_selectPage70:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage72
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage73
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage74
L_selectPage71:
;Controller_events_code.c,164 :: 		if(strcmp(CircleButton10.Caption,"2")!=0) {CircleButton10.Caption="2";DrawCircleButton(&CircleButton10);Back_b10.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr3_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr3_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton10+20)
MOVT	R0, #hi_addr(_CircleButton10+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage75
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
L_selectPage75:
;Controller_events_code.c,165 :: 		}
L_selectPage69:
;Controller_events_code.c,166 :: 		}
IT	AL
BAL	L_selectPage76
L_selectPage62:
;Controller_events_code.c,169 :: 		else if(CurrentScreen==&GAUGE1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage77
;Controller_events_code.c,171 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage78
;Controller_events_code.c,173 :: 		LP_display(system_reg[LOW_PRESS_1]),HP_display(system_reg[HIGH_PRESS_1]);reciev_data_packet(HIGH_PRESS_1,2);
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
;Controller_events_code.c,174 :: 		if(strcmp(CircleButton8.Caption,"1")!=0) {CircleButton8.Caption="1";DrawCircleButton(&CircleButton8);Next_b2.Caption="NEXT";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=nextPage;}
MOVW	R1, #lo_addr(?lstr5_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr5_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage79
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
L_selectPage79:
;Controller_events_code.c,175 :: 		}
IT	AL
BAL	L_selectPage80
L_selectPage78:
;Controller_events_code.c,178 :: 		LP_display(system_reg[LOW_PRESS_2]),HP_display(system_reg[HIGH_PRESS_2]);reciev_data_packet(HIGH_PRESS_2,2);
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
;Controller_events_code.c,179 :: 		if(strcmp(CircleButton8.Caption,"2")!=0){CircleButton8.Caption="2";DrawCircleButton(&CircleButton8);Next_b2.Caption="BACK";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr8_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr8_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton8+20)
MOVT	R0, #hi_addr(_CircleButton8+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage81
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
L_selectPage81:
;Controller_events_code.c,180 :: 		}
L_selectPage80:
;Controller_events_code.c,181 :: 		}
IT	AL
BAL	L_selectPage82
L_selectPage77:
;Controller_events_code.c,182 :: 		else if(CurrentScreen==&EEV)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage83
;Controller_events_code.c,184 :: 		count_steps(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_count_steps+0
;Controller_events_code.c,185 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage84
;Controller_events_code.c,187 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage85
;Controller_events_code.c,189 :: 		case 1:reciev_data_packet(TRV_STEPS_1,1); break;
L_selectPage87:
MOVS	R1, #1
MOVW	R0, #61
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage86
;Controller_events_code.c,190 :: 		case 2:reciev_data_packet(S_HEAT_1,1); break;
L_selectPage88:
MOVS	R1, #1
MOVW	R0, #151
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage86
;Controller_events_code.c,191 :: 		case 3:reciev_data_packet(TRV_CORRECT_1,1); break;
L_selectPage89:
MOVS	R1, #1
MOVW	R0, #391
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage86
;Controller_events_code.c,192 :: 		case 4:  countPacket=1;break;
L_selectPage90:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage86
;Controller_events_code.c,193 :: 		}
L_selectPage85:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage87
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage88
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage89
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage90
L_selectPage86:
;Controller_events_code.c,194 :: 		if(strcmp(CircleButton9.Caption,"1")!=0) {CircleButton9.Caption="1";DrawCircleButton(&CircleButton9);}
MOVW	R1, #lo_addr(?lstr11_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr11_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage91
MOVW	R1, #lo_addr(?lstr12_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr12_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton9+0)
MOVT	R0, #hi_addr(_CircleButton9+0)
BL	_DrawCircleButton+0
L_selectPage91:
;Controller_events_code.c,195 :: 		}
IT	AL
BAL	L_selectPage92
L_selectPage84:
;Controller_events_code.c,198 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage93
;Controller_events_code.c,200 :: 		case 1:reciev_data_packet(TRV_STEPS_2,1); break;
L_selectPage95:
MOVS	R1, #1
MOVW	R0, #62
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage94
;Controller_events_code.c,201 :: 		case 2:reciev_data_packet(S_HEAT_2,1); break;
L_selectPage96:
MOVS	R1, #1
MOVW	R0, #152
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage94
;Controller_events_code.c,202 :: 		case 3:reciev_data_packet(TRV_CORRECT_2,1); break;
L_selectPage97:
MOVS	R1, #1
MOVW	R0, #392
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage94
;Controller_events_code.c,203 :: 		case 4:  countPacket=1;break;
L_selectPage98:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage94
;Controller_events_code.c,204 :: 		}
L_selectPage93:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage95
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage96
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage97
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage98
L_selectPage94:
;Controller_events_code.c,205 :: 		if(strcmp(CircleButton9.Caption,"2")!=0) {CircleButton9.Caption="2";DrawCircleButton(&CircleButton9);Back_b2.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr13_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr13_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage99
MOVW	R1, #lo_addr(?lstr14_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr14_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton9+20)
MOVT	R0, #hi_addr(_CircleButton9+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton9+0)
MOVT	R0, #hi_addr(_CircleButton9+0)
BL	_DrawCircleButton+0
MOVW	R1, #lo_addr(_goToBack+0)
MOVT	R1, #hi_addr(_goToBack+0)
MOVW	R0, #lo_addr(_Back_b2+60)
MOVT	R0, #hi_addr(_Back_b2+60)
STR	R1, [R0, #0]
L_selectPage99:
;Controller_events_code.c,206 :: 		}
L_selectPage92:
;Controller_events_code.c,207 :: 		}
IT	AL
BAL	L_selectPage100
L_selectPage83:
;Controller_events_code.c,209 :: 		else if(CurrentScreen==&SYSTEM_EVENTS)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage101
;Controller_events_code.c,211 :: 		working_time(num_page);
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
BL	_working_time+0
;Controller_events_code.c,212 :: 		if(num_page==0) {
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_selectPage102
;Controller_events_code.c,213 :: 		reciev_data_packet(TIM_COM_1,4);
MOVS	R1, #4
MOVW	R0, #341
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,214 :: 		if(strcmp(CircleButton6.Caption,"1")!=0) {CircleButton6.Caption="1";DrawCircleButton(&CircleButton6);}
MOVW	R1, #lo_addr(?lstr15_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr15_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage103
MOVW	R1, #lo_addr(?lstr16_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr16_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_CircleButton6+0)
MOVT	R0, #hi_addr(_CircleButton6+0)
BL	_DrawCircleButton+0
L_selectPage103:
;Controller_events_code.c,215 :: 		}
IT	AL
BAL	L_selectPage104
L_selectPage102:
;Controller_events_code.c,217 :: 		reciev_data_packet(TIM_COM_2,4);
MOVS	R1, #4
MOVW	R0, #342
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,218 :: 		if(strcmp(CircleButton6.Caption,"2")!=0) {CircleButton6.Caption="2";DrawCircleButton(&CircleButton6);Back_b7.OnClickPtr=goToBack;}
MOVW	R1, #lo_addr(?lstr17_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr17_Controller_events_code+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_selectPage105
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
L_selectPage105:
;Controller_events_code.c,219 :: 		}
L_selectPage104:
;Controller_events_code.c,221 :: 		}
IT	AL
BAL	L_selectPage106
L_selectPage101:
;Controller_events_code.c,222 :: 		else if(CurrentScreen==&Schema1)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage107
;Controller_events_code.c,224 :: 		schema1_page();
BL	_schema1_page+0
;Controller_events_code.c,225 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage108
;Controller_events_code.c,227 :: 		case 1:reciev_data_packet(BAC_TEMP,2); break;
L_selectPage110:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage109
;Controller_events_code.c,228 :: 		case 2:reciev_data_packet(CONDENS_TEMP_1,11); break;
L_selectPage111:
MOVS	R1, #11
MOVW	R0, #121
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage109
;Controller_events_code.c,229 :: 		case 3:reciev_data_packet(COM_STATE_1,5); break;
L_selectPage112:
MOVS	R1, #5
MOVW	R0, #11
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage109
;Controller_events_code.c,230 :: 		case 4:  countPacket=1;break;
L_selectPage113:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage109
;Controller_events_code.c,231 :: 		}
L_selectPage108:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage110
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage111
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage112
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage113
L_selectPage109:
;Controller_events_code.c,232 :: 		}
IT	AL
BAL	L_selectPage114
L_selectPage107:
;Controller_events_code.c,233 :: 		else if (CurrentScreen==&Schema2)
MOVW	R0, #lo_addr(_CurrentScreen+0)
MOVT	R0, #hi_addr(_CurrentScreen+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
CMP	R1, R0
IT	NE
BNE	L_selectPage115
;Controller_events_code.c,235 :: 		switch(countPacket)
IT	AL
BAL	L_selectPage116
;Controller_events_code.c,237 :: 		case 1:reciev_data_packet(BAC_TEMP,2); break;
L_selectPage118:
MOVS	R1, #2
MOVW	R0, #71
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage117
;Controller_events_code.c,238 :: 		case 2:reciev_data_packet(CONDENS_TEMP_2,11); break;
L_selectPage119:
MOVS	R1, #11
MOVW	R0, #122
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage117
;Controller_events_code.c,239 :: 		case 3:reciev_data_packet(COM_STATE_2,5); break;
L_selectPage120:
MOVS	R1, #5
MOVW	R0, #12
SXTH	R0, R0
BL	_reciev_data_packet+0
IT	AL
BAL	L_selectPage117
;Controller_events_code.c,240 :: 		case 4:  countPacket=1;break;
L_selectPage121:
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_selectPage117
;Controller_events_code.c,241 :: 		}
L_selectPage116:
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_selectPage118
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_selectPage119
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_selectPage120
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_selectPage121
L_selectPage117:
;Controller_events_code.c,243 :: 		}
L_selectPage115:
L_selectPage114:
L_selectPage106:
L_selectPage100:
L_selectPage82:
L_selectPage76:
L_selectPage61:
;Controller_events_code.c,245 :: 		}
L_end_selectPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _selectPage
_Main_OFFOnClick:
;Controller_events_code.c,248 :: 		void Main_OFFOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,250 :: 		if ((unsigned long)Main_OFF.Picture_Name == main_off_bmp)
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
LDR	R1, [R0, #0]
MOVW	R0, #19268
MOVT	R0, #8
CMP	R1, R0
IT	NE
BNE	L_Main_OFFOnClick122
;Controller_events_code.c,252 :: 		Main_OFF.Picture_Name = main_on_bmp;
MOVW	R1, #10146
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,253 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Controller_events_code.c,257 :: 		SYSTEM_ON=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,258 :: 		system_reg[POWER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,260 :: 		}
IT	AL
BAL	L_Main_OFFOnClick123
L_Main_OFFOnClick122:
;Controller_events_code.c,262 :: 		Main_OFF.Picture_Name = main_off_bmp;
MOVW	R1, #19268
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
;Controller_events_code.c,263 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,267 :: 		SYSTEM_ON=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,268 :: 		system_reg[POWER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
STRH	R1, [R0, #0]
;Controller_events_code.c,269 :: 		}
L_Main_OFFOnClick123:
;Controller_events_code.c,271 :: 		send_data_packet(POWER,2);
MOVS	R1, #2
MOVW	R0, #310
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,273 :: 		}
L_end_Main_OFFOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Main_OFFOnClick
_bar_heatingOnClick:
;Controller_events_code.c,274 :: 		void bar_heatingOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,277 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 )
MOVW	R1, #lo_addr(?lstr19_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr19_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick124
;Controller_events_code.c,279 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr20_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr20_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,280 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,281 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,283 :: 		system_reg[COOL]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,284 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,286 :: 		}
IT	AL
BAL	L_bar_heatingOnClick125
L_bar_heatingOnClick124:
;Controller_events_code.c,287 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0)
MOVW	R1, #lo_addr(?lstr21_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr21_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick126
;Controller_events_code.c,289 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr22_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr22_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Controller_events_code.c,290 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,291 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,293 :: 		system_reg[HEAT]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,294 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,295 :: 		}
L_bar_heatingOnClick126:
L_bar_heatingOnClick125:
;Controller_events_code.c,297 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 ) {
MOVW	R1, #lo_addr(?lstr23_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr23_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_bar_heatingOnClick127
;Controller_events_code.c,298 :: 		send_data_packet(COOL,2);
MOVS	R1, #2
MOVW	R0, #190
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,300 :: 		}
L_bar_heatingOnClick127:
;Controller_events_code.c,302 :: 		}
L_end_bar_heatingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bar_heatingOnClick
_DHW_SetingOnClick:
;Controller_events_code.c,303 :: 		void DHW_SetingOnClick()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,306 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_DHW_SetingOnClick128
;Controller_events_code.c,307 :: 		Set_Dhw_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,308 :: 		Set_Dhw_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,309 :: 		DHW_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,310 :: 		DHW_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,311 :: 		DHW_DOWN.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,312 :: 		DHW_DOWN.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,313 :: 		DHW_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,314 :: 		DHW_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,315 :: 		dhw_T.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_T+18)
MOVT	R0, #hi_addr(_dhw_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,316 :: 		dhw_T.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_T+19)
MOVT	R0, #hi_addr(_dhw_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,317 :: 		dhw_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,318 :: 		dhw_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,319 :: 		dhw_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,320 :: 		dhw_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,321 :: 		dhw_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,322 :: 		dhw_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,323 :: 		dhw_dec.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_dec+18)
MOVT	R0, #hi_addr(_dhw_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,324 :: 		dhw_dec.Active         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dhw_dec+19)
MOVT	R0, #hi_addr(_dhw_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,325 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,327 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,328 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,329 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_SetingOnClick457
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_SetingOnClick456
L__DHW_SetingOnClick455:
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
L__DHW_SetingOnClick457:
L__DHW_SetingOnClick456:
;Controller_events_code.c,330 :: 		DHW_Seting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr24_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr24_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,331 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,332 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,334 :: 		DrawRoundButton(&DHW_UP);
MOVW	R0, #lo_addr(_DHW_UP+0)
MOVT	R0, #hi_addr(_DHW_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,335 :: 		DrawRoundButton(&DHW_DOWN);
MOVW	R0, #lo_addr(_DHW_DOWN+0)
MOVT	R0, #hi_addr(_DHW_DOWN+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,336 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,337 :: 		count_push++;
MOVW	R1, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,338 :: 		}
IT	AL
BAL	L_DHW_SetingOnClick132
L_DHW_SetingOnClick128:
;Controller_events_code.c,340 :: 		Set_Dhw_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+18)
MOVT	R0, #hi_addr(_Set_Dhw_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,341 :: 		Set_Dhw_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Dhw_Box+19)
MOVT	R0, #hi_addr(_Set_Dhw_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,342 :: 		DHW_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+18)
MOVT	R0, #hi_addr(_DHW_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,343 :: 		DHW_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_UP+19)
MOVT	R0, #hi_addr(_DHW_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,344 :: 		DHW_DOWN.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+18)
MOVT	R0, #hi_addr(_DHW_DOWN+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,345 :: 		DHW_DOWN.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_DOWN+19)
MOVT	R0, #hi_addr(_DHW_DOWN+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,346 :: 		DHW_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+27)
MOVT	R0, #hi_addr(_DHW_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,347 :: 		DHW_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DHW_Setting_value+28)
MOVT	R0, #hi_addr(_DHW_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,348 :: 		dhw_T.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_T+18)
MOVT	R0, #hi_addr(_dhw_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,349 :: 		dhw_T.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_T+19)
MOVT	R0, #hi_addr(_dhw_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,350 :: 		dhw_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+28)
MOVT	R0, #hi_addr(_dhw_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,351 :: 		dhw_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_point+27)
MOVT	R0, #hi_addr(_dhw_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,352 :: 		dhw_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+27)
MOVT	R0, #hi_addr(_dhw_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,353 :: 		dhw_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_celc+28)
MOVT	R0, #hi_addr(_dhw_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,354 :: 		dhw_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+16)
MOVT	R0, #hi_addr(_dhw_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,355 :: 		dhw_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_led+17)
MOVT	R0, #hi_addr(_dhw_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,356 :: 		dhw_dec.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_dec+18)
MOVT	R0, #hi_addr(_dhw_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,357 :: 		dhw_dec.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dhw_dec+19)
MOVT	R0, #hi_addr(_dhw_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,358 :: 		DHW_Seting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr25_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr25_Controller_events_code+0)
MOVW	R0, #lo_addr(_DHW_Seting+24)
MOVT	R0, #hi_addr(_DHW_Seting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,360 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(DHW_SetingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(DHW_SetingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,361 :: 		DrawRoundBox(&DWN_Windows);
MOVW	R0, #lo_addr(_DWN_Windows+0)
MOVT	R0, #hi_addr(_DWN_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,362 :: 		DrawRoundButton(&DHW_Seting);
MOVW	R0, #lo_addr(_DHW_Seting+0)
MOVT	R0, #hi_addr(_DHW_Seting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,363 :: 		DrawRoundButton (& ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,364 :: 		DrawImage(&dhw_icon);
MOVW	R0, #lo_addr(_dhw_icon+0)
MOVT	R0, #hi_addr(_dhw_icon+0)
BL	_DrawImage+0
;Controller_events_code.c,365 :: 		DrawRoundButton(&bar_DHW);
MOVW	R0, #lo_addr(_bar_DHW+0)
MOVT	R0, #hi_addr(_bar_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,366 :: 		DrawRoundButton(&dhw_T);
MOVW	R0, #lo_addr(_dhw_T+0)
MOVT	R0, #hi_addr(_dhw_T+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,367 :: 		DrawRoundButton(&dhw_dec);
MOVW	R0, #lo_addr(_dhw_dec+0)
MOVT	R0, #hi_addr(_dhw_dec+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,369 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,370 :: 		DrawLabel(&dhw_point);
MOVW	R0, #lo_addr(_dhw_point+0)
MOVT	R0, #hi_addr(_dhw_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,371 :: 		DrawLabel(&dhw_celc);
MOVW	R0, #lo_addr(_dhw_celc+0)
MOVT	R0, #hi_addr(_dhw_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,372 :: 		send_data_packet(SET_DHW,1);
MOVS	R1, #1
MOVW	R0, #330
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,376 :: 		}
L_DHW_SetingOnClick132:
;Controller_events_code.c,379 :: 		}
L_end_DHW_SetingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_SetingOnClick
_Heat_SettingOnClick:
;Controller_events_code.c,380 :: 		void Heat_SettingOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,384 :: 		if(count_push==0) {
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick133
;Controller_events_code.c,385 :: 		Set_Heat_Box.Visible       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,386 :: 		Set_Heat_Box.Active        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,387 :: 		HEAT_UP.Visible            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,388 :: 		HEAT_UP.Active             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,389 :: 		HEAT_Down.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,390 :: 		HEAT_Down.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,391 :: 		TEMP_Setting_value.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,392 :: 		TEMP_Setting_value.Active  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,393 :: 		heat_T.Visible     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_T+18)
MOVT	R0, #hi_addr(_heat_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,394 :: 		heat_T.Active      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_T+19)
MOVT	R0, #hi_addr(_heat_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,395 :: 		heat_point.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,396 :: 		heat_point.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,397 :: 		heat_celc.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,398 :: 		heat_celc.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,399 :: 		heat_led.Visible           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,400 :: 		heat_led.Active            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,401 :: 		heat_dec.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_dec+19)
MOVT	R0, #hi_addr(_heat_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,402 :: 		heat_dec.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_heat_dec+18)
MOVT	R0, #hi_addr(_heat_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,403 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0 )IntToStr(system_reg[SET_HEAT], txt);
MOVW	R1, #lo_addr(?lstr26_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr26_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick134
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
IT	AL
BAL	L_Heat_SettingOnClick135
L_Heat_SettingOnClick134:
;Controller_events_code.c,404 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0) IntToStr(system_reg[SET_COOL], txt);
MOVW	R1, #lo_addr(?lstr27_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr27_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick136
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
L_Heat_SettingOnClick136:
L_Heat_SettingOnClick135:
;Controller_events_code.c,405 :: 		Ltrim(txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,406 :: 		strncpy(TEMP_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,407 :: 		if(system_reg[SET_HEAT]<10 && system_reg[SET_HEAT]>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__Heat_SettingOnClick460
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__Heat_SettingOnClick459
L__Heat_SettingOnClick458:
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
L__Heat_SettingOnClick460:
L__Heat_SettingOnClick459:
;Controller_events_code.c,408 :: 		Heat_Setting.Caption = "SELECT";
MOVW	R1, #lo_addr(?lstr28_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr28_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,409 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,410 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,411 :: 		DrawRoundButton(&HEAT_UP);
MOVW	R0, #lo_addr(_HEAT_UP+0)
MOVT	R0, #hi_addr(_HEAT_UP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,412 :: 		DrawRoundButton(&HEAT_DOWN);
MOVW	R0, #lo_addr(_HEAT_Down+0)
MOVT	R0, #hi_addr(_HEAT_Down+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,413 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,414 :: 		count_push++;
MOVW	R1, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R1, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Controller_events_code.c,415 :: 		}
IT	AL
BAL	L_Heat_SettingOnClick140
L_Heat_SettingOnClick133:
;Controller_events_code.c,417 :: 		Set_Heat_Box.Visible       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+18)
MOVT	R0, #hi_addr(_Set_Heat_Box+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,418 :: 		Set_Heat_Box.Active        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_Heat_Box+19)
MOVT	R0, #hi_addr(_Set_Heat_Box+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,419 :: 		HEAT_UP.Visible            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+18)
MOVT	R0, #hi_addr(_HEAT_UP+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,420 :: 		HEAT_UP.Active             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_UP+19)
MOVT	R0, #hi_addr(_HEAT_UP+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,421 :: 		HEAT_Down.Visible          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+18)
MOVT	R0, #hi_addr(_HEAT_Down+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,422 :: 		HEAT_Down.Active           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_HEAT_Down+19)
MOVT	R0, #hi_addr(_HEAT_Down+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,423 :: 		TEMP_Setting_value.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+27)
MOVT	R0, #hi_addr(_TEMP_Setting_value+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,424 :: 		TEMP_Setting_value.Active  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TEMP_Setting_value+28)
MOVT	R0, #hi_addr(_TEMP_Setting_value+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,425 :: 		heat_T.Visible     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_T+18)
MOVT	R0, #hi_addr(_heat_T+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,426 :: 		heat_T.Active      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_T+19)
MOVT	R0, #hi_addr(_heat_T+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,427 :: 		heat_point.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+28)
MOVT	R0, #hi_addr(_heat_point+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,428 :: 		heat_point.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_point+27)
MOVT	R0, #hi_addr(_heat_point+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,429 :: 		heat_celc.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+27)
MOVT	R0, #hi_addr(_heat_celc+27)
STRB	R1, [R0, #0]
;Controller_events_code.c,430 :: 		heat_celc.Active           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_celc+28)
MOVT	R0, #hi_addr(_heat_celc+28)
STRB	R1, [R0, #0]
;Controller_events_code.c,431 :: 		heat_led.Visible           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+16)
MOVT	R0, #hi_addr(_heat_led+16)
STRB	R1, [R0, #0]
;Controller_events_code.c,432 :: 		heat_led.Active            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_led+17)
MOVT	R0, #hi_addr(_heat_led+17)
STRB	R1, [R0, #0]
;Controller_events_code.c,433 :: 		heat_dec.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_dec+19)
MOVT	R0, #hi_addr(_heat_dec+19)
STRB	R1, [R0, #0]
;Controller_events_code.c,434 :: 		heat_dec.Visible          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_heat_dec+18)
MOVT	R0, #hi_addr(_heat_dec+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,435 :: 		Heat_Setting.Caption = "SET";
MOVW	R1, #lo_addr(?lstr29_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr29_Controller_events_code+0)
MOVW	R0, #lo_addr(_Heat_Setting+24)
MOVT	R0, #hi_addr(_Heat_Setting+24)
STR	R1, [R0, #0]
;Controller_events_code.c,436 :: 		count_push=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Heat_SettingOnClick_count_push_L0+0)
MOVT	R0, #hi_addr(Heat_SettingOnClick_count_push_L0+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,437 :: 		DrawRoundBox(&Heat_Windows);
MOVW	R0, #lo_addr(_Heat_Windows+0)
MOVT	R0, #hi_addr(_Heat_Windows+0)
BL	_DrawRoundBox+0
;Controller_events_code.c,438 :: 		DrawRoundButton(&Heat_Setting);
MOVW	R0, #lo_addr(_Heat_Setting+0)
MOVT	R0, #hi_addr(_Heat_Setting+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,439 :: 		DrawRoundButton (& ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,440 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,441 :: 		DrawRoundButton(&heat_T);
MOVW	R0, #lo_addr(_heat_T+0)
MOVT	R0, #hi_addr(_heat_T+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,442 :: 		DrawRoundButton(&heat_dec);
MOVW	R0, #lo_addr(_heat_dec+0)
MOVT	R0, #hi_addr(_heat_dec+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,444 :: 		DrawCircle(&heat_led);
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
;Controller_events_code.c,445 :: 		DrawLabel(&heat_point);
MOVW	R0, #lo_addr(_heat_point+0)
MOVT	R0, #hi_addr(_heat_point+0)
BL	_DrawLabel+0
;Controller_events_code.c,446 :: 		DrawLabel(&heat_celc);
MOVW	R0, #lo_addr(_heat_celc+0)
MOVT	R0, #hi_addr(_heat_celc+0)
BL	_DrawLabel+0
;Controller_events_code.c,447 :: 		if ( strcmp(bar_heating.Caption,"HEATING")==0 ){ DrawImage(&heat_icon);send_data_packet(SET_HEAT,1);/*adressReg= SET_HEAT;nomReg =1;*/}
MOVW	R1, #lo_addr(?lstr30_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr30_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Heat_SettingOnClick141
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #340
SXTH	R0, R0
BL	_send_data_packet+0
IT	AL
BAL	L_Heat_SettingOnClick142
L_Heat_SettingOnClick141:
;Controller_events_code.c,448 :: 		else  {DrawImage(&cool_icon);send_data_packet(SET_COOL,1);/*adressReg= SET_COOL;nomReg =1;*/}
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
MOVS	R1, #1
MOVW	R0, #320
SXTH	R0, R0
BL	_send_data_packet+0
L_Heat_SettingOnClick142:
;Controller_events_code.c,449 :: 		}
L_Heat_SettingOnClick140:
;Controller_events_code.c,453 :: 		}
L_end_Heat_SettingOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Heat_SettingOnClick
_Click_HEAT:
;Controller_events_code.c,455 :: 		void Click_HEAT()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,457 :: 		if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 )
MOVW	R1, #lo_addr(?lstr31_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr31_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT143
;Controller_events_code.c,459 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr32_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr32_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,460 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,461 :: 		system_reg[HEAT]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
STRH	R1, [R0, #0]
;Controller_events_code.c,462 :: 		system_reg[COOL]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
STRH	R1, [R0, #0]
;Controller_events_code.c,463 :: 		UART2_Write_Text("OFF");
MOVW	R0, #lo_addr(?lstr33_Controller_events_code+0)
MOVT	R0, #hi_addr(?lstr33_Controller_events_code+0)
BL	_UART2_Write_Text+0
;Controller_events_code.c,464 :: 		}
IT	AL
BAL	L_Click_HEAT144
L_Click_HEAT143:
;Controller_events_code.c,466 :: 		{   if(strcmp(bar_heating.Caption,"HEATING")==0 ){system_reg[HEAT]=1;system_reg[COOL]=0;}
MOVW	R1, #lo_addr(?lstr34_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr34_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT145
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
BAL	L_Click_HEAT146
L_Click_HEAT145:
;Controller_events_code.c,467 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0 ){system_reg[HEAT]=0;system_reg[COOL]=1;}
MOVW	R1, #lo_addr(?lstr35_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr35_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_HEAT147
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
L_Click_HEAT147:
L_Click_HEAT146:
;Controller_events_code.c,468 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr36_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr36_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Controller_events_code.c,469 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,471 :: 		}
L_Click_HEAT144:
;Controller_events_code.c,473 :: 		send_data_packet(COOL,2);
MOVS	R1, #2
MOVW	R0, #190
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,475 :: 		}
L_end_Click_HEAT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_HEAT
_Click_DHW:
;Controller_events_code.c,476 :: 		void Click_DHW()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,479 :: 		if (strcmp(ON_OFF_DHW.Caption,"ON")==0)
MOVW	R1, #lo_addr(?lstr37_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr37_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Click_DHW148
;Controller_events_code.c,481 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr38_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr38_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,482 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,483 :: 		system_reg[HEATWATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,484 :: 		}
IT	AL
BAL	L_Click_DHW149
L_Click_DHW148:
;Controller_events_code.c,487 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr39_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr39_Controller_events_code+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Controller_events_code.c,488 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,489 :: 		system_reg[HEATWATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
STRH	R1, [R0, #0]
;Controller_events_code.c,490 :: 		}
L_Click_DHW149:
;Controller_events_code.c,492 :: 		send_data_packet(HEATWATER,1);
MOVS	R1, #1
MOVW	R0, #210
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,493 :: 		}
L_end_Click_DHW:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Click_DHW
_MainBut1OnUp:
;Controller_events_code.c,494 :: 		void MainBut1OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,495 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,496 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,497 :: 		Image25.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,498 :: 		DrawScreen(&USER_MENU);
MOVW	R0, #lo_addr(_USER_MENU+0)
MOVT	R0, #hi_addr(_USER_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,499 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,501 :: 		}
L_end_MainBut1OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnUp
_MainBut1OnPress:
;Controller_events_code.c,502 :: 		void MainBut1OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,503 :: 		Image25.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,504 :: 		DrawImage(&Image25);
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
BL	_DrawImage+0
;Controller_events_code.c,505 :: 		}
L_end_MainBut1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut1OnPress
_MainBut2OnUp:
;Controller_events_code.c,506 :: 		void MainBut2OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,507 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,508 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,509 :: 		Image40.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,510 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp465
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp464
L__MainBut2OnUp463:
;Controller_events_code.c,511 :: 		DrawScreen (&Schema2);
MOVW	R0, #lo_addr(_Schema2+0)
MOVT	R0, #hi_addr(_Schema2+0)
BL	_DrawScreen+0
;Controller_events_code.c,512 :: 		}
IT	AL
BAL	L_MainBut2OnUp153
;Controller_events_code.c,510 :: 		if (two_compressors_mode==true && ground_heat_pump == true) {
L__MainBut2OnUp465:
L__MainBut2OnUp464:
;Controller_events_code.c,513 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__MainBut2OnUp467
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp466
L__MainBut2OnUp462:
;Controller_events_code.c,514 :: 		DrawScreen (&AIR_TWO);
MOVW	R0, #lo_addr(_AIR_TWO+0)
MOVT	R0, #hi_addr(_AIR_TWO+0)
BL	_DrawScreen+0
;Controller_events_code.c,515 :: 		}
IT	AL
BAL	L_MainBut2OnUp157
;Controller_events_code.c,513 :: 		else if (two_compressors_mode==true && ground_heat_pump == false) {
L__MainBut2OnUp467:
L__MainBut2OnUp466:
;Controller_events_code.c,516 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp469
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__MainBut2OnUp468
L__MainBut2OnUp461:
;Controller_events_code.c,517 :: 		DrawScreen(&Schema1);//DrawScreen (&AIR_ONE);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,518 :: 		}
IT	AL
BAL	L_MainBut2OnUp161
;Controller_events_code.c,516 :: 		else if (two_compressors_mode==false && ground_heat_pump == false) {
L__MainBut2OnUp469:
L__MainBut2OnUp468:
;Controller_events_code.c,520 :: 		DrawScreen(&Schema1);
MOVW	R0, #lo_addr(_Schema1+0)
MOVT	R0, #hi_addr(_Schema1+0)
BL	_DrawScreen+0
;Controller_events_code.c,521 :: 		}
L_MainBut2OnUp161:
L_MainBut2OnUp157:
L_MainBut2OnUp153:
;Controller_events_code.c,523 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,525 :: 		}
L_end_MainBut2OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnUp
_MainBut2OnPress:
;Controller_events_code.c,526 :: 		void MainBut2OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,527 :: 		Image40.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,528 :: 		DrawImage(&Image40);
MOVW	R0, #lo_addr(_Image40+0)
MOVT	R0, #hi_addr(_Image40+0)
BL	_DrawImage+0
;Controller_events_code.c,530 :: 		}
L_end_MainBut2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut2OnPress
_MainBut3OnUp:
;Controller_events_code.c,531 :: 		void MainBut3OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,532 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,533 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,534 :: 		Image44.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,535 :: 		DrawScreen(&DEVICES);
MOVW	R0, #lo_addr(_DEVICES+0)
MOVT	R0, #hi_addr(_DEVICES+0)
BL	_DrawScreen+0
;Controller_events_code.c,536 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,538 :: 		}
L_end_MainBut3OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnUp
_MainBut3OnPress:
;Controller_events_code.c,539 :: 		void MainBut3OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,540 :: 		Image44.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,541 :: 		DrawImage(&Image44);
MOVW	R0, #lo_addr(_Image44+0)
MOVT	R0, #hi_addr(_Image44+0)
BL	_DrawImage+0
;Controller_events_code.c,542 :: 		}
L_end_MainBut3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut3OnPress
_MainBut4OnUp:
;Controller_events_code.c,543 :: 		void MainBut4OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,544 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,545 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,546 :: 		Image61.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,547 :: 		old_HP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_HP_pressure+0)
MOVT	R0, #hi_addr(_old_HP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,548 :: 		old_LP_pressure=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_old_LP_pressure+0)
MOVT	R0, #hi_addr(_old_LP_pressure+0)
VSTR	#1, S0, [R0, #0]
;Controller_events_code.c,549 :: 		DrawScreen(&GAUGE1);
MOVW	R0, #lo_addr(_GAUGE1+0)
MOVT	R0, #hi_addr(_GAUGE1+0)
BL	_DrawScreen+0
;Controller_events_code.c,550 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,551 :: 		}
L_end_MainBut4OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnUp
_MainBut4OnPress:
;Controller_events_code.c,552 :: 		void MainBut4OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,553 :: 		Image61.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image61+20)
MOVT	R0, #hi_addr(_Image61+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,554 :: 		DrawImage(&Image61);
MOVW	R0, #lo_addr(_Image61+0)
MOVT	R0, #hi_addr(_Image61+0)
BL	_DrawImage+0
;Controller_events_code.c,555 :: 		}
L_end_MainBut4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut4OnPress
_MainBut5OnUp:
;Controller_events_code.c,556 :: 		void MainBut5OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,557 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,558 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,559 :: 		Image87.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,560 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,561 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,562 :: 		}
L_end_MainBut5OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnUp
_MainBut5OnPress:
;Controller_events_code.c,563 :: 		void MainBut5OnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,564 :: 		Image87.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image87+20)
MOVT	R0, #hi_addr(_Image87+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,565 :: 		DrawImage(&Image87);
MOVW	R0, #lo_addr(_Image87+0)
MOVT	R0, #hi_addr(_Image87+0)
BL	_DrawImage+0
;Controller_events_code.c,566 :: 		}
L_end_MainBut5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MainBut5OnPress
_DHW_UPOnClick:
;Controller_events_code.c,567 :: 		void  DHW_UPOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,569 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,570 :: 		system_reg[SET_DHW]++;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,571 :: 		if(system_reg[SET_DHW]>system_reg[HEAT_MAX]) system_reg[SET_DHW]=system_reg[HEAT_MAX];
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L_DHW_UPOnClick162
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_UPOnClick162:
;Controller_events_code.c,572 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,573 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,574 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,575 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_UPOnClick472
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_UPOnClick471
L__DHW_UPOnClick470:
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
L__DHW_UPOnClick472:
L__DHW_UPOnClick471:
;Controller_events_code.c,576 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,577 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,578 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_DHW_UPOnClick166:
SUBS	R7, R7, #1
BNE	L_DHW_UPOnClick166
NOP
NOP
NOP
;Controller_events_code.c,579 :: 		}
L_end_DHW_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_UPOnClick
_DHW_DOWNOnClick:
;Controller_events_code.c,580 :: 		void DHW_DOWNOnClick(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,582 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,583 :: 		system_reg[SET_DHW]--;
MOVW	R2, #lo_addr(_system_reg+660)
MOVT	R2, #hi_addr(_system_reg+660)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,584 :: 		if(system_reg[SET_DHW]<system_reg[HEAT_MIN]) system_reg[SET_DHW]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_DHW_DOWNOnClick168
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
STRH	R1, [R0, #0]
L_DHW_DOWNOnClick168:
;Controller_events_code.c,585 :: 		IntToStr(system_reg[SET_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,586 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,587 :: 		strncpy(DHW_Setting_value.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW_Setting_value+16)
MOVT	R0, #hi_addr(_DHW_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,588 :: 		if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__DHW_DOWNOnClick475
MOVW	R0, #lo_addr(_system_reg+660)
MOVT	R0, #hi_addr(_system_reg+660)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__DHW_DOWNOnClick474
L__DHW_DOWNOnClick473:
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
L__DHW_DOWNOnClick475:
L__DHW_DOWNOnClick474:
;Controller_events_code.c,589 :: 		DrawBox(&Set_Dhw_Box);
MOVW	R0, #lo_addr(_Set_Dhw_Box+0)
MOVT	R0, #hi_addr(_Set_Dhw_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,590 :: 		DrawLabel (&DHW_Setting_value);
MOVW	R0, #lo_addr(_DHW_Setting_value+0)
MOVT	R0, #hi_addr(_DHW_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,591 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_DHW_DOWNOnClick172:
SUBS	R7, R7, #1
BNE	L_DHW_DOWNOnClick172
NOP
NOP
NOP
;Controller_events_code.c,593 :: 		}
L_end_DHW_DOWNOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DHW_DOWNOnClick
_HEAT_UPOnClick:
;Controller_events_code.c,594 :: 		void HEAT_UPOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,597 :: 		Tone2 ();
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
BNE	L_HEAT_UPOnClick174
;Controller_events_code.c,600 :: 		system_reg[SET_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+680)
MOVT	R1, #hi_addr(_system_reg+680)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,601 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,602 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,603 :: 		}
IT	AL
BAL	L_HEAT_UPOnClick175
L_HEAT_UPOnClick174:
;Controller_events_code.c,604 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr41_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr41_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_UPOnClick176
;Controller_events_code.c,605 :: 		system_reg[SET_COOL]++;
MOVW	R1, #lo_addr(_system_reg+640)
MOVT	R1, #hi_addr(_system_reg+640)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Controller_events_code.c,607 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
BL	_IntToStr+0
;Controller_events_code.c,608 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,609 :: 		}
L_HEAT_UPOnClick176:
L_HEAT_UPOnClick175:
;Controller_events_code.c,610 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,611 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,612 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_UPOnClick478
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_UPOnClick477
L__HEAT_UPOnClick476:
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
L__HEAT_UPOnClick478:
L__HEAT_UPOnClick477:
;Controller_events_code.c,613 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,614 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,615 :: 		}
L_end_HEAT_UPOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_UPOnClick
_HEAT_DownOnClick:
;Controller_events_code.c,616 :: 		void HEAT_DownOnClick(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Controller_events_code.c,619 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,620 :: 		if(strcmp(bar_heating.Caption,"HEATING")==0){
MOVW	R1, #lo_addr(?lstr42_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr42_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick180
;Controller_events_code.c,621 :: 		system_reg[SET_HEAT]--;
MOVW	R2, #lo_addr(_system_reg+680)
MOVT	R2, #hi_addr(_system_reg+680)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,622 :: 		if(system_reg[SET_HEAT]<system_reg[HEAT_MIN]) system_reg[SET_HEAT]=system_reg[HEAT_MIN];
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick181
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick181:
;Controller_events_code.c,623 :: 		IntToStr(system_reg[SET_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,624 :: 		f= system_reg[SET_HEAT];
MOVW	R0, #lo_addr(_system_reg+680)
MOVT	R0, #hi_addr(_system_reg+680)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,625 :: 		}
IT	AL
BAL	L_HEAT_DownOnClick182
L_HEAT_DownOnClick180:
;Controller_events_code.c,626 :: 		else if(strcmp(bar_heating.Caption,"COOLING")==0){
MOVW	R1, #lo_addr(?lstr43_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr43_Controller_events_code+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
LDR	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_HEAT_DownOnClick183
;Controller_events_code.c,627 :: 		system_reg[SET_COOL]--;
MOVW	R2, #lo_addr(_system_reg+640)
MOVT	R2, #hi_addr(_system_reg+640)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,628 :: 		if(system_reg[SET_COOL]<system_reg[COOL_MIN]) system_reg[SET_COOL]=system_reg[COOL_MIN];
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_HEAT_DownOnClick184
MOVW	R0, #lo_addr(_system_reg+140)
MOVT	R0, #hi_addr(_system_reg+140)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
STRH	R1, [R0, #0]
L_HEAT_DownOnClick184:
;Controller_events_code.c,629 :: 		IntToStr(system_reg[SET_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,630 :: 		f= system_reg[SET_COOL];
MOVW	R0, #lo_addr(_system_reg+640)
MOVT	R0, #hi_addr(_system_reg+640)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #12]
;Controller_events_code.c,631 :: 		}
L_HEAT_DownOnClick183:
L_HEAT_DownOnClick182:
;Controller_events_code.c,632 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,633 :: 		strncpy(TEMP_Setting_value.Caption , txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TEMP_Setting_value+16)
MOVT	R0, #hi_addr(_TEMP_Setting_value+16)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,634 :: 		if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
LDRSH	R0, [SP, #12]
CMP	R0, #10
IT	GE
BGE	L__HEAT_DownOnClick481
LDRSH	R0, [SP, #12]
CMP	R0, #0
IT	LT
BLT	L__HEAT_DownOnClick480
L__HEAT_DownOnClick479:
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
L__HEAT_DownOnClick481:
L__HEAT_DownOnClick480:
;Controller_events_code.c,635 :: 		DrawBox(&Set_Heat_Box);
MOVW	R0, #lo_addr(_Set_Heat_Box+0)
MOVT	R0, #hi_addr(_Set_Heat_Box+0)
BL	_DrawBox+0
;Controller_events_code.c,636 :: 		DrawLabel (&TEMP_Setting_value);
MOVW	R0, #lo_addr(_TEMP_Setting_value+0)
MOVT	R0, #hi_addr(_TEMP_Setting_value+0)
BL	_DrawLabel+0
;Controller_events_code.c,638 :: 		}
L_end_HEAT_DownOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _HEAT_DownOnClick
_user_settingOnUp:
;Controller_events_code.c,640 :: 		void user_settingOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,641 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,642 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,643 :: 		Image105.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,644 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,645 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,646 :: 		}
L_end_user_settingOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnUp
_user_settingOnPress:
;Controller_events_code.c,647 :: 		void  user_settingOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,648 :: 		Image105.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image105+20)
MOVT	R0, #hi_addr(_Image105+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,649 :: 		DrawImage(&Image105);
MOVW	R0, #lo_addr(_Image105+0)
MOVT	R0, #hi_addr(_Image105+0)
BL	_DrawImage+0
;Controller_events_code.c,650 :: 		}
L_end_user_settingOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_settingOnPress
_user_set_timeOnPress:
;Controller_events_code.c,651 :: 		void user_set_timeOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,652 :: 		Image39.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,653 :: 		DrawImage(&Image39);
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
BL	_DrawImage+0
;Controller_events_code.c,654 :: 		}
L_end_user_set_timeOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnPress
_user_set_timeOnUp:
;Controller_events_code.c,655 :: 		void user_set_timeOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,656 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,657 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,658 :: 		Image39.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,660 :: 		DrawScreen(&SetRTC);
MOVW	R0, #lo_addr(_SetRTC+0)
MOVT	R0, #hi_addr(_SetRTC+0)
BL	_DrawScreen+0
;Controller_events_code.c,661 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,662 :: 		}
L_end_user_set_timeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timeOnUp
_user_check_temperatureOnPress:
;Controller_events_code.c,664 :: 		void user_check_temperatureOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,665 :: 		Image48.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,666 :: 		DrawImage(&Image48);
MOVW	R0, #lo_addr(_Image48+0)
MOVT	R0, #hi_addr(_Image48+0)
BL	_DrawImage+0
;Controller_events_code.c,667 :: 		}
L_end_user_check_temperatureOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnPress
_user_check_temperatureOnUp:
;Controller_events_code.c,668 :: 		void user_check_temperatureOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,669 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,670 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,671 :: 		Image48.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,672 :: 		strcpy(S_Brine_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr44_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr44_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,673 :: 		strcpy(S_Brine_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr45_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr45_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,674 :: 		strcpy(S_Heat_Inlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr46_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr46_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,675 :: 		strcpy(S_Heat_Outlet_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr47_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr47_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,676 :: 		strcpy(S_Compressor_1.Caption ,"000");
MOVW	R1, #lo_addr(?lstr48_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr48_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Compressor_1+24)
MOVT	R0, #hi_addr(_S_Compressor_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,677 :: 		strcpy(S_Superheat_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr49_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr49_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Superheat_1+24)
MOVT	R0, #hi_addr(_S_Superheat_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,678 :: 		strcpy( S_Subcool_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr50_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr50_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Subcool_1+24)
MOVT	R0, #hi_addr(_S_Subcool_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,679 :: 		strcpy(S_DHW.Caption,"00");
MOVW	R1, #lo_addr(?lstr51_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr51_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_DHW+24)
MOVT	R0, #hi_addr(_S_DHW+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,680 :: 		strcpy(SS_tank.Caption,"00");
MOVW	R1, #lo_addr(?lstr52_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr52_Controller_events_code+0)
MOVW	R0, #lo_addr(_SS_tank+24)
MOVT	R0, #hi_addr(_SS_tank+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,681 :: 		strcpy(S_condenser_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr53_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr53_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_condenser_1+24)
MOVT	R0, #hi_addr(_S_condenser_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,682 :: 		strcpy(S_High_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr54_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr54_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_High_Pressure_1+24)
MOVT	R0, #hi_addr(_S_High_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,683 :: 		strcpy(S_Low_Pressure_1.Caption,"00");
MOVW	R1, #lo_addr(?lstr55_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr55_Controller_events_code+0)
MOVW	R0, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,684 :: 		DrawScreen(&SENSOR1);
MOVW	R0, #lo_addr(_SENSOR1+0)
MOVT	R0, #hi_addr(_SENSOR1+0)
BL	_DrawScreen+0
;Controller_events_code.c,685 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,686 :: 		}
L_end_user_check_temperatureOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_temperatureOnUp
_user_set_LANOnPress:
;Controller_events_code.c,687 :: 		void user_set_LANOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,688 :: 		Image49.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,689 :: 		DrawImage(&Image49);
MOVW	R0, #lo_addr(_Image49+0)
MOVT	R0, #hi_addr(_Image49+0)
BL	_DrawImage+0
;Controller_events_code.c,690 :: 		}
L_end_user_set_LANOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnPress
_user_set_LANOnUp:
;Controller_events_code.c,691 :: 		void user_set_LANOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,692 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,693 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,694 :: 		Image49.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,695 :: 		DrawScreen(&Ethernet);
MOVW	R0, #lo_addr(_Ethernet+0)
MOVT	R0, #hi_addr(_Ethernet+0)
BL	_DrawScreen+0
;Controller_events_code.c,696 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,697 :: 		}
L_end_user_set_LANOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_LANOnUp
_user_check_errorsOnPress:
;Controller_events_code.c,698 :: 		void user_check_errorsOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,699 :: 		Image50.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,700 :: 		DrawImage(&Image50);
MOVW	R0, #lo_addr(_Image50+0)
MOVT	R0, #hi_addr(_Image50+0)
BL	_DrawImage+0
;Controller_events_code.c,701 :: 		}
L_end_user_check_errorsOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnPress
_user_check_errorsOnUp:
;Controller_events_code.c,702 :: 		void user_check_errorsOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,703 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,704 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,705 :: 		Image50.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,706 :: 		DrawScreen(&ERRORS);
MOVW	R0, #lo_addr(_ERRORS+0)
MOVT	R0, #hi_addr(_ERRORS+0)
BL	_DrawScreen+0
;Controller_events_code.c,707 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,708 :: 		}
L_end_user_check_errorsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_check_errorsOnUp
_user_set_timersOnPress:
;Controller_events_code.c,709 :: 		void user_set_timersOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,710 :: 		Image51.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,711 :: 		DrawImage(&Image51);
MOVW	R0, #lo_addr(_Image51+0)
MOVT	R0, #hi_addr(_Image51+0)
BL	_DrawImage+0
;Controller_events_code.c,712 :: 		}
L_end_user_set_timersOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnPress
_user_set_timersOnUp:
;Controller_events_code.c,713 :: 		void user_set_timersOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,714 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,715 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,716 :: 		Image51.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,717 :: 		DrawScreen(&TIMERS);
MOVW	R0, #lo_addr(_TIMERS+0)
MOVT	R0, #hi_addr(_TIMERS+0)
BL	_DrawScreen+0
;Controller_events_code.c,718 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,719 :: 		}
L_end_user_set_timersOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_set_timersOnUp
_user_hysterezisOnPress:
;Controller_events_code.c,720 :: 		void user_hysterezisOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,721 :: 		Image60.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,722 :: 		DrawImage(&Image60);
MOVW	R0, #lo_addr(_Image60+0)
MOVT	R0, #hi_addr(_Image60+0)
BL	_DrawImage+0
;Controller_events_code.c,723 :: 		}
L_end_user_hysterezisOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnPress
_user_hysterezisOnUp:
;Controller_events_code.c,724 :: 		void user_hysterezisOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,725 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,726 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,727 :: 		Image60.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image60+20)
MOVT	R0, #hi_addr(_Image60+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,728 :: 		DrawScreen(&SETTINGS);
MOVW	R0, #lo_addr(_SETTINGS+0)
MOVT	R0, #hi_addr(_SETTINGS+0)
BL	_DrawScreen+0
;Controller_events_code.c,729 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,730 :: 		}
L_end_user_hysterezisOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_hysterezisOnUp
_User_history_checkOnPress:
;Controller_events_code.c,731 :: 		void User_history_checkOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,732 :: 		Image52.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,733 :: 		DrawImage(&Image52);
MOVW	R0, #lo_addr(_Image52+0)
MOVT	R0, #hi_addr(_Image52+0)
BL	_DrawImage+0
;Controller_events_code.c,734 :: 		}
L_end_User_history_checkOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnPress
_User_history_checkOnUp:
;Controller_events_code.c,735 :: 		void User_history_checkOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,736 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,737 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,738 :: 		Image52.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,739 :: 		DrawScreen(&EVENTS);
MOVW	R0, #lo_addr(_EVENTS+0)
MOVT	R0, #hi_addr(_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,740 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,741 :: 		}
L_end_User_history_checkOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _User_history_checkOnUp
_user_energyOnUp:
;Controller_events_code.c,743 :: 		void user_energyOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,744 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,745 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,746 :: 		Image54.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,747 :: 		DrawScreen(&ENERGY);
MOVW	R0, #lo_addr(_ENERGY+0)
MOVT	R0, #hi_addr(_ENERGY+0)
BL	_DrawScreen+0
;Controller_events_code.c,748 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,749 :: 		}
L_end_user_energyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnUp
_user_energyOnPress:
;Controller_events_code.c,750 :: 		void user_energyOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,751 :: 		Image54.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,752 :: 		DrawImage(&Image54);
MOVW	R0, #lo_addr(_Image54+0)
MOVT	R0, #hi_addr(_Image54+0)
BL	_DrawImage+0
;Controller_events_code.c,753 :: 		}
L_end_user_energyOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_energyOnPress
_admin_set_systemOnUp:
;Controller_events_code.c,754 :: 		void admin_set_systemOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,755 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,756 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,757 :: 		Image55.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,759 :: 		DrawScreen (&SYSTEM_SET);
MOVW	R0, #lo_addr(_SYSTEM_SET+0)
MOVT	R0, #hi_addr(_SYSTEM_SET+0)
BL	_DrawScreen+0
;Controller_events_code.c,760 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,761 :: 		}
L_end_admin_set_systemOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnUp
_admin_set_systemOnPress:
;Controller_events_code.c,762 :: 		void  admin_set_systemOnPress (){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,763 :: 		Image55.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,764 :: 		DrawImage(&Image55);
MOVW	R0, #lo_addr(_Image55+0)
MOVT	R0, #hi_addr(_Image55+0)
BL	_DrawImage+0
;Controller_events_code.c,765 :: 		}
L_end_admin_set_systemOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _admin_set_systemOnPress
_furnanceUP:
;Controller_events_code.c,766 :: 		void furnanceUP(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,767 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,768 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,769 :: 		Image56.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,770 :: 		DrawScreen(&FURNANCE);
MOVW	R0, #lo_addr(_FURNANCE+0)
MOVT	R0, #hi_addr(_FURNANCE+0)
BL	_DrawScreen+0
;Controller_events_code.c,771 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,772 :: 		}
L_end_furnanceUP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceUP
_furnanceDown:
;Controller_events_code.c,773 :: 		void furnanceDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,774 :: 		Image56.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image56+20)
MOVT	R0, #hi_addr(_Image56+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,775 :: 		DrawImage(&Image56);
MOVW	R0, #lo_addr(_Image56+0)
MOVT	R0, #hi_addr(_Image56+0)
BL	_DrawImage+0
;Controller_events_code.c,776 :: 		}
L_end_furnanceDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _furnanceDown
_user_defrostOnUp:
;Controller_events_code.c,777 :: 		void user_defrostOnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,778 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,779 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,780 :: 		Image57.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,781 :: 		DrawScreen(&DEFROST);
MOVW	R0, #lo_addr(_DEFROST+0)
MOVT	R0, #hi_addr(_DEFROST+0)
BL	_DrawScreen+0
;Controller_events_code.c,782 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,783 :: 		}
L_end_user_defrostOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnUp
_user_defrostOnPress:
;Controller_events_code.c,784 :: 		void user_defrostOnPress(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,785 :: 		Image57.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image57+20)
MOVT	R0, #hi_addr(_Image57+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,786 :: 		DrawImage(&Image57);
MOVW	R0, #lo_addr(_Image57+0)
MOVT	R0, #hi_addr(_Image57+0)
BL	_DrawImage+0
;Controller_events_code.c,787 :: 		}
L_end_user_defrostOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _user_defrostOnPress
_DEC_EEV1OnPress:
;Controller_events_code.c,839 :: 		void DEC_EEV1OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,841 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,842 :: 		incTRV--;
MOVW	R1, #lo_addr(_incTRV+0)
MOVT	R1, #hi_addr(_incTRV+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,844 :: 		if(incTRV<0)incTRV=0;
CMP	R0, #0
IT	GE
BGE	L_DEC_EEV1OnPress188
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
STRH	R1, [R0, #0]
L_DEC_EEV1OnPress188:
;Controller_events_code.c,845 :: 		IntToStr(incTRV, txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,846 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,847 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,855 :: 		Delay_ms (50);
MOVW	R7, #9630
MOVT	R7, #38
NOP
NOP
L_DEC_EEV1OnPress189:
SUBS	R7, R7, #1
BNE	L_DEC_EEV1OnPress189
NOP
NOP
NOP
;Controller_events_code.c,857 :: 		}
L_end_DEC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DEC_EEV1OnPress
_INC_EEV1OnPress:
;Controller_events_code.c,858 :: 		void INC_EEV1OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,861 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,862 :: 		incTRV++;
MOVW	R1, #lo_addr(_incTRV+0)
MOVT	R1, #hi_addr(_incTRV+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,864 :: 		if(incTRV>240)incTRV=240;
CMP	R0, #240
IT	LE
BLE	L_INC_EEV1OnPress191
MOVS	R1, #240
SXTH	R1, R1
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
STRH	R1, [R0, #0]
L_INC_EEV1OnPress191:
;Controller_events_code.c,865 :: 		IntToStr(incTRV, txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
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
;Controller_events_code.c,871 :: 		Delay_ms (50);
MOVW	R7, #9630
MOVT	R7, #38
NOP
NOP
L_INC_EEV1OnPress192:
SUBS	R7, R7, #1
BNE	L_INC_EEV1OnPress192
NOP
NOP
NOP
;Controller_events_code.c,873 :: 		}
L_end_INC_EEV1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _INC_EEV1OnPress
_Set_Trv:
;Controller_events_code.c,875 :: 		void Set_Trv() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,876 :: 		if(num_page==0)
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Set_Trv194
;Controller_events_code.c,878 :: 		system_reg[TRV_CORRECT_1]= incTRV;
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+782)
MOVT	R0, #hi_addr(_system_reg+782)
STRH	R1, [R0, #0]
;Controller_events_code.c,879 :: 		send_data_packet(TRV_CORRECT_1,1);
MOVS	R1, #1
MOVW	R0, #391
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,880 :: 		}
IT	AL
BAL	L_Set_Trv195
L_Set_Trv194:
;Controller_events_code.c,882 :: 		system_reg[TRV_CORRECT_2]= incTRV;
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+784)
MOVT	R0, #hi_addr(_system_reg+784)
STRH	R1, [R0, #0]
;Controller_events_code.c,883 :: 		send_data_packet(TRV_CORRECT_2,1);
MOVS	R1, #1
MOVW	R0, #392
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,884 :: 		}
L_Set_Trv195:
;Controller_events_code.c,885 :: 		}
L_end_Set_Trv:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Trv
__1OnClick:
;Controller_events_code.c,888 :: 		void _1OnClick() {
;Controller_events_code.c,890 :: 		}
L_end__1OnClick:
BX	LR
; end of __1OnClick
__2OnClick:
;Controller_events_code.c,892 :: 		void _2OnClick() {
;Controller_events_code.c,894 :: 		}
L_end__2OnClick:
BX	LR
; end of __2OnClick
__3OnClick:
;Controller_events_code.c,896 :: 		void _3OnClick() {
;Controller_events_code.c,898 :: 		}
L_end__3OnClick:
BX	LR
; end of __3OnClick
__4OnClick:
;Controller_events_code.c,900 :: 		void _4OnClick() {
;Controller_events_code.c,902 :: 		}
L_end__4OnClick:
BX	LR
; end of __4OnClick
__5OnClick:
;Controller_events_code.c,904 :: 		void _5OnClick() {
;Controller_events_code.c,906 :: 		}
L_end__5OnClick:
BX	LR
; end of __5OnClick
__6OnClick:
;Controller_events_code.c,908 :: 		void _6OnClick() {
;Controller_events_code.c,910 :: 		}
L_end__6OnClick:
BX	LR
; end of __6OnClick
__7OnClick:
;Controller_events_code.c,912 :: 		void _7OnClick() {
;Controller_events_code.c,914 :: 		}
L_end__7OnClick:
BX	LR
; end of __7OnClick
__8OnClick:
;Controller_events_code.c,916 :: 		void _8OnClick() {
;Controller_events_code.c,918 :: 		}
L_end__8OnClick:
BX	LR
; end of __8OnClick
__9OnClick:
;Controller_events_code.c,920 :: 		void _9OnClick() {
;Controller_events_code.c,922 :: 		}
L_end__9OnClick:
BX	LR
; end of __9OnClick
__0OnClick:
;Controller_events_code.c,924 :: 		void _0OnClick() {
;Controller_events_code.c,926 :: 		}
L_end__0OnClick:
BX	LR
; end of __0OnClick
__QOnClick:
;Controller_events_code.c,928 :: 		void _QOnClick() {
;Controller_events_code.c,930 :: 		}
L_end__QOnClick:
BX	LR
; end of __QOnClick
__WOnClick:
;Controller_events_code.c,932 :: 		void _WOnClick() {
;Controller_events_code.c,934 :: 		}
L_end__WOnClick:
BX	LR
; end of __WOnClick
__EOnClick:
;Controller_events_code.c,936 :: 		void _EOnClick() {
;Controller_events_code.c,938 :: 		}
L_end__EOnClick:
BX	LR
; end of __EOnClick
__ROnClick:
;Controller_events_code.c,940 :: 		void _ROnClick() {
;Controller_events_code.c,942 :: 		}
L_end__ROnClick:
BX	LR
; end of __ROnClick
__TOnClick:
;Controller_events_code.c,944 :: 		void _TOnClick() {
;Controller_events_code.c,946 :: 		}
L_end__TOnClick:
BX	LR
; end of __TOnClick
__YOnClick:
;Controller_events_code.c,948 :: 		void _YOnClick() {
;Controller_events_code.c,950 :: 		}
L_end__YOnClick:
BX	LR
; end of __YOnClick
__UOnClick:
;Controller_events_code.c,952 :: 		void _UOnClick() {
;Controller_events_code.c,954 :: 		}
L_end__UOnClick:
BX	LR
; end of __UOnClick
__IOnClick:
;Controller_events_code.c,956 :: 		void _IOnClick() {
;Controller_events_code.c,958 :: 		}
L_end__IOnClick:
BX	LR
; end of __IOnClick
__OOnClick:
;Controller_events_code.c,960 :: 		void _OOnClick() {
;Controller_events_code.c,962 :: 		}
L_end__OOnClick:
BX	LR
; end of __OOnClick
__POnClick:
;Controller_events_code.c,964 :: 		void _POnClick() {
;Controller_events_code.c,966 :: 		}
L_end__POnClick:
BX	LR
; end of __POnClick
__AOnClick:
;Controller_events_code.c,968 :: 		void _AOnClick() {
;Controller_events_code.c,970 :: 		}
L_end__AOnClick:
BX	LR
; end of __AOnClick
__SOnClick:
;Controller_events_code.c,972 :: 		void _SOnClick() {
;Controller_events_code.c,974 :: 		}
L_end__SOnClick:
BX	LR
; end of __SOnClick
__DOnClick:
;Controller_events_code.c,976 :: 		void _DOnClick() {
;Controller_events_code.c,978 :: 		}
L_end__DOnClick:
BX	LR
; end of __DOnClick
__FOnClick:
;Controller_events_code.c,980 :: 		void _FOnClick() {
;Controller_events_code.c,982 :: 		}
L_end__FOnClick:
BX	LR
; end of __FOnClick
__GOnClick:
;Controller_events_code.c,984 :: 		void _GOnClick() {
;Controller_events_code.c,986 :: 		}
L_end__GOnClick:
BX	LR
; end of __GOnClick
__HOnClick:
;Controller_events_code.c,988 :: 		void _HOnClick() {
;Controller_events_code.c,990 :: 		}
L_end__HOnClick:
BX	LR
; end of __HOnClick
__JOnClick:
;Controller_events_code.c,992 :: 		void _JOnClick() {
;Controller_events_code.c,994 :: 		}
L_end__JOnClick:
BX	LR
; end of __JOnClick
__KOnClick:
;Controller_events_code.c,996 :: 		void _KOnClick() {
;Controller_events_code.c,998 :: 		}
L_end__KOnClick:
BX	LR
; end of __KOnClick
__LOnClick:
;Controller_events_code.c,1000 :: 		void _LOnClick() {
;Controller_events_code.c,1002 :: 		}
L_end__LOnClick:
BX	LR
; end of __LOnClick
__ZOnClick:
;Controller_events_code.c,1004 :: 		void _ZOnClick() {
;Controller_events_code.c,1006 :: 		}
L_end__ZOnClick:
BX	LR
; end of __ZOnClick
__XOnClick:
;Controller_events_code.c,1008 :: 		void _XOnClick() {
;Controller_events_code.c,1010 :: 		}
L_end__XOnClick:
BX	LR
; end of __XOnClick
__COnClick:
;Controller_events_code.c,1012 :: 		void _COnClick() {
;Controller_events_code.c,1014 :: 		}
L_end__COnClick:
BX	LR
; end of __COnClick
__VOnClick:
;Controller_events_code.c,1016 :: 		void _VOnClick() {
;Controller_events_code.c,1018 :: 		}
L_end__VOnClick:
BX	LR
; end of __VOnClick
__BOnClick:
;Controller_events_code.c,1020 :: 		void _BOnClick() {
;Controller_events_code.c,1022 :: 		}
L_end__BOnClick:
BX	LR
; end of __BOnClick
__NOnClick:
;Controller_events_code.c,1024 :: 		void _NOnClick() {
;Controller_events_code.c,1026 :: 		}
L_end__NOnClick:
BX	LR
; end of __NOnClick
__MOnClick:
;Controller_events_code.c,1028 :: 		void _MOnClick() {
;Controller_events_code.c,1030 :: 		}
L_end__MOnClick:
BX	LR
; end of __MOnClick
__CommaOnClick:
;Controller_events_code.c,1032 :: 		void _CommaOnClick() {
;Controller_events_code.c,1034 :: 		}
L_end__CommaOnClick:
BX	LR
; end of __CommaOnClick
__ColonOnClick:
;Controller_events_code.c,1036 :: 		void _ColonOnClick() {
;Controller_events_code.c,1038 :: 		}
L_end__ColonOnClick:
BX	LR
; end of __ColonOnClick
__SlashOnClick:
;Controller_events_code.c,1040 :: 		void _SlashOnClick() {
;Controller_events_code.c,1042 :: 		}
L_end__SlashOnClick:
BX	LR
; end of __SlashOnClick
__DELOnClick:
;Controller_events_code.c,1044 :: 		void _DELOnClick() {
;Controller_events_code.c,1046 :: 		}
L_end__DELOnClick:
BX	LR
; end of __DELOnClick
_ClearOnPress:
;Controller_events_code.c,1048 :: 		void ClearOnPress() {
;Controller_events_code.c,1050 :: 		}
L_end_ClearOnPress:
BX	LR
; end of _ClearOnPress
_CAPS_SwitchOnClick:
;Controller_events_code.c,1052 :: 		void CAPS_SwitchOnClick() {
;Controller_events_code.c,1054 :: 		}
L_end_CAPS_SwitchOnClick:
BX	LR
; end of _CAPS_SwitchOnClick
_SPACEOnClick:
;Controller_events_code.c,1056 :: 		void SPACEOnClick() {
;Controller_events_code.c,1058 :: 		}
L_end_SPACEOnClick:
BX	LR
; end of _SPACEOnClick
_ENTEROnClick:
;Controller_events_code.c,1060 :: 		void ENTEROnClick() {
;Controller_events_code.c,1062 :: 		}
L_end_ENTEROnClick:
BX	LR
; end of _ENTEROnClick
_SetDateAndTimeOnClick:
;Controller_events_code.c,1064 :: 		void SetDateAndTimeOnClick(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1067 :: 		My_Date.RTC_Date_Tens     = tenDayU;
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Date+1)
MOVT	R0, #hi_addr(_My_Date+1)
STRB	R1, [R0, #0]
;Controller_events_code.c,1068 :: 		My_Date.RTC_Date_Units    = oneDayU;
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Date+2)
MOVT	R0, #hi_addr(_My_Date+2)
STRB	R1, [R0, #0]
;Controller_events_code.c,1069 :: 		My_Date.RTC_Month_Tens    = oneMonth/10;
MOVW	R2, #lo_addr(_oneMonth+0)
MOVT	R2, #hi_addr(_oneMonth+0)
LDRB	R1, [R2, #0]
MOVS	R0, #10
UDIV	R1, R1, R0
MOVW	R0, #lo_addr(_My_Date+3)
MOVT	R0, #hi_addr(_My_Date+3)
STRB	R1, [R0, #0]
;Controller_events_code.c,1070 :: 		My_Date.RTC_Month_Units   = oneMonth%10;
MOV	R0, R2
LDRB	R2, [R0, #0]
MOVS	R0, #10
UDIV	R1, R2, R0
MLS	R1, R0, R1, R2
MOVW	R0, #lo_addr(_My_Date+4)
MOVT	R0, #hi_addr(_My_Date+4)
STRB	R1, [R0, #0]
;Controller_events_code.c,1071 :: 		My_Date.RTC_Year_Tens     = oneYearU;
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Date+5)
MOVT	R0, #hi_addr(_My_Date+5)
STRB	R1, [R0, #0]
;Controller_events_code.c,1072 :: 		My_Date.RTC_Year_Units    = tenYearU;
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Date+6)
MOVT	R0, #hi_addr(_My_Date+6)
STRB	R1, [R0, #0]
;Controller_events_code.c,1076 :: 		My_Time.RTC_Hour_Tens     = tenHour;
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Time+0)
MOVT	R0, #hi_addr(_My_Time+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,1077 :: 		My_Time.RTC_Hour_Units    = oneHour;
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Time+1)
MOVT	R0, #hi_addr(_My_Time+1)
STRB	R1, [R0, #0]
;Controller_events_code.c,1078 :: 		My_Time.RTC_Min_Tens      = tenMinute;
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Time+2)
MOVT	R0, #hi_addr(_My_Time+2)
STRB	R1, [R0, #0]
;Controller_events_code.c,1079 :: 		My_Time.RTC_Min_Units     = oneMinute;
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_My_Time+3)
MOVT	R0, #hi_addr(_My_Time+3)
STRB	R1, [R0, #0]
;Controller_events_code.c,1083 :: 		RTC_SetTime(&My_Time, -37);
MOVW	R1, #65499
SXTH	R1, R1
MOVW	R0, #lo_addr(_My_Time+0)
MOVT	R0, #hi_addr(_My_Time+0)
BL	_RTC_SetTime+0
;Controller_events_code.c,1084 :: 		RTC_SetDate(&My_Date);
MOVW	R0, #lo_addr(_My_Date+0)
MOVT	R0, #hi_addr(_My_Date+0)
BL	_RTC_SetDate+0
;Controller_events_code.c,1085 :: 		}
L_end_SetDateAndTimeOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SetDateAndTimeOnClick
_OneYearUpOnClick:
;Controller_events_code.c,1086 :: 		void OneYearUpOnClick(){
;Controller_events_code.c,1088 :: 		}
L_end_OneYearUpOnClick:
BX	LR
; end of _OneYearUpOnClick
_OneYearDwnOnClick:
;Controller_events_code.c,1089 :: 		void OneYearDwnOnClick(){
;Controller_events_code.c,1091 :: 		}
L_end_OneYearDwnOnClick:
BX	LR
; end of _OneYearDwnOnClick
_OneYearUpOnUp:
;Controller_events_code.c,1092 :: 		void OneYearUpOnUp(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1096 :: 		oneYearU++;
MOVW	R1, #lo_addr(_oneYearU+0)
MOVT	R1, #hi_addr(_oneYearU+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1097 :: 		if (oneYearU > 9)oneYearU=0;
CMP	R0, #9
IT	LS
BLS	L_OneYearUpOnUp196
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
STRB	R1, [R0, #0]
L_OneYearUpOnUp196:
;Controller_events_code.c,1098 :: 		ByteToStr(oneYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1099 :: 		res=Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1100 :: 		strcpy(Button1.Caption,res );
MOVW	R1, #lo_addr(_Button1+24)
MOVT	R1, #hi_addr(_Button1+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1101 :: 		DrawButton(&Button1);
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
BL	_DrawButton+0
;Controller_events_code.c,1102 :: 		}
L_end_OneYearUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearUpOnUp
_OneYearUpOnPress:
;Controller_events_code.c,1103 :: 		void OneYearUpOnPress(){
;Controller_events_code.c,1105 :: 		}
L_end_OneYearUpOnPress:
BX	LR
; end of _OneYearUpOnPress
_OneYearDwnOnUp:
;Controller_events_code.c,1106 :: 		void OneYearDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1109 :: 		oneYearU--;
MOVW	R1, #lo_addr(_oneYearU+0)
MOVT	R1, #hi_addr(_oneYearU+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1110 :: 		if (oneYearU >9)oneYearU=0;
CMP	R0, #9
IT	LS
BLS	L_OneYearDwnOnUp197
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
STRB	R1, [R0, #0]
L_OneYearDwnOnUp197:
;Controller_events_code.c,1111 :: 		ByteToStr(tenYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1112 :: 		res = Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1113 :: 		strcpy(Button1.Caption, res);
MOVW	R1, #lo_addr(_Button1+24)
MOVT	R1, #hi_addr(_Button1+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1114 :: 		DrawButton(&Button1);
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
BL	_DrawButton+0
;Controller_events_code.c,1115 :: 		}
L_end_OneYearDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneYearDwnOnUp
_OneYearDwnOnPress:
;Controller_events_code.c,1116 :: 		void OneYearDwnOnPress() {
;Controller_events_code.c,1118 :: 		}
L_end_OneYearDwnOnPress:
BX	LR
; end of _OneYearDwnOnPress
_TenYearUpOnClick:
;Controller_events_code.c,1120 :: 		void TenYearUpOnClick() {
;Controller_events_code.c,1122 :: 		}
L_end_TenYearUpOnClick:
BX	LR
; end of _TenYearUpOnClick
_TenYearDwnOnClick:
;Controller_events_code.c,1123 :: 		void TenYearDwnOnClick() {
;Controller_events_code.c,1125 :: 		}
L_end_TenYearDwnOnClick:
BX	LR
; end of _TenYearDwnOnClick
_TenYearUpOnUp:
;Controller_events_code.c,1126 :: 		void TenYearUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1129 :: 		tenYearU++;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1130 :: 		if (tenYearU > 9)tenYearU=0;
CMP	R0, #9
IT	LS
BLS	L_TenYearUpOnUp198
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_TenYearUpOnUp198:
;Controller_events_code.c,1131 :: 		ByteToStr(tenYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1132 :: 		res =Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1133 :: 		strcpy(Button3.Caption,res);
MOVW	R1, #lo_addr(_Button3+24)
MOVT	R1, #hi_addr(_Button3+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1134 :: 		DrawButton(&Button3);
MOVW	R0, #lo_addr(_Button3+0)
MOVT	R0, #hi_addr(_Button3+0)
BL	_DrawButton+0
;Controller_events_code.c,1135 :: 		}
L_end_TenYearUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenYearUpOnUp
_TenYearDwnOnUp:
;Controller_events_code.c,1136 :: 		void TenYearDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1139 :: 		tenYearU--;
MOVW	R1, #lo_addr(_tenYearU+0)
MOVT	R1, #hi_addr(_tenYearU+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1140 :: 		if (tenYearU > 9)tenYearU=0;
CMP	R0, #9
IT	LS
BLS	L_TenYearDwnOnUp199
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
STRB	R1, [R0, #0]
L_TenYearDwnOnUp199:
;Controller_events_code.c,1141 :: 		ByteToStr(tenYearU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1142 :: 		res =  Ltrim(txt);
ADD	R0, SP, #8
BL	_Ltrim+0
;Controller_events_code.c,1143 :: 		strcpy(Button3.Caption,res);
MOVW	R1, #lo_addr(_Button3+24)
MOVT	R1, #hi_addr(_Button3+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1144 :: 		DrawButton(&Button3);
MOVW	R0, #lo_addr(_Button3+0)
MOVT	R0, #hi_addr(_Button3+0)
BL	_DrawButton+0
;Controller_events_code.c,1145 :: 		}
L_end_TenYearDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenYearDwnOnUp
_TenYearDwnOnPress:
;Controller_events_code.c,1146 :: 		void TenYearDwnOnPress() {
;Controller_events_code.c,1147 :: 		}
L_end_TenYearDwnOnPress:
BX	LR
; end of _TenYearDwnOnPress
_TenYearUpOnPress:
;Controller_events_code.c,1148 :: 		void TenYearUpOnPress() {
;Controller_events_code.c,1150 :: 		}
L_end_TenYearUpOnPress:
BX	LR
; end of _TenYearUpOnPress
_MonthDateUpOnClick:
;Controller_events_code.c,1152 :: 		void MonthDateUpOnClick() {
;Controller_events_code.c,1154 :: 		}
L_end_MonthDateUpOnClick:
BX	LR
; end of _MonthDateUpOnClick
_MonthDateUpOnUp:
;Controller_events_code.c,1155 :: 		void MonthDateUpOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1158 :: 		oneMonth++;
MOVW	R1, #lo_addr(_oneMonth+0)
MOVT	R1, #hi_addr(_oneMonth+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1159 :: 		if (oneMonth > 12)oneMonth=1;
CMP	R0, #12
IT	LS
BLS	L_MonthDateUpOnUp200
MOVS	R1, #1
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
STRB	R1, [R0, #0]
L_MonthDateUpOnUp200:
;Controller_events_code.c,1160 :: 		switch (oneMonth)  {
IT	AL
BAL	L_MonthDateUpOnUp201
;Controller_events_code.c,1161 :: 		case 1 :  strcpy(Button4.Caption,"JAN");break;
L_MonthDateUpOnUp203:
MOVW	R1, #lo_addr(?lstr56_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr56_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1162 :: 		case 2 :  strcpy(Button4.Caption,"FAB");break;
L_MonthDateUpOnUp204:
MOVW	R1, #lo_addr(?lstr57_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr57_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1163 :: 		case 3 :  strcpy(Button4.Caption,"MAR");break;
L_MonthDateUpOnUp205:
MOVW	R1, #lo_addr(?lstr58_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr58_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1164 :: 		case 4 :  strcpy(Button4.Caption,"APR");break;
L_MonthDateUpOnUp206:
MOVW	R1, #lo_addr(?lstr59_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr59_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1165 :: 		case 5 :  strcpy(Button4.Caption,"MAY");break;
L_MonthDateUpOnUp207:
MOVW	R1, #lo_addr(?lstr60_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr60_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1166 :: 		case 6 :  strcpy(Button4.Caption,"JUN");break;
L_MonthDateUpOnUp208:
MOVW	R1, #lo_addr(?lstr61_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr61_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1167 :: 		case 7 :  strcpy(Button4.Caption,"JUL");break;
L_MonthDateUpOnUp209:
MOVW	R1, #lo_addr(?lstr62_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr62_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1168 :: 		case 8 :  strcpy(Button4.Caption,"AUG");break;
L_MonthDateUpOnUp210:
MOVW	R1, #lo_addr(?lstr63_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr63_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1169 :: 		case 9 :  strcpy(Button4.Caption,"SEP");break;
L_MonthDateUpOnUp211:
MOVW	R1, #lo_addr(?lstr64_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr64_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1170 :: 		case 10 : strcpy(Button4.Caption,"OCT");break;
L_MonthDateUpOnUp212:
MOVW	R1, #lo_addr(?lstr65_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr65_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1171 :: 		case 11 : strcpy(Button4.Caption,"NOV");break;
L_MonthDateUpOnUp213:
MOVW	R1, #lo_addr(?lstr66_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr66_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1172 :: 		case 12 : strcpy(Button4.Caption,"DEC");break;
L_MonthDateUpOnUp214:
MOVW	R1, #lo_addr(?lstr67_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr67_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateUpOnUp202
;Controller_events_code.c,1173 :: 		}
L_MonthDateUpOnUp201:
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_MonthDateUpOnUp203
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_MonthDateUpOnUp204
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_MonthDateUpOnUp205
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_MonthDateUpOnUp206
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_MonthDateUpOnUp207
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_MonthDateUpOnUp208
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_MonthDateUpOnUp209
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_MonthDateUpOnUp210
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_MonthDateUpOnUp211
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_MonthDateUpOnUp212
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L_MonthDateUpOnUp213
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L_MonthDateUpOnUp214
L_MonthDateUpOnUp202:
;Controller_events_code.c,1175 :: 		DrawButton(&Button4);
MOVW	R0, #lo_addr(_Button4+0)
MOVT	R0, #hi_addr(_Button4+0)
BL	_DrawButton+0
;Controller_events_code.c,1176 :: 		}
L_end_MonthDateUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MonthDateUpOnUp
_MonthDateUpOnPress:
;Controller_events_code.c,1177 :: 		void MonthDateUpOnPress() {
;Controller_events_code.c,1179 :: 		}
L_end_MonthDateUpOnPress:
BX	LR
; end of _MonthDateUpOnPress
_MonthDateDwnOnClick:
;Controller_events_code.c,1180 :: 		void MonthDateDwnOnClick() {
;Controller_events_code.c,1185 :: 		}
L_end_MonthDateDwnOnClick:
BX	LR
; end of _MonthDateDwnOnClick
_MonthDateDwnOnUp:
;Controller_events_code.c,1186 :: 		void MonthDateDwnOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1188 :: 		oneMonth--;
MOVW	R1, #lo_addr(_oneMonth+0)
MOVT	R1, #hi_addr(_oneMonth+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1189 :: 		if (oneMonth > 12)oneMonth=1;
CMP	R0, #12
IT	LS
BLS	L_MonthDateDwnOnUp215
MOVS	R1, #1
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
STRB	R1, [R0, #0]
L_MonthDateDwnOnUp215:
;Controller_events_code.c,1190 :: 		strcpy(Button4.Caption,"SEP");
MOVW	R1, #lo_addr(?lstr68_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr68_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1191 :: 		switch (oneMonth)  {
IT	AL
BAL	L_MonthDateDwnOnUp216
;Controller_events_code.c,1192 :: 		case 1 : strcpy(Button4.Caption,"JAN");break;
L_MonthDateDwnOnUp218:
MOVW	R1, #lo_addr(?lstr69_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr69_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1193 :: 		case 2 : strcpy(Button4.Caption,"FAB");break;
L_MonthDateDwnOnUp219:
MOVW	R1, #lo_addr(?lstr70_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr70_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1194 :: 		case 3 : strcpy(Button4.Caption,"MAR");break;
L_MonthDateDwnOnUp220:
MOVW	R1, #lo_addr(?lstr71_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr71_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1195 :: 		case 4 : strcpy(Button4.Caption,"APR");break;
L_MonthDateDwnOnUp221:
MOVW	R1, #lo_addr(?lstr72_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr72_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1196 :: 		case 5 : strcpy(Button4.Caption,"MAY");break;
L_MonthDateDwnOnUp222:
MOVW	R1, #lo_addr(?lstr73_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr73_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1197 :: 		case 6 : strcpy(Button4.Caption,"JUN");break;
L_MonthDateDwnOnUp223:
MOVW	R1, #lo_addr(?lstr74_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr74_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1198 :: 		case 7 : strcpy(Button4.Caption,"JUL");break;
L_MonthDateDwnOnUp224:
MOVW	R1, #lo_addr(?lstr75_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr75_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1199 :: 		case 8 : strcpy(Button4.Caption,"AUG");break;
L_MonthDateDwnOnUp225:
MOVW	R1, #lo_addr(?lstr76_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr76_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1200 :: 		case 9 : strcpy(Button4.Caption,"SEP");break;
L_MonthDateDwnOnUp226:
MOVW	R1, #lo_addr(?lstr77_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr77_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1201 :: 		case 10 : strcpy(Button4.Caption,"OCT");break;
L_MonthDateDwnOnUp227:
MOVW	R1, #lo_addr(?lstr78_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr78_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1202 :: 		case 11 : strcpy(Button4.Caption,"NOV");break;
L_MonthDateDwnOnUp228:
MOVW	R1, #lo_addr(?lstr79_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr79_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1203 :: 		case 12 : strcpy(Button4.Caption,"DEC");break;
L_MonthDateDwnOnUp229:
MOVW	R1, #lo_addr(?lstr80_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr80_Controller_events_code+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
IT	AL
BAL	L_MonthDateDwnOnUp217
;Controller_events_code.c,1204 :: 		}
L_MonthDateDwnOnUp216:
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_MonthDateDwnOnUp218
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_MonthDateDwnOnUp219
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_MonthDateDwnOnUp220
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_MonthDateDwnOnUp221
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_MonthDateDwnOnUp222
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_MonthDateDwnOnUp223
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_MonthDateDwnOnUp224
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_MonthDateDwnOnUp225
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_MonthDateDwnOnUp226
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_MonthDateDwnOnUp227
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L_MonthDateDwnOnUp228
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L_MonthDateDwnOnUp229
L_MonthDateDwnOnUp217:
;Controller_events_code.c,1205 :: 		DrawButton(&Button4);
MOVW	R0, #lo_addr(_Button4+0)
MOVT	R0, #hi_addr(_Button4+0)
BL	_DrawButton+0
;Controller_events_code.c,1206 :: 		}
L_end_MonthDateDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MonthDateDwnOnUp
_MonthDateDwnOnPress:
;Controller_events_code.c,1207 :: 		void MonthDateDwnOnPress() {
;Controller_events_code.c,1208 :: 		}
L_end_MonthDateDwnOnPress:
BX	LR
; end of _MonthDateDwnOnPress
_TenDayUpOnClick:
;Controller_events_code.c,1210 :: 		void TenDayUpOnClick() {
;Controller_events_code.c,1212 :: 		}
L_end_TenDayUpOnClick:
BX	LR
; end of _TenDayUpOnClick
_TenDayDwnOnClick:
;Controller_events_code.c,1213 :: 		void TenDayDwnOnClick() {
;Controller_events_code.c,1215 :: 		}
L_end_TenDayDwnOnClick:
BX	LR
; end of _TenDayDwnOnClick
_TenDayUpOnUp:
;Controller_events_code.c,1217 :: 		void TenDayUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1219 :: 		tenDayU++;
MOVW	R1, #lo_addr(_tenDayU+0)
MOVT	R1, #hi_addr(_tenDayU+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1220 :: 		if (tenDayU > 9)tenDayU=0;
CMP	R0, #9
IT	LS
BLS	L_TenDayUpOnUp230
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
STRB	R1, [R0, #0]
L_TenDayUpOnUp230:
;Controller_events_code.c,1221 :: 		ByteToStr(tenDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1222 :: 		strcpy(Button8.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button8+24)
MOVT	R1, #hi_addr(_Button8+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1223 :: 		DrawButton(&Button8);
MOVW	R0, #lo_addr(_Button8+0)
MOVT	R0, #hi_addr(_Button8+0)
BL	_DrawButton+0
;Controller_events_code.c,1224 :: 		}
L_end_TenDayUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenDayUpOnUp
_TenDayDwnOnUp:
;Controller_events_code.c,1226 :: 		void TenDayDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1228 :: 		tenDayU--;
MOVW	R1, #lo_addr(_tenDayU+0)
MOVT	R1, #hi_addr(_tenDayU+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1229 :: 		if (tenDayU > 9)tenDayU=0;
CMP	R0, #9
IT	LS
BLS	L_TenDayDwnOnUp231
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
STRB	R1, [R0, #0]
L_TenDayDwnOnUp231:
;Controller_events_code.c,1230 :: 		ByteToStr(tenDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1231 :: 		strcpy(Button8.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button8+24)
MOVT	R1, #hi_addr(_Button8+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1232 :: 		DrawButton(&Button8);
MOVW	R0, #lo_addr(_Button8+0)
MOVT	R0, #hi_addr(_Button8+0)
BL	_DrawButton+0
;Controller_events_code.c,1233 :: 		}
L_end_TenDayDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TenDayDwnOnUp
_TenDayUpOnPress:
;Controller_events_code.c,1235 :: 		void TenDayUpOnPress() {
;Controller_events_code.c,1237 :: 		}
L_end_TenDayUpOnPress:
BX	LR
; end of _TenDayUpOnPress
_TenDayDwnOnPress:
;Controller_events_code.c,1239 :: 		void TenDayDwnOnPress() {
;Controller_events_code.c,1241 :: 		}
L_end_TenDayDwnOnPress:
BX	LR
; end of _TenDayDwnOnPress
_OneDayUpOnClick:
;Controller_events_code.c,1243 :: 		void OneDayUpOnClick() {
;Controller_events_code.c,1245 :: 		}
L_end_OneDayUpOnClick:
BX	LR
; end of _OneDayUpOnClick
_OneDayDwnOnClick:
;Controller_events_code.c,1247 :: 		void OneDayDwnOnClick() {
;Controller_events_code.c,1249 :: 		}
L_end_OneDayDwnOnClick:
BX	LR
; end of _OneDayDwnOnClick
_OneDayUpOnUp:
;Controller_events_code.c,1251 :: 		void OneDayUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1253 :: 		oneDayU++;
MOVW	R1, #lo_addr(_oneDayU+0)
MOVT	R1, #hi_addr(_oneDayU+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1254 :: 		if (oneDayU > 9)oneDayU=0;
CMP	R0, #9
IT	LS
BLS	L_OneDayUpOnUp232
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
STRB	R1, [R0, #0]
L_OneDayUpOnUp232:
;Controller_events_code.c,1255 :: 		ByteToStr(oneDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1256 :: 		strcpy(Button12.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button12+24)
MOVT	R1, #hi_addr(_Button12+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1257 :: 		DrawButton(&Button12);
MOVW	R0, #lo_addr(_Button12+0)
MOVT	R0, #hi_addr(_Button12+0)
BL	_DrawButton+0
;Controller_events_code.c,1258 :: 		}
L_end_OneDayUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneDayUpOnUp
_OneDayDwnOnUp:
;Controller_events_code.c,1260 :: 		void OneDayDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1262 :: 		oneDayU--;
MOVW	R1, #lo_addr(_oneDayU+0)
MOVT	R1, #hi_addr(_oneDayU+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1263 :: 		if (oneDayU > 9)oneDayU=0;
CMP	R0, #9
IT	LS
BLS	L_OneDayDwnOnUp233
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
STRB	R1, [R0, #0]
L_OneDayDwnOnUp233:
;Controller_events_code.c,1264 :: 		ByteToStr(oneDayU, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1265 :: 		strcpy(Button12.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button12+24)
MOVT	R1, #hi_addr(_Button12+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1266 :: 		DrawButton(&Button12);
MOVW	R0, #lo_addr(_Button12+0)
MOVT	R0, #hi_addr(_Button12+0)
BL	_DrawButton+0
;Controller_events_code.c,1267 :: 		}
L_end_OneDayDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OneDayDwnOnUp
_OneDayUpOnPress:
;Controller_events_code.c,1269 :: 		void OneDayUpOnPress() {
;Controller_events_code.c,1271 :: 		}
L_end_OneDayUpOnPress:
BX	LR
; end of _OneDayUpOnPress
_OneDayDwnOnPress:
;Controller_events_code.c,1273 :: 		void OneDayDwnOnPress() {
;Controller_events_code.c,1275 :: 		}
L_end_OneDayDwnOnPress:
BX	LR
; end of _OneDayDwnOnPress
_Day_unitUpOnClick:
;Controller_events_code.c,1277 :: 		void Day_unitUpOnClick() {
;Controller_events_code.c,1279 :: 		}
L_end_Day_unitUpOnClick:
BX	LR
; end of _Day_unitUpOnClick
_Day_unitDwnOnClick:
;Controller_events_code.c,1281 :: 		void Day_unitDwnOnClick() {
;Controller_events_code.c,1283 :: 		}
L_end_Day_unitDwnOnClick:
BX	LR
; end of _Day_unitDwnOnClick
_Day_unitUpOnUp:
;Controller_events_code.c,1285 :: 		void Day_unitUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1287 :: 		tenHour++;
MOVW	R1, #lo_addr(_tenHour+0)
MOVT	R1, #hi_addr(_tenHour+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1288 :: 		if (tenHour > 9)tenHour=0;
CMP	R0, #9
IT	LS
BLS	L_Day_unitUpOnUp234
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
STRB	R1, [R0, #0]
L_Day_unitUpOnUp234:
;Controller_events_code.c,1289 :: 		ByteToStr(tenHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1290 :: 		strcpy(Button21.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button21+24)
MOVT	R1, #hi_addr(_Button21+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1291 :: 		DrawButton(&Button21);
MOVW	R0, #lo_addr(_Button21+0)
MOVT	R0, #hi_addr(_Button21+0)
BL	_DrawButton+0
;Controller_events_code.c,1292 :: 		}
L_end_Day_unitUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Day_unitUpOnUp
_Day_unitDwnOnUp:
;Controller_events_code.c,1294 :: 		void Day_unitDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1296 :: 		tenHour--;
MOVW	R1, #lo_addr(_tenHour+0)
MOVT	R1, #hi_addr(_tenHour+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1297 :: 		if (tenHour > 9)tenHour=0;
CMP	R0, #9
IT	LS
BLS	L_Day_unitDwnOnUp235
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
STRB	R1, [R0, #0]
L_Day_unitDwnOnUp235:
;Controller_events_code.c,1298 :: 		ByteToStr(tenHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1299 :: 		strcpy(Button21.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button21+24)
MOVT	R1, #hi_addr(_Button21+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1300 :: 		DrawButton(&Button21);
MOVW	R0, #lo_addr(_Button21+0)
MOVT	R0, #hi_addr(_Button21+0)
BL	_DrawButton+0
;Controller_events_code.c,1301 :: 		}
L_end_Day_unitDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Day_unitDwnOnUp
_Day_unitUpOnPress:
;Controller_events_code.c,1303 :: 		void Day_unitUpOnPress() {
;Controller_events_code.c,1305 :: 		}
L_end_Day_unitUpOnPress:
BX	LR
; end of _Day_unitUpOnPress
_Day_unitDwnOnPress:
;Controller_events_code.c,1307 :: 		void Day_unitDwnOnPress() {
;Controller_events_code.c,1309 :: 		}
L_end_Day_unitDwnOnPress:
BX	LR
; end of _Day_unitDwnOnPress
_Unit_hoursUpOnClick:
;Controller_events_code.c,1311 :: 		void Unit_hoursUpOnClick() {
;Controller_events_code.c,1313 :: 		}
L_end_Unit_hoursUpOnClick:
BX	LR
; end of _Unit_hoursUpOnClick
_Unit_hoursDwnOnClick:
;Controller_events_code.c,1315 :: 		void Unit_hoursDwnOnClick() {
;Controller_events_code.c,1317 :: 		}
L_end_Unit_hoursDwnOnClick:
BX	LR
; end of _Unit_hoursDwnOnClick
_Unit_hoursUpOnUp:
;Controller_events_code.c,1318 :: 		void Unit_hoursUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1320 :: 		oneHour++;
MOVW	R1, #lo_addr(_oneHour+0)
MOVT	R1, #hi_addr(_oneHour+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1321 :: 		if (oneHour > 9)oneHour=0;
CMP	R0, #9
IT	LS
BLS	L_Unit_hoursUpOnUp236
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
STRB	R1, [R0, #0]
L_Unit_hoursUpOnUp236:
;Controller_events_code.c,1322 :: 		ByteToStr(oneHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1323 :: 		strcpy(Button24.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button24+24)
MOVT	R1, #hi_addr(_Button24+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1324 :: 		DrawButton(&Button24);
MOVW	R0, #lo_addr(_Button24+0)
MOVT	R0, #hi_addr(_Button24+0)
BL	_DrawButton+0
;Controller_events_code.c,1325 :: 		}
L_end_Unit_hoursUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_hoursUpOnUp
_Unit_hoursDwnOnUp:
;Controller_events_code.c,1326 :: 		void Unit_hoursDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1328 :: 		oneHour--;
MOVW	R1, #lo_addr(_oneHour+0)
MOVT	R1, #hi_addr(_oneHour+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1329 :: 		if (oneHour > 9)oneHour=0;
CMP	R0, #9
IT	LS
BLS	L_Unit_hoursDwnOnUp237
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
STRB	R1, [R0, #0]
L_Unit_hoursDwnOnUp237:
;Controller_events_code.c,1330 :: 		ByteToStr(oneHour, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1331 :: 		strcpy(Button24.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button24+24)
MOVT	R1, #hi_addr(_Button24+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1332 :: 		DrawButton(&Button24);
MOVW	R0, #lo_addr(_Button24+0)
MOVT	R0, #hi_addr(_Button24+0)
BL	_DrawButton+0
;Controller_events_code.c,1333 :: 		}
L_end_Unit_hoursDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_hoursDwnOnUp
_Unit_hoursUpOnPress:
;Controller_events_code.c,1334 :: 		void Unit_hoursUpOnPress() {
;Controller_events_code.c,1336 :: 		}
L_end_Unit_hoursUpOnPress:
BX	LR
; end of _Unit_hoursUpOnPress
_Unit_hoursDwnOnPress:
;Controller_events_code.c,1337 :: 		void Unit_hoursDwnOnPress() {
;Controller_events_code.c,1339 :: 		}
L_end_Unit_hoursDwnOnPress:
BX	LR
; end of _Unit_hoursDwnOnPress
_Ten_minutesUpOnClick:
;Controller_events_code.c,1341 :: 		void Ten_minutesUpOnClick() {
;Controller_events_code.c,1343 :: 		}
L_end_Ten_minutesUpOnClick:
BX	LR
; end of _Ten_minutesUpOnClick
_Ten_minutesDwnOnClick:
;Controller_events_code.c,1344 :: 		void Ten_minutesDwnOnClick() {
;Controller_events_code.c,1346 :: 		}
L_end_Ten_minutesDwnOnClick:
BX	LR
; end of _Ten_minutesDwnOnClick
_Ten_minutesUpOnUp:
;Controller_events_code.c,1347 :: 		void Ten_minutesUpOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1349 :: 		tenMinute++;
MOVW	R1, #lo_addr(_tenMinute+0)
MOVT	R1, #hi_addr(_tenMinute+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1350 :: 		if (tenMinute > 9)tenMinute=0;
CMP	R0, #9
IT	LS
BLS	L_Ten_minutesUpOnUp238
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
STRB	R1, [R0, #0]
L_Ten_minutesUpOnUp238:
;Controller_events_code.c,1351 :: 		ByteToStr(tenMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1352 :: 		strcpy(Button40.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button40+24)
MOVT	R1, #hi_addr(_Button40+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1353 :: 		DrawButton(&Button40);
MOVW	R0, #lo_addr(_Button40+0)
MOVT	R0, #hi_addr(_Button40+0)
BL	_DrawButton+0
;Controller_events_code.c,1354 :: 		}
L_end_Ten_minutesUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Ten_minutesUpOnUp
_Ten_minutesDwnOnUp:
;Controller_events_code.c,1355 :: 		void Ten_minutesDwnOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1357 :: 		tenMinute--;
MOVW	R1, #lo_addr(_tenMinute+0)
MOVT	R1, #hi_addr(_tenMinute+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1358 :: 		if (tenMinute > 9)tenMinute=0;
CMP	R0, #9
IT	LS
BLS	L_Ten_minutesDwnOnUp239
MOVS	R1, #0
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
STRB	R1, [R0, #0]
L_Ten_minutesDwnOnUp239:
;Controller_events_code.c,1359 :: 		ByteToStr(tenMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1360 :: 		strcpy(Button40.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button40+24)
MOVT	R1, #hi_addr(_Button40+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1361 :: 		DrawButton(&Button40);
MOVW	R0, #lo_addr(_Button40+0)
MOVT	R0, #hi_addr(_Button40+0)
BL	_DrawButton+0
;Controller_events_code.c,1362 :: 		}
L_end_Ten_minutesDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Ten_minutesDwnOnUp
_Ten_minutesUpOnPress:
;Controller_events_code.c,1363 :: 		void Ten_minutesUpOnPress() {
;Controller_events_code.c,1365 :: 		}
L_end_Ten_minutesUpOnPress:
BX	LR
; end of _Ten_minutesUpOnPress
_Ten_minutesDwnOnPress:
;Controller_events_code.c,1366 :: 		void Ten_minutesDwnOnPress() {
;Controller_events_code.c,1368 :: 		}
L_end_Ten_minutesDwnOnPress:
BX	LR
; end of _Ten_minutesDwnOnPress
_Unit_minutesUpOnClick:
;Controller_events_code.c,1370 :: 		void Unit_minutesUpOnClick() {
;Controller_events_code.c,1372 :: 		}
L_end_Unit_minutesUpOnClick:
BX	LR
; end of _Unit_minutesUpOnClick
_Unit_minutesDwnOnClick:
;Controller_events_code.c,1374 :: 		void Unit_minutesDwnOnClick() {
;Controller_events_code.c,1376 :: 		}
L_end_Unit_minutesDwnOnClick:
BX	LR
; end of _Unit_minutesDwnOnClick
_Unit_minutesUpOnUp:
;Controller_events_code.c,1378 :: 		void Unit_minutesUpOnUp(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1380 :: 		oneMinute++;
MOVW	R1, #lo_addr(_oneMinute+0)
MOVT	R1, #hi_addr(_oneMinute+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1381 :: 		if (oneMinute > 9)oneMinute=0;
CMP	R0, #9
IT	LS
BLS	L_Unit_minutesUpOnUp240
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
STRB	R1, [R0, #0]
L_Unit_minutesUpOnUp240:
;Controller_events_code.c,1382 :: 		ByteToStr(oneMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1383 :: 		strcpy(Button43.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button43+24)
MOVT	R1, #hi_addr(_Button43+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1384 :: 		DrawButton(&Button43);
MOVW	R0, #lo_addr(_Button43+0)
MOVT	R0, #hi_addr(_Button43+0)
BL	_DrawButton+0
;Controller_events_code.c,1385 :: 		}
L_end_Unit_minutesUpOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_minutesUpOnUp
_Unit_minutesDwnOnUp:
;Controller_events_code.c,1387 :: 		void Unit_minutesDwnOnUp(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1389 :: 		oneMinute--;
MOVW	R1, #lo_addr(_oneMinute+0)
MOVT	R1, #hi_addr(_oneMinute+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_events_code.c,1390 :: 		if (oneMinute > 9)oneMinute=0;
CMP	R0, #9
IT	LS
BLS	L_Unit_minutesDwnOnUp241
MOVS	R1, #0
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
STRB	R1, [R0, #0]
L_Unit_minutesDwnOnUp241:
;Controller_events_code.c,1391 :: 		ByteToStr(oneMinute, txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
LDRB	R0, [R0, #0]
BL	_ByteToStr+0
;Controller_events_code.c,1392 :: 		strcpy(Button43.Caption,Ltrim(txt));
ADD	R0, SP, #8
BL	_Ltrim+0
MOVW	R1, #lo_addr(_Button43+24)
MOVT	R1, #hi_addr(_Button43+24)
LDR	R1, [R1, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;Controller_events_code.c,1393 :: 		DrawButton(&Button43);
MOVW	R0, #lo_addr(_Button43+0)
MOVT	R0, #hi_addr(_Button43+0)
BL	_DrawButton+0
;Controller_events_code.c,1394 :: 		}
L_end_Unit_minutesDwnOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Unit_minutesDwnOnUp
_Unit_minutesUpOnPress:
;Controller_events_code.c,1396 :: 		void Unit_minutesUpOnPress() {
;Controller_events_code.c,1398 :: 		}
L_end_Unit_minutesUpOnPress:
BX	LR
; end of _Unit_minutesUpOnPress
_Unit_minutesDwnOnPress:
;Controller_events_code.c,1400 :: 		void Unit_minutesDwnOnPress() {
;Controller_events_code.c,1402 :: 		}
L_end_Unit_minutesDwnOnPress:
BX	LR
; end of _Unit_minutesDwnOnPress
_Admin_SetOnClick:
;Controller_events_code.c,1405 :: 		void Admin_SetOnClick(){
;Controller_events_code.c,1406 :: 		}
L_end_Admin_SetOnClick:
BX	LR
; end of _Admin_SetOnClick
_system_passOnDown:
;Controller_events_code.c,1408 :: 		void system_passOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1409 :: 		Image83.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1410 :: 		DrawImage(&Image83);
MOVW	R0, #lo_addr(_Image83+0)
MOVT	R0, #hi_addr(_Image83+0)
BL	_DrawImage+0
;Controller_events_code.c,1411 :: 		}
L_end_system_passOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnDown
_system_passOnUp:
;Controller_events_code.c,1413 :: 		void system_passOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1414 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1415 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1416 :: 		Image83.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image83+20)
MOVT	R0, #hi_addr(_Image83+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1417 :: 		DrawScreen(&PASSWORD);
MOVW	R0, #lo_addr(_PASSWORD+0)
MOVT	R0, #hi_addr(_PASSWORD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1418 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1419 :: 		}
L_end_system_passOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_passOnUp
_ModeSetOnUp:
;Controller_events_code.c,1421 :: 		void ModeSetOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1422 :: 		if (SYSTEM_ON == false) {
MOVW	R0, #lo_addr(_SYSTEM_ON+0)
MOVT	R0, #hi_addr(_SYSTEM_ON+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_ModeSetOnUp242
;Controller_events_code.c,1423 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1424 :: 		strcpy(System_Set_Message.Caption, " ");
MOVW	R1, #lo_addr(?lstr81_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr81_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1425 :: 		Image300.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1426 :: 		System_Set_Message.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1427 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1428 :: 		}
IT	AL
BAL	L_ModeSetOnUp243
L_ModeSetOnUp242:
;Controller_events_code.c,1430 :: 		strcpy(System_Set_Message.Caption, "Please  OFF  system  power!");
MOVW	R1, #lo_addr(?lstr82_Controller_events_code+0)
MOVT	R1, #hi_addr(?lstr82_Controller_events_code+0)
MOVW	R0, #lo_addr(_System_Set_Message+24)
MOVT	R0, #hi_addr(_System_Set_Message+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1431 :: 		Image300.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image300+20)
MOVT	R0, #hi_addr(_Image300+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1432 :: 		DrawImage (&Image300);
MOVW	R0, #lo_addr(_Image300+0)
MOVT	R0, #hi_addr(_Image300+0)
BL	_DrawImage+0
;Controller_events_code.c,1433 :: 		System_Set_Message.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_System_Set_Message+18)
MOVT	R0, #hi_addr(_System_Set_Message+18)
STRB	R1, [R0, #0]
;Controller_events_code.c,1434 :: 		DrawButton (&System_Set_Message);
MOVW	R0, #lo_addr(_System_Set_Message+0)
MOVT	R0, #hi_addr(_System_Set_Message+0)
BL	_DrawButton+0
;Controller_events_code.c,1435 :: 		}
L_ModeSetOnUp243:
;Controller_events_code.c,1436 :: 		}
L_end_ModeSetOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnUp
_ModeSetOnDown:
;Controller_events_code.c,1438 :: 		void ModeSetOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1439 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1440 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1441 :: 		}
L_end_ModeSetOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ModeSetOnDown
_system_EEVOnDown:
;Controller_events_code.c,1443 :: 		void system_EEVOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1444 :: 		Image89.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1445 :: 		DrawImage(&Image89);
MOVW	R0, #lo_addr(_Image89+0)
MOVT	R0, #hi_addr(_Image89+0)
BL	_DrawImage+0
;Controller_events_code.c,1446 :: 		reciev_data_packet(TRV_CORRECT_1,1);
MOVS	R1, #1
MOVW	R0, #391
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_events_code.c,1447 :: 		Delay_ms(300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_system_EEVOnDown244:
SUBS	R7, R7, #1
BNE	L_system_EEVOnDown244
NOP
NOP
NOP
;Controller_events_code.c,1448 :: 		}
L_end_system_EEVOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_EEVOnDown
_system_EEVOnUp:
;Controller_events_code.c,1450 :: 		void system_EEVOnUp() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1452 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1453 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1454 :: 		incTRV = system_reg[TRV_CORRECT_1];
MOVW	R2, #lo_addr(_system_reg+782)
MOVT	R2, #hi_addr(_system_reg+782)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_incTRV+0)
MOVT	R0, #hi_addr(_incTRV+0)
STRH	R1, [R0, #0]
;Controller_events_code.c,1455 :: 		IntToStr(incTRV, txt);Ltrim(txt);
ADD	R1, SP, #4
MOV	R0, R2
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1456 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_EEV1_value+24)
MOVT	R0, #hi_addr(_EEV1_value+24)
LDR	R0, [R0, #0]
BL	_strcpy+0
;Controller_events_code.c,1457 :: 		Image89.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image89+20)
MOVT	R0, #hi_addr(_Image89+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1458 :: 		DrawScreen(&EEV);
MOVW	R0, #lo_addr(_EEV+0)
MOVT	R0, #hi_addr(_EEV+0)
BL	_DrawScreen+0
;Controller_events_code.c,1459 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1461 :: 		}
L_end_system_EEVOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _system_EEVOnUp
_system_modeOnDown:
;Controller_events_code.c,1463 :: 		void system_modeOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1464 :: 		Image85.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1465 :: 		DrawImage(&Image85);
MOVW	R0, #lo_addr(_Image85+0)
MOVT	R0, #hi_addr(_Image85+0)
BL	_DrawImage+0
;Controller_events_code.c,1466 :: 		}
L_end_system_modeOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnDown
_system_modeOnUp:
;Controller_events_code.c,1468 :: 		void system_modeOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1469 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1470 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1471 :: 		Image85.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image85+20)
MOVT	R0, #hi_addr(_Image85+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1472 :: 		DrawScreen(&MODE);
MOVW	R0, #lo_addr(_MODE+0)
MOVT	R0, #hi_addr(_MODE+0)
BL	_DrawScreen+0
;Controller_events_code.c,1473 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1474 :: 		}
L_end_system_modeOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_modeOnUp
_system_delayOnUp:
;Controller_events_code.c,1476 :: 		void system_delayOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1477 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1478 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1479 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1480 :: 		DrawScreen(&DELAY_MENU);
MOVW	R0, #lo_addr(_DELAY_MENU+0)
MOVT	R0, #hi_addr(_DELAY_MENU+0)
BL	_DrawScreen+0
;Controller_events_code.c,1481 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1482 :: 		}
L_end_system_delayOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnUp
_system_delayOnDown:
;Controller_events_code.c,1483 :: 		void system_delayOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1484 :: 		Image90.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1485 :: 		DrawImage(&Image90);
MOVW	R0, #lo_addr(_Image90+0)
MOVT	R0, #hi_addr(_Image90+0)
BL	_DrawImage+0
;Controller_events_code.c,1486 :: 		}
L_end_system_delayOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_delayOnDown
_system_graphOnDown:
;Controller_events_code.c,1488 :: 		void system_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1489 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1490 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1491 :: 		Image90.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image90+20)
MOVT	R0, #hi_addr(_Image90+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1492 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1493 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1494 :: 		}
L_end_system_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnDown
_system_graphOnUp:
;Controller_events_code.c,1496 :: 		void system_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1497 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1498 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1500 :: 		}
L_end_system_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_graphOnUp
_system_microSDOnDown:
;Controller_events_code.c,1501 :: 		void system_microSDOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1502 :: 		Image88.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1503 :: 		DrawImage(&Image88);
MOVW	R0, #lo_addr(_Image88+0)
MOVT	R0, #hi_addr(_Image88+0)
BL	_DrawImage+0
;Controller_events_code.c,1504 :: 		}
L_end_system_microSDOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnDown
_system_microSDOnUp:
;Controller_events_code.c,1506 :: 		void system_microSDOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1507 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1508 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1509 :: 		Image88.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image88+20)
MOVT	R0, #hi_addr(_Image88+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1510 :: 		DrawScreen(&MICRO_SD);
MOVW	R0, #lo_addr(_MICRO_SD+0)
MOVT	R0, #hi_addr(_MICRO_SD+0)
BL	_DrawScreen+0
;Controller_events_code.c,1511 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1512 :: 		}
L_end_system_microSDOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_microSDOnUp
_system_limitsOnDown:
;Controller_events_code.c,1515 :: 		void system_limitsOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1516 :: 		Image91.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1517 :: 		DrawImage(&Image91);
MOVW	R0, #lo_addr(_Image91+0)
MOVT	R0, #hi_addr(_Image91+0)
BL	_DrawImage+0
;Controller_events_code.c,1518 :: 		}
L_end_system_limitsOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnDown
_system_limitsOnUp:
;Controller_events_code.c,1520 :: 		void system_limitsOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1521 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1522 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1523 :: 		Image91.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image91+20)
MOVT	R0, #hi_addr(_Image91+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1524 :: 		DrawScreen(&LIMITS1);
MOVW	R0, #lo_addr(_LIMITS1+0)
MOVT	R0, #hi_addr(_LIMITS1+0)
BL	_DrawScreen+0
;Controller_events_code.c,1525 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1526 :: 		}
L_end_system_limitsOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_limitsOnUp
_ssytem_graphOnDown:
;Controller_events_code.c,1528 :: 		void ssytem_graphOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1529 :: 		Image92.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1530 :: 		DrawImage(&Image92);
MOVW	R0, #lo_addr(_Image92+0)
MOVT	R0, #hi_addr(_Image92+0)
BL	_DrawImage+0
;Controller_events_code.c,1531 :: 		}
L_end_ssytem_graphOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnDown
_ssytem_graphOnUp:
;Controller_events_code.c,1533 :: 		void ssytem_graphOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1534 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1535 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1536 :: 		Image92.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image92+20)
MOVT	R0, #hi_addr(_Image92+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1537 :: 		DrawScreen(&Graph);
MOVW	R0, #lo_addr(_Graph+0)
MOVT	R0, #hi_addr(_Graph+0)
BL	_DrawScreen+0
;Controller_events_code.c,1538 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1539 :: 		}
L_end_ssytem_graphOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ssytem_graphOnUp
_system_historyOnDown:
;Controller_events_code.c,1541 :: 		void system_historyOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1542 :: 		Image93.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1543 :: 		DrawImage(&Image93);
MOVW	R0, #lo_addr(_Image93+0)
MOVT	R0, #hi_addr(_Image93+0)
BL	_DrawImage+0
;Controller_events_code.c,1544 :: 		}
L_end_system_historyOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnDown
_system_historyOnUp:
;Controller_events_code.c,1546 :: 		void system_historyOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1547 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1548 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Controller_events_code.c,1549 :: 		Image93.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image93+20)
MOVT	R0, #hi_addr(_Image93+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1550 :: 		DrawScreen(&SYSTEM_EVENTS);
MOVW	R0, #lo_addr(_SYSTEM_EVENTS+0)
MOVT	R0, #hi_addr(_SYSTEM_EVENTS+0)
BL	_DrawScreen+0
;Controller_events_code.c,1551 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Controller_events_code.c,1552 :: 		}
L_end_system_historyOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_historyOnUp
_Delay_Source_DOWNOnUp:
;Controller_events_code.c,1555 :: 		void Delay_Source_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1556 :: 		Image306.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1557 :: 		Delay_Source_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1558 :: 		DrawImage(&Delay_Source_DOWN);
MOVW	R0, #lo_addr(_Delay_Source_DOWN+0)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1559 :: 		}
L_end_Delay_Source_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_DOWNOnUp
_Delay_Source_DOWNOnPress:
;Controller_events_code.c,1560 :: 		void Delay_Source_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1563 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1564 :: 		Image306.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image306+20)
MOVT	R0, #hi_addr(_Image306+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1565 :: 		Delay_Source_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_DOWN+20)
MOVT	R0, #hi_addr(_Delay_Source_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1566 :: 		DrawImage(&Image306);
MOVW	R0, #lo_addr(_Image306+0)
MOVT	R0, #hi_addr(_Image306+0)
BL	_DrawImage+0
;Controller_events_code.c,1569 :: 		system_reg[SOURS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1570 :: 		if (system_reg[SOURS_DEL] <0) system_reg[SOURS_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_Source_DOWNOnPress246
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_DOWNOnPress246:
;Controller_events_code.c,1571 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1572 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1573 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1574 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1575 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_Source_DOWNOnPress247:
SUBS	R7, R7, #1
BNE	L_Delay_Source_DOWNOnPress247
NOP
NOP
NOP
;Controller_events_code.c,1576 :: 		}
L_end_Delay_Source_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_DOWNOnPress
_Delay_Source_UPOnUp:
;Controller_events_code.c,1577 :: 		void Delay_Source_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1578 :: 		Image312.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1579 :: 		Delay_Source_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1580 :: 		DrawImage(&Delay_Source_UP);
MOVW	R0, #lo_addr(_Delay_Source_UP+0)
MOVT	R0, #hi_addr(_Delay_Source_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1582 :: 		}
L_end_Delay_Source_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_UPOnUp
_Delay_Source_UPOnPress:
;Controller_events_code.c,1583 :: 		void Delay_Source_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1586 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1587 :: 		Image312.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image312+20)
MOVT	R0, #hi_addr(_Image312+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1588 :: 		Delay_Source_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_UP+20)
MOVT	R0, #hi_addr(_Delay_Source_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1589 :: 		DrawImage(&Image312);
MOVW	R0, #lo_addr(_Image312+0)
MOVT	R0, #hi_addr(_Image312+0)
BL	_DrawImage+0
;Controller_events_code.c,1590 :: 		system_reg[SOURS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+60)
MOVT	R1, #hi_addr(_system_reg+60)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1591 :: 		if (system_reg[SOURS_DEL] >99) system_reg[SOURS_DEL] = 99;
CMP	R0, #99
IT	LE
BLE	L_Delay_Source_UPOnPress249
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
STRH	R1, [R0, #0]
L_Delay_Source_UPOnPress249:
;Controller_events_code.c,1592 :: 		IntToStr(system_reg[SOURS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1593 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1594 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1595 :: 		DrawRoundButton(&Delay_Source);
MOVW	R0, #lo_addr(_Delay_Source+0)
MOVT	R0, #hi_addr(_Delay_Source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1596 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_Source_UPOnPress250:
SUBS	R7, R7, #1
BNE	L_Delay_Source_UPOnPress250
NOP
NOP
NOP
;Controller_events_code.c,1597 :: 		}
L_end_Delay_Source_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_Source_UPOnPress
_Delay_Source_SETOnUp:
;Controller_events_code.c,1598 :: 		void Delay_Source_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1599 :: 		Delay_Source_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1600 :: 		Image344.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1601 :: 		DrawImage (&Delay_Source_SET);
MOVW	R0, #lo_addr(_Delay_Source_SET+0)
MOVT	R0, #hi_addr(_Delay_Source_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1602 :: 		}
L_end_Delay_Source_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnUp
_Delay_Source_SETOnDown:
;Controller_events_code.c,1603 :: 		void Delay_Source_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1604 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1608 :: 		send_data_packet(SOURS_DEL,1);
MOVS	R1, #1
MOVW	R0, #30
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1609 :: 		Delay_Source_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_Source_SET+20)
MOVT	R0, #hi_addr(_Delay_Source_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1610 :: 		Image344.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image344+20)
MOVT	R0, #hi_addr(_Image344+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1611 :: 		DrawImage (&Image344);
MOVW	R0, #lo_addr(_Image344+0)
MOVT	R0, #hi_addr(_Image344+0)
BL	_DrawImage+0
;Controller_events_code.c,1612 :: 		}
L_end_Delay_Source_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_Source_SETOnDown
_Delay_heat_pump_DOWNOnUp:
;Controller_events_code.c,1614 :: 		void Delay_heat_pump_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1615 :: 		Image307.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1616 :: 		Delay_heat_pump_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1617 :: 		DrawImage(&Delay_heat_pump_DOWN);
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1619 :: 		}
L_end_Delay_heat_pump_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_DOWNOnUp
_Delay_heat_pump_DOWNOnPress:
;Controller_events_code.c,1620 :: 		void Delay_heat_pump_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1623 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1624 :: 		Image307.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image307+20)
MOVT	R0, #hi_addr(_Image307+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1625 :: 		Delay_heat_pump_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_DOWN+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1626 :: 		DrawImage(&Image307);
MOVW	R0, #lo_addr(_Image307+0)
MOVT	R0, #hi_addr(_Image307+0)
BL	_DrawImage+0
;Controller_events_code.c,1629 :: 		system_reg[HEAT_DEL]--;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1630 :: 		if (system_reg[HEAT_DEL] <0) system_reg[HEAT_DEL]=0;
CMP	R0, #0
IT	GE
BGE	L_Delay_heat_pump_DOWNOnPress252
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_DOWNOnPress252:
;Controller_events_code.c,1631 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1632 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1633 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1634 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1635 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_heat_pump_DOWNOnPress253:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_DOWNOnPress253
NOP
NOP
NOP
;Controller_events_code.c,1636 :: 		}
L_end_Delay_heat_pump_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_DOWNOnPress
_Delay_heat_pump_upOnUp:
;Controller_events_code.c,1637 :: 		void Delay_heat_pump_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1638 :: 		Image313.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1639 :: 		Delay_heat_pump_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1640 :: 		DrawImage(&Delay_heat_pump_up);
MOVW	R0, #lo_addr(_Delay_heat_pump_up+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1641 :: 		}
L_end_Delay_heat_pump_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_upOnUp
_Delay_heat_pump_upOnPress:
;Controller_events_code.c,1642 :: 		void Delay_heat_pump_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1645 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1646 :: 		Image313.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image313+20)
MOVT	R0, #hi_addr(_Image313+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1647 :: 		Delay_heat_pump_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_up+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1648 :: 		DrawImage(&Image313);
MOVW	R0, #lo_addr(_Image313+0)
MOVT	R0, #hi_addr(_Image313+0)
BL	_DrawImage+0
;Controller_events_code.c,1651 :: 		system_reg[HEAT_DEL]++;
MOVW	R1, #lo_addr(_system_reg+40)
MOVT	R1, #hi_addr(_system_reg+40)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1652 :: 		if (system_reg[HEAT_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_heat_pump_upOnPress255
;Controller_events_code.c,1653 :: 		system_reg[HEAT_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
STRH	R1, [R0, #0]
L_Delay_heat_pump_upOnPress255:
;Controller_events_code.c,1654 :: 		IntToStr(system_reg[HEAT_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1655 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1656 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1657 :: 		DrawRoundButton(&Delay_heat_pump);
MOVW	R0, #lo_addr(_Delay_heat_pump+0)
MOVT	R0, #hi_addr(_Delay_heat_pump+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1658 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_heat_pump_upOnPress256:
SUBS	R7, R7, #1
BNE	L_Delay_heat_pump_upOnPress256
NOP
NOP
NOP
;Controller_events_code.c,1660 :: 		}
L_end_Delay_heat_pump_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_heat_pump_upOnPress
_Delay_heat_pump_SETOnUp:
;Controller_events_code.c,1661 :: 		void Delay_heat_pump_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1662 :: 		Delay_heat_pump_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1663 :: 		Image345.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1664 :: 		DrawImage (&Delay_heat_pump_SET);
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+0)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1665 :: 		}
L_end_Delay_heat_pump_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnUp
_Delay_heat_pump_SETOnDown:
;Controller_events_code.c,1666 :: 		void Delay_heat_pump_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1667 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1671 :: 		send_data_packet(HEAT_DEL,1);
MOVS	R1, #1
MOVW	R0, #20
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1672 :: 		Delay_heat_pump_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_heat_pump_SET+20)
MOVT	R0, #hi_addr(_Delay_heat_pump_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1673 :: 		Image345.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image345+20)
MOVT	R0, #hi_addr(_Image345+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1674 :: 		DrawImage (&Image345);
MOVW	R0, #lo_addr(_Image345+0)
MOVT	R0, #hi_addr(_Image345+0)
BL	_DrawImage+0
;Controller_events_code.c,1675 :: 		}
L_end_Delay_heat_pump_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_heat_pump_SETOnDown
_Delay_reversing_DOWNOnUp:
;Controller_events_code.c,1677 :: 		void Delay_reversing_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1678 :: 		Image308.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1679 :: 		Delay_reversing_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1680 :: 		DrawImage(&Delay_reversing_DOWN);
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+0)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1681 :: 		}
L_end_Delay_reversing_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_DOWNOnUp
_Delay_reversing_DOWNOnPress:
;Controller_events_code.c,1682 :: 		void Delay_reversing_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1685 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1686 :: 		Image308.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image308+20)
MOVT	R0, #hi_addr(_Image308+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1687 :: 		Delay_reversing_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_DOWN+20)
MOVT	R0, #hi_addr(_Delay_reversing_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1688 :: 		DrawImage(&Image308);
MOVW	R0, #lo_addr(_Image308+0)
MOVT	R0, #hi_addr(_Image308+0)
BL	_DrawImage+0
;Controller_events_code.c,1691 :: 		system_reg[REVERS_DEL]--;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1692 :: 		if (system_reg[REVERS_DEL] <0)
CMP	R0, #0
IT	GE
BGE	L_Delay_reversing_DOWNOnPress258
;Controller_events_code.c,1693 :: 		system_reg[REVERS_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_DOWNOnPress258:
;Controller_events_code.c,1694 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1695 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1696 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1697 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1698 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_reversing_DOWNOnPress259:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_DOWNOnPress259
NOP
NOP
NOP
;Controller_events_code.c,1699 :: 		}
L_end_Delay_reversing_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_DOWNOnPress
_Delay_reversing_UPOnUp:
;Controller_events_code.c,1700 :: 		void Delay_reversing_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1701 :: 		Image314.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1702 :: 		Delay_reversing_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1703 :: 		DrawImage(&Delay_reversing_UP);
MOVW	R0, #lo_addr(_Delay_reversing_UP+0)
MOVT	R0, #hi_addr(_Delay_reversing_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1704 :: 		}
L_end_Delay_reversing_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_UPOnUp
_Delay_reversing_UPOnPress:
;Controller_events_code.c,1705 :: 		void Delay_reversing_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1708 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1709 :: 		Image314.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image314+20)
MOVT	R0, #hi_addr(_Image314+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1710 :: 		Delay_reversing_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_UP+20)
MOVT	R0, #hi_addr(_Delay_reversing_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1711 :: 		DrawImage(&Image314);
MOVW	R0, #lo_addr(_Image314+0)
MOVT	R0, #hi_addr(_Image314+0)
BL	_DrawImage+0
;Controller_events_code.c,1714 :: 		system_reg[REVERS_DEL]++;
MOVW	R1, #lo_addr(_system_reg+80)
MOVT	R1, #hi_addr(_system_reg+80)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1715 :: 		if (system_reg[REVERS_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_reversing_UPOnPress261
;Controller_events_code.c,1716 :: 		system_reg[REVERS_DEL] = 99 ;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
STRH	R1, [R0, #0]
L_Delay_reversing_UPOnPress261:
;Controller_events_code.c,1717 :: 		IntToStr(system_reg[REVERS_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1718 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1719 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1720 :: 		DrawRoundButton(&Delay_reversing);
MOVW	R0, #lo_addr(_Delay_reversing+0)
MOVT	R0, #hi_addr(_Delay_reversing+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1721 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_reversing_UPOnPress262:
SUBS	R7, R7, #1
BNE	L_Delay_reversing_UPOnPress262
NOP
NOP
NOP
;Controller_events_code.c,1722 :: 		}
L_end_Delay_reversing_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_reversing_UPOnPress
_Delay_reversing_SETOnUp:
;Controller_events_code.c,1723 :: 		void Delay_reversing_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1724 :: 		Delay_reversing_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1725 :: 		Image346.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1726 :: 		DrawImage (&Delay_reversing_SET);
MOVW	R0, #lo_addr(_Delay_reversing_SET+0)
MOVT	R0, #hi_addr(_Delay_reversing_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1727 :: 		}
L_end_Delay_reversing_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnUp
_Delay_reversing_SETOnDown:
;Controller_events_code.c,1728 :: 		void Delay_reversing_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1729 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1733 :: 		send_data_packet(REVERS_DEL,1);
MOVS	R1, #1
MOVW	R0, #40
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1734 :: 		Delay_reversing_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_reversing_SET+20)
MOVT	R0, #hi_addr(_Delay_reversing_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1735 :: 		Image346.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image346+20)
MOVT	R0, #hi_addr(_Image346+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1736 :: 		DrawImage (&Image346);
MOVW	R0, #lo_addr(_Image346+0)
MOVT	R0, #hi_addr(_Image346+0)
BL	_DrawImage+0
;Controller_events_code.c,1737 :: 		}
L_end_Delay_reversing_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_reversing_SETOnDown
_Delay_trv_DOWNOnUp:
;Controller_events_code.c,1739 :: 		void Delay_trv_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1740 :: 		Image309.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1741 :: 		Delay_trv_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1742 :: 		DrawImage(&Delay_trv_DOWN);
MOVW	R0, #lo_addr(_Delay_trv_DOWN+0)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1743 :: 		}
L_end_Delay_trv_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_DOWNOnUp
_Delay_trv_DOWNOnPress:
;Controller_events_code.c,1744 :: 		void Delay_trv_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1747 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1748 :: 		Image309.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image309+20)
MOVT	R0, #hi_addr(_Image309+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1749 :: 		Delay_trv_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_DOWN+20)
MOVT	R0, #hi_addr(_Delay_trv_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1750 :: 		DrawImage(&Image309);
MOVW	R0, #lo_addr(_Image309+0)
MOVT	R0, #hi_addr(_Image309+0)
BL	_DrawImage+0
;Controller_events_code.c,1753 :: 		system_reg[TRV_DEL]--;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1754 :: 		if (system_reg[TRV_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_trv_DOWNOnPress264
;Controller_events_code.c,1755 :: 		system_reg[TRV_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_DOWNOnPress264:
;Controller_events_code.c,1756 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1757 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1758 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1759 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1760 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_trv_DOWNOnPress265:
SUBS	R7, R7, #1
BNE	L_Delay_trv_DOWNOnPress265
NOP
NOP
NOP
;Controller_events_code.c,1761 :: 		}
L_end_Delay_trv_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_DOWNOnPress
_Delay_trv_UPOnUp:
;Controller_events_code.c,1762 :: 		void Delay_trv_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1763 :: 		Image315.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1764 :: 		Delay_trv_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1765 :: 		DrawImage(&Delay_trv_up);
MOVW	R0, #lo_addr(_Delay_trv_up+0)
MOVT	R0, #hi_addr(_Delay_trv_up+0)
BL	_DrawImage+0
;Controller_events_code.c,1766 :: 		}
L_end_Delay_trv_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_trv_UPOnUp
_Delay_trv_UPOnPress:
;Controller_events_code.c,1767 :: 		void Delay_trv_UPOnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1770 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1771 :: 		Image315.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image315+20)
MOVT	R0, #hi_addr(_Image315+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1772 :: 		Delay_trv_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_trv_up+20)
MOVT	R0, #hi_addr(_Delay_trv_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1773 :: 		DrawImage(&Image315);
MOVW	R0, #lo_addr(_Image315+0)
MOVT	R0, #hi_addr(_Image315+0)
BL	_DrawImage+0
;Controller_events_code.c,1776 :: 		system_reg[TRV_DEL]++;
MOVW	R1, #lo_addr(_system_reg+840)
MOVT	R1, #hi_addr(_system_reg+840)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1777 :: 		if (system_reg[TRV_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_trv_UPOnPress267
;Controller_events_code.c,1778 :: 		system_reg[TRV_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
STRH	R1, [R0, #0]
L_Delay_trv_UPOnPress267:
;Controller_events_code.c,1779 :: 		IntToStr(system_reg[TRV_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1780 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1781 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1782 :: 		DrawRoundButton(&Delay_EEV);
MOVW	R0, #lo_addr(_Delay_EEV+0)
MOVT	R0, #hi_addr(_Delay_EEV+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1783 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_trv_UPOnPress268:
SUBS	R7, R7, #1
BNE	L_Delay_trv_UPOnPress268
NOP
NOP
NOP
;Controller_events_code.c,1784 :: 		}
L_end_Delay_trv_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_trv_UPOnPress
_Delay_EEV_SETOnUp:
;Controller_events_code.c,1785 :: 		void Delay_EEV_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1786 :: 		Delay_EEV_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1787 :: 		Image347.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1788 :: 		DrawImage (&Delay_EEV_SET);
MOVW	R0, #lo_addr(_Delay_EEV_SET+0)
MOVT	R0, #hi_addr(_Delay_EEV_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1789 :: 		}
L_end_Delay_EEV_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnUp
_Delay_EEV_SETOnDown:
;Controller_events_code.c,1790 :: 		void Delay_EEV_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1791 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1795 :: 		send_data_packet(TRV_DEL,1);
MOVS	R1, #1
MOVW	R0, #420
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1796 :: 		Delay_EEV_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_EEV_SET+20)
MOVT	R0, #hi_addr(_Delay_EEV_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1797 :: 		Image347.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image347+20)
MOVT	R0, #hi_addr(_Image347+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1798 :: 		DrawImage (&Image347);
MOVW	R0, #lo_addr(_Image347+0)
MOVT	R0, #hi_addr(_Image347+0)
BL	_DrawImage+0
;Controller_events_code.c,1799 :: 		}
L_end_Delay_EEV_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_EEV_SETOnDown
_Delay_DHW_valve_DOWNOnUp:
;Controller_events_code.c,1801 :: 		void Delay_DHW_valve_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1802 :: 		Image310.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1803 :: 		Delay_DHW_valve_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1804 :: 		DrawImage(&Delay_DHW_valve_DOWN);
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1805 :: 		}
L_end_Delay_DHW_valve_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_DOWNOnUp
_Delay_DHW_valve_DOWNOnPress:
;Controller_events_code.c,1806 :: 		void Delay_DHW_valve_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1809 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1810 :: 		Image310.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image310+20)
MOVT	R0, #hi_addr(_Image310+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1811 :: 		Delay_DHW_valve_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_DOWN+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1812 :: 		DrawImage(&Image310);
MOVW	R0, #lo_addr(_Image310+0)
MOVT	R0, #hi_addr(_Image310+0)
BL	_DrawImage+0
;Controller_events_code.c,1815 :: 		system_reg[THREE_WAY_DEL]--;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1816 :: 		if (system_reg[THREE_WAY_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_DHW_valve_DOWNOnPress270
;Controller_events_code.c,1817 :: 		system_reg[THREE_WAY_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_DOWNOnPress270:
;Controller_events_code.c,1818 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1819 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1820 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1821 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1822 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_DHW_valve_DOWNOnPress271:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_DOWNOnPress271
NOP
NOP
NOP
;Controller_events_code.c,1823 :: 		}
L_end_Delay_DHW_valve_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_DOWNOnPress
_Delay_DHW_valve_UPOnUp:
;Controller_events_code.c,1824 :: 		void Delay_DHW_valve_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1825 :: 		Image316.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1826 :: 		Delay_DHW_valve_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1827 :: 		DrawImage(&Delay_DHW_valve_UP);
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1828 :: 		}
L_end_Delay_DHW_valve_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_UPOnUp
_Delay_DHW_valve_UPOnPress:
;Controller_events_code.c,1829 :: 		void Delay_DHW_valve_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1832 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1833 :: 		Image316.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image316+20)
MOVT	R0, #hi_addr(_Image316+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1834 :: 		Delay_DHW_valve_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_UP+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1835 :: 		DrawImage(&Image316);
MOVW	R0, #lo_addr(_Image316+0)
MOVT	R0, #hi_addr(_Image316+0)
BL	_DrawImage+0
;Controller_events_code.c,1838 :: 		system_reg[THREE_WAY_DEL]++;
MOVW	R1, #lo_addr(_system_reg+100)
MOVT	R1, #hi_addr(_system_reg+100)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1839 :: 		if (system_reg[THREE_WAY_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_DHW_valve_UPOnPress273
;Controller_events_code.c,1840 :: 		system_reg[THREE_WAY_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
STRH	R1, [R0, #0]
L_Delay_DHW_valve_UPOnPress273:
;Controller_events_code.c,1841 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1842 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1843 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1844 :: 		DrawRoundButton(&Delay_DHW_valve);
MOVW	R0, #lo_addr(_Delay_DHW_valve+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1845 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_DHW_valve_UPOnPress274:
SUBS	R7, R7, #1
BNE	L_Delay_DHW_valve_UPOnPress274
NOP
NOP
NOP
;Controller_events_code.c,1846 :: 		}
L_end_Delay_DHW_valve_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_DHW_valve_UPOnPress
_Delay_DHW_valve_SETOnUp:
;Controller_events_code.c,1847 :: 		void Delay_DHW_valve_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1848 :: 		Delay_DHW_valve_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1849 :: 		Image348.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1850 :: 		DrawImage (&Delay_DHW_valve_SET);
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+0)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1851 :: 		}
L_end_Delay_DHW_valve_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnUp
_Delay_DHW_valve_SETOnDown:
;Controller_events_code.c,1852 :: 		void Delay_DHW_valve_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1853 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1857 :: 		send_data_packet(THREE_WAY_DEL,1);
MOVS	R1, #1
MOVW	R0, #50
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1858 :: 		Delay_DHW_valve_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_DHW_valve_SET+20)
MOVT	R0, #hi_addr(_Delay_DHW_valve_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1859 :: 		Image348.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image348+20)
MOVT	R0, #hi_addr(_Image348+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1860 :: 		DrawImage (&Image348);
MOVW	R0, #lo_addr(_Image348+0)
MOVT	R0, #hi_addr(_Image348+0)
BL	_DrawImage+0
;Controller_events_code.c,1861 :: 		}
L_end_Delay_DHW_valve_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_DHW_valve_SETOnDown
_Delay_compressor_DOWNOnUp:
;Controller_events_code.c,1863 :: 		void Delay_compressor_DOWNOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1864 :: 		Image311.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1865 :: 		Delay_compressor_DOWN.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1866 :: 		DrawImage(&Delay_compressor_DOWN);
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+0)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+0)
BL	_DrawImage+0
;Controller_events_code.c,1867 :: 		}
L_end_Delay_compressor_DOWNOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_DOWNOnUp
_Delay_compressor_DOWNOnPress:
;Controller_events_code.c,1868 :: 		void Delay_compressor_DOWNOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1871 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1872 :: 		Image311.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image311+20)
MOVT	R0, #hi_addr(_Image311+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1873 :: 		Delay_compressor_DOWN.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_DOWN+20)
MOVT	R0, #hi_addr(_Delay_compressor_DOWN+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1874 :: 		DrawImage(&Image311);
MOVW	R0, #lo_addr(_Image311+0)
MOVT	R0, #hi_addr(_Image311+0)
BL	_DrawImage+0
;Controller_events_code.c,1877 :: 		system_reg[COMP_DEL]--;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1878 :: 		if (system_reg[COMP_DEL] < 0)
CMP	R0, #0
IT	GE
BGE	L_Delay_compressor_DOWNOnPress276
;Controller_events_code.c,1879 :: 		system_reg[COMP_DEL] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_DOWNOnPress276:
;Controller_events_code.c,1880 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1881 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1882 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1883 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1884 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_compressor_DOWNOnPress277:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_DOWNOnPress277
NOP
NOP
NOP
;Controller_events_code.c,1885 :: 		}
L_end_Delay_compressor_DOWNOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_DOWNOnPress
_Delay_compressor_UPOnUp:
;Controller_events_code.c,1886 :: 		void Delay_compressor_UPOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1887 :: 		Image317.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1888 :: 		Delay_compressor_UP.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1889 :: 		DrawImage(&Delay_compressor_UP);
MOVW	R0, #lo_addr(_Delay_compressor_UP+0)
MOVT	R0, #hi_addr(_Delay_compressor_UP+0)
BL	_DrawImage+0
;Controller_events_code.c,1890 :: 		}
L_end_Delay_compressor_UPOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_UPOnUp
_Delay_compressor_UPOnPress:
;Controller_events_code.c,1891 :: 		void Delay_compressor_UPOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1894 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1895 :: 		Image317.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image317+20)
MOVT	R0, #hi_addr(_Image317+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1896 :: 		Delay_compressor_UP.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_UP+20)
MOVT	R0, #hi_addr(_Delay_compressor_UP+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1897 :: 		DrawImage(&Image317);
MOVW	R0, #lo_addr(_Image317+0)
MOVT	R0, #hi_addr(_Image317+0)
BL	_DrawImage+0
;Controller_events_code.c,1900 :: 		system_reg[COMP_DEL]++;
MOVW	R1, #lo_addr(_system_reg+20)
MOVT	R1, #hi_addr(_system_reg+20)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1901 :: 		if (system_reg[COMP_DEL] >99)
CMP	R0, #99
IT	LE
BLE	L_Delay_compressor_UPOnPress279
;Controller_events_code.c,1902 :: 		system_reg[COMP_DEL] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
STRH	R1, [R0, #0]
L_Delay_compressor_UPOnPress279:
;Controller_events_code.c,1903 :: 		IntToStr(system_reg[COMP_DEL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1904 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1905 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1906 :: 		DrawRoundButton(&Delay_compressor);
MOVW	R0, #lo_addr(_Delay_compressor+0)
MOVT	R0, #hi_addr(_Delay_compressor+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1907 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Delay_compressor_UPOnPress280:
SUBS	R7, R7, #1
BNE	L_Delay_compressor_UPOnPress280
NOP
NOP
NOP
;Controller_events_code.c,1908 :: 		}
L_end_Delay_compressor_UPOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Delay_compressor_UPOnPress
_Delay_compressor_SETOnUp:
;Controller_events_code.c,1909 :: 		void Delay_compressor_SETOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1910 :: 		Delay_compressor_SET.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1911 :: 		Image349.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1912 :: 		DrawImage (&Delay_compressor_SET);
MOVW	R0, #lo_addr(_Delay_compressor_SET+0)
MOVT	R0, #hi_addr(_Delay_compressor_SET+0)
BL	_DrawImage+0
;Controller_events_code.c,1913 :: 		}
L_end_Delay_compressor_SETOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnUp
_Delay_compressor_SETOnDown:
;Controller_events_code.c,1914 :: 		void Delay_compressor_SETOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1915 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,1919 :: 		send_data_packet(COMP_DEL,1);
MOVS	R1, #1
MOVW	R0, #10
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,1920 :: 		Delay_compressor_SET.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Delay_compressor_SET+20)
MOVT	R0, #hi_addr(_Delay_compressor_SET+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1921 :: 		Image349.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image349+20)
MOVT	R0, #hi_addr(_Image349+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1922 :: 		DrawImage (&Image349);
MOVW	R0, #lo_addr(_Image349+0)
MOVT	R0, #hi_addr(_Image349+0)
BL	_DrawImage+0
;Controller_events_code.c,1923 :: 		}
L_end_Delay_compressor_SETOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Delay_compressor_SETOnDown
_Down_1_OnUp:
;Controller_events_code.c,1926 :: 		void Down_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1927 :: 		Image200.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1928 :: 		Down_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1929 :: 		DrawImage(&Down_1_);
MOVW	R0, #lo_addr(_Down_1_+0)
MOVT	R0, #hi_addr(_Down_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1930 :: 		}
L_end_Down_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_1_OnUp
_Down_1_OnPress:
;Controller_events_code.c,1931 :: 		void Down_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1933 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1934 :: 		Image200.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image200+20)
MOVT	R0, #hi_addr(_Image200+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1935 :: 		Down_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_1_+20)
MOVT	R0, #hi_addr(_Down_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1936 :: 		DrawImage(&Image200);
MOVW	R0, #lo_addr(_Image200+0)
MOVT	R0, #hi_addr(_Image200+0)
BL	_DrawImage+0
;Controller_events_code.c,1937 :: 		system_reg[HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1938 :: 		if (system_reg[HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_1_OnPress282
;Controller_events_code.c,1939 :: 		system_reg[HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Down_1_OnPress282:
;Controller_events_code.c,1940 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1941 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1942 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1943 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1944 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_1_OnPress283:
SUBS	R7, R7, #1
BNE	L_Down_1_OnPress283
NOP
NOP
NOP
;Controller_events_code.c,1945 :: 		}
L_end_Down_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_1_OnPress
_Up_1_OnUp:
;Controller_events_code.c,1946 :: 		void Up_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1947 :: 		Image218.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1948 :: 		Up_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1949 :: 		DrawImage(&Up_1_);
MOVW	R0, #lo_addr(_Up_1_+0)
MOVT	R0, #hi_addr(_Up_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,1950 :: 		}
L_end_Up_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_1_OnUp
_Up_1_OnPress:
;Controller_events_code.c,1951 :: 		void Up_1_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1953 :: 		Tone2();
BL	_Tone2+0
;Controller_events_code.c,1954 :: 		Image218.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image218+20)
MOVT	R0, #hi_addr(_Image218+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1955 :: 		Up_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_1_+20)
MOVT	R0, #hi_addr(_Up_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1956 :: 		DrawImage(&Image218);
MOVW	R0, #lo_addr(_Image218+0)
MOVT	R0, #hi_addr(_Image218+0)
BL	_DrawImage+0
;Controller_events_code.c,1957 :: 		system_reg[HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+180)
MOVT	R1, #hi_addr(_system_reg+180)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1958 :: 		if (system_reg[HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_1_OnPress285
;Controller_events_code.c,1959 :: 		system_reg[HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
STRH	R1, [R0, #0]
L_Up_1_OnPress285:
;Controller_events_code.c,1960 :: 		IntToStr(system_reg[HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1961 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1962 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1963 :: 		DrawRoundButton(&Set_min_heating_HP);
MOVW	R0, #lo_addr(_Set_min_heating_HP+0)
MOVT	R0, #hi_addr(_Set_min_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1964 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_1_OnPress286:
SUBS	R7, R7, #1
BNE	L_Up_1_OnPress286
NOP
NOP
NOP
;Controller_events_code.c,1965 :: 		}
L_end_Up_1_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_1_OnPress
_Down_2_OnUp:
;Controller_events_code.c,1966 :: 		void Down_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,1967 :: 		Image205.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1968 :: 		Down_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1969 :: 		DrawImage(&Down_2_);
MOVW	R0, #lo_addr(_Down_2_+0)
MOVT	R0, #hi_addr(_Down_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,1970 :: 		}
L_end_Down_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_2_OnUp
_Down_2_OnPress:
;Controller_events_code.c,1972 :: 		void Down_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1974 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,1975 :: 		Image205.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image205+20)
MOVT	R0, #hi_addr(_Image205+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1976 :: 		Down_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_2_+20)
MOVT	R0, #hi_addr(_Down_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1977 :: 		DrawImage(&Image205);
MOVW	R0, #lo_addr(_Image205+0)
MOVT	R0, #hi_addr(_Image205+0)
BL	_DrawImage+0
;Controller_events_code.c,1979 :: 		system_reg[HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1980 :: 		if (system_reg[HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_2_OnPress288
;Controller_events_code.c,1981 :: 		system_reg[HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Down_2_OnPress288:
;Controller_events_code.c,1982 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1983 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,1984 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,1985 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,1986 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_2_OnPress289:
SUBS	R7, R7, #1
BNE	L_Down_2_OnPress289
NOP
NOP
NOP
;Controller_events_code.c,1987 :: 		}
L_end_Down_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_2_OnPress
_Up_2_OnPress:
;Controller_events_code.c,1988 :: 		void Up_2_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,1990 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,1991 :: 		Image219.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1992 :: 		Up_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,1993 :: 		DrawImage(&Image219);
MOVW	R0, #lo_addr(_Image219+0)
MOVT	R0, #hi_addr(_Image219+0)
BL	_DrawImage+0
;Controller_events_code.c,1995 :: 		system_reg[HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+160)
MOVT	R1, #hi_addr(_system_reg+160)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,1996 :: 		if (system_reg[HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_2_OnPress291
;Controller_events_code.c,1997 :: 		system_reg[HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
STRH	R1, [R0, #0]
L_Up_2_OnPress291:
;Controller_events_code.c,1998 :: 		IntToStr(system_reg[HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,1999 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2000 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2001 :: 		DrawRoundButton(&Set_max_heating_HP);
MOVW	R0, #lo_addr(_Set_max_heating_HP+0)
MOVT	R0, #hi_addr(_Set_max_heating_HP+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2002 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_2_OnPress292:
SUBS	R7, R7, #1
BNE	L_Up_2_OnPress292
NOP
NOP
NOP
;Controller_events_code.c,2003 :: 		}
L_end_Up_2_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_2_OnPress
_Up_2_OnUp:
;Controller_events_code.c,2004 :: 		void Up_2_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2005 :: 		Image219.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image219+20)
MOVT	R0, #hi_addr(_Image219+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2006 :: 		Up_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_2_+20)
MOVT	R0, #hi_addr(_Up_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2007 :: 		DrawImage(&Up_2_);
MOVW	R0, #lo_addr(_Up_2_+0)
MOVT	R0, #hi_addr(_Up_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,2008 :: 		}
L_end_Up_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_2_OnUp
_Down_3_OnPress:
;Controller_events_code.c,2010 :: 		void Down_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2012 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2013 :: 		Image206.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2014 :: 		Down_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2015 :: 		DrawImage(&Image206);
MOVW	R0, #lo_addr(_Image206+0)
MOVT	R0, #hi_addr(_Image206+0)
BL	_DrawImage+0
;Controller_events_code.c,2017 :: 		system_reg[EXAUST_MAX]--;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2018 :: 		if (system_reg[EXAUST_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_3_OnPress294
;Controller_events_code.c,2019 :: 		system_reg[EXAUST_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Down_3_OnPress294:
;Controller_events_code.c,2020 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2021 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2022 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2023 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2024 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_3_OnPress295:
SUBS	R7, R7, #1
BNE	L_Down_3_OnPress295
NOP
NOP
NOP
;Controller_events_code.c,2025 :: 		}
L_end_Down_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_3_OnPress
_Down_3_OnUp:
;Controller_events_code.c,2026 :: 		void Down_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2027 :: 		Image206.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image206+20)
MOVT	R0, #hi_addr(_Image206+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2028 :: 		Down_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_3_+20)
MOVT	R0, #hi_addr(_Down_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2029 :: 		DrawImage(&Down_3_);
MOVW	R0, #lo_addr(_Down_3_+0)
MOVT	R0, #hi_addr(_Down_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,2030 :: 		}
L_end_Down_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_3_OnUp
_Up_3_OnPress:
;Controller_events_code.c,2031 :: 		void Up_3_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2033 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2034 :: 		Image220.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2035 :: 		Up_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2036 :: 		DrawImage(&Image220);
MOVW	R0, #lo_addr(_Image220+0)
MOVT	R0, #hi_addr(_Image220+0)
BL	_DrawImage+0
;Controller_events_code.c,2037 :: 		system_reg[EXAUST_MAX]++;
MOVW	R1, #lo_addr(_system_reg+360)
MOVT	R1, #hi_addr(_system_reg+360)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2038 :: 		if(system_reg[EXAUST_MAX]>115)
CMP	R0, #115
IT	LE
BLE	L_Up_3_OnPress297
;Controller_events_code.c,2039 :: 		system_reg[EXAUST_MAX] = 115;
MOVS	R1, #115
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
STRH	R1, [R0, #0]
L_Up_3_OnPress297:
;Controller_events_code.c,2040 :: 		IntToStr(system_reg[EXAUST_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2041 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2042 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2043 :: 		DrawRoundButton(&Set_max_exhaust);
MOVW	R0, #lo_addr(_Set_max_exhaust+0)
MOVT	R0, #hi_addr(_Set_max_exhaust+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2044 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_3_OnPress298:
SUBS	R7, R7, #1
BNE	L_Up_3_OnPress298
NOP
NOP
NOP
;Controller_events_code.c,2045 :: 		}
L_end_Up_3_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_3_OnPress
_Up_3_OnUp:
;Controller_events_code.c,2046 :: 		void Up_3_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2047 :: 		Image220.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image220+20)
MOVT	R0, #hi_addr(_Image220+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2048 :: 		Up_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_3_+20)
MOVT	R0, #hi_addr(_Up_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2049 :: 		DrawImage(&Up_3_);
MOVW	R0, #lo_addr(_Up_3_+0)
MOVT	R0, #hi_addr(_Up_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,2050 :: 		}
L_end_Up_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_3_OnUp
_Down_4_OnPress:
;Controller_events_code.c,2051 :: 		void Down_4_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2053 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2054 :: 		Image207.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2055 :: 		Down_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2056 :: 		DrawImage(&Image207);
MOVW	R0, #lo_addr(_Image207+0)
MOVT	R0, #hi_addr(_Image207+0)
BL	_DrawImage+0
;Controller_events_code.c,2058 :: 		system_reg[SOURS_MIN]--;
MOVW	R2, #lo_addr(_system_reg+880)
MOVT	R2, #hi_addr(_system_reg+880)
LDRSH	R0, [R2, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Controller_events_code.c,2059 :: 		if (system_reg[SOURS_MIN] < -30)
MVN	R0, #29
CMP	R1, R0
IT	GE
BGE	L_Down_4_OnPress300
;Controller_events_code.c,2060 :: 		system_reg[SOURS_MIN] = -30;
MOVW	R1, #65506
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Down_4_OnPress300:
;Controller_events_code.c,2061 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2062 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2063 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2064 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2065 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_4_OnPress301:
SUBS	R7, R7, #1
BNE	L_Down_4_OnPress301
NOP
NOP
NOP
;Controller_events_code.c,2066 :: 		}
L_end_Down_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_4_OnPress
_Up_4_OnPress:
;Controller_events_code.c,2067 :: 		void Up_4_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2069 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2070 :: 		Image221.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2071 :: 		Up_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2072 :: 		DrawImage(&Image221);
MOVW	R0, #lo_addr(_Image221+0)
MOVT	R0, #hi_addr(_Image221+0)
BL	_DrawImage+0
;Controller_events_code.c,2074 :: 		system_reg[SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+880)
MOVT	R1, #hi_addr(_system_reg+880)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2075 :: 		if (system_reg[SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_4_OnPress303
;Controller_events_code.c,2076 :: 		system_reg[SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
STRH	R1, [R0, #0]
L_Up_4_OnPress303:
;Controller_events_code.c,2077 :: 		IntToStr(system_reg[SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2078 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2079 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2080 :: 		DrawRoundButton(&Set_min_source_temp);
MOVW	R0, #lo_addr(_Set_min_source_temp+0)
MOVT	R0, #hi_addr(_Set_min_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2081 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_4_OnPress304:
SUBS	R7, R7, #1
BNE	L_Up_4_OnPress304
NOP
NOP
NOP
;Controller_events_code.c,2083 :: 		}
L_end_Up_4_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_4_OnPress
_Down_4_OnUp:
;Controller_events_code.c,2084 :: 		void Down_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2085 :: 		Image207.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image207+20)
MOVT	R0, #hi_addr(_Image207+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2086 :: 		Down_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_4_+20)
MOVT	R0, #hi_addr(_Down_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2087 :: 		DrawImage(&Down_4_);
MOVW	R0, #lo_addr(_Down_4_+0)
MOVT	R0, #hi_addr(_Down_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,2088 :: 		}
L_end_Down_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_4_OnUp
_Up_4_OnUp:
;Controller_events_code.c,2089 :: 		void Up_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2090 :: 		Image221.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image221+20)
MOVT	R0, #hi_addr(_Image221+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2091 :: 		Up_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_4_+20)
MOVT	R0, #hi_addr(_Up_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2092 :: 		DrawImage(&Up_4_);
MOVW	R0, #lo_addr(_Up_4_+0)
MOVT	R0, #hi_addr(_Up_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,2093 :: 		}
L_end_Up_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_4_OnUp
_Down_5_OnUp:
;Controller_events_code.c,2094 :: 		void Down_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2095 :: 		Image208.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2096 :: 		Down_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2097 :: 		DrawImage(&Down_5_);
MOVW	R0, #lo_addr(_Down_5_+0)
MOVT	R0, #hi_addr(_Down_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2098 :: 		}
L_end_Down_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_5_OnUp
_Down_5_OnPress:
;Controller_events_code.c,2099 :: 		void Down_5_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2101 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2102 :: 		Image208.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image208+20)
MOVT	R0, #hi_addr(_Image208+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2103 :: 		Down_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_5_+20)
MOVT	R0, #hi_addr(_Down_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2104 :: 		DrawImage(&Image208);
MOVW	R0, #lo_addr(_Image208+0)
MOVT	R0, #hi_addr(_Image208+0)
BL	_DrawImage+0
;Controller_events_code.c,2105 :: 		system_reg[SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2106 :: 		if (system_reg[SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_5_OnPress306
;Controller_events_code.c,2107 :: 		system_reg[SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Down_5_OnPress306:
;Controller_events_code.c,2108 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2109 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2110 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2111 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2112 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_5_OnPress307:
SUBS	R7, R7, #1
BNE	L_Down_5_OnPress307
NOP
NOP
NOP
;Controller_events_code.c,2113 :: 		}
L_end_Down_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_5_OnPress
_Up_5_OnPress:
;Controller_events_code.c,2114 :: 		void Up_5_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2116 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2117 :: 		Image222.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2118 :: 		Up_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2119 :: 		DrawImage(&Image222);
MOVW	R0, #lo_addr(_Image222+0)
MOVT	R0, #hi_addr(_Image222+0)
BL	_DrawImage+0
;Controller_events_code.c,2120 :: 		system_reg[SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+860)
MOVT	R1, #hi_addr(_system_reg+860)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2121 :: 		if (system_reg[SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_5_OnPress309
;Controller_events_code.c,2122 :: 		system_reg[SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
STRH	R1, [R0, #0]
L_Up_5_OnPress309:
;Controller_events_code.c,2123 :: 		IntToStr(system_reg[SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2124 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2125 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2126 :: 		DrawRoundButton(&Set_max_source_temp);
MOVW	R0, #lo_addr(_Set_max_source_temp+0)
MOVT	R0, #hi_addr(_Set_max_source_temp+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2127 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_5_OnPress310:
SUBS	R7, R7, #1
BNE	L_Up_5_OnPress310
NOP
NOP
NOP
;Controller_events_code.c,2128 :: 		}
L_end_Up_5_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_5_OnPress
_Up_5_OnUp:
;Controller_events_code.c,2129 :: 		void Up_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2130 :: 		Image222.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image222+20)
MOVT	R0, #hi_addr(_Image222+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2131 :: 		Up_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_5_+20)
MOVT	R0, #hi_addr(_Up_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2132 :: 		DrawImage(&Up_5_);
MOVW	R0, #lo_addr(_Up_5_+0)
MOVT	R0, #hi_addr(_Up_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2133 :: 		}
L_end_Up_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_5_OnUp
_Down_6_OnPress:
;Controller_events_code.c,2134 :: 		void Down_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2136 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2137 :: 		Image209.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2138 :: 		Down_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2139 :: 		DrawImage(&Image209);
MOVW	R0, #lo_addr(_Image209+0)
MOVT	R0, #hi_addr(_Image209+0)
BL	_DrawImage+0
;Controller_events_code.c,2140 :: 		system_reg[DEL_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2141 :: 		if (system_reg[DEL_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_6_OnPress312
;Controller_events_code.c,2142 :: 		system_reg[DEL_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Down_6_OnPress312:
;Controller_events_code.c,2143 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2144 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2145 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2146 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2147 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_6_OnPress313:
SUBS	R7, R7, #1
BNE	L_Down_6_OnPress313
NOP
NOP
NOP
;Controller_events_code.c,2148 :: 		}
L_end_Down_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_6_OnPress
_Down_6_OnUp:
;Controller_events_code.c,2149 :: 		void Down_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2150 :: 		Image209.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image209+20)
MOVT	R0, #hi_addr(_Image209+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2151 :: 		Down_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_6_+20)
MOVT	R0, #hi_addr(_Down_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2152 :: 		DrawImage(&Down_6_);
MOVW	R0, #lo_addr(_Down_6_+0)
MOVT	R0, #hi_addr(_Down_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2153 :: 		}
L_end_Down_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_6_OnUp
_Up_6_OnPress:
;Controller_events_code.c,2154 :: 		void Up_6_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2156 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2157 :: 		Image223.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2158 :: 		Up_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2159 :: 		DrawImage(&Image223);
MOVW	R0, #lo_addr(_Image223+0)
MOVT	R0, #hi_addr(_Image223+0)
BL	_DrawImage+0
;Controller_events_code.c,2160 :: 		system_reg[DEL_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+220)
MOVT	R1, #hi_addr(_system_reg+220)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2161 :: 		if (system_reg[DEL_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_6_OnPress315
;Controller_events_code.c,2162 :: 		system_reg[DEL_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
STRH	R1, [R0, #0]
L_Up_6_OnPress315:
;Controller_events_code.c,2163 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2164 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2165 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2166 :: 		DrawRoundButton(&Set_min_delta_heat);
MOVW	R0, #lo_addr(_Set_min_delta_heat+0)
MOVT	R0, #hi_addr(_Set_min_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2167 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_6_OnPress316:
SUBS	R7, R7, #1
BNE	L_Up_6_OnPress316
NOP
NOP
NOP
;Controller_events_code.c,2168 :: 		}
L_end_Up_6_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_6_OnPress
_Up_6_OnUp:
;Controller_events_code.c,2169 :: 		void Up_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2170 :: 		Image223.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image223+20)
MOVT	R0, #hi_addr(_Image223+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2171 :: 		Up_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_6_+20)
MOVT	R0, #hi_addr(_Up_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2172 :: 		DrawImage(&Up_6_);
MOVW	R0, #lo_addr(_Up_6_+0)
MOVT	R0, #hi_addr(_Up_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2173 :: 		}
L_end_Up_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_6_OnUp
_Set_1_OnDown:
;Controller_events_code.c,2174 :: 		void Set_1_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2175 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2179 :: 		send_data_packet(HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #90
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2180 :: 		Set_1_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2181 :: 		Image246.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2182 :: 		DrawImage (&Image246);
MOVW	R0, #lo_addr(_Image246+0)
MOVT	R0, #hi_addr(_Image246+0)
BL	_DrawImage+0
;Controller_events_code.c,2183 :: 		}
L_end_Set_1_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnDown
_Set_1_OnUp:
;Controller_events_code.c,2184 :: 		void Set_1_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2185 :: 		Set_1_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_1_+20)
MOVT	R0, #hi_addr(_Set_1_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2186 :: 		Image246.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image246+20)
MOVT	R0, #hi_addr(_Image246+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2187 :: 		DrawImage (&Set_1_);
MOVW	R0, #lo_addr(_Set_1_+0)
MOVT	R0, #hi_addr(_Set_1_+0)
BL	_DrawImage+0
;Controller_events_code.c,2188 :: 		}
L_end_Set_1_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_1_OnUp
_Set_2_OnDown:
;Controller_events_code.c,2189 :: 		void Set_2_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2190 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2194 :: 		send_data_packet(HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #80
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2195 :: 		Set_2_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2196 :: 		Image247.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2197 :: 		DrawImage (&Image247);
MOVW	R0, #lo_addr(_Image247+0)
MOVT	R0, #hi_addr(_Image247+0)
BL	_DrawImage+0
;Controller_events_code.c,2198 :: 		}
L_end_Set_2_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnDown
_Set_2_OnUp:
;Controller_events_code.c,2199 :: 		void Set_2_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2200 :: 		Set_2_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_2_+20)
MOVT	R0, #hi_addr(_Set_2_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2201 :: 		Image247.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image247+20)
MOVT	R0, #hi_addr(_Image247+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2202 :: 		DrawImage (&Set_2_);
MOVW	R0, #lo_addr(_Set_2_+0)
MOVT	R0, #hi_addr(_Set_2_+0)
BL	_DrawImage+0
;Controller_events_code.c,2203 :: 		}
L_end_Set_2_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_2_OnUp
_Set_3_OnDown:
;Controller_events_code.c,2205 :: 		void Set_3_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2206 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2210 :: 		send_data_packet(EXAUST_MAX,1);
MOVS	R1, #1
MOVW	R0, #180
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2211 :: 		Set_3_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2212 :: 		Image248.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2213 :: 		DrawImage (&Image248);
MOVW	R0, #lo_addr(_Image248+0)
MOVT	R0, #hi_addr(_Image248+0)
BL	_DrawImage+0
;Controller_events_code.c,2214 :: 		}
L_end_Set_3_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnDown
_Set_3_OnUp:
;Controller_events_code.c,2215 :: 		void Set_3_OnUp()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2216 :: 		Set_3_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_3_+20)
MOVT	R0, #hi_addr(_Set_3_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2217 :: 		Image248.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image248+20)
MOVT	R0, #hi_addr(_Image248+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2218 :: 		DrawImage (&Set_3_);
MOVW	R0, #lo_addr(_Set_3_+0)
MOVT	R0, #hi_addr(_Set_3_+0)
BL	_DrawImage+0
;Controller_events_code.c,2219 :: 		}
L_end_Set_3_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_3_OnUp
_Set_4_OnDown:
;Controller_events_code.c,2220 :: 		void Set_4_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2221 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2225 :: 		send_data_packet(SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #440
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2226 :: 		Set_4_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2227 :: 		Image249.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2228 :: 		DrawImage (&Image249);
MOVW	R0, #lo_addr(_Image249+0)
MOVT	R0, #hi_addr(_Image249+0)
BL	_DrawImage+0
;Controller_events_code.c,2229 :: 		}
L_end_Set_4_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnDown
_Set_4_OnUp:
;Controller_events_code.c,2231 :: 		void Set_4_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2232 :: 		Set_4_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_4_+20)
MOVT	R0, #hi_addr(_Set_4_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2233 :: 		Image249.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image249+20)
MOVT	R0, #hi_addr(_Image249+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2234 :: 		DrawImage (&Set_4_);
MOVW	R0, #lo_addr(_Set_4_+0)
MOVT	R0, #hi_addr(_Set_4_+0)
BL	_DrawImage+0
;Controller_events_code.c,2235 :: 		}
L_end_Set_4_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_4_OnUp
_Set_5_OnDown:
;Controller_events_code.c,2237 :: 		void Set_5_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2238 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2242 :: 		send_data_packet(SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #430
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2243 :: 		Set_5_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2244 :: 		Image250.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2245 :: 		DrawImage (&Image250);
MOVW	R0, #lo_addr(_Image250+0)
MOVT	R0, #hi_addr(_Image250+0)
BL	_DrawImage+0
;Controller_events_code.c,2246 :: 		}
L_end_Set_5_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnDown
_Set_5_OnUp:
;Controller_events_code.c,2247 :: 		void Set_5_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2248 :: 		Set_5_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_5_+20)
MOVT	R0, #hi_addr(_Set_5_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2249 :: 		Image250.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image250+20)
MOVT	R0, #hi_addr(_Image250+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2250 :: 		DrawImage (&Set_5_);
MOVW	R0, #lo_addr(_Set_5_+0)
MOVT	R0, #hi_addr(_Set_5_+0)
BL	_DrawImage+0
;Controller_events_code.c,2251 :: 		}
L_end_Set_5_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_5_OnUp
_Furnance_HP_OFF_save_ondown:
;Controller_events_code.c,2252 :: 		void Furnance_HP_OFF_save_ondown() {
;Controller_events_code.c,2254 :: 		}
L_end_Furnance_HP_OFF_save_ondown:
BX	LR
; end of _Furnance_HP_OFF_save_ondown
_Set_6_OnUp:
;Controller_events_code.c,2255 :: 		void Set_6_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2256 :: 		Set_6_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2257 :: 		Image251.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2258 :: 		DrawImage (&Set_6_);
MOVW	R0, #lo_addr(_Set_6_+0)
MOVT	R0, #hi_addr(_Set_6_+0)
BL	_DrawImage+0
;Controller_events_code.c,2259 :: 		}
L_end_Set_6_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnUp
_Set_6_OnDown:
;Controller_events_code.c,2260 :: 		void Set_6_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2261 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2265 :: 		send_data_packet(DEL_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #110
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2266 :: 		Set_6_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_6_+20)
MOVT	R0, #hi_addr(_Set_6_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2267 :: 		Image251.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image251+20)
MOVT	R0, #hi_addr(_Image251+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2268 :: 		DrawImage (&Image251);
MOVW	R0, #lo_addr(_Image251+0)
MOVT	R0, #hi_addr(_Image251+0)
BL	_DrawImage+0
;Controller_events_code.c,2269 :: 		}
L_end_Set_6_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_6_OnDown
_Down_7_OnUp:
;Controller_events_code.c,2271 :: 		void Down_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2272 :: 		Image210.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2273 :: 		Down_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2274 :: 		DrawImage(&Down_7_);
MOVW	R0, #lo_addr(_Down_7_+0)
MOVT	R0, #hi_addr(_Down_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2275 :: 		}
L_end_Down_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_7_OnUp
_Down_7_OnPress:
;Controller_events_code.c,2276 :: 		void Down_7_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2278 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2279 :: 		Image210.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image210+20)
MOVT	R0, #hi_addr(_Image210+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2280 :: 		Down_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_7_+20)
MOVT	R0, #hi_addr(_Down_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2281 :: 		DrawImage(&Image210);
MOVW	R0, #lo_addr(_Image210+0)
MOVT	R0, #hi_addr(_Image210+0)
BL	_DrawImage+0
;Controller_events_code.c,2282 :: 		system_reg[DEL_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2283 :: 		if (system_reg[DEL_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_7_OnPress318
;Controller_events_code.c,2284 :: 		system_reg[DEL_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Down_7_OnPress318:
;Controller_events_code.c,2285 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2286 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2287 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2288 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2289 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_7_OnPress319:
SUBS	R7, R7, #1
BNE	L_Down_7_OnPress319
NOP
NOP
NOP
;Controller_events_code.c,2290 :: 		}
L_end_Down_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_7_OnPress
_Up_7_OnPress:
;Controller_events_code.c,2292 :: 		void Up_7_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2294 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2295 :: 		Image224.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2296 :: 		Up_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2297 :: 		DrawImage(&Image224);
MOVW	R0, #lo_addr(_Image224+0)
MOVT	R0, #hi_addr(_Image224+0)
BL	_DrawImage+0
;Controller_events_code.c,2298 :: 		system_reg[DEL_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+200)
MOVT	R1, #hi_addr(_system_reg+200)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2299 :: 		if (system_reg[DEL_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_7_OnPress321
;Controller_events_code.c,2300 :: 		system_reg[DEL_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
STRH	R1, [R0, #0]
L_Up_7_OnPress321:
;Controller_events_code.c,2301 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2302 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2303 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2304 :: 		DrawRoundButton(&Set_max_delta_heat);
MOVW	R0, #lo_addr(_Set_max_delta_heat+0)
MOVT	R0, #hi_addr(_Set_max_delta_heat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2305 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_7_OnPress322:
SUBS	R7, R7, #1
BNE	L_Up_7_OnPress322
NOP
NOP
NOP
;Controller_events_code.c,2307 :: 		}
L_end_Up_7_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_7_OnPress
_Up_7_OnUp:
;Controller_events_code.c,2309 :: 		void Up_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2310 :: 		Image224.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image224+20)
MOVT	R0, #hi_addr(_Image224+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2311 :: 		Up_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_7_+20)
MOVT	R0, #hi_addr(_Up_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2312 :: 		DrawImage(&Up_7_);
MOVW	R0, #lo_addr(_Up_7_+0)
MOVT	R0, #hi_addr(_Up_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2314 :: 		}
L_end_Up_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_7_OnUp
_Down_8_OnPress:
;Controller_events_code.c,2316 :: 		void Down_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2318 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2319 :: 		Image211.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2320 :: 		Down_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2321 :: 		DrawImage(&Image211);
MOVW	R0, #lo_addr(_Image211+0)
MOVT	R0, #hi_addr(_Image211+0)
BL	_DrawImage+0
;Controller_events_code.c,2322 :: 		system_reg[DEL_DHW_MIN]--;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2323 :: 		if (system_reg[DEL_DHW_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_8_OnPress324
;Controller_events_code.c,2324 :: 		system_reg[DEL_DHW_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Down_8_OnPress324:
;Controller_events_code.c,2325 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2326 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2327 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2328 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2329 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_8_OnPress325:
SUBS	R7, R7, #1
BNE	L_Down_8_OnPress325
NOP
NOP
NOP
;Controller_events_code.c,2330 :: 		}
L_end_Down_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_8_OnPress
_Down_8_OnUp:
;Controller_events_code.c,2332 :: 		void Down_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2333 :: 		Image211.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image211+20)
MOVT	R0, #hi_addr(_Image211+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2334 :: 		Down_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_8_+20)
MOVT	R0, #hi_addr(_Down_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2335 :: 		DrawImage(&Down_8_);
MOVW	R0, #lo_addr(_Down_8_+0)
MOVT	R0, #hi_addr(_Down_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2336 :: 		}
L_end_Down_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_8_OnUp
_Up_8_OnPress:
;Controller_events_code.c,2338 :: 		void Up_8_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2340 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2341 :: 		Image225.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2342 :: 		Up_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2343 :: 		DrawImage(&Image225);
MOVW	R0, #lo_addr(_Image225+0)
MOVT	R0, #hi_addr(_Image225+0)
BL	_DrawImage+0
;Controller_events_code.c,2344 :: 		system_reg[DEL_DHW_MIN]++;
MOVW	R1, #lo_addr(_system_reg+920)
MOVT	R1, #hi_addr(_system_reg+920)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2345 :: 		if (system_reg[DEL_DHW_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_8_OnPress327
;Controller_events_code.c,2346 :: 		system_reg[DEL_DHW_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
STRH	R1, [R0, #0]
L_Up_8_OnPress327:
;Controller_events_code.c,2347 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2348 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2349 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2350 :: 		DrawRoundButton(&Set_min_delta_DHW);
MOVW	R0, #lo_addr(_Set_min_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2351 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_8_OnPress328:
SUBS	R7, R7, #1
BNE	L_Up_8_OnPress328
NOP
NOP
NOP
;Controller_events_code.c,2352 :: 		}
L_end_Up_8_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_8_OnPress
_Up_8_OnUp:
;Controller_events_code.c,2354 :: 		void Up_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2355 :: 		Image225.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image225+20)
MOVT	R0, #hi_addr(_Image225+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2356 :: 		Up_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_8_+20)
MOVT	R0, #hi_addr(_Up_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2357 :: 		DrawImage(&Up_8_);
MOVW	R0, #lo_addr(_Up_8_+0)
MOVT	R0, #hi_addr(_Up_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2358 :: 		}
L_end_Up_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_8_OnUp
_Down_9_OnPress:
;Controller_events_code.c,2360 :: 		void Down_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2362 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2363 :: 		Image214.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2364 :: 		Down_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2365 :: 		DrawImage(&Image214);
MOVW	R0, #lo_addr(_Image214+0)
MOVT	R0, #hi_addr(_Image214+0)
BL	_DrawImage+0
;Controller_events_code.c,2366 :: 		system_reg[DEL_DHW_MAX]--;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2367 :: 		if (system_reg[DEL_DHW_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_9_OnPress330
;Controller_events_code.c,2368 :: 		system_reg[DEL_DHW_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Down_9_OnPress330:
;Controller_events_code.c,2369 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2370 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2371 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2372 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2373 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_9_OnPress331:
SUBS	R7, R7, #1
BNE	L_Down_9_OnPress331
NOP
NOP
NOP
;Controller_events_code.c,2374 :: 		}
L_end_Down_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_9_OnPress
_Down_9_OnUp:
;Controller_events_code.c,2376 :: 		void Down_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2377 :: 		Image214.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image214+20)
MOVT	R0, #hi_addr(_Image214+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2378 :: 		Down_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_9_+20)
MOVT	R0, #hi_addr(_Down_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2379 :: 		DrawImage(&Down_9_);
MOVW	R0, #lo_addr(_Down_9_+0)
MOVT	R0, #hi_addr(_Down_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2380 :: 		}
L_end_Down_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_9_OnUp
_Up_9_OnPress:
;Controller_events_code.c,2382 :: 		void Up_9_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2384 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2385 :: 		Image228.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2386 :: 		Up_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2387 :: 		DrawImage(&Image228);
MOVW	R0, #lo_addr(_Image228+0)
MOVT	R0, #hi_addr(_Image228+0)
BL	_DrawImage+0
;Controller_events_code.c,2388 :: 		system_reg[DEL_DHW_MAX]++;
MOVW	R1, #lo_addr(_system_reg+900)
MOVT	R1, #hi_addr(_system_reg+900)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2389 :: 		if (system_reg[DEL_DHW_MAX] > 99)
CMP	R0, #99
IT	LE
BLE	L_Up_9_OnPress333
;Controller_events_code.c,2390 :: 		system_reg[DEL_DHW_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
STRH	R1, [R0, #0]
L_Up_9_OnPress333:
;Controller_events_code.c,2391 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2392 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2393 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2394 :: 		DrawRoundButton(&Set_max_delta_DHW);
MOVW	R0, #lo_addr(_Set_max_delta_DHW+0)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2395 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_9_OnPress334:
SUBS	R7, R7, #1
BNE	L_Up_9_OnPress334
NOP
NOP
NOP
;Controller_events_code.c,2396 :: 		}
L_end_Up_9_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_9_OnPress
_Up_9_OnUp:
;Controller_events_code.c,2398 :: 		void Up_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2399 :: 		Image228.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image228+20)
MOVT	R0, #hi_addr(_Image228+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2400 :: 		Up_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_9_+20)
MOVT	R0, #hi_addr(_Up_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2401 :: 		DrawImage(&Up_9_);
MOVW	R0, #lo_addr(_Up_9_+0)
MOVT	R0, #hi_addr(_Up_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2402 :: 		}
L_end_Up_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_9_OnUp
_Down_10_OnPress:
;Controller_events_code.c,2403 :: 		void Down_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2405 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2406 :: 		Image212.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2407 :: 		Down_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2408 :: 		DrawImage(&Image212);
MOVW	R0, #lo_addr(_Image212+0)
MOVT	R0, #hi_addr(_Image212+0)
BL	_DrawImage+0
;Controller_events_code.c,2409 :: 		system_reg[DEL_SOURS_MIN]--;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2410 :: 		if (system_reg[DEL_SOURS_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_10_OnPress336
;Controller_events_code.c,2411 :: 		system_reg[DEL_SOURS_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Down_10_OnPress336:
;Controller_events_code.c,2412 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2413 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2414 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2415 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2416 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_10_OnPress337:
SUBS	R7, R7, #1
BNE	L_Down_10_OnPress337
NOP
NOP
NOP
;Controller_events_code.c,2417 :: 		}
L_end_Down_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_10_OnPress
_Down_10_OnUp:
;Controller_events_code.c,2419 :: 		void Down_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2420 :: 		Image212.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image212+20)
MOVT	R0, #hi_addr(_Image212+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2421 :: 		Down_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_10_+20)
MOVT	R0, #hi_addr(_Down_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2422 :: 		DrawImage(&Down_10_);
MOVW	R0, #lo_addr(_Down_10_+0)
MOVT	R0, #hi_addr(_Down_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2423 :: 		}
L_end_Down_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_10_OnUp
_Up_10_OnPress:
;Controller_events_code.c,2425 :: 		void Up_10_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2427 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2428 :: 		Image226.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2429 :: 		Up_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2430 :: 		DrawImage(&Image226);
MOVW	R0, #lo_addr(_Image226+0)
MOVT	R0, #hi_addr(_Image226+0)
BL	_DrawImage+0
;Controller_events_code.c,2431 :: 		system_reg[DEL_SOURS_MIN]++;
MOVW	R1, #lo_addr(_system_reg+260)
MOVT	R1, #hi_addr(_system_reg+260)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2432 :: 		if (system_reg[DEL_SOURS_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_10_OnPress339
;Controller_events_code.c,2433 :: 		system_reg[DEL_SOURS_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
STRH	R1, [R0, #0]
L_Up_10_OnPress339:
;Controller_events_code.c,2434 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2435 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2436 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2437 :: 		DrawRoundButton(&Set_min_delta_source);
MOVW	R0, #lo_addr(_Set_min_delta_source+0)
MOVT	R0, #hi_addr(_Set_min_delta_source+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2438 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_10_OnPress340:
SUBS	R7, R7, #1
BNE	L_Up_10_OnPress340
NOP
NOP
NOP
;Controller_events_code.c,2439 :: 		}
L_end_Up_10_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_10_OnPress
_Up_10_OnUp:
;Controller_events_code.c,2441 :: 		void Up_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2442 :: 		Image226.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image226+20)
MOVT	R0, #hi_addr(_Image226+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2443 :: 		Up_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_10_+20)
MOVT	R0, #hi_addr(_Up_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2444 :: 		DrawImage(&Up_10_);
MOVW	R0, #lo_addr(_Up_10_+0)
MOVT	R0, #hi_addr(_Up_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2445 :: 		}
L_end_Up_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_10_OnUp
_Down_11_OnPress:
;Controller_events_code.c,2446 :: 		void Down_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2448 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2449 :: 		Image213.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2450 :: 		Down_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2451 :: 		DrawImage(&Image213);
MOVW	R0, #lo_addr(_Image213+0)
MOVT	R0, #hi_addr(_Image213+0)
BL	_DrawImage+0
;Controller_events_code.c,2452 :: 		system_reg[DEL_SOURS_MAX]--;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2453 :: 		if (system_reg[DEL_SOURS_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_11_OnPress342
;Controller_events_code.c,2454 :: 		system_reg[DEL_SOURS_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Down_11_OnPress342:
;Controller_events_code.c,2455 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2456 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2457 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2458 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2459 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_11_OnPress343:
SUBS	R7, R7, #1
BNE	L_Down_11_OnPress343
NOP
NOP
NOP
;Controller_events_code.c,2460 :: 		}
L_end_Down_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_11_OnPress
_Down_11_OnUp:
;Controller_events_code.c,2462 :: 		void Down_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2463 :: 		Image213.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image213+20)
MOVT	R0, #hi_addr(_Image213+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2464 :: 		Down_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_11_+20)
MOVT	R0, #hi_addr(_Down_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2465 :: 		DrawImage(&Down_11_);
MOVW	R0, #lo_addr(_Down_11_+0)
MOVT	R0, #hi_addr(_Down_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2467 :: 		}
L_end_Down_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_11_OnUp
_Up_11_OnPress:
;Controller_events_code.c,2469 :: 		void Up_11_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2471 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2472 :: 		Image227.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2473 :: 		Up_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2474 :: 		DrawImage(&Image227);
MOVW	R0, #lo_addr(_Image227+0)
MOVT	R0, #hi_addr(_Image227+0)
BL	_DrawImage+0
;Controller_events_code.c,2475 :: 		system_reg[DEL_SOURS_MAX]++;
MOVW	R1, #lo_addr(_system_reg+240)
MOVT	R1, #hi_addr(_system_reg+240)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2476 :: 		if (system_reg[DEL_SOURS_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_11_OnPress345
;Controller_events_code.c,2477 :: 		system_reg[DEL_SOURS_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
STRH	R1, [R0, #0]
L_Up_11_OnPress345:
;Controller_events_code.c,2478 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2479 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2480 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2481 :: 		DrawRoundButton(&Set_max_source_delta);
MOVW	R0, #lo_addr(_Set_max_source_delta+0)
MOVT	R0, #hi_addr(_Set_max_source_delta+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2482 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_11_OnPress346:
SUBS	R7, R7, #1
BNE	L_Up_11_OnPress346
NOP
NOP
NOP
;Controller_events_code.c,2483 :: 		}
L_end_Up_11_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_11_OnPress
_Up_11_OnUp:
;Controller_events_code.c,2485 :: 		void Up_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2486 :: 		Image227.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image227+20)
MOVT	R0, #hi_addr(_Image227+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2487 :: 		Up_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_11_+20)
MOVT	R0, #hi_addr(_Up_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2488 :: 		DrawImage(&Up_11_);
MOVW	R0, #lo_addr(_Up_11_+0)
MOVT	R0, #hi_addr(_Up_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2489 :: 		}
L_end_Up_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_11_OnUp
_Down_12_OnPress:
;Controller_events_code.c,2494 :: 		void Down_12_OnPress() {
;Controller_events_code.c,2496 :: 		}
L_end_Down_12_OnPress:
BX	LR
; end of _Down_12_OnPress
_Down_12_OnUp:
;Controller_events_code.c,2498 :: 		void Down_12_OnUp() {
;Controller_events_code.c,2500 :: 		}
L_end_Down_12_OnUp:
BX	LR
; end of _Down_12_OnUp
_Up_12_OnPress:
;Controller_events_code.c,2502 :: 		void Up_12_OnPress() {
;Controller_events_code.c,2504 :: 		}
L_end_Up_12_OnPress:
BX	LR
; end of _Up_12_OnPress
_Up_12_OnUp:
;Controller_events_code.c,2506 :: 		void Up_12_OnUp() {
;Controller_events_code.c,2508 :: 		}
L_end_Up_12_OnUp:
BX	LR
; end of _Up_12_OnUp
_Set_7_OnUp:
;Controller_events_code.c,2509 :: 		void Set_7_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2510 :: 		Set_7_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2511 :: 		Image252.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2512 :: 		DrawImage (&Set_7_);
MOVW	R0, #lo_addr(_Set_7_+0)
MOVT	R0, #hi_addr(_Set_7_+0)
BL	_DrawImage+0
;Controller_events_code.c,2513 :: 		}
L_end_Set_7_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnUp
_Set_7_OnDown:
;Controller_events_code.c,2514 :: 		void Set_7_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2515 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2519 :: 		send_data_packet(DEL_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #100
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2520 :: 		Set_7_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_7_+20)
MOVT	R0, #hi_addr(_Set_7_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2521 :: 		Image252.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image252+20)
MOVT	R0, #hi_addr(_Image252+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2522 :: 		DrawImage (&Image252);
MOVW	R0, #lo_addr(_Image252+0)
MOVT	R0, #hi_addr(_Image252+0)
BL	_DrawImage+0
;Controller_events_code.c,2523 :: 		}
L_end_Set_7_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_7_OnDown
_Set_8_OnDown:
;Controller_events_code.c,2525 :: 		void Set_8_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2526 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2530 :: 		send_data_packet(DEL_DHW_MIN,1);
MOVS	R1, #1
MOVW	R0, #460
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2531 :: 		Set_8_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2532 :: 		Image253.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2533 :: 		DrawImage (&Image253);
MOVW	R0, #lo_addr(_Image253+0)
MOVT	R0, #hi_addr(_Image253+0)
BL	_DrawImage+0
;Controller_events_code.c,2534 :: 		}
L_end_Set_8_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnDown
_Set_8_OnUp:
;Controller_events_code.c,2536 :: 		void Set_8_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2537 :: 		Set_8_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_8_+20)
MOVT	R0, #hi_addr(_Set_8_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2538 :: 		Image253.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image253+20)
MOVT	R0, #hi_addr(_Image253+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2539 :: 		DrawImage (&Set_8_);
MOVW	R0, #lo_addr(_Set_8_+0)
MOVT	R0, #hi_addr(_Set_8_+0)
BL	_DrawImage+0
;Controller_events_code.c,2540 :: 		}
L_end_Set_8_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_8_OnUp
_Set_9_OnUp:
;Controller_events_code.c,2542 :: 		void Set_9_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2543 :: 		Set_9_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2544 :: 		Image256.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2545 :: 		DrawImage (&Set_9_);
MOVW	R0, #lo_addr(_Set_9_+0)
MOVT	R0, #hi_addr(_Set_9_+0)
BL	_DrawImage+0
;Controller_events_code.c,2546 :: 		}
L_end_Set_9_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnUp
_Set_9_OnDown:
;Controller_events_code.c,2547 :: 		void Set_9_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2548 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2552 :: 		send_data_packet(DEL_DHW_MAX,1);
MOVS	R1, #1
MOVW	R0, #450
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2553 :: 		Set_9_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_9_+20)
MOVT	R0, #hi_addr(_Set_9_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2554 :: 		Image256.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image256+20)
MOVT	R0, #hi_addr(_Image256+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2555 :: 		DrawImage (&Image256);
MOVW	R0, #lo_addr(_Image256+0)
MOVT	R0, #hi_addr(_Image256+0)
BL	_DrawImage+0
;Controller_events_code.c,2556 :: 		}
L_end_Set_9_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_9_OnDown
_Set_10_OnDown:
;Controller_events_code.c,2557 :: 		void Set_10_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2558 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2562 :: 		send_data_packet(DEL_SOURS_MIN,1);
MOVS	R1, #1
MOVW	R0, #130
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2563 :: 		Set_10_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2564 :: 		Image254.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2565 :: 		DrawImage (&Image254);
MOVW	R0, #lo_addr(_Image254+0)
MOVT	R0, #hi_addr(_Image254+0)
BL	_DrawImage+0
;Controller_events_code.c,2566 :: 		}
L_end_Set_10_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnDown
_Set_10_OnUp:
;Controller_events_code.c,2568 :: 		void Set_10_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2569 :: 		Set_10_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_10_+20)
MOVT	R0, #hi_addr(_Set_10_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2570 :: 		Image254.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image254+20)
MOVT	R0, #hi_addr(_Image254+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2571 :: 		DrawImage (&Set_10_);
MOVW	R0, #lo_addr(_Set_10_+0)
MOVT	R0, #hi_addr(_Set_10_+0)
BL	_DrawImage+0
;Controller_events_code.c,2572 :: 		}
L_end_Set_10_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_10_OnUp
_Set_11_OnDown:
;Controller_events_code.c,2573 :: 		void Set_11_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2574 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2578 :: 		send_data_packet(DEL_SOURS_MAX,1);
MOVS	R1, #1
MOVW	R0, #120
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2579 :: 		Set_11_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2580 :: 		Image255.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2581 :: 		DrawImage (&Image255);
MOVW	R0, #lo_addr(_Image255+0)
MOVT	R0, #hi_addr(_Image255+0)
BL	_DrawImage+0
;Controller_events_code.c,2582 :: 		}
L_end_Set_11_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnDown
_Set_11_OnUp:
;Controller_events_code.c,2583 :: 		void Set_11_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2584 :: 		Set_11_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_11_+20)
MOVT	R0, #hi_addr(_Set_11_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2585 :: 		Image255.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image255+20)
MOVT	R0, #hi_addr(_Image255+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2586 :: 		DrawImage (&Set_11_);
MOVW	R0, #lo_addr(_Set_11_+0)
MOVT	R0, #hi_addr(_Set_11_+0)
BL	_DrawImage+0
;Controller_events_code.c,2587 :: 		}
L_end_Set_11_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_11_OnUp
_Set_12_OnDown:
;Controller_events_code.c,2589 :: 		void Set_12_OnDown() {
;Controller_events_code.c,2591 :: 		}
L_end_Set_12_OnDown:
BX	LR
; end of _Set_12_OnDown
_Set_12_OnUp:
;Controller_events_code.c,2592 :: 		void Set_12_OnUp() {
;Controller_events_code.c,2594 :: 		}
L_end_Set_12_OnUp:
BX	LR
; end of _Set_12_OnUp
_Down_19_OnPress:
;Controller_events_code.c,2598 :: 		void Down_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2600 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2601 :: 		Image243.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2602 :: 		Down_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2603 :: 		DrawImage(&Image243);
MOVW	R0, #lo_addr(_Image243+0)
MOVT	R0, #hi_addr(_Image243+0)
BL	_DrawImage+0
;Controller_events_code.c,2604 :: 		system_reg[S_HEAT_MAX]--;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2605 :: 		if (system_reg[S_HEAT_MAX] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_19_OnPress348
;Controller_events_code.c,2606 :: 		system_reg[S_HEAT_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Down_19_OnPress348:
;Controller_events_code.c,2607 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2608 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2609 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2610 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2611 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_19_OnPress349:
SUBS	R7, R7, #1
BNE	L_Down_19_OnPress349
NOP
NOP
NOP
;Controller_events_code.c,2612 :: 		}
L_end_Down_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_19_OnPress
_Down_19_OnUp:
;Controller_events_code.c,2613 :: 		void Down_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2614 :: 		Image243.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image243+20)
MOVT	R0, #hi_addr(_Image243+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2615 :: 		Down_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_19_+20)
MOVT	R0, #hi_addr(_Down_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2616 :: 		DrawImage(&Down_19_);
MOVW	R0, #lo_addr(_Down_19_+0)
MOVT	R0, #hi_addr(_Down_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2617 :: 		}
L_end_Down_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_19_OnUp
_Up_19_OnPress:
;Controller_events_code.c,2618 :: 		void Up_19_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2620 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2621 :: 		Image236.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2622 :: 		Up_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2623 :: 		DrawImage(&Image236);
MOVW	R0, #lo_addr(_Image236+0)
MOVT	R0, #hi_addr(_Image236+0)
BL	_DrawImage+0
;Controller_events_code.c,2624 :: 		system_reg[S_HEAT_MAX]++;
MOVW	R1, #lo_addr(_system_reg+560)
MOVT	R1, #hi_addr(_system_reg+560)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2625 :: 		if (system_reg[S_HEAT_MAX] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_19_OnPress351
;Controller_events_code.c,2626 :: 		system_reg[S_HEAT_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
STRH	R1, [R0, #0]
L_Up_19_OnPress351:
;Controller_events_code.c,2627 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2628 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2629 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2630 :: 		DrawRoundButton(&Set_max_superheat);
MOVW	R0, #lo_addr(_Set_max_superheat+0)
MOVT	R0, #hi_addr(_Set_max_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2631 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_19_OnPress352:
SUBS	R7, R7, #1
BNE	L_Up_19_OnPress352
NOP
NOP
NOP
;Controller_events_code.c,2632 :: 		}
L_end_Up_19_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_19_OnPress
_Up_19_OnUp:
;Controller_events_code.c,2633 :: 		void Up_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2634 :: 		Image236.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image236+20)
MOVT	R0, #hi_addr(_Image236+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2635 :: 		Up_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_19_+20)
MOVT	R0, #hi_addr(_Up_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2636 :: 		DrawImage(&Up_19_);
MOVW	R0, #lo_addr(_Up_19_+0)
MOVT	R0, #hi_addr(_Up_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2637 :: 		}
L_end_Up_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_19_OnUp
_Down_20_OnPress:
;Controller_events_code.c,2638 :: 		void Down_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2640 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,2641 :: 		Image244.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2642 :: 		Down_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2643 :: 		DrawImage(&Image244);
MOVW	R0, #lo_addr(_Image244+0)
MOVT	R0, #hi_addr(_Image244+0)
BL	_DrawImage+0
;Controller_events_code.c,2644 :: 		system_reg[S_COOL_MIN]--;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2645 :: 		if (system_reg[S_COOL_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_20_OnPress354
;Controller_events_code.c,2646 :: 		system_reg[S_COOL_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Down_20_OnPress354:
;Controller_events_code.c,2647 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2648 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2649 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2650 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2651 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_20_OnPress355:
SUBS	R7, R7, #1
BNE	L_Down_20_OnPress355
NOP
NOP
NOP
;Controller_events_code.c,2652 :: 		}
L_end_Down_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_20_OnPress
_Down_20_OnUp:
;Controller_events_code.c,2653 :: 		void Down_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2654 :: 		Image244.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image244+20)
MOVT	R0, #hi_addr(_Image244+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2655 :: 		Down_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_20_+20)
MOVT	R0, #hi_addr(_Down_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2656 :: 		DrawImage(&Down_20_);
MOVW	R0, #lo_addr(_Down_20_+0)
MOVT	R0, #hi_addr(_Down_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2657 :: 		}
L_end_Down_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_20_OnUp
_Up_20_OnPress:
;Controller_events_code.c,2658 :: 		void Up_20_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2660 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2661 :: 		Image237.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2662 :: 		Up_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2663 :: 		DrawImage(&Image237);
MOVW	R0, #lo_addr(_Image237+0)
MOVT	R0, #hi_addr(_Image237+0)
BL	_DrawImage+0
;Controller_events_code.c,2664 :: 		system_reg[S_COOL_MIN]++;
MOVW	R1, #lo_addr(_system_reg+540)
MOVT	R1, #hi_addr(_system_reg+540)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2665 :: 		if (system_reg[S_COOL_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_20_OnPress357
;Controller_events_code.c,2666 :: 		system_reg[S_COOL_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
STRH	R1, [R0, #0]
L_Up_20_OnPress357:
;Controller_events_code.c,2667 :: 		IntToStr(system_reg[S_COOL_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2668 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2669 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2670 :: 		DrawRoundButton(&Set_min_subcooling);
MOVW	R0, #lo_addr(_Set_min_subcooling+0)
MOVT	R0, #hi_addr(_Set_min_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2671 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_20_OnPress358:
SUBS	R7, R7, #1
BNE	L_Up_20_OnPress358
NOP
NOP
NOP
;Controller_events_code.c,2672 :: 		}
L_end_Up_20_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_20_OnPress
_Up_20_OnUp:
;Controller_events_code.c,2673 :: 		void Up_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2674 :: 		Image237.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image237+20)
MOVT	R0, #hi_addr(_Image237+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2675 :: 		Up_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_20_+20)
MOVT	R0, #hi_addr(_Up_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2676 :: 		DrawImage(&Up_20_);
MOVW	R0, #lo_addr(_Up_20_+0)
MOVT	R0, #hi_addr(_Up_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2677 :: 		}
L_end_Up_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_20_OnUp
_Down_21_OnPress:
;Controller_events_code.c,2678 :: 		void Down_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2680 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2681 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2682 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2683 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2684 :: 		system_reg[S_COOL_MAX]--;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2685 :: 		if (system_reg[S_COOL_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_21_OnPress360
;Controller_events_code.c,2686 :: 		system_reg[S_COOL_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Down_21_OnPress360:
;Controller_events_code.c,2687 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2688 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2689 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2690 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2691 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_21_OnPress361:
SUBS	R7, R7, #1
BNE	L_Down_21_OnPress361
NOP
NOP
NOP
;Controller_events_code.c,2692 :: 		}
L_end_Down_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_21_OnPress
_Down_21_OnUp:
;Controller_events_code.c,2693 :: 		void Down_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2694 :: 		Image245.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image245+20)
MOVT	R0, #hi_addr(_Image245+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2695 :: 		Down_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_21_+20)
MOVT	R0, #hi_addr(_Down_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2696 :: 		DrawImage(&Down_21_);
MOVW	R0, #lo_addr(_Down_21_+0)
MOVT	R0, #hi_addr(_Down_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2697 :: 		}
L_end_Down_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_21_OnUp
_Up_21_OnPress:
;Controller_events_code.c,2698 :: 		void Up_21_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2700 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,2701 :: 		Image238.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2702 :: 		Up_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2703 :: 		DrawImage(&Image238);
MOVW	R0, #lo_addr(_Image238+0)
MOVT	R0, #hi_addr(_Image238+0)
BL	_DrawImage+0
;Controller_events_code.c,2704 :: 		system_reg[S_COOL_MAX]++;
MOVW	R1, #lo_addr(_system_reg+520)
MOVT	R1, #hi_addr(_system_reg+520)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2705 :: 		if (system_reg[S_COOL_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_21_OnPress363
;Controller_events_code.c,2706 :: 		system_reg[S_COOL_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
STRH	R1, [R0, #0]
L_Up_21_OnPress363:
;Controller_events_code.c,2707 :: 		IntToStr(system_reg[S_COOL_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2708 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2709 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2710 :: 		DrawRoundButton(&Set_max_subcooling);
MOVW	R0, #lo_addr(_Set_max_subcooling+0)
MOVT	R0, #hi_addr(_Set_max_subcooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2711 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_21_OnPress364:
SUBS	R7, R7, #1
BNE	L_Up_21_OnPress364
NOP
NOP
NOP
;Controller_events_code.c,2712 :: 		}
L_end_Up_21_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_21_OnPress
_Up_21_OnUp:
;Controller_events_code.c,2713 :: 		void Up_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2714 :: 		Image238.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image238+20)
MOVT	R0, #hi_addr(_Image238+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2715 :: 		Up_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_21_+20)
MOVT	R0, #hi_addr(_Up_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2716 :: 		DrawImage(&Up_21_);
MOVW	R0, #lo_addr(_Up_21_+0)
MOVT	R0, #hi_addr(_Up_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2717 :: 		}
L_end_Up_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_21_OnUp
_Down_22_OnPress:
;Controller_events_code.c,2719 :: 		void Down_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2721 :: 		Image24.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2722 :: 		Down_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2723 :: 		DrawImage(&Image24);
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
BL	_DrawImage+0
;Controller_events_code.c,2724 :: 		system_reg[HP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2725 :: 		if (system_reg[HP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_22_OnPress366
;Controller_events_code.c,2726 :: 		system_reg[HP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Down_22_OnPress366:
;Controller_events_code.c,2727 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2728 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2729 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2730 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2731 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_22_OnPress367:
SUBS	R7, R7, #1
BNE	L_Down_22_OnPress367
NOP
NOP
NOP
;Controller_events_code.c,2732 :: 		}
L_end_Down_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_22_OnPress
_Down_22_OnUp:
;Controller_events_code.c,2733 :: 		void Down_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2734 :: 		Image24.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2735 :: 		Down_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_22_+20)
MOVT	R0, #hi_addr(_Down_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2736 :: 		DrawImage(&Down_22_);
MOVW	R0, #lo_addr(_Down_22_+0)
MOVT	R0, #hi_addr(_Down_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2738 :: 		}
L_end_Down_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_22_OnUp
_Up_22_OnPress:
;Controller_events_code.c,2739 :: 		void Up_22_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2741 :: 		Image53.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2742 :: 		Up_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2743 :: 		DrawImage(&Image53);
MOVW	R0, #lo_addr(_Image53+0)
MOVT	R0, #hi_addr(_Image53+0)
BL	_DrawImage+0
;Controller_events_code.c,2744 :: 		system_reg[HP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+440)
MOVT	R1, #hi_addr(_system_reg+440)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2745 :: 		if (system_reg[HP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_22_OnPress369
;Controller_events_code.c,2746 :: 		system_reg[HP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
STRH	R1, [R0, #0]
L_Up_22_OnPress369:
;Controller_events_code.c,2747 :: 		IntToStr(system_reg[HP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2748 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2749 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2750 :: 		DrawRoundButton(&Set_max_high_pressure);
MOVW	R0, #lo_addr(_Set_max_high_pressure+0)
MOVT	R0, #hi_addr(_Set_max_high_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2751 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_22_OnPress370:
SUBS	R7, R7, #1
BNE	L_Up_22_OnPress370
NOP
NOP
NOP
;Controller_events_code.c,2752 :: 		}
L_end_Up_22_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_22_OnPress
_Up_22_OnUp:
;Controller_events_code.c,2753 :: 		void Up_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2754 :: 		Image53.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2755 :: 		Up_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_22_+20)
MOVT	R0, #hi_addr(_Up_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2756 :: 		DrawImage(&Up_22_);
MOVW	R0, #lo_addr(_Up_22_+0)
MOVT	R0, #hi_addr(_Up_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2757 :: 		}
L_end_Up_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_22_OnUp
_Down_23_OnPress:
;Controller_events_code.c,2758 :: 		void Down_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2760 :: 		Image86.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2761 :: 		Down_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2762 :: 		DrawImage(&Image86);
MOVW	R0, #lo_addr(_Image86+0)
MOVT	R0, #hi_addr(_Image86+0)
BL	_DrawImage+0
;Controller_events_code.c,2763 :: 		system_reg[HP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2764 :: 		if (system_reg[HP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_23_OnPress372
;Controller_events_code.c,2765 :: 		system_reg[HP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Down_23_OnPress372:
;Controller_events_code.c,2766 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2767 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2768 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2769 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2770 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_23_OnPress373:
SUBS	R7, R7, #1
BNE	L_Down_23_OnPress373
NOP
NOP
NOP
;Controller_events_code.c,2771 :: 		}
L_end_Down_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_23_OnPress
_Down_23_OnUp:
;Controller_events_code.c,2772 :: 		void Down_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2773 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2774 :: 		Down_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_23_+20)
MOVT	R0, #hi_addr(_Down_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2775 :: 		DrawImage(&Down_23_);
MOVW	R0, #lo_addr(_Down_23_+0)
MOVT	R0, #hi_addr(_Down_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2777 :: 		}
L_end_Down_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_23_OnUp
_Up_23_OnPress:
;Controller_events_code.c,2778 :: 		void Up_23_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,2780 :: 		Image95.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image95+20)
MOVT	R0, #hi_addr(_Image95+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2781 :: 		Up_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2782 :: 		DrawImage(&Image95);
MOVW	R0, #lo_addr(_Image95+0)
MOVT	R0, #hi_addr(_Image95+0)
BL	_DrawImage+0
;Controller_events_code.c,2783 :: 		system_reg[HP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+480)
MOVT	R1, #hi_addr(_system_reg+480)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,2784 :: 		if (system_reg[HP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_23_OnPress375
;Controller_events_code.c,2785 :: 		system_reg[HP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
STRH	R1, [R0, #0]
L_Up_23_OnPress375:
;Controller_events_code.c,2786 :: 		IntToStr(system_reg[HP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,2787 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,2788 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,2789 :: 		DrawRoundButton(&Set_min_lhigh_pressure);
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+0)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,2790 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_23_OnPress376:
SUBS	R7, R7, #1
BNE	L_Up_23_OnPress376
NOP
NOP
NOP
;Controller_events_code.c,2791 :: 		}
L_end_Up_23_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_23_OnPress
_Up_23_OnUp:
;Controller_events_code.c,2792 :: 		void Up_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2793 :: 		Image86.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image86+20)
MOVT	R0, #hi_addr(_Image86+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2794 :: 		Up_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_23_+20)
MOVT	R0, #hi_addr(_Up_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2795 :: 		DrawImage(&Up_23_);
MOVW	R0, #lo_addr(_Up_23_+0)
MOVT	R0, #hi_addr(_Up_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2796 :: 		}
L_end_Up_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_23_OnUp
_Set_19_OnUp:
;Controller_events_code.c,2798 :: 		void Set_19_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2799 :: 		Set_19_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2800 :: 		Image264.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2801 :: 		DrawImage (&Set_19_);
MOVW	R0, #lo_addr(_Set_19_+0)
MOVT	R0, #hi_addr(_Set_19_+0)
BL	_DrawImage+0
;Controller_events_code.c,2802 :: 		}
L_end_Set_19_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnUp
_Set_19_OnDown:
;Controller_events_code.c,2803 :: 		void void Set_19_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2804 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2808 :: 		send_data_packet(S_HEAT_MAX,1);
MOVS	R1, #1
MOVW	R0, #280
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2809 :: 		Set_19_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_19_+20)
MOVT	R0, #hi_addr(_Set_19_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2810 :: 		Image264.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image264+20)
MOVT	R0, #hi_addr(_Image264+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2811 :: 		DrawImage (&Image264);
MOVW	R0, #lo_addr(_Image264+0)
MOVT	R0, #hi_addr(_Image264+0)
BL	_DrawImage+0
;Controller_events_code.c,2812 :: 		}
L_end_Set_19_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_19_OnDown
_Set_20_OnDown:
;Controller_events_code.c,2813 :: 		void Set_20_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2814 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2818 :: 		send_data_packet(S_COOL_MIN,1);
MOVS	R1, #1
MOVW	R0, #270
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2819 :: 		Set_20_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2820 :: 		Image265.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2821 :: 		DrawImage (&Image265);
MOVW	R0, #lo_addr(_Image265+0)
MOVT	R0, #hi_addr(_Image265+0)
BL	_DrawImage+0
;Controller_events_code.c,2822 :: 		}
L_end_Set_20_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnDown
_Set_20_OnUp:
;Controller_events_code.c,2823 :: 		void Set_20_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2824 :: 		Set_20_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_20_+20)
MOVT	R0, #hi_addr(_Set_20_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2825 :: 		Image265.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image265+20)
MOVT	R0, #hi_addr(_Image265+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2826 :: 		DrawImage (&Set_20_);
MOVW	R0, #lo_addr(_Set_20_+0)
MOVT	R0, #hi_addr(_Set_20_+0)
BL	_DrawImage+0
;Controller_events_code.c,2827 :: 		}
L_end_Set_20_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_20_OnUp
_Set_21_OnDown:
;Controller_events_code.c,2828 :: 		void Set_21_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2829 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2833 :: 		send_data_packet(S_COOL_MAX,1);
MOVS	R1, #1
MOVW	R0, #260
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2834 :: 		Set_21_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2835 :: 		Image266.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2836 :: 		DrawImage (&Image266);
MOVW	R0, #lo_addr(_Image266+0)
MOVT	R0, #hi_addr(_Image266+0)
BL	_DrawImage+0
;Controller_events_code.c,2837 :: 		}
L_end_Set_21_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnDown
_Set_21_OnUp:
;Controller_events_code.c,2838 :: 		void Set_21_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2839 :: 		Set_21_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_21_+20)
MOVT	R0, #hi_addr(_Set_21_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2840 :: 		Image266.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image266+20)
MOVT	R0, #hi_addr(_Image266+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2841 :: 		DrawImage (&Set_21_);
MOVW	R0, #lo_addr(_Set_21_+0)
MOVT	R0, #hi_addr(_Set_21_+0)
BL	_DrawImage+0
;Controller_events_code.c,2842 :: 		}
L_end_Set_21_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_21_OnUp
_Set_22_OnDown:
;Controller_events_code.c,2843 :: 		void Set_22_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2844 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2848 :: 		send_data_packet(HP_MAX,1);
MOVS	R1, #1
MOVW	R0, #220
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2849 :: 		Set_22_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2850 :: 		Image34.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2851 :: 		DrawImage (&Image34);
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
BL	_DrawImage+0
;Controller_events_code.c,2852 :: 		}
L_end_Set_22_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnDown
_Set_22_OnUp:
;Controller_events_code.c,2854 :: 		void Set_22_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2855 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2856 :: 		Set_22_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_22_+20)
MOVT	R0, #hi_addr(_Set_22_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2857 :: 		Image34.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2858 :: 		DrawImage (&Set_22_);
MOVW	R0, #lo_addr(_Set_22_+0)
MOVT	R0, #hi_addr(_Set_22_+0)
BL	_DrawImage+0
;Controller_events_code.c,2859 :: 		}
L_end_Set_22_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_22_OnUp
_Set_23_OnDown:
;Controller_events_code.c,2860 :: 		void Set_23_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2861 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2865 :: 		send_data_packet(HP_MIN,1);
MOVS	R1, #1
MOVW	R0, #240
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2866 :: 		Set_23_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2867 :: 		Image33.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2868 :: 		DrawImage (&Image33);
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
BL	_DrawImage+0
;Controller_events_code.c,2869 :: 		}
L_end_Set_23_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnDown
_Set_23_OnUp:
;Controller_events_code.c,2870 :: 		void Set_23_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2871 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,2872 :: 		Set_23_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_23_+20)
MOVT	R0, #hi_addr(_Set_23_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2873 :: 		Image33.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2874 :: 		DrawImage (&Set_23_);
MOVW	R0, #lo_addr(_Set_23_+0)
MOVT	R0, #hi_addr(_Set_23_+0)
BL	_DrawImage+0
;Controller_events_code.c,2875 :: 		}
L_end_Set_23_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_23_OnUp
_One_CompressorsOnClick:
;Controller_events_code.c,2878 :: 		void One_CompressorsOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2879 :: 		num_page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_num_page+0)
MOVT	R0, #hi_addr(_num_page+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2880 :: 		if ((unsigned long)One_Compressors.Picture_Name == Compressor1_jpg)
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
LDR	R1, [R0, #0]
MOVW	R0, #35596
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_One_CompressorsOnClick378
;Controller_events_code.c,2882 :: 		One_Compressors.Picture_Name = Compressor2_jpg;
MOVW	R1, #29584
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2883 :: 		Two_Compressors.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Two_Compressors+20)
MOVT	R0, #hi_addr(_Two_Compressors+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2884 :: 		DrawImage(&Two_Compressors);
MOVW	R0, #lo_addr(_Two_Compressors+0)
MOVT	R0, #hi_addr(_Two_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2885 :: 		system_reg[NOMB_COMPRESSORS]=2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2886 :: 		two_compressors_mode=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2887 :: 		}
IT	AL
BAL	L_One_CompressorsOnClick379
L_One_CompressorsOnClick378:
;Controller_events_code.c,2889 :: 		One_Compressors.Picture_Name = Compressor1_jpg;
MOVW	R1, #35596
MOVT	R1, #50
MOVW	R0, #lo_addr(_One_Compressors+16)
MOVT	R0, #hi_addr(_One_Compressors+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2890 :: 		One_Compressors.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_One_Compressors+20)
MOVT	R0, #hi_addr(_One_Compressors+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2891 :: 		DrawImage(&One_Compressors);
MOVW	R0, #lo_addr(_One_Compressors+0)
MOVT	R0, #hi_addr(_One_Compressors+0)
BL	_DrawImage+0
;Controller_events_code.c,2892 :: 		system_reg[NOMB_COMPRESSORS]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
STRH	R1, [R0, #0]
;Controller_events_code.c,2893 :: 		two_compressors_mode=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,2894 :: 		}
L_One_CompressorsOnClick379:
;Controller_events_code.c,2895 :: 		send_data_packet(NOMB_COMPRESSORS,1);
MOVS	R1, #1
MOVW	R0, #400
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2898 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_One_CompressorsOnClick380:
SUBS	R7, R7, #1
BNE	L_One_CompressorsOnClick380
NOP
NOP
NOP
;Controller_events_code.c,2899 :: 		}
L_end_One_CompressorsOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _One_CompressorsOnClick
_Reversing_ON_HEATOnClick:
;Controller_events_code.c,2901 :: 		void Reversing_ON_HEATOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2902 :: 		if ((unsigned long)Reversing_ON_HEAT.Picture_Name == but_ON_jpg)
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
LDR	R1, [R0, #0]
MOVW	R0, #38602
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_Reversing_ON_HEATOnClick382
;Controller_events_code.c,2904 :: 		Reversing_ON_HEAT.Picture_Name = but_OFF_jpg;
MOVW	R1, #32590
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2905 :: 		Reversing_Heat_OFF.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+20)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2906 :: 		DrawImage(&Reversing_Heat_OFF);
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+0)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+0)
BL	_DrawImage+0
;Controller_events_code.c,2907 :: 		system_reg[REVERS_MOD]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2909 :: 		}
IT	AL
BAL	L_Reversing_ON_HEATOnClick383
L_Reversing_ON_HEATOnClick382:
;Controller_events_code.c,2911 :: 		Reversing_ON_HEAT.Picture_Name = but_ON_jpg;
MOVW	R1, #38602
MOVT	R1, #50
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+16)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2912 :: 		Reversing_ON_HEAT.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+20)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2913 :: 		DrawImage(&Reversing_ON_HEAT);
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+0)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+0)
BL	_DrawImage+0
;Controller_events_code.c,2914 :: 		system_reg[REVERS_MOD]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
STRH	R1, [R0, #0]
;Controller_events_code.c,2915 :: 		}
L_Reversing_ON_HEATOnClick383:
;Controller_events_code.c,2916 :: 		send_data_packet(REVERS_MOD,1);
MOVS	R1, #1
MOVW	R0, #410
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2917 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_Reversing_ON_HEATOnClick384:
SUBS	R7, R7, #1
BNE	L_Reversing_ON_HEATOnClick384
NOP
NOP
NOP
;Controller_events_code.c,2918 :: 		}
L_end_Reversing_ON_HEATOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Reversing_ON_HEATOnClick
_Flow_Source__Sensor_ONOnClick:
;Controller_events_code.c,2919 :: 		void Flow_Source__Sensor_ONOnClick(){
;Controller_events_code.c,2921 :: 		}
L_end_Flow_Source__Sensor_ONOnClick:
BX	LR
; end of _Flow_Source__Sensor_ONOnClick
_Flow_Source__Heat1_ONOnClick:
;Controller_events_code.c,2922 :: 		void Flow_Source__Heat1_ONOnClick() {
;Controller_events_code.c,2924 :: 		}
L_end_Flow_Source__Heat1_ONOnClick:
BX	LR
; end of _Flow_Source__Heat1_ONOnClick
_Flow_Source__Heat2_ONOnClick:
;Controller_events_code.c,2925 :: 		void Flow_Source__Heat2_ONOnClick() {
;Controller_events_code.c,2927 :: 		}
L_end_Flow_Source__Heat2_ONOnClick:
BX	LR
; end of _Flow_Source__Heat2_ONOnClick
_Power_380VOnClick:
;Controller_events_code.c,2928 :: 		void Power_380VOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,2929 :: 		if ((unsigned long)Power_380V.Picture_Name == but_380_on_jpg)
MOVW	R0, #lo_addr(_Power_380V+16)
MOVT	R0, #hi_addr(_Power_380V+16)
LDR	R1, [R0, #0]
MOVW	R0, #41608
MOVT	R0, #50
CMP	R1, R0
IT	NE
BNE	L_Power_380VOnClick386
;Controller_events_code.c,2931 :: 		Power_380V.Picture_Name = but_220_on_jpg;
MOVW	R1, #26778
MOVT	R1, #50
MOVW	R0, #lo_addr(_Power_380V+16)
MOVT	R0, #hi_addr(_Power_380V+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2932 :: 		Power_220V.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_220V+20)
MOVT	R0, #hi_addr(_Power_220V+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2933 :: 		DrawImage(&Power_220V);
MOVW	R0, #lo_addr(_Power_220V+0)
MOVT	R0, #hi_addr(_Power_220V+0)
BL	_DrawImage+0
;Controller_events_code.c,2934 :: 		system_reg[POWER_380]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+940)
MOVT	R0, #hi_addr(_system_reg+940)
STRH	R1, [R0, #0]
;Controller_events_code.c,2936 :: 		}
IT	AL
BAL	L_Power_380VOnClick387
L_Power_380VOnClick386:
;Controller_events_code.c,2938 :: 		Power_380V.Picture_Name = but_380_on_jpg;
MOVW	R1, #41608
MOVT	R1, #50
MOVW	R0, #lo_addr(_Power_380V+16)
MOVT	R0, #hi_addr(_Power_380V+16)
STR	R1, [R0, #0]
;Controller_events_code.c,2939 :: 		Power_380V.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_380V+20)
MOVT	R0, #hi_addr(_Power_380V+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,2940 :: 		DrawImage(&Power_380V);
MOVW	R0, #lo_addr(_Power_380V+0)
MOVT	R0, #hi_addr(_Power_380V+0)
BL	_DrawImage+0
;Controller_events_code.c,2941 :: 		system_reg[POWER_380]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+940)
MOVT	R0, #hi_addr(_system_reg+940)
STRH	R1, [R0, #0]
;Controller_events_code.c,2942 :: 		}
L_Power_380VOnClick387:
;Controller_events_code.c,2943 :: 		send_data_packet(POWER_380,1);
MOVS	R1, #1
MOVW	R0, #470
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,2944 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_Power_380VOnClick388:
SUBS	R7, R7, #1
BNE	L_Power_380VOnClick388
NOP
NOP
NOP
;Controller_events_code.c,2948 :: 		}
L_end_Power_380VOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Power_380VOnClick
_furnance_Mode_onOnClick:
;Controller_events_code.c,2951 :: 		void furnance_Mode_onOnClick() {
;Controller_events_code.c,2953 :: 		}
L_end_furnance_Mode_onOnClick:
BX	LR
; end of _furnance_Mode_onOnClick
_Furnance_start_temp_DownOnUp:
;Controller_events_code.c,2955 :: 		void Furnance_start_temp_DownOnUp() {
;Controller_events_code.c,2957 :: 		}
L_end_Furnance_start_temp_DownOnUp:
BX	LR
; end of _Furnance_start_temp_DownOnUp
_Furnance_start_temp_DownOnPress:
;Controller_events_code.c,2958 :: 		void Furnance_start_temp_DownOnPress() {
;Controller_events_code.c,2960 :: 		}
L_end_Furnance_start_temp_DownOnPress:
BX	LR
; end of _Furnance_start_temp_DownOnPress
_Furnance_HP_OFF_DowmOnUp:
;Controller_events_code.c,2961 :: 		void Furnance_HP_OFF_DowmOnUp() {
;Controller_events_code.c,2963 :: 		}
L_end_Furnance_HP_OFF_DowmOnUp:
BX	LR
; end of _Furnance_HP_OFF_DowmOnUp
_Furnance_HP_OFF_DowmOnPress:
;Controller_events_code.c,2964 :: 		void Furnance_HP_OFF_DowmOnPress() {
;Controller_events_code.c,2966 :: 		}
L_end_Furnance_HP_OFF_DowmOnPress:
BX	LR
; end of _Furnance_HP_OFF_DowmOnPress
_Furnance_HP_OFF_UPOnUp:
;Controller_events_code.c,2967 :: 		void Furnance_HP_OFF_UPOnUp() {
;Controller_events_code.c,2969 :: 		}
L_end_Furnance_HP_OFF_UPOnUp:
BX	LR
; end of _Furnance_HP_OFF_UPOnUp
_Furnance_HP_OFF_UPOnPress:
;Controller_events_code.c,2970 :: 		void Furnance_HP_OFF_UPOnPress() {
;Controller_events_code.c,2972 :: 		}
L_end_Furnance_HP_OFF_UPOnPress:
BX	LR
; end of _Furnance_HP_OFF_UPOnPress
_Furnance_off_downOnUp:
;Controller_events_code.c,2974 :: 		void Furnance_off_downOnUp() {
;Controller_events_code.c,2976 :: 		}
L_end_Furnance_off_downOnUp:
BX	LR
; end of _Furnance_off_downOnUp
_Furnance_off_downOnPress:
;Controller_events_code.c,2977 :: 		void Furnance_off_downOnPress() {
;Controller_events_code.c,2979 :: 		}
L_end_Furnance_off_downOnPress:
BX	LR
; end of _Furnance_off_downOnPress
_Furnance_off_upOnUp:
;Controller_events_code.c,2980 :: 		void Furnance_off_upOnUp() {
;Controller_events_code.c,2982 :: 		}
L_end_Furnance_off_upOnUp:
BX	LR
; end of _Furnance_off_upOnUp
_Furnance_off_upOnPress:
;Controller_events_code.c,2983 :: 		void Furnance_off_upOnPress() {
;Controller_events_code.c,2985 :: 		}
L_end_Furnance_off_upOnPress:
BX	LR
; end of _Furnance_off_upOnPress
_Furnance_off_save_onup:
;Controller_events_code.c,2986 :: 		void Furnance_off_save_onup() {
;Controller_events_code.c,2988 :: 		}
L_end_Furnance_off_save_onup:
BX	LR
; end of _Furnance_off_save_onup
_Furnance_off_save_ondown:
;Controller_events_code.c,2989 :: 		void Furnance_off_save_ondown() {
;Controller_events_code.c,2991 :: 		}
L_end_Furnance_off_save_ondown:
BX	LR
; end of _Furnance_off_save_ondown
_Furnance_time_downOnUp:
;Controller_events_code.c,2992 :: 		void Furnance_time_downOnUp() {
;Controller_events_code.c,2994 :: 		}
L_end_Furnance_time_downOnUp:
BX	LR
; end of _Furnance_time_downOnUp
_Furnance_time_downOnPress:
;Controller_events_code.c,2995 :: 		void Furnance_time_downOnPress() {
;Controller_events_code.c,2997 :: 		}
L_end_Furnance_time_downOnPress:
BX	LR
; end of _Furnance_time_downOnPress
_Furnance_time_upOnUp:
;Controller_events_code.c,2998 :: 		void Furnance_time_upOnUp() {
;Controller_events_code.c,3000 :: 		}
L_end_Furnance_time_upOnUp:
BX	LR
; end of _Furnance_time_upOnUp
_Furnance_time_upOnPress:
;Controller_events_code.c,3001 :: 		void Furnance_time_upOnPress() {
;Controller_events_code.c,3003 :: 		}
L_end_Furnance_time_upOnPress:
BX	LR
; end of _Furnance_time_upOnPress
_furnance_time_OFFOnClick:
;Controller_events_code.c,3004 :: 		void furnance_time_OFFOnClick() {
;Controller_events_code.c,3006 :: 		}
L_end_furnance_time_OFFOnClick:
BX	LR
; end of _furnance_time_OFFOnClick
_Furnance_HP_OFF_save_onup:
;Controller_events_code.c,3007 :: 		void Furnance_HP_OFF_save_onup(){
;Controller_events_code.c,3008 :: 		}
L_end_Furnance_HP_OFF_save_onup:
BX	LR
; end of _Furnance_HP_OFF_save_onup
_Furnance_start_temp_UPOnUp:
;Controller_events_code.c,3009 :: 		void Furnance_start_temp_UPOnUp(){
;Controller_events_code.c,3010 :: 		}
L_end_Furnance_start_temp_UPOnUp:
BX	LR
; end of _Furnance_start_temp_UPOnUp
_Furnance_start_temp_UPOnPress:
;Controller_events_code.c,3011 :: 		void Furnance_start_temp_UPOnPress(){
;Controller_events_code.c,3012 :: 		}
L_end_Furnance_start_temp_UPOnPress:
BX	LR
; end of _Furnance_start_temp_UPOnPress
_SetIPAddressOnClick:
;Controller_events_code.c,3015 :: 		void SetIPAddressOnClick() {
;Controller_events_code.c,3017 :: 		}
L_end_SetIPAddressOnClick:
BX	LR
; end of _SetIPAddressOnClick
_SetMaskOnClick:
;Controller_events_code.c,3019 :: 		void SetMaskOnClick() {
;Controller_events_code.c,3021 :: 		}
L_end_SetMaskOnClick:
BX	LR
; end of _SetMaskOnClick
_SetDNSOnClick:
;Controller_events_code.c,3023 :: 		void SetDNSOnClick() {
;Controller_events_code.c,3025 :: 		}
L_end_SetDNSOnClick:
BX	LR
; end of _SetDNSOnClick
_LAN_Key_1OnClick:
;Controller_events_code.c,3027 :: 		void LAN_Key_1OnClick() {
;Controller_events_code.c,3029 :: 		}
L_end_LAN_Key_1OnClick:
BX	LR
; end of _LAN_Key_1OnClick
_LAN_Key_2OnClick:
;Controller_events_code.c,3031 :: 		void LAN_Key_2OnClick() {
;Controller_events_code.c,3033 :: 		}
L_end_LAN_Key_2OnClick:
BX	LR
; end of _LAN_Key_2OnClick
_LAN_Key_3OnClick:
;Controller_events_code.c,3035 :: 		void LAN_Key_3OnClick() {
;Controller_events_code.c,3037 :: 		}
L_end_LAN_Key_3OnClick:
BX	LR
; end of _LAN_Key_3OnClick
_LAN_Key_4OnClick:
;Controller_events_code.c,3039 :: 		void LAN_Key_4OnClick() {
;Controller_events_code.c,3041 :: 		}
L_end_LAN_Key_4OnClick:
BX	LR
; end of _LAN_Key_4OnClick
_LAN_Key_5OnClick:
;Controller_events_code.c,3043 :: 		void LAN_Key_5OnClick() {
;Controller_events_code.c,3045 :: 		}
L_end_LAN_Key_5OnClick:
BX	LR
; end of _LAN_Key_5OnClick
_LAN_Key_6OnClick:
;Controller_events_code.c,3047 :: 		void LAN_Key_6OnClick() {
;Controller_events_code.c,3049 :: 		}
L_end_LAN_Key_6OnClick:
BX	LR
; end of _LAN_Key_6OnClick
_LAN_Key_7OnClick:
;Controller_events_code.c,3051 :: 		void LAN_Key_7OnClick() {
;Controller_events_code.c,3053 :: 		}
L_end_LAN_Key_7OnClick:
BX	LR
; end of _LAN_Key_7OnClick
_LAN_Key_8OnClick:
;Controller_events_code.c,3055 :: 		void LAN_Key_8OnClick() {
;Controller_events_code.c,3057 :: 		}
L_end_LAN_Key_8OnClick:
BX	LR
; end of _LAN_Key_8OnClick
_LAN_Key_9OnClick:
;Controller_events_code.c,3059 :: 		void LAN_Key_9OnClick() {
;Controller_events_code.c,3061 :: 		}
L_end_LAN_Key_9OnClick:
BX	LR
; end of _LAN_Key_9OnClick
_LAN_Key_0OnClick:
;Controller_events_code.c,3063 :: 		void LAN_Key_0OnClick() {
;Controller_events_code.c,3065 :: 		}
L_end_LAN_Key_0OnClick:
BX	LR
; end of _LAN_Key_0OnClick
_LAN_Key_DotOnClick:
;Controller_events_code.c,3067 :: 		void LAN_Key_DotOnClick() {
;Controller_events_code.c,3069 :: 		}
L_end_LAN_Key_DotOnClick:
BX	LR
; end of _LAN_Key_DotOnClick
_LAN_Key_ClearOnClick:
;Controller_events_code.c,3071 :: 		void LAN_Key_ClearOnClick() {
;Controller_events_code.c,3073 :: 		}
L_end_LAN_Key_ClearOnClick:
BX	LR
; end of _LAN_Key_ClearOnClick
_LANSetOnClick:
;Controller_events_code.c,3075 :: 		void LANSetOnClick() {
;Controller_events_code.c,3077 :: 		}
L_end_LANSetOnClick:
BX	LR
; end of _LANSetOnClick
_SetGateWayOnClick:
;Controller_events_code.c,3078 :: 		void SetGateWayOnClick(){
;Controller_events_code.c,3079 :: 		}
L_end_SetGateWayOnClick:
BX	LR
; end of _SetGateWayOnClick
_Hyst_Heat_downOnUp:
;Controller_events_code.c,3081 :: 		void Hyst_Heat_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3082 :: 		Hyst_Heat_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3083 :: 		Image114.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3084 :: 		DrawImage(&Hyst_Heat_down);
MOVW	R0, #lo_addr(_Hyst_Heat_down+0)
MOVT	R0, #hi_addr(_Hyst_Heat_down+0)
BL	_DrawImage+0
;Controller_events_code.c,3085 :: 		}
L_end_Hyst_Heat_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_downOnUp
_Hyst_Heat_downOnPress:
;Controller_events_code.c,3086 :: 		void Hyst_Heat_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3088 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3089 :: 		Hyst_Heat_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_down+20)
MOVT	R0, #hi_addr(_Hyst_Heat_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3090 :: 		Image114.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image114+20)
MOVT	R0, #hi_addr(_Image114+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3091 :: 		DrawImage(&Image114);
MOVW	R0, #lo_addr(_Image114+0)
MOVT	R0, #hi_addr(_Image114+0)
BL	_DrawImage+0
;Controller_events_code.c,3092 :: 		system_reg[DIFF_HEAT]--;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3093 :: 		if (system_reg[DIFF_HEAT] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Heat_downOnPress390
;Controller_events_code.c,3094 :: 		system_reg[DIFF_HEAT] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_downOnPress390:
;Controller_events_code.c,3095 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3096 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3097 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3098 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3099 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Heat_downOnPress391:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_downOnPress391
NOP
NOP
NOP
;Controller_events_code.c,3100 :: 		}
L_end_Hyst_Heat_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_downOnPress
_Hyst_Heat_upOnUp:
;Controller_events_code.c,3101 :: 		void Hyst_Heat_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3102 :: 		Hyst_Heat_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3103 :: 		Image121.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3104 :: 		DrawImage(&Hyst_Heat_up);
MOVW	R0, #lo_addr(_Hyst_Heat_up+0)
MOVT	R0, #hi_addr(_Hyst_Heat_up+0)
BL	_DrawImage+0
;Controller_events_code.c,3105 :: 		}
L_end_Hyst_Heat_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Heat_upOnUp
_Hyst_Heat_upOnPress:
;Controller_events_code.c,3106 :: 		void Hyst_Heat_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3108 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3109 :: 		Hyst_Heat_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Heat_up+20)
MOVT	R0, #hi_addr(_Hyst_Heat_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3110 :: 		Image121.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image121+20)
MOVT	R0, #hi_addr(_Image121+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3111 :: 		DrawImage(&Image121);
MOVW	R0, #lo_addr(_Image121+0)
MOVT	R0, #hi_addr(_Image121+0)
BL	_DrawImage+0
;Controller_events_code.c,3112 :: 		system_reg[DIFF_HEAT]++;
MOVW	R1, #lo_addr(_system_reg+320)
MOVT	R1, #hi_addr(_system_reg+320)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3113 :: 		if (system_reg[DIFF_HEAT] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Heat_upOnPress393
;Controller_events_code.c,3114 :: 		system_reg[DIFF_HEAT] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
STRH	R1, [R0, #0]
L_Hyst_Heat_upOnPress393:
;Controller_events_code.c,3115 :: 		IntToStr(system_reg[DIFF_HEAT], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3116 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3117 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3118 :: 		DrawRoundButton(&Hysteresis_heating);
MOVW	R0, #lo_addr(_Hysteresis_heating+0)
MOVT	R0, #hi_addr(_Hysteresis_heating+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3119 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Heat_upOnPress394:
SUBS	R7, R7, #1
BNE	L_Hyst_Heat_upOnPress394
NOP
NOP
NOP
;Controller_events_code.c,3120 :: 		}
L_end_Hyst_Heat_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Heat_upOnPress
_Hyst_Cool_downOnUp:
;Controller_events_code.c,3121 :: 		void Hyst_Cool_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3122 :: 		Hyst_Cool_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3123 :: 		Image115.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3124 :: 		DrawImage(&Hyst_Cool_down);
MOVW	R0, #lo_addr(_Hyst_Cool_down+0)
MOVT	R0, #hi_addr(_Hyst_Cool_down+0)
BL	_DrawImage+0
;Controller_events_code.c,3125 :: 		}
L_end_Hyst_Cool_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_downOnUp
_Hyst_Cool_downOnPress:
;Controller_events_code.c,3126 :: 		void Hyst_Cool_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3128 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3129 :: 		Hyst_Cool_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_down+20)
MOVT	R0, #hi_addr(_Hyst_Cool_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3130 :: 		Image115.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image115+20)
MOVT	R0, #hi_addr(_Image115+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3131 :: 		DrawImage(&Image115);
MOVW	R0, #lo_addr(_Image115+0)
MOVT	R0, #hi_addr(_Image115+0)
BL	_DrawImage+0
;Controller_events_code.c,3132 :: 		system_reg[DIFF_COOL]--;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3133 :: 		if (system_reg[DIFF_COOL] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_Cool_downOnPress396
;Controller_events_code.c,3134 :: 		system_reg[DIFF_COOL] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_downOnPress396:
;Controller_events_code.c,3135 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3136 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3137 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3138 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3139 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Cool_downOnPress397:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_downOnPress397
NOP
NOP
NOP
;Controller_events_code.c,3140 :: 		}
L_end_Hyst_Cool_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_downOnPress
_Hyst_Cool_upOnUp:
;Controller_events_code.c,3141 :: 		void Hyst_Cool_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3142 :: 		Hyst_Cool_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3143 :: 		Image122.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3144 :: 		DrawImage(&Hyst_Cool_up);
MOVW	R0, #lo_addr(_Hyst_Cool_up+0)
MOVT	R0, #hi_addr(_Hyst_Cool_up+0)
BL	_DrawImage+0
;Controller_events_code.c,3146 :: 		}
L_end_Hyst_Cool_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_Cool_upOnUp
_Hyst_Cool_upOnPress:
;Controller_events_code.c,3147 :: 		void Hyst_Cool_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3149 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3150 :: 		Hyst_Cool_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_Cool_up+20)
MOVT	R0, #hi_addr(_Hyst_Cool_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3151 :: 		Image122.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image122+20)
MOVT	R0, #hi_addr(_Image122+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3152 :: 		DrawImage(&Image122);
MOVW	R0, #lo_addr(_Image122+0)
MOVT	R0, #hi_addr(_Image122+0)
BL	_DrawImage+0
;Controller_events_code.c,3153 :: 		system_reg[DIFF_COOL]++;
MOVW	R1, #lo_addr(_system_reg+280)
MOVT	R1, #hi_addr(_system_reg+280)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3154 :: 		if (system_reg[DIFF_COOL] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_Cool_upOnPress399
;Controller_events_code.c,3155 :: 		system_reg[DIFF_COOL] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
STRH	R1, [R0, #0]
L_Hyst_Cool_upOnPress399:
;Controller_events_code.c,3156 :: 		IntToStr(system_reg[DIFF_COOL], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3157 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3158 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3159 :: 		DrawRoundButton(&Hysteresis_cooling);
MOVW	R0, #lo_addr(_Hysteresis_cooling+0)
MOVT	R0, #hi_addr(_Hysteresis_cooling+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3160 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_Cool_upOnPress400:
SUBS	R7, R7, #1
BNE	L_Hyst_Cool_upOnPress400
NOP
NOP
NOP
;Controller_events_code.c,3161 :: 		}
L_end_Hyst_Cool_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_Cool_upOnPress
_Hyst_DHW_downOnUp:
;Controller_events_code.c,3162 :: 		void Hyst_DHW_downOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3163 :: 		Hyst_DHW_down.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3164 :: 		Image116.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3165 :: 		DrawImage(&Hyst_DHW_down);
MOVW	R0, #lo_addr(_Hyst_DHW_down+0)
MOVT	R0, #hi_addr(_Hyst_DHW_down+0)
BL	_DrawImage+0
;Controller_events_code.c,3166 :: 		}
L_end_Hyst_DHW_downOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_downOnUp
_Hyst_DHW_downOnPress:
;Controller_events_code.c,3167 :: 		void Hyst_DHW_downOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3169 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3170 :: 		Hyst_DHW_down.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_down+20)
MOVT	R0, #hi_addr(_Hyst_DHW_down+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3171 :: 		Image116.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image116+20)
MOVT	R0, #hi_addr(_Image116+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3172 :: 		DrawImage(&Image116);
MOVW	R0, #lo_addr(_Image116+0)
MOVT	R0, #hi_addr(_Image116+0)
BL	_DrawImage+0
;Controller_events_code.c,3173 :: 		system_reg[DIFF_DHW]--;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3174 :: 		if (system_reg[DIFF_DHW] <0)
CMP	R0, #0
IT	GE
BGE	L_Hyst_DHW_downOnPress402
;Controller_events_code.c,3175 :: 		system_reg[DIFF_DHW] =0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_downOnPress402:
;Controller_events_code.c,3176 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3177 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3178 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3179 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3180 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_DHW_downOnPress403:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_downOnPress403
NOP
NOP
NOP
;Controller_events_code.c,3181 :: 		}
L_end_Hyst_DHW_downOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_downOnPress
_Hyst_DHW_upOnUp:
;Controller_events_code.c,3182 :: 		void Hyst_DHW_upOnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3183 :: 		Hyst_DHW_up.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3184 :: 		Image123.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3185 :: 		DrawImage(&Hyst_DHW_up);
MOVW	R0, #lo_addr(_Hyst_DHW_up+0)
MOVT	R0, #hi_addr(_Hyst_DHW_up+0)
BL	_DrawImage+0
;Controller_events_code.c,3186 :: 		}
L_end_Hyst_DHW_upOnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Hyst_DHW_upOnUp
_Hyst_DHW_upOnPress:
;Controller_events_code.c,3187 :: 		void Hyst_DHW_upOnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3189 :: 		Hyst_DHW_up.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Hyst_DHW_up+20)
MOVT	R0, #hi_addr(_Hyst_DHW_up+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3190 :: 		Image123.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image123+20)
MOVT	R0, #hi_addr(_Image123+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3191 :: 		DrawImage(&Image123);
MOVW	R0, #lo_addr(_Image123+0)
MOVT	R0, #hi_addr(_Image123+0)
BL	_DrawImage+0
;Controller_events_code.c,3192 :: 		system_reg[DIFF_DHW]++;
MOVW	R1, #lo_addr(_system_reg+300)
MOVT	R1, #hi_addr(_system_reg+300)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3193 :: 		if (system_reg[DIFF_DHW] >30)
CMP	R0, #30
IT	LE
BLE	L_Hyst_DHW_upOnPress405
;Controller_events_code.c,3194 :: 		system_reg[DIFF_DHW] =30;
MOVS	R1, #30
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
STRH	R1, [R0, #0]
L_Hyst_DHW_upOnPress405:
;Controller_events_code.c,3195 :: 		IntToStr(system_reg[DIFF_DHW], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3196 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3197 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3198 :: 		DrawRoundButton(&Hysteresis_DHW);
MOVW	R0, #lo_addr(_Hysteresis_DHW+0)
MOVT	R0, #hi_addr(_Hysteresis_DHW+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3199 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Hyst_DHW_upOnPress406:
SUBS	R7, R7, #1
BNE	L_Hyst_DHW_upOnPress406
NOP
NOP
NOP
;Controller_events_code.c,3200 :: 		}
L_end_Hyst_DHW_upOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Hyst_DHW_upOnPress
_Set_heat_onup:
;Controller_events_code.c,3201 :: 		void Set_heat_onup(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3202 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3203 :: 		Image135.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3204 :: 		Image128.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3205 :: 		DrawImage (&Image135);
MOVW	R0, #lo_addr(_Image135+0)
MOVT	R0, #hi_addr(_Image135+0)
BL	_DrawImage+0
;Controller_events_code.c,3206 :: 		}
L_end_Set_heat_onup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_onup
_Set_heat_OnDown:
;Controller_events_code.c,3207 :: 		void Set_heat_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3208 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3212 :: 		send_data_packet (DIFF_HEAT,1);
MOVS	R1, #1
MOVW	R0, #160
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3213 :: 		Image135.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image135+20)
MOVT	R0, #hi_addr(_Image135+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3214 :: 		Image128.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image128+20)
MOVT	R0, #hi_addr(_Image128+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3215 :: 		DrawImage (&Image128);
MOVW	R0, #lo_addr(_Image128+0)
MOVT	R0, #hi_addr(_Image128+0)
BL	_DrawImage+0
;Controller_events_code.c,3216 :: 		}
L_end_Set_heat_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_heat_OnDown
_Set_cool_OnUp:
;Controller_events_code.c,3217 :: 		void Set_cool_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3218 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3219 :: 		Image138.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3220 :: 		Image129.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3221 :: 		DrawImage (&Image138);
MOVW	R0, #lo_addr(_Image138+0)
MOVT	R0, #hi_addr(_Image138+0)
BL	_DrawImage+0
;Controller_events_code.c,3222 :: 		}
L_end_Set_cool_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnUp
_Set_cool_OnDown:
;Controller_events_code.c,3223 :: 		void Set_cool_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3224 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3228 :: 		send_data_packet (DIFF_COOL,1);
MOVS	R1, #1
MOVW	R0, #140
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3229 :: 		Image138.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image138+20)
MOVT	R0, #hi_addr(_Image138+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3230 :: 		Image129.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image129+20)
MOVT	R0, #hi_addr(_Image129+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3231 :: 		DrawImage (&Image129);
MOVW	R0, #lo_addr(_Image129+0)
MOVT	R0, #hi_addr(_Image129+0)
BL	_DrawImage+0
;Controller_events_code.c,3232 :: 		}
L_end_Set_cool_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_cool_OnDown
_Set_dhw_OnUp:
;Controller_events_code.c,3233 :: 		void Set_dhw_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3234 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3235 :: 		Set_DHW_HY.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3236 :: 		Image130.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3237 :: 		DrawImage (&Set_DHW_HY);
MOVW	R0, #lo_addr(_Set_DHW_HY+0)
MOVT	R0, #hi_addr(_Set_DHW_HY+0)
BL	_DrawImage+0
;Controller_events_code.c,3238 :: 		}
L_end_Set_dhw_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnUp
_Set_dhw_OnDown:
;Controller_events_code.c,3239 :: 		void Set_dhw_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3240 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3244 :: 		send_data_packet (DIFF_DHW,1);
MOVS	R1, #1
MOVW	R0, #150
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3245 :: 		Set_DHW_HY.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_DHW_HY+20)
MOVT	R0, #hi_addr(_Set_DHW_HY+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3246 :: 		Image130.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image130+20)
MOVT	R0, #hi_addr(_Image130+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3247 :: 		DrawImage (&Image130);
MOVW	R0, #lo_addr(_Image130+0)
MOVT	R0, #hi_addr(_Image130+0)
BL	_DrawImage+0
;Controller_events_code.c,3248 :: 		}
L_end_Set_dhw_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_dhw_OnDown
_DEC_EEV2OnPress:
;Controller_events_code.c,3251 :: 		void DEC_EEV2OnPress() {
;Controller_events_code.c,3253 :: 		}
L_end_DEC_EEV2OnPress:
BX	LR
; end of _DEC_EEV2OnPress
_INC_EEV2OnPress:
;Controller_events_code.c,3254 :: 		void INC_EEV2OnPress() {
;Controller_events_code.c,3256 :: 		}
L_end_INC_EEV2OnPress:
BX	LR
; end of _INC_EEV2OnPress
_EEV2DownOnUp:
;Controller_events_code.c,3257 :: 		void EEV2DownOnUp() {
;Controller_events_code.c,3259 :: 		}
L_end_EEV2DownOnUp:
BX	LR
; end of _EEV2DownOnUp
_EEV2DownOnDown:
;Controller_events_code.c,3261 :: 		void EEV2DownOnDown() {
;Controller_events_code.c,3263 :: 		}
L_end_EEV2DownOnDown:
BX	LR
; end of _EEV2DownOnDown
_EEV2UpOnUp:
;Controller_events_code.c,3264 :: 		void EEV2UpOnUp() {
;Controller_events_code.c,3266 :: 		}
L_end_EEV2UpOnUp:
BX	LR
; end of _EEV2UpOnUp
_EEV2UpOnDown:
;Controller_events_code.c,3267 :: 		void EEV2UpOnDown() {
;Controller_events_code.c,3269 :: 		}
L_end_EEV2UpOnDown:
BX	LR
; end of _EEV2UpOnDown
_EEV2_AutoOnClick:
;Controller_events_code.c,3270 :: 		void EEV2_AutoOnClick() {
;Controller_events_code.c,3272 :: 		}
L_end_EEV2_AutoOnClick:
BX	LR
; end of _EEV2_AutoOnClick
_Mode_ground_onOnClick:
;Controller_events_code.c,3274 :: 		void  Mode_ground_onOnClick () {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3275 :: 		if ((unsigned long)Mode_ground_on.Picture_Name == mode_brine_jpg)
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
LDR	R1, [R0, #0]
MOVW	R0, #5350
MOVT	R0, #66
CMP	R1, R0
IT	NE
BNE	L_Mode_ground_onOnClick408
;Controller_events_code.c,3277 :: 		Mode_ground_on.Picture_Name = mode_air_jpg;
MOVW	R1, #63200
MOVT	R1, #65
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3278 :: 		Mode_air_on.Visible= 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Mode_air_on+20)
MOVT	R0, #hi_addr(_Mode_air_on+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3279 :: 		DrawImage(&Mode_air_on);
MOVW	R0, #lo_addr(_Mode_air_on+0)
MOVT	R0, #hi_addr(_Mode_air_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3280 :: 		system_reg[AIRE_TO_WATER]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3281 :: 		ground_heat_pump=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3282 :: 		}
IT	AL
BAL	L_Mode_ground_onOnClick409
L_Mode_ground_onOnClick408:
;Controller_events_code.c,3284 :: 		Mode_ground_on.Picture_Name = mode_brine_jpg;
MOVW	R1, #5350
MOVT	R1, #66
MOVW	R0, #lo_addr(_Mode_ground_on+16)
MOVT	R0, #hi_addr(_Mode_ground_on+16)
STR	R1, [R0, #0]
;Controller_events_code.c,3285 :: 		Mode_ground_on.Visible= 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Mode_ground_on+20)
MOVT	R0, #hi_addr(_Mode_ground_on+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3286 :: 		DrawImage(&Mode_ground_on);
MOVW	R0, #lo_addr(_Mode_ground_on+0)
MOVT	R0, #hi_addr(_Mode_ground_on+0)
BL	_DrawImage+0
;Controller_events_code.c,3287 :: 		system_reg[AIRE_TO_WATER]=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
STRH	R1, [R0, #0]
;Controller_events_code.c,3288 :: 		ground_heat_pump=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ground_heat_pump+0)
MOVT	R0, #hi_addr(_ground_heat_pump+0)
STRB	R1, [R0, #0]
;Controller_events_code.c,3289 :: 		}
L_Mode_ground_onOnClick409:
;Controller_events_code.c,3290 :: 		send_data_packet(AIRE_TO_WATER,1);
MOVS	R1, #1
MOVW	R0, #170
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3291 :: 		Delay_ms (300);
MOVW	R7, #57790
MOVT	R7, #228
NOP
NOP
L_Mode_ground_onOnClick410:
SUBS	R7, R7, #1
BNE	L_Mode_ground_onOnClick410
NOP
NOP
NOP
;Controller_events_code.c,3292 :: 		}
L_end_Mode_ground_onOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Mode_ground_onOnClick
_Down_24_OnPress:
;Controller_events_code.c,3299 :: 		void Down_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3301 :: 		Image99.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3302 :: 		Image17.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3303 :: 		DrawImage(&Image99);
MOVW	R0, #lo_addr(_Image99+0)
MOVT	R0, #hi_addr(_Image99+0)
BL	_DrawImage+0
;Controller_events_code.c,3304 :: 		system_reg[LP_MAX]--;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3305 :: 		if (system_reg[LP_MAX]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_24_OnPress412
;Controller_events_code.c,3306 :: 		system_reg[LP_MAX] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Down_24_OnPress412:
;Controller_events_code.c,3307 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3308 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3309 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3310 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3311 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_24_OnPress413:
SUBS	R7, R7, #1
BNE	L_Down_24_OnPress413
NOP
NOP
NOP
;Controller_events_code.c,3313 :: 		}
L_end_Down_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_24_OnPress
_Down_24_OnUp:
;Controller_events_code.c,3314 :: 		void Down_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3315 :: 		Image99.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image99+20)
MOVT	R0, #hi_addr(_Image99+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3316 :: 		Image17.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3317 :: 		DrawImage(&Image17);
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
BL	_DrawImage+0
;Controller_events_code.c,3318 :: 		}
L_end_Down_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_24_OnUp
_Up_24_OnPress:
;Controller_events_code.c,3319 :: 		void Up_24_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3321 :: 		Image100.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3322 :: 		Image12.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3323 :: 		DrawImage(&Image100);
MOVW	R0, #lo_addr(_Image100+0)
MOVT	R0, #hi_addr(_Image100+0)
BL	_DrawImage+0
;Controller_events_code.c,3324 :: 		system_reg[LP_MAX]++;
MOVW	R1, #lo_addr(_system_reg+460)
MOVT	R1, #hi_addr(_system_reg+460)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3325 :: 		if (system_reg[LP_MAX]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_24_OnPress415
;Controller_events_code.c,3326 :: 		system_reg[LP_MAX] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
STRH	R1, [R0, #0]
L_Up_24_OnPress415:
;Controller_events_code.c,3327 :: 		IntToStr(system_reg[LP_MAX], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3328 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3329 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3330 :: 		DrawRoundButton(&Set_max_low_pressure);
MOVW	R0, #lo_addr(_Set_max_low_pressure+0)
MOVT	R0, #hi_addr(_Set_max_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3331 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_24_OnPress416:
SUBS	R7, R7, #1
BNE	L_Up_24_OnPress416
NOP
NOP
NOP
;Controller_events_code.c,3333 :: 		}
L_end_Up_24_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_24_OnPress
_Up_24_OnUp:
;Controller_events_code.c,3334 :: 		void Up_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3335 :: 		Image100.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image100+20)
MOVT	R0, #hi_addr(_Image100+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3336 :: 		Image12.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3337 :: 		DrawImage(&Image12);
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
BL	_DrawImage+0
;Controller_events_code.c,3338 :: 		}
L_end_Up_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_24_OnUp
_Down_25_OnPress:
;Controller_events_code.c,3339 :: 		void Down_25_OnPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3341 :: 		Image280.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3342 :: 		Image18.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3343 :: 		DrawImage(&Image280);
MOVW	R0, #lo_addr(_Image280+0)
MOVT	R0, #hi_addr(_Image280+0)
BL	_DrawImage+0
;Controller_events_code.c,3344 :: 		system_reg[LP_MIN]--;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3345 :: 		if (system_reg[LP_MIN]<0)
CMP	R0, #0
IT	GE
BGE	L_Down_25_OnPress418
;Controller_events_code.c,3346 :: 		system_reg[LP_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Down_25_OnPress418:
;Controller_events_code.c,3347 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3348 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3349 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3350 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3351 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_25_OnPress419:
SUBS	R7, R7, #1
BNE	L_Down_25_OnPress419
NOP
NOP
NOP
;Controller_events_code.c,3353 :: 		}
L_end_Down_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_25_OnPress
_Down_25_OnUp:
;Controller_events_code.c,3354 :: 		void Down_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3355 :: 		Image280.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image280+20)
MOVT	R0, #hi_addr(_Image280+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3356 :: 		Image18.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3357 :: 		DrawImage(&Image18);
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
BL	_DrawImage+0
;Controller_events_code.c,3359 :: 		}
L_end_Down_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_25_OnUp
_Up_25_OnPress:
;Controller_events_code.c,3360 :: 		void Up_25_OnPress(){
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Controller_events_code.c,3362 :: 		Image281.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3363 :: 		Image14.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3364 :: 		DrawImage(&Image281);
MOVW	R0, #lo_addr(_Image281+0)
MOVT	R0, #hi_addr(_Image281+0)
BL	_DrawImage+0
;Controller_events_code.c,3365 :: 		system_reg[LP_MIN]++;
MOVW	R1, #lo_addr(_system_reg+500)
MOVT	R1, #hi_addr(_system_reg+500)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3366 :: 		if (system_reg[LP_MIN]>99)
CMP	R0, #99
IT	LE
BLE	L_Up_25_OnPress421
;Controller_events_code.c,3367 :: 		system_reg[LP_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
STRH	R1, [R0, #0]
L_Up_25_OnPress421:
;Controller_events_code.c,3368 :: 		IntToStr(system_reg[LP_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3369 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3370 :: 		strncpy(Set_min_low_pressure.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3371 :: 		DrawRoundButton(&Set_min_low_pressure);
MOVW	R0, #lo_addr(_Set_min_low_pressure+0)
MOVT	R0, #hi_addr(_Set_min_low_pressure+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3372 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_25_OnPress422:
SUBS	R7, R7, #1
BNE	L_Up_25_OnPress422
NOP
NOP
NOP
;Controller_events_code.c,3373 :: 		}
L_end_Up_25_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Up_25_OnPress
_Up_25_OnUp:
;Controller_events_code.c,3374 :: 		void Up_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3375 :: 		Image281.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image281+20)
MOVT	R0, #hi_addr(_Image281+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3376 :: 		Image14.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3377 :: 		DrawImage(&Image14);
MOVW	R0, #lo_addr(_Image14+0)
MOVT	R0, #hi_addr(_Image14+0)
BL	_DrawImage+0
;Controller_events_code.c,3378 :: 		}
L_end_Up_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_25_OnUp
_Down_26_OnPress:
;Controller_events_code.c,3379 :: 		void Down_26_OnPress() {
;Controller_events_code.c,3381 :: 		}
L_end_Down_26_OnPress:
BX	LR
; end of _Down_26_OnPress
_Down_26_OnUp:
;Controller_events_code.c,3382 :: 		void Down_26_OnUp() {
;Controller_events_code.c,3384 :: 		}
L_end_Down_26_OnUp:
BX	LR
; end of _Down_26_OnUp
_UP_26_OnPress:
;Controller_events_code.c,3385 :: 		void UP_26_OnPress() {
;Controller_events_code.c,3387 :: 		}
L_end_UP_26_OnPress:
BX	LR
; end of _UP_26_OnPress
_UP_26_OnUp:
;Controller_events_code.c,3388 :: 		void UP_26_OnUp() {
;Controller_events_code.c,3390 :: 		}
L_end_UP_26_OnUp:
BX	LR
; end of _UP_26_OnUp
_Set_24_OnDown:
;Controller_events_code.c,3391 :: 		void Set_24_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3392 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3396 :: 		send_data_packet(LP_MAX,1);
MOVS	R1, #1
MOVW	R0, #230
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3397 :: 		Image279.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3398 :: 		Image29.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3399 :: 		DrawImage (&Image29);
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
BL	_DrawImage+0
;Controller_events_code.c,3400 :: 		}
L_end_Set_24_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnDown
_Set_24_OnUp:
;Controller_events_code.c,3401 :: 		void Set_24_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3402 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3403 :: 		Image279.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image279+20)
MOVT	R0, #hi_addr(_Image279+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3404 :: 		Image29.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3405 :: 		DrawImage (&Image279);
MOVW	R0, #lo_addr(_Image279+0)
MOVT	R0, #hi_addr(_Image279+0)
BL	_DrawImage+0
;Controller_events_code.c,3406 :: 		}
L_end_Set_24_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_24_OnUp
_Set_25_OnDown:
;Controller_events_code.c,3407 :: 		void Set_25_OnDown(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3408 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3412 :: 		send_data_packet(LP_MIN,1);
MOVS	R1, #1
MOVW	R0, #250
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3413 :: 		Image282.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3414 :: 		Image22.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3415 :: 		DrawImage (&Image22);
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
BL	_DrawImage+0
;Controller_events_code.c,3416 :: 		}
L_end_Set_25_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnDown
_Set_25_OnUp:
;Controller_events_code.c,3417 :: 		void Set_25_OnUp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3418 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3419 :: 		Image282.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image282+20)
MOVT	R0, #hi_addr(_Image282+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3420 :: 		Image22.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3421 :: 		DrawImage (&Image282);
MOVW	R0, #lo_addr(_Image282+0)
MOVT	R0, #hi_addr(_Image282+0)
BL	_DrawImage+0
;Controller_events_code.c,3422 :: 		}
L_end_Set_25_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_25_OnUp
_Set_26_OnDown:
;Controller_events_code.c,3423 :: 		void Set_26_OnDown() {
;Controller_events_code.c,3425 :: 		}
L_end_Set_26_OnDown:
BX	LR
; end of _Set_26_OnDown
_Set_26_OnUp:
;Controller_events_code.c,3426 :: 		void Set_26_OnUp() {
;Controller_events_code.c,3428 :: 		}
L_end_Set_26_OnUp:
BX	LR
; end of _Set_26_OnUp
_Set_phase_check:
;Controller_events_code.c,3429 :: 		void Set_phase_check(){
;Controller_events_code.c,3431 :: 		}
L_end_Set_phase_check:
BX	LR
; end of _Set_phase_check
_Set_voltage_check:
;Controller_events_code.c,3432 :: 		void Set_voltage_check(){
;Controller_events_code.c,3434 :: 		}
L_end_Set_voltage_check:
BX	LR
; end of _Set_voltage_check
_Down_13_OnUp:
;Controller_events_code.c,3437 :: 		void Down_13_OnUp() {
;Controller_events_code.c,3439 :: 		}
L_end_Down_13_OnUp:
BX	LR
; end of _Down_13_OnUp
_Down_13_OnPress:
;Controller_events_code.c,3440 :: 		void Down_13_OnPress() {
;Controller_events_code.c,3441 :: 		}
L_end_Down_13_OnPress:
BX	LR
; end of _Down_13_OnPress
_Up_13_OnPress:
;Controller_events_code.c,3442 :: 		void Up_13_OnPress() {
;Controller_events_code.c,3444 :: 		}
L_end_Up_13_OnPress:
BX	LR
; end of _Up_13_OnPress
_Up_13_OnUp:
;Controller_events_code.c,3445 :: 		void Up_13_OnUp() {
;Controller_events_code.c,3447 :: 		}
L_end_Up_13_OnUp:
BX	LR
; end of _Up_13_OnUp
_Down_14_OnPress:
;Controller_events_code.c,3449 :: 		void Down_14_OnPress() {
;Controller_events_code.c,3451 :: 		}
L_end_Down_14_OnPress:
BX	LR
; end of _Down_14_OnPress
_Down_14_OnUp:
;Controller_events_code.c,3452 :: 		void Down_14_OnUp() {
;Controller_events_code.c,3454 :: 		}
L_end_Down_14_OnUp:
BX	LR
; end of _Down_14_OnUp
_Up_14_OnPress:
;Controller_events_code.c,3455 :: 		void Up_14_OnPress() {
;Controller_events_code.c,3457 :: 		}
L_end_Up_14_OnPress:
BX	LR
; end of _Up_14_OnPress
_Up_14_OnUp:
;Controller_events_code.c,3458 :: 		void Up_14_OnUp() {
;Controller_events_code.c,3460 :: 		}
L_end_Up_14_OnUp:
BX	LR
; end of _Up_14_OnUp
_Down_15_OnPress:
;Controller_events_code.c,3461 :: 		void Down_15_OnPress() {
;Controller_events_code.c,3463 :: 		}
L_end_Down_15_OnPress:
BX	LR
; end of _Down_15_OnPress
_Down_15_OnUp:
;Controller_events_code.c,3464 :: 		void Down_15_OnUp() {
;Controller_events_code.c,3466 :: 		}
L_end_Down_15_OnUp:
BX	LR
; end of _Down_15_OnUp
_Up_15_OnPress:
;Controller_events_code.c,3467 :: 		void Up_15_OnPress() {
;Controller_events_code.c,3469 :: 		}
L_end_Up_15_OnPress:
BX	LR
; end of _Up_15_OnPress
_Up_15_OnUp:
;Controller_events_code.c,3470 :: 		void Up_15_OnUp() {
;Controller_events_code.c,3472 :: 		}
L_end_Up_15_OnUp:
BX	LR
; end of _Up_15_OnUp
_Down_16_OnPress:
;Controller_events_code.c,3473 :: 		void Down_16_OnPress() {
;Controller_events_code.c,3475 :: 		}
L_end_Down_16_OnPress:
BX	LR
; end of _Down_16_OnPress
_Down_16_OnUp:
;Controller_events_code.c,3476 :: 		void Down_16_OnUp() {
;Controller_events_code.c,3478 :: 		}
L_end_Down_16_OnUp:
BX	LR
; end of _Down_16_OnUp
_Up_16_OnPress:
;Controller_events_code.c,3479 :: 		void Up_16_OnPress() {
;Controller_events_code.c,3481 :: 		}
L_end_Up_16_OnPress:
BX	LR
; end of _Up_16_OnPress
_Up_16_OnUp:
;Controller_events_code.c,3482 :: 		void Up_16_OnUp() {
;Controller_events_code.c,3484 :: 		}
L_end_Up_16_OnUp:
BX	LR
; end of _Up_16_OnUp
_Down_17_OnPress:
;Controller_events_code.c,3485 :: 		void Down_17_OnPress() {      // Electric heater preset setting
;Controller_events_code.c,3487 :: 		}
L_end_Down_17_OnPress:
BX	LR
; end of _Down_17_OnPress
_Down_17_OnUp:
;Controller_events_code.c,3488 :: 		void Down_17_OnUp() {
;Controller_events_code.c,3490 :: 		}
L_end_Down_17_OnUp:
BX	LR
; end of _Down_17_OnUp
_Up_17_OnPress:
;Controller_events_code.c,3491 :: 		void Up_17_OnPress() {
;Controller_events_code.c,3493 :: 		}
L_end_Up_17_OnPress:
BX	LR
; end of _Up_17_OnPress
_Up_17_OnUp:
;Controller_events_code.c,3494 :: 		void Up_17_OnUp() {
;Controller_events_code.c,3496 :: 		}
L_end_Up_17_OnUp:
BX	LR
; end of _Up_17_OnUp
_Down_18_OnPress:
;Controller_events_code.c,3497 :: 		void Down_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3499 :: 		Tone3 ();
BL	_Tone3+0
;Controller_events_code.c,3500 :: 		Image481.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3501 :: 		Down_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3502 :: 		DrawImage(&Image481);
MOVW	R0, #lo_addr(_Image481+0)
MOVT	R0, #hi_addr(_Image481+0)
BL	_DrawImage+0
;Controller_events_code.c,3503 :: 		system_reg[S_HEAT_MIN]--;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3504 :: 		if (system_reg[S_HEAT_MIN] < 0)
CMP	R0, #0
IT	GE
BGE	L_Down_18_OnPress424
;Controller_events_code.c,3505 :: 		system_reg[S_HEAT_MIN] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Down_18_OnPress424:
;Controller_events_code.c,3506 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3507 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3508 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3509 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3510 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Down_18_OnPress425:
SUBS	R7, R7, #1
BNE	L_Down_18_OnPress425
NOP
NOP
NOP
;Controller_events_code.c,3511 :: 		}
L_end_Down_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Down_18_OnPress
_Down_18_OnUp:
;Controller_events_code.c,3512 :: 		void Down_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3513 :: 		Image481.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image481+20)
MOVT	R0, #hi_addr(_Image481+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3514 :: 		Down_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Down_18_+20)
MOVT	R0, #hi_addr(_Down_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3515 :: 		DrawImage(&Down_18_);
MOVW	R0, #lo_addr(_Down_18_+0)
MOVT	R0, #hi_addr(_Down_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3516 :: 		}
L_end_Down_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down_18_OnUp
_Up_18_OnPress:
;Controller_events_code.c,3517 :: 		void Up_18_OnPress() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3519 :: 		Tone2 ();
BL	_Tone2+0
;Controller_events_code.c,3520 :: 		Image477.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3521 :: 		Up_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3522 :: 		DrawImage(&Image477);
MOVW	R0, #lo_addr(_Image477+0)
MOVT	R0, #hi_addr(_Image477+0)
BL	_DrawImage+0
;Controller_events_code.c,3523 :: 		system_reg[S_HEAT_MIN]++;
MOVW	R1, #lo_addr(_system_reg+580)
MOVT	R1, #hi_addr(_system_reg+580)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3524 :: 		if (system_reg[S_HEAT_MIN] >99)
CMP	R0, #99
IT	LE
BLE	L_Up_18_OnPress427
;Controller_events_code.c,3525 :: 		system_reg[S_HEAT_MIN] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
STRH	R1, [R0, #0]
L_Up_18_OnPress427:
;Controller_events_code.c,3526 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3527 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3528 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3529 :: 		DrawRoundButton(&Set_min_superheat);
MOVW	R0, #lo_addr(_Set_min_superheat+0)
MOVT	R0, #hi_addr(_Set_min_superheat+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3530 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Up_18_OnPress428:
SUBS	R7, R7, #1
BNE	L_Up_18_OnPress428
NOP
NOP
NOP
;Controller_events_code.c,3531 :: 		}
L_end_Up_18_OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Up_18_OnPress
_Up_18_OnUp:
;Controller_events_code.c,3532 :: 		void Up_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3533 :: 		Image477.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image477+20)
MOVT	R0, #hi_addr(_Image477+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3534 :: 		Up_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Up_18_+20)
MOVT	R0, #hi_addr(_Up_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3535 :: 		DrawImage(&Up_18_);
MOVW	R0, #lo_addr(_Up_18_+0)
MOVT	R0, #hi_addr(_Up_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3536 :: 		}
L_end_Up_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Up_18_OnUp
_Set_15_OnUp:
;Controller_events_code.c,3537 :: 		void Set_15_OnUp() {
;Controller_events_code.c,3539 :: 		}
L_end_Set_15_OnUp:
BX	LR
; end of _Set_15_OnUp
_Set_15_OnDown:
;Controller_events_code.c,3540 :: 		void Set_15_OnDown() {
;Controller_events_code.c,3542 :: 		}
L_end_Set_15_OnDown:
BX	LR
; end of _Set_15_OnDown
_Set_16_OnUp:
;Controller_events_code.c,3543 :: 		void Set_16_OnUp() {
;Controller_events_code.c,3545 :: 		}
L_end_Set_16_OnUp:
BX	LR
; end of _Set_16_OnUp
_Set_16_OnDown:
;Controller_events_code.c,3546 :: 		void Set_16_OnDown() {
;Controller_events_code.c,3548 :: 		}
L_end_Set_16_OnDown:
BX	LR
; end of _Set_16_OnDown
_Set_17_OnUp:
;Controller_events_code.c,3549 :: 		void Set_17_OnUp () {
;Controller_events_code.c,3551 :: 		}
L_end_Set_17_OnUp:
BX	LR
; end of _Set_17_OnUp
_Set_17_OnDown:
;Controller_events_code.c,3552 :: 		void Set_17_OnDown() {
;Controller_events_code.c,3554 :: 		}
L_end_Set_17_OnDown:
BX	LR
; end of _Set_17_OnDown
_Set_18_OnUp:
;Controller_events_code.c,3555 :: 		void Set_18_OnUp() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3556 :: 		Set_18_.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3557 :: 		Image485.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3558 :: 		DrawImage (&Set_18_);
MOVW	R0, #lo_addr(_Set_18_+0)
MOVT	R0, #hi_addr(_Set_18_+0)
BL	_DrawImage+0
;Controller_events_code.c,3559 :: 		}
L_end_Set_18_OnUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnUp
_Set_18_OnDown:
;Controller_events_code.c,3560 :: 		void Set_18_OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3561 :: 		Tone1();
BL	_Tone1+0
;Controller_events_code.c,3563 :: 		send_data_packet(S_HEAT_MIN,1);
MOVS	R1, #1
MOVW	R0, #290
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3564 :: 		Set_18_.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_18_+20)
MOVT	R0, #hi_addr(_Set_18_+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3565 :: 		Image485.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image485+20)
MOVT	R0, #hi_addr(_Image485+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3566 :: 		DrawImage (&Image485);
MOVW	R0, #lo_addr(_Image485+0)
MOVT	R0, #hi_addr(_Image485+0)
BL	_DrawImage+0
;Controller_events_code.c,3567 :: 		}
L_end_Set_18_OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_18_OnDown
_Set_14_OnDown:
;Controller_events_code.c,3568 :: 		void Set_14_OnDown() {
;Controller_events_code.c,3570 :: 		}
L_end_Set_14_OnDown:
BX	LR
; end of _Set_14_OnDown
_Set_14_OnUp:
;Controller_events_code.c,3571 :: 		void Set_14_OnUp(){
;Controller_events_code.c,3572 :: 		}
L_end_Set_14_OnUp:
BX	LR
; end of _Set_14_OnUp
_Set_13_OnUp:
;Controller_events_code.c,3573 :: 		void Set_13_OnUp() {
;Controller_events_code.c,3575 :: 		}
L_end_Set_13_OnUp:
BX	LR
; end of _Set_13_OnUp
_Set_13_OnDown:
;Controller_events_code.c,3576 :: 		void Set_13_OnDown() {
;Controller_events_code.c,3578 :: 		}
L_end_Set_13_OnDown:
BX	LR
; end of _Set_13_OnDown
_dec_def:
;Controller_events_code.c,3586 :: 		void dec_def() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3588 :: 		system_reg[TIME_BETWEEN_DEF]--;
MOVW	R1, #lo_addr(_system_reg+960)
MOVT	R1, #hi_addr(_system_reg+960)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3589 :: 		if (system_reg[TIME_BETWEEN_DEF] < 0)
CMP	R0, #0
IT	GE
BGE	L_dec_def430
;Controller_events_code.c,3590 :: 		system_reg[TIME_BETWEEN_DEF] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
STRH	R1, [R0, #0]
L_dec_def430:
;Controller_events_code.c,3591 :: 		IntToStr(system_reg[TIME_BETWEEN_DEF], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3592 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3593 :: 		strncpy(Defrost_on_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_time+24)
MOVT	R0, #hi_addr(_Defrost_on_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3594 :: 		DrawRoundButton(&Defrost_on_time);
MOVW	R0, #lo_addr(_Defrost_on_time+0)
MOVT	R0, #hi_addr(_Defrost_on_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3595 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_dec_def431:
SUBS	R7, R7, #1
BNE	L_dec_def431
NOP
NOP
NOP
;Controller_events_code.c,3596 :: 		}
L_end_dec_def:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _dec_def
_time_def_dec:
;Controller_events_code.c,3598 :: 		void time_def_dec() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3600 :: 		system_reg[TIME_DEFROST]--;
MOVW	R1, #lo_addr(_system_reg+720)
MOVT	R1, #hi_addr(_system_reg+720)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3601 :: 		if (system_reg[TIME_DEFROST] < 0)
CMP	R0, #0
IT	GE
BGE	L_time_def_dec433
;Controller_events_code.c,3602 :: 		system_reg[TIME_DEFROST] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+720)
MOVT	R0, #hi_addr(_system_reg+720)
STRH	R1, [R0, #0]
L_time_def_dec433:
;Controller_events_code.c,3603 :: 		IntToStr(system_reg[TIME_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+720)
MOVT	R0, #hi_addr(_system_reg+720)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3604 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3605 :: 		strncpy(Defrost_off_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_time+24)
MOVT	R0, #hi_addr(_Defrost_off_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3606 :: 		DrawRoundButton(&Defrost_off_time);
MOVW	R0, #lo_addr(_Defrost_off_time+0)
MOVT	R0, #hi_addr(_Defrost_off_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3607 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_time_def_dec434:
SUBS	R7, R7, #1
BNE	L_time_def_dec434
NOP
NOP
NOP
;Controller_events_code.c,3608 :: 		}
L_end_time_def_dec:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _time_def_dec
_temp_on_dec:
;Controller_events_code.c,3610 :: 		void temp_on_dec() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3612 :: 		system_reg[TEMP_DEFROST]--;
MOVW	R1, #lo_addr(_system_reg+700)
MOVT	R1, #hi_addr(_system_reg+700)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3613 :: 		if (system_reg[TEMP_DEFROST] < 0)
CMP	R0, #0
IT	GE
BGE	L_temp_on_dec436
;Controller_events_code.c,3614 :: 		system_reg[TEMP_DEFROST] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
STRH	R1, [R0, #0]
L_temp_on_dec436:
;Controller_events_code.c,3615 :: 		IntToStr(system_reg[TEMP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3616 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3617 :: 		strncpy(Defrost_on_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_temperature+24)
MOVT	R0, #hi_addr(_Defrost_on_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3618 :: 		DrawRoundButton(&Defrost_on_temperature);
MOVW	R0, #lo_addr(_Defrost_on_temperature+0)
MOVT	R0, #hi_addr(_Defrost_on_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3619 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_temp_on_dec437:
SUBS	R7, R7, #1
BNE	L_temp_on_dec437
NOP
NOP
NOP
;Controller_events_code.c,3620 :: 		}
L_end_temp_on_dec:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_on_dec
_temp_off_dec:
;Controller_events_code.c,3622 :: 		void temp_off_dec() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3624 :: 		system_reg[TEMP_STOP_DEFROST]--;
MOVW	R1, #lo_addr(_system_reg+760)
MOVT	R1, #hi_addr(_system_reg+760)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3625 :: 		if (system_reg[TEMP_STOP_DEFROST] < 0)
CMP	R0, #0
IT	GE
BGE	L_temp_off_dec439
;Controller_events_code.c,3626 :: 		system_reg[TEMP_STOP_DEFROST] = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
STRH	R1, [R0, #0]
L_temp_off_dec439:
;Controller_events_code.c,3627 :: 		IntToStr(system_reg[TEMP_STOP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3628 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3629 :: 		strncpy(Defrost_off_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_temperature+24)
MOVT	R0, #hi_addr(_Defrost_off_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3630 :: 		DrawRoundButton(&Defrost_off_temperature);
MOVW	R0, #lo_addr(_Defrost_off_temperature+0)
MOVT	R0, #hi_addr(_Defrost_off_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3631 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_temp_off_dec440:
SUBS	R7, R7, #1
BNE	L_temp_off_dec440
NOP
NOP
NOP
;Controller_events_code.c,3632 :: 		}
L_end_temp_off_dec:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_off_dec
_hum_dec:
;Controller_events_code.c,3634 :: 		void hum_dec() {
;Controller_events_code.c,3636 :: 		}
L_end_hum_dec:
BX	LR
; end of _hum_dec
_inc_def:
;Controller_events_code.c,3638 :: 		void inc_def() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3640 :: 		system_reg[TIME_BETWEEN_DEF]++;
MOVW	R1, #lo_addr(_system_reg+960)
MOVT	R1, #hi_addr(_system_reg+960)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3641 :: 		if (system_reg[TIME_BETWEEN_DEF] > 99)
CMP	R0, #99
IT	LE
BLE	L_inc_def442
;Controller_events_code.c,3642 :: 		system_reg[TIME_BETWEEN_DEF] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
STRH	R1, [R0, #0]
L_inc_def442:
;Controller_events_code.c,3643 :: 		IntToStr(system_reg[TIME_BETWEEN_DEF], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3644 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3645 :: 		strncpy(Defrost_on_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_time+24)
MOVT	R0, #hi_addr(_Defrost_on_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3646 :: 		DrawRoundButton(&Defrost_on_time);
MOVW	R0, #lo_addr(_Defrost_on_time+0)
MOVT	R0, #hi_addr(_Defrost_on_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3647 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_inc_def443:
SUBS	R7, R7, #1
BNE	L_inc_def443
NOP
NOP
NOP
;Controller_events_code.c,3648 :: 		}
L_end_inc_def:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _inc_def
_time_def_inc:
;Controller_events_code.c,3650 :: 		void time_def_inc() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3652 :: 		system_reg[TIME_DEFROST]++;
MOVW	R1, #lo_addr(_system_reg+720)
MOVT	R1, #hi_addr(_system_reg+720)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3653 :: 		if (system_reg[TIME_DEFROST] >99)
CMP	R0, #99
IT	LE
BLE	L_time_def_inc445
;Controller_events_code.c,3654 :: 		system_reg[TIME_BETWEEN_DEF] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
STRH	R1, [R0, #0]
L_time_def_inc445:
;Controller_events_code.c,3655 :: 		IntToStr(system_reg[TIME_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+720)
MOVT	R0, #hi_addr(_system_reg+720)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3656 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3657 :: 		strncpy(Defrost_off_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_time+24)
MOVT	R0, #hi_addr(_Defrost_off_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3658 :: 		DrawRoundButton(&Defrost_off_time);
MOVW	R0, #lo_addr(_Defrost_off_time+0)
MOVT	R0, #hi_addr(_Defrost_off_time+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3659 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_time_def_inc446:
SUBS	R7, R7, #1
BNE	L_time_def_inc446
NOP
NOP
NOP
;Controller_events_code.c,3660 :: 		}
L_end_time_def_inc:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _time_def_inc
_temp_on_inc:
;Controller_events_code.c,3662 :: 		void temp_on_inc() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3664 :: 		system_reg[TEMP_DEFROST]++;
MOVW	R1, #lo_addr(_system_reg+700)
MOVT	R1, #hi_addr(_system_reg+700)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3665 :: 		if (system_reg[TEMP_DEFROST] >99)
CMP	R0, #99
IT	LE
BLE	L_temp_on_inc448
;Controller_events_code.c,3666 :: 		system_reg[TEMP_DEFROST] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
STRH	R1, [R0, #0]
L_temp_on_inc448:
;Controller_events_code.c,3667 :: 		IntToStr(system_reg[TEMP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3668 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3669 :: 		strncpy(Defrost_on_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_temperature+24)
MOVT	R0, #hi_addr(_Defrost_on_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3670 :: 		DrawRoundButton(&Defrost_on_temperature);
MOVW	R0, #lo_addr(_Defrost_on_temperature+0)
MOVT	R0, #hi_addr(_Defrost_on_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3671 :: 		Delay_ms (100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_temp_on_inc449:
SUBS	R7, R7, #1
BNE	L_temp_on_inc449
NOP
NOP
NOP
;Controller_events_code.c,3672 :: 		}
L_end_temp_on_inc:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_on_inc
_temp_off_inc:
;Controller_events_code.c,3674 :: 		void temp_off_inc() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Controller_events_code.c,3676 :: 		system_reg[TEMP_STOP_DEFROST]++;
MOVW	R1, #lo_addr(_system_reg+760)
MOVT	R1, #hi_addr(_system_reg+760)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Controller_events_code.c,3677 :: 		if (system_reg[TEMP_STOP_DEFROST] >99)
CMP	R0, #99
IT	LE
BLE	L_temp_off_inc451
;Controller_events_code.c,3678 :: 		system_reg[TEMP_STOP_DEFROST] = 99;
MOVS	R1, #99
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
STRH	R1, [R0, #0]
L_temp_off_inc451:
;Controller_events_code.c,3679 :: 		IntToStr(system_reg[TEMP_STOP_DEFROST], txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Controller_events_code.c,3680 :: 		Ltrim (txt);
ADD	R0, SP, #4
BL	_Ltrim+0
;Controller_events_code.c,3681 :: 		strncpy(Defrost_off_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_temperature+24)
MOVT	R0, #hi_addr(_Defrost_off_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Controller_events_code.c,3682 :: 		DrawRoundButton(&Defrost_off_temperature);
MOVW	R0, #lo_addr(_Defrost_off_temperature+0)
MOVT	R0, #hi_addr(_Defrost_off_temperature+0)
BL	_DrawRoundButton+0
;Controller_events_code.c,3683 :: 		}
L_end_temp_off_inc:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _temp_off_inc
_hum_inc:
;Controller_events_code.c,3685 :: 		void hum_inc() {
;Controller_events_code.c,3687 :: 		}
L_end_hum_inc:
BX	LR
; end of _hum_inc
_hum_set:
;Controller_events_code.c,3693 :: 		void hum_set() {
;Controller_events_code.c,3695 :: 		}
L_end_hum_set:
BX	LR
; end of _hum_set
_SetUPttimDef:
;Controller_events_code.c,3697 :: 		void SetUPttimDef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3699 :: 		Defrost_set1.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set1+20)
MOVT	R0, #hi_addr(_Defrost_set1+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3700 :: 		Image355.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image355+20)
MOVT	R0, #hi_addr(_Image355+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3701 :: 		DrawImage (&Defrost_set1);
MOVW	R0, #lo_addr(_Defrost_set1+0)
MOVT	R0, #hi_addr(_Defrost_set1+0)
BL	_DrawImage+0
;Controller_events_code.c,3702 :: 		}
L_end_SetUPttimDef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SetUPttimDef
_SetdownttimDef:
;Controller_events_code.c,3704 :: 		void SetdownttimDef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3705 :: 		Defrost_set1.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set1+20)
MOVT	R0, #hi_addr(_Defrost_set1+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3706 :: 		Image355.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image355+20)
MOVT	R0, #hi_addr(_Image355+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3707 :: 		DrawImage (&Image355);
MOVW	R0, #lo_addr(_Image355+0)
MOVT	R0, #hi_addr(_Image355+0)
BL	_DrawImage+0
;Controller_events_code.c,3708 :: 		send_data_packet(TIME_BETWEEN_DEF,1);
MOVS	R1, #1
MOVW	R0, #480
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3709 :: 		}
L_end_SetdownttimDef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SetdownttimDef
_Setdownintdef:
;Controller_events_code.c,3711 :: 		void Setdownintdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3712 :: 		Defrost_set2.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set2+20)
MOVT	R0, #hi_addr(_Defrost_set2+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3713 :: 		Image381.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image381+20)
MOVT	R0, #hi_addr(_Image381+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3714 :: 		DrawImage (&Image381);
MOVW	R0, #lo_addr(_Image381+0)
MOVT	R0, #hi_addr(_Image381+0)
BL	_DrawImage+0
;Controller_events_code.c,3715 :: 		send_data_packet(TIME_DEFROST,1);
MOVS	R1, #1
MOVW	R0, #360
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3717 :: 		}
L_end_Setdownintdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setdownintdef
_Setupintdef:
;Controller_events_code.c,3719 :: 		void Setupintdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3720 :: 		Defrost_set2.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set2+20)
MOVT	R0, #hi_addr(_Defrost_set2+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3721 :: 		Image381.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image381+20)
MOVT	R0, #hi_addr(_Image381+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3722 :: 		DrawImage (&Defrost_set2);
MOVW	R0, #lo_addr(_Defrost_set2+0)
MOVT	R0, #hi_addr(_Defrost_set2+0)
BL	_DrawImage+0
;Controller_events_code.c,3724 :: 		}
L_end_Setupintdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setupintdef
_Setuptempdef:
;Controller_events_code.c,3726 :: 		void Setuptempdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3727 :: 		Defrost_set3.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set3+20)
MOVT	R0, #hi_addr(_Defrost_set3+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3728 :: 		Image384.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image384+20)
MOVT	R0, #hi_addr(_Image384+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3729 :: 		DrawImage (&Defrost_set3);
MOVW	R0, #lo_addr(_Defrost_set3+0)
MOVT	R0, #hi_addr(_Defrost_set3+0)
BL	_DrawImage+0
;Controller_events_code.c,3731 :: 		}
L_end_Setuptempdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setuptempdef
_Setdowntempdef:
;Controller_events_code.c,3733 :: 		void Setdowntempdef() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3734 :: 		Defrost_set3.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set3+20)
MOVT	R0, #hi_addr(_Defrost_set3+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3735 :: 		Image384.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image384+20)
MOVT	R0, #hi_addr(_Image384+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3736 :: 		DrawImage (&Image384);
MOVW	R0, #lo_addr(_Image384+0)
MOVT	R0, #hi_addr(_Image384+0)
BL	_DrawImage+0
;Controller_events_code.c,3737 :: 		send_data_packet(TEMP_DEFROST,1);
MOVS	R1, #1
MOVW	R0, #350
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3738 :: 		}
L_end_Setdowntempdef:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Setdowntempdef
_temp_off_set:
;Controller_events_code.c,3740 :: 		void temp_off_set() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3741 :: 		Defrost_set4.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Defrost_set4+20)
MOVT	R0, #hi_addr(_Defrost_set4+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3742 :: 		Image388.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image388+20)
MOVT	R0, #hi_addr(_Image388+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3743 :: 		DrawImage (&Image388);
MOVW	R0, #lo_addr(_Image388+0)
MOVT	R0, #hi_addr(_Image388+0)
BL	_DrawImage+0
;Controller_events_code.c,3744 :: 		send_data_packet(TEMP_STOP_DEFROST,1);
MOVS	R1, #1
MOVW	R0, #380
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3745 :: 		}
L_end_temp_off_set:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _temp_off_set
_temp_on_set:
;Controller_events_code.c,3747 :: 		void temp_on_set() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3748 :: 		Defrost_set4.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Defrost_set4+20)
MOVT	R0, #hi_addr(_Defrost_set4+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3749 :: 		Image388.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image388+20)
MOVT	R0, #hi_addr(_Image388+20)
STRB	R1, [R0, #0]
;Controller_events_code.c,3750 :: 		DrawImage (&Defrost_set4);
MOVW	R0, #lo_addr(_Defrost_set4+0)
MOVT	R0, #hi_addr(_Defrost_set4+0)
BL	_DrawImage+0
;Controller_events_code.c,3752 :: 		}
L_end_temp_on_set:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _temp_on_set
_pushDEF:
;Controller_events_code.c,3753 :: 		void pushDEF(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_events_code.c,3754 :: 		system_reg[PUSH_DEFROS]=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_system_reg+786)
MOVT	R0, #hi_addr(_system_reg+786)
STRH	R1, [R0, #0]
;Controller_events_code.c,3755 :: 		send_data_packet(PUSH_DEFROS,1);
MOVS	R1, #1
MOVW	R0, #393
SXTH	R0, R0
BL	_send_data_packet+0
;Controller_events_code.c,3756 :: 		}
L_end_pushDEF:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _pushDEF
