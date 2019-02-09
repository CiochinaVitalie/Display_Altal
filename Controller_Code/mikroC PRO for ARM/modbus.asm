_send_data_packet:
;modbus.c,44 :: 		void send_data_packet(enum _system adress,unsigned char no_reg){
; no_reg start address is: 4 (R1)
; adress start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; no_reg end address is: 4 (R1)
; adress end address is: 0 (R0)
; adress start address is: 0 (R0)
; no_reg start address is: 4 (R1)
;modbus.c,45 :: 		bus_data.id =0x01;
MOVS	R3, #1
MOVW	R2, #lo_addr(_bus_data+0)
MOVT	R2, #hi_addr(_bus_data+0)
STRB	R3, [R2, #0]
;modbus.c,46 :: 		bus_data.function = PRESET_MULTIPLE_REGISTERS;
MOVS	R3, #16
MOVW	R2, #lo_addr(_bus_data+1)
MOVT	R2, #hi_addr(_bus_data+1)
STRB	R3, [R2, #0]
;modbus.c,47 :: 		bus_data.address = (unsigned int)adress;
UXTH	R3, R0
MOVW	R2, #lo_addr(_bus_data+2)
MOVT	R2, #hi_addr(_bus_data+2)
STRH	R3, [R2, #0]
;modbus.c,48 :: 		bus_data.no_of_registers = no_reg ;
MOVW	R2, #lo_addr(_bus_data+4)
MOVT	R2, #hi_addr(_bus_data+4)
STRH	R1, [R2, #0]
;modbus.c,49 :: 		adressReg = adress;
MOVW	R2, #lo_addr(_adressReg+0)
MOVT	R2, #hi_addr(_adressReg+0)
STRH	R0, [R2, #0]
; adress end address is: 0 (R0)
;modbus.c,50 :: 		nomReg = no_reg;
MOVW	R2, #lo_addr(_nomReg+0)
MOVT	R2, #hi_addr(_nomReg+0)
STRB	R1, [R2, #0]
; no_reg end address is: 4 (R1)
;modbus.c,51 :: 		pushButton=true;
MOVS	R3, #1
MOVW	R2, #lo_addr(_pushButton+0)
MOVT	R2, #hi_addr(_pushButton+0)
STRB	R3, [R2, #0]
;modbus.c,52 :: 		constructPacket();
BL	_constructPacket+0
;modbus.c,53 :: 		}
L_end_send_data_packet:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _send_data_packet
_reciev_data_packet:
;modbus.c,54 :: 		void reciev_data_packet(enum _system adress,unsigned char no_reg){
; no_reg start address is: 4 (R1)
; adress start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; no_reg end address is: 4 (R1)
; adress end address is: 0 (R0)
; adress start address is: 0 (R0)
; no_reg start address is: 4 (R1)
;modbus.c,55 :: 		bus_data.id =0x01;
MOVS	R3, #1
MOVW	R2, #lo_addr(_bus_data+0)
MOVT	R2, #hi_addr(_bus_data+0)
STRB	R3, [R2, #0]
;modbus.c,56 :: 		bus_data.function = READ_HOLDING_REGISTERS;
MOVS	R3, #3
MOVW	R2, #lo_addr(_bus_data+1)
MOVT	R2, #hi_addr(_bus_data+1)
STRB	R3, [R2, #0]
;modbus.c,57 :: 		bus_data.address = (unsigned int)adress;
UXTH	R3, R0
MOVW	R2, #lo_addr(_bus_data+2)
MOVT	R2, #hi_addr(_bus_data+2)
STRH	R3, [R2, #0]
;modbus.c,58 :: 		bus_data.no_of_registers = no_reg ;
MOVW	R2, #lo_addr(_bus_data+4)
MOVT	R2, #hi_addr(_bus_data+4)
STRH	R1, [R2, #0]
;modbus.c,59 :: 		adressReg = adress;
MOVW	R2, #lo_addr(_adressReg+0)
MOVT	R2, #hi_addr(_adressReg+0)
STRH	R0, [R2, #0]
; adress end address is: 0 (R0)
;modbus.c,60 :: 		nomReg =  no_reg;
MOVW	R2, #lo_addr(_nomReg+0)
MOVT	R2, #hi_addr(_nomReg+0)
STRB	R1, [R2, #0]
; no_reg end address is: 4 (R1)
;modbus.c,61 :: 		msgOk=false;
MOVS	R3, #0
MOVW	R2, #lo_addr(_msgOk+0)
MOVT	R2, #hi_addr(_msgOk+0)
STRB	R3, [R2, #0]
;modbus.c,62 :: 		constructPacket();
BL	_constructPacket+0
;modbus.c,64 :: 		}
L_end_reciev_data_packet:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _reciev_data_packet
_checkResponse:
;modbus.c,66 :: 		void checkResponse()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modbus.c,69 :: 		if (frame[0] == bus_data.id) // check id returned
MOVW	R0, #lo_addr(_bus_data+0)
MOVT	R0, #hi_addr(_bus_data+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_checkResponse0
;modbus.c,71 :: 		if (frame[1] == bus_data.function) // check function number returned
MOVW	R0, #lo_addr(_bus_data+1)
MOVT	R0, #hi_addr(_bus_data+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+1)
MOVT	R0, #hi_addr(_frame+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_checkResponse1
;modbus.c,74 :: 		if (bus_data.function == PRESET_MULTIPLE_REGISTERS) check_F16_data();
MOVW	R0, #lo_addr(_bus_data+1)
MOVT	R0, #hi_addr(_bus_data+1)
LDRB	R0, [R0, #0]
CMP	R0, #16
IT	NE
BNE	L_checkResponse2
BL	_check_F16_data+0
IT	AL
BAL	L_checkResponse3
L_checkResponse2:
;modbus.c,76 :: 		else  check_F3_data(sizeOfBuffer);
MOVW	R0, #lo_addr(_sizeOfBuffer+0)
MOVT	R0, #hi_addr(_sizeOfBuffer+0)
LDRB	R0, [R0, #0]
BL	_check_F3_data+0
L_checkResponse3:
;modbus.c,77 :: 		}
L_checkResponse1:
;modbus.c,79 :: 		}
L_checkResponse0:
;modbus.c,83 :: 		}
L_end_checkResponse:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _checkResponse
_modbus_configure:
;modbus.c,86 :: 		void modbus_configure(unsigned int _time_out, unsigned int _polling,unsigned char _retry_count)
; _retry_count start address is: 8 (R2)
; _polling start address is: 4 (R1)
; _time_out start address is: 0 (R0)
; _retry_count end address is: 8 (R2)
; _polling end address is: 4 (R1)
; _time_out end address is: 0 (R0)
; _time_out start address is: 0 (R0)
; _polling start address is: 4 (R1)
; _retry_count start address is: 8 (R2)
;modbus.c,88 :: 		bus_data.id = 1;
MOVS	R4, #1
MOVW	R3, #lo_addr(_bus_data+0)
MOVT	R3, #hi_addr(_bus_data+0)
STRB	R4, [R3, #0]
;modbus.c,89 :: 		bus_data.register_array = system_reg;
MOVW	R4, #lo_addr(_system_reg+0)
MOVT	R4, #hi_addr(_system_reg+0)
MOVW	R3, #lo_addr(_bus_data+8)
MOVT	R3, #hi_addr(_bus_data+8)
STR	R4, [R3, #0]
;modbus.c,92 :: 		messageOkFlag = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_messageOkFlag+0)
MOVT	R3, #hi_addr(_messageOkFlag+0)
STRB	R4, [R3, #0]
;modbus.c,93 :: 		messageErrFlag = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_messageErrFlag+0)
MOVT	R3, #hi_addr(_messageErrFlag+0)
STRB	R4, [R3, #0]
;modbus.c,94 :: 		time_out = _time_out;
MOVW	R3, #lo_addr(_time_out+0)
MOVT	R3, #hi_addr(_time_out+0)
STRH	R0, [R3, #0]
; _time_out end address is: 0 (R0)
;modbus.c,95 :: 		polling = _polling;
MOVW	R3, #lo_addr(_polling+0)
MOVT	R3, #hi_addr(_polling+0)
STRH	R1, [R3, #0]
; _polling end address is: 4 (R1)
;modbus.c,96 :: 		retry_count = _retry_count;
MOVW	R3, #lo_addr(_retry_count+0)
MOVT	R3, #hi_addr(_retry_count+0)
STRB	R2, [R3, #0]
; _retry_count end address is: 8 (R2)
;modbus.c,97 :: 		previousTimeout = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_previousTimeout+0)
MOVT	R3, #hi_addr(_previousTimeout+0)
STR	R4, [R3, #0]
;modbus.c,98 :: 		previousPolling = 0;
MOVS	R4, #0
MOVW	R3, #lo_addr(_previousPolling+0)
MOVT	R3, #hi_addr(_previousPolling+0)
STR	R4, [R3, #0]
;modbus.c,100 :: 		}
L_end_modbus_configure:
BX	LR
; end of _modbus_configure
_constructPacket:
;modbus.c,103 :: 		void constructPacket()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;modbus.c,105 :: 		unsigned int crc16=0;
MOVW	R0, #0
STRH	R0, [SP, #6]
;modbus.c,108 :: 		bus_data.requests++;
MOVW	R1, #lo_addr(_bus_data+12)
MOVT	R1, #hi_addr(_bus_data+12)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;modbus.c,109 :: 		frame[0] = bus_data.id;
MOVW	R0, #lo_addr(_bus_data+0)
MOVT	R0, #hi_addr(_bus_data+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
STRB	R1, [R0, #0]
;modbus.c,110 :: 		frame[1] = bus_data.function;
MOVW	R2, #lo_addr(_bus_data+1)
MOVT	R2, #hi_addr(_bus_data+1)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_frame+1)
MOVT	R0, #hi_addr(_frame+1)
STRB	R1, [R0, #0]
;modbus.c,111 :: 		frame[2] = Hi(bus_data.address) ; // address Hi
MOVW	R0, #lo_addr(_bus_data+3)
MOVT	R0, #hi_addr(_bus_data+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+2)
MOVT	R0, #hi_addr(_frame+2)
STRB	R1, [R0, #0]
;modbus.c,112 :: 		frame[3] = Lo(bus_data.address); // address Lo
MOVW	R0, #lo_addr(_bus_data+2)
MOVT	R0, #hi_addr(_bus_data+2)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+3)
MOVT	R0, #hi_addr(_frame+3)
STRB	R1, [R0, #0]
;modbus.c,113 :: 		frame[4] = Hi(bus_data.no_of_registers); // no_of_registers Hi
MOVW	R0, #lo_addr(_bus_data+5)
MOVT	R0, #hi_addr(_bus_data+5)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+4)
MOVT	R0, #hi_addr(_frame+4)
STRB	R1, [R0, #0]
;modbus.c,114 :: 		frame[5] = Lo(bus_data.no_of_registers); // no_of_registers Lo*/
MOVW	R0, #lo_addr(_bus_data+4)
MOVT	R0, #hi_addr(_bus_data+4)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+5)
MOVT	R0, #hi_addr(_frame+5)
STRB	R1, [R0, #0]
;modbus.c,117 :: 		if (bus_data.function == PRESET_MULTIPLE_REGISTERS)
MOV	R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #16
IT	NE
BNE	L_constructPacket4
;modbus.c,118 :: 		{ unsigned char index = 7; // user data starts at index 7
; index start address is: 12 (R3)
MOVS	R3, #7
;modbus.c,119 :: 		unsigned int temp=0;
MOVW	R0, #0
STRH	R0, [SP, #4]
;modbus.c,120 :: 		unsigned int i=0;
;modbus.c,122 :: 		unsigned char no_of_bytes = bus_data.no_of_registers * 2;
MOVW	R2, #lo_addr(_bus_data+4)
MOVT	R2, #hi_addr(_bus_data+4)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #1
;modbus.c,123 :: 		unsigned char frameSize = 9 + no_of_bytes; // first 7 bytes of the array + 2 bytes CRC+ noOfBytes
UXTB	R0, R1
ADDS	R0, #9
; frameSize start address is: 24 (R6)
UXTB	R6, R0
;modbus.c,125 :: 		frame[6] = no_of_bytes; // number of bytes
UXTB	R1, R1
MOVW	R0, #lo_addr(_frame+6)
MOVT	R0, #hi_addr(_frame+6)
STRB	R1, [R0, #0]
;modbus.c,126 :: 		maxData = bus_data.address + no_of_registers *10;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVS	R0, #10
SXTH	R0, R0
MUL	R2, R1, R0
SXTH	R2, R2
MOVW	R1, #lo_addr(_bus_data+2)
MOVT	R1, #hi_addr(_bus_data+2)
LDRH	R0, [R1, #0]
ADDS	R0, R0, R2
; maxData start address is: 8 (R2)
UXTH	R2, R0
;modbus.c,129 :: 		for (i = bus_data.address; i < maxData;)
MOV	R0, R1
; i start address is: 16 (R4)
LDRH	R4, [R0, #0]
; index end address is: 12 (R3)
; maxData end address is: 8 (R2)
; frameSize end address is: 24 (R6)
; i end address is: 16 (R4)
UXTB	R5, R3
UXTH	R3, R2
L_constructPacket5:
; i start address is: 16 (R4)
; maxData start address is: 12 (R3)
; frameSize start address is: 24 (R6)
; index start address is: 20 (R5)
CMP	R4, R3
IT	CS
BCS	L_constructPacket6
;modbus.c,131 :: 		temp = bus_data.register_array[i]; // get the data
LSLS	R1, R4, #1
MOVW	R0, #lo_addr(_bus_data+8)
MOVT	R0, #hi_addr(_bus_data+8)
LDR	R0, [R0, #0]
ADDS	R0, R0, R1
LDRH	R0, [R0, #0]
STRH	R0, [SP, #4]
;modbus.c,132 :: 		frame[index] = Hi(temp);
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R5
ADD	R2, SP, #4
ADDS	R0, R2, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;modbus.c,133 :: 		index++;
ADDS	R1, R5, #1
UXTB	R1, R1
UXTB	R5, R1
;modbus.c,134 :: 		frame[index] = Lo(temp);
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R1
LDRB	R0, [R2, #0]
STRB	R0, [R1, #0]
;modbus.c,135 :: 		index++;
ADDS	R5, R5, #1
UXTB	R5, R5
;modbus.c,136 :: 		i+=10;
ADDS	R4, #10
UXTH	R4, R4
;modbus.c,137 :: 		}
; maxData end address is: 12 (R3)
; index end address is: 20 (R5)
; i end address is: 16 (R4)
IT	AL
BAL	L_constructPacket5
L_constructPacket6:
;modbus.c,152 :: 		crc16 = calculateCRC(frameSize - 2);
SUBS	R0, R6, #2
UXTB	R0, R0
BL	_calculateCRC+0
STRH	R0, [SP, #6]
;modbus.c,153 :: 		frame[frameSize - 2] = Hi(crc16); // split crc into 2 bytes
SUBS	R1, R6, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R1
ADD	R2, SP, #6
ADDS	R0, R2, #1
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;modbus.c,154 :: 		frame[frameSize - 1] = Lo(crc16);
SUBS	R1, R6, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_frame+0)
MOVT	R0, #hi_addr(_frame+0)
ADDS	R1, R0, R1
LDRB	R0, [R2, #0]
STRB	R0, [R1, #0]
;modbus.c,155 :: 		sendbus_data(frameSize);
UXTB	R0, R6
; frameSize end address is: 24 (R6)
BL	_sendbus_data+0
;modbus.c,156 :: 		}
IT	AL
BAL	L_constructPacket8
L_constructPacket4:
;modbus.c,159 :: 		crc16 = calculateCRC(6); // the first 6 bytes of the frame is used in the CRC calculation
MOVS	R0, #6
BL	_calculateCRC+0
STRH	R0, [SP, #6]
;modbus.c,160 :: 		frame[6] = Hi(crc16); //   crc Hi
ADD	R2, SP, #6
ADDS	R0, R2, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_frame+6)
MOVT	R0, #hi_addr(_frame+6)
STRB	R1, [R0, #0]
;modbus.c,161 :: 		frame[7] = Lo(crc16); //  crc Lo
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_frame+7)
MOVT	R0, #hi_addr(_frame+7)
STRB	R1, [R0, #0]
;modbus.c,162 :: 		sendbus_data(8); // a request with function 3, 4 & 6 is always 8 bytes in size
MOVS	R0, #8
BL	_sendbus_data+0
;modbus.c,163 :: 		}
L_constructPacket8:
;modbus.c,164 :: 		}
L_end_constructPacket:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _constructPacket
_check_F3_data:
;modbus.c,167 :: 		void check_F3_data(unsigned char buffer)
; buffer start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;modbus.c,169 :: 		unsigned char no_of_registers = bus_data.no_of_registers ;
MOVW	R1, #lo_addr(_bus_data+4)
MOVT	R1, #hi_addr(_bus_data+4)
; no_of_registers start address is: 24 (R6)
LDRH	R6, [R1, #0]
;modbus.c,170 :: 		unsigned char no_of_bytes = no_of_registers * 2;
LDRB	R1, [R1, #0]
LSLS	R1, R1, #1
;modbus.c,171 :: 		if (frame[2] == no_of_bytes) // check number of bytes returned
UXTB	R2, R1
MOVW	R1, #lo_addr(_frame+2)
MOVT	R1, #hi_addr(_frame+2)
LDRB	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L_check_F3_data9
;modbus.c,175 :: 		unsigned int recieved_crc = ((frame[buffer - 2] << 8) | frame[buffer - 1]);
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
; recieved_crc start address is: 28 (R7)
UXTH	R7, R1
;modbus.c,176 :: 		unsigned int calculated_crc = calculateCRC(buffer - 2);
UXTB	R0, R4
BL	_calculateCRC+0
;modbus.c,191 :: 		if (calculated_crc == recieved_crc) // verify checksum
CMP	R0, R7
IT	NE
BNE	L_check_F3_data10
; recieved_crc end address is: 28 (R7)
;modbus.c,194 :: 		unsigned char index = 3;
; index start address is: 28 (R7)
MOVS	R7, #3
;modbus.c,195 :: 		unsigned char i = 0;
;modbus.c,196 :: 		int incAdr=0;
; incAdr start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
;modbus.c,199 :: 		for (i = 0; i < no_of_registers; i++)
; i start address is: 20 (R5)
MOVS	R5, #0
; no_of_registers end address is: 24 (R6)
; incAdr end address is: 0 (R0)
; index end address is: 28 (R7)
; i end address is: 20 (R5)
STRH	R0, [SP, #4]
UXTB	R0, R6
LDRSH	R6, [SP, #4]
L_check_F3_data11:
; i start address is: 20 (R5)
; incAdr start address is: 24 (R6)
; index start address is: 28 (R7)
; no_of_registers start address is: 0 (R0)
CMP	R5, R0
IT	CS
BCS	L_check_F3_data12
;modbus.c,202 :: 		system_reg[bus_data.address + incAdr] = (frame[index] << 8) | frame[index + 1];
MOVW	R1, #lo_addr(_bus_data+2)
MOVT	R1, #hi_addr(_bus_data+2)
LDRH	R1, [R1, #0]
ADDS	R1, R1, R6
UXTH	R1, R1
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(_system_reg+0)
MOVT	R1, #hi_addr(_system_reg+0)
ADDS	R4, R1, R2
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R7
LDRB	R1, [R1, #0]
LSLS	R3, R1, #8
UXTH	R3, R3
ADDS	R2, R7, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
ORR	R1, R3, R1, LSL #0
STRH	R1, [R4, #0]
;modbus.c,207 :: 		index += 2;
ADDS	R1, R7, #2
UXTB	R7, R1
;modbus.c,208 :: 		incAdr+=10;
ADDS	R6, #10
SXTH	R6, R6
;modbus.c,199 :: 		for (i = 0; i < no_of_registers; i++)
ADDS	R5, R5, #1
UXTB	R5, R5
;modbus.c,209 :: 		}
; no_of_registers end address is: 0 (R0)
; index end address is: 28 (R7)
; incAdr end address is: 24 (R6)
; i end address is: 20 (R5)
IT	AL
BAL	L_check_F3_data11
L_check_F3_data12:
;modbus.c,210 :: 		msgOk = true; // message successful
MOVS	R2, #1
MOVW	R1, #lo_addr(_msgOk+0)
MOVT	R1, #hi_addr(_msgOk+0)
STRB	R2, [R1, #0]
;modbus.c,211 :: 		}
L_check_F3_data10:
;modbus.c,212 :: 		}
L_check_F3_data9:
;modbus.c,213 :: 		}
L_end_check_F3_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _check_F3_data
_check_F16_data:
;modbus.c,215 :: 		void check_F16_data()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;modbus.c,217 :: 		unsigned int recieved_address = ((frame[2] << 8) | frame[3]);
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
;modbus.c,218 :: 		unsigned int recieved_registers = ((frame[4] << 8) | frame[5]);
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
;modbus.c,219 :: 		unsigned int recieved_crc = ((frame[6] << 8) | frame[7]); // combine the crc Low & High bytes
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
;modbus.c,220 :: 		unsigned int calculated_crc = calculateCRC(6); // only the first 6 bytes are used for crc calculation
MOVS	R0, #6
BL	_calculateCRC+0
; calculated_crc start address is: 4 (R1)
UXTH	R1, R0
;modbus.c,224 :: 		recieved_registers == bus_data.no_of_registers &&
MOVW	R0, #lo_addr(_bus_data+2)
MOVT	R0, #hi_addr(_bus_data+2)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	NE
BNE	L__check_F16_data33
; recieved_address end address is: 24 (R6)
MOVW	R0, #lo_addr(_bus_data+4)
MOVT	R0, #hi_addr(_bus_data+4)
LDRH	R0, [R0, #0]
CMP	R7, R0
IT	NE
BNE	L__check_F16_data32
; recieved_registers end address is: 28 (R7)
;modbus.c,225 :: 		recieved_crc == calculated_crc){
CMP	R8, R1
IT	NE
BNE	L__check_F16_data31
; recieved_crc end address is: 32 (R8)
; calculated_crc end address is: 4 (R1)
L__check_F16_data30:
;modbus.c,226 :: 		messageOkFlag = 1; // message successful
MOVS	R1, #1
MOVW	R0, #lo_addr(_messageOkFlag+0)
MOVT	R0, #hi_addr(_messageOkFlag+0)
STRB	R1, [R0, #0]
;modbus.c,227 :: 		pushButton = false; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_pushButton+0)
MOVT	R0, #hi_addr(_pushButton+0)
STRB	R1, [R0, #0]
;modbus.c,224 :: 		recieved_registers == bus_data.no_of_registers &&
L__check_F16_data33:
L__check_F16_data32:
;modbus.c,225 :: 		recieved_crc == calculated_crc){
L__check_F16_data31:
;modbus.c,229 :: 		}
L_end_check_F16_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _check_F16_data
_sendbus_data:
;modbus.c,232 :: 		void sendbus_data(unsigned char bufferSize)
; bufferSize start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; bufferSize end address is: 0 (R0)
; bufferSize start address is: 0 (R0)
;modbus.c,234 :: 		unsigned char i=0;
;modbus.c,235 :: 		for (i = 0; i < bufferSize; i++)UART2_Write(frame[i]);
; i start address is: 20 (R5)
MOVS	R5, #0
; bufferSize end address is: 0 (R0)
; i end address is: 20 (R5)
UXTB	R4, R0
L_sendbus_data17:
; i start address is: 20 (R5)
; bufferSize start address is: 16 (R4)
CMP	R5, R4
IT	CS
BCS	L_sendbus_data18
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
BAL	L_sendbus_data17
L_sendbus_data18:
;modbus.c,236 :: 		Delay_us(3645);
MOVW	R7, #51176
MOVT	R7, #2
NOP
NOP
L_sendbus_data20:
SUBS	R7, R7, #1
BNE	L_sendbus_data20
NOP
NOP
NOP
;modbus.c,237 :: 		previousTimeout = millis(); // initialize timeout delay
BL	_millis+0
MOVW	R1, #lo_addr(_previousTimeout+0)
MOVT	R1, #hi_addr(_previousTimeout+0)
STR	R0, [R1, #0]
;modbus.c,238 :: 		}
L_end_sendbus_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _sendbus_data
_calculateCRC:
;modbus.c,240 :: 		unsigned int calculateCRC(unsigned char bufferSize)
; bufferSize start address is: 0 (R0)
; bufferSize end address is: 0 (R0)
; bufferSize start address is: 0 (R0)
;modbus.c,244 :: 		temp = 0xFFFF;
; temp start address is: 12 (R3)
MOVW	R3, #65535
;modbus.c,246 :: 		for (i = 0; i < bufferSize; i++)
; i start address is: 16 (R4)
MOVS	R4, #0
; temp end address is: 12 (R3)
; bufferSize end address is: 0 (R0)
; i end address is: 16 (R4)
L_calculateCRC22:
; i start address is: 16 (R4)
; temp start address is: 12 (R3)
; bufferSize start address is: 0 (R0)
CMP	R4, R0
IT	CS
BCS	L_calculateCRC23
;modbus.c,248 :: 		temp = temp ^ frame[i];
MOVW	R1, #lo_addr(_frame+0)
MOVT	R1, #hi_addr(_frame+0)
ADDS	R1, R1, R4
LDRB	R1, [R1, #0]
EOR	R5, R3, R1, LSL #0
UXTH	R5, R5
; temp end address is: 12 (R3)
; temp start address is: 20 (R5)
;modbus.c,249 :: 		for ( j = 1; j <= 8; j++)
; j start address is: 12 (R3)
MOVS	R3, #1
; bufferSize end address is: 0 (R0)
; temp end address is: 20 (R5)
; j end address is: 12 (R3)
; i end address is: 16 (R4)
L_calculateCRC25:
; j start address is: 12 (R3)
; temp start address is: 20 (R5)
; bufferSize start address is: 0 (R0)
; i start address is: 16 (R4)
CMP	R3, #8
IT	HI
BHI	L_calculateCRC26
;modbus.c,251 :: 		flag = temp & 0x0001;
AND	R2, R5, #1
UXTH	R2, R2
;modbus.c,252 :: 		temp >>= 1;
LSRS	R5, R5, #1
UXTH	R5, R5
;modbus.c,253 :: 		if (flag)temp ^= 0xA001;
CMP	R2, #0
IT	EQ
BEQ	L__calculateCRC29
MOVW	R1, #40961
EOR	R1, R5, R1, LSL #0
; temp end address is: 20 (R5)
; temp start address is: 8 (R2)
UXTH	R2, R1
; temp end address is: 8 (R2)
UXTH	R5, R2
IT	AL
BAL	L_calculateCRC28
L__calculateCRC29:
L_calculateCRC28:
;modbus.c,249 :: 		for ( j = 1; j <= 8; j++)
; temp start address is: 20 (R5)
ADDS	R3, R3, #1
UXTB	R3, R3
;modbus.c,255 :: 		}
; j end address is: 12 (R3)
IT	AL
BAL	L_calculateCRC25
L_calculateCRC26:
;modbus.c,246 :: 		for (i = 0; i < bufferSize; i++)
ADDS	R4, R4, #1
UXTB	R4, R4
;modbus.c,256 :: 		}
; bufferSize end address is: 0 (R0)
; temp end address is: 20 (R5)
; i end address is: 16 (R4)
UXTH	R3, R5
IT	AL
BAL	L_calculateCRC22
L_calculateCRC23:
;modbus.c,258 :: 		temp2 = temp >> 8;
; temp start address is: 12 (R3)
LSRS	R2, R3, #8
UXTH	R2, R2
;modbus.c,259 :: 		temp = (temp << 8) | temp2;
LSLS	R1, R3, #8
UXTH	R1, R1
; temp end address is: 12 (R3)
ORR	R2, R1, R2, LSL #0
UXTH	R2, R2
;modbus.c,260 :: 		temp &= 0xFFFF;
MOVW	R1, #65535
AND	R1, R2, R1, LSL #0
;modbus.c,261 :: 		return temp; // the returned value is already swopped - crcLo byte is first & crcHi byte is last
UXTH	R0, R1
;modbus.c,262 :: 		}
L_end_calculateCRC:
BX	LR
; end of _calculateCRC
