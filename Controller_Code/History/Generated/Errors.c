 #include "Controller_objects.h"
#include "Controller_resources.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
  extern  int system_reg[NOMBER_OF_REG];
void find_errors(){
  if(system_reg[ERRORS_1]==0){
    //Messages_Label.Font_Color= 0x07E0;
  }
  if(system_reg[ERRORS_1]==10){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Heating_Outlet_sens !");

  }
  else if(system_reg[ERRORS_1]==20){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Heating_Inlet_sens !");

  }
  else if(system_reg[ERRORS_1]==30){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Source_Inlet_sens !");

  }
  else if(system_reg[ERRORS_1]==40){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Source_Outlet_sens !");
  }
  else if(system_reg[ERRORS_1]==50){
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Exchaust_Comp_sens !");
  }
  else if(system_reg[ERRORS_1]==60){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Suction_Comp_sens !");
  }
  else if(system_reg[ERRORS_1]==70){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Condenser_T_sens !");
  }
  else if(system_reg[ERRORS_1]==80){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Bac_T_sens !");
  }
  else if(system_reg[ERRORS_1]==90){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Dhw_T_sens !");
  }
  else if(system_reg[ERRORS_1]==110){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Chek_Flow_sourse !");
  }
  else if(system_reg[ERRORS_1]==120){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Chek_Flow_heat !");
  }
 else if(system_reg[ERRORS_1]==130){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Low_LowPressure !");
  }
 else if(system_reg[ERRORS_1]==140){
 Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"High_LowPressure !");
  }
  else if(system_reg[ERRORS_1]==150){
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Chek_Comp_Temp!");
  }
  else if(system_reg[ERRORS_1]==160){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Source_Inlet_is_hight!");
  }
  else if(system_reg[ERRORS_1]==170){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Source_Inlet_is_low!");
  }
  else if(system_reg[ERRORS_1]==180){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Bac_Heat_is_hight!");
  }
  else if(system_reg[ERRORS_1]==190){
  Label2.Font_Color=0xF800;
  memset(Label2.Caption, 0, sizeof(Label2.Caption));
  strcpy( Label2.Caption,"Bac_Heat_is_low!");
  }
  else if(system_reg[ERRORS_1]==200){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"SuperHeat_is_hight!");
   }
  else if(system_reg[ERRORS_1]==210){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"SuperHeat_is_low!");
   }
  else if(system_reg[ERRORS_1]==220){
  Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"SuperCool_is_low!");
   }
   else if(system_reg[ERRORS_1]==230){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"SuperCool_is_hight!");
   }
   else if(system_reg[ERRORS_1]==240){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Bac_Cool_Hight!");
   }
   else if(system_reg[ERRORS_1]==250){
   Label2.Font_Color=0xF800;
   memset(Label2.Caption, 0, sizeof(Label2.Caption));
   strcpy( Label2.Caption,"Bac_Cool_Low!");
   }
   else if(system_reg[ERRORS_1]==260){
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
   }

}