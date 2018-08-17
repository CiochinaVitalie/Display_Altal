_InitTimer2:
;Controller_main.c,59 :: 		void InitTimer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,60 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Controller_main.c,61 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Controller_main.c,62 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Controller_main.c,63 :: 		TIM2_ARR = 119;
MOVS	R1, #119
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Controller_main.c,64 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Controller_main.c,65 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Controller_main.c,67 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_Timer2_interrupt:
;Controller_main.c,69 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;Controller_main.c,70 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Controller_main.c,71 :: 		rx_time++;
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
STR	R1, [R0, #0]
;Controller_main.c,72 :: 		if(rx_time-rx_time_previos>3645 ){
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
;Controller_main.c,73 :: 		sizeOfBuffer=rx_wr_index;
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
STRB	R1, [R0, #0]
;Controller_main.c,74 :: 		uartRX_flag=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartRX_flag+0)
MOVT	R0, #hi_addr(_uartRX_flag+0)
STRB	R1, [R0, #0]
;Controller_main.c,75 :: 		end_packet=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_end_packet+0)
MOVT	R0, #hi_addr(_end_packet+0)
STRB	R1, [R0, #0]
;Controller_main.c,76 :: 		rx_time=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
STR	R1, [R0, #0]
;Controller_main.c,77 :: 		rx_time_previos=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_time_previos+0)
MOVT	R0, #hi_addr(_rx_time_previos+0)
STR	R1, [R0, #0]
;Controller_main.c,78 :: 		rx_wr_index=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
STRH	R1, [R0, #0]
;Controller_main.c,79 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Controller_main.c,80 :: 		}
L_Timer2_interrupt0:
;Controller_main.c,82 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_USART_init:
;Controller_main.c,85 :: 		void USART_init(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Controller_main.c,86 :: 		UART2_Init_Advanced(9600 , _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #9600
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;Controller_main.c,87 :: 		USART2_BRR = 0xC35;                               //Set value for required baud rate
MOVW	R1, #3125
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
;Controller_main.c,88 :: 		USART2_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,89 :: 		USART2_CR1bits.TXEIE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;Controller_main.c,90 :: 		USART2_CR1bits.UE = 1;
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R2, [R0, #0]
;Controller_main.c,91 :: 		NVIC_IntEnable(IVT_INT_USART2);  // enable interrupt vector
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;Controller_main.c,92 :: 		USART2_CR1bits.TE=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;Controller_main.c,93 :: 		USART2_CR1bits.RE=1;
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;Controller_main.c,94 :: 		}
L_end_USART_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART_init
_USARTINTERRUPT:
;Controller_main.c,96 :: 		void USARTINTERRUPT() iv IVT_INT_USART2 ics ICS_AUTO{
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Controller_main.c,98 :: 		if(USART2_SRbits.RXNE != 0){
MOVW	R1, #lo_addr(USART2_SRbits+0)
MOVT	R1, #hi_addr(USART2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_USARTINTERRUPT1
;Controller_main.c,99 :: 		if(TIM2_CR1.CEN == 0)TIM2_CR1.CEN = 1;
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
;Controller_main.c,100 :: 		rx_time_previos = rx_time;
MOVW	R0, #lo_addr(_rx_time+0)
MOVT	R0, #hi_addr(_rx_time+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_rx_time_previos+0)
MOVT	R0, #hi_addr(_rx_time_previos+0)
STR	R1, [R0, #0]
;Controller_main.c,101 :: 		uartRX_flag=true;
MOVS	R1, #1
MOVW	R0, #lo_addr(_uartRX_flag+0)
MOVT	R0, #hi_addr(_uartRX_flag+0)
STRB	R1, [R0, #0]
;Controller_main.c,102 :: 		frame[rx_wr_index]=(uint8_t)(UART2_Read() & 0xFF);
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
;Controller_main.c,103 :: 		rx_wr_index++;
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_rx_wr_index+0)
MOVT	R0, #hi_addr(_rx_wr_index+0)
STRH	R1, [R0, #0]
;Controller_main.c,104 :: 		if (rx_wr_index == BUFFER_SIZE) rx_wr_index=0;
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
;Controller_main.c,106 :: 		}
L_USARTINTERRUPT1:
;Controller_main.c,107 :: 		}
L_end_USARTINTERRUPT:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _USARTINTERRUPT
_main:
;Controller_main.c,113 :: 		void main() {
;Controller_main.c,115 :: 		InitSysTick();
BL	_InitSysTick+0
;Controller_main.c,116 :: 		USART_init();
BL	_USART_init+0
;Controller_main.c,117 :: 		InitTimer2();
BL	_InitTimer2+0
;Controller_main.c,152 :: 		modbus_configure(1000,200,10);
MOVS	R2, #10
MOVS	R1, #200
MOVW	R0, #1000
BL	_modbus_configure+0
;Controller_main.c,153 :: 		Start_TP();
BL	_Start_TP+0
;Controller_main.c,154 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Controller_main.c,155 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,156 :: 		Messages_Label.Caption = "UPDATE_DIS";
MOVW	R1, #lo_addr(?lstr1_Controller_main+0)
MOVT	R1, #hi_addr(?lstr1_Controller_main+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_main.c,157 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_main.c,158 :: 		while(end_packet==false){
L_main4:
MOVW	R0, #lo_addr(_end_packet+0)
MOVT	R0, #hi_addr(_end_packet+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main5
;Controller_main.c,159 :: 		reciev_data_packet(COMP_DEL,46);
MOVS	R1, #46
MOVW	R0, #10
SXTH	R0, R0
BL	_reciev_data_packet+0
;Controller_main.c,160 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;Controller_main.c,162 :: 		}
IT	AL
BAL	L_main4
L_main5:
;Controller_main.c,163 :: 		end_packet=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_end_packet+0)
MOVT	R0, #hi_addr(_end_packet+0)
STRB	R1, [R0, #0]
;Controller_main.c,164 :: 		checkResponse();
BL	_checkResponse+0
;Controller_main.c,165 :: 		check_packet_status();
BL	_check_packet_status+0
;Controller_main.c,166 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,167 :: 		Messages_Label.Caption = "DIS_UPDATE";
MOVW	R1, #lo_addr(?lstr2_Controller_main+0)
MOVT	R1, #hi_addr(?lstr2_Controller_main+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_main.c,168 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_main.c,169 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Controller_main.c,170 :: 		data_eeprom();
BL	_data_eeprom+0
;Controller_main.c,171 :: 		startPage();
BL	_startPage+0
;Controller_main.c,172 :: 		ptr= send_data_packet;
MOVW	R1, #lo_addr(_send_data_packet+0)
MOVT	R1, #hi_addr(_send_data_packet+0)
MOVW	R0, #lo_addr(_ptr+0)
MOVT	R0, #hi_addr(_ptr+0)
STR	R1, [R0, #0]
;Controller_main.c,173 :: 		while (1) {
L_main8:
;Controller_main.c,174 :: 		if(pushButton) {ptr(adressReg,nomReg);}
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main10
MOVW	R0, #lo_addr(_nomReg+0)
MOVT	R0, #hi_addr(_nomReg+0)
LDRB	R4, [R0, #0]
MOVW	R0, #lo_addr(_adressReg+0)
MOVT	R0, #hi_addr(_adressReg+0)
LDRSH	R0, [R0, #0]
UXTB	R1, R4
MOVW	R4, #lo_addr(_ptr+0)
MOVT	R4, #hi_addr(_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
L_main10:
;Controller_main.c,175 :: 		if(end_packet){
MOVW	R0, #lo_addr(_end_packet+0)
MOVT	R0, #hi_addr(_end_packet+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main11
;Controller_main.c,176 :: 		end_packet=false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_end_packet+0)
MOVT	R0, #hi_addr(_end_packet+0)
STRB	R1, [R0, #0]
;Controller_main.c,177 :: 		checkResponse();
BL	_checkResponse+0
;Controller_main.c,178 :: 		check_packet_status();
BL	_check_packet_status+0
;Controller_main.c,179 :: 		if(system_reg[ERRORS_1]!=er){
MOVW	R0, #lo_addr(_er+0)
MOVT	R0, #hi_addr(_er+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_system_reg+382)
MOVT	R0, #hi_addr(_system_reg+382)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_main12
;Controller_main.c,180 :: 		er=system_reg[ERRORS_1];
MOVW	R2, #lo_addr(_system_reg+382)
MOVT	R2, #hi_addr(_system_reg+382)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_er+0)
MOVT	R0, #hi_addr(_er+0)
STRH	R1, [R0, #0]
;Controller_main.c,181 :: 		if(er>0){
MOV	R0, R2
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_main13
;Controller_main.c,182 :: 		Messages_Label.Font_Color= 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Messages_Label+24)
MOVT	R0, #hi_addr(_Messages_Label+24)
STRH	R1, [R0, #0]
;Controller_main.c,183 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,184 :: 		Messages_Label.Caption = "FIND_ERROR";
MOVW	R1, #lo_addr(?lstr3_Controller_main+0)
MOVT	R1, #hi_addr(?lstr3_Controller_main+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_main.c,185 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_main.c,186 :: 		find_errors();}
BL	_find_errors+0
IT	AL
BAL	L_main14
L_main13:
;Controller_main.c,188 :: 		Messages_Label.Font_Color= 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Messages_Label+24)
MOVT	R0, #hi_addr(_Messages_Label+24)
STRH	R1, [R0, #0]
;Controller_main.c,189 :: 		DrawRoundBox (&Messages_Box);
MOVW	R0, #lo_addr(_Messages_Box+0)
MOVT	R0, #hi_addr(_Messages_Box+0)
BL	_DrawRoundBox+0
;Controller_main.c,190 :: 		Messages_Label.Caption = "SYSTEM_OK";
MOVW	R1, #lo_addr(?lstr4_Controller_main+0)
MOVT	R1, #hi_addr(?lstr4_Controller_main+0)
MOVW	R0, #lo_addr(_Messages_Label+16)
MOVT	R0, #hi_addr(_Messages_Label+16)
STR	R1, [R0, #0]
;Controller_main.c,191 :: 		DrawLabel (&Messages_Label);
MOVW	R0, #lo_addr(_Messages_Label+0)
MOVT	R0, #hi_addr(_Messages_Label+0)
BL	_DrawLabel+0
;Controller_main.c,193 :: 		}
L_main14:
;Controller_main.c,194 :: 		}
L_main12:
;Controller_main.c,197 :: 		}
L_main11:
;Controller_main.c,198 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Controller_main.c,199 :: 		if(millis() - old_time_count > 3000)//
BL	_millis+0
MOVW	R1, #lo_addr(_old_time_count+0)
MOVT	R1, #hi_addr(_old_time_count+0)
LDR	R1, [R1, #0]
SUB	R1, R0, R1
MOVW	R0, #3000
CMP	R1, R0
IT	LS
BLS	L_main15
;Controller_main.c,200 :: 		{     old_time_count = millis();
BL	_millis+0
MOVW	R1, #lo_addr(_old_time_count+0)
MOVT	R1, #hi_addr(_old_time_count+0)
STR	R0, [R1, #0]
;Controller_main.c,202 :: 		if(!pushButton)selectPage();
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main16
BL	_selectPage+0
L_main16:
;Controller_main.c,204 :: 		}
L_main15:
;Controller_main.c,206 :: 		Check_TP();
BL	_Check_TP+0
;Controller_main.c,207 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Controller_main.c,209 :: 		}
IT	AL
BAL	L_main8
;Controller_main.c,211 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
