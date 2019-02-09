
#include "Controller_objects.h"
#include "systick.h"
#include <stdint.h>
#include <stdbool.h>
#include "built_in.h"

extern bool sendMessage;
extern volatile bool end_packet;
extern volatile  unsigned char sizeOfBuffer;
//------------------------------------------------------------------------------
extern   void (*send_data_again)();
extern bool pushButton,msgOk;

//------------------------------------------------------------------------------

unsigned char messageOkFlag, messageErrFlag;
unsigned char retry_count;
// frame[] is used to recieve and transmit packages.
// The maximum number of bytes in a modbus packet is 256 bytes
// This is limited to the serial buffer of 128 bytes
volatile uint8_t frame[BUFFER_SIZE];
unsigned int time_out, polling;
unsigned long previousTimeout, previousPolling;
unsigned int total_no_of_packets;
int system_reg[600]={0};
Packet bus_data;
//

//------------------------------------------------------------------------------
//void modbus_update();
void modbus_configure(unsigned int _time_out, unsigned int _polling,unsigned char _retry_count);
extern void constructPacket();
void sendbus_data(unsigned char bufferSize);
unsigned int calculateCRC(unsigned char bufferSize);
unsigned char getData();
unsigned long check_packet_status();
void check_F3_data(unsigned char buffer);
void check_F16_data();
void checkResponse();
void send_data_packet(enum _system adress,unsigned char no_reg);
void reciev_data_packet(enum _system adress,unsigned char no_reg);
//------------------------------------------------------------------------------
 void send_data_packet(enum _system adress,unsigned char no_reg){
          bus_data.id =0x01;
          bus_data.function = PRESET_MULTIPLE_REGISTERS;
          bus_data.address = (unsigned int)adress;
          bus_data.no_of_registers = no_reg ;
          adressReg = adress;
          nomReg = no_reg;
          pushButton=true;
          constructPacket();
 }
 void reciev_data_packet(enum _system adress,unsigned char no_reg){
          bus_data.id =0x01;
          bus_data.function = READ_HOLDING_REGISTERS;
          bus_data.address = (unsigned int)adress;
          bus_data.no_of_registers = no_reg ;
          adressReg = adress;
          nomReg =  no_reg;
          msgOk=false;
          constructPacket();

 }

 void checkResponse()
{

      if (frame[0] == bus_data.id) // check id returned
      {     //UART2_Write_Text("L4,");
                                        if (frame[1] == bus_data.function) // check function number returned
                                        {   //UART2_Write_Text("L5,");
                                                // receive the frame according to the modbus function
                                                if (bus_data.function == PRESET_MULTIPLE_REGISTERS) check_F16_data();

                                                else  check_F3_data(sizeOfBuffer);
                                        }

        }



}

//------------------------------------------------------------------------------
 void modbus_configure(unsigned int _time_out, unsigned int _polling,unsigned char _retry_count)
  {
        bus_data.id = 1;
        bus_data.register_array = system_reg;
        // initialize
        //transmission_ready_Flag = 1;
        messageOkFlag = 0;
        messageErrFlag = 0;
        time_out = _time_out;
        polling = _polling;
        retry_count = _retry_count;
        previousTimeout = 0;
        previousPolling = 0;

  }

//------------------------------------------------------------------------------
void constructPacket()
{
  unsigned int crc16=0;
  unsigned int maxData;
  //transmission_ready_Flag = 0; // disable the next transmission
  bus_data.requests++;
  frame[0] = bus_data.id;
  frame[1] = bus_data.function;
  frame[2] = Hi(bus_data.address) ; // address Hi
  frame[3] = Lo(bus_data.address); // address Lo
  frame[4] = Hi(bus_data.no_of_registers); // no_of_registers Hi
  frame[5] = Lo(bus_data.no_of_registers); // no_of_registers Lo*/

  //
  if (bus_data.function == PRESET_MULTIPLE_REGISTERS)
  { unsigned char index = 7; // user data starts at index 7
    unsigned int temp=0;
    unsigned int i=0;
    char txt[7];
    unsigned char no_of_bytes = bus_data.no_of_registers * 2;
    unsigned char frameSize = 9 + no_of_bytes; // first 7 bytes of the array + 2 bytes CRC+ noOfBytes
    unsigned char no_of_registers = bus_data.no_of_registers;
    frame[6] = no_of_bytes; // number of bytes
    maxData = bus_data.address + no_of_registers *10;


      for (i = bus_data.address; i < maxData;)
    {
      temp = bus_data.register_array[i]; // get the data
      frame[index] = Hi(temp);
      index++;
      frame[index] = Lo(temp);
      index++;
      i+=10;
    }
      /*IntToStr(frame[7], txt);Ltrim(txt);//
      UART2_Write_Text("frame[7]="); UART2_Write_Text(txt);
      UART2_Write_Text("\r\n");
       IntToStr(frame[8], txt);Ltrim(txt);//
      UART2_Write_Text("frame[8]=");  UART2_Write_Text(txt);
      UART2_Write_Text("\r\n");

      IntToStr(frame[9], txt);Ltrim(txt);//
      UART2_Write_Text("frame[9]="); UART2_Write_Text(txt);
      UART2_Write_Text("\r\n");
       IntToStr(frame[10], txt);Ltrim(txt);//
      UART2_Write_Text("frame[10]=");  UART2_Write_Text(txt);
      UART2_Write_Text("\r\n");*/
      
    crc16 = calculateCRC(frameSize - 2);
    frame[frameSize - 2] = Hi(crc16); // split crc into 2 bytes
    frame[frameSize - 1] = Lo(crc16);
    sendbus_data(frameSize);
  }
else // READ_HOLDING_REGISTERS is assumed
        {
    crc16 = calculateCRC(6); // the first 6 bytes of the frame is used in the CRC calculation
    frame[6] = Hi(crc16); //   crc Hi
    frame[7] = Lo(crc16); //  crc Lo
    sendbus_data(8); // a request with function 3, 4 & 6 is always 8 bytes in size
        }
}
//------------------------------------------------------------------------------

