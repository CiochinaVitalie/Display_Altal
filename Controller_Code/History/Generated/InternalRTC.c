/************************************************************************
*                                                                       *
*      Project:  InternalRTC                                            *
*                                                                       *
*      MCU:      STM32F407VG                                            *
*      Config:   Computer_Brd_Chip_168MHz.cfgsch                        *
*      Board:    EasyMx PRO v7 for STM32 ARM                            *
*      Setup:    Turn on USB UART B.  Turn ON   SW12.3   SW12.4         *
*                                                                       *
*      Note:     - Communication with mE USART Terminal to display      *
*                  status messages.                                     *
*                - LSE oscillator to be 32.768 kHz                      *
*                - Refer to RM0090 ST Reference Manual pg 780           *
*                - See Internal clock scalers  ac:Clock                 *
*                - See STM32 Standard Peripheral Library example ac:SPL *
*                                                                       *
*************************************************************************/
#include "Controller_objects.h"
#include <stdint.h>

/*********************************
*       Declare Varriables       *
**********************************/
 // Time struct with am/pm

// variables
unsigned long RTC_Time, old_RTC_Time;
unsigned long RTC_Date, old_RTC_Date;
 TTime MyTime;
 int8_t oneMinute, tenMinute, oneHour, tenHour, oneDayU, tenDayU, oneWeekday, oneMonth, tenMonth, oneYearU, tenYearU;

 static short RTC_Bcd2ToByte(short Value)
{
  short tmp = 0;
  tmp = ((short)(Value & (short)0xF0) >> (short)0x4) * 10;
  return (tmp + (Value & (short)0x0F));
}



/*********************************
* Send Message to USART Terminal *
**********************************/
void Message (char arg[])
{
    UART2_Write(13);
    UART2_Write(10);
    UART2_Write_Text(arg);
    UART2_Write(13);
    UART2_Write(10);
}



/************************************************************
* Initializes the RTC clock prscaler registers.             *
* PREDIV_Sync  : set to 256 for a LSE clock of 32.768 kHz   *
* PREDIV_Async : set to 128 for a LSE clock of 32.768 kHz   *
* HR_Format : 0 = 24 hour/day format, 1 = AM/PM hour format *
*   Return : 1 = Success                                    *
*            0 = Failure                                    *
*************************************************************/
 void RTC_Init(){
  RCC_APB1ENR|=0x10000000;                      // Enable Clock for RTC
  PWR_CR|=0x0100;                               // Access to RTC and RTC Backup registers and backup SRAM enabled
  RCC_CSR|=0x01;                                // Wakeup flag
  while(!(RCC_CSR&0x02));                       // 1: Device has been in Standby mode


  RCC_BDCR|=0x00000200;                         // LSI oscillator clock used as the RTC clock
  RCC_BDCR|=0x00008000;                         // RTC clock enabled

  RTC_WPR=0xca;                                 // Write protection key
  RTC_WPR=0x53;                                 // Write protection key
  RTC_ISR&=0xffffffdf;                          //clear RSF flag
  while(!(RTC_ISR&0xffffffdf));                 // Calendar shadow registers not yet synchronized

  RTC_ISR|=0x80;                                // Initialization mode
  while((RTC_ISR&0x40)==0);                     // 1: Calendar registers update is allowed.

  RTC_PRER|=0x007f0000;                         // RTC prescaler register
  RTC_PRER|=0x000000ff;

  RTC_ISR&=~0x80;                               // 0: Free running mode

  RTC_WPR=0xff;                                 // Write protection key
}

/************************************************************
* Calibrate Crystal Freqency                                *
* Cal_Value : (+/- Number of ppm calibration) / 2 = DCS     *
*             DC[4:0]: Digital calibration                  *
*             DCS = 0 (positive calibration)                *
*             00000: + 0 ppm                                *
*             00001: + 4 ppm (rounded value)                *
*             00010: + 8 ppm (rounded value)                *
*             ...                                           *
*             11111: + 126 ppm (rounded value)              *
*             DCS = 1 (negative calibration)                *
*             00000: - 0 ppm                                *
*             00001: - 2 ppm (rounded value)                *
*             00010: - 4 ppm (rounded value)                *
*             ...                                           *
*             11111: - 63 ppm (rounded value)               *
*                                                           *
*************************************************************/
void Calibrate_RTC_Crystal (int Cal_Value)
{
    unsigned long          recalpfcount = 0;

    /* Check if a calibration is pending */
    if (RTC_ISR.B16 == 1)
    {
         // wait until the Calibration is completed
         while ((RTC_ISR.B16 == 1) && (recalpfcount < 131072))
               recalpfcount++;
    }

    // Determine if +/- and set value.
    if (Cal_Value < 0)
    {
         Cal_Value = abs(Cal_Value);
         Cal_Value = Cal_Value / 2;
         Cal_Value = Cal_Value & 0x001F;                                        // Only use the bottom 5 bits.
         RTC_CALIBRbits.DCS = 1;                                                // 1: Negative calibration: calendar update frequency is decreased
         RTC_CALIBRbits.DC  = (short) Cal_Value;                                // DC[4:0]: Digital calibration
    }
    else
    {
         Cal_Value = Cal_Value / 2;
         Cal_Value = Cal_Value & 0x001F;                                        // Only use the bottom 5 bits.
         RTC_CALIBRbits.DCS = 0;                                                // 0: Positive calibration: calendar update frequency is increased
         RTC_CALIBRbits.DC  = (short) Cal_Value;                                // DC[4:0]: Digital calibration
    }

}

