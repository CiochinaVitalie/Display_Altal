#ifndef __modbus_h
#define __modbus_h



  // function definitions
void modbus_configure(unsigned int _time_out, unsigned int _polling,unsigned char _retry_count);
void constructPacket();
void sendPacket(unsigned char bufferSize);
unsigned int calculateCRC(unsigned char bufferSize);
unsigned char getData();
void check_packet_status();
void check_F3_data(unsigned char buffer);
void check_F16_data();
 #endif