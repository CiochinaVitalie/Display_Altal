  #include "Controller_objects.h"
   #include "Controller_resources.h"
  #include <stdbool.h>
  #include "systick.h"
  #include <stdint.h>
  #include "built_in.h"

  extern int system_reg[600];
 // extern float press;
  void main_page(){
       int convert_temp;
       static unsigned char state_mod;
        static unsigned char state_switch;
       //static char tempor_var[4];
       char txt[7];
       //convert_temp =  calc_temperature(system_reg[DHW_TEMP]);
            IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);
            //if(convert_temp==1250)strcpy(txt,"00");
            if(strncmp(txt,dhw_temp_main.Caption,2)!=0){
            strncpy(dhw_temp_main.Caption, txt, 2);
            if(system_reg[DHW_TEMP]<10 && system_reg[DHW_TEMP]>=0){dhw_temp_main.Caption[1]=dhw_temp_main.Caption[0];dhw_temp_main.Caption[0]='0';}
            DrawRoundBox(&BoxRound2);
            DrawLabel (&dhw_temp_main);
            }
      //convert_temp =  calc_temperature(system_reg[BAC_TEMP]);
            IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);
            //if(convert_temp==1250)strcpy(txt,"00");
            if(strncmp(txt,heat_temp_main.Caption,2)!=0){
            strncpy(heat_temp_main.Caption, txt, 2);
            if(system_reg[BAC_TEMP]<10 && system_reg[BAC_TEMP]>=0){heat_temp_main.Caption[1]=heat_temp_main.Caption[0];heat_temp_main.Caption[0]='0';}
            DrawRoundBox(&heatBox);
            DrawLabel (&heat_temp_main);
            }
       //convert_temp =  calc_temperature(system_reg[SOURC_OUT_1]);
            IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);
            //if(convert_temp==1250)strcpy(txt,"00");
            if(strncmp(txt,sourse_temp_output_main.Caption,2)!=0){
            strncpy(sourse_temp_output_main.Caption, txt, 2);
            if(system_reg[SOURC_OUT_1]<10 && system_reg[SOURC_OUT_1]>=0){sourse_temp_output_main.Caption[1]=sourse_temp_output_main.Caption[0];sourse_temp_output_main.Caption[0]='0';}
            DrawRoundBox(&BoxRound4);
            DrawLabel (&sourse_temp_output_main);
            }
     // convert_temp =  calc_temperature(system_reg[SOURC_IN_1]);
            IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);
            //if(convert_temp==1250)strcpy(txt,"00");
            if(strncmp(txt,sourse_temp_input_main.Caption,2)!=0){
            strncpy(sourse_temp_input_main.Caption, txt, 2);
            if(system_reg[SOURC_IN_1]<10 && system_reg[SOURC_IN_1]>=0){sourse_temp_input_main.Caption[1]=sourse_temp_input_main.Caption[0];sourse_temp_input_main.Caption[0]='0';}
            DrawRoundBox(&BoxRound3);
            DrawLabel (&sourse_temp_input_main);
            }

         if(system_reg[THREE_STATE]==1){
          dhw_led.Gradient_Start_Color = 0xFFFF;
          dhw_led.Gradient_End_Color = 0xF800;
          dhw_led.Color           = 0xF800;
          DrawCircle(&dhw_led);
            heat_led.Gradient_Start_Color = 0xFFFF;
            heat_led.Gradient_End_Color = 0x0014;
            heat_led.Color           = 0x041F;
          DrawCircle(&heat_led);}
          else{
          heat_led.Gradient_Start_Color = 0xFFFF;
          heat_led.Gradient_End_Color = 0xF800;
          heat_led.Color           = 0xF800;
          DrawCircle(&dhw_led);
            dhw_led.Gradient_Start_Color = 0xFFFF;
            dhw_led.Gradient_End_Color = 0x0014;
            dhw_led.Color           = 0x041F;
          DrawCircle(&heat_led);}

     }

   void startPage(){

            if(system_reg[POWER]==1) {Main_OFF.Picture_Name = main_on_bmp;DrawImage(&Main_ON); }
            if(system_reg[POWER]==0){Main_OFF.Picture_Name = main_off_bmp;DrawImage(&Main_OFF);}
            if(system_reg[HEAT]==0 && system_reg[COOL]==1) {ON_OFF_Heat_Cool.Caption = "ON"; bar_heating.Caption = "COOLING";DrawRoundButton(&bar_heating);DrawImage(&cool_icon);}
            if(system_reg[HEAT]==1 && system_reg[COOL]==0) {ON_OFF_Heat_Cool.Caption = "ON"; bar_heating.Caption = "HEATING";DrawRoundButton(&bar_heating);DrawImage(&heat_icon);}
            if(system_reg[HEAT]==0 && system_reg[COOL]==0) ON_OFF_Heat_Cool.Caption = "OFF";
            if(system_reg[HEATWATER]==0)ON_OFF_DHW.Caption = "OFF";
            if(system_reg[HEATWATER]==1)ON_OFF_DHW.Caption = "ON";
             DrawRoundButton(&ON_OFF_Heat_Cool);
             DrawRoundButton(&ON_OFF_DHW);

            }

   
  void sensor_1(unsigned char num_page){
             int convert_temp;
             char txt[7];
  if(num_page==0)
  { 
     IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_Inlet_1.Caption,2)!=0){strncpy(S_Brine_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Inlet_1);}
     IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_Outlet_1.Caption,2)!=0){strncpy(S_Brine_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Outlet_1);}
     IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_Inlet_1.Caption,2)!=0){strncpy(S_Heat_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Inlet_1);}
     IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_Outlet_1.Caption,2)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Outlet_1);}
     IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
   if(system_reg[EXAUST_TEMP_1]<100){
    if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
      S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
      DrawRoundButton(&S_Compressor_1);
      strncpy(S_Compressor_1.Caption, txt, 3);
      }
      }
    else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
     IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Superheat_1.Caption,2)!=0){strncpy(S_Superheat_1.Caption, txt, 2);DrawRoundButton(&S_Superheat_1);}
     IntToStr(system_reg[S_COOL_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Subcool_1.Caption,2)!=0){strncpy(S_Subcool_1.Caption, txt, 2);DrawRoundButton(&S_Subcool_1);}
     IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,S_DHW.Caption,2)!=0){strncpy(S_DHW.Caption, txt, 2);DrawRoundButton(&S_DHW);}
     IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,SS_tank.Caption,2)!=0){strncpy(SS_tank.Caption, txt, 2);DrawRoundButton(&SS_tank);}
     IntToStr(system_reg[CONDENS_TEMP_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_condenser_1.Caption,2)!=0){strncpy(S_condenser_1.Caption, txt, 2);DrawRoundButton(&S_condenser_1);}
     IntToStr(system_reg[SUCT_TEMP_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_suction_1.Caption,2)!=0){strncpy(S_suction_1.Caption, txt, 2);DrawRoundButton(&S_suction_1);}
     IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_High_Pressure_1.Caption,2)!=0){strncpy(S_High_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_High_Pressure_1);}
     IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Low_Pressure_1.Caption,2)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_Low_Pressure_1);}
  }
  else if(num_page==1)
     {
           IntToStr(system_reg[SOURC_IN_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_Inlet_1.Caption,2)!=0){strncpy(S_Brine_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Inlet_1);}
     IntToStr(system_reg[SOURC_OUT_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_Outlet_1.Caption,2)!=0){strncpy(S_Brine_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Brine_Outlet_1);}
     IntToStr(system_reg[HEAT_IN_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_Inlet_1.Caption,2)!=0){strncpy(S_Heat_Inlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Inlet_1);}
     IntToStr(system_reg[HEAT_OUT_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_Outlet_1.Caption,2)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 2);DrawRoundButton(&S_Heat_Outlet_1);}
     IntToStr(system_reg[EXAUST_TEMP_2], txt);Ltrim(txt);//
   if(system_reg[EXAUST_TEMP_2]<100){
    if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
      S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
      DrawRoundButton(&S_Compressor_1);
      strncpy(S_Compressor_1.Caption, txt, 3);
      }
      }
    else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
     IntToStr(system_reg[S_HEAT_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_Superheat_1.Caption,2)!=0){strncpy(S_Superheat_1.Caption, txt, 2);DrawRoundButton(&S_Superheat_1);}
     IntToStr(system_reg[S_COOL_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_Subcool_1.Caption,2)!=0){strncpy(S_Subcool_1.Caption, txt, 2);DrawRoundButton(&S_Subcool_1);}
     IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,S_DHW.Caption,2)!=0){strncpy(S_DHW.Caption, txt, 2);DrawRoundButton(&S_DHW);}
     IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,SS_tank.Caption,2)!=0){strncpy(SS_tank.Caption, txt, 2);DrawRoundButton(&SS_tank);}
     IntToStr(system_reg[CONDENS_TEMP_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_condenser_1.Caption,2)!=0){strncpy(S_condenser_1.Caption, txt, 2);DrawRoundButton(&S_condenser_1);}
     IntToStr(system_reg[SUCT_TEMP_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_suction_1.Caption,2)!=0){strncpy(S_suction_1.Caption, txt, 2);DrawRoundButton(&S_suction_1);}
     IntToStr(system_reg[HIGH_PRESS_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_High_Pressure_1.Caption,2)!=0){strncpy(S_High_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_High_Pressure_1);}
     IntToStr(system_reg[LOW_PRESS_2], txt);Ltrim(txt);//
    if(strncmp(txt,S_Low_Pressure_1.Caption,2)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 2);DrawRoundButton(&S_Low_Pressure_1);}
     }
  }
 void data_eeprom(){
     char txt[7];
     char txt_float[15];
     //delay
 IntToStr(system_reg[COMP_DEL], txt);Ltrim(txt);
  strncpy(Delay_compressor.Caption, txt, 2);
 IntToStr(system_reg[SOURS_DEL], txt);Ltrim(txt);
  strncpy(Delay_Source.Caption, txt, 2);
 IntToStr(system_reg[HEAT_DEL], txt);Ltrim(txt);
  strncpy(Delay_heat_pump.Caption, txt, 2);
 IntToStr(system_reg[REVERS_DEL], txt);Ltrim(txt);
  strncpy(Delay_reversing.Caption, txt, 2);
 IntToStr(system_reg[TRV_DEL], txt);Ltrim(txt);
  strncpy(Delay_EEV.Caption, txt, 2);
 IntToStr(system_reg[THREE_WAY_DEL], txt);Ltrim(txt);
  strncpy(Delay_DHW_valve.Caption, txt, 2);
    //limits_1
 IntToStr(system_reg[HEAT_MIN], txt);Ltrim(txt);
  strncpy(Set_min_heating_HP.Caption, txt, 2);
 IntToStr(system_reg[HEAT_MAX], txt);Ltrim(txt);
  strncpy(Set_max_heating_HP.Caption, txt, 2);
 IntToStr(system_reg[EXAUST_MAX], txt);Ltrim(txt);
  strncpy(Set_max_exhaust.Caption, txt, 3);
 IntToStr(system_reg[SOURS_MIN], txt);Ltrim(txt);
  strncpy(Set_min_source_temp.Caption, txt, 3);
 IntToStr(system_reg[SOURS_MAX], txt);Ltrim(txt);
  strncpy(Set_max_source_temp.Caption, txt, 2);
 IntToStr(system_reg[DEL_HEAT_MIN], txt);Ltrim(txt);
  strncpy(Set_min_delta_heat.Caption, txt, 2);
  //limits_2
 IntToStr(system_reg[DEL_HEAT_MAX], txt);Ltrim(txt);
  strncpy(Set_max_delta_heat.Caption, txt, 2);
 IntToStr(system_reg[DEL_DHW_MIN], txt);Ltrim(txt);
  strncpy(Set_min_delta_DHW.Caption, txt, 2);
 IntToStr(system_reg[DEL_DHW_MAX], txt);Ltrim(txt);
  strncpy(Set_max_delta_DHW.Caption, txt, 2);
 IntToStr(system_reg[DEL_SOURS_MIN], txt);Ltrim(txt);
  strncpy(Set_min_delta_source.Caption, txt, 2);
 IntToStr(system_reg[DEL_SOURS_MAX], txt);Ltrim(txt);
  strncpy(Set_max_source_delta.Caption, txt, 2);
 //limits_3
    IntToStr(system_reg[S_HEAT_MIN], txt);Ltrim(txt);
  strncpy(Set_min_superheat.Caption, txt, 2);
 // limits_4
 IntToStr(system_reg[S_HEAT_MAX], txt);Ltrim(txt);
  strncpy(Set_max_superheat.Caption, txt, 2);
 IntToStr(system_reg[S_COOL_MIN], txt);Ltrim(txt);
  strncpy(Set_min_subcooling.Caption, txt, 2);
 IntToStr(system_reg[S_COOL_MAX], txt);Ltrim(txt);
  strncpy(Set_max_subcooling.Caption, txt, 2);
 IntToStr(system_reg[HP_MAX], txt);Ltrim(txt);
  strncpy(Set_max_high_pressure.Caption, txt, 2);
 IntToStr(system_reg[HP_MIN], txt);Ltrim(txt);
  strncpy(Set_min_lhigh_pressure.Caption, txt, 2);
 // limits_5
 IntToStr(system_reg[LP_MAX], txt);Ltrim(txt);
  strncpy(Set_max_low_pressure.Caption, txt, 2);
 IntToStr(system_reg[LP_MIN], txt);Ltrim(txt);
  strncpy(Set_min_low_pressure.Caption, txt, 2);
//settings
 IntToStr(system_reg[DIFF_HEAT], txt);Ltrim(txt);
  strncpy(Hysteresis_heating.Caption, txt, 2);
 IntToStr(system_reg[DIFF_COOL], txt);Ltrim(txt);
  strncpy(Hysteresis_cooling.Caption, txt, 2);
 IntToStr(system_reg[DIFF_DHW], txt);Ltrim(txt);
  strncpy(Hysteresis_DHW.Caption, txt, 2);
  //--------------------------eev
  //  main
   if(system_reg[POWER]==1){
      DrawImage(&Main_ON);
      //DrawRoundBox (&Messages_Box);
   }
   else {
      DrawImage(&Main_OFF);
      //DrawRoundBox (&Messages_Box);
   }
   
  if(system_reg[COOL]==1){
      bar_heating.Caption = "COOLING";
      DrawRoundButton(&bar_heating);
      DrawImage(&cool_icon);
   }
   else if( system_reg[HEAT]==1 ){
      bar_heating.Caption = "HEATING";
      DrawRoundButton(&bar_heating);
      DrawImage(&heat_icon);
   }

    if( system_reg[HEAT]==1 || system_reg[COOL]==1){
      ON_OFF_Heat_Cool.Caption = "ON";
      DrawRoundButton(&ON_OFF_Heat_Cool);
   }
   else if(system_reg[HEAT]==0 && system_reg[COOL]==0){
      ON_OFF_Heat_Cool.Caption = "OFF";
      DrawRoundButton(&ON_OFF_Heat_Cool);
   }

   if(system_reg[HEATWATER]==0){
       ON_OFF_DHW.Caption = "OFF";
       DrawRoundButton(&ON_OFF_DHW);
   }
   else if(system_reg[HEATWATER]==1){
       ON_OFF_DHW.Caption = "ON";
       DrawRoundButton(&ON_OFF_DHW);

                                }
   if(system_reg[NOMB_COMPRESSORS]==1){ Two_Compressors.Visible= 0;One_Compressors.Visible = 1;  }
   else  if(system_reg[NOMB_COMPRESSORS]==2)  { Two_Compressors.Visible= 1;One_Compressors.Visible = 0;  }
 }
 void count_steps(unsigned char num_page){
  char txt[7];
  if(num_page==0)
  {
      IntToStr(system_reg[TRV_STEPS_1], txt);Ltrim(txt);
     if(system_reg[TRV_STEPS_1]<100){
        if(strncmp(txt,EEV1_value.Caption,2)!=0){strncpy(EEV1_value.Caption, txt, 2);
          EEV1_value.Caption[2]=EEV1_value.Caption[1];EEV1_value.Caption[1]=EEV1_value.Caption[0];EEV1_value.Caption[0]='0';
          DrawRoundButton(&EEV1_value);
          strncpy(EEV1_value.Caption, txt, 3);
          }}
      else{if(strncmp(txt,EEV1_value.Caption,3)!=0){strncpy(EEV1_value.Caption, txt, 3);DrawRoundButton(&EEV1_value);} }
       IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
        if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
   }
   else
   {
         IntToStr(system_reg[TRV_STEPS_2], txt);Ltrim(txt);
     if(system_reg[TRV_STEPS_2]<100){
        if(strncmp(txt,EEV1_value.Caption,2)!=0){strncpy(EEV1_value.Caption, txt, 2);
          EEV1_value.Caption[2]=EEV1_value.Caption[1];EEV1_value.Caption[1]=EEV1_value.Caption[0];EEV1_value.Caption[0]='0';
          DrawRoundButton(&EEV1_value);
          strncpy(EEV1_value.Caption, txt, 3);
          }}
      else{if(strncmp(txt,EEV1_value.Caption,3)!=0){strncpy(EEV1_value.Caption, txt, 3);DrawRoundButton(&EEV1_value);} }
       IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
        if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
   }
 }
 //-----------------------------------------------------------------------------
 void working_time(unsigned char num_page){
    char txt[7];
 if(num_page==0)
  {
      IntToStr(system_reg[TIM_COM_1], txt);Ltrim(txt);//
        if(strncmp(txt,Time_compressor1.Caption,7)!=0){strcpy(Time_compressor1.Caption, txt);DrawRoundButton(&Time_compressor1);}
      IntToStr(system_reg[TIM_REV_1], txt);Ltrim(txt);//
        if(strncmp(txt,Time_reversing1.Caption,7)!=0){strcpy(Time_reversing1.Caption, txt);DrawRoundButton(&Time_reversing1);}
      IntToStr(system_reg[TIM_P_SOURS_1], txt);Ltrim(txt);//
        if(strncmp(txt,Time_source1.Caption,7)!=0){strcpy(Time_source1.Caption, txt);DrawRoundButton(&Time_source1);}
      IntToStr(system_reg[TIM_P_HEAT_1], txt);Ltrim(txt);//
        if(strncmp(txt,Time_heat1.Caption,7)!=0){strcpy(Time_heat1.Caption, txt);DrawRoundButton(&Time_heat1);}
   }
   else
   {
       IntToStr(system_reg[TIM_COM_2], txt);Ltrim(txt);//
        if(strncmp(txt,Time_compressor1.Caption,7)!=0){strcpy(Time_compressor1.Caption, txt);DrawRoundButton(&Time_compressor1);}
      IntToStr(system_reg[TIM_REV_2], txt);Ltrim(txt);//
        if(strncmp(txt,Time_reversing1.Caption,7)!=0){strcpy(Time_reversing1.Caption, txt);DrawRoundButton(&Time_reversing1);}
      IntToStr(system_reg[TIM_P_SOURS_2], txt);Ltrim(txt);//
        if(strncmp(txt,Time_source1.Caption,7)!=0){strcpy(Time_source1.Caption, txt);DrawRoundButton(&Time_source1);}
      IntToStr(system_reg[TIM_P_HEAT_2], txt);Ltrim(txt);//
        if(strncmp(txt,Time_heat1.Caption,7)!=0){strcpy(Time_heat1.Caption, txt);DrawRoundButton(&Time_heat1);}
   }
 }
 //-----------------------------------------------------------------------------
 void schema1_page(){
             int convert_temp;
             char txt[7];
  if(system_reg[COM_STATE_1]==1) DrawImage(&Image76);
  else DrawImage(&Image119);
  if(system_reg[PUMP_HEAT_STATE_1]==1) DrawImage(&Image75);
  else DrawImage(&Image124);
  if(system_reg[PUMP_SOURS_STATE_1]==1) DrawImage(&Image74);
  else DrawImage(&Image117);
  if(system_reg[REV_STATE_1]==1) DrawImage(&Image73);
  else DrawImage(&Image118);
   if(system_reg[THREE_STATE]==1) DrawImage(&Image77);
  else DrawImage(&Image120);
    IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_In_1.Caption,2)!=0){strncpy(S_Brine_In_1.Caption, txt, 2);DrawButton(&S_Brine_In_1);}
    IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_Out_1.Caption,2)!=0){strncpy(S_Brine_Out_1.Caption, txt, 2);DrawButton(&S_Brine_Out_1);}
   IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_In_1.Caption,2)!=0){strncpy(S_Heat_In_1.Caption, txt, 2);DrawButton(&S_Heat_In_1);}
   IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_Out_1.Caption,2)!=0){strncpy(S_Heat_Out_1.Caption, txt, 2);DrawButton(&S_Heat_Out_1);}
   IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
  if(system_reg[HEAT_OUT_1]<100){
    if(strncmp(txt,S_ComprEx_1.Caption,2)!=0){strncpy(S_ComprEx_1.Caption, txt, 2);
      S_ComprEx_1.Caption[2]=S_ComprEx_1.Caption[1];S_ComprEx_1.Caption[1]=S_ComprEx_1.Caption[0];S_ComprEx_1.Caption[0]='0';
      DrawRoundButton(&S_ComprEx_1);
      strncpy(S_ComprEx_1.Caption, txt, 3);
      }
      }
    else{if(strncmp(txt,S_ComprEx_1.Caption,3)!=0){strncpy(S_ComprEx_1.Caption, txt, 3);DrawButton(&S_ComprEx_1);} }
    IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_SH_1.Caption,2)!=0){strncpy(S_SH_1.Caption, txt, 2);DrawButton(&S_SH_1);}

  //flow sourse
  //heat flow
   IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,Sens_DHW.Caption,2)!=0){strncpy(Sens_DHW.Caption, txt, 2);DrawButton(&Sens_DHW);}
   IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,S_tank.Caption,2)!=0){strncpy(S_tank.Caption, txt, 2);DrawButton(&S_tank);}
    IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
    IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Low_Press_1.Caption,2)!=0){strncpy(S_Low_Press_1.Caption, txt, 2);DrawButton(&S_Low_Press_1);}
 }
 //-------------------------------------------------------------------------------------------------------------------
 void schema2_page(){
             int convert_temp;
             char txt[7];
   if(system_reg[COM_STATE_1]==1) DrawImage(&Image166);
      else DrawImage(&Image181);
  if(system_reg[COM_STATE_2]==1) DrawImage(&Image276);
      else DrawImage(&Image275);
  if(system_reg[PUMP_HEAT_STATE_1]==1) DrawImage(&Image75);
  else DrawImage(&Image124);
  if(system_reg[PUMP_SOURS_STATE_1]==1) DrawImage(&Image74);
  else DrawImage(&Image117);
  if(system_reg[REV_STATE_1]==1) DrawImage(&Image73);
  else DrawImage(&Image118);
   if(system_reg[THREE_STATE]==1) DrawImage(&Image77);
  else DrawImage(&Image120);
    IntToStr(system_reg[SOURC_IN_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_In_1.Caption,2)!=0){strncpy(S_Brine_In_1.Caption, txt, 2);DrawButton(&S_Brine_In_1);}
    IntToStr(system_reg[SOURC_OUT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_Out_1.Caption,2)!=0){strncpy(S_Brine_Out_1.Caption, txt, 2);DrawButton(&S_Brine_Out_1);}
   IntToStr(system_reg[HEAT_IN_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_In_1.Caption,2)!=0){strncpy(S_Heat_In_1.Caption, txt, 2);DrawButton(&S_Heat_In_1);}
   IntToStr(system_reg[HEAT_OUT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_Out_1.Caption,2)!=0){strncpy(S_Heat_Out_1.Caption, txt, 2);DrawButton(&S_Heat_Out_1);}
   IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
  if(system_reg[HEAT_OUT_1]<100){
    if(strncmp(txt,S_ComprEx_1.Caption,2)!=0){strncpy(S_ComprEx_1.Caption, txt, 2);
      S_ComprEx_1.Caption[2]=S_ComprEx_1.Caption[1];S_ComprEx_1.Caption[1]=S_ComprEx_1.Caption[0];S_ComprEx_1.Caption[0]='0';
      DrawRoundButton(&S_ComprEx_1);
      strncpy(S_ComprEx_1.Caption, txt, 3);
      }
      }
    else{if(strncmp(txt,S_ComprEx_1.Caption,3)!=0){strncpy(S_ComprEx_1.Caption, txt, 3);DrawButton(&S_ComprEx_1);} }
    IntToStr(system_reg[S_HEAT_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_SH_1.Caption,2)!=0){strncpy(S_SH_1.Caption, txt, 2);DrawButton(&S_SH_1);}

  //flow sourse
  //heat flow
   IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,Sens_DHW.Caption,2)!=0){strncpy(Sens_DHW.Caption, txt, 2);DrawButton(&Sens_DHW);}
   IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);//
    if(strncmp(txt,S_tank.Caption,2)!=0){strncpy(S_tank.Caption, txt, 2);DrawButton(&S_tank);}
    IntToStr(system_reg[HIGH_PRESS_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
    IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Low_Press_1.Caption,2)!=0){strncpy(S_Low_Press_1.Caption, txt, 2);DrawButton(&S_Low_Press_1);}
 }