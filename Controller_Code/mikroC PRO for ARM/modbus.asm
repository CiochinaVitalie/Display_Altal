_send_data_packet:
;modbus.c,41 :: 		void send_data_packet(enum _system adress,unsigned char no_reg){
; no_reg start address is: 4 (R1)
; adress start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; no_reg end address is: 4 (R1)
; adress end address is: 0 (R0)
; adress start address is: 0 (R0)
; no_reg start address is: 4 (R1)
;modbus.c,42 :: 		bus_data.id =0x01;
MOVS	R3, #1
MOVW	R2, #lo_addr(_bus_data+0)
MOVT	R2, #hi_addr(_bus_data+0)
STRB	R3, [R2, #0]
;modbus.c,43 :: 		bus_data.function = PRESET_MULTIPLE_REGISTERS;
MOVS	R3, #16
MOVW	R2, #lo_addr(_bus_data+1)
MOVT	R2, #hi_addr(_bus_data+1)
STRB	R3, [R2, #0]
;modbus.c,44 :: 		bus_data.address = (unsigned int)adress;
UXTH	R3, R0
; adress end address is: 0 (R0)
MOVW	R2, #lo_addr(_bus_data+2)
MOVT	R2, #hi_addr(_bus_data+2)
STRH	R3, [R2, #0]
;modbus.c,45 :: 		bus_data.no_of_registers = no_reg ;
MOVW	R2, #lo_addr(_bus_data+4)
MOVT	R2, #hi_addr(_bus_data+4)
STRH	R1, [R2, #0]
; no_reg end address is: 4 (R1)
;modbus.c,46 :: 		constructPacket();
BL	_constructPacket+0
;modbus.c,47 :: 		}
L_end_send_data_packet:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _send_data_packet
_reciev_data_packet:
;modbus.c,48 :: 		void reciev_data_packet(enum _system adress,unsigned char no_reg){
; no_reg start address is: 4 (R1)
; adress start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; no_reg end address is: 4 (R1)
; adress end address is: 0 (R0)
; adress start address is: 0 (R0)
; no_reg start address is: 4 (R1)
;modbus.c,49 :: 		bus_data.id =0x01;
MOVS	R3, #1
MOVW	R2, #lo_addr(_bus_data+0)
MOVT	R2, #hi_addr(_bus_data+0)
STRB	R3, [R2, #0]
;modbus.c,50 :: 		bus_data.function = READ_HOLDING_REGISTERS;
MOVS	R3, #3
MOVW	R2, #lo_addr(_bus_data+1)
MOVT	R2, #hi_addr(_bus_data+1)
STRB	R3, [R2, #0]
;modbus.c,51 :: 		bus_data.address = (unsigned int)adress;
UXTH	R3, R0
; adress end address is: 0 (R0)
MOVW	R2, #lo_addr(_bus_data+2)
MOVT	R2, #hi_addr(_bus_data+2)
STRH	R3, [R2, #0]
;modbus.c,52 :: 		bus_data.no_of_registers = no_reg ;
MOVW	R2, #lo_addr(_bus_data+4)
MOVT	R2, #hi_addr(_bus_data+4)
STRH	R1, [R2, #0]
; no_reg end address is: 4 (R1)
;modbus.c,53 :: 		constructPacket();
BL	_constructPacket+0
;modbus.c,55 :: 		}
L_end_reciev_data_packet:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _reciev_data_packet
_checkResponse:
;modbus.c,57 :: 		void checkResponse()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modbus.c,59 :: 		if (!messageOkFlag && !messageErrFlag) // check for response
MOVW	R0, #lo_addr(_messageOkFlag+0)
MOVT	R0, #hi_addr(_messageOkFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__checkResponse67
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__checkResponse66
L__checkResponse63:
;modbus.c,61 :: 		if (sizeOfBuffer > 0 && sizeOfBuffer < 5 )
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L__checkResponse65
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	CS
BCS	L__checkResponse64
L__checkResponse62:
;modbus.c,63 :: 		sizeOfBuffer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
STRB	R1, [R0, #0]
;modbus.c,64 :: 		bus_data.buffer_errors++;
MOVW	R1, #lo_addr(_bus_data+32)
MOVT	R1, #hi_addr(_bus_data+32)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,65 :: 		messageErrFlag = 1; // set an error
MOVS	R1, #1
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
STRB	R1, [R0, #0]
;modbus.c,66 :: 		previousPolling = millis(); // start the polling delay
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
STR	R0, [R1, #0]
;modbus.c,61 :: 		if (sizeOfBuffer > 0 && sizeOfBuffer < 5 )
L__checkResponse65:
L__checkResponse64:
;modbus.c,70 :: 		if (sizeOfBuffer > 0) // if there's something in the buffer continue
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_checkResponse6
;modbus.c,72 :: 		if (frame[0] == bus_data.id) // check id returned
MOVW	R0, #lo_addr(_bus_data+0)
MOVT	R0, #hi_addr(_bus_data+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_checkResponse7
;modbus.c,76 :: 		if ((frame[1] & 0x80) == 0x80) // exctract 0x80
MOVW	R0, #lo_addr(_frame+1)
MOVT	R0, #hi_addr(_frame+1)
LDRB	R0, [R0, #0]
AND	R0, R0, #128
UXTB	R0, R0
CMP	R0, #128
IT	NE
BNE	L_checkResponse8
;modbus.c,79 :: 		switch (frame[2])
IT	AL
BAL	L_checkResponse9
;modbus.c,81 :: 		case ILLEGAL_FUNCTION: bus_data.illegal_function++; break;
L_checkResponse11:
MOVW	R1, #lo_addr(_bus_data+34)
MOVT	R1, #hi_addr(_bus_data+34)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
IT	AL
BAL	L_checkResponse10
;modbus.c,82 :: 		case ILLEGAL_DATA_ADDRESS: bus_data.illegal_data_address++; break;
L_checkResponse12:
MOVW	R1, #lo_addr(_bus_data+36)
MOVT	R1, #hi_addr(_bus_data+36)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
IT	AL
BAL	L_checkResponse10
;modbus.c,83 :: 		case ILLEGAL_DATA_VALUE: bus_data.illegal_data_value++; break;
L_checkResponse13:
MOVW	R1, #lo_addr(_bus_data+38)
MOVT	R1, #hi_addr(_bus_data+38)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
IT	AL
BAL	L_checkResponse10
;modbus.c,84 :: 		default: bus_data.misc_exceptions++;
L_checkResponse14:
MOVW	R1, #lo_addr(_bus_data+40)
MOVT	R1, #hi_addr(_bus_data+40)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;modbus.c,85 :: 		}
IT	AL
BAL	L_checkResponse10
L_checkResponse9:
MOVW	R0, #lo_addr(_frame+2)
MOVT	R0, #hi_addr(_frame+2)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_checkResponse11
MOVW	R0, #lo_addr(_frame+2)
MOVT	R0, #hi_addr(_frame+2)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_checkResponse12
MOVW	R0, #lo_addr(_frame+2)
MOVT	R0, #hi_addr(_frame+2)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_checkResponse13
IT	AL
BAL	L_checkResponse14
L_checkResponse10:
;modbus.c,86 :: 		messageErrFlag = 1; // set an error
MOVS	R1, #1
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
STRB	R1, [R0, #0]
;modbus.c,87 :: 		previousPolling = millis(); // start the polling delay
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
STR	R0, [R1, #0]
;modbus.c,88 :: 		}
IT	AL
BAL	L_checkResponse15
L_checkResponse8:
;modbus.c,91 :: 		if (frame[1] == bus_data.function) // check function number returned
MOVW	R0, #lo_addr(_bus_data+1)
MOVT	R0, #hi_addr(_bus_data+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+1)
MOVT	R0, #hi_addr(_frame+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_checkResponse16
;modbus.c,94 :: 		if (bus_data.function == PRESET_MULTIPLE_REGISTERS)
MOVW	R0, #lo_addr(_bus_data+1)
MOVT	R0, #hi_addr(_bus_data+1)
LDRB	R0, [R0, #0]
CMP	R0, #16
IT	NE
BNE	L_checkResponse17
;modbus.c,95 :: 		check_F16_data();
BL	_check_F16_data+0
IT	AL
BAL	L_checkResponse18
L_checkResponse17:
;modbus.c,97 :: 		check_F3_data(sizeOfBuffer);
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
LDRB	R0, [R0, #0]
BL	_check_F3_data+0
L_checkResponse18:
;modbus.c,98 :: 		}
IT	AL
BAL	L_checkResponse19
L_checkResponse16:
;modbus.c,101 :: 		bus_data.incorrect_function_returned++;
MOVW	R1, #lo_addr(_bus_data+26)
MOVT	R1, #hi_addr(_bus_data+26)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,102 :: 		messageErrFlag = 1; // set an error
MOVS	R1, #1
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
STRB	R1, [R0, #0]
;modbus.c,103 :: 		previousPolling = millis(); // start the polling delay
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
STR	R0, [R1, #0]
;modbus.c,104 :: 		}
L_checkResponse19:
;modbus.c,105 :: 		} // check exception response
L_checkResponse15:
;modbus.c,106 :: 		}
IT	AL
BAL	L_checkResponse20
L_checkResponse7:
;modbus.c,109 :: 		bus_data.incorrect_id_returned++;
MOVW	R1, #lo_addr(_bus_data+24)
MOVT	R1, #hi_addr(_bus_data+24)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,110 :: 		messageErrFlag = 1; // set an error
MOVS	R1, #1
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
STRB	R1, [R0, #0]
;modbus.c,111 :: 		previousPolling = millis(); // start the polling delay
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
STR	R0, [R1, #0]
;modbus.c,112 :: 		}
L_checkResponse20:
;modbus.c,113 :: 		} // check buffer
L_checkResponse6:
;modbus.c,59 :: 		if (!messageOkFlag && !messageErrFlag) // check for response
L__checkResponse67:
L__checkResponse66:
;modbus.c,115 :: 		}
L_end_checkResponse:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _checkResponse
_modbus_configure:
;modbus.c,120 :: 		void modbus_configure(unsigned int _time_out, unsigned int _polling,unsigned char _retry_count)
; _retry_count start address is: 8 (R2)
; _polling start address is: 4 (R1)
; _time_out start address is: 0 (R0)
; _retry_count end address is: 8 (R2)
; _polling end address is: 4 (R1)
; _time_out end address is: 0 (R0)
; _time_out start address is: 0 (R0)
; _polling start address is: 4 (R1)
; _retry_count start address is: 8 (R2)
;modbus.c,122 :: 		bus_data.id = 1;
MOVS	R4, #1
MOVW	R3, #lo_addr(_bus_data+0)
MOVT	R3, #hi_addr(_bus_data+0)
STRB	R4, [R3, #0]
;modbus.c,123 :: 		bus_data.register_array = system_reg;
MOVW	R4, #lo_addr(_system_reg+0)
MOVT	R4, #hi_addr(_system_reg+0)
MOVW	R3, #lo_addr(_bus_data+8)
MOVT	R3, #hi_addr(_bus_data+8)
STR	R4, [R3, #0]
;modbus.c,126 :: 		messageOkFlag = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_messageOkFlag+0)
MOVT	R3, #hi_addr(_messageOkFlag+0)
STRB	R4, [R3, #0]
;modbus.c,127 :: 		messageErrFlag = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_messageErrFlag+0)
MOVT	R3, #hi_addr(_messageErrFlag+0)
STRB	R4, [R3, #0]
;modbus.c,128 :: 		time_out = _time_out;
MOVW	R3, #lo_addr(_time_out+0)
MOVT	R3, #hi_addr(_time_out+0)
STRH	R0, [R3, #0]
; _time_out end address is: 0 (R0)
;modbus.c,129 :: 		polling = _polling;
MOVW	R3, #lo_addr(_polling+0)
MOVT	R3, #hi_addr(_polling+0)
STRH	R1, [R3, #0]
; _polling end address is: 4 (R1)
;modbus.c,130 :: 		retry_count = _retry_count;
MOVW	R3, #lo_addr(_retry_count+0)
MOVT	R3, #hi_addr(_retry_count+0)
STRB	R2, [R3, #0]
; _retry_count end address is: 8 (R2)
;modbus.c,131 :: 		previousTimeout = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_previousTimeout+0)
MOVT	R3, #hi_addr(_previousTimeout+0)
STR	R4, [R3, #0]
;modbus.c,132 :: 		previousPolling = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_previousPolling+0)
MOVT	R3, #hi_addr(_previousPolling+0)
STR	R4, [R3, #0]
;modbus.c,134 :: 		}
L_end_modbus_configure:
BX	LR
; end of _modbus_configure
_constructPacket:
;modbus.c,137 :: 		void constructPacket()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;modbus.c,139 :: 		unsigned int crc16=0;
MOVW	R0, #0
STRH	R0, [SP, #6]
;modbus.c,141 :: 		bus_data.requests++;
MOVW	R1, #lo_addr(_bus_data+12)
MOVT	R1, #hi_addr(_bus_data+12)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,142 :: 		frame[0] = bus_data.id;
MOVW	R0, #lo_addr(_bus_data+0)
MOVT	R0, #hi_addr(_bus_data+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
STRB	R1, [R0, #0]
;modbus.c,143 :: 		frame[1] = bus_data.function;
MOVW	R2, #lo_addr(_bus_data+1)
MOVT	R2, #hi_addr(_bus_data+1)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_frame+1)
MOVT	R0, #hi_addr(_frame+1)
STRB	R1, [R0, #0]
;modbus.c,144 :: 		frame[2] = Hi(bus_data.address) ; // address Hi
MOVW	R0, #lo_addr(_bus_data+3)
MOVT	R0, #hi_addr(_bus_data+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+2)
MOVT	R0, #hi_addr(_frame+2)
STRB	R1, [R0, #0]
;modbus.c,145 :: 		frame[3] = Lo(bus_data.address); // address Lo
MOVW	R0, #lo_addr(_bus_data+2)
MOVT	R0, #hi_addr(_bus_data+2)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+3)
MOVT	R0, #hi_addr(_frame+3)
STRB	R1, [R0, #0]
;modbus.c,146 :: 		frame[4] = Hi(bus_data.no_of_registers); // no_of_registers Hi
MOVW	R0, #lo_addr(_bus_data+5)
MOVT	R0, #hi_addr(_bus_data+5)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+4)
MOVT	R0, #hi_addr(_frame+4)
STRB	R1, [R0, #0]
;modbus.c,147 :: 		frame[5] = Lo(bus_data.no_of_registers); // no_of_registers Lo*/
MOVW	R0, #lo_addr(_bus_data+4)
MOVT	R0, #hi_addr(_bus_data+4)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+5)
MOVT	R0, #hi_addr(_frame+5)
STRB	R1, [R0, #0]
;modbus.c,149 :: 		if (bus_data.function == PRESET_MULTIPLE_REGISTERS)
MOV	R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #16
IT	NE
BNE	L_constructPacket21
;modbus.c,150 :: 		{ unsigned char index = 7; // user data starts at index 7
; index start address is: 20 (R5)
MOVS	R5, #7
;modbus.c,151 :: 		unsigned int temp=0;
MOVW	R0, #0
STRH	R0, [SP, #4]
;modbus.c,152 :: 		unsigned char i=0;
;modbus.c,154 :: 		unsigned char no_of_bytes = bus_data.no_of_registers * 2;
MOVW	R2, #lo_addr(_bus_data+4)
MOVT	R2, #hi_addr(_bus_data+4)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #1
;modbus.c,155 :: 		unsigned char frameSize = 9 + no_of_bytes; // first 7 bytes of the array + 2 bytes CRC+ noOfBytes
UXTB	R0, R1
ADDS	R0, #9
; frameSize start address is: 24 (R6)
UXTB	R6, R0
;modbus.c,156 :: 		unsigned char no_of_registers = bus_data.no_of_registers;
MOV	R0, R2
; no_of_registers start address is: 12 (R3)
LDRH	R3, [R0, #0]
;modbus.c,157 :: 		frame[6] = no_of_bytes; // number of bytes
UXTB	R1, R1
MOVW	R0, #lo_addr(_frame+6)
MOVT	R0, #hi_addr(_frame+6)
STRB	R1, [R0, #0]
;modbus.c,161 :: 		for (i = 0; i < no_of_registers; i++)
; i start address is: 16 (R4)
MOVS	R4, #0
; no_of_registers end address is: 12 (R3)
; frameSize end address is: 24 (R6)
; index end address is: 20 (R5)
; i end address is: 16 (R4)
L_constructPacket22:
; i start address is: 16 (R4)
; no_of_registers start address is: 12 (R3)
; frameSize start address is: 24 (R6)
; index start address is: 20 (R5)
CMP	R4, R3
IT	CS
BCS	L_constructPacket23
;modbus.c,163 :: 		temp = bus_data.register_array[i+bus_data.address]; // get the data
MOVW	R0, #lo_addr(_bus_data+2)
MOVT	R0, #hi_addr(_bus_data+2)
LDRH	R0, [R0, #0]
ADDS	R0, R4, R0
UXTH	R0, R0
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_bus_data+8)
MOVT	R0, #hi_addr(_bus_data+8)
LDR	R0, [R0, #0]
ADDS	R0, R0, R1
LDRH	R0, [R0, #0]
STRH	R0, [SP, #4]
;modbus.c,164 :: 		frame[index] = Hi(temp);
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R5
ADD	R2, SP, #4
ADDS	R0, R2, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;modbus.c,165 :: 		index++;
ADDS	R1, R5, #1
UXTB	R1, R1
UXTB	R5, R1
;modbus.c,166 :: 		frame[index] = Lo(temp);
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R1
LDRB	R0, [R2, #0]
STRB	R0, [R1, #0]
;modbus.c,167 :: 		index++;
ADDS	R5, R5, #1
UXTB	R5, R5
;modbus.c,161 :: 		for (i = 0; i < no_of_registers; i++)
ADDS	R4, R4, #1
UXTB	R4, R4
;modbus.c,168 :: 		}
; no_of_registers end address is: 12 (R3)
; index end address is: 20 (R5)
; i end address is: 16 (R4)
IT	AL
BAL	L_constructPacket22
L_constructPacket23:
;modbus.c,169 :: 		crc16 = calculateCRC(frameSize - 2);
SUBS	R0, R6, #2
UXTB	R0, R0
BL	_calculateCRC+0
STRH	R0, [SP, #6]
;modbus.c,170 :: 		frame[frameSize - 2] = Hi(crc16); // split crc into 2 bytes
SUBS	R1, R6, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R1
ADD	R2, SP, #6
ADDS	R0, R2, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;modbus.c,171 :: 		frame[frameSize - 1] = Lo(crc16);
SUBS	R1, R6, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R1
LDRB	R0, [R2, #0]
STRB	R0, [R1, #0]
;modbus.c,172 :: 		sendbus_data(frameSize);
UXTB	R0, R6
; frameSize end address is: 24 (R6)
BL	_sendbus_data+0
;modbus.c,173 :: 		}
IT	AL
BAL	L_constructPacket25
L_constructPacket21:
;modbus.c,176 :: 		crc16 = calculateCRC(6); // the first 6 bytes of the frame is used in the CRC calculation
MOVS	R0, #6
BL	_calculateCRC+0
STRH	R0, [SP, #6]
;modbus.c,177 :: 		frame[6] = Hi(crc16); //   crc Hi
ADD	R2, SP, #6
ADDS	R0, R2, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+6)
MOVT	R0, #hi_addr(_frame+6)
STRB	R1, [R0, #0]
;modbus.c,178 :: 		frame[7] = Lo(crc16); //  crc Lo
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_frame+7)
MOVT	R0, #hi_addr(_frame+7)
STRB	R1, [R0, #0]
;modbus.c,179 :: 		sendbus_data(8); // a request with function 3, 4 & 6 is always 8 bytes in size
MOVS	R0, #8
BL	_sendbus_data+0
;modbus.c,180 :: 		}
L_constructPacket25:
;modbus.c,181 :: 		}
L_end_constructPacket:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _constructPacket
_check_packet_status:
;modbus.c,185 :: 		unsigned long check_packet_status()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modbus.c,187 :: 		unsigned char pollingFinished = (millis() - previousPolling) > polling;
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
LDR	R1, [R1, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_polling+0)
MOVT	R0, #hi_addr(_polling+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
MOVW	R0, #0
BLS	L__check_packet_status80
MOVS	R0, #1
L__check_packet_status80:
; pollingFinished start address is: 8 (R2)
UXTB	R2, R0
;modbus.c,189 :: 		if (messageOkFlag && pollingFinished) // if a valid message was recieved and the polling delay has expired clear the flag
MOVW	R0, #lo_addr(_messageOkFlag+0)
MOVT	R0, #hi_addr(_messageOkFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__check_packet_status71
CMP	R2, #0
IT	EQ
BEQ	L__check_packet_status70
L__check_packet_status69:
;modbus.c,191 :: 		messageOkFlag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_messageOkFlag+0)
MOVT	R0, #hi_addr(_messageOkFlag+0)
STRB	R1, [R0, #0]
;modbus.c,192 :: 		bus_data.successful_requests++; // transaction sent successfully
MOVW	R1, #lo_addr(_bus_data+14)
MOVT	R1, #hi_addr(_bus_data+14)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,193 :: 		bus_data.retries = 0; // if a request was successful reset the retry counter
MOVS	R1, #0
MOVW	R0, #lo_addr(_bus_data+20)
MOVT	R0, #hi_addr(_bus_data+20)
STRH	R1, [R0, #0]
;modbus.c,189 :: 		if (messageOkFlag && pollingFinished) // if a valid message was recieved and the polling delay has expired clear the flag
L__check_packet_status71:
L__check_packet_status70:
;modbus.c,199 :: 		if (messageErrFlag && pollingFinished)
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__check_packet_status73
CMP	R2, #0
IT	EQ
BEQ	L__check_packet_status72
; pollingFinished end address is: 8 (R2)
L__check_packet_status68:
;modbus.c,201 :: 		messageErrFlag = 0; // clear error flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
STRB	R1, [R0, #0]
;modbus.c,202 :: 		bus_data.retries++;
MOVW	R1, #lo_addr(_bus_data+20)
MOVT	R1, #hi_addr(_bus_data+20)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,199 :: 		if (messageErrFlag && pollingFinished)
L__check_packet_status73:
L__check_packet_status72:
;modbus.c,209 :: 		if ((millis() - previousTimeout) > time_out)
BL	_millis+0
MOVW	R1, #lo_addr(_previousTimeout+0)
MOVT	R1, #hi_addr(_previousTimeout+0)
LDR	R1, [R1, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_time_out+0)
MOVT	R0, #hi_addr(_time_out+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	LS
BLS	L_check_packet_status32
;modbus.c,212 :: 		bus_data._timeout++;
MOVW	R1, #lo_addr(_bus_data+22)
MOVT	R1, #hi_addr(_bus_data+22)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,213 :: 		bus_data.retries++;
MOVW	R1, #lo_addr(_bus_data+20)
MOVT	R1, #hi_addr(_bus_data+20)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,215 :: 		}
L_check_packet_status32:
;modbus.c,219 :: 		if (retry_count==bus_data.retries){ //
MOVW	R0, #lo_addr(_bus_data+20)
MOVT	R0, #hi_addr(_bus_data+20)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_retry_count+0)
MOVT	R0, #hi_addr(_retry_count+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_check_packet_status33
;modbus.c,220 :: 		bus_data.connection = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_bus_data+41)
MOVT	R0, #hi_addr(_bus_data+41)
STRB	R1, [R0, #0]
;modbus.c,221 :: 		bus_data.retries = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_bus_data+20)
MOVT	R0, #hi_addr(_bus_data+20)
STRH	R1, [R0, #0]
;modbus.c,223 :: 		}
L_check_packet_status33:
;modbus.c,229 :: 		bus_data.incorrect_id_returned +
MOVW	R0, #lo_addr(_bus_data+24)
MOVT	R0, #hi_addr(_bus_data+24)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_bus_data+22)
MOVT	R0, #hi_addr(_bus_data+22)
LDRH	R0, [R0, #0]
ADDS	R1, R0, R1
UXTH	R1, R1
;modbus.c,230 :: 		bus_data.incorrect_function_returned +
MOVW	R0, #lo_addr(_bus_data+26)
MOVT	R0, #hi_addr(_bus_data+26)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
UXTH	R1, R1
;modbus.c,231 :: 		bus_data.incorrect_bytes_returned +
MOVW	R0, #lo_addr(_bus_data+28)
MOVT	R0, #hi_addr(_bus_data+28)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
UXTH	R1, R1
;modbus.c,232 :: 		bus_data.checksum_failed +
MOVW	R0, #lo_addr(_bus_data+30)
MOVT	R0, #hi_addr(_bus_data+30)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
UXTH	R1, R1
;modbus.c,233 :: 		bus_data.buffer_errors +
MOVW	R0, #lo_addr(_bus_data+32)
MOVT	R0, #hi_addr(_bus_data+32)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
UXTH	R1, R1
;modbus.c,234 :: 		bus_data.illegal_function +
MOVW	R0, #lo_addr(_bus_data+34)
MOVT	R0, #hi_addr(_bus_data+34)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
UXTH	R1, R1
;modbus.c,235 :: 		bus_data.illegal_data_address +
MOVW	R0, #lo_addr(_bus_data+36)
MOVT	R0, #hi_addr(_bus_data+36)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
UXTH	R1, R1
;modbus.c,236 :: 		bus_data.illegal_data_value;
MOVW	R0, #lo_addr(_bus_data+38)
MOVT	R0, #hi_addr(_bus_data+38)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
UXTH	R1, R1
MOVW	R0, #lo_addr(_bus_data+16)
MOVT	R0, #hi_addr(_bus_data+16)
STR	R1, [R0, #0]
;modbus.c,238 :: 		return  bus_data.total_errors;
LDR	R0, [R0, #0]
;modbus.c,239 :: 		}
L_end_check_packet_status:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _check_packet_status
_check_F3_data:
;modbus.c,241 :: 		void check_F3_data(unsigned char buffer)
; buffer start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;modbus.c,243 :: 		unsigned char no_of_registers = bus_data.no_of_registers;
MOVW	R1, #lo_addr(_bus_data+4)
MOVT	R1, #hi_addr(_bus_data+4)
; no_of_registers start address is: 32 (R8)
LDRH	R8, [R1, #0]
;modbus.c,244 :: 		unsigned char no_of_bytes = no_of_registers * 2;
LDRB	R1, [R1, #0]
LSLS	R1, R1, #1
;modbus.c,245 :: 		if (frame[2] == no_of_bytes) // check number of bytes returned
UXTB	R2, R1
MOVW	R1, #lo_addr(_frame+2)
MOVT	R1, #hi_addr(_frame+2)
LDRB	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L_check_F3_data34
;modbus.c,249 :: 		unsigned int recieved_crc = ((frame[buffer - 2] << 8) | frame[buffer - 1]);
SUBS	R4, R0, #2
SXTH	R4, R4
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R4
LDRB	R1, [R1, #0]
LSLS	R3, R1, #8
UXTH	R3, R3
SUBS	R2, R0, #1
SXTH	R2, R2
; buffer end address is: 0 (R0)
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
ORR	R1, R3, R1, LSL #0
; recieved_crc start address is: 36 (R9)
UXTH	R9, R1
;modbus.c,250 :: 		unsigned int calculated_crc = calculateCRC(buffer - 2);
UXTB	R0, R4
BL	_calculateCRC+0
; calculated_crc start address is: 40 (R10)
UXTH	R10, R0
;modbus.c,252 :: 		IntToStr(calculated_crc,txt);
ADD	R1, SP, #4
SXTH	R0, R0
BL	_IntToStr+0
;modbus.c,253 :: 		Ltrim(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;modbus.c,254 :: 		UART2_Write_Text(txt);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART2_Write_Text+0
;modbus.c,255 :: 		if (calculated_crc == recieved_crc) // verify checksum
CMP	R10, R9
IT	NE
BNE	L_check_F3_data35
; recieved_crc end address is: 36 (R9)
; calculated_crc end address is: 40 (R10)
;modbus.c,257 :: 		unsigned char index = 3;
; index start address is: 24 (R6)
MOVS	R6, #3
;modbus.c,258 :: 		unsigned char i = 0;
;modbus.c,260 :: 		for (i = 0; i < no_of_registers; i++)
; i start address is: 20 (R5)
MOVS	R5, #0
; no_of_registers end address is: 32 (R8)
; index end address is: 24 (R6)
; i end address is: 20 (R5)
UXTB	R0, R8
L_check_F3_data36:
; i start address is: 20 (R5)
; index start address is: 24 (R6)
; no_of_registers start address is: 0 (R0)
CMP	R5, R0
IT	CS
BCS	L_check_F3_data37
;modbus.c,263 :: 		bus_data.register_array[bus_data.address + i] = (frame[index] << 8) | frame[index + 1];
MOVW	R1, #lo_addr(_bus_data+2)
MOVT	R1, #hi_addr(_bus_data+2)
LDRH	R1, [R1, #0]
ADDS	R1, R1, R5
UXTH	R1, R1
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(_bus_data+8)
MOVT	R1, #hi_addr(_bus_data+8)
LDR	R1, [R1, #0]
ADDS	R4, R1, R2
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R6
LDRB	R1, [R1, #0]
LSLS	R3, R1, #8
UXTH	R3, R3
ADDS	R2, R6, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
ORR	R1, R3, R1, LSL #0
STRH	R1, [R4, #0]
;modbus.c,264 :: 		index += 2;
ADDS	R1, R6, #2
UXTB	R6, R1
;modbus.c,260 :: 		for (i = 0; i < no_of_registers; i++)
ADDS	R5, R5, #1
UXTB	R5, R5
;modbus.c,265 :: 		}
; no_of_registers end address is: 0 (R0)
; index end address is: 24 (R6)
; i end address is: 20 (R5)
IT	AL
BAL	L_check_F3_data36
L_check_F3_data37:
;modbus.c,266 :: 		messageOkFlag = 1; // message successful
MOVS	R2, #1
MOVW	R1, #lo_addr(_messageOkFlag+0)
MOVT	R1, #hi_addr(_messageOkFlag+0)
STRB	R2, [R1, #0]
;modbus.c,267 :: 		}
IT	AL
BAL	L_check_F3_data39
L_check_F3_data35:
;modbus.c,270 :: 		bus_data.checksum_failed++;
MOVW	R2, #lo_addr(_bus_data+30)
MOVT	R2, #hi_addr(_bus_data+30)
LDRH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;modbus.c,271 :: 		messageErrFlag = 1; // set an error
MOVS	R2, #1
MOVW	R1, #lo_addr(_messageErrFlag+0)
MOVT	R1, #hi_addr(_messageErrFlag+0)
STRB	R2, [R1, #0]
;modbus.c,272 :: 		}
L_check_F3_data39:
;modbus.c,275 :: 		previousPolling = millis();
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
STR	R0, [R1, #0]
;modbus.c,276 :: 		}
IT	AL
BAL	L_check_F3_data40
L_check_F3_data34:
;modbus.c,279 :: 		bus_data.incorrect_bytes_returned++;
MOVW	R2, #lo_addr(_bus_data+28)
MOVT	R2, #hi_addr(_bus_data+28)
LDRH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;modbus.c,280 :: 		messageErrFlag = 1; // set an error
MOVS	R2, #1
MOVW	R1, #lo_addr(_messageErrFlag+0)
MOVT	R1, #hi_addr(_messageErrFlag+0)
STRB	R2, [R1, #0]
;modbus.c,282 :: 		previousPolling = millis(); // start the polling delay
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
STR	R0, [R1, #0]
;modbus.c,283 :: 		}
L_check_F3_data40:
;modbus.c,284 :: 		}
L_end_check_F3_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _check_F3_data
_check_F16_data:
;modbus.c,286 :: 		void check_F16_data()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modbus.c,288 :: 		unsigned int recieved_address = ((frame[2] << 8) | frame[3]);
MOVW	R0, #lo_addr(_frame+2)
MOVT	R0, #hi_addr(_frame+2)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(_frame+3)
MOVT	R0, #hi_addr(_frame+3)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
; recieved_address start address is: 24 (R6)
UXTH	R6, R0
;modbus.c,289 :: 		unsigned int recieved_registers = ((frame[4] << 8) | frame[5]);
MOVW	R0, #lo_addr(_frame+4)
MOVT	R0, #hi_addr(_frame+4)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(_frame+5)
MOVT	R0, #hi_addr(_frame+5)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
; recieved_registers start address is: 28 (R7)
UXTH	R7, R0
;modbus.c,290 :: 		unsigned int recieved_crc = ((frame[6] << 8) | frame[7]); // combine the crc Low & High bytes
MOVW	R0, #lo_addr(_frame+6)
MOVT	R0, #hi_addr(_frame+6)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(_frame+7)
MOVT	R0, #hi_addr(_frame+7)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
; recieved_crc start address is: 32 (R8)
UXTH	R8, R0
;modbus.c,291 :: 		unsigned int calculated_crc = calculateCRC(6); // only the first 6 bytes are used for crc calculation
MOVS	R0, #6
BL	_calculateCRC+0
; calculated_crc start address is: 4 (R1)
UXTH	R1, R0
;modbus.c,295 :: 		recieved_registers == bus_data.no_of_registers &&
MOVW	R0, #lo_addr(_bus_data+2)
MOVT	R0, #hi_addr(_bus_data+2)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	NE
BNE	L__check_F16_data61
; recieved_address end address is: 24 (R6)
MOVW	R0, #lo_addr(_bus_data+4)
MOVT	R0, #hi_addr(_bus_data+4)
LDRH	R0, [R0, #0]
CMP	R7, R0
IT	NE
BNE	L__check_F16_data60
; recieved_registers end address is: 28 (R7)
;modbus.c,296 :: 		recieved_crc == calculated_crc){
CMP	R8, R1
IT	NE
BNE	L__check_F16_data59
; recieved_crc end address is: 32 (R8)
; calculated_crc end address is: 4 (R1)
L__check_F16_data58:
;modbus.c,297 :: 		messageOkFlag = 1; // message successful
MOVS	R1, #1
MOVW	R0, #lo_addr(_messageOkFlag+0)
MOVT	R0, #hi_addr(_messageOkFlag+0)
STRB	R1, [R0, #0]
;modbus.c,298 :: 		pushButton = false; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_check_F16_data44
;modbus.c,295 :: 		recieved_registers == bus_data.no_of_registers &&
L__check_F16_data61:
L__check_F16_data60:
;modbus.c,296 :: 		recieved_crc == calculated_crc){
L__check_F16_data59:
;modbus.c,301 :: 		bus_data.checksum_failed++;
MOVW	R1, #lo_addr(_bus_data+30)
MOVT	R1, #hi_addr(_bus_data+30)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,302 :: 		messageErrFlag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_messageErrFlag+0)
MOVT	R0, #hi_addr(_messageErrFlag+0)
STRB	R1, [R0, #0]
;modbus.c,304 :: 		}
L_check_F16_data44:
;modbus.c,306 :: 		previousPolling = millis();
BL	_millis+0
MOVW	R1, #lo_addr(_previousPolling+0)
MOVT	R1, #hi_addr(_previousPolling+0)
STR	R0, [R1, #0]
;modbus.c,307 :: 		}
L_end_check_F16_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _check_F16_data
_getData:
;modbus.c,310 :: 		unsigned char getData()
;modbus.c,312 :: 		unsigned char buffer = 0;
; buffer start address is: 0 (R0)
MOVS	R0, #0
;modbus.c,313 :: 		unsigned char overflowFlag = 0;
;modbus.c,315 :: 		return buffer;
; buffer end address is: 0 (R0)
;modbus.c,316 :: 		}
L_end_getData:
BX	LR
; end of _getData
_sendbus_data:
;modbus.c,320 :: 		void sendbus_data(unsigned char bufferSize)
; bufferSize start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; bufferSize end address is: 0 (R0)
; bufferSize start address is: 0 (R0)
;modbus.c,322 :: 		unsigned char i=0;
;modbus.c,323 :: 		for (i = 0; i < bufferSize; i++)UART2_Write(frame[i]);
; i start address is: 20 (R5)
MOVS	R5, #0
; bufferSize end address is: 0 (R0)
; i end address is: 20 (R5)
UXTB	R4, R0
L_sendbus_data45:
; i start address is: 20 (R5)
; bufferSize start address is: 16 (R4)
CMP	R5, R4
IT	CS
BCS	L_sendbus_data46
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R5
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_UART2_Write+0
ADDS	R5, R5, #1
UXTB	R5, R5
; bufferSize end address is: 16 (R4)
; i end address is: 20 (R5)
IT	AL
BAL	L_sendbus_data45
L_sendbus_data46:
;modbus.c,326 :: 		Delay_us(3645);
MOVW	R7, #14726
MOVT	R7, #2
NOP
NOP
L_sendbus_data48:
SUBS	R7, R7, #1
BNE	L_sendbus_data48
NOP
NOP
NOP
;modbus.c,327 :: 		previousTimeout = millis(); // initialize timeout delay
BL	_millis+0
MOVW	R1, #lo_addr(_previousTimeout+0)
MOVT	R1, #hi_addr(_previousTimeout+0)
STR	R0, [R1, #0]
;modbus.c,328 :: 		}
L_end_sendbus_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _sendbus_data
_calculateCRC:
;modbus.c,330 :: 		unsigned int calculateCRC(unsigned char bufferSize)
; bufferSize start address is: 0 (R0)
; bufferSize end address is: 0 (R0)
; bufferSize start address is: 0 (R0)
;modbus.c,334 :: 		temp = 0xFFFF;
; temp start address is: 12 (R3)
MOVW	R3, #65535
;modbus.c,336 :: 		for (i = 0; i < bufferSize; i++)
; i start address is: 16 (R4)
MOVS	R4, #0
; temp end address is: 12 (R3)
; bufferSize end address is: 0 (R0)
; i end address is: 16 (R4)
L_calculateCRC50:
; i start address is: 16 (R4)
; temp start address is: 12 (R3)
; bufferSize start address is: 0 (R0)
CMP	R4, R0
IT	CS
BCS	L_calculateCRC51
;modbus.c,338 :: 		temp = temp ^ frame[i];
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R4
LDRB	R1, [R1, #0]
EOR	R5, R3, R1, LSL #0
UXTH	R5, R5
; temp end address is: 12 (R3)
; temp start address is: 20 (R5)
;modbus.c,339 :: 		for ( j = 1; j <= 8; j++)
; j start address is: 12 (R3)
MOVS	R3, #1
; bufferSize end address is: 0 (R0)
; temp end address is: 20 (R5)
; j end address is: 12 (R3)
; i end address is: 16 (R4)
L_calculateCRC53:
; j start address is: 12 (R3)
; temp start address is: 20 (R5)
; bufferSize start address is: 0 (R0)
; i start address is: 16 (R4)
CMP	R3, #8
IT	HI
BHI	L_calculateCRC54
;modbus.c,341 :: 		flag = temp & 0x0001;
AND	R2, R5, #1
UXTH	R2, R2
;modbus.c,342 :: 		temp >>= 1;
LSRS	R5, R5, #1
UXTH	R5, R5
;modbus.c,343 :: 		if (flag)  temp ^= 0xA001;
CMP	R2, #0
IT	EQ
BEQ	L__calculateCRC57
MOVW	R1, #40961
EOR	R1, R5, R1, LSL #0
; temp end address is: 20 (R5)
; temp start address is: 8 (R2)
UXTH	R2, R1
; temp end address is: 8 (R2)
UXTH	R5, R2
IT	AL
BAL	L_calculateCRC56
L__calculateCRC57:
L_calculateCRC56:
;modbus.c,339 :: 		for ( j = 1; j <= 8; j++)
; temp start address is: 20 (R5)
ADDS	R3, R3, #1
UXTB	R3, R3
;modbus.c,345 :: 		}
; j end address is: 12 (R3)
IT	AL
BAL	L_calculateCRC53
L_calculateCRC54:
;modbus.c,336 :: 		for (i = 0; i < bufferSize; i++)
ADDS	R4, R4, #1
UXTB	R4, R4
;modbus.c,346 :: 		}
; bufferSize end address is: 0 (R0)
; temp end address is: 20 (R5)
; i end address is: 16 (R4)
UXTH	R3, R5
IT	AL
BAL	L_calculateCRC50
L_calculateCRC51:
;modbus.c,348 :: 		temp2 = temp >> 8;
; temp start address is: 12 (R3)
LSRS	R2, R3, #8
UXTH	R2, R2
;modbus.c,349 :: 		temp = (temp << 8) | temp2;
LSLS	R1, R3, #8
UXTH	R1, R1
; temp end address is: 12 (R3)
ORR	R2, R1, R2, LSL #0
UXTH	R2, R2
;modbus.c,350 :: 		temp &= 0xFFFF;
MOVW	R1, #65535
AND	R1, R2, R1, LSL #0
;modbus.c,351 :: 		return temp; // the returned value is already swopped - crcLo byte is first & crcHi byte is last
UXTH	R0, R1
;modbus.c,352 :: 		}
L_end_calculateCRC:
BX	LR
; end of _calculateCRC
