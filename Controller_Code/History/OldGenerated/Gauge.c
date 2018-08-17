   /******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
//#include "manometer_hw.h"


#include "Controller_objects.h"
#include "Controller_resources.h"

#define INNER_RADIUS 5.0f
#define OUTER_RADIUS 80.0f
#define X_CENTER_HP     126.0f
#define X_CENTER_LP     344.0f
#define Y_CENTER     128.0f
#define PI           3.14159265f
 extern  int system_reg[600];
 
typedef struct
{
    int x1;
    int y1;
    int x2;
    int y2;
} line_t;

line_t current_line;

float old_HP_pressure;
float old_LP_pressure;

void HP_display(int pressure)
{
  float HP_pressure;
  float convert_press;
  
  //convert_press = ReadHighPressure(system_reg[HIGH_PRESS_1]);
  HP_pressure = pressure*10.0 + 5;
 if(old_HP_pressure !=HP_pressure){ old_HP_pressure= HP_pressure;}
 else return;

     DrawImage(&HP1_gauge);

    TFT_Set_Pen(CL_BLUE, 2);

    if( HP_pressure <= 0.0f )
    {
        current_line.x1 = ( int )( X_CENTER_HP + ( INNER_RADIUS * sin( 185.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( 185.0f *
                                                ( PI  / 180.0f ) ) ) );
        current_line.x2 = ( int )( X_CENTER_HP + ( OUTER_RADIUS * sin( 185.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( 185.0f *
                                                ( PI  / 180.0f ) ) ) );
    }
    else if( HP_pressure >= 360.0f )
    {
        current_line.x1 = ( int )( X_CENTER_HP + ( INNER_RADIUS * sin( 176.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( 176.0f *
                                                ( PI  / 180.0f ) ) ) );
        current_line.x2 = ( int )( X_CENTER_HP + ( OUTER_RADIUS * sin( 176.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( 176.0f *
                                                ( PI  / 180.0f ) ) ) );
    }
    else
    {
        current_line.x1 = ( int )( X_CENTER_HP + ( INNER_RADIUS * sin( (HP_pressure +180)*
                                                ( PI / 180.0f ) ) ) );
        current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( (HP_pressure +180) *
                                                ( PI  / 180.0f ) ) ) );
        current_line.x2 = ( int )( X_CENTER_HP + ( OUTER_RADIUS * sin( (HP_pressure +180) *
                                                ( PI / 180.0f ) ) ) );
        current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( (HP_pressure +180) *
                                                ( PI  / 180.0f ) ) ) );
    }


    TFT_Line( current_line.x1, current_line.y1, current_line.x2, current_line.y2 );
}

void LP_display(int pressure)
{

    //line_t current_line;
   float  LP_pressure;
   float convert_press;
   //convert_press = ReadLowPressure(system_reg[LOW_PRESS_1]);
   LP_pressure = pressure * 33.3 + 42;
   if( old_LP_pressure != LP_pressure){ old_LP_pressure= LP_pressure;}
     else return;

    DrawImage(&LP1_gauge);

    TFT_Set_Pen(CL_BLUE, 2);

    if(  LP_pressure <= 0.0f )
    {
        current_line.x1 = ( int )( X_CENTER_LP + ( INNER_RADIUS * sin( 185.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( 185.0f *
                                                ( PI  / 180.0f ) ) ) );
        current_line.x2 = ( int )( X_CENTER_LP + ( OUTER_RADIUS * sin( 185.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( 185.0f *
                                                ( PI  / 180.0f ) ) ) );
    }
    else if( LP_pressure >= 360.0f )
    {
        current_line.x1 = ( int )( X_CENTER_LP + ( INNER_RADIUS * sin( 176.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( 176.0f *
                                                ( PI  / 180.0f ) ) ) );
        current_line.x2 = ( int )( X_CENTER_LP + ( OUTER_RADIUS * sin( 176.0f *
                                                ( PI / 180.0f ) ) ) );
        current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( 176.0f *
                                                ( PI  / 180.0f ) ) ) );
    }
    else
    {
        current_line.x1 = ( int )( X_CENTER_LP + ( INNER_RADIUS * sin( ( LP_pressure + 180)*
                                                ( PI / 180.0f ) ) ) );
        current_line.y1 = ( int )( Y_CENTER + ( INNER_RADIUS * -cos( ( LP_pressure + 180) *
                                                ( PI  / 180.0f ) ) ) );
        current_line.x2 = ( int )( X_CENTER_LP + ( OUTER_RADIUS * sin( ( LP_pressure + 180) *
                                                ( PI / 180.0f ) ) ) );
        current_line.y2 = ( int )( Y_CENTER + ( OUTER_RADIUS * -cos( ( LP_pressure + 180) *
                                                ( PI  / 180.0f ) ) ) );
    }


    TFT_Line( current_line.x1, current_line.y1, current_line.x2, current_line.y2 );


}