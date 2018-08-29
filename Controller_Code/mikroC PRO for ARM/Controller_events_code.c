#include "Controller_objects.h"
#include "Controller_resources.h"

//--------------------- User code ---------------------//
#include <stdint.h>
#include <stdbool.h>
unsigned char tenYearU;
unsigned char oneYearU;
unsigned char oneMonth;
unsigned char tenDayU;
unsigned char oneDayU;
unsigned char tenHour;
unsigned char tenMinute;
unsigned char oneMinute;
unsigned char countPacket;
float press;
extern RTC_TimeTypeDef      My_Time;
extern RTC_TimeTypeDef      Read_Time;
extern RTC_DateTypeDef      My_Date;
extern RTC_DateTypeDef      Read_Date;
extern float old_HP_pressure;
extern float old_LP_pressure;
//------------------------------------------------------------------------------
extern  bool pushButton;
extern  bool msgOk;
extern   void (*send_data_again)();

regAdress adressRegSend,adressRegReciev;
unsigned char nomRegSend,nomRegReciev;
//------------------------------------------------------------------------------
extern TScreen*  CurrentScreen;
TScreen  BackScreen,NextScreen;
extern Packet bus_data;
extern int system_reg[600];
bool two_compressors_mode,ground_heat_pump,SYSTEM_ON;
extern bool sendMessage;
unsigned char num_page;
void Tone1() {
  Sound_Play(659, 35);   //
}
void Tone2() {
  Sound_Play(698, 50);   //
}
void Tone3() {
  Sound_Play(784, 70);   //
}
void BLED_Fade_Out(){
  unsigned char i;

  for ( i = 255; i > 0 ; i-- ){
    TFT_Set_DBC_SSD1963(i);
    Delay_us(500);
  }
  TFT_Set_DBC_SSD1963(0);
}
void BLED_Fade_In(){
  unsigned char i;

  for (i = 1; i < 255; i++){
    TFT_Set_DBC_SSD1963(i);
    Delay_us(500);
  }
    TFT_Set_DBC_SSD1963(255);
}
//----------------- End of User code ------------------//

// Event Handlers
void BackToHome(){
        Tone2();
        BLED_Fade_Out();
        DrawScreen(&HOME);
        BLED_Fade_In();
}
void goToBack(){
        Tone2();
        BLED_Fade_Out();

if( num_page==0)
{
        if(CurrentScreen == &SYSTEM_SET)DrawScreen(&USER_MENU);
        else if (CurrentScreen==&ERRORS)  DrawScreen(&USER_MENU);
        else if (CurrentScreen==&SENSOR1)  DrawScreen(&USER_MENU);
        else if (CurrentScreen==&SETTINGS)  DrawScreen(&USER_MENU);
        else if (CurrentScreen==&ENERGY)  DrawScreen(&USER_MENU);
        else if(CurrentScreen == &EEV) DrawScreen(&SYSTEM_SET);
        else if(CurrentScreen == &DELAY_MENU) DrawScreen(&SYSTEM_SET);
        else if(CurrentScreen == &LIMITS1) DrawScreen(&SYSTEM_SET);
        else if(CurrentScreen == &SYSTEM_EVENTS) DrawScreen(&SYSTEM_SET);
        else if (CurrentScreen==&LIMITS2)  DrawScreen(&LIMITS1);
        else if (CurrentScreen==&LIMITS3)  DrawScreen(&LIMITS2);
        else if (CurrentScreen==&LIMITS4)  DrawScreen(&LIMITS3);
        else if (CurrentScreen==&LIMITS5)  DrawScreen(&LIMITS4);
        else if (CurrentScreen==&MODE2)    DrawScreen(&MODE);
}
else   num_page=0;
        BLED_Fade_In();
}
void nextPage(){
        Tone2();
        
        BLED_Fade_Out();
  if (CurrentScreen==&LIMITS1){DrawScreen(&LIMITS2);}
   else if (CurrentScreen==&LIMITS2){DrawScreen(&LIMITS3);}
    else if (CurrentScreen==&LIMITS3){DrawScreen(&LIMITS4);}
      else if (CurrentScreen==&LIMITS4){DrawScreen(&LIMITS5);}
        else if (CurrentScreen==&MODE){DrawScreen(&MODE2);}
         BLED_Fade_In();
}
void selectPage(){
       static int lastDataDhw;
       static TScreen* lastScreen=0;
       int convert_temp;
       char txt[15];
       if (lastScreen!=CurrentScreen) {countPacket=1; lastScreen=CurrentScreen;  }
if (CurrentScreen==&HOME)
        { 

          main_page();
          switch(countPacket)
          {
          case 1:reciev_data_packet(BAC_TEMP,2); break;
          case 2:reciev_data_packet(SOURC_IN_1,2);break;
          case 3:countPacket=1;break;
          }
        }

else if(CurrentScreen==&SENSOR1) 
     {  
        sensor_1(num_page);

        if(num_page==0)
        { 
           switch(countPacket)
          {
          case 1: reciev_data_packet(BAC_TEMP,2);break;
          case 2: reciev_data_packet(CONDENS_TEMP_1,12);break;
          case 3:  countPacket=1;break;
          }
        if(strcmp(CircleButton10.Caption,"1")!=0){CircleButton10.Caption="1";DrawCircleButton(&CircleButton10);  }
        }
         else 
         {
          case 1: reciev_data_packet(BAC_TEMP,2);break;
          case 2: reciev_data_packet(CONDENS_TEMP_2,12);break;
          case 3:  countPacket=1;break;
         if(strcmp(CircleButton10.Caption,"2")!=0) {CircleButton10.Caption="2";DrawCircleButton(&CircleButton10);}
         }
     }


else if(CurrentScreen==&GAUGE1)
{
     if(num_page==0)
     {
      LP_display(system_reg[LOW_PRESS_1]),HP_display(system_reg[HIGH_PRESS_1]);reciev_data_packet(HIGH_PRESS_1,2);
       if(strcmp(CircleButton8.Caption,"1")!=0) {CircleButton8.Caption="1";DrawCircleButton(&CircleButton8);Next_b2.Caption="NEXT";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=nextPage;}
     }
      else 
      {
        LP_display(system_reg[LOW_PRESS_2]),HP_display(system_reg[HIGH_PRESS_2]);reciev_data_packet(HIGH_PRESS_2,2);
        if(strcmp(CircleButton8.Caption,"2")!=0){CircleButton8.Caption="2";DrawCircleButton(&CircleButton8);Next_b2.Caption="BACK";DrawRoundButton(&Next_b2);Next_b2.OnClickPtr=goToBack;}
      }
}
else if(CurrentScreen==&EEV)
    {
      count_steps(num_page);
    if(num_page==0)
    {
          switch(countPacket)
          {
           case 1:reciev_data_packet(TRV_STEPS_1,1); break;
           case 2:reciev_data_packet(S_HEAT_1,1); break;
           case 3:  countPacket=1;break;
          }
    }
    else
    {
          switch(countPacket)
          {
           case 1:reciev_data_packet(TRV_STEPS_2,1); break;
           case 2:reciev_data_packet(S_HEAT_2,1); break;
           case 3:  countPacket=1;break;
          }
    }
    }
    
else if(CurrentScreen==&SYSTEM_EVENTS)
{
             working_time(num_page);break;
        if(num_page==0) reciev_data_packet(TIM_P_HEAT_1,4);
         else  reciev_data_packet(TIM_P_HEAT_2,4);

}
else if(CurrentScreen==&Schema1){schema1_page();reciev_data_packet(DHW_TEMP,32);}

}
//--------------------------------Main_event