void check_F3_data(unsigned char buffer)
{  char txt[7];
  unsigned char no_of_registers = bus_data.no_of_registers ;
  unsigned char no_of_bytes = no_of_registers * 2;
  if (frame[2] == no_of_bytes) // check number of bytes returned
  {  //
    // combine the crc Low & High bytes
    char txt[7];
    unsigned int recieved_crc = ((frame[buffer - 2] << 8) | frame[buffer - 1]);
    unsigned int calculated_crc = calculateCRC(buffer - 2);
    /*UART2_Write_Text("L10,");
    IntToStr(calculated_crc,txt);
    Ltrim(txt);
    UART2_Write_Text(txt);
    UART2_Write_Text(",");
    IntToStr(recieved_crc,txt);
    Ltrim(txt);
    UART2_Write_Text(txt);
    UART2_Write_Text(",");
    IntToStr(buffer,txt);
    Ltrim(txt);
    UART2_Write_Text(txt);
    UART2_Write_Text(".");*/
    //UART2_Write_Text(txt);
    if (calculated_crc == recieved_crc) // verify checksum
    {  
      //UART2_Write_Text("L11,");
      unsigned char index = 3;
      unsigned char i = 0;
      int incAdr=0;
      char txt[15];
      //UART2_Write_Text("L11,");
    for (i = 0; i < no_of_registers; i++)
      {
        // start at the 4th element in the recieveFrame and combine the Lo byte
        system_reg[bus_data.address + incAdr] = (frame[index] << 8) | frame[index + 1];
        /*IntToStr(bus_data.register_array[bus_data.address + incAdr], txt);Ltrim(txt);
         UART2_Write_Text("bus_data=");
         UART2_Write_Text(txt);
         UART2_Write_Text("\n");*/
        index += 2;
        incAdr+=10;
      }
      msgOk = true; // message successful
    }
    }
}
//------------------------------------------------------------------------------
void check_F16_data()
{
  unsigned int recieved_address = ((frame[2] << 8) | frame[3]);
  unsigned int recieved_registers = ((frame[4] << 8) | frame[5]);
  unsigned int recieved_crc = ((frame[6] << 8) | frame[7]); // combine the crc Low & High bytes
  unsigned int calculated_crc = calculateCRC(6); // only the first 6 bytes are used for crc calculation

  // check the whole packet
  if (recieved_address == bus_data.address &&
      recieved_registers == bus_data.no_of_registers &&
      recieved_crc == calculated_crc){
      messageOkFlag = 1; // message successful
      pushButton = false; }

}
//------------------------------------------------------------------------------

 void sendbus_data(unsigned char bufferSize)
{
         unsigned char i=0;
        for (i = 0; i < bufferSize; i++)UART2_Write(frame[i]);
         Delay_us(3645);
         previousTimeout = millis(); // initialize timeout delay
}
//------------------------------------------------------------------------------
 unsigned int calculateCRC(unsigned char bufferSize)
{
  unsigned int temp, temp2, flag;
  unsigned char i,j;
  temp = 0xFFFF;

 for (i = 0; i < bufferSize; i++)
  {
    temp = temp ^ frame[i];
    for ( j = 1; j <= 8; j++)
    {
      flag = temp & 0x0001;
      temp >>= 1;
     if (flag)temp ^= 0xA001;

    }
  }
  // Reverse byte order.
  temp2 = temp >> 8;
  temp = (temp << 8) | temp2;
  temp &= 0xFFFF;
  return temp; // the returned value is already swopped - crcLo byte is first & crcHi byte is last
}