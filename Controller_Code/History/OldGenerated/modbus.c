
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
extern volatile bool pushButton;
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
          constructPacket();
 }
 void reciev_data_packet(enum _system adress,unsigned char no_reg){
          bus_data.id =0x01;
          bus_data.function = READ_HOLDING_REGISTERS;
          bus_data.address = (unsigned int)adress;
          bus_data.no_of_registers = no_reg ;
          constructPacket();
 
 }

 void checkResponse()
{
if (!messageOkFlag && !messageErrFlag) // check for response
  {
     if (sizeOfBuffer > 0 && sizeOfBuffer < 5 )
        {
          sizeOfBuffer = 0;
          bus_data.buffer_errors++;
          messageErrFlag = 1; // set an error
          previousPolling = millis(); // start the polling delay
        }


    if (sizeOfBuffer > 0) // if there's something in the buffer continue
    {  //UART2_Write_Text("L1");
      if (frame[0] == bus_data.id) // check id returned
      {   //UART2_Write_Text("L2");
                                // to indicate an exception response a slave will 'OR'
        // the requested function with 0x80
                                if ((frame[1] & 0x80) == 0x80) // exctract 0x80
                                {   //UART2_Write_Text("L3");
                                        // the third byte in the exception response packet is the actual exception
                                        switch (frame[2])
                                        {
                                                case ILLEGAL_FUNCTION: bus_data.illegal_function++; break;
                                                case ILLEGAL_DATA_ADDRESS: bus_data.illegal_data_address++; break;
                                                case ILLEGAL_DATA_VALUE: bus_data.illegal_data_value++; break;
                                                default: bus_data.misc_exceptions++;
                                        }
                                        messageErrFlag = 1; // set an error
                                        previousPolling = millis(); // start the polling delay
                                }
                                else // the response is valid
                                {  //UART2_Write_Text("L4");
                                        if (frame[1] == bus_data.function) // check function number returned
                                        {   //UART2_Write_Text("L5");
                                                // receive the frame according to the modbus function
                                                if (bus_data.function == PRESET_MULTIPLE_REGISTERS)
                                                        check_F16_data();
                                                else // READ_HOLDING_REGISTERS is assumed
                                                        check_F3_data(sizeOfBuffer);
                                        }
                                        else // incorrect function number returned
                                        {       //UART2_Write_Text("L6");
                                                bus_data.incorrect_function_returned++;
                                                messageErrFlag = 1; // set an error
                                                previousPolling = millis(); // start the polling delay
                                        }
                                } // check exception response
                        }
                        else // incorrect id returned
                        {       //UART2_Write_Text("L7");
                                bus_data.incorrect_id_returned++;
                                messageErrFlag = 1; // set an error
                                previousPolling = millis(); // start the polling delay
                        }
                } // check buffer
        } // check message booleans
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
    unsigned char i=0;

    unsigned char no_of_bytes = bus_data.no_of_registers * 2;
    unsigned char frameSize = 9 + no_of_bytes; // first 7 bytes of the array + 2 bytes CRC+ noOfBytes
    unsigned char no_of_registers = bus_data.no_of_registers;
    frame[6] = no_of_bytes; // number of bytes



      for (i = 0; i < no_of_registers;)
    {
      temp = bus_data.register_array[i+bus_data.address]; // get the data
      frame[index] = Hi(temp);
      index++;
      frame[index] = Lo(temp);
      index++;
       i+=10;
    }
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
 // checks the time out and polling delay and if a message has been recieved succesfully

unsigned long check_packet_status()
{
   unsigned char pollingFinished = (millis() - previousPolling) > polling;

if (messageOkFlag && pollingFinished) // if a valid message was recieved and the polling delay has expired clear the flag
  {
    messageOkFlag = 0;
    bus_data.successful_requests++; // transaction sent successfully
    bus_data.retries = 0; // if a request was successful reset the retry counter
    //transmission_ready_Flag = 1;
    //UART2_Write_Text("L14");
  }

  // if an error message was recieved and the polling delay has expired clear the flag
if (messageErrFlag && pollingFinished)
  {
    messageErrFlag = 0; // clear error flag
    bus_data.retries++;
    //transmission_ready_Flag = 1;
    //UART2_Write_Text("L15");

  }

  // if the timeout delay has past clear the slot number for next request
  if ((millis() - previousTimeout) > time_out)
  {
    //transmission_ready_Flag = 1;
    bus_data._timeout++;
    bus_data.retries++;
    //UART2_Write_Text("L16");
  }

  // if the number of retries have reached the max number of retries
  // allowable, stop requesting the specific packet
  if (retry_count==bus_data.retries){ //
                                   bus_data.connection = 0;
                                   bus_data.retries = 0;
                                   //UART2_Write_Text("L17");
                                  }

  // update the total_errors atribute of the //
  // packet before requesting a new one //
  //if (transmission_ready_Flag==1)
        bus_data.total_errors = bus_data._timeout +
                                bus_data.incorrect_id_returned +
                                bus_data.incorrect_function_returned +
                                bus_data.incorrect_bytes_returned +
                                bus_data.checksum_failed +
                                bus_data.buffer_errors +
                                bus_data.illegal_function +
                                bus_data.illegal_data_address +
                                bus_data.illegal_data_value;
                                //UART2_Write_Text("L18");
  return  bus_data.total_errors;
}
//------------------------------------------------------------------------------
void check_F3_data(unsigned char buffer)
{  /*char txt[7];*/
  unsigned char no_of_registers = bus_data.no_of_registers ;
  unsigned char no_of_bytes = no_of_registers * 2;
  if (frame[2] == no_of_bytes) // check number of bytes returned
  {  //
    // combine the crc Low & High bytes
    char txt[7];
    unsigned int recieved_crc = ((frame[buffer - 2] << 8) | frame[buffer - 1]);
    unsigned int calculated_crc = calculateCRC(buffer - 2);
    //UART2_Write_Text("L10;");
    // IntToStr(calculated_crc,txt);
    //Ltrim(txt);
    //UART2_Write_Text(txt);
    if (calculated_crc == recieved_crc) // verify checksum
    {  //UART2_Write_Text("L11");
      unsigned char index = 3;
      unsigned char i = 0;
      int incAdr=0;
      //UART2_Write_Text("L11");
    for (i = 0; i < no_of_registers; i++)
      {
        // start at the 4th element in the recieveFrame and combine the Lo byte
        bus_data.register_array[bus_data.address + incAdr] = (frame[index] << 8) | frame[index + 1];
        /*UART2_Write(bus_data.address + i);
        UART2_Write_Text("\n");
        UART2_Write(bus_data.register_array[bus_data.address + i]);
        UART2_Write_Text("\n");*/
        index += 2;
        incAdr+=10;
      }
      messageOkFlag = 1; // message successful
    }
    else // checksum failed
    {
      bus_data.checksum_failed++;
      messageErrFlag = 1; // set an error
    }

    // start the polling delay for messageOkFlag & messageErrFlag
    previousPolling = millis();
  }
  else // incorrect number of bytes returned
  {  //UART2_Write_Text("L13");
    bus_data.incorrect_bytes_returned++;
    messageErrFlag = 1; // set an error
    //UART2_Write_Text("L13");
    previousPolling = millis(); // start the polling delay
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
  else
  {
    bus_data.checksum_failed++;
    messageErrFlag = 1;

  }
  // start the polling delay for messageOkFlag & messageErrFlag
  previousPolling = millis();
}
//------------------------------------------------------------------------------
 // get the serial data from the buffer
unsigned char getData()
{        char txt[4];
        unsigned char buffer = 0;
        unsigned char overflowFlag = 0;

  return buffer;
 }


//------------------------------------------------------------------------------
 void sendbus_data(unsigned char bufferSize)
{
         unsigned char i=0;
        for (i = 0; i < bufferSize; i++)UART2_Write(frame[i]);
        //UART2_Write('\r');
// allow a frame delay to indicate end of transmission
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
      if (flag)  temp ^= 0xA001;

    }
  }
  // Reverse byte order.
  temp2 = temp >> 8;
  temp = (temp << 8) | temp2;
  temp &= 0xFFFF;
  return temp; // the returned value is already swopped - crcLo byte is first & crcHi byte is last
}