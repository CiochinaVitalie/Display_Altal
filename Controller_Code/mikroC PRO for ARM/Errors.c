 #include "Controller_objects.h"
#include "Controller_resources.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
  extern  int system_reg[600];
void find_errors(){
  if(system_reg[ERRORS_1]==0){
    //Messages_Label.Font_Color= 0x07E0;
  }
  if(system_reg[ERRORS_1]==11 || system_reg[ERRORS_2]==12){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==11)strcpy( Label2.Caption,"No_Dhw_Sens_1 !");
  else   strcpy( Label2.Caption,"No_Dhw_Sens_2 !");

  }
  else if(system_reg[ERRORS_1]==21  || system_reg[ERRORS_2]==22){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
   if(system_reg[ERRORS_1]==21)strcpy( Label2.Caption,"No_Bac_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Bac_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==31 || system_reg[ERRORS_2]==32){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==31)strcpy( Label2.Caption,"No_Heat_Out_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Heat_Out_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==41 || system_reg[ERRORS_2]==42){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==41)strcpy( Label2.Caption,"No_Heat_In_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Heat_In_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==51 || system_reg[ERRORS_2]==52){
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==51)strcpy( Label2.Caption,"No_Src_In_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Src_In_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==61 || system_reg[ERRORS_2]==62){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==61)strcpy( Label2.Caption,"No_Src_Out_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Src_Out_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==71 || system_reg[ERRORS_2]==72){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==71)strcpy( Label2.Caption,"No_Ex_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Ex_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==81 || system_reg[ERRORS_2]==82){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  //strcpy( Label2.Caption,"No_Suc_Sens !");
  if(system_reg[ERRORS_1]==81)strcpy( Label2.Caption,"No_Suc_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Suc_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==91 || system_reg[ERRORS_2]==92){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==91)strcpy( Label2.Caption,"No_Cond_Sens_1 !");
   else   strcpy( Label2.Caption,"No_Cond_Sens_2 !");
  }
  else if(system_reg[ERRORS_1]==101 || system_reg[ERRORS_2]==102){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==101)strcpy( Label2.Caption,"Check_Heat_Flow_1 !");
   else   strcpy( Label2.Caption,"Check_Heat_Flow_2 !");
  }
  else if(system_reg[ERRORS_1]==111 || system_reg[ERRORS_2]==112){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==81)strcpy( Label2.Caption,"Check_Src_Flow_1 !");
   else   strcpy( Label2.Caption,"Check_Src_Flow_2 !");
  }
 else if(system_reg[ERRORS_1]==121 || system_reg[ERRORS_2]==122){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==121)strcpy( Label2.Caption,"Low_LowPressure_1 !");
   else   strcpy( Label2.Caption,"Low_LowPressure_2 !");
  
  }
  else if(system_reg[ERRORS_1]==131 || system_reg[ERRORS_2]==132){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==131)strcpy( Label2.Caption,"High_LowPressure_1 !");
   else   strcpy( Label2.Caption,"High_LowPressure_2 !");
  }
 else if(system_reg[ERRORS_1]==141 || system_reg[ERRORS_2]==142){
 Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption) );
  if(system_reg[ERRORS_1]==141)strcpy( Label2.Caption,"High_HighPressure_1 !");
   else   strcpy( Label2.Caption,"High_HighPressure_2 !");
  }
  else if(system_reg[ERRORS_1]==151 || system_reg[ERRORS_2]==152){
 Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==151)strcpy( Label2.Caption,"Low_HighPressure_1 !");
   else   strcpy( Label2.Caption,"Low_HighPressure_2 !");
  }
  else if(system_reg[ERRORS_1]==161 || system_reg[ERRORS_2]==162){
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"High_Bac_Temp!");
  }
  else if(system_reg[ERRORS_1]==171 || system_reg[ERRORS_2]==172){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Low_Bac_Temp!");
  }
  else if(system_reg[ERRORS_1]==181 || system_reg[ERRORS_2]== 182){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==181)strcpy( Label2.Caption,"SuperHeat_Low_1 !");
   else   strcpy( Label2.Caption,"SuperHeat_Low_2 !");
  }
  else if(system_reg[ERRORS_1]==191 || system_reg[ERRORS_2]==192){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==191)strcpy( Label2.Caption,"SuperHeat_High_1 !");
   else   strcpy( Label2.Caption,"SuperHeat_High_2 !");
  }
  else if(system_reg[ERRORS_1]==201 || system_reg[ERRORS_2]==202){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==201)strcpy( Label2.Caption,"SuperCool_Low_1 !");
   else   strcpy( Label2.Caption,"SuperCool_Low_2 !");
  }
  else if(system_reg[ERRORS_1]==211 || system_reg[ERRORS_2]==212){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
  if(system_reg[ERRORS_1]==211)strcpy( Label2.Caption,"SuperCool_High_1 !");
   else   strcpy( Label2.Caption,"SuperCool_High_2 !");
   }
  else if(system_reg[ERRORS_1]==221 || system_reg[ERRORS_2]==222){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   if(system_reg[ERRORS_1]==221)strcpy( Label2.Caption,"Compressor_Is_Hot_1 !");
   else   strcpy( Label2.Caption,"Compressor_Is_Hot_2 !");
   }
  else if(system_reg[ERRORS_1]==231 || system_reg[ERRORS_2]==232){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   if(system_reg[ERRORS_1]==231)strcpy( Label2.Caption,"Delta_Source_High_1 !");
   else   strcpy( Label2.Caption,"Delta_Source_High_2 !");
   }
   else if(system_reg[ERRORS_1]==241 || system_reg[ERRORS_2]==242){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
    if(system_reg[ERRORS_1]==241)strcpy( Label2.Caption,"Delta_Source_Low_1 !");
   else   strcpy( Label2.Caption,"Delta_Source_Low_2 !");
   }
   else if(system_reg[ERRORS_1]==251 || system_reg[ERRORS_2]==252){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   if(system_reg[ERRORS_1]==251)strcpy( Label2.Caption,"Delta_Heat_High_1 !");
   else   strcpy( Label2.Caption,"Delta_Heat_High_2 !");
   
   }
   else if(system_reg[ERRORS_1]==261 || system_reg[ERRORS_2]==262){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   if(system_reg[ERRORS_1]==261)strcpy( Label2.Caption,"Delta_Heat_Low_1 !");
   else   strcpy( Label2.Caption,"Delta_Heat_Low_2 !");
   }
   else if(system_reg[ERRORS_1]==271){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"No_Faza_A!");
   }
   else if(system_reg[ERRORS_1]==281){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"No_Faza_B!");
   } 
   else if(system_reg[ERRORS_1]==291){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"No_Faza_C!");
   }
   else if(system_reg[ERRORS_1]==301){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Cross_Faza!");
   }
   else if(system_reg[ERRORS_1]==401){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Source_Max!");
   
   }
   else if(system_reg[ERRORS_1]==411){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Source_Min!");
   }
   /*else if(system_reg[ERRORS_1]==260){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Hight_HightPress!");
   }
   else if(system_reg[ERRORS_1]==270){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Low_HightPressure!");
   }
   else if(system_reg[ERRORS_1]==280){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Delta_source_max!");
   }
   else if(system_reg[ERRORS_1]==290){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Delta_source_min!");
   }
   else if(system_reg[ERRORS_1]==300){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Delta_heating_max!");
   }
   else if(system_reg[ERRORS_1]==310){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Delta_heating_min!");
   }*/

}