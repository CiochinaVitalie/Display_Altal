InternalRTC_RTC_Bcd2ToByte:
;InternalRTC.c,32 :: 		static short RTC_Bcd2ToByte(short Value)
; Value start address is: 0 (R0)
; Value end address is: 0 (R0)
; Value start address is: 0 (R0)
;InternalRTC.c,34 :: 		short tmp = 0;
;InternalRTC.c,35 :: 		tmp = ((short)(Value & (short)0xF0) >> (short)0x4) * 10;
MOVS	R1, #-16
SXTB	R1, R1
AND	R1, R0, R1, LSL #0
SXTB	R1, R1
ASRS	R2, R1, #4
SXTB	R2, R2
MOVS	R1, #10
SXTH	R1, R1
MULS	R1, R2, R1
;InternalRTC.c,36 :: 		return (tmp + (Value & (short)0x0F));
AND	R2, R0, #15
SXTB	R2, R2
; Value end address is: 0 (R0)
SXTB	R1, R1
ADDS	R1, R1, R2
SXTB	R0, R1
;InternalRTC.c,37 :: 		}
L_end_RTC_Bcd2ToByte:
BX	LR
; end of InternalRTC_RTC_Bcd2ToByte
_Message:
;InternalRTC.c,44 :: 		void Message (char arg[])
; arg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
; arg end address is: 0 (R0)
; arg start address is: 16 (R4)
;InternalRTC.c,46 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,47 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,48 :: 		UART2_Write_Text(arg);
MOV	R0, R4
; arg end address is: 16 (R4)
BL	_UART2_Write_Text+0
;InternalRTC.c,49 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,50 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,51 :: 		}
L_end_Message:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Message
_RTC_Init:
;InternalRTC.c,63 :: 		void RTC_Init(){
;InternalRTC.c,64 :: 		RCC_APB1ENR|=0x10000000;                      // Enable Clock for RTC
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #268435456
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;InternalRTC.c,65 :: 		PWR_CR|=0x0100;                               // Access to RTC and RTC Backup registers and backup SRAM enabled
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
;InternalRTC.c,66 :: 		RCC_CSR|=0x01;                                // Wakeup flag
MOVW	R0, #lo_addr(RCC_CSR+0)
MOVT	R0, #hi_addr(RCC_CSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_CSR+0)
MOVT	R0, #hi_addr(RCC_CSR+0)
STR	R1, [R0, #0]
;InternalRTC.c,67 :: 		while(!(RCC_CSR&0x02));                       // 1: Device has been in Standby mode
L_RTC_Init0:
MOVW	R0, #lo_addr(RCC_CSR+0)
MOVT	R0, #hi_addr(RCC_CSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	NE
BNE	L_RTC_Init1
IT	AL
BAL	L_RTC_Init0
L_RTC_Init1:
;InternalRTC.c,70 :: 		RCC_BDCR|=0x00000200;                         // LSI oscillator clock used as the RTC clock
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
;InternalRTC.c,71 :: 		RCC_BDCR|=0x00008000;                         // RTC clock enabled
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
;InternalRTC.c,73 :: 		RTC_WPR=0xca;                                 // Write protection key
MOVS	R1, #202
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;InternalRTC.c,74 :: 		RTC_WPR=0x53;                                 // Write protection key
MOVS	R1, #83
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;InternalRTC.c,75 :: 		RTC_ISR&=0xffffffdf;                          //clear RSF flag
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R1, [R0, #0]
MVN	R0, #32
ANDS	R1, R0
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
;InternalRTC.c,76 :: 		while(!(RTC_ISR&0xffffffdf));                 // Calendar shadow registers not yet synchronized
L_RTC_Init2:
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R1, [R0, #0]
MVN	R0, #32
AND	R0, R1, R0, LSL #0
CMP	R0, #0
IT	NE
BNE	L_RTC_Init3
IT	AL
BAL	L_RTC_Init2
L_RTC_Init3:
;InternalRTC.c,78 :: 		RTC_ISR|=0x80;                                // Initialization mode
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
;InternalRTC.c,79 :: 		while((RTC_ISR&0x40)==0);                     // 1: Calendar registers update is allowed.
L_RTC_Init4:
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #64
CMP	R0, #0
IT	NE
BNE	L_RTC_Init5
IT	AL
BAL	L_RTC_Init4
L_RTC_Init5:
;InternalRTC.c,81 :: 		RTC_PRER|=0x007f0000;                         // RTC prescaler register
MOVW	R0, #lo_addr(RTC_PRER+0)
MOVT	R0, #hi_addr(RTC_PRER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8323072
MOVW	R0, #lo_addr(RTC_PRER+0)
MOVT	R0, #hi_addr(RTC_PRER+0)
STR	R1, [R0, #0]
;InternalRTC.c,82 :: 		RTC_PRER|=0x000000ff;
MOVW	R0, #lo_addr(RTC_PRER+0)
MOVT	R0, #hi_addr(RTC_PRER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #255
MOVW	R0, #lo_addr(RTC_PRER+0)
MOVT	R0, #hi_addr(RTC_PRER+0)
STR	R1, [R0, #0]
;InternalRTC.c,84 :: 		RTC_ISR&=~0x80;                               // 0: Free running mode
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
;InternalRTC.c,86 :: 		RTC_WPR=0xff;                                 // Write protection key
MOVS	R1, #255
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;InternalRTC.c,87 :: 		}
L_end_RTC_Init:
BX	LR
; end of _RTC_Init
_Calibrate_RTC_Crystal:
;InternalRTC.c,107 :: 		void Calibrate_RTC_Crystal (int Cal_Value)
; Cal_Value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Cal_Value end address is: 0 (R0)
; Cal_Value start address is: 0 (R0)
;InternalRTC.c,109 :: 		unsigned long          recalpfcount = 0;
; recalpfcount start address is: 8 (R2)
MOV	R2, #0
;InternalRTC.c,112 :: 		if (RTC_ISR.B16 == 1)
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
_LX	[R1, ByteOffset(RTC_ISR+0)]
CMP	R1, #0
IT	EQ
BEQ	L__Calibrate_RTC_Crystal36
; recalpfcount end address is: 8 (R2)
; Cal_Value end address is: 0 (R0)
;InternalRTC.c,115 :: 		while ((RTC_ISR.B16 == 1) && (recalpfcount < 131072))
L_Calibrate_RTC_Crystal7:
; recalpfcount start address is: 8 (R2)
; Cal_Value start address is: 0 (R0)
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
_LX	[R1, ByteOffset(RTC_ISR+0)]
CMP	R1, #0
IT	EQ
BEQ	L__Calibrate_RTC_Crystal35
CMP	R2, #131072
IT	CS
BCS	L__Calibrate_RTC_Crystal34
L__Calibrate_RTC_Crystal33:
;InternalRTC.c,116 :: 		recalpfcount++;
ADDS	R2, R2, #1
; recalpfcount end address is: 8 (R2)
IT	AL
BAL	L_Calibrate_RTC_Crystal7
;InternalRTC.c,115 :: 		while ((RTC_ISR.B16 == 1) && (recalpfcount < 131072))
L__Calibrate_RTC_Crystal35:
L__Calibrate_RTC_Crystal34:
;InternalRTC.c,117 :: 		}
IT	AL
BAL	L_Calibrate_RTC_Crystal6
; Cal_Value end address is: 0 (R0)
L__Calibrate_RTC_Crystal36:
;InternalRTC.c,112 :: 		if (RTC_ISR.B16 == 1)
;InternalRTC.c,117 :: 		}
L_Calibrate_RTC_Crystal6:
;InternalRTC.c,120 :: 		if (Cal_Value < 0)
; Cal_Value start address is: 0 (R0)
CMP	R0, #0
IT	GE
BGE	L_Calibrate_RTC_Crystal11
;InternalRTC.c,122 :: 		Cal_Value = abs(Cal_Value);
; Cal_Value end address is: 0 (R0)
BL	_abs+0
;InternalRTC.c,123 :: 		Cal_Value = Cal_Value / 2;
MOVS	R1, #2
SXTH	R1, R1
SDIV	R1, R0, R1
SXTH	R1, R1
;InternalRTC.c,124 :: 		Cal_Value = Cal_Value & 0x001F;                                        // Only use the bottom 5 bits.
AND	R3, R1, #31
;InternalRTC.c,125 :: 		RTC_CALIBRbits.DCS = 1;                                                // 1: Negative calibration: calendar update frequency is decreased
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_CALIBRbits+0)
MOVT	R1, #hi_addr(RTC_CALIBRbits+0)
_SX	[R1, ByteOffset(RTC_CALIBRbits+0)]
;InternalRTC.c,126 :: 		RTC_CALIBRbits.DC  = (short) Cal_Value;                                // DC[4:0]: Digital calibration
UXTB	R3, R3
MOVW	R2, #lo_addr(RTC_CALIBRbits+0)
MOVT	R2, #hi_addr(RTC_CALIBRbits+0)
LDRB	R1, [R2, #0]
BFI	R1, R3, #0, #5
STRB	R1, [R2, #0]
;InternalRTC.c,127 :: 		}
IT	AL
BAL	L_Calibrate_RTC_Crystal12
L_Calibrate_RTC_Crystal11:
;InternalRTC.c,130 :: 		Cal_Value = Cal_Value / 2;
; Cal_Value start address is: 0 (R0)
MOVS	R1, #2
SXTH	R1, R1
SDIV	R1, R0, R1
SXTH	R1, R1
; Cal_Value end address is: 0 (R0)
;InternalRTC.c,131 :: 		Cal_Value = Cal_Value & 0x001F;                                        // Only use the bottom 5 bits.
AND	R3, R1, #31
;InternalRTC.c,132 :: 		RTC_CALIBRbits.DCS = 0;                                                // 0: Positive calibration: calendar update frequency is increased
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_CALIBRbits+0)
MOVT	R1, #hi_addr(RTC_CALIBRbits+0)
_SX	[R1, ByteOffset(RTC_CALIBRbits+0)]
;InternalRTC.c,133 :: 		RTC_CALIBRbits.DC  = (short) Cal_Value;                                // DC[4:0]: Digital calibration
UXTB	R3, R3
MOVW	R2, #lo_addr(RTC_CALIBRbits+0)
MOVT	R2, #hi_addr(RTC_CALIBRbits+0)
LDRB	R1, [R2, #0]
BFI	R1, R3, #0, #5
STRB	R1, [R2, #0]
;InternalRTC.c,134 :: 		}
L_Calibrate_RTC_Crystal12:
;InternalRTC.c,136 :: 		}
L_end_Calibrate_RTC_Crystal:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate_RTC_Crystal
_Set_RTC:
;InternalRTC.c,145 :: 		void Set_RTC(TTime *RTCC_Time){
; RTCC_Time start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; RTCC_Time end address is: 0 (R0)
; RTCC_Time start address is: 0 (R0)
;InternalRTC.c,148 :: 		PWR_CR.DBP = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(PWR_CR+0)
MOVT	R1, #hi_addr(PWR_CR+0)
_SX	[R1, ByteOffset(PWR_CR+0)]
;InternalRTC.c,150 :: 		RTC_WPR = 0xCA;                   //unlock write protection
MOVS	R2, #202
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;InternalRTC.c,151 :: 		RTC_WPR = 0x53;                   //unlock write protection
MOVS	R2, #83
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;InternalRTC.c,152 :: 		RTC_ISR = 0x00000080;             //enter initialization mode  bit 7
MOVS	R2, #128
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
STR	R2, [R1, #0]
; RTCC_Time end address is: 0 (R0)
MOV	R4, R0
;InternalRTC.c,153 :: 		while(RTC_ISR.INITF != 1){};      // bit 6
L_Set_RTC13:
; RTCC_Time start address is: 16 (R4)
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
_LX	[R1, ByteOffset(RTC_ISR+0)]
CMP	R1, #0
IT	NE
BNE	L_Set_RTC14
IT	AL
BAL	L_Set_RTC13
L_Set_RTC14:
;InternalRTC.c,155 :: 		RTC_PRER = 0x7f00ff;              //  set   SynchPrediv to FF and AsynchPrediv to 7F*/
MOVW	R2, #255
MOVT	R2, #127
MOVW	R1, #lo_addr(RTC_PRER+0)
MOVT	R1, #hi_addr(RTC_PRER+0)
STR	R2, [R1, #0]
;InternalRTC.c,157 :: 		temp = (unsigned long)Dec2Bcd(RTCC_Time->hours) << 16;
ADDS	R1, R4, #3
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R5, R0
LSLS	R5, R5, #16
; temp start address is: 20 (R5)
;InternalRTC.c,158 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->minutes) << 8;
ADDS	R1, R4, #2
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
LSLS	R1, R1, #8
ADDS	R5, R5, R1
;InternalRTC.c,159 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->seconds);
ADDS	R1, R4, #1
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
ADDS	R2, R5, R1
; temp end address is: 20 (R5)
;InternalRTC.c,160 :: 		temp += (unsigned long)(RTCC_Time->ampm) << 22;
LDRSB	R1, [R4, #0]
LSLS	R1, R1, #22
ADDS	R2, R2, R1
;InternalRTC.c,162 :: 		RTC_TR = temp;
MOVW	R1, #lo_addr(RTC_TR+0)
MOVT	R1, #hi_addr(RTC_TR+0)
STR	R2, [R1, #0]
;InternalRTC.c,164 :: 		temp = (unsigned long)Dec2Bcd(RTCC_Time->day);
ADDS	R1, R4, #4
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R5, R0
; temp start address is: 20 (R5)
;InternalRTC.c,165 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->month) << 8;
ADDS	R1, R4, #5
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
LSLS	R1, R1, #8
ADDS	R5, R5, R1
;InternalRTC.c,166 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->weekday) << 13;
ADDS	R1, R4, #6
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
LSLS	R1, R1, #13
ADDS	R5, R5, R1
;InternalRTC.c,167 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->year) << 16;
ADDS	R1, R4, #7
; RTCC_Time end address is: 16 (R4)
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
LSLS	R1, R1, #16
ADDS	R2, R5, R1
; temp end address is: 20 (R5)
;InternalRTC.c,169 :: 		RTC_DR = temp;           // set date
MOVW	R1, #lo_addr(RTC_DR+0)
MOVT	R1, #hi_addr(RTC_DR+0)
STR	R2, [R1, #0]
;InternalRTC.c,170 :: 		RTC_CRbits.FMT = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_CRbits+0)
MOVT	R1, #hi_addr(RTC_CRbits+0)
_SX	[R1, ByteOffset(RTC_CRbits+0)]
;InternalRTC.c,171 :: 		RTC_CRbits.WCKSEL = 0;   // set FMT 24H format
MOVS	R3, #0
MOVW	R2, #lo_addr(RTC_CRbits+0)
MOVT	R2, #hi_addr(RTC_CRbits+0)
LDRB	R1, [R2, #0]
BFI	R1, R3, #0, #3
STRB	R1, [R2, #0]
;InternalRTC.c,173 :: 		RTC_ISR = 0x00000000;    //exit initialization mode
MOVS	R2, #0
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
STR	R2, [R1, #0]
;InternalRTC.c,175 :: 		RTC_WPR = 0xFF;          // Enable the write protection for RTC registers
MOVS	R2, #255
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;InternalRTC.c,176 :: 		}
L_end_Set_RTC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_RTC
_RTCC_Read:
;InternalRTC.c,185 :: 		char RTCC_Read(TTime *RTCC_Time){
; RTCC_Time start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R4, R0
; RTCC_Time end address is: 0 (R0)
; RTCC_Time start address is: 16 (R4)
;InternalRTC.c,186 :: 		char temp = 0;
; temp start address is: 0 (R0)
MOVS	R0, #0
;InternalRTC.c,189 :: 		RTC_Time = RTC_TR;       // RTC_CNTL; //for time   for STM32F107
MOVW	R1, #lo_addr(RTC_TR+0)
MOVT	R1, #hi_addr(RTC_TR+0)
LDR	R1, [R1, #0]
MOVW	R3, #lo_addr(_RTC_Time+0)
MOVT	R3, #hi_addr(_RTC_Time+0)
STR	R1, [R3, #0]
;InternalRTC.c,190 :: 		RTC_Date = RTC_DR;       // RTC_CNTH; //for date   for STM32F107
MOVW	R1, #lo_addr(RTC_DR+0)
MOVT	R1, #hi_addr(RTC_DR+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_RTC_Date+0)
MOVT	R1, #hi_addr(_RTC_Date+0)
STR	R2, [R1, #0]
;InternalRTC.c,192 :: 		if(RTC_Time != old_RTC_Time){
MOVW	R1, #lo_addr(_old_RTC_Time+0)
MOVT	R1, #hi_addr(_old_RTC_Time+0)
LDR	R2, [R1, #0]
MOV	R1, R3
LDR	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__RTCC_Read37
; temp end address is: 0 (R0)
;InternalRTC.c,193 :: 		old_RTC_Time = RTC_Time;
MOVW	R3, #lo_addr(_RTC_Time+0)
MOVT	R3, #hi_addr(_RTC_Time+0)
LDR	R2, [R3, #0]
MOVW	R1, #lo_addr(_old_RTC_Time+0)
MOVT	R1, #hi_addr(_old_RTC_Time+0)
STR	R2, [R1, #0]
;InternalRTC.c,195 :: 		RTCC_Time->ampm = (short)((RTC_Time & 0x400000) >> 22);
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #4194304
LSRS	R1, R1, #22
SXTB	R1, R1
STRB	R1, [R4, #0]
;InternalRTC.c,196 :: 		RTCC_Time->hours = Bcd2Dec((short)((RTC_Time & 0x3f0000) >> 16));
ADDS	R1, R4, #3
STR	R1, [SP, #4]
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #4128768
LSRS	R1, R1, #16
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;InternalRTC.c,197 :: 		RTCC_Time->minutes = Bcd2Dec((short)((RTC_Time & 0x007f00) >> 8));
ADDS	R1, R4, #2
STR	R1, [SP, #4]
MOVW	R1, #lo_addr(_RTC_Time+0)
MOVT	R1, #hi_addr(_RTC_Time+0)
LDR	R1, [R1, #0]
AND	R1, R1, #32512
LSRS	R1, R1, #8
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;InternalRTC.c,198 :: 		RTCC_Time->seconds = Bcd2Dec((short)(RTC_Time & 0x0000ff));
ADDS	R1, R4, #1
STR	R1, [SP, #4]
MOVW	R1, #lo_addr(_RTC_Time+0)
MOVT	R1, #hi_addr(_RTC_Time+0)
LDR	R1, [R1, #0]
AND	R1, R1, #255
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;InternalRTC.c,200 :: 		temp = 1;
; temp start address is: 0 (R0)
MOVS	R0, #1
; temp end address is: 0 (R0)
;InternalRTC.c,201 :: 		}
IT	AL
BAL	L_RTCC_Read15
L__RTCC_Read37:
;InternalRTC.c,192 :: 		if(RTC_Time != old_RTC_Time){
;InternalRTC.c,201 :: 		}
L_RTCC_Read15:
;InternalRTC.c,203 :: 		if(RTC_Date != old_RTC_Date){
; temp start address is: 0 (R0)
MOVW	R1, #lo_addr(_old_RTC_Date+0)
MOVT	R1, #hi_addr(_old_RTC_Date+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_RTC_Date+0)
MOVT	R1, #hi_addr(_RTC_Date+0)
LDR	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__RTCC_Read38
; temp end address is: 0 (R0)
;InternalRTC.c,204 :: 		old_RTC_Date = RTC_Date;
MOVW	R3, #lo_addr(_RTC_Date+0)
MOVT	R3, #hi_addr(_RTC_Date+0)
LDR	R2, [R3, #0]
MOVW	R1, #lo_addr(_old_RTC_Date+0)
MOVT	R1, #hi_addr(_old_RTC_Date+0)
STR	R2, [R1, #0]
;InternalRTC.c,206 :: 		RTCC_Time->year = Bcd2Dec((short)((RTC_Date & 0x3f0000) >> 16));
ADDS	R1, R4, #7
STR	R1, [SP, #4]
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #4128768
LSRS	R1, R1, #16
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;InternalRTC.c,207 :: 		RTCC_Time->weekday = Bcd2Dec((short)((RTC_Date & 0x00e000) >> 13));
ADDS	R1, R4, #6
STR	R1, [SP, #4]
MOVW	R1, #lo_addr(_RTC_Date+0)
MOVT	R1, #hi_addr(_RTC_Date+0)
LDR	R1, [R1, #0]
AND	R1, R1, #57344
LSRS	R1, R1, #13
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;InternalRTC.c,208 :: 		RTCC_Time->month = Bcd2Dec((short)((RTC_Date & 0x00001F00) >> 8));
ADDS	R1, R4, #5
STR	R1, [SP, #4]
MOVW	R1, #lo_addr(_RTC_Date+0)
MOVT	R1, #hi_addr(_RTC_Date+0)
LDR	R1, [R1, #0]
AND	R1, R1, #7936
LSRS	R1, R1, #8
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;InternalRTC.c,209 :: 		RTCC_Time->day = Bcd2Dec((short)(RTC_Date & 0x0000ff));
ADDS	R1, R4, #4
; RTCC_Time end address is: 16 (R4)
STR	R1, [SP, #4]
MOVW	R1, #lo_addr(_RTC_Date+0)
MOVT	R1, #hi_addr(_RTC_Date+0)
LDR	R1, [R1, #0]
AND	R1, R1, #255
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;InternalRTC.c,211 :: 		temp = 1;
; temp start address is: 0 (R0)
MOVS	R0, #1
; temp end address is: 0 (R0)
;InternalRTC.c,212 :: 		}
IT	AL
BAL	L_RTCC_Read16
L__RTCC_Read38:
;InternalRTC.c,203 :: 		if(RTC_Date != old_RTC_Date){
;InternalRTC.c,212 :: 		}
L_RTCC_Read16:
;InternalRTC.c,213 :: 		return temp;
; temp start address is: 0 (R0)
; temp end address is: 0 (R0)
;InternalRTC.c,214 :: 		}
L_end_RTCC_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTCC_Read
_RTC_GetSubSeconds:
;InternalRTC.c,223 :: 		unsigned RTC_GetSubSeconds (void)
;InternalRTC.c,229 :: 		Temp_RTC_SSR = RTC_SSR;
MOVW	R0, #lo_addr(RTC_SSR+0)
MOVT	R0, #hi_addr(RTC_SSR+0)
; Temp_RTC_SSR start address is: 8 (R2)
LDR	R2, [R0, #0]
;InternalRTC.c,234 :: 		Temp_RTC_SSR = Temp_RTC_SSR & 0x0000FFFF;
MOVW	R0, #65535
AND	R1, R2, R0, LSL #0
; Temp_RTC_SSR end address is: 8 (R2)
;InternalRTC.c,235 :: 		Temp_float = (1000 * ((float) RTC_PRERbits.PREDIV_S - (float) Temp_RTC_SSR) / ((float) RTC_PRERbits.PREDIV_S + 1));
MOVW	R0, #lo_addr(RTC_PRERbits+0)
MOVT	R0, #hi_addr(RTC_PRERbits+0)
LDRH	R0, [R0, #0]
UBFX	R0, R0, #0, #15
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMOV	S0, R1
VCVT.F32	#0, S0, S0
VSUB.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17530
VMOV	S0, R0
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(RTC_PRERbits+0)
MOVT	R0, #hi_addr(RTC_PRERbits+0)
LDRH	R0, [R0, #0]
UBFX	R0, R0, #0, #15
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMOV.F32	S0, #1
VADD.F32	S0, S1, S0
VDIV.F32	S0, S2, S0
;InternalRTC.c,237 :: 		return (unsigned) Temp_float;
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
;InternalRTC.c,238 :: 		}
L_end_RTC_GetSubSeconds:
BX	LR
; end of _RTC_GetSubSeconds
_RTC_GetTime:
;InternalRTC.c,246 :: 		void RTC_GetTime(RTC_TimeTypeDef *RTC_TimeStruct)
; RTC_TimeStruct start address is: 0 (R0)
; RTC_TimeStruct end address is: 0 (R0)
; RTC_TimeStruct start address is: 0 (R0)
;InternalRTC.c,249 :: 		RTC_TimeStruct->RTC_H12         =  (unsigned short) RTC_TRbits.PM;
ADDS	R2, R0, #6
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
_LX	[R1, ByteOffset(RTC_TRbits+0)]
_SX	[R2, ByteOffset(#0)]
;InternalRTC.c,250 :: 		RTC_TimeStruct->RTC_Hour_Tens   =  (unsigned short) RTC_TRbits.HT;
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #20, #2
UXTB	R1, R1
STRB	R1, [R0, #0]
;InternalRTC.c,251 :: 		RTC_TimeStruct->RTC_Hour_Units  =  (unsigned short) RTC_TRbits.HU;
ADDS	R2, R0, #1
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #16, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,252 :: 		RTC_TimeStruct->RTC_Min_Tens    =  (unsigned short) RTC_TRbits.MNT;
ADDS	R2, R0, #2
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #12, #3
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,253 :: 		RTC_TimeStruct->RTC_Min_Units   =  (unsigned short) RTC_TRbits.MNU;
ADDS	R2, R0, #3
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #8, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,254 :: 		RTC_TimeStruct->RTC_Sec_Tens    =  (unsigned short) RTC_TRbits.ST;
ADDS	R2, R0, #4
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #4, #3
STRB	R1, [R2, #0]
;InternalRTC.c,255 :: 		RTC_TimeStruct->RTC_Sec_Units   =  (unsigned short) RTC_TRbits.SU;
ADDS	R2, R0, #5
; RTC_TimeStruct end address is: 0 (R0)
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #0, #4
STRB	R1, [R2, #0]
;InternalRTC.c,256 :: 		}
L_end_RTC_GetTime:
BX	LR
; end of _RTC_GetTime
_RTC_GetDate:
;InternalRTC.c,265 :: 		void RTC_GetDate(RTC_DateTypeDef *RTC_DateStruct)
; RTC_DateStruct start address is: 0 (R0)
; RTC_DateStruct end address is: 0 (R0)
; RTC_DateStruct start address is: 0 (R0)
;InternalRTC.c,268 :: 		RTC_DateStruct->RTC_DayofWeek     =  (unsigned short) RTC_DRbits.WDU;
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #13, #3
UXTB	R1, R1
STRB	R1, [R0, #0]
;InternalRTC.c,269 :: 		RTC_DateStruct->RTC_Date_Tens     =  (unsigned short) RTC_DRbits.DT;
ADDS	R2, R0, #1
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #4, #2
STRB	R1, [R2, #0]
;InternalRTC.c,270 :: 		RTC_DateStruct->RTC_Date_Units    =  (unsigned short) RTC_DRbits.DU;
ADDS	R2, R0, #2
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #0, #4
STRB	R1, [R2, #0]
;InternalRTC.c,271 :: 		RTC_DateStruct->RTC_Month_Tens    =  (unsigned short) RTC_DRbits.MT;
ADDS	R2, R0, #3
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
_LX	[R1, ByteOffset(RTC_DRbits+0)]
_SX	[R2, ByteOffset(#0)]
;InternalRTC.c,272 :: 		RTC_DateStruct->RTC_Month_Units   =  (unsigned short) RTC_DRbits.MU;
ADDS	R2, R0, #4
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #8, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,273 :: 		RTC_DateStruct->RTC_Year_Tens     =  (unsigned short) RTC_DRbits.YT;
ADDS	R2, R0, #5
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #20, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,274 :: 		RTC_DateStruct->RTC_Year_Units    =  (unsigned short) RTC_DRbits.YU;
ADDS	R2, R0, #6
; RTC_DateStruct end address is: 0 (R0)
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #16, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,275 :: 		}
L_end_RTC_GetDate:
BX	LR
; end of _RTC_GetDate
_RTC_PrintTime:
;InternalRTC.c,285 :: 		void RTC_PrintTime(RTC_TimeTypeDef *RTC_TimeStruct)
; RTC_TimeStruct start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R7, R0
; RTC_TimeStruct end address is: 0 (R0)
; RTC_TimeStruct start address is: 28 (R7)
;InternalRTC.c,289 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,290 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,291 :: 		ByteToStr(RTC_TimeStruct->RTC_Hour_Tens, txt);
ADD	R2, SP, #4
LDRB	R1, [R7, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,292 :: 		UART2_Write_Text(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,293 :: 		ByteToStr(RTC_TimeStruct->RTC_Hour_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,294 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,295 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,296 :: 		UART2_Write_Text(":");
MOVW	R1, #lo_addr(?lstr1_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr1_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,297 :: 		ByteToStr(RTC_TimeStruct->RTC_Min_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #2
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,298 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,299 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,300 :: 		ByteToStr(RTC_TimeStruct->RTC_Min_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #3
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,301 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,302 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,303 :: 		UART2_Write_Text(":");
MOVW	R1, #lo_addr(?lstr2_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr2_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,304 :: 		ByteToStr(RTC_TimeStruct->RTC_Sec_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #4
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,305 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,306 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,307 :: 		ByteToStr(RTC_TimeStruct->RTC_Sec_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #5
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,308 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,309 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,311 :: 		if (RTC_TimeStruct->RTC_H12)
ADDS	R1, R7, #6
; RTC_TimeStruct end address is: 28 (R7)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_RTC_PrintTime17
;InternalRTC.c,312 :: 		UART2_Write_Text(" pm");
MOVW	R1, #lo_addr(?lstr3_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr3_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintTime18
L_RTC_PrintTime17:
;InternalRTC.c,314 :: 		UART2_Write_Text(" am");
MOVW	R1, #lo_addr(?lstr4_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr4_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
L_RTC_PrintTime18:
;InternalRTC.c,316 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,317 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,318 :: 		}
L_end_RTC_PrintTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_PrintTime
_RTC_PrintDate:
;InternalRTC.c,327 :: 		void RTC_PrintDate(RTC_DateTypeDef *RTC_DateStruct)
; RTC_DateStruct start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R7, R0
; RTC_DateStruct end address is: 0 (R0)
; RTC_DateStruct start address is: 28 (R7)
;InternalRTC.c,334 :: 		Temp_Day = RTC_DateStruct->RTC_DayofWeek;
LDRB	R1, [R7, #0]
; Temp_Day start address is: 16 (R4)
UXTB	R4, R1
;InternalRTC.c,336 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,337 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,339 :: 		switch (Temp_Day)  {
IT	AL
BAL	L_RTC_PrintDate19
; Temp_Day end address is: 16 (R4)
;InternalRTC.c,340 :: 		case 1 : UART2_Write_Text("  Mon");  break;
L_RTC_PrintDate21:
MOVW	R1, #lo_addr(?lstr5_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr5_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate20
;InternalRTC.c,341 :: 		case 2 : UART2_Write_Text("  Tue");  break;
L_RTC_PrintDate22:
MOVW	R1, #lo_addr(?lstr6_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr6_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate20
;InternalRTC.c,342 :: 		case 3 : UART2_Write_Text("  Wed");  break;
L_RTC_PrintDate23:
MOVW	R1, #lo_addr(?lstr7_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr7_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate20
;InternalRTC.c,343 :: 		case 4 : UART2_Write_Text("  Thu");  break;
L_RTC_PrintDate24:
MOVW	R1, #lo_addr(?lstr8_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr8_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate20
;InternalRTC.c,344 :: 		case 5 : UART2_Write_Text("  Fri");  break;
L_RTC_PrintDate25:
MOVW	R1, #lo_addr(?lstr9_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr9_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate20
;InternalRTC.c,345 :: 		case 6 : UART2_Write_Text("  Sat");  break;
L_RTC_PrintDate26:
MOVW	R1, #lo_addr(?lstr10_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr10_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate20
;InternalRTC.c,346 :: 		case 7 : UART2_Write_Text("  Sun");  break;
L_RTC_PrintDate27:
MOVW	R1, #lo_addr(?lstr11_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr11_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate20
;InternalRTC.c,347 :: 		}
L_RTC_PrintDate19:
; Temp_Day start address is: 16 (R4)
CMP	R4, #1
IT	EQ
BEQ	L_RTC_PrintDate21
CMP	R4, #2
IT	EQ
BEQ	L_RTC_PrintDate22
CMP	R4, #3
IT	EQ
BEQ	L_RTC_PrintDate23
CMP	R4, #4
IT	EQ
BEQ	L_RTC_PrintDate24
CMP	R4, #5
IT	EQ
BEQ	L_RTC_PrintDate25
CMP	R4, #6
IT	EQ
BEQ	L_RTC_PrintDate26
CMP	R4, #7
IT	EQ
BEQ	L_RTC_PrintDate27
; Temp_Day end address is: 16 (R4)
L_RTC_PrintDate20:
;InternalRTC.c,349 :: 		ByteToStr(RTC_DateStruct->RTC_Date_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,350 :: 		UART2_Write_Text(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,351 :: 		ByteToStr(RTC_DateStruct->RTC_Date_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #2
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,352 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,353 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,354 :: 		UART2_Write_Text("/");
MOVW	R1, #lo_addr(?lstr12_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr12_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,355 :: 		ByteToStr(RTC_DateStruct->RTC_Month_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #3
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,356 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,357 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,358 :: 		ByteToStr(RTC_DateStruct->RTC_Month_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #4
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,359 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,360 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,361 :: 		UART2_Write_Text("/");
MOVW	R1, #lo_addr(?lstr13_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr13_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,362 :: 		ByteToStr(RTC_DateStruct->RTC_Year_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #5
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,363 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,364 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,365 :: 		ByteToStr(RTC_DateStruct->RTC_Year_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #6
; RTC_DateStruct end address is: 28 (R7)
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,366 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R3, SP, #4
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,367 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,369 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,370 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,372 :: 		}
L_end_RTC_PrintDate:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_PrintDate
_Print_Sub_Secs:
;InternalRTC.c,381 :: 		void Print_Sub_Secs (unsigned Value)
; Value start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Value end address is: 0 (R0)
; Value start address is: 0 (R0)
;InternalRTC.c,384 :: 		WordToStr(Value, txt);
ADD	R1, SP, #4
; Value end address is: 0 (R0)
BL	_WordToStr+0
;InternalRTC.c,385 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,386 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,387 :: 		UART2_Write_Text(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,388 :: 		UART2_Write_Text("  ms");
MOVW	R1, #lo_addr(?lstr14_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr14_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,389 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,390 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,391 :: 		}
L_end_Print_Sub_Secs:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Print_Sub_Secs
_Set_MyRTCC:
;InternalRTC.c,464 :: 		char Set_MyRTCC(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;InternalRTC.c,471 :: 		RTCC_Read(&MyTime);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_RTCC_Read+0
;InternalRTC.c,473 :: 		MyTime.hours = tenHour * 10 + oneHour;
MOVW	R0, #lo_addr(_tenHour+0)
MOVT	R0, #hi_addr(_tenHour+0)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
MULS	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_oneHour+0)
MOVT	R0, #hi_addr(_oneHour+0)
LDRSB	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
STRB	R1, [R0, #0]
;InternalRTC.c,474 :: 		MyTime.minutes = tenMinute * 10 + oneMinute;
MOVW	R0, #lo_addr(_tenMinute+0)
MOVT	R0, #hi_addr(_tenMinute+0)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
MULS	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_oneMinute+0)
MOVT	R0, #hi_addr(_oneMinute+0)
LDRSB	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
STRB	R1, [R0, #0]
;InternalRTC.c,475 :: 		MyTime.day = tenDayU * 10 + oneDayU;
MOVW	R0, #lo_addr(_tenDayU+0)
MOVT	R0, #hi_addr(_tenDayU+0)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
MULS	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_oneDayU+0)
MOVT	R0, #hi_addr(_oneDayU+0)
LDRSB	R0, [R0, #0]
ADDS	R0, R1, R0
MOVW	R4, #lo_addr(_MyTime+4)
MOVT	R4, #hi_addr(_MyTime+4)
STRB	R0, [R4, #0]
;InternalRTC.c,476 :: 		MyTime.month = oneMonth;
MOVW	R0, #lo_addr(_oneMonth+0)
MOVT	R0, #hi_addr(_oneMonth+0)
LDRSB	R0, [R0, #0]
MOVW	R3, #lo_addr(_MyTime+5)
MOVT	R3, #hi_addr(_MyTime+5)
STRB	R0, [R3, #0]
;InternalRTC.c,477 :: 		MyTime.year = tenYearU*10 + oneYearU;
MOVW	R0, #lo_addr(_tenYearU+0)
MOVT	R0, #hi_addr(_tenYearU+0)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
MULS	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_oneYearU+0)
MOVT	R0, #hi_addr(_oneYearU+0)
LDRSB	R0, [R0, #0]
ADDS	R0, R1, R0
MOVW	R2, #lo_addr(_MyTime+7)
MOVT	R2, #hi_addr(_MyTime+7)
STRB	R0, [R2, #0]
;InternalRTC.c,478 :: 		MyTime.ampm = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
STRB	R1, [R0, #0]
;InternalRTC.c,479 :: 		a = (14 - MyTime.month) / 12;
MOV	R0, R3
LDRSB	R0, [R0, #0]
RSB	R1, R0, #14
SXTH	R1, R1
MOVS	R0, #12
SXTH	R0, R0
SDIV	R1, R1, R0
SXTH	R1, R1
;InternalRTC.c,480 :: 		y = MyTime.year - a;
MOV	R0, R2
LDRSB	R0, [R0, #0]
SUB	R2, R0, R1
SXTH	R2, R2
;InternalRTC.c,481 :: 		m = MyTime.month + 12 * a - 2;
MOVS	R0, #12
SXTH	R0, R0
MULS	R1, R0, R1
SXTH	R1, R1
MOV	R0, R3
LDRSB	R0, [R0, #0]
ADDS	R0, R0, R1
SXTH	R0, R0
SUBS	R3, R0, #2
SXTH	R3, R3
;InternalRTC.c,482 :: 		finalDayOfWeek = (short)((7000 + (MyTime.day + y + y / 4 - y / 100 + y / 400 + (31 * m) / 12)) % 7);  // calculate date of week
MOV	R0, R4
LDRSB	R0, [R0, #0]
ADDS	R1, R0, R2
SXTH	R1, R1
MOVS	R0, #4
SXTH	R0, R0
SDIV	R0, R2, R0
SXTH	R0, R0
ADDS	R1, R1, R0
SXTH	R1, R1
MOVS	R0, #100
SXTH	R0, R0
SDIV	R0, R2, R0
SXTH	R0, R0
SUB	R1, R1, R0
SXTH	R1, R1
MOVW	R0, #400
SXTH	R0, R0
SDIV	R0, R2, R0
SXTH	R0, R0
ADDS	R2, R1, R0
SXTH	R2, R2
MOVS	R0, #31
SXTH	R0, R0
MUL	R1, R0, R3
SXTH	R1, R1
MOVS	R0, #12
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
ADDS	R1, R2, R0
SXTH	R1, R1
MOVW	R0, #7000
SXTH	R0, R0
ADDS	R2, R0, R1
SXTH	R2, R2
MOVS	R1, #7
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
; finalDayOfWeek start address is: 4 (R1)
SXTB	R1, R0
;InternalRTC.c,483 :: 		switch(finalDayOfWeek){
IT	AL
BAL	L_Set_MyRTCC28
; finalDayOfWeek end address is: 4 (R1)
;InternalRTC.c,484 :: 		case 0:{
L_Set_MyRTCC30:
;InternalRTC.c,485 :: 		finalDayOfWeek = 7;
; finalDayOfWeek start address is: 4 (R1)
MOVS	R1, #7
SXTB	R1, R1
;InternalRTC.c,486 :: 		break;
IT	AL
BAL	L_Set_MyRTCC29
;InternalRTC.c,488 :: 		}
L_Set_MyRTCC28:
CMP	R1, #0
IT	EQ
BEQ	L_Set_MyRTCC30
; finalDayOfWeek end address is: 4 (R1)
L_Set_MyRTCC29:
;InternalRTC.c,489 :: 		MyTime.weekday = finalDayOfWeek;
; finalDayOfWeek start address is: 4 (R1)
MOVW	R0, #lo_addr(_MyTime+6)
MOVT	R0, #hi_addr(_MyTime+6)
STRB	R1, [R0, #0]
; finalDayOfWeek end address is: 4 (R1)
;InternalRTC.c,491 :: 		Set_RTC(&MyTime);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_Set_RTC+0
;InternalRTC.c,492 :: 		if (MyTime.day == 0)
MOVW	R0, #lo_addr(_MyTime+4)
MOVT	R0, #hi_addr(_MyTime+4)
LDRSB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Set_MyRTCC31
;InternalRTC.c,493 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_Set_MyRTCC
L_Set_MyRTCC31:
;InternalRTC.c,494 :: 		if (MyTime.year > 30)
MOVW	R0, #lo_addr(_MyTime+7)
MOVT	R0, #hi_addr(_MyTime+7)
LDRSB	R0, [R0, #0]
CMP	R0, #30
IT	LE
BLE	L_Set_MyRTCC32
;InternalRTC.c,495 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_Set_MyRTCC
L_Set_MyRTCC32:
;InternalRTC.c,496 :: 		return 1;
MOVS	R0, #1
;InternalRTC.c,497 :: 		}
L_end_Set_MyRTCC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_MyRTCC
