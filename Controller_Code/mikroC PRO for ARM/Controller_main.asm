_InitTimer2:
;Controller_main.c,62 :: 		void InitTimer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,63 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Controller_main.c,64 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Controller_main.c,65 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Controller_main.c,66 :: 		TIM2_ARR = 119;
MOVS	R1, #119
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Controller_main.c,67 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Controller_main.c,68 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Controller_main.c,70 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_Timer2_interrupt:
;Controller_main.c,72 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,73 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Controller_main.c,74 :: 		rx_time++;
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
STR	R1, [R0, #0]
;Controller_main.c,75 :: 		if(rx_time-rx_time_previos>3645 ){
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
;Controller_main.c,77 :: 		sizeOfBuffer=rx_wr_index;
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
STRB	R1, [R0, #0]
;Controller_main.c,78 :: 		uartRX_flag=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartRX_flag+0)
MOVT	R0, #hi_addr(_uartRX_flag+0)
STRB	R1, [R0, #0]
;Controller_main.c,79 :: 		end_packet=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_end_packet+0)
MOVT	R0, #hi_addr(_end_packet+0)
STRB	R1, [R0, #0]
;Controller_main.c,80 :: 		rx_time=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
STR	R1, [R0, #0]
;Controller_main.c,81 :: 		rx_time_previos=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_time_previos+0)
MOVT	R0, #hi_addr(_rx_time_previos+0)
STR	R1, [R0, #0]
;Controller_main.c,82 :: 		rx_wr_index=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
STRH	R1, [R0, #0]
;Controller_main.c,83 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Controller_main.c,84 :: 		checkResponse();
BL	_checkResponse+0
;Controller_main.c,86 :: 		}
L_Timer2_interrupt0:
;Controller_main.c,88 :: 		}
L_end_Timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_interrupt
_USART_init:
;Controller_main.c,91 :: 		void USART_init(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,92 :: 		UART2_Init_Advanced(9600 , _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #9600
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;Controller_main.c,93 :: 		USART2_BRR = 0xC35;                               //Set value for required baud rate
MOVW	R1, #3125
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
;Controller_main.c,94 :: 		USART2_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,95 :: 		USART2_CR1bits.TXEIE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;Controller_main.c,96 :: 		USART2_CR1bits.UE = 1;
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,97 :: 		NVIC_IntEnable(IVT_INT_USART2);  // enable interrupt vector
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;Controller_main.c,98 :: 		USART2_CR1bits.TE=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;Controller_main.c,99 :: 		USART2_CR1bits.RE=1;
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;Controller_main.c,100 :: 		}
L_end_USART_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART_init
_USARTINTERRUPT:
;Controller_main.c,102 :: 		void USARTINTERRUPT() iv IVT_INT_USART2 ics ICS_AUTO{
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_main.c,104 :: 		if(USART2_SRbits.RXNE != 0){
MOVW	R1, #lo_addr(USART2_SRbits+0)
MOVT	R1, #hi_addr(USART2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_USARTINTERRUPT1
;Controller_main.c,105 :: 		if(TIM2_CR1.CEN == 0)TIM2_CR1.CEN = 1;
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
;Controller_main.c,106 :: 		rx_time_previos = rx_time;
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_rx_time_previos+0)
MOVT	R0, #hi_addr(_rx_time_previos+0)
STR	R1, [R0, #0]
;Controller_main.c,107 :: 		uartRX_flag=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_uartRX_flag+0)
MOVT	R0, #hi_addr(_uartRX_flag+0)
STRB	R1, [R0, #0]
;Controller_main.c,108 :: 		frame[rx_wr_index]=(uint8_t)(UART2_Read() & 0xFF);
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
;Controller_main.c,109 :: 		rx_wr_index++;
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
STRH	R1, [R0, #0]
;Controller_main.c,110 :: 		if (rx_wr_index == BUFFER_SIZE) rx_wr_index=0;
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
;Controller_main.c,112 :: 		}
L_USARTINTERRUPT1:
;Controller_main.c,113 :: 		}
L_end_USARTINTERRUPT:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _USARTINTERRUPT
_main:
;Controller_main.c,119 :: 		void main() {
;Controller_main.c,121 :: 		InitSysTick();
BL	_InitSysTick+0
;Controller_main.c,122 :: 		USART_init();
BL	_USART_init+0
;Controller_main.c,123 :: 		InitTimer2();
BL	_InitTimer2+0
;Controller_main.c,160 :: 		modbus_configure(1000,200,10);
MOVS	R2, #10
MOVS	R1, #200
MOVW	R0, #1000
BL	_modbus_configure+0
;Controller_main.c,161 :: 		Start_TP();
BL	_Start_TP+0
;Controller_main.c,162 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Controller_main.c,163 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,164 :: 		Messages_Label.Caption = "UPDATE_DIS";
MOVW	R1, #lo_addr(?lstr1_Controller_main+0)
MOVT	R1, #hi_addr(?lstr1_Controller_main+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_main.c,165 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_main.c,177 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,178 :: 		Messages_Label.Caption = "DIS_UPDATE";
MOVW	R1, #lo_addr(?lstr2_Controller_main+0)
MOVT	R1, #hi_addr(?lstr2_Controller_main+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_main.c,179 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_main.c,180 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Controller_main.c,181 :: 		countPacket=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_countPacket+0)
MOVT	R0, #hi_addr(_countPacket+0)
STRB	R1, [R0, #0]
;Controller_main.c,183 :: 		while (1) {
L_main4:
;Controller_main.c,184 :: 		if(!dataEEprom && msgOk){dataEEprom=true;data_eeprom();startPage();msgOk=false;}//UART2_Write_Text("finisheeprom");
MOVW	R0, #lo_addr(_dataEEprom+0)
MOVT	R0, #hi_addr(_dataEEprom+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main23
MOVW	R0, #lo_addr(_msgOk+0)
MOVT	R0, #hi_addr(_msgOk+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main22
L__main21:
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
L__main23:
L__main22:
;Controller_main.c,185 :: 		if(msgOk){countPacket++;  msgOk=false;}//
MOVW	R0, #lo_addr(_msgOk+0)
MOVT	R0, #hi_addr(_msgOk+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main9
MOVW	R1, #lo_addr(_countPacket+0)
MOVT	R1, #hi_addr(_countPacket+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_msgOk+0)
MOVT	R0, #hi_addr(_msgOk+0)
STRB	R1, [R0, #0]
L_main9:
;Controller_main.c,216 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Controller_main.c,217 :: 		if(millis() - old_time_count > 1000 )//
BL	_millis+0
MOVW	R1, #lo_addr(_old_time_count+0)
MOVT	R1, #hi_addr(_old_time_count+0)
LDR	R1, [R1, #0]
SUB	R0, R0, R1
CMP	R0, #1000
IT	LS
BLS	L_main10
;Controller_main.c,219 :: 		old_time_count = millis();
BL	_millis+0
MOVW	R1, #lo_addr(_old_time_count+0)
MOVT	R1, #hi_addr(_old_time_count+0)
STR	R0, [R1, #0]
;Controller_main.c,221 :: 		if(dataEEprom && !pushButton)selectPage();
MOVW	R0, #lo_addr(_dataEEprom+0)
MOVT	R0, #hi_addr(_dataEEprom+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main25
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main24
L__main20:
BL	_selectPage+0
IT	AL
BAL	L_main14
L__main25:
L__main24:
;Controller_main.c,222 :: 		else if(!dataEEprom && !pushButton) reciev_data_packet(COMP_DEL,46);
MOVW	R0, #lo_addr(_dataEEprom+0)
MOVT	R0, #hi_addr(_dataEEprom+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main27
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main26
L__main19:
MOVS	R1, #46
MOVW	R0, #10
SXTH	R0, R0
BL	_reciev_data_packet+0
L__main27:
L__main26:
L_main14:
;Controller_main.c,223 :: 		if(pushButton) {send_data_packet(adressReg,nomReg);}
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main18
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
LDRSH	R0, [R0, #0]
BL	_send_data_packet+0
L_main18:
;Controller_main.c,224 :: 		}
L_main10:
;Controller_main.c,227 :: 		Check_TP();
BL	_Check_TP+0
;Controller_main.c,228 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Controller_main.c,230 :: 		}
IT	AL
BAL	L_main4
;Controller_main.c,232 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
