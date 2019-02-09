_Message:
;InternalRTC.c,31 :: 		void Message (char arg[])
; arg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
; arg end address is: 0 (R0)
; arg start address is: 16 (R4)
;InternalRTC.c,33 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,34 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,35 :: 		UART2_Write_Text(arg);
MOV	R0, R4
; arg end address is: 16 (R4)
BL	_UART2_Write_Text+0
;InternalRTC.c,36 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,37 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,38 :: 		}
L_end_Message:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Message
_RTC_Init:
;InternalRTC.c,50 :: 		short RTC_Init (unsigned PREDIV_Sync, unsigned short PREDIV_Async, int HR_Format)
; HR_Format start address is: 8 (R2)
; PREDIV_Async start address is: 4 (R1)
; PREDIV_Sync start address is: 0 (R0)
; HR_Format end address is: 8 (R2)
; PREDIV_Async end address is: 4 (R1)
; PREDIV_Sync end address is: 0 (R0)
; PREDIV_Sync start address is: 0 (R0)
; PREDIV_Async start address is: 4 (R1)
; HR_Format start address is: 8 (R2)
;InternalRTC.c,52 :: 		unsigned short   RTC_Wait_ctr = 0;
; RTC_Wait_ctr start address is: 28 (R7)
MOVS	R7, #0
;InternalRTC.c,56 :: 		PWREN_bit = 1;                                                              // PWREN: Power interface clock enable.      (RCC APB1 peripheral clock enable register (RCC_APB1ENR))
MOVS	R6, #1
SXTB	R6, R6
MOVW	R3, #lo_addr(PWREN_bit+0)
MOVT	R3, #hi_addr(PWREN_bit+0)
STR	R6, [R3, #0]
;InternalRTC.c,57 :: 		DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))
MOVW	R5, #lo_addr(DBP_bit+0)
MOVT	R5, #hi_addr(DBP_bit+0)
STR	R6, [R5, #0]
;InternalRTC.c,58 :: 		RTCSEL1_bit = 0;  RTCSEL0_bit = 1;                                          // RTC Clock MUX select LSE as clock source. (RCC Backup domain control register (RCC_BDCR))
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(RTCSEL1_bit+0)
MOVT	R3, #hi_addr(RTCSEL1_bit+0)
STR	R4, [R3, #0]
MOVW	R3, #lo_addr(RTCSEL0_bit+0)
MOVT	R3, #hi_addr(RTCSEL0_bit+0)
STR	R6, [R3, #0]
;InternalRTC.c,59 :: 		LSEBYP_bit = 0;                                                             // LSE oscillator not bypassed.              (RCC Backup domain control register (RCC_BDCR))
MOVW	R3, #lo_addr(LSEBYP_bit+0)
MOVT	R3, #hi_addr(LSEBYP_bit+0)
STR	R4, [R3, #0]
;InternalRTC.c,60 :: 		LSEON_bit = 1;                                                              // External low-speed oscillator enable.     (RCC Backup domain control register (RCC_BDCR))
MOVW	R3, #lo_addr(LSEON_bit+0)
MOVT	R3, #hi_addr(LSEON_bit+0)
STR	R6, [R3, #0]
;InternalRTC.c,61 :: 		RTCEN_bit = 1;                                                              // RTC clock enabled.                        (RCC Backup domain control register (RCC_BDCR))
MOVW	R3, #lo_addr(RTCEN_bit+0)
MOVT	R3, #hi_addr(RTCEN_bit+0)
STR	R6, [R3, #0]
;InternalRTC.c,65 :: 		DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))
STR	R6, [R5, #0]
;InternalRTC.c,66 :: 		RTC_WPR = 0xCA;
MOVS	R4, #202
MOVW	R3, #lo_addr(RTC_WPR+0)
MOVT	R3, #hi_addr(RTC_WPR+0)
STR	R4, [R3, #0]
;InternalRTC.c,67 :: 		RTC_WPR = 0x53;
MOVS	R4, #83
MOVW	R3, #lo_addr(RTC_WPR+0)
MOVT	R3, #hi_addr(RTC_WPR+0)
STR	R4, [R3, #0]
; PREDIV_Sync end address is: 0 (R0)
; HR_Format end address is: 8 (R2)
; RTC_Wait_ctr end address is: 28 (R7)
; PREDIV_Async end address is: 4 (R1)
UXTH	R5, R0
SXTH	R0, R2
UXTB	R2, R1
UXTB	R1, R7
;InternalRTC.c,70 :: 		while ((LSERDY_bit == 0) && (RTC_Wait_ctr < 150));
L_RTC_Init0:
; RTC_Wait_ctr start address is: 4 (R1)
; RTC_Wait_ctr start address is: 4 (R1)
; RTC_Wait_ctr end address is: 4 (R1)
; HR_Format start address is: 0 (R0)
; PREDIV_Async start address is: 8 (R2)
; PREDIV_Sync start address is: 20 (R5)
MOVW	R4, #lo_addr(LSERDY_bit+0)
MOVT	R4, #hi_addr(LSERDY_bit+0)
LDR	R3, [R4, #0]
CMP	R3, #0
IT	NE
BNE	L__RTC_Init51
; RTC_Wait_ctr end address is: 4 (R1)
; RTC_Wait_ctr start address is: 4 (R1)
CMP	R1, #150
IT	CS
BCS	L__RTC_Init50
L__RTC_Init49:
; RTC_Wait_ctr end address is: 4 (R1)
IT	AL
BAL	L_RTC_Init0
L__RTC_Init51:
L__RTC_Init50:
;InternalRTC.c,72 :: 		delay_us(1);
MOVW	R7, #48
MOVT	R7, #0
NOP
NOP
L_RTC_Init4:
SUBS	R7, R7, #1
BNE	L_RTC_Init4
NOP
NOP
NOP
;InternalRTC.c,79 :: 		RTC_Wait_ctr = 0;
; RTC_Wait_ctr start address is: 4 (R1)
MOVS	R1, #0
;InternalRTC.c,83 :: 		if (INITF_bit == 0)
MOVW	R4, #lo_addr(INITF_bit+0)
MOVT	R4, #hi_addr(INITF_bit+0)
LDR	R3, [R4, #0]
CMP	R3, #0
IT	NE
BNE	L__RTC_Init54
;InternalRTC.c,85 :: 		RTC_ISR.B7 = 1;                                                        //  INIT Enter Initialization mode.                (RTC initialization and status register (RTC_ISR))
MOVS	R4, #1
SXTB	R4, R4
MOVW	R3, #lo_addr(RTC_ISR+0)
MOVT	R3, #hi_addr(RTC_ISR+0)
STR	R4, [R3, #0]
; PREDIV_Sync end address is: 20 (R5)
; PREDIV_Async end address is: 8 (R2)
; RTC_Wait_ctr end address is: 4 (R1)
; HR_Format end address is: 0 (R0)
;InternalRTC.c,86 :: 		while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
L_RTC_Init7:
; RTC_Wait_ctr start address is: 4 (R1)
; PREDIV_Sync start address is: 20 (R5)
; PREDIV_Async start address is: 8 (R2)
; HR_Format start address is: 0 (R0)
MOVW	R4, #lo_addr(INITF_bit+0)
MOVT	R4, #hi_addr(INITF_bit+0)
LDR	R3, [R4, #0]
CMP	R3, #0
IT	NE
BNE	L__RTC_Init53
CMP	R1, #8
IT	CS
BCS	L__RTC_Init52
L__RTC_Init48:
;InternalRTC.c,88 :: 		delay_us(10);                                                      //  to 2 RTCCLK clock cycles (due to clocks synchronization).
MOVW	R7, #498
MOVT	R7, #0
NOP
NOP
L_RTC_Init11:
SUBS	R7, R7, #1
BNE	L_RTC_Init11
NOP
NOP
NOP
;InternalRTC.c,89 :: 		RTC_Wait_ctr++;                                                    //  RTCCLK = 32768 Hz  --> approx 60us delay
ADDS	R1, R1, #1
UXTB	R1, R1
;InternalRTC.c,90 :: 		}                                                                      //  We shall wait 80 us just to make sure ;)
; RTC_Wait_ctr end address is: 4 (R1)
IT	AL
BAL	L_RTC_Init7
;InternalRTC.c,86 :: 		while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
L__RTC_Init53:
L__RTC_Init52:
;InternalRTC.c,92 :: 		if (INITF_bit == 0)
MOVW	R4, #lo_addr(INITF_bit+0)
MOVT	R4, #hi_addr(INITF_bit+0)
LDR	R3, [R4, #0]
CMP	R3, #0
IT	NE
BNE	L_RTC_Init13
; PREDIV_Sync end address is: 20 (R5)
; PREDIV_Async end address is: 8 (R2)
; HR_Format end address is: 0 (R0)
;InternalRTC.c,95 :: 		RTC_ISR.B7 = 0;                                                    // INIT Exit Initialization mode.                (RTC initialization and status register (RTC_ISR))
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(RTC_ISR+0)
MOVT	R3, #hi_addr(RTC_ISR+0)
STR	R4, [R3, #0]
;InternalRTC.c,96 :: 		RTC_WPR = 0xFF;                                                    // Enable the write protection for RTC registers
MOVS	R4, #255
MOVW	R3, #lo_addr(RTC_WPR+0)
MOVT	R3, #hi_addr(RTC_WPR+0)
STR	R4, [R3, #0]
;InternalRTC.c,97 :: 		return 0;                                                          // Failed to update RTC registers
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_RTC_Init
;InternalRTC.c,98 :: 		}
L_RTC_Init13:
;InternalRTC.c,99 :: 		}
; HR_Format start address is: 0 (R0)
; PREDIV_Async start address is: 8 (R2)
; PREDIV_Sync start address is: 20 (R5)
; PREDIV_Async end address is: 8 (R2)
; HR_Format end address is: 0 (R0)
UXTB	R1, R2
UXTH	R2, R5
IT	AL
BAL	L_RTC_Init6
; PREDIV_Sync end address is: 20 (R5)
L__RTC_Init54:
;InternalRTC.c,83 :: 		if (INITF_bit == 0)
UXTB	R1, R2
UXTH	R2, R5
;InternalRTC.c,99 :: 		}
L_RTC_Init6:
;InternalRTC.c,102 :: 		RTC_PRERbits.PREDIV_S = PREDIV_Sync;
; PREDIV_Sync start address is: 8 (R2)
; PREDIV_Async start address is: 4 (R1)
; HR_Format start address is: 0 (R0)
UXTH	R5, R2
; PREDIV_Sync end address is: 8 (R2)
MOVW	R4, #lo_addr(RTC_PRERbits+0)
MOVT	R4, #hi_addr(RTC_PRERbits+0)
LDRH	R3, [R4, #0]
BFI	R3, R5, #0, #15
STRH	R3, [R4, #0]
;InternalRTC.c,103 :: 		RTC_PRERbits.PREDIV_A = PREDIV_Async;
UXTB	R5, R1
; PREDIV_Async end address is: 4 (R1)
MOVW	R4, #lo_addr(RTC_PRERbits+0)
MOVT	R4, #hi_addr(RTC_PRERbits+0)
LDR	R3, [R4, #0]
BFI	R3, R5, #16, #7
STR	R3, [R4, #0]
;InternalRTC.c,106 :: 		FMT_bit = HR_Format;
MOVW	R3, #lo_addr(FMT_bit+0)
MOVT	R3, #hi_addr(FMT_bit+0)
STR	R0, [R3, #0]
; HR_Format end address is: 0 (R0)
;InternalRTC.c,109 :: 		RTC_ISR.B7 = 0;                                                             //     0: Free running mode
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(RTC_ISR+0)
MOVT	R3, #hi_addr(RTC_ISR+0)
STR	R4, [R3, #0]
;InternalRTC.c,114 :: 		RTC_WPR = 0xFF;
MOVS	R4, #255
MOVW	R3, #lo_addr(RTC_WPR+0)
MOVT	R3, #hi_addr(RTC_WPR+0)
STR	R4, [R3, #0]
;InternalRTC.c,118 :: 		return 1;
MOVS	R0, #1
SXTB	R0, R0
;InternalRTC.c,119 :: 		}
L_end_RTC_Init:
BX	LR
; end of _RTC_Init
_Calibrate_RTC_Crystal:
;InternalRTC.c,140 :: 		void Calibrate_RTC_Crystal (int Cal_Value)
; Cal_Value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Cal_Value end address is: 0 (R0)
; Cal_Value start address is: 0 (R0)
;InternalRTC.c,142 :: 		unsigned long          recalpfcount = 0;
; recalpfcount start address is: 12 (R3)
MOV	R3, #0
;InternalRTC.c,145 :: 		if (RTC_ISR.B16 == 1)
MOVW	R2, #lo_addr(RTC_ISR+0)
MOVT	R2, #hi_addr(RTC_ISR+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L__Calibrate_RTC_Crystal58
; recalpfcount end address is: 12 (R3)
; Cal_Value end address is: 0 (R0)
;InternalRTC.c,148 :: 		while ((RTC_ISR.B16 == 1) && (recalpfcount < 131072))
L_Calibrate_RTC_Crystal15:
; recalpfcount start address is: 12 (R3)
; Cal_Value start address is: 0 (R0)
MOVW	R2, #lo_addr(RTC_ISR+0)
MOVT	R2, #hi_addr(RTC_ISR+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L__Calibrate_RTC_Crystal57
CMP	R3, #131072
IT	CS
BCS	L__Calibrate_RTC_Crystal56
L__Calibrate_RTC_Crystal55:
;InternalRTC.c,149 :: 		recalpfcount++;
ADDS	R3, R3, #1
; recalpfcount end address is: 12 (R3)
IT	AL
BAL	L_Calibrate_RTC_Crystal15
;InternalRTC.c,148 :: 		while ((RTC_ISR.B16 == 1) && (recalpfcount < 131072))
L__Calibrate_RTC_Crystal57:
L__Calibrate_RTC_Crystal56:
;InternalRTC.c,150 :: 		}
IT	AL
BAL	L_Calibrate_RTC_Crystal14
; Cal_Value end address is: 0 (R0)
L__Calibrate_RTC_Crystal58:
;InternalRTC.c,145 :: 		if (RTC_ISR.B16 == 1)
;InternalRTC.c,150 :: 		}
L_Calibrate_RTC_Crystal14:
;InternalRTC.c,153 :: 		if (Cal_Value < 0)
; Cal_Value start address is: 0 (R0)
CMP	R0, #0
IT	GE
BGE	L_Calibrate_RTC_Crystal19
;InternalRTC.c,155 :: 		Cal_Value = abs(Cal_Value);
; Cal_Value end address is: 0 (R0)
BL	_abs+0
;InternalRTC.c,156 :: 		Cal_Value = Cal_Value / 2;
ASRS	R1, R0, #1
SXTH	R1, R1
;InternalRTC.c,157 :: 		Cal_Value = Cal_Value & 0x001F;                                        // Only use the bottom 5 bits.
AND	R3, R1, #31
;InternalRTC.c,158 :: 		RTC_CALIBRbits.DCS = 1;                                                // 1: Negative calibration: calendar update frequency is decreased
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_CALIBRbits+0)
MOVT	R1, #hi_addr(RTC_CALIBRbits+0)
STR	R2, [R1, #0]
;InternalRTC.c,159 :: 		RTC_CALIBRbits.DC  = (short) Cal_Value;                                // DC[4:0]: Digital calibration
UXTB	R3, R3
MOVW	R2, #lo_addr(RTC_CALIBRbits+0)
MOVT	R2, #hi_addr(RTC_CALIBRbits+0)
LDRB	R1, [R2, #0]
BFI	R1, R3, #0, #5
STRB	R1, [R2, #0]
;InternalRTC.c,160 :: 		}
IT	AL
BAL	L_Calibrate_RTC_Crystal20
L_Calibrate_RTC_Crystal19:
;InternalRTC.c,163 :: 		Cal_Value = Cal_Value / 2;
; Cal_Value start address is: 0 (R0)
ASRS	R1, R0, #1
SXTH	R1, R1
; Cal_Value end address is: 0 (R0)
;InternalRTC.c,164 :: 		Cal_Value = Cal_Value & 0x001F;                                        // Only use the bottom 5 bits.
AND	R3, R1, #31
;InternalRTC.c,165 :: 		RTC_CALIBRbits.DCS = 0;                                                // 0: Positive calibration: calendar update frequency is increased
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_CALIBRbits+0)
MOVT	R1, #hi_addr(RTC_CALIBRbits+0)
STR	R2, [R1, #0]
;InternalRTC.c,166 :: 		RTC_CALIBRbits.DC  = (short) Cal_Value;                                // DC[4:0]: Digital calibration
UXTB	R3, R3
MOVW	R2, #lo_addr(RTC_CALIBRbits+0)
MOVT	R2, #hi_addr(RTC_CALIBRbits+0)
LDRB	R1, [R2, #0]
BFI	R1, R3, #0, #5
STRB	R1, [R2, #0]
;InternalRTC.c,167 :: 		}
L_Calibrate_RTC_Crystal20:
;InternalRTC.c,169 :: 		}
L_end_Calibrate_RTC_Crystal:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate_RTC_Crystal
_RTC_SetTime:
;InternalRTC.c,179 :: 		short RTC_SetTime (RTC_TimeTypeDef *RTC_TimeStruct, int Calibration_Value)
; Calibration_Value start address is: 4 (R1)
; RTC_TimeStruct start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R4, R0
; Calibration_Value end address is: 4 (R1)
; RTC_TimeStruct end address is: 0 (R0)
; RTC_TimeStruct start address is: 16 (R4)
; Calibration_Value start address is: 4 (R1)
;InternalRTC.c,182 :: 		unsigned short       RTC_Wait_ctr             = 0;
; RTC_Wait_ctr start address is: 0 (R0)
MOVS	R0, #0
;InternalRTC.c,183 :: 		unsigned long        Temp_Time_Reg            = 0;
;InternalRTC.c,191 :: 		((unsigned long) (RTC_TimeStruct->RTC_Sec_Units)));
ADDS	R2, R4, #6
LDRB	R2, [R2, #0]
LSLS	R3, R2, #22
LDRB	R2, [R4, #0]
LSLS	R2, R2, #20
ORRS	R3, R2
ADDS	R2, R4, #1
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORRS	R3, R2
ADDS	R2, R4, #2
LDRB	R2, [R2, #0]
LSLS	R2, R2, #12
ORRS	R3, R2
ADDS	R2, R4, #3
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORRS	R3, R2
ADDS	R2, R4, #4
LDRB	R2, [R2, #0]
LSLS	R2, R2, #4
ORRS	R3, R2
ADDS	R2, R4, #5
; RTC_TimeStruct end address is: 16 (R4)
LDRB	R2, [R2, #0]
ORR	R4, R3, R2, LSL #0
; Temp_Time_Reg start address is: 16 (R4)
;InternalRTC.c,195 :: 		RTC_WPR = 0xCA;
MOVS	R3, #202
MOVW	R2, #lo_addr(RTC_WPR+0)
MOVT	R2, #hi_addr(RTC_WPR+0)
STR	R3, [R2, #0]
;InternalRTC.c,196 :: 		RTC_WPR = 0x53;
MOVS	R3, #83
MOVW	R2, #lo_addr(RTC_WPR+0)
MOVT	R2, #hi_addr(RTC_WPR+0)
STR	R3, [R2, #0]
;InternalRTC.c,197 :: 		DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(DBP_bit+0)
MOVT	R2, #hi_addr(DBP_bit+0)
STR	R3, [R2, #0]
;InternalRTC.c,200 :: 		if (INITF_bit == 0)   {
MOVW	R3, #lo_addr(INITF_bit+0)
MOVT	R3, #hi_addr(INITF_bit+0)
LDR	R2, [R3, #0]
CMP	R2, #0
IT	NE
BNE	L__RTC_SetTime62
;InternalRTC.c,202 :: 		RTC_ISR.B7 = 1;                                                        // INIT Enter Initialization mode.           (RTC initialization and status register (RTC_ISR))
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(RTC_ISR+0)
MOVT	R2, #hi_addr(RTC_ISR+0)
STR	R3, [R2, #0]
; RTC_Wait_ctr end address is: 0 (R0)
; Calibration_Value end address is: 4 (R1)
; Temp_Time_Reg end address is: 16 (R4)
STR	R4, [SP, #4]
UXTB	R4, R0
LDR	R0, [SP, #4]
;InternalRTC.c,204 :: 		while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
L_RTC_SetTime22:
; Temp_Time_Reg start address is: 0 (R0)
; RTC_Wait_ctr start address is: 16 (R4)
; Calibration_Value start address is: 4 (R1)
MOVW	R3, #lo_addr(INITF_bit+0)
MOVT	R3, #hi_addr(INITF_bit+0)
LDR	R2, [R3, #0]
CMP	R2, #0
IT	NE
BNE	L__RTC_SetTime61
CMP	R4, #8
IT	CS
BCS	L__RTC_SetTime60
L__RTC_SetTime59:
;InternalRTC.c,206 :: 		delay_us(10);                                                      //  to 2 RTCCLK clock cycles (due to clocks synchronization).
MOVW	R7, #498
MOVT	R7, #0
NOP
NOP
L_RTC_SetTime26:
SUBS	R7, R7, #1
BNE	L_RTC_SetTime26
NOP
NOP
NOP
;InternalRTC.c,207 :: 		RTC_Wait_ctr++;                                                    //  RTCCLK = 32768 Hz  --> approx 60us delay
ADDS	R4, R4, #1
UXTB	R4, R4
;InternalRTC.c,208 :: 		}                                                                      //  We shall wait 80 us just to make sure ;)
; RTC_Wait_ctr end address is: 16 (R4)
IT	AL
BAL	L_RTC_SetTime22
;InternalRTC.c,204 :: 		while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
L__RTC_SetTime61:
L__RTC_SetTime60:
;InternalRTC.c,210 :: 		if (INITF_bit == 0)
MOVW	R3, #lo_addr(INITF_bit+0)
MOVT	R3, #hi_addr(INITF_bit+0)
LDR	R2, [R3, #0]
CMP	R2, #0
IT	NE
BNE	L_RTC_SetTime28
;InternalRTC.c,212 :: 		Func_Status = 0;                                                   // Failed to update RTC registers
MOVS	R2, #0
SXTB	R2, R2
STRB	R2, [SP, #8]
;InternalRTC.c,213 :: 		}
L_RTC_SetTime28:
;InternalRTC.c,214 :: 		}
MOV	R4, R0
; Temp_Time_Reg end address is: 0 (R0)
; Calibration_Value end address is: 4 (R1)
SXTH	R0, R1
IT	AL
BAL	L_RTC_SetTime21
L__RTC_SetTime62:
;InternalRTC.c,200 :: 		if (INITF_bit == 0)   {
SXTH	R0, R1
;InternalRTC.c,214 :: 		}
L_RTC_SetTime21:
;InternalRTC.c,217 :: 		Calibrate_RTC_Crystal(Calibration_Value);
; Temp_Time_Reg start address is: 16 (R4)
; Calibration_Value start address is: 0 (R0)
; Calibration_Value end address is: 0 (R0)
BL	_Calibrate_RTC_Crystal+0
;InternalRTC.c,220 :: 		RTC_TR = Temp_Time_Reg;
MOVW	R2, #lo_addr(RTC_TR+0)
MOVT	R2, #hi_addr(RTC_TR+0)
STR	R4, [R2, #0]
; Temp_Time_Reg end address is: 16 (R4)
;InternalRTC.c,223 :: 		RTC_ISR.B7 = 0;                                                             //     0: Free running mode
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(RTC_ISR+0)
MOVT	R2, #hi_addr(RTC_ISR+0)
STR	R3, [R2, #0]
;InternalRTC.c,228 :: 		RTC_WPR = 0xFF;
MOVS	R3, #255
MOVW	R2, #lo_addr(RTC_WPR+0)
MOVT	R2, #hi_addr(RTC_WPR+0)
STR	R3, [R2, #0]
;InternalRTC.c,230 :: 		return Func_Status;
LDRSB	R0, [SP, #8]
;InternalRTC.c,231 :: 		}
L_end_RTC_SetTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _RTC_SetTime
_RTC_SetDate:
;InternalRTC.c,240 :: 		short RTC_SetDate(RTC_DateTypeDef *RTC_DateStruct)
; RTC_DateStruct start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R3, R0
; RTC_DateStruct end address is: 0 (R0)
; RTC_DateStruct start address is: 12 (R3)
;InternalRTC.c,243 :: 		unsigned short       RTC_Wait_ctr             = 0;
; RTC_Wait_ctr start address is: 0 (R0)
MOVS	R0, #0
;InternalRTC.c,244 :: 		unsigned long        Temp_Date_Reg            = 0;
;InternalRTC.c,252 :: 		((unsigned long) (RTC_DateStruct->RTC_Date_Units)));
ADDS	R1, R3, #5
LDRB	R1, [R1, #0]
UXTB	R7, R1
LSLS	R7, R7, #20
ADDS	R1, R3, #6
LDRB	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R7, R1
LDRB	R1, [R3, #0]
LSLS	R1, R1, #13
ORRS	R7, R1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
LSLS	R1, R1, #12
ORRS	R7, R1
ADDS	R1, R3, #4
LDRB	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R7, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
LSLS	R1, R1, #4
ORRS	R7, R1
ADDS	R1, R3, #2
; RTC_DateStruct end address is: 12 (R3)
LDRB	R1, [R1, #0]
ORRS	R7, R1
;InternalRTC.c,254 :: 		Temp_Date_Reg = Temp_Date_Reg & 0x00FFFFFF;                                 // Ensure top 8 bits are set to 0.
MVN	R1, #-16777216
ANDS	R7, R1
; Temp_Date_Reg start address is: 28 (R7)
;InternalRTC.c,257 :: 		RTC_WPR = 0xCA;
MOVS	R2, #202
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;InternalRTC.c,258 :: 		RTC_WPR = 0x53;
MOVS	R2, #83
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;InternalRTC.c,259 :: 		DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(DBP_bit+0)
MOVT	R1, #hi_addr(DBP_bit+0)
STR	R2, [R1, #0]
;InternalRTC.c,262 :: 		if (INITF_bit == 0)   {
MOVW	R2, #lo_addr(INITF_bit+0)
MOVT	R2, #hi_addr(INITF_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L__RTC_SetDate66
;InternalRTC.c,264 :: 		RTC_ISR.B7 = 1;                                                        // INIT Enter Initialization mode.           (RTC initialization and status register (RTC_ISR))
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
STR	R2, [R1, #0]
; Temp_Date_Reg end address is: 28 (R7)
; RTC_Wait_ctr end address is: 0 (R0)
;InternalRTC.c,266 :: 		while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
L_RTC_SetDate30:
; Temp_Date_Reg start address is: 28 (R7)
; RTC_Wait_ctr start address is: 0 (R0)
MOVW	R2, #lo_addr(INITF_bit+0)
MOVT	R2, #hi_addr(INITF_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L__RTC_SetDate65
CMP	R0, #8
IT	CS
BCS	L__RTC_SetDate64
L__RTC_SetDate63:
;InternalRTC.c,268 :: 		delay_us(10);                                                      //  to 2 RTCCLK clock cycles (due to clocks synchronization).
STR	R7, [SP, #4]
MOVW	R7, #498
MOVT	R7, #0
NOP
NOP
L_RTC_SetDate34:
SUBS	R7, R7, #1
BNE	L_RTC_SetDate34
NOP
NOP
NOP
LDR	R7, [SP, #4]
;InternalRTC.c,269 :: 		RTC_Wait_ctr++;                                                    //  RTCCLK = 32768 Hz  --> approx 60us delay
ADDS	R0, R0, #1
UXTB	R0, R0
;InternalRTC.c,270 :: 		}                                                                      //  We shall wait 80 us just to make sure ;)
; RTC_Wait_ctr end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetDate30
;InternalRTC.c,266 :: 		while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
L__RTC_SetDate65:
L__RTC_SetDate64:
;InternalRTC.c,272 :: 		if (INITF_bit == 0)
MOVW	R2, #lo_addr(INITF_bit+0)
MOVT	R2, #hi_addr(INITF_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_RTC_SetDate36
;InternalRTC.c,274 :: 		Message("Failed to enter INIT mode.");
MOVW	R1, #lo_addr(?lstr1_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr1_InternalRTC+0)
MOV	R0, R1
BL	_Message+0
;InternalRTC.c,276 :: 		}
L_RTC_SetDate36:
;InternalRTC.c,277 :: 		}
MOV	R0, R7
IT	AL
BAL	L_RTC_SetDate29
; Temp_Date_Reg end address is: 28 (R7)
L__RTC_SetDate66:
;InternalRTC.c,262 :: 		if (INITF_bit == 0)   {
MOV	R0, R7
;InternalRTC.c,277 :: 		}
L_RTC_SetDate29:
;InternalRTC.c,278 :: 		RTC_Wait_ctr = 0;   // Clear counter
; Temp_Date_Reg start address is: 0 (R0)
;InternalRTC.c,281 :: 		RTC_DR = Temp_Date_Reg;
MOVW	R1, #lo_addr(RTC_DR+0)
MOVT	R1, #hi_addr(RTC_DR+0)
STR	R0, [R1, #0]
; Temp_Date_Reg end address is: 0 (R0)
;InternalRTC.c,284 :: 		RTC_ISR.B7 = 0;                                                             //     0: Free running mode
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
STR	R2, [R1, #0]
;InternalRTC.c,289 :: 		RTC_WPR = 0xFF;
MOVS	R2, #255
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;InternalRTC.c,291 :: 		}
L_end_RTC_SetDate:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_SetDate
_RTC_GetSubSeconds:
;InternalRTC.c,301 :: 		unsigned RTC_GetSubSeconds (void)
;InternalRTC.c,307 :: 		Temp_RTC_SSR = RTC_SSR;
MOVW	R0, #lo_addr(RTC_SSR+0)
MOVT	R0, #hi_addr(RTC_SSR+0)
; Temp_RTC_SSR start address is: 8 (R2)
LDR	R2, [R0, #0]
;InternalRTC.c,312 :: 		Temp_RTC_SSR = Temp_RTC_SSR & 0x0000FFFF;
MOVW	R0, #65535
AND	R1, R2, R0, LSL #0
; Temp_RTC_SSR end address is: 8 (R2)
;InternalRTC.c,313 :: 		Temp_float = (1000 * ((float) RTC_PRERbits.PREDIV_S - (float) Temp_RTC_SSR) / ((float) RTC_PRERbits.PREDIV_S + 1));
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
;InternalRTC.c,315 :: 		return (unsigned) Temp_float;
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
;InternalRTC.c,316 :: 		}
L_end_RTC_GetSubSeconds:
BX	LR
; end of _RTC_GetSubSeconds
_RTC_GetTime:
;InternalRTC.c,324 :: 		void RTC_GetTime(RTC_TimeTypeDef *RTC_TimeStruct)
; RTC_TimeStruct start address is: 0 (R0)
; RTC_TimeStruct end address is: 0 (R0)
; RTC_TimeStruct start address is: 0 (R0)
;InternalRTC.c,327 :: 		RTC_TimeStruct->RTC_H12         =  (unsigned short) RTC_TRbits.PM;
ADDS	R3, R0, #6
MOVW	R2, #lo_addr(RTC_TRbits+0)
MOVT	R2, #hi_addr(RTC_TRbits+0)
LDR	R1, [R2, #0]
STRB	R1, [R3, #0]
;InternalRTC.c,328 :: 		RTC_TimeStruct->RTC_Hour_Tens   =  (unsigned short) RTC_TRbits.HT;
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #20, #2
UXTB	R1, R1
STRB	R1, [R0, #0]
;InternalRTC.c,329 :: 		RTC_TimeStruct->RTC_Hour_Units  =  (unsigned short) RTC_TRbits.HU;
ADDS	R2, R0, #1
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #16, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,330 :: 		RTC_TimeStruct->RTC_Min_Tens    =  (unsigned short) RTC_TRbits.MNT;
ADDS	R2, R0, #2
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #12, #3
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,331 :: 		RTC_TimeStruct->RTC_Min_Units   =  (unsigned short) RTC_TRbits.MNU;
ADDS	R2, R0, #3
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #8, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,332 :: 		RTC_TimeStruct->RTC_Sec_Tens    =  (unsigned short) RTC_TRbits.ST;
ADDS	R2, R0, #4
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #4, #3
STRB	R1, [R2, #0]
;InternalRTC.c,333 :: 		RTC_TimeStruct->RTC_Sec_Units   =  (unsigned short) RTC_TRbits.SU;
ADDS	R2, R0, #5
; RTC_TimeStruct end address is: 0 (R0)
MOVW	R1, #lo_addr(RTC_TRbits+0)
MOVT	R1, #hi_addr(RTC_TRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #0, #4
STRB	R1, [R2, #0]
;InternalRTC.c,334 :: 		}
L_end_RTC_GetTime:
BX	LR
; end of _RTC_GetTime
_RTC_GetDate:
;InternalRTC.c,343 :: 		void RTC_GetDate(RTC_DateTypeDef *RTC_DateStruct)
; RTC_DateStruct start address is: 0 (R0)
; RTC_DateStruct end address is: 0 (R0)
; RTC_DateStruct start address is: 0 (R0)
;InternalRTC.c,346 :: 		RTC_DateStruct->RTC_DayofWeek     =  (unsigned short) RTC_DRbits.WDU;
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #13, #3
UXTB	R1, R1
STRB	R1, [R0, #0]
;InternalRTC.c,347 :: 		RTC_DateStruct->RTC_Date_Tens     =  (unsigned short) RTC_DRbits.DT;
ADDS	R2, R0, #1
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #4, #2
STRB	R1, [R2, #0]
;InternalRTC.c,348 :: 		RTC_DateStruct->RTC_Date_Units    =  (unsigned short) RTC_DRbits.DU;
ADDS	R2, R0, #2
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRB	R1, [R1, #0]
UBFX	R1, R1, #0, #4
STRB	R1, [R2, #0]
;InternalRTC.c,349 :: 		RTC_DateStruct->RTC_Month_Tens    =  (unsigned short) RTC_DRbits.MT;
ADDS	R3, R0, #3
MOVW	R2, #lo_addr(RTC_DRbits+0)
MOVT	R2, #hi_addr(RTC_DRbits+0)
LDR	R1, [R2, #0]
STRB	R1, [R3, #0]
;InternalRTC.c,350 :: 		RTC_DateStruct->RTC_Month_Units   =  (unsigned short) RTC_DRbits.MU;
ADDS	R2, R0, #4
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDRH	R1, [R1, #0]
UBFX	R1, R1, #8, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,351 :: 		RTC_DateStruct->RTC_Year_Tens     =  (unsigned short) RTC_DRbits.YT;
ADDS	R2, R0, #5
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #20, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,352 :: 		RTC_DateStruct->RTC_Year_Units    =  (unsigned short) RTC_DRbits.YU;
ADDS	R2, R0, #6
; RTC_DateStruct end address is: 0 (R0)
MOVW	R1, #lo_addr(RTC_DRbits+0)
MOVT	R1, #hi_addr(RTC_DRbits+0)
LDR	R1, [R1, #0]
UBFX	R1, R1, #16, #4
UXTB	R1, R1
STRB	R1, [R2, #0]
;InternalRTC.c,353 :: 		}
L_end_RTC_GetDate:
BX	LR
; end of _RTC_GetDate
_RTC_PrintTime:
;InternalRTC.c,363 :: 		void RTC_PrintTime(RTC_TimeTypeDef *RTC_TimeStruct)
; RTC_TimeStruct start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R7, R0
; RTC_TimeStruct end address is: 0 (R0)
; RTC_TimeStruct start address is: 28 (R7)
;InternalRTC.c,367 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,368 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,369 :: 		ByteToStr(RTC_TimeStruct->RTC_Hour_Tens, txt);
ADD	R2, SP, #4
STR	R2, [SP, #8]
LDRB	R1, [R7, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,370 :: 		UART2_Write_Text(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,371 :: 		ByteToStr(RTC_TimeStruct->RTC_Hour_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,372 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,373 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,374 :: 		UART2_Write_Text(":");
MOVW	R1, #lo_addr(?lstr2_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr2_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,375 :: 		ByteToStr(RTC_TimeStruct->RTC_Min_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #2
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,376 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,377 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,378 :: 		ByteToStr(RTC_TimeStruct->RTC_Min_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #3
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,379 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,380 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,381 :: 		UART2_Write_Text(":");
MOVW	R1, #lo_addr(?lstr3_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr3_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,382 :: 		ByteToStr(RTC_TimeStruct->RTC_Sec_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #4
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,383 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,384 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,385 :: 		ByteToStr(RTC_TimeStruct->RTC_Sec_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #5
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,386 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,387 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,389 :: 		if (RTC_TimeStruct->RTC_H12)
ADDS	R1, R7, #6
; RTC_TimeStruct end address is: 28 (R7)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_RTC_PrintTime37
;InternalRTC.c,390 :: 		UART2_Write_Text(" pm");
MOVW	R1, #lo_addr(?lstr4_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr4_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintTime38
L_RTC_PrintTime37:
;InternalRTC.c,392 :: 		UART2_Write_Text(" am");
MOVW	R1, #lo_addr(?lstr5_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr5_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
L_RTC_PrintTime38:
;InternalRTC.c,394 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,395 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,396 :: 		}
L_end_RTC_PrintTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _RTC_PrintTime
_RTC_PrintDate:
;InternalRTC.c,405 :: 		void RTC_PrintDate(RTC_DateTypeDef *RTC_DateStruct)
; RTC_DateStruct start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R7, R0
; RTC_DateStruct end address is: 0 (R0)
; RTC_DateStruct start address is: 28 (R7)
;InternalRTC.c,412 :: 		Temp_Day = RTC_DateStruct->RTC_DayofWeek;
LDRB	R1, [R7, #0]
; Temp_Day start address is: 16 (R4)
UXTB	R4, R1
;InternalRTC.c,414 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,415 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,417 :: 		switch (Temp_Day)  {
IT	AL
BAL	L_RTC_PrintDate39
; Temp_Day end address is: 16 (R4)
;InternalRTC.c,418 :: 		case 1 : UART2_Write_Text("  Mon");  break;
L_RTC_PrintDate41:
MOVW	R1, #lo_addr(?lstr6_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr6_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate40
;InternalRTC.c,419 :: 		case 2 : UART2_Write_Text("  Tue");  break;
L_RTC_PrintDate42:
MOVW	R1, #lo_addr(?lstr7_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr7_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate40
;InternalRTC.c,420 :: 		case 3 : UART2_Write_Text("  Wed");  break;
L_RTC_PrintDate43:
MOVW	R1, #lo_addr(?lstr8_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr8_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate40
;InternalRTC.c,421 :: 		case 4 : UART2_Write_Text("  Thu");  break;
L_RTC_PrintDate44:
MOVW	R1, #lo_addr(?lstr9_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr9_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate40
;InternalRTC.c,422 :: 		case 5 : UART2_Write_Text("  Fri");  break;
L_RTC_PrintDate45:
MOVW	R1, #lo_addr(?lstr10_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr10_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate40
;InternalRTC.c,423 :: 		case 6 : UART2_Write_Text("  Sat");  break;
L_RTC_PrintDate46:
MOVW	R1, #lo_addr(?lstr11_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr11_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate40
;InternalRTC.c,424 :: 		case 7 : UART2_Write_Text("  Sun");  break;
L_RTC_PrintDate47:
MOVW	R1, #lo_addr(?lstr12_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr12_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
IT	AL
BAL	L_RTC_PrintDate40
;InternalRTC.c,425 :: 		}
L_RTC_PrintDate39:
; Temp_Day start address is: 16 (R4)
CMP	R4, #1
IT	EQ
BEQ	L_RTC_PrintDate41
CMP	R4, #2
IT	EQ
BEQ	L_RTC_PrintDate42
CMP	R4, #3
IT	EQ
BEQ	L_RTC_PrintDate43
CMP	R4, #4
IT	EQ
BEQ	L_RTC_PrintDate44
CMP	R4, #5
IT	EQ
BEQ	L_RTC_PrintDate45
CMP	R4, #6
IT	EQ
BEQ	L_RTC_PrintDate46
CMP	R4, #7
IT	EQ
BEQ	L_RTC_PrintDate47
; Temp_Day end address is: 16 (R4)
L_RTC_PrintDate40:
;InternalRTC.c,427 :: 		ByteToStr(RTC_DateStruct->RTC_Date_Tens, txt);
ADD	R2, SP, #4
STR	R2, [SP, #8]
ADDS	R1, R7, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,428 :: 		UART2_Write_Text(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,429 :: 		ByteToStr(RTC_DateStruct->RTC_Date_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #2
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,430 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,431 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,432 :: 		UART2_Write_Text("/");
MOVW	R1, #lo_addr(?lstr13_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr13_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,433 :: 		ByteToStr(RTC_DateStruct->RTC_Month_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #3
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,434 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,435 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,436 :: 		ByteToStr(RTC_DateStruct->RTC_Month_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #4
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,437 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,438 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,439 :: 		UART2_Write_Text("/");
MOVW	R1, #lo_addr(?lstr14_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr14_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,440 :: 		ByteToStr(RTC_DateStruct->RTC_Year_Tens, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #5
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,441 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,442 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,443 :: 		ByteToStr(RTC_DateStruct->RTC_Year_Units, txt);
ADD	R2, SP, #4
ADDS	R1, R7, #6
; RTC_DateStruct end address is: 28 (R7)
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOV	R1, R2
BL	_ByteToStr+0
;InternalRTC.c,444 :: 		txt[0] = txt[2];    txt[1] = txt[3];
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
LDR	R3, [SP, #8]
ADDS	R2, R3, #1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;InternalRTC.c,445 :: 		UART2_Write_Text(txt);
MOV	R0, R3
BL	_UART2_Write_Text+0
;InternalRTC.c,447 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,448 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,450 :: 		}
L_end_RTC_PrintDate:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _RTC_PrintDate
_Print_Sub_Secs:
;InternalRTC.c,459 :: 		void Print_Sub_Secs (unsigned Value)
; Value start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Value end address is: 0 (R0)
; Value start address is: 0 (R0)
;InternalRTC.c,462 :: 		WordToStr(Value, txt);
ADD	R1, SP, #4
; Value end address is: 0 (R0)
BL	_WordToStr+0
;InternalRTC.c,463 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,464 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,465 :: 		UART2_Write_Text(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,466 :: 		UART2_Write_Text("  ms");
MOVW	R1, #lo_addr(?lstr15_InternalRTC+0)
MOVT	R1, #hi_addr(?lstr15_InternalRTC+0)
MOV	R0, R1
BL	_UART2_Write_Text+0
;InternalRTC.c,467 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;InternalRTC.c,468 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;InternalRTC.c,469 :: 		}
L_end_Print_Sub_Secs:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Print_Sub_Secs
