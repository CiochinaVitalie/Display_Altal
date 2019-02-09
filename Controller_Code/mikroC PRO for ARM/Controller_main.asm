_InitTimer2:
;Controller_main.c,63 :: 		void InitTimer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,64 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Controller_main.c,65 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Controller_main.c,66 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Controller_main.c,67 :: 		TIM2_ARR = 119;
MOVS	R1, #119
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Controller_main.c,68 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Controller_main.c,69 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Controller_main.c,71 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_Timer2_interrupt:
;Controller_main.c,73 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,74 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Controller_main.c,75 :: 		rx_time++;
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
STR	R1, [R0, #0]
;Controller_main.c,76 :: 		if(rx_time-rx_time_previos>3645 ){
MOVW	R0, #lo_addr(_rx_time_previos+0)
MOVT	R0, #hi_addr(_rx_time_previos+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
LDR	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #3645
CMP	R1, R0
IT	LS
BLS	L_Timer2_interrupt0
;Controller_main.c,78 :: 		sizeOfBuffer=rx_wr_index;
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
STRB	R1, [R0, #0]
;Controller_main.c,79 :: 		uartRX_flag=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartRX_flag+0)
MOVT	R0, #hi_addr(_uartRX_flag+0)
STRB	R1, [R0, #0]
;Controller_main.c,80 :: 		end_packet=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_end_packet+0)
MOVT	R0, #hi_addr(_end_packet+0)
STRB	R1, [R0, #0]
;Controller_main.c,81 :: 		rx_time=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
STR	R1, [R0, #0]
;Controller_main.c,82 :: 		rx_time_previos=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_time_previos+0)
MOVT	R0, #hi_addr(_rx_time_previos+0)
STR	R1, [R0, #0]
;Controller_main.c,83 :: 		rx_wr_index=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
STRH	R1, [R0, #0]
;Controller_main.c,84 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Controller_main.c,85 :: 		checkResponse();
BL	_checkResponse+0
;Controller_main.c,87 :: 		}
L_Timer2_interrupt0:
;Controller_main.c,89 :: 		}
L_end_Timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_interrupt
_USART_init:
;Controller_main.c,92 :: 		void USART_init(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,93 :: 		UART2_Init_Advanced(9600 , _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #9600
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;Controller_main.c,95 :: 		USART2_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,96 :: 		USART2_CR1bits.TXEIE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;Controller_main.c,97 :: 		USART2_CR1bits.UE = 1;
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,98 :: 		USART2_CR1bits.TE=1;
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,99 :: 		USART2_CR1bits.RE=1;
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,100 :: 		NVIC_IntEnable(IVT_INT_USART2);  // enable interrupt vector
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;Controller_main.c,101 :: 		}
L_end_USART_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART_init
_USARTINTERRUPT:
;Controller_main.c,103 :: 		void USARTINTERRUPT() iv IVT_INT_USART2 ics ICS_AUTO{
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_main.c,105 :: 		if(USART2_SRbits.RXNE != 0){
MOVW	R1, #lo_addr(USART2_SRbits+0)
MOVT	R1, #hi_addr(USART2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_USARTINTERRUPT1
;Controller_main.c,106 :: 		if(TIM2_CR1.CEN == 0)TIM2_CR1.CEN = 1;
MOVW	R1, #lo_addr(TIM2_CR1+0)
MOVT	R1, #hi_addr(TIM2_CR1+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_USARTINTERRUPT2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
L_USARTINTERRUPT2:
;Controller_main.c,107 :: 		rx_time_previos = rx_time;
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_rx_time_previos+0)
MOVT	R0, #hi_addr(_rx_time_previos+0)
STR	R1, [R0, #0]
;Controller_main.c,108 :: 		uartRX_flag=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_uartRX_flag+0)
MOVT	R0, #hi_addr(_uartRX_flag+0)
STRB	R1, [R0, #0]
;Controller_main.c,109 :: 		frame[rx_wr_index]=(uint8_t)(UART2_Read() & 0xFF);
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART2_Read+0
AND	R0, R0, #255
UXTB	R1, R0
LDR	R0, [SP, #4]
STRB	R1, [R0, #0]
;Controller_main.c,110 :: 		rx_wr_index++;
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
STRH	R1, [R0, #0]
;Controller_main.c,111 :: 		if (rx_wr_index == BUFFER_SIZE) rx_wr_index=0;
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R0, [R0, #0]
CMP	R0, #128
IT	NE
BNE	L_USARTINTERRUPT3
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
STRH	R1, [R0, #0]
L_USARTINTERRUPT3:
;Controller_main.c,113 :: 		}
L_USARTINTERRUPT1:
;Controller_main.c,114 :: 		}
L_end_USARTINTERRUPT:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _USARTINTERRUPT
_printTime:
;Controller_main.c,116 :: 		void printTime(RTC_TimeTypeDef *RTC_TimeStruct,RTC_DateTypeDef *RTC_DateStruct)
; RTC_DateStruct start address is: 4 (R1)
; RTC_TimeStruct start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R6, R0
MOV	R7, R1
; RTC_DateStruct end address is: 4 (R1)
; RTC_TimeStruct end address is: 0 (R0)
; RTC_TimeStruct start address is: 24 (R6)
; RTC_DateStruct start address is: 28 (R7)
;Controller_main.c,120 :: 		mon = RTC_DateStruct->RTC_Month_Tens*10 +  RTC_DateStruct->RTC_Month_Units;
ADDS	R2, R7, #3
LDRB	R3, [R2, #0]
MOVS	R2, #10
SXTH	R2, R2
MULS	R3, R2, R3
SXTH	R3, R3
ADDS	R2, R7, #4
LDRB	R2, [R2, #0]
ADDS	R2, R3, R2
; mon start address is: 32 (R8)
UXTB	R8, R2
;Controller_main.c,121 :: 		ByteToStr(RTC_TimeStruct->RTC_Hour_Tens,txt);
ADD	R3, SP, #4
LDRB	R2, [R6, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;Controller_main.c,123 :: 		strcpy(DateTime.Caption,txt);
ADD	R3, SP, #4
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcpy+0
;Controller_main.c,124 :: 		ByteToStr(RTC_TimeStruct->RTC_Hour_Units,txt);
ADD	R3, SP, #4
ADDS	R2, R6, #1
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;Controller_main.c,125 :: 		strcat(DateTime.Caption,txt);
ADD	R3, SP, #4
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;Controller_main.c,126 :: 		strcat(DateTime.Caption,":");
MOVW	R3, #lo_addr(?lstr1_Controller_main+0)
MOVT	R3, #hi_addr(?lstr1_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;Controller_main.c,127 :: 		ByteToStr(RTC_TimeStruct->RTC_Min_Tens,txt);
ADD	R3, SP, #4
ADDS	R2, R6, #2
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;Controller_main.c,128 :: 		strcat(DateTime.Caption,txt);
ADD	R3, SP, #4
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;Controller_main.c,129 :: 		ByteToStr(RTC_TimeStruct->RTC_Min_Units,txt);
ADD	R3, SP, #4
ADDS	R2, R6, #3
; RTC_TimeStruct end address is: 24 (R6)
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;Controller_main.c,130 :: 		strcat(DateTime.Caption,txt);
ADD	R3, SP, #4
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;Controller_main.c,131 :: 		strcat(DateTime.Caption," / ");
MOVW	R3, #lo_addr(?lstr2_Controller_main+0)
MOVT	R3, #hi_addr(?lstr2_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;Controller_main.c,132 :: 		ByteToStr(RTC_DateStruct->RTC_Date_Tens,txt);
ADD	R3, SP, #4
ADDS	R2, R7, #1
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;Controller_main.c,133 :: 		strcat(DateTime.Caption,txt);
ADD	R3, SP, #4
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;Controller_main.c,134 :: 		ByteToStr(RTC_DateStruct->RTC_Date_Units,txt);
ADD	R3, SP, #4
ADDS	R2, R7, #2
; RTC_DateStruct end address is: 28 (R7)
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;Controller_main.c,135 :: 		strcat(DateTime.Caption,txt);
ADD	R3, SP, #4
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;Controller_main.c,137 :: 		switch (mon)  //
IT	AL
BAL	L_printTime4
; mon end address is: 32 (R8)
;Controller_main.c,139 :: 		case 1 :   strcat(DateTime.Caption,"JAN");break;
L_printTime6:
MOVW	R3, #lo_addr(?lstr3_Controller_main+0)
MOVT	R3, #hi_addr(?lstr3_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,140 :: 		case 2 :   strcat(DateTime.Caption,"FAB");break;
L_printTime7:
MOVW	R3, #lo_addr(?lstr4_Controller_main+0)
MOVT	R3, #hi_addr(?lstr4_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,141 :: 		case 3 :   strcat(DateTime.Caption,"MAR");break;
L_printTime8:
MOVW	R3, #lo_addr(?lstr5_Controller_main+0)
MOVT	R3, #hi_addr(?lstr5_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,142 :: 		case 4 :   strcat(DateTime.Caption,"APR");break;
L_printTime9:
MOVW	R3, #lo_addr(?lstr6_Controller_main+0)
MOVT	R3, #hi_addr(?lstr6_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,143 :: 		case 5 :   strcat(DateTime.Caption,"MAY");break;
L_printTime10:
MOVW	R3, #lo_addr(?lstr7_Controller_main+0)
MOVT	R3, #hi_addr(?lstr7_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,144 :: 		case 6 :   strcat(DateTime.Caption,"JUN");break;
L_printTime11:
MOVW	R3, #lo_addr(?lstr8_Controller_main+0)
MOVT	R3, #hi_addr(?lstr8_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,145 :: 		case 7 :   strcat(DateTime.Caption,"JUL");break;
L_printTime12:
MOVW	R3, #lo_addr(?lstr9_Controller_main+0)
MOVT	R3, #hi_addr(?lstr9_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,146 :: 		case 8 :   strcat(DateTime.Caption,"AUG");break;
L_printTime13:
MOVW	R3, #lo_addr(?lstr10_Controller_main+0)
MOVT	R3, #hi_addr(?lstr10_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,147 :: 		case 9 :   strcat(DateTime.Caption,"SEP");break;
L_printTime14:
MOVW	R3, #lo_addr(?lstr11_Controller_main+0)
MOVT	R3, #hi_addr(?lstr11_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,148 :: 		case 10 :  strcat(DateTime.Caption,"OCT");break;
L_printTime15:
MOVW	R3, #lo_addr(?lstr12_Controller_main+0)
MOVT	R3, #hi_addr(?lstr12_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,149 :: 		case 11 :  strcat(DateTime.Caption,"NOV");break;
L_printTime16:
MOVW	R3, #lo_addr(?lstr13_Controller_main+0)
MOVT	R3, #hi_addr(?lstr13_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,150 :: 		case 12 :  strcat(DateTime.Caption,"DEC");break;
L_printTime17:
MOVW	R3, #lo_addr(?lstr14_Controller_main+0)
MOVT	R3, #hi_addr(?lstr14_Controller_main+0)
MOVW	R2, #lo_addr(_DateTime+16)
MOVT	R2, #hi_addr(_DateTime+16)
LDR	R2, [R2, #0]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
IT	AL
BAL	L_printTime5
;Controller_main.c,151 :: 		}
L_printTime4:
; mon start address is: 32 (R8)
CMP	R8, #1
IT	EQ
BEQ	L_printTime6
CMP	R8, #2
IT	EQ
BEQ	L_printTime7
CMP	R8, #3
IT	EQ
BEQ	L_printTime8
CMP	R8, #4
IT	EQ
BEQ	L_printTime9
CMP	R8, #5
IT	EQ
BEQ	L_printTime10
CMP	R8, #6
IT	EQ
BEQ	L_printTime11
CMP	R8, #7
IT	EQ
BEQ	L_printTime12
CMP	R8, #8
IT	EQ
BEQ	L_printTime13
CMP	R8, #9
IT	EQ
BEQ	L_printTime14
CMP	R8, #10
IT	EQ
BEQ	L_printTime15
CMP	R8, #11
IT	EQ
BEQ	L_printTime16
CMP	R8, #12
IT	EQ
BEQ	L_printTime17
; mon end address is: 32 (R8)
L_printTime5:
;Controller_main.c,153 :: 		}
L_end_printTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _printTime
_main:
;Controller_main.c,156 :: 		void main() {
SUB	SP, SP, #16
;Controller_main.c,161 :: 		RTC_Init(255, 127, 1);
MOVS	R2, #1
SXTH	R2, R2
MOVS	R1, #127
MOVS	R0, #255
BL	_RTC_Init+0
;Controller_main.c,171 :: 		InitSysTick();
BL	_InitSysTick+0
;Controller_main.c,172 :: 		USART_init();
BL	_USART_init+0
;Controller_main.c,173 :: 		InitTimer2();
BL	_InitTimer2+0
;Controller_main.c,174 :: 		modbus_configure(1000,200,10);
MOVS	R2, #10
MOVS	R1, #200
MOVW	R0, #1000
BL	_modbus_configure+0
;Controller_main.c,175 :: 		Start_TP();
BL	_Start_TP+0
;Controller_main.c,176 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Controller_main.c,187 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Controller_main.c,188 :: 		countPacket=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
;Controller_main.c,190 :: 		while (1) {
L_main18:
;Controller_main.c,191 :: 		if(!dataEEprom && msgOk){dataEEprom=true;data_eeprom();startPage();msgOk=false;}//UART2_Write_Text("finisheeprom");
MOVW	R0, #lo_addr(_dataEEprom+0)
MOVT	R0, #hi_addr(_dataEEprom+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main43
MOVW	R0, #lo_addr(_msgOk+0)
MOVT	R0, #hi_addr(_msgOk+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main42
L__main41:
MOVS	R1, #1
MOVW	R0, #lo_addr(_dataEEprom+0)
MOVT	R0, #hi_addr(_dataEEprom+0)
STRB	R1, [R0, #0]
BL	_data_eeprom+0
BL	_startPage+0
MOVS	R1, #0
MOVW	R0, #lo_addr(_msgOk+0)
MOVT	R0, #hi_addr(_msgOk+0)
STRB	R1, [R0, #0]
L__main43:
L__main42:
;Controller_main.c,192 :: 		if(msgOk){countPacket++;  msgOk=false;}//
MOVW	R0, #lo_addr(_msgOk+0)
MOVT	R0, #hi_addr(_msgOk+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main23
MOVW	R1, #lo_addr(_countPacket+0)
MOVT	R1, #hi_addr(_countPacket+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_msgOk+0)
MOVT	R0, #hi_addr(_msgOk+0)
STRB	R1, [R0, #0]
L_main23:
;Controller_main.c,194 :: 		if(system_reg[ERRORS_1]!=er_1 ||system_reg[ERRORS_2]!=er_2 ){
MOVW	R0, #lo_addr(_er_1+0)
MOVT	R0, #hi_addr(_er_1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__main45
MOVW	R0, #lo_addr(_er_2+0)
MOVT	R0, #hi_addr(_er_2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__main44
IT	AL
BAL	L_main26
L__main45:
L__main44:
;Controller_main.c,196 :: 		if(system_reg[ERRORS_1]!=er_1)er_1=system_reg[ERRORS_1];
MOVW	R0, #lo_addr(_er_1+0)
MOVT	R0, #hi_addr(_er_1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_main27
MOVW	R0, #lo_addr(_system_reg+222)
MOVT	R0, #hi_addr(_system_reg+222)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_er_1+0)
MOVT	R0, #hi_addr(_er_1+0)
STRH	R1, [R0, #0]
IT	AL
BAL	L_main28
L_main27:
;Controller_main.c,197 :: 		else  er_2=system_reg[ERRORS_2];
MOVW	R0, #lo_addr(_system_reg+224)
MOVT	R0, #hi_addr(_system_reg+224)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_er_2+0)
MOVT	R0, #hi_addr(_er_2+0)
STRH	R1, [R0, #0]
L_main28:
;Controller_main.c,198 :: 		if(er_1>0 || er_2>0 ){
MOVW	R0, #lo_addr(_er_1+0)
MOVT	R0, #hi_addr(_er_1+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	GT
BGT	L__main47
MOVW	R0, #lo_addr(_er_2+0)
MOVT	R0, #hi_addr(_er_2+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	GT
BGT	L__main46
IT	AL
BAL	L_main31
L__main47:
L__main46:
;Controller_main.c,199 :: 		DateTime.Font_Color= 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_DateTime+24)
MOVT	R0, #hi_addr(_DateTime+24)
STRH	R1, [R0, #0]
;Controller_main.c,200 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,201 :: 		DateTime.Caption = "ERROR";
MOVW	R1, #lo_addr(?lstr15_Controller_main+0)
MOVT	R1, #hi_addr(?lstr15_Controller_main+0)
MOVW	R0, #lo_addr(_DateTime+16)
MOVT	R0, #hi_addr(_DateTime+16)
STR	R1, [R0, #0]
;Controller_main.c,202 :: 		DrawLabel (&DateTime);
MOVW	R0, #lo_addr(_DateTime+0)
MOVT	R0, #hi_addr(_DateTime+0)
BL	_DrawLabel+0
;Controller_main.c,203 :: 		find_errors();}
BL	_find_errors+0
IT	AL
BAL	L_main32
L_main31:
;Controller_main.c,204 :: 		else if(er_1==0 && er_2==0) {
MOVW	R0, #lo_addr(_er_1+0)
MOVT	R0, #hi_addr(_er_1+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main49
MOVW	R0, #lo_addr(_er_2+0)
MOVT	R0, #hi_addr(_er_2+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main48
L__main38:
;Controller_main.c,205 :: 		DateTime.Font_Color= 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_DateTime+24)
MOVT	R0, #hi_addr(_DateTime+24)
STRH	R1, [R0, #0]
;Controller_main.c,206 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,207 :: 		DateTime.Caption = "_OK";
MOVW	R1, #lo_addr(?lstr16_Controller_main+0)
MOVT	R1, #hi_addr(?lstr16_Controller_main+0)
MOVW	R0, #lo_addr(_DateTime+16)
MOVT	R0, #hi_addr(_DateTime+16)
STR	R1, [R0, #0]
;Controller_main.c,208 :: 		DrawLabel (&DateTime);
MOVW	R0, #lo_addr(_DateTime+0)
MOVT	R0, #hi_addr(_DateTime+0)
BL	_DrawLabel+0
;Controller_main.c,204 :: 		else if(er_1==0 && er_2==0) {
L__main49:
L__main48:
;Controller_main.c,210 :: 		}
L_main32:
;Controller_main.c,211 :: 		}
L_main26:
;Controller_main.c,214 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Controller_main.c,215 :: 		if(millis() - old_time_count >1000 )//
BL	_millis+0
MOVW	R1, #lo_addr(_old_time_count+0)
MOVT	R1, #hi_addr(_old_time_count+0)
LDR	R1, [R1, #0]
SUB	R0, R0, R1
CMP	R0, #1000
IT	LS
BLS	L_main36
;Controller_main.c,219 :: 		n++;
MOVW	R1, #lo_addr(main_n_L2+0)
MOVT	R1, #hi_addr(main_n_L2+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Controller_main.c,220 :: 		if(n>60){
CMP	R0, #60
IT	LS
BLS	L_main37
;Controller_main.c,221 :: 		n=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(main_n_L2+0)
MOVT	R0, #hi_addr(main_n_L2+0)
STRB	R1, [R0, #0]
;Controller_main.c,222 :: 		RTC_GetDate(&Read_Date);
ADD	R0, SP, #7
BL	_RTC_GetDate+0
;Controller_main.c,225 :: 		RTC_GetTime(&Read_Time);
ADD	R0, SP, #0
BL	_RTC_GetTime+0
;Controller_main.c,227 :: 		printTime(&Read_Time,&Read_Date);
ADD	R1, SP, #7
ADD	R0, SP, #0
BL	_printTime+0
;Controller_main.c,228 :: 		DrawRoundBox (&Messages_Box);DrawLabel (&DateTime);}
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
MOVW	R0, #lo_addr(_DateTime+0)
MOVT	R0, #hi_addr(_DateTime+0)
BL	_DrawLabel+0
L_main37:
;Controller_main.c,231 :: 		old_time_count = millis();
BL	_millis+0
MOVW	R1, #lo_addr(_old_time_count+0)
MOVT	R1, #hi_addr(_old_time_count+0)
STR	R0, [R1, #0]
;Controller_main.c,235 :: 		}
L_main36:
;Controller_main.c,238 :: 		Check_TP();
BL	_Check_TP+0
;Controller_main.c,240 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Controller_main.c,244 :: 		}
IT	AL
BAL	L_main18
;Controller_main.c,245 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
