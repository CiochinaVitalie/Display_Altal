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
short RTC_Init (unsigned PREDIV_Sync, unsigned short PREDIV_Async, int HR_Format)
{
    unsigned short   RTC_Wait_ctr = 0;


    /* Enable RTC and BackUp Registers  */                                      // Page 118 of RM0090 Reference Manual
    PWREN_bit = 1;                                                              // PWREN: Power interface clock enable.      (RCC APB1 peripheral clock enable register (RCC_APB1ENR))
    DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))
    RTCSEL1_bit = 0;  RTCSEL0_bit = 1;                                          // RTC Clock MUX select LSE as clock source. (RCC Backup domain control register (RCC_BDCR))
    LSEBYP_bit = 0;                                                             // LSE oscillator not bypassed.              (RCC Backup domain control register (RCC_BDCR))
    LSEON_bit = 1;                                                              // External low-speed oscillator enable.     (RCC Backup domain control register (RCC_BDCR))
    RTCEN_bit = 1;                                                              // RTC clock enabled.                        (RCC Backup domain control register (RCC_BDCR))


    /* Disable the write protection for RTC registers */                        // Page 785 of RM0090 Reference Manual
    DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))
    RTC_WPR = 0xCA;
    RTC_WPR = 0x53;


    while ((LSERDY_bit == 0) && (RTC_Wait_ctr < 150));
    {
         delay_us(1);
         RTC_Wait_ctr++;
    }

    //if (LSERDY_bit == 0)    Message("LSE Clock not ready.");

    /* Reset Counter  */
    RTC_Wait_ctr = 0;


    /* Set Initialization mode */
    if (INITF_bit == 0)
    {
         RTC_ISR.B7 = 1;                                                        //  INIT Enter Initialization mode.                (RTC initialization and status register (RTC_ISR))
         while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
         {                                                                      //  phase mode is entered when INITF is set to 1. It takes from 1
             delay_us(10);                                                      //  to 2 RTCCLK clock cycles (due to clocks synchronization).
             RTC_Wait_ctr++;                                                    //  RTCCLK = 32768 Hz  --> approx 60us delay
         }                                                                      //  We shall wait 80 us just to make sure ;)

         if (INITF_bit == 0)
         {
             //Message("Failed to enter INIT mode.");
             RTC_ISR.B7 = 0;                                                    // INIT Exit Initialization mode.                (RTC initialization and status register (RTC_ISR))
             RTC_WPR = 0xFF;                                                    // Enable the write protection for RTC registers
             return 0;                                                          // Failed to update RTC registers
         }
    }

    /* Configure the RTC PRER */
    RTC_PRERbits.PREDIV_S = PREDIV_Sync;
    RTC_PRERbits.PREDIV_A = PREDIV_Async;

    /* Set 12 / 24 hr time format */
    FMT_bit = HR_Format;

    /* Exit Initialization mode */                                              //  Bit 7 INIT: Initialization mode
    RTC_ISR.B7 = 0;                                                             //     0: Free running mode
                                                                                //     1: Initialization mode used to program time and date register (RTC_TR and RTC_DR), and
                                                                                //        prescaler register (RTC_PRER). Counters are stopped and start counting from the new
                                                                                //        value when INIT is reset.
    /* Enable the write protection for RTC registers */
    RTC_WPR = 0xFF;
    /*enable_RTC_second_interrupt(true);
    while(get_RTC_operation_state() == false);
    NVIC_IntEnable(IVT_INT_RTC_Alarm);*/
    return 1;
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