void Main_OFFOnClick()
{
  if ((unsigned long)Main_OFF.Picture_Name == main_off_bmp)
  {
      Main_OFF.Picture_Name = main_on_bmp;
      DrawImage(&Main_ON);
      DrawRoundBox (&Messages_Box);
      Messages_Label.Caption = "SYSTEM  ON";
      DrawLabel (&Messages_Label);
      SYSTEM_ON=true;
      system_reg[POWER]=1;

  }
  else {
      Main_OFF.Picture_Name = main_off_bmp;
      DrawImage(&Main_OFF);
      DrawRoundBox (&Messages_Box);
      Messages_Label.Caption = "SYSTEM  OFF";
      DrawLabel (&Messages_Label);
      SYSTEM_ON=false;
      system_reg[POWER]=0;

       }

      //pushButton=true;
      //send_data_packet(POWER,1);
      //dressReg= POWER;
      //nomReg =1;
}
void bar_heatingOnClick()
{

    if ( strcmp(bar_heating.Caption,"HEATING")==0 )
     {
      bar_heating.Caption = "COOLING";
      DrawRoundButton(&bar_heating);
      DrawImage(&cool_icon);

            system_reg[COOL]=1;
            system_reg[HEAT]=0;

     }
     else if(strcmp(bar_heating.Caption,"COOLING")==0 )
     {
      bar_heating.Caption = "HEATING";
      DrawRoundButton(&bar_heating);
      DrawImage(&heat_icon);

            system_reg[HEAT]=1;
            system_reg[COOL]=0;

     }

     if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 ) {send_data_packet(HEAT,2);
      //pushButton=true;
      //adressReg= HEAT;
      //nomReg =2;
     }

}
void DHW_SetingOnClick()
{     static unsigned char count_push = 0;
      char txt[7];
      if(count_push==0) {
            Set_Dhw_Box.Visible       = 1;
            Set_Dhw_Box.Active        = 1;
            DHW_UP.Visible            = 1;
            DHW_UP.Active             = 1;
            DHW_DOWN.Visible          = 1;
            DHW_DOWN.Active           = 1;
            DHW_Setting_value.Visible = 1;
            DHW_Setting_value.Active  = 1;
            dhw_temp_main.Visible     = 0;
            dhw_temp_main.Active      = 0;
            dhw_point.Active          = 0;
            dhw_point.Visible         = 0;
            dhw_celc.Visible          = 0;
            dhw_celc.Active           = 0;
            dhw_led.Visible           = 0;
            dhw_led.Active            = 0;
            BoxRound2.Visible         = 0;
            BoxRound2.Active          = 0;
            IntToStr(system_reg[SET_DHW], txt);

            Ltrim(txt);
            strncpy(DHW_Setting_value.Caption, txt, 2);
            if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
            DHW_Seting.Caption = "SELECT";
            DrawRoundBox(&DWN_Windows);
            DrawRoundButton(&DHW_Seting);
            //DrawRoundButton (& ON_OFF_DHW);
            DrawRoundButton(&DHW_UP);
            DrawRoundButton(&DHW_DOWN);
            DrawLabel (&DHW_Setting_value);
            count_push++;
                         }
      else  {
            Set_Dhw_Box.Visible       = 0;
            Set_Dhw_Box.Active        = 0;
            DHW_UP.Visible            = 0;
            DHW_UP.Active             = 0;
            DHW_DOWN.Visible          = 0;
            DHW_DOWN.Active           = 0;
            DHW_Setting_value.Visible = 0;
            DHW_Setting_value.Active  = 0;
            dhw_temp_main.Visible     = 1;
            dhw_temp_main.Active      = 1;
            dhw_point.Active          = 1;
            dhw_point.Visible         = 1;
            dhw_celc.Visible          = 1;
            dhw_celc.Active           = 1;
            dhw_led.Visible           = 1;
            dhw_led.Active            = 1;
            BoxRound2.Visible         = 1;
            BoxRound2.Active          = 1;
            DHW_Seting.Caption = "SET";

            count_push=0;
            DrawRoundBox(&DWN_Windows);
            DrawRoundButton(&DHW_Seting);
            DrawRoundButton (& ON_OFF_DHW);
            DrawImage(&dhw_icon);
            DrawRoundButton(&bar_DHW);
            DrawLabel (&dhw_temp_main);
            DrawCircle(&dhw_led);
            DrawLabel(&dhw_point);
            DrawLabel(&dhw_celc);
            send_data_packet(SET_DHW,1);
             //pushButton=true;
            // adressReg= SET_DHW;
            // nomReg =1;
             }


}
void Heat_SettingOnClick(){
           static unsigned char count_push = 0;
           char txt[7];

      if(count_push==0) {
            Set_Heat_Box.Visible       = 1;
            Set_Heat_Box.Active        = 1;
            HEAT_UP.Visible            = 1;
            HEAT_UP.Active             = 1;
            HEAT_Down.Visible          = 1;
            HEAT_Down.Active           = 1;
            TEMP_Setting_value.Visible = 1;
            TEMP_Setting_value.Active  = 1;
            heat_temp_main.Visible     = 0;
            heat_temp_main.Active      = 0;
            heat_point.Active          = 0;
            heat_point.Visible         = 0;
            heat_celc.Visible          = 0;
            heat_celc.Active           = 0;
            heat_led.Visible           = 0;
            heat_led.Active            = 0;
            heatBox.Visible            = 0;
            heatBox.Active             = 0;
            if(strcmp(bar_heating.Caption,"HEATING")==0 )IntToStr(system_reg[SET_HEAT], txt);
            else if(strcmp(bar_heating.Caption,"COOLING")==0) IntToStr(system_reg[SET_COOL], txt);
            Ltrim(txt);
            strncpy(TEMP_Setting_value.Caption, txt, 2);
            if(system_reg[SET_HEAT]<10 && system_reg[SET_HEAT]>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
            Heat_Setting.Caption = "SELECT";
            DrawRoundBox(&Heat_Windows);
            DrawRoundButton(&Heat_Setting);
            DrawRoundButton(&HEAT_UP);
            DrawRoundButton(&HEAT_DOWN);
            DrawLabel (&TEMP_Setting_value);
            count_push++;
                         }
      else  {
            Set_Heat_Box.Visible       = 0;
            Set_Heat_Box.Active        = 0;
            HEAT_UP.Visible            = 0;
            HEAT_UP.Active             = 0;
            HEAT_Down.Visible          = 0;
            HEAT_Down.Active           = 0;
            TEMP_Setting_value.Visible = 0;
            TEMP_Setting_value.Active  = 0;
            heat_temp_main.Visible     = 1;
            heat_temp_main.Active      = 1;
            heat_point.Active          = 1;
            heat_point.Visible         = 1;
            heat_celc.Visible          = 1;
            heat_celc.Active           = 1;
            heat_led.Visible           = 1;
            heat_led.Active            = 1;
            heatBox.Visible            = 1;
            heatBox.Active             = 1;

            Heat_Setting.Caption = "SET";
            count_push=0;
            DrawRoundBox(&Heat_Windows);
            DrawRoundButton(&Heat_Setting);
            DrawRoundButton (& ON_OFF_Heat_Cool);
            DrawRoundButton(&bar_heating);
            DrawLabel (&heat_temp_main);
            DrawCircle(&heat_led);
            DrawLabel(&heat_point);
            DrawLabel(&heat_celc);
             if ( strcmp(bar_heating.Caption,"HEATING")==0 ){ DrawImage(&heat_icon);send_data_packet(SET_HEAT,1);/*adressReg= SET_HEAT;nomReg =1;*/}
             else  {DrawImage(&cool_icon);send_data_packet(SET_COOL,1);/*adressReg= SET_COOL;nomReg =1;*/}
             }
             pushButton=true;

}

void Click_HEAT()
{
   if (strcmp(ON_OFF_Heat_Cool.Caption,"ON")==0 )
   {
        ON_OFF_Heat_Cool.Caption = "OFF";
        DrawRoundButton(&ON_OFF_Heat_Cool);
        system_reg[HEAT]=0;
        system_reg[COOL]=0;
    }
    else
    {   if(strcmp(bar_heating.Caption,"HEATING")==0 ){system_reg[HEAT]=1;system_reg[COOL]=0;}
         else if(strcmp(bar_heating.Caption,"COOLING")==0 ){system_reg[HEAT]=0;system_reg[COOL]=1;}
        ON_OFF_Heat_Cool.Caption = "ON";
        DrawRoundButton(&ON_OFF_Heat_Cool);

    }
   /*pushButton=true;
    adressReg= HEAT;
    nomReg =2;*/
    send_data_packet(HEAT,2);

}
void Click_DHW()
{

    if (strcmp(ON_OFF_DHW.Caption,"ON")==0)
    {
        ON_OFF_DHW.Caption = "OFF";
        DrawRoundButton(&ON_OFF_DHW);
        system_reg[HEATWATER]=0;
    }
    else
    {
        ON_OFF_DHW.Caption = "ON";
        DrawRoundButton(&ON_OFF_DHW);
        system_reg[HEATWATER]=1;
    }
    /*pushButton=true;
    adressReg= HEATWATER;
    nomReg =1;*/
    send_data_packet(HEATWATER,1);
}
void MainBut1OnUp(){
        Tone2();
        BLED_Fade_Out();
        Image25.Visible = 0;
        DrawScreen(&USER_MENU);
        BLED_Fade_In();

}
void MainBut1OnPress(){
        Image25.Visible = 1;
        DrawImage(&Image25);
}
 void MainBut2OnUp(){
        Tone2();
        BLED_Fade_Out();
        Image40.Visible = 0;
        if (two_compressors_mode==true && ground_heat_pump == true) {
        DrawScreen (&Schema2);
        }
        else if (two_compressors_mode==true && ground_heat_pump == false) {
        DrawScreen (&AIR_TWO);
        }
        else if (two_compressors_mode==false && ground_heat_pump == false) {
        DrawScreen(&Schema1);//DrawScreen (&AIR_ONE);
        }
        else {
        DrawScreen(&Schema1);
        }

        BLED_Fade_In();

 }
 void MainBut2OnPress(){
         Image40.Visible = 1;
         DrawImage(&Image40);

 }
 void MainBut3OnUp(){
        Tone2();
        BLED_Fade_Out();
        Image44.Visible = 0;
        DrawScreen(&DEVICES);
        BLED_Fade_In();

 }
void MainBut3OnPress(){
        Image44.Visible = 1;
        DrawImage(&Image44);
}
void MainBut4OnUp(){
        Tone2();
        BLED_Fade_Out();
        Image61.Visible = 0;
        old_HP_pressure=0;
        old_LP_pressure=0;
        DrawScreen(&GAUGE1);
        BLED_Fade_In();
}
void MainBut4OnPress(){
        Image61.Visible = 1;
        DrawImage(&Image61);
}
void MainBut5OnUp(){
        Tone2();
        BLED_Fade_Out();
        Image87.Visible = 0;
        DrawScreen(&Graph);
        BLED_Fade_In();
}
void MainBut5OnPress(){
         Image87.Visible = 1;
         DrawImage(&Image87);
}
void  DHW_UPOnClick(){
       char txt[7];
       Tone2 ();
       system_reg[SET_DHW]++;
       if(system_reg[SET_DHW]>system_reg[HEAT_MAX]) system_reg[SET_DHW]=system_reg[HEAT_MAX];
       IntToStr(system_reg[SET_DHW], txt);
       Ltrim (txt);
       strncpy(DHW_Setting_value.Caption, txt, 2);
       if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
        DrawBox(&Set_Dhw_Box);
       DrawLabel (&DHW_Setting_value);
       Delay_ms (100);
}
void DHW_DOWNOnClick(){
       char txt[7];
       Tone2 ();
       system_reg[SET_DHW]--;
       if(system_reg[SET_DHW]<system_reg[HEAT_MIN]) system_reg[SET_DHW]=system_reg[HEAT_MIN];
       IntToStr(system_reg[SET_DHW], txt);
       Ltrim (txt);
       strncpy(DHW_Setting_value.Caption, txt, 2);
       if(system_reg[SET_DHW]<10 && system_reg[SET_DHW]>=0){DHW_Setting_value.Caption[1]=DHW_Setting_value.Caption[0];DHW_Setting_value.Caption[0]='0';}
        DrawBox(&Set_Dhw_Box);
       DrawLabel (&DHW_Setting_value);
       Delay_ms (100);

}
void HEAT_UPOnClick(){
       char txt[7];
       int f;
       Tone2 ();
       //system_reg[SET_HEAT]++;
   if(strcmp(bar_heating.Caption,"HEATING")==0){
       system_reg[SET_HEAT]++;
       IntToStr(system_reg[SET_HEAT], txt);
       f= system_reg[SET_HEAT];
                              }
   else if(strcmp(bar_heating.Caption,"COOLING")==0){
       system_reg[SET_COOL]++;
       //if(system_reg[SET_COOL]>system_reg[COOL_MAX]) system_reg[SET_COOL]=system_reg[COOL_MAX];
       IntToStr(system_reg[SET_COOL], txt);
        f= system_reg[SET_COOL];
           }
       Ltrim (txt);
       strncpy(TEMP_Setting_value.Caption , txt, 2);
       if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
       DrawBox(&Set_Heat_Box);
       DrawLabel (&TEMP_Setting_value);
}
void HEAT_DownOnClick(){
       char txt[7];
       int f;
       Tone2 ();
       if(strcmp(bar_heating.Caption,"HEATING")==0){
       system_reg[SET_HEAT]--;
       if(system_reg[SET_HEAT]<system_reg[HEAT_MIN]) system_reg[SET_HEAT]=system_reg[HEAT_MIN];
       IntToStr(system_reg[SET_HEAT], txt);
       f= system_reg[SET_HEAT];
                              }
       else if(strcmp(bar_heating.Caption,"COOLING")==0){
       system_reg[SET_COOL]--;
       if(system_reg[SET_COOL]<system_reg[COOL_MIN]) system_reg[SET_COOL]=system_reg[COOL_MIN];
       IntToStr(system_reg[SET_COOL], txt);
       f= system_reg[SET_COOL];
           }
       Ltrim (txt);
       strncpy(TEMP_Setting_value.Caption , txt, 2);
       if(f<10 && f>=0){TEMP_Setting_value.Caption[1]=TEMP_Setting_value.Caption[0];TEMP_Setting_value.Caption[0]='0';}
       DrawBox(&Set_Heat_Box);
       DrawLabel (&TEMP_Setting_value);

}
//----------------------------------------------------user_menu
void user_settingOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image105.Visible = 0;
        DrawScreen(&SYSTEM_EVENTS);
        BLED_Fade_In();
}
void  user_settingOnPress(){
       Image105.Visible = 1;
       DrawImage(&Image105);
}
void user_set_timeOnPress(){
        Image39.Visible = 1;
        DrawImage(&Image39);
}
void user_set_timeOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image39.Visible = 0;
        //RTC_Example_init();
        DrawScreen(&SetRTC);
        BLED_Fade_In();
}