/*******************************************************************************
* Function Set_RTC(TTime *RTCC_Time)
* ------------------------------------------------------------------------------
* Overview: Function Sets RTC Time and calendar
* Input: Time struct
* Output: Nothing
*******************************************************************************/
void Set_RTC(TTime *RTCC_Time){
unsigned long temp;

  PWR_CR.DBP = 1;

  RTC_WPR = 0xCA;                   //unlock write protection
  RTC_WPR = 0x53;                   //unlock write protection
  RTC_ISR = 0x00000080;             //enter initialization mode  bit 7
  while(RTC_ISR.INITF != 1){};      // bit 6

  RTC_PRER = 0x7f00ff;              //  set   SynchPrediv to FF and AsynchPrediv to 7F*/

  temp = (unsigned long)Dec2Bcd(RTCC_Time->hours) << 16;
  temp += (unsigned long)Dec2BCD(RTCC_Time->minutes) << 8;
  temp += (unsigned long)Dec2BCD(RTCC_Time->seconds);
  temp += (unsigned long)(RTCC_Time->ampm) << 22;

  RTC_TR = temp;

  temp = (unsigned long)Dec2Bcd(RTCC_Time->day);
  temp += (unsigned long)Dec2BCD(RTCC_Time->month) << 8;
  temp += (unsigned long)Dec2BCD(RTCC_Time->weekday) << 13;
  temp += (unsigned long)Dec2BCD(RTCC_Time->year) << 16;

  RTC_DR = temp;           // set date
  RTC_CRbits.FMT = 0;
  RTC_CRbits.WCKSEL = 0;   // set FMT 24H format

  RTC_ISR = 0x00000000;    //exit initialization mode

  RTC_WPR = 0xFF;          // Enable the write protection for RTC registers
}

/*******************************************************************************
* Function RTCC_Read(TTime *RTCC_Time)
* ------------------------------------------------------------------------------
* Overview: Function reads RTC Time and calendar
* Input: Time struct
* Output: Nothing
*******************************************************************************/
char RTCC_Read(TTime *RTCC_Time){
  char temp = 0;
    unsigned long time;

  RTC_Time = RTC_TR;       // RTC_CNTL; //for time   for STM32F107
  RTC_Date = RTC_DR;       // RTC_CNTH; //for date   for STM32F107

  if(RTC_Time != old_RTC_Time){
    old_RTC_Time = RTC_Time;

    RTCC_Time->ampm = (short)((RTC_Time & 0x400000) >> 22);
    RTCC_Time->hours = Bcd2Dec((short)((RTC_Time & 0x3f0000) >> 16));
    RTCC_Time->minutes = Bcd2Dec((short)((RTC_Time & 0x007f00) >> 8));
    RTCC_Time->seconds = Bcd2Dec((short)(RTC_Time & 0x0000ff));

    temp = 1;
  }

  if(RTC_Date != old_RTC_Date){
    old_RTC_Date = RTC_Date;

    RTCC_Time->year = Bcd2Dec((short)((RTC_Date & 0x3f0000) >> 16));
    RTCC_Time->weekday = Bcd2Dec((short)((RTC_Date & 0x00e000) >> 13));
    RTCC_Time->month = Bcd2Dec((short)((RTC_Date & 0x00001F00) >> 8));
    RTCC_Time->day = Bcd2Dec((short)(RTC_Date & 0x0000ff));

    temp = 1;
  }
  return temp;
}


