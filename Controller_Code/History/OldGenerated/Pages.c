  #include "Controller_objects.h"
   #include "Controller_resources.h"
  #include <stdbool.h>
  #include "systick.h"
  #include <stdint.h>
  #include "built_in.h"

  extern int system_reg[600];
  extern bool two_compressors_mode;
 // extern float press;
  void main_page(){
       int convert_temp;
       static unsigned char state_mod;
       static unsigned char state_switch;
       char txt[15];

     IntToStr(system_reg[DHW_TEMP], txt);Ltrim(txt);
               if(system_reg[DHW_TEMP]>=10 && system_reg[DHW_TEMP]<100 )
            {

              /*if(system_reg[DHW_TEMP]>0  )
                {*/
                     if(strcmp(dhw_T.Caption[1], txt[0])!=0 || strcmp(dhw_T.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
                     {
                     strncpy(dhw_T.Caption, txt, 1);
                     dhw_T.Caption[1]=dhw_T.Caption[0];
                     dhw_T.Caption[0]='0';
                     DrawRoundButton(&dhw_T);
                     }
                     if(dhw_dec.Caption[0]!=txt[1])
                      {
                      dhw_dec.Caption[0]=txt[1];
                      DrawRoundButton(&dhw_dec);
                      }
/*}*/         }
                 else  if(system_reg[DHW_TEMP]>=0 && system_reg[DHW_TEMP]<10 )
                 {
                  if( strncmp("00",dhw_T.Caption,2)!=0){
                      dhw_T.Caption[1]='0';
                      dhw_T.Caption[0]='0';
                      DrawRoundButton(&dhw_T);}
                      if(strncmp(txt,dhw_dec.Caption,1)!=0)
                      {
                      strncpy(dhw_dec.Caption, txt, 1);
                      DrawRoundButton(&dhw_dec);
                      }
                  }



            else
            {
            if(strncmp(txt,dhw_T.Caption,2)!=0){strncpy(dhw_T.Caption, txt, 2);DrawRoundButton(&dhw_T);}
            if(strncmp(txt+2,dhw_dec.Caption,1)!=0){strncpy(dhw_dec.Caption, txt+2, 1);DrawRoundButton(&dhw_dec);}
              }
     IntToStr(system_reg[BAC_TEMP], txt);Ltrim(txt);
            if(system_reg[BAC_TEMP]>=10 && system_reg[BAC_TEMP]<100 )
            {

                /*if(system_reg[BAC_TEMP]>0  )
                {*/
                     if(strcmp(heat_T.Caption[1], txt[0])!=0 || strcmp(heat_T.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
                     {
                     strncpy(heat_T.Caption, txt, 1);
                     heat_T.Caption[1]=heat_T.Caption[0];
                     heat_T.Caption[0]='0';
                     DrawRoundButton(&heat_T);
                     }
                     if(heat_dec.Caption[0]!=txt[1])
                      {
                      heat_dec.Caption[0]=txt[1];
                      DrawRoundButton(&heat_dec);
                      }
            }
               /*}*/
            else if(system_reg[BAC_TEMP]>=0 && system_reg[BAC_TEMP]<10 )
            {
                  if( strncmp("00",heat_T.Caption,2)!=0){
                      heat_T.Caption[1]='0';
                      heat_T.Caption[0]='0';
                      DrawRoundButton(&heat_T); }
                      if(strncmp(txt,heat_dec.Caption,1)!=0)
                      {
                      strncpy(heat_dec.Caption, txt, 1);
                      DrawRoundButton(&heat_dec);
                      }
            }



              else
              {
            if(strncmp(txt,heat_T.Caption,2)!=0){strncpy(heat_T.Caption, txt, 2);DrawRoundButton(&heat_T);}
            if(strncmp(txt+2,heat_dec.Caption,1)!=0){strncpy(heat_dec.Caption, txt+2, 1);DrawRoundButton(&heat_dec);}
              }
     IntToStr((int)fabs(system_reg[SOURC_OUT_1]), txt);Ltrim(txt);
            if(system_reg[SOURC_OUT_1]<0 && strncmp("-",sign_OUT.Caption,1)!=0){sign_OUT.Caption="-";DrawRoundButton(&sign_OUT);}
             else if(system_reg[SOURC_OUT_1]>0 && strncmp("+",sign_OUT.Caption,1)!=0){sign_OUT.Caption="+";DrawRoundButton(&sign_OUT);}
     if((int)fabs(system_reg[SOURC_OUT_1])>=10 && (int)fabs(system_reg[SOURC_OUT_1])<100)
            {
                /*if(system_reg[SOURC_OUT_1]>0  )
                {*/
                     if(strcmp(sourc_out_TEMP.Caption[1], txt[0])!=0 || strcmp(sourc_out_TEMP.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
                     {
                     strncpy(sourc_out_TEMP.Caption, txt, 1);
                     sourc_out_TEMP.Caption[1]=sourc_out_TEMP.Caption[0];
                     sourc_out_TEMP.Caption[0]='0';
                     DrawRoundButton(&sourc_out_TEMP);
                     }
                     if(source_out_dec.Caption[0]!=txt[1])
                      {
                      source_out_dec.Caption[0]=txt[1];
                      DrawRoundButton(&source_out_dec);
                      }
            }
      else  if((int)fabs(system_reg[SOURC_OUT_1])>=0 && (int)fabs(system_reg[SOURC_OUT_1])<10)
      {
                  if( strncmp("00",sourc_out_TEMP.Caption,2)!=0){
                      sourc_out_TEMP.Caption[1]='0';
                      sourc_out_TEMP.Caption[0]='0';
                      DrawRoundButton(&sourc_out_TEMP);}
                      if(strncmp(txt,source_out_dec.Caption,1)!=0)
                      {
                      strncpy(source_out_dec.Caption, txt, 1);
                      DrawRoundButton(&source_out_dec);
                      }
      }
              
              
              /*if(strncmp(txt,sourc_out_TEMP.Caption,1)!=0){strncpy(sourc_out_TEMP.Caption, txt, 1);
                     if((int)fabs(system_reg[SOURC_OUT_1])/10>0){sourc_out_TEMP.Caption[1]=sourc_out_TEMP.Caption[0];sourc_out_TEMP.Caption[0]='0';}
                     else {sourc_out_TEMP.Caption[1]='0';sourc_out_TEMP.Caption[0]='0';}
                DrawRoundButton(&sourc_out_TEMP);
                //strncpy(sourc_out_TEMP.Caption, txt, 2);
                }
               if(strncmp(txt,source_out_dec.Caption,1)!=0){strncpy(source_out_dec.Caption, txt, 1);DrawRoundButton(&source_out_dec);}}*/

            else{
            if(strncmp(txt,sourc_out_TEMP.Caption,2)!=0){strncpy(sourc_out_TEMP.Caption, txt, 2);DrawRoundButton(&sourc_out_TEMP);}
            if(strncmp(txt+2,source_out_dec.Caption,1)!=0){strncpy(source_out_dec.Caption, txt+2, 1);DrawRoundButton(&source_out_dec);}
            }
            
     IntToStr((int)fabs(system_reg[SOURC_IN_1]), txt);Ltrim(txt);
            if(system_reg[SOURC_IN_1]<0 && strncmp("-",sign_IN.Caption,1)!=0){sign_IN.Caption="-";DrawRoundButton(&sign_IN);}
             else if(system_reg[SOURC_IN_1]>0 && strncmp("+",sign_IN.Caption,1)!=0){sign_IN.Caption="+";DrawRoundButton(&sign_IN);}
          
          if((int)fabs(system_reg[SOURC_IN_1])>=10 && (int)fabs(system_reg[SOURC_IN_1])<100)
            {

                /*if((int)fabs(system_reg[SOURC_OUT_1])>0)
                {*/
                     if(strcmp(sourc_in_T.Caption[1], txt[0])!=0 || strcmp(sourc_in_T.Caption[0], '0')!=0)// sourc_in_T.Caption[1]!=txt[0]//
                     {
                     strncpy(sourc_in_T.Caption, txt, 1);
                     sourc_in_T.Caption[1]=sourc_in_T.Caption[0];
                     sourc_in_T.Caption[0]='0';
                     DrawRoundButton(&sourc_in_T);
                     }
                     if(sourc_in_dec.Caption[0]!=txt[1])
                      {
                      sourc_in_dec.Caption[0]=txt[1];
                      DrawRoundButton(&sourc_in_dec);
                      }
             }
               /*}*/
         else if((int)fabs(system_reg[SOURC_IN_1])>=0 && (int)fabs(system_reg[SOURC_IN_1])<10)
         {
                  if( strncmp("00",sourc_in_T.Caption,2)!=0){
                      sourc_in_T.Caption[1]='0';
                      sourc_in_T.Caption[0]='0';
                      DrawRoundButton(&sourc_in_T); }
                      if(strncmp(txt,source_out_dec.Caption,1)!=0)
                      {
                      strncpy(source_out_dec.Caption, txt, 1);
                      DrawRoundButton(&source_out_dec);
                      }
         }



            else{
            if(strncmp(txt,sourc_in_T.Caption,2)!=0){strncpy(sourc_in_T.Caption, txt, 2);DrawRoundButton(&sourc_in_T);}
            if(strncmp(txt+2,sourc_in_dec.Caption,1)!=0){strncpy(sourc_in_dec.Caption, txt+2, 1);DrawRoundButton(&sourc_in_dec);}
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
            static int convert_temp;
             char txt[15];
  if(num_page==0)
  { 
  IntToStr((int)fabs(system_reg[SOURC_IN_1]), txt); Ltrim(txt);//
     if(strncmp(txt,S_Brine_Inlet_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[SOURC_IN_1])>=0 && (int)fabs(system_reg[SOURC_IN_1])<10)
        {

            S_Brine_Inlet_1.Caption[0]='0';
            S_Brine_Inlet_1.Caption[1]='0';
            S_Brine_Inlet_1.Caption[2]='.';
            S_Brine_Inlet_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Brine_Inlet_1);

        }

        else if((int)fabs(system_reg[SOURC_IN_1])>=10 && (int)fabs(system_reg[SOURC_IN_1])<100)
        {

            S_Brine_Inlet_1.Caption[0]='0';
            S_Brine_Inlet_1.Caption[1]=txt[0];
            S_Brine_Inlet_1.Caption[2]='.';
            S_Brine_Inlet_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Brine_Inlet_1);

        }
        else
          {
            S_Brine_Inlet_1.Caption[0]=txt[0];
            S_Brine_Inlet_1.Caption[1]=txt[1];
            S_Brine_Inlet_1.Caption[2]='.';
            S_Brine_Inlet_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Brine_Inlet_1);
          
          }
      }
     if(system_reg[SOURC_IN_1]<0 && strncmp("-",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="-";DrawRoundButton(&BrineIN_sign);}
     if(system_reg[SOURC_IN_1]>0 && strncmp("+",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="+";DrawRoundButton(&BrineIN_sign);}

  IntToStr((int)fabs(system_reg[SOURC_OUT_1]), txt);Ltrim(txt);//
     //if(strncmp(txt,S_Brine_Outlet_1.Caption,2)!=0 || S_Brine_Outlet_1.Caption[3]!=txt[2]){strncpy(S_Brine_Outlet_1.Caption, txt,2);S_Brine_Outlet_1.Caption[2]='.';S_Brine_Outlet_1.Caption[3]=txt[2];DrawRoundButton(&S_Brine_Outlet_1);}
      if(strncmp(txt,S_Brine_Outlet_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[SOURC_OUT_1])>=0 && (int)fabs(system_reg[SOURC_OUT_1])<10)
        {

            S_Brine_Outlet_1.Caption[0]='0';
            S_Brine_Outlet_1.Caption[1]='0';
            S_Brine_Outlet_1.Caption[2]='.';
            S_Brine_Outlet_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Brine_Outlet_1);

        }

        else if((int)fabs(system_reg[SOURC_OUT_1])>=10 && (int)fabs(system_reg[SOURC_OUT_1])<100)
        {

            S_Brine_Outlet_1.Caption[0]='0';
            S_Brine_Outlet_1.Caption[1]=txt[0];
            S_Brine_Outlet_1.Caption[2]='.';
            S_Brine_Outlet_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Brine_Outlet_1);

        }
        else
          {
            S_Brine_Outlet_1.Caption[0]=txt[0];
            S_Brine_Outlet_1.Caption[1]=txt[1];
            S_Brine_Outlet_1.Caption[2]='.';
            S_Brine_Outlet_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Brine_Outlet_1);

          }
      }
     if(system_reg[SOURC_OUT_1]<0 && strncmp("-",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="-";DrawRoundButton(&BrineOUT_sign);}
     if(system_reg[SOURC_OUT_1]>0 && strncmp("+",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="+";DrawRoundButton(&BrineOUT_sign);}
  FloatToStr(system_reg[HEAT_IN_1]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_Heat_Inlet_1.Caption,4)!=0){strncpy(S_Heat_Inlet_1.Caption, txt,4);DrawRoundButton(&S_Heat_Inlet_1);}
  FloatToStr(system_reg[HEAT_OUT_1]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_Heat_Outlet_1.Caption,4)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 4);DrawRoundButton(&S_Heat_Outlet_1);}
    
     IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
     
  if(system_reg[EXAUST_TEMP_1]<100){
    if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
      S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
      DrawRoundButton(&S_Compressor_1);
      strncpy(S_Compressor_1.Caption, txt, 3);
      }
      }
  else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }
  
  IntToStr((int)fabs(system_reg[S_HEAT_1]), txt);Ltrim(txt);//
      //if(strncmp(txt,S_Superheat_1.Caption,4)!=0){strncpy(S_Superheat_1.Caption, txt, 4);DrawRoundButton(&S_Superheat_1);}
      if(strncmp(txt,S_Superheat_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[S_HEAT_1])>=0 && (int)fabs(system_reg[S_HEAT_1])<10)
        {

            S_Superheat_1.Caption[0]='0';
            S_Superheat_1.Caption[1]='0';
            S_Superheat_1.Caption[2]='.';
            S_Superheat_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Superheat_1);

        }

        else if((int)fabs(system_reg[S_HEAT_1])>=10 && (int)fabs(system_reg[S_HEAT_1])<100)
        {

            S_Superheat_1.Caption[0]='0';
            S_Superheat_1.Caption[1]=txt[0];
            S_Superheat_1.Caption[2]='.';
            S_Superheat_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Superheat_1);

        }
        else
          {
            S_Superheat_1.Caption[0]=txt[0];
            S_Superheat_1.Caption[1]=txt[1];
            S_Superheat_1.Caption[2]='.';
            S_Superheat_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Superheat_1);

          }
      }
      if(system_reg[S_HEAT_1]<0 && strncmp("-",Super_sign.Caption,1)!=0){Super_sign.Caption="-";DrawRoundButton(&Super_sign);}
      if(system_reg[S_HEAT_1]>0 && strncmp("+",Super_sign.Caption,1)!=0){Super_sign.Caption="+";DrawRoundButton(&Super_sign);}

  IntToStr(fabs(system_reg[S_COOL_1]), txt);Ltrim(txt);//
     //if(strncmp(txt,S_Subcool_1.Caption,4)!=0){strncpy(S_Subcool_1.Caption, txt, 4);DrawRoundButton(&S_Subcool_1);}
      if(strncmp(txt,S_Subcool_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[S_COOL_1])>=0 && (int)fabs(system_reg[S_COOL_1])<10)
        {

            S_Subcool_1.Caption[0]='0';
            S_Subcool_1.Caption[1]='0';
            S_Subcool_1.Caption[2]='.';
            S_Subcool_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Subcool_1);

        }

        else if((int)fabs(system_reg[S_COOL_1])>=10 && (int)fabs(system_reg[S_COOL_1])<100)
        {

            S_Subcool_1.Caption[0]='0';
            S_Subcool_1.Caption[1]=txt[0];
            S_Subcool_1.Caption[2]='.';
            S_Subcool_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Subcool_1);

        }
        else
          {
            S_Subcool_1.Caption[0]=txt[0];
            S_Subcool_1.Caption[1]=txt[1];
            S_Subcool_1.Caption[2]='.';
            S_Subcool_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Subcool_1);

          }
      }
     if(system_reg[S_COOL_1]<0 && strncmp("-",Cool_sign.Caption,1)!=0){Cool_sign.Caption="-";DrawRoundButton(&Cool_sign);}
     if(system_reg[S_COOL_1]>0 && strncmp("+",Cool_sign.Caption,1)!=0){Cool_sign.Caption="+";DrawRoundButton(&Cool_sign);}

  
  FloatToStr(system_reg[DHW_TEMP]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_DHW.Caption,4)!=0){strncpy(S_DHW.Caption, txt, 4);DrawRoundButton(&S_DHW);}
  FloatToStr(system_reg[BAC_TEMP]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,SS_tank.Caption,4)!=0){strncpy(SS_tank.Caption, txt, 4);DrawRoundButton(&SS_tank);}
     
  IntToStr(fabs(system_reg[CONDENS_TEMP_1]), txt);Ltrim(txt);//
     //if(strncmp(txt,S_condenser_1.Caption,4)!=0){strncpy(S_condenser_1.Caption, txt, 4);DrawRoundButton(&S_condenser_1);}
      if(strncmp(txt,S_condenser_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[CONDENS_TEMP_1])>=0 && (int)fabs(system_reg[CONDENS_TEMP_1])<10)
        {

            S_condenser_1.Caption[0]='0';
            S_condenser_1.Caption[1]='0';
            S_condenser_1.Caption[2]='.';
            S_condenser_1.Caption[3]=txt[0];
            DrawRoundButton(&S_condenser_1);

        }

        else if((int)fabs(system_reg[CONDENS_TEMP_1])>=10 && (int)fabs(system_reg[CONDENS_TEMP_1])<100)
        {

            S_condenser_1.Caption[0]='0';
            S_condenser_1.Caption[1]=txt[0];
            S_condenser_1.Caption[2]='.';
            S_condenser_1.Caption[3]=txt[1];
            DrawRoundButton(&S_condenser_1);

        }
        else
          {
            S_condenser_1.Caption[0]=txt[0];
            S_condenser_1.Caption[1]=txt[1];
            S_condenser_1.Caption[2]='.';
            S_condenser_1.Caption[3]=txt[2];
            DrawRoundButton(&S_condenser_1);

          }
      }
     if(system_reg[CONDENS_TEMP_1]<0 && strncmp("-",Cond_sign.Caption,1)!=0){Cond_sign.Caption="-";DrawRoundButton(&Cond_sign);}
     if(system_reg[CONDENS_TEMP_1]>0 && strncmp("+",Cond_sign.Caption,1)!=0){Cond_sign.Caption="+";DrawRoundButton(&Cond_sign);}

  FloatToStr(system_reg[SUCT_TEMP_1]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_suction_1.Caption,4)!=0){strncpy(S_suction_1.Caption, txt, 4);DrawRoundButton(&S_suction_1);}
  FloatToStr(system_reg[HIGH_PRESS_1]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_High_Pressure_1.Caption,4)!=0){strncpy(S_High_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_High_Pressure_1);}
  FloatToStr(system_reg[LOW_PRESS_1]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_Low_Pressure_1.Caption,4)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_Low_Pressure_1);}
  }
  else if(num_page==1)
      {
 IntToStr((int)fabs(system_reg[SOURC_IN_2]), txt); Ltrim(txt);//
     if(strncmp(txt,S_Brine_Inlet_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[SOURC_IN_2])>=0 && (int)fabs(system_reg[SOURC_IN_2])<10)
        {

            S_Brine_Inlet_1.Caption[0]='0';
            S_Brine_Inlet_1.Caption[1]='0';
            S_Brine_Inlet_1.Caption[2]='.';
            S_Brine_Inlet_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Brine_Inlet_1);

        }

        else if((int)fabs(system_reg[SOURC_IN_2])>=10 && (int)fabs(system_reg[SOURC_IN_2])<100)
        {

            S_Brine_Inlet_1.Caption[0]='0';
            S_Brine_Inlet_1.Caption[1]=txt[0];
            S_Brine_Inlet_1.Caption[2]='.';
            S_Brine_Inlet_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Brine_Inlet_1);

        }
        else
          {
            S_Brine_Inlet_1.Caption[0]=txt[0];
            S_Brine_Inlet_1.Caption[1]=txt[1];
            S_Brine_Inlet_1.Caption[2]='.';
            S_Brine_Inlet_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Brine_Inlet_1);

          }
      }
     if(system_reg[SOURC_IN_2]<0 && strncmp("-",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="-";DrawRoundButton(&BrineIN_sign);}
     if(system_reg[SOURC_IN_2]>0 && strncmp("+",BrineIN_sign.Caption,1)!=0){BrineIN_sign.Caption="+";DrawRoundButton(&BrineIN_sign);}

  IntToStr((int)fabs(system_reg[SOURC_OUT_2]), txt);Ltrim(txt);//
     //if(strncmp(txt,S_Brine_Outlet_1.Caption,2)!=0 || S_Brine_Outlet_1.Caption[3]!=txt[2]){strncpy(S_Brine_Outlet_1.Caption, txt,2);S_Brine_Outlet_1.Caption[2]='.';S_Brine_Outlet_1.Caption[3]=txt[2];DrawRoundButton(&S_Brine_Outlet_1);}
      if(strncmp(txt,S_Brine_Outlet_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[SOURC_OUT_2])>=0 && (int)fabs(system_reg[SOURC_OUT_2])<10)
        {

            S_Brine_Outlet_1.Caption[0]='0';
            S_Brine_Outlet_1.Caption[1]='0';
            S_Brine_Outlet_1.Caption[2]='.';
            S_Brine_Outlet_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Brine_Outlet_1);

        }

        else if((int)fabs(system_reg[SOURC_OUT_2])>=10 && (int)fabs(system_reg[SOURC_OUT_2])<100)
        {

            S_Brine_Outlet_1.Caption[0]='0';
            S_Brine_Outlet_1.Caption[1]=txt[0];
            S_Brine_Outlet_1.Caption[2]='.';
            S_Brine_Outlet_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Brine_Outlet_1);

        }
        else
          {
            S_Brine_Outlet_1.Caption[0]=txt[0];
            S_Brine_Outlet_1.Caption[1]=txt[1];
            S_Brine_Outlet_1.Caption[2]='.';
            S_Brine_Outlet_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Brine_Outlet_1);

          }
      }
     if(system_reg[SOURC_OUT_2]<0 && strncmp("-",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="-";DrawRoundButton(&BrineOUT_sign);}
     if(system_reg[SOURC_OUT_2]>0 && strncmp("+",BrineOUT_sign.Caption,1)!=0){BrineOUT_sign.Caption="+";DrawRoundButton(&BrineOUT_sign);}
  FloatToStr(system_reg[HEAT_IN_2]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_Heat_Inlet_1.Caption,4)!=0){strncpy(S_Heat_Inlet_1.Caption, txt,4);DrawRoundButton(&S_Heat_Inlet_1);}
  FloatToStr(system_reg[HEAT_OUT_2]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_Heat_Outlet_1.Caption,4)!=0){strncpy(S_Heat_Outlet_1.Caption, txt, 4);DrawRoundButton(&S_Heat_Outlet_1);}
     
     IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
  if(system_reg[EXAUST_TEMP_2]/10<10){
    if(strncmp(txt,S_Compressor_1.Caption,2)!=0){strncpy(S_Compressor_1.Caption, txt, 2);
      S_Compressor_1.Caption[2]=S_Compressor_1.Caption[1];S_Compressor_1.Caption[1]=S_Compressor_1.Caption[0];S_Compressor_1.Caption[0]='0';
      DrawRoundButton(&S_Compressor_1);
      strncpy(S_Compressor_1.Caption, txt, 3);
      }
      }
  else{if(strncmp(txt,S_Compressor_1.Caption,3)!=0){strncpy(S_Compressor_1.Caption, txt, 3);DrawRoundButton(&S_Compressor_1);} }

  IntToStr((int)fabs(system_reg[S_HEAT_2]), txt);Ltrim(txt);//
      //if(strncmp(txt,S_Superheat_1.Caption,4)!=0){strncpy(S_Superheat_1.Caption, txt, 4);DrawRoundButton(&S_Superheat_1);}
      if(strncmp(txt,S_Superheat_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[S_HEAT_2])>=0 && (int)fabs(system_reg[S_HEAT_2])<10)
        {

            S_Superheat_1.Caption[0]='0';
            S_Superheat_1.Caption[1]='0';
            S_Superheat_1.Caption[2]='.';
            S_Superheat_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Superheat_1);

        }

        else if((int)fabs(system_reg[S_HEAT_2])>=10 && (int)fabs(system_reg[S_HEAT_2])<100)
        {

            S_Superheat_1.Caption[0]='0';
            S_Superheat_1.Caption[1]=txt[0];
            S_Superheat_1.Caption[2]='.';
            S_Superheat_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Superheat_1);

        }
        else
          {
            S_Superheat_1.Caption[0]=txt[0];
            S_Superheat_1.Caption[1]=txt[1];
            S_Superheat_1.Caption[2]='.';
            S_Superheat_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Superheat_1);

          }
      }
      if(system_reg[S_HEAT_2]<0 && strncmp("-",Super_sign.Caption,1)!=0){Super_sign.Caption="-";DrawRoundButton(&Super_sign);}
      if(system_reg[S_HEAT_2]>0 && strncmp("+",Super_sign.Caption,1)!=0){Super_sign.Caption="+";DrawRoundButton(&Super_sign);}

  IntToStr(fabs(system_reg[S_COOL_2]), txt);Ltrim(txt);//
     //if(strncmp(txt,S_Subcool_1.Caption,4)!=0){strncpy(S_Subcool_1.Caption, txt, 4);DrawRoundButton(&S_Subcool_1);}
      if(strncmp(txt,S_Subcool_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[S_COOL_2])>=0 && (int)fabs(system_reg[S_COOL_1])<10)
        {

            S_Subcool_1.Caption[0]='0';
            S_Subcool_1.Caption[1]='0';
            S_Subcool_1.Caption[2]='.';
            S_Subcool_1.Caption[3]=txt[0];
            DrawRoundButton(&S_Subcool_1);

        }

        else if((int)fabs(system_reg[S_COOL_2])>=10 && (int)fabs(system_reg[S_COOL_1])<100)
        {

            S_Subcool_1.Caption[0]='0';
            S_Subcool_1.Caption[1]=txt[0];
            S_Subcool_1.Caption[2]='.';
            S_Subcool_1.Caption[3]=txt[1];
            DrawRoundButton(&S_Subcool_1);

        }
        else
          {
            S_Subcool_1.Caption[0]=txt[0];
            S_Subcool_1.Caption[1]=txt[1];
            S_Subcool_1.Caption[2]='.';
            S_Subcool_1.Caption[3]=txt[2];
            DrawRoundButton(&S_Subcool_1);

          }
      }
     if(system_reg[S_COOL_2]<0 && strncmp("-",Cool_sign.Caption,1)!=0){Cool_sign.Caption="-";DrawRoundButton(&Cool_sign);}
     if(system_reg[S_COOL_2]>0 && strncmp("+",Cool_sign.Caption,1)!=0){Cool_sign.Caption="+";DrawRoundButton(&Cool_sign);}


  FloatToStr(system_reg[DHW_TEMP]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_DHW.Caption,4)!=0){strncpy(S_DHW.Caption, txt, 4);DrawRoundButton(&S_DHW);}
  FloatToStr(system_reg[BAC_TEMP]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,SS_tank.Caption,4)!=0){strncpy(SS_tank.Caption, txt, 4);DrawRoundButton(&SS_tank);}

  IntToStr(fabs(system_reg[CONDENS_TEMP_2]), txt);Ltrim(txt);//
     //if(strncmp(txt,S_condenser_1.Caption,4)!=0){strncpy(S_condenser_1.Caption, txt, 4);DrawRoundButton(&S_condenser_1);}
      if(strncmp(txt,S_condenser_1.Caption,3)!=0)
      {
        if((int)fabs(system_reg[CONDENS_TEMP_2])>=0 && (int)fabs(system_reg[CONDENS_TEMP_2])<10)
        {

            S_condenser_1.Caption[0]='0';
            S_condenser_1.Caption[1]='0';
            S_condenser_1.Caption[2]='.';
            S_condenser_1.Caption[3]=txt[0];
            DrawRoundButton(&S_condenser_1);

        }

        else if((int)fabs(system_reg[CONDENS_TEMP_2])>=10 && (int)fabs(system_reg[CONDENS_TEMP_2])<100)
        {

            S_condenser_1.Caption[0]='0';
            S_condenser_1.Caption[1]=txt[0];
            S_condenser_1.Caption[2]='.';
            S_condenser_1.Caption[3]=txt[1];
            DrawRoundButton(&S_condenser_1);

        }
        else
          {
            S_condenser_1.Caption[0]=txt[0];
            S_condenser_1.Caption[1]=txt[1];
            S_condenser_1.Caption[2]='.';
            S_condenser_1.Caption[3]=txt[2];
            DrawRoundButton(&S_condenser_1);

          }
      }
     if(system_reg[CONDENS_TEMP_2]<0 && strncmp("-",Cond_sign.Caption,1)!=0){Cond_sign.Caption="-";DrawRoundButton(&Cond_sign);}
     if(system_reg[CONDENS_TEMP_2]>0 && strncmp("+",Cond_sign.Caption,1)!=0){Cond_sign.Caption="+";DrawRoundButton(&Cond_sign);}

  FloatToStr(system_reg[SUCT_TEMP_2]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_suction_1.Caption,4)!=0){strncpy(S_suction_1.Caption, txt, 4);DrawRoundButton(&S_suction_1);}
  FloatToStr(system_reg[HIGH_PRESS_2]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_High_Pressure_1.Caption,4)!=0){strncpy(S_High_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_High_Pressure_1);}
  FloatToStr(system_reg[LOW_PRESS_2]/10.0, txt);Ltrim(txt);//
     if(strncmp(txt,S_Low_Pressure_1.Caption,4)!=0){strncpy(S_Low_Pressure_1.Caption, txt, 4);DrawRoundButton(&S_Low_Pressure_1);}

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
 //------------------------
   IntToStr(system_reg[AIRE_TO_WATER], txt);Ltrim(txt);
   
  IntToStr(system_reg[TIME_BETWEEN_DEF], txt);Ltrim(txt);
  strncpy(Defrost_on_time.Caption, txt, 2);
  IntToStr(system_reg[TIME_DEFROST], txt);Ltrim(txt);
  strncpy(Defrost_off_time.Caption, txt, 2);
  IntToStr(system_reg[TEMP_DEFROST], txt);Ltrim(txt);
  strncpy(Defrost_on_temperature.Caption, txt, 2);
  IntToStr(system_reg[TEMP_STOP_DEFROST], txt);Ltrim(txt);
  strncpy(Defrost_off_temperature.Caption, txt, 2);
  
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
   if(system_reg[NOMB_COMPRESSORS]==1){two_compressors_mode=false; Two_Compressors.Visible= 0;One_Compressors.Visible = 1;  }
   else  if(system_reg[NOMB_COMPRESSORS]==2)  {two_compressors_mode=true; Two_Compressors.Visible= 1;One_Compressors.Visible = 0;  }
   
  if(system_reg[REVERS_MOD]==0){Reversing_Heat_OFF.Visible= 1;Reversing_ON_HEAT.Visible = 0;  }
   else  if(system_reg[REVERS_MOD]==1)  {Reversing_ON_HEAT.Visible= 1;Reversing_Heat_OFF.Visible = 0;  }
   
  if(system_reg[POWER_380]==0){Power_220V.Visible= 1;Power_380V.Visible = 0;  }
   else  if(system_reg[POWER_380]==1)  {Power_380V.Visible= 1;Power_220V.Visible = 0;  }
   
  if(system_reg[AIRE_TO_WATER]==0){ Mode_ground_on.Visible= 1;Mode_air_on.Visible = 0; }//
  else  if(system_reg[AIRE_TO_WATER]==1)  {Mode_air_on.Visible= 1;Mode_ground_on.Visible = 0; }//
 }
  //----------------------------------------------------------------------------
 void count_steps(unsigned char num_page){
  char txt[7];
  static int old_steps_1 =0;
  static int old_steps_2 =0;
  static int old_corect_1 =0;
  static int old_corect_2 =0;
  static unsigned char _page=0;
  if(num_page==0)
  {
    IntToStr(system_reg[S_HEAT_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
   
     //IntToStr(system_reg[TRV_CORRECT_1], txt);Ltrim(txt);
     //if(strcmp(txt,EEV1_value.Caption)!=0){strcpy(EEV1_value.Caption, txt);DrawRoundButton(&EEV1_value);}
   

   
    Red_bar.Position = system_reg[TRV_STEPS_1]; UpdatePBPosition(&Red_bar);
   /*if(old_steps_1!=system_reg[TRV_STEPS_1]){
      old_steps_1=system_reg[TRV_STEPS_1];
      Red_bar.Position = system_reg[TRV_STEPS_1]; UpdatePBPosition(&Red_bar);
          }*/

   if(old_corect_1!=system_reg[TRV_CORRECT_1]){
      old_corect_1=system_reg[TRV_CORRECT_1];
       IntToStr(system_reg[TRV_CORRECT_1], txt);Ltrim(txt);
       strcpy(EEV1_value.Caption, txt);
       DrawRoundButton(&EEV1_value);
          }
        /*if(_page!=num_page)
                             {
                              _page=num_page;
                              //Red_bar.Position = system_reg[TRV_STEPS_1]; UpdatePBPosition(&Red_bar);
                               IntToStr(system_reg[TRV_CORRECT_1], txt);Ltrim(txt);
                               strcpy(EEV1_value.Caption, txt);
                               DrawRoundButton(&EEV1_value);
                              }*/
   }
   else
   {
          IntToStr(system_reg[S_HEAT_2]/10, txt);Ltrim(txt);//
        if(strncmp(txt,EEV1_superheat.Caption,2)!=0){strncpy(EEV1_superheat.Caption, txt, 2);DrawRoundButton(&EEV1_superheat);}
    /*  IntToStr(system_reg[TRV_CORRECT_2], txt);Ltrim(txt);
     if(strcmp(txt,EEV1_value.Caption)!=0){strcpy(EEV1_value.Caption, txt);DrawRoundButton(&EEV1_value);}
   if(old_steps_2!=system_reg[TRV_STEPS_2]){
      old_steps_2=system_reg[TRV_STEPS_2];
      Red_bar.Position = system_reg[TRV_STEPS_2]; UpdatePBPosition(&Red_bar);
      }*/
     Red_bar.Position = system_reg[TRV_STEPS_2]; UpdatePBPosition(&Red_bar);

     if(old_corect_2!=system_reg[TRV_CORRECT_2]){
      old_corect_2=system_reg[TRV_CORRECT_2];
       IntToStr(system_reg[TRV_CORRECT_2], txt);Ltrim(txt);
       strcpy(EEV1_value.Caption, txt);
       DrawRoundButton(&EEV1_value);
          }
     /*if(_page!=num_page)
                             {
                              _page=num_page;

                               IntToStr(system_reg[TRV_CORRECT_2], txt);Ltrim(txt);
                               strcpy(EEV1_value.Caption, txt);
                               DrawRoundButton(&EEV1_value);
                              }*/
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
    IntToStr(system_reg[SOURC_IN_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_In_1.Caption,2)!=0){strncpy(S_Brine_In_1.Caption, txt, 2);DrawButton(&S_Brine_In_1);}
    IntToStr(system_reg[SOURC_OUT_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,S_Brine_Out_1.Caption,2)!=0){strncpy(S_Brine_Out_1.Caption, txt, 2);DrawButton(&S_Brine_Out_1);}
   IntToStr(system_reg[HEAT_IN_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_In_1.Caption,2)!=0){strncpy(S_Heat_In_1.Caption, txt, 2);DrawButton(&S_Heat_In_1);}
   IntToStr(system_reg[HEAT_OUT_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,S_Heat_Out_1.Caption,2)!=0){strncpy(S_Heat_Out_1.Caption, txt, 2);DrawButton(&S_Heat_Out_1);}
   IntToStr(system_reg[EXAUST_TEMP_1], txt);Ltrim(txt);//
  if(system_reg[EXAUST_TEMP_1]/10<10){
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
   IntToStr(system_reg[DHW_TEMP]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Sens_DHW.Caption,2)!=0){strncpy(Sens_DHW.Caption, txt, 2);DrawButton(&Sens_DHW);}
   IntToStr(system_reg[BAC_TEMP]/10, txt);Ltrim(txt);//
    if(strncmp(txt,S_tank.Caption,2)!=0){strncpy(S_tank.Caption, txt, 2);DrawButton(&S_tank);}
    IntToStr(system_reg[HIGH_PRESS_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
    IntToStr(system_reg[LOW_PRESS_1]/10, txt);Ltrim(txt);//
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
    IntToStr(system_reg[SOURC_IN_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Module1_br_inlet.Caption,2)!=0){strncpy(Module1_br_inlet.Caption, txt, 2);DrawButton(&Module1_br_inlet);}
    IntToStr(system_reg[SOURC_OUT_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Module1_br_outlet.Caption,2)!=0){strncpy(Module1_br_outlet.Caption, txt, 2);DrawButton(&Module1_br_outlet);}
   IntToStr(system_reg[HEAT_IN_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Module1_heat_inlet.Caption,2)!=0){strncpy(Module1_heat_inlet.Caption, txt, 2);DrawButton(&Module1_heat_inlet);}
   IntToStr(system_reg[HEAT_OUT_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Module1_heat_outlet.Caption,2)!=0){strncpy(Module1_heat_outlet.Caption, txt, 2);DrawButton(&Module1_heat_outlet);}
   IntToStr(system_reg[EXAUST_TEMP_1]/10, txt);Ltrim(txt);//
  if(system_reg[EXAUST_TEMP_1]/10<100){
    if(strncmp(txt,Module1_exhaust.Caption,2)!=0){strncpy(Module1_exhaust.Caption, txt, 2);
      Module1_exhaust.Caption[2]=Module1_exhaust.Caption[1];Module1_exhaust.Caption[1]=Module1_exhaust.Caption[0];Module1_exhaust.Caption[0]='0';
      DrawRoundButton(&Module1_exhaust);
      strncpy(Module1_exhaust.Caption, txt, 3);
      }
      }
    else{if(strncmp(txt,Module1_exhaust.Caption,3)!=0){strncpy(Module1_exhaust.Caption, txt, 3);DrawButton(&Module1_exhaust);} }
    IntToStr(system_reg[S_HEAT_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Module1_superheat.Caption,2)!=0){strncpy(Module1_superheat.Caption, txt, 2);DrawButton(&Module1_superheat);}

  //flow sourse
  //heat flow
  //-----------------------------------------------------------------------------------------
    IntToStr(system_reg[SOURC_IN_2]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Button7.Caption,2)!=0){strncpy(Button7.Caption, txt, 2);DrawButton(&Button7);}
    IntToStr(system_reg[SOURC_OUT_2]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Button9.Caption,2)!=0){strncpy(Button9.Caption, txt, 2);DrawButton(&Button9);}
   IntToStr(system_reg[HEAT_IN_2]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Button11.Caption,2)!=0){strncpy(Button11.Caption, txt, 2);DrawButton(&Button11);}
   IntToStr(system_reg[HEAT_OUT_2]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Button10.Caption,2)!=0){strncpy(Button10.Caption, txt, 2);DrawButton(&Button10);}
   IntToStr(system_reg[EXAUST_TEMP_2]/10, txt);Ltrim(txt);//
  if(system_reg[EXAUST_TEMP_2]/10<100){
    if(strncmp(txt,Module2_exhaust.Caption,2)!=0){strncpy(Module2_exhaust.Caption, txt, 2);
      Module2_exhaust.Caption[2]=Module2_exhaust.Caption[1];Module2_exhaust.Caption[1]=Module2_exhaust.Caption[0];Module2_exhaust.Caption[0]='0';
      DrawRoundButton(&Module2_exhaust);
      strncpy(Module2_exhaust.Caption, txt, 3);
      }
      }
    else{if(strncmp(txt,Module2_exhaust.Caption,3)!=0){strncpy(Module2_exhaust.Caption, txt, 3);DrawButton(&Module2_exhaust);} }
    IntToStr(system_reg[S_HEAT_2]/10, txt);Ltrim(txt);//
    if(strncmp(txt,Module2_superheat.Caption,2)!=0){strncpy(Module2_superheat.Caption, txt, 2);DrawButton(&Module2_superheat);}

  
  
  //----------------------------------------------------------------------------------------
   IntToStr(system_reg[DHW_TEMP]/10, txt);Ltrim(txt);//
    if(strncmp(txt,DHW.Caption,2)!=0){strncpy(DHW.Caption, txt, 2);DrawButton(&DHW);}
   IntToStr(system_reg[BAC_TEMP]/10, txt);Ltrim(txt);//
    if(strncmp(txt,TANK.Caption,2)!=0){strncpy(TANK.Caption, txt, 2);DrawButton(&TANK);}
   /*IntToStr(system_reg[HIGH_PRESS_1]/10, txt);Ltrim(txt);//
    if(strncmp(txt,S_High_Press_1.Caption,2)!=0){strncpy(S_High_Press_1.Caption, txt, 2);DrawButton(&S_High_Press_1);}
    IntToStr(system_reg[LOW_PRESS_1], txt);Ltrim(txt);//
    if(strncmp(txt,S_Low_Press_1.Caption,2)!=0){strncpy(S_Low_Press_1.Caption, txt, 2);DrawButton(&S_Low_Press_1);}*/
 }