void user_check_temperatureOnPress(){
        Image48.Visible = 1;
        DrawImage(&Image48);
}
void user_check_temperatureOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image48.Visible = 0;
        strcpy(S_Brine_Inlet_1.Caption,"00");
        strcpy(S_Brine_Outlet_1.Caption,"00");
        strcpy(S_Heat_Inlet_1.Caption,"00");
        strcpy(S_Heat_Outlet_1.Caption,"00");
        strcpy(S_Compressor_1.Caption ,"000");
        strcpy(S_Superheat_1.Caption,"00");
        strcpy( S_Subcool_1.Caption,"00");
         strcpy(S_DHW.Caption,"00");
         strcpy(SS_tank.Caption,"00");
         strcpy(S_condenser_1.Caption,"00");
         strcpy(S_High_Pressure_1.Caption,"00");
         strcpy(S_Low_Pressure_1.Caption,"00");
        DrawScreen(&SENSOR1);
        BLED_Fade_In();
}
void user_set_LANOnPress(){
        Image49.Visible = 1;
        DrawImage(&Image49);
}
void user_set_LANOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image49.Visible = 0;
        DrawScreen(&Ethernet);
        BLED_Fade_In();
}
void user_check_errorsOnPress(){
        Image50.Visible = 1;
        DrawImage(&Image50);
}
void user_check_errorsOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image50.Visible = 0;
        DrawScreen(&ERRORS);
        BLED_Fade_In();
}
void user_set_timersOnPress(){
        Image51.Visible = 1;
        DrawImage(&Image51);
}
void user_set_timersOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image51.Visible = 0;
        DrawScreen(&TIMERS);
        BLED_Fade_In();
}
void user_hysterezisOnPress(){
       Image60.Visible = 1;
       DrawImage(&Image60);
}
void user_hysterezisOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image60.Visible = 0;
        DrawScreen(&SETTINGS);
        BLED_Fade_In();
}
void User_history_checkOnPress(){
        Image52.Visible = 1;
        DrawImage(&Image52);
}
void User_history_checkOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image52.Visible = 0;
        DrawScreen(&EVENTS);
        BLED_Fade_In();
}

void user_energyOnUp(){
        Tone2();
        BLED_Fade_Out();
        Image54.Visible = 0;
        DrawScreen(&ENERGY);
        BLED_Fade_In();
}
void user_energyOnPress(){
       Image54.Visible = 1;
       DrawImage(&Image54);
}
void admin_set_systemOnUp(){
        Tone2();
       BLED_Fade_Out();
       Image55.Visible = 0;
       //CurrentScreen= &USER_MENU;
       DrawScreen (&SYSTEM_SET);
       BLED_Fade_In();
}
void  admin_set_systemOnPress (){
       Image55.Visible = 1;
       DrawImage(&Image55);
}
void furnanceUP(){
       Tone2();
       BLED_Fade_Out();
       Image56.Visible = 0;
       DrawScreen(&FURNANCE);
       BLED_Fade_In();
}
void furnanceDown(){
       Image56.Visible = 1;
       DrawImage(&Image56);
}
void user_defrostOnUp(){
       Tone2();
       BLED_Fade_Out();
       Image57.Visible = 0;
       DrawScreen(&DEFROST);
       BLED_Fade_In();
}
void user_defrostOnPress(){
       Image57.Visible = 1;
       DrawImage(&Image57);
}

//------------------------------------eev 1
/*void EEV1DownOnUp() {
     // EEV1Down.Visible = 1;
      //Image177.Visible =0;
     // DrawImage (&EEV1Down);
}

void EEV1DownOnDown() {
     int For_EEV1=0;
     char txt[7];
     Tone3 ();
     //EEV1Down.Visible = 0;
     //Image177.Visible = 1;
     //DrawImage (&Image177);
     For_EEV1 = atoi(EEV1_superheat.Caption);
     For_EEV1--;
     if(For_EEV1 < - 9)For_EEV1 = -9;
     IntToStr(For_EEV1, txt);
     Ltrim (txt);
     strncpy(EEV1_superheat.Caption, txt, 2);
     DrawRoundButton(&EEV1_superheat);
     Delay_ms (100);

}


void EEV1UpOnUp() {
     EEV1Up.Visible = 1;
     Image179.Visible =0;
     DrawImage (&EEV1Up);
}

void EEV1UpOnDown() {
     int For_EEV1=0;
     char txt[7];
     Tone3 ();
     EEV1Up.Visible = 0;
     Image179.Visible = 1;
     DrawImage (&Image179);
     For_EEV1 = atoi(EEV1_superheat.Caption);
     For_EEV1++;
     if(For_EEV1>99)For_EEV1=99;
     IntToStr(For_EEV1, txt);
     Ltrim (txt);
     strncpy(EEV1_superheat.Caption, txt, 2);
     DrawRoundButton(&EEV1_superheat);
     Delay_ms (100);

}*/

void DEC_EEV1OnPress() {

    Tone1();
    //temp= Red_bar.Position;
    if(Red_bar.Position >= Red_bar.Min + 5) {
    //EEV1_value.Caption = Red_bar_Caption;
    //DrawRoundButton(&EEV1_value);
    Red_bar.Position -= 5;
    //system_reg[TRV_CORRECT_1]=Red_bar.Position - temp;
    DrawProgressBar(&Red_bar);
    Delay_ms (50);
    }
 }
void INC_EEV1OnPress() {
    Tone1();
    if(Red_bar.Position <= Red_bar.Max - 5) {
    Red_bar.Position += 5;
    UpdatePBPosition(&Red_bar);
    Delay_ms (50);
    }
}

void Set_Trv() {

      system_reg[TRV_CORRECT_1]=Red_bar.Position - system_reg[TRV_STEPS_1];
      /*adressReg= TRV_CORRECT_1;
      nomReg=1;
      pushButton=true;*/
      send_data_packet(TRV_CORRECT_1,1);
}

//-----------------------------------------------keyboard
void _1OnClick() {

}

void _2OnClick() {

}

void _3OnClick() {

}

void _4OnClick() {

}

void _5OnClick() {

}

void _6OnClick() {

}

void _7OnClick() {

}

void _8OnClick() {

}

void _9OnClick() {

}

void _0OnClick() {

}

void _QOnClick() {

}

void _WOnClick() {

}

void _EOnClick() {

}

void _ROnClick() {

}

void _TOnClick() {

}

void _YOnClick() {

}

void _UOnClick() {

}

void _IOnClick() {

}

void _OOnClick() {

}

void _POnClick() {

}

void _AOnClick() {

}

void _SOnClick() {

}

void _DOnClick() {

}

void _FOnClick() {

}

void _GOnClick() {

}

void _HOnClick() {

}

void _JOnClick() {

}

void _KOnClick() {

}

void _LOnClick() {

}

void _ZOnClick() {

}

void _XOnClick() {

}

void _COnClick() {

}

void _VOnClick() {

}

void _BOnClick() {

}

void _NOnClick() {

}

void _MOnClick() {

}

void _CommaOnClick() {

}

void _ColonOnClick() {

}

void _SlashOnClick() {

}

void _DELOnClick() {

}

void ClearOnPress() {

}

void CAPS_SwitchOnClick() {

}

void SPACEOnClick() {

}

void ENTEROnClick() {

}
//---------------------------------------------------set rtc
 void SetDateAndTimeOnClick(){

 }
 void OneYearUpOnClick(){
     char temp[4];
     char *res;
     Tone2();
     tenYearU++;
     if (tenYearU > 9)
        tenYearU = 0;
     ByteToStr(tenYearU, temp);
     res = Ltrim(temp);
     strcpy(OneYear.Caption, res);
     DrawButton(&OneYearUp);
     DrawButton(&OneYearDwn);
     DrawLabel(&OneYear);
}
void OneYearDwnOnClick(){
     char temp[4];
     char *res;
     Tone2();
     tenYearU--;
     if (My_Date.RTC_Year_Tens < 0)
        tenYearU = 9;
     ByteToStr(tenYearU, temp);
     res = Ltrim(temp);
     strcpy(OneYear.Caption, res);
     DrawButton(&OneYearUp);
     DrawButton(&OneYearDwn);
     DrawLabel(&OneYear);
}
void OneYearUpOnUp(){
    DrawLabel(&OneYear);
}
void OneYearUpOnPress(){
    DrawLabel(&OneYear);
}
void OneYearDwnOnUp() {
    DrawLabel(&OneYear);
}
void OneYearDwnOnPress() {
    DrawLabel(&OneYear);
}
//------------------------------------------------------------------------------
void TenYearUpOnClick() {
}
void TenYearDwnOnClick() {
}
void TenYearUpOnUp() {

}
void TenYearDwnOnUp() {
}
void TenYearDwnOnPress() {
}
void TenYearUpOnPress() {

}

void MonthDateUpOnClick() {

}
void MonthDateUpOnUp() {

}
void MonthDateUpOnPress() {

}
void MonthDateDwnOnClick() {

}
void MonthDateDwnOnUp() {

}
void MonthDateDwnOnPress() {
}
void TenDayUpOnClick() {

}
void TenDayDwnOnClick() {

}

void TenDayUpOnUp() {

}

void TenDayDwnOnUp() {

}

void TenDayUpOnPress() {

}

void TenDayDwnOnPress() {

}
void OneDayUpOnClick() {

}

void OneDayDwnOnClick() {

}

void OneDayUpOnUp() {

}

void OneDayDwnOnUp() {

}

void OneDayUpOnPress() {

}

void OneDayDwnOnPress() {

}
void Day_unitUpOnClick() {

}

void Day_unitDwnOnClick() {

}

void Day_unitUpOnUp() {

}

void Day_unitDwnOnUp() {

}

void Day_unitUpOnPress() {

}

void Day_unitDwnOnPress() {

}

void Unit_hoursUpOnClick() {

}

void Unit_hoursDwnOnClick() {

}
void Unit_hoursUpOnUp() {

 }
void Unit_hoursDwnOnUp() {

}
void Unit_hoursUpOnPress() {

}
void Unit_hoursDwnOnPress() {

}
void Ten_minutesUpOnClick() {

}
void Ten_minutesDwnOnClick() {

}
void Ten_minutesUpOnUp() {

}
void Ten_minutesDwnOnUp() {

}
void Ten_minutesUpOnPress() {

}
void Ten_minutesDwnOnPress() {

}
void Unit_minutesUpOnClick() {

}

void Unit_minutesDwnOnClick() {

}

void Unit_minutesUpOnUp(){

}

void Unit_minutesDwnOnUp(){

}

void Unit_minutesUpOnPress() {

}

void Unit_minutesDwnOnPress() {

}

 //--------------------------------------------------password
 void Admin_SetOnClick(){
 }
 //-------------------------------------------------system set
 void system_passOnDown() {
       Image83.Visible = 1;
       DrawImage(&Image83);
}

void system_passOnUp() {
        Tone2();
        BLED_Fade_Out();
        Image83.Visible = 0;
        DrawScreen(&PASSWORD);
        BLED_Fade_In();
}

void ModeSetOnUp() {
        if (SYSTEM_ON == false) {
        BLED_Fade_Out();
        strcpy(System_Set_Message.Caption, " ");
        Image300.Visible = 0;
        System_Set_Message.Visible = 0;
        BLED_Fade_In();
        }
    else {
        strcpy(System_Set_Message.Caption, "Please  OFF  system  power!");
        Image300.Visible = 1;
        DrawImage (&Image300);
        System_Set_Message.Visible = 1;
        DrawButton (&System_Set_Message);
    }
}

void ModeSetOnDown() {
       Image85.Visible = 1;
       DrawImage(&Image85);
}

void system_EEVOnDown() {
       Image89.Visible = 1;
       DrawImage(&Image89);
}

void system_EEVOnUp() {
        Tone2();
        BLED_Fade_Out();

        Image89.Visible = 0;
        DrawScreen(&EEV);
        BLED_Fade_In();

}

void system_modeOnDown() {
       Image85.Visible = 1;
       DrawImage(&Image85);
}

void system_modeOnUp() {
        Tone2();
        BLED_Fade_Out();
        Image85.Visible = 0;
        DrawScreen(&MODE);
        BLED_Fade_In();
}

void system_delayOnUp() {
        Tone2();
        BLED_Fade_Out();
        Image90.Visible = 0;
        DrawScreen(&DELAY_MENU);
        BLED_Fade_In();
}
void system_delayOnDown() {
        Image90.Visible = 1;
        DrawImage(&Image90);
}

void system_graphOnDown() {
        Tone2();
        BLED_Fade_Out();
        Image90.Visible = 0;
        DrawScreen(&Graph);
        BLED_Fade_In();
}