/************************************************************
* RTC Get Sub-Seconds                                       *
* RTC_TimeStruct : Structure of the current time to be set. *
*   Return : Sub Seconds Value                              *
*                                                           *
*************************************************************/
unsigned RTC_GetSubSeconds (void)
{
    unsigned long     Temp_RTC_SSR;
    float             Temp_float;

    // Read from Sub Second register
    Temp_RTC_SSR = RTC_SSR;

    /* Need to read from RTC_DR to unfreeze it after RTC_SSR read */
    (void) RTC_DR;

    Temp_RTC_SSR = Temp_RTC_SSR & 0x0000FFFF;
    Temp_float = (1000 * ((float) RTC_PRERbits.PREDIV_S - (float) Temp_RTC_SSR) / ((float) RTC_PRERbits.PREDIV_S + 1));

    return (unsigned) Temp_float;
}


/************************************************************
* RTC Get current time                                      *
* RTC_TimeStruct : Structure for current time to be copied. *
*                                                           *
*************************************************************/
void RTC_GetTime(RTC_TimeTypeDef *RTC_TimeStruct)
{
    /* Get the RTC_TR Time register */
    RTC_TimeStruct->RTC_H12         =  (unsigned short) RTC_TRbits.PM;
    RTC_TimeStruct->RTC_Hour_Tens   =  (unsigned short) RTC_TRbits.HT;
    RTC_TimeStruct->RTC_Hour_Units  =  (unsigned short) RTC_TRbits.HU;
    RTC_TimeStruct->RTC_Min_Tens    =  (unsigned short) RTC_TRbits.MNT;
    RTC_TimeStruct->RTC_Min_Units   =  (unsigned short) RTC_TRbits.MNU;
    RTC_TimeStruct->RTC_Sec_Tens    =  (unsigned short) RTC_TRbits.ST;
    RTC_TimeStruct->RTC_Sec_Units   =  (unsigned short) RTC_TRbits.SU;
}



/************************************************************
* RTC Get current Date                                      *
* RTC_DateStruct : Structure for current Date to be copied. *
*                                                           *
*************************************************************/
void RTC_GetDate(RTC_DateTypeDef *RTC_DateStruct)
{
    /* Get the RTC_DR Time register */
    RTC_DateStruct->RTC_DayofWeek     =  (unsigned short) RTC_DRbits.WDU;
    RTC_DateStruct->RTC_Date_Tens     =  (unsigned short) RTC_DRbits.DT;
    RTC_DateStruct->RTC_Date_Units    =  (unsigned short) RTC_DRbits.DU;
    RTC_DateStruct->RTC_Month_Tens    =  (unsigned short) RTC_DRbits.MT;
    RTC_DateStruct->RTC_Month_Units   =  (unsigned short) RTC_DRbits.MU;
    RTC_DateStruct->RTC_Year_Tens     =  (unsigned short) RTC_DRbits.YT;
    RTC_DateStruct->RTC_Year_Units    =  (unsigned short) RTC_DRbits.YU;
}
 //-------------------------------------------------------



