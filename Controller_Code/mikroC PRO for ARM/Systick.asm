_InitSysTick:
;Systick.c,7 :: 		void InitSysTick(){
;Systick.c,8 :: 		STK_LOAD=TimerTick;                //
MOVW	R1, #18927
MOVT	R1, #2
MOVW	R0, #lo_addr(STK_LOAD+0)
MOVT	R0, #hi_addr(STK_LOAD+0)
STR	R1, [R0, #0]
;Systick.c,9 :: 		STK_VAL=TimerTick;                //
MOVW	R1, #18927
MOVT	R1, #2
MOVW	R0, #lo_addr(STK_VAL+0)
MOVT	R0, #hi_addr(STK_VAL+0)
STR	R1, [R0, #0]
;Systick.c,12 :: 		SysTick_CTRL_ENABLE_Msk;
MOVS	R1, #7
MOVW	R0, #lo_addr(STK_CTRL+0)
MOVT	R0, #hi_addr(STK_CTRL+0)
STR	R1, [R0, #0]
;Systick.c,14 :: 		}
L_end_InitSysTick:
BX	LR
; end of _InitSysTick
_millis:
;Systick.c,16 :: 		uint32_t millis(){
;Systick.c,17 :: 		return time_count;
MOVW	R0, #lo_addr(_time_count+0)
MOVT	R0, #hi_addr(_time_count+0)
LDR	R0, [R0, #0]
;Systick.c,18 :: 		}
L_end_millis:
BX	LR
; end of _millis
_SysTick_interrupt:
;Systick.c,20 :: 		void SysTick_interrupt() iv IVT_INT_SysTick{
;Systick.c,21 :: 		time_count++;
MOVW	R0, #lo_addr(_time_count+0)
MOVT	R0, #hi_addr(_time_count+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_time_count+0)
MOVT	R0, #hi_addr(_time_count+0)
STR	R1, [R0, #0]
;Systick.c,22 :: 		}
L_end_SysTick_interrupt:
BX	LR
; end of _SysTick_interrupt