/************************************************************
* RTC set current time                                      *
* RTC_TimeStruct : Structure of the current time to be set. *
*   Return : 1 = Success                                    *
*            0 = Failure                                    *
*************************************************************/
short RTC_SetTime (RTC_TimeTypeDef *RTC_TimeStruct, int Calibration_Value)
{
    short                Func_Status;
    unsigned short       RTC_Wait_ctr             = 0;
    unsigned long        Temp_Time_Reg            = 0;

    Temp_Time_Reg = (((unsigned long) (RTC_TimeStruct->RTC_H12)         << 22) | \
                     ((unsigned long) (RTC_TimeStruct->RTC_Hour_Tens)   << 20) | \
                     ((unsigned long) (RTC_TimeStruct->RTC_Hour_Units)  << 16) | \
                     ((unsigned long) (RTC_TimeStruct->RTC_Min_Tens)    << 12) | \
                     ((unsigned long) (RTC_TimeStruct->RTC_Min_Units)   <<  8) | \
                     ((unsigned long) (RTC_TimeStruct->RTC_Sec_Tens)    <<  4) | \
                     ((unsigned long) (RTC_TimeStruct->RTC_Sec_Units)));


    /* Disable the write protection for RTC registers */
    RTC_WPR = 0xCA;
    RTC_WPR = 0x53;
    DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))

    /* Set Initialization mode */
    if (INITF_bit == 0)   {

         RTC_ISR.B7 = 1;                                                        // INIT Enter Initialization mode.           (RTC initialization and status register (RTC_ISR))

         while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
         {                                                                      //  phase mode is entered when INITF is set to 1. It takes from 1
             delay_us(10);                                                      //  to 2 RTCCLK clock cycles (due to clocks synchronization).
             RTC_Wait_ctr++;                                                    //  RTCCLK = 32768 Hz  --> approx 60us delay
         }                                                                      //  We shall wait 80 us just to make sure ;)

         if (INITF_bit == 0)
         {
             Func_Status = 0;                                                   // Failed to update RTC registers
         }
    }

    /* Set Calibration Value */
    Calibrate_RTC_Crystal(Calibration_Value);

    /* Copy new time value into Time Register */
    RTC_TR = Temp_Time_Reg;

    /* Exit Initialization mode */                                              //  Bit 7 INIT: Initialization mode
    RTC_ISR.B7 = 0;                                                             //     0: Free running mode
                                                                                //     1: Initialization mode used to program time and date register (RTC_TR and RTC_DR), and
                                                                                //        prescaler register (RTC_PRER). Counters are stopped and start counting from the new
                                                                                //        value when INIT is reset.
    /* Enable the write protection for RTC registers */
    RTC_WPR = 0xFF;

    return Func_Status;
}


/************************************************************
* RTC set current Date                                      *
* RTC_TimeStruct : Structure of the current time to be set. *
*   Return : 1 = Success                                    *
*            0 = Failure                                    *
*************************************************************/
short RTC_SetDate(RTC_DateTypeDef *RTC_DateStruct)
{
    short                Func_Status;
    unsigned short       RTC_Wait_ctr             = 0;
    unsigned long        Temp_Date_Reg            = 0;

    Temp_Date_Reg = (((unsigned long) (RTC_DateStruct->RTC_Year_Tens)    << 20) | \
                     ((unsigned long) (RTC_DateStruct->RTC_Year_Units)   << 16) | \
                     ((unsigned long) (RTC_DateStruct->RTC_DayofWeek)    << 13) | \
                     ((unsigned long) (RTC_DateStruct->RTC_Month_Tens)   << 12) | \
                     ((unsigned long) (RTC_DateStruct->RTC_Month_Units)  <<  8) | \
                     ((unsigned long) (RTC_DateStruct->RTC_Date_Tens)    <<  4) | \
                     ((unsigned long) (RTC_DateStruct->RTC_Date_Units)));

    Temp_Date_Reg = Temp_Date_Reg & 0x00FFFFFF;                                 // Ensure top 8 bits are set to 0.

    /* Disable the write protection for RTC registers */
    RTC_WPR = 0xCA;
    RTC_WPR = 0x53;
    DBP_bit = 1;                                                                // Access to RTC Backup registers enabled.   (PWR power control register (PWR_CR))

    /* Set Initialization mode */
    if (INITF_bit == 0)   {

         RTC_ISR.B7 = 1;                                                        // INIT Enter Initialization mode.           (RTC initialization and status register (RTC_ISR))

         while ((INITF_bit == 0) && (RTC_Wait_ctr < 8))                         //  Poll INITF bit of in the RTC_ISR register. The initialization
         {                                                                      //  phase mode is entered when INITF is set to 1. It takes from 1
             delay_us(10);                                                      //  to 2 RTCCLK clock cycles (due to clocks synchronization).
             RTC_Wait_ctr++;                                                    //  RTCCLK = 32768 Hz  --> approx 60us delay
         }                                                                      //  We shall wait 80 us just to make sure ;)

         if (INITF_bit == 0)
         {
             Message("Failed to enter INIT mode.");
             Func_Status = 0;                                                   // Failed to update RTC registers
         }
    }
    RTC_Wait_ctr = 0;   // Clear counter

    /* Copy new time value into Date Register */
    RTC_DR = Temp_Date_Reg;

    /* Exit Initialization mode */                                              //  Bit 7 INIT: Initialization mode
    RTC_ISR.B7 = 0;                                                             //     0: Free running mode
                                                                                //     1: Initialization mode used to program time and date register (RTC_TR and RTC_DR), and
                                                                                //        prescaler register (RTC_PRER). Counters are stopped and start counting from the new
                                                                                //        value when INIT is reset.
    /* Enable the write protection for RTC registers */
    RTC_WPR = 0xFF;

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