/************************************************************
* Print Time to USART Terminal                              *
* RTC_TimeStruct : Structure of time to be printed.         *
*                                                           *
*************************************************************/
void RTC_PrintTime(RTC_TimeTypeDef *RTC_TimeStruct)
{
    char txt[4];

    UART2_Write(13);
    UART2_Write(10);
    ByteToStr(RTC_TimeStruct->RTC_Hour_Tens, txt);
    UART2_Write_Text(txt);
    ByteToStr(RTC_TimeStruct->RTC_Hour_Units, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    UART2_Write_Text(":");
    ByteToStr(RTC_TimeStruct->RTC_Min_Tens, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    ByteToStr(RTC_TimeStruct->RTC_Min_Units, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    UART2_Write_Text(":");
    ByteToStr(RTC_TimeStruct->RTC_Sec_Tens, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    ByteToStr(RTC_TimeStruct->RTC_Sec_Units, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    
    if (RTC_TimeStruct->RTC_H12)
        UART2_Write_Text(" pm");
    else
        UART2_Write_Text(" am");
        
    UART2_Write(13);
    UART2_Write(10);
}
    


/************************************************************
* Print Date to USART Terminal                              *
* RTC_DateStruct : Structure of Date to be printed.         *
*                                                           *
*************************************************************/
void RTC_PrintDate(RTC_DateTypeDef *RTC_DateStruct)
{


    char txt[4];
    unsigned short Temp_Day;

    Temp_Day = RTC_DateStruct->RTC_DayofWeek;

    UART2_Write(13);
    UART2_Write(10);
    
    switch (Temp_Day)  {
           case 1 : UART2_Write_Text("  Mon");  break;
           case 2 : UART2_Write_Text("  Tue");  break;
           case 3 : UART2_Write_Text("  Wed");  break;
           case 4 : UART2_Write_Text("  Thu");  break;
           case 5 : UART2_Write_Text("  Fri");  break;
           case 6 : UART2_Write_Text("  Sat");  break;
           case 7 : UART2_Write_Text("  Sun");  break;
    }

    ByteToStr(RTC_DateStruct->RTC_Date_Tens, txt);
    UART2_Write_Text(txt);
    ByteToStr(RTC_DateStruct->RTC_Date_Units, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    UART2_Write_Text("/");
    ByteToStr(RTC_DateStruct->RTC_Month_Tens, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    ByteToStr(RTC_DateStruct->RTC_Month_Units, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    UART2_Write_Text("/");
    ByteToStr(RTC_DateStruct->RTC_Year_Tens, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);
    ByteToStr(RTC_DateStruct->RTC_Year_Units, txt);
    txt[0] = txt[2];    txt[1] = txt[3];
    UART2_Write_Text(txt);

    UART2_Write(13);
    UART2_Write(10);

}



/************************************************                                                                                        ************
* Print the Sub Seconds                                     *
* Value : Millisecond value to be printed range between     *
*         0 - 1000 ms.                                      *
*************************************************************/
void Print_Sub_Secs (unsigned Value)
{
    char txt[6];
    WordToStr(Value, txt);
    UART2_Write(13);
    UART2_Write(10);
    UART2_Write_Text(txt);
    UART2_Write_Text("  ms");
    UART2_Write(13);
    UART2_Write(10);
}


/*********************************
*             MAIN               *
**********************************/
/*void main()
{
    RTC_TimeTypeDef      My_Time;
    RTC_TimeTypeDef      Read_Time;
    RTC_DateTypeDef      My_Date;
    RTC_DateTypeDef      Read_Date;


    // Setup UART2 communication to mE USART Terminal.
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_USART2_PD56);
    UART2_Init(56000);                                                          // Initialize UART module at 56000 bps
    Delay_ms(200);

    Message("Program Start.");
    Delay_ms(2000);

    // Mon 31/12/2015
    My_Date.RTC_DayofWeek     = 5;
    My_Date.RTC_Date_Tens     = 3;
    My_Date.RTC_Date_Units    = 1;
    My_Date.RTC_Month_Tens    = 1;
    My_Date.RTC_Month_Units   = 2;
    My_Date.RTC_Year_Tens     = 1;
    My_Date.RTC_Year_Units    = 5;


    //09:59:30pm
    My_Time.RTC_Hour_Tens     = 0;
    My_Time.RTC_Hour_Units    = 9;
    My_Time.RTC_Min_Tens      = 5;
    My_Time.RTC_Min_Units     = 9;
    My_Time.RTC_Sec_Tens      = 3;
    My_Time.RTC_Sec_Units     = 0;
    My_Time.RTC_H12           = 1;

    // Initialise the Internal RTC Unit.
    if (RTC_Init(255, 127, 1))
         Message("RTC Initialise SUCCESS...");
    else
         Message("RTC Initialise FAILED...");
    Delay_ms(2000);

    // Set the Time.
    if (RTC_SetTime(&My_Time, -37))
         Message("Time Set SUCCESS...");
    else
         Message("Time Set FAILED...");
    Delay_ms(2000);

    // Set the Date.
    RTC_SetDate(&My_Date);


    while(1)
    {
         RTC_GetDate(&Read_Date);
         RTC_PrintDate(&Read_Date);

         RTC_GetTime(&Read_Time);
         RTC_PrintTime(&Read_Time);

         Print_Sub_Secs( RTC_GetSubSeconds() );

         Delay_ms(5012);
    }

}*/
  char Set_MyRTCC(){
    char temp;
    uint8_t minutesTemp, hoursTemp;
    int yearTemp;
    int8_t finalDayOfWeek;
   int a, y, m;

    RTCC_Read(&MyTime);

    MyTime.hours = tenHour * 10 + oneHour;
    MyTime.minutes = tenMinute * 10 + oneMinute;
    MyTime.day = tenDayU * 10 + oneDayU;
    MyTime.month = oneMonth;
    MyTime.year = tenYearU*10 + oneYearU;
    MyTime.ampm = 0;
    a = (14 - MyTime.month) / 12;
    y = MyTime.year - a;
    m = MyTime.month + 12 * a - 2;
    finalDayOfWeek = (short)((7000 + (MyTime.day + y + y / 4 - y / 100 + y / 400 + (31 * m) / 12)) % 7);  // calculate date of week
    switch(finalDayOfWeek){
        case 0:{
             finalDayOfWeek = 7;
             break;
        }
    }
    MyTime.weekday = finalDayOfWeek;

    Set_RTC(&MyTime);
    if (MyTime.day == 0)
       return 0;
    if (MyTime.year > 30)
       return 0;
    return 1;
}