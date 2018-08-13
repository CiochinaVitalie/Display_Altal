
#include "Controller_objects.h"
#include <stdint.h>


    
    
    
    const uint16_t termo_table[]  = {
    1001, 999, 996, 992, 988, 983, 977, 971,
    963, 954, 944, 932, 917, 901, 881, 859,
    832, 802, 767, 727, 683, 633, 579, 522,
    463, 402, 343, 286, 234, 187

};

float  ReadHighPressure (int high_press){
   return ((high_press - Low_Limit_HP) * HP_max/ (Hi_Limit_HP - Low_Limit_HP));
}


float  ReadLowPressure (int low_press){
   return ((low_press - Low_Limit_LP) * LP_max/ (Hi_Limit_LP - Low_Limit_LP) );
}

int calc_temperature(unsigned int adcsum) {
  uint16_t tlow,vl,vr,vd,r,thigh;
  int16_t  res;
  uint8_t l = 0;
  //
           r = (sizeof(termo_table) / sizeof(termo_table[0])) - 1;
           thigh = termo_table[r];

          //
          if (adcsum <= thigh) {
            #ifdef TEMPERATURE_UNDER
              if (adcsum < thigh)
                return TEMPERATURE_UNDER;
            #endif
            return TEMPERATURE_TABLE_STEP * r + TEMPERATURE_TABLE_START;
          }
           tlow = termo_table[0];
          if (adcsum >= tlow) {
            #ifdef TEMPERATURE_OVER
              if (adcsum > tlow)
                return TEMPERATURE_OVER;
            #endif
            return TEMPERATURE_TABLE_START;
          }

          //
          while ((r - l) > 1) {
            uint8_t m = (l + r) >> 1;
            uint16_t mid = termo_table[m];
            if (adcsum > mid) {
              r = m;
            } else {
              l = m;
            }
          }
           vl = termo_table[l];
          if (adcsum >= vl) {
            return l * TEMPERATURE_TABLE_STEP + TEMPERATURE_TABLE_START;
          }
          vr = termo_table[r];
          vd = vl - vr;
          res = TEMPERATURE_TABLE_START + r * TEMPERATURE_TABLE_STEP;
          if (vd) {
            // ???????¤ ????????¤??¤
            res -= ((TEMPERATURE_TABLE_STEP * (int32_t)(adcsum - vr) + (vd >> 1)) / vd);
          }
  return res;
}