void system_graphOnUp() {
       Image92.Visible = 1;
       DrawImage(&Image92);

}
void system_microSDOnDown() {
       Image88.Visible = 1;
       DrawImage(&Image88);
}

void system_microSDOnUp() {
        Tone2();
        BLED_Fade_Out();
        Image88.Visible = 0;
        DrawScreen(&MICRO_SD);
        BLED_Fade_In();
}


void system_limitsOnDown() {
       Image91.Visible = 1;
       DrawImage(&Image91);
}

void system_limitsOnUp() {
        Tone2();
        BLED_Fade_Out();
        Image91.Visible = 0;
        DrawScreen(&LIMITS1);
        BLED_Fade_In();
}

void ssytem_graphOnDown() {
       Image92.Visible = 1;
       DrawImage(&Image92);
}

void ssytem_graphOnUp() {
        Tone2();
        BLED_Fade_Out();
        Image92.Visible = 0;
        DrawScreen(&Graph);
        BLED_Fade_In();
}

void system_historyOnDown() {
       Image93.Visible = 1;
       DrawImage(&Image93);
}

void system_historyOnUp() {
        Tone2();
        BLED_Fade_Out();
        Image93.Visible = 0;
        DrawScreen(&SYSTEM_EVENTS);
        BLED_Fade_In();
}
//-------------------------------------------------delay menu
   //1 line
void Delay_Source_DOWNOnUp() {
       Image306.Visible = 0;
       Delay_Source_DOWN.Visible = 1;
       DrawImage(&Delay_Source_DOWN);
}
void Delay_Source_DOWNOnPress() {
        //int _data;
        char txt[7];
        Tone2 ();
        Image306.Visible = 1;
        Delay_Source_DOWN.Visible = 0;
        DrawImage(&Image306);
       //_data = atoi(Delay_Source.Caption);
       //_data--;
        system_reg[SOURS_DEL]--;
       if (system_reg[SOURS_DEL] <0) system_reg[SOURS_DEL]=0;
       IntToStr(system_reg[SOURS_DEL], txt);
       Ltrim (txt);
       strncpy(Delay_Source.Caption, txt, 2);
       DrawRoundButton(&Delay_Source);
       Delay_ms (100);
}
void Delay_Source_UPOnUp() {
       Image312.Visible = 0;
       Delay_Source_UP.Visible = 1;
       DrawImage(&Delay_Source_UP);

}
void Delay_Source_UPOnPress() {

         char txt[7];
         Tone2 ();
         Image312.Visible = 1;
         Delay_Source_UP.Visible = 0;
         DrawImage(&Image312);
         system_reg[SOURS_DEL]++;
         if (system_reg[SOURS_DEL] >99) system_reg[SOURS_DEL] = 99;
         IntToStr(system_reg[SOURS_DEL], txt);
         Ltrim (txt);
         strncpy(Delay_Source.Caption, txt, 2);
         DrawRoundButton(&Delay_Source);
         Delay_ms (100);
}
void Delay_Source_SETOnUp() {
     Delay_Source_SET.Visible = 1;
     Image344.Visible = 0;
     DrawImage (&Delay_Source_SET);
}
void Delay_Source_SETOnDown() {
      Tone1();
      /*adressReg= SOURS_DEL;
      nomReg=1;
      pushButton=true;*/
      send_data_packet(SOURS_DEL,1);
      Delay_Source_SET.Visible = 0;
      Image344.Visible = 1;
      DrawImage (&Image344);
}
   //2 line
