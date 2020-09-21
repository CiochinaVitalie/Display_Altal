_main_page:
;Pages.c,11 :: 		void main_page(){
SUB	SP, SP, #28
STR	LR, [SP, #0]
;Pages.c,17 :: 		IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #8
BL	_Ltrim+0
;Pages.c,18 :: 		if(system_reg[DHW_TEMP]>=10 && system_reg[DHW_TEMP]<100 )
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	LT
BLT	L__main_page387
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L__main_page386
L__main_page383:
;Pages.c,23 :: 		if(strcmp(dhw_T.Caption[1], txt[0])!=0 || strcmp(dhw_T.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
ADD	R0, SP, #8
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #lo_addr(_dhw_T+24)
MOVT	R0, #hi_addr(_dhw_T+24)
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page385
MOVW	R0, #lo_addr(_dhw_T+24)
MOVT	R0, #hi_addr(_dhw_T+24)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
MOVS	R1, #48
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page384
IT	AL
BAL	L_main_page5
L__main_page385:
L__main_page384:
;Pages.c,25 :: 		strncpy(dhw_T.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_dhw_T+24)
MOVT	R0, #hi_addr(_dhw_T+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,26 :: 		dhw_T.Caption[1]=dhw_T.Caption[0];
MOVW	R2, #lo_addr(_dhw_T+24)
MOVT	R2, #hi_addr(_dhw_T+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;Pages.c,27 :: 		dhw_T.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,28 :: 		DrawRoundButton(&dhw_T);
MOVW	R0, #lo_addr(_dhw_T+0)
MOVT	R0, #hi_addr(_dhw_T+0)
BL	_DrawRoundButton+0
;Pages.c,29 :: 		}
L_main_page5:
;Pages.c,30 :: 		if(dhw_dec.Caption[0]!=txt[1])
MOVW	R0, #lo_addr(_dhw_dec+24)
MOVT	R0, #hi_addr(_dhw_dec+24)
LDR	R0, [R0, #0]
LDRB	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	EQ
BEQ	L_main_page6
;Pages.c,32 :: 		dhw_dec.Caption[0]=txt[1];
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_dhw_dec+24)
MOVT	R0, #hi_addr(_dhw_dec+24)
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,33 :: 		DrawRoundButton(&dhw_dec);
MOVW	R0, #lo_addr(_dhw_dec+0)
MOVT	R0, #hi_addr(_dhw_dec+0)
BL	_DrawRoundButton+0
;Pages.c,34 :: 		}
L_main_page6:
;Pages.c,35 :: 		/*}*/         }
IT	AL
BAL	L_main_page7
;Pages.c,18 :: 		if(system_reg[DHW_TEMP]>=10 && system_reg[DHW_TEMP]<100 )
L__main_page387:
L__main_page386:
;Pages.c,36 :: 		else  if(system_reg[DHW_TEMP]>=0 && system_reg[DHW_TEMP]<10 )
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page389
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page388
L__main_page381:
;Pages.c,38 :: 		if( strncmp("00",dhw_T.Caption,2)!=0){
MOVW	R0, #lo_addr(_dhw_T+24)
MOVT	R0, #hi_addr(_dhw_T+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr1_Pages+0)
MOVT	R0, #hi_addr(?lstr1_Pages+0)
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page11
;Pages.c,39 :: 		dhw_T.Caption[1]='0';
MOVW	R2, #lo_addr(_dhw_T+24)
MOVT	R2, #hi_addr(_dhw_T+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOVS	R0, #48
STRB	R0, [R1, #0]
;Pages.c,40 :: 		dhw_T.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,41 :: 		DrawRoundButton(&dhw_T);}
MOVW	R0, #lo_addr(_dhw_T+0)
MOVT	R0, #hi_addr(_dhw_T+0)
BL	_DrawRoundButton+0
L_main_page11:
;Pages.c,42 :: 		if(strncmp(txt,dhw_dec.Caption,1)!=0)
MOVW	R0, #lo_addr(_dhw_dec+24)
MOVT	R0, #hi_addr(_dhw_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page12
;Pages.c,44 :: 		strncpy(dhw_dec.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_dhw_dec+24)
MOVT	R0, #hi_addr(_dhw_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,45 :: 		DrawRoundButton(&dhw_dec);
MOVW	R0, #lo_addr(_dhw_dec+0)
MOVT	R0, #hi_addr(_dhw_dec+0)
BL	_DrawRoundButton+0
;Pages.c,46 :: 		}
L_main_page12:
;Pages.c,47 :: 		}
IT	AL
BAL	L_main_page13
;Pages.c,36 :: 		else  if(system_reg[DHW_TEMP]>=0 && system_reg[DHW_TEMP]<10 )
L__main_page389:
L__main_page388:
;Pages.c,53 :: 		if(strncmp(txt,dhw_T.Caption,2)!=0){strncpy(dhw_T.Caption, txt, 2);DrawRoundButton(&dhw_T);}
MOVW	R0, #lo_addr(_dhw_T+24)
MOVT	R0, #hi_addr(_dhw_T+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page14
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_dhw_T+24)
MOVT	R0, #hi_addr(_dhw_T+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_dhw_T+0)
MOVT	R0, #hi_addr(_dhw_T+0)
BL	_DrawRoundButton+0
L_main_page14:
;Pages.c,54 :: 		if(strncmp(txt+2,dhw_dec.Caption,1)!=0){strncpy(dhw_dec.Caption, txt+2, 1);DrawRoundButton(&dhw_dec);}
MOVW	R0, #lo_addr(_dhw_dec+24)
MOVT	R0, #hi_addr(_dhw_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page15
ADD	R0, SP, #8
ADDS	R1, R0, #2
MOVW	R0, #lo_addr(_dhw_dec+24)
MOVT	R0, #hi_addr(_dhw_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_dhw_dec+0)
MOVT	R0, #hi_addr(_dhw_dec+0)
BL	_DrawRoundButton+0
L_main_page15:
;Pages.c,55 :: 		}
L_main_page13:
L_main_page7:
;Pages.c,56 :: 		IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #8
BL	_Ltrim+0
;Pages.c,57 :: 		if(system_reg[BAC_TEMP]>=10 && system_reg[BAC_TEMP]<100 )
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	LT
BLT	L__main_page393
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L__main_page392
L__main_page380:
;Pages.c,62 :: 		if(strcmp(heat_T.Caption[1], txt[0])!=0 || strcmp(heat_T.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
ADD	R0, SP, #8
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #lo_addr(_heat_T+24)
MOVT	R0, #hi_addr(_heat_T+24)
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page391
MOVW	R0, #lo_addr(_heat_T+24)
MOVT	R0, #hi_addr(_heat_T+24)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
MOVS	R1, #48
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page390
IT	AL
BAL	L_main_page21
L__main_page391:
L__main_page390:
;Pages.c,64 :: 		strncpy(heat_T.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_heat_T+24)
MOVT	R0, #hi_addr(_heat_T+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,65 :: 		heat_T.Caption[1]=heat_T.Caption[0];
MOVW	R2, #lo_addr(_heat_T+24)
MOVT	R2, #hi_addr(_heat_T+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;Pages.c,66 :: 		heat_T.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,67 :: 		DrawRoundButton(&heat_T);
MOVW	R0, #lo_addr(_heat_T+0)
MOVT	R0, #hi_addr(_heat_T+0)
BL	_DrawRoundButton+0
;Pages.c,68 :: 		}
L_main_page21:
;Pages.c,69 :: 		if(heat_dec.Caption[0]!=txt[1])
MOVW	R0, #lo_addr(_heat_dec+24)
MOVT	R0, #hi_addr(_heat_dec+24)
LDR	R0, [R0, #0]
LDRB	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	EQ
BEQ	L_main_page22
;Pages.c,71 :: 		heat_dec.Caption[0]=txt[1];
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_heat_dec+24)
MOVT	R0, #hi_addr(_heat_dec+24)
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,72 :: 		DrawRoundButton(&heat_dec);
MOVW	R0, #lo_addr(_heat_dec+0)
MOVT	R0, #hi_addr(_heat_dec+0)
BL	_DrawRoundButton+0
;Pages.c,73 :: 		}
L_main_page22:
;Pages.c,74 :: 		}
IT	AL
BAL	L_main_page23
;Pages.c,57 :: 		if(system_reg[BAC_TEMP]>=10 && system_reg[BAC_TEMP]<100 )
L__main_page393:
L__main_page392:
;Pages.c,76 :: 		else if(system_reg[BAC_TEMP]>=0 && system_reg[BAC_TEMP]<10 )
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L__main_page395
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L__main_page394
L__main_page378:
;Pages.c,78 :: 		if( strncmp("00",heat_T.Caption,2)!=0){
MOVW	R0, #lo_addr(_heat_T+24)
MOVT	R0, #hi_addr(_heat_T+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr2_Pages+0)
MOVT	R0, #hi_addr(?lstr2_Pages+0)
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page27
;Pages.c,79 :: 		heat_T.Caption[1]='0';
MOVW	R2, #lo_addr(_heat_T+24)
MOVT	R2, #hi_addr(_heat_T+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOVS	R0, #48
STRB	R0, [R1, #0]
;Pages.c,80 :: 		heat_T.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,81 :: 		DrawRoundButton(&heat_T); }
MOVW	R0, #lo_addr(_heat_T+0)
MOVT	R0, #hi_addr(_heat_T+0)
BL	_DrawRoundButton+0
L_main_page27:
;Pages.c,82 :: 		if(strncmp(txt,heat_dec.Caption,1)!=0)
MOVW	R0, #lo_addr(_heat_dec+24)
MOVT	R0, #hi_addr(_heat_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page28
;Pages.c,84 :: 		strncpy(heat_dec.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_heat_dec+24)
MOVT	R0, #hi_addr(_heat_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,85 :: 		DrawRoundButton(&heat_dec);
MOVW	R0, #lo_addr(_heat_dec+0)
MOVT	R0, #hi_addr(_heat_dec+0)
BL	_DrawRoundButton+0
;Pages.c,86 :: 		}
L_main_page28:
;Pages.c,87 :: 		}
IT	AL
BAL	L_main_page29
;Pages.c,76 :: 		else if(system_reg[BAC_TEMP]>=0 && system_reg[BAC_TEMP]<10 )
L__main_page395:
L__main_page394:
;Pages.c,93 :: 		if(strncmp(txt,heat_T.Caption,2)!=0){strncpy(heat_T.Caption, txt, 2);DrawRoundButton(&heat_T);}
MOVW	R0, #lo_addr(_heat_T+24)
MOVT	R0, #hi_addr(_heat_T+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page30
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_heat_T+24)
MOVT	R0, #hi_addr(_heat_T+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_heat_T+0)
MOVT	R0, #hi_addr(_heat_T+0)
BL	_DrawRoundButton+0
L_main_page30:
;Pages.c,94 :: 		if(strncmp(txt+2,heat_dec.Caption,1)!=0){strncpy(heat_dec.Caption, txt+2, 1);DrawRoundButton(&heat_dec);}
MOVW	R0, #lo_addr(_heat_dec+24)
MOVT	R0, #hi_addr(_heat_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page31
ADD	R0, SP, #8
ADDS	R1, R0, #2
MOVW	R0, #lo_addr(_heat_dec+24)
MOVT	R0, #hi_addr(_heat_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_heat_dec+0)
MOVT	R0, #hi_addr(_heat_dec+0)
BL	_DrawRoundButton+0
L_main_page31:
;Pages.c,95 :: 		}
L_main_page29:
L_main_page23:
;Pages.c,96 :: 		IntToStr((int)fabs(system_reg[SOURC_OUT_1]), txt);Ltrim(txt);
ADD	R0, SP, #8
STR	R0, [SP, #24]
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
LDR	R0, [SP, #24]
STRH	R1, [SP, #4]
MOV	R1, R0
LDRSH	R0, [SP, #4]
BL	_IntToStr+0
ADD	R0, SP, #8
BL	_Ltrim+0
;Pages.c,97 :: 		if(system_reg[SOURC_OUT_1]<0 && strncmp("-",sign_OUT.Caption,1)!=0){sign_OUT.Caption="-";DrawRoundButton(&sign_OUT);}
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	GE
BGE	L__main_page397
MOVW	R0, #lo_addr(_sign_OUT+24)
MOVT	R0, #hi_addr(_sign_OUT+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr3_Pages+0)
MOVT	R0, #hi_addr(?lstr3_Pages+0)
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__main_page396
L__main_page377:
MOVW	R1, #lo_addr(?lstr4_Pages+0)
MOVT	R1, #hi_addr(?lstr4_Pages+0)
MOVW	R0, #lo_addr(_sign_OUT+24)
MOVT	R0, #hi_addr(_sign_OUT+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_sign_OUT+0)
MOVT	R0, #hi_addr(_sign_OUT+0)
BL	_DrawRoundButton+0
IT	AL
BAL	L_main_page35
L__main_page397:
L__main_page396:
;Pages.c,98 :: 		else if(system_reg[SOURC_OUT_1]>0 && strncmp("+",sign_OUT.Caption,1)!=0){sign_OUT.Caption="+";DrawRoundButton(&sign_OUT);}
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L__main_page399
MOVW	R0, #lo_addr(_sign_OUT+24)
MOVT	R0, #hi_addr(_sign_OUT+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr5_Pages+0)
MOVT	R0, #hi_addr(?lstr5_Pages+0)
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__main_page398
L__main_page376:
MOVW	R1, #lo_addr(?lstr6_Pages+0)
MOVT	R1, #hi_addr(?lstr6_Pages+0)
MOVW	R0, #lo_addr(_sign_OUT+24)
MOVT	R0, #hi_addr(_sign_OUT+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_sign_OUT+0)
MOVT	R0, #hi_addr(_sign_OUT+0)
BL	_DrawRoundButton+0
L__main_page399:
L__main_page398:
L_main_page35:
;Pages.c,99 :: 		if((int)fabs(system_reg[SOURC_OUT_1])>=10 && (int)fabs(system_reg[SOURC_OUT_1])<100)
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #10
IT	LT
BLT	L__main_page403
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #100
IT	GE
BGE	L__main_page402
L__main_page375:
;Pages.c,103 :: 		if(strcmp(sourc_out_TEMP.Caption[1], txt[0])!=0 || strcmp(sourc_out_TEMP.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
ADD	R0, SP, #8
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #lo_addr(_sourc_out_TEMP+24)
MOVT	R0, #hi_addr(_sourc_out_TEMP+24)
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page401
MOVW	R0, #lo_addr(_sourc_out_TEMP+24)
MOVT	R0, #hi_addr(_sourc_out_TEMP+24)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
MOVS	R1, #48
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page400
IT	AL
BAL	L_main_page44
L__main_page401:
L__main_page400:
;Pages.c,105 :: 		strncpy(sourc_out_TEMP.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_sourc_out_TEMP+24)
MOVT	R0, #hi_addr(_sourc_out_TEMP+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,106 :: 		sourc_out_TEMP.Caption[1]=sourc_out_TEMP.Caption[0];
MOVW	R2, #lo_addr(_sourc_out_TEMP+24)
MOVT	R2, #hi_addr(_sourc_out_TEMP+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;Pages.c,107 :: 		sourc_out_TEMP.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,108 :: 		DrawRoundButton(&sourc_out_TEMP);
MOVW	R0, #lo_addr(_sourc_out_TEMP+0)
MOVT	R0, #hi_addr(_sourc_out_TEMP+0)
BL	_DrawRoundButton+0
;Pages.c,109 :: 		}
L_main_page44:
;Pages.c,110 :: 		if(source_out_dec.Caption[0]!=txt[1])
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R0, [R0, #0]
LDRB	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	EQ
BEQ	L_main_page45
;Pages.c,112 :: 		source_out_dec.Caption[0]=txt[1];
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,113 :: 		DrawRoundButton(&source_out_dec);
MOVW	R0, #lo_addr(_source_out_dec+0)
MOVT	R0, #hi_addr(_source_out_dec+0)
BL	_DrawRoundButton+0
;Pages.c,114 :: 		}
L_main_page45:
;Pages.c,115 :: 		}
IT	AL
BAL	L_main_page46
;Pages.c,99 :: 		if((int)fabs(system_reg[SOURC_OUT_1])>=10 && (int)fabs(system_reg[SOURC_OUT_1])<100)
L__main_page403:
L__main_page402:
;Pages.c,116 :: 		else  if((int)fabs(system_reg[SOURC_OUT_1])>=0 && (int)fabs(system_reg[SOURC_OUT_1])<10)
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #0
IT	LT
BLT	L__main_page405
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #10
IT	GE
BGE	L__main_page404
L__main_page373:
;Pages.c,118 :: 		if( strncmp("00",sourc_out_TEMP.Caption,2)!=0){
MOVW	R0, #lo_addr(_sourc_out_TEMP+24)
MOVT	R0, #hi_addr(_sourc_out_TEMP+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr7_Pages+0)
MOVT	R0, #hi_addr(?lstr7_Pages+0)
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page50
;Pages.c,119 :: 		sourc_out_TEMP.Caption[1]='0';
MOVW	R2, #lo_addr(_sourc_out_TEMP+24)
MOVT	R2, #hi_addr(_sourc_out_TEMP+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOVS	R0, #48
STRB	R0, [R1, #0]
;Pages.c,120 :: 		sourc_out_TEMP.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,121 :: 		DrawRoundButton(&sourc_out_TEMP);}
MOVW	R0, #lo_addr(_sourc_out_TEMP+0)
MOVT	R0, #hi_addr(_sourc_out_TEMP+0)
BL	_DrawRoundButton+0
L_main_page50:
;Pages.c,122 :: 		if(strncmp(txt,source_out_dec.Caption,1)!=0)
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page51
;Pages.c,124 :: 		strncpy(source_out_dec.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,125 :: 		DrawRoundButton(&source_out_dec);
MOVW	R0, #lo_addr(_source_out_dec+0)
MOVT	R0, #hi_addr(_source_out_dec+0)
BL	_DrawRoundButton+0
;Pages.c,126 :: 		}
L_main_page51:
;Pages.c,127 :: 		}
IT	AL
BAL	L_main_page52
;Pages.c,116 :: 		else  if((int)fabs(system_reg[SOURC_OUT_1])>=0 && (int)fabs(system_reg[SOURC_OUT_1])<10)
L__main_page405:
L__main_page404:
;Pages.c,139 :: 		if(strncmp(txt,sourc_out_TEMP.Caption,2)!=0){strncpy(sourc_out_TEMP.Caption, txt, 2);DrawRoundButton(&sourc_out_TEMP);}
MOVW	R0, #lo_addr(_sourc_out_TEMP+24)
MOVT	R0, #hi_addr(_sourc_out_TEMP+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page53
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_sourc_out_TEMP+24)
MOVT	R0, #hi_addr(_sourc_out_TEMP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_sourc_out_TEMP+0)
MOVT	R0, #hi_addr(_sourc_out_TEMP+0)
BL	_DrawRoundButton+0
L_main_page53:
;Pages.c,140 :: 		if(strncmp(txt+2,source_out_dec.Caption,1)!=0){strncpy(source_out_dec.Caption, txt+2, 1);DrawRoundButton(&source_out_dec);}
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page54
ADD	R0, SP, #8
ADDS	R1, R0, #2
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_source_out_dec+0)
MOVT	R0, #hi_addr(_source_out_dec+0)
BL	_DrawRoundButton+0
L_main_page54:
;Pages.c,141 :: 		}
L_main_page52:
L_main_page46:
;Pages.c,143 :: 		IntToStr((int)fabs(system_reg[SOURC_IN_1]), txt);Ltrim(txt);
ADD	R0, SP, #8
STR	R0, [SP, #24]
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
LDR	R0, [SP, #24]
STRH	R1, [SP, #4]
MOV	R1, R0
LDRSH	R0, [SP, #4]
BL	_IntToStr+0
ADD	R0, SP, #8
BL	_Ltrim+0
;Pages.c,144 :: 		if(system_reg[SOURC_IN_1]<0 && strncmp("-",sign_IN.Caption,1)!=0){sign_IN.Caption="-";DrawRoundButton(&sign_IN);}
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	GE
BGE	L__main_page407
MOVW	R0, #lo_addr(_sign_IN+24)
MOVT	R0, #hi_addr(_sign_IN+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr8_Pages+0)
MOVT	R0, #hi_addr(?lstr8_Pages+0)
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__main_page406
L__main_page372:
MOVW	R1, #lo_addr(?lstr9_Pages+0)
MOVT	R1, #hi_addr(?lstr9_Pages+0)
MOVW	R0, #lo_addr(_sign_IN+24)
MOVT	R0, #hi_addr(_sign_IN+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_sign_IN+0)
MOVT	R0, #hi_addr(_sign_IN+0)
BL	_DrawRoundButton+0
IT	AL
BAL	L_main_page58
L__main_page407:
L__main_page406:
;Pages.c,145 :: 		else if(system_reg[SOURC_IN_1]>0 && strncmp("+",sign_IN.Caption,1)!=0){sign_IN.Caption="+";DrawRoundButton(&sign_IN);}
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L__main_page409
MOVW	R0, #lo_addr(_sign_IN+24)
MOVT	R0, #hi_addr(_sign_IN+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr10_Pages+0)
MOVT	R0, #hi_addr(?lstr10_Pages+0)
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__main_page408
L__main_page371:
MOVW	R1, #lo_addr(?lstr11_Pages+0)
MOVT	R1, #hi_addr(?lstr11_Pages+0)
MOVW	R0, #lo_addr(_sign_IN+24)
MOVT	R0, #hi_addr(_sign_IN+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_sign_IN+0)
MOVT	R0, #hi_addr(_sign_IN+0)
BL	_DrawRoundButton+0
L__main_page409:
L__main_page408:
L_main_page58:
;Pages.c,147 :: 		if((int)fabs(system_reg[SOURC_IN_1])>=10 && (int)fabs(system_reg[SOURC_IN_1])<100)
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #10
IT	LT
BLT	L__main_page413
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #100
IT	GE
BGE	L__main_page412
L__main_page370:
;Pages.c,152 :: 		if(strcmp(sourc_in_T.Caption[1], txt[0])!=0 || strcmp(sourc_in_T.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
ADD	R0, SP, #8
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #lo_addr(_sourc_in_T+24)
MOVT	R0, #hi_addr(_sourc_in_T+24)
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page411
MOVW	R0, #lo_addr(_sourc_in_T+24)
MOVT	R0, #hi_addr(_sourc_in_T+24)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
MOVS	R1, #48
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L__main_page410
IT	AL
BAL	L_main_page67
L__main_page411:
L__main_page410:
;Pages.c,154 :: 		strncpy(sourc_in_T.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_sourc_in_T+24)
MOVT	R0, #hi_addr(_sourc_in_T+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,155 :: 		sourc_in_T.Caption[1]=sourc_in_T.Caption[0];
MOVW	R2, #lo_addr(_sourc_in_T+24)
MOVT	R2, #hi_addr(_sourc_in_T+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;Pages.c,156 :: 		sourc_in_T.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,157 :: 		DrawRoundButton(&sourc_in_T);
MOVW	R0, #lo_addr(_sourc_in_T+0)
MOVT	R0, #hi_addr(_sourc_in_T+0)
BL	_DrawRoundButton+0
;Pages.c,158 :: 		}
L_main_page67:
;Pages.c,159 :: 		if(sourc_in_dec.Caption[0]!=txt[1])
MOVW	R0, #lo_addr(_sourc_in_dec+24)
MOVT	R0, #hi_addr(_sourc_in_dec+24)
LDR	R0, [R0, #0]
LDRB	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	EQ
BEQ	L_main_page68
;Pages.c,161 :: 		sourc_in_dec.Caption[0]=txt[1];
ADD	R0, SP, #8
ADDS	R0, R0, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_sourc_in_dec+24)
MOVT	R0, #hi_addr(_sourc_in_dec+24)
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,162 :: 		DrawRoundButton(&sourc_in_dec);
MOVW	R0, #lo_addr(_sourc_in_dec+0)
MOVT	R0, #hi_addr(_sourc_in_dec+0)
BL	_DrawRoundButton+0
;Pages.c,163 :: 		}
L_main_page68:
;Pages.c,164 :: 		}
IT	AL
BAL	L_main_page69
;Pages.c,147 :: 		if((int)fabs(system_reg[SOURC_IN_1])>=10 && (int)fabs(system_reg[SOURC_IN_1])<100)
L__main_page413:
L__main_page412:
;Pages.c,166 :: 		else if((int)fabs(system_reg[SOURC_IN_1])>=0 && (int)fabs(system_reg[SOURC_IN_1])<10)
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #0
IT	LT
BLT	L__main_page415
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
CMP	R0, #10
IT	GE
BGE	L__main_page414
L__main_page368:
;Pages.c,168 :: 		if( strncmp("00",sourc_in_T.Caption,2)!=0){
MOVW	R0, #lo_addr(_sourc_in_T+24)
MOVT	R0, #hi_addr(_sourc_in_T+24)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(?lstr12_Pages+0)
MOVT	R0, #hi_addr(?lstr12_Pages+0)
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page73
;Pages.c,169 :: 		sourc_in_T.Caption[1]='0';
MOVW	R2, #lo_addr(_sourc_in_T+24)
MOVT	R2, #hi_addr(_sourc_in_T+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #1
MOVS	R0, #48
STRB	R0, [R1, #0]
;Pages.c,170 :: 		sourc_in_T.Caption[0]='0';
MOVS	R1, #48
MOV	R0, R2
LDR	R0, [R0, #0]
STRB	R1, [R0, #0]
;Pages.c,171 :: 		DrawRoundButton(&sourc_in_T); }
MOVW	R0, #lo_addr(_sourc_in_T+0)
MOVT	R0, #hi_addr(_sourc_in_T+0)
BL	_DrawRoundButton+0
L_main_page73:
;Pages.c,172 :: 		if(strncmp(txt,source_out_dec.Caption,1)!=0)
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page74
;Pages.c,174 :: 		strncpy(source_out_dec.Caption, txt, 1);
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_source_out_dec+24)
MOVT	R0, #hi_addr(_source_out_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,175 :: 		DrawRoundButton(&source_out_dec);
MOVW	R0, #lo_addr(_source_out_dec+0)
MOVT	R0, #hi_addr(_source_out_dec+0)
BL	_DrawRoundButton+0
;Pages.c,176 :: 		}
L_main_page74:
;Pages.c,177 :: 		}
IT	AL
BAL	L_main_page75
;Pages.c,166 :: 		else if((int)fabs(system_reg[SOURC_IN_1])>=0 && (int)fabs(system_reg[SOURC_IN_1])<10)
L__main_page415:
L__main_page414:
;Pages.c,182 :: 		if(strncmp(txt,sourc_in_T.Caption,2)!=0){strncpy(sourc_in_T.Caption, txt, 2);DrawRoundButton(&sourc_in_T);}
MOVW	R0, #lo_addr(_sourc_in_T+24)
MOVT	R0, #hi_addr(_sourc_in_T+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page76
ADD	R1, SP, #8
MOVW	R0, #lo_addr(_sourc_in_T+24)
MOVT	R0, #hi_addr(_sourc_in_T+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_sourc_in_T+0)
MOVT	R0, #hi_addr(_sourc_in_T+0)
BL	_DrawRoundButton+0
L_main_page76:
;Pages.c,183 :: 		if(strncmp(txt+2,sourc_in_dec.Caption,1)!=0){strncpy(sourc_in_dec.Caption, txt+2, 1);DrawRoundButton(&sourc_in_dec);}
MOVW	R0, #lo_addr(_sourc_in_dec+24)
MOVT	R0, #hi_addr(_sourc_in_dec+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #8
ADDS	R0, R0, #2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_main_page77
ADD	R0, SP, #8
ADDS	R1, R0, #2
MOVW	R0, #lo_addr(_sourc_in_dec+24)
MOVT	R0, #hi_addr(_sourc_in_dec+24)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_sourc_in_dec+0)
MOVT	R0, #hi_addr(_sourc_in_dec+0)
BL	_DrawRoundButton+0
L_main_page77:
;Pages.c,184 :: 		}
L_main_page75:
L_main_page69:
;Pages.c,185 :: 		if(system_reg[THREE_STATE]==1){
MOVW	R0, #lo_addr(_system_reg+102)
MOVT	R0, #hi_addr(_system_reg+102)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main_page78
;Pages.c,186 :: 		dhw_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_dhw_led+22)
MOVT	R0, #hi_addr(_dhw_led+22)
STRH	R1, [R0, #0]
;Pages.c,187 :: 		dhw_led.Gradient_End_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_dhw_led+24)
MOVT	R0, #hi_addr(_dhw_led+24)
STRH	R1, [R0, #0]
;Pages.c,188 :: 		dhw_led.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_dhw_led+26)
MOVT	R0, #hi_addr(_dhw_led+26)
STRH	R1, [R0, #0]
;Pages.c,189 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Pages.c,190 :: 		heat_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_heat_led+22)
MOVT	R0, #hi_addr(_heat_led+22)
STRH	R1, [R0, #0]
;Pages.c,191 :: 		heat_led.Gradient_End_Color = 0x0014;
MOVS	R1, #20
MOVW	R0, #lo_addr(_heat_led+24)
MOVT	R0, #hi_addr(_heat_led+24)
STRH	R1, [R0, #0]
;Pages.c,192 :: 		heat_led.Color           = 0x041F;
MOVW	R1, #1055
MOVW	R0, #lo_addr(_heat_led+26)
MOVT	R0, #hi_addr(_heat_led+26)
STRH	R1, [R0, #0]
;Pages.c,193 :: 		DrawCircle(&heat_led);}
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
IT	AL
BAL	L_main_page79
L_main_page78:
;Pages.c,195 :: 		heat_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_heat_led+22)
MOVT	R0, #hi_addr(_heat_led+22)
STRH	R1, [R0, #0]
;Pages.c,196 :: 		heat_led.Gradient_End_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_heat_led+24)
MOVT	R0, #hi_addr(_heat_led+24)
STRH	R1, [R0, #0]
;Pages.c,197 :: 		heat_led.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_heat_led+26)
MOVT	R0, #hi_addr(_heat_led+26)
STRH	R1, [R0, #0]
;Pages.c,198 :: 		DrawCircle(&dhw_led);
MOVW	R0, #lo_addr(_dhw_led+0)
MOVT	R0, #hi_addr(_dhw_led+0)
BL	_DrawCircle+0
;Pages.c,199 :: 		dhw_led.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_dhw_led+22)
MOVT	R0, #hi_addr(_dhw_led+22)
STRH	R1, [R0, #0]
;Pages.c,200 :: 		dhw_led.Gradient_End_Color = 0x0014;
MOVS	R1, #20
MOVW	R0, #lo_addr(_dhw_led+24)
MOVT	R0, #hi_addr(_dhw_led+24)
STRH	R1, [R0, #0]
;Pages.c,201 :: 		dhw_led.Color           = 0x041F;
MOVW	R1, #1055
MOVW	R0, #lo_addr(_dhw_led+26)
MOVT	R0, #hi_addr(_dhw_led+26)
STRH	R1, [R0, #0]
;Pages.c,202 :: 		DrawCircle(&heat_led);}
MOVW	R0, #lo_addr(_heat_led+0)
MOVT	R0, #hi_addr(_heat_led+0)
BL	_DrawCircle+0
L_main_page79:
;Pages.c,204 :: 		}
L_end_main_page:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _main_page
_startPage:
;Pages.c,206 :: 		void startPage(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Pages.c,208 :: 		if(system_reg[POWER]==1) {Main_OFF.Picture_Name = main_on_bmp;DrawImage(&Main_ON); }
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_startPage80
MOVW	R1, #10146
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
L_startPage80:
;Pages.c,209 :: 		if(system_reg[POWER]==0){Main_OFF.Picture_Name = main_off_bmp;DrawImage(&Main_OFF);}
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_startPage81
MOVW	R1, #19268
MOVT	R1, #8
MOVW	R0, #lo_addr(_Main_OFF+16)
MOVT	R0, #hi_addr(_Main_OFF+16)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
L_startPage81:
;Pages.c,210 :: 		if(system_reg[HEAT]==0 && system_reg[COOL]==1) {ON_OFF_Heat_Cool.Caption = "ON"; bar_heating.Caption = "COOLING";DrawRoundButton(&bar_heating);DrawImage(&cool_icon);}
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage420
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__startPage419
L__startPage418:
MOVW	R1, #lo_addr(?lstr13_Pages+0)
MOVT	R1, #hi_addr(?lstr13_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
MOVW	R1, #lo_addr(?lstr14_Pages+0)
MOVT	R1, #hi_addr(?lstr14_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
L__startPage420:
L__startPage419:
;Pages.c,211 :: 		if(system_reg[HEAT]==1 && system_reg[COOL]==0) {ON_OFF_Heat_Cool.Caption = "ON"; bar_heating.Caption = "HEATING";DrawRoundButton(&bar_heating);DrawImage(&heat_icon);}
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__startPage422
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage421
L__startPage417:
MOVW	R1, #lo_addr(?lstr15_Pages+0)
MOVT	R1, #hi_addr(?lstr15_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
MOVW	R1, #lo_addr(?lstr16_Pages+0)
MOVT	R1, #hi_addr(?lstr16_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
L__startPage422:
L__startPage421:
;Pages.c,212 :: 		if(system_reg[HEAT]==0 && system_reg[COOL]==0) ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage424
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__startPage423
L__startPage416:
MOVW	R1, #lo_addr(?lstr17_Pages+0)
MOVT	R1, #hi_addr(?lstr17_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
L__startPage424:
L__startPage423:
;Pages.c,213 :: 		if(system_reg[HEATWATER]==0)ON_OFF_DHW.Caption = "OFF";
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_startPage91
MOVW	R1, #lo_addr(?lstr18_Pages+0)
MOVT	R1, #hi_addr(?lstr18_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
L_startPage91:
;Pages.c,214 :: 		if(system_reg[HEATWATER]==1)ON_OFF_DHW.Caption = "ON";
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_startPage92
MOVW	R1, #lo_addr(?lstr19_Pages+0)
MOVT	R1, #hi_addr(?lstr19_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
L_startPage92:
;Pages.c,215 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,216 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,218 :: 		}
L_end_startPage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _startPage
_sensor_1:
;Pages.c,221 :: 		void sensor_1(unsigned char num_page){
; num_page start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
; num_page end address is: 0 (R0)
; num_page start address is: 0 (R0)
;Pages.c,224 :: 		if(num_page==0)
CMP	R0, #0
IT	NE
BNE	L_sensor_193
; num_page end address is: 0 (R0)
;Pages.c,226 :: 		IntToStr((int)fabs(system_reg[SOURC_IN_1]), txt); Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,227 :: 		if(strncmp(txt,S_Brine_Inlet_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_194
;Pages.c,229 :: 		if((int)fabs(system_reg[SOURC_IN_1])>=0 && (int)fabs(system_reg[SOURC_IN_1])<10)
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1466
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1465
L__sensor_1464:
;Pages.c,232 :: 		S_Brine_Inlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,233 :: 		S_Brine_Inlet_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,234 :: 		S_Brine_Inlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,235 :: 		S_Brine_Inlet_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,236 :: 		DrawRoundButton(&S_Brine_Inlet_1);
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,238 :: 		}
IT	AL
BAL	L_sensor_198
;Pages.c,229 :: 		if((int)fabs(system_reg[SOURC_IN_1])>=0 && (int)fabs(system_reg[SOURC_IN_1])<10)
L__sensor_1466:
L__sensor_1465:
;Pages.c,240 :: 		else if((int)fabs(system_reg[SOURC_IN_1])>=10 && (int)fabs(system_reg[SOURC_IN_1])<100)
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1468
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1467
L__sensor_1463:
;Pages.c,243 :: 		S_Brine_Inlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R4, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,244 :: 		S_Brine_Inlet_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,245 :: 		S_Brine_Inlet_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,246 :: 		S_Brine_Inlet_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,247 :: 		DrawRoundButton(&S_Brine_Inlet_1);
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,249 :: 		}
IT	AL
BAL	L_sensor_1102
;Pages.c,240 :: 		else if((int)fabs(system_reg[SOURC_IN_1])>=10 && (int)fabs(system_reg[SOURC_IN_1])<100)
L__sensor_1468:
L__sensor_1467:
;Pages.c,252 :: 		S_Brine_Inlet_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,253 :: 		S_Brine_Inlet_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,254 :: 		S_Brine_Inlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,255 :: 		S_Brine_Inlet_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,256 :: 		DrawRoundButton(&S_Brine_Inlet_1);
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,258 :: 		}
L_sensor_1102:
L_sensor_198:
;Pages.c,259 :: 		}
L_sensor_194:
;Pages.c,260 :: 		if(system_reg[SOURC_IN_1]<0 && strncmp("-",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="-";DrawRoundButton(&BrineIN_sign);}
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1470
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr20_Pages+0)
MOVT	R1, #hi_addr(?lstr20_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1469
L__sensor_1462:
MOVW	R2, #lo_addr(?lstr21_Pages+0)
MOVT	R2, #hi_addr(?lstr21_Pages+0)
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineIN_sign+0)
MOVT	R0, #hi_addr(_BrineIN_sign+0)
BL	_DrawRoundButton+0
L__sensor_1470:
L__sensor_1469:
;Pages.c,261 :: 		if(system_reg[SOURC_IN_1]>0 && strncmp("+",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="+";DrawRoundButton(&BrineIN_sign);}
MOVW	R1, #lo_addr(_system_reg+182)
MOVT	R1, #hi_addr(_system_reg+182)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1472
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr22_Pages+0)
MOVT	R1, #hi_addr(?lstr22_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1471
L__sensor_1461:
MOVW	R2, #lo_addr(?lstr23_Pages+0)
MOVT	R2, #hi_addr(?lstr23_Pages+0)
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineIN_sign+0)
MOVT	R0, #hi_addr(_BrineIN_sign+0)
BL	_DrawRoundButton+0
L__sensor_1472:
L__sensor_1471:
;Pages.c,263 :: 		IntToStr((int)fabs(system_reg[SOURC_OUT_1]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,265 :: 		if(strncmp(txt,S_Brine_Outlet_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1109
;Pages.c,267 :: 		if((int)fabs(system_reg[SOURC_OUT_1])>=0 && (int)fabs(system_reg[SOURC_OUT_1])<10)
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1474
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1473
L__sensor_1460:
;Pages.c,270 :: 		S_Brine_Outlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,271 :: 		S_Brine_Outlet_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,272 :: 		S_Brine_Outlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,273 :: 		S_Brine_Outlet_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,274 :: 		DrawRoundButton(&S_Brine_Outlet_1);
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,276 :: 		}
IT	AL
BAL	L_sensor_1113
;Pages.c,267 :: 		if((int)fabs(system_reg[SOURC_OUT_1])>=0 && (int)fabs(system_reg[SOURC_OUT_1])<10)
L__sensor_1474:
L__sensor_1473:
;Pages.c,278 :: 		else if((int)fabs(system_reg[SOURC_OUT_1])>=10 && (int)fabs(system_reg[SOURC_OUT_1])<100)
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1476
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1475
L__sensor_1459:
;Pages.c,281 :: 		S_Brine_Outlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R4, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,282 :: 		S_Brine_Outlet_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,283 :: 		S_Brine_Outlet_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,284 :: 		S_Brine_Outlet_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,285 :: 		DrawRoundButton(&S_Brine_Outlet_1);
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,287 :: 		}
IT	AL
BAL	L_sensor_1117
;Pages.c,278 :: 		else if((int)fabs(system_reg[SOURC_OUT_1])>=10 && (int)fabs(system_reg[SOURC_OUT_1])<100)
L__sensor_1476:
L__sensor_1475:
;Pages.c,290 :: 		S_Brine_Outlet_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,291 :: 		S_Brine_Outlet_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,292 :: 		S_Brine_Outlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,293 :: 		S_Brine_Outlet_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,294 :: 		DrawRoundButton(&S_Brine_Outlet_1);
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,296 :: 		}
L_sensor_1117:
L_sensor_1113:
;Pages.c,297 :: 		}
L_sensor_1109:
;Pages.c,298 :: 		if(system_reg[SOURC_OUT_1]<0 && strncmp("-",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="-";DrawRoundButton(&BrineOUT_sign);}
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1478
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr24_Pages+0)
MOVT	R1, #hi_addr(?lstr24_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1477
L__sensor_1458:
MOVW	R2, #lo_addr(?lstr25_Pages+0)
MOVT	R2, #hi_addr(?lstr25_Pages+0)
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineOUT_sign+0)
MOVT	R0, #hi_addr(_BrineOUT_sign+0)
BL	_DrawRoundButton+0
L__sensor_1478:
L__sensor_1477:
;Pages.c,299 :: 		if(system_reg[SOURC_OUT_1]>0 && strncmp("+",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="+";DrawRoundButton(&BrineOUT_sign);}
MOVW	R1, #lo_addr(_system_reg+202)
MOVT	R1, #hi_addr(_system_reg+202)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1480
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr26_Pages+0)
MOVT	R1, #hi_addr(?lstr26_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1479
L__sensor_1457:
MOVW	R2, #lo_addr(?lstr27_Pages+0)
MOVT	R2, #hi_addr(?lstr27_Pages+0)
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineOUT_sign+0)
MOVT	R0, #hi_addr(_BrineOUT_sign+0)
BL	_DrawRoundButton+0
L__sensor_1480:
L__sensor_1479:
;Pages.c,300 :: 		FloatToStr(system_reg[HEAT_IN_1]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+322)
MOVT	R1, #hi_addr(_system_reg+322)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,301 :: 		if(strncmp(txt,S_Heat_Inlet_1.Caption,4)!=0){strncpy(S_Heat_Inlet_1.Caption, txt,4);DrawRoundButton(&S_Heat_Inlet_1);}
MOVW	R1, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1124
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+0)
BL	_DrawRoundButton+0
L_sensor_1124:
;Pages.c,302 :: 		FloatToStr(system_reg[HEAT_OUT_1]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+342)
MOVT	R1, #hi_addr(_system_reg+342)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,303 :: 		if(strncmp(txt,S_Heat_Outlet_1.Caption,4)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 4);DrawRoundButton(&S_Heat_Outlet_1);}
MOVW	R1, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1125
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+0)
BL	_DrawRoundButton+0
L_sensor_1125:
;Pages.c,305 :: 		IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
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
;Pages.c,307 :: 		if(system_reg[EXAUST_TEMP_1]<100){
MOVW	R1, #lo_addr(_system_reg+402)
MOVT	R1, #hi_addr(_system_reg+402)
LDRSH	R1, [R1, #0]
CMP	R1, #100
IT	GE
BGE	L_sensor_1126
;Pages.c,308 :: 		if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
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
BEQ	L_sensor_1127
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,309 :: 		S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
MOVW	R3, #lo_addr(_S_Compressor_1+24)
MOVT	R3, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R3, #0]
ADDS	R2, R1, #2
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
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
;Pages.c,310 :: 		DrawRoundButton(&S_Compressor_1);
MOVW	R0, #lo_addr(_S_Compressor_1+0)
MOVT	R0, #hi_addr(_S_Compressor_1+0)
BL	_DrawRoundButton+0
;Pages.c,311 :: 		strncpy(S_Compressor_1.Caption, txt, 3);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,312 :: 		}
L_sensor_1127:
;Pages.c,313 :: 		}
IT	AL
BAL	L_sensor_1128
L_sensor_1126:
;Pages.c,314 :: 		else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
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
BEQ	L_sensor_1129
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
L_sensor_1129:
L_sensor_1128:
;Pages.c,316 :: 		IntToStr((int)fabs(system_reg[S_HEAT_1]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,318 :: 		if(strncmp(txt,S_Superheat_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Superheat_1+24)
MOVT	R1, #hi_addr(_S_Superheat_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1130
;Pages.c,320 :: 		if((int)fabs(system_reg[S_HEAT_1])>=0 && (int)fabs(system_reg[S_HEAT_1])<10)
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1482
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1481
L__sensor_1456:
;Pages.c,323 :: 		S_Superheat_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Superheat_1+24)
MOVT	R3, #hi_addr(_S_Superheat_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,324 :: 		S_Superheat_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,325 :: 		S_Superheat_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,326 :: 		S_Superheat_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,327 :: 		DrawRoundButton(&S_Superheat_1);
MOVW	R0, #lo_addr(_S_Superheat_1+0)
MOVT	R0, #hi_addr(_S_Superheat_1+0)
BL	_DrawRoundButton+0
;Pages.c,329 :: 		}
IT	AL
BAL	L_sensor_1134
;Pages.c,320 :: 		if((int)fabs(system_reg[S_HEAT_1])>=0 && (int)fabs(system_reg[S_HEAT_1])<10)
L__sensor_1482:
L__sensor_1481:
;Pages.c,331 :: 		else if((int)fabs(system_reg[S_HEAT_1])>=10 && (int)fabs(system_reg[S_HEAT_1])<100)
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1484
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1483
L__sensor_1455:
;Pages.c,334 :: 		S_Superheat_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Superheat_1+24)
MOVT	R4, #hi_addr(_S_Superheat_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,335 :: 		S_Superheat_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,336 :: 		S_Superheat_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,337 :: 		S_Superheat_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,338 :: 		DrawRoundButton(&S_Superheat_1);
MOVW	R0, #lo_addr(_S_Superheat_1+0)
MOVT	R0, #hi_addr(_S_Superheat_1+0)
BL	_DrawRoundButton+0
;Pages.c,340 :: 		}
IT	AL
BAL	L_sensor_1138
;Pages.c,331 :: 		else if((int)fabs(system_reg[S_HEAT_1])>=10 && (int)fabs(system_reg[S_HEAT_1])<100)
L__sensor_1484:
L__sensor_1483:
;Pages.c,343 :: 		S_Superheat_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Superheat_1+24)
MOVT	R3, #hi_addr(_S_Superheat_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,344 :: 		S_Superheat_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,345 :: 		S_Superheat_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,346 :: 		S_Superheat_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,347 :: 		DrawRoundButton(&S_Superheat_1);
MOVW	R0, #lo_addr(_S_Superheat_1+0)
MOVT	R0, #hi_addr(_S_Superheat_1+0)
BL	_DrawRoundButton+0
;Pages.c,349 :: 		}
L_sensor_1138:
L_sensor_1134:
;Pages.c,350 :: 		}
L_sensor_1130:
;Pages.c,351 :: 		if(system_reg[S_HEAT_1]<0 && strncmp("-",Super_sign.Caption,1)!=0){Super_sign.Caption="-";DrawRoundButton(&Super_sign);}
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1486
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr28_Pages+0)
MOVT	R1, #hi_addr(?lstr28_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1485
L__sensor_1454:
MOVW	R2, #lo_addr(?lstr29_Pages+0)
MOVT	R2, #hi_addr(?lstr29_Pages+0)
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Super_sign+0)
MOVT	R0, #hi_addr(_Super_sign+0)
BL	_DrawRoundButton+0
L__sensor_1486:
L__sensor_1485:
;Pages.c,352 :: 		if(system_reg[S_HEAT_1]>0 && strncmp("+",Super_sign.Caption,1)!=0){Super_sign.Caption="+";DrawRoundButton(&Super_sign);}
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1488
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr30_Pages+0)
MOVT	R1, #hi_addr(?lstr30_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1487
L__sensor_1453:
MOVW	R2, #lo_addr(?lstr31_Pages+0)
MOVT	R2, #hi_addr(?lstr31_Pages+0)
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Super_sign+0)
MOVT	R0, #hi_addr(_Super_sign+0)
BL	_DrawRoundButton+0
L__sensor_1488:
L__sensor_1487:
;Pages.c,354 :: 		IntToStr(fabs(system_reg[S_COOL_1]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,356 :: 		if(strncmp(txt,S_Subcool_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Subcool_1+24)
MOVT	R1, #hi_addr(_S_Subcool_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1145
;Pages.c,358 :: 		if((int)fabs(system_reg[S_COOL_1])>=0 && (int)fabs(system_reg[S_COOL_1])<10)
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1490
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1489
L__sensor_1452:
;Pages.c,361 :: 		S_Subcool_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Subcool_1+24)
MOVT	R3, #hi_addr(_S_Subcool_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,362 :: 		S_Subcool_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,363 :: 		S_Subcool_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,364 :: 		S_Subcool_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,365 :: 		DrawRoundButton(&S_Subcool_1);
MOVW	R0, #lo_addr(_S_Subcool_1+0)
MOVT	R0, #hi_addr(_S_Subcool_1+0)
BL	_DrawRoundButton+0
;Pages.c,367 :: 		}
IT	AL
BAL	L_sensor_1149
;Pages.c,358 :: 		if((int)fabs(system_reg[S_COOL_1])>=0 && (int)fabs(system_reg[S_COOL_1])<10)
L__sensor_1490:
L__sensor_1489:
;Pages.c,369 :: 		else if((int)fabs(system_reg[S_COOL_1])>=10 && (int)fabs(system_reg[S_COOL_1])<100)
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1492
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1491
L__sensor_1451:
;Pages.c,372 :: 		S_Subcool_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Subcool_1+24)
MOVT	R4, #hi_addr(_S_Subcool_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,373 :: 		S_Subcool_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,374 :: 		S_Subcool_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,375 :: 		S_Subcool_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,376 :: 		DrawRoundButton(&S_Subcool_1);
MOVW	R0, #lo_addr(_S_Subcool_1+0)
MOVT	R0, #hi_addr(_S_Subcool_1+0)
BL	_DrawRoundButton+0
;Pages.c,378 :: 		}
IT	AL
BAL	L_sensor_1153
;Pages.c,369 :: 		else if((int)fabs(system_reg[S_COOL_1])>=10 && (int)fabs(system_reg[S_COOL_1])<100)
L__sensor_1492:
L__sensor_1491:
;Pages.c,381 :: 		S_Subcool_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Subcool_1+24)
MOVT	R3, #hi_addr(_S_Subcool_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,382 :: 		S_Subcool_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,383 :: 		S_Subcool_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,384 :: 		S_Subcool_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,385 :: 		DrawRoundButton(&S_Subcool_1);
MOVW	R0, #lo_addr(_S_Subcool_1+0)
MOVT	R0, #hi_addr(_S_Subcool_1+0)
BL	_DrawRoundButton+0
;Pages.c,387 :: 		}
L_sensor_1153:
L_sensor_1149:
;Pages.c,388 :: 		}
L_sensor_1145:
;Pages.c,389 :: 		if(system_reg[S_COOL_1]<0 && strncmp("-",Cool_sign.Caption,1)!=0){Cool_sign.Caption="-";DrawRoundButton(&Cool_sign);}
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1494
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr32_Pages+0)
MOVT	R1, #hi_addr(?lstr32_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1493
L__sensor_1450:
MOVW	R2, #lo_addr(?lstr33_Pages+0)
MOVT	R2, #hi_addr(?lstr33_Pages+0)
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cool_sign+0)
MOVT	R0, #hi_addr(_Cool_sign+0)
BL	_DrawRoundButton+0
L__sensor_1494:
L__sensor_1493:
;Pages.c,390 :: 		if(system_reg[S_COOL_1]>0 && strncmp("+",Cool_sign.Caption,1)!=0){Cool_sign.Caption="+";DrawRoundButton(&Cool_sign);}
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1496
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr34_Pages+0)
MOVT	R1, #hi_addr(?lstr34_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1495
L__sensor_1449:
MOVW	R2, #lo_addr(?lstr35_Pages+0)
MOVT	R2, #hi_addr(?lstr35_Pages+0)
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cool_sign+0)
MOVT	R0, #hi_addr(_Cool_sign+0)
BL	_DrawRoundButton+0
L__sensor_1496:
L__sensor_1495:
;Pages.c,393 :: 		FloatToStr(system_reg[DHW_TEMP]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+162)
MOVT	R1, #hi_addr(_system_reg+162)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,394 :: 		if(strncmp(txt,S_DHW.Caption,4)!=0){strncpy(S_DHW.Caption, txt, 4);DrawRoundButton(&S_DHW);}
MOVW	R1, #lo_addr(_S_DHW+24)
MOVT	R1, #hi_addr(_S_DHW+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1160
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_DHW+24)
MOVT	R1, #hi_addr(_S_DHW+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_DHW+0)
MOVT	R0, #hi_addr(_S_DHW+0)
BL	_DrawRoundButton+0
L_sensor_1160:
;Pages.c,395 :: 		FloatToStr(system_reg[BAC_TEMP]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+142)
MOVT	R1, #hi_addr(_system_reg+142)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,396 :: 		if(strncmp(txt,SS_tank.Caption,4)!=0){strncpy(SS_tank.Caption, txt, 4);DrawRoundButton(&SS_tank);}
MOVW	R1, #lo_addr(_SS_tank+24)
MOVT	R1, #hi_addr(_SS_tank+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1161
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_SS_tank+24)
MOVT	R1, #hi_addr(_SS_tank+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_SS_tank+0)
MOVT	R0, #hi_addr(_SS_tank+0)
BL	_DrawRoundButton+0
L_sensor_1161:
;Pages.c,398 :: 		IntToStr(fabs(system_reg[CONDENS_TEMP_1]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,400 :: 		if(strncmp(txt,S_condenser_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_condenser_1+24)
MOVT	R1, #hi_addr(_S_condenser_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1162
;Pages.c,402 :: 		if((int)fabs(system_reg[CONDENS_TEMP_1])>=0 && (int)fabs(system_reg[CONDENS_TEMP_1])<10)
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1498
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1497
L__sensor_1448:
;Pages.c,405 :: 		S_condenser_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_condenser_1+24)
MOVT	R3, #hi_addr(_S_condenser_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,406 :: 		S_condenser_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,407 :: 		S_condenser_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,408 :: 		S_condenser_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,409 :: 		DrawRoundButton(&S_condenser_1);
MOVW	R0, #lo_addr(_S_condenser_1+0)
MOVT	R0, #hi_addr(_S_condenser_1+0)
BL	_DrawRoundButton+0
;Pages.c,411 :: 		}
IT	AL
BAL	L_sensor_1166
;Pages.c,402 :: 		if((int)fabs(system_reg[CONDENS_TEMP_1])>=0 && (int)fabs(system_reg[CONDENS_TEMP_1])<10)
L__sensor_1498:
L__sensor_1497:
;Pages.c,413 :: 		else if((int)fabs(system_reg[CONDENS_TEMP_1])>=10 && (int)fabs(system_reg[CONDENS_TEMP_1])<100)
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1500
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1499
L__sensor_1447:
;Pages.c,416 :: 		S_condenser_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_condenser_1+24)
MOVT	R4, #hi_addr(_S_condenser_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,417 :: 		S_condenser_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,418 :: 		S_condenser_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,419 :: 		S_condenser_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,420 :: 		DrawRoundButton(&S_condenser_1);
MOVW	R0, #lo_addr(_S_condenser_1+0)
MOVT	R0, #hi_addr(_S_condenser_1+0)
BL	_DrawRoundButton+0
;Pages.c,422 :: 		}
IT	AL
BAL	L_sensor_1170
;Pages.c,413 :: 		else if((int)fabs(system_reg[CONDENS_TEMP_1])>=10 && (int)fabs(system_reg[CONDENS_TEMP_1])<100)
L__sensor_1500:
L__sensor_1499:
;Pages.c,425 :: 		S_condenser_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_condenser_1+24)
MOVT	R3, #hi_addr(_S_condenser_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,426 :: 		S_condenser_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,427 :: 		S_condenser_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,428 :: 		S_condenser_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,429 :: 		DrawRoundButton(&S_condenser_1);
MOVW	R0, #lo_addr(_S_condenser_1+0)
MOVT	R0, #hi_addr(_S_condenser_1+0)
BL	_DrawRoundButton+0
;Pages.c,431 :: 		}
L_sensor_1170:
L_sensor_1166:
;Pages.c,432 :: 		}
L_sensor_1162:
;Pages.c,433 :: 		if(system_reg[CONDENS_TEMP_1]<0 && strncmp("-",Cond_sign.Caption,1)!=0){Cond_sign.Caption="-";DrawRoundButton(&Cond_sign);}
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1502
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr36_Pages+0)
MOVT	R1, #hi_addr(?lstr36_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1501
L__sensor_1446:
MOVW	R2, #lo_addr(?lstr37_Pages+0)
MOVT	R2, #hi_addr(?lstr37_Pages+0)
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cond_sign+0)
MOVT	R0, #hi_addr(_Cond_sign+0)
BL	_DrawRoundButton+0
L__sensor_1502:
L__sensor_1501:
;Pages.c,434 :: 		if(system_reg[CONDENS_TEMP_1]>0 && strncmp("+",Cond_sign.Caption,1)!=0){Cond_sign.Caption="+";DrawRoundButton(&Cond_sign);}
MOVW	R1, #lo_addr(_system_reg+242)
MOVT	R1, #hi_addr(_system_reg+242)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1504
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr38_Pages+0)
MOVT	R1, #hi_addr(?lstr38_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1503
L__sensor_1445:
MOVW	R2, #lo_addr(?lstr39_Pages+0)
MOVT	R2, #hi_addr(?lstr39_Pages+0)
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cond_sign+0)
MOVT	R0, #hi_addr(_Cond_sign+0)
BL	_DrawRoundButton+0
L__sensor_1504:
L__sensor_1503:
;Pages.c,436 :: 		FloatToStr(system_reg[SUCT_TEMP_1]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+262)
MOVT	R1, #hi_addr(_system_reg+262)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,437 :: 		if(strncmp(txt,S_suction_1.Caption,4)!=0){strncpy(S_suction_1.Caption, txt, 4);DrawRoundButton(&S_suction_1);}
MOVW	R1, #lo_addr(_S_suction_1+24)
MOVT	R1, #hi_addr(_S_suction_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1177
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_suction_1+24)
MOVT	R1, #hi_addr(_S_suction_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_suction_1+0)
MOVT	R0, #hi_addr(_S_suction_1+0)
BL	_DrawRoundButton+0
L_sensor_1177:
;Pages.c,438 :: 		FloatToStr(system_reg[HIGH_PRESS_1]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+362)
MOVT	R1, #hi_addr(_system_reg+362)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,439 :: 		if(strncmp(txt,S_High_Pressure_1.Caption,4)!=0){strncpy(S_High_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_High_Pressure_1);}
MOVW	R1, #lo_addr(_S_High_Pressure_1+24)
MOVT	R1, #hi_addr(_S_High_Pressure_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1178
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_High_Pressure_1+24)
MOVT	R1, #hi_addr(_S_High_Pressure_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_High_Pressure_1+0)
MOVT	R0, #hi_addr(_S_High_Pressure_1+0)
BL	_DrawRoundButton+0
L_sensor_1178:
;Pages.c,440 :: 		FloatToStr(system_reg[LOW_PRESS_1]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+382)
MOVT	R1, #hi_addr(_system_reg+382)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,441 :: 		if(strncmp(txt,S_Low_Pressure_1.Caption,4)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_Low_Pressure_1);}
MOVW	R1, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R1, #hi_addr(_S_Low_Pressure_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1179
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R1, #hi_addr(_S_Low_Pressure_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Low_Pressure_1+0)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+0)
BL	_DrawRoundButton+0
L_sensor_1179:
;Pages.c,442 :: 		}
IT	AL
BAL	L_sensor_1180
L_sensor_193:
;Pages.c,443 :: 		else if(num_page==1)
; num_page start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_sensor_1181
; num_page end address is: 0 (R0)
;Pages.c,445 :: 		IntToStr((int)fabs(system_reg[SOURC_IN_2]), txt); Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,446 :: 		if(strncmp(txt,S_Brine_Inlet_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1182
;Pages.c,448 :: 		if((int)fabs(system_reg[SOURC_IN_2])>=0 && (int)fabs(system_reg[SOURC_IN_2])<10)
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1506
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1505
L__sensor_1444:
;Pages.c,451 :: 		S_Brine_Inlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,452 :: 		S_Brine_Inlet_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,453 :: 		S_Brine_Inlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,454 :: 		S_Brine_Inlet_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,455 :: 		DrawRoundButton(&S_Brine_Inlet_1);
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,457 :: 		}
IT	AL
BAL	L_sensor_1186
;Pages.c,448 :: 		if((int)fabs(system_reg[SOURC_IN_2])>=0 && (int)fabs(system_reg[SOURC_IN_2])<10)
L__sensor_1506:
L__sensor_1505:
;Pages.c,459 :: 		else if((int)fabs(system_reg[SOURC_IN_2])>=10 && (int)fabs(system_reg[SOURC_IN_2])<100)
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1508
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1507
L__sensor_1443:
;Pages.c,462 :: 		S_Brine_Inlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R4, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,463 :: 		S_Brine_Inlet_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,464 :: 		S_Brine_Inlet_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,465 :: 		S_Brine_Inlet_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,466 :: 		DrawRoundButton(&S_Brine_Inlet_1);
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,468 :: 		}
IT	AL
BAL	L_sensor_1190
;Pages.c,459 :: 		else if((int)fabs(system_reg[SOURC_IN_2])>=10 && (int)fabs(system_reg[SOURC_IN_2])<100)
L__sensor_1508:
L__sensor_1507:
;Pages.c,471 :: 		S_Brine_Inlet_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Brine_Inlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Inlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,472 :: 		S_Brine_Inlet_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,473 :: 		S_Brine_Inlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,474 :: 		S_Brine_Inlet_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,475 :: 		DrawRoundButton(&S_Brine_Inlet_1);
MOVW	R0, #lo_addr(_S_Brine_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Inlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,477 :: 		}
L_sensor_1190:
L_sensor_1186:
;Pages.c,478 :: 		}
L_sensor_1182:
;Pages.c,479 :: 		if(system_reg[SOURC_IN_2]<0 && strncmp("-",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="-";DrawRoundButton(&BrineIN_sign);}
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1510
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr40_Pages+0)
MOVT	R1, #hi_addr(?lstr40_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1509
L__sensor_1442:
MOVW	R2, #lo_addr(?lstr41_Pages+0)
MOVT	R2, #hi_addr(?lstr41_Pages+0)
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineIN_sign+0)
MOVT	R0, #hi_addr(_BrineIN_sign+0)
BL	_DrawRoundButton+0
L__sensor_1510:
L__sensor_1509:
;Pages.c,480 :: 		if(system_reg[SOURC_IN_2]>0 && strncmp("+",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="+";DrawRoundButton(&BrineIN_sign);}
MOVW	R1, #lo_addr(_system_reg+184)
MOVT	R1, #hi_addr(_system_reg+184)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1512
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr42_Pages+0)
MOVT	R1, #hi_addr(?lstr42_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1511
L__sensor_1441:
MOVW	R2, #lo_addr(?lstr43_Pages+0)
MOVT	R2, #hi_addr(?lstr43_Pages+0)
MOVW	R1, #lo_addr(_BrineIN_sign+24)
MOVT	R1, #hi_addr(_BrineIN_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineIN_sign+0)
MOVT	R0, #hi_addr(_BrineIN_sign+0)
BL	_DrawRoundButton+0
L__sensor_1512:
L__sensor_1511:
;Pages.c,482 :: 		IntToStr((int)fabs(system_reg[SOURC_OUT_2]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,484 :: 		if(strncmp(txt,S_Brine_Outlet_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1197
;Pages.c,486 :: 		if((int)fabs(system_reg[SOURC_OUT_2])>=0 && (int)fabs(system_reg[SOURC_OUT_2])<10)
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1514
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1513
L__sensor_1440:
;Pages.c,489 :: 		S_Brine_Outlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,490 :: 		S_Brine_Outlet_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,491 :: 		S_Brine_Outlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,492 :: 		S_Brine_Outlet_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,493 :: 		DrawRoundButton(&S_Brine_Outlet_1);
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,495 :: 		}
IT	AL
BAL	L_sensor_1201
;Pages.c,486 :: 		if((int)fabs(system_reg[SOURC_OUT_2])>=0 && (int)fabs(system_reg[SOURC_OUT_2])<10)
L__sensor_1514:
L__sensor_1513:
;Pages.c,497 :: 		else if((int)fabs(system_reg[SOURC_OUT_2])>=10 && (int)fabs(system_reg[SOURC_OUT_2])<100)
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1516
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1515
L__sensor_1439:
;Pages.c,500 :: 		S_Brine_Outlet_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R4, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,501 :: 		S_Brine_Outlet_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,502 :: 		S_Brine_Outlet_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,503 :: 		S_Brine_Outlet_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,504 :: 		DrawRoundButton(&S_Brine_Outlet_1);
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,506 :: 		}
IT	AL
BAL	L_sensor_1205
;Pages.c,497 :: 		else if((int)fabs(system_reg[SOURC_OUT_2])>=10 && (int)fabs(system_reg[SOURC_OUT_2])<100)
L__sensor_1516:
L__sensor_1515:
;Pages.c,509 :: 		S_Brine_Outlet_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Brine_Outlet_1+24)
MOVT	R3, #hi_addr(_S_Brine_Outlet_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,510 :: 		S_Brine_Outlet_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,511 :: 		S_Brine_Outlet_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,512 :: 		S_Brine_Outlet_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,513 :: 		DrawRoundButton(&S_Brine_Outlet_1);
MOVW	R0, #lo_addr(_S_Brine_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Brine_Outlet_1+0)
BL	_DrawRoundButton+0
;Pages.c,515 :: 		}
L_sensor_1205:
L_sensor_1201:
;Pages.c,516 :: 		}
L_sensor_1197:
;Pages.c,517 :: 		if(system_reg[SOURC_OUT_2]<0 && strncmp("-",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="-";DrawRoundButton(&BrineOUT_sign);}
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1518
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr44_Pages+0)
MOVT	R1, #hi_addr(?lstr44_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1517
L__sensor_1438:
MOVW	R2, #lo_addr(?lstr45_Pages+0)
MOVT	R2, #hi_addr(?lstr45_Pages+0)
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineOUT_sign+0)
MOVT	R0, #hi_addr(_BrineOUT_sign+0)
BL	_DrawRoundButton+0
L__sensor_1518:
L__sensor_1517:
;Pages.c,518 :: 		if(system_reg[SOURC_OUT_2]>0 && strncmp("+",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="+";DrawRoundButton(&BrineOUT_sign);}
MOVW	R1, #lo_addr(_system_reg+204)
MOVT	R1, #hi_addr(_system_reg+204)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1520
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr46_Pages+0)
MOVT	R1, #hi_addr(?lstr46_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1519
L__sensor_1437:
MOVW	R2, #lo_addr(?lstr47_Pages+0)
MOVT	R2, #hi_addr(?lstr47_Pages+0)
MOVW	R1, #lo_addr(_BrineOUT_sign+24)
MOVT	R1, #hi_addr(_BrineOUT_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_BrineOUT_sign+0)
MOVT	R0, #hi_addr(_BrineOUT_sign+0)
BL	_DrawRoundButton+0
L__sensor_1520:
L__sensor_1519:
;Pages.c,519 :: 		FloatToStr(system_reg[HEAT_IN_2]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+324)
MOVT	R1, #hi_addr(_system_reg+324)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,520 :: 		if(strncmp(txt,S_Heat_Inlet_1.Caption,4)!=0){strncpy(S_Heat_Inlet_1.Caption, txt,4);DrawRoundButton(&S_Heat_Inlet_1);}
MOVW	R1, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1212
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Heat_Inlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Inlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_Inlet_1+0)
MOVT	R0, #hi_addr(_S_Heat_Inlet_1+0)
BL	_DrawRoundButton+0
L_sensor_1212:
;Pages.c,521 :: 		FloatToStr(system_reg[HEAT_OUT_2]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+344)
MOVT	R1, #hi_addr(_system_reg+344)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,522 :: 		if(strncmp(txt,S_Heat_Outlet_1.Caption,4)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 4);DrawRoundButton(&S_Heat_Outlet_1);}
MOVW	R1, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1213
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Heat_Outlet_1+24)
MOVT	R1, #hi_addr(_S_Heat_Outlet_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Heat_Outlet_1+0)
MOVT	R0, #hi_addr(_S_Heat_Outlet_1+0)
BL	_DrawRoundButton+0
L_sensor_1213:
;Pages.c,524 :: 		IntToStr(system_reg[EXAUST_TEMP_2 ], txt);Ltrim(txt);//
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
;Pages.c,525 :: 		if(system_reg[EXAUST_TEMP_2]/10<10){
MOVW	R1, #lo_addr(_system_reg+404)
MOVT	R1, #hi_addr(_system_reg+404)
LDRSH	R2, [R1, #0]
MOVS	R1, #10
SXTH	R1, R1
SDIV	R1, R2, R1
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L_sensor_1214
;Pages.c,526 :: 		if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
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
BEQ	L_sensor_1215
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,527 :: 		S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
MOVW	R3, #lo_addr(_S_Compressor_1+24)
MOVT	R3, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R3, #0]
ADDS	R2, R1, #2
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
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
;Pages.c,528 :: 		DrawRoundButton(&S_Compressor_1);
MOVW	R0, #lo_addr(_S_Compressor_1+0)
MOVT	R0, #hi_addr(_S_Compressor_1+0)
BL	_DrawRoundButton+0
;Pages.c,529 :: 		strncpy(S_Compressor_1.Caption, txt, 3);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Compressor_1+24)
MOVT	R1, #hi_addr(_S_Compressor_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,530 :: 		}
L_sensor_1215:
;Pages.c,531 :: 		}
IT	AL
BAL	L_sensor_1216
L_sensor_1214:
;Pages.c,532 :: 		else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
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
BEQ	L_sensor_1217
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
L_sensor_1217:
L_sensor_1216:
;Pages.c,534 :: 		IntToStr((int)fabs(system_reg[S_HEAT_2]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,536 :: 		if(strncmp(txt,S_Superheat_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Superheat_1+24)
MOVT	R1, #hi_addr(_S_Superheat_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1218
;Pages.c,538 :: 		if((int)fabs(system_reg[S_HEAT_2])>=0 && (int)fabs(system_reg[S_HEAT_2])<10)
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1522
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1521
L__sensor_1436:
;Pages.c,541 :: 		S_Superheat_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Superheat_1+24)
MOVT	R3, #hi_addr(_S_Superheat_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,542 :: 		S_Superheat_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,543 :: 		S_Superheat_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,544 :: 		S_Superheat_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,545 :: 		DrawRoundButton(&S_Superheat_1);
MOVW	R0, #lo_addr(_S_Superheat_1+0)
MOVT	R0, #hi_addr(_S_Superheat_1+0)
BL	_DrawRoundButton+0
;Pages.c,547 :: 		}
IT	AL
BAL	L_sensor_1222
;Pages.c,538 :: 		if((int)fabs(system_reg[S_HEAT_2])>=0 && (int)fabs(system_reg[S_HEAT_2])<10)
L__sensor_1522:
L__sensor_1521:
;Pages.c,549 :: 		else if((int)fabs(system_reg[S_HEAT_2])>=10 && (int)fabs(system_reg[S_HEAT_2])<100)
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1524
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1523
L__sensor_1435:
;Pages.c,552 :: 		S_Superheat_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Superheat_1+24)
MOVT	R4, #hi_addr(_S_Superheat_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,553 :: 		S_Superheat_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,554 :: 		S_Superheat_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,555 :: 		S_Superheat_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,556 :: 		DrawRoundButton(&S_Superheat_1);
MOVW	R0, #lo_addr(_S_Superheat_1+0)
MOVT	R0, #hi_addr(_S_Superheat_1+0)
BL	_DrawRoundButton+0
;Pages.c,558 :: 		}
IT	AL
BAL	L_sensor_1226
;Pages.c,549 :: 		else if((int)fabs(system_reg[S_HEAT_2])>=10 && (int)fabs(system_reg[S_HEAT_2])<100)
L__sensor_1524:
L__sensor_1523:
;Pages.c,561 :: 		S_Superheat_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Superheat_1+24)
MOVT	R3, #hi_addr(_S_Superheat_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,562 :: 		S_Superheat_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,563 :: 		S_Superheat_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,564 :: 		S_Superheat_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,565 :: 		DrawRoundButton(&S_Superheat_1);
MOVW	R0, #lo_addr(_S_Superheat_1+0)
MOVT	R0, #hi_addr(_S_Superheat_1+0)
BL	_DrawRoundButton+0
;Pages.c,567 :: 		}
L_sensor_1226:
L_sensor_1222:
;Pages.c,568 :: 		}
L_sensor_1218:
;Pages.c,569 :: 		if(system_reg[S_HEAT_2]<0 && strncmp("-",Super_sign.Caption,1)!=0){Super_sign.Caption="-";DrawRoundButton(&Super_sign);}
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1526
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr48_Pages+0)
MOVT	R1, #hi_addr(?lstr48_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1525
L__sensor_1434:
MOVW	R2, #lo_addr(?lstr49_Pages+0)
MOVT	R2, #hi_addr(?lstr49_Pages+0)
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Super_sign+0)
MOVT	R0, #hi_addr(_Super_sign+0)
BL	_DrawRoundButton+0
L__sensor_1526:
L__sensor_1525:
;Pages.c,570 :: 		if(system_reg[S_HEAT_2]>0 && strncmp("+",Super_sign.Caption,1)!=0){Super_sign.Caption="+";DrawRoundButton(&Super_sign);}
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1528
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr50_Pages+0)
MOVT	R1, #hi_addr(?lstr50_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1527
L__sensor_1433:
MOVW	R2, #lo_addr(?lstr51_Pages+0)
MOVT	R2, #hi_addr(?lstr51_Pages+0)
MOVW	R1, #lo_addr(_Super_sign+24)
MOVT	R1, #hi_addr(_Super_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Super_sign+0)
MOVT	R0, #hi_addr(_Super_sign+0)
BL	_DrawRoundButton+0
L__sensor_1528:
L__sensor_1527:
;Pages.c,572 :: 		IntToStr(fabs(system_reg[S_COOL_2]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+284)
MOVT	R1, #hi_addr(_system_reg+284)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,574 :: 		if(strncmp(txt,S_Subcool_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_Subcool_1+24)
MOVT	R1, #hi_addr(_S_Subcool_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1233
;Pages.c,576 :: 		if((int)fabs(system_reg[S_COOL_2])>=0 && (int)fabs(system_reg[S_COOL_1])<10)
MOVW	R1, #lo_addr(_system_reg+284)
MOVT	R1, #hi_addr(_system_reg+284)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1530
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1529
L__sensor_1432:
;Pages.c,579 :: 		S_Subcool_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_Subcool_1+24)
MOVT	R3, #hi_addr(_S_Subcool_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,580 :: 		S_Subcool_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,581 :: 		S_Subcool_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,582 :: 		S_Subcool_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,583 :: 		DrawRoundButton(&S_Subcool_1);
MOVW	R0, #lo_addr(_S_Subcool_1+0)
MOVT	R0, #hi_addr(_S_Subcool_1+0)
BL	_DrawRoundButton+0
;Pages.c,585 :: 		}
IT	AL
BAL	L_sensor_1237
;Pages.c,576 :: 		if((int)fabs(system_reg[S_COOL_2])>=0 && (int)fabs(system_reg[S_COOL_1])<10)
L__sensor_1530:
L__sensor_1529:
;Pages.c,587 :: 		else if((int)fabs(system_reg[S_COOL_2])>=10 && (int)fabs(system_reg[S_COOL_1])<100)
MOVW	R1, #lo_addr(_system_reg+284)
MOVT	R1, #hi_addr(_system_reg+284)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1532
MOVW	R1, #lo_addr(_system_reg+282)
MOVT	R1, #hi_addr(_system_reg+282)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1531
L__sensor_1431:
;Pages.c,590 :: 		S_Subcool_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_Subcool_1+24)
MOVT	R4, #hi_addr(_S_Subcool_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,591 :: 		S_Subcool_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,592 :: 		S_Subcool_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,593 :: 		S_Subcool_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,594 :: 		DrawRoundButton(&S_Subcool_1);
MOVW	R0, #lo_addr(_S_Subcool_1+0)
MOVT	R0, #hi_addr(_S_Subcool_1+0)
BL	_DrawRoundButton+0
;Pages.c,596 :: 		}
IT	AL
BAL	L_sensor_1241
;Pages.c,587 :: 		else if((int)fabs(system_reg[S_COOL_2])>=10 && (int)fabs(system_reg[S_COOL_1])<100)
L__sensor_1532:
L__sensor_1531:
;Pages.c,599 :: 		S_Subcool_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_Subcool_1+24)
MOVT	R3, #hi_addr(_S_Subcool_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,600 :: 		S_Subcool_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,601 :: 		S_Subcool_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,602 :: 		S_Subcool_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,603 :: 		DrawRoundButton(&S_Subcool_1);
MOVW	R0, #lo_addr(_S_Subcool_1+0)
MOVT	R0, #hi_addr(_S_Subcool_1+0)
BL	_DrawRoundButton+0
;Pages.c,605 :: 		}
L_sensor_1241:
L_sensor_1237:
;Pages.c,606 :: 		}
L_sensor_1233:
;Pages.c,607 :: 		if(system_reg[S_COOL_2]<0 && strncmp("-",Cool_sign.Caption,1)!=0){Cool_sign.Caption="-";DrawRoundButton(&Cool_sign);}
MOVW	R1, #lo_addr(_system_reg+284)
MOVT	R1, #hi_addr(_system_reg+284)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1534
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr52_Pages+0)
MOVT	R1, #hi_addr(?lstr52_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1533
L__sensor_1430:
MOVW	R2, #lo_addr(?lstr53_Pages+0)
MOVT	R2, #hi_addr(?lstr53_Pages+0)
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cool_sign+0)
MOVT	R0, #hi_addr(_Cool_sign+0)
BL	_DrawRoundButton+0
L__sensor_1534:
L__sensor_1533:
;Pages.c,608 :: 		if(system_reg[S_COOL_2]>0 && strncmp("+",Cool_sign.Caption,1)!=0){Cool_sign.Caption="+";DrawRoundButton(&Cool_sign);}
MOVW	R1, #lo_addr(_system_reg+284)
MOVT	R1, #hi_addr(_system_reg+284)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1536
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr54_Pages+0)
MOVT	R1, #hi_addr(?lstr54_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1535
L__sensor_1429:
MOVW	R2, #lo_addr(?lstr55_Pages+0)
MOVT	R2, #hi_addr(?lstr55_Pages+0)
MOVW	R1, #lo_addr(_Cool_sign+24)
MOVT	R1, #hi_addr(_Cool_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cool_sign+0)
MOVT	R0, #hi_addr(_Cool_sign+0)
BL	_DrawRoundButton+0
L__sensor_1536:
L__sensor_1535:
;Pages.c,611 :: 		FloatToStr(system_reg[DHW_TEMP]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+162)
MOVT	R1, #hi_addr(_system_reg+162)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,612 :: 		if(strncmp(txt,S_DHW.Caption,4)!=0){strncpy(S_DHW.Caption, txt, 4);DrawRoundButton(&S_DHW);}
MOVW	R1, #lo_addr(_S_DHW+24)
MOVT	R1, #hi_addr(_S_DHW+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1248
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_DHW+24)
MOVT	R1, #hi_addr(_S_DHW+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_DHW+0)
MOVT	R0, #hi_addr(_S_DHW+0)
BL	_DrawRoundButton+0
L_sensor_1248:
;Pages.c,613 :: 		FloatToStr(system_reg[BAC_TEMP]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+142)
MOVT	R1, #hi_addr(_system_reg+142)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,614 :: 		if(strncmp(txt,SS_tank.Caption,4)!=0){strncpy(SS_tank.Caption, txt, 4);DrawRoundButton(&SS_tank);}
MOVW	R1, #lo_addr(_SS_tank+24)
MOVT	R1, #hi_addr(_SS_tank+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1249
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_SS_tank+24)
MOVT	R1, #hi_addr(_SS_tank+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_SS_tank+0)
MOVT	R0, #hi_addr(_SS_tank+0)
BL	_DrawRoundButton+0
L_sensor_1249:
;Pages.c,616 :: 		IntToStr(fabs(system_reg[CONDENS_TEMP_2]), txt);Ltrim(txt);//
ADD	R1, SP, #4
STR	R1, [SP, #20]
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
LDR	R1, [SP, #20]
SXTH	R0, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,618 :: 		if(strncmp(txt,S_condenser_1.Caption,3)!=0)
MOVW	R1, #lo_addr(_S_condenser_1+24)
MOVT	R1, #hi_addr(_S_condenser_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1250
;Pages.c,620 :: 		if((int)fabs(system_reg[CONDENS_TEMP_2])>=0 && (int)fabs(system_reg[CONDENS_TEMP_2])<10)
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #0
IT	LT
BLT	L__sensor_1538
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	GE
BGE	L__sensor_1537
L__sensor_1428:
;Pages.c,623 :: 		S_condenser_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R3, #lo_addr(_S_condenser_1+24)
MOVT	R3, #hi_addr(_S_condenser_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,624 :: 		S_condenser_1.Caption[1]='0';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #48
STRB	R1, [R2, #0]
;Pages.c,625 :: 		S_condenser_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,626 :: 		S_condenser_1.Caption[3]=txt[0];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,627 :: 		DrawRoundButton(&S_condenser_1);
MOVW	R0, #lo_addr(_S_condenser_1+0)
MOVT	R0, #hi_addr(_S_condenser_1+0)
BL	_DrawRoundButton+0
;Pages.c,629 :: 		}
IT	AL
BAL	L_sensor_1254
;Pages.c,620 :: 		if((int)fabs(system_reg[CONDENS_TEMP_2])>=0 && (int)fabs(system_reg[CONDENS_TEMP_2])<10)
L__sensor_1538:
L__sensor_1537:
;Pages.c,631 :: 		else if((int)fabs(system_reg[CONDENS_TEMP_2])>=10 && (int)fabs(system_reg[CONDENS_TEMP_2])<100)
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #10
IT	LT
BLT	L__sensor_1540
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#1, S0, S0
BL	_fabs+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
CMP	R1, #100
IT	GE
BGE	L__sensor_1539
L__sensor_1427:
;Pages.c,634 :: 		S_condenser_1.Caption[0]='0';
MOVS	R2, #48
MOVW	R4, #lo_addr(_S_condenser_1+24)
MOVT	R4, #hi_addr(_S_condenser_1+24)
LDR	R1, [R4, #0]
STRB	R2, [R1, #0]
;Pages.c,635 :: 		S_condenser_1.Caption[1]=txt[0];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
;Pages.c,636 :: 		S_condenser_1.Caption[2]='.';
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,637 :: 		S_condenser_1.Caption[3]=txt[1];
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,638 :: 		DrawRoundButton(&S_condenser_1);
MOVW	R0, #lo_addr(_S_condenser_1+0)
MOVT	R0, #hi_addr(_S_condenser_1+0)
BL	_DrawRoundButton+0
;Pages.c,640 :: 		}
IT	AL
BAL	L_sensor_1258
;Pages.c,631 :: 		else if((int)fabs(system_reg[CONDENS_TEMP_2])>=10 && (int)fabs(system_reg[CONDENS_TEMP_2])<100)
L__sensor_1540:
L__sensor_1539:
;Pages.c,643 :: 		S_condenser_1.Caption[0]=txt[0];
ADD	R4, SP, #4
LDRB	R2, [R4, #0]
MOVW	R3, #lo_addr(_S_condenser_1+24)
MOVT	R3, #hi_addr(_S_condenser_1+24)
LDR	R1, [R3, #0]
STRB	R2, [R1, #0]
;Pages.c,644 :: 		S_condenser_1.Caption[1]=txt[1];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
ADDS	R1, R4, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,645 :: 		S_condenser_1.Caption[2]='.';
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #46
STRB	R1, [R2, #0]
;Pages.c,646 :: 		S_condenser_1.Caption[3]=txt[2];
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;Pages.c,647 :: 		DrawRoundButton(&S_condenser_1);
MOVW	R0, #lo_addr(_S_condenser_1+0)
MOVT	R0, #hi_addr(_S_condenser_1+0)
BL	_DrawRoundButton+0
;Pages.c,649 :: 		}
L_sensor_1258:
L_sensor_1254:
;Pages.c,650 :: 		}
L_sensor_1250:
;Pages.c,651 :: 		if(system_reg[CONDENS_TEMP_2]<0 && strncmp("-",Cond_sign.Caption,1)!=0){Cond_sign.Caption="-";DrawRoundButton(&Cond_sign);}
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	GE
BGE	L__sensor_1542
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr56_Pages+0)
MOVT	R1, #hi_addr(?lstr56_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1541
L__sensor_1426:
MOVW	R2, #lo_addr(?lstr57_Pages+0)
MOVT	R2, #hi_addr(?lstr57_Pages+0)
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cond_sign+0)
MOVT	R0, #hi_addr(_Cond_sign+0)
BL	_DrawRoundButton+0
L__sensor_1542:
L__sensor_1541:
;Pages.c,652 :: 		if(system_reg[CONDENS_TEMP_2]>0 && strncmp("+",Cond_sign.Caption,1)!=0){Cond_sign.Caption="+";DrawRoundButton(&Cond_sign);}
MOVW	R1, #lo_addr(_system_reg+244)
MOVT	R1, #hi_addr(_system_reg+244)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	LE
BLE	L__sensor_1544
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(?lstr58_Pages+0)
MOVT	R1, #hi_addr(?lstr58_Pages+0)
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L__sensor_1543
L__sensor_1425:
MOVW	R2, #lo_addr(?lstr59_Pages+0)
MOVT	R2, #hi_addr(?lstr59_Pages+0)
MOVW	R1, #lo_addr(_Cond_sign+24)
MOVT	R1, #hi_addr(_Cond_sign+24)
STR	R2, [R1, #0]
MOVW	R0, #lo_addr(_Cond_sign+0)
MOVT	R0, #hi_addr(_Cond_sign+0)
BL	_DrawRoundButton+0
L__sensor_1544:
L__sensor_1543:
;Pages.c,654 :: 		FloatToStr(system_reg[SUCT_TEMP_2]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+264)
MOVT	R1, #hi_addr(_system_reg+264)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,655 :: 		if(strncmp(txt,S_suction_1.Caption,4)!=0){strncpy(S_suction_1.Caption, txt, 4);DrawRoundButton(&S_suction_1);}
MOVW	R1, #lo_addr(_S_suction_1+24)
MOVT	R1, #hi_addr(_S_suction_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1265
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_suction_1+24)
MOVT	R1, #hi_addr(_S_suction_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_suction_1+0)
MOVT	R0, #hi_addr(_S_suction_1+0)
BL	_DrawRoundButton+0
L_sensor_1265:
;Pages.c,656 :: 		FloatToStr(system_reg[HIGH_PRESS_2]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+364)
MOVT	R1, #hi_addr(_system_reg+364)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,657 :: 		if(strncmp(txt,S_High_Pressure_1.Caption,4)!=0){strncpy(S_High_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_High_Pressure_1);}
MOVW	R1, #lo_addr(_S_High_Pressure_1+24)
MOVT	R1, #hi_addr(_S_High_Pressure_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1266
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_High_Pressure_1+24)
MOVT	R1, #hi_addr(_S_High_Pressure_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_High_Pressure_1+0)
MOVT	R0, #hi_addr(_S_High_Pressure_1+0)
BL	_DrawRoundButton+0
L_sensor_1266:
;Pages.c,658 :: 		FloatToStr(system_reg[LOW_PRESS_2]/10.0, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_system_reg+384)
MOVT	R1, #hi_addr(_system_reg+384)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOV	R0, R2
BL	_FloatToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,659 :: 		if(strncmp(txt,S_Low_Pressure_1.Caption,4)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_Low_Pressure_1);}
MOVW	R1, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R1, #hi_addr(_S_Low_Pressure_1+24)
LDR	R2, [R1, #0]
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_sensor_1267
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_S_Low_Pressure_1+24)
MOVT	R1, #hi_addr(_S_Low_Pressure_1+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #4
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_S_Low_Pressure_1+0)
MOVT	R0, #hi_addr(_S_Low_Pressure_1+0)
BL	_DrawRoundButton+0
L_sensor_1267:
;Pages.c,661 :: 		}
L_sensor_1181:
L_sensor_1180:
;Pages.c,662 :: 		}
L_end_sensor_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _sensor_1
_data_eeprom:
;Pages.c,663 :: 		void data_eeprom(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,667 :: 		IntToStr(system_reg[COMP_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+20)
MOVT	R0, #hi_addr(_system_reg+20)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,668 :: 		strncpy(Delay_compressor.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_compressor+24)
MOVT	R0, #hi_addr(_Delay_compressor+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,669 :: 		IntToStr(system_reg[SOURS_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+60)
MOVT	R0, #hi_addr(_system_reg+60)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,670 :: 		strncpy(Delay_Source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_Source+24)
MOVT	R0, #hi_addr(_Delay_Source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,671 :: 		IntToStr(system_reg[HEAT_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+40)
MOVT	R0, #hi_addr(_system_reg+40)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,672 :: 		strncpy(Delay_heat_pump.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_heat_pump+24)
MOVT	R0, #hi_addr(_Delay_heat_pump+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,673 :: 		IntToStr(system_reg[REVERS_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+80)
MOVT	R0, #hi_addr(_system_reg+80)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,674 :: 		strncpy(Delay_reversing.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_reversing+24)
MOVT	R0, #hi_addr(_Delay_reversing+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,675 :: 		IntToStr(system_reg[TRV_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+840)
MOVT	R0, #hi_addr(_system_reg+840)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,676 :: 		strncpy(Delay_EEV.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_EEV+24)
MOVT	R0, #hi_addr(_Delay_EEV+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,677 :: 		IntToStr(system_reg[THREE_WAY_DEL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+100)
MOVT	R0, #hi_addr(_system_reg+100)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,678 :: 		strncpy(Delay_DHW_valve.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Delay_DHW_valve+24)
MOVT	R0, #hi_addr(_Delay_DHW_valve+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,680 :: 		IntToStr(system_reg[HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+180)
MOVT	R0, #hi_addr(_system_reg+180)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,681 :: 		strncpy(Set_min_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_heating_HP+24)
MOVT	R0, #hi_addr(_Set_min_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,682 :: 		IntToStr(system_reg[HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+160)
MOVT	R0, #hi_addr(_system_reg+160)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,683 :: 		strncpy(Set_max_heating_HP.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_heating_HP+24)
MOVT	R0, #hi_addr(_Set_max_heating_HP+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,684 :: 		IntToStr(system_reg[EXAUST_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+360)
MOVT	R0, #hi_addr(_system_reg+360)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,685 :: 		strncpy(Set_max_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_exhaust+24)
MOVT	R0, #hi_addr(_Set_max_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,686 :: 		IntToStr(system_reg[SOURS_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+880)
MOVT	R0, #hi_addr(_system_reg+880)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,687 :: 		strncpy(Set_min_source_temp.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_source_temp+24)
MOVT	R0, #hi_addr(_Set_min_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,688 :: 		IntToStr(system_reg[SOURS_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+860)
MOVT	R0, #hi_addr(_system_reg+860)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,689 :: 		strncpy(Set_max_source_temp.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_temp+24)
MOVT	R0, #hi_addr(_Set_max_source_temp+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,690 :: 		IntToStr(system_reg[DEL_HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+220)
MOVT	R0, #hi_addr(_system_reg+220)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,691 :: 		strncpy(Set_min_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_heat+24)
MOVT	R0, #hi_addr(_Set_min_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,693 :: 		IntToStr(system_reg[DEL_HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+200)
MOVT	R0, #hi_addr(_system_reg+200)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,694 :: 		strncpy(Set_max_delta_heat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_heat+24)
MOVT	R0, #hi_addr(_Set_max_delta_heat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,695 :: 		IntToStr(system_reg[DEL_DHW_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+920)
MOVT	R0, #hi_addr(_system_reg+920)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,696 :: 		strncpy(Set_min_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_min_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,697 :: 		IntToStr(system_reg[DEL_DHW_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+900)
MOVT	R0, #hi_addr(_system_reg+900)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,698 :: 		strncpy(Set_max_delta_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_delta_DHW+24)
MOVT	R0, #hi_addr(_Set_max_delta_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,699 :: 		IntToStr(system_reg[DEL_SOURS_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+260)
MOVT	R0, #hi_addr(_system_reg+260)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,700 :: 		strncpy(Set_min_delta_source.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_delta_source+24)
MOVT	R0, #hi_addr(_Set_min_delta_source+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,701 :: 		IntToStr(system_reg[DEL_SOURS_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+240)
MOVT	R0, #hi_addr(_system_reg+240)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,702 :: 		strncpy(Set_max_source_delta.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_source_delta+24)
MOVT	R0, #hi_addr(_Set_max_source_delta+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,704 :: 		IntToStr(system_reg[S_HEAT_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+580)
MOVT	R0, #hi_addr(_system_reg+580)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,705 :: 		strncpy(Set_min_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_superheat+24)
MOVT	R0, #hi_addr(_Set_min_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,707 :: 		IntToStr(system_reg[S_HEAT_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+560)
MOVT	R0, #hi_addr(_system_reg+560)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,708 :: 		strncpy(Set_max_superheat.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_superheat+24)
MOVT	R0, #hi_addr(_Set_max_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,709 :: 		IntToStr(system_reg[S_COOL_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+540)
MOVT	R0, #hi_addr(_system_reg+540)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,710 :: 		strncpy(Set_min_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_subcooling+24)
MOVT	R0, #hi_addr(_Set_min_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,711 :: 		IntToStr(system_reg[S_COOL_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+520)
MOVT	R0, #hi_addr(_system_reg+520)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,712 :: 		strncpy(Set_max_subcooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_subcooling+24)
MOVT	R0, #hi_addr(_Set_max_subcooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,713 :: 		IntToStr(system_reg[HP_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+440)
MOVT	R0, #hi_addr(_system_reg+440)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,714 :: 		strncpy(Set_max_high_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_high_pressure+24)
MOVT	R0, #hi_addr(_Set_max_high_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,715 :: 		IntToStr(system_reg[HP_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+480)
MOVT	R0, #hi_addr(_system_reg+480)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,716 :: 		strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_lhigh_pressure+24)
MOVT	R0, #hi_addr(_Set_min_lhigh_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,718 :: 		IntToStr(system_reg[LP_MAX], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+460)
MOVT	R0, #hi_addr(_system_reg+460)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,719 :: 		strncpy(Set_max_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_max_low_pressure+24)
MOVT	R0, #hi_addr(_Set_max_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,720 :: 		IntToStr(system_reg[LP_MIN], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+500)
MOVT	R0, #hi_addr(_system_reg+500)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,721 :: 		strncpy(Set_min_low_pressure.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Set_min_low_pressure+24)
MOVT	R0, #hi_addr(_Set_min_low_pressure+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,723 :: 		IntToStr(system_reg[DIFF_HEAT], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+320)
MOVT	R0, #hi_addr(_system_reg+320)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,724 :: 		strncpy(Hysteresis_heating.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_heating+24)
MOVT	R0, #hi_addr(_Hysteresis_heating+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,725 :: 		IntToStr(system_reg[DIFF_COOL], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+280)
MOVT	R0, #hi_addr(_system_reg+280)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,726 :: 		strncpy(Hysteresis_cooling.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_cooling+24)
MOVT	R0, #hi_addr(_Hysteresis_cooling+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,727 :: 		IntToStr(system_reg[DIFF_DHW], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+300)
MOVT	R0, #hi_addr(_system_reg+300)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,728 :: 		strncpy(Hysteresis_DHW.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Hysteresis_DHW+24)
MOVT	R0, #hi_addr(_Hysteresis_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,730 :: 		IntToStr(system_reg[AIRE_TO_WATER], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,732 :: 		IntToStr(system_reg[TIME_BETWEEN_DEF], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+960)
MOVT	R0, #hi_addr(_system_reg+960)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,733 :: 		strncpy(Defrost_on_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_time+24)
MOVT	R0, #hi_addr(_Defrost_on_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,734 :: 		IntToStr(system_reg[TIME_DEFROST], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+720)
MOVT	R0, #hi_addr(_system_reg+720)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,735 :: 		strncpy(Defrost_off_time.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_time+24)
MOVT	R0, #hi_addr(_Defrost_off_time+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,736 :: 		IntToStr(system_reg[TEMP_DEFROST], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+700)
MOVT	R0, #hi_addr(_system_reg+700)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,737 :: 		strncpy(Defrost_on_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_on_temperature+24)
MOVT	R0, #hi_addr(_Defrost_on_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,738 :: 		IntToStr(system_reg[TEMP_STOP_DEFROST], txt);Ltrim(txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+760)
MOVT	R0, #hi_addr(_system_reg+760)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,739 :: 		strncpy(Defrost_off_temperature.Caption, txt, 2);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Defrost_off_temperature+24)
MOVT	R0, #hi_addr(_Defrost_off_temperature+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,743 :: 		if(system_reg[POWER]==1){
MOVW	R0, #lo_addr(_system_reg+620)
MOVT	R0, #hi_addr(_system_reg+620)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom268
;Pages.c,744 :: 		DrawImage(&Main_ON);
MOVW	R0, #lo_addr(_Main_ON+0)
MOVT	R0, #hi_addr(_Main_ON+0)
BL	_DrawImage+0
;Pages.c,746 :: 		}
IT	AL
BAL	L_data_eeprom269
L_data_eeprom268:
;Pages.c,748 :: 		DrawImage(&Main_OFF);
MOVW	R0, #lo_addr(_Main_OFF+0)
MOVT	R0, #hi_addr(_Main_OFF+0)
BL	_DrawImage+0
;Pages.c,750 :: 		}
L_data_eeprom269:
;Pages.c,752 :: 		if(system_reg[COOL]==1){
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom270
;Pages.c,753 :: 		bar_heating.Caption = "COOLING";
MOVW	R1, #lo_addr(?lstr60_Pages+0)
MOVT	R1, #hi_addr(?lstr60_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Pages.c,754 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Pages.c,755 :: 		DrawImage(&cool_icon);
MOVW	R0, #lo_addr(_cool_icon+0)
MOVT	R0, #hi_addr(_cool_icon+0)
BL	_DrawImage+0
;Pages.c,756 :: 		}
IT	AL
BAL	L_data_eeprom271
L_data_eeprom270:
;Pages.c,757 :: 		else if( system_reg[HEAT]==1 ){
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom272
;Pages.c,758 :: 		bar_heating.Caption = "HEATING";
MOVW	R1, #lo_addr(?lstr61_Pages+0)
MOVT	R1, #hi_addr(?lstr61_Pages+0)
MOVW	R0, #lo_addr(_bar_heating+24)
MOVT	R0, #hi_addr(_bar_heating+24)
STR	R1, [R0, #0]
;Pages.c,759 :: 		DrawRoundButton(&bar_heating);
MOVW	R0, #lo_addr(_bar_heating+0)
MOVT	R0, #hi_addr(_bar_heating+0)
BL	_DrawRoundButton+0
;Pages.c,760 :: 		DrawImage(&heat_icon);
MOVW	R0, #lo_addr(_heat_icon+0)
MOVT	R0, #hi_addr(_heat_icon+0)
BL	_DrawImage+0
;Pages.c,761 :: 		}
L_data_eeprom272:
L_data_eeprom271:
;Pages.c,763 :: 		if( system_reg[HEAT]==1 || system_reg[COOL]==1){
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__data_eeprom548
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__data_eeprom547
IT	AL
BAL	L_data_eeprom275
L__data_eeprom548:
L__data_eeprom547:
;Pages.c,764 :: 		ON_OFF_Heat_Cool.Caption = "ON";
MOVW	R1, #lo_addr(?lstr62_Pages+0)
MOVT	R1, #hi_addr(?lstr62_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Pages.c,765 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,766 :: 		}
IT	AL
BAL	L_data_eeprom276
L_data_eeprom275:
;Pages.c,767 :: 		else if(system_reg[HEAT]==0 && system_reg[COOL]==0){
MOVW	R0, #lo_addr(_system_reg+400)
MOVT	R0, #hi_addr(_system_reg+400)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__data_eeprom550
MOVW	R0, #lo_addr(_system_reg+380)
MOVT	R0, #hi_addr(_system_reg+380)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__data_eeprom549
L__data_eeprom545:
;Pages.c,768 :: 		ON_OFF_Heat_Cool.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr63_Pages+0)
MOVT	R1, #hi_addr(?lstr63_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+24)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+24)
STR	R1, [R0, #0]
;Pages.c,769 :: 		DrawRoundButton(&ON_OFF_Heat_Cool);
MOVW	R0, #lo_addr(_ON_OFF_Heat_Cool+0)
MOVT	R0, #hi_addr(_ON_OFF_Heat_Cool+0)
BL	_DrawRoundButton+0
;Pages.c,767 :: 		else if(system_reg[HEAT]==0 && system_reg[COOL]==0){
L__data_eeprom550:
L__data_eeprom549:
;Pages.c,770 :: 		}
L_data_eeprom276:
;Pages.c,772 :: 		if(system_reg[HEATWATER]==0){
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_data_eeprom280
;Pages.c,773 :: 		ON_OFF_DHW.Caption = "OFF";
MOVW	R1, #lo_addr(?lstr64_Pages+0)
MOVT	R1, #hi_addr(?lstr64_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Pages.c,774 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,775 :: 		}
IT	AL
BAL	L_data_eeprom281
L_data_eeprom280:
;Pages.c,776 :: 		else if(system_reg[HEATWATER]==1){
MOVW	R0, #lo_addr(_system_reg+420)
MOVT	R0, #hi_addr(_system_reg+420)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom282
;Pages.c,777 :: 		ON_OFF_DHW.Caption = "ON";
MOVW	R1, #lo_addr(?lstr65_Pages+0)
MOVT	R1, #hi_addr(?lstr65_Pages+0)
MOVW	R0, #lo_addr(_ON_OFF_DHW+24)
MOVT	R0, #hi_addr(_ON_OFF_DHW+24)
STR	R1, [R0, #0]
;Pages.c,778 :: 		DrawRoundButton(&ON_OFF_DHW);
MOVW	R0, #lo_addr(_ON_OFF_DHW+0)
MOVT	R0, #hi_addr(_ON_OFF_DHW+0)
BL	_DrawRoundButton+0
;Pages.c,780 :: 		}
L_data_eeprom282:
L_data_eeprom281:
;Pages.c,781 :: 		if(system_reg[NOMB_COMPRESSORS]==1){two_compressors_mode=false; Two_Compressors.Visible= 0;One_Compressors.Visible = 1;  }
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom283
MOVS	R1, #0
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_Two_Compressors+20)
MOVT	R0, #hi_addr(_Two_Compressors+20)
STRB	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_One_Compressors+20)
MOVT	R0, #hi_addr(_One_Compressors+20)
STRB	R1, [R0, #0]
IT	AL
BAL	L_data_eeprom284
L_data_eeprom283:
;Pages.c,782 :: 		else  if(system_reg[NOMB_COMPRESSORS]==2)  {two_compressors_mode=true; Two_Compressors.Visible= 1;One_Compressors.Visible = 0;  }
MOVW	R0, #lo_addr(_system_reg+800)
MOVT	R0, #hi_addr(_system_reg+800)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_data_eeprom285
MOVS	R1, #1
MOVW	R0, #lo_addr(_two_compressors_mode+0)
MOVT	R0, #hi_addr(_two_compressors_mode+0)
STRB	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_Two_Compressors+20)
MOVT	R0, #hi_addr(_Two_Compressors+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_One_Compressors+20)
MOVT	R0, #hi_addr(_One_Compressors+20)
STRB	R1, [R0, #0]
L_data_eeprom285:
L_data_eeprom284:
;Pages.c,784 :: 		if(system_reg[REVERS_MOD]==0){Reversing_Heat_OFF.Visible= 1;Reversing_ON_HEAT.Visible = 0;  }
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_data_eeprom286
MOVS	R1, #1
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+20)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+20)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+20)
STRB	R1, [R0, #0]
IT	AL
BAL	L_data_eeprom287
L_data_eeprom286:
;Pages.c,785 :: 		else  if(system_reg[REVERS_MOD]==1)  {Reversing_ON_HEAT.Visible= 1;Reversing_Heat_OFF.Visible = 0;  }
MOVW	R0, #lo_addr(_system_reg+820)
MOVT	R0, #hi_addr(_system_reg+820)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom288
MOVS	R1, #1
MOVW	R0, #lo_addr(_Reversing_ON_HEAT+20)
MOVT	R0, #hi_addr(_Reversing_ON_HEAT+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_Reversing_Heat_OFF+20)
MOVT	R0, #hi_addr(_Reversing_Heat_OFF+20)
STRB	R1, [R0, #0]
L_data_eeprom288:
L_data_eeprom287:
;Pages.c,787 :: 		if(system_reg[POWER_380]==0){Power_220V.Visible= 1;Power_380V.Visible = 0;  }
MOVW	R0, #lo_addr(_system_reg+940)
MOVT	R0, #hi_addr(_system_reg+940)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_data_eeprom289
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_220V+20)
MOVT	R0, #hi_addr(_Power_220V+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_Power_380V+20)
MOVT	R0, #hi_addr(_Power_380V+20)
STRB	R1, [R0, #0]
IT	AL
BAL	L_data_eeprom290
L_data_eeprom289:
;Pages.c,788 :: 		else  if(system_reg[POWER_380]==1)  {Power_380V.Visible= 1;Power_220V.Visible = 0;  }
MOVW	R0, #lo_addr(_system_reg+940)
MOVT	R0, #hi_addr(_system_reg+940)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom291
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_380V+20)
MOVT	R0, #hi_addr(_Power_380V+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_Power_220V+20)
MOVT	R0, #hi_addr(_Power_220V+20)
STRB	R1, [R0, #0]
L_data_eeprom291:
L_data_eeprom290:
;Pages.c,790 :: 		if(system_reg[AIRE_TO_WATER]==0){ Mode_ground_on.Visible= 1;Mode_air_on.Visible = 0; }//
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_data_eeprom292
MOVS	R1, #1
MOVW	R0, #lo_addr(_Mode_ground_on+20)
MOVT	R0, #hi_addr(_Mode_ground_on+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_Mode_air_on+20)
MOVT	R0, #hi_addr(_Mode_air_on+20)
STRB	R1, [R0, #0]
IT	AL
BAL	L_data_eeprom293
L_data_eeprom292:
;Pages.c,791 :: 		else  if(system_reg[AIRE_TO_WATER]==1)  {Mode_air_on.Visible= 1;Mode_ground_on.Visible = 0; }//
MOVW	R0, #lo_addr(_system_reg+340)
MOVT	R0, #hi_addr(_system_reg+340)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_data_eeprom294
MOVS	R1, #1
MOVW	R0, #lo_addr(_Mode_air_on+20)
MOVT	R0, #hi_addr(_Mode_air_on+20)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_Mode_ground_on+20)
MOVT	R0, #hi_addr(_Mode_ground_on+20)
STRB	R1, [R0, #0]
L_data_eeprom294:
L_data_eeprom293:
;Pages.c,792 :: 		}
L_end_data_eeprom:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _data_eeprom
_count_steps:
;Pages.c,794 :: 		void count_steps(unsigned char num_page){
; num_page start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; num_page end address is: 0 (R0)
; num_page start address is: 0 (R0)
;Pages.c,801 :: 		if(num_page==0)
CMP	R0, #0
IT	NE
BNE	L_count_steps295
; num_page end address is: 0 (R0)
;Pages.c,803 :: 		IntToStr(system_reg[S_HEAT_1]/10, txt);Ltrim(txt);//
ADD	R3, SP, #4
MOVW	R1, #lo_addr(_system_reg+302)
MOVT	R1, #hi_addr(_system_reg+302)
LDRSH	R2, [R1, #0]
MOVS	R1, #10
SXTH	R1, R1
SDIV	R1, R2, R1
SXTH	R0, R1
MOV	R1, R3
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,804 :: 		if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
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
BEQ	L_count_steps296
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
L_count_steps296:
;Pages.c,812 :: 		if(old_steps_1!=system_reg[TRV_STEPS_1]){
MOVW	R1, #lo_addr(_system_reg+122)
MOVT	R1, #hi_addr(_system_reg+122)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(count_steps_old_steps_1_L0+0)
MOVT	R1, #hi_addr(count_steps_old_steps_1_L0+0)
LDRSH	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L_count_steps297
;Pages.c,813 :: 		old_steps_1=system_reg[TRV_STEPS_1];
MOVW	R3, #lo_addr(_system_reg+122)
MOVT	R3, #hi_addr(_system_reg+122)
LDRSH	R2, [R3, #0]
MOVW	R1, #lo_addr(count_steps_old_steps_1_L0+0)
MOVT	R1, #hi_addr(count_steps_old_steps_1_L0+0)
STRH	R2, [R1, #0]
;Pages.c,814 :: 		Red_bar.Position = system_reg[TRV_STEPS_1]; UpdatePBPosition(&Red_bar);
MOV	R1, R3
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
STRH	R2, [R1, #0]
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_UpdatePBPosition+0
;Pages.c,815 :: 		}
L_count_steps297:
;Pages.c,817 :: 		if(old_corect_1!=system_reg[TRV_CORRECT_1]){
MOVW	R1, #lo_addr(_system_reg+782)
MOVT	R1, #hi_addr(_system_reg+782)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(count_steps_old_corect_1_L0+0)
MOVT	R1, #hi_addr(count_steps_old_corect_1_L0+0)
LDRSH	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L_count_steps298
;Pages.c,818 :: 		old_corect_1=system_reg[TRV_CORRECT_1];
MOVW	R3, #lo_addr(_system_reg+782)
MOVT	R3, #hi_addr(_system_reg+782)
LDRSH	R2, [R3, #0]
MOVW	R1, #lo_addr(count_steps_old_corect_1_L0+0)
MOVT	R1, #hi_addr(count_steps_old_corect_1_L0+0)
STRH	R2, [R1, #0]
;Pages.c,819 :: 		IntToStr(system_reg[TRV_CORRECT_1], txt);Ltrim(txt);
ADD	R2, SP, #4
MOV	R1, R3
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,820 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
;Pages.c,821 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Pages.c,822 :: 		}
L_count_steps298:
;Pages.c,831 :: 		}
IT	AL
BAL	L_count_steps299
L_count_steps295:
;Pages.c,834 :: 		IntToStr(system_reg[S_HEAT_2]/10, txt);Ltrim(txt);//
ADD	R3, SP, #4
MOVW	R1, #lo_addr(_system_reg+304)
MOVT	R1, #hi_addr(_system_reg+304)
LDRSH	R2, [R1, #0]
MOVS	R1, #10
SXTH	R1, R1
SDIV	R1, R2, R1
SXTH	R0, R1
MOV	R1, R3
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,835 :: 		if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
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
BEQ	L_count_steps300
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
L_count_steps300:
;Pages.c,837 :: 		if(old_steps_2!=system_reg[TRV_STEPS_2]){
MOVW	R1, #lo_addr(_system_reg+124)
MOVT	R1, #hi_addr(_system_reg+124)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(count_steps_old_steps_2_L0+0)
MOVT	R1, #hi_addr(count_steps_old_steps_2_L0+0)
LDRSH	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L_count_steps301
;Pages.c,838 :: 		old_steps_2=system_reg[TRV_STEPS_2];
MOVW	R3, #lo_addr(_system_reg+124)
MOVT	R3, #hi_addr(_system_reg+124)
LDRSH	R2, [R3, #0]
MOVW	R1, #lo_addr(count_steps_old_steps_2_L0+0)
MOVT	R1, #hi_addr(count_steps_old_steps_2_L0+0)
STRH	R2, [R1, #0]
;Pages.c,839 :: 		Red_bar.Position = system_reg[TRV_STEPS_2]; UpdatePBPosition(&Red_bar);
MOV	R1, R3
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(_Red_bar+44)
MOVT	R1, #hi_addr(_Red_bar+44)
STRH	R2, [R1, #0]
MOVW	R0, #lo_addr(_Red_bar+0)
MOVT	R0, #hi_addr(_Red_bar+0)
BL	_UpdatePBPosition+0
;Pages.c,840 :: 		}
L_count_steps301:
;Pages.c,843 :: 		if(old_corect_2!=system_reg[TRV_CORRECT_2]){
MOVW	R1, #lo_addr(_system_reg+784)
MOVT	R1, #hi_addr(_system_reg+784)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(count_steps_old_corect_2_L0+0)
MOVT	R1, #hi_addr(count_steps_old_corect_2_L0+0)
LDRSH	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L_count_steps302
;Pages.c,844 :: 		old_corect_2=system_reg[TRV_CORRECT_2];
MOVW	R3, #lo_addr(_system_reg+784)
MOVT	R3, #hi_addr(_system_reg+784)
LDRSH	R2, [R3, #0]
MOVW	R1, #lo_addr(count_steps_old_corect_2_L0+0)
MOVT	R1, #hi_addr(count_steps_old_corect_2_L0+0)
STRH	R2, [R1, #0]
;Pages.c,845 :: 		IntToStr(system_reg[TRV_CORRECT_2], txt);Ltrim(txt);
ADD	R2, SP, #4
MOV	R1, R3
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;Pages.c,846 :: 		strcpy(EEV1_value.Caption, txt);
ADD	R2, SP, #4
MOVW	R1, #lo_addr(_EEV1_value+24)
MOVT	R1, #hi_addr(_EEV1_value+24)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
;Pages.c,847 :: 		DrawRoundButton(&EEV1_value);
MOVW	R0, #lo_addr(_EEV1_value+0)
MOVT	R0, #hi_addr(_EEV1_value+0)
BL	_DrawRoundButton+0
;Pages.c,848 :: 		}
L_count_steps302:
;Pages.c,857 :: 		}
L_count_steps299:
;Pages.c,858 :: 		}
L_end_count_steps:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _count_steps
_working_time:
;Pages.c,860 :: 		void working_time(unsigned char num_page){
; num_page start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; num_page end address is: 0 (R0)
; num_page start address is: 0 (R0)
;Pages.c,862 :: 		if(num_page==0)
CMP	R0, #0
IT	NE
BNE	L_working_time303
; num_page end address is: 0 (R0)
;Pages.c,864 :: 		IntToStr(system_reg[TIM_COM_1], txt);Ltrim(txt);//
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
;Pages.c,865 :: 		if(strncmp(txt,Time_compressor1.Caption,7)!=0){strcpy(Time_compressor1.Caption, txt);DrawRoundButton(&Time_compressor1);}
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
BEQ	L_working_time304
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
L_working_time304:
;Pages.c,866 :: 		IntToStr(system_reg[TIM_REV_1], txt);Ltrim(txt);//
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
;Pages.c,867 :: 		if(strncmp(txt,Time_reversing1.Caption,7)!=0){strcpy(Time_reversing1.Caption, txt);DrawRoundButton(&Time_reversing1);}
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
BEQ	L_working_time305
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
L_working_time305:
;Pages.c,868 :: 		IntToStr(system_reg[TIM_P_SOURS_1], txt);Ltrim(txt);//
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
;Pages.c,869 :: 		if(strncmp(txt,Time_source1.Caption,7)!=0){strcpy(Time_source1.Caption, txt);DrawRoundButton(&Time_source1);}
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
BEQ	L_working_time306
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
L_working_time306:
;Pages.c,870 :: 		IntToStr(system_reg[TIM_P_HEAT_1], txt);Ltrim(txt);//
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
;Pages.c,871 :: 		if(strncmp(txt,Time_heat1.Caption,7)!=0){strcpy(Time_heat1.Caption, txt);DrawRoundButton(&Time_heat1);}
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
BEQ	L_working_time307
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
L_working_time307:
;Pages.c,872 :: 		}
IT	AL
BAL	L_working_time308
L_working_time303:
;Pages.c,875 :: 		IntToStr(system_reg[TIM_COM_2], txt);Ltrim(txt);//
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
;Pages.c,876 :: 		if(strncmp(txt,Time_compressor1.Caption,7)!=0){strcpy(Time_compressor1.Caption, txt);DrawRoundButton(&Time_compressor1);}
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
BEQ	L_working_time309
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
L_working_time309:
;Pages.c,877 :: 		IntToStr(system_reg[TIM_REV_2], txt);Ltrim(txt);//
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
;Pages.c,878 :: 		if(strncmp(txt,Time_reversing1.Caption,7)!=0){strcpy(Time_reversing1.Caption, txt);DrawRoundButton(&Time_reversing1);}
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
BEQ	L_working_time310
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
L_working_time310:
;Pages.c,879 :: 		IntToStr(system_reg[TIM_P_SOURS_2], txt);Ltrim(txt);//
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
;Pages.c,880 :: 		if(strncmp(txt,Time_source1.Caption,7)!=0){strcpy(Time_source1.Caption, txt);DrawRoundButton(&Time_source1);}
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
BEQ	L_working_time311
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
L_working_time311:
;Pages.c,881 :: 		IntToStr(system_reg[TIM_P_HEAT_2], txt);Ltrim(txt);//
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
;Pages.c,882 :: 		if(strncmp(txt,Time_heat1.Caption,7)!=0){strcpy(Time_heat1.Caption, txt);DrawRoundButton(&Time_heat1);}
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
BEQ	L_working_time312
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
L_working_time312:
;Pages.c,883 :: 		}
L_working_time308:
;Pages.c,884 :: 		}
L_end_working_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _working_time
_schema1_page:
;Pages.c,886 :: 		void schema1_page(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,889 :: 		if(system_reg[COM_STATE_1]==1) DrawImage(&Image76);
MOVW	R0, #lo_addr(_system_reg+22)
MOVT	R0, #hi_addr(_system_reg+22)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page313
MOVW	R0, #lo_addr(_Image76+0)
MOVT	R0, #hi_addr(_Image76+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page314
L_schema1_page313:
;Pages.c,890 :: 		else DrawImage(&Image119);
MOVW	R0, #lo_addr(_Image119+0)
MOVT	R0, #hi_addr(_Image119+0)
BL	_DrawImage+0
L_schema1_page314:
;Pages.c,891 :: 		if(system_reg[PUMP_HEAT_STATE_1]==1) DrawImage(&Image75);
MOVW	R0, #lo_addr(_system_reg+62)
MOVT	R0, #hi_addr(_system_reg+62)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page315
MOVW	R0, #lo_addr(_Image75+0)
MOVT	R0, #hi_addr(_Image75+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page316
L_schema1_page315:
;Pages.c,892 :: 		else DrawImage(&Image124);
MOVW	R0, #lo_addr(_Image124+0)
MOVT	R0, #hi_addr(_Image124+0)
BL	_DrawImage+0
L_schema1_page316:
;Pages.c,893 :: 		if(system_reg[PUMP_SOURS_STATE_1]==1) DrawImage(&Image74);
MOVW	R0, #lo_addr(_system_reg+42)
MOVT	R0, #hi_addr(_system_reg+42)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page317
MOVW	R0, #lo_addr(_Image74+0)
MOVT	R0, #hi_addr(_Image74+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page318
L_schema1_page317:
;Pages.c,894 :: 		else DrawImage(&Image117);
MOVW	R0, #lo_addr(_Image117+0)
MOVT	R0, #hi_addr(_Image117+0)
BL	_DrawImage+0
L_schema1_page318:
;Pages.c,895 :: 		if(system_reg[REV_STATE_1]==1) DrawImage(&Image73);
MOVW	R0, #lo_addr(_system_reg+82)
MOVT	R0, #hi_addr(_system_reg+82)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page319
MOVW	R0, #lo_addr(_Image73+0)
MOVT	R0, #hi_addr(_Image73+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page320
L_schema1_page319:
;Pages.c,896 :: 		else DrawImage(&Image118);
MOVW	R0, #lo_addr(_Image118+0)
MOVT	R0, #hi_addr(_Image118+0)
BL	_DrawImage+0
L_schema1_page320:
;Pages.c,897 :: 		if(system_reg[THREE_STATE]==1) DrawImage(&Image77);
MOVW	R0, #lo_addr(_system_reg+102)
MOVT	R0, #hi_addr(_system_reg+102)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema1_page321
MOVW	R0, #lo_addr(_Image77+0)
MOVT	R0, #hi_addr(_Image77+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema1_page322
L_schema1_page321:
;Pages.c,898 :: 		else DrawImage(&Image120);
MOVW	R0, #lo_addr(_Image120+0)
MOVT	R0, #hi_addr(_Image120+0)
BL	_DrawImage+0
L_schema1_page322:
;Pages.c,899 :: 		IntToStr(system_reg[SOURC_IN_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,900 :: 		if(strncmp(txt,S_Brine_In_1.Caption,2)!=0){strncpy(S_Brine_In_1.Caption, txt, 2);DrawButton(&S_Brine_In_1);}
MOVW	R0, #lo_addr(_S_Brine_In_1+24)
MOVT	R0, #hi_addr(_S_Brine_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page323
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
L_schema1_page323:
;Pages.c,901 :: 		IntToStr(system_reg[SOURC_OUT_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,902 :: 		if(strncmp(txt,S_Brine_Out_1.Caption,2)!=0){strncpy(S_Brine_Out_1.Caption, txt, 2);DrawButton(&S_Brine_Out_1);}
MOVW	R0, #lo_addr(_S_Brine_Out_1+24)
MOVT	R0, #hi_addr(_S_Brine_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page324
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
L_schema1_page324:
;Pages.c,903 :: 		IntToStr(system_reg[HEAT_IN_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+322)
MOVT	R0, #hi_addr(_system_reg+322)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,904 :: 		if(strncmp(txt,S_Heat_In_1.Caption,2)!=0){strncpy(S_Heat_In_1.Caption, txt, 2);DrawButton(&S_Heat_In_1);}
MOVW	R0, #lo_addr(_S_Heat_In_1+24)
MOVT	R0, #hi_addr(_S_Heat_In_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page325
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
L_schema1_page325:
;Pages.c,905 :: 		IntToStr(system_reg[HEAT_OUT_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+342)
MOVT	R0, #hi_addr(_system_reg+342)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,906 :: 		if(strncmp(txt,S_Heat_Out_1.Caption,2)!=0){strncpy(S_Heat_Out_1.Caption, txt, 2);DrawButton(&S_Heat_Out_1);}
MOVW	R0, #lo_addr(_S_Heat_Out_1+24)
MOVT	R0, #hi_addr(_S_Heat_Out_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page326
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
L_schema1_page326:
;Pages.c,907 :: 		IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+402)
MOVT	R0, #hi_addr(_system_reg+402)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,908 :: 		if(system_reg[EXAUST_TEMP_1]/10<10){
MOVW	R0, #lo_addr(_system_reg+402)
MOVT	R0, #hi_addr(_system_reg+402)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
CMP	R0, #10
IT	GE
BGE	L_schema1_page327
;Pages.c,909 :: 		if(strncmp(txt,S_ComprEx_1.Caption,2)!=0){strncpy(S_ComprEx_1.Caption, txt, 2);
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page328
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,910 :: 		S_ComprEx_1.Caption[2]=S_ComprEx_1.Caption[1];S_ComprEx_1.Caption[1]=S_ComprEx_1.Caption[0];S_ComprEx_1.Caption[0]='0';
MOVW	R2, #lo_addr(_S_ComprEx_1+24)
MOVT	R2, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #2
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
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
;Pages.c,911 :: 		DrawRoundButton(&S_ComprEx_1);
MOVW	R0, #lo_addr(_S_ComprEx_1+0)
MOVT	R0, #hi_addr(_S_ComprEx_1+0)
BL	_DrawRoundButton+0
;Pages.c,912 :: 		strncpy(S_ComprEx_1.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,913 :: 		}
L_schema1_page328:
;Pages.c,914 :: 		}
IT	AL
BAL	L_schema1_page329
L_schema1_page327:
;Pages.c,915 :: 		else{if(strncmp(txt,S_ComprEx_1.Caption,3)!=0){strncpy(S_ComprEx_1.Caption, txt, 3);DrawButton(&S_ComprEx_1);} }
MOVW	R0, #lo_addr(_S_ComprEx_1+24)
MOVT	R0, #hi_addr(_S_ComprEx_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page330
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
L_schema1_page330:
L_schema1_page329:
;Pages.c,916 :: 		IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_system_reg+302)
MOVT	R0, #hi_addr(_system_reg+302)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,917 :: 		if(strncmp(txt,S_SH_1.Caption,2)!=0){strncpy(S_SH_1.Caption, txt, 2);DrawButton(&S_SH_1);}
MOVW	R0, #lo_addr(_S_SH_1+24)
MOVT	R0, #hi_addr(_S_SH_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page331
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
L_schema1_page331:
;Pages.c,921 :: 		IntToStr(system_reg[DHW_TEMP]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,922 :: 		if(strncmp(txt,Sens_DHW.Caption,2)!=0){strncpy(Sens_DHW.Caption, txt, 2);DrawButton(&Sens_DHW);}
MOVW	R0, #lo_addr(_Sens_DHW+24)
MOVT	R0, #hi_addr(_Sens_DHW+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page332
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
L_schema1_page332:
;Pages.c,923 :: 		IntToStr(system_reg[BAC_TEMP]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,924 :: 		if(strncmp(txt,S_tank.Caption,2)!=0){strncpy(S_tank.Caption, txt, 2);DrawButton(&S_tank);}
MOVW	R0, #lo_addr(_S_tank+24)
MOVT	R0, #hi_addr(_S_tank+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page333
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
L_schema1_page333:
;Pages.c,925 :: 		IntToStr(system_reg[HIGH_PRESS_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+362)
MOVT	R0, #hi_addr(_system_reg+362)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,926 :: 		if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
MOVW	R0, #lo_addr(_S_High_Press_1+24)
MOVT	R0, #hi_addr(_S_High_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page334
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
L_schema1_page334:
;Pages.c,927 :: 		IntToStr(system_reg[LOW_PRESS_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+382)
MOVT	R0, #hi_addr(_system_reg+382)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,928 :: 		if(strncmp(txt,S_Low_Press_1.Caption,2)!=0){strncpy(S_Low_Press_1.Caption, txt, 2);DrawButton(&S_Low_Press_1);}
MOVW	R0, #lo_addr(_S_Low_Press_1+24)
MOVT	R0, #hi_addr(_S_Low_Press_1+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema1_page335
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
L_schema1_page335:
;Pages.c,929 :: 		}
L_end_schema1_page:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _schema1_page
_schema2_page:
;Pages.c,931 :: 		void schema2_page(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Pages.c,934 :: 		if(system_reg[COM_STATE_1]==1) DrawImage(&Image166);
MOVW	R0, #lo_addr(_system_reg+22)
MOVT	R0, #hi_addr(_system_reg+22)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page336
MOVW	R0, #lo_addr(_Image166+0)
MOVT	R0, #hi_addr(_Image166+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page337
L_schema2_page336:
;Pages.c,935 :: 		else DrawImage(&Image181);
MOVW	R0, #lo_addr(_Image181+0)
MOVT	R0, #hi_addr(_Image181+0)
BL	_DrawImage+0
L_schema2_page337:
;Pages.c,936 :: 		if(system_reg[COM_STATE_2]==1) DrawImage(&Image276);
MOVW	R0, #lo_addr(_system_reg+24)
MOVT	R0, #hi_addr(_system_reg+24)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page338
MOVW	R0, #lo_addr(_Image276+0)
MOVT	R0, #hi_addr(_Image276+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page339
L_schema2_page338:
;Pages.c,937 :: 		else DrawImage(&Image275);
MOVW	R0, #lo_addr(_Image275+0)
MOVT	R0, #hi_addr(_Image275+0)
BL	_DrawImage+0
L_schema2_page339:
;Pages.c,938 :: 		if(system_reg[PUMP_HEAT_STATE_1]==1) DrawImage(&Image75);
MOVW	R0, #lo_addr(_system_reg+62)
MOVT	R0, #hi_addr(_system_reg+62)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page340
MOVW	R0, #lo_addr(_Image75+0)
MOVT	R0, #hi_addr(_Image75+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page341
L_schema2_page340:
;Pages.c,939 :: 		else DrawImage(&Image124);
MOVW	R0, #lo_addr(_Image124+0)
MOVT	R0, #hi_addr(_Image124+0)
BL	_DrawImage+0
L_schema2_page341:
;Pages.c,940 :: 		if(system_reg[PUMP_SOURS_STATE_1]==1) DrawImage(&Image74);
MOVW	R0, #lo_addr(_system_reg+42)
MOVT	R0, #hi_addr(_system_reg+42)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page342
MOVW	R0, #lo_addr(_Image74+0)
MOVT	R0, #hi_addr(_Image74+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page343
L_schema2_page342:
;Pages.c,941 :: 		else DrawImage(&Image117);
MOVW	R0, #lo_addr(_Image117+0)
MOVT	R0, #hi_addr(_Image117+0)
BL	_DrawImage+0
L_schema2_page343:
;Pages.c,942 :: 		if(system_reg[REV_STATE_1]==1) DrawImage(&Image73);
MOVW	R0, #lo_addr(_system_reg+82)
MOVT	R0, #hi_addr(_system_reg+82)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page344
MOVW	R0, #lo_addr(_Image73+0)
MOVT	R0, #hi_addr(_Image73+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page345
L_schema2_page344:
;Pages.c,943 :: 		else DrawImage(&Image118);
MOVW	R0, #lo_addr(_Image118+0)
MOVT	R0, #hi_addr(_Image118+0)
BL	_DrawImage+0
L_schema2_page345:
;Pages.c,944 :: 		if(system_reg[THREE_STATE]==1) DrawImage(&Image77);
MOVW	R0, #lo_addr(_system_reg+102)
MOVT	R0, #hi_addr(_system_reg+102)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_schema2_page346
MOVW	R0, #lo_addr(_Image77+0)
MOVT	R0, #hi_addr(_Image77+0)
BL	_DrawImage+0
IT	AL
BAL	L_schema2_page347
L_schema2_page346:
;Pages.c,945 :: 		else DrawImage(&Image120);
MOVW	R0, #lo_addr(_Image120+0)
MOVT	R0, #hi_addr(_Image120+0)
BL	_DrawImage+0
L_schema2_page347:
;Pages.c,946 :: 		IntToStr(system_reg[SOURC_IN_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+182)
MOVT	R0, #hi_addr(_system_reg+182)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,947 :: 		if(strncmp(txt,Module1_br_inlet.Caption,2)!=0){strncpy(Module1_br_inlet.Caption, txt, 2);DrawButton(&Module1_br_inlet);}
MOVW	R0, #lo_addr(_Module1_br_inlet+24)
MOVT	R0, #hi_addr(_Module1_br_inlet+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page348
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_br_inlet+24)
MOVT	R0, #hi_addr(_Module1_br_inlet+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module1_br_inlet+0)
MOVT	R0, #hi_addr(_Module1_br_inlet+0)
BL	_DrawButton+0
L_schema2_page348:
;Pages.c,948 :: 		IntToStr(system_reg[SOURC_OUT_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+202)
MOVT	R0, #hi_addr(_system_reg+202)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,949 :: 		if(strncmp(txt,Module1_br_outlet.Caption,2)!=0){strncpy(Module1_br_outlet.Caption, txt, 2);DrawButton(&Module1_br_outlet);}
MOVW	R0, #lo_addr(_Module1_br_outlet+24)
MOVT	R0, #hi_addr(_Module1_br_outlet+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page349
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_br_outlet+24)
MOVT	R0, #hi_addr(_Module1_br_outlet+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module1_br_outlet+0)
MOVT	R0, #hi_addr(_Module1_br_outlet+0)
BL	_DrawButton+0
L_schema2_page349:
;Pages.c,950 :: 		IntToStr(system_reg[HEAT_IN_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+322)
MOVT	R0, #hi_addr(_system_reg+322)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,951 :: 		if(strncmp(txt,Module1_heat_inlet.Caption,2)!=0){strncpy(Module1_heat_inlet.Caption, txt, 2);DrawButton(&Module1_heat_inlet);}
MOVW	R0, #lo_addr(_Module1_heat_inlet+24)
MOVT	R0, #hi_addr(_Module1_heat_inlet+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page350
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_heat_inlet+24)
MOVT	R0, #hi_addr(_Module1_heat_inlet+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module1_heat_inlet+0)
MOVT	R0, #hi_addr(_Module1_heat_inlet+0)
BL	_DrawButton+0
L_schema2_page350:
;Pages.c,952 :: 		IntToStr(system_reg[HEAT_OUT_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+342)
MOVT	R0, #hi_addr(_system_reg+342)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,953 :: 		if(strncmp(txt,Module1_heat_outlet.Caption,2)!=0){strncpy(Module1_heat_outlet.Caption, txt, 2);DrawButton(&Module1_heat_outlet);}
MOVW	R0, #lo_addr(_Module1_heat_outlet+24)
MOVT	R0, #hi_addr(_Module1_heat_outlet+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page351
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_heat_outlet+24)
MOVT	R0, #hi_addr(_Module1_heat_outlet+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module1_heat_outlet+0)
MOVT	R0, #hi_addr(_Module1_heat_outlet+0)
BL	_DrawButton+0
L_schema2_page351:
;Pages.c,954 :: 		IntToStr(system_reg[EXAUST_TEMP_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+402)
MOVT	R0, #hi_addr(_system_reg+402)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,955 :: 		if(system_reg[EXAUST_TEMP_1]/10<100){
MOVW	R0, #lo_addr(_system_reg+402)
MOVT	R0, #hi_addr(_system_reg+402)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
CMP	R0, #100
IT	GE
BGE	L_schema2_page352
;Pages.c,956 :: 		if(strncmp(txt,Module1_exhaust.Caption,2)!=0){strncpy(Module1_exhaust.Caption, txt, 2);
MOVW	R0, #lo_addr(_Module1_exhaust+24)
MOVT	R0, #hi_addr(_Module1_exhaust+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page353
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_exhaust+24)
MOVT	R0, #hi_addr(_Module1_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,957 :: 		Module1_exhaust.Caption[2]=Module1_exhaust.Caption[1];Module1_exhaust.Caption[1]=Module1_exhaust.Caption[0];Module1_exhaust.Caption[0]='0';
MOVW	R2, #lo_addr(_Module1_exhaust+24)
MOVT	R2, #hi_addr(_Module1_exhaust+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #2
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
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
;Pages.c,958 :: 		DrawRoundButton(&Module1_exhaust);
MOVW	R0, #lo_addr(_Module1_exhaust+0)
MOVT	R0, #hi_addr(_Module1_exhaust+0)
BL	_DrawRoundButton+0
;Pages.c,959 :: 		strncpy(Module1_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_exhaust+24)
MOVT	R0, #hi_addr(_Module1_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,960 :: 		}
L_schema2_page353:
;Pages.c,961 :: 		}
IT	AL
BAL	L_schema2_page354
L_schema2_page352:
;Pages.c,962 :: 		else{if(strncmp(txt,Module1_exhaust.Caption,3)!=0){strncpy(Module1_exhaust.Caption, txt, 3);DrawButton(&Module1_exhaust);} }
MOVW	R0, #lo_addr(_Module1_exhaust+24)
MOVT	R0, #hi_addr(_Module1_exhaust+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page355
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_exhaust+24)
MOVT	R0, #hi_addr(_Module1_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module1_exhaust+0)
MOVT	R0, #hi_addr(_Module1_exhaust+0)
BL	_DrawButton+0
L_schema2_page355:
L_schema2_page354:
;Pages.c,963 :: 		IntToStr(system_reg[S_HEAT_1]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+302)
MOVT	R0, #hi_addr(_system_reg+302)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,964 :: 		if(strncmp(txt,Module1_superheat.Caption,2)!=0){strncpy(Module1_superheat.Caption, txt, 2);DrawButton(&Module1_superheat);}
MOVW	R0, #lo_addr(_Module1_superheat+24)
MOVT	R0, #hi_addr(_Module1_superheat+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page356
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module1_superheat+24)
MOVT	R0, #hi_addr(_Module1_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module1_superheat+0)
MOVT	R0, #hi_addr(_Module1_superheat+0)
BL	_DrawButton+0
L_schema2_page356:
;Pages.c,969 :: 		IntToStr(system_reg[SOURC_IN_2]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+184)
MOVT	R0, #hi_addr(_system_reg+184)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,970 :: 		if(strncmp(txt,Button7.Caption,2)!=0){strncpy(Button7.Caption, txt, 2);DrawButton(&Button7);}
MOVW	R0, #lo_addr(_Button7+24)
MOVT	R0, #hi_addr(_Button7+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page357
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Button7+24)
MOVT	R0, #hi_addr(_Button7+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Button7+0)
MOVT	R0, #hi_addr(_Button7+0)
BL	_DrawButton+0
L_schema2_page357:
;Pages.c,971 :: 		IntToStr(system_reg[SOURC_OUT_2]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+204)
MOVT	R0, #hi_addr(_system_reg+204)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,972 :: 		if(strncmp(txt,Button9.Caption,2)!=0){strncpy(Button9.Caption, txt, 2);DrawButton(&Button9);}
MOVW	R0, #lo_addr(_Button9+24)
MOVT	R0, #hi_addr(_Button9+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page358
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Button9+24)
MOVT	R0, #hi_addr(_Button9+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Button9+0)
MOVT	R0, #hi_addr(_Button9+0)
BL	_DrawButton+0
L_schema2_page358:
;Pages.c,973 :: 		IntToStr(system_reg[HEAT_IN_2]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+324)
MOVT	R0, #hi_addr(_system_reg+324)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,974 :: 		if(strncmp(txt,Button11.Caption,2)!=0){strncpy(Button11.Caption, txt, 2);DrawButton(&Button11);}
MOVW	R0, #lo_addr(_Button11+24)
MOVT	R0, #hi_addr(_Button11+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page359
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Button11+24)
MOVT	R0, #hi_addr(_Button11+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Button11+0)
MOVT	R0, #hi_addr(_Button11+0)
BL	_DrawButton+0
L_schema2_page359:
;Pages.c,975 :: 		IntToStr(system_reg[HEAT_OUT_2]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+344)
MOVT	R0, #hi_addr(_system_reg+344)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,976 :: 		if(strncmp(txt,Button10.Caption,2)!=0){strncpy(Button10.Caption, txt, 2);DrawButton(&Button10);}
MOVW	R0, #lo_addr(_Button10+24)
MOVT	R0, #hi_addr(_Button10+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page360
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Button10+24)
MOVT	R0, #hi_addr(_Button10+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Button10+0)
MOVT	R0, #hi_addr(_Button10+0)
BL	_DrawButton+0
L_schema2_page360:
;Pages.c,977 :: 		IntToStr(system_reg[EXAUST_TEMP_2]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+404)
MOVT	R0, #hi_addr(_system_reg+404)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,978 :: 		if(system_reg[EXAUST_TEMP_2]/10<100){
MOVW	R0, #lo_addr(_system_reg+404)
MOVT	R0, #hi_addr(_system_reg+404)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
CMP	R0, #100
IT	GE
BGE	L_schema2_page361
;Pages.c,979 :: 		if(strncmp(txt,Module2_exhaust.Caption,2)!=0){strncpy(Module2_exhaust.Caption, txt, 2);
MOVW	R0, #lo_addr(_Module2_exhaust+24)
MOVT	R0, #hi_addr(_Module2_exhaust+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page362
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module2_exhaust+24)
MOVT	R0, #hi_addr(_Module2_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,980 :: 		Module2_exhaust.Caption[2]=Module2_exhaust.Caption[1];Module2_exhaust.Caption[1]=Module2_exhaust.Caption[0];Module2_exhaust.Caption[0]='0';
MOVW	R2, #lo_addr(_Module2_exhaust+24)
MOVT	R2, #hi_addr(_Module2_exhaust+24)
LDR	R0, [R2, #0]
ADDS	R1, R0, #2
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
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
;Pages.c,981 :: 		DrawRoundButton(&Module2_exhaust);
MOVW	R0, #lo_addr(_Module2_exhaust+0)
MOVT	R0, #hi_addr(_Module2_exhaust+0)
BL	_DrawRoundButton+0
;Pages.c,982 :: 		strncpy(Module2_exhaust.Caption, txt, 3);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module2_exhaust+24)
MOVT	R0, #hi_addr(_Module2_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
;Pages.c,983 :: 		}
L_schema2_page362:
;Pages.c,984 :: 		}
IT	AL
BAL	L_schema2_page363
L_schema2_page361:
;Pages.c,985 :: 		else{if(strncmp(txt,Module2_exhaust.Caption,3)!=0){strncpy(Module2_exhaust.Caption, txt, 3);DrawButton(&Module2_exhaust);} }
MOVW	R0, #lo_addr(_Module2_exhaust+24)
MOVT	R0, #hi_addr(_Module2_exhaust+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #3
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page364
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module2_exhaust+24)
MOVT	R0, #hi_addr(_Module2_exhaust+24)
LDR	R0, [R0, #0]
MOVS	R2, #3
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module2_exhaust+0)
MOVT	R0, #hi_addr(_Module2_exhaust+0)
BL	_DrawButton+0
L_schema2_page364:
L_schema2_page363:
;Pages.c,986 :: 		IntToStr(system_reg[S_HEAT_2]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+304)
MOVT	R0, #hi_addr(_system_reg+304)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,987 :: 		if(strncmp(txt,Module2_superheat.Caption,2)!=0){strncpy(Module2_superheat.Caption, txt, 2);DrawButton(&Module2_superheat);}
MOVW	R0, #lo_addr(_Module2_superheat+24)
MOVT	R0, #hi_addr(_Module2_superheat+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page365
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_Module2_superheat+24)
MOVT	R0, #hi_addr(_Module2_superheat+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_Module2_superheat+0)
MOVT	R0, #hi_addr(_Module2_superheat+0)
BL	_DrawButton+0
L_schema2_page365:
;Pages.c,992 :: 		IntToStr(system_reg[DHW_TEMP]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+162)
MOVT	R0, #hi_addr(_system_reg+162)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,993 :: 		if(strncmp(txt,DHW.Caption,2)!=0){strncpy(DHW.Caption, txt, 2);DrawButton(&DHW);}
MOVW	R0, #lo_addr(_DHW+24)
MOVT	R0, #hi_addr(_DHW+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page366
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_DHW+24)
MOVT	R0, #hi_addr(_DHW+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_DHW+0)
MOVT	R0, #hi_addr(_DHW+0)
BL	_DrawButton+0
L_schema2_page366:
;Pages.c,994 :: 		IntToStr(system_reg[BAC_TEMP]/10, txt);Ltrim(txt);//
ADD	R2, SP, #4
MOVW	R0, #lo_addr(_system_reg+142)
MOVT	R0, #hi_addr(_system_reg+142)
LDRSH	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
SDIV	R0, R1, R0
MOV	R1, R2
BL	_IntToStr+0
ADD	R0, SP, #4
BL	_Ltrim+0
;Pages.c,995 :: 		if(strncmp(txt,TANK.Caption,2)!=0){strncpy(TANK.Caption, txt, 2);DrawButton(&TANK);}
MOVW	R0, #lo_addr(_TANK+24)
MOVT	R0, #hi_addr(_TANK+24)
LDR	R1, [R0, #0]
ADD	R0, SP, #4
MOVS	R2, #2
BL	_strncmp+0
CMP	R0, #0
IT	EQ
BEQ	L_schema2_page367
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_TANK+24)
MOVT	R0, #hi_addr(_TANK+24)
LDR	R0, [R0, #0]
MOVS	R2, #2
SXTH	R2, R2
BL	_strncpy+0
MOVW	R0, #lo_addr(_TANK+0)
MOVT	R0, #hi_addr(_TANK+0)
BL	_DrawButton+0
L_schema2_page367:
;Pages.c,1000 :: 		}
L_end_schema2_page:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _schema2_page
