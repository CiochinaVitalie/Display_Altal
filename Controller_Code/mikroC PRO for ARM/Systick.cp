#line 1 "C:/Users/Dumitru/Desktop/dima/alta_2_compressor_display/Controller_Code/mikroC PRO for ARM/Systick.c"
#line 1 "c:/users/dumitru/desktop/dima/alta_2_compressor_display/controller_code/mikroc pro for arm/systick.h"
#line 1 "c:/mikroc/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 25 "c:/users/dumitru/desktop/dima/alta_2_compressor_display/controller_code/mikroc pro for arm/systick.h"
 void InitSysTick();
 uint32_t millis();
#line 1 "c:/mikroc/mikroc pro for arm/include/stdint.h"
#line 4 "C:/Users/Dumitru/Desktop/dima/alta_2_compressor_display/Controller_Code/mikroC PRO for ARM/Systick.c"
 volatile uint32_t time_count = 0;


 void InitSysTick(){
 STK_LOAD= 150000000UL /1000-1 ;
 STK_VAL= 150000000UL /1000-1 ;
 STK_CTRL =  (1ul << CLKSOURCE)  |
  (1ul << TICKINT)  |
  (1ul << 0 ) ;

}

 uint32_t millis(){
 return time_count;
}

 void SysTick_interrupt() iv IVT_INT_SysTick{
 time_count++;
}