void Delay_heat_pump_DOWNOnUp() {
        Image307.Visible = 0;
        Delay_heat_pump_DOWN.Visible = 1;
        DrawImage(&Delay_heat_pump_DOWN);
        
}
void Delay_heat_pump_DOWNOnPress() {
     //int _data;
     char txt[7];
     Tone2 ();
     Image307.Visible = 1;
     Delay_heat_pump_DOWN.Visible = 0;
     DrawImage(&Image307);
     /*_data = atoi(Delay_heat_pump.Caption);
     _data--;*/
     system_reg[HEAT_DEL]--;
     if (system_reg[HEAT_DEL] <0) system_reg[HEAT_DEL]=0;
     IntToStr(system_reg[HEAT_DEL], txt);
     Ltrim (txt);
     strncpy(Delay_heat_pump.Caption, txt, 2);
     DrawRoundButton(&Delay_heat_pump);
     Delay_ms (100);
}
void Delay_heat_pump_upOnUp() {
      Image313.Visible = 0;
      Delay_heat_pump_up.Visible = 1;
      DrawImage(&Delay_heat_pump_up);
}
void Delay_heat_pump_upOnPress() {
       //int _data;
       char txt[7];
        Tone2 ();
        Image313.Visible = 1;
        Delay_heat_pump_up.Visible = 0;
        DrawImage(&Image313);
       /*_data = atoi(Delay_heat_pump.Caption);
       _data++;*/
       system_reg[HEAT_DEL]++;
        if (system_reg[HEAT_DEL] >99)
        system_reg[HEAT_DEL] = 99;
         IntToStr(system_reg[HEAT_DEL], txt);
       Ltrim (txt);
       strncpy(Delay_heat_pump.Caption, txt, 2);
       DrawRoundButton(&Delay_heat_pump);
       Delay_ms (100);

}
void Delay_heat_pump_SETOnUp() {
     Delay_heat_pump_SET.Visible = 1;
     Image345.Visible = 0;
     DrawImage (&Delay_heat_pump_SET);
}
void Delay_heat_pump_SETOnDown() {
     Tone1();
      /*adressReg= HEAT_DEL;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(HEAT_DEL,1);
     Delay_heat_pump_SET.Visible = 0;
     Image345.Visible = 1;
     DrawImage (&Image345);
}
   //3 line
void Delay_reversing_DOWNOnUp() {
        Image308.Visible = 0;
        Delay_reversing_DOWN.Visible = 1;
        DrawImage(&Delay_reversing_DOWN);
}
void Delay_reversing_DOWNOnPress() {
        //int _data;
        char txt[7];
        Tone2 ();
        Image308.Visible = 1;
        Delay_reversing_DOWN.Visible = 0;
        DrawImage(&Image308);
       /*_data = atoi(Delay_reversing.Caption);
       _data--;*/
        system_reg[REVERS_DEL]--;
        if (system_reg[REVERS_DEL] <0)
        system_reg[REVERS_DEL] = 0;
        IntToStr(system_reg[REVERS_DEL], txt);
       Ltrim (txt);
       strncpy(Delay_reversing.Caption, txt, 2);
       DrawRoundButton(&Delay_reversing);
       Delay_ms (100);
}
void Delay_reversing_UPOnUp() {
        Image314.Visible = 0;
        Delay_reversing_UP.Visible = 1;
        DrawImage(&Delay_reversing_UP);
}
void Delay_reversing_UPOnPress() {
        //int _data;
        char txt[7];
        Tone2 ();
        Image314.Visible = 1;
        Delay_reversing_UP.Visible = 0;
        DrawImage(&Image314);
    /*_data = atoi(Delay_reversing.Caption);
     _data++;*/
      system_reg[REVERS_DEL]++;
      if (system_reg[REVERS_DEL] >99)
     system_reg[REVERS_DEL] = 99 ;
     IntToStr(system_reg[REVERS_DEL], txt);
     Ltrim (txt);
     strncpy(Delay_reversing.Caption, txt, 2);
     DrawRoundButton(&Delay_reversing);
     Delay_ms (100);
}
void Delay_reversing_SETOnUp() {
     Delay_reversing_SET.Visible = 1;
     Image346.Visible = 0;
     DrawImage (&Delay_reversing_SET);
}
void Delay_reversing_SETOnDown() {
     Tone1();
     /*adressReg= REVERS_DEL;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(REVERS_DEL,1);
     Delay_reversing_SET.Visible = 0;
     Image346.Visible = 1;
     DrawImage (&Image346);
}
   //4 line
void Delay_trv_DOWNOnUp() {
       Image309.Visible = 0;
       Delay_trv_DOWN.Visible = 1;
       DrawImage(&Delay_trv_DOWN);
}
void Delay_trv_DOWNOnPress() {
       //int _data;
       char txt[7];
       Tone2 ();
       Image309.Visible = 1;
       Delay_trv_DOWN.Visible = 0;
       DrawImage(&Image309);
       /*_data = atoi(Delay_EEV.Caption);
       _data--;*/
       system_reg[TRV_DEL]--;
        if (system_reg[TRV_DEL] < 0)
       system_reg[TRV_DEL] = 0;
       IntToStr(system_reg[TRV_DEL], txt);
       Ltrim (txt);
       strncpy(Delay_EEV.Caption, txt, 2);
       DrawRoundButton(&Delay_EEV);
       Delay_ms (100);
}
void Delay_trv_UPOnUp() {
        Image315.Visible = 0;
        Delay_trv_up.Visible = 1;
        DrawImage(&Delay_trv_up);
}
void Delay_trv_UPOnPress(){
        //int _data;
        char txt[7];
        Tone2 ();
        Image315.Visible = 1;
        Delay_trv_up.Visible = 0;
        DrawImage(&Image315);
        /*_data = atoi(Delay_EEV.Caption);
        _data++;*/
        system_reg[TRV_DEL]++;
        if (system_reg[TRV_DEL] >99)
        system_reg[TRV_DEL] = 99;
        IntToStr(system_reg[TRV_DEL], txt);
        Ltrim (txt);
        strncpy(Delay_EEV.Caption, txt, 2);
        DrawRoundButton(&Delay_EEV);
        Delay_ms (100);
}
void Delay_EEV_SETOnUp() {
     Delay_EEV_SET.Visible = 1;
     Image347.Visible = 0;
     DrawImage (&Delay_EEV_SET);
}
void Delay_EEV_SETOnDown() {
     Tone1();
     /*adressReg= TRV_DEL;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(TRV_DEL,1);
     Delay_EEV_SET.Visible = 0;
     Image347.Visible = 1;
     DrawImage (&Image347);
}
   //5 line
void Delay_DHW_valve_DOWNOnUp() {
        Image310.Visible = 0;
        Delay_DHW_valve_DOWN.Visible = 1;
        DrawImage(&Delay_DHW_valve_DOWN);
}
void Delay_DHW_valve_DOWNOnPress() {
        //int _data;
        char txt[7];
        Tone2 ();
        Image310.Visible = 1;
        Delay_DHW_valve_DOWN.Visible = 0;
        DrawImage(&Image310);
       /*_data = atoi(Delay_DHW_valve.Caption);
       _data--;*/
        system_reg[THREE_WAY_DEL]--;
        if (system_reg[THREE_WAY_DEL] < 0)
        system_reg[THREE_WAY_DEL] = 0;
        IntToStr(system_reg[THREE_WAY_DEL], txt);
       Ltrim (txt);
       strncpy(Delay_DHW_valve.Caption, txt, 2);
       DrawRoundButton(&Delay_DHW_valve);
       Delay_ms (100);
}
void Delay_DHW_valve_UPOnUp() {
        Image316.Visible = 0;
        Delay_DHW_valve_UP.Visible = 1;
        DrawImage(&Delay_DHW_valve_UP);
}
void Delay_DHW_valve_UPOnPress() {
      //int _data;
      char txt[7];
      Tone2 ();
        Image316.Visible = 1;
        Delay_DHW_valve_UP.Visible = 0;
        DrawImage(&Image316);
     /*_data = atoi(Delay_DHW_valve.Caption);
     _data++;*/
        system_reg[THREE_WAY_DEL]++;
        if (system_reg[THREE_WAY_DEL] >99)
        system_reg[THREE_WAY_DEL] = 99;
        IntToStr(system_reg[THREE_WAY_DEL], txt);
     Ltrim (txt);
     strncpy(Delay_DHW_valve.Caption, txt, 2);
     DrawRoundButton(&Delay_DHW_valve);
     Delay_ms (100);
}
void Delay_DHW_valve_SETOnUp() {
     Delay_DHW_valve_SET.Visible = 1;
     Image348.Visible = 0;
     DrawImage (&Delay_DHW_valve_SET);
}
void Delay_DHW_valve_SETOnDown() {
     Tone1();
    /*adressReg= THREE_WAY_DEL;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(THREE_WAY_DEL,1);
     Delay_DHW_valve_SET.Visible = 0;
     Image348.Visible = 1;
     DrawImage (&Image348);
}
   //6 line
void Delay_compressor_DOWNOnUp() {
        Image311.Visible = 0;
        Delay_compressor_DOWN.Visible = 1;
        DrawImage(&Delay_compressor_DOWN);
}
void Delay_compressor_DOWNOnPress() {
       //int _data;
      char txt[7];
      Tone2 ();
        Image311.Visible = 1;
        Delay_compressor_DOWN.Visible = 0;
        DrawImage(&Image311);
     /*_data = atoi(Delay_compressor.Caption);
     _data--;*/
       system_reg[COMP_DEL]--;
        if (system_reg[COMP_DEL] < 0)
        system_reg[COMP_DEL] = 0;
        IntToStr(system_reg[COMP_DEL], txt);
     Ltrim (txt);
     strncpy(Delay_compressor.Caption, txt, 2);
     DrawRoundButton(&Delay_compressor);
     Delay_ms (100);
}
void Delay_compressor_UPOnUp() {
        Image317.Visible = 0;
        Delay_compressor_UP.Visible = 1;
        DrawImage(&Delay_compressor_UP);
}
void Delay_compressor_UPOnPress() {
      // int _data;
      char txt[7];
      Tone2 ();
        Image317.Visible = 1;
        Delay_compressor_UP.Visible = 0;
        DrawImage(&Image317);
     /*_data = atoi(Delay_compressor.Caption);
     _data++;*/
       system_reg[COMP_DEL]++;
     if (system_reg[COMP_DEL] >99)
     system_reg[COMP_DEL] = 99;
     IntToStr(system_reg[COMP_DEL], txt);
     Ltrim (txt);
     strncpy(Delay_compressor.Caption, txt, 2);
     DrawRoundButton(&Delay_compressor);
     Delay_ms (100);
}
void Delay_compressor_SETOnUp() {
     Delay_compressor_SET.Visible = 1;
     Image349.Visible = 0;
     DrawImage (&Delay_compressor_SET);
}
void Delay_compressor_SETOnDown() {
     Tone1();
     /*adressReg= COMP_DEL;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(COMP_DEL,1);
     Delay_compressor_SET.Visible = 0;
     Image349.Visible = 1;
     DrawImage (&Image349);
}

//--------------------------------------------------limits 1
void Down_1_OnUp() {
     Image200.Visible = 0;
     Down_1_.Visible = 1;
     DrawImage(&Down_1_);
}
void Down_1_OnPress() {
      char txt[7];
      Tone3 ();
        Image200.Visible = 1;
        Down_1_.Visible = 0;
        DrawImage(&Image200);
       system_reg[HEAT_MIN]--;
        if (system_reg[HEAT_MIN] < 0)
        system_reg[HEAT_MIN] = 0;
        IntToStr(system_reg[HEAT_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_heating_HP.Caption, txt, 2);
     DrawRoundButton(&Set_min_heating_HP);
     Delay_ms (100);
}
void Up_1_OnUp() {
     Image218.Visible = 0;
       Up_1_.Visible = 1;
       DrawImage(&Up_1_);
}
void Up_1_OnPress() {
       char txt[7];
      Tone2();
        Image218.Visible = 1;
        Up_1_.Visible = 0;
        DrawImage(&Image218);
       system_reg[HEAT_MIN]++;
        if (system_reg[HEAT_MIN] >99)
        system_reg[HEAT_MIN] = 99;
        IntToStr(system_reg[HEAT_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_heating_HP.Caption, txt, 2);
     DrawRoundButton(&Set_min_heating_HP);
     Delay_ms (100);
}
void Down_2_OnUp() {
     Image205.Visible = 0;
       Down_2_.Visible = 1;
       DrawImage(&Down_2_);
}

void Down_2_OnPress() {
      char txt[7];
      Tone3 ();
       Image205.Visible = 1;
        Down_2_.Visible = 0;
        DrawImage(&Image205);

       system_reg[HEAT_MAX]--;
        if (system_reg[HEAT_MAX] < 0)
        system_reg[HEAT_MAX] = 0;
        IntToStr(system_reg[HEAT_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_heating_HP.Caption, txt, 2);
     DrawRoundButton(&Set_max_heating_HP);
     Delay_ms (100);
}
void Up_2_OnPress() {
      char txt[7];
      Tone2 ();
        Image219.Visible = 1;
        Up_2_.Visible = 0;
        DrawImage(&Image219);

       system_reg[HEAT_MAX]++;
        if (system_reg[HEAT_MAX] >99)
        system_reg[HEAT_MAX] = 99;
        IntToStr(system_reg[HEAT_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_heating_HP.Caption, txt, 2);
     DrawRoundButton(&Set_max_heating_HP);
     Delay_ms (100);
}
void Up_2_OnUp() {
       Image219.Visible = 0;
       Up_2_.Visible = 1;
       DrawImage(&Up_2_);
}

void Down_3_OnPress() {
      char txt[7];
      Tone3 ();
        Image206.Visible = 1;
        Down_3_.Visible = 0;
        DrawImage(&Image206);

       system_reg[EXAUST_MAX]--;
        if (system_reg[EXAUST_MAX] < 0)
        system_reg[EXAUST_MAX] = 0;
        IntToStr(system_reg[EXAUST_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_exhaust.Caption, txt, 3);
     DrawRoundButton(&Set_max_exhaust);
     Delay_ms (100);
}
void Down_3_OnUp() {
     Image206.Visible = 0;
        Down_3_.Visible = 1;
        DrawImage(&Down_3_);
}
void Up_3_OnPress() {
      char txt[7];
      Tone2 ();
        Image220.Visible = 1;
        Up_3_.Visible = 0;
        DrawImage(&Image220);
        system_reg[EXAUST_MAX]++;
       if(system_reg[EXAUST_MAX]>115)
        system_reg[EXAUST_MAX] = 115;
        IntToStr(system_reg[EXAUST_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_exhaust.Caption, txt, 3);
     DrawRoundButton(&Set_max_exhaust);
     Delay_ms (100);
}
void Up_3_OnUp() {
     Image220.Visible = 0;
        Up_3_.Visible = 1;
        DrawImage(&Up_3_);
}
void Down_4_OnPress() {
      char txt[7];
      Tone3 ();
        Image207.Visible = 1;
        Down_4_.Visible = 0;
        DrawImage(&Image207);

       system_reg[SOURS_MIN]--;
        if (system_reg[SOURS_MIN] < -10)
        system_reg[SOURS_MIN] = -10;
        IntToStr(system_reg[SOURS_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_source_temp.Caption, txt, 3);
     DrawRoundButton(&Set_min_source_temp);
     Delay_ms (100);
}
void Up_4_OnPress(){
     char txt[7];
      Tone2 ();
        Image221.Visible = 1;
        Up_4_.Visible = 0;
        DrawImage(&Image221);

       system_reg[SOURS_MIN]++;
        if (system_reg[SOURS_MIN] >99)
        system_reg[SOURS_MIN] = 99;
        IntToStr(system_reg[SOURS_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_source_temp.Caption, txt, 3);
     DrawRoundButton(&Set_min_source_temp);
     Delay_ms (100);

}
void Down_4_OnUp() {
      Image207.Visible = 0;
        Down_4_.Visible = 1;
        DrawImage(&Down_4_);
}
void Up_4_OnUp() {
     Image221.Visible = 0;
        Up_4_.Visible = 1;
        DrawImage(&Up_4_);
}
void Down_5_OnUp() {
        Image208.Visible = 0;
        Down_5_.Visible = 1;
        DrawImage(&Down_5_);
}
void Down_5_OnPress(){
        char txt[7];
      Tone3 ();
        Image208.Visible = 1;
        Down_5_.Visible = 0;
        DrawImage(&Image208);
        system_reg[SOURS_MAX]--;
        if (system_reg[SOURS_MAX] < 0)
        system_reg[SOURS_MAX] = 0;
        IntToStr(system_reg[SOURS_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_source_temp.Caption, txt, 2);
     DrawRoundButton(&Set_max_source_temp);
     Delay_ms (100);
}
void Up_5_OnPress() {
      char txt[7];
      Tone2 ();
        Image222.Visible = 1;
        Up_5_.Visible = 0;
        DrawImage(&Image222);
      system_reg[SOURS_MAX]++;
        if (system_reg[SOURS_MAX] >99)
        system_reg[SOURS_MAX] = 99;
        IntToStr(system_reg[SOURS_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_source_temp.Caption, txt, 2);
     DrawRoundButton(&Set_max_source_temp);
     Delay_ms (100);
}
void Up_5_OnUp() {
     Image222.Visible = 0;
     Up_5_.Visible = 1;
     DrawImage(&Up_5_);
}
void Down_6_OnPress() {
     char txt[7];
      Tone3 ();
        Image209.Visible = 1;
        Down_6_.Visible = 0;
        DrawImage(&Image209);
     system_reg[DEL_HEAT_MIN]--;
        if (system_reg[DEL_HEAT_MIN] < 0)
        system_reg[DEL_HEAT_MIN] = 0;
        IntToStr(system_reg[DEL_HEAT_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_delta_heat.Caption, txt, 2);
     DrawRoundButton(&Set_min_delta_heat);
     Delay_ms (100);
}
void Down_6_OnUp() {
     Image209.Visible = 0;
        Down_6_.Visible = 1;
        DrawImage(&Down_6_);
}
void Up_6_OnPress() {
      char txt[7];
      Tone2 ();
        Image223.Visible = 1;
        Up_6_.Visible = 0;
        DrawImage(&Image223);
        system_reg[DEL_HEAT_MIN]++;
        if (system_reg[DEL_HEAT_MIN] >99)
        system_reg[DEL_HEAT_MIN] = 99;
        IntToStr(system_reg[DEL_HEAT_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_delta_heat.Caption, txt, 2);
     DrawRoundButton(&Set_min_delta_heat);
     Delay_ms (100);
}
void Up_6_OnUp() {
     Image223.Visible = 0;
        Up_6_.Visible = 1;
        DrawImage(&Up_6_);
}
void Set_1_OnDown() {
        Tone1();
        /*adressReg= HEAT_MIN;
      nomReg=1;
      pushButton=true;*/
         send_data_packet(HEAT_MIN,1);
         Set_1_.Visible = 0;
     Image246.Visible = 1;
     DrawImage (&Image246);
}
void Set_1_OnUp() {
     Set_1_.Visible = 1;
     Image246.Visible = 0;
     DrawImage (&Set_1_);
}
void Set_2_OnDown() {
      Tone1();
      /*adressReg= HEAT_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(HEAT_MAX,1);
     Set_2_.Visible = 0;
     Image247.Visible = 1;
     DrawImage (&Image247);
}
void Set_2_OnUp(){
     Set_2_.Visible = 1;
     Image247.Visible = 0;
     DrawImage (&Set_2_);
}

void Set_3_OnDown() {
     Tone1();
    /*adressReg= EXAUST_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(EXAUST_MAX,1);
     Set_3_.Visible = 0;
     Image248.Visible = 1;
     DrawImage (&Image248);
}
void Set_3_OnUp()  {
     Set_3_.Visible = 1;
     Image248.Visible = 0;
     DrawImage (&Set_3_);
}
void Set_4_OnDown() {
     Tone1();
      /*adressReg= SOURS_MIN;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(SOURS_MIN,1);
     Set_4_.Visible = 0;
     Image249.Visible = 1;
     DrawImage (&Image249);
    }

void Set_4_OnUp() {
     Set_4_.Visible = 1;
     Image249.Visible = 0;
     DrawImage (&Set_4_);
}

void Set_5_OnDown() {
     Tone1();
     /*adressReg= SOURS_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(SOURS_MAX,1);
     Set_5_.Visible = 0;
     Image250.Visible = 1;
     DrawImage (&Image250);
}
void Set_5_OnUp() {
     Set_5_.Visible = 1;
     Image250.Visible = 0;
     DrawImage (&Set_5_);
}
void Furnance_HP_OFF_save_ondown() {

}
 void Set_6_OnUp() {
     Set_6_.Visible = 1;
     Image251.Visible = 0;
     DrawImage (&Set_6_);
}
void Set_6_OnDown(){
     Tone1();
    /*adressReg= DEL_HEAT_MIN;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(DEL_HEAT_MIN,1);
     Set_6_.Visible = 0;
     Image251.Visible = 1;
     DrawImage (&Image251);
}
//-----------------------------------------------------limits 2
 void Down_7_OnUp() {
     Image210.Visible = 0;
        Down_7_.Visible = 1;
        DrawImage(&Down_7_);
}
void Down_7_OnPress(){
      char txt[7];
      Tone3 ();
        Image210.Visible = 1;
        Down_7_.Visible = 0;
        DrawImage(&Image210);
      system_reg[DEL_HEAT_MAX]--;
        if (system_reg[DEL_HEAT_MAX] < 0)
        system_reg[DEL_HEAT_MAX] = 0;
        IntToStr(system_reg[DEL_HEAT_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_delta_heat.Caption, txt, 2);
     DrawRoundButton(&Set_max_delta_heat);
     Delay_ms (100);
}

void Up_7_OnPress() {
      char txt[7];
      Tone2 ();
        Image224.Visible = 1;
        Up_7_.Visible = 0;
        DrawImage(&Image224);
      system_reg[DEL_HEAT_MAX]++;
        if (system_reg[DEL_HEAT_MAX] >99)
        system_reg[DEL_HEAT_MAX] = 99;
        IntToStr(system_reg[DEL_HEAT_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_delta_heat.Caption, txt, 2);
     DrawRoundButton(&Set_max_delta_heat);
     Delay_ms (100);
        
}

void Up_7_OnUp() {
        Image224.Visible = 0;
        Up_7_.Visible = 1;
        DrawImage(&Up_7_);

}

void Down_8_OnPress() {
       char txt[7];
      Tone3 ();
        Image211.Visible = 1;
        Down_8_.Visible = 0;
        DrawImage(&Image211);
        system_reg[DEL_DHW_MIN]--;
        if (system_reg[DEL_DHW_MIN] < 0)
        system_reg[DEL_DHW_MIN] = 0;
        IntToStr(system_reg[DEL_DHW_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_delta_DHW.Caption, txt, 2);
     DrawRoundButton(&Set_min_delta_DHW);
     Delay_ms (100);
}

void Down_8_OnUp() {
       Image211.Visible = 0;
        Down_8_.Visible = 1;
        DrawImage(&Down_8_);
}

void Up_8_OnPress() {
        char txt[7];
      Tone2 ();
        Image225.Visible = 1;
        Up_8_.Visible = 0;
        DrawImage(&Image225);
        system_reg[DEL_DHW_MIN]++;
        if (system_reg[DEL_DHW_MIN] >99)
        system_reg[DEL_DHW_MIN] = 99;
        IntToStr(system_reg[DEL_DHW_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_delta_DHW.Caption, txt, 2);
     DrawRoundButton(&Set_min_delta_DHW);
     Delay_ms (100);
}

void Up_8_OnUp() {
       Image225.Visible = 0;
        Up_8_.Visible = 1;
        DrawImage(&Up_8_);
}
//------------------------------------------------------------------------------
  void Down_9_OnPress() {
       char txt[7];
      Tone3 ();
        Image214.Visible = 1;
        Down_9_.Visible = 0;
        DrawImage(&Image214);
        system_reg[DEL_DHW_MAX]--;
        if (system_reg[DEL_DHW_MAX] < 0)
        system_reg[DEL_DHW_MAX] = 0;
        IntToStr(system_reg[DEL_DHW_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_delta_DHW.Caption, txt, 2);
     DrawRoundButton(&Set_max_delta_DHW);
     Delay_ms (100);
}

void Down_9_OnUp() {
        Image214.Visible = 0;
        Down_9_.Visible = 1;
        DrawImage(&Down_9_);
}

void Up_9_OnPress() {
       char txt[7];
      Tone2 ();
        Image228.Visible = 1;
        Up_9_.Visible = 0;
        DrawImage(&Image228);
       system_reg[DEL_DHW_MAX]++;
        if (system_reg[DEL_DHW_MAX] > 99)
        system_reg[DEL_DHW_MAX] = 99;
        IntToStr(system_reg[DEL_DHW_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_delta_DHW.Caption, txt, 2);
     DrawRoundButton(&Set_max_delta_DHW);
     Delay_ms (100);
}

void Up_9_OnUp() {
      Image228.Visible = 0;
        Up_9_.Visible = 1;
        DrawImage(&Up_9_);
}
 void Down_10_OnPress() {
       char txt[7];
      Tone3 ();
        Image212.Visible = 1;
        Down_10_.Visible = 0;
        DrawImage(&Image212);
        system_reg[DEL_SOURS_MIN]--;
        if (system_reg[DEL_SOURS_MIN] < 0)
        system_reg[DEL_SOURS_MIN] = 0;
        IntToStr(system_reg[DEL_SOURS_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_delta_source.Caption, txt, 2);
     DrawRoundButton(&Set_min_delta_source);
     Delay_ms (100);
}

void Down_10_OnUp() {
     Image212.Visible = 0;
        Down_10_.Visible = 1;
        DrawImage(&Down_10_);
}

void Up_10_OnPress() {
     char txt[7];
      Tone2 ();
        Image226.Visible = 1;
        Up_10_.Visible = 0;
        DrawImage(&Image226);
        system_reg[DEL_SOURS_MIN]++;
        if (system_reg[DEL_SOURS_MIN] >99)
        system_reg[DEL_SOURS_MIN] = 99;
        IntToStr(system_reg[DEL_SOURS_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_delta_source.Caption, txt, 2);
     DrawRoundButton(&Set_min_delta_source);
     Delay_ms (100);
}

void Up_10_OnUp() {
      Image226.Visible = 0;
        Up_10_.Visible = 1;
        DrawImage(&Up_10_);
}
void Down_11_OnPress() {
         char txt[7];
      Tone3 ();
        Image213.Visible = 1;
        Down_11_.Visible = 0;
        DrawImage(&Image213);
       system_reg[DEL_SOURS_MAX]--;
        if (system_reg[DEL_SOURS_MAX] < 0)
        system_reg[DEL_SOURS_MAX] = 0;
        IntToStr(system_reg[DEL_SOURS_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_source_delta.Caption, txt, 2);
     DrawRoundButton(&Set_max_source_delta);
     Delay_ms (100);
}

void Down_11_OnUp() {
     Image213.Visible = 0;
        Down_11_.Visible = 1;
        DrawImage(&Down_11_);

}

void Up_11_OnPress() {
         char txt[7];
      Tone2 ();
        Image227.Visible = 1;
        Up_11_.Visible = 0;
        DrawImage(&Image227);
       system_reg[DEL_SOURS_MAX]++;
        if (system_reg[DEL_SOURS_MAX] >99)
        system_reg[DEL_SOURS_MAX] = 99;
        IntToStr(system_reg[DEL_SOURS_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_source_delta.Caption, txt, 2);
     DrawRoundButton(&Set_max_source_delta);
     Delay_ms (100);
}

void Up_11_OnUp() {
      Image227.Visible = 0;
      Up_11_.Visible = 1;
      DrawImage(&Up_11_);
}


//------------------------------------------------------------------------------

void Down_12_OnPress() {

}

void Down_12_OnUp() {

}

void Up_12_OnPress() {

}

void Up_12_OnUp() {

}
void Set_7_OnUp() {
       Set_7_.Visible = 1;
     Image252.Visible = 0;
     DrawImage (&Set_7_);
}
void Set_7_OnDown(){
     Tone1();
      /*adressReg= DEL_HEAT_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(DEL_HEAT_MAX,1);
     Set_7_.Visible = 0;
     Image252.Visible = 1;
     DrawImage (&Image252);
}

void Set_8_OnDown() {
      Tone1();
      /*adressReg= DEL_DHW_MIN;
      nomReg=1;
      pushButton=true;*/
      send_data_packet(DEL_DHW_MIN,1);
     Set_8_.Visible = 0;
     Image253.Visible = 1;
     DrawImage (&Image253);
}

