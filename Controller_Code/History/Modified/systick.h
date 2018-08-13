#ifndef __systick_h
#define __systick_h

#include <stdint.h>

#define F_CPU                 150000000UL
#define TimerTick          F_CPU/1000-1
 /* SysTick Control / Status Register Definitions */
#define SysTick_CTRL_COUNTFLAG_Msk         (1ul << COUNTFLAG)
#define SysTick_CTRL_CLKSOURCE_Msk         (1ul << CLKSOURCE)
#define SysTick_CTRL_TICKINT_Msk           (1ul << TICKINT)
#define SysTick_CTRL_ENABLE_Pos             0
#define SysTick_CTRL_ENABLE_Msk            (1ul << SysTick_CTRL_ENABLE_Pos)
/* SysTick Reload Register Definitions */
#define SysTick_LOAD_RELOAD_Msk            (0xFFFFFFul << RELOAD0)
/* SysTick Current Register Definitions */
#define SysTick_VAL_CURRENT_Msk            (0xFFFFFFul << CURRENT0)
/* SysTick Calibration Register Definitions */
#define SysTick_CALIB_NOREF_Msk            (1ul << NOREF)
#define SysTick_CALIB_SKEW_Msk             (1ul << SKEW)
#define SysTick_CALIB_TENMS_Msk            (0xFFFFFFul << TENMS0)



 void InitSysTick();
 uint32_t millis();

 #endif