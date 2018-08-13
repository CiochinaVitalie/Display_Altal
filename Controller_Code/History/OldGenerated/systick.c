#include "systick.h"
#include <stdint.h>

 volatile uint32_t time_count = 0;
 
 
 void InitSysTick(){
 STK_LOAD=TimerTick;                //
 STK_VAL=TimerTick;                //
 STK_CTRL =     SysTick_CTRL_CLKSOURCE_Msk |
                SysTick_CTRL_TICKINT_Msk   |
                SysTick_CTRL_ENABLE_Msk;

}
//------------------------------------------------------------------------------
 uint32_t millis(){
   return time_count;
}
//------------------------------------------------------------------------------
 void SysTick_interrupt() iv IVT_INT_SysTick{
  time_count++;
}