void Set_8_OnUp() {
      Set_8_.Visible = 1;
     Image253.Visible = 0;
     DrawImage (&Set_8_);
}
//--------------------
 void Set_9_OnUp() {
      Set_9_.Visible = 1;
     Image256.Visible = 0;
     DrawImage (&Set_9_);
}
void Set_9_OnDown() {
     Tone1();
      /*adressReg= DEL_DHW_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(DEL_DHW_MAX,1);
     Set_9_.Visible = 0;
     Image256.Visible = 1;
     DrawImage (&Image256);
}
 void Set_10_OnDown() {
        Tone1();
      /*adressReg= DEL_SOURS_MIN;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(DEL_SOURS_MIN,1);
     Set_10_.Visible = 0;
     Image254.Visible = 1;
     DrawImage (&Image254);
}

void Set_10_OnUp() {
      Set_10_.Visible = 1;
     Image254.Visible = 0;
     DrawImage (&Set_10_);
}
void Set_11_OnDown() {
     Tone1();
      /*adressReg= DEL_SOURS_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(DEL_SOURS_MAX,1);
     Set_11_.Visible = 0;
     Image255.Visible = 1;
     DrawImage (&Image255);
}
void Set_11_OnUp() {
    Set_11_.Visible = 1;
     Image255.Visible = 0;
     DrawImage (&Set_11_);
}

void Set_12_OnDown() {

}
void Set_12_OnUp() {

}

//------------------------------------------------------------limits 4

void Down_19_OnPress() {
        char txt[7];
      Tone3 ();
        Image243.Visible = 1;
        Down_19_.Visible = 0;
        DrawImage(&Image243);
       system_reg[S_HEAT_MAX]--;
        if (system_reg[S_HEAT_MAX] < 0)
        system_reg[S_HEAT_MAX] = 0;
        IntToStr(system_reg[S_HEAT_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_superheat.Caption, txt, 2);
     DrawRoundButton(&Set_max_superheat);
     Delay_ms (100);
}
void Down_19_OnUp() {
       Image243.Visible = 0;
        Down_19_.Visible = 1;
        DrawImage(&Down_19_);
}
void Up_19_OnPress() {
      char txt[7];
      Tone2 ();
        Image236.Visible = 1;
        Up_19_.Visible = 0;
        DrawImage(&Image236);
      system_reg[S_HEAT_MAX]++;
        if (system_reg[S_HEAT_MAX] >99)
        system_reg[S_HEAT_MAX] = 99;
        IntToStr(system_reg[S_HEAT_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_superheat.Caption, txt, 2);
     DrawRoundButton(&Set_max_superheat);
     Delay_ms (100);
}
void Up_19_OnUp() {
      Image236.Visible = 0;
        Up_19_.Visible = 1;
        DrawImage(&Up_19_);
}
void Down_20_OnPress() {
      char txt[7];
      Tone3 ();
        Image244.Visible = 1;
        Down_20_.Visible = 0;
        DrawImage(&Image244);
    system_reg[S_COOL_MIN]--;
        if (system_reg[S_COOL_MIN]<0)
        system_reg[S_COOL_MIN] = 0;
        IntToStr(system_reg[S_COOL_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_subcooling.Caption, txt, 2);
     DrawRoundButton(&Set_min_subcooling);
     Delay_ms (100);
}
void Down_20_OnUp() {
      Image244.Visible = 0;
        Down_20_.Visible = 1;
        DrawImage(&Down_20_);
}
void Up_20_OnPress() {
     char txt[7];
      Tone2 ();
        Image237.Visible = 1;
        Up_20_.Visible = 0;
        DrawImage(&Image237);
     system_reg[S_COOL_MIN]++;
        if (system_reg[S_COOL_MIN]>99)
        system_reg[S_COOL_MIN] = 99;
        IntToStr(system_reg[S_COOL_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_subcooling.Caption, txt, 2);
     DrawRoundButton(&Set_min_subcooling);
     Delay_ms (100);
}
void Up_20_OnUp() {
      Image237.Visible = 0;
        Up_20_.Visible = 1;
        DrawImage(&Up_20_);
}
void Down_21_OnPress() {
       char txt[7];
      Tone2 ();
        Image238.Visible = 1;
        Up_21_.Visible = 0;
        DrawImage(&Image238);
      system_reg[S_COOL_MAX]--;
        if (system_reg[S_COOL_MAX]<0)
        system_reg[S_COOL_MAX] = 0;
        IntToStr(system_reg[S_COOL_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_subcooling.Caption, txt, 2);
     DrawRoundButton(&Set_max_subcooling);
     Delay_ms (100);
}
void Down_21_OnUp() {
       Image245.Visible = 0;
        Down_21_.Visible = 1;
        DrawImage(&Down_21_);
}
void Up_21_OnPress() {
      char txt[7];
      Tone2 ();
        Image238.Visible = 1;
        Up_21_.Visible = 0;
        DrawImage(&Image238);
      system_reg[S_COOL_MAX]++;
        if (system_reg[S_COOL_MAX]>99)
        system_reg[S_COOL_MAX] = 99;
        IntToStr(system_reg[S_COOL_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_subcooling.Caption, txt, 2);
     DrawRoundButton(&Set_max_subcooling);
     Delay_ms (100);
}
void Up_21_OnUp() {
      Image238.Visible = 0;
        Up_21_.Visible = 1;
        DrawImage(&Up_21_);
}

void Down_22_OnPress(){
      char txt[7];
        Image24.Visible = 1;
        Down_22_.Visible = 0;
        DrawImage(&Image24);
       system_reg[HP_MAX]--;
        if (system_reg[HP_MAX]<0)
        system_reg[HP_MAX] = 0;
        IntToStr(system_reg[HP_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_high_pressure.Caption, txt, 2);
     DrawRoundButton(&Set_max_high_pressure);
     Delay_ms (100);
}
void Down_22_OnUp(){
    Image24.Visible = 0;
    Down_22_.Visible = 1;
    DrawImage(&Down_22_);

}
void Up_22_OnPress(){
    char txt[7];
        Image53.Visible = 1;
        Up_22_.Visible = 0;
        DrawImage(&Image53);
    system_reg[HP_MAX]++;
        if (system_reg[HP_MAX]>99)
        system_reg[HP_MAX] = 99;
        IntToStr(system_reg[HP_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_high_pressure.Caption, txt, 2);
     DrawRoundButton(&Set_max_high_pressure);
     Delay_ms (100);
}
void Up_22_OnUp(){
        Image53.Visible = 0;
        Up_22_.Visible = 1;
        DrawImage(&Up_22_);
}
void Down_23_OnPress(){
        char txt[7];
        Image86.Visible = 1;
        Down_23_.Visible = 0;
        DrawImage(&Image86);
        system_reg[HP_MIN]--;
        if (system_reg[HP_MIN]<0)
        system_reg[HP_MIN] = 0;
        IntToStr(system_reg[HP_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
     DrawRoundButton(&Set_min_lhigh_pressure);
     Delay_ms (100);
}
void Down_23_OnUp(){
        Image86.Visible = 0;
        Down_23_.Visible = 1;
        DrawImage(&Down_23_);

}
void Up_23_OnPress(){
        char txt[7];
        Image95.Visible = 1;
        Up_23_.Visible = 0;
        DrawImage(&Image95);
        system_reg[HP_MIN]++;
        if (system_reg[HP_MIN]>99)
        system_reg[HP_MIN] = 99;
        IntToStr(system_reg[HP_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
     DrawRoundButton(&Set_min_lhigh_pressure);
     Delay_ms (100);
}
void Up_23_OnUp(){
       Image86.Visible = 0;
        Up_23_.Visible = 1;
        DrawImage(&Up_23_);
}

void Set_19_OnUp() {
     Set_19_.Visible = 1;
     Image264.Visible = 0;
     DrawImage (&Set_19_);
}
void void Set_19_OnDown(){
      Tone1();
      /*adressReg= S_HEAT_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(S_HEAT_MAX,1);
     Set_19_.Visible = 0;
     Image264.Visible = 1;
     DrawImage (&Image264);
}
void Set_20_OnDown() {
      Tone1();
      /*adressReg= S_COOL_MIN;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(S_COOL_MIN,1);
     Set_20_.Visible = 0;
     Image265.Visible = 1;
     DrawImage (&Image265);
}
void Set_20_OnUp() {
      Set_20_.Visible = 1;
     Image265.Visible = 0;
     DrawImage (&Set_20_);
}
void Set_21_OnDown() {
      Tone1();
      /*adressReg= S_COOL_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(S_COOL_MAX,1);
     Set_21_.Visible = 0;
     Image266.Visible = 1;
     DrawImage (&Image266);
}
void Set_21_OnUp() {
     Set_21_.Visible = 1;
     Image266.Visible = 0;
     DrawImage (&Set_21_);
}
void Set_22_OnDown(){
     Tone1();
      /*adressReg= HP_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(HP_MAX,1);
     Set_22_.Visible = 0;
     Image34.Visible = 1;
     DrawImage (&Image34);
}

void Set_22_OnUp(){
     Tone1();
     Set_22_.Visible = 1;
     Image34.Visible = 0;
     DrawImage (&Set_22_);
}
void Set_23_OnDown(){
     Tone1();
     /*adressReg= HP_MIN;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(HP_MIN,1);
     Set_23_.Visible = 0;
     Image33.Visible = 1;
     DrawImage (&Image33);
}
void Set_23_OnUp(){
     Tone1();
     Set_23_.Visible = 1;
     Image33.Visible = 0;
     DrawImage (&Set_23_);
}
 //---------------------------------------------- mode

void One_CompressorsOnClick() {
      if ((unsigned long)One_Compressors.Picture_Name == Compressor1_jpg)
  {
      One_Compressors.Picture_Name = Compressor2_jpg;
      DrawImage(&Two_Compressors);
      system_reg[NOMB_COMPRESSORS]=2;
      two_compressors_mode=true;
  }
  else {
      One_Compressors.Picture_Name = Compressor1_jpg;
      DrawImage(&One_Compressors);
      system_reg[NOMB_COMPRESSORS]=1;
      two_compressors_mode=false;
       }
      send_data_packet(NOMB_COMPRESSORS,1);
    Delay_ms (300);
}

void Reversing_ON_HEATOnClick() {
      if ((unsigned long)Reversing_ON_HEAT.Picture_Name == but_ON_jpg)
  {
      Reversing_ON_HEAT.Picture_Name = but_OFF_jpg;
      DrawImage(&Reversing_Heat_OFF);
      system_reg[REVERS_MOD]=0;

  }
  else {
      Reversing_ON_HEAT.Picture_Name = but_ON_jpg;
      DrawImage(&Reversing_ON_HEAT);
      system_reg[REVERS_MOD]=1;
       }
      send_data_packet(REVERS_MOD,1);
    Delay_ms (300);
}
void Flow_Source__Sensor_ONOnClick(){

}
void Flow_Source__Heat1_ONOnClick() {

}
void Flow_Source__Heat2_ONOnClick() {

}
void Power_380VOnClick() {

}

//---------------------------------------- furnance
void furnance_Mode_onOnClick() {

}

void Furnance_start_temp_DownOnUp() {

}
void Furnance_start_temp_DownOnPress() {

}
void Furnance_HP_OFF_DowmOnUp() {

}
void Furnance_HP_OFF_DowmOnPress() {

}
void Furnance_HP_OFF_UPOnUp() {

}
void Furnance_HP_OFF_UPOnPress() {

}

void Furnance_off_downOnUp() {

}
void Furnance_off_downOnPress() {

}
void Furnance_off_upOnUp() {

}
void Furnance_off_upOnPress() {

}
void Furnance_off_save_onup() {

}
void Furnance_off_save_ondown() {

}
void Furnance_time_downOnUp() {

}
void Furnance_time_downOnPress() {

}
void Furnance_time_upOnUp() {

}
void Furnance_time_upOnPress() {

}
void furnance_time_OFFOnClick() {

}
void Furnance_HP_OFF_save_onup(){
}
void Furnance_start_temp_UPOnUp(){
}
void Furnance_start_temp_UPOnPress(){
 }
//-----------------------------------------------ethernet

void SetIPAddressOnClick() {

}

void SetMaskOnClick() {

}

void SetDNSOnClick() {

}

void LAN_Key_1OnClick() {

}

void LAN_Key_2OnClick() {

}

void LAN_Key_3OnClick() {

}

void LAN_Key_4OnClick() {

}

void LAN_Key_5OnClick() {

}

void LAN_Key_6OnClick() {

}

void LAN_Key_7OnClick() {

}

void LAN_Key_8OnClick() {

}

void LAN_Key_9OnClick() {

}

void LAN_Key_0OnClick() {

}

void LAN_Key_DotOnClick() {

}

void LAN_Key_ClearOnClick() {

}

void LANSetOnClick() {

}
void SetGateWayOnClick(){
}
//-------------------------------------------------settings
void Hyst_Heat_downOnUp() {
       Hyst_Heat_down.Visible = 1;
        Image114.Visible = 0;
        DrawImage(&Hyst_Heat_down);
}
void Hyst_Heat_downOnPress() {
char txt[7];
         Tone3 ();
        Hyst_Heat_down.Visible = 0;
        Image114.Visible = 1;
        DrawImage(&Image114);
        system_reg[DIFF_HEAT]--;
        if (system_reg[DIFF_HEAT] <0)
        system_reg[DIFF_HEAT] =0;
        IntToStr(system_reg[DIFF_HEAT], txt);
     Ltrim (txt);
     strncpy(Hysteresis_heating.Caption, txt, 2);
     DrawRoundButton(&Hysteresis_heating);
     Delay_ms (100);
}
void Hyst_Heat_upOnUp() {
        Hyst_Heat_up.Visible = 1;
        Image121.Visible = 0;
        DrawImage(&Hyst_Heat_up);
}
void Hyst_Heat_upOnPress() {
char txt[7];
      Tone3 ();
        Hyst_Heat_up.Visible = 0;
        Image121.Visible = 1;
        DrawImage(&Image121);
       system_reg[DIFF_HEAT]++;
        if (system_reg[DIFF_HEAT] >30)
        system_reg[DIFF_HEAT] =30;
        IntToStr(system_reg[DIFF_HEAT], txt);
     Ltrim (txt);
     strncpy(Hysteresis_heating.Caption, txt, 2);
     DrawRoundButton(&Hysteresis_heating);
     Delay_ms (100);
}
void Hyst_Cool_downOnUp() {
        Hyst_Cool_down.Visible = 1;
        Image115.Visible = 0;
        DrawImage(&Hyst_Cool_down);
}
void Hyst_Cool_downOnPress() {
char txt[7];
         Tone3 ();
        Hyst_Cool_down.Visible = 0;
        Image115.Visible = 1;
        DrawImage(&Image115);
        system_reg[DIFF_COOL]--;
        if (system_reg[DIFF_COOL] <0)
        system_reg[DIFF_COOL] =0;
        IntToStr(system_reg[DIFF_COOL], txt);
     Ltrim (txt);
     strncpy(Hysteresis_cooling.Caption, txt, 2);
     DrawRoundButton(&Hysteresis_cooling);
     Delay_ms (100);
}
void Hyst_Cool_upOnUp() {
       Hyst_Cool_up.Visible = 1;
        Image122.Visible = 0;
        DrawImage(&Hyst_Cool_up);

}
void Hyst_Cool_upOnPress() {
char txt[7];
                Tone3 ();
        Hyst_Cool_up.Visible = 0;
        Image122.Visible = 1;
        DrawImage(&Image122);
        system_reg[DIFF_COOL]++;
        if (system_reg[DIFF_COOL] >30)
        system_reg[DIFF_COOL] =30;
        IntToStr(system_reg[DIFF_COOL], txt);
     Ltrim (txt);
     strncpy(Hysteresis_cooling.Caption, txt, 2);
     DrawRoundButton(&Hysteresis_cooling);
     Delay_ms (100);
}
void Hyst_DHW_downOnUp() {
      Hyst_DHW_down.Visible = 1;
        Image116.Visible = 0;
        DrawImage(&Hyst_DHW_down);
}
void Hyst_DHW_downOnPress() {
char txt[7];
       Tone3 ();
        Hyst_DHW_down.Visible = 0;
        Image116.Visible = 1;
        DrawImage(&Image116);
          system_reg[DIFF_DHW]--;
        if (system_reg[DIFF_DHW] <0)
        system_reg[DIFF_DHW] =0;
        IntToStr(system_reg[DIFF_DHW], txt);
     Ltrim (txt);
     strncpy(Hysteresis_DHW.Caption, txt, 2);
     DrawRoundButton(&Hysteresis_DHW);
     Delay_ms (100);
}
void Hyst_DHW_upOnUp() {
        Hyst_DHW_up.Visible = 1;
        Image123.Visible = 0;
        DrawImage(&Hyst_DHW_up);
}
void Hyst_DHW_upOnPress() {
char txt[7];
           Hyst_DHW_up.Visible = 0;
        Image123.Visible = 1;
        DrawImage(&Image123);
        system_reg[DIFF_DHW]++;
        if (system_reg[DIFF_DHW] >30)
        system_reg[DIFF_DHW] =30;
        IntToStr(system_reg[DIFF_DHW], txt);
     Ltrim (txt);
     strncpy(Hysteresis_DHW.Caption, txt, 2);
     DrawRoundButton(&Hysteresis_DHW);
     Delay_ms (100);
}
void Set_heat_onup(){
       Tone1();
     Image135.Visible = 1;
     Image128.Visible = 0;
     DrawImage (&Image135);
}
void Set_heat_OnDown(){
     Tone1();
      /*adressReg= DIFF_HEAT;
      nomReg=1;
      pushButton=true;*/
     send_data_packet (DIFF_HEAT,1);
     Image135.Visible = 0;
     Image128.Visible = 1;
     DrawImage (&Image128);
}
void Set_cool_OnUp(){
       Tone1();
     Image138.Visible = 1;
     Image129.Visible = 0;
     DrawImage (&Image138);
}
void Set_cool_OnDown(){
      Tone1();
     /*adressReg= DIFF_COOL;
      nomReg=1;
      pushButton=true;*/
     send_data_packet (DIFF_COOL,1);
     Image138.Visible = 0;
     Image129.Visible = 1;
     DrawImage (&Image129);
}
void Set_dhw_OnUp(){
      Tone1();
     Set_DHW_HY.Visible = 1;
     Image130.Visible = 0;
     DrawImage (&Set_DHW_HY);
}
void Set_dhw_OnDown(){
       Tone1();
      /*adressReg= DIFF_DHW;
      nomReg=1;
      pushButton=true;*/
     send_data_packet (DIFF_DHW,1);
     Set_DHW_HY.Visible = 0;
     Image130.Visible = 1;
     DrawImage (&Image130);
}
 //-----------------------------------------------eev2

void DEC_EEV2OnPress() {

 }
void INC_EEV2OnPress() {

 }
 void EEV2DownOnUp() {

}

void EEV2DownOnDown() {

}
void EEV2UpOnUp() {

}
void EEV2UpOnDown() {

}
void EEV2_AutoOnClick() {

}
//-------------------------------------------------mode2
void  Mode_ground_onOnClick () {
       if ((unsigned long)Mode_ground_on.Picture_Name == mode_brine_jpg)
  {
      Mode_ground_on.Picture_Name = mode_air_jpg;
      DrawImage(&Mode_air_on);
      system_reg[AIRE_TO_WATER]=1;
      ground_heat_pump=false;
  }
  else {
      Mode_ground_on.Picture_Name = mode_brine_jpg;
      DrawImage(&Mode_ground_on);
      system_reg[AIRE_TO_WATER]=0;
      ground_heat_pump=true;
       }
      send_data_packet(AIRE_TO_WATER,1);
    Delay_ms (300);
}
//-------------------------------------------------defrost



//------------------------------------------------limits 5

void Down_24_OnPress(){
        char txt[7];
        Image99.Visible = 1;
        Image17.Visible = 0;
        DrawImage(&Image99);
        system_reg[LP_MAX]--;
        if (system_reg[LP_MAX]<0)
        system_reg[LP_MAX] = 0;
        IntToStr(system_reg[LP_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_low_pressure.Caption, txt, 2);
     DrawRoundButton(&Set_max_low_pressure);
     Delay_ms (100);

}
void Down_24_OnUp(){
      Image99.Visible = 0;
      Image17.Visible = 1;
      DrawImage(&Image17);
}
 void Up_24_OnPress(){
      char txt[7];
        Image100.Visible = 1;
        Image12.Visible = 0;
        DrawImage(&Image100);
        system_reg[LP_MAX]++;
        if (system_reg[LP_MAX]>99)
        system_reg[LP_MAX] = 99;
        IntToStr(system_reg[LP_MAX], txt);
     Ltrim (txt);
     strncpy(Set_max_low_pressure.Caption, txt, 2);
     DrawRoundButton(&Set_max_low_pressure);
     Delay_ms (100);

}
void Up_24_OnUp(){
      Image100.Visible = 0;
        Image12.Visible = 1;
        DrawImage(&Image12);
}
void Down_25_OnPress(){
      char txt[7];
        Image280.Visible = 1;
        Image18.Visible = 0;
        DrawImage(&Image280);
       system_reg[LP_MIN]--;
        if (system_reg[LP_MIN]<0)
        system_reg[LP_MIN] = 0;
        IntToStr(system_reg[LP_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_low_pressure.Caption, txt, 3);
     DrawRoundButton(&Set_min_low_pressure);
     Delay_ms (100);
        
}
void Down_25_OnUp(){
       Image280.Visible = 0;
        Image18.Visible = 1;
        DrawImage(&Image18);

}
void Up_25_OnPress(){
       char txt[15];
        Image281.Visible = 1;
        Image14.Visible = 0;
        DrawImage(&Image281);
        system_reg[LP_MIN]++;
        if (system_reg[LP_MIN]>99)
        system_reg[LP_MIN] = 99;
        IntToStr(system_reg[LP_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_low_pressure.Caption, txt, 3);
     DrawRoundButton(&Set_min_low_pressure);
     Delay_ms (100);
}
void Up_25_OnUp(){
      Image281.Visible = 0;
        Image14.Visible = 1;
        DrawImage(&Image14);
}
void Down_26_OnPress() {

}
void Down_26_OnUp() {

}
void UP_26_OnPress() {

}
void UP_26_OnUp() {

}
void Set_24_OnDown(){
      Tone1();
      /*adressReg= LP_MAX;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(LP_MAX,1);
     Image279.Visible = 0;
     Image29.Visible = 1;
     DrawImage (&Image29);
}
void Set_24_OnUp(){
       Tone1();
     Image279.Visible = 1;
     Image29.Visible = 0;
     DrawImage (&Image279);
}
void Set_25_OnDown(){
Tone1();
      /*adressReg= LP_MIN;
      nomReg=1;
      pushButton=true;*/
     send_data_packet(LP_MIN,1);
     Image282.Visible = 0;
     Image22.Visible = 1;
     DrawImage (&Image22);
}
void Set_25_OnUp(){
      Tone1();
     Image282.Visible = 1;
     Image22.Visible = 0;
     DrawImage (&Image282);
}
void Set_26_OnDown() {

}
void Set_26_OnUp() {

}
void Set_phase_check(){

}
void Set_voltage_check(){

}

//----------------------------------------------------- limits 3
void Down_13_OnUp() {

}
void Down_13_OnPress() {
}
void Up_13_OnPress() {

}
void Up_13_OnUp() {

}

void Down_14_OnPress() {

}
void Down_14_OnUp() {

}
void Up_14_OnPress() {

}
void Up_14_OnUp() {

}
void Down_15_OnPress() {

}
void Down_15_OnUp() {

}
void Up_15_OnPress() {

}
void Up_15_OnUp() {

}
void Down_16_OnPress() {

}
void Down_16_OnUp() {

}
void Up_16_OnPress() {

}
void Up_16_OnUp() {

}
void Down_17_OnPress() {      // Electric heater preset setting

}
void Down_17_OnUp() {

}
void Up_17_OnPress() {

}
void Up_17_OnUp() {

}
void Down_18_OnPress() {
        char txt[7];
        Tone3 ();
        Image481.Visible = 1;
        Down_18_.Visible = 0;
        DrawImage(&Image481);
        system_reg[S_HEAT_MIN]--;
        if (system_reg[S_HEAT_MIN] < 0)
        system_reg[S_HEAT_MIN] = 0;
        IntToStr(system_reg[S_HEAT_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_superheat.Caption, txt, 2);
     DrawRoundButton(&Set_min_superheat);
     Delay_ms (100);
}
void Down_18_OnUp() {
        Image481.Visible = 0;
        Down_18_.Visible = 1;
        DrawImage(&Down_18_);
}
void Up_18_OnPress() {
       char txt[7];
      Tone2 ();
        Image477.Visible = 1;
        Up_18_.Visible = 0;
        DrawImage(&Image477);
        system_reg[S_HEAT_MIN]++;
        if (system_reg[S_HEAT_MIN] >99)
        system_reg[S_HEAT_MIN] = 99;
        IntToStr(system_reg[S_HEAT_MIN], txt);
     Ltrim (txt);
     strncpy(Set_min_superheat.Caption, txt, 2);
     DrawRoundButton(&Set_min_superheat);
     Delay_ms (100);
}
void Up_18_OnUp() {
        Image477.Visible = 0;
        Up_18_.Visible = 1;
        DrawImage(&Up_18_);
}
void Set_15_OnUp() {

}
void Set_15_OnDown() {

}
void Set_16_OnUp() {

}
void Set_16_OnDown() {

}
void Set_17_OnUp () {

}
void Set_17_OnDown() {

}
void Set_18_OnUp() {
     Set_18_.Visible = 1;
     Image485.Visible = 0;
     DrawImage (&Set_18_);
}
void Set_18_OnDown() {
     Tone1();
     
     send_data_packet(S_HEAT_MIN,1);
     Set_18_.Visible = 0;
     Image485.Visible = 1;
     DrawImage (&Image485);
}
void Set_14_OnDown() {

}
void Set_14_OnUp(){
}
void Set_13_OnUp() {

}
void Set_13_OnDown() {

}




 //-----------------------------------------------end