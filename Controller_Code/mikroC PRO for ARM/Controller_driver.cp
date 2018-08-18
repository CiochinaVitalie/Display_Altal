#line 1 "C:/Users/User/Desktop/alta_2_compressor_display/Controller_Code/mikroC PRO for ARM/Controller_driver.c"
#line 1 "c:/users/user/desktop/alta_2_compressor_display/controller_code/mikroc pro for arm/controller_objects.h"
#line 27 "c:/users/user/desktop/alta_2_compressor_display/controller_code/mikroc pro for arm/controller_objects.h"
typedef enum {_pbsClearSector, _pbsFillSector} TProgressBarSector;

typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;


extern void selectPage();
extern void checkResponse();
extern unsigned long check_packet_status();
extern void constructPacket();

extern void modbus_configure(unsigned int _time_out, unsigned int _polling,unsigned char _retry_count);
extern int calc_temperature(unsigned int adcsum);
extern float ReadHighPressure (int high_press);
extern float ReadLowPressure (int low_press);
extern void main_page();
extern void sensor_1(unsigned char num_page);
extern void data_eeprom();
extern void HP_display(int pressure);
extern void LP_display(int pressure);
extern void find_errors();
extern void count_steps(unsigned char num_page);
extern void working_time(unsigned char num_page);
extern void void startPage();
extern void schema1_page();



 typedef struct
{

 unsigned char id;
 unsigned char function;
 unsigned int address;
 unsigned int no_of_registers;
 unsigned int* register_array;


 unsigned int requests;
 unsigned int successful_requests;
 unsigned long total_errors;
 unsigned int retries;
 unsigned int _timeout;
 unsigned int incorrect_id_returned;
 unsigned int incorrect_function_returned;
 unsigned int incorrect_bytes_returned;
 unsigned int checksum_failed;
 unsigned int buffer_errors;


 unsigned int illegal_function;
 unsigned int illegal_data_address;
 unsigned int illegal_data_value;
 unsigned char misc_exceptions;


 unsigned char connection;

}Packet;

enum _system {

ELECT_HEAT,
PROG_REL,
TIME_REL,
TRV_CORRECT_1,
TRV_CORRECT_2,
NUM_P_HEAT_1,
NUM_P_SOURS_1,
NUM_REV_1,
NUM_COM_1,
NUM_P_HEAT_2,
NUM_P_SOURS_2,
NUM_REV_2,
NUM_COM_2,

K_FLOW_HEAT,
K_FLOW_SOURS,
TOTAL_ERRORS,


VOLT_A=470,
VOLT_B=480,
VOLT_C=490,
CURR_A=500,
CURR_B=510,
CURR_C=520,

TRV_STEPS_1=61, TRV_STEPS_2=62,
BAC_TEMP=71,
DHW_TEMP=81,
CONDENS_TEMP_1=91,CONDENS_TEMP_2=92,
SUCT_TEMP_1=101, SUCT_TEMP_2=102,
S_COOL_1=111,S_COOL_2=112,
S_HEAT_1=121,S_HEAT_2=122,
HEAT_IN_1=131,HEAT_IN_2=132,
HEAT_OUT_1=141,HEAT_OUT_2=142,
SOURC_IN_1=151, SOURC_IN_2=152,
SOURC_OUT_1=161,SOURC_OUT_2=162,
HIGH_PRESS_1=171, HIGH_PRESS_2 =172,
LOW_PRESS_1=181,LOW_PRESS_2=182,
ERRORS_1=191,ERRORS_2=192,
EXAUST_TEMP_1=201,EXAUST_TEMP_2=202,






TIM_COM_1=341,TIM_COM_2=342,
TIM_P_HEAT_1=351, TIM_P_HEAT_2=352,
TIM_P_SOURS_1=371,TIM_P_SOURS_2=372,
TIM_REV_1=381, TIM_REV_2=382,



COM_STATE_1=11, COM_STATE_2=12,
PUMP_SOURS_STATE_1=21, PUMP_SOURS_STATE_2=22,
PUMP_HEAT_STATE_1=31, PUMP_HEAT_STATE_2=32,
REV_STATE_1=41,REV_STATE_2=42,
THREE_STATE=51,

COMP_DEL=10,
HEAT_DEL=20,
SOURS_DEL=30,
REVERS_DEL=40,
THREE_WAY_DEL=50,
COOL_MAX=60,
COOL_MIN=70,
HEAT_MAX=80,
HEAT_MIN=90,
DEL_HEAT_MAX=100,
DEL_HEAT_MIN=110,
DEL_SOURS_MAX=120,
DEL_SOURS_MIN=130,
DIFF_COOL=140,
DIFF_DHW=150,
DIFF_HEAT=160,
AIRE_TO_WATER=170,
EXAUST_MAX=180,
COOL=190,
HEAT=200,
HEATWATER=210,
HP_MAX=220,
LP_MAX=230,
HP_MIN=240,
LP_MIN=250,
S_COOL_MAX=260,
S_COOL_MIN=270,
S_HEAT_MAX=280,
S_HEAT_MIN=290,
NUM_THREE =300,
POWER=310,
SET_COOL=320,
SET_DHW=330,
SET_HEAT=340,
TEMP_DEFROST=350,
TIME_DEFROST=360,
TEMP_OUT=370,
TEMP_STOP_DEFROST=380,
TIM_THREE=390,
NOMB_COMPRESSORS=400,
REVERS_MOD=410,
TRV_DEL=420,
SOURS_MAX=430,
SOURS_MIN=440,
DEL_DHW_MAX=450,
DEL_DHW_MIN=460
};


 typedef enum _system regAdress;
 extern regAdress adressRegSend,adressRegReciev;
 extern unsigned char nomRegSend,nomRegReciev;
 extern unsigned char countPacket;

extern void send_data_packet(enum _system adress,unsigned char no_reg);
extern void reciev_data_packet(enum _system adress,unsigned char no_reg);



typedef struct
{
 unsigned short RTC_Hour_Tens;
 unsigned short RTC_Hour_Units;
 unsigned short RTC_Min_Tens;
 unsigned short RTC_Min_Units;
 unsigned short RTC_Sec_Tens;
 unsigned short RTC_Sec_Units;
 unsigned short RTC_H12;
}RTC_TimeTypeDef;


typedef struct
{
 unsigned short RTC_DayofWeek;
 unsigned short RTC_Date_Tens;
 unsigned short RTC_Date_Units;
 unsigned short RTC_Month_Tens;
 unsigned short RTC_Month_Units;
 unsigned short RTC_Year_Tens;
 unsigned short RTC_Year_Units;
}RTC_DateTypeDef;

extern short RTC_Init (unsigned PREDIV_Sync, unsigned short PREDIV_Async, int HR_Format);
extern short RTC_SetTime (RTC_TimeTypeDef *RTC_TimeStruct, int Calibration_Value);
extern short RTC_SetDate(RTC_DateTypeDef *RTC_DateStruct);
extern void Message (char arg[]);
extern void RTC_GetTime(RTC_TimeTypeDef *RTC_TimeStruct);
extern void RTC_GetDate(RTC_DateTypeDef *RTC_DateStruct);
extern void RTC_PrintTime(RTC_TimeTypeDef *RTC_TimeStruct);
extern void RTC_PrintDate(RTC_DateTypeDef *RTC_DateStruct);


typedef struct {
 unsigned int X_Min;
 unsigned int X_Max;
 unsigned int Y_Min;
 unsigned int Y_Max;
 char Rotate;
} TTPConstants;

typedef struct Button {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef const struct CImage {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCImage;

typedef struct Circle {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircle;

typedef struct CircleButton {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircleButton;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef struct Box_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox_Round;

typedef struct Line {
 TScreen* OwnerScreen;
 char Order;
 unsigned int First_Point_X;
 unsigned int First_Point_Y;
 unsigned int Second_Point_X;
 unsigned int Second_Point_Y;
 char Pen_Width;
 char Visible;
 unsigned int Color;
} TLine;

typedef struct ProgressBar {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Transparent;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 unsigned int Min;
 unsigned int Max;
 unsigned int Position;
 unsigned int Prev_Position;
 char Show_Position;
 char Show_Percentage;
 char Smooth;
 char Rounded;
 char Corner_Radius;
} TProgressBar;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int ButtonsCount;
 TButton * const code *Buttons;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CImagesCount;
 TCImage * const code *CImages;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int CircleButtonsCount;
 TCircleButton * const code *CircleButtons;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int Boxes_RoundCount;
 TBox_Round * const code *Boxes_Round;
 unsigned int LinesCount;
 TLine * const code *Lines;
 unsigned int ProgressBarsCount;
 TProgressBar * const code *ProgressBars;
};

extern TScreen HOME;
extern TBox Set_Heat_Box;
extern TBox Set_Dhw_Box;
extern TImage background;
extern TBox_Round Heat_Windows;
extern TBox HEAT_button_redraw;
extern TBox DHW_button_redraw;
extern TBox_Round DWN_Windows;
extern TBox_Round Brine_Windows;
extern TImage Image20;
extern TBox_Round Wheater_Windows;
extern TImage Image44;
extern TImage Image61;
extern TImage Main_ON;
extern TImage Main_OFF;
extern TButton_Round DHW_Seting;
extern TLabel Label53;
extern TLabel Label38;
extern TLabel Label39;
extern TLabel Label4;
extern TLabel Label20;
extern TLine Brine_Line;
extern TButton_Round Heat_Setting;
extern TCircle alarm_led;
extern TCircle radio_led;
extern TButton_Round bar_heating;
extern TButton_Round bar_DHW;
extern TCircle dhw_led;
extern TCircle heat_led;
extern TLine Line16;
extern TLabel Label140;
extern TLabel Label141;
extern TButton_Round bar_weather;
extern TImage Weather_Icon;
extern TButton_Round bar_brine;
extern TImage Brine_Icon;
extern TImage MainBut3;
extern TImage MainBut4;
extern TImage clock_icon;
extern TImage microSD_icon;
extern TImage radio_icon;
extern TImage dhw_icon;
extern TLabel Label25;
extern TImage cool_icon;
extern TImage Image28;
extern TLabel DateTime;
extern TLabel dhw_celc;
extern TLabel dhw_point;
extern TLabel heat_point;
extern TLabel heat_celc;
extern TLabel TEMP_Setting_value;
extern TLabel DHW_Setting_value;
extern TImage WiFi_on_icon;
extern TImage Image163;
extern TImage Image167;
extern TImage Image168;
extern TImage Image169;
extern TImage Image26;
extern TImage Image170;
extern TButton_Round DHW_UP;
extern TButton_Round DHW_DOWN;
extern TButton_Round HEAT_Down;
extern TButton_Round HEAT_UP;
extern TButton_Round ON_OFF_Heat_Cool;
extern TButton_Round ON_OFF_DHW;
extern TImage Image25;
extern TImage Image40;
extern TImage Image87;
extern TImage heat_icon;
extern TImage MainBut1;
extern TImage MainBut2;
extern TImage MainBut5;
extern TBox_Round heatBox;
extern TLabel heat_temp_main;
extern TBox_Round BoxRound2;
extern TLabel dhw_temp_main;
extern TBox_Round BoxRound3;
extern TLabel sourse_temp_input_main;
extern TBox_Round BoxRound4;
extern TLabel sourse_temp_output_main;
extern TBox_Round BoxRound5;
extern TLabel weather_temp_main;
extern TBox_Round BoxRound6;
extern TLabel humedity_main;
extern TBox_Round BoxRound7;
extern TLabel prassure_main;
extern TBox_Round Messages_Box;
extern TLabel Messages_Label;
extern TButton_Round * const code Screen1_Buttons_Round[12];
extern TLabel * const code Screen1_Labels[23];
extern TImage * const code Screen1_Images[30];
extern TCircle * const code Screen1_Circles[4];
extern TBox * const code Screen1_Boxes[4];
extern TBox_Round * const code Screen1_Boxes_Round[12];
extern TLine * const code Screen1_Lines[2];

extern TScreen USER_MENU;
extern TImage Image30;
extern TImage Image105;
extern TImage Image60;
extern TImage Image51;
extern TImage Image50;
extern TImage Image49;
extern TImage Image48;
extern TImage Image39;
extern TImage Image52;
extern TImage Image56;
extern TImage Image54;
extern TImage Image55;
extern TLabel User_menu_label;
extern TLabel User_time_label;
extern TLabel User_c_label;
extern TLabel User_lan_label;
extern TLabel User_errors_label;
extern TLabel User_timers_label;
extern TLabel User_events_label;
extern TLabel User_energy_label;
extern TLabel User_furnance_label;
extern TLabel User_defrost_label;
extern TLabel Label77;
extern TImage user_set_time;
extern TImage user_check_temperature;
extern TImage user_set_LAN;
extern TImage user_check_errors;
extern TImage user_set_timers;
extern TImage User_history_check;
extern TImage user_check_energy;
extern TImage admin_set_system;
extern TImage user_check_graph;
extern TImage Image57;
extern TImage user_defrost;
extern TButton_Round Home_b1;
extern TImage user_hysterezis;
extern TImage user_setting;
extern TLabel User_operational_label;
extern TLabel User_hysterezis_label;
extern TLabel User_system_label;
extern TButton_Round * const code Screen2_Buttons_Round[1];
extern TLabel * const code Screen2_Labels[14];
extern TImage * const code Screen2_Images[25];

extern TScreen EEV;
extern TImage Image27;
extern TImage Image173;
extern TButton_Round DEC_EEV1;
extern TButton_Round INC_EEV1;
extern TProgressBar Red_bar;
extern TLabel EEV1_set_step_label;
extern TLabel EEV1_label;
extern TButton_Round Home_b2;
extern TButton_Round Back_b2;
extern TButton_Round Next_b1;
extern TButton_Round EEV1_superheat;
extern TButton_Round EEV1_value;
extern TCircleButton CircleButton9;
extern TButton_Round ButtonRound1;
extern TButton_Round * const code Screen3_Buttons_Round[8];
extern TLabel * const code Screen3_Labels[2];
extern TImage * const code Screen3_Images[2];
extern TCircleButton * const code Screen3_CircleButtons[1];
extern TProgressBar * const code Screen3_ProgressBars[1];

extern TScreen Keyboard;
extern TImage Image31;
extern TButton_Round _1;
extern TButton_Round _2;
extern TButton_Round _3;
extern TButton_Round _4;
extern TButton_Round _5;
extern TButton_Round _6;
extern TButton_Round _7;
extern TButton_Round _8;
extern TButton_Round _9;
extern TButton_Round _0;
extern TButton_Round _Q;
extern TButton_Round _W;
extern TButton_Round _E;
extern TButton_Round _R;
extern TButton_Round _T;
extern TButton_Round _Y;
extern TButton_Round _U;
extern TButton_Round _I;
extern TButton_Round _O;
extern TButton_Round _P;
extern TButton_Round _A;
extern TButton_Round _S;
extern TButton_Round _D;
extern TButton_Round _F;
extern TButton_Round _G;
extern TButton_Round _H;
extern TButton_Round _J;
extern TButton_Round _K;
extern TButton_Round _L;
extern TButton_Round _Z;
extern TButton_Round _X;
extern TButton_Round _C;
extern TButton_Round _V;
extern TButton_Round _B;
extern TButton_Round _N;
extern TButton_Round _M;
extern TButton_Round Clear;
extern TButton_Round CAPS_Switch;
extern TButton_Round SPACE;
extern TBox Password_box;
extern TLabel Label23;
extern TBox Admin_box;
extern TLabel Label24;
extern TLabel Keyboard_label;
extern TButton_Round _DEL;
extern TButton_Round _Colon;
extern TButton_Round _Comma;
extern TButton_Round _Slash;
extern TButton_Round ENTER;
extern TButton_Round Home_b3;
extern TButton_Round * const code Screen4_Buttons_Round[45];
extern TLabel * const code Screen4_Labels[3];
extern TImage * const code Screen4_Images[1];
extern TBox * const code Screen4_Boxes[2];

extern TScreen SetRTC;
extern TImage Image32;
extern TButton Ten_minutesUp;
extern TButton Ten_minutesDwn;
extern TLabel Ten_minutes;
extern TButton Unit_minutesUp;
extern TButton Unit_minutesDwn;
extern TLabel Unit_minutes;
extern TButton SetDateAndTime;
extern TLabel Year_word;
extern TLabel Month_Word;
extern TLabel Day_word;
extern TLabel Hour_word;
extern TLabel Min_word;
extern TButton Day_unitUp;
extern TButton Day_unitDwn;
extern TButton Unit_hoursUp;
extern TButton Unit_hoursDwn;
extern TLabel Unit_hours;
extern TLabel Day_unit;
extern TButton OneDayUp;
extern TButton OneDayDwn;
extern TLine LineSlash;
extern TButton TenDayUp;
extern TButton TenDayDwn;
extern TLabel TenDay;
extern TLabel OneDay;
extern TButton MonthDateUp;
extern TButton MonthDateDwn;
extern TLabel MonthDate;
extern TButton TenYearUp;
extern TButton TenYearDwn;
extern TButton OneYearUp;
extern TButton OneYearDwn;
extern TLabel OneYear;
extern TLabel TenYear;
extern TButton DayOfWeek;
extern TLabel Time_setting_label;
extern TButton_Round home_b4;
extern TButton_Round Back_b3;
extern TButton * const code Screen5_Buttons[20];
extern TButton_Round * const code Screen5_Buttons_Round[2];
extern TLabel * const code Screen5_Labels[15];
extern TImage * const code Screen5_Images[1];
extern TLine * const code Screen5_Lines[1];

extern TScreen ERRORS;
extern TImage Image45;
extern TLabel Error_label;
extern TLabel Error_message;
extern TLabel Text_error;
extern TLabel Label2;
extern TButton_Round Home_b5;
extern TButton_Round Back_b4;
extern TButton_Round * const code Screen6_Buttons_Round[2];
extern TLabel * const code Screen6_Labels[4];
extern TImage * const code Screen6_Images[1];

extern TScreen PASSWORD;
extern TImage Image23;
extern TLabel Password_label;
extern TButton_Round Admin_Set;
extern TLabel Admin_text;
extern TButton_Round Home_b6;
extern TButton_Round Back_b5;
extern TButton_Round * const code Screen7_Buttons_Round[3];
extern TLabel * const code Screen7_Labels[2];
extern TImage * const code Screen7_Images[1];

extern TScreen GAUGE1;
extern TImage Image38;
extern TImage LP1_gauge;
extern TImage HP1_gauge;
extern TLine HP_arrow;
extern TLabel Gauge_label;
extern TLine LP_arrow;
extern TImage Image104;
extern TButton_Round Home_b7;
extern TButton_Round Next_b2;
extern TCircleButton CircleButton8;
extern TButton_Round * const code Screen8_Buttons_Round[2];
extern TLabel * const code Screen8_Labels[1];
extern TImage * const code Screen8_Images[4];
extern TCircleButton * const code Screen8_CircleButtons[1];
extern TLine * const code Screen8_Lines[2];

extern TScreen SYSTEM_SET;
extern TImage Image81;
extern TImage Image300;
extern TLabel System_setting_label;
extern TLabel sys_access;
extern TLabel Label138;
extern TLabel Label139;
extern TLabel Label142;
extern TLabel Label143;
extern TLabel Label144;
extern TLabel Label145;
extern TImage Image90;
extern TImage Image91;
extern TImage system_delay;
extern TImage system_limits;
extern TLabel Label238;
extern TButton System_Set_Message;
extern TImage Image85;
extern TImage Image92;
extern TImage Image88;
extern TImage Image93;
extern TImage system_history;
extern TImage Image89;
extern TImage Image83;
extern TImage system_EEV;
extern TImage system_pass;
extern TImage system_mode;
extern TImage system_graph;
extern TImage system_microSD;
extern TButton_Round Home_b8;
extern TButton_Round Back_b30;
extern TButton * const code Screen9_Buttons[1];
extern TButton_Round * const code Screen9_Buttons_Round[2];
extern TLabel * const code Screen9_Labels[9];
extern TImage * const code Screen9_Images[18];

extern TScreen DELAY_MENU;
extern TImage delay_bgd;
extern TImage Image306;
extern TImage Image307;
extern TImage Image308;
extern TImage Image309;
extern TImage Image314;
extern TImage Image313;
extern TImage Image312;
extern TImage Image344;
extern TImage Image345;
extern TImage Image346;
extern TImage Image315;
extern TImage Image347;
extern TImage Image348;
extern TImage Image311;
extern TImage Image310;
extern TImage Image316;
extern TImage Image317;
extern TImage Image349;
extern TBox Box63;
extern TBox Box64;
extern TBox Box66;
extern TImage Delay_Source_UP;
extern TImage Delay_heat_pump_up;
extern TImage Delay_reversing_UP;
extern TImage Delay_trv_up;
extern TImage Delay_DHW_valve_UP;
extern TImage Delay_compressor_UP;
extern TImage Delay_Source_SET;
extern TImage Delay_heat_pump_SET;
extern TImage Delay_reversing_SET;
extern TImage Delay_EEV_SET;
extern TImage Delay_DHW_valve_SET;
extern TImage Delay_compressor_SET;
extern TLabel Delay_setting_label;
extern TButton_Round Home_b9;
extern TButton_Round Back_b6;
extern TImage Delay_Source_DOWN;
extern TImage Delay_heat_pump_DOWN;
extern TImage Delay_reversing_DOWN;
extern TImage Delay_trv_DOWN;
extern TImage Delay_DHW_valve_DOWN;
extern TImage Delay_compressor_DOWN;
extern TButton_Round Delay_Source;
extern TButton_Round Delay_heat_pump;
extern TButton_Round Delay_reversing;
extern TButton_Round Delay_EEV;
extern TButton_Round Delay_DHW_valve;
extern TButton_Round Delay_compressor;
extern TButton_Round * const code Screen10_Buttons_Round[8];
extern TLabel * const code Screen10_Labels[1];
extern TImage * const code Screen10_Images[37];
extern TBox * const code Screen10_Boxes[3];

extern TScreen SYSTEM_EVENTS;
extern TImage Image171;
extern TButton_Round Home_b10;
extern TButton_Round Back_b7;
extern TButton_Round Next_b3;
extern TButton_Round Time_source1;
extern TButton_Round Time_heat1;
extern TButton_Round Time_Electric;
extern TButton_Round Time_reversing1;
extern TButton_Round Time_compressor1;
extern TButton_Round Time_furnance;
extern TLabel total_time_label;
extern TCircleButton CircleButton6;
extern TLabel Label6;
extern TButton_Round * const code Screen11_Buttons_Round[9];
extern TLabel * const code Screen11_Labels[2];
extern TImage * const code Screen11_Images[1];
extern TCircleButton * const code Screen11_CircleButtons[1];

extern TScreen LIMITS1;
extern TImage Image102;
extern TImage Image200;
extern TImage Image205;
extern TImage Image206;
extern TImage Image207;
extern TImage Image208;
extern TImage Image209;
extern TImage Image218;
extern TImage Image219;
extern TImage Image220;
extern TImage Image221;
extern TImage Image222;
extern TImage Image223;
extern TImage Image246;
extern TImage Image247;
extern TImage Image248;
extern TImage Image249;
extern TImage Image250;
extern TImage Image251;
extern TImage Down_1_;
extern TImage Down_2_;
extern TImage Down_3_;
extern TImage Down_4_;
extern TImage Down_5_;
extern TImage Down_6_;
extern TImage Up_1_;
extern TImage Up_2_;
extern TImage Up_3_;
extern TImage Up_4_;
extern TImage Up_5_;
extern TImage Up_6_;
extern TImage Set_1_;
extern TImage Set_2_;
extern TImage Set_3_;
extern TImage Set_4_;
extern TImage Set_5_;
extern TImage Set_6_;
extern TButton_Round Set_min_heating_HP;
extern TButton_Round Set_max_heating_HP;
extern TButton_Round Set_max_exhaust;
extern TButton_Round Set_min_source_temp;
extern TButton_Round Set_max_source_temp;
extern TButton_Round Set_min_delta_heat;
extern TButton_Round Home_b11;
extern TButton_Round Back_b8;
extern TButton_Round Next_b4;
extern TLabel Settings1_label;
extern TCircleButton CircleButton1;
extern TButton_Round * const code Screen12_Buttons_Round[9];
extern TLabel * const code Screen12_Labels[1];
extern TImage * const code Screen12_Images[37];
extern TCircleButton * const code Screen12_CircleButtons[1];

extern TScreen LIMITS2;
extern TImage Image3;
extern TImage Image186;
extern TImage Image257;
extern TImage Image256;
extern TImage Image255;
extern TImage Image254;
extern TImage Image253;
extern TImage Image252;
extern TImage Image224;
extern TImage Image225;
extern TImage Image226;
extern TImage Image227;
extern TImage Image228;
extern TImage Image229;
extern TImage Image215;
extern TImage Image214;
extern TImage Image213;
extern TImage Image212;
extern TImage Image211;
extern TImage Image210;
extern TImage Down_8_;
extern TImage Down_10_;
extern TImage Down_11_;
extern TImage Down_9_;
extern TImage Down_12_;
extern TImage Up_8_;
extern TImage Up_10_;
extern TImage Up_11_;
extern TImage Up_9_;
extern TImage Up_12_;
extern TImage Set_8_;
extern TImage Set_10_;
extern TImage Set_11_;
extern TImage Set_9_;
extern TImage Set_12_;
extern TButton_Round Set_max_delta_heat;
extern TButton_Round Set_min_delta_DHW;
extern TButton_Round Set_min_delta_source;
extern TButton_Round Set_max_source_delta;
extern TButton_Round Set_max_delta_DHW;
extern TButton_Round Set_preset_time_electric;
extern TImage Down_7_;
extern TImage Up_7_;
extern TImage Set_7_;
extern TButton_Round Home_b12;
extern TButton_Round Back_b9;
extern TButton_Round Next_b5;
extern TLabel Settings2_label;
extern TCircleButton CircleButton2;
extern TButton_Round * const code Screen13_Buttons_Round[9];
extern TLabel * const code Screen13_Labels[1];
extern TImage * const code Screen13_Images[38];
extern TCircleButton * const code Screen13_CircleButtons[1];

extern TScreen SENSOR1;
extern TImage Image380;
extern TLabel Sensors2_label;
extern TLabel Label285;
extern TLabel Label286;
extern TLabel Label287;
extern TLabel Label288;
extern TLabel Label289;
extern TLabel Label290;
extern TLabel Label293;
extern TLabel Label294;
extern TButton_Round S_Brine_Inlet_1;
extern TButton_Round S_Brine_Outlet_1;
extern TButton_Round S_Heat_Inlet_1;
extern TButton_Round S_Heat_Outlet_1;
extern TButton_Round S_Compressor_1;
extern TButton_Round S_DHW;
extern TButton_Round S_Superheat_1;
extern TButton_Round S_Subcool_1;
extern TLabel Label297;
extern TLabel Label298;
extern TLabel Label299;
extern TLabel Label300;
extern TLabel Label301;
extern TLabel Label302;
extern TLabel Label303;
extern TLabel Label304;
extern TLabel Label305;
extern TLabel Label306;
extern TLabel Label309;
extern TLabel Label310;
extern TLabel Label315;
extern TLabel Label316;
extern TLabel Label317;
extern TLabel Label318;
extern TLabel Label319;
extern TButton_Round S_Source_Flow_1;
extern TLabel Label320;
extern TButton_Round S_Heat_Flow_1;
extern TLabel Label321;
extern TLabel Label322;
extern TButton_Round SS_tank;
extern TLabel Label12;
extern TLabel Label13;
extern TLabel Label14;
extern TButton_Round S_condenser_1;
extern TButton_Round S_suction_1;
extern TLabel Label15;
extern TLabel Label17;
extern TLabel Label18;
extern TLabel Label28;
extern TLabel Label31;
extern TLabel Label32;
extern TButton_Round Home_b13;
extern TButton_Round Back_b10;
extern TCircleButton CircleButton10;
extern TButton_Round S_Low_Pressure_1;
extern TButton_Round S_High_Pressure_1;
extern TLabel Label70;
extern TLabel Label72;
extern TButton_Round Next_b6;
extern TLabel Label27;
extern TLabel Label35;
extern TButton_Round * const code Screen14_Buttons_Round[18];
extern TLabel * const code Screen14_Labels[42];
extern TImage * const code Screen14_Images[1];
extern TCircleButton * const code Screen14_CircleButtons[1];

extern TScreen LIMITS4;
extern TImage Image192;
extern TImage Image33;
extern TImage Image34;
extern TImage Image266;
extern TImage Image265;
extern TImage Image264;
extern TImage Image243;
extern TImage Image244;
extern TImage Image245;
extern TImage Image24;
extern TButton_Round Home_b14;
extern TButton_Round Next_b7;
extern TImage Image236;
extern TImage Image237;
extern TImage Image238;
extern TImage Image53;
extern TImage Image86;
extern TImage Image95;
extern TButton_Round Set_max_superheat;
extern TButton_Round Set_min_subcooling;
extern TButton_Round Set_max_subcooling;
extern TButton_Round Set_max_high_pressure;
extern TButton_Round Set_min_lhigh_pressure;
extern TLabel Seeting4_label;
extern TCircleButton CircleButton4;
extern TButton_Round Back_b11;
extern TLabel Label390;
extern TImage Down_21_;
extern TImage Down_20_;
extern TImage Down_19_;
extern TImage Down_22_;
extern TImage Down_23_;
extern TImage Up_22_;
extern TImage Up_21_;
extern TImage Up_20_;
extern TImage Up_19_;
extern TImage Up_23_;
extern TImage Set_22_;
extern TImage Set_21_;
extern TImage Set_20_;
extern TImage Set_19_;
extern TImage Set_23_;
extern TButton_Round * const code Screen15_Buttons_Round[8];
extern TLabel * const code Screen15_Labels[2];
extern TImage * const code Screen15_Images[31];
extern TCircleButton * const code Screen15_CircleButtons[1];

extern TScreen DEVICES;
extern TCImage Image390;
extern TImage Image1;
extern TImage Image4;
extern TImage Image98;
extern TImage Image94;
extern TImage Image68;
extern TImage Image67;
extern TImage Image66;
extern TImage Image65;
extern TImage Image64;
extern TImage Image36;
extern TImage Image35;
extern TImage Image19;
extern TImage Image9;
extern TImage Image8;
extern TImage D_Source_1;
extern TImage D_Heating_1;
extern TImage D_Reverse_1;
extern TImage D_Compr_1;
extern TImage D_DHW;
extern TLabel Device_label;
extern TImage D_Electric;
extern TImage D_GAZ;
extern TImage D_Compr_2;
extern TImage D_Source_2;
extern TImage D_Heating_2;
extern TImage D_Reverse_2;
extern TImage D_Solar;
extern TImage D_fan2;
extern TImage D_fan1;
extern TLabel Pump1;
extern TLabel Pump2;
extern TLabel Revers1;
extern TLabel Compr_1;
extern TLabel Valve_1;
extern TLabel Label59;
extern TLabel Label62;
extern TLabel Label64;
extern TLabel Label65;
extern TLabel Label67;
extern TLabel Label68;
extern TButton_Round Home_b15;
extern TLabel Electricobject_TatDiagram;
extern TButton_Round * const code Screen16_Buttons_Round[1];
extern TLabel * const code Screen16_Labels[13];
extern TImage * const code Screen16_Images[28];
extern TCImage * const code Screen16_CImages[1];

extern TScreen Graph;
extern TImage Image37;
extern TBox Box23;
extern TLine Line1;
extern TLine Line2;
extern TLine Line3;
extern TLine Line8;
extern TLine Line9;
extern TLine Line10;
extern TLine Line11;
extern TLine Line12;
extern TLabel graph1_pos;
extern TLabel Label83;
extern TLabel Label84;
extern TLabel Label85;
extern TLabel Label86;
extern TLabel Label87;
extern TLabel Label88;
extern TLabel Label89;
extern TLabel Label90;
extern TLabel Label91;
extern TLabel Label92;
extern TLabel Label93;
extern TLine Line4;
extern TLine Line5;
extern TLine Line6;
extern TLabel Label47;
extern TLabel Label94;
extern TLine Line7;
extern TImage Image269;
extern TLabel GraphTimelabel;
extern TLabel Graph_Label;
extern TButton_Round graph_br1_in;
extern TButton_Round graph_br1_out;
extern TButton_Round graph_heat1_in;
extern TButton_Round graph_heat1_out;
extern TButton_Round Home_b16;
extern TButton_Round Next_b8;
extern TButton_Round Back_b12;
extern TCircleButton CircleButton11;
extern TLabel Label377;
extern TLabel Label378;
extern TLabel Label380;
extern TLabel Label381;
extern TLabel Label382;
extern TButton_Round * const code Screen17_Buttons_Round[7];
extern TLabel * const code Screen17_Labels[21];
extern TImage * const code Screen17_Images[2];
extern TCircleButton * const code Screen17_CircleButtons[1];
extern TBox * const code Screen17_Boxes[1];
extern TLine * const code Screen17_Lines[12];

extern TScreen Schema1;
extern TImage Image69;
extern TImage Image71;
extern TLabel Label42;
extern TImage Image73;
extern TImage Image74;
extern TImage Image75;
extern TImage Image76;
extern TImage Image77;
extern TImage Image79;
extern TButton S_Brine_In_1;
extern TButton S_Brine_Out_1;
extern TButton S_Heat_Out_1;
extern TButton S_Heat_In_1;
extern TButton Sens_DHW;
extern TButton S_tank;
extern TButton S_ComprEx_1;
extern TButton S_High_Press_1;
extern TButton S_Low_Press_1;
extern TButton S_SH_1;
extern TImage Image78;
extern TImage Image80;
extern TButton flow_source;
extern TButton flow_heat;
extern TImage Image117;
extern TImage Image118;
extern TImage Image119;
extern TImage Image120;
extern TImage Image124;
extern TImage Image126;
extern TImage Image127;
extern TImage Image131;
extern TButton flow_sun;
extern TButton draw_One_ground_back;
extern TButton * const code Screen18_Buttons[14];
extern TLabel * const code Screen18_Labels[1];
extern TImage * const code Screen18_Images[18];

extern TScreen MODE;
extern TImage Image41;
extern TImage Power_220V;
extern TLabel Label239;
extern TImage Two_Compressors;
extern TImage Reversing_Heat_OFF;
extern TImage Flow_Source_sensor_OFF;
extern TImage Flow_Source_Heat1_OFF;
extern TImage Flow_Source_Heat2_OFF;
extern TImage One_Compressors;
extern TImage Reversing_ON_HEAT;
extern TImage Flow_Source__Sensor_ON;
extern TImage Flow_Source__Heat1_ON;
extern TImage Flow_Source__Heat2_ON;
extern TImage Power_380V;
extern TButton_Round Home_b17;
extern TButton_Round Next_b9;
extern TButton_Round Back_13;
extern TCircleButton CircleButton12;
extern TButton_Round * const code Screen19_Buttons_Round[3];
extern TLabel * const code Screen19_Labels[1];
extern TImage * const code Screen19_Images[13];
extern TCircleButton * const code Screen19_CircleButtons[1];

extern TScreen FURNANCE;
extern TImage Image43;
extern TImage Image140;
extern TImage Image150;
extern TImage Image136;
extern TImage Image137;
extern TImage Image151;
extern TImage Image191;
extern TImage Image190;
extern TImage Image148;
extern TImage Image149;
extern TImage Image189;
extern TImage Image188;
extern TImage Image143;
extern TLabel Label63;
extern TImage Image152;
extern TImage furnance_time_ON;
extern TImage Furnance_start_temp_Down;
extern TImage Furnance_off_down;
extern TImage Furnance_time_down;
extern TImage Furnance_start_temp_UP;
extern TImage Furnance_HP_OFF_UP;
extern TImage Furnance_off_up;
extern TImage Furnance_time_up;
extern TImage Furnance_HP_OFF_Dowm;
extern TImage furnance_time_OFF;
extern TImage furnance_Mode_on;
extern TBox Box14;
extern TBox Box15;
extern TButton_Round Home_b18;
extern TButton_Round Back_b14;
extern TButton_Round Furnance_temperature_ON;
extern TButton_Round heat_pump_OFF;
extern TButton_Round furnance_OFF;
extern TButton_Round furnance_Timer;
extern TImage Furnance_off_save;
extern TImage Furnance_HP_OFF_save;
extern TButton_Round * const code Screen20_Buttons_Round[6];
extern TLabel * const code Screen20_Labels[1];
extern TImage * const code Screen20_Images[27];
extern TBox * const code Screen20_Boxes[2];

extern TScreen Ethernet;
extern TImage Image107;
extern TBox Box7;
extern TBox Box8;
extern TBox Box9;
extern TBox Box10;
extern TLabel IPAddressLabel;
extern TLabel MaskLabel;
extern TLabel GATELabel;
extern TLabel DNSLabel;
extern TButton_Round LANSet;
extern TButton_Round SetGateWay;
extern TButton_Round SetDNS;
extern TButton_Round SetIPAddress;
extern TButton_Round SetMask;
extern TButton_Round LAN_Key_1;
extern TButton_Round LAN_Key_2;
extern TButton_Round LAN_Key_3;
extern TButton_Round LAN_Key_4;
extern TButton_Round LAN_Key_5;
extern TButton_Round LAN_Key_6;
extern TButton_Round LAN_Key_7;
extern TButton_Round LAN_Key_8;
extern TButton_Round LAN_Key_9;
extern TButton_Round LAN_Key_0;
extern TLabel Label40;
extern TButton_Round LAN_Key_Dot;
extern TButton_Round LAN_Key_Clear;
extern TButton_Round Home_b19;
extern TButton_Round Back_b15;
extern TButton_Round * const code Screen21_Buttons_Round[19];
extern TLabel * const code Screen21_Labels[5];
extern TImage * const code Screen21_Images[1];
extern TBox * const code Screen21_Boxes[4];

extern TScreen SETTINGS;
extern TImage Image146;
extern TImage Image109;
extern TImage Image147;
extern TImage Image153;
extern TLabel Label44;
extern TImage Image114;
extern TImage Image115;
extern TImage Image116;
extern TImage Image121;
extern TImage Image122;
extern TImage Image123;
extern TImage Image128;
extern TImage Image129;
extern TImage Image130;
extern TImage Image135;
extern TImage Image138;
extern TImage Set_DHW_HY;
extern TImage Hyst_Heat_down;
extern TImage Hyst_DHW_down;
extern TImage Hyst_Heat_up;
extern TImage Hyst_Cool_up;
extern TImage Hyst_DHW_up;
extern TImage Hyst_Cool_down;
extern TButton_Round Home_b20;
extern TButton_Round Back_b16;
extern TButton_Round Hysteresis_heating;
extern TButton_Round Hysteresis_cooling;
extern TButton_Round Hysteresis_DHW;
extern TButton_Round * const code Screen22_Buttons_Round[5];
extern TLabel * const code Screen22_Labels[1];
extern TImage * const code Screen22_Images[22];

extern TScreen Gauge2;
extern TImage Image62;
extern TLabel Label69;
extern TImage Image134;
extern TImage HP2_gauge;
extern TImage LP2_gauge;
extern TLine HP2_arrow;
extern TLine LP2_arrow;
extern TButton_Round Home_b22;
extern TButton_Round Back_b18;
extern TCircleButton CircleButton15;
extern TButton_Round * const code Screen23_Buttons_Round[2];
extern TLabel * const code Screen23_Labels[1];
extern TImage * const code Screen23_Images[4];
extern TCircleButton * const code Screen23_CircleButtons[1];
extern TLine * const code Screen23_Lines[2];

extern TScreen Sensor2;
extern TImage Image142;
extern TLabel Module2_br_outlet;
extern TLabel Label81;
extern TLabel Module2_heat_inlet;
extern TLabel Module2_heat_outlet;
extern TLabel Module2_compressor;
extern TLabel Module2_SH;
extern TLabel Module2_SC;
extern TButton_Round S_Brine_Inlet_2;
extern TButton_Round S_Brine_Outlet_2;
extern TButton_Round S_Heat_Inlet_2;
extern TButton_Round S_Heat_Outlet_2;
extern TButton_Round S_Compressor_2;
extern TButton_Round S_Superheat_2;
extern TButton_Round S_Subcool_2;
extern TLabel Label100;
extern TLabel Label101;
extern TLabel Label102;
extern TLabel Label103;
extern TLabel Label105;
extern TLabel Label106;
extern TLabel Label107;
extern TLabel Label108;
extern TLabel Label109;
extern TLabel Label110;
extern TLabel Label111;
extern TLabel Label112;
extern TLabel Label113;
extern TLabel Label114;
extern TLabel Label115;
extern TLabel Label116;
extern TLabel Module2_br_flow;
extern TButton_Round S_Source_Flow_2;
extern TLabel Module2_heat_flow;
extern TButton_Round S_Heat_Flow_2;
extern TLabel Label119;
extern TLabel Label120;
extern TLabel Label128;
extern TLabel Label129;
extern TLabel Label76;
extern TButton_Round S_condenser_2;
extern TButton_Round S_suction_2;
extern TLabel Module2_cond;
extern TLabel Module2_suct;
extern TButton_Round ButtonRound14;
extern TButton_Round Home_b23;
extern TCircleButton CircleButton16;
extern TButton_Round S_Low_Pressure_2;
extern TButton_Round S_High_Pressure_2;
extern TLabel Label283;
extern TLabel Label284;
extern TLabel Label3;
extern TLabel Label26;
extern TButton_Round * const code Screen24_Buttons_Round[15];
extern TLabel * const code Screen24_Labels[36];
extern TImage * const code Screen24_Images[1];
extern TCircleButton * const code Screen24_CircleButtons[1];

extern TScreen MODE2;
extern TImage Image157;
extern TLabel Label80;
extern TImage Mode_air_on;
extern TImage Mode_ground_on;
extern TButton_Round Home_b24;
extern TButton_Round Back_20;
extern TCircleButton CircleButton13;
extern TButton_Round * const code Screen25_Buttons_Round[2];
extern TLabel * const code Screen25_Labels[1];
extern TImage * const code Screen25_Images[3];
extern TCircleButton * const code Screen25_CircleButtons[1];

extern TScreen Schema2;
extern TImage Image159;
extern TImage Image273;
extern TImage Image162;
extern TImage Image176;
extern TImage Image174;
extern TImage Image166;
extern TImage Image276;
extern TImage Image175;
extern TImage Image274;
extern TImage Image267;
extern TImage Image164;
extern TImage Image270;
extern TImage Image165;
extern TLabel Label82;
extern TImage Image203;
extern TButton Module1_br_inlet;
extern TButton Module1_br_outlet;
extern TButton Module1_heat_outlet;
extern TButton Module1_heat_inlet;
extern TButton TANK;
extern TButton DHW;
extern TButton Module1_exhaust;
extern TButton Module1_superheat;
extern TButton Module1_heat_flow;
extern TImage Image181;
extern TImage Image160;
extern TButton Button7;
extern TButton Button9;
extern TButton Button10;
extern TButton Button11;
extern TButton Module2_exhaust;
extern TButton Module2_superheat;
extern TButton Module2_brine_flow;
extern TButton Button15;
extern TImage Image178;
extern TImage Image183;
extern TImage Image271;
extern TImage Image272;
extern TImage Image172;
extern TImage Image182;
extern TImage Image204;
extern TImage Image180;
extern TImage Image275;
extern TImage Image202;
extern TLabel Label95;
extern TButton Button13;
extern TButton Button5;
extern TButton * const code Screen26_Buttons[19];
extern TLabel * const code Screen26_Labels[2];
extern TImage * const code Screen26_Images[26];

extern TScreen SYSTEM_EVENTS2;
extern TImage Image278;
extern TLabel Label96;
extern TButton_Round Time2_reverse;
extern TButton_Round Time2_ground_pump;
extern TButton_Round Time2_heat_pump;
extern TButton_Round Time2_compressor;
extern TButton_Round Home_b25;
extern TButton_Round Time_solar;
extern TCircleButton CircleButton7;
extern TButton_Round Back_b21;
extern TLabel Label9;
extern TButton_Round * const code Screen27_Buttons_Round[7];
extern TLabel * const code Screen27_Labels[2];
extern TImage * const code Screen27_Images[1];
extern TCircleButton * const code Screen27_CircleButtons[1];

extern TScreen AIR_TWO;
extern TImage Image289;
extern TImage Image324;
extern TImage Image290;
extern TImage Image297;
extern TImage Image296;
extern TImage Image326;
extern TImage Image327;
extern TImage Image330;
extern TImage Image329;
extern TImage Image325;
extern TImage Image291;
extern TLabel Label97;
extern TImage Image303;
extern TLabel Label98;
extern TImage Image301;
extern TImage Image318;
extern TImage Image320;
extern TImage Image328;
extern TImage Image331;
extern TImage Image322;
extern TImage Image321;
extern TImage Image332;
extern TImage Image323;
extern TImage Image292;
extern TImage Image293;
extern TImage Image305;
extern TImage Image319;
extern TButton Button17;
extern TButton Button18;
extern TButton Button19;
extern TButton Button20;
extern TButton Button22;
extern TButton Button23;
extern TButton Button25;
extern TButton Button28;
extern TButton Button29;
extern TButton Button30;
extern TButton Button31;
extern TButton Button33;
extern TButton Button34;
extern TButton Button16;
extern TImage Image299;
extern TButton Button6;
extern TButton * const code Screen28_Buttons[15];
extern TLabel * const code Screen28_Labels[2];
extern TImage * const code Screen28_Images[26];

extern TScreen AIR_ONE;
extern TImage Image333;
extern TImage Image336;
extern TImage Image339;
extern TImage Image338;
extern TImage Image343;
extern TImage Image342;
extern TImage Image341;
extern TImage Image352;
extern TImage Image334;
extern TLabel Label99;
extern TImage Image358;
extern TImage Image360;
extern TImage Image362;
extern TImage Image365;
extern TImage Image367;
extern TImage Image368;
extern TImage Image361;
extern TImage Image340;
extern TImage Image337;
extern TButton Button14;
extern TButton Button26;
extern TButton Button27;
extern TButton Button32;
extern TButton Button35;
extern TButton Button36;
extern TButton Button37;
extern TButton Button38;
extern TButton Button39;
extern TButton Button41;
extern TButton Button42;
extern TButton Button2;
extern TButton * const code Screen29_Buttons[12];
extern TLabel * const code Screen29_Labels[1];
extern TImage * const code Screen29_Images[18];

extern TScreen GRAPH2;
extern TImage Image374;
extern TBox Box28;
extern TLine Line13;
extern TLine Line14;
extern TLine Line15;
extern TLine Line17;
extern TLine Line18;
extern TLine Line19;
extern TLine Line20;
extern TLine Line21;
extern TLabel Label121;
extern TLabel Label122;
extern TLabel Label125;
extern TLabel Label127;
extern TLabel Label130;
extern TLabel Label131;
extern TLabel Label132;
extern TLabel Label133;
extern TLabel Label134;
extern TLabel Label135;
extern TLabel Label136;
extern TLine Line22;
extern TLine Line23;
extern TLine Line24;
extern TLabel Label137;
extern TLabel Label146;
extern TLine Line25;
extern TImage Image378;
extern TLabel Label151;
extern TLabel _;
extern TButton_Round Home_b26;
extern TButton_Round Back_b22;
extern TLabel graph2_pos;
extern TButton_Round graph_br2_in;
extern TButton_Round graph_br2_out;
extern TButton_Round graph_heat2_in;
extern TButton_Round graph_heat2_out;
extern TLabel Label5;
extern TLabel Label8;
extern TLabel Label16;
extern TLabel Label19;
extern TLabel Label21;
extern TCircleButton CircleButton5;
extern TButton_Round * const code Screen30_Buttons_Round[6];
extern TLabel * const code Screen30_Labels[21];
extern TImage * const code Screen30_Images[2];
extern TCircleButton * const code Screen30_CircleButtons[1];
extern TBox * const code Screen30_Boxes[1];
extern TLine * const code Screen30_Lines[12];

extern TScreen TIMERS;
extern TImage Image133;
extern TImage Image395;
extern TImage Image393;
extern TImage Image161;
extern TImage Image295;
extern TImage Image376;
extern TImage Image391;
extern TImage Image111;
extern TImage Image402;
extern TImage Image403;
extern TImage Image405;
extern TImage Image404;
extern TImage Image406;
extern TImage Image113;
extern TLabel Label162;
extern TButton_Round Home_b27;
extern TButton_Round Back_b23;
extern TButton_Round * const code Screen31_Buttons_Round[2];
extern TLabel * const code Screen31_Labels[1];
extern TImage * const code Screen31_Images[14];

extern TScreen ENERGY;
extern TImage Image108;
extern TLabel Label126;
extern TButton_Round Home_b28;
extern TButton_Round Back_b24;
extern TButton_Round Energy_Volt_1;
extern TLabel Label251;
extern TLabel Label252;
extern TButton_Round S_Current_1;
extern TLabel Label253;
extern TButton_Round Energy_Volt_2;
extern TLabel Label254;
extern TLabel Label255;
extern TButton_Round S_Current_2;
extern TLabel Label256;
extern TButton_Round Energy_Volt_3;
extern TLabel Label257;
extern TLabel Label258;
extern TButton_Round S_Current_3;
extern TLabel Label259;
extern TButton_Round Energy_Power_1;
extern TLabel Label260;
extern TLabel Label261;
extern TButton_Round ButtonRound12;
extern TLabel Label400;
extern TLabel Label401;
extern TButton_Round * const code Screen32_Buttons_Round[10];
extern TLabel * const code Screen32_Labels[14];
extern TImage * const code Screen32_Images[1];

extern TScreen DEFROST;
extern TImage Image82;
extern TImage Image388;
extern TImage Defrost_set4;
extern TImage Image355;
extern TImage Image198;
extern TImage Image199;
extern TButton_Round Defrost_on_time;
extern TImage Image377;
extern TImage Image379;
extern TImage Image382;
extern TImage Image383;
extern TImage Image381;
extern TImage Image384;
extern TButton_Round Defrost_off_time;
extern TButton_Round Defrost_on_temperature;
extern TButton_Round Defrost_off_temperature;
extern TButton_Round Home_b29;
extern TButton_Round Back_b25;
extern TImage Defrost_minus1;
extern TImage Defrost_minus2;
extern TImage Defrost_minus3;
extern TImage Defrost_plus1;
extern TImage Defrost_plus2;
extern TImage Defrost_plus3;
extern TImage Defrost_set1;
extern TImage Defrost_set2;
extern TImage Defrost_set3;
extern TImage Image386;
extern TImage Image387;
extern TImage Defrost_plus4;
extern TImage Defrost_minus4;
extern TButton_Round Defrost_on_humidity;
extern TImage Image47;
extern TImage Image70;
extern TImage Image103;
extern TLabel Label51;
extern TImage humidity_down;
extern TImage humidity_up;
extern TImage humidity_set;
extern TButton_Round * const code Screen33_Buttons_Round[7];
extern TLabel * const code Screen33_Labels[1];
extern TImage * const code Screen33_Images[31];

extern TScreen EVENTS;
extern TImage Image63;
extern TButton_Round Home_b30;
extern TBox_Round BoxRound1;
extern TButton_Round Back_b26;
extern TLabel Label50;
extern TButton_Round * const code Screen34_Buttons_Round[2];
extern TLabel * const code Screen34_Labels[1];
extern TImage * const code Screen34_Images[1];
extern TBox_Round * const code Screen34_Boxes_Round[1];

extern TScreen LIMITS5;
extern TImage Image21;
extern TImage Image22;
extern TImage Image29;
extern TImage Image280;
extern TImage Image99;
extern TImage Image100;
extern TImage Image281;
extern TButton_Round Home_b31;
extern TButton_Round Set_max_low_pressure;
extern TButton_Round Set_min_low_pressure;
extern TImage Image12;
extern TImage Image14;
extern TImage Image17;
extern TImage Image18;
extern TImage Image282;
extern TImage Image279;
extern TButton_Round Back_b27;
extern TLabel Label46;
extern TCircleButton CircleButton3;
extern TImage Set_phase_off;
extern TImage Set_voltage_off;
extern TImage Set_voltage_on;
extern TImage Set_phase_on;
extern TImage Image5;
extern TImage Image6;
extern TImage Image46;
extern TImage UP_26_;
extern TImage Set_26_;
extern TButton_Round Set_eev_on;
extern TImage Image7;
extern TButton_Round * const code Screen35_Buttons_Round[5];
extern TLabel * const code Screen35_Labels[1];
extern TImage * const code Screen35_Images[23];
extern TCircleButton * const code Screen35_CircleButtons[1];

extern TScreen MICRO_SD;
extern TImage Image2;
extern TButton_Round Back_b28;
extern TButton_Round Home_b32;
extern TLabel Label7;
extern TButton_Round * const code Screen36_Buttons_Round[2];
extern TLabel * const code Screen36_Labels[1];
extern TImage * const code Screen36_Images[1];

extern TScreen LIMITS3;
extern TImage Image461;
extern TImage Image469;
extern TImage Image471;
extern TImage Image472;
extern TImage Image473;
extern TImage Image470;
extern TImage Image468;
extern TImage Image482;
extern TImage Image474;
extern TImage Image478;
extern TImage Image479;
extern TImage Image475;
extern TImage Image483;
extern TImage Image484;
extern TImage Image476;
extern TImage Image480;
extern TImage Image481;
extern TImage Image477;
extern TImage Image485;
extern TButton_Round Home_b33;
extern TButton_Round Back_b29;
extern TButton_Round Next_b10;
extern TImage Down_15_;
extern TImage Down_16_;
extern TImage Down_17_;
extern TImage Down_18_;
extern TImage Up_15_;
extern TImage Up_16_;
extern TImage Up_17_;
extern TImage Up_18_;
extern TImage Set_15_;
extern TImage Set_16_;
extern TImage Set_17_;
extern TImage Set_18_;
extern TImage Set_14_;
extern TImage Set_13_;
extern TImage Up_14_;
extern TImage Up_13_;
extern TImage Down_14_;
extern TImage Down_13_;
extern TButton_Round Set_Furnance_one_preset;
extern TButton_Round Set_solar_max;
extern TButton_Round Set_max_electric;
extern TButton_Round Set_max_furnance;
extern TButton_Round Set_electric_preset;
extern TButton_Round Set_min_superheat;
extern TLabel Label341;
extern TCircleButton CircleButton17;
extern TButton_Round * const code Screen37_Buttons_Round[9];
extern TLabel * const code Screen37_Labels[1];
extern TImage * const code Screen37_Images[37];
extern TCircleButton * const code Screen37_CircleButtons[1];




void BackToHome();
void goToBack();
void nextPage();

void Main_OFFOnClick();
void bar_heatingOnClick();
void DHW_SetingOnClick();
void Heat_SettingOnClick();
void Click_HEAT();
void Click_DHW();
void MainBut1OnUp();
void MainBut1OnPress();
void MainBut2OnUp();
void MainBut2OnPress();
void MainBut3OnUp();
void MainBut3OnPress();
void MainBut4OnUp();
void MainBut4OnPress();
void MainBut5OnUp();
void MainBut5OnPress();
void DHW_UPOnClick();
void DHW_DOWNOnClick();
void HEAT_UPOnClick();
void HEAT_DownOnClick();

void user_settingOnUp();
void user_settingOnPress();
void user_set_timeOnPress();
void user_set_timeOnUp();
void user_check_temperatureOnPress();
void user_check_temperatureOnUp();
void user_set_LANOnPress();
void user_set_LANOnUp();
void user_check_errorsOnPress();
void user_check_errorsOnUp();
void user_set_timersOnPress();
void user_set_timersOnUp();
void user_hysterezisOnPress();
void user_hysterezisOnUp();
void User_history_checkOnPress();
void User_history_checkOnUp();
void user_energyOnUp();
void user_energyOnPress();
void admin_set_systemOnUp();
void admin_set_systemOnPress ();
void furnanceUP();
void furnanceDown();
void user_defrostOnUp();
void user_defrostOnPress();
#line 2015 "c:/users/user/desktop/alta_2_compressor_display/controller_code/mikroc pro for arm/controller_objects.h"
void DEC_EEV1OnPress();
void INC_EEV1OnPress();

void Set_Trv();

void _1OnClick() ;
void _2OnClick() ;
void _3OnClick() ;
void _4OnClick() ;
void _5OnClick() ;
void _6OnClick() ;
void _7OnClick() ;
void _8OnClick() ;
void _9OnClick() ;
void _0OnClick() ;
void _QOnClick() ;
void _WOnClick() ;
void _EOnClick() ;
void _ROnClick() ;
void _TOnClick() ;
void _YOnClick() ;
void _UOnClick() ;
void _IOnClick() ;
void _OOnClick() ;
void _POnClick() ;
void _AOnClick() ;
void _SOnClick() ;
void _DOnClick() ;
void _FOnClick() ;
void _GOnClick() ;
void _HOnClick() ;
void _JOnClick() ;
void _KOnClick() ;
void _LOnClick() ;
void _ZOnClick() ;
void _XOnClick() ;
void _COnClick() ;
void _VOnClick() ;
void _BOnClick() ;
void _NOnClick() ;
void _MOnClick() ;
void _CommaOnClick();
void _ColonOnClick() ;
void _SlashOnClick() ;
void _DELOnClick() ;
void ClearOnPress() ;
void CAPS_SwitchOnClick();
void SPACEOnClick();
void ENTEROnClick() ;

void SetDateAndTimeOnClick();
void OneYearUpOnClick();
void OneYearDwnOnClick();
void OneYearUpOnUp();
void OneYearUpOnPress();
void OneYearDwnOnUp();
void OneYearDwnOnPress();
void TenYearUpOnClick();
void TenYearDwnOnClick();
void TenYearUpOnUp();
void TenYearDwnOnUp();
void TenYearDwnOnPress();
void TenYearUpOnPress();
void OneYearUpOnClick();
void OneYearDwnOnClick();
void OneYearUpOnUp();
void OneYearUpOnPress();
void OneYearDwnOnUp();
void OneYearDwnOnPress();
void MonthDateUpOnClick();
void MonthDateUpOnUp();
void MonthDateUpOnPress();
void MonthDateDwnOnClick();
void MonthDateDwnOnUp();
void MonthDateDwnOnPress();
void TenDayUpOnClick();
void TenDayDwnOnClick();
void TenDayUpOnUp();
void TenDayDwnOnUp();
void TenDayUpOnPress();
void TenDayDwnOnPress();
void OneDayUpOnClick();
void OneDayDwnOnClick();
void OneDayUpOnUp();
void OneDayDwnOnUp();
void OneDayUpOnPress();
void OneDayDwnOnPress();
void Day_unitUpOnClick();
void Day_unitDwnOnClick();
void Day_unitUpOnUp() ;
void Day_unitDwnOnUp() ;
void Day_unitUpOnPress();
void Day_unitDwnOnPress();
void Unit_hoursUpOnClick();
void Unit_hoursDwnOnClick();
void Unit_hoursUpOnUp();
void Unit_hoursDwnOnUp();
void Unit_hoursUpOnPress();
void Unit_hoursDwnOnPress();
void Ten_minutesUpOnClick();
void Ten_minutesDwnOnClick();
void Ten_minutesUpOnUp();
void Ten_minutesDwnOnUp();
void Ten_minutesUpOnPress();
void Ten_minutesDwnOnPress();
void Unit_minutesUpOnClick();
void Unit_minutesDwnOnClick();
void Unit_minutesUpOnUp();
void Unit_minutesDwnOnUp();
void Unit_minutesUpOnPress();
void Unit_minutesDwnOnPress();

 void Admin_SetOnClick();

void system_passOnDown();
void system_passOnUp() ;
void ModeSetOnUp();
void ModeSetOnDown();
void system_EEVOnDown() ;
void system_EEVOnUp();
void system_modeOnDown();
void system_modeOnUp();
void system_delayOnDown();
void system_delayOnUp();
void system_graphOnDown();
void system_graphOnUp() ;
void system_microSDOnDown();
void system_microSDOnUp();
void system_delayOnUp();
void system_limitsOnDown();
void system_limitsOnUp();
void ssytem_graphOnDown();
void ssytem_graphOnUp();
void system_historyOnDown();
void system_historyOnUp();


void Delay_Source_DOWNOnUp();
void Delay_Source_DOWNOnPress();
void Delay_Source_UPOnUp();
void Delay_Source_UPOnPress();
void Delay_Source_SETOnUp();
void Delay_Source_SETOnDown();

void Delay_heat_pump_DOWNOnUp();
void Delay_heat_pump_DOWNOnPress();
void Delay_heat_pump_upOnUp();
void Delay_heat_pump_upOnPress();
void Delay_heat_pump_SETOnUp();
void Delay_heat_pump_SETOnDown();

void Delay_reversing_DOWNOnUp() ;
void Delay_reversing_DOWNOnPress() ;
void Delay_reversing_UPOnUp() ;
void Delay_reversing_UPOnPress() ;
void Delay_reversing_SETOnUp();
void Delay_reversing_SETOnDown();

void Delay_trv_DOWNOnUp() ;
void Delay_trv_DOWNOnPress();
void Delay_trv_UPOnPress() ;
void Delay_trv_UPOnUp();
void Delay_EEV_SETOnUp();
void Delay_EEV_SETOnDown() ;

void Delay_DHW_valve_DOWNOnUp() ;
void Delay_DHW_valve_DOWNOnPress() ;
void Delay_DHW_valve_UPOnUp() ;
void Delay_DHW_valve_UPOnPress();
void Delay_DHW_valve_SETOnUp();
void Delay_DHW_valve_SETOnDown() ;

void Delay_compressor_DOWNOnUp();
void Delay_compressor_DOWNOnPress() ;
void Delay_compressor_UPOnUp() ;
void Delay_compressor_UPOnPress() ;
void Delay_compressor_SETOnUp() ;
void Delay_compressor_SETOnDown();
void Delay_trv_SETOnUp();
void Delay_trv_OnPress();

void Down_1_OnUp() ;
void Down_1_OnPress();
void Up_1_OnUp() ;
void Up_1_OnPress() ;
void Down_2_OnUp() ;
void Down_2_OnPress();
void Up_2_OnPress() ;
void Up_2_OnUp() ;
void Down_3_OnPress();
void Down_3_OnUp() ;
void Up_3_OnPress();
void Up_3_OnUp() ;
void Down_4_OnPress();
void Down_4_OnUp() ;
void Up_4_OnUp() ;
void Up_4_OnPress();
void Down_5_OnUp() ;
void Down_5_OnPress();
void Up_5_OnPress() ;
void Up_5_OnUp() ;
void Down_6_OnPress();
void Down_6_OnUp() ;
void Up_6_OnPress();
void Up_6_OnUp();
void Set_1_OnDown();
void Set_1_OnUp() ;
void Set_2_OnDown();
void Set_2_OnUp();
void Set_3_OnDown();
void Set_3_OnUp() ;
void Set_4_OnDown() ;
void Set_4_OnUp() ;
void Set_5_OnDown();
void Set_5_OnUp() ;
void Furnance_HP_OFF_save_ondown();
void Set_6_OnUp() ;
void Set_6_OnDown();

void Down_7_OnUp() ;
void Down_7_OnPress();
void Up_7_OnPress() ;
void Up_7_OnUp();
void Down_8_OnPress();
void Down_8_OnUp();
void Up_8_OnPress();
void Up_8_OnUp();
void Down_9_OnPress();
void Down_9_OnUp();
void Up_9_OnPress();
void Up_9_OnUp();
void Down_10_OnPress();
void Down_10_OnUp();
void Up_10_OnPress();
void Up_10_OnUp();
void Down_11_OnPress();
void Down_11_OnUp();
void Up_11_OnPress();
void Up_11_OnUp() ;
void Down_12_OnPress();
void Down_12_OnUp() ;
void Up_12_OnPress();
void Up_12_OnUp() ;
void Set_7_OnUp() ;
void Set_7_OnDown();
void Set_8_OnDown();
void Set_8_OnUp() ;
void Set_9_OnUp();
void Set_9_OnDown() ;
void Set_10_OnDown();
void Set_10_OnUp() ;
void Set_11_OnDown();
void Set_11_OnUp() ;
void Set_12_OnDown();
void Set_12_OnUp();


void Down_19_OnPress();
void Down_19_OnUp() ;
void Up_19_OnPress();
void Up_19_OnUp();
void Down_20_OnPress();
void Down_20_OnUp();
void Up_20_OnPress();
void Up_20_OnUp();
void Down_21_OnPress();
void Down_21_OnUp();
void Up_21_OnPress();
void Up_21_OnUp();
void Down_22_OnPress();
void Down_22_OnUp();
void Up_22_OnPress();
void Up_22_OnUp();
void Down_23_OnPress();
void Down_23_OnUp();
void Up_23_OnPress();
void Up_23_OnUp();
void Set_19_OnUp();
void Set_19_OnDown();
void Set_20_OnDown();
void Set_20_OnUp();
void Set_21_OnDown();
void Set_21_OnUp();
void Set_22_OnDown();
void Set_22_OnUp();
void Set_23_OnDown();
void Set_23_OnUp();

void One_CompressorsOnClick();
void Reversing_ON_HEATOnClick();
void Flow_Source__Sensor_ONOnClick();
void Flow_Source__Heat1_ONOnClick();
void Flow_Source__Heat2_ONOnClick();
void Power_380VOnClick();

void furnance_Mode_onOnClick();
void Furnance_start_temp_DownOnUp();
void Furnance_start_temp_DownOnPress();
void Furnance_HP_OFF_DowmOnUp();
void Furnance_HP_OFF_DowmOnPress();
void Furnance_HP_OFF_UPOnUp();
void Furnance_HP_OFF_UPOnPress();
void Furnance_off_downOnUp();
void Furnance_off_downOnPress();
void Furnance_off_upOnUp() ;
void Furnance_off_upOnPress();
void Furnance_off_save_onup();
void Furnance_off_save_ondown();
void Furnance_time_downOnUp();
void Furnance_time_downOnPress();
void Furnance_time_upOnUp();
void Furnance_time_upOnPress();
void furnance_time_OFFOnClick();
void Furnance_HP_OFF_save_onup();
void Furnance_start_temp_UPOnUp();
void Furnance_start_temp_UPOnPress();


void SetIPAddressOnClick();
void SetMaskOnClick();
void SetDNSOnClick();
void LAN_Key_1OnClick();
void LAN_Key_2OnClick();
void LAN_Key_3OnClick();
void LAN_Key_4OnClick();
void LAN_Key_5OnClick();
void LAN_Key_6OnClick();
void LAN_Key_7OnClick();
void LAN_Key_8OnClick();
void LAN_Key_9OnClick();
void LAN_Key_0OnClick();
void LAN_Key_DotOnClick();
void LAN_Key_ClearOnClick();
void LANSetOnClick();
void SetGateWayOnClick();

void Hyst_Heat_downOnUp();
void Hyst_Heat_downOnPress();
void Hyst_Heat_upOnUp();
void Hyst_Heat_upOnPress();
void Hyst_Cool_downOnUp();
void Hyst_Cool_downOnPress() ;
void Hyst_Cool_upOnUp();
void Hyst_Cool_upOnPress();
void Hyst_DHW_downOnUp();
void Hyst_DHW_downOnPress();
void Hyst_DHW_upOnUp();
void Hyst_DHW_upOnPress();
void Set_heat_onup();
void Set_heat_OnDown();
void Set_cool_OnUp();
void Set_cool_OnDown();
void Set_dhw_OnUp();
void Set_dhw_OnDown();


void DEC_EEV2OnPress();
void INC_EEV2OnPress();
 void EEV2DownOnUp();
void EEV2DownOnDown();
void EEV2UpOnUp();
void EEV2UpOnDown();
void EEV2_AutoOnClick();

void Mode_ground_onOnClick ();





 void Up_24_OnPress();
void Down_24_OnPress();
void Down_24_OnUp();
void Up_24_OnUp();
void Down_25_OnPress();
void Down_25_OnUp();
void Up_25_OnPress();
void Up_25_OnUp();
void Down_26_OnPress();
void Down_26_OnUp();
void UP_26_OnPress();
void UP_26_OnUp();
void Set_24_OnDown();
void Set_24_OnUp();
void Set_25_OnDown();
void Set_25_OnUp();
void Set_26_OnDown();
void Set_26_OnUp();
void Set_phase_check();
void Set_voltage_check();

void Down_13_OnUp();
void Down_13_OnPress();
void Up_13_OnPress();
void Up_13_OnUp();
void Down_14_OnPress();
void Down_14_OnUp();
void Up_14_OnPress();
void Up_14_OnUp();
void Down_15_OnPress();
void Down_15_OnUp();
void Up_15_OnPress();
void Up_15_OnUp();
void Down_16_OnPress();
void Down_16_OnUp();
void Up_16_OnPress();
void Up_16_OnUp();
void Down_17_OnPress();
void Down_17_OnUp();
void Up_17_OnPress();
void Up_17_OnUp();
void Down_18_OnPress();
void Down_18_OnUp();
void Up_18_OnPress();
void Up_18_OnUp();
void Set_15_OnUp();
void Set_15_OnDown();
void Set_16_OnUp();
void Set_16_OnDown();
void Set_17_OnUp ();
void Set_17_OnDown();
void Set_18_OnUp();
void Set_18_OnDown();
void Set_14_OnDown();
void Set_14_OnUp();
void Set_13_OnUp();
void Set_13_OnDown();





extern char Set_Heat_Box_Caption[];
extern char Set_Dhw_Box_Caption[];
extern char background_Caption[];
extern char Heat_Windows_Caption[];
extern char HEAT_button_redraw_Caption[];
extern char DHW_button_redraw_Caption[];
extern char DWN_Windows_Caption[];
extern char Brine_Windows_Caption[];
extern char Image20_Caption[];
extern char Wheater_Windows_Caption[];
extern char Image44_Caption[];
extern char Image61_Caption[];
extern char Main_ON_Caption[];
extern char Main_OFF_Caption[];
extern char DHW_Seting_Caption[];
extern char Label53_Caption[];
extern char Label38_Caption[];
extern char Label39_Caption[];
extern char Label4_Caption[];
extern char Label20_Caption[];
extern char Brine_Line_Caption[];
extern char Heat_Setting_Caption[];
extern char alarm_led_Caption[];
extern char radio_led_Caption[];
extern char bar_heating_Caption[];
extern char bar_DHW_Caption[];
extern char dhw_led_Caption[];
extern char heat_led_Caption[];
extern char Line16_Caption[];
extern char Label140_Caption[];
extern char Label141_Caption[];
extern char bar_weather_Caption[];
extern char Weather_Icon_Caption[];
extern char bar_brine_Caption[];
extern char Brine_Icon_Caption[];
extern char MainBut3_Caption[];
extern char MainBut4_Caption[];
extern char clock_icon_Caption[];
extern char microSD_icon_Caption[];
extern char radio_icon_Caption[];
extern char dhw_icon_Caption[];
extern char Label25_Caption[];
extern char cool_icon_Caption[];
extern char Image28_Caption[];
extern char DateTime_Caption[];
extern char dhw_celc_Caption[];
extern char dhw_point_Caption[];
extern char heat_point_Caption[];
extern char heat_celc_Caption[];
extern char TEMP_Setting_value_Caption[];
extern char DHW_Setting_value_Caption[];
extern char WiFi_on_icon_Caption[];
extern char Image163_Caption[];
extern char Image167_Caption[];
extern char Image168_Caption[];
extern char Image169_Caption[];
extern char Image26_Caption[];
extern char Image170_Caption[];
extern char DHW_UP_Caption[];
extern char DHW_DOWN_Caption[];
extern char HEAT_Down_Caption[];
extern char HEAT_UP_Caption[];
extern char ON_OFF_Heat_Cool_Caption[];
extern char ON_OFF_DHW_Caption[];
extern char Image25_Caption[];
extern char Image40_Caption[];
extern char Image87_Caption[];
extern char heat_icon_Caption[];
extern char MainBut1_Caption[];
extern char MainBut2_Caption[];
extern char MainBut5_Caption[];
extern char heatBox_Caption[];
extern char heat_temp_main_Caption[];
extern char BoxRound2_Caption[];
extern char dhw_temp_main_Caption[];
extern char BoxRound3_Caption[];
extern char sourse_temp_input_main_Caption[];
extern char BoxRound4_Caption[];
extern char sourse_temp_output_main_Caption[];
extern char BoxRound5_Caption[];
extern char weather_temp_main_Caption[];
extern char BoxRound6_Caption[];
extern char humedity_main_Caption[];
extern char BoxRound7_Caption[];
extern char prassure_main_Caption[];
extern char Messages_Box_Caption[];
extern char Messages_Label_Caption[];
extern char Image30_Caption[];
extern char Image105_Caption[];
extern char Image60_Caption[];
extern char Image51_Caption[];
extern char Image50_Caption[];
extern char Image49_Caption[];
extern char Image48_Caption[];
extern char Image39_Caption[];
extern char Image52_Caption[];
extern char Image56_Caption[];
extern char Image54_Caption[];
extern char Image55_Caption[];
extern char User_menu_label_Caption[];
extern char User_time_label_Caption[];
extern char User_c_label_Caption[];
extern char User_lan_label_Caption[];
extern char User_errors_label_Caption[];
extern char User_timers_label_Caption[];
extern char User_events_label_Caption[];
extern char User_energy_label_Caption[];
extern char User_furnance_label_Caption[];
extern char User_defrost_label_Caption[];
extern char Label77_Caption[];
extern char user_set_time_Caption[];
extern char user_check_temperature_Caption[];
extern char user_set_LAN_Caption[];
extern char user_check_errors_Caption[];
extern char user_set_timers_Caption[];
extern char User_history_check_Caption[];
extern char user_check_energy_Caption[];
extern char admin_set_system_Caption[];
extern char user_check_graph_Caption[];
extern char Image57_Caption[];
extern char user_defrost_Caption[];
extern char Home_b1_Caption[];
extern char user_hysterezis_Caption[];
extern char user_setting_Caption[];
extern char User_operational_label_Caption[];
extern char User_hysterezis_label_Caption[];
extern char User_system_label_Caption[];
extern char Image27_Caption[];
extern char Image173_Caption[];
extern char DEC_EEV1_Caption[];
extern char INC_EEV1_Caption[];
extern char Red_bar_Caption[];
extern char EEV1_set_step_label_Caption[];
extern char EEV1_label_Caption[];
extern char Home_b2_Caption[];
extern char Back_b2_Caption[];
extern char Next_b1_Caption[];
extern char EEV1_superheat_Caption[];
extern char EEV1_value_Caption[];
extern char CircleButton9_Caption[];
extern char ButtonRound1_Caption[];
extern char Image31_Caption[];
extern char _1_Caption[];
extern char _2_Caption[];
extern char _3_Caption[];
extern char _4_Caption[];
extern char _5_Caption[];
extern char _6_Caption[];
extern char _7_Caption[];
extern char _8_Caption[];
extern char _9_Caption[];
extern char _0_Caption[];
extern char _Q_Caption[];
extern char _W_Caption[];
extern char _E_Caption[];
extern char _R_Caption[];
extern char _T_Caption[];
extern char _Y_Caption[];
extern char _U_Caption[];
extern char _I_Caption[];
extern char _O_Caption[];
extern char _P_Caption[];
extern char _A_Caption[];
extern char _S_Caption[];
extern char _D_Caption[];
extern char _F_Caption[];
extern char _G_Caption[];
extern char _H_Caption[];
extern char _J_Caption[];
extern char _K_Caption[];
extern char _L_Caption[];
extern char _Z_Caption[];
extern char _X_Caption[];
extern char _C_Caption[];
extern char _V_Caption[];
extern char _B_Caption[];
extern char _N_Caption[];
extern char _M_Caption[];
extern char Clear_Caption[];
extern char CAPS_Switch_Caption[];
extern char SPACE_Caption[];
extern char Password_box_Caption[];
extern char Label23_Caption[];
extern char Admin_box_Caption[];
extern char Label24_Caption[];
extern char Keyboard_label_Caption[];
extern char _DEL_Caption[];
extern char _Colon_Caption[];
extern char _Comma_Caption[];
extern char _Slash_Caption[];
extern char ENTER_Caption[];
extern char Home_b3_Caption[];
extern char Image32_Caption[];
extern char Ten_minutesUp_Caption[];
extern char Ten_minutesDwn_Caption[];
extern char Ten_minutes_Caption[];
extern char Unit_minutesUp_Caption[];
extern char Unit_minutesDwn_Caption[];
extern char Unit_minutes_Caption[];
extern char SetDateAndTime_Caption[];
extern char Year_word_Caption[];
extern char Month_Word_Caption[];
extern char Day_word_Caption[];
extern char Hour_word_Caption[];
extern char Min_word_Caption[];
extern char Day_unitUp_Caption[];
extern char Day_unitDwn_Caption[];
extern char Unit_hoursUp_Caption[];
extern char Unit_hoursDwn_Caption[];
extern char Unit_hours_Caption[];
extern char Day_unit_Caption[];
extern char OneDayUp_Caption[];
extern char OneDayDwn_Caption[];
extern char LineSlash_Caption[];
extern char TenDayUp_Caption[];
extern char TenDayDwn_Caption[];
extern char TenDay_Caption[];
extern char OneDay_Caption[];
extern char MonthDateUp_Caption[];
extern char MonthDateDwn_Caption[];
extern char MonthDate_Caption[];
extern char TenYearUp_Caption[];
extern char TenYearDwn_Caption[];
extern char OneYearUp_Caption[];
extern char OneYearDwn_Caption[];
extern char OneYear_Caption[];
extern char TenYear_Caption[];
extern char DayOfWeek_Caption[];
extern char Time_setting_label_Caption[];
extern char home_b4_Caption[];
extern char Back_b3_Caption[];
extern char Image45_Caption[];
extern char Error_label_Caption[];
extern char Error_message_Caption[];
extern char Text_error_Caption[];
extern char Label2_Caption[];
extern char Home_b5_Caption[];
extern char Back_b4_Caption[];
extern char Image23_Caption[];
extern char Password_label_Caption[];
extern char Admin_Set_Caption[];
extern char Admin_text_Caption[];
extern char Home_b6_Caption[];
extern char Back_b5_Caption[];
extern char Image38_Caption[];
extern char LP1_gauge_Caption[];
extern char HP1_gauge_Caption[];
extern char HP_arrow_Caption[];
extern char Gauge_label_Caption[];
extern char LP_arrow_Caption[];
extern char Image104_Caption[];
extern char Home_b7_Caption[];
extern char Next_b2_Caption[];
extern char CircleButton8_Caption[];
extern char Image81_Caption[];
extern char Image300_Caption[];
extern char System_setting_label_Caption[];
extern char sys_access_Caption[];
extern char Label138_Caption[];
extern char Label139_Caption[];
extern char Label142_Caption[];
extern char Label143_Caption[];
extern char Label144_Caption[];
extern char Label145_Caption[];
extern char Image90_Caption[];
extern char Image91_Caption[];
extern char system_delay_Caption[];
extern char system_limits_Caption[];
extern char Label238_Caption[];
extern char System_Set_Message_Caption[];
extern char Image85_Caption[];
extern char Image92_Caption[];
extern char Image88_Caption[];
extern char Image93_Caption[];
extern char system_history_Caption[];
extern char Image89_Caption[];
extern char Image83_Caption[];
extern char system_EEV_Caption[];
extern char system_pass_Caption[];
extern char system_mode_Caption[];
extern char system_graph_Caption[];
extern char system_microSD_Caption[];
extern char Home_b8_Caption[];
extern char Back_b30_Caption[];
extern char delay_bgd_Caption[];
extern char Image306_Caption[];
extern char Image307_Caption[];
extern char Image308_Caption[];
extern char Image309_Caption[];
extern char Image314_Caption[];
extern char Image313_Caption[];
extern char Image312_Caption[];
extern char Image344_Caption[];
extern char Image345_Caption[];
extern char Image346_Caption[];
extern char Image315_Caption[];
extern char Image347_Caption[];
extern char Image348_Caption[];
extern char Image311_Caption[];
extern char Image310_Caption[];
extern char Image316_Caption[];
extern char Image317_Caption[];
extern char Image349_Caption[];
extern char Box63_Caption[];
extern char Box64_Caption[];
extern char Box66_Caption[];
extern char Delay_Source_UP_Caption[];
extern char Delay_heat_pump_up_Caption[];
extern char Delay_reversing_UP_Caption[];
extern char Delay_trv_up_Caption[];
extern char Delay_DHW_valve_UP_Caption[];
extern char Delay_compressor_UP_Caption[];
extern char Delay_Source_SET_Caption[];
extern char Delay_heat_pump_SET_Caption[];
extern char Delay_reversing_SET_Caption[];
extern char Delay_EEV_SET_Caption[];
extern char Delay_DHW_valve_SET_Caption[];
extern char Delay_compressor_SET_Caption[];
extern char Delay_setting_label_Caption[];
extern char Home_b9_Caption[];
extern char Back_b6_Caption[];
extern char Delay_Source_DOWN_Caption[];
extern char Delay_heat_pump_DOWN_Caption[];
extern char Delay_reversing_DOWN_Caption[];
extern char Delay_trv_DOWN_Caption[];
extern char Delay_DHW_valve_DOWN_Caption[];
extern char Delay_compressor_DOWN_Caption[];
extern char Delay_Source_Caption[];
extern char Delay_heat_pump_Caption[];
extern char Delay_reversing_Caption[];
extern char Delay_EEV_Caption[];
extern char Delay_DHW_valve_Caption[];
extern char Delay_compressor_Caption[];
extern char Image171_Caption[];
extern char Home_b10_Caption[];
extern char Back_b7_Caption[];
extern char Next_b3_Caption[];
extern char Time_source1_Caption[];
extern char Time_heat1_Caption[];
extern char Time_Electric_Caption[];
extern char Time_reversing1_Caption[];
extern char Time_compressor1_Caption[];
extern char Time_furnance_Caption[];
extern char total_time_label_Caption[];
extern char CircleButton6_Caption[];
extern char Label6_Caption[];
extern char Image102_Caption[];
extern char Image200_Caption[];
extern char Image205_Caption[];
extern char Image206_Caption[];
extern char Image207_Caption[];
extern char Image208_Caption[];
extern char Image209_Caption[];
extern char Image218_Caption[];
extern char Image219_Caption[];
extern char Image220_Caption[];
extern char Image221_Caption[];
extern char Image222_Caption[];
extern char Image223_Caption[];
extern char Image246_Caption[];
extern char Image247_Caption[];
extern char Image248_Caption[];
extern char Image249_Caption[];
extern char Image250_Caption[];
extern char Image251_Caption[];
extern char Down_1__Caption[];
extern char Down_2__Caption[];
extern char Down_3__Caption[];
extern char Down_4__Caption[];
extern char Down_5__Caption[];
extern char Down_6__Caption[];
extern char Up_1__Caption[];
extern char Up_2__Caption[];
extern char Up_3__Caption[];
extern char Up_4__Caption[];
extern char Up_5__Caption[];
extern char Up_6__Caption[];
extern char Set_1__Caption[];
extern char Set_2__Caption[];
extern char Set_3__Caption[];
extern char Set_4__Caption[];
extern char Set_5__Caption[];
extern char Set_6__Caption[];
extern char Set_min_heating_HP_Caption[];
extern char Set_max_heating_HP_Caption[];
extern char Set_max_exhaust_Caption[];
extern char Set_min_source_temp_Caption[];
extern char Set_max_source_temp_Caption[];
extern char Set_min_delta_heat_Caption[];
extern char Home_b11_Caption[];
extern char Back_b8_Caption[];
extern char Next_b4_Caption[];
extern char Settings1_label_Caption[];
extern char CircleButton1_Caption[];
extern char Image3_Caption[];
extern char Image186_Caption[];
extern char Image257_Caption[];
extern char Image256_Caption[];
extern char Image255_Caption[];
extern char Image254_Caption[];
extern char Image253_Caption[];
extern char Image252_Caption[];
extern char Image224_Caption[];
extern char Image225_Caption[];
extern char Image226_Caption[];
extern char Image227_Caption[];
extern char Image228_Caption[];
extern char Image229_Caption[];
extern char Image215_Caption[];
extern char Image214_Caption[];
extern char Image213_Caption[];
extern char Image212_Caption[];
extern char Image211_Caption[];
extern char Image210_Caption[];
extern char Down_8__Caption[];
extern char Down_10__Caption[];
extern char Down_11__Caption[];
extern char Down_9__Caption[];
extern char Down_12__Caption[];
extern char Up_8__Caption[];
extern char Up_10__Caption[];
extern char Up_11__Caption[];
extern char Up_9__Caption[];
extern char Up_12__Caption[];
extern char Set_8__Caption[];
extern char Set_10__Caption[];
extern char Set_11__Caption[];
extern char Set_9__Caption[];
extern char Set_12__Caption[];
extern char Set_max_delta_heat_Caption[];
extern char Set_min_delta_DHW_Caption[];
extern char Set_min_delta_source_Caption[];
extern char Set_max_source_delta_Caption[];
extern char Set_max_delta_DHW_Caption[];
extern char Set_preset_time_electric_Caption[];
extern char Down_7__Caption[];
extern char Up_7__Caption[];
extern char Set_7__Caption[];
extern char Home_b12_Caption[];
extern char Back_b9_Caption[];
extern char Next_b5_Caption[];
extern char Settings2_label_Caption[];
extern char CircleButton2_Caption[];
extern char Image380_Caption[];
extern char Sensors2_label_Caption[];
extern char Label285_Caption[];
extern char Label286_Caption[];
extern char Label287_Caption[];
extern char Label288_Caption[];
extern char Label289_Caption[];
extern char Label290_Caption[];
extern char Label293_Caption[];
extern char Label294_Caption[];
extern char S_Brine_Inlet_1_Caption[];
extern char S_Brine_Outlet_1_Caption[];
extern char S_Heat_Inlet_1_Caption[];
extern char S_Heat_Outlet_1_Caption[];
extern char S_Compressor_1_Caption[];
extern char S_DHW_Caption[];
extern char S_Superheat_1_Caption[];
extern char S_Subcool_1_Caption[];
extern char Label297_Caption[];
extern char Label298_Caption[];
extern char Label299_Caption[];
extern char Label300_Caption[];
extern char Label301_Caption[];
extern char Label302_Caption[];
extern char Label303_Caption[];
extern char Label304_Caption[];
extern char Label305_Caption[];
extern char Label306_Caption[];
extern char Label309_Caption[];
extern char Label310_Caption[];
extern char Label315_Caption[];
extern char Label316_Caption[];
extern char Label317_Caption[];
extern char Label318_Caption[];
extern char Label319_Caption[];
extern char S_Source_Flow_1_Caption[];
extern char Label320_Caption[];
extern char S_Heat_Flow_1_Caption[];
extern char Label321_Caption[];
extern char Label322_Caption[];
extern char SS_tank_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];
extern char Label14_Caption[];
extern char S_condenser_1_Caption[];
extern char S_suction_1_Caption[];
extern char Label15_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char Label28_Caption[];
extern char Label31_Caption[];
extern char Label32_Caption[];
extern char Home_b13_Caption[];
extern char Back_b10_Caption[];
extern char CircleButton10_Caption[];
extern char S_Low_Pressure_1_Caption[];
extern char S_High_Pressure_1_Caption[];
extern char Label70_Caption[];
extern char Label72_Caption[];
extern char Next_b6_Caption[];
extern char Label27_Caption[];
extern char Label35_Caption[];
extern char Image192_Caption[];
extern char Image33_Caption[];
extern char Image34_Caption[];
extern char Image266_Caption[];
extern char Image265_Caption[];
extern char Image264_Caption[];
extern char Image243_Caption[];
extern char Image244_Caption[];
extern char Image245_Caption[];
extern char Image24_Caption[];
extern char Home_b14_Caption[];
extern char Next_b7_Caption[];
extern char Image236_Caption[];
extern char Image237_Caption[];
extern char Image238_Caption[];
extern char Image53_Caption[];
extern char Image86_Caption[];
extern char Image95_Caption[];
extern char Set_max_superheat_Caption[];
extern char Set_min_subcooling_Caption[];
extern char Set_max_subcooling_Caption[];
extern char Set_max_high_pressure_Caption[];
extern char Set_min_lhigh_pressure_Caption[];
extern char Seeting4_label_Caption[];
extern char CircleButton4_Caption[];
extern char Back_b11_Caption[];
extern char Label390_Caption[];
extern char Down_21__Caption[];
extern char Down_20__Caption[];
extern char Down_19__Caption[];
extern char Down_22__Caption[];
extern char Down_23__Caption[];
extern char Up_22__Caption[];
extern char Up_21__Caption[];
extern char Up_20__Caption[];
extern char Up_19__Caption[];
extern char Up_23__Caption[];
extern char Set_22__Caption[];
extern char Set_21__Caption[];
extern char Set_20__Caption[];
extern char Set_19__Caption[];
extern char Set_23__Caption[];
extern const char Image390_Caption[];
extern char Image1_Caption[];
extern char Image4_Caption[];
extern char Image98_Caption[];
extern char Image94_Caption[];
extern char Image68_Caption[];
extern char Image67_Caption[];
extern char Image66_Caption[];
extern char Image65_Caption[];
extern char Image64_Caption[];
extern char Image36_Caption[];
extern char Image35_Caption[];
extern char Image19_Caption[];
extern char Image9_Caption[];
extern char Image8_Caption[];
extern char D_Source_1_Caption[];
extern char D_Heating_1_Caption[];
extern char D_Reverse_1_Caption[];
extern char D_Compr_1_Caption[];
extern char D_DHW_Caption[];
extern char Device_label_Caption[];
extern char D_Electric_Caption[];
extern char D_GAZ_Caption[];
extern char D_Compr_2_Caption[];
extern char D_Source_2_Caption[];
extern char D_Heating_2_Caption[];
extern char D_Reverse_2_Caption[];
extern char D_Solar_Caption[];
extern char D_fan2_Caption[];
extern char D_fan1_Caption[];
extern char Pump1_Caption[];
extern char Pump2_Caption[];
extern char Revers1_Caption[];
extern char Compr_1_Caption[];
extern char Valve_1_Caption[];
extern char Label59_Caption[];
extern char Label62_Caption[];
extern char Label64_Caption[];
extern char Label65_Caption[];
extern char Label67_Caption[];
extern char Label68_Caption[];
extern char Home_b15_Caption[];
extern char Electricobject_TatDiagram_Caption[];
extern char Image37_Caption[];
extern char Box23_Caption[];
extern char Line1_Caption[];
extern char Line2_Caption[];
extern char Line3_Caption[];
extern char Line8_Caption[];
extern char Line9_Caption[];
extern char Line10_Caption[];
extern char Line11_Caption[];
extern char Line12_Caption[];
extern char graph1_pos_Caption[];
extern char Label83_Caption[];
extern char Label84_Caption[];
extern char Label85_Caption[];
extern char Label86_Caption[];
extern char Label87_Caption[];
extern char Label88_Caption[];
extern char Label89_Caption[];
extern char Label90_Caption[];
extern char Label91_Caption[];
extern char Label92_Caption[];
extern char Label93_Caption[];
extern char Line4_Caption[];
extern char Line5_Caption[];
extern char Line6_Caption[];
extern char Label47_Caption[];
extern char Label94_Caption[];
extern char Line7_Caption[];
extern char Image269_Caption[];
extern char GraphTimelabel_Caption[];
extern char Graph_Label_Caption[];
extern char graph_br1_in_Caption[];
extern char graph_br1_out_Caption[];
extern char graph_heat1_in_Caption[];
extern char graph_heat1_out_Caption[];
extern char Home_b16_Caption[];
extern char Next_b8_Caption[];
extern char Back_b12_Caption[];
extern char CircleButton11_Caption[];
extern char Label377_Caption[];
extern char Label378_Caption[];
extern char Label380_Caption[];
extern char Label381_Caption[];
extern char Label382_Caption[];
extern char Image69_Caption[];
extern char Image71_Caption[];
extern char Label42_Caption[];
extern char Image73_Caption[];
extern char Image74_Caption[];
extern char Image75_Caption[];
extern char Image76_Caption[];
extern char Image77_Caption[];
extern char Image79_Caption[];
extern char S_Brine_In_1_Caption[];
extern char S_Brine_Out_1_Caption[];
extern char S_Heat_Out_1_Caption[];
extern char S_Heat_In_1_Caption[];
extern char Sens_DHW_Caption[];
extern char S_tank_Caption[];
extern char S_ComprEx_1_Caption[];
extern char S_High_Press_1_Caption[];
extern char S_Low_Press_1_Caption[];
extern char S_SH_1_Caption[];
extern char Image78_Caption[];
extern char Image80_Caption[];
extern char flow_source_Caption[];
extern char flow_heat_Caption[];
extern char Image117_Caption[];
extern char Image118_Caption[];
extern char Image119_Caption[];
extern char Image120_Caption[];
extern char Image124_Caption[];
extern char Image126_Caption[];
extern char Image127_Caption[];
extern char Image131_Caption[];
extern char flow_sun_Caption[];
extern char draw_One_ground_back_Caption[];
extern char Image41_Caption[];
extern char Power_220V_Caption[];
extern char Label239_Caption[];
extern char Two_Compressors_Caption[];
extern char Reversing_Heat_OFF_Caption[];
extern char Flow_Source_sensor_OFF_Caption[];
extern char Flow_Source_Heat1_OFF_Caption[];
extern char Flow_Source_Heat2_OFF_Caption[];
extern char One_Compressors_Caption[];
extern char Reversing_ON_HEAT_Caption[];
extern char Flow_Source__Sensor_ON_Caption[];
extern char Flow_Source__Heat1_ON_Caption[];
extern char Flow_Source__Heat2_ON_Caption[];
extern char Power_380V_Caption[];
extern char Home_b17_Caption[];
extern char Next_b9_Caption[];
extern char Back_13_Caption[];
extern char CircleButton12_Caption[];
extern char Image43_Caption[];
extern char Image140_Caption[];
extern char Image150_Caption[];
extern char Image136_Caption[];
extern char Image137_Caption[];
extern char Image151_Caption[];
extern char Image191_Caption[];
extern char Image190_Caption[];
extern char Image148_Caption[];
extern char Image149_Caption[];
extern char Image189_Caption[];
extern char Image188_Caption[];
extern char Image143_Caption[];
extern char Label63_Caption[];
extern char Image152_Caption[];
extern char furnance_time_ON_Caption[];
extern char Furnance_start_temp_Down_Caption[];
extern char Furnance_off_down_Caption[];
extern char Furnance_time_down_Caption[];
extern char Furnance_start_temp_UP_Caption[];
extern char Furnance_HP_OFF_UP_Caption[];
extern char Furnance_off_up_Caption[];
extern char Furnance_time_up_Caption[];
extern char Furnance_HP_OFF_Dowm_Caption[];
extern char furnance_time_OFF_Caption[];
extern char furnance_Mode_on_Caption[];
extern char Box14_Caption[];
extern char Box15_Caption[];
extern char Home_b18_Caption[];
extern char Back_b14_Caption[];
extern char Furnance_temperature_ON_Caption[];
extern char heat_pump_OFF_Caption[];
extern char furnance_OFF_Caption[];
extern char furnance_Timer_Caption[];
extern char Furnance_off_save_Caption[];
extern char Furnance_HP_OFF_save_Caption[];
extern char Image107_Caption[];
extern char Box7_Caption[];
extern char Box8_Caption[];
extern char Box9_Caption[];
extern char Box10_Caption[];
extern char IPAddressLabel_Caption[];
extern char MaskLabel_Caption[];
extern char GATELabel_Caption[];
extern char DNSLabel_Caption[];
extern char LANSet_Caption[];
extern char SetGateWay_Caption[];
extern char SetDNS_Caption[];
extern char SetIPAddress_Caption[];
extern char SetMask_Caption[];
extern char LAN_Key_1_Caption[];
extern char LAN_Key_2_Caption[];
extern char LAN_Key_3_Caption[];
extern char LAN_Key_4_Caption[];
extern char LAN_Key_5_Caption[];
extern char LAN_Key_6_Caption[];
extern char LAN_Key_7_Caption[];
extern char LAN_Key_8_Caption[];
extern char LAN_Key_9_Caption[];
extern char LAN_Key_0_Caption[];
extern char Label40_Caption[];
extern char LAN_Key_Dot_Caption[];
extern char LAN_Key_Clear_Caption[];
extern char Home_b19_Caption[];
extern char Back_b15_Caption[];
extern char Image146_Caption[];
extern char Image109_Caption[];
extern char Image147_Caption[];
extern char Image153_Caption[];
extern char Label44_Caption[];
extern char Image114_Caption[];
extern char Image115_Caption[];
extern char Image116_Caption[];
extern char Image121_Caption[];
extern char Image122_Caption[];
extern char Image123_Caption[];
extern char Image128_Caption[];
extern char Image129_Caption[];
extern char Image130_Caption[];
extern char Image135_Caption[];
extern char Image138_Caption[];
extern char Set_DHW_HY_Caption[];
extern char Hyst_Heat_down_Caption[];
extern char Hyst_DHW_down_Caption[];
extern char Hyst_Heat_up_Caption[];
extern char Hyst_Cool_up_Caption[];
extern char Hyst_DHW_up_Caption[];
extern char Hyst_Cool_down_Caption[];
extern char Home_b20_Caption[];
extern char Back_b16_Caption[];
extern char Hysteresis_heating_Caption[];
extern char Hysteresis_cooling_Caption[];
extern char Hysteresis_DHW_Caption[];
extern char Image62_Caption[];
extern char Label69_Caption[];
extern char Image134_Caption[];
extern char HP2_gauge_Caption[];
extern char LP2_gauge_Caption[];
extern char HP2_arrow_Caption[];
extern char LP2_arrow_Caption[];
extern char Home_b22_Caption[];
extern char Back_b18_Caption[];
extern char CircleButton15_Caption[];
extern char Image142_Caption[];
extern char Module2_br_outlet_Caption[];
extern char Label81_Caption[];
extern char Module2_heat_inlet_Caption[];
extern char Module2_heat_outlet_Caption[];
extern char Module2_compressor_Caption[];
extern char Module2_SH_Caption[];
extern char Module2_SC_Caption[];
extern char S_Brine_Inlet_2_Caption[];
extern char S_Brine_Outlet_2_Caption[];
extern char S_Heat_Inlet_2_Caption[];
extern char S_Heat_Outlet_2_Caption[];
extern char S_Compressor_2_Caption[];
extern char S_Superheat_2_Caption[];
extern char S_Subcool_2_Caption[];
extern char Label100_Caption[];
extern char Label101_Caption[];
extern char Label102_Caption[];
extern char Label103_Caption[];
extern char Label105_Caption[];
extern char Label106_Caption[];
extern char Label107_Caption[];
extern char Label108_Caption[];
extern char Label109_Caption[];
extern char Label110_Caption[];
extern char Label111_Caption[];
extern char Label112_Caption[];
extern char Label113_Caption[];
extern char Label114_Caption[];
extern char Label115_Caption[];
extern char Label116_Caption[];
extern char Module2_br_flow_Caption[];
extern char S_Source_Flow_2_Caption[];
extern char Module2_heat_flow_Caption[];
extern char S_Heat_Flow_2_Caption[];
extern char Label119_Caption[];
extern char Label120_Caption[];
extern char Label128_Caption[];
extern char Label129_Caption[];
extern char Label76_Caption[];
extern char S_condenser_2_Caption[];
extern char S_suction_2_Caption[];
extern char Module2_cond_Caption[];
extern char Module2_suct_Caption[];
extern char ButtonRound14_Caption[];
extern char Home_b23_Caption[];
extern char CircleButton16_Caption[];
extern char S_Low_Pressure_2_Caption[];
extern char S_High_Pressure_2_Caption[];
extern char Label283_Caption[];
extern char Label284_Caption[];
extern char Label3_Caption[];
extern char Label26_Caption[];
extern char Image157_Caption[];
extern char Label80_Caption[];
extern char Mode_air_on_Caption[];
extern char Mode_ground_on_Caption[];
extern char Home_b24_Caption[];
extern char Back_20_Caption[];
extern char CircleButton13_Caption[];
extern char Image159_Caption[];
extern char Image273_Caption[];
extern char Image162_Caption[];
extern char Image176_Caption[];
extern char Image174_Caption[];
extern char Image166_Caption[];
extern char Image276_Caption[];
extern char Image175_Caption[];
extern char Image274_Caption[];
extern char Image267_Caption[];
extern char Image164_Caption[];
extern char Image270_Caption[];
extern char Image165_Caption[];
extern char Label82_Caption[];
extern char Image203_Caption[];
extern char Module1_br_inlet_Caption[];
extern char Module1_br_outlet_Caption[];
extern char Module1_heat_outlet_Caption[];
extern char Module1_heat_inlet_Caption[];
extern char TANK_Caption[];
extern char DHW_Caption[];
extern char Module1_exhaust_Caption[];
extern char Module1_superheat_Caption[];
extern char Module1_heat_flow_Caption[];
extern char Image181_Caption[];
extern char Image160_Caption[];
extern char Button7_Caption[];
extern char Button9_Caption[];
extern char Button10_Caption[];
extern char Button11_Caption[];
extern char Module2_exhaust_Caption[];
extern char Module2_superheat_Caption[];
extern char Module2_brine_flow_Caption[];
extern char Button15_Caption[];
extern char Image178_Caption[];
extern char Image183_Caption[];
extern char Image271_Caption[];
extern char Image272_Caption[];
extern char Image172_Caption[];
extern char Image182_Caption[];
extern char Image204_Caption[];
extern char Image180_Caption[];
extern char Image275_Caption[];
extern char Image202_Caption[];
extern char Label95_Caption[];
extern char Button13_Caption[];
extern char Button5_Caption[];
extern char Image278_Caption[];
extern char Label96_Caption[];
extern char Time2_reverse_Caption[];
extern char Time2_ground_pump_Caption[];
extern char Time2_heat_pump_Caption[];
extern char Time2_compressor_Caption[];
extern char Home_b25_Caption[];
extern char Time_solar_Caption[];
extern char CircleButton7_Caption[];
extern char Back_b21_Caption[];
extern char Label9_Caption[];
extern char Image289_Caption[];
extern char Image324_Caption[];
extern char Image290_Caption[];
extern char Image297_Caption[];
extern char Image296_Caption[];
extern char Image326_Caption[];
extern char Image327_Caption[];
extern char Image330_Caption[];
extern char Image329_Caption[];
extern char Image325_Caption[];
extern char Image291_Caption[];
extern char Label97_Caption[];
extern char Image303_Caption[];
extern char Label98_Caption[];
extern char Image301_Caption[];
extern char Image318_Caption[];
extern char Image320_Caption[];
extern char Image328_Caption[];
extern char Image331_Caption[];
extern char Image322_Caption[];
extern char Image321_Caption[];
extern char Image332_Caption[];
extern char Image323_Caption[];
extern char Image292_Caption[];
extern char Image293_Caption[];
extern char Image305_Caption[];
extern char Image319_Caption[];
extern char Button17_Caption[];
extern char Button18_Caption[];
extern char Button19_Caption[];
extern char Button20_Caption[];
extern char Button22_Caption[];
extern char Button23_Caption[];
extern char Button25_Caption[];
extern char Button28_Caption[];
extern char Button29_Caption[];
extern char Button30_Caption[];
extern char Button31_Caption[];
extern char Button33_Caption[];
extern char Button34_Caption[];
extern char Button16_Caption[];
extern char Image299_Caption[];
extern char Button6_Caption[];
extern char Image333_Caption[];
extern char Image336_Caption[];
extern char Image339_Caption[];
extern char Image338_Caption[];
extern char Image343_Caption[];
extern char Image342_Caption[];
extern char Image341_Caption[];
extern char Image352_Caption[];
extern char Image334_Caption[];
extern char Label99_Caption[];
extern char Image358_Caption[];
extern char Image360_Caption[];
extern char Image362_Caption[];
extern char Image365_Caption[];
extern char Image367_Caption[];
extern char Image368_Caption[];
extern char Image361_Caption[];
extern char Image340_Caption[];
extern char Image337_Caption[];
extern char Button14_Caption[];
extern char Button26_Caption[];
extern char Button27_Caption[];
extern char Button32_Caption[];
extern char Button35_Caption[];
extern char Button36_Caption[];
extern char Button37_Caption[];
extern char Button38_Caption[];
extern char Button39_Caption[];
extern char Button41_Caption[];
extern char Button42_Caption[];
extern char Button2_Caption[];
extern char Image374_Caption[];
extern char Box28_Caption[];
extern char Line13_Caption[];
extern char Line14_Caption[];
extern char Line15_Caption[];
extern char Line17_Caption[];
extern char Line18_Caption[];
extern char Line19_Caption[];
extern char Line20_Caption[];
extern char Line21_Caption[];
extern char Label121_Caption[];
extern char Label122_Caption[];
extern char Label125_Caption[];
extern char Label127_Caption[];
extern char Label130_Caption[];
extern char Label131_Caption[];
extern char Label132_Caption[];
extern char Label133_Caption[];
extern char Label134_Caption[];
extern char Label135_Caption[];
extern char Label136_Caption[];
extern char Line22_Caption[];
extern char Line23_Caption[];
extern char Line24_Caption[];
extern char Label137_Caption[];
extern char Label146_Caption[];
extern char Line25_Caption[];
extern char Image378_Caption[];
extern char Label151_Caption[];
extern char __Caption[];
extern char Home_b26_Caption[];
extern char Back_b22_Caption[];
extern char graph2_pos_Caption[];
extern char graph_br2_in_Caption[];
extern char graph_br2_out_Caption[];
extern char graph_heat2_in_Caption[];
extern char graph_heat2_out_Caption[];
extern char Label5_Caption[];
extern char Label8_Caption[];
extern char Label16_Caption[];
extern char Label19_Caption[];
extern char Label21_Caption[];
extern char CircleButton5_Caption[];
extern char Image133_Caption[];
extern char Image395_Caption[];
extern char Image393_Caption[];
extern char Image161_Caption[];
extern char Image295_Caption[];
extern char Image376_Caption[];
extern char Image391_Caption[];
extern char Image111_Caption[];
extern char Image402_Caption[];
extern char Image403_Caption[];
extern char Image405_Caption[];
extern char Image404_Caption[];
extern char Image406_Caption[];
extern char Image113_Caption[];
extern char Label162_Caption[];
extern char Home_b27_Caption[];
extern char Back_b23_Caption[];
extern char Image108_Caption[];
extern char Label126_Caption[];
extern char Home_b28_Caption[];
extern char Back_b24_Caption[];
extern char Energy_Volt_1_Caption[];
extern char Label251_Caption[];
extern char Label252_Caption[];
extern char S_Current_1_Caption[];
extern char Label253_Caption[];
extern char Energy_Volt_2_Caption[];
extern char Label254_Caption[];
extern char Label255_Caption[];
extern char S_Current_2_Caption[];
extern char Label256_Caption[];
extern char Energy_Volt_3_Caption[];
extern char Label257_Caption[];
extern char Label258_Caption[];
extern char S_Current_3_Caption[];
extern char Label259_Caption[];
extern char Energy_Power_1_Caption[];
extern char Label260_Caption[];
extern char Label261_Caption[];
extern char ButtonRound12_Caption[];
extern char Label400_Caption[];
extern char Label401_Caption[];
extern char Image82_Caption[];
extern char Image388_Caption[];
extern char Defrost_set4_Caption[];
extern char Image355_Caption[];
extern char Image198_Caption[];
extern char Image199_Caption[];
extern char Defrost_on_time_Caption[];
extern char Image377_Caption[];
extern char Image379_Caption[];
extern char Image382_Caption[];
extern char Image383_Caption[];
extern char Image381_Caption[];
extern char Image384_Caption[];
extern char Defrost_off_time_Caption[];
extern char Defrost_on_temperature_Caption[];
extern char Defrost_off_temperature_Caption[];
extern char Home_b29_Caption[];
extern char Back_b25_Caption[];
extern char Defrost_minus1_Caption[];
extern char Defrost_minus2_Caption[];
extern char Defrost_minus3_Caption[];
extern char Defrost_plus1_Caption[];
extern char Defrost_plus2_Caption[];
extern char Defrost_plus3_Caption[];
extern char Defrost_set1_Caption[];
extern char Defrost_set2_Caption[];
extern char Defrost_set3_Caption[];
extern char Image386_Caption[];
extern char Image387_Caption[];
extern char Defrost_plus4_Caption[];
extern char Defrost_minus4_Caption[];
extern char Defrost_on_humidity_Caption[];
extern char Image47_Caption[];
extern char Image70_Caption[];
extern char Image103_Caption[];
extern char Label51_Caption[];
extern char humidity_down_Caption[];
extern char humidity_up_Caption[];
extern char humidity_set_Caption[];
extern char Image63_Caption[];
extern char Home_b30_Caption[];
extern char BoxRound1_Caption[];
extern char Back_b26_Caption[];
extern char Label50_Caption[];
extern char Image21_Caption[];
extern char Image22_Caption[];
extern char Image29_Caption[];
extern char Image280_Caption[];
extern char Image99_Caption[];
extern char Image100_Caption[];
extern char Image281_Caption[];
extern char Home_b31_Caption[];
extern char Set_max_low_pressure_Caption[];
extern char Set_min_low_pressure_Caption[];
extern char Image12_Caption[];
extern char Image14_Caption[];
extern char Image17_Caption[];
extern char Image18_Caption[];
extern char Image282_Caption[];
extern char Image279_Caption[];
extern char Back_b27_Caption[];
extern char Label46_Caption[];
extern char CircleButton3_Caption[];
extern char Set_phase_off_Caption[];
extern char Set_voltage_off_Caption[];
extern char Set_voltage_on_Caption[];
extern char Set_phase_on_Caption[];
extern char Image5_Caption[];
extern char Image6_Caption[];
extern char Image46_Caption[];
extern char UP_26__Caption[];
extern char Set_26__Caption[];
extern char Set_eev_on_Caption[];
extern char Image7_Caption[];
extern char Image2_Caption[];
extern char Back_b28_Caption[];
extern char Home_b32_Caption[];
extern char Label7_Caption[];
extern char Image461_Caption[];
extern char Image469_Caption[];
extern char Image471_Caption[];
extern char Image472_Caption[];
extern char Image473_Caption[];
extern char Image470_Caption[];
extern char Image468_Caption[];
extern char Image482_Caption[];
extern char Image474_Caption[];
extern char Image478_Caption[];
extern char Image479_Caption[];
extern char Image475_Caption[];
extern char Image483_Caption[];
extern char Image484_Caption[];
extern char Image476_Caption[];
extern char Image480_Caption[];
extern char Image481_Caption[];
extern char Image477_Caption[];
extern char Image485_Caption[];
extern char Home_b33_Caption[];
extern char Back_b29_Caption[];
extern char Next_b10_Caption[];
extern char Down_15__Caption[];
extern char Down_16__Caption[];
extern char Down_17__Caption[];
extern char Down_18__Caption[];
extern char Up_15__Caption[];
extern char Up_16__Caption[];
extern char Up_17__Caption[];
extern char Up_18__Caption[];
extern char Set_15__Caption[];
extern char Set_16__Caption[];
extern char Set_17__Caption[];
extern char Set_18__Caption[];
extern char Set_14__Caption[];
extern char Set_13__Caption[];
extern char Up_14__Caption[];
extern char Up_13__Caption[];
extern char Down_14__Caption[];
extern char Down_13__Caption[];
extern char Set_Furnance_one_preset_Caption[];
extern char Set_solar_max_Caption[];
extern char Set_max_electric_Caption[];
extern char Set_max_furnance_Caption[];
extern char Set_electric_preset_Caption[];
extern char Set_min_superheat_Caption[];
extern char Label341_Caption[];
extern char CircleButton17_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCImage(TCImage *ACimage);
void DrawCircle(TCircle *ACircle);
void DrawCircleButton(TCircleButton *ACircle_button);
void DrawBox(TBox *ABox);
void DrawRoundBox(TBox_Round *Around_box);
void DrawLine(TLine *Aline);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/users/user/desktop/alta_2_compressor_display/controller_code/mikroc pro for arm/controller_resources.h"
#line 1 "e:/mikroc/mikroc pro for arm/include/built_in.h"
#line 7 "C:/Users/User/Desktop/alta_2_compressor_display/Controller_Code/mikroC PRO for ARM/Controller_driver.c"
sbit Mmc_Chip_Select at GPIOD_ODR.B3;


char Ext_Data_Buffer[512];
unsigned long currentSector = -1, res_file_size;





unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_CS at GPIOF_ODR.B13;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_WR at GPIOF_ODR.B11;
sbit TFT_BLED at GPIOF_ODR.B10;




unsigned int Xcoord, Ycoord;
char PenDown;
typedef unsigned long TPointer;
TPointer PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton *local_button;
TButton *exec_button;
int button_order;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TCImage *local_cimage;
TCImage *exec_cimage;
int cimage_order;
TCircle *local_circle;
TCircle *exec_circle;
int circle_order;
TCircleButton *local_circle_button;
TCircleButton *exec_circle_button;
int circle_button_order;
TBox *local_box;
TBox *exec_box;
int box_order;
TBox_Round *local_round_box;
TBox_Round *exec_round_box;
int box_round_order;
TProgressBar *local_progress_bar;
TProgressBar *exec_progress_bar;
int progress_bar_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
 unsigned int temp;
 temp = GPIOE_ODR;
 temp &= 0x00FF;
 GPIOE_ODR = temp | (_hi << 8);
 temp = GPIOG_ODR;
 temp &= 0xFF00;
 GPIOG_ODR = temp | _lo;
}

void Set_Index(unsigned short index) {
 TFT_RS = 0;
 Write_to_Data_Lines(0, index);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
 TFT_RS = 1;
 Write_to_Data_Lines(0, cmd);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
 TFT_RS = 1;
 Write_to_Data_Lines( ((char *)&_data)[1] ,  ((char *)&_data)[0] );
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}


char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
unsigned long start_sector;
unsigned int fpos;

 start_sector = Mmc_Get_File_Write_Sector() + offset/512;
 fpos = (unsigned long)offset%512;

 if(start_sector == currentSector+1) {
 Mmc_Multi_Read_Sector(Ext_Data_Buffer);
 currentSector = start_sector;
 } else if (start_sector != currentSector) {
 if(currentSector != -1)
 Mmc_Multi_Read_Stop();
 Mmc_Multi_Read_Start(start_sector);
 Mmc_Multi_Read_Sector(Ext_Data_Buffer);
 currentSector = start_sector;
 }

 if(count>512-fpos)
 *num = 512-fpos;
 else
 *num = count;

 return Ext_Data_Buffer+fpos;
}
static void InitializeTouchPanel() {
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963(480, 272);
 TFT_Set_Ext_Buffer(TFT_Get_Data);

 TFT_Set_DBC_SSD1963(255);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}



 TScreen* CurrentScreen;

 TScreen HOME;
 TBox Set_Heat_Box;
 TBox Set_Dhw_Box;
 TImage background;
 TBox_Round Heat_Windows;
 TBox HEAT_button_redraw;
 TBox DHW_button_redraw;
 TBox_Round DWN_Windows;
 TBox_Round Brine_Windows;
 TImage Image20;
 TBox_Round Wheater_Windows;
 TImage Image44;
 TImage Image61;
 TImage Main_ON;
 TImage Main_OFF;
 TButton_Round DHW_Seting;
char DHW_Seting_Caption[4] = "SET";

 TLabel Label53;
char Label53_Caption[2] = "°";

 TLabel Label38;
char Label38_Caption[2] = "C";

 TLabel Label39;
char Label39_Caption[2] = "°";

 TLabel Label4;
char Label4_Caption[2] = "C";

 TLabel Label20;
char Label20_Caption[2] = "°";

 TLine Brine_Line;
 TButton_Round Heat_Setting;
char Heat_Setting_Caption[4] = "SET";

 TCircle alarm_led;
 TCircle radio_led;
 TButton_Round bar_heating;
char bar_heating_Caption[8] = "HEATING";

 TButton_Round bar_DHW;
char bar_DHW_Caption[4] = "DHW";

 TCircle dhw_led;
 TCircle heat_led;
 TLine Line16;
 TLabel Label140;
char Label140_Caption[2] = "%";

 TLabel Label141;
char Label141_Caption[4] = "kPa";

 TButton_Round bar_weather;
char bar_weather_Caption[9] = "WEATHER ";

 TImage Weather_Icon;
 TButton_Round bar_brine;
char bar_brine_Caption[9] = "   BRINE";

 TImage Brine_Icon;
 TImage MainBut3;
 TImage MainBut4;
 TImage clock_icon;
 TImage microSD_icon;
 TImage radio_icon;
 TImage dhw_icon;
 TLabel Label25;
char Label25_Caption[2] = "C";

 TImage cool_icon;
 TImage Image28;
 TLabel DateTime;
char DateTime_Caption[15] = "12:23 15 Jan";

 TLabel dhw_celc;
char dhw_celc_Caption[2] = "C";

 TLabel dhw_point;
char dhw_point_Caption[2] = "°";

 TLabel heat_point;
char heat_point_Caption[2] = "°";

 TLabel heat_celc;
char heat_celc_Caption[2] = "C";

 TLabel TEMP_Setting_value;
char TEMP_Setting_value_Caption[3] = "47";

 TLabel DHW_Setting_value;
char DHW_Setting_value_Caption[3] = "47";

 TImage WiFi_on_icon;
 TImage Image163;
 TImage Image167;
 TImage Image168;
 TImage Image169;
 TImage Image26;
 TImage Image170;
 TButton_Round DHW_UP;
char DHW_UP_Caption[2] = "+";

 TButton_Round DHW_DOWN;
char DHW_DOWN_Caption[2] = "-";

 TButton_Round HEAT_Down;
char HEAT_Down_Caption[2] = "-";

 TButton_Round HEAT_UP;
char HEAT_UP_Caption[2] = "+";

 TButton_Round ON_OFF_Heat_Cool;
char ON_OFF_Heat_Cool_Caption[4] = "OFF";

 TButton_Round ON_OFF_DHW;
char ON_OFF_DHW_Caption[4] = "OFF";

 TImage Image25;
 TImage Image40;
 TImage Image87;
 TImage heat_icon;
 TImage MainBut1;
 TImage MainBut2;
 TImage MainBut5;
 TBox_Round heatBox;
 TLabel heat_temp_main;
char heat_temp_main_Caption[3] = "00";

 TBox_Round BoxRound2;
 TLabel dhw_temp_main;
char dhw_temp_main_Caption[3] = "00";

 TBox_Round BoxRound3;
 TLabel sourse_temp_input_main;
char sourse_temp_input_main_Caption[3] = "00";

 TBox_Round BoxRound4;
 TLabel sourse_temp_output_main;
char sourse_temp_output_main_Caption[3] = "00";

 TBox_Round BoxRound5;
 TLabel weather_temp_main;
char weather_temp_main_Caption[3] = "00";

 TBox_Round BoxRound6;
 TLabel humedity_main;
char humedity_main_Caption[3] = "69";

 TBox_Round BoxRound7;
 TLabel prassure_main;
char prassure_main_Caption[5] = "0777";

 TBox_Round Messages_Box;
 TLabel Messages_Label;
char Messages_Label_Caption[11] = "SYSTEM_OFF";

 TButton_Round * const code Screen1_Buttons_Round[12]=
 {
 &DHW_Seting,
 &Heat_Setting,
 &bar_heating,
 &bar_DHW,
 &bar_weather,
 &bar_brine,
 &DHW_UP,
 &DHW_DOWN,
 &HEAT_Down,
 &HEAT_UP,
 &ON_OFF_Heat_Cool,
 &ON_OFF_DHW
 };
 TLabel * const code Screen1_Labels[23]=
 {
 &Label53,
 &Label38,
 &Label39,
 &Label4,
 &Label20,
 &Label140,
 &Label141,
 &Label25,
 &DateTime,
 &dhw_celc,
 &dhw_point,
 &heat_point,
 &heat_celc,
 &TEMP_Setting_value,
 &DHW_Setting_value,
 &heat_temp_main,
 &dhw_temp_main,
 &sourse_temp_input_main,
 &sourse_temp_output_main,
 &weather_temp_main,
 &humedity_main,
 &prassure_main,
 &Messages_Label
 };
 TImage * const code Screen1_Images[30]=
 {
 &background,
 &Image20,
 &Image44,
 &Image61,
 &Main_ON,
 &Main_OFF,
 &Weather_Icon,
 &Brine_Icon,
 &MainBut3,
 &MainBut4,
 &clock_icon,
 &microSD_icon,
 &radio_icon,
 &dhw_icon,
 &cool_icon,
 &Image28,
 &WiFi_on_icon,
 &Image163,
 &Image167,
 &Image168,
 &Image169,
 &Image26,
 &Image170,
 &Image25,
 &Image40,
 &Image87,
 &heat_icon,
 &MainBut1,
 &MainBut2,
 &MainBut5
 };
 TCircle * const code Screen1_Circles[4]=
 {
 &alarm_led,
 &radio_led,
 &dhw_led,
 &heat_led
 };
 TBox * const code Screen1_Boxes[4]=
 {
 &Set_Heat_Box,
 &Set_Dhw_Box,
 &HEAT_button_redraw,
 &DHW_button_redraw
 };
 TBox_Round * const code Screen1_Boxes_Round[12]=
 {
 &Heat_Windows,
 &DWN_Windows,
 &Brine_Windows,
 &Wheater_Windows,
 &heatBox,
 &BoxRound2,
 &BoxRound3,
 &BoxRound4,
 &BoxRound5,
 &BoxRound6,
 &BoxRound7,
 &Messages_Box
 };
 TLine * const code Screen1_Lines[2]=
 {
 &Brine_Line,
 &Line16
 };

 TScreen USER_MENU;
 TImage Image30;
 TImage Image105;
 TImage Image60;
 TImage Image51;
 TImage Image50;
 TImage Image49;
 TImage Image48;
 TImage Image39;
 TImage Image52;
 TImage Image56;
 TImage Image54;
 TImage Image55;
 TLabel User_menu_label;
char User_menu_label_Caption[10] = "USER MENU";

 TLabel User_time_label;
char User_time_label_Caption[5] = "Time";

 TLabel User_c_label;
char User_c_label_Caption[2] = "C";

 TLabel User_lan_label;
char User_lan_label_Caption[9] = "Ethernet";

 TLabel User_errors_label;
char User_errors_label_Caption[7] = "Errors";

 TLabel User_timers_label;
char User_timers_label_Caption[7] = "Timers";

 TLabel User_events_label;
char User_events_label_Caption[7] = "Events";

 TLabel User_energy_label;
char User_energy_label_Caption[7] = "Energy";

 TLabel User_furnance_label;
char User_furnance_label_Caption[9] = "Furnance";

 TLabel User_defrost_label;
char User_defrost_label_Caption[8] = "Defrost";

 TLabel Label77;
char Label77_Caption[2] = "°";

 TImage user_set_time;
 TImage user_check_temperature;
 TImage user_set_LAN;
 TImage user_check_errors;
 TImage user_set_timers;
 TImage User_history_check;
 TImage user_check_energy;
 TImage admin_set_system;
 TImage user_check_graph;
 TImage Image57;
 TImage user_defrost;
 TButton_Round Home_b1;
char Home_b1_Caption[5] = "HOME";

 TImage user_hysterezis;
 TImage user_setting;
 TLabel User_operational_label;
char User_operational_label_Caption[9] = "Op. time";

 TLabel User_hysterezis_label;
char User_hysterezis_label_Caption[9] = "Settings";

 TLabel User_system_label;
char User_system_label_Caption[7] = "System";

 TButton_Round * const code Screen2_Buttons_Round[1]=
 {
 &Home_b1
 };
 TLabel * const code Screen2_Labels[14]=
 {
 &User_menu_label,
 &User_time_label,
 &User_c_label,
 &User_lan_label,
 &User_errors_label,
 &User_timers_label,
 &User_events_label,
 &User_energy_label,
 &User_furnance_label,
 &User_defrost_label,
 &Label77,
 &User_operational_label,
 &User_hysterezis_label,
 &User_system_label
 };
 TImage * const code Screen2_Images[25]=
 {
 &Image30,
 &Image105,
 &Image60,
 &Image51,
 &Image50,
 &Image49,
 &Image48,
 &Image39,
 &Image52,
 &Image56,
 &Image54,
 &Image55,
 &user_set_time,
 &user_check_temperature,
 &user_set_LAN,
 &user_check_errors,
 &user_set_timers,
 &User_history_check,
 &user_check_energy,
 &admin_set_system,
 &user_check_graph,
 &Image57,
 &user_defrost,
 &user_hysterezis,
 &user_setting
 };

 TScreen EEV;
 TImage Image27;
 TImage Image173;
 TButton_Round DEC_EEV1;
char DEC_EEV1_Caption[2] = "-";

 TButton_Round INC_EEV1;
char INC_EEV1_Caption[2] = "+";

 TProgressBar Red_bar;
char Red_bar_Caption[6] = "240";

 TLabel EEV1_set_step_label;
char EEV1_set_step_label_Caption[9] = "EEV Step";

 TLabel EEV1_label;
char EEV1_label_Caption[12] = "EEV SETTING";

 TButton_Round Home_b2;
char Home_b2_Caption[5] = "HOME";

 TButton_Round Back_b2;
char Back_b2_Caption[5] = "BACK";

 TButton_Round Next_b1;
char Next_b1_Caption[5] = "NEXT";

 TButton_Round EEV1_superheat;
char EEV1_superheat_Caption[3] = "";

 TButton_Round EEV1_value;
char EEV1_value_Caption[4] = "";

 TCircleButton CircleButton9;
char CircleButton9_Caption[2] = "1";

 TButton_Round ButtonRound1;
char ButtonRound1_Caption[4] = "SET";

 TButton_Round * const code Screen3_Buttons_Round[8]=
 {
 &DEC_EEV1,
 &INC_EEV1,
 &Home_b2,
 &Back_b2,
 &Next_b1,
 &EEV1_superheat,
 &EEV1_value,
 &ButtonRound1
 };
 TLabel * const code Screen3_Labels[2]=
 {
 &EEV1_set_step_label,
 &EEV1_label
 };
 TImage * const code Screen3_Images[2]=
 {
 &Image27,
 &Image173
 };
 TCircleButton * const code Screen3_CircleButtons[1]=
 {
 &CircleButton9
 };
 TProgressBar * const code Screen3_ProgressBars[1]=
 {
 &Red_bar
 };

 TScreen Keyboard;
 TImage Image31;
 TButton_Round _1;
char _1_Caption[2] = "1";

 TButton_Round _2;
char _2_Caption[2] = "2";

 TButton_Round _3;
char _3_Caption[2] = "3";

 TButton_Round _4;
char _4_Caption[2] = "4";

 TButton_Round _5;
char _5_Caption[2] = "5";

 TButton_Round _6;
char _6_Caption[2] = "6";

 TButton_Round _7;
char _7_Caption[2] = "7";

 TButton_Round _8;
char _8_Caption[2] = "8";

 TButton_Round _9;
char _9_Caption[2] = "9";

 TButton_Round _0;
char _0_Caption[2] = "0";

 TButton_Round _Q;
char _Q_Caption[2] = "Q";

 TButton_Round _W;
char _W_Caption[2] = "W";

 TButton_Round _E;
char _E_Caption[2] = "E";

 TButton_Round _R;
char _R_Caption[2] = "R";

 TButton_Round _T;
char _T_Caption[2] = "T";

 TButton_Round _Y;
char _Y_Caption[2] = "Y";

 TButton_Round _U;
char _U_Caption[2] = "U";

 TButton_Round _I;
char _I_Caption[2] = "I";

 TButton_Round _O;
char _O_Caption[2] = "O";

 TButton_Round _P;
char _P_Caption[2] = "P";

 TButton_Round _A;
char _A_Caption[2] = "A";

 TButton_Round _S;
char _S_Caption[2] = "S";

 TButton_Round _D;
char _D_Caption[2] = "D";

 TButton_Round _F;
char _F_Caption[2] = "F";

 TButton_Round _G;
char _G_Caption[2] = "G";

 TButton_Round _H;
char _H_Caption[2] = "H";

 TButton_Round _J;
char _J_Caption[2] = "J";

 TButton_Round _K;
char _K_Caption[2] = "K";

 TButton_Round _L;
char _L_Caption[2] = "L";

 TButton_Round _Z;
char _Z_Caption[2] = "Z";

 TButton_Round _X;
char _X_Caption[2] = "X";

 TButton_Round _C;
char _C_Caption[2] = "C";

 TButton_Round _V;
char _V_Caption[2] = "V";

 TButton_Round _B;
char _B_Caption[2] = "B";

 TButton_Round _N;
char _N_Caption[2] = "N";

 TButton_Round _M;
char _M_Caption[2] = "M";

 TButton_Round Clear;
char Clear_Caption[3] = "<<";

 TButton_Round CAPS_Switch;
char CAPS_Switch_Caption[8] = "CAPS ON";

 TButton_Round SPACE;
char SPACE_Caption[1] = "";

 TBox Password_box;
 TLabel Label23;
char Label23_Caption[11] = " ";

 TBox Admin_box;
 TLabel Label24;
char Label24_Caption[21] = "ADMIN PASSWORD";

 TLabel Keyboard_label;
char Keyboard_label_Caption[11] = "KEYBOARD";

 TButton_Round _DEL;
char _DEL_Caption[4] = "DEL";

 TButton_Round _Colon;
char _Colon_Caption[2] = ":";

 TButton_Round _Comma;
char _Comma_Caption[2] = ",";

 TButton_Round _Slash;
char _Slash_Caption[2] = "/";

 TButton_Round ENTER;
char ENTER_Caption[6] = "ENTER";

 TButton_Round Home_b3;
char Home_b3_Caption[5] = "HOME";

 TButton_Round * const code Screen4_Buttons_Round[45]=
 {
 &_1,
 &_2,
 &_3,
 &_4,
 &_5,
 &_6,
 &_7,
 &_8,
 &_9,
 &_0,
 &_Q,
 &_W,
 &_E,
 &_R,
 &_T,
 &_Y,
 &_U,
 &_I,
 &_O,
 &_P,
 &_A,
 &_S,
 &_D,
 &_F,
 &_G,
 &_H,
 &_J,
 &_K,
 &_L,
 &_Z,
 &_X,
 &_C,
 &_V,
 &_B,
 &_N,
 &_M,
 &Clear,
 &CAPS_Switch,
 &SPACE,
 &_DEL,
 &_Colon,
 &_Comma,
 &_Slash,
 &ENTER,
 &Home_b3
 };
 TLabel * const code Screen4_Labels[3]=
 {
 &Label23,
 &Label24,
 &Keyboard_label
 };
 TImage * const code Screen4_Images[1]=
 {
 &Image31
 };
 TBox * const code Screen4_Boxes[2]=
 {
 &Password_box,
 &Admin_box
 };

 TScreen SetRTC;
 TImage Image32;
 TButton Ten_minutesUp;
char Ten_minutesUp_Caption[1] = "";

 TButton Ten_minutesDwn;
char Ten_minutesDwn_Caption[1] = "";

 TLabel Ten_minutes;
char Ten_minutes_Caption[5] = "1";

 TButton Unit_minutesUp;
char Unit_minutesUp_Caption[1] = "";

 TButton Unit_minutesDwn;
char Unit_minutesDwn_Caption[1] = "";

 TLabel Unit_minutes;
char Unit_minutes_Caption[5] = "1";

 TButton SetDateAndTime;
char SetDateAndTime_Caption[4] = "SET";

 TLabel Year_word;
char Year_word_Caption[5] = "YEAR";

 TLabel Month_Word;
char Month_Word_Caption[6] = "MONTH";

 TLabel Day_word;
char Day_word_Caption[4] = "DAY";

 TLabel Hour_word;
char Hour_word_Caption[5] = "HOUR";

 TLabel Min_word;
char Min_word_Caption[4] = "MIN";

 TButton Day_unitUp;
char Day_unitUp_Caption[1] = "";

 TButton Day_unitDwn;
char Day_unitDwn_Caption[1] = "";

 TButton Unit_hoursUp;
char Unit_hoursUp_Caption[1] = "";

 TButton Unit_hoursDwn;
char Unit_hoursDwn_Caption[1] = "";

 TLabel Unit_hours;
char Unit_hours_Caption[5] = "3";

 TLabel Day_unit;
char Day_unit_Caption[5] = "1";

 TButton OneDayUp;
char OneDayUp_Caption[1] = "";

 TButton OneDayDwn;
char OneDayDwn_Caption[1] = "";

 TLine LineSlash;
 TButton TenDayUp;
char TenDayUp_Caption[1] = "";

 TButton TenDayDwn;
char TenDayDwn_Caption[1] = "";

 TLabel TenDay;
char TenDay_Caption[5] = "1";

 TLabel OneDay;
char OneDay_Caption[5] = "5";

 TButton MonthDateUp;
char MonthDateUp_Caption[1] = "";

 TButton MonthDateDwn;
char MonthDateDwn_Caption[1] = "";

 TLabel MonthDate;
char MonthDate_Caption[5] = "JAN";

 TButton TenYearUp;
char TenYearUp_Caption[1] = "";

 TButton TenYearDwn;
char TenYearDwn_Caption[1] = "";

 TButton OneYearUp;
char OneYearUp_Caption[1] = "";

 TButton OneYearDwn;
char OneYearDwn_Caption[1] = "";

 TLabel OneYear;
char OneYear_Caption[5] = "1";

 TLabel TenYear;
char TenYear_Caption[5] = "1";

 TButton DayOfWeek;
char DayOfWeek_Caption[21] = "MONDAY";

 TLabel Time_setting_label;
char Time_setting_label_Caption[13] = "TIME SETTING";

 TButton_Round home_b4;
char home_b4_Caption[5] = "HOME";

 TButton_Round Back_b3;
char Back_b3_Caption[5] = "BACK";

 TButton * const code Screen5_Buttons[20]=
 {
 &Ten_minutesUp,
 &Ten_minutesDwn,
 &Unit_minutesUp,
 &Unit_minutesDwn,
 &SetDateAndTime,
 &Day_unitUp,
 &Day_unitDwn,
 &Unit_hoursUp,
 &Unit_hoursDwn,
 &OneDayUp,
 &OneDayDwn,
 &TenDayUp,
 &TenDayDwn,
 &MonthDateUp,
 &MonthDateDwn,
 &TenYearUp,
 &TenYearDwn,
 &OneYearUp,
 &OneYearDwn,
 &DayOfWeek
 };
 TButton_Round * const code Screen5_Buttons_Round[2]=
 {
 &home_b4,
 &Back_b3
 };
 TLabel * const code Screen5_Labels[15]=
 {
 &Ten_minutes,
 &Unit_minutes,
 &Year_word,
 &Month_Word,
 &Day_word,
 &Hour_word,
 &Min_word,
 &Unit_hours,
 &Day_unit,
 &TenDay,
 &OneDay,
 &MonthDate,
 &OneYear,
 &TenYear,
 &Time_setting_label
 };
 TImage * const code Screen5_Images[1]=
 {
 &Image32
 };
 TLine * const code Screen5_Lines[1]=
 {
 &LineSlash
 };

 TScreen ERRORS;
 TImage Image45;
 TLabel Error_label;
char Error_label_Caption[12] = "ERROR TABLE";

 TLabel Error_message;
char Error_message_Caption[67] = " ";

 TLabel Text_error;
char Text_error_Caption[7] = "ERROR:";

 TLabel Label2;
char Label2_Caption[41] = " ";

 TButton_Round Home_b5;
char Home_b5_Caption[5] = "HOME";

 TButton_Round Back_b4;
char Back_b4_Caption[5] = "BACK";

 TButton_Round * const code Screen6_Buttons_Round[2]=
 {
 &Home_b5,
 &Back_b4
 };
 TLabel * const code Screen6_Labels[4]=
 {
 &Error_label,
 &Error_message,
 &Text_error,
 &Label2
 };
 TImage * const code Screen6_Images[1]=
 {
 &Image45
 };

 TScreen PASSWORD;
 TImage Image23;
 TLabel Password_label;
char Password_label_Caption[9] = "PASSWORD";

 TButton_Round Admin_Set;
char Admin_Set_Caption[4] = "SET";

 TLabel Admin_text;
char Admin_text_Caption[16] = "ADMIN PASSWORD:";

 TButton_Round Home_b6;
char Home_b6_Caption[5] = "HOME";

 TButton_Round Back_b5;
char Back_b5_Caption[5] = "BACK";

 TButton_Round * const code Screen7_Buttons_Round[3]=
 {
 &Admin_Set,
 &Home_b6,
 &Back_b5
 };
 TLabel * const code Screen7_Labels[2]=
 {
 &Password_label,
 &Admin_text
 };
 TImage * const code Screen7_Images[1]=
 {
 &Image23
 };

 TScreen GAUGE1;
 TImage Image38;
 TImage LP1_gauge;
 TImage HP1_gauge;
 TLine HP_arrow;
 TLabel Gauge_label;
char Gauge_label_Caption[7] = "GAUGE ";

 TLine LP_arrow;
 TImage Image104;
 TButton_Round Home_b7;
char Home_b7_Caption[5] = "HOME";

 TButton_Round Next_b2;
char Next_b2_Caption[5] = "NEXT";

 TCircleButton CircleButton8;
char CircleButton8_Caption[2] = "1";

 TButton_Round * const code Screen8_Buttons_Round[2]=
 {
 &Home_b7,
 &Next_b2
 };
 TLabel * const code Screen8_Labels[1]=
 {
 &Gauge_label
 };
 TImage * const code Screen8_Images[4]=
 {
 &Image38,
 &LP1_gauge,
 &HP1_gauge,
 &Image104
 };
 TCircleButton * const code Screen8_CircleButtons[1]=
 {
 &CircleButton8
 };
 TLine * const code Screen8_Lines[2]=
 {
 &HP_arrow,
 &LP_arrow
 };

 TScreen SYSTEM_SET;
 TImage Image81;
 TImage Image300;
 TLabel System_setting_label;
char System_setting_label_Caption[18] = "SYSTEM SETTING";

 TLabel sys_access;
char sys_access_Caption[7] = "Access";

 TLabel Label138;
char Label138_Caption[9] = "Micro SD";

 TLabel Label139;
char Label139_Caption[4] = "EEV";

 TLabel Label142;
char Label142_Caption[7] = "Limits";

 TLabel Label143;
char Label143_Caption[6] = "Delay";

 TLabel Label144;
char Label144_Caption[8] = "History";

 TLabel Label145;
char Label145_Caption[6] = "Graph";

 TImage Image90;
 TImage Image91;
 TImage system_delay;
 TImage system_limits;
 TLabel Label238;
char Label238_Caption[5] = "Mode";

 TButton System_Set_Message;
char System_Set_Message_Caption[49] = "";

 TImage Image85;
 TImage Image92;
 TImage Image88;
 TImage Image93;
 TImage system_history;
 TImage Image89;
 TImage Image83;
 TImage system_EEV;
 TImage system_pass;
 TImage system_mode;
 TImage system_graph;
 TImage system_microSD;
 TButton_Round Home_b8;
char Home_b8_Caption[5] = "HOME";

 TButton_Round Back_b30;
char Back_b30_Caption[5] = "BACK";

 TButton * const code Screen9_Buttons[1]=
 {
 &System_Set_Message
 };
 TButton_Round * const code Screen9_Buttons_Round[2]=
 {
 &Home_b8,
 &Back_b30
 };
 TLabel * const code Screen9_Labels[9]=
 {
 &System_setting_label,
 &sys_access,
 &Label138,
 &Label139,
 &Label142,
 &Label143,
 &Label144,
 &Label145,
 &Label238
 };
 TImage * const code Screen9_Images[18]=
 {
 &Image81,
 &Image300,
 &Image90,
 &Image91,
 &system_delay,
 &system_limits,
 &Image85,
 &Image92,
 &Image88,
 &Image93,
 &system_history,
 &Image89,
 &Image83,
 &system_EEV,
 &system_pass,
 &system_mode,
 &system_graph,
 &system_microSD
 };

 TScreen DELAY_MENU;
 TImage delay_bgd;
 TImage Image306;
 TImage Image307;
 TImage Image308;
 TImage Image309;
 TImage Image314;
 TImage Image313;
 TImage Image312;
 TImage Image344;
 TImage Image345;
 TImage Image346;
 TImage Image315;
 TImage Image347;
 TImage Image348;
 TImage Image311;
 TImage Image310;
 TImage Image316;
 TImage Image317;
 TImage Image349;
 TBox Box63;
 TBox Box64;
 TBox Box66;
 TImage Delay_Source_UP;
 TImage Delay_heat_pump_up;
 TImage Delay_reversing_UP;
 TImage Delay_trv_up;
 TImage Delay_DHW_valve_UP;
 TImage Delay_compressor_UP;
 TImage Delay_Source_SET;
 TImage Delay_heat_pump_SET;
 TImage Delay_reversing_SET;
 TImage Delay_EEV_SET;
 TImage Delay_DHW_valve_SET;
 TImage Delay_compressor_SET;
 TLabel Delay_setting_label;
char Delay_setting_label_Caption[14] = "DELAY SETTING";

 TButton_Round Home_b9;
char Home_b9_Caption[5] = "HOME";

 TButton_Round Back_b6;
char Back_b6_Caption[5] = "BACK";

 TImage Delay_Source_DOWN;
 TImage Delay_heat_pump_DOWN;
 TImage Delay_reversing_DOWN;
 TImage Delay_trv_DOWN;
 TImage Delay_DHW_valve_DOWN;
 TImage Delay_compressor_DOWN;
 TButton_Round Delay_Source;
char Delay_Source_Caption[4] = "00";

 TButton_Round Delay_heat_pump;
char Delay_heat_pump_Caption[4] = "00";

 TButton_Round Delay_reversing;
char Delay_reversing_Caption[4] = "00";

 TButton_Round Delay_EEV;
char Delay_EEV_Caption[4] = "00";

 TButton_Round Delay_DHW_valve;
char Delay_DHW_valve_Caption[4] = "45";

 TButton_Round Delay_compressor;
char Delay_compressor_Caption[4] = "10";

 TButton_Round * const code Screen10_Buttons_Round[8]=
 {
 &Home_b9,
 &Back_b6,
 &Delay_Source,
 &Delay_heat_pump,
 &Delay_reversing,
 &Delay_EEV,
 &Delay_DHW_valve,
 &Delay_compressor
 };
 TLabel * const code Screen10_Labels[1]=
 {
 &Delay_setting_label
 };
 TImage * const code Screen10_Images[37]=
 {
 &delay_bgd,
 &Image306,
 &Image307,
 &Image308,
 &Image309,
 &Image314,
 &Image313,
 &Image312,
 &Image344,
 &Image345,
 &Image346,
 &Image315,
 &Image347,
 &Image348,
 &Image311,
 &Image310,
 &Image316,
 &Image317,
 &Image349,
 &Delay_Source_UP,
 &Delay_heat_pump_up,
 &Delay_reversing_UP,
 &Delay_trv_up,
 &Delay_DHW_valve_UP,
 &Delay_compressor_UP,
 &Delay_Source_SET,
 &Delay_heat_pump_SET,
 &Delay_reversing_SET,
 &Delay_EEV_SET,
 &Delay_DHW_valve_SET,
 &Delay_compressor_SET,
 &Delay_Source_DOWN,
 &Delay_heat_pump_DOWN,
 &Delay_reversing_DOWN,
 &Delay_trv_DOWN,
 &Delay_DHW_valve_DOWN,
 &Delay_compressor_DOWN
 };
 TBox * const code Screen10_Boxes[3]=
 {
 &Box63,
 &Box64,
 &Box66
 };

 TScreen SYSTEM_EVENTS;
 TImage Image171;
 TButton_Round Home_b10;
char Home_b10_Caption[5] = "HOME";

 TButton_Round Back_b7;
char Back_b7_Caption[5] = "BACK";

 TButton_Round Next_b3;
char Next_b3_Caption[5] = "NEXT";

 TButton_Round Time_source1;
char Time_source1_Caption[8] = "0";

 TButton_Round Time_heat1;
char Time_heat1_Caption[8] = "0";

 TButton_Round Time_Electric;
char Time_Electric_Caption[8] = "0";

 TButton_Round Time_reversing1;
char Time_reversing1_Caption[8] = "0";

 TButton_Round Time_compressor1;
char Time_compressor1_Caption[8] = "0";

 TButton_Round Time_furnance;
char Time_furnance_Caption[8] = "0";

 TLabel total_time_label;
char total_time_label_Caption[11] = "TOTAL TIME";

 TCircleButton CircleButton6;
char CircleButton6_Caption[2] = "1";

 TLabel Label6;
char Label6_Caption[6] = "Hours";

 TButton_Round * const code Screen11_Buttons_Round[9]=
 {
 &Home_b10,
 &Back_b7,
 &Next_b3,
 &Time_source1,
 &Time_heat1,
 &Time_Electric,
 &Time_reversing1,
 &Time_compressor1,
 &Time_furnance
 };
 TLabel * const code Screen11_Labels[2]=
 {
 &total_time_label,
 &Label6
 };
 TImage * const code Screen11_Images[1]=
 {
 &Image171
 };
 TCircleButton * const code Screen11_CircleButtons[1]=
 {
 &CircleButton6
 };

 TScreen LIMITS1;
 TImage Image102;
 TImage Image200;
 TImage Image205;
 TImage Image206;
 TImage Image207;
 TImage Image208;
 TImage Image209;
 TImage Image218;
 TImage Image219;
 TImage Image220;
 TImage Image221;
 TImage Image222;
 TImage Image223;
 TImage Image246;
 TImage Image247;
 TImage Image248;
 TImage Image249;
 TImage Image250;
 TImage Image251;
 TImage Down_1_;
 TImage Down_2_;
 TImage Down_3_;
 TImage Down_4_;
 TImage Down_5_;
 TImage Down_6_;
 TImage Up_1_;
 TImage Up_2_;
 TImage Up_3_;
 TImage Up_4_;
 TImage Up_5_;
 TImage Up_6_;
 TImage Set_1_;
 TImage Set_2_;
 TImage Set_3_;
 TImage Set_4_;
 TImage Set_5_;
 TImage Set_6_;
 TButton_Round Set_min_heating_HP;
char Set_min_heating_HP_Caption[3] = "25";

 TButton_Round Set_max_heating_HP;
char Set_max_heating_HP_Caption[3] = "60";

 TButton_Round Set_max_exhaust;
char Set_max_exhaust_Caption[4] = "098";

 TButton_Round Set_min_source_temp;
char Set_min_source_temp_Caption[4] = "-10";

 TButton_Round Set_max_source_temp;
char Set_max_source_temp_Caption[3] = "20";

 TButton_Round Set_min_delta_heat;
char Set_min_delta_heat_Caption[3] = "02";

 TButton_Round Home_b11;
char Home_b11_Caption[5] = "HOME";

 TButton_Round Back_b8;
char Back_b8_Caption[5] = "BACK";

 TButton_Round Next_b4;
char Next_b4_Caption[5] = "NEXT";

 TLabel Settings1_label;
char Settings1_label_Caption[9] = "SETTINGS";

 TCircleButton CircleButton1;
char CircleButton1_Caption[2] = "1";

 TButton_Round * const code Screen12_Buttons_Round[9]=
 {
 &Set_min_heating_HP,
 &Set_max_heating_HP,
 &Set_max_exhaust,
 &Set_min_source_temp,
 &Set_max_source_temp,
 &Set_min_delta_heat,
 &Home_b11,
 &Back_b8,
 &Next_b4
 };
 TLabel * const code Screen12_Labels[1]=
 {
 &Settings1_label
 };
 TImage * const code Screen12_Images[37]=
 {
 &Image102,
 &Image200,
 &Image205,
 &Image206,
 &Image207,
 &Image208,
 &Image209,
 &Image218,
 &Image219,
 &Image220,
 &Image221,
 &Image222,
 &Image223,
 &Image246,
 &Image247,
 &Image248,
 &Image249,
 &Image250,
 &Image251,
 &Down_1_,
 &Down_2_,
 &Down_3_,
 &Down_4_,
 &Down_5_,
 &Down_6_,
 &Up_1_,
 &Up_2_,
 &Up_3_,
 &Up_4_,
 &Up_5_,
 &Up_6_,
 &Set_1_,
 &Set_2_,
 &Set_3_,
 &Set_4_,
 &Set_5_,
 &Set_6_
 };
 TCircleButton * const code Screen12_CircleButtons[1]=
 {
 &CircleButton1
 };

 TScreen LIMITS2;
 TImage Image3;
 TImage Image186;
 TImage Image257;
 TImage Image256;
 TImage Image255;
 TImage Image254;
 TImage Image253;
 TImage Image252;
 TImage Image224;
 TImage Image225;
 TImage Image226;
 TImage Image227;
 TImage Image228;
 TImage Image229;
 TImage Image215;
 TImage Image214;
 TImage Image213;
 TImage Image212;
 TImage Image211;
 TImage Image210;
 TImage Down_8_;
 TImage Down_10_;
 TImage Down_11_;
 TImage Down_9_;
 TImage Down_12_;
 TImage Up_8_;
 TImage Up_10_;
 TImage Up_11_;
 TImage Up_9_;
 TImage Up_12_;
 TImage Set_8_;
 TImage Set_10_;
 TImage Set_11_;
 TImage Set_9_;
 TImage Set_12_;
 TButton_Round Set_max_delta_heat;
char Set_max_delta_heat_Caption[3] = "15";

 TButton_Round Set_min_delta_DHW;
char Set_min_delta_DHW_Caption[3] = "02";

 TButton_Round Set_min_delta_source;
char Set_min_delta_source_Caption[3] = "02";

 TButton_Round Set_max_source_delta;
char Set_max_source_delta_Caption[3] = "15";

 TButton_Round Set_max_delta_DHW;
char Set_max_delta_DHW_Caption[3] = "15";

 TButton_Round Set_preset_time_electric;
char Set_preset_time_electric_Caption[3] = "00";

 TImage Down_7_;
 TImage Up_7_;
 TImage Set_7_;
 TButton_Round Home_b12;
char Home_b12_Caption[5] = "HOME";

 TButton_Round Back_b9;
char Back_b9_Caption[5] = "BACK";

 TButton_Round Next_b5;
char Next_b5_Caption[5] = "NEXT";

 TLabel Settings2_label;
char Settings2_label_Caption[9] = "SETTINGS";

 TCircleButton CircleButton2;
char CircleButton2_Caption[2] = "2";

 TButton_Round * const code Screen13_Buttons_Round[9]=
 {
 &Set_max_delta_heat,
 &Set_min_delta_DHW,
 &Set_min_delta_source,
 &Set_max_source_delta,
 &Set_max_delta_DHW,
 &Set_preset_time_electric,
 &Home_b12,
 &Back_b9,
 &Next_b5
 };
 TLabel * const code Screen13_Labels[1]=
 {
 &Settings2_label
 };
 TImage * const code Screen13_Images[38]=
 {
 &Image3,
 &Image186,
 &Image257,
 &Image256,
 &Image255,
 &Image254,
 &Image253,
 &Image252,
 &Image224,
 &Image225,
 &Image226,
 &Image227,
 &Image228,
 &Image229,
 &Image215,
 &Image214,
 &Image213,
 &Image212,
 &Image211,
 &Image210,
 &Down_8_,
 &Down_10_,
 &Down_11_,
 &Down_9_,
 &Down_12_,
 &Up_8_,
 &Up_10_,
 &Up_11_,
 &Up_9_,
 &Up_12_,
 &Set_8_,
 &Set_10_,
 &Set_11_,
 &Set_9_,
 &Set_12_,
 &Down_7_,
 &Up_7_,
 &Set_7_
 };
 TCircleButton * const code Screen13_CircleButtons[1]=
 {
 &CircleButton2
 };

 TScreen SENSOR1;
 TImage Image380;
 TLabel Sensors2_label;
char Sensors2_label_Caption[6] = "VALUE";

 TLabel Label285;
char Label285_Caption[14] = "Brine  outlet";

 TLabel Label286;
char Label286_Caption[14] = "Brine  inlet ";

 TLabel Label287;
char Label287_Caption[16] = "Heating  inlet ";

 TLabel Label288;
char Label288_Caption[16] = "Heating  outlet";

 TLabel Label289;
char Label289_Caption[12] = "Compressor ";

 TLabel Label290;
char Label290_Caption[5] = "DHW ";

 TLabel Label293;
char Label293_Caption[13] = "Superheating";

 TLabel Label294;
char Label294_Caption[11] = "Subcooling";

 TButton_Round S_Brine_Inlet_1;
char S_Brine_Inlet_1_Caption[4] = "12";

 TButton_Round S_Brine_Outlet_1;
char S_Brine_Outlet_1_Caption[4] = "09";

 TButton_Round S_Heat_Inlet_1;
char S_Heat_Inlet_1_Caption[3] = "51";

 TButton_Round S_Heat_Outlet_1;
char S_Heat_Outlet_1_Caption[3] = "59";

 TButton_Round S_Compressor_1;
char S_Compressor_1_Caption[4] = "086";

 TButton_Round S_DHW;
char S_DHW_Caption[3] = "59";

 TButton_Round S_Superheat_1;
char S_Superheat_1_Caption[3] = "07";

 TButton_Round S_Subcool_1;
char S_Subcool_1_Caption[3] = "04";

 TLabel Label297;
char Label297_Caption[2] = "C";

 TLabel Label298;
char Label298_Caption[2] = "°";

 TLabel Label299;
char Label299_Caption[2] = "C";

 TLabel Label300;
char Label300_Caption[2] = "°";

 TLabel Label301;
char Label301_Caption[2] = "C";

 TLabel Label302;
char Label302_Caption[2] = "°";

 TLabel Label303;
char Label303_Caption[2] = "°";

 TLabel Label304;
char Label304_Caption[2] = "C";

 TLabel Label305;
char Label305_Caption[2] = "°";

 TLabel Label306;
char Label306_Caption[2] = "C";

 TLabel Label309;
char Label309_Caption[2] = "°";

 TLabel Label310;
char Label310_Caption[2] = "C";

 TLabel Label315;
char Label315_Caption[2] = "C";

 TLabel Label316;
char Label316_Caption[2] = "°";

 TLabel Label317;
char Label317_Caption[2] = "C";

 TLabel Label318;
char Label318_Caption[2] = "°";

 TLabel Label319;
char Label319_Caption[12] = "Source flow";

 TButton_Round S_Source_Flow_1;
char S_Source_Flow_1_Caption[6] = "00000";

 TLabel Label320;
char Label320_Caption[10] = "Heat flow";

 TButton_Round S_Heat_Flow_1;
char S_Heat_Flow_1_Caption[6] = "00000";

 TLabel Label321;
char Label321_Caption[4] = "l/h";

 TLabel Label322;
char Label322_Caption[4] = "l/h";

 TButton_Round SS_tank;
char SS_tank_Caption[3] = "59";

 TLabel Label12;
char Label12_Caption[5] = "Tank";

 TLabel Label13;
char Label13_Caption[2] = "C";

 TLabel Label14;
char Label14_Caption[2] = "°";

 TButton_Round S_condenser_1;
char S_condenser_1_Caption[3] = "44";

 TButton_Round S_suction_1;
char S_suction_1_Caption[3] = "14";

 TLabel Label15;
char Label15_Caption[2] = "°";

 TLabel Label17;
char Label17_Caption[2] = "°";

 TLabel Label18;
char Label18_Caption[2] = "C";

 TLabel Label28;
char Label28_Caption[2] = "C";

 TLabel Label31;
char Label31_Caption[15] = "Condenser Temp";

 TLabel Label32;
char Label32_Caption[13] = "Suction Temp";

 TButton_Round Home_b13;
char Home_b13_Caption[5] = "HOME";

 TButton_Round Back_b10;
char Back_b10_Caption[5] = "BACK";

 TCircleButton CircleButton10;
char CircleButton10_Caption[2] = "1";

 TButton_Round S_Low_Pressure_1;
char S_Low_Pressure_1_Caption[3] = "04";

 TButton_Round S_High_Pressure_1;
char S_High_Pressure_1_Caption[3] = "24";

 TLabel Label70;
char Label70_Caption[3] = "HP";

 TLabel Label72;
char Label72_Caption[3] = "LP";

 TButton_Round Next_b6;
char Next_b6_Caption[5] = "NEXT";

 TLabel Label27;
char Label27_Caption[4] = "bar";

 TLabel Label35;
char Label35_Caption[4] = "bar";

 TButton_Round * const code Screen14_Buttons_Round[18]=
 {
 &S_Brine_Inlet_1,
 &S_Brine_Outlet_1,
 &S_Heat_Inlet_1,
 &S_Heat_Outlet_1,
 &S_Compressor_1,
 &S_DHW,
 &S_Superheat_1,
 &S_Subcool_1,
 &S_Source_Flow_1,
 &S_Heat_Flow_1,
 &SS_tank,
 &S_condenser_1,
 &S_suction_1,
 &Home_b13,
 &Back_b10,
 &S_Low_Pressure_1,
 &S_High_Pressure_1,
 &Next_b6
 };
 TLabel * const code Screen14_Labels[42]=
 {
 &Sensors2_label,
 &Label285,
 &Label286,
 &Label287,
 &Label288,
 &Label289,
 &Label290,
 &Label293,
 &Label294,
 &Label297,
 &Label298,
 &Label299,
 &Label300,
 &Label301,
 &Label302,
 &Label303,
 &Label304,
 &Label305,
 &Label306,
 &Label309,
 &Label310,
 &Label315,
 &Label316,
 &Label317,
 &Label318,
 &Label319,
 &Label320,
 &Label321,
 &Label322,
 &Label12,
 &Label13,
 &Label14,
 &Label15,
 &Label17,
 &Label18,
 &Label28,
 &Label31,
 &Label32,
 &Label70,
 &Label72,
 &Label27,
 &Label35
 };
 TImage * const code Screen14_Images[1]=
 {
 &Image380
 };
 TCircleButton * const code Screen14_CircleButtons[1]=
 {
 &CircleButton10
 };

 TScreen LIMITS4;
 TImage Image192;
 TImage Image33;
 TImage Image34;
 TImage Image266;
 TImage Image265;
 TImage Image264;
 TImage Image243;
 TImage Image244;
 TImage Image245;
 TImage Image24;
 TButton_Round Home_b14;
char Home_b14_Caption[5] = "HOME";

 TButton_Round Next_b7;
char Next_b7_Caption[5] = "NEXT";

 TImage Image236;
 TImage Image237;
 TImage Image238;
 TImage Image53;
 TImage Image86;
 TImage Image95;
 TButton_Round Set_max_superheat;
char Set_max_superheat_Caption[3] = "15";

 TButton_Round Set_min_subcooling;
char Set_min_subcooling_Caption[3] = "02";

 TButton_Round Set_max_subcooling;
char Set_max_subcooling_Caption[3] = "15";

 TButton_Round Set_max_high_pressure;
char Set_max_high_pressure_Caption[3] = "30";

 TButton_Round Set_min_lhigh_pressure;
char Set_min_lhigh_pressure_Caption[3] = "24";

 TLabel Seeting4_label;
char Seeting4_label_Caption[9] = "SETTINGS";

 TCircleButton CircleButton4;
char CircleButton4_Caption[2] = "4";

 TButton_Round Back_b11;
char Back_b11_Caption[5] = "BACK";

 TLabel Label390;
char Label390_Caption[2] = "o";

 TImage Down_21_;
 TImage Down_20_;
 TImage Down_19_;
 TImage Down_22_;
 TImage Down_23_;
 TImage Up_22_;
 TImage Up_21_;
 TImage Up_20_;
 TImage Up_19_;
 TImage Up_23_;
 TImage Set_22_;
 TImage Set_21_;
 TImage Set_20_;
 TImage Set_19_;
 TImage Set_23_;
 TButton_Round * const code Screen15_Buttons_Round[8]=
 {
 &Home_b14,
 &Next_b7,
 &Set_max_superheat,
 &Set_min_subcooling,
 &Set_max_subcooling,
 &Set_max_high_pressure,
 &Set_min_lhigh_pressure,
 &Back_b11
 };
 TLabel * const code Screen15_Labels[2]=
 {
 &Seeting4_label,
 &Label390
 };
 TImage * const code Screen15_Images[31]=
 {
 &Image192,
 &Image33,
 &Image34,
 &Image266,
 &Image265,
 &Image264,
 &Image243,
 &Image244,
 &Image245,
 &Image24,
 &Image236,
 &Image237,
 &Image238,
 &Image53,
 &Image86,
 &Image95,
 &Down_21_,
 &Down_20_,
 &Down_19_,
 &Down_22_,
 &Down_23_,
 &Up_22_,
 &Up_21_,
 &Up_20_,
 &Up_19_,
 &Up_23_,
 &Set_22_,
 &Set_21_,
 &Set_20_,
 &Set_19_,
 &Set_23_
 };
 TCircleButton * const code Screen15_CircleButtons[1]=
 {
 &CircleButton4
 };

 TScreen DEVICES;
 TCImage Image390 =
 {
 &DEVICES ,
 0 ,
 0 ,
 0 ,
 480 ,
 272 ,
  0x0003CAAE  ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
 TImage Image1;
 TImage Image4;
 TImage Image98;
 TImage Image94;
 TImage Image68;
 TImage Image67;
 TImage Image66;
 TImage Image65;
 TImage Image64;
 TImage Image36;
 TImage Image35;
 TImage Image19;
 TImage Image9;
 TImage Image8;
 TImage D_Source_1;
 TImage D_Heating_1;
 TImage D_Reverse_1;
 TImage D_Compr_1;
 TImage D_DHW;
 TLabel Device_label;
char Device_label_Caption[8] = "DEVICES";

 TImage D_Electric;
 TImage D_GAZ;
 TImage D_Compr_2;
 TImage D_Source_2;
 TImage D_Heating_2;
 TImage D_Reverse_2;
 TImage D_Solar;
 TImage D_fan2;
 TImage D_fan1;
 TLabel Pump1;
char Pump1_Caption[7] = "SOURCE";

 TLabel Pump2;
char Pump2_Caption[5] = "HEAT";

 TLabel Revers1;
char Revers1_Caption[8] = "REVERSE";

 TLabel Compr_1;
char Compr_1_Caption[5] = "COMP";

 TLabel Valve_1;
char Valve_1_Caption[4] = "DHW";

 TLabel Label59;
char Label59_Caption[7] = "COMP 2";

 TLabel Label62;
char Label62_Caption[9] = "SOURCE 2";

 TLabel Label64;
char Label64_Caption[7] = "HEAT 2";

 TLabel Label65;
char Label65_Caption[4] = "GAZ";

 TLabel Label67;
char Label67_Caption[10] = "REVERSE 2";

 TLabel Label68;
char Label68_Caption[6] = "SOLAR";

 TButton_Round Home_b15;
char Home_b15_Caption[5] = "HOME";

 TLabel Electricobject_TatDiagram;
char Electricobject_TatDiagram_Caption[9] = "ELECTRIC";

 TButton_Round * const code Screen16_Buttons_Round[1]=
 {
 &Home_b15
 };
 TLabel * const code Screen16_Labels[13]=
 {
 &Device_label,
 &Pump1,
 &Pump2,
 &Revers1,
 &Compr_1,
 &Valve_1,
 &Label59,
 &Label62,
 &Label64,
 &Label65,
 &Label67,
 &Label68,
 &Electricobject_TatDiagram
 };
 TImage * const code Screen16_Images[28]=
 {
 &Image1,
 &Image4,
 &Image98,
 &Image94,
 &Image68,
 &Image67,
 &Image66,
 &Image65,
 &Image64,
 &Image36,
 &Image35,
 &Image19,
 &Image9,
 &Image8,
 &D_Source_1,
 &D_Heating_1,
 &D_Reverse_1,
 &D_Compr_1,
 &D_DHW,
 &D_Electric,
 &D_GAZ,
 &D_Compr_2,
 &D_Source_2,
 &D_Heating_2,
 &D_Reverse_2,
 &D_Solar,
 &D_fan2,
 &D_fan1
 };
 TCImage * const code Screen16_CImages[1]=
 {
 &Image390
 };

 TScreen Graph;
 TImage Image37;
 TBox Box23;
 TLine Line1;
 TLine Line2;
 TLine Line3;
 TLine Line8;
 TLine Line9;
 TLine Line10;
 TLine Line11;
 TLine Line12;
 TLabel graph1_pos;
char graph1_pos_Caption[4] = "123";

 TLabel Label83;
char Label83_Caption[3] = "40";

 TLabel Label84;
char Label84_Caption[3] = "10";

 TLabel Label85;
char Label85_Caption[3] = "20";

 TLabel Label86;
char Label86_Caption[3] = "30";

 TLabel Label87;
char Label87_Caption[2] = "0";

 TLabel Label88;
char Label88_Caption[2] = "1";

 TLabel Label89;
char Label89_Caption[2] = "2";

 TLabel Label90;
char Label90_Caption[2] = "3";

 TLabel Label91;
char Label91_Caption[2] = "4";

 TLabel Label92;
char Label92_Caption[2] = "5";

 TLabel Label93;
char Label93_Caption[4] = "Min";

 TLine Line4;
 TLine Line5;
 TLine Line6;
 TLabel Label47;
char Label47_Caption[3] = "50";

 TLabel Label94;
char Label94_Caption[3] = "60";

 TLine Line7;
 TImage Image269;
 TLabel GraphTimelabel;
char GraphTimelabel_Caption[9] = "23:12:15";

 TLabel Graph_Label;
char Graph_Label_Caption[6] = "GRAPH";

 TButton_Round graph_br1_in;
char graph_br1_in_Caption[4] = "+12";

 TButton_Round graph_br1_out;
char graph_br1_out_Caption[4] = "+09";

 TButton_Round graph_heat1_in;
char graph_heat1_in_Caption[3] = "45";

 TButton_Round graph_heat1_out;
char graph_heat1_out_Caption[3] = "52";

 TButton_Round Home_b16;
char Home_b16_Caption[5] = "HOME";

 TButton_Round Next_b8;
char Next_b8_Caption[5] = "NEXT";

 TButton_Round Back_b12;
char Back_b12_Caption[5] = "BACK";

 TCircleButton CircleButton11;
char CircleButton11_Caption[2] = "1";

 TLabel Label377;
char Label377_Caption[5] = "POS:";

 TLabel Label378;
char Label378_Caption[5] = "HtIn";

 TLabel Label380;
char Label380_Caption[6] = "HtOut";

 TLabel Label381;
char Label381_Caption[5] = "BrIn";

 TLabel Label382;
char Label382_Caption[6] = "BrOut";

 TButton_Round * const code Screen17_Buttons_Round[7]=
 {
 &graph_br1_in,
 &graph_br1_out,
 &graph_heat1_in,
 &graph_heat1_out,
 &Home_b16,
 &Next_b8,
 &Back_b12
 };
 TLabel * const code Screen17_Labels[21]=
 {
 &graph1_pos,
 &Label83,
 &Label84,
 &Label85,
 &Label86,
 &Label87,
 &Label88,
 &Label89,
 &Label90,
 &Label91,
 &Label92,
 &Label93,
 &Label47,
 &Label94,
 &GraphTimelabel,
 &Graph_Label,
 &Label377,
 &Label378,
 &Label380,
 &Label381,
 &Label382
 };
 TImage * const code Screen17_Images[2]=
 {
 &Image37,
 &Image269
 };
 TCircleButton * const code Screen17_CircleButtons[1]=
 {
 &CircleButton11
 };
 TBox * const code Screen17_Boxes[1]=
 {
 &Box23
 };
 TLine * const code Screen17_Lines[12]=
 {
 &Line1,
 &Line2,
 &Line3,
 &Line8,
 &Line9,
 &Line10,
 &Line11,
 &Line12,
 &Line4,
 &Line5,
 &Line6,
 &Line7
 };

 TScreen Schema1;
 TImage Image69;
 TImage Image71;
 TLabel Label42;
char Label42_Caption[8] = "DRAWING";

 TImage Image73;
 TImage Image74;
 TImage Image75;
 TImage Image76;
 TImage Image77;
 TImage Image79;
 TButton S_Brine_In_1;
char S_Brine_In_1_Caption[4] = "12";

 TButton S_Brine_Out_1;
char S_Brine_Out_1_Caption[4] = "09";

 TButton S_Heat_Out_1;
char S_Heat_Out_1_Caption[3] = "56";

 TButton S_Heat_In_1;
char S_Heat_In_1_Caption[3] = "51";

 TButton Sens_DHW;
char Sens_DHW_Caption[3] = "57";

 TButton S_tank;
char S_tank_Caption[3] = "55";

 TButton S_ComprEx_1;
char S_ComprEx_1_Caption[4] = "115";

 TButton S_High_Press_1;
char S_High_Press_1_Caption[3] = "07";

 TButton S_Low_Press_1;
char S_Low_Press_1_Caption[3] = "18";

 TButton S_SH_1;
char S_SH_1_Caption[3] = "07";

 TImage Image78;
 TImage Image80;
 TButton flow_source;
char flow_source_Caption[6] = "00000";

 TButton flow_heat;
char flow_heat_Caption[6] = "00000";

 TImage Image117;
 TImage Image118;
 TImage Image119;
 TImage Image120;
 TImage Image124;
 TImage Image126;
 TImage Image127;
 TImage Image131;
 TButton flow_sun;
char flow_sun_Caption[4] = "113";

 TButton draw_One_ground_back;
char draw_One_ground_back_Caption[1] = "";

 TButton * const code Screen18_Buttons[14]=
 {
 &S_Brine_In_1,
 &S_Brine_Out_1,
 &S_Heat_Out_1,
 &S_Heat_In_1,
 &Sens_DHW,
 &S_tank,
 &S_ComprEx_1,
 &S_High_Press_1,
 &S_Low_Press_1,
 &S_SH_1,
 &flow_source,
 &flow_heat,
 &flow_sun,
 &draw_One_ground_back
 };
 TLabel * const code Screen18_Labels[1]=
 {
 &Label42
 };
 TImage * const code Screen18_Images[18]=
 {
 &Image69,
 &Image71,
 &Image73,
 &Image74,
 &Image75,
 &Image76,
 &Image77,
 &Image79,
 &Image78,
 &Image80,
 &Image117,
 &Image118,
 &Image119,
 &Image120,
 &Image124,
 &Image126,
 &Image127,
 &Image131
 };

 TScreen MODE;
 TImage Image41;
 TImage Power_220V;
 TLabel Label239;
char Label239_Caption[5] = "MODE";

 TImage Two_Compressors;
 TImage Reversing_Heat_OFF;
 TImage Flow_Source_sensor_OFF;
 TImage Flow_Source_Heat1_OFF;
 TImage Flow_Source_Heat2_OFF;
 TImage One_Compressors;
 TImage Reversing_ON_HEAT;
 TImage Flow_Source__Sensor_ON;
 TImage Flow_Source__Heat1_ON;
 TImage Flow_Source__Heat2_ON;
 TImage Power_380V;
 TButton_Round Home_b17;
char Home_b17_Caption[5] = "HOME";

 TButton_Round Next_b9;
char Next_b9_Caption[5] = "NEXT";

 TButton_Round Back_13;
char Back_13_Caption[5] = "BACK";

 TCircleButton CircleButton12;
char CircleButton12_Caption[2] = "1";

 TButton_Round * const code Screen19_Buttons_Round[3]=
 {
 &Home_b17,
 &Next_b9,
 &Back_13
 };
 TLabel * const code Screen19_Labels[1]=
 {
 &Label239
 };
 TImage * const code Screen19_Images[13]=
 {
 &Image41,
 &Power_220V,
 &Two_Compressors,
 &Reversing_Heat_OFF,
 &Flow_Source_sensor_OFF,
 &Flow_Source_Heat1_OFF,
 &Flow_Source_Heat2_OFF,
 &One_Compressors,
 &Reversing_ON_HEAT,
 &Flow_Source__Sensor_ON,
 &Flow_Source__Heat1_ON,
 &Flow_Source__Heat2_ON,
 &Power_380V
 };
 TCircleButton * const code Screen19_CircleButtons[1]=
 {
 &CircleButton12
 };

 TScreen FURNANCE;
 TImage Image43;
 TImage Image140;
 TImage Image150;
 TImage Image136;
 TImage Image137;
 TImage Image151;
 TImage Image191;
 TImage Image190;
 TImage Image148;
 TImage Image149;
 TImage Image189;
 TImage Image188;
 TImage Image143;
 TLabel Label63;
char Label63_Caption[13] = "FURNANCE SET";

 TImage Image152;
 TImage furnance_time_ON;
 TImage Furnance_start_temp_Down;
 TImage Furnance_off_down;
 TImage Furnance_time_down;
 TImage Furnance_start_temp_UP;
 TImage Furnance_HP_OFF_UP;
 TImage Furnance_off_up;
 TImage Furnance_time_up;
 TImage Furnance_HP_OFF_Dowm;
 TImage furnance_time_OFF;
 TImage furnance_Mode_on;
 TBox Box14;
 TBox Box15;
 TButton_Round Home_b18;
char Home_b18_Caption[5] = "HOME";

 TButton_Round Back_b14;
char Back_b14_Caption[5] = "BACK";

 TButton_Round Furnance_temperature_ON;
char Furnance_temperature_ON_Caption[4] = "-30";

 TButton_Round heat_pump_OFF;
char heat_pump_OFF_Caption[3] = "45";

 TButton_Round furnance_OFF;
char furnance_OFF_Caption[3] = "65";

 TButton_Round furnance_Timer;
char furnance_Timer_Caption[4] = "000";

 TImage Furnance_off_save;
 TImage Furnance_HP_OFF_save;
 TButton_Round * const code Screen20_Buttons_Round[6]=
 {
 &Home_b18,
 &Back_b14,
 &Furnance_temperature_ON,
 &heat_pump_OFF,
 &furnance_OFF,
 &furnance_Timer
 };
 TLabel * const code Screen20_Labels[1]=
 {
 &Label63
 };
 TImage * const code Screen20_Images[27]=
 {
 &Image43,
 &Image140,
 &Image150,
 &Image136,
 &Image137,
 &Image151,
 &Image191,
 &Image190,
 &Image148,
 &Image149,
 &Image189,
 &Image188,
 &Image143,
 &Image152,
 &furnance_time_ON,
 &Furnance_start_temp_Down,
 &Furnance_off_down,
 &Furnance_time_down,
 &Furnance_start_temp_UP,
 &Furnance_HP_OFF_UP,
 &Furnance_off_up,
 &Furnance_time_up,
 &Furnance_HP_OFF_Dowm,
 &furnance_time_OFF,
 &furnance_Mode_on,
 &Furnance_off_save,
 &Furnance_HP_OFF_save
 };
 TBox * const code Screen20_Boxes[2]=
 {
 &Box14,
 &Box15
 };

 TScreen Ethernet;
 TImage Image107;
 TBox Box7;
 TBox Box8;
 TBox Box9;
 TBox Box10;
 TLabel IPAddressLabel;
char IPAddressLabel_Caption[16] = "192.168.001.004";

 TLabel MaskLabel;
char MaskLabel_Caption[16] = "255.255.255.001";

 TLabel GATELabel;
char GATELabel_Caption[16] = "192.168.001.001";

 TLabel DNSLabel;
char DNSLabel_Caption[16] = "202.123.123.004";

 TButton_Round LANSet;
char LANSet_Caption[6] = "APPLY";

 TButton_Round SetGateWay;
char SetGateWay_Caption[8] = "GATEWAY";

 TButton_Round SetDNS;
char SetDNS_Caption[4] = "DNS";

 TButton_Round SetIPAddress;
char SetIPAddress_Caption[11] = "IP ADDRESS";

 TButton_Round SetMask;
char SetMask_Caption[12] = "SUBNET MASK";

 TButton_Round LAN_Key_1;
char LAN_Key_1_Caption[2] = "1";

 TButton_Round LAN_Key_2;
char LAN_Key_2_Caption[2] = "2";

 TButton_Round LAN_Key_3;
char LAN_Key_3_Caption[2] = "3";

 TButton_Round LAN_Key_4;
char LAN_Key_4_Caption[2] = "4";

 TButton_Round LAN_Key_5;
char LAN_Key_5_Caption[2] = "5";

 TButton_Round LAN_Key_6;
char LAN_Key_6_Caption[2] = "6";

 TButton_Round LAN_Key_7;
char LAN_Key_7_Caption[2] = "7";

 TButton_Round LAN_Key_8;
char LAN_Key_8_Caption[2] = "8";

 TButton_Round LAN_Key_9;
char LAN_Key_9_Caption[2] = "9";

 TButton_Round LAN_Key_0;
char LAN_Key_0_Caption[2] = "0";

 TLabel Label40;
char Label40_Caption[9] = "ETHERNET";

 TButton_Round LAN_Key_Dot;
char LAN_Key_Dot_Caption[2] = ".";

 TButton_Round LAN_Key_Clear;
char LAN_Key_Clear_Caption[2] = "<";

 TButton_Round Home_b19;
char Home_b19_Caption[5] = "HOME";

 TButton_Round Back_b15;
char Back_b15_Caption[5] = "BACK";

 TButton_Round * const code Screen21_Buttons_Round[19]=
 {
 &LANSet,
 &SetGateWay,
 &SetDNS,
 &SetIPAddress,
 &SetMask,
 &LAN_Key_1,
 &LAN_Key_2,
 &LAN_Key_3,
 &LAN_Key_4,
 &LAN_Key_5,
 &LAN_Key_6,
 &LAN_Key_7,
 &LAN_Key_8,
 &LAN_Key_9,
 &LAN_Key_0,
 &LAN_Key_Dot,
 &LAN_Key_Clear,
 &Home_b19,
 &Back_b15
 };
 TLabel * const code Screen21_Labels[5]=
 {
 &IPAddressLabel,
 &MaskLabel,
 &GATELabel,
 &DNSLabel,
 &Label40
 };
 TImage * const code Screen21_Images[1]=
 {
 &Image107
 };
 TBox * const code Screen21_Boxes[4]=
 {
 &Box7,
 &Box8,
 &Box9,
 &Box10
 };

 TScreen SETTINGS;
 TImage Image146;
 TImage Image109;
 TImage Image147;
 TImage Image153;
 TLabel Label44;
char Label44_Caption[9] = "SETTINGS";

 TImage Image114;
 TImage Image115;
 TImage Image116;
 TImage Image121;
 TImage Image122;
 TImage Image123;
 TImage Image128;
 TImage Image129;
 TImage Image130;
 TImage Image135;
 TImage Image138;
 TImage Set_DHW_HY;
 TImage Hyst_Heat_down;
 TImage Hyst_DHW_down;
 TImage Hyst_Heat_up;
 TImage Hyst_Cool_up;
 TImage Hyst_DHW_up;
 TImage Hyst_Cool_down;
 TButton_Round Home_b20;
char Home_b20_Caption[5] = "HOME";

 TButton_Round Back_b16;
char Back_b16_Caption[5] = "BACK";

 TButton_Round Hysteresis_heating;
char Hysteresis_heating_Caption[3] = "05";

 TButton_Round Hysteresis_cooling;
char Hysteresis_cooling_Caption[3] = "05";

 TButton_Round Hysteresis_DHW;
char Hysteresis_DHW_Caption[3] = "05";

 TButton_Round * const code Screen22_Buttons_Round[5]=
 {
 &Home_b20,
 &Back_b16,
 &Hysteresis_heating,
 &Hysteresis_cooling,
 &Hysteresis_DHW
 };
 TLabel * const code Screen22_Labels[1]=
 {
 &Label44
 };
 TImage * const code Screen22_Images[22]=
 {
 &Image146,
 &Image109,
 &Image147,
 &Image153,
 &Image114,
 &Image115,
 &Image116,
 &Image121,
 &Image122,
 &Image123,
 &Image128,
 &Image129,
 &Image130,
 &Image135,
 &Image138,
 &Set_DHW_HY,
 &Hyst_Heat_down,
 &Hyst_DHW_down,
 &Hyst_Heat_up,
 &Hyst_Cool_up,
 &Hyst_DHW_up,
 &Hyst_Cool_down
 };

 TScreen Gauge2;
 TImage Image62;
 TLabel Label69;
char Label69_Caption[16] = "GAUGE  MODULE 2";

 TImage Image134;
 TImage HP2_gauge;
 TImage LP2_gauge;
 TLine HP2_arrow;
 TLine LP2_arrow;
 TButton_Round Home_b22;
char Home_b22_Caption[5] = "HOME";

 TButton_Round Back_b18;
char Back_b18_Caption[5] = "BACK";

 TCircleButton CircleButton15;
char CircleButton15_Caption[2] = "2";

 TButton_Round * const code Screen23_Buttons_Round[2]=
 {
 &Home_b22,
 &Back_b18
 };
 TLabel * const code Screen23_Labels[1]=
 {
 &Label69
 };
 TImage * const code Screen23_Images[4]=
 {
 &Image62,
 &Image134,
 &HP2_gauge,
 &LP2_gauge
 };
 TCircleButton * const code Screen23_CircleButtons[1]=
 {
 &CircleButton15
 };
 TLine * const code Screen23_Lines[2]=
 {
 &HP2_arrow,
 &LP2_arrow
 };

 TScreen Sensor2;
 TImage Image142;
 TLabel Module2_br_outlet;
char Module2_br_outlet_Caption[14] = "Brine  outlet";

 TLabel Label81;
char Label81_Caption[14] = "Brine  inlet ";

 TLabel Module2_heat_inlet;
char Module2_heat_inlet_Caption[16] = "Heating  inlet ";

 TLabel Module2_heat_outlet;
char Module2_heat_outlet_Caption[16] = "Heating  outlet";

 TLabel Module2_compressor;
char Module2_compressor_Caption[12] = "Compressor ";

 TLabel Module2_SH;
char Module2_SH_Caption[13] = "Superheating";

 TLabel Module2_SC;
char Module2_SC_Caption[11] = "Subcooling";

 TButton_Round S_Brine_Inlet_2;
char S_Brine_Inlet_2_Caption[4] = "+12";

 TButton_Round S_Brine_Outlet_2;
char S_Brine_Outlet_2_Caption[4] = "+09";

 TButton_Round S_Heat_Inlet_2;
char S_Heat_Inlet_2_Caption[3] = "45";

 TButton_Round S_Heat_Outlet_2;
char S_Heat_Outlet_2_Caption[3] = "52";

 TButton_Round S_Compressor_2;
char S_Compressor_2_Caption[4] = "078";

 TButton_Round S_Superheat_2;
char S_Superheat_2_Caption[3] = "07";

 TButton_Round S_Subcool_2;
char S_Subcool_2_Caption[3] = "04";

 TLabel Label100;
char Label100_Caption[2] = "C";

 TLabel Label101;
char Label101_Caption[2] = "°";

 TLabel Label102;
char Label102_Caption[2] = "C";

 TLabel Label103;
char Label103_Caption[2] = "°";

 TLabel Label105;
char Label105_Caption[2] = "C";

 TLabel Label106;
char Label106_Caption[2] = "°";

 TLabel Label107;
char Label107_Caption[2] = "°";

 TLabel Label108;
char Label108_Caption[2] = "C";

 TLabel Label109;
char Label109_Caption[2] = "°";

 TLabel Label110;
char Label110_Caption[2] = "C";

 TLabel Label111;
char Label111_Caption[2] = "°";

 TLabel Label112;
char Label112_Caption[2] = "C";

 TLabel Label113;
char Label113_Caption[2] = "C";

 TLabel Label114;
char Label114_Caption[2] = "°";

 TLabel Label115;
char Label115_Caption[2] = "C";

 TLabel Label116;
char Label116_Caption[2] = "°";

 TLabel Module2_br_flow;
char Module2_br_flow_Caption[12] = "Source flow";

 TButton_Round S_Source_Flow_2;
char S_Source_Flow_2_Caption[6] = "01456";

 TLabel Module2_heat_flow;
char Module2_heat_flow_Caption[10] = "Heat flow";

 TButton_Round S_Heat_Flow_2;
char S_Heat_Flow_2_Caption[6] = "02144";

 TLabel Label119;
char Label119_Caption[4] = "l/h";

 TLabel Label120;
char Label120_Caption[4] = "l/h";

 TLabel Label128;
char Label128_Caption[2] = "C";

 TLabel Label129;
char Label129_Caption[2] = "°";

 TLabel Label76;
char Label76_Caption[15] = "VALUE MODULE 2";

 TButton_Round S_condenser_2;
char S_condenser_2_Caption[3] = "41";

 TButton_Round S_suction_2;
char S_suction_2_Caption[3] = "21";

 TLabel Module2_cond;
char Module2_cond_Caption[15] = "Condenser Temp";

 TLabel Module2_suct;
char Module2_suct_Caption[13] = "Suction Temp";

 TButton_Round ButtonRound14;
char ButtonRound14_Caption[5] = "HOME";

 TButton_Round Home_b23;
char Home_b23_Caption[5] = "BACK";

 TCircleButton CircleButton16;
char CircleButton16_Caption[2] = "2";

 TButton_Round S_Low_Pressure_2;
char S_Low_Pressure_2_Caption[3] = "04";

 TButton_Round S_High_Pressure_2;
char S_High_Pressure_2_Caption[3] = "24";

 TLabel Label283;
char Label283_Caption[3] = "HP";

 TLabel Label284;
char Label284_Caption[3] = "LP";

 TLabel Label3;
char Label3_Caption[4] = "bar";

 TLabel Label26;
char Label26_Caption[4] = "bar";

 TButton_Round * const code Screen24_Buttons_Round[15]=
 {
 &S_Brine_Inlet_2,
 &S_Brine_Outlet_2,
 &S_Heat_Inlet_2,
 &S_Heat_Outlet_2,
 &S_Compressor_2,
 &S_Superheat_2,
 &S_Subcool_2,
 &S_Source_Flow_2,
 &S_Heat_Flow_2,
 &S_condenser_2,
 &S_suction_2,
 &ButtonRound14,
 &Home_b23,
 &S_Low_Pressure_2,
 &S_High_Pressure_2
 };
 TLabel * const code Screen24_Labels[36]=
 {
 &Module2_br_outlet,
 &Label81,
 &Module2_heat_inlet,
 &Module2_heat_outlet,
 &Module2_compressor,
 &Module2_SH,
 &Module2_SC,
 &Label100,
 &Label101,
 &Label102,
 &Label103,
 &Label105,
 &Label106,
 &Label107,
 &Label108,
 &Label109,
 &Label110,
 &Label111,
 &Label112,
 &Label113,
 &Label114,
 &Label115,
 &Label116,
 &Module2_br_flow,
 &Module2_heat_flow,
 &Label119,
 &Label120,
 &Label128,
 &Label129,
 &Label76,
 &Module2_cond,
 &Module2_suct,
 &Label283,
 &Label284,
 &Label3,
 &Label26
 };
 TImage * const code Screen24_Images[1]=
 {
 &Image142
 };
 TCircleButton * const code Screen24_CircleButtons[1]=
 {
 &CircleButton16
 };

 TScreen MODE2;
 TImage Image157;
 TLabel Label80;
char Label80_Caption[6] = "MODE ";

 TImage Mode_air_on;
 TImage Mode_ground_on;
 TButton_Round Home_b24;
char Home_b24_Caption[5] = "HOME";

 TButton_Round Back_20;
char Back_20_Caption[5] = "BACK";

 TCircleButton CircleButton13;
char CircleButton13_Caption[2] = "2";

 TButton_Round * const code Screen25_Buttons_Round[2]=
 {
 &Home_b24,
 &Back_20
 };
 TLabel * const code Screen25_Labels[1]=
 {
 &Label80
 };
 TImage * const code Screen25_Images[3]=
 {
 &Image157,
 &Mode_air_on,
 &Mode_ground_on
 };
 TCircleButton * const code Screen25_CircleButtons[1]=
 {
 &CircleButton13
 };

 TScreen Schema2;
 TImage Image159;
 TImage Image273;
 TImage Image162;
 TImage Image176;
 TImage Image174;
 TImage Image166;
 TImage Image276;
 TImage Image175;
 TImage Image274;
 TImage Image267;
 TImage Image164;
 TImage Image270;
 TImage Image165;
 TLabel Label82;
char Label82_Caption[8] = "DRAWING";

 TImage Image203;
 TButton Module1_br_inlet;
char Module1_br_inlet_Caption[4] = "12";

 TButton Module1_br_outlet;
char Module1_br_outlet_Caption[4] = "09";

 TButton Module1_heat_outlet;
char Module1_heat_outlet_Caption[3] = "56";

 TButton Module1_heat_inlet;
char Module1_heat_inlet_Caption[3] = "51";

 TButton TANK;
char TANK_Caption[3] = "57";

 TButton DHW;
char DHW_Caption[3] = "55";

 TButton Module1_exhaust;
char Module1_exhaust_Caption[4] = "115";

 TButton Module1_superheat;
char Module1_superheat_Caption[3] = "07";

 TButton Module1_heat_flow;
char Module1_heat_flow_Caption[6] = "02567";

 TImage Image181;
 TImage Image160;
 TButton Button7;
char Button7_Caption[4] = "12";

 TButton Button9;
char Button9_Caption[4] = "09";

 TButton Button10;
char Button10_Caption[3] = "56";

 TButton Button11;
char Button11_Caption[3] = "51";

 TButton Module2_exhaust;
char Module2_exhaust_Caption[4] = "115";

 TButton Module2_superheat;
char Module2_superheat_Caption[3] = "07";

 TButton Module2_brine_flow;
char Module2_brine_flow_Caption[6] = "03214";

 TButton Button15;
char Button15_Caption[5] = "2567";

 TImage Image178;
 TImage Image183;
 TImage Image271;
 TImage Image272;
 TImage Image172;
 TImage Image182;
 TImage Image204;
 TImage Image180;
 TImage Image275;
 TImage Image202;
 TLabel Label95;
char Label95_Caption[8] = "DRAWING";

 TButton Button13;
char Button13_Caption[4] = "113";

 TButton Button5;
char Button5_Caption[5] = "2567";

 TButton * const code Screen26_Buttons[19]=
 {
 &Module1_br_inlet,
 &Module1_br_outlet,
 &Module1_heat_outlet,
 &Module1_heat_inlet,
 &TANK,
 &DHW,
 &Module1_exhaust,
 &Module1_superheat,
 &Module1_heat_flow,
 &Button7,
 &Button9,
 &Button10,
 &Button11,
 &Module2_exhaust,
 &Module2_superheat,
 &Module2_brine_flow,
 &Button15,
 &Button13,
 &Button5
 };
 TLabel * const code Screen26_Labels[2]=
 {
 &Label82,
 &Label95
 };
 TImage * const code Screen26_Images[26]=
 {
 &Image159,
 &Image273,
 &Image162,
 &Image176,
 &Image174,
 &Image166,
 &Image276,
 &Image175,
 &Image274,
 &Image267,
 &Image164,
 &Image270,
 &Image165,
 &Image203,
 &Image181,
 &Image160,
 &Image178,
 &Image183,
 &Image271,
 &Image272,
 &Image172,
 &Image182,
 &Image204,
 &Image180,
 &Image275,
 &Image202
 };

 TScreen SYSTEM_EVENTS2;
 TImage Image278;
 TLabel Label96;
char Label96_Caption[10] = "MODULE  2";

 TButton_Round Time2_reverse;
char Time2_reverse_Caption[8] = "000000";

 TButton_Round Time2_ground_pump;
char Time2_ground_pump_Caption[8] = "000000";

 TButton_Round Time2_heat_pump;
char Time2_heat_pump_Caption[8] = "000000";

 TButton_Round Time2_compressor;
char Time2_compressor_Caption[8] = "000000";

 TButton_Round Home_b25;
char Home_b25_Caption[5] = "HOME";

 TButton_Round Time_solar;
char Time_solar_Caption[8] = "000000";

 TCircleButton CircleButton7;
char CircleButton7_Caption[2] = "2";

 TButton_Round Back_b21;
char Back_b21_Caption[5] = "BACK";

 TLabel Label9;
char Label9_Caption[6] = "Hours";

 TButton_Round * const code Screen27_Buttons_Round[7]=
 {
 &Time2_reverse,
 &Time2_ground_pump,
 &Time2_heat_pump,
 &Time2_compressor,
 &Home_b25,
 &Time_solar,
 &Back_b21
 };
 TLabel * const code Screen27_Labels[2]=
 {
 &Label96,
 &Label9
 };
 TImage * const code Screen27_Images[1]=
 {
 &Image278
 };
 TCircleButton * const code Screen27_CircleButtons[1]=
 {
 &CircleButton7
 };

 TScreen AIR_TWO;
 TImage Image289;
 TImage Image324;
 TImage Image290;
 TImage Image297;
 TImage Image296;
 TImage Image326;
 TImage Image327;
 TImage Image330;
 TImage Image329;
 TImage Image325;
 TImage Image291;
 TLabel Label97;
char Label97_Caption[8] = "DRAWING";

 TImage Image303;
 TLabel Label98;
char Label98_Caption[8] = "DRAWING";

 TImage Image301;
 TImage Image318;
 TImage Image320;
 TImage Image328;
 TImage Image331;
 TImage Image322;
 TImage Image321;
 TImage Image332;
 TImage Image323;
 TImage Image292;
 TImage Image293;
 TImage Image305;
 TImage Image319;
 TButton Button17;
char Button17_Caption[3] = "56";

 TButton Button18;
char Button18_Caption[3] = "51";

 TButton Button19;
char Button19_Caption[3] = "57";

 TButton Button20;
char Button20_Caption[3] = "55";

 TButton Button22;
char Button22_Caption[4] = "115";

 TButton Button23;
char Button23_Caption[3] = "07";

 TButton Button25;
char Button25_Caption[6] = "02567";

 TButton Button28;
char Button28_Caption[3] = "56";

 TButton Button29;
char Button29_Caption[3] = "51";

 TButton Button30;
char Button30_Caption[4] = "115";

 TButton Button31;
char Button31_Caption[3] = "07";

 TButton Button33;
char Button33_Caption[6] = "02567";

 TButton Button34;
char Button34_Caption[4] = "113";

 TButton Button16;
char Button16_Caption[4] = "04";

 TImage Image299;
 TButton Button6;
char Button6_Caption[4] = "04";

 TButton * const code Screen28_Buttons[15]=
 {
 &Button17,
 &Button18,
 &Button19,
 &Button20,
 &Button22,
 &Button23,
 &Button25,
 &Button28,
 &Button29,
 &Button30,
 &Button31,
 &Button33,
 &Button34,
 &Button16,
 &Button6
 };
 TLabel * const code Screen28_Labels[2]=
 {
 &Label97,
 &Label98
 };
 TImage * const code Screen28_Images[26]=
 {
 &Image289,
 &Image324,
 &Image290,
 &Image297,
 &Image296,
 &Image326,
 &Image327,
 &Image330,
 &Image329,
 &Image325,
 &Image291,
 &Image303,
 &Image301,
 &Image318,
 &Image320,
 &Image328,
 &Image331,
 &Image322,
 &Image321,
 &Image332,
 &Image323,
 &Image292,
 &Image293,
 &Image305,
 &Image319,
 &Image299
 };

 TScreen AIR_ONE;
 TImage Image333;
 TImage Image336;
 TImage Image339;
 TImage Image338;
 TImage Image343;
 TImage Image342;
 TImage Image341;
 TImage Image352;
 TImage Image334;
 TLabel Label99;
char Label99_Caption[8] = "DRAWING";

 TImage Image358;
 TImage Image360;
 TImage Image362;
 TImage Image365;
 TImage Image367;
 TImage Image368;
 TImage Image361;
 TImage Image340;
 TImage Image337;
 TButton Button14;
char Button14_Caption[4] = "12";

 TButton Button26;
char Button26_Caption[3] = "56";

 TButton Button27;
char Button27_Caption[3] = "51";

 TButton Button32;
char Button32_Caption[3] = "57";

 TButton Button35;
char Button35_Caption[3] = "55";

 TButton Button36;
char Button36_Caption[4] = "115";

 TButton Button37;
char Button37_Caption[3] = "07";

 TButton Button38;
char Button38_Caption[3] = "18";

 TButton Button39;
char Button39_Caption[3] = "07";

 TButton Button41;
char Button41_Caption[6] = "02567";

 TButton Button42;
char Button42_Caption[4] = "113";

 TButton Button2;
char Button2_Caption[1] = "";

 TButton * const code Screen29_Buttons[12]=
 {
 &Button14,
 &Button26,
 &Button27,
 &Button32,
 &Button35,
 &Button36,
 &Button37,
 &Button38,
 &Button39,
 &Button41,
 &Button42,
 &Button2
 };
 TLabel * const code Screen29_Labels[1]=
 {
 &Label99
 };
 TImage * const code Screen29_Images[18]=
 {
 &Image333,
 &Image336,
 &Image339,
 &Image338,
 &Image343,
 &Image342,
 &Image341,
 &Image352,
 &Image334,
 &Image358,
 &Image360,
 &Image362,
 &Image365,
 &Image367,
 &Image368,
 &Image361,
 &Image340,
 &Image337
 };

 TScreen GRAPH2;
 TImage Image374;
 TBox Box28;
 TLine Line13;
 TLine Line14;
 TLine Line15;
 TLine Line17;
 TLine Line18;
 TLine Line19;
 TLine Line20;
 TLine Line21;
 TLabel Label121;
char Label121_Caption[3] = "40";

 TLabel Label122;
char Label122_Caption[3] = "10";

 TLabel Label125;
char Label125_Caption[3] = "20";

 TLabel Label127;
char Label127_Caption[3] = "30";

 TLabel Label130;
char Label130_Caption[2] = "0";

 TLabel Label131;
char Label131_Caption[2] = "1";

 TLabel Label132;
char Label132_Caption[2] = "2";

 TLabel Label133;
char Label133_Caption[2] = "3";

 TLabel Label134;
char Label134_Caption[2] = "4";

 TLabel Label135;
char Label135_Caption[2] = "5";

 TLabel Label136;
char Label136_Caption[4] = "Min";

 TLine Line22;
 TLine Line23;
 TLine Line24;
 TLabel Label137;
char Label137_Caption[3] = "50";

 TLabel Label146;
char Label146_Caption[3] = "60";

 TLine Line25;
 TImage Image378;
 TLabel Label151;
char Label151_Caption[9] = "23:12:15";

 TLabel _;
char __Caption[15] = "GRAPH MODULE 2";

 TButton_Round Home_b26;
char Home_b26_Caption[5] = "HOME";

 TButton_Round Back_b22;
char Back_b22_Caption[5] = "BACK";

 TLabel graph2_pos;
char graph2_pos_Caption[4] = "123";

 TButton_Round graph_br2_in;
char graph_br2_in_Caption[4] = "12";

 TButton_Round graph_br2_out;
char graph_br2_out_Caption[4] = "09";

 TButton_Round graph_heat2_in;
char graph_heat2_in_Caption[3] = "49";

 TButton_Round graph_heat2_out;
char graph_heat2_out_Caption[3] = "57";

 TLabel Label5;
char Label5_Caption[5] = "POS:";

 TLabel Label8;
char Label8_Caption[5] = "HtIn";

 TLabel Label16;
char Label16_Caption[6] = "HtOut";

 TLabel Label19;
char Label19_Caption[5] = "BrIn";

 TLabel Label21;
char Label21_Caption[6] = "BrOut";

 TCircleButton CircleButton5;
char CircleButton5_Caption[2] = "2";

 TButton_Round * const code Screen30_Buttons_Round[6]=
 {
 &Home_b26,
 &Back_b22,
 &graph_br2_in,
 &graph_br2_out,
 &graph_heat2_in,
 &graph_heat2_out
 };
 TLabel * const code Screen30_Labels[21]=
 {
 &Label121,
 &Label122,
 &Label125,
 &Label127,
 &Label130,
 &Label131,
 &Label132,
 &Label133,
 &Label134,
 &Label135,
 &Label136,
 &Label137,
 &Label146,
 &Label151,
 &_,
 &graph2_pos,
 &Label5,
 &Label8,
 &Label16,
 &Label19,
 &Label21
 };
 TImage * const code Screen30_Images[2]=
 {
 &Image374,
 &Image378
 };
 TCircleButton * const code Screen30_CircleButtons[1]=
 {
 &CircleButton5
 };
 TBox * const code Screen30_Boxes[1]=
 {
 &Box28
 };
 TLine * const code Screen30_Lines[12]=
 {
 &Line13,
 &Line14,
 &Line15,
 &Line17,
 &Line18,
 &Line19,
 &Line20,
 &Line21,
 &Line22,
 &Line23,
 &Line24,
 &Line25
 };

 TScreen TIMERS;
 TImage Image133;
 TImage Image395;
 TImage Image393;
 TImage Image161;
 TImage Image295;
 TImage Image376;
 TImage Image391;
 TImage Image111;
 TImage Image402;
 TImage Image403;
 TImage Image405;
 TImage Image404;
 TImage Image406;
 TImage Image113;
 TLabel Label162;
char Label162_Caption[7] = "TIMERS";

 TButton_Round Home_b27;
char Home_b27_Caption[5] = "HOME";

 TButton_Round Back_b23;
char Back_b23_Caption[5] = "BACK";

 TButton_Round * const code Screen31_Buttons_Round[2]=
 {
 &Home_b27,
 &Back_b23
 };
 TLabel * const code Screen31_Labels[1]=
 {
 &Label162
 };
 TImage * const code Screen31_Images[14]=
 {
 &Image133,
 &Image395,
 &Image393,
 &Image161,
 &Image295,
 &Image376,
 &Image391,
 &Image111,
 &Image402,
 &Image403,
 &Image405,
 &Image404,
 &Image406,
 &Image113
 };

 TScreen ENERGY;
 TImage Image108;
 TLabel Label126;
char Label126_Caption[7] = "ENERGY";

 TButton_Round Home_b28;
char Home_b28_Caption[5] = "HOME";

 TButton_Round Back_b24;
char Back_b24_Caption[5] = "BACK";

 TButton_Round Energy_Volt_1;
char Energy_Volt_1_Caption[4] = "220";

 TLabel Label251;
char Label251_Caption[8] = "Phase A";

 TLabel Label252;
char Label252_Caption[2] = "V";

 TButton_Round S_Current_1;
char S_Current_1_Caption[3] = "00";

 TLabel Label253;
char Label253_Caption[2] = "A";

 TButton_Round Energy_Volt_2;
char Energy_Volt_2_Caption[4] = "220";

 TLabel Label254;
char Label254_Caption[8] = "Phase B";

 TLabel Label255;
char Label255_Caption[2] = "V";

 TButton_Round S_Current_2;
char S_Current_2_Caption[3] = "00";

 TLabel Label256;
char Label256_Caption[2] = "A";

 TButton_Round Energy_Volt_3;
char Energy_Volt_3_Caption[4] = "220";

 TLabel Label257;
char Label257_Caption[8] = "Phase C";

 TLabel Label258;
char Label258_Caption[2] = "V";

 TButton_Round S_Current_3;
char S_Current_3_Caption[3] = "00";

 TLabel Label259;
char Label259_Caption[2] = "A";

 TButton_Round Energy_Power_1;
char Energy_Power_1_Caption[4] = "000";

 TLabel Label260;
char Label260_Caption[3] = "kW";

 TLabel Label261;
char Label261_Caption[6] = "Power";

 TButton_Round ButtonRound12;
char ButtonRound12_Caption[4] = "000";

 TLabel Label400;
char Label400_Caption[3] = "kW";

 TLabel Label401;
char Label401_Caption[11] = "Heat power";

 TButton_Round * const code Screen32_Buttons_Round[10]=
 {
 &Home_b28,
 &Back_b24,
 &Energy_Volt_1,
 &S_Current_1,
 &Energy_Volt_2,
 &S_Current_2,
 &Energy_Volt_3,
 &S_Current_3,
 &Energy_Power_1,
 &ButtonRound12
 };
 TLabel * const code Screen32_Labels[14]=
 {
 &Label126,
 &Label251,
 &Label252,
 &Label253,
 &Label254,
 &Label255,
 &Label256,
 &Label257,
 &Label258,
 &Label259,
 &Label260,
 &Label261,
 &Label400,
 &Label401
 };
 TImage * const code Screen32_Images[1]=
 {
 &Image108
 };

 TScreen DEFROST;
 TImage Image82;
 TImage Image388;
 TImage Defrost_set4;
 TImage Image355;
 TImage Image198;
 TImage Image199;
 TButton_Round Defrost_on_time;
char Defrost_on_time_Caption[4] = "40";

 TImage Image377;
 TImage Image379;
 TImage Image382;
 TImage Image383;
 TImage Image381;
 TImage Image384;
 TButton_Round Defrost_off_time;
char Defrost_off_time_Caption[4] = "10";

 TButton_Round Defrost_on_temperature;
char Defrost_on_temperature_Caption[4] = "08";

 TButton_Round Defrost_off_temperature;
char Defrost_off_temperature_Caption[3] = "20";

 TButton_Round Home_b29;
char Home_b29_Caption[5] = "HOME";

 TButton_Round Back_b25;
char Back_b25_Caption[5] = "BACK";

 TImage Defrost_minus1;
 TImage Defrost_minus2;
 TImage Defrost_minus3;
 TImage Defrost_plus1;
 TImage Defrost_plus2;
 TImage Defrost_plus3;
 TImage Defrost_set1;
 TImage Defrost_set2;
 TImage Defrost_set3;
 TImage Image386;
 TImage Image387;
 TImage Defrost_plus4;
 TImage Defrost_minus4;
 TButton_Round Defrost_on_humidity;
char Defrost_on_humidity_Caption[4] = "89";

 TImage Image47;
 TImage Image70;
 TImage Image103;
 TLabel Label51;
char Label51_Caption[11] = "DEFROSTING";

 TImage humidity_down;
 TImage humidity_up;
 TImage humidity_set;
 TButton_Round * const code Screen33_Buttons_Round[7]=
 {
 &Defrost_on_time,
 &Defrost_off_time,
 &Defrost_on_temperature,
 &Defrost_off_temperature,
 &Home_b29,
 &Back_b25,
 &Defrost_on_humidity
 };
 TLabel * const code Screen33_Labels[1]=
 {
 &Label51
 };
 TImage * const code Screen33_Images[31]=
 {
 &Image82,
 &Image388,
 &Defrost_set4,
 &Image355,
 &Image198,
 &Image199,
 &Image377,
 &Image379,
 &Image382,
 &Image383,
 &Image381,
 &Image384,
 &Defrost_minus1,
 &Defrost_minus2,
 &Defrost_minus3,
 &Defrost_plus1,
 &Defrost_plus2,
 &Defrost_plus3,
 &Defrost_set1,
 &Defrost_set2,
 &Defrost_set3,
 &Image386,
 &Image387,
 &Defrost_plus4,
 &Defrost_minus4,
 &Image47,
 &Image70,
 &Image103,
 &humidity_down,
 &humidity_up,
 &humidity_set
 };

 TScreen EVENTS;
 TImage Image63;
 TButton_Round Home_b30;
char Home_b30_Caption[5] = "HOME";

 TBox_Round BoxRound1;
 TButton_Round Back_b26;
char Back_b26_Caption[5] = "BACK";

 TLabel Label50;
char Label50_Caption[7] = "EVENTS";

 TButton_Round * const code Screen34_Buttons_Round[2]=
 {
 &Home_b30,
 &Back_b26
 };
 TLabel * const code Screen34_Labels[1]=
 {
 &Label50
 };
 TImage * const code Screen34_Images[1]=
 {
 &Image63
 };
 TBox_Round * const code Screen34_Boxes_Round[1]=
 {
 &BoxRound1
 };

 TScreen LIMITS5;
 TImage Image21;
 TImage Image22;
 TImage Image29;
 TImage Image280;
 TImage Image99;
 TImage Image100;
 TImage Image281;
 TButton_Round Home_b31;
char Home_b31_Caption[5] = "HOME";

 TButton_Round Set_max_low_pressure;
char Set_max_low_pressure_Caption[3] = "18";

 TButton_Round Set_min_low_pressure;
char Set_min_low_pressure_Caption[4] = "01";

 TImage Image12;
 TImage Image14;
 TImage Image17;
 TImage Image18;
 TImage Image282;
 TImage Image279;
 TButton_Round Back_b27;
char Back_b27_Caption[5] = "BACK";

 TLabel Label46;
char Label46_Caption[9] = "SETTINGS";

 TCircleButton CircleButton3;
char CircleButton3_Caption[2] = "5";

 TImage Set_phase_off;
 TImage Set_voltage_off;
 TImage Set_voltage_on;
 TImage Set_phase_on;
 TImage Image5;
 TImage Image6;
 TImage Image46;
 TImage UP_26_;
 TImage Set_26_;
 TButton_Round Set_eev_on;
char Set_eev_on_Caption[3] = "08";

 TImage Image7;
 TButton_Round * const code Screen35_Buttons_Round[5]=
 {
 &Home_b31,
 &Set_max_low_pressure,
 &Set_min_low_pressure,
 &Back_b27,
 &Set_eev_on
 };
 TLabel * const code Screen35_Labels[1]=
 {
 &Label46
 };
 TImage * const code Screen35_Images[23]=
 {
 &Image21,
 &Image22,
 &Image29,
 &Image280,
 &Image99,
 &Image100,
 &Image281,
 &Image12,
 &Image14,
 &Image17,
 &Image18,
 &Image282,
 &Image279,
 &Set_phase_off,
 &Set_voltage_off,
 &Set_voltage_on,
 &Set_phase_on,
 &Image5,
 &Image6,
 &Image46,
 &UP_26_,
 &Set_26_,
 &Image7
 };
 TCircleButton * const code Screen35_CircleButtons[1]=
 {
 &CircleButton3
 };

 TScreen MICRO_SD;
 TImage Image2;
 TButton_Round Back_b28;
char Back_b28_Caption[5] = "BACK";

 TButton_Round Home_b32;
char Home_b32_Caption[5] = "HOME";

 TLabel Label7;
char Label7_Caption[9] = "MICRO SD";

 TButton_Round * const code Screen36_Buttons_Round[2]=
 {
 &Back_b28,
 &Home_b32
 };
 TLabel * const code Screen36_Labels[1]=
 {
 &Label7
 };
 TImage * const code Screen36_Images[1]=
 {
 &Image2
 };

 TScreen LIMITS3;
 TImage Image461;
 TImage Image469;
 TImage Image471;
 TImage Image472;
 TImage Image473;
 TImage Image470;
 TImage Image468;
 TImage Image482;
 TImage Image474;
 TImage Image478;
 TImage Image479;
 TImage Image475;
 TImage Image483;
 TImage Image484;
 TImage Image476;
 TImage Image480;
 TImage Image481;
 TImage Image477;
 TImage Image485;
 TButton_Round Home_b33;
char Home_b33_Caption[5] = "HOME";

 TButton_Round Back_b29;
char Back_b29_Caption[5] = "BACK";

 TButton_Round Next_b10;
char Next_b10_Caption[5] = "NEXT";

 TImage Down_15_;
 TImage Down_16_;
 TImage Down_17_;
 TImage Down_18_;
 TImage Up_15_;
 TImage Up_16_;
 TImage Up_17_;
 TImage Up_18_;
 TImage Set_15_;
 TImage Set_16_;
 TImage Set_17_;
 TImage Set_18_;
 TImage Set_14_;
 TImage Set_13_;
 TImage Up_14_;
 TImage Up_13_;
 TImage Down_14_;
 TImage Down_13_;
 TButton_Round Set_Furnance_one_preset;
char Set_Furnance_one_preset_Caption[3] = "00";

 TButton_Round Set_solar_max;
char Set_solar_max_Caption[3] = "60";

 TButton_Round Set_max_electric;
char Set_max_electric_Caption[3] = "55";

 TButton_Round Set_max_furnance;
char Set_max_furnance_Caption[3] = "55";

 TButton_Round Set_electric_preset;
char Set_electric_preset_Caption[3] = "00";

 TButton_Round Set_min_superheat;
char Set_min_superheat_Caption[3] = "02";

 TLabel Label341;
char Label341_Caption[9] = "SETTINGS";

 TCircleButton CircleButton17;
char CircleButton17_Caption[2] = "3";

 TButton_Round * const code Screen37_Buttons_Round[9]=
 {
 &Home_b33,
 &Back_b29,
 &Next_b10,
 &Set_Furnance_one_preset,
 &Set_solar_max,
 &Set_max_electric,
 &Set_max_furnance,
 &Set_electric_preset,
 &Set_min_superheat
 };
 TLabel * const code Screen37_Labels[1]=
 {
 &Label341
 };
 TImage * const code Screen37_Images[37]=
 {
 &Image461,
 &Image469,
 &Image471,
 &Image472,
 &Image473,
 &Image470,
 &Image468,
 &Image482,
 &Image474,
 &Image478,
 &Image479,
 &Image475,
 &Image483,
 &Image484,
 &Image476,
 &Image480,
 &Image481,
 &Image477,
 &Image485,
 &Down_15_,
 &Down_16_,
 &Down_17_,
 &Down_18_,
 &Up_15_,
 &Up_16_,
 &Up_17_,
 &Up_18_,
 &Set_15_,
 &Set_16_,
 &Set_17_,
 &Set_18_,
 &Set_14_,
 &Set_13_,
 &Up_14_,
 &Up_13_,
 &Down_14_,
 &Down_13_
 };
 TCircleButton * const code Screen37_CircleButtons[1]=
 {
 &CircleButton17
 };



static void InitializeObjects() {
 HOME.Color = 0x0008;
 HOME.Width = 480;
 HOME.Height = 272;
 HOME.ButtonsCount = 0;
 HOME.Buttons_RoundCount = 12;
 HOME.Buttons_Round = Screen1_Buttons_Round;
 HOME.LabelsCount = 23;
 HOME.Labels = Screen1_Labels;
 HOME.ImagesCount = 30;
 HOME.Images = Screen1_Images;
 HOME.CImagesCount = 0;
 HOME.CirclesCount = 4;
 HOME.Circles = Screen1_Circles;
 HOME.CircleButtonsCount = 0;
 HOME.BoxesCount = 4;
 HOME.Boxes = Screen1_Boxes;
 HOME.Boxes_RoundCount = 12;
 HOME.Boxes_Round = Screen1_Boxes_Round;
 HOME.LinesCount = 2;
 HOME.Lines = Screen1_Lines;
 HOME.ProgressBarsCount = 0;
 HOME.ObjectsCount = 87;

 USER_MENU.Color = 0x0008;
 USER_MENU.Width = 480;
 USER_MENU.Height = 272;
 USER_MENU.ButtonsCount = 0;
 USER_MENU.Buttons_RoundCount = 1;
 USER_MENU.Buttons_Round = Screen2_Buttons_Round;
 USER_MENU.LabelsCount = 14;
 USER_MENU.Labels = Screen2_Labels;
 USER_MENU.ImagesCount = 25;
 USER_MENU.Images = Screen2_Images;
 USER_MENU.CImagesCount = 0;
 USER_MENU.CirclesCount = 0;
 USER_MENU.CircleButtonsCount = 0;
 USER_MENU.BoxesCount = 0;
 USER_MENU.Boxes_RoundCount = 0;
 USER_MENU.LinesCount = 0;
 USER_MENU.ProgressBarsCount = 0;
 USER_MENU.ObjectsCount = 40;

 EEV.Color = 0x0008;
 EEV.Width = 480;
 EEV.Height = 272;
 EEV.ButtonsCount = 0;
 EEV.Buttons_RoundCount = 8;
 EEV.Buttons_Round = Screen3_Buttons_Round;
 EEV.LabelsCount = 2;
 EEV.Labels = Screen3_Labels;
 EEV.ImagesCount = 2;
 EEV.Images = Screen3_Images;
 EEV.CImagesCount = 0;
 EEV.CirclesCount = 0;
 EEV.CircleButtonsCount = 1;
 EEV.CircleButtons = Screen3_CircleButtons;
 EEV.BoxesCount = 0;
 EEV.Boxes_RoundCount = 0;
 EEV.LinesCount = 0;
 EEV.ProgressBarsCount = 1;
 EEV.ProgressBars = Screen3_ProgressBars;
 EEV.ObjectsCount = 14;

 Keyboard.Color = 0x0008;
 Keyboard.Width = 480;
 Keyboard.Height = 272;
 Keyboard.ButtonsCount = 0;
 Keyboard.Buttons_RoundCount = 45;
 Keyboard.Buttons_Round = Screen4_Buttons_Round;
 Keyboard.LabelsCount = 3;
 Keyboard.Labels = Screen4_Labels;
 Keyboard.ImagesCount = 1;
 Keyboard.Images = Screen4_Images;
 Keyboard.CImagesCount = 0;
 Keyboard.CirclesCount = 0;
 Keyboard.CircleButtonsCount = 0;
 Keyboard.BoxesCount = 2;
 Keyboard.Boxes = Screen4_Boxes;
 Keyboard.Boxes_RoundCount = 0;
 Keyboard.LinesCount = 0;
 Keyboard.ProgressBarsCount = 0;
 Keyboard.ObjectsCount = 51;

 SetRTC.Color = 0x0008;
 SetRTC.Width = 480;
 SetRTC.Height = 272;
 SetRTC.ButtonsCount = 20;
 SetRTC.Buttons = Screen5_Buttons;
 SetRTC.Buttons_RoundCount = 2;
 SetRTC.Buttons_Round = Screen5_Buttons_Round;
 SetRTC.LabelsCount = 15;
 SetRTC.Labels = Screen5_Labels;
 SetRTC.ImagesCount = 1;
 SetRTC.Images = Screen5_Images;
 SetRTC.CImagesCount = 0;
 SetRTC.CirclesCount = 0;
 SetRTC.CircleButtonsCount = 0;
 SetRTC.BoxesCount = 0;
 SetRTC.Boxes_RoundCount = 0;
 SetRTC.LinesCount = 1;
 SetRTC.Lines = Screen5_Lines;
 SetRTC.ProgressBarsCount = 0;
 SetRTC.ObjectsCount = 39;

 ERRORS.Color = 0x0008;
 ERRORS.Width = 480;
 ERRORS.Height = 272;
 ERRORS.ButtonsCount = 0;
 ERRORS.Buttons_RoundCount = 2;
 ERRORS.Buttons_Round = Screen6_Buttons_Round;
 ERRORS.LabelsCount = 4;
 ERRORS.Labels = Screen6_Labels;
 ERRORS.ImagesCount = 1;
 ERRORS.Images = Screen6_Images;
 ERRORS.CImagesCount = 0;
 ERRORS.CirclesCount = 0;
 ERRORS.CircleButtonsCount = 0;
 ERRORS.BoxesCount = 0;
 ERRORS.Boxes_RoundCount = 0;
 ERRORS.LinesCount = 0;
 ERRORS.ProgressBarsCount = 0;
 ERRORS.ObjectsCount = 7;

 PASSWORD.Color = 0x0008;
 PASSWORD.Width = 480;
 PASSWORD.Height = 272;
 PASSWORD.ButtonsCount = 0;
 PASSWORD.Buttons_RoundCount = 3;
 PASSWORD.Buttons_Round = Screen7_Buttons_Round;
 PASSWORD.LabelsCount = 2;
 PASSWORD.Labels = Screen7_Labels;
 PASSWORD.ImagesCount = 1;
 PASSWORD.Images = Screen7_Images;
 PASSWORD.CImagesCount = 0;
 PASSWORD.CirclesCount = 0;
 PASSWORD.CircleButtonsCount = 0;
 PASSWORD.BoxesCount = 0;
 PASSWORD.Boxes_RoundCount = 0;
 PASSWORD.LinesCount = 0;
 PASSWORD.ProgressBarsCount = 0;
 PASSWORD.ObjectsCount = 6;

 GAUGE1.Color = 0x0008;
 GAUGE1.Width = 480;
 GAUGE1.Height = 272;
 GAUGE1.ButtonsCount = 0;
 GAUGE1.Buttons_RoundCount = 2;
 GAUGE1.Buttons_Round = Screen8_Buttons_Round;
 GAUGE1.LabelsCount = 1;
 GAUGE1.Labels = Screen8_Labels;
 GAUGE1.ImagesCount = 4;
 GAUGE1.Images = Screen8_Images;
 GAUGE1.CImagesCount = 0;
 GAUGE1.CirclesCount = 0;
 GAUGE1.CircleButtonsCount = 1;
 GAUGE1.CircleButtons = Screen8_CircleButtons;
 GAUGE1.BoxesCount = 0;
 GAUGE1.Boxes_RoundCount = 0;
 GAUGE1.LinesCount = 2;
 GAUGE1.Lines = Screen8_Lines;
 GAUGE1.ProgressBarsCount = 0;
 GAUGE1.ObjectsCount = 10;

 SYSTEM_SET.Color = 0x5AEB;
 SYSTEM_SET.Width = 480;
 SYSTEM_SET.Height = 272;
 SYSTEM_SET.ButtonsCount = 1;
 SYSTEM_SET.Buttons = Screen9_Buttons;
 SYSTEM_SET.Buttons_RoundCount = 2;
 SYSTEM_SET.Buttons_Round = Screen9_Buttons_Round;
 SYSTEM_SET.LabelsCount = 9;
 SYSTEM_SET.Labels = Screen9_Labels;
 SYSTEM_SET.ImagesCount = 18;
 SYSTEM_SET.Images = Screen9_Images;
 SYSTEM_SET.CImagesCount = 0;
 SYSTEM_SET.CirclesCount = 0;
 SYSTEM_SET.CircleButtonsCount = 0;
 SYSTEM_SET.BoxesCount = 0;
 SYSTEM_SET.Boxes_RoundCount = 0;
 SYSTEM_SET.LinesCount = 0;
 SYSTEM_SET.ProgressBarsCount = 0;
 SYSTEM_SET.ObjectsCount = 30;

 DELAY_MENU.Color = 0x5AEB;
 DELAY_MENU.Width = 480;
 DELAY_MENU.Height = 272;
 DELAY_MENU.ButtonsCount = 0;
 DELAY_MENU.Buttons_RoundCount = 8;
 DELAY_MENU.Buttons_Round = Screen10_Buttons_Round;
 DELAY_MENU.LabelsCount = 1;
 DELAY_MENU.Labels = Screen10_Labels;
 DELAY_MENU.ImagesCount = 37;
 DELAY_MENU.Images = Screen10_Images;
 DELAY_MENU.CImagesCount = 0;
 DELAY_MENU.CirclesCount = 0;
 DELAY_MENU.CircleButtonsCount = 0;
 DELAY_MENU.BoxesCount = 3;
 DELAY_MENU.Boxes = Screen10_Boxes;
 DELAY_MENU.Boxes_RoundCount = 0;
 DELAY_MENU.LinesCount = 0;
 DELAY_MENU.ProgressBarsCount = 0;
 DELAY_MENU.ObjectsCount = 49;

 SYSTEM_EVENTS.Color = 0x5AEB;
 SYSTEM_EVENTS.Width = 480;
 SYSTEM_EVENTS.Height = 272;
 SYSTEM_EVENTS.ButtonsCount = 0;
 SYSTEM_EVENTS.Buttons_RoundCount = 9;
 SYSTEM_EVENTS.Buttons_Round = Screen11_Buttons_Round;
 SYSTEM_EVENTS.LabelsCount = 2;
 SYSTEM_EVENTS.Labels = Screen11_Labels;
 SYSTEM_EVENTS.ImagesCount = 1;
 SYSTEM_EVENTS.Images = Screen11_Images;
 SYSTEM_EVENTS.CImagesCount = 0;
 SYSTEM_EVENTS.CirclesCount = 0;
 SYSTEM_EVENTS.CircleButtonsCount = 1;
 SYSTEM_EVENTS.CircleButtons = Screen11_CircleButtons;
 SYSTEM_EVENTS.BoxesCount = 0;
 SYSTEM_EVENTS.Boxes_RoundCount = 0;
 SYSTEM_EVENTS.LinesCount = 0;
 SYSTEM_EVENTS.ProgressBarsCount = 0;
 SYSTEM_EVENTS.ObjectsCount = 13;

 LIMITS1.Color = 0x5AEB;
 LIMITS1.Width = 480;
 LIMITS1.Height = 272;
 LIMITS1.ButtonsCount = 0;
 LIMITS1.Buttons_RoundCount = 9;
 LIMITS1.Buttons_Round = Screen12_Buttons_Round;
 LIMITS1.LabelsCount = 1;
 LIMITS1.Labels = Screen12_Labels;
 LIMITS1.ImagesCount = 37;
 LIMITS1.Images = Screen12_Images;
 LIMITS1.CImagesCount = 0;
 LIMITS1.CirclesCount = 0;
 LIMITS1.CircleButtonsCount = 1;
 LIMITS1.CircleButtons = Screen12_CircleButtons;
 LIMITS1.BoxesCount = 0;
 LIMITS1.Boxes_RoundCount = 0;
 LIMITS1.LinesCount = 0;
 LIMITS1.ProgressBarsCount = 0;
 LIMITS1.ObjectsCount = 48;

 LIMITS2.Color = 0x5AEB;
 LIMITS2.Width = 480;
 LIMITS2.Height = 272;
 LIMITS2.ButtonsCount = 0;
 LIMITS2.Buttons_RoundCount = 9;
 LIMITS2.Buttons_Round = Screen13_Buttons_Round;
 LIMITS2.LabelsCount = 1;
 LIMITS2.Labels = Screen13_Labels;
 LIMITS2.ImagesCount = 38;
 LIMITS2.Images = Screen13_Images;
 LIMITS2.CImagesCount = 0;
 LIMITS2.CirclesCount = 0;
 LIMITS2.CircleButtonsCount = 1;
 LIMITS2.CircleButtons = Screen13_CircleButtons;
 LIMITS2.BoxesCount = 0;
 LIMITS2.Boxes_RoundCount = 0;
 LIMITS2.LinesCount = 0;
 LIMITS2.ProgressBarsCount = 0;
 LIMITS2.ObjectsCount = 49;

 SENSOR1.Color = 0x5AEB;
 SENSOR1.Width = 480;
 SENSOR1.Height = 272;
 SENSOR1.ButtonsCount = 0;
 SENSOR1.Buttons_RoundCount = 18;
 SENSOR1.Buttons_Round = Screen14_Buttons_Round;
 SENSOR1.LabelsCount = 42;
 SENSOR1.Labels = Screen14_Labels;
 SENSOR1.ImagesCount = 1;
 SENSOR1.Images = Screen14_Images;
 SENSOR1.CImagesCount = 0;
 SENSOR1.CirclesCount = 0;
 SENSOR1.CircleButtonsCount = 1;
 SENSOR1.CircleButtons = Screen14_CircleButtons;
 SENSOR1.BoxesCount = 0;
 SENSOR1.Boxes_RoundCount = 0;
 SENSOR1.LinesCount = 0;
 SENSOR1.ProgressBarsCount = 0;
 SENSOR1.ObjectsCount = 62;

 LIMITS4.Color = 0x5AEB;
 LIMITS4.Width = 480;
 LIMITS4.Height = 272;
 LIMITS4.ButtonsCount = 0;
 LIMITS4.Buttons_RoundCount = 8;
 LIMITS4.Buttons_Round = Screen15_Buttons_Round;
 LIMITS4.LabelsCount = 2;
 LIMITS4.Labels = Screen15_Labels;
 LIMITS4.ImagesCount = 31;
 LIMITS4.Images = Screen15_Images;
 LIMITS4.CImagesCount = 0;
 LIMITS4.CirclesCount = 0;
 LIMITS4.CircleButtonsCount = 1;
 LIMITS4.CircleButtons = Screen15_CircleButtons;
 LIMITS4.BoxesCount = 0;
 LIMITS4.Boxes_RoundCount = 0;
 LIMITS4.LinesCount = 0;
 LIMITS4.ProgressBarsCount = 0;
 LIMITS4.ObjectsCount = 42;

 DEVICES.Color = 0x5AEB;
 DEVICES.Width = 480;
 DEVICES.Height = 272;
 DEVICES.ButtonsCount = 0;
 DEVICES.Buttons_RoundCount = 1;
 DEVICES.Buttons_Round = Screen16_Buttons_Round;
 DEVICES.LabelsCount = 13;
 DEVICES.Labels = Screen16_Labels;
 DEVICES.ImagesCount = 28;
 DEVICES.Images = Screen16_Images;
 DEVICES.CImagesCount = 1;
 DEVICES.CImages = Screen16_CImages;
 DEVICES.CirclesCount = 0;
 DEVICES.CircleButtonsCount = 0;
 DEVICES.BoxesCount = 0;
 DEVICES.Boxes_RoundCount = 0;
 DEVICES.LinesCount = 0;
 DEVICES.ProgressBarsCount = 0;
 DEVICES.ObjectsCount = 43;

 Graph.Color = 0x5AEB;
 Graph.Width = 480;
 Graph.Height = 272;
 Graph.ButtonsCount = 0;
 Graph.Buttons_RoundCount = 7;
 Graph.Buttons_Round = Screen17_Buttons_Round;
 Graph.LabelsCount = 21;
 Graph.Labels = Screen17_Labels;
 Graph.ImagesCount = 2;
 Graph.Images = Screen17_Images;
 Graph.CImagesCount = 0;
 Graph.CirclesCount = 0;
 Graph.CircleButtonsCount = 1;
 Graph.CircleButtons = Screen17_CircleButtons;
 Graph.BoxesCount = 1;
 Graph.Boxes = Screen17_Boxes;
 Graph.Boxes_RoundCount = 0;
 Graph.LinesCount = 12;
 Graph.Lines = Screen17_Lines;
 Graph.ProgressBarsCount = 0;
 Graph.ObjectsCount = 44;

 Schema1.Color = 0x5AEB;
 Schema1.Width = 480;
 Schema1.Height = 272;
 Schema1.ButtonsCount = 14;
 Schema1.Buttons = Screen18_Buttons;
 Schema1.Buttons_RoundCount = 0;
 Schema1.LabelsCount = 1;
 Schema1.Labels = Screen18_Labels;
 Schema1.ImagesCount = 18;
 Schema1.Images = Screen18_Images;
 Schema1.CImagesCount = 0;
 Schema1.CirclesCount = 0;
 Schema1.CircleButtonsCount = 0;
 Schema1.BoxesCount = 0;
 Schema1.Boxes_RoundCount = 0;
 Schema1.LinesCount = 0;
 Schema1.ProgressBarsCount = 0;
 Schema1.ObjectsCount = 33;

 MODE.Color = 0x5AEB;
 MODE.Width = 480;
 MODE.Height = 272;
 MODE.ButtonsCount = 0;
 MODE.Buttons_RoundCount = 3;
 MODE.Buttons_Round = Screen19_Buttons_Round;
 MODE.LabelsCount = 1;
 MODE.Labels = Screen19_Labels;
 MODE.ImagesCount = 13;
 MODE.Images = Screen19_Images;
 MODE.CImagesCount = 0;
 MODE.CirclesCount = 0;
 MODE.CircleButtonsCount = 1;
 MODE.CircleButtons = Screen19_CircleButtons;
 MODE.BoxesCount = 0;
 MODE.Boxes_RoundCount = 0;
 MODE.LinesCount = 0;
 MODE.ProgressBarsCount = 0;
 MODE.ObjectsCount = 18;

 FURNANCE.Color = 0x5AEB;
 FURNANCE.Width = 480;
 FURNANCE.Height = 272;
 FURNANCE.ButtonsCount = 0;
 FURNANCE.Buttons_RoundCount = 6;
 FURNANCE.Buttons_Round = Screen20_Buttons_Round;
 FURNANCE.LabelsCount = 1;
 FURNANCE.Labels = Screen20_Labels;
 FURNANCE.ImagesCount = 27;
 FURNANCE.Images = Screen20_Images;
 FURNANCE.CImagesCount = 0;
 FURNANCE.CirclesCount = 0;
 FURNANCE.CircleButtonsCount = 0;
 FURNANCE.BoxesCount = 2;
 FURNANCE.Boxes = Screen20_Boxes;
 FURNANCE.Boxes_RoundCount = 0;
 FURNANCE.LinesCount = 0;
 FURNANCE.ProgressBarsCount = 0;
 FURNANCE.ObjectsCount = 36;

 Ethernet.Color = 0x5AEB;
 Ethernet.Width = 480;
 Ethernet.Height = 272;
 Ethernet.ButtonsCount = 0;
 Ethernet.Buttons_RoundCount = 19;
 Ethernet.Buttons_Round = Screen21_Buttons_Round;
 Ethernet.LabelsCount = 5;
 Ethernet.Labels = Screen21_Labels;
 Ethernet.ImagesCount = 1;
 Ethernet.Images = Screen21_Images;
 Ethernet.CImagesCount = 0;
 Ethernet.CirclesCount = 0;
 Ethernet.CircleButtonsCount = 0;
 Ethernet.BoxesCount = 4;
 Ethernet.Boxes = Screen21_Boxes;
 Ethernet.Boxes_RoundCount = 0;
 Ethernet.LinesCount = 0;
 Ethernet.ProgressBarsCount = 0;
 Ethernet.ObjectsCount = 29;

 SETTINGS.Color = 0x0008;
 SETTINGS.Width = 480;
 SETTINGS.Height = 272;
 SETTINGS.ButtonsCount = 0;
 SETTINGS.Buttons_RoundCount = 5;
 SETTINGS.Buttons_Round = Screen22_Buttons_Round;
 SETTINGS.LabelsCount = 1;
 SETTINGS.Labels = Screen22_Labels;
 SETTINGS.ImagesCount = 22;
 SETTINGS.Images = Screen22_Images;
 SETTINGS.CImagesCount = 0;
 SETTINGS.CirclesCount = 0;
 SETTINGS.CircleButtonsCount = 0;
 SETTINGS.BoxesCount = 0;
 SETTINGS.Boxes_RoundCount = 0;
 SETTINGS.LinesCount = 0;
 SETTINGS.ProgressBarsCount = 0;
 SETTINGS.ObjectsCount = 28;

 Gauge2.Color = 0x5AEB;
 Gauge2.Width = 480;
 Gauge2.Height = 272;
 Gauge2.ButtonsCount = 0;
 Gauge2.Buttons_RoundCount = 2;
 Gauge2.Buttons_Round = Screen23_Buttons_Round;
 Gauge2.LabelsCount = 1;
 Gauge2.Labels = Screen23_Labels;
 Gauge2.ImagesCount = 4;
 Gauge2.Images = Screen23_Images;
 Gauge2.CImagesCount = 0;
 Gauge2.CirclesCount = 0;
 Gauge2.CircleButtonsCount = 1;
 Gauge2.CircleButtons = Screen23_CircleButtons;
 Gauge2.BoxesCount = 0;
 Gauge2.Boxes_RoundCount = 0;
 Gauge2.LinesCount = 2;
 Gauge2.Lines = Screen23_Lines;
 Gauge2.ProgressBarsCount = 0;
 Gauge2.ObjectsCount = 10;

 Sensor2.Color = 0x5AEB;
 Sensor2.Width = 480;
 Sensor2.Height = 272;
 Sensor2.ButtonsCount = 0;
 Sensor2.Buttons_RoundCount = 15;
 Sensor2.Buttons_Round = Screen24_Buttons_Round;
 Sensor2.LabelsCount = 36;
 Sensor2.Labels = Screen24_Labels;
 Sensor2.ImagesCount = 1;
 Sensor2.Images = Screen24_Images;
 Sensor2.CImagesCount = 0;
 Sensor2.CirclesCount = 0;
 Sensor2.CircleButtonsCount = 1;
 Sensor2.CircleButtons = Screen24_CircleButtons;
 Sensor2.BoxesCount = 0;
 Sensor2.Boxes_RoundCount = 0;
 Sensor2.LinesCount = 0;
 Sensor2.ProgressBarsCount = 0;
 Sensor2.ObjectsCount = 53;

 MODE2.Color = 0x5AEB;
 MODE2.Width = 480;
 MODE2.Height = 272;
 MODE2.ButtonsCount = 0;
 MODE2.Buttons_RoundCount = 2;
 MODE2.Buttons_Round = Screen25_Buttons_Round;
 MODE2.LabelsCount = 1;
 MODE2.Labels = Screen25_Labels;
 MODE2.ImagesCount = 3;
 MODE2.Images = Screen25_Images;
 MODE2.CImagesCount = 0;
 MODE2.CirclesCount = 0;
 MODE2.CircleButtonsCount = 1;
 MODE2.CircleButtons = Screen25_CircleButtons;
 MODE2.BoxesCount = 0;
 MODE2.Boxes_RoundCount = 0;
 MODE2.LinesCount = 0;
 MODE2.ProgressBarsCount = 0;
 MODE2.ObjectsCount = 7;

 Schema2.Color = 0xFFFF;
 Schema2.Width = 480;
 Schema2.Height = 272;
 Schema2.ButtonsCount = 19;
 Schema2.Buttons = Screen26_Buttons;
 Schema2.Buttons_RoundCount = 0;
 Schema2.LabelsCount = 2;
 Schema2.Labels = Screen26_Labels;
 Schema2.ImagesCount = 26;
 Schema2.Images = Screen26_Images;
 Schema2.CImagesCount = 0;
 Schema2.CirclesCount = 0;
 Schema2.CircleButtonsCount = 0;
 Schema2.BoxesCount = 0;
 Schema2.Boxes_RoundCount = 0;
 Schema2.LinesCount = 0;
 Schema2.ProgressBarsCount = 0;
 Schema2.ObjectsCount = 47;

 SYSTEM_EVENTS2.Color = 0x5AEB;
 SYSTEM_EVENTS2.Width = 480;
 SYSTEM_EVENTS2.Height = 272;
 SYSTEM_EVENTS2.ButtonsCount = 0;
 SYSTEM_EVENTS2.Buttons_RoundCount = 7;
 SYSTEM_EVENTS2.Buttons_Round = Screen27_Buttons_Round;
 SYSTEM_EVENTS2.LabelsCount = 2;
 SYSTEM_EVENTS2.Labels = Screen27_Labels;
 SYSTEM_EVENTS2.ImagesCount = 1;
 SYSTEM_EVENTS2.Images = Screen27_Images;
 SYSTEM_EVENTS2.CImagesCount = 0;
 SYSTEM_EVENTS2.CirclesCount = 0;
 SYSTEM_EVENTS2.CircleButtonsCount = 1;
 SYSTEM_EVENTS2.CircleButtons = Screen27_CircleButtons;
 SYSTEM_EVENTS2.BoxesCount = 0;
 SYSTEM_EVENTS2.Boxes_RoundCount = 0;
 SYSTEM_EVENTS2.LinesCount = 0;
 SYSTEM_EVENTS2.ProgressBarsCount = 0;
 SYSTEM_EVENTS2.ObjectsCount = 11;

 AIR_TWO.Color = 0xFFFF;
 AIR_TWO.Width = 480;
 AIR_TWO.Height = 272;
 AIR_TWO.ButtonsCount = 15;
 AIR_TWO.Buttons = Screen28_Buttons;
 AIR_TWO.Buttons_RoundCount = 0;
 AIR_TWO.LabelsCount = 2;
 AIR_TWO.Labels = Screen28_Labels;
 AIR_TWO.ImagesCount = 26;
 AIR_TWO.Images = Screen28_Images;
 AIR_TWO.CImagesCount = 0;
 AIR_TWO.CirclesCount = 0;
 AIR_TWO.CircleButtonsCount = 0;
 AIR_TWO.BoxesCount = 0;
 AIR_TWO.Boxes_RoundCount = 0;
 AIR_TWO.LinesCount = 0;
 AIR_TWO.ProgressBarsCount = 0;
 AIR_TWO.ObjectsCount = 43;

 AIR_ONE.Color = 0xFFFF;
 AIR_ONE.Width = 480;
 AIR_ONE.Height = 272;
 AIR_ONE.ButtonsCount = 12;
 AIR_ONE.Buttons = Screen29_Buttons;
 AIR_ONE.Buttons_RoundCount = 0;
 AIR_ONE.LabelsCount = 1;
 AIR_ONE.Labels = Screen29_Labels;
 AIR_ONE.ImagesCount = 18;
 AIR_ONE.Images = Screen29_Images;
 AIR_ONE.CImagesCount = 0;
 AIR_ONE.CirclesCount = 0;
 AIR_ONE.CircleButtonsCount = 0;
 AIR_ONE.BoxesCount = 0;
 AIR_ONE.Boxes_RoundCount = 0;
 AIR_ONE.LinesCount = 0;
 AIR_ONE.ProgressBarsCount = 0;
 AIR_ONE.ObjectsCount = 31;

 GRAPH2.Color = 0x5AEB;
 GRAPH2.Width = 480;
 GRAPH2.Height = 272;
 GRAPH2.ButtonsCount = 0;
 GRAPH2.Buttons_RoundCount = 6;
 GRAPH2.Buttons_Round = Screen30_Buttons_Round;
 GRAPH2.LabelsCount = 21;
 GRAPH2.Labels = Screen30_Labels;
 GRAPH2.ImagesCount = 2;
 GRAPH2.Images = Screen30_Images;
 GRAPH2.CImagesCount = 0;
 GRAPH2.CirclesCount = 0;
 GRAPH2.CircleButtonsCount = 1;
 GRAPH2.CircleButtons = Screen30_CircleButtons;
 GRAPH2.BoxesCount = 1;
 GRAPH2.Boxes = Screen30_Boxes;
 GRAPH2.Boxes_RoundCount = 0;
 GRAPH2.LinesCount = 12;
 GRAPH2.Lines = Screen30_Lines;
 GRAPH2.ProgressBarsCount = 0;
 GRAPH2.ObjectsCount = 43;

 TIMERS.Color = 0x5AEB;
 TIMERS.Width = 480;
 TIMERS.Height = 272;
 TIMERS.ButtonsCount = 0;
 TIMERS.Buttons_RoundCount = 2;
 TIMERS.Buttons_Round = Screen31_Buttons_Round;
 TIMERS.LabelsCount = 1;
 TIMERS.Labels = Screen31_Labels;
 TIMERS.ImagesCount = 14;
 TIMERS.Images = Screen31_Images;
 TIMERS.CImagesCount = 0;
 TIMERS.CirclesCount = 0;
 TIMERS.CircleButtonsCount = 0;
 TIMERS.BoxesCount = 0;
 TIMERS.Boxes_RoundCount = 0;
 TIMERS.LinesCount = 0;
 TIMERS.ProgressBarsCount = 0;
 TIMERS.ObjectsCount = 17;

 ENERGY.Color = 0x5AEB;
 ENERGY.Width = 480;
 ENERGY.Height = 272;
 ENERGY.ButtonsCount = 0;
 ENERGY.Buttons_RoundCount = 10;
 ENERGY.Buttons_Round = Screen32_Buttons_Round;
 ENERGY.LabelsCount = 14;
 ENERGY.Labels = Screen32_Labels;
 ENERGY.ImagesCount = 1;
 ENERGY.Images = Screen32_Images;
 ENERGY.CImagesCount = 0;
 ENERGY.CirclesCount = 0;
 ENERGY.CircleButtonsCount = 0;
 ENERGY.BoxesCount = 0;
 ENERGY.Boxes_RoundCount = 0;
 ENERGY.LinesCount = 0;
 ENERGY.ProgressBarsCount = 0;
 ENERGY.ObjectsCount = 25;

 DEFROST.Color = 0x5AEB;
 DEFROST.Width = 480;
 DEFROST.Height = 272;
 DEFROST.ButtonsCount = 0;
 DEFROST.Buttons_RoundCount = 7;
 DEFROST.Buttons_Round = Screen33_Buttons_Round;
 DEFROST.LabelsCount = 1;
 DEFROST.Labels = Screen33_Labels;
 DEFROST.ImagesCount = 31;
 DEFROST.Images = Screen33_Images;
 DEFROST.CImagesCount = 0;
 DEFROST.CirclesCount = 0;
 DEFROST.CircleButtonsCount = 0;
 DEFROST.BoxesCount = 0;
 DEFROST.Boxes_RoundCount = 0;
 DEFROST.LinesCount = 0;
 DEFROST.ProgressBarsCount = 0;
 DEFROST.ObjectsCount = 39;

 EVENTS.Color = 0x5AEB;
 EVENTS.Width = 480;
 EVENTS.Height = 272;
 EVENTS.ButtonsCount = 0;
 EVENTS.Buttons_RoundCount = 2;
 EVENTS.Buttons_Round = Screen34_Buttons_Round;
 EVENTS.LabelsCount = 1;
 EVENTS.Labels = Screen34_Labels;
 EVENTS.ImagesCount = 1;
 EVENTS.Images = Screen34_Images;
 EVENTS.CImagesCount = 0;
 EVENTS.CirclesCount = 0;
 EVENTS.CircleButtonsCount = 0;
 EVENTS.BoxesCount = 0;
 EVENTS.Boxes_RoundCount = 1;
 EVENTS.Boxes_Round = Screen34_Boxes_Round;
 EVENTS.LinesCount = 0;
 EVENTS.ProgressBarsCount = 0;
 EVENTS.ObjectsCount = 5;

 LIMITS5.Color = 0x5AEB;
 LIMITS5.Width = 480;
 LIMITS5.Height = 272;
 LIMITS5.ButtonsCount = 0;
 LIMITS5.Buttons_RoundCount = 5;
 LIMITS5.Buttons_Round = Screen35_Buttons_Round;
 LIMITS5.LabelsCount = 1;
 LIMITS5.Labels = Screen35_Labels;
 LIMITS5.ImagesCount = 23;
 LIMITS5.Images = Screen35_Images;
 LIMITS5.CImagesCount = 0;
 LIMITS5.CirclesCount = 0;
 LIMITS5.CircleButtonsCount = 1;
 LIMITS5.CircleButtons = Screen35_CircleButtons;
 LIMITS5.BoxesCount = 0;
 LIMITS5.Boxes_RoundCount = 0;
 LIMITS5.LinesCount = 0;
 LIMITS5.ProgressBarsCount = 0;
 LIMITS5.ObjectsCount = 30;

 MICRO_SD.Color = 0x5AEB;
 MICRO_SD.Width = 480;
 MICRO_SD.Height = 272;
 MICRO_SD.ButtonsCount = 0;
 MICRO_SD.Buttons_RoundCount = 2;
 MICRO_SD.Buttons_Round = Screen36_Buttons_Round;
 MICRO_SD.LabelsCount = 1;
 MICRO_SD.Labels = Screen36_Labels;
 MICRO_SD.ImagesCount = 1;
 MICRO_SD.Images = Screen36_Images;
 MICRO_SD.CImagesCount = 0;
 MICRO_SD.CirclesCount = 0;
 MICRO_SD.CircleButtonsCount = 0;
 MICRO_SD.BoxesCount = 0;
 MICRO_SD.Boxes_RoundCount = 0;
 MICRO_SD.LinesCount = 0;
 MICRO_SD.ProgressBarsCount = 0;
 MICRO_SD.ObjectsCount = 4;

 LIMITS3.Color = 0x5AEB;
 LIMITS3.Width = 480;
 LIMITS3.Height = 272;
 LIMITS3.ButtonsCount = 0;
 LIMITS3.Buttons_RoundCount = 9;
 LIMITS3.Buttons_Round = Screen37_Buttons_Round;
 LIMITS3.LabelsCount = 1;
 LIMITS3.Labels = Screen37_Labels;
 LIMITS3.ImagesCount = 37;
 LIMITS3.Images = Screen37_Images;
 LIMITS3.CImagesCount = 0;
 LIMITS3.CirclesCount = 0;
 LIMITS3.CircleButtonsCount = 1;
 LIMITS3.CircleButtons = Screen37_CircleButtons;
 LIMITS3.BoxesCount = 0;
 LIMITS3.Boxes_RoundCount = 0;
 LIMITS3.LinesCount = 0;
 LIMITS3.ProgressBarsCount = 0;
 LIMITS3.ObjectsCount = 48;


 Set_Heat_Box.OwnerScreen = &HOME;
 Set_Heat_Box.Order = 0;
 Set_Heat_Box.Left = 176;
 Set_Heat_Box.Top = 93;
 Set_Heat_Box.Width = 94;
 Set_Heat_Box.Height = 72;
 Set_Heat_Box.Pen_Width = 1;
 Set_Heat_Box.Pen_Color = 0x0294;
 Set_Heat_Box.Visible = 0;
 Set_Heat_Box.Active = 0;
 Set_Heat_Box.Transparent = 1;
 Set_Heat_Box.Gradient = 0;
 Set_Heat_Box.Gradient_Orientation = 0;
 Set_Heat_Box.Gradient_Start_Color = 0x0339;
 Set_Heat_Box.Gradient_End_Color = 0x0294;
 Set_Heat_Box.Color = 0x0294;
 Set_Heat_Box.PressColEnabled = 0;
 Set_Heat_Box.Press_Color = 0xE71C;
 Set_Heat_Box.OnUpPtr = 0;
 Set_Heat_Box.OnDownPtr = 0;
 Set_Heat_Box.OnClickPtr = 0;
 Set_Heat_Box.OnPressPtr = 0;

 Set_Dhw_Box.OwnerScreen = &HOME;
 Set_Dhw_Box.Order = 1;
 Set_Dhw_Box.Left = 14;
 Set_Dhw_Box.Top = 91;
 Set_Dhw_Box.Width = 97;
 Set_Dhw_Box.Height = 75;
 Set_Dhw_Box.Pen_Width = 1;
 Set_Dhw_Box.Pen_Color = 0x0294;
 Set_Dhw_Box.Visible = 0;
 Set_Dhw_Box.Active = 0;
 Set_Dhw_Box.Transparent = 1;
 Set_Dhw_Box.Gradient = 0;
 Set_Dhw_Box.Gradient_Orientation = 0;
 Set_Dhw_Box.Gradient_Start_Color = 0x0339;
 Set_Dhw_Box.Gradient_End_Color = 0x0294;
 Set_Dhw_Box.Color = 0x0294;
 Set_Dhw_Box.PressColEnabled = 0;
 Set_Dhw_Box.Press_Color = 0xE71C;
 Set_Dhw_Box.OnUpPtr = 0;
 Set_Dhw_Box.OnDownPtr = 0;
 Set_Dhw_Box.OnClickPtr = 0;
 Set_Dhw_Box.OnPressPtr = 0;

 background.OwnerScreen = &HOME;
 background.Order = 2;
 background.Left = 0;
 background.Top = 0;
 background.Width = 480;
 background.Height = 272;
 background.Picture_Type = 1;
 background.Picture_Ratio = 1;
 background.Picture_Name =  0x0003CAAE ;
 background.Visible = 1;
 background.Active = 0;
 background.OnUpPtr = 0;
 background.OnDownPtr = 0;
 background.OnClickPtr = 0;
 background.OnPressPtr = 0;

 Heat_Windows.OwnerScreen = &HOME;
 Heat_Windows.Order = 3;
 Heat_Windows.Left = 166;
 Heat_Windows.Top = 36;
 Heat_Windows.Width = 155;
 Heat_Windows.Height = 180;
 Heat_Windows.Pen_Width = 1;
 Heat_Windows.Pen_Color = 0x7BEF;
 Heat_Windows.Visible = 1;
 Heat_Windows.Active = 0;
 Heat_Windows.Transparent = 1;
 Heat_Windows.Gradient = 0;
 Heat_Windows.Gradient_Orientation = 0;
 Heat_Windows.Gradient_Start_Color = 0x0339;
 Heat_Windows.Gradient_End_Color = 0x0294;
 Heat_Windows.Color = 0x0294;
 Heat_Windows.PressColEnabled = 0;
 Heat_Windows.Press_Color = 0xE71C;
 Heat_Windows.Corner_Radius = 6;
 Heat_Windows.OnUpPtr = 0;
 Heat_Windows.OnDownPtr = 0;
 Heat_Windows.OnClickPtr = 0;
 Heat_Windows.OnPressPtr = 0;

 HEAT_button_redraw.OwnerScreen = &HOME;
 HEAT_button_redraw.Order = 4;
 HEAT_button_redraw.Left = 272;
 HEAT_button_redraw.Top = 75;
 HEAT_button_redraw.Width = 38;
 HEAT_button_redraw.Height = 95;
 HEAT_button_redraw.Pen_Width = 0;
 HEAT_button_redraw.Pen_Color = 0x0000;
 HEAT_button_redraw.Visible = 0;
 HEAT_button_redraw.Active = 0;
 HEAT_button_redraw.Transparent = 1;
 HEAT_button_redraw.Gradient = 0;
 HEAT_button_redraw.Gradient_Orientation = 0;
 HEAT_button_redraw.Gradient_Start_Color = 0x7BEF;
 HEAT_button_redraw.Gradient_End_Color = 0x7BEF;
 HEAT_button_redraw.Color = 0x0294;
 HEAT_button_redraw.PressColEnabled = 0;
 HEAT_button_redraw.Press_Color = 0xE71C;
 HEAT_button_redraw.OnUpPtr = 0;
 HEAT_button_redraw.OnDownPtr = 0;
 HEAT_button_redraw.OnClickPtr = 0;
 HEAT_button_redraw.OnPressPtr = 0;

 DHW_button_redraw.OwnerScreen = &HOME;
 DHW_button_redraw.Order = 5;
 DHW_button_redraw.Left = 113;
 DHW_button_redraw.Top = 75;
 DHW_button_redraw.Width = 38;
 DHW_button_redraw.Height = 95;
 DHW_button_redraw.Pen_Width = 0;
 DHW_button_redraw.Pen_Color = 0x0000;
 DHW_button_redraw.Visible = 0;
 DHW_button_redraw.Active = 0;
 DHW_button_redraw.Transparent = 1;
 DHW_button_redraw.Gradient = 0;
 DHW_button_redraw.Gradient_Orientation = 0;
 DHW_button_redraw.Gradient_Start_Color = 0x7BEF;
 DHW_button_redraw.Gradient_End_Color = 0x7BEF;
 DHW_button_redraw.Color = 0x0294;
 DHW_button_redraw.PressColEnabled = 0;
 DHW_button_redraw.Press_Color = 0xE71C;
 DHW_button_redraw.OnUpPtr = 0;
 DHW_button_redraw.OnDownPtr = 0;
 DHW_button_redraw.OnClickPtr = 0;
 DHW_button_redraw.OnPressPtr = 0;

 DWN_Windows.OwnerScreen = &HOME;
 DWN_Windows.Order = 6;
 DWN_Windows.Left = 8;
 DWN_Windows.Top = 35;
 DWN_Windows.Width = 155;
 DWN_Windows.Height = 180;
 DWN_Windows.Pen_Width = 1;
 DWN_Windows.Pen_Color = 0x7BEF;
 DWN_Windows.Visible = 1;
 DWN_Windows.Active = 0;
 DWN_Windows.Transparent = 1;
 DWN_Windows.Gradient = 0;
 DWN_Windows.Gradient_Orientation = 0;
 DWN_Windows.Gradient_Start_Color = 0x0339;
 DWN_Windows.Gradient_End_Color = 0x0294;
 DWN_Windows.Color = 0x0294;
 DWN_Windows.PressColEnabled = 0;
 DWN_Windows.Press_Color = 0xE71C;
 DWN_Windows.Corner_Radius = 6;
 DWN_Windows.OnUpPtr = 0;
 DWN_Windows.OnDownPtr = 0;
 DWN_Windows.OnClickPtr = 0;
 DWN_Windows.OnPressPtr = 0;

 Brine_Windows.OwnerScreen = &HOME;
 Brine_Windows.Order = 7;
 Brine_Windows.Left = 326;
 Brine_Windows.Top = 131;
 Brine_Windows.Width = 145;
 Brine_Windows.Height = 85;
 Brine_Windows.Pen_Width = 1;
 Brine_Windows.Pen_Color = 0x7BEF;
 Brine_Windows.Visible = 1;
 Brine_Windows.Active = 0;
 Brine_Windows.Transparent = 1;
 Brine_Windows.Gradient = 0;
 Brine_Windows.Gradient_Orientation = 0;
 Brine_Windows.Gradient_Start_Color = 0x0339;
 Brine_Windows.Gradient_End_Color = 0x0294;
 Brine_Windows.Color = 0x0294;
 Brine_Windows.PressColEnabled = 0;
 Brine_Windows.Press_Color = 0xE71C;
 Brine_Windows.Corner_Radius = 6;
 Brine_Windows.OnUpPtr = 0;
 Brine_Windows.OnDownPtr = 0;
 Brine_Windows.OnClickPtr = 0;
 Brine_Windows.OnPressPtr = 0;

 Image20.OwnerScreen = &HOME;
 Image20.Order = 8;
 Image20.Left = 13;
 Image20.Top = 275;
 Image20.Width = 33;
 Image20.Height = 31;
 Image20.Picture_Type = 1;
 Image20.Picture_Ratio = 1;
 Image20.Picture_Name =  0x0007C6B4 ;
 Image20.Visible = 1;
 Image20.Active = 0;
 Image20.OnUpPtr = 0;
 Image20.OnDownPtr = 0;
 Image20.OnClickPtr = 0;
 Image20.OnPressPtr = 0;

 Wheater_Windows.OwnerScreen = &HOME;
 Wheater_Windows.Order = 9;
 Wheater_Windows.Left = 326;
 Wheater_Windows.Top = 36;
 Wheater_Windows.Width = 145;
 Wheater_Windows.Height = 85;
 Wheater_Windows.Pen_Width = 1;
 Wheater_Windows.Pen_Color = 0x7BEF;
 Wheater_Windows.Visible = 1;
 Wheater_Windows.Active = 0;
 Wheater_Windows.Transparent = 1;
 Wheater_Windows.Gradient = 0;
 Wheater_Windows.Gradient_Orientation = 0;
 Wheater_Windows.Gradient_Start_Color = 0x0339;
 Wheater_Windows.Gradient_End_Color = 0x0294;
 Wheater_Windows.Color = 0x0294;
 Wheater_Windows.PressColEnabled = 0;
 Wheater_Windows.Press_Color = 0xE71C;
 Wheater_Windows.Corner_Radius = 6;
 Wheater_Windows.OnUpPtr = 0;
 Wheater_Windows.OnDownPtr = 0;
 Wheater_Windows.OnClickPtr = 0;
 Wheater_Windows.OnPressPtr = 0;

 Image44.OwnerScreen = &HOME;
 Image44.Order = 10;
 Image44.Left = 268;
 Image44.Top = 222;
 Image44.Width = 69;
 Image44.Height = 43;
 Image44.Picture_Type = 0;
 Image44.Picture_Ratio = 1;
 Image44.Picture_Name =  0x0007CEB8 ;
 Image44.Visible = 0;
 Image44.Active = 0;
 Image44.OnUpPtr = 0;
 Image44.OnDownPtr = 0;
 Image44.OnClickPtr = 0;
 Image44.OnPressPtr = 0;

 Image61.OwnerScreen = &HOME;
 Image61.Order = 11;
 Image61.Left = 336;
 Image61.Top = 222;
 Image61.Width = 67;
 Image61.Height = 42;
 Image61.Picture_Type = 1;
 Image61.Picture_Ratio = 1;
 Image61.Picture_Name =  0x0007E5EC ;
 Image61.Visible = 0;
 Image61.Active = 0;
 Image61.OnUpPtr = 0;
 Image61.OnDownPtr = 0;
 Image61.OnClickPtr = 0;
 Image61.OnPressPtr = 0;

 Main_ON.OwnerScreen = &HOME;
 Main_ON.Order = 12;
 Main_ON.Left = 12;
 Main_ON.Top = 222;
 Main_ON.Width = 106;
 Main_ON.Height = 43;
 Main_ON.Picture_Type = 0;
 Main_ON.Picture_Ratio = 1;
 Main_ON.Picture_Name =  0x0007FBEE ;
 Main_ON.Visible = 1;
 Main_ON.Active = 1;
 Main_ON.OnUpPtr = 0;
 Main_ON.OnDownPtr = 0;
 Main_ON.OnClickPtr = 0;
 Main_ON.OnPressPtr = 0;

 Main_OFF.OwnerScreen = &HOME;
 Main_OFF.Order = 13;
 Main_OFF.Left = 10;
 Main_OFF.Top = 221;
 Main_OFF.Width = 104;
 Main_OFF.Height = 42;
 Main_OFF.Picture_Type = 0;
 Main_OFF.Picture_Ratio = 1;
 Main_OFF.Picture_Name =  0x00081F90 ;
 Main_OFF.Visible = 1;
 Main_OFF.Active = 1;
 Main_OFF.OnUpPtr = 0;
 Main_OFF.OnDownPtr = 0;
 Main_OFF.OnClickPtr = Main_OFFOnClick;
 Main_OFF.OnPressPtr = 0;

 DHW_Seting.OwnerScreen = &HOME;
 DHW_Seting.Order = 14;
 DHW_Seting.Left = 70;
 DHW_Seting.Top = 183;
 DHW_Seting.Width = 90;
 DHW_Seting.Height = 30;
 DHW_Seting.Pen_Width = 1;
 DHW_Seting.Pen_Color = 0x7BEF;
 DHW_Seting.Visible = 1;
 DHW_Seting.Active = 1;
 DHW_Seting.Transparent = 1;
 DHW_Seting.Caption = DHW_Seting_Caption;
 DHW_Seting.TextAlign = _taCenter;
 DHW_Seting.TextAlignVertical= _tavMiddle;
 DHW_Seting.FontName =  0x00005242 ;
 DHW_Seting.PressColEnabled = 1;
 DHW_Seting.Font_Color = 0xB596;
 DHW_Seting.VerticalText = 0;
 DHW_Seting.Gradient = 1;
 DHW_Seting.Gradient_Orientation = 0;
 DHW_Seting.Gradient_Start_Color = 0x0332;
 DHW_Seting.Gradient_End_Color = 0x0108;
 DHW_Seting.Color = 0x018C;
 DHW_Seting.Press_Color = 0x0418;
 DHW_Seting.Corner_Radius = 3;
 DHW_Seting.OnUpPtr = 0;
 DHW_Seting.OnDownPtr = 0;
 DHW_Seting.OnClickPtr = DHW_SetingOnClick;
 DHW_Seting.OnPressPtr = 0;

 Label53.OwnerScreen = &HOME;
 Label53.Order = 15;
 Label53.Left = 379;
 Label53.Top = 70;
 Label53.Width = 7;
 Label53.Height = 20;
 Label53.Visible = 1;
 Label53.Active = 0;
 Label53.Caption = Label53_Caption;
 Label53.FontName =  0x00005242 ;
 Label53.Font_Color = 0xC618;
 Label53.VerticalText = 0;
 Label53.OnUpPtr = 0;
 Label53.OnDownPtr = 0;
 Label53.OnClickPtr = 0;
 Label53.OnPressPtr = 0;

 Label38.OwnerScreen = &HOME;
 Label38.Order = 16;
 Label38.Left = 386;
 Label38.Top = 167;
 Label38.Width = 12;
 Label38.Height = 20;
 Label38.Visible = 1;
 Label38.Active = 0;
 Label38.Caption = Label38_Caption;
 Label38.FontName =  0x00005242 ;
 Label38.Font_Color = 0xFBA0;
 Label38.VerticalText = 0;
 Label38.OnUpPtr = 0;
 Label38.OnDownPtr = 0;
 Label38.OnClickPtr = 0;
 Label38.OnPressPtr = 0;

 Label39.OwnerScreen = &HOME;
 Label39.Order = 17;
 Label39.Left = 380;
 Label39.Top = 166;
 Label39.Width = 7;
 Label39.Height = 20;
 Label39.Visible = 1;
 Label39.Active = 0;
 Label39.Caption = Label39_Caption;
 Label39.FontName =  0x00005242 ;
 Label39.Font_Color = 0xFBA0;
 Label39.VerticalText = 0;
 Label39.OnUpPtr = 0;
 Label39.OnDownPtr = 0;
 Label39.OnClickPtr = 0;
 Label39.OnPressPtr = 0;

 Label4.OwnerScreen = &HOME;
 Label4.Order = 18;
 Label4.Left = 457;
 Label4.Top = 167;
 Label4.Width = 12;
 Label4.Height = 20;
 Label4.Visible = 1;
 Label4.Active = 0;
 Label4.Caption = Label4_Caption;
 Label4.FontName =  0x00005242 ;
 Label4.Font_Color = 0x87FF;
 Label4.VerticalText = 0;
 Label4.OnUpPtr = 0;
 Label4.OnDownPtr = 0;
 Label4.OnClickPtr = 0;
 Label4.OnPressPtr = 0;

 Label20.OwnerScreen = &HOME;
 Label20.Order = 19;
 Label20.Left = 450;
 Label20.Top = 166;
 Label20.Width = 7;
 Label20.Height = 20;
 Label20.Visible = 1;
 Label20.Active = 0;
 Label20.Caption = Label20_Caption;
 Label20.FontName =  0x00005242 ;
 Label20.Font_Color = 0x87FF;
 Label20.VerticalText = 0;
 Label20.OnUpPtr = 0;
 Label20.OnDownPtr = 0;
 Label20.OnClickPtr = 0;
 Label20.OnPressPtr = 0;

 Brine_Line.OwnerScreen = &HOME;
 Brine_Line.Order = 20;
 Brine_Line.First_Point_X = 401;
 Brine_Line.First_Point_Y = 165;
 Brine_Line.Second_Point_X = 401;
 Brine_Line.Second_Point_Y = 210;
 Brine_Line.Visible = 1;
 Brine_Line.Pen_Width = 2;
 Brine_Line.Color = 0x0451;

 Heat_Setting.OwnerScreen = &HOME;
 Heat_Setting.Order = 21;
 Heat_Setting.Left = 229;
 Heat_Setting.Top = 183;
 Heat_Setting.Width = 90;
 Heat_Setting.Height = 30;
 Heat_Setting.Pen_Width = 1;
 Heat_Setting.Pen_Color = 0x7BEF;
 Heat_Setting.Visible = 1;
 Heat_Setting.Active = 1;
 Heat_Setting.Transparent = 1;
 Heat_Setting.Caption = Heat_Setting_Caption;
 Heat_Setting.TextAlign = _taCenter;
 Heat_Setting.TextAlignVertical= _tavMiddle;
 Heat_Setting.FontName =  0x00005242 ;
 Heat_Setting.PressColEnabled = 1;
 Heat_Setting.Font_Color = 0xB596;
 Heat_Setting.VerticalText = 0;
 Heat_Setting.Gradient = 1;
 Heat_Setting.Gradient_Orientation = 0;
 Heat_Setting.Gradient_Start_Color = 0x0332;
 Heat_Setting.Gradient_End_Color = 0x0108;
 Heat_Setting.Color = 0x0108;
 Heat_Setting.Press_Color = 0x0418;
 Heat_Setting.Corner_Radius = 3;
 Heat_Setting.OnUpPtr = 0;
 Heat_Setting.OnDownPtr = 0;
 Heat_Setting.OnClickPtr = Heat_SettingOnClick;
 Heat_Setting.OnPressPtr = 0;

 alarm_led.OwnerScreen = &HOME;
 alarm_led.Order = 22;
 alarm_led.Left = 359;
 alarm_led.Top = 9;
 alarm_led.Radius = 5;
 alarm_led.Pen_Width = 1;
 alarm_led.Pen_Color = 0x0000;
 alarm_led.Visible = 0;
 alarm_led.Active = 0;
 alarm_led.Transparent = 1;
 alarm_led.Gradient = 1;
 alarm_led.Gradient_Orientation = 0;
 alarm_led.Gradient_Start_Color = 0xFEFB;
 alarm_led.Gradient_End_Color = 0xF800;
 alarm_led.Color = 0xC618;
 alarm_led.PressColEnabled = 1;
 alarm_led.Press_Color = 0xE71C;
 alarm_led.OnUpPtr = 0;
 alarm_led.OnDownPtr = 0;
 alarm_led.OnClickPtr = 0;
 alarm_led.OnPressPtr = 0;

 radio_led.OwnerScreen = &HOME;
 radio_led.Order = 23;
 radio_led.Left = 358;
 radio_led.Top = 9;
 radio_led.Radius = 5;
 radio_led.Pen_Width = 1;
 radio_led.Pen_Color = 0x0000;
 radio_led.Visible = 0;
 radio_led.Active = 0;
 radio_led.Transparent = 1;
 radio_led.Gradient = 1;
 radio_led.Gradient_Orientation = 0;
 radio_led.Gradient_Start_Color = 0xCFF9;
 radio_led.Gradient_End_Color = 0x0560;
 radio_led.Color = 0xC618;
 radio_led.PressColEnabled = 1;
 radio_led.Press_Color = 0xE71C;
 radio_led.OnUpPtr = 0;
 radio_led.OnDownPtr = 0;
 radio_led.OnClickPtr = 0;
 radio_led.OnPressPtr = 0;

 bar_heating.OwnerScreen = &HOME;
 bar_heating.Order = 24;
 bar_heating.Left = 207;
 bar_heating.Top = 38;
 bar_heating.Width = 112;
 bar_heating.Height = 30;
 bar_heating.Pen_Width = 1;
 bar_heating.Pen_Color = 0x7BEF;
 bar_heating.Visible = 1;
 bar_heating.Active = 1;
 bar_heating.Transparent = 1;
 bar_heating.Caption = bar_heating_Caption;
 bar_heating.TextAlign = _taCenter;
 bar_heating.TextAlignVertical= _tavMiddle;
 bar_heating.FontName =  0x00005242 ;
 bar_heating.PressColEnabled = 1;
 bar_heating.Font_Color = 0xEEC2;
 bar_heating.VerticalText = 0;
 bar_heating.Gradient = 1;
 bar_heating.Gradient_Orientation = 0;
 bar_heating.Gradient_Start_Color = 0x0418;
 bar_heating.Gradient_End_Color = 0x018C;
 bar_heating.Color = 0xC618;
 bar_heating.Press_Color = 0xE71C;
 bar_heating.Corner_Radius = 5;
 bar_heating.OnUpPtr = 0;
 bar_heating.OnDownPtr = 0;
 bar_heating.OnClickPtr = bar_heatingOnClick;
 bar_heating.OnPressPtr = 0;

 bar_DHW.OwnerScreen = &HOME;
 bar_DHW.Order = 25;
 bar_DHW.Left = 47;
 bar_DHW.Top = 38;
 bar_DHW.Width = 112;
 bar_DHW.Height = 30;
 bar_DHW.Pen_Width = 1;
 bar_DHW.Pen_Color = 0x7BEF;
 bar_DHW.Visible = 1;
 bar_DHW.Active = 0;
 bar_DHW.Transparent = 1;
 bar_DHW.Caption = bar_DHW_Caption;
 bar_DHW.TextAlign = _taCenter;
 bar_DHW.TextAlignVertical= _tavMiddle;
 bar_DHW.FontName =  0x00005242 ;
 bar_DHW.PressColEnabled = 1;
 bar_DHW.Font_Color = 0xEBA0;
 bar_DHW.VerticalText = 0;
 bar_DHW.Gradient = 1;
 bar_DHW.Gradient_Orientation = 0;
 bar_DHW.Gradient_Start_Color = 0x0418;
 bar_DHW.Gradient_End_Color = 0x018C;
 bar_DHW.Color = 0xC618;
 bar_DHW.Press_Color = 0xE71C;
 bar_DHW.Corner_Radius = 5;
 bar_DHW.OnUpPtr = 0;
 bar_DHW.OnDownPtr = 0;
 bar_DHW.OnClickPtr = 0;
 bar_DHW.OnPressPtr = 0;

 dhw_led.OwnerScreen = &HOME;
 dhw_led.Order = 26;
 dhw_led.Left = 19;
 dhw_led.Top = 75;
 dhw_led.Radius = 5;
 dhw_led.Pen_Width = 1;
 dhw_led.Pen_Color = 0x0000;
 dhw_led.Visible = 1;
 dhw_led.Active = 1;
 dhw_led.Transparent = 1;
 dhw_led.Gradient = 1;
 dhw_led.Gradient_Orientation = 0;
 dhw_led.Gradient_Start_Color = 0xFFFF;
 dhw_led.Gradient_End_Color = 0x0014;
 dhw_led.Color = 0x041F;
 dhw_led.PressColEnabled = 0;
 dhw_led.Press_Color = 0xE71C;
 dhw_led.OnUpPtr = 0;
 dhw_led.OnDownPtr = 0;
 dhw_led.OnClickPtr = 0;
 dhw_led.OnPressPtr = 0;

 heat_led.OwnerScreen = &HOME;
 heat_led.Order = 27;
 heat_led.Left = 174;
 heat_led.Top = 74;
 heat_led.Radius = 5;
 heat_led.Pen_Width = 1;
 heat_led.Pen_Color = 0x0000;
 heat_led.Visible = 1;
 heat_led.Active = 1;
 heat_led.Transparent = 1;
 heat_led.Gradient = 1;
 heat_led.Gradient_Orientation = 0;
 heat_led.Gradient_Start_Color = 0xFFFF;
 heat_led.Gradient_End_Color = 0xF800;
 heat_led.Color = 0xF800;
 heat_led.PressColEnabled = 0;
 heat_led.Press_Color = 0xE71C;
 heat_led.OnUpPtr = 0;
 heat_led.OnDownPtr = 0;
 heat_led.OnClickPtr = 0;
 heat_led.OnPressPtr = 0;

 Line16.OwnerScreen = &HOME;
 Line16.Order = 28;
 Line16.First_Point_X = 400;
 Line16.First_Point_Y = 75;
 Line16.Second_Point_X = 400;
 Line16.Second_Point_Y = 114;
 Line16.Visible = 1;
 Line16.Pen_Width = 2;
 Line16.Color = 0x0418;

 Label140.OwnerScreen = &HOME;
 Label140.Order = 29;
 Label140.Left = 448;
 Label140.Top = 97;
 Label140.Width = 12;
 Label140.Height = 16;
 Label140.Visible = 1;
 Label140.Active = 0;
 Label140.Caption = Label140_Caption;
 Label140.FontName =  0x00003E9A ;
 Label140.Font_Color = 0xC618;
 Label140.VerticalText = 0;
 Label140.OnUpPtr = 0;
 Label140.OnDownPtr = 0;
 Label140.OnClickPtr = 0;
 Label140.OnPressPtr = 0;

 Label141.OwnerScreen = &HOME;
 Label141.Order = 30;
 Label141.Left = 445;
 Label141.Top = 76;
 Label141.Width = 24;
 Label141.Height = 16;
 Label141.Visible = 1;
 Label141.Active = 0;
 Label141.Caption = Label141_Caption;
 Label141.FontName =  0x00003E9A ;
 Label141.Font_Color = 0xC618;
 Label141.VerticalText = 0;
 Label141.OnUpPtr = 0;
 Label141.OnDownPtr = 0;
 Label141.OnClickPtr = 0;
 Label141.OnPressPtr = 0;

 bar_weather.OwnerScreen = &HOME;
 bar_weather.Order = 31;
 bar_weather.Left = 362;
 bar_weather.Top = 38;
 bar_weather.Width = 107;
 bar_weather.Height = 30;
 bar_weather.Pen_Width = 1;
 bar_weather.Pen_Color = 0x7BEF;
 bar_weather.Visible = 1;
 bar_weather.Active = 0;
 bar_weather.Transparent = 1;
 bar_weather.Caption = bar_weather_Caption;
 bar_weather.TextAlign = _taCenter;
 bar_weather.TextAlignVertical= _tavMiddle;
 bar_weather.FontName =  0x00005242 ;
 bar_weather.PressColEnabled = 0;
 bar_weather.Font_Color = 0x0596;
 bar_weather.VerticalText = 0;
 bar_weather.Gradient = 1;
 bar_weather.Gradient_Orientation = 0;
 bar_weather.Gradient_Start_Color = 0x0418;
 bar_weather.Gradient_End_Color = 0x018C;
 bar_weather.Color = 0xC618;
 bar_weather.Press_Color = 0xE71C;
 bar_weather.Corner_Radius = 5;
 bar_weather.OnUpPtr = 0;
 bar_weather.OnDownPtr = 0;
 bar_weather.OnClickPtr = 0;
 bar_weather.OnPressPtr = 0;

 Weather_Icon.OwnerScreen = &HOME;
 Weather_Icon.Order = 32;
 Weather_Icon.Left = 328;
 Weather_Icon.Top = 38;
 Weather_Icon.Width = 33;
 Weather_Icon.Height = 31;
 Weather_Icon.Picture_Type = 1;
 Weather_Icon.Picture_Ratio = 1;
 Weather_Icon.Picture_Name =  0x000841B6 ;
 Weather_Icon.Visible = 1;
 Weather_Icon.Active = 0;
 Weather_Icon.OnUpPtr = 0;
 Weather_Icon.OnDownPtr = 0;
 Weather_Icon.OnClickPtr = 0;
 Weather_Icon.OnPressPtr = 0;

 bar_brine.OwnerScreen = &HOME;
 bar_brine.Order = 33;
 bar_brine.Left = 362;
 bar_brine.Top = 133;
 bar_brine.Width = 107;
 bar_brine.Height = 30;
 bar_brine.Pen_Width = 1;
 bar_brine.Pen_Color = 0x7BEF;
 bar_brine.Visible = 1;
 bar_brine.Active = 0;
 bar_brine.Transparent = 1;
 bar_brine.Caption = bar_brine_Caption;
 bar_brine.TextAlign = _taCenter;
 bar_brine.TextAlignVertical= _tavMiddle;
 bar_brine.FontName =  0x00005242 ;
 bar_brine.PressColEnabled = 0;
 bar_brine.Font_Color = 0x841F;
 bar_brine.VerticalText = 0;
 bar_brine.Gradient = 1;
 bar_brine.Gradient_Orientation = 0;
 bar_brine.Gradient_Start_Color = 0x0418;
 bar_brine.Gradient_End_Color = 0x018C;
 bar_brine.Color = 0xC618;
 bar_brine.Press_Color = 0xE71C;
 bar_brine.Corner_Radius = 5;
 bar_brine.OnUpPtr = 0;
 bar_brine.OnDownPtr = 0;
 bar_brine.OnClickPtr = 0;
 bar_brine.OnPressPtr = 0;

 Brine_Icon.OwnerScreen = &HOME;
 Brine_Icon.Order = 34;
 Brine_Icon.Left = 328;
 Brine_Icon.Top = 133;
 Brine_Icon.Width = 33;
 Brine_Icon.Height = 31;
 Brine_Icon.Picture_Type = 1;
 Brine_Icon.Picture_Ratio = 1;
 Brine_Icon.Picture_Name =  0x000849BA ;
 Brine_Icon.Visible = 1;
 Brine_Icon.Active = 0;
 Brine_Icon.OnUpPtr = 0;
 Brine_Icon.OnDownPtr = 0;
 Brine_Icon.OnClickPtr = 0;
 Brine_Icon.OnPressPtr = 0;

 MainBut3.OwnerScreen = &HOME;
 MainBut3.Order = 35;
 MainBut3.Left = 267;
 MainBut3.Top = 222;
 MainBut3.Width = 68;
 MainBut3.Height = 42;
 MainBut3.Picture_Type = 1;
 MainBut3.Picture_Ratio = 1;
 MainBut3.Picture_Name =  0x000851BE ;
 MainBut3.Visible = 1;
 MainBut3.Active = 1;
 MainBut3.OnUpPtr = MainBut3OnUp;
 MainBut3.OnDownPtr = 0;
 MainBut3.OnClickPtr = 0;
 MainBut3.OnPressPtr = MainBut3OnPress;

 MainBut4.OwnerScreen = &HOME;
 MainBut4.Order = 36;
 MainBut4.Left = 336;
 MainBut4.Top = 222;
 MainBut4.Width = 67;
 MainBut4.Height = 42;
 MainBut4.Picture_Type = 1;
 MainBut4.Picture_Ratio = 1;
 MainBut4.Picture_Name =  0x00086814 ;
 MainBut4.Visible = 1;
 MainBut4.Active = 1;
 MainBut4.OnUpPtr = MainBut4OnUp;
 MainBut4.OnDownPtr = 0;
 MainBut4.OnClickPtr = 0;
 MainBut4.OnPressPtr = MainBut4OnPress;

 clock_icon.OwnerScreen = &HOME;
 clock_icon.Order = 37;
 clock_icon.Left = 0;
 clock_icon.Top = 0;
 clock_icon.Width = 30;
 clock_icon.Height = 30;
 clock_icon.Picture_Type = 1;
 clock_icon.Picture_Ratio = 1;
 clock_icon.Picture_Name =  0x00087E16 ;
 clock_icon.Visible = 1;
 clock_icon.Active = 0;
 clock_icon.OnUpPtr = 0;
 clock_icon.OnDownPtr = 0;
 clock_icon.OnClickPtr = 0;
 clock_icon.OnPressPtr = 0;

 microSD_icon.OwnerScreen = &HOME;
 microSD_icon.Order = 38;
 microSD_icon.Left = 378;
 microSD_icon.Top = 0;
 microSD_icon.Width = 19;
 microSD_icon.Height = 30;
 microSD_icon.Picture_Type = 1;
 microSD_icon.Picture_Ratio = 1;
 microSD_icon.Picture_Name =  0x00088524 ;
 microSD_icon.Visible = 1;
 microSD_icon.Active = 0;
 microSD_icon.OnUpPtr = 0;
 microSD_icon.OnDownPtr = 0;
 microSD_icon.OnClickPtr = 0;
 microSD_icon.OnPressPtr = 0;

 radio_icon.OwnerScreen = &HOME;
 radio_icon.Order = 39;
 radio_icon.Left = 401;
 radio_icon.Top = 0;
 radio_icon.Width = 30;
 radio_icon.Height = 28;
 radio_icon.Picture_Type = 1;
 radio_icon.Picture_Ratio = 1;
 radio_icon.Picture_Name =  0x0008899E ;
 radio_icon.Visible = 1;
 radio_icon.Active = 0;
 radio_icon.OnUpPtr = 0;
 radio_icon.OnDownPtr = 0;
 radio_icon.OnClickPtr = 0;
 radio_icon.OnPressPtr = 0;

 dhw_icon.OwnerScreen = &HOME;
 dhw_icon.Order = 40;
 dhw_icon.Left = 10;
 dhw_icon.Top = 38;
 dhw_icon.Width = 33;
 dhw_icon.Height = 31;
 dhw_icon.Picture_Type = 1;
 dhw_icon.Picture_Ratio = 1;
 dhw_icon.Picture_Name =  0x00089034 ;
 dhw_icon.Visible = 1;
 dhw_icon.Active = 1;
 dhw_icon.OnUpPtr = 0;
 dhw_icon.OnDownPtr = 0;
 dhw_icon.OnClickPtr = 0;
 dhw_icon.OnPressPtr = 0;

 Label25.OwnerScreen = &HOME;
 Label25.Order = 41;
 Label25.Left = 386;
 Label25.Top = 71;
 Label25.Width = 12;
 Label25.Height = 20;
 Label25.Visible = 1;
 Label25.Active = 0;
 Label25.Caption = Label25_Caption;
 Label25.FontName =  0x00005242 ;
 Label25.Font_Color = 0xC618;
 Label25.VerticalText = 0;
 Label25.OnUpPtr = 0;
 Label25.OnDownPtr = 0;
 Label25.OnClickPtr = 0;
 Label25.OnPressPtr = 0;

 cool_icon.OwnerScreen = &HOME;
 cool_icon.Order = 42;
 cool_icon.Left = 170;
 cool_icon.Top = 38;
 cool_icon.Width = 33;
 cool_icon.Height = 31;
 cool_icon.Picture_Type = 1;
 cool_icon.Picture_Ratio = 1;
 cool_icon.Picture_Name =  0x0007C6B4 ;
 cool_icon.Visible = 1;
 cool_icon.Active = 0;
 cool_icon.OnUpPtr = 0;
 cool_icon.OnDownPtr = 0;
 cool_icon.OnClickPtr = 0;
 cool_icon.OnPressPtr = 0;

 Image28.OwnerScreen = &HOME;
 Image28.Order = 43;
 Image28.Left = 32;
 Image28.Top = 0;
 Image28.Width = 110;
 Image28.Height = 30;
 Image28.Picture_Type = 1;
 Image28.Picture_Ratio = 1;
 Image28.Picture_Name =  0x00089838 ;
 Image28.Visible = 1;
 Image28.Active = 1;
 Image28.OnUpPtr = 0;
 Image28.OnDownPtr = 0;
 Image28.OnClickPtr = 0;
 Image28.OnPressPtr = 0;

 DateTime.OwnerScreen = &HOME;
 DateTime.Order = 44;
 DateTime.Left = 37;
 DateTime.Top = 5;
 DateTime.Width = 98;
 DateTime.Height = 20;
 DateTime.Visible = 1;
 DateTime.Active = 0;
 DateTime.Caption = DateTime_Caption;
 DateTime.FontName =  0x00005242 ;
 DateTime.Font_Color = 0xEF7D;
 DateTime.VerticalText = 0;
 DateTime.OnUpPtr = 0;
 DateTime.OnDownPtr = 0;
 DateTime.OnClickPtr = 0;
 DateTime.OnPressPtr = 0;

 dhw_celc.OwnerScreen = &HOME;
 dhw_celc.Order = 45;
 dhw_celc.Left = 134;
 dhw_celc.Top = 71;
 dhw_celc.Width = 21;
 dhw_celc.Height = 34;
 dhw_celc.Visible = 1;
 dhw_celc.Active = 0;
 dhw_celc.Caption = dhw_celc_Caption;
 dhw_celc.FontName =  0x00001670 ;
 dhw_celc.Font_Color = 0xEBA0;
 dhw_celc.VerticalText = 0;
 dhw_celc.OnUpPtr = 0;
 dhw_celc.OnDownPtr = 0;
 dhw_celc.OnClickPtr = 0;
 dhw_celc.OnPressPtr = 0;

 dhw_point.OwnerScreen = &HOME;
 dhw_point.Order = 46;
 dhw_point.Left = 126;
 dhw_point.Top = 72;
 dhw_point.Width = 7;
 dhw_point.Height = 20;
 dhw_point.Visible = 1;
 dhw_point.Active = 0;
 dhw_point.Caption = dhw_point_Caption;
 dhw_point.FontName =  0x00005242 ;
 dhw_point.Font_Color = 0xEBA0;
 dhw_point.VerticalText = 0;
 dhw_point.OnUpPtr = 0;
 dhw_point.OnDownPtr = 0;
 dhw_point.OnClickPtr = 0;
 dhw_point.OnPressPtr = 0;

 heat_point.OwnerScreen = &HOME;
 heat_point.Order = 47;
 heat_point.Left = 285;
 heat_point.Top = 72;
 heat_point.Width = 7;
 heat_point.Height = 20;
 heat_point.Visible = 1;
 heat_point.Active = 0;
 heat_point.Caption = heat_point_Caption;
 heat_point.FontName =  0x00005242 ;
 heat_point.Font_Color = 0xEEC2;
 heat_point.VerticalText = 0;
 heat_point.OnUpPtr = 0;
 heat_point.OnDownPtr = 0;
 heat_point.OnClickPtr = 0;
 heat_point.OnPressPtr = 0;

 heat_celc.OwnerScreen = &HOME;
 heat_celc.Order = 48;
 heat_celc.Left = 291;
 heat_celc.Top = 71;
 heat_celc.Width = 21;
 heat_celc.Height = 34;
 heat_celc.Visible = 1;
 heat_celc.Active = 0;
 heat_celc.Caption = heat_celc_Caption;
 heat_celc.FontName =  0x00001670 ;
 heat_celc.Font_Color = 0xEEC2;
 heat_celc.VerticalText = 0;
 heat_celc.OnUpPtr = 0;
 heat_celc.OnDownPtr = 0;
 heat_celc.OnClickPtr = 0;
 heat_celc.OnPressPtr = 0;

 TEMP_Setting_value.OwnerScreen = &HOME;
 TEMP_Setting_value.Order = 49;
 TEMP_Setting_value.Left = 177;
 TEMP_Setting_value.Top = 84;
 TEMP_Setting_value.Width = 92;
 TEMP_Setting_value.Height = 101;
 TEMP_Setting_value.Visible = 0;
 TEMP_Setting_value.Active = 0;
 TEMP_Setting_value.Caption = TEMP_Setting_value_Caption;
 TEMP_Setting_value.FontName =  0x00006E0F ;
 TEMP_Setting_value.Font_Color = 0xEF5D;
 TEMP_Setting_value.VerticalText = 0;
 TEMP_Setting_value.OnUpPtr = 0;
 TEMP_Setting_value.OnDownPtr = 0;
 TEMP_Setting_value.OnClickPtr = 0;
 TEMP_Setting_value.OnPressPtr = 0;

 DHW_Setting_value.OwnerScreen = &HOME;
 DHW_Setting_value.Order = 50;
 DHW_Setting_value.Left = 20;
 DHW_Setting_value.Top = 84;
 DHW_Setting_value.Width = 92;
 DHW_Setting_value.Height = 101;
 DHW_Setting_value.Visible = 0;
 DHW_Setting_value.Active = 0;
 DHW_Setting_value.Caption = DHW_Setting_value_Caption;
 DHW_Setting_value.FontName =  0x00006E0F ;
 DHW_Setting_value.Font_Color = 0xEF5D;
 DHW_Setting_value.VerticalText = 0;
 DHW_Setting_value.OnUpPtr = 0;
 DHW_Setting_value.OnDownPtr = 0;
 DHW_Setting_value.OnClickPtr = 0;
 DHW_Setting_value.OnPressPtr = 0;

 WiFi_on_icon.OwnerScreen = &HOME;
 WiFi_on_icon.Order = 51;
 WiFi_on_icon.Left = 436;
 WiFi_on_icon.Top = 0;
 WiFi_on_icon.Width = 44;
 WiFi_on_icon.Height = 30;
 WiFi_on_icon.Picture_Type = 1;
 WiFi_on_icon.Picture_Ratio = 1;
 WiFi_on_icon.Picture_Name =  0x0008B206 ;
 WiFi_on_icon.Visible = 1;
 WiFi_on_icon.Active = 0;
 WiFi_on_icon.OnUpPtr = 0;
 WiFi_on_icon.OnDownPtr = 0;
 WiFi_on_icon.OnClickPtr = 0;
 WiFi_on_icon.OnPressPtr = 0;

 Image163.OwnerScreen = &HOME;
 Image163.Order = 52;
 Image163.Left = 436;
 Image163.Top = 0;
 Image163.Width = 44;
 Image163.Height = 30;
 Image163.Picture_Type = 1;
 Image163.Picture_Ratio = 1;
 Image163.Picture_Name =  0x0008BC5C ;
 Image163.Visible = 0;
 Image163.Active = 0;
 Image163.OnUpPtr = 0;
 Image163.OnDownPtr = 0;
 Image163.OnClickPtr = 0;
 Image163.OnPressPtr = 0;

 Image167.OwnerScreen = &HOME;
 Image167.Order = 53;
 Image167.Left = 436;
 Image167.Top = 0;
 Image167.Width = 44;
 Image167.Height = 30;
 Image167.Picture_Type = 1;
 Image167.Picture_Ratio = 1;
 Image167.Picture_Name =  0x0008C6B2 ;
 Image167.Visible = 0;
 Image167.Active = 0;
 Image167.OnUpPtr = 0;
 Image167.OnDownPtr = 0;
 Image167.OnClickPtr = 0;
 Image167.OnPressPtr = 0;

 Image168.OwnerScreen = &HOME;
 Image168.Order = 54;
 Image168.Left = 436;
 Image168.Top = 0;
 Image168.Width = 44;
 Image168.Height = 30;
 Image168.Picture_Type = 1;
 Image168.Picture_Ratio = 1;
 Image168.Picture_Name =  0x0008D108 ;
 Image168.Visible = 0;
 Image168.Active = 0;
 Image168.OnUpPtr = 0;
 Image168.OnDownPtr = 0;
 Image168.OnClickPtr = 0;
 Image168.OnPressPtr = 0;

 Image169.OwnerScreen = &HOME;
 Image169.Order = 55;
 Image169.Left = 436;
 Image169.Top = 0;
 Image169.Width = 44;
 Image169.Height = 30;
 Image169.Picture_Type = 1;
 Image169.Picture_Ratio = 1;
 Image169.Picture_Name =  0x0008DB5E ;
 Image169.Visible = 0;
 Image169.Active = 0;
 Image169.OnUpPtr = 0;
 Image169.OnDownPtr = 0;
 Image169.OnClickPtr = 0;
 Image169.OnPressPtr = 0;

 Image26.OwnerScreen = &HOME;
 Image26.Order = 56;
 Image26.Left = 436;
 Image26.Top = 0;
 Image26.Width = 44;
 Image26.Height = 30;
 Image26.Picture_Type = 1;
 Image26.Picture_Ratio = 1;
 Image26.Picture_Name =  0x0008E5B4 ;
 Image26.Visible = 1;
 Image26.Active = 0;
 Image26.OnUpPtr = 0;
 Image26.OnDownPtr = 0;
 Image26.OnClickPtr = 0;
 Image26.OnPressPtr = 0;

 Image170.OwnerScreen = &HOME;
 Image170.Order = 57;
 Image170.Left = 436;
 Image170.Top = 0;
 Image170.Width = 44;
 Image170.Height = 30;
 Image170.Picture_Type = 1;
 Image170.Picture_Ratio = 1;
 Image170.Picture_Name =  0x0008B206 ;
 Image170.Visible = 0;
 Image170.Active = 0;
 Image170.OnUpPtr = 0;
 Image170.OnDownPtr = 0;
 Image170.OnClickPtr = 0;
 Image170.OnPressPtr = 0;

 DHW_UP.OwnerScreen = &HOME;
 DHW_UP.Order = 58;
 DHW_UP.Left = 115;
 DHW_UP.Top = 81;
 DHW_UP.Width = 35;
 DHW_UP.Height = 38;
 DHW_UP.Pen_Width = 1;
 DHW_UP.Pen_Color = 0x0210;
 DHW_UP.Visible = 0;
 DHW_UP.Active = 0;
 DHW_UP.Transparent = 1;
 DHW_UP.Caption = DHW_UP_Caption;
 DHW_UP.TextAlign = _taCenter;
 DHW_UP.TextAlignVertical= _tavMiddle;
 DHW_UP.FontName =  0x0001FD49 ;
 DHW_UP.PressColEnabled = 1;
 DHW_UP.Font_Color = 0xFFFF;
 DHW_UP.VerticalText = 0;
 DHW_UP.Gradient = 1;
 DHW_UP.Gradient_Orientation = 0;
 DHW_UP.Gradient_Start_Color = 0xFEDB;
 DHW_UP.Gradient_End_Color = 0xE800;
 DHW_UP.Color = 0xC618;
 DHW_UP.Press_Color = 0xE71C;
 DHW_UP.Corner_Radius = 4;
 DHW_UP.OnUpPtr = 0;
 DHW_UP.OnDownPtr = 0;
 DHW_UP.OnClickPtr = DHW_UPOnClick;
 DHW_UP.OnPressPtr = 0;

 DHW_DOWN.OwnerScreen = &HOME;
 DHW_DOWN.Order = 59;
 DHW_DOWN.Left = 115;
 DHW_DOWN.Top = 122;
 DHW_DOWN.Width = 35;
 DHW_DOWN.Height = 38;
 DHW_DOWN.Pen_Width = 1;
 DHW_DOWN.Pen_Color = 0x0210;
 DHW_DOWN.Visible = 0;
 DHW_DOWN.Active = 0;
 DHW_DOWN.Transparent = 1;
 DHW_DOWN.Caption = DHW_DOWN_Caption;
 DHW_DOWN.TextAlign = _taCenter;
 DHW_DOWN.TextAlignVertical= _tavMiddle;
 DHW_DOWN.FontName =  0x0001FD49 ;
 DHW_DOWN.PressColEnabled = 1;
 DHW_DOWN.Font_Color = 0xFFFF;
 DHW_DOWN.VerticalText = 0;
 DHW_DOWN.Gradient = 1;
 DHW_DOWN.Gradient_Orientation = 0;
 DHW_DOWN.Gradient_Start_Color = 0x0E3E;
 DHW_DOWN.Gradient_End_Color = 0x0370;
 DHW_DOWN.Color = 0xC618;
 DHW_DOWN.Press_Color = 0xE71C;
 DHW_DOWN.Corner_Radius = 4;
 DHW_DOWN.OnUpPtr = 0;
 DHW_DOWN.OnDownPtr = 0;
 DHW_DOWN.OnClickPtr = DHW_DOWNOnClick;
 DHW_DOWN.OnPressPtr = 0;

 HEAT_Down.OwnerScreen = &HOME;
 HEAT_Down.Order = 60;
 HEAT_Down.Left = 272;
 HEAT_Down.Top = 122;
 HEAT_Down.Width = 35;
 HEAT_Down.Height = 38;
 HEAT_Down.Pen_Width = 1;
 HEAT_Down.Pen_Color = 0x0210;
 HEAT_Down.Visible = 0;
 HEAT_Down.Active = 0;
 HEAT_Down.Transparent = 1;
 HEAT_Down.Caption = HEAT_Down_Caption;
 HEAT_Down.TextAlign = _taCenter;
 HEAT_Down.TextAlignVertical= _tavMiddle;
 HEAT_Down.FontName =  0x0001FD49 ;
 HEAT_Down.PressColEnabled = 1;
 HEAT_Down.Font_Color = 0xFFFF;
 HEAT_Down.VerticalText = 0;
 HEAT_Down.Gradient = 1;
 HEAT_Down.Gradient_Orientation = 0;
 HEAT_Down.Gradient_Start_Color = 0x0E3E;
 HEAT_Down.Gradient_End_Color = 0x0370;
 HEAT_Down.Color = 0xC618;
 HEAT_Down.Press_Color = 0xE71C;
 HEAT_Down.Corner_Radius = 4;
 HEAT_Down.OnUpPtr = 0;
 HEAT_Down.OnDownPtr = 0;
 HEAT_Down.OnClickPtr = HEAT_DownOnClick;
 HEAT_Down.OnPressPtr = 0;

 HEAT_UP.OwnerScreen = &HOME;
 HEAT_UP.Order = 61;
 HEAT_UP.Left = 272;
 HEAT_UP.Top = 81;
 HEAT_UP.Width = 35;
 HEAT_UP.Height = 38;
 HEAT_UP.Pen_Width = 1;
 HEAT_UP.Pen_Color = 0x0210;
 HEAT_UP.Visible = 0;
 HEAT_UP.Active = 0;
 HEAT_UP.Transparent = 1;
 HEAT_UP.Caption = HEAT_UP_Caption;
 HEAT_UP.TextAlign = _taCenter;
 HEAT_UP.TextAlignVertical= _tavMiddle;
 HEAT_UP.FontName =  0x0001FD49 ;
 HEAT_UP.PressColEnabled = 1;
 HEAT_UP.Font_Color = 0xFFFF;
 HEAT_UP.VerticalText = 0;
 HEAT_UP.Gradient = 1;
 HEAT_UP.Gradient_Orientation = 0;
 HEAT_UP.Gradient_Start_Color = 0xFEDB;
 HEAT_UP.Gradient_End_Color = 0xE800;
 HEAT_UP.Color = 0xC618;
 HEAT_UP.Press_Color = 0xE71C;
 HEAT_UP.Corner_Radius = 4;
 HEAT_UP.OnUpPtr = 0;
 HEAT_UP.OnDownPtr = 0;
 HEAT_UP.OnClickPtr = HEAT_UPOnClick;
 HEAT_UP.OnPressPtr = 0;

 ON_OFF_Heat_Cool.OwnerScreen = &HOME;
 ON_OFF_Heat_Cool.Order = 62;
 ON_OFF_Heat_Cool.Left = 169;
 ON_OFF_Heat_Cool.Top = 183;
 ON_OFF_Heat_Cool.Width = 55;
 ON_OFF_Heat_Cool.Height = 30;
 ON_OFF_Heat_Cool.Pen_Width = 1;
 ON_OFF_Heat_Cool.Pen_Color = 0x7BEF;
 ON_OFF_Heat_Cool.Visible = 1;
 ON_OFF_Heat_Cool.Active = 1;
 ON_OFF_Heat_Cool.Transparent = 1;
 ON_OFF_Heat_Cool.Caption = ON_OFF_Heat_Cool_Caption;
 ON_OFF_Heat_Cool.TextAlign = _taCenter;
 ON_OFF_Heat_Cool.TextAlignVertical= _tavMiddle;
 ON_OFF_Heat_Cool.FontName =  0x00005242 ;
 ON_OFF_Heat_Cool.PressColEnabled = 1;
 ON_OFF_Heat_Cool.Font_Color = 0xB596;
 ON_OFF_Heat_Cool.VerticalText = 0;
 ON_OFF_Heat_Cool.Gradient = 1;
 ON_OFF_Heat_Cool.Gradient_Orientation = 0;
 ON_OFF_Heat_Cool.Gradient_Start_Color = 0x0332;
 ON_OFF_Heat_Cool.Gradient_End_Color = 0x0108;
 ON_OFF_Heat_Cool.Color = 0x0108;
 ON_OFF_Heat_Cool.Press_Color = 0x0418;
 ON_OFF_Heat_Cool.Corner_Radius = 3;
 ON_OFF_Heat_Cool.OnUpPtr = 0;
 ON_OFF_Heat_Cool.OnDownPtr = 0;
 ON_OFF_Heat_Cool.OnClickPtr = Click_HEAT;
 ON_OFF_Heat_Cool.OnPressPtr = 0;

 ON_OFF_DHW.OwnerScreen = &HOME;
 ON_OFF_DHW.Order = 63;
 ON_OFF_DHW.Left = 11;
 ON_OFF_DHW.Top = 183;
 ON_OFF_DHW.Width = 55;
 ON_OFF_DHW.Height = 30;
 ON_OFF_DHW.Pen_Width = 1;
 ON_OFF_DHW.Pen_Color = 0x7BEF;
 ON_OFF_DHW.Visible = 1;
 ON_OFF_DHW.Active = 1;
 ON_OFF_DHW.Transparent = 1;
 ON_OFF_DHW.Caption = ON_OFF_DHW_Caption;
 ON_OFF_DHW.TextAlign = _taCenter;
 ON_OFF_DHW.TextAlignVertical= _tavMiddle;
 ON_OFF_DHW.FontName =  0x00005242 ;
 ON_OFF_DHW.PressColEnabled = 1;
 ON_OFF_DHW.Font_Color = 0xB596;
 ON_OFF_DHW.VerticalText = 0;
 ON_OFF_DHW.Gradient = 1;
 ON_OFF_DHW.Gradient_Orientation = 0;
 ON_OFF_DHW.Gradient_Start_Color = 0x0332;
 ON_OFF_DHW.Gradient_End_Color = 0x0108;
 ON_OFF_DHW.Color = 0x018C;
 ON_OFF_DHW.Press_Color = 0x0418;
 ON_OFF_DHW.Corner_Radius = 3;
 ON_OFF_DHW.OnUpPtr = 0;
 ON_OFF_DHW.OnDownPtr = 0;
 ON_OFF_DHW.OnClickPtr = Click_DHW;
 ON_OFF_DHW.OnPressPtr = 0;

 Image25.OwnerScreen = &HOME;
 Image25.Order = 64;
 Image25.Left = 130;
 Image25.Top = 222;
 Image25.Width = 69;
 Image25.Height = 43;
 Image25.Picture_Type = 0;
 Image25.Picture_Ratio = 1;
 Image25.Picture_Name =  0x0008F00A ;
 Image25.Visible = 1;
 Image25.Active = 0;
 Image25.OnUpPtr = 0;
 Image25.OnDownPtr = 0;
 Image25.OnClickPtr = 0;
 Image25.OnPressPtr = 0;

 Image40.OwnerScreen = &HOME;
 Image40.Order = 65;
 Image40.Left = 199;
 Image40.Top = 222;
 Image40.Width = 67;
 Image40.Height = 42;
 Image40.Picture_Type = 0;
 Image40.Picture_Ratio = 1;
 Image40.Picture_Name =  0x0009073E ;
 Image40.Visible = 1;
 Image40.Active = 0;
 Image40.OnUpPtr = 0;
 Image40.OnDownPtr = 0;
 Image40.OnClickPtr = 0;
 Image40.OnPressPtr = 0;

 Image87.OwnerScreen = &HOME;
 Image87.Order = 66;
 Image87.Left = 404;
 Image87.Top = 222;
 Image87.Width = 67;
 Image87.Height = 42;
 Image87.Picture_Type = 1;
 Image87.Picture_Ratio = 1;
 Image87.Picture_Name =  0x00091D40 ;
 Image87.Visible = 1;
 Image87.Active = 0;
 Image87.OnUpPtr = 0;
 Image87.OnDownPtr = 0;
 Image87.OnClickPtr = 0;
 Image87.OnPressPtr = 0;

 heat_icon.OwnerScreen = &HOME;
 heat_icon.Order = 67;
 heat_icon.Left = 170;
 heat_icon.Top = 38;
 heat_icon.Width = 33;
 heat_icon.Height = 31;
 heat_icon.Picture_Type = 1;
 heat_icon.Picture_Ratio = 1;
 heat_icon.Picture_Name =  0x00093342 ;
 heat_icon.Visible = 1;
 heat_icon.Active = 0;
 heat_icon.OnUpPtr = 0;
 heat_icon.OnDownPtr = 0;
 heat_icon.OnClickPtr = 0;
 heat_icon.OnPressPtr = 0;

 MainBut1.OwnerScreen = &HOME;
 MainBut1.Order = 68;
 MainBut1.Left = 130;
 MainBut1.Top = 222;
 MainBut1.Width = 68;
 MainBut1.Height = 42;
 MainBut1.Picture_Type = 1;
 MainBut1.Picture_Ratio = 1;
 MainBut1.Picture_Name =  0x00093B46 ;
 MainBut1.Visible = 1;
 MainBut1.Active = 1;
 MainBut1.OnUpPtr = MainBut1OnUp;
 MainBut1.OnDownPtr = 0;
 MainBut1.OnClickPtr = 0;
 MainBut1.OnPressPtr = MainBut1OnPress;

 MainBut2.OwnerScreen = &HOME;
 MainBut2.Order = 69;
 MainBut2.Left = 199;
 MainBut2.Top = 222;
 MainBut2.Width = 67;
 MainBut2.Height = 42;
 MainBut2.Picture_Type = 1;
 MainBut2.Picture_Ratio = 1;
 MainBut2.Picture_Name =  0x0009519C ;
 MainBut2.Visible = 1;
 MainBut2.Active = 1;
 MainBut2.OnUpPtr = MainBut2OnUp;
 MainBut2.OnDownPtr = 0;
 MainBut2.OnClickPtr = 0;
 MainBut2.OnPressPtr = MainBut2OnPress;

 MainBut5.OwnerScreen = &HOME;
 MainBut5.Order = 70;
 MainBut5.Left = 405;
 MainBut5.Top = 222;
 MainBut5.Width = 67;
 MainBut5.Height = 42;
 MainBut5.Picture_Type = 1;
 MainBut5.Picture_Ratio = 1;
 MainBut5.Picture_Name =  0x0009679E ;
 MainBut5.Visible = 1;
 MainBut5.Active = 1;
 MainBut5.OnUpPtr = MainBut5OnUp;
 MainBut5.OnDownPtr = 0;
 MainBut5.OnClickPtr = 0;
 MainBut5.OnPressPtr = MainBut5OnPress;

 heatBox.OwnerScreen = &HOME;
 heatBox.Order = 71;
 heatBox.Left = 191;
 heatBox.Top = 96;
 heatBox.Width = 101;
 heatBox.Height = 71;
 heatBox.Pen_Width = 1;
 heatBox.Pen_Color = 0x0294;
 heatBox.Visible = 1;
 heatBox.Active = 0;
 heatBox.Transparent = 1;
 heatBox.Gradient = 0;
 heatBox.Gradient_Orientation = 0;
 heatBox.Gradient_Start_Color = 0x0339;
 heatBox.Gradient_End_Color = 0x0294;
 heatBox.Color = 0x0294;
 heatBox.PressColEnabled = 0;
 heatBox.Press_Color = 0xE71C;
 heatBox.Corner_Radius = 6;
 heatBox.OnUpPtr = 0;
 heatBox.OnDownPtr = 0;
 heatBox.OnClickPtr = 0;
 heatBox.OnPressPtr = 0;

 heat_temp_main.OwnerScreen = &HOME;
 heat_temp_main.Order = 72;
 heat_temp_main.Left = 195;
 heat_temp_main.Top = 85;
 heat_temp_main.Width = 97;
 heat_temp_main.Height = 106;
 heat_temp_main.Visible = 1;
 heat_temp_main.Active = 1;
 heat_temp_main.Caption = heat_temp_main_Caption;
 heat_temp_main.FontName =  0x0002343E ;
 heat_temp_main.Font_Color = 0xEEC2;
 heat_temp_main.VerticalText = 0;
 heat_temp_main.OnUpPtr = 0;
 heat_temp_main.OnDownPtr = 0;
 heat_temp_main.OnClickPtr = 0;
 heat_temp_main.OnPressPtr = 0;

 BoxRound2.OwnerScreen = &HOME;
 BoxRound2.Order = 73;
 BoxRound2.Left = 31;
 BoxRound2.Top = 96;
 BoxRound2.Width = 106;
 BoxRound2.Height = 71;
 BoxRound2.Pen_Width = 1;
 BoxRound2.Pen_Color = 0x0294;
 BoxRound2.Visible = 1;
 BoxRound2.Active = 0;
 BoxRound2.Transparent = 1;
 BoxRound2.Gradient = 0;
 BoxRound2.Gradient_Orientation = 0;
 BoxRound2.Gradient_Start_Color = 0x0339;
 BoxRound2.Gradient_End_Color = 0x0294;
 BoxRound2.Color = 0x0294;
 BoxRound2.PressColEnabled = 0;
 BoxRound2.Press_Color = 0xE71C;
 BoxRound2.Corner_Radius = 6;
 BoxRound2.OnUpPtr = 0;
 BoxRound2.OnDownPtr = 0;
 BoxRound2.OnClickPtr = 0;
 BoxRound2.OnPressPtr = 0;

 dhw_temp_main.OwnerScreen = &HOME;
 dhw_temp_main.Order = 74;
 dhw_temp_main.Left = 35;
 dhw_temp_main.Top = 85;
 dhw_temp_main.Width = 97;
 dhw_temp_main.Height = 106;
 dhw_temp_main.Visible = 1;
 dhw_temp_main.Active = 1;
 dhw_temp_main.Caption = dhw_temp_main_Caption;
 dhw_temp_main.FontName =  0x0002343E ;
 dhw_temp_main.Font_Color = 0xEBA0;
 dhw_temp_main.VerticalText = 0;
 dhw_temp_main.OnUpPtr = 0;
 dhw_temp_main.OnDownPtr = 0;
 dhw_temp_main.OnClickPtr = 0;
 dhw_temp_main.OnPressPtr = 0;

 BoxRound3.OwnerScreen = &HOME;
 BoxRound3.Order = 75;
 BoxRound3.Left = 338;
 BoxRound3.Top = 179;
 BoxRound3.Width = 45;
 BoxRound3.Height = 29;
 BoxRound3.Pen_Width = 1;
 BoxRound3.Pen_Color = 0x0294;
 BoxRound3.Visible = 1;
 BoxRound3.Active = 0;
 BoxRound3.Transparent = 1;
 BoxRound3.Gradient = 0;
 BoxRound3.Gradient_Orientation = 0;
 BoxRound3.Gradient_Start_Color = 0x0339;
 BoxRound3.Gradient_End_Color = 0x0294;
 BoxRound3.Color = 0x0294;
 BoxRound3.PressColEnabled = 0;
 BoxRound3.Press_Color = 0xE71C;
 BoxRound3.Corner_Radius = 6;
 BoxRound3.OnUpPtr = 0;
 BoxRound3.OnDownPtr = 0;
 BoxRound3.OnClickPtr = 0;
 BoxRound3.OnPressPtr = 0;

 sourse_temp_input_main.OwnerScreen = &HOME;
 sourse_temp_input_main.Order = 76;
 sourse_temp_input_main.Left = 345;
 sourse_temp_input_main.Top = 177;
 sourse_temp_input_main.Width = 33;
 sourse_temp_input_main.Height = 36;
 sourse_temp_input_main.Visible = 1;
 sourse_temp_input_main.Active = 1;
 sourse_temp_input_main.Caption = sourse_temp_input_main_Caption;
 sourse_temp_input_main.FontName =  0x000218AC ;
 sourse_temp_input_main.Font_Color = 0xFBA0;
 sourse_temp_input_main.VerticalText = 0;
 sourse_temp_input_main.OnUpPtr = 0;
 sourse_temp_input_main.OnDownPtr = 0;
 sourse_temp_input_main.OnClickPtr = 0;
 sourse_temp_input_main.OnPressPtr = 0;

 BoxRound4.OwnerScreen = &HOME;
 BoxRound4.Order = 77;
 BoxRound4.Left = 410;
 BoxRound4.Top = 180;
 BoxRound4.Width = 45;
 BoxRound4.Height = 26;
 BoxRound4.Pen_Width = 1;
 BoxRound4.Pen_Color = 0x0294;
 BoxRound4.Visible = 1;
 BoxRound4.Active = 0;
 BoxRound4.Transparent = 1;
 BoxRound4.Gradient = 0;
 BoxRound4.Gradient_Orientation = 0;
 BoxRound4.Gradient_Start_Color = 0x0339;
 BoxRound4.Gradient_End_Color = 0x0294;
 BoxRound4.Color = 0x0294;
 BoxRound4.PressColEnabled = 0;
 BoxRound4.Press_Color = 0xE71C;
 BoxRound4.Corner_Radius = 6;
 BoxRound4.OnUpPtr = 0;
 BoxRound4.OnDownPtr = 0;
 BoxRound4.OnClickPtr = 0;
 BoxRound4.OnPressPtr = 0;

 sourse_temp_output_main.OwnerScreen = &HOME;
 sourse_temp_output_main.Order = 78;
 sourse_temp_output_main.Left = 414;
 sourse_temp_output_main.Top = 177;
 sourse_temp_output_main.Width = 33;
 sourse_temp_output_main.Height = 36;
 sourse_temp_output_main.Visible = 1;
 sourse_temp_output_main.Active = 1;
 sourse_temp_output_main.Caption = sourse_temp_output_main_Caption;
 sourse_temp_output_main.FontName =  0x000218AC ;
 sourse_temp_output_main.Font_Color = 0x87FF;
 sourse_temp_output_main.VerticalText = 0;
 sourse_temp_output_main.OnUpPtr = 0;
 sourse_temp_output_main.OnDownPtr = 0;
 sourse_temp_output_main.OnClickPtr = 0;
 sourse_temp_output_main.OnPressPtr = 0;

 BoxRound5.OwnerScreen = &HOME;
 BoxRound5.Order = 79;
 BoxRound5.Left = 344;
 BoxRound5.Top = 85;
 BoxRound5.Width = 37;
 BoxRound5.Height = 27;
 BoxRound5.Pen_Width = 1;
 BoxRound5.Pen_Color = 0x0294;
 BoxRound5.Visible = 1;
 BoxRound5.Active = 0;
 BoxRound5.Transparent = 1;
 BoxRound5.Gradient = 0;
 BoxRound5.Gradient_Orientation = 0;
 BoxRound5.Gradient_Start_Color = 0x0339;
 BoxRound5.Gradient_End_Color = 0x0294;
 BoxRound5.Color = 0x0294;
 BoxRound5.PressColEnabled = 0;
 BoxRound5.Press_Color = 0xE71C;
 BoxRound5.Corner_Radius = 6;
 BoxRound5.OnUpPtr = 0;
 BoxRound5.OnDownPtr = 0;
 BoxRound5.OnClickPtr = 0;
 BoxRound5.OnPressPtr = 0;

 weather_temp_main.OwnerScreen = &HOME;
 weather_temp_main.Order = 80;
 weather_temp_main.Left = 347;
 weather_temp_main.Top = 83;
 weather_temp_main.Width = 33;
 weather_temp_main.Height = 36;
 weather_temp_main.Visible = 1;
 weather_temp_main.Active = 1;
 weather_temp_main.Caption = weather_temp_main_Caption;
 weather_temp_main.FontName =  0x000218AC ;
 weather_temp_main.Font_Color = 0xC618;
 weather_temp_main.VerticalText = 0;
 weather_temp_main.OnUpPtr = 0;
 weather_temp_main.OnDownPtr = 0;
 weather_temp_main.OnClickPtr = 0;
 weather_temp_main.OnPressPtr = 0;

 BoxRound6.OwnerScreen = &HOME;
 BoxRound6.Order = 81;
 BoxRound6.Left = 409;
 BoxRound6.Top = 93;
 BoxRound6.Width = 31;
 BoxRound6.Height = 22;
 BoxRound6.Pen_Width = 1;
 BoxRound6.Pen_Color = 0x0294;
 BoxRound6.Visible = 1;
 BoxRound6.Active = 0;
 BoxRound6.Transparent = 1;
 BoxRound6.Gradient = 0;
 BoxRound6.Gradient_Orientation = 0;
 BoxRound6.Gradient_Start_Color = 0x0339;
 BoxRound6.Gradient_End_Color = 0x0294;
 BoxRound6.Color = 0x0294;
 BoxRound6.PressColEnabled = 0;
 BoxRound6.Press_Color = 0xE71C;
 BoxRound6.Corner_Radius = 6;
 BoxRound6.OnUpPtr = 0;
 BoxRound6.OnDownPtr = 0;
 BoxRound6.OnClickPtr = 0;
 BoxRound6.OnPressPtr = 0;

 humedity_main.OwnerScreen = &HOME;
 humedity_main.Order = 82;
 humedity_main.Left = 416;
 humedity_main.Top = 95;
 humedity_main.Width = 22;
 humedity_main.Height = 24;
 humedity_main.Visible = 1;
 humedity_main.Active = 1;
 humedity_main.Caption = humedity_main_Caption;
 humedity_main.FontName =  0x00020922 ;
 humedity_main.Font_Color = 0xC618;
 humedity_main.VerticalText = 0;
 humedity_main.OnUpPtr = 0;
 humedity_main.OnDownPtr = 0;
 humedity_main.OnClickPtr = 0;
 humedity_main.OnPressPtr = 0;

 BoxRound7.OwnerScreen = &HOME;
 BoxRound7.Order = 83;
 BoxRound7.Left = 405;
 BoxRound7.Top = 72;
 BoxRound7.Width = 39;
 BoxRound7.Height = 19;
 BoxRound7.Pen_Width = 1;
 BoxRound7.Pen_Color = 0x0294;
 BoxRound7.Visible = 1;
 BoxRound7.Active = 0;
 BoxRound7.Transparent = 1;
 BoxRound7.Gradient = 0;
 BoxRound7.Gradient_Orientation = 0;
 BoxRound7.Gradient_Start_Color = 0x0339;
 BoxRound7.Gradient_End_Color = 0x0294;
 BoxRound7.Color = 0x0294;
 BoxRound7.PressColEnabled = 0;
 BoxRound7.Press_Color = 0xE71C;
 BoxRound7.Corner_Radius = 6;
 BoxRound7.OnUpPtr = 0;
 BoxRound7.OnDownPtr = 0;
 BoxRound7.OnClickPtr = 0;
 BoxRound7.OnPressPtr = 0;

 prassure_main.OwnerScreen = &HOME;
 prassure_main.Order = 84;
 prassure_main.Left = 408;
 prassure_main.Top = 73;
 prassure_main.Width = 37;
 prassure_main.Height = 20;
 prassure_main.Visible = 1;
 prassure_main.Active = 1;
 prassure_main.Caption = prassure_main_Caption;
 prassure_main.FontName =  0x0001F2E5 ;
 prassure_main.Font_Color = 0xC618;
 prassure_main.VerticalText = 0;
 prassure_main.OnUpPtr = 0;
 prassure_main.OnDownPtr = 0;
 prassure_main.OnClickPtr = 0;
 prassure_main.OnPressPtr = 0;

 Messages_Box.OwnerScreen = &HOME;
 Messages_Box.Order = 85;
 Messages_Box.Left = 177;
 Messages_Box.Top = 2;
 Messages_Box.Width = 128;
 Messages_Box.Height = 25;
 Messages_Box.Pen_Width = 1;
 Messages_Box.Pen_Color = 0x0000;
 Messages_Box.Visible = 1;
 Messages_Box.Active = 1;
 Messages_Box.Transparent = 1;
 Messages_Box.Gradient = 1;
 Messages_Box.Gradient_Orientation = 0;
 Messages_Box.Gradient_Start_Color = 0xFFFF;
 Messages_Box.Gradient_End_Color = 0x0000;
 Messages_Box.Color = 0xC618;
 Messages_Box.PressColEnabled = 1;
 Messages_Box.Press_Color = 0xE71C;
 Messages_Box.Corner_Radius = 3;
 Messages_Box.OnUpPtr = 0;
 Messages_Box.OnDownPtr = 0;
 Messages_Box.OnClickPtr = 0;
 Messages_Box.OnPressPtr = 0;

 Messages_Label.OwnerScreen = &HOME;
 Messages_Label.Order = 86;
 Messages_Label.Left = 184;
 Messages_Label.Top = 4;
 Messages_Label.Width = 115;
 Messages_Label.Height = 25;
 Messages_Label.Visible = 1;
 Messages_Label.Active = 1;
 Messages_Label.Caption = Messages_Label_Caption;
 Messages_Label.FontName =  0x0003053E ;
 Messages_Label.Font_Color = 0x07E0;
 Messages_Label.VerticalText = 0;
 Messages_Label.OnUpPtr = 0;
 Messages_Label.OnDownPtr = 0;
 Messages_Label.OnClickPtr = 0;
 Messages_Label.OnPressPtr = 0;

 Image30.OwnerScreen = &USER_MENU;
 Image30.Order = 0;
 Image30.Left = 0;
 Image30.Top = 0;
 Image30.Width = 480;
 Image30.Height = 272;
 Image30.Picture_Type = 1;
 Image30.Picture_Ratio = 1;
 Image30.Picture_Name =  0x0003CAAE ;
 Image30.Visible = 1;
 Image30.Active = 0;
 Image30.OnUpPtr = 0;
 Image30.OnDownPtr = 0;
 Image30.OnClickPtr = 0;
 Image30.OnPressPtr = 0;

 Image105.OwnerScreen = &USER_MENU;
 Image105.Order = 1;
 Image105.Left = 244;
 Image105.Top = 136;
 Image105.Width = 70;
 Image105.Height = 66;
 Image105.Picture_Type = 1;
 Image105.Picture_Ratio = 1;
 Image105.Picture_Name =  0x00097DA0 ;
 Image105.Visible = 0;
 Image105.Active = 0;
 Image105.OnUpPtr = 0;
 Image105.OnDownPtr = 0;
 Image105.OnClickPtr = 0;
 Image105.OnPressPtr = 0;

 Image60.OwnerScreen = &USER_MENU;
 Image60.Order = 2;
 Image60.Left = 400;
 Image60.Top = 39;
 Image60.Width = 71;
 Image60.Height = 66;
 Image60.Picture_Type = 1;
 Image60.Picture_Ratio = 1;
 Image60.Picture_Name =  0x0009A1BE ;
 Image60.Visible = 0;
 Image60.Active = 0;
 Image60.OnUpPtr = 0;
 Image60.OnDownPtr = 0;
 Image60.OnClickPtr = 0;
 Image60.OnPressPtr = 0;

 Image51.OwnerScreen = &USER_MENU;
 Image51.Order = 3;
 Image51.Left = 322;
 Image51.Top = 39;
 Image51.Width = 70;
 Image51.Height = 66;
 Image51.Picture_Type = 1;
 Image51.Picture_Ratio = 1;
 Image51.Picture_Name =  0x0009C660 ;
 Image51.Visible = 0;
 Image51.Active = 0;
 Image51.OnUpPtr = 0;
 Image51.OnDownPtr = 0;
 Image51.OnClickPtr = 0;
 Image51.OnPressPtr = 0;

 Image50.OwnerScreen = &USER_MENU;
 Image50.Order = 4;
 Image50.Left = 244;
 Image50.Top = 39;
 Image50.Width = 71;
 Image50.Height = 66;
 Image50.Picture_Type = 1;
 Image50.Picture_Ratio = 1;
 Image50.Picture_Name =  0x0009EA7E ;
 Image50.Visible = 0;
 Image50.Active = 0;
 Image50.OnUpPtr = 0;
 Image50.OnDownPtr = 0;
 Image50.OnClickPtr = 0;
 Image50.OnPressPtr = 0;

 Image49.OwnerScreen = &USER_MENU;
 Image49.Order = 5;
 Image49.Left = 165;
 Image49.Top = 39;
 Image49.Width = 71;
 Image49.Height = 66;
 Image49.Picture_Type = 1;
 Image49.Picture_Ratio = 1;
 Image49.Picture_Name =  0x000A0F20 ;
 Image49.Visible = 0;
 Image49.Active = 0;
 Image49.OnUpPtr = 0;
 Image49.OnDownPtr = 0;
 Image49.OnClickPtr = 0;
 Image49.OnPressPtr = 0;

 Image48.OwnerScreen = &USER_MENU;
 Image48.Order = 6;
 Image48.Left = 88;
 Image48.Top = 39;
 Image48.Width = 70;
 Image48.Height = 66;
 Image48.Picture_Type = 1;
 Image48.Picture_Ratio = 1;
 Image48.Picture_Name =  0x000A33C2 ;
 Image48.Visible = 0;
 Image48.Active = 0;
 Image48.OnUpPtr = 0;
 Image48.OnDownPtr = 0;
 Image48.OnClickPtr = 0;
 Image48.OnPressPtr = 0;

 Image39.OwnerScreen = &USER_MENU;
 Image39.Order = 7;
 Image39.Left = 9;
 Image39.Top = 39;
 Image39.Width = 71;
 Image39.Height = 66;
 Image39.Picture_Type = 1;
 Image39.Picture_Ratio = 1;
 Image39.Picture_Name =  0x000A57E0 ;
 Image39.Visible = 0;
 Image39.Active = 0;
 Image39.OnUpPtr = 0;
 Image39.OnDownPtr = 0;
 Image39.OnClickPtr = 0;
 Image39.OnPressPtr = 0;

 Image52.OwnerScreen = &USER_MENU;
 Image52.Order = 8;
 Image52.Left = 9;
 Image52.Top = 136;
 Image52.Width = 71;
 Image52.Height = 66;
 Image52.Picture_Type = 1;
 Image52.Picture_Ratio = 1;
 Image52.Picture_Name =  0x000A7C82 ;
 Image52.Visible = 0;
 Image52.Active = 0;
 Image52.OnUpPtr = 0;
 Image52.OnDownPtr = 0;
 Image52.OnClickPtr = 0;
 Image52.OnPressPtr = 0;

 Image56.OwnerScreen = &USER_MENU;
 Image56.Order = 9;
 Image56.Left = 88;
 Image56.Top = 136;
 Image56.Width = 70;
 Image56.Height = 66;
 Image56.Picture_Type = 1;
 Image56.Picture_Ratio = 1;
 Image56.Picture_Name =  0x000AA124 ;
 Image56.Visible = 0;
 Image56.Active = 0;
 Image56.OnUpPtr = 0;
 Image56.OnDownPtr = 0;
 Image56.OnClickPtr = 0;
 Image56.OnPressPtr = 0;

 Image54.OwnerScreen = &USER_MENU;
 Image54.Order = 10;
 Image54.Left = 165;
 Image54.Top = 136;
 Image54.Width = 71;
 Image54.Height = 66;
 Image54.Picture_Type = 1;
 Image54.Picture_Ratio = 1;
 Image54.Picture_Name =  0x000AC542 ;
 Image54.Visible = 0;
 Image54.Active = 0;
 Image54.OnUpPtr = 0;
 Image54.OnDownPtr = 0;
 Image54.OnClickPtr = 0;
 Image54.OnPressPtr = 0;

 Image55.OwnerScreen = &USER_MENU;
 Image55.Order = 11;
 Image55.Left = 322;
 Image55.Top = 136;
 Image55.Width = 71;
 Image55.Height = 66;
 Image55.Picture_Type = 1;
 Image55.Picture_Ratio = 1;
 Image55.Picture_Name =  0x000AE9E4 ;
 Image55.Visible = 0;
 Image55.Active = 0;
 Image55.OnUpPtr = 0;
 Image55.OnDownPtr = 0;
 Image55.OnClickPtr = 0;
 Image55.OnPressPtr = 0;

 User_menu_label.OwnerScreen = &USER_MENU;
 User_menu_label.Order = 12;
 User_menu_label.Left = 199;
 User_menu_label.Top = 5;
 User_menu_label.Width = 101;
 User_menu_label.Height = 20;
 User_menu_label.Visible = 1;
 User_menu_label.Active = 0;
 User_menu_label.Caption = User_menu_label_Caption;
 User_menu_label.FontName =  0x00005242 ;
 User_menu_label.Font_Color = 0xE7FC;
 User_menu_label.VerticalText = 0;
 User_menu_label.OnUpPtr = 0;
 User_menu_label.OnDownPtr = 0;
 User_menu_label.OnClickPtr = 0;
 User_menu_label.OnPressPtr = 0;

 User_time_label.OwnerScreen = &USER_MENU;
 User_time_label.Order = 13;
 User_time_label.Left = 29;
 User_time_label.Top = 105;
 User_time_label.Width = 31;
 User_time_label.Height = 16;
 User_time_label.Visible = 1;
 User_time_label.Active = 0;
 User_time_label.Caption = User_time_label_Caption;
 User_time_label.FontName =  0x00003E9A ;
 User_time_label.Font_Color = 0xFFFF;
 User_time_label.VerticalText = 0;
 User_time_label.OnUpPtr = 0;
 User_time_label.OnDownPtr = 0;
 User_time_label.OnClickPtr = 0;
 User_time_label.OnPressPtr = 0;

 User_c_label.OwnerScreen = &USER_MENU;
 User_c_label.Order = 14;
 User_c_label.Left = 118;
 User_c_label.Top = 105;
 User_c_label.Width = 10;
 User_c_label.Height = 16;
 User_c_label.Visible = 1;
 User_c_label.Active = 0;
 User_c_label.Caption = User_c_label_Caption;
 User_c_label.FontName =  0x00003E9A ;
 User_c_label.Font_Color = 0xFFFF;
 User_c_label.VerticalText = 0;
 User_c_label.OnUpPtr = 0;
 User_c_label.OnDownPtr = 0;
 User_c_label.OnClickPtr = 0;
 User_c_label.OnPressPtr = 0;

 User_lan_label.OwnerScreen = &USER_MENU;
 User_lan_label.Order = 15;
 User_lan_label.Left = 173;
 User_lan_label.Top = 105;
 User_lan_label.Width = 53;
 User_lan_label.Height = 16;
 User_lan_label.Visible = 1;
 User_lan_label.Active = 0;
 User_lan_label.Caption = User_lan_label_Caption;
 User_lan_label.FontName =  0x00003E9A ;
 User_lan_label.Font_Color = 0xFFFF;
 User_lan_label.VerticalText = 0;
 User_lan_label.OnUpPtr = 0;
 User_lan_label.OnDownPtr = 0;
 User_lan_label.OnClickPtr = 0;
 User_lan_label.OnPressPtr = 0;

 User_errors_label.OwnerScreen = &USER_MENU;
 User_errors_label.Order = 16;
 User_errors_label.Left = 259;
 User_errors_label.Top = 105;
 User_errors_label.Width = 38;
 User_errors_label.Height = 16;
 User_errors_label.Visible = 1;
 User_errors_label.Active = 0;
 User_errors_label.Caption = User_errors_label_Caption;
 User_errors_label.FontName =  0x00003E9A ;
 User_errors_label.Font_Color = 0xFFFF;
 User_errors_label.VerticalText = 0;
 User_errors_label.OnUpPtr = 0;
 User_errors_label.OnDownPtr = 0;
 User_errors_label.OnClickPtr = 0;
 User_errors_label.OnPressPtr = 0;

 User_timers_label.OwnerScreen = &USER_MENU;
 User_timers_label.Order = 17;
 User_timers_label.Left = 335;
 User_timers_label.Top = 105;
 User_timers_label.Width = 43;
 User_timers_label.Height = 16;
 User_timers_label.Visible = 1;
 User_timers_label.Active = 0;
 User_timers_label.Caption = User_timers_label_Caption;
 User_timers_label.FontName =  0x00003E9A ;
 User_timers_label.Font_Color = 0xFFFF;
 User_timers_label.VerticalText = 0;
 User_timers_label.OnUpPtr = 0;
 User_timers_label.OnDownPtr = 0;
 User_timers_label.OnClickPtr = 0;
 User_timers_label.OnPressPtr = 0;

 User_events_label.OwnerScreen = &USER_MENU;
 User_events_label.Order = 18;
 User_events_label.Left = 22;
 User_events_label.Top = 203;
 User_events_label.Width = 43;
 User_events_label.Height = 16;
 User_events_label.Visible = 1;
 User_events_label.Active = 0;
 User_events_label.Caption = User_events_label_Caption;
 User_events_label.FontName =  0x00003E9A ;
 User_events_label.Font_Color = 0xFFFF;
 User_events_label.VerticalText = 0;
 User_events_label.OnUpPtr = 0;
 User_events_label.OnDownPtr = 0;
 User_events_label.OnClickPtr = 0;
 User_events_label.OnPressPtr = 0;

 User_energy_label.OwnerScreen = &USER_MENU;
 User_energy_label.Order = 19;
 User_energy_label.Left = 178;
 User_energy_label.Top = 203;
 User_energy_label.Width = 44;
 User_energy_label.Height = 16;
 User_energy_label.Visible = 1;
 User_energy_label.Active = 0;
 User_energy_label.Caption = User_energy_label_Caption;
 User_energy_label.FontName =  0x00003E9A ;
 User_energy_label.Font_Color = 0xFFFF;
 User_energy_label.VerticalText = 0;
 User_energy_label.OnUpPtr = 0;
 User_energy_label.OnDownPtr = 0;
 User_energy_label.OnClickPtr = 0;
 User_energy_label.OnPressPtr = 0;

 User_furnance_label.OwnerScreen = &USER_MENU;
 User_furnance_label.Order = 20;
 User_furnance_label.Left = 92;
 User_furnance_label.Top = 203;
 User_furnance_label.Width = 59;
 User_furnance_label.Height = 16;
 User_furnance_label.Visible = 1;
 User_furnance_label.Active = 0;
 User_furnance_label.Caption = User_furnance_label_Caption;
 User_furnance_label.FontName =  0x00003E9A ;
 User_furnance_label.Font_Color = 0xFFFF;
 User_furnance_label.VerticalText = 0;
 User_furnance_label.OnUpPtr = 0;
 User_furnance_label.OnDownPtr = 0;
 User_furnance_label.OnClickPtr = 0;
 User_furnance_label.OnPressPtr = 0;

 User_defrost_label.OwnerScreen = &USER_MENU;
 User_defrost_label.Order = 21;
 User_defrost_label.Left = 412;
 User_defrost_label.Top = 203;
 User_defrost_label.Width = 45;
 User_defrost_label.Height = 16;
 User_defrost_label.Visible = 1;
 User_defrost_label.Active = 0;
 User_defrost_label.Caption = User_defrost_label_Caption;
 User_defrost_label.FontName =  0x00003E9A ;
 User_defrost_label.Font_Color = 0xFFFF;
 User_defrost_label.VerticalText = 0;
 User_defrost_label.OnUpPtr = 0;
 User_defrost_label.OnDownPtr = 0;
 User_defrost_label.OnClickPtr = 0;
 User_defrost_label.OnPressPtr = 0;

 Label77.OwnerScreen = &USER_MENU;
 Label77.Order = 22;
 Label77.Left = 109;
 Label77.Top = 106;
 Label77.Width = 6;
 Label77.Height = 16;
 Label77.Visible = 1;
 Label77.Active = 0;
 Label77.Caption = Label77_Caption;
 Label77.FontName =  0x00003E9A ;
 Label77.Font_Color = 0xFFFF;
 Label77.VerticalText = 0;
 Label77.OnUpPtr = 0;
 Label77.OnDownPtr = 0;
 Label77.OnClickPtr = 0;
 Label77.OnPressPtr = 0;

 user_set_time.OwnerScreen = &USER_MENU;
 user_set_time.Order = 23;
 user_set_time.Left = 9;
 user_set_time.Top = 39;
 user_set_time.Width = 71;
 user_set_time.Height = 66;
 user_set_time.Picture_Type = 1;
 user_set_time.Picture_Ratio = 1;
 user_set_time.Picture_Name =  0x000B0E86 ;
 user_set_time.Visible = 1;
 user_set_time.Active = 0;
 user_set_time.OnUpPtr = user_set_timeOnUp;
 user_set_time.OnDownPtr = 0;
 user_set_time.OnClickPtr = 0;
 user_set_time.OnPressPtr = user_set_timeOnPress;

 user_check_temperature.OwnerScreen = &USER_MENU;
 user_check_temperature.Order = 24;
 user_check_temperature.Left = 88;
 user_check_temperature.Top = 39;
 user_check_temperature.Width = 70;
 user_check_temperature.Height = 66;
 user_check_temperature.Picture_Type = 1;
 user_check_temperature.Picture_Ratio = 1;
 user_check_temperature.Picture_Name =  0x000B3328 ;
 user_check_temperature.Visible = 1;
 user_check_temperature.Active = 1;
 user_check_temperature.OnUpPtr = user_check_temperatureOnUp;
 user_check_temperature.OnDownPtr = 0;
 user_check_temperature.OnClickPtr = 0;
 user_check_temperature.OnPressPtr = user_check_temperatureOnPress;

 user_set_LAN.OwnerScreen = &USER_MENU;
 user_set_LAN.Order = 25;
 user_set_LAN.Left = 165;
 user_set_LAN.Top = 39;
 user_set_LAN.Width = 71;
 user_set_LAN.Height = 66;
 user_set_LAN.Picture_Type = 1;
 user_set_LAN.Picture_Ratio = 1;
 user_set_LAN.Picture_Name =  0x000B5746 ;
 user_set_LAN.Visible = 1;
 user_set_LAN.Active = 0;
 user_set_LAN.OnUpPtr = user_set_LANOnUp;
 user_set_LAN.OnDownPtr = 0;
 user_set_LAN.OnClickPtr = 0;
 user_set_LAN.OnPressPtr = user_set_LANOnPress;

 user_check_errors.OwnerScreen = &USER_MENU;
 user_check_errors.Order = 26;
 user_check_errors.Left = 244;
 user_check_errors.Top = 39;
 user_check_errors.Width = 71;
 user_check_errors.Height = 66;
 user_check_errors.Picture_Type = 1;
 user_check_errors.Picture_Ratio = 1;
 user_check_errors.Picture_Name =  0x000B7BE8 ;
 user_check_errors.Visible = 1;
 user_check_errors.Active = 1;
 user_check_errors.OnUpPtr = user_check_errorsOnUp;
 user_check_errors.OnDownPtr = 0;
 user_check_errors.OnClickPtr = 0;
 user_check_errors.OnPressPtr = user_check_errorsOnPress;

 user_set_timers.OwnerScreen = &USER_MENU;
 user_set_timers.Order = 27;
 user_set_timers.Left = 322;
 user_set_timers.Top = 39;
 user_set_timers.Width = 70;
 user_set_timers.Height = 66;
 user_set_timers.Picture_Type = 1;
 user_set_timers.Picture_Ratio = 1;
 user_set_timers.Picture_Name =  0x000BA08A ;
 user_set_timers.Visible = 1;
 user_set_timers.Active = 0;
 user_set_timers.OnUpPtr = user_set_timersOnUp;
 user_set_timers.OnDownPtr = 0;
 user_set_timers.OnClickPtr = 0;
 user_set_timers.OnPressPtr = user_set_timersOnPress;

 User_history_check.OwnerScreen = &USER_MENU;
 User_history_check.Order = 28;
 User_history_check.Left = 9;
 User_history_check.Top = 136;
 User_history_check.Width = 71;
 User_history_check.Height = 66;
 User_history_check.Picture_Type = 1;
 User_history_check.Picture_Ratio = 1;
 User_history_check.Picture_Name =  0x000BC4A8 ;
 User_history_check.Visible = 1;
 User_history_check.Active = 0;
 User_history_check.OnUpPtr = User_history_checkOnUp;
 User_history_check.OnDownPtr = 0;
 User_history_check.OnClickPtr = 0;
 User_history_check.OnPressPtr = User_history_checkOnPress;

 user_check_energy.OwnerScreen = &USER_MENU;
 user_check_energy.Order = 29;
 user_check_energy.Left = 165;
 user_check_energy.Top = 136;
 user_check_energy.Width = 71;
 user_check_energy.Height = 66;
 user_check_energy.Picture_Type = 1;
 user_check_energy.Picture_Ratio = 1;
 user_check_energy.Picture_Name =  0x000BE94A ;
 user_check_energy.Visible = 1;
 user_check_energy.Active = 1;
 user_check_energy.OnUpPtr = user_energyOnUp;
 user_check_energy.OnDownPtr = 0;
 user_check_energy.OnClickPtr = 0;
 user_check_energy.OnPressPtr = user_energyOnPress;

 admin_set_system.OwnerScreen = &USER_MENU;
 admin_set_system.Order = 30;
 admin_set_system.Left = 322;
 admin_set_system.Top = 136;
 admin_set_system.Width = 71;
 admin_set_system.Height = 66;
 admin_set_system.Picture_Type = 1;
 admin_set_system.Picture_Ratio = 1;
 admin_set_system.Picture_Name =  0x000C0DEC ;
 admin_set_system.Visible = 1;
 admin_set_system.Active = 1;
 admin_set_system.OnUpPtr = admin_set_systemOnUp;
 admin_set_system.OnDownPtr = 0;
 admin_set_system.OnClickPtr = 0;
 admin_set_system.OnPressPtr = admin_set_systemOnPress;

 user_check_graph.OwnerScreen = &USER_MENU;
 user_check_graph.Order = 31;
 user_check_graph.Left = 88;
 user_check_graph.Top = 136;
 user_check_graph.Width = 70;
 user_check_graph.Height = 66;
 user_check_graph.Picture_Type = 1;
 user_check_graph.Picture_Ratio = 1;
 user_check_graph.Picture_Name =  0x000C328E ;
 user_check_graph.Visible = 1;
 user_check_graph.Active = 0;
 user_check_graph.OnUpPtr = furnanceUP;
 user_check_graph.OnDownPtr = 0;
 user_check_graph.OnClickPtr = 0;
 user_check_graph.OnPressPtr = furnanceDown;

 Image57.OwnerScreen = &USER_MENU;
 Image57.Order = 32;
 Image57.Left = 400;
 Image57.Top = 136;
 Image57.Width = 71;
 Image57.Height = 66;
 Image57.Picture_Type = 1;
 Image57.Picture_Ratio = 1;
 Image57.Picture_Name =  0x000C56AC ;
 Image57.Visible = 0;
 Image57.Active = 0;
 Image57.OnUpPtr = 0;
 Image57.OnDownPtr = 0;
 Image57.OnClickPtr = 0;
 Image57.OnPressPtr = 0;

 user_defrost.OwnerScreen = &USER_MENU;
 user_defrost.Order = 33;
 user_defrost.Left = 400;
 user_defrost.Top = 136;
 user_defrost.Width = 71;
 user_defrost.Height = 66;
 user_defrost.Picture_Type = 1;
 user_defrost.Picture_Ratio = 1;
 user_defrost.Picture_Name =  0x000C7B4E ;
 user_defrost.Visible = 1;
 user_defrost.Active = 0;
 user_defrost.OnUpPtr = user_defrostOnUp;
 user_defrost.OnDownPtr = 0;
 user_defrost.OnClickPtr = 0;
 user_defrost.OnPressPtr = user_defrostOnPress;

 Home_b1.OwnerScreen = &USER_MENU;
 Home_b1.Order = 34;
 Home_b1.Left = 189;
 Home_b1.Top = 228;
 Home_b1.Width = 78;
 Home_b1.Height = 35;
 Home_b1.Pen_Width = 1;
 Home_b1.Pen_Color = 0xC618;
 Home_b1.Visible = 1;
 Home_b1.Active = 1;
 Home_b1.Transparent = 1;
 Home_b1.Caption = Home_b1_Caption;
 Home_b1.TextAlign = _taCenter;
 Home_b1.TextAlignVertical= _tavMiddle;
 Home_b1.FontName =  0x00005242 ;
 Home_b1.PressColEnabled = 1;
 Home_b1.Font_Color = 0xD6BA;
 Home_b1.VerticalText = 0;
 Home_b1.Gradient = 1;
 Home_b1.Gradient_Orientation = 0;
 Home_b1.Gradient_Start_Color = 0x0418;
 Home_b1.Gradient_End_Color = 0x00A5;
 Home_b1.Color = 0xC618;
 Home_b1.Press_Color = 0xE71C;
 Home_b1.Corner_Radius = 5;
 Home_b1.OnUpPtr = 0;
 Home_b1.OnDownPtr = 0;
 Home_b1.OnClickPtr = BackToHome;
 Home_b1.OnPressPtr = 0;

 user_hysterezis.OwnerScreen = &USER_MENU;
 user_hysterezis.Order = 35;
 user_hysterezis.Left = 400;
 user_hysterezis.Top = 39;
 user_hysterezis.Width = 71;
 user_hysterezis.Height = 66;
 user_hysterezis.Picture_Type = 1;
 user_hysterezis.Picture_Ratio = 1;
 user_hysterezis.Picture_Name =  0x000C9FF0 ;
 user_hysterezis.Visible = 1;
 user_hysterezis.Active = 1;
 user_hysterezis.OnUpPtr = user_hysterezisOnUp;
 user_hysterezis.OnDownPtr = 0;
 user_hysterezis.OnClickPtr = 0;
 user_hysterezis.OnPressPtr = user_hysterezisOnPress;

 user_setting.OwnerScreen = &USER_MENU;
 user_setting.Order = 36;
 user_setting.Left = 244;
 user_setting.Top = 136;
 user_setting.Width = 70;
 user_setting.Height = 66;
 user_setting.Picture_Type = 1;
 user_setting.Picture_Ratio = 1;
 user_setting.Picture_Name =  0x000CC492 ;
 user_setting.Visible = 1;
 user_setting.Active = 0;
 user_setting.OnUpPtr = user_settingOnUp;
 user_setting.OnDownPtr = 0;
 user_setting.OnClickPtr = 0;
 user_setting.OnPressPtr = user_settingOnPress;

 User_operational_label.OwnerScreen = &USER_MENU;
 User_operational_label.Order = 37;
 User_operational_label.Left = 252;
 User_operational_label.Top = 203;
 User_operational_label.Width = 52;
 User_operational_label.Height = 16;
 User_operational_label.Visible = 1;
 User_operational_label.Active = 0;
 User_operational_label.Caption = User_operational_label_Caption;
 User_operational_label.FontName =  0x00003E9A ;
 User_operational_label.Font_Color = 0xFFFF;
 User_operational_label.VerticalText = 0;
 User_operational_label.OnUpPtr = 0;
 User_operational_label.OnDownPtr = 0;
 User_operational_label.OnClickPtr = 0;
 User_operational_label.OnPressPtr = 0;

 User_hysterezis_label.OwnerScreen = &USER_MENU;
 User_hysterezis_label.Order = 38;
 User_hysterezis_label.Left = 409;
 User_hysterezis_label.Top = 105;
 User_hysterezis_label.Width = 51;
 User_hysterezis_label.Height = 16;
 User_hysterezis_label.Visible = 1;
 User_hysterezis_label.Active = 0;
 User_hysterezis_label.Caption = User_hysterezis_label_Caption;
 User_hysterezis_label.FontName =  0x00003E9A ;
 User_hysterezis_label.Font_Color = 0xFFFF;
 User_hysterezis_label.VerticalText = 0;
 User_hysterezis_label.OnUpPtr = 0;
 User_hysterezis_label.OnDownPtr = 0;
 User_hysterezis_label.OnClickPtr = 0;
 User_hysterezis_label.OnPressPtr = 0;

 User_system_label.OwnerScreen = &USER_MENU;
 User_system_label.Order = 39;
 User_system_label.Left = 334;
 User_system_label.Top = 203;
 User_system_label.Width = 46;
 User_system_label.Height = 16;
 User_system_label.Visible = 1;
 User_system_label.Active = 0;
 User_system_label.Caption = User_system_label_Caption;
 User_system_label.FontName =  0x00003E9A ;
 User_system_label.Font_Color = 0xFFFF;
 User_system_label.VerticalText = 0;
 User_system_label.OnUpPtr = 0;
 User_system_label.OnDownPtr = 0;
 User_system_label.OnClickPtr = 0;
 User_system_label.OnPressPtr = 0;

 Image27.OwnerScreen = &EEV;
 Image27.Order = 0;
 Image27.Left = 2;
 Image27.Top = 0;
 Image27.Width = 480;
 Image27.Height = 272;
 Image27.Picture_Type = 1;
 Image27.Picture_Ratio = 1;
 Image27.Picture_Name =  0x0003CAAE ;
 Image27.Visible = 1;
 Image27.Active = 0;
 Image27.OnUpPtr = 0;
 Image27.OnDownPtr = 0;
 Image27.OnClickPtr = 0;
 Image27.OnPressPtr = 0;

 Image173.OwnerScreen = &EEV;
 Image173.Order = 1;
 Image173.Left = 10;
 Image173.Top = 50;
 Image173.Width = 463;
 Image173.Height = 32;
 Image173.Picture_Type = 1;
 Image173.Picture_Ratio = 1;
 Image173.Picture_Name =  0x000CE8B0 ;
 Image173.Visible = 1;
 Image173.Active = 0;
 Image173.OnUpPtr = 0;
 Image173.OnDownPtr = 0;
 Image173.OnClickPtr = 0;
 Image173.OnPressPtr = 0;

 DEC_EEV1.OwnerScreen = &EEV;
 DEC_EEV1.Order = 2;
 DEC_EEV1.Left = 8;
 DEC_EEV1.Top = 145;
 DEC_EEV1.Width = 30;
 DEC_EEV1.Height = 30;
 DEC_EEV1.Pen_Width = 1;
 DEC_EEV1.Pen_Color = 0x0000;
 DEC_EEV1.Visible = 1;
 DEC_EEV1.Active = 1;
 DEC_EEV1.Transparent = 1;
 DEC_EEV1.Caption = DEC_EEV1_Caption;
 DEC_EEV1.TextAlign = _taCenter;
 DEC_EEV1.TextAlignVertical= _tavMiddle;
 DEC_EEV1.FontName =  0x00005242 ;
 DEC_EEV1.PressColEnabled = 1;
 DEC_EEV1.Font_Color = 0xFFFF;
 DEC_EEV1.VerticalText = 0;
 DEC_EEV1.Gradient = 1;
 DEC_EEV1.Gradient_Orientation = 0;
 DEC_EEV1.Gradient_Start_Color = 0xFEDB;
 DEC_EEV1.Gradient_End_Color = 0xF800;
 DEC_EEV1.Color = 0xC618;
 DEC_EEV1.Press_Color = 0xE71C;
 DEC_EEV1.Corner_Radius = 3;
 DEC_EEV1.OnUpPtr = 0;
 DEC_EEV1.OnDownPtr = 0;
 DEC_EEV1.OnClickPtr = 0;
 DEC_EEV1.OnPressPtr = DEC_EEV1OnPress;

 INC_EEV1.OwnerScreen = &EEV;
 INC_EEV1.Order = 3;
 INC_EEV1.Left = 442;
 INC_EEV1.Top = 145;
 INC_EEV1.Width = 30;
 INC_EEV1.Height = 30;
 INC_EEV1.Pen_Width = 1;
 INC_EEV1.Pen_Color = 0x0000;
 INC_EEV1.Visible = 1;
 INC_EEV1.Active = 1;
 INC_EEV1.Transparent = 1;
 INC_EEV1.Caption = INC_EEV1_Caption;
 INC_EEV1.TextAlign = _taCenter;
 INC_EEV1.TextAlignVertical= _tavMiddle;
 INC_EEV1.FontName =  0x00005242 ;
 INC_EEV1.PressColEnabled = 1;
 INC_EEV1.Font_Color = 0xFFFF;
 INC_EEV1.VerticalText = 0;
 INC_EEV1.Gradient = 1;
 INC_EEV1.Gradient_Orientation = 0;
 INC_EEV1.Gradient_Start_Color = 0xFEDB;
 INC_EEV1.Gradient_End_Color = 0xF800;
 INC_EEV1.Color = 0xC618;
 INC_EEV1.Press_Color = 0xE71C;
 INC_EEV1.Corner_Radius = 3;
 INC_EEV1.OnUpPtr = 0;
 INC_EEV1.OnDownPtr = 0;
 INC_EEV1.OnClickPtr = 0;
 INC_EEV1.OnPressPtr = INC_EEV1OnPress;

 Red_bar.OwnerScreen = &EEV;
 Red_bar.Order = 4;
 Red_bar.Left = 40;
 Red_bar.Top = 145;
 Red_bar.Width = 400;
 Red_bar.Height = 30;
 Red_bar.Pen_Width = 1;
 Red_bar.Pen_Color = 0x0000;
 Red_bar.Visible = 1;
 Red_bar.Transparent = 1;
 Red_bar.Caption = Red_bar_Caption;
 Red_bar.FontName =  0x00005242 ;
 Red_bar.Font_Color = 0x0000;
 Red_bar.Gradient = 1;
 Red_bar.Gradient_Orientation = 0;
 Red_bar.Gradient_Start_Color = 0xFEDB;
 Red_bar.Gradient_End_Color = 0xF800;
 Red_bar.Color = 0xA65E;
 Red_bar.Background_Color = 0x8410;
 Red_bar.Min = 0;
 Red_bar.Max = 480;
 Red_bar.Position = 240;
 Red_bar.Prev_Position = 240;
 Red_bar.Show_Position = 1;
 Red_bar.Show_Percentage = 0;
 Red_bar.Smooth = 0;
 Red_bar.Rounded = 1;
 Red_bar.Corner_Radius = 1;

 EEV1_set_step_label.OwnerScreen = &EEV;
 EEV1_set_step_label.Order = 5;
 EEV1_set_step_label.Left = 210;
 EEV1_set_step_label.Top = 113;
 EEV1_set_step_label.Width = 74;
 EEV1_set_step_label.Height = 20;
 EEV1_set_step_label.Visible = 1;
 EEV1_set_step_label.Active = 0;
 EEV1_set_step_label.Caption = EEV1_set_step_label_Caption;
 EEV1_set_step_label.FontName =  0x00005242 ;
 EEV1_set_step_label.Font_Color = 0xFFFF;
 EEV1_set_step_label.VerticalText = 0;
 EEV1_set_step_label.OnUpPtr = 0;
 EEV1_set_step_label.OnDownPtr = 0;
 EEV1_set_step_label.OnClickPtr = 0;
 EEV1_set_step_label.OnPressPtr = 0;

 EEV1_label.OwnerScreen = &EEV;
 EEV1_label.Order = 6;
 EEV1_label.Left = 195;
 EEV1_label.Top = 5;
 EEV1_label.Width = 112;
 EEV1_label.Height = 20;
 EEV1_label.Visible = 1;
 EEV1_label.Active = 0;
 EEV1_label.Caption = EEV1_label_Caption;
 EEV1_label.FontName =  0x00005242 ;
 EEV1_label.Font_Color = 0xE7FC;
 EEV1_label.VerticalText = 0;
 EEV1_label.OnUpPtr = 0;
 EEV1_label.OnDownPtr = 0;
 EEV1_label.OnClickPtr = 0;
 EEV1_label.OnPressPtr = 0;

 Home_b2.OwnerScreen = &EEV;
 Home_b2.Order = 7;
 Home_b2.Left = 202;
 Home_b2.Top = 232;
 Home_b2.Width = 78;
 Home_b2.Height = 35;
 Home_b2.Pen_Width = 1;
 Home_b2.Pen_Color = 0xC618;
 Home_b2.Visible = 1;
 Home_b2.Active = 1;
 Home_b2.Transparent = 1;
 Home_b2.Caption = Home_b2_Caption;
 Home_b2.TextAlign = _taCenter;
 Home_b2.TextAlignVertical= _tavMiddle;
 Home_b2.FontName =  0x00005242 ;
 Home_b2.PressColEnabled = 1;
 Home_b2.Font_Color = 0xD6BA;
 Home_b2.VerticalText = 0;
 Home_b2.Gradient = 1;
 Home_b2.Gradient_Orientation = 0;
 Home_b2.Gradient_Start_Color = 0x0418;
 Home_b2.Gradient_End_Color = 0x00A5;
 Home_b2.Color = 0xC618;
 Home_b2.Press_Color = 0xE71C;
 Home_b2.Corner_Radius = 5;
 Home_b2.OnUpPtr = 0;
 Home_b2.OnDownPtr = 0;
 Home_b2.OnClickPtr = BackToHome;
 Home_b2.OnPressPtr = 0;

 Back_b2.OwnerScreen = &EEV;
 Back_b2.Order = 8;
 Back_b2.Left = 118;
 Back_b2.Top = 232;
 Back_b2.Width = 78;
 Back_b2.Height = 35;
 Back_b2.Pen_Width = 1;
 Back_b2.Pen_Color = 0xC618;
 Back_b2.Visible = 1;
 Back_b2.Active = 1;
 Back_b2.Transparent = 1;
 Back_b2.Caption = Back_b2_Caption;
 Back_b2.TextAlign = _taCenter;
 Back_b2.TextAlignVertical= _tavMiddle;
 Back_b2.FontName =  0x00005242 ;
 Back_b2.PressColEnabled = 1;
 Back_b2.Font_Color = 0xD6BA;
 Back_b2.VerticalText = 0;
 Back_b2.Gradient = 1;
 Back_b2.Gradient_Orientation = 0;
 Back_b2.Gradient_Start_Color = 0x0418;
 Back_b2.Gradient_End_Color = 0x00A5;
 Back_b2.Color = 0xC618;
 Back_b2.Press_Color = 0xE71C;
 Back_b2.Corner_Radius = 5;
 Back_b2.OnUpPtr = 0;
 Back_b2.OnDownPtr = 0;
 Back_b2.OnClickPtr = goToBack;
 Back_b2.OnPressPtr = 0;

 Next_b1.OwnerScreen = &EEV;
 Next_b1.Order = 9;
 Next_b1.Left = 286;
 Next_b1.Top = 232;
 Next_b1.Width = 78;
 Next_b1.Height = 35;
 Next_b1.Pen_Width = 1;
 Next_b1.Pen_Color = 0xC618;
 Next_b1.Visible = 1;
 Next_b1.Active = 0;
 Next_b1.Transparent = 1;
 Next_b1.Caption = Next_b1_Caption;
 Next_b1.TextAlign = _taCenter;
 Next_b1.TextAlignVertical= _tavMiddle;
 Next_b1.FontName =  0x00005242 ;
 Next_b1.PressColEnabled = 1;
 Next_b1.Font_Color = 0xD6BA;
 Next_b1.VerticalText = 0;
 Next_b1.Gradient = 1;
 Next_b1.Gradient_Orientation = 0;
 Next_b1.Gradient_Start_Color = 0x0418;
 Next_b1.Gradient_End_Color = 0x00A5;
 Next_b1.Color = 0xC618;
 Next_b1.Press_Color = 0xE71C;
 Next_b1.Corner_Radius = 5;
 Next_b1.OnUpPtr = 0;
 Next_b1.OnDownPtr = 0;
 Next_b1.OnClickPtr = nextPage;
 Next_b1.OnPressPtr = 0;

 EEV1_superheat.OwnerScreen = &EEV;
 EEV1_superheat.Order = 10;
 EEV1_superheat.Left = 204;
 EEV1_superheat.Top = 51;
 EEV1_superheat.Width = 44;
 EEV1_superheat.Height = 27;
 EEV1_superheat.Pen_Width = 1;
 EEV1_superheat.Pen_Color = 0x0000;
 EEV1_superheat.Visible = 1;
 EEV1_superheat.Active = 1;
 EEV1_superheat.Transparent = 1;
 EEV1_superheat.Caption = EEV1_superheat_Caption;
 EEV1_superheat.TextAlign = _taCenter;
 EEV1_superheat.TextAlignVertical= _tavMiddle;
 EEV1_superheat.FontName =  0x00005242 ;
 EEV1_superheat.PressColEnabled = 1;
 EEV1_superheat.Font_Color = 0xF800;
 EEV1_superheat.VerticalText = 0;
 EEV1_superheat.Gradient = 0;
 EEV1_superheat.Gradient_Orientation = 0;
 EEV1_superheat.Gradient_Start_Color = 0xFFFF;
 EEV1_superheat.Gradient_End_Color = 0xC618;
 EEV1_superheat.Color = 0xFFFF;
 EEV1_superheat.Press_Color = 0xE71C;
 EEV1_superheat.Corner_Radius = 3;
 EEV1_superheat.OnUpPtr = 0;
 EEV1_superheat.OnDownPtr = 0;
 EEV1_superheat.OnClickPtr = 0;
 EEV1_superheat.OnPressPtr = 0;

 EEV1_value.OwnerScreen = &EEV;
 EEV1_value.Order = 11;
 EEV1_value.Left = 286;
 EEV1_value.Top = 51;
 EEV1_value.Width = 48;
 EEV1_value.Height = 27;
 EEV1_value.Pen_Width = 1;
 EEV1_value.Pen_Color = 0x0000;
 EEV1_value.Visible = 1;
 EEV1_value.Active = 1;
 EEV1_value.Transparent = 1;
 EEV1_value.Caption = EEV1_value_Caption;
 EEV1_value.TextAlign = _taCenter;
 EEV1_value.TextAlignVertical= _tavMiddle;
 EEV1_value.FontName =  0x00005242 ;
 EEV1_value.PressColEnabled = 1;
 EEV1_value.Font_Color = 0xF800;
 EEV1_value.VerticalText = 0;
 EEV1_value.Gradient = 0;
 EEV1_value.Gradient_Orientation = 0;
 EEV1_value.Gradient_Start_Color = 0xFFFF;
 EEV1_value.Gradient_End_Color = 0xC618;
 EEV1_value.Color = 0xFFFF;
 EEV1_value.Press_Color = 0xE71C;
 EEV1_value.Corner_Radius = 3;
 EEV1_value.OnUpPtr = 0;
 EEV1_value.OnDownPtr = 0;
 EEV1_value.OnClickPtr = 0;
 EEV1_value.OnPressPtr = 0;

 CircleButton9.OwnerScreen = &EEV;
 CircleButton9.Order = 12;
 CircleButton9.Left = 450;
 CircleButton9.Top = 3;
 CircleButton9.Radius = 12;
 CircleButton9.Pen_Width = 1;
 CircleButton9.Pen_Color = 0x0000;
 CircleButton9.Visible = 0;
 CircleButton9.Active = 0;
 CircleButton9.Transparent = 1;
 CircleButton9.Caption = CircleButton9_Caption;
 CircleButton9.TextAlign = _taCenter;
 CircleButton9.TextAlignVertical= _tavMiddle;
 CircleButton9.FontName =  0x00005242 ;
 CircleButton9.PressColEnabled = 1;
 CircleButton9.Font_Color = 0x0000;
 CircleButton9.VerticalText = 0;
 CircleButton9.Gradient = 1;
 CircleButton9.Gradient_Orientation = 0;
 CircleButton9.Gradient_Start_Color = 0xFFFF;
 CircleButton9.Gradient_End_Color = 0xC618;
 CircleButton9.Color = 0xC618;
 CircleButton9.Press_Color = 0xE71C;
 CircleButton9.OnUpPtr = 0;
 CircleButton9.OnDownPtr = 0;
 CircleButton9.OnClickPtr = 0;
 CircleButton9.OnPressPtr = 0;

 ButtonRound1.OwnerScreen = &EEV;
 ButtonRound1.Order = 13;
 ButtonRound1.Left = 404;
 ButtonRound1.Top = 52;
 ButtonRound1.Width = 66;
 ButtonRound1.Height = 26;
 ButtonRound1.Pen_Width = 1;
 ButtonRound1.Pen_Color = 0xFFFF;
 ButtonRound1.Visible = 1;
 ButtonRound1.Active = 1;
 ButtonRound1.Transparent = 1;
 ButtonRound1.Caption = ButtonRound1_Caption;
 ButtonRound1.TextAlign = _taCenter;
 ButtonRound1.TextAlignVertical= _tavMiddle;
 ButtonRound1.FontName =  0x0003C41F ;
 ButtonRound1.PressColEnabled = 1;
 ButtonRound1.Font_Color = 0xFFFF;
 ButtonRound1.VerticalText = 0;
 ButtonRound1.Gradient = 1;
 ButtonRound1.Gradient_Orientation = 0;
 ButtonRound1.Gradient_Start_Color = 0x0418;
 ButtonRound1.Gradient_End_Color = 0x00A5;
 ButtonRound1.Color = 0xC618;
 ButtonRound1.Press_Color = 0xE71C;
 ButtonRound1.Corner_Radius = 3;
 ButtonRound1.OnUpPtr = 0;
 ButtonRound1.OnDownPtr = 0;
 ButtonRound1.OnClickPtr = Set_Trv;
 ButtonRound1.OnPressPtr = 0;

 Image31.OwnerScreen = &Keyboard;
 Image31.Order = 0;
 Image31.Left = 0;
 Image31.Top = 0;
 Image31.Width = 480;
 Image31.Height = 272;
 Image31.Picture_Type = 1;
 Image31.Picture_Ratio = 1;
 Image31.Picture_Name =  0x0003CAAE ;
 Image31.Visible = 1;
 Image31.Active = 0;
 Image31.OnUpPtr = 0;
 Image31.OnDownPtr = 0;
 Image31.OnClickPtr = 0;
 Image31.OnPressPtr = 0;

 _1.OwnerScreen = &Keyboard;
 _1.Order = 1;
 _1.Left = 14;
 _1.Top = 80;
 _1.Width = 40;
 _1.Height = 35;
 _1.Pen_Width = 1;
 _1.Pen_Color = 0x0000;
 _1.Visible = 1;
 _1.Active = 1;
 _1.Transparent = 1;
 _1.Caption = _1_Caption;
 _1.TextAlign = _taCenter;
 _1.TextAlignVertical= _tavMiddle;
 _1.FontName =  0x00005242 ;
 _1.PressColEnabled = 1;
 _1.Font_Color = 0xFFFF;
 _1.VerticalText = 0;
 _1.Gradient = 1;
 _1.Gradient_Orientation = 0;
 _1.Gradient_Start_Color = 0x9CF3;
 _1.Gradient_End_Color = 0x0000;
 _1.Color = 0xC618;
 _1.Press_Color = 0xE71C;
 _1.Corner_Radius = 3;
 _1.OnUpPtr = 0;
 _1.OnDownPtr = 0;
 _1.OnClickPtr = _1OnClick;
 _1.OnPressPtr = 0;

 _2.OwnerScreen = &Keyboard;
 _2.Order = 2;
 _2.Left = 56;
 _2.Top = 80;
 _2.Width = 40;
 _2.Height = 35;
 _2.Pen_Width = 1;
 _2.Pen_Color = 0x0000;
 _2.Visible = 1;
 _2.Active = 1;
 _2.Transparent = 1;
 _2.Caption = _2_Caption;
 _2.TextAlign = _taCenter;
 _2.TextAlignVertical= _tavMiddle;
 _2.FontName =  0x00005242 ;
 _2.PressColEnabled = 1;
 _2.Font_Color = 0xFFFF;
 _2.VerticalText = 0;
 _2.Gradient = 1;
 _2.Gradient_Orientation = 0;
 _2.Gradient_Start_Color = 0x9CF3;
 _2.Gradient_End_Color = 0x0000;
 _2.Color = 0xC618;
 _2.Press_Color = 0xE71C;
 _2.Corner_Radius = 3;
 _2.OnUpPtr = 0;
 _2.OnDownPtr = 0;
 _2.OnClickPtr = _2OnClick;
 _2.OnPressPtr = 0;

 _3.OwnerScreen = &Keyboard;
 _3.Order = 3;
 _3.Left = 98;
 _3.Top = 80;
 _3.Width = 40;
 _3.Height = 35;
 _3.Pen_Width = 1;
 _3.Pen_Color = 0x0000;
 _3.Visible = 1;
 _3.Active = 1;
 _3.Transparent = 1;
 _3.Caption = _3_Caption;
 _3.TextAlign = _taCenter;
 _3.TextAlignVertical= _tavMiddle;
 _3.FontName =  0x00005242 ;
 _3.PressColEnabled = 1;
 _3.Font_Color = 0xFFFF;
 _3.VerticalText = 0;
 _3.Gradient = 1;
 _3.Gradient_Orientation = 0;
 _3.Gradient_Start_Color = 0x9CF3;
 _3.Gradient_End_Color = 0x0000;
 _3.Color = 0xC618;
 _3.Press_Color = 0xE71C;
 _3.Corner_Radius = 3;
 _3.OnUpPtr = 0;
 _3.OnDownPtr = 0;
 _3.OnClickPtr = _3OnClick;
 _3.OnPressPtr = 0;

 _4.OwnerScreen = &Keyboard;
 _4.Order = 4;
 _4.Left = 140;
 _4.Top = 80;
 _4.Width = 40;
 _4.Height = 35;
 _4.Pen_Width = 1;
 _4.Pen_Color = 0x0000;
 _4.Visible = 1;
 _4.Active = 1;
 _4.Transparent = 1;
 _4.Caption = _4_Caption;
 _4.TextAlign = _taCenter;
 _4.TextAlignVertical= _tavMiddle;
 _4.FontName =  0x00005242 ;
 _4.PressColEnabled = 1;
 _4.Font_Color = 0xFFFF;
 _4.VerticalText = 0;
 _4.Gradient = 1;
 _4.Gradient_Orientation = 0;
 _4.Gradient_Start_Color = 0x9CF3;
 _4.Gradient_End_Color = 0x0000;
 _4.Color = 0xC618;
 _4.Press_Color = 0xE71C;
 _4.Corner_Radius = 3;
 _4.OnUpPtr = 0;
 _4.OnDownPtr = 0;
 _4.OnClickPtr = _4OnClick;
 _4.OnPressPtr = 0;

 _5.OwnerScreen = &Keyboard;
 _5.Order = 5;
 _5.Left = 182;
 _5.Top = 80;
 _5.Width = 40;
 _5.Height = 35;
 _5.Pen_Width = 1;
 _5.Pen_Color = 0x0000;
 _5.Visible = 1;
 _5.Active = 1;
 _5.Transparent = 1;
 _5.Caption = _5_Caption;
 _5.TextAlign = _taCenter;
 _5.TextAlignVertical= _tavMiddle;
 _5.FontName =  0x00005242 ;
 _5.PressColEnabled = 1;
 _5.Font_Color = 0xFFFF;
 _5.VerticalText = 0;
 _5.Gradient = 1;
 _5.Gradient_Orientation = 0;
 _5.Gradient_Start_Color = 0x9CF3;
 _5.Gradient_End_Color = 0x0000;
 _5.Color = 0xC618;
 _5.Press_Color = 0xE71C;
 _5.Corner_Radius = 3;
 _5.OnUpPtr = 0;
 _5.OnDownPtr = 0;
 _5.OnClickPtr = _5OnClick;
 _5.OnPressPtr = 0;

 _6.OwnerScreen = &Keyboard;
 _6.Order = 6;
 _6.Left = 224;
 _6.Top = 80;
 _6.Width = 40;
 _6.Height = 35;
 _6.Pen_Width = 1;
 _6.Pen_Color = 0x0000;
 _6.Visible = 1;
 _6.Active = 1;
 _6.Transparent = 1;
 _6.Caption = _6_Caption;
 _6.TextAlign = _taCenter;
 _6.TextAlignVertical= _tavMiddle;
 _6.FontName =  0x00005242 ;
 _6.PressColEnabled = 1;
 _6.Font_Color = 0xFFFF;
 _6.VerticalText = 0;
 _6.Gradient = 1;
 _6.Gradient_Orientation = 0;
 _6.Gradient_Start_Color = 0x9CF3;
 _6.Gradient_End_Color = 0x0000;
 _6.Color = 0xC618;
 _6.Press_Color = 0xE71C;
 _6.Corner_Radius = 3;
 _6.OnUpPtr = 0;
 _6.OnDownPtr = 0;
 _6.OnClickPtr = _6OnClick;
 _6.OnPressPtr = 0;

 _7.OwnerScreen = &Keyboard;
 _7.Order = 7;
 _7.Left = 266;
 _7.Top = 80;
 _7.Width = 40;
 _7.Height = 35;
 _7.Pen_Width = 1;
 _7.Pen_Color = 0x0000;
 _7.Visible = 1;
 _7.Active = 1;
 _7.Transparent = 1;
 _7.Caption = _7_Caption;
 _7.TextAlign = _taCenter;
 _7.TextAlignVertical= _tavMiddle;
 _7.FontName =  0x00005242 ;
 _7.PressColEnabled = 1;
 _7.Font_Color = 0xFFFF;
 _7.VerticalText = 0;
 _7.Gradient = 1;
 _7.Gradient_Orientation = 0;
 _7.Gradient_Start_Color = 0x9CF3;
 _7.Gradient_End_Color = 0x0000;
 _7.Color = 0xC618;
 _7.Press_Color = 0xE71C;
 _7.Corner_Radius = 3;
 _7.OnUpPtr = 0;
 _7.OnDownPtr = 0;
 _7.OnClickPtr = _7OnClick;
 _7.OnPressPtr = 0;

 _8.OwnerScreen = &Keyboard;
 _8.Order = 8;
 _8.Left = 308;
 _8.Top = 80;
 _8.Width = 40;
 _8.Height = 35;
 _8.Pen_Width = 1;
 _8.Pen_Color = 0x0000;
 _8.Visible = 1;
 _8.Active = 1;
 _8.Transparent = 1;
 _8.Caption = _8_Caption;
 _8.TextAlign = _taCenter;
 _8.TextAlignVertical= _tavMiddle;
 _8.FontName =  0x00005242 ;
 _8.PressColEnabled = 1;
 _8.Font_Color = 0xFFFF;
 _8.VerticalText = 0;
 _8.Gradient = 1;
 _8.Gradient_Orientation = 0;
 _8.Gradient_Start_Color = 0x9CF3;
 _8.Gradient_End_Color = 0x0000;
 _8.Color = 0xC618;
 _8.Press_Color = 0xE71C;
 _8.Corner_Radius = 3;
 _8.OnUpPtr = 0;
 _8.OnDownPtr = 0;
 _8.OnClickPtr = _8OnClick;
 _8.OnPressPtr = 0;

 _9.OwnerScreen = &Keyboard;
 _9.Order = 9;
 _9.Left = 350;
 _9.Top = 80;
 _9.Width = 40;
 _9.Height = 35;
 _9.Pen_Width = 1;
 _9.Pen_Color = 0x0000;
 _9.Visible = 1;
 _9.Active = 1;
 _9.Transparent = 1;
 _9.Caption = _9_Caption;
 _9.TextAlign = _taCenter;
 _9.TextAlignVertical= _tavMiddle;
 _9.FontName =  0x00005242 ;
 _9.PressColEnabled = 1;
 _9.Font_Color = 0xFFFF;
 _9.VerticalText = 0;
 _9.Gradient = 1;
 _9.Gradient_Orientation = 0;
 _9.Gradient_Start_Color = 0x9CF3;
 _9.Gradient_End_Color = 0x0000;
 _9.Color = 0xC618;
 _9.Press_Color = 0xE71C;
 _9.Corner_Radius = 3;
 _9.OnUpPtr = 0;
 _9.OnDownPtr = 0;
 _9.OnClickPtr = _9OnClick;
 _9.OnPressPtr = 0;

 _0.OwnerScreen = &Keyboard;
 _0.Order = 10;
 _0.Left = 392;
 _0.Top = 80;
 _0.Width = 40;
 _0.Height = 35;
 _0.Pen_Width = 1;
 _0.Pen_Color = 0x0000;
 _0.Visible = 1;
 _0.Active = 1;
 _0.Transparent = 1;
 _0.Caption = _0_Caption;
 _0.TextAlign = _taCenter;
 _0.TextAlignVertical= _tavMiddle;
 _0.FontName =  0x00005242 ;
 _0.PressColEnabled = 1;
 _0.Font_Color = 0xFFFF;
 _0.VerticalText = 0;
 _0.Gradient = 1;
 _0.Gradient_Orientation = 0;
 _0.Gradient_Start_Color = 0x9CF3;
 _0.Gradient_End_Color = 0x0000;
 _0.Color = 0xC618;
 _0.Press_Color = 0xE71C;
 _0.Corner_Radius = 3;
 _0.OnUpPtr = 0;
 _0.OnDownPtr = 0;
 _0.OnClickPtr = _0OnClick;
 _0.OnPressPtr = 0;

 _Q.OwnerScreen = &Keyboard;
 _Q.Order = 11;
 _Q.Left = 28;
 _Q.Top = 116;
 _Q.Width = 40;
 _Q.Height = 35;
 _Q.Pen_Width = 1;
 _Q.Pen_Color = 0x0000;
 _Q.Visible = 1;
 _Q.Active = 1;
 _Q.Transparent = 1;
 _Q.Caption = _Q_Caption;
 _Q.TextAlign = _taCenter;
 _Q.TextAlignVertical= _tavMiddle;
 _Q.FontName =  0x00005242 ;
 _Q.PressColEnabled = 1;
 _Q.Font_Color = 0xFFFF;
 _Q.VerticalText = 0;
 _Q.Gradient = 1;
 _Q.Gradient_Orientation = 0;
 _Q.Gradient_Start_Color = 0x9CF3;
 _Q.Gradient_End_Color = 0x0000;
 _Q.Color = 0xC618;
 _Q.Press_Color = 0xE71C;
 _Q.Corner_Radius = 3;
 _Q.OnUpPtr = 0;
 _Q.OnDownPtr = 0;
 _Q.OnClickPtr = _QOnClick;
 _Q.OnPressPtr = 0;

 _W.OwnerScreen = &Keyboard;
 _W.Order = 12;
 _W.Left = 71;
 _W.Top = 116;
 _W.Width = 40;
 _W.Height = 35;
 _W.Pen_Width = 1;
 _W.Pen_Color = 0x0000;
 _W.Visible = 1;
 _W.Active = 1;
 _W.Transparent = 1;
 _W.Caption = _W_Caption;
 _W.TextAlign = _taCenter;
 _W.TextAlignVertical= _tavMiddle;
 _W.FontName =  0x00005242 ;
 _W.PressColEnabled = 1;
 _W.Font_Color = 0xFFFF;
 _W.VerticalText = 0;
 _W.Gradient = 1;
 _W.Gradient_Orientation = 0;
 _W.Gradient_Start_Color = 0x9CF3;
 _W.Gradient_End_Color = 0x0000;
 _W.Color = 0xC618;
 _W.Press_Color = 0xE71C;
 _W.Corner_Radius = 3;
 _W.OnUpPtr = 0;
 _W.OnDownPtr = 0;
 _W.OnClickPtr = _WOnClick;
 _W.OnPressPtr = 0;

 _E.OwnerScreen = &Keyboard;
 _E.Order = 13;
 _E.Left = 113;
 _E.Top = 116;
 _E.Width = 40;
 _E.Height = 35;
 _E.Pen_Width = 1;
 _E.Pen_Color = 0x0000;
 _E.Visible = 1;
 _E.Active = 1;
 _E.Transparent = 1;
 _E.Caption = _E_Caption;
 _E.TextAlign = _taCenter;
 _E.TextAlignVertical= _tavMiddle;
 _E.FontName =  0x00005242 ;
 _E.PressColEnabled = 1;
 _E.Font_Color = 0xFFFF;
 _E.VerticalText = 0;
 _E.Gradient = 1;
 _E.Gradient_Orientation = 0;
 _E.Gradient_Start_Color = 0x9CF3;
 _E.Gradient_End_Color = 0x0000;
 _E.Color = 0xC618;
 _E.Press_Color = 0xE71C;
 _E.Corner_Radius = 3;
 _E.OnUpPtr = 0;
 _E.OnDownPtr = 0;
 _E.OnClickPtr = _EOnClick;
 _E.OnPressPtr = 0;

 _R.OwnerScreen = &Keyboard;
 _R.Order = 14;
 _R.Left = 155;
 _R.Top = 116;
 _R.Width = 40;
 _R.Height = 35;
 _R.Pen_Width = 1;
 _R.Pen_Color = 0x0000;
 _R.Visible = 1;
 _R.Active = 1;
 _R.Transparent = 1;
 _R.Caption = _R_Caption;
 _R.TextAlign = _taCenter;
 _R.TextAlignVertical= _tavMiddle;
 _R.FontName =  0x00005242 ;
 _R.PressColEnabled = 1;
 _R.Font_Color = 0xFFFF;
 _R.VerticalText = 0;
 _R.Gradient = 1;
 _R.Gradient_Orientation = 0;
 _R.Gradient_Start_Color = 0x9CF3;
 _R.Gradient_End_Color = 0x0000;
 _R.Color = 0xC618;
 _R.Press_Color = 0xE71C;
 _R.Corner_Radius = 3;
 _R.OnUpPtr = 0;
 _R.OnDownPtr = 0;
 _R.OnClickPtr = _ROnClick;
 _R.OnPressPtr = 0;

 _T.OwnerScreen = &Keyboard;
 _T.Order = 15;
 _T.Left = 197;
 _T.Top = 116;
 _T.Width = 40;
 _T.Height = 35;
 _T.Pen_Width = 1;
 _T.Pen_Color = 0x0000;
 _T.Visible = 1;
 _T.Active = 1;
 _T.Transparent = 1;
 _T.Caption = _T_Caption;
 _T.TextAlign = _taCenter;
 _T.TextAlignVertical= _tavMiddle;
 _T.FontName =  0x00005242 ;
 _T.PressColEnabled = 1;
 _T.Font_Color = 0xFFFF;
 _T.VerticalText = 0;
 _T.Gradient = 1;
 _T.Gradient_Orientation = 0;
 _T.Gradient_Start_Color = 0x9CF3;
 _T.Gradient_End_Color = 0x0000;
 _T.Color = 0xC618;
 _T.Press_Color = 0xE71C;
 _T.Corner_Radius = 3;
 _T.OnUpPtr = 0;
 _T.OnDownPtr = 0;
 _T.OnClickPtr = _TOnClick;
 _T.OnPressPtr = 0;

 _Y.OwnerScreen = &Keyboard;
 _Y.Order = 16;
 _Y.Left = 239;
 _Y.Top = 116;
 _Y.Width = 40;
 _Y.Height = 35;
 _Y.Pen_Width = 1;
 _Y.Pen_Color = 0x0000;
 _Y.Visible = 1;
 _Y.Active = 1;
 _Y.Transparent = 1;
 _Y.Caption = _Y_Caption;
 _Y.TextAlign = _taCenter;
 _Y.TextAlignVertical= _tavMiddle;
 _Y.FontName =  0x00005242 ;
 _Y.PressColEnabled = 1;
 _Y.Font_Color = 0xFFFF;
 _Y.VerticalText = 0;
 _Y.Gradient = 1;
 _Y.Gradient_Orientation = 0;
 _Y.Gradient_Start_Color = 0x9CF3;
 _Y.Gradient_End_Color = 0x0000;
 _Y.Color = 0xC618;
 _Y.Press_Color = 0xE71C;
 _Y.Corner_Radius = 3;
 _Y.OnUpPtr = 0;
 _Y.OnDownPtr = 0;
 _Y.OnClickPtr = _YOnClick;
 _Y.OnPressPtr = 0;

 _U.OwnerScreen = &Keyboard;
 _U.Order = 17;
 _U.Left = 281;
 _U.Top = 116;
 _U.Width = 40;
 _U.Height = 35;
 _U.Pen_Width = 1;
 _U.Pen_Color = 0x0000;
 _U.Visible = 1;
 _U.Active = 1;
 _U.Transparent = 1;
 _U.Caption = _U_Caption;
 _U.TextAlign = _taCenter;
 _U.TextAlignVertical= _tavMiddle;
 _U.FontName =  0x00005242 ;
 _U.PressColEnabled = 1;
 _U.Font_Color = 0xFFFF;
 _U.VerticalText = 0;
 _U.Gradient = 1;
 _U.Gradient_Orientation = 0;
 _U.Gradient_Start_Color = 0x9CF3;
 _U.Gradient_End_Color = 0x0000;
 _U.Color = 0xC618;
 _U.Press_Color = 0xE71C;
 _U.Corner_Radius = 3;
 _U.OnUpPtr = 0;
 _U.OnDownPtr = 0;
 _U.OnClickPtr = _UOnClick;
 _U.OnPressPtr = 0;

 _I.OwnerScreen = &Keyboard;
 _I.Order = 18;
 _I.Left = 323;
 _I.Top = 116;
 _I.Width = 40;
 _I.Height = 35;
 _I.Pen_Width = 1;
 _I.Pen_Color = 0x0000;
 _I.Visible = 1;
 _I.Active = 1;
 _I.Transparent = 1;
 _I.Caption = _I_Caption;
 _I.TextAlign = _taCenter;
 _I.TextAlignVertical= _tavMiddle;
 _I.FontName =  0x00005242 ;
 _I.PressColEnabled = 1;
 _I.Font_Color = 0xFFFF;
 _I.VerticalText = 0;
 _I.Gradient = 1;
 _I.Gradient_Orientation = 0;
 _I.Gradient_Start_Color = 0x9CF3;
 _I.Gradient_End_Color = 0x0000;
 _I.Color = 0xC618;
 _I.Press_Color = 0xE71C;
 _I.Corner_Radius = 3;
 _I.OnUpPtr = 0;
 _I.OnDownPtr = 0;
 _I.OnClickPtr = _IOnClick;
 _I.OnPressPtr = 0;

 _O.OwnerScreen = &Keyboard;
 _O.Order = 19;
 _O.Left = 365;
 _O.Top = 116;
 _O.Width = 40;
 _O.Height = 35;
 _O.Pen_Width = 1;
 _O.Pen_Color = 0x0000;
 _O.Visible = 1;
 _O.Active = 1;
 _O.Transparent = 1;
 _O.Caption = _O_Caption;
 _O.TextAlign = _taCenter;
 _O.TextAlignVertical= _tavMiddle;
 _O.FontName =  0x00005242 ;
 _O.PressColEnabled = 1;
 _O.Font_Color = 0xFFFF;
 _O.VerticalText = 0;
 _O.Gradient = 1;
 _O.Gradient_Orientation = 0;
 _O.Gradient_Start_Color = 0x9CF3;
 _O.Gradient_End_Color = 0x0000;
 _O.Color = 0xC618;
 _O.Press_Color = 0xE71C;
 _O.Corner_Radius = 3;
 _O.OnUpPtr = 0;
 _O.OnDownPtr = 0;
 _O.OnClickPtr = _OOnClick;
 _O.OnPressPtr = 0;

 _P.OwnerScreen = &Keyboard;
 _P.Order = 20;
 _P.Left = 408;
 _P.Top = 116;
 _P.Width = 40;
 _P.Height = 35;
 _P.Pen_Width = 1;
 _P.Pen_Color = 0x0000;
 _P.Visible = 1;
 _P.Active = 1;
 _P.Transparent = 1;
 _P.Caption = _P_Caption;
 _P.TextAlign = _taCenter;
 _P.TextAlignVertical= _tavMiddle;
 _P.FontName =  0x00005242 ;
 _P.PressColEnabled = 1;
 _P.Font_Color = 0xFFFF;
 _P.VerticalText = 0;
 _P.Gradient = 1;
 _P.Gradient_Orientation = 0;
 _P.Gradient_Start_Color = 0x9CF3;
 _P.Gradient_End_Color = 0x0000;
 _P.Color = 0xC618;
 _P.Press_Color = 0xE71C;
 _P.Corner_Radius = 3;
 _P.OnUpPtr = 0;
 _P.OnDownPtr = 0;
 _P.OnClickPtr = _POnClick;
 _P.OnPressPtr = 0;

 _A.OwnerScreen = &Keyboard;
 _A.Order = 21;
 _A.Left = 14;
 _A.Top = 152;
 _A.Width = 40;
 _A.Height = 35;
 _A.Pen_Width = 1;
 _A.Pen_Color = 0x0000;
 _A.Visible = 1;
 _A.Active = 1;
 _A.Transparent = 1;
 _A.Caption = _A_Caption;
 _A.TextAlign = _taCenter;
 _A.TextAlignVertical= _tavMiddle;
 _A.FontName =  0x00005242 ;
 _A.PressColEnabled = 1;
 _A.Font_Color = 0xFFFF;
 _A.VerticalText = 0;
 _A.Gradient = 1;
 _A.Gradient_Orientation = 0;
 _A.Gradient_Start_Color = 0x9CF3;
 _A.Gradient_End_Color = 0x0000;
 _A.Color = 0xC618;
 _A.Press_Color = 0xE71C;
 _A.Corner_Radius = 3;
 _A.OnUpPtr = 0;
 _A.OnDownPtr = 0;
 _A.OnClickPtr = _AOnClick;
 _A.OnPressPtr = 0;

 _S.OwnerScreen = &Keyboard;
 _S.Order = 22;
 _S.Left = 57;
 _S.Top = 152;
 _S.Width = 40;
 _S.Height = 35;
 _S.Pen_Width = 1;
 _S.Pen_Color = 0x0000;
 _S.Visible = 1;
 _S.Active = 1;
 _S.Transparent = 1;
 _S.Caption = _S_Caption;
 _S.TextAlign = _taCenter;
 _S.TextAlignVertical= _tavMiddle;
 _S.FontName =  0x00005242 ;
 _S.PressColEnabled = 1;
 _S.Font_Color = 0xFFFF;
 _S.VerticalText = 0;
 _S.Gradient = 1;
 _S.Gradient_Orientation = 0;
 _S.Gradient_Start_Color = 0x9CF3;
 _S.Gradient_End_Color = 0x0000;
 _S.Color = 0xC618;
 _S.Press_Color = 0xE71C;
 _S.Corner_Radius = 3;
 _S.OnUpPtr = 0;
 _S.OnDownPtr = 0;
 _S.OnClickPtr = _SOnClick;
 _S.OnPressPtr = 0;

 _D.OwnerScreen = &Keyboard;
 _D.Order = 23;
 _D.Left = 99;
 _D.Top = 152;
 _D.Width = 40;
 _D.Height = 35;
 _D.Pen_Width = 1;
 _D.Pen_Color = 0x0000;
 _D.Visible = 1;
 _D.Active = 1;
 _D.Transparent = 1;
 _D.Caption = _D_Caption;
 _D.TextAlign = _taCenter;
 _D.TextAlignVertical= _tavMiddle;
 _D.FontName =  0x00005242 ;
 _D.PressColEnabled = 1;
 _D.Font_Color = 0xFFFF;
 _D.VerticalText = 0;
 _D.Gradient = 1;
 _D.Gradient_Orientation = 0;
 _D.Gradient_Start_Color = 0x9CF3;
 _D.Gradient_End_Color = 0x0000;
 _D.Color = 0xC618;
 _D.Press_Color = 0xE71C;
 _D.Corner_Radius = 3;
 _D.OnUpPtr = 0;
 _D.OnDownPtr = 0;
 _D.OnClickPtr = _DOnClick;
 _D.OnPressPtr = 0;

 _F.OwnerScreen = &Keyboard;
 _F.Order = 24;
 _F.Left = 142;
 _F.Top = 152;
 _F.Width = 40;
 _F.Height = 35;
 _F.Pen_Width = 1;
 _F.Pen_Color = 0x0000;
 _F.Visible = 1;
 _F.Active = 1;
 _F.Transparent = 1;
 _F.Caption = _F_Caption;
 _F.TextAlign = _taCenter;
 _F.TextAlignVertical= _tavMiddle;
 _F.FontName =  0x00005242 ;
 _F.PressColEnabled = 1;
 _F.Font_Color = 0xFFFF;
 _F.VerticalText = 0;
 _F.Gradient = 1;
 _F.Gradient_Orientation = 0;
 _F.Gradient_Start_Color = 0x9CF3;
 _F.Gradient_End_Color = 0x0000;
 _F.Color = 0xC618;
 _F.Press_Color = 0xE71C;
 _F.Corner_Radius = 3;
 _F.OnUpPtr = 0;
 _F.OnDownPtr = 0;
 _F.OnClickPtr = _FOnClick;
 _F.OnPressPtr = 0;

 _G.OwnerScreen = &Keyboard;
 _G.Order = 25;
 _G.Left = 184;
 _G.Top = 152;
 _G.Width = 40;
 _G.Height = 35;
 _G.Pen_Width = 1;
 _G.Pen_Color = 0x0000;
 _G.Visible = 1;
 _G.Active = 1;
 _G.Transparent = 1;
 _G.Caption = _G_Caption;
 _G.TextAlign = _taCenter;
 _G.TextAlignVertical= _tavMiddle;
 _G.FontName =  0x00005242 ;
 _G.PressColEnabled = 1;
 _G.Font_Color = 0xFFFF;
 _G.VerticalText = 0;
 _G.Gradient = 1;
 _G.Gradient_Orientation = 0;
 _G.Gradient_Start_Color = 0x9CF3;
 _G.Gradient_End_Color = 0x0000;
 _G.Color = 0xC618;
 _G.Press_Color = 0xE71C;
 _G.Corner_Radius = 3;
 _G.OnUpPtr = 0;
 _G.OnDownPtr = 0;
 _G.OnClickPtr = _GOnClick;
 _G.OnPressPtr = 0;

 _H.OwnerScreen = &Keyboard;
 _H.Order = 26;
 _H.Left = 227;
 _H.Top = 152;
 _H.Width = 40;
 _H.Height = 35;
 _H.Pen_Width = 1;
 _H.Pen_Color = 0x0000;
 _H.Visible = 1;
 _H.Active = 1;
 _H.Transparent = 1;
 _H.Caption = _H_Caption;
 _H.TextAlign = _taCenter;
 _H.TextAlignVertical= _tavMiddle;
 _H.FontName =  0x00005242 ;
 _H.PressColEnabled = 1;
 _H.Font_Color = 0xFFFF;
 _H.VerticalText = 0;
 _H.Gradient = 1;
 _H.Gradient_Orientation = 0;
 _H.Gradient_Start_Color = 0x9CF3;
 _H.Gradient_End_Color = 0x0000;
 _H.Color = 0xC618;
 _H.Press_Color = 0xE71C;
 _H.Corner_Radius = 3;
 _H.OnUpPtr = 0;
 _H.OnDownPtr = 0;
 _H.OnClickPtr = _HOnClick;
 _H.OnPressPtr = 0;

 _J.OwnerScreen = &Keyboard;
 _J.Order = 27;
 _J.Left = 269;
 _J.Top = 152;
 _J.Width = 40;
 _J.Height = 35;
 _J.Pen_Width = 1;
 _J.Pen_Color = 0x0000;
 _J.Visible = 1;
 _J.Active = 1;
 _J.Transparent = 1;
 _J.Caption = _J_Caption;
 _J.TextAlign = _taCenter;
 _J.TextAlignVertical= _tavMiddle;
 _J.FontName =  0x00005242 ;
 _J.PressColEnabled = 1;
 _J.Font_Color = 0xFFFF;
 _J.VerticalText = 0;
 _J.Gradient = 1;
 _J.Gradient_Orientation = 0;
 _J.Gradient_Start_Color = 0x9CF3;
 _J.Gradient_End_Color = 0x0000;
 _J.Color = 0xC618;
 _J.Press_Color = 0xE71C;
 _J.Corner_Radius = 3;
 _J.OnUpPtr = 0;
 _J.OnDownPtr = 0;
 _J.OnClickPtr = _JOnClick;
 _J.OnPressPtr = 0;

 _K.OwnerScreen = &Keyboard;
 _K.Order = 28;
 _K.Left = 312;
 _K.Top = 152;
 _K.Width = 40;
 _K.Height = 35;
 _K.Pen_Width = 1;
 _K.Pen_Color = 0x0000;
 _K.Visible = 1;
 _K.Active = 1;
 _K.Transparent = 1;
 _K.Caption = _K_Caption;
 _K.TextAlign = _taCenter;
 _K.TextAlignVertical= _tavMiddle;
 _K.FontName =  0x00005242 ;
 _K.PressColEnabled = 1;
 _K.Font_Color = 0xFFFF;
 _K.VerticalText = 0;
 _K.Gradient = 1;
 _K.Gradient_Orientation = 0;
 _K.Gradient_Start_Color = 0x9CF3;
 _K.Gradient_End_Color = 0x0000;
 _K.Color = 0xC618;
 _K.Press_Color = 0xE71C;
 _K.Corner_Radius = 3;
 _K.OnUpPtr = 0;
 _K.OnDownPtr = 0;
 _K.OnClickPtr = _KOnClick;
 _K.OnPressPtr = 0;

 _L.OwnerScreen = &Keyboard;
 _L.Order = 29;
 _L.Left = 354;
 _L.Top = 152;
 _L.Width = 40;
 _L.Height = 35;
 _L.Pen_Width = 1;
 _L.Pen_Color = 0x0000;
 _L.Visible = 1;
 _L.Active = 1;
 _L.Transparent = 1;
 _L.Caption = _L_Caption;
 _L.TextAlign = _taCenter;
 _L.TextAlignVertical= _tavMiddle;
 _L.FontName =  0x00005242 ;
 _L.PressColEnabled = 1;
 _L.Font_Color = 0xFFFF;
 _L.VerticalText = 0;
 _L.Gradient = 1;
 _L.Gradient_Orientation = 0;
 _L.Gradient_Start_Color = 0x9CF3;
 _L.Gradient_End_Color = 0x0000;
 _L.Color = 0xC618;
 _L.Press_Color = 0xE71C;
 _L.Corner_Radius = 3;
 _L.OnUpPtr = 0;
 _L.OnDownPtr = 0;
 _L.OnClickPtr = _LOnClick;
 _L.OnPressPtr = 0;

 _Z.OwnerScreen = &Keyboard;
 _Z.Order = 30;
 _Z.Left = 84;
 _Z.Top = 188;
 _Z.Width = 40;
 _Z.Height = 35;
 _Z.Pen_Width = 1;
 _Z.Pen_Color = 0x0000;
 _Z.Visible = 1;
 _Z.Active = 1;
 _Z.Transparent = 1;
 _Z.Caption = _Z_Caption;
 _Z.TextAlign = _taCenter;
 _Z.TextAlignVertical= _tavMiddle;
 _Z.FontName =  0x00005242 ;
 _Z.PressColEnabled = 1;
 _Z.Font_Color = 0xFFFF;
 _Z.VerticalText = 0;
 _Z.Gradient = 1;
 _Z.Gradient_Orientation = 0;
 _Z.Gradient_Start_Color = 0x9CF3;
 _Z.Gradient_End_Color = 0x0000;
 _Z.Color = 0xC618;
 _Z.Press_Color = 0xE71C;
 _Z.Corner_Radius = 3;
 _Z.OnUpPtr = 0;
 _Z.OnDownPtr = 0;
 _Z.OnClickPtr = _ZOnClick;
 _Z.OnPressPtr = 0;

 _X.OwnerScreen = &Keyboard;
 _X.Order = 31;
 _X.Left = 127;
 _X.Top = 188;
 _X.Width = 40;
 _X.Height = 35;
 _X.Pen_Width = 1;
 _X.Pen_Color = 0x0000;
 _X.Visible = 1;
 _X.Active = 1;
 _X.Transparent = 1;
 _X.Caption = _X_Caption;
 _X.TextAlign = _taCenter;
 _X.TextAlignVertical= _tavMiddle;
 _X.FontName =  0x00005242 ;
 _X.PressColEnabled = 1;
 _X.Font_Color = 0xFFFF;
 _X.VerticalText = 0;
 _X.Gradient = 1;
 _X.Gradient_Orientation = 0;
 _X.Gradient_Start_Color = 0x9CF3;
 _X.Gradient_End_Color = 0x0000;
 _X.Color = 0xC618;
 _X.Press_Color = 0xE71C;
 _X.Corner_Radius = 3;
 _X.OnUpPtr = 0;
 _X.OnDownPtr = 0;
 _X.OnClickPtr = _XOnClick;
 _X.OnPressPtr = 0;

 _C.OwnerScreen = &Keyboard;
 _C.Order = 32;
 _C.Left = 169;
 _C.Top = 188;
 _C.Width = 40;
 _C.Height = 35;
 _C.Pen_Width = 1;
 _C.Pen_Color = 0x0000;
 _C.Visible = 1;
 _C.Active = 1;
 _C.Transparent = 1;
 _C.Caption = _C_Caption;
 _C.TextAlign = _taCenter;
 _C.TextAlignVertical= _tavMiddle;
 _C.FontName =  0x00005242 ;
 _C.PressColEnabled = 1;
 _C.Font_Color = 0xFFFF;
 _C.VerticalText = 0;
 _C.Gradient = 1;
 _C.Gradient_Orientation = 0;
 _C.Gradient_Start_Color = 0x9CF3;
 _C.Gradient_End_Color = 0x0000;
 _C.Color = 0xC618;
 _C.Press_Color = 0xE71C;
 _C.Corner_Radius = 3;
 _C.OnUpPtr = 0;
 _C.OnDownPtr = 0;
 _C.OnClickPtr = _COnClick;
 _C.OnPressPtr = 0;

 _V.OwnerScreen = &Keyboard;
 _V.Order = 33;
 _V.Left = 211;
 _V.Top = 188;
 _V.Width = 40;
 _V.Height = 35;
 _V.Pen_Width = 1;
 _V.Pen_Color = 0x0000;
 _V.Visible = 1;
 _V.Active = 1;
 _V.Transparent = 1;
 _V.Caption = _V_Caption;
 _V.TextAlign = _taCenter;
 _V.TextAlignVertical= _tavMiddle;
 _V.FontName =  0x00005242 ;
 _V.PressColEnabled = 1;
 _V.Font_Color = 0xFFFF;
 _V.VerticalText = 0;
 _V.Gradient = 1;
 _V.Gradient_Orientation = 0;
 _V.Gradient_Start_Color = 0x9CF3;
 _V.Gradient_End_Color = 0x0000;
 _V.Color = 0xC618;
 _V.Press_Color = 0xE71C;
 _V.Corner_Radius = 3;
 _V.OnUpPtr = 0;
 _V.OnDownPtr = 0;
 _V.OnClickPtr = _VOnClick;
 _V.OnPressPtr = 0;

 _B.OwnerScreen = &Keyboard;
 _B.Order = 34;
 _B.Left = 253;
 _B.Top = 188;
 _B.Width = 40;
 _B.Height = 35;
 _B.Pen_Width = 1;
 _B.Pen_Color = 0x0000;
 _B.Visible = 1;
 _B.Active = 1;
 _B.Transparent = 1;
 _B.Caption = _B_Caption;
 _B.TextAlign = _taCenter;
 _B.TextAlignVertical= _tavMiddle;
 _B.FontName =  0x00005242 ;
 _B.PressColEnabled = 1;
 _B.Font_Color = 0xFFFF;
 _B.VerticalText = 0;
 _B.Gradient = 1;
 _B.Gradient_Orientation = 0;
 _B.Gradient_Start_Color = 0x9CF3;
 _B.Gradient_End_Color = 0x0000;
 _B.Color = 0xC618;
 _B.Press_Color = 0xE71C;
 _B.Corner_Radius = 3;
 _B.OnUpPtr = 0;
 _B.OnDownPtr = 0;
 _B.OnClickPtr = _BOnClick;
 _B.OnPressPtr = 0;

 _N.OwnerScreen = &Keyboard;
 _N.Order = 35;
 _N.Left = 295;
 _N.Top = 188;
 _N.Width = 40;
 _N.Height = 35;
 _N.Pen_Width = 1;
 _N.Pen_Color = 0x0000;
 _N.Visible = 1;
 _N.Active = 1;
 _N.Transparent = 1;
 _N.Caption = _N_Caption;
 _N.TextAlign = _taCenter;
 _N.TextAlignVertical= _tavMiddle;
 _N.FontName =  0x00005242 ;
 _N.PressColEnabled = 1;
 _N.Font_Color = 0xFFFF;
 _N.VerticalText = 0;
 _N.Gradient = 1;
 _N.Gradient_Orientation = 0;
 _N.Gradient_Start_Color = 0x9CF3;
 _N.Gradient_End_Color = 0x0000;
 _N.Color = 0xC618;
 _N.Press_Color = 0xE71C;
 _N.Corner_Radius = 3;
 _N.OnUpPtr = 0;
 _N.OnDownPtr = 0;
 _N.OnClickPtr = _NOnClick;
 _N.OnPressPtr = 0;

 _M.OwnerScreen = &Keyboard;
 _M.Order = 36;
 _M.Left = 337;
 _M.Top = 188;
 _M.Width = 40;
 _M.Height = 35;
 _M.Pen_Width = 1;
 _M.Pen_Color = 0x0000;
 _M.Visible = 1;
 _M.Active = 1;
 _M.Transparent = 1;
 _M.Caption = _M_Caption;
 _M.TextAlign = _taCenter;
 _M.TextAlignVertical= _tavMiddle;
 _M.FontName =  0x00005242 ;
 _M.PressColEnabled = 1;
 _M.Font_Color = 0xFFFF;
 _M.VerticalText = 0;
 _M.Gradient = 1;
 _M.Gradient_Orientation = 0;
 _M.Gradient_Start_Color = 0x9CF3;
 _M.Gradient_End_Color = 0x0000;
 _M.Color = 0xC618;
 _M.Press_Color = 0xE71C;
 _M.Corner_Radius = 3;
 _M.OnUpPtr = 0;
 _M.OnDownPtr = 0;
 _M.OnClickPtr = _MOnClick;
 _M.OnPressPtr = 0;

 Clear.OwnerScreen = &Keyboard;
 Clear.Order = 37;
 Clear.Left = 396;
 Clear.Top = 152;
 Clear.Width = 41;
 Clear.Height = 35;
 Clear.Pen_Width = 1;
 Clear.Pen_Color = 0x0000;
 Clear.Visible = 1;
 Clear.Active = 1;
 Clear.Transparent = 1;
 Clear.Caption = Clear_Caption;
 Clear.TextAlign = _taCenter;
 Clear.TextAlignVertical= _tavMiddle;
 Clear.FontName =  0x00005242 ;
 Clear.PressColEnabled = 1;
 Clear.Font_Color = 0xFFFF;
 Clear.VerticalText = 0;
 Clear.Gradient = 1;
 Clear.Gradient_Orientation = 0;
 Clear.Gradient_Start_Color = 0x9CF3;
 Clear.Gradient_End_Color = 0x0000;
 Clear.Color = 0xC618;
 Clear.Press_Color = 0xE71C;
 Clear.Corner_Radius = 3;
 Clear.OnUpPtr = 0;
 Clear.OnDownPtr = 0;
 Clear.OnClickPtr = 0;
 Clear.OnPressPtr = ClearOnPress;

 CAPS_Switch.OwnerScreen = &Keyboard;
 CAPS_Switch.Order = 38;
 CAPS_Switch.Left = 15;
 CAPS_Switch.Top = 225;
 CAPS_Switch.Width = 94;
 CAPS_Switch.Height = 35;
 CAPS_Switch.Pen_Width = 1;
 CAPS_Switch.Pen_Color = 0x0000;
 CAPS_Switch.Visible = 1;
 CAPS_Switch.Active = 1;
 CAPS_Switch.Transparent = 1;
 CAPS_Switch.Caption = CAPS_Switch_Caption;
 CAPS_Switch.TextAlign = _taCenter;
 CAPS_Switch.TextAlignVertical= _tavMiddle;
 CAPS_Switch.FontName =  0x00005242 ;
 CAPS_Switch.PressColEnabled = 1;
 CAPS_Switch.Font_Color = 0xFFFF;
 CAPS_Switch.VerticalText = 0;
 CAPS_Switch.Gradient = 1;
 CAPS_Switch.Gradient_Orientation = 0;
 CAPS_Switch.Gradient_Start_Color = 0x9CF3;
 CAPS_Switch.Gradient_End_Color = 0x0000;
 CAPS_Switch.Color = 0xC618;
 CAPS_Switch.Press_Color = 0xE71C;
 CAPS_Switch.Corner_Radius = 3;
 CAPS_Switch.OnUpPtr = 0;
 CAPS_Switch.OnDownPtr = 0;
 CAPS_Switch.OnClickPtr = CAPS_SwitchOnClick;
 CAPS_Switch.OnPressPtr = 0;

 SPACE.OwnerScreen = &Keyboard;
 SPACE.Order = 39;
 SPACE.Left = 111;
 SPACE.Top = 225;
 SPACE.Width = 153;
 SPACE.Height = 35;
 SPACE.Pen_Width = 1;
 SPACE.Pen_Color = 0x0000;
 SPACE.Visible = 1;
 SPACE.Active = 1;
 SPACE.Transparent = 1;
 SPACE.Caption = SPACE_Caption;
 SPACE.TextAlign = _taCenter;
 SPACE.TextAlignVertical= _tavMiddle;
 SPACE.FontName =  0x00005242 ;
 SPACE.PressColEnabled = 1;
 SPACE.Font_Color = 0xFFFF;
 SPACE.VerticalText = 0;
 SPACE.Gradient = 1;
 SPACE.Gradient_Orientation = 0;
 SPACE.Gradient_Start_Color = 0x9CF3;
 SPACE.Gradient_End_Color = 0x0000;
 SPACE.Color = 0xC618;
 SPACE.Press_Color = 0xE71C;
 SPACE.Corner_Radius = 3;
 SPACE.OnUpPtr = 0;
 SPACE.OnDownPtr = 0;
 SPACE.OnClickPtr = SPACEOnClick;
 SPACE.OnPressPtr = 0;

 Password_box.OwnerScreen = &Keyboard;
 Password_box.Order = 40;
 Password_box.Left = 14;
 Password_box.Top = 34;
 Password_box.Width = 258;
 Password_box.Height = 38;
 Password_box.Pen_Width = 1;
 Password_box.Pen_Color = 0x0000;
 Password_box.Visible = 1;
 Password_box.Active = 0;
 Password_box.Transparent = 1;
 Password_box.Gradient = 0;
 Password_box.Gradient_Orientation = 0;
 Password_box.Gradient_Start_Color = 0xFFFF;
 Password_box.Gradient_End_Color = 0xC618;
 Password_box.Color = 0x0400;
 Password_box.PressColEnabled = 0;
 Password_box.Press_Color = 0xE71C;
 Password_box.OnUpPtr = 0;
 Password_box.OnDownPtr = 0;
 Password_box.OnClickPtr = 0;
 Password_box.OnPressPtr = 0;

 Label23.OwnerScreen = &Keyboard;
 Label23.Order = 41;
 Label23.Left = 31;
 Label23.Top = 42;
 Label23.Width = 0;
 Label23.Height = 20;
 Label23.Visible = 1;
 Label23.Active = 1;
 Label23.Caption = Label23_Caption;
 Label23.FontName =  0x00005242 ;
 Label23.Font_Color = 0xFFFF;
 Label23.VerticalText = 0;
 Label23.OnUpPtr = 0;
 Label23.OnDownPtr = 0;
 Label23.OnClickPtr = 0;
 Label23.OnPressPtr = 0;

 Admin_box.OwnerScreen = &Keyboard;
 Admin_box.Order = 42;
 Admin_box.Left = 278;
 Admin_box.Top = 34;
 Admin_box.Width = 187;
 Admin_box.Height = 38;
 Admin_box.Pen_Width = 1;
 Admin_box.Pen_Color = 0x0000;
 Admin_box.Visible = 1;
 Admin_box.Active = 0;
 Admin_box.Transparent = 1;
 Admin_box.Gradient = 0;
 Admin_box.Gradient_Orientation = 0;
 Admin_box.Gradient_Start_Color = 0xFFFF;
 Admin_box.Gradient_End_Color = 0xC618;
 Admin_box.Color = 0x0400;
 Admin_box.PressColEnabled = 0;
 Admin_box.Press_Color = 0xE71C;
 Admin_box.OnUpPtr = 0;
 Admin_box.OnDownPtr = 0;
 Admin_box.OnClickPtr = 0;
 Admin_box.OnPressPtr = 0;

 Label24.OwnerScreen = &Keyboard;
 Label24.Order = 43;
 Label24.Left = 292;
 Label24.Top = 44;
 Label24.Width = 158;
 Label24.Height = 20;
 Label24.Visible = 1;
 Label24.Active = 1;
 Label24.Caption = Label24_Caption;
 Label24.FontName =  0x00005242 ;
 Label24.Font_Color = 0xFFFF;
 Label24.VerticalText = 0;
 Label24.OnUpPtr = 0;
 Label24.OnDownPtr = 0;
 Label24.OnClickPtr = 0;
 Label24.OnPressPtr = 0;

 Keyboard_label.OwnerScreen = &Keyboard;
 Keyboard_label.Order = 44;
 Keyboard_label.Left = 201;
 Keyboard_label.Top = 5;
 Keyboard_label.Width = 94;
 Keyboard_label.Height = 20;
 Keyboard_label.Visible = 1;
 Keyboard_label.Active = 0;
 Keyboard_label.Caption = Keyboard_label_Caption;
 Keyboard_label.FontName =  0x00005242 ;
 Keyboard_label.Font_Color = 0xE7FC;
 Keyboard_label.VerticalText = 0;
 Keyboard_label.OnUpPtr = 0;
 Keyboard_label.OnDownPtr = 0;
 Keyboard_label.OnClickPtr = 0;
 Keyboard_label.OnPressPtr = 0;

 _DEL.OwnerScreen = &Keyboard;
 _DEL.Order = 45;
 _DEL.Left = 23;
 _DEL.Top = 188;
 _DEL.Width = 59;
 _DEL.Height = 35;
 _DEL.Pen_Width = 1;
 _DEL.Pen_Color = 0x0000;
 _DEL.Visible = 1;
 _DEL.Active = 1;
 _DEL.Transparent = 1;
 _DEL.Caption = _DEL_Caption;
 _DEL.TextAlign = _taCenter;
 _DEL.TextAlignVertical= _tavMiddle;
 _DEL.FontName =  0x00005242 ;
 _DEL.PressColEnabled = 1;
 _DEL.Font_Color = 0xFFFF;
 _DEL.VerticalText = 0;
 _DEL.Gradient = 1;
 _DEL.Gradient_Orientation = 0;
 _DEL.Gradient_Start_Color = 0x9CF3;
 _DEL.Gradient_End_Color = 0x0000;
 _DEL.Color = 0xC618;
 _DEL.Press_Color = 0xE71C;
 _DEL.Corner_Radius = 3;
 _DEL.OnUpPtr = 0;
 _DEL.OnDownPtr = 0;
 _DEL.OnClickPtr = _DELOnClick;
 _DEL.OnPressPtr = 0;

 _Colon.OwnerScreen = &Keyboard;
 _Colon.Order = 46;
 _Colon.Left = 309;
 _Colon.Top = 225;
 _Colon.Width = 40;
 _Colon.Height = 35;
 _Colon.Pen_Width = 1;
 _Colon.Pen_Color = 0x0000;
 _Colon.Visible = 1;
 _Colon.Active = 1;
 _Colon.Transparent = 1;
 _Colon.Caption = _Colon_Caption;
 _Colon.TextAlign = _taCenter;
 _Colon.TextAlignVertical= _tavMiddle;
 _Colon.FontName =  0x00005242 ;
 _Colon.PressColEnabled = 1;
 _Colon.Font_Color = 0xFFFF;
 _Colon.VerticalText = 0;
 _Colon.Gradient = 1;
 _Colon.Gradient_Orientation = 0;
 _Colon.Gradient_Start_Color = 0x9CF3;
 _Colon.Gradient_End_Color = 0x0000;
 _Colon.Color = 0xC618;
 _Colon.Press_Color = 0xE71C;
 _Colon.Corner_Radius = 3;
 _Colon.OnUpPtr = 0;
 _Colon.OnDownPtr = 0;
 _Colon.OnClickPtr = _ColonOnClick;
 _Colon.OnPressPtr = 0;

 _Comma.OwnerScreen = &Keyboard;
 _Comma.Order = 47;
 _Comma.Left = 351;
 _Comma.Top = 225;
 _Comma.Width = 40;
 _Comma.Height = 35;
 _Comma.Pen_Width = 1;
 _Comma.Pen_Color = 0x0000;
 _Comma.Visible = 1;
 _Comma.Active = 1;
 _Comma.Transparent = 1;
 _Comma.Caption = _Comma_Caption;
 _Comma.TextAlign = _taCenter;
 _Comma.TextAlignVertical= _tavMiddle;
 _Comma.FontName =  0x00005242 ;
 _Comma.PressColEnabled = 1;
 _Comma.Font_Color = 0xFFFF;
 _Comma.VerticalText = 0;
 _Comma.Gradient = 1;
 _Comma.Gradient_Orientation = 0;
 _Comma.Gradient_Start_Color = 0x9CF3;
 _Comma.Gradient_End_Color = 0x0000;
 _Comma.Color = 0xC618;
 _Comma.Press_Color = 0xE71C;
 _Comma.Corner_Radius = 3;
 _Comma.OnUpPtr = 0;
 _Comma.OnDownPtr = 0;
 _Comma.OnClickPtr = _CommaOnClick;
 _Comma.OnPressPtr = 0;

 _Slash.OwnerScreen = &Keyboard;
 _Slash.Order = 48;
 _Slash.Left = 267;
 _Slash.Top = 225;
 _Slash.Width = 40;
 _Slash.Height = 35;
 _Slash.Pen_Width = 1;
 _Slash.Pen_Color = 0x0000;
 _Slash.Visible = 1;
 _Slash.Active = 1;
 _Slash.Transparent = 1;
 _Slash.Caption = _Slash_Caption;
 _Slash.TextAlign = _taCenter;
 _Slash.TextAlignVertical= _tavMiddle;
 _Slash.FontName =  0x00005242 ;
 _Slash.PressColEnabled = 1;
 _Slash.Font_Color = 0xFFFF;
 _Slash.VerticalText = 0;
 _Slash.Gradient = 1;
 _Slash.Gradient_Orientation = 0;
 _Slash.Gradient_Start_Color = 0x9CF3;
 _Slash.Gradient_End_Color = 0x0000;
 _Slash.Color = 0xC618;
 _Slash.Press_Color = 0xE71C;
 _Slash.Corner_Radius = 3;
 _Slash.OnUpPtr = 0;
 _Slash.OnDownPtr = 0;
 _Slash.OnClickPtr = _SlashOnClick;
 _Slash.OnPressPtr = 0;

 ENTER.OwnerScreen = &Keyboard;
 ENTER.Order = 49;
 ENTER.Left = 380;
 ENTER.Top = 188;
 ENTER.Width = 69;
 ENTER.Height = 35;
 ENTER.Pen_Width = 1;
 ENTER.Pen_Color = 0x0000;
 ENTER.Visible = 0;
 ENTER.Active = 0;
 ENTER.Transparent = 1;
 ENTER.Caption = ENTER_Caption;
 ENTER.TextAlign = _taCenter;
 ENTER.TextAlignVertical= _tavMiddle;
 ENTER.FontName =  0x00005242 ;
 ENTER.PressColEnabled = 1;
 ENTER.Font_Color = 0xFFFF;
 ENTER.VerticalText = 0;
 ENTER.Gradient = 1;
 ENTER.Gradient_Orientation = 0;
 ENTER.Gradient_Start_Color = 0x9CF3;
 ENTER.Gradient_End_Color = 0x0000;
 ENTER.Color = 0xC618;
 ENTER.Press_Color = 0xE71C;
 ENTER.Corner_Radius = 3;
 ENTER.OnUpPtr = 0;
 ENTER.OnDownPtr = 0;
 ENTER.OnClickPtr = ENTEROnClick;
 ENTER.OnPressPtr = 0;

 Home_b3.OwnerScreen = &Keyboard;
 Home_b3.Order = 50;
 Home_b3.Left = 393;
 Home_b3.Top = 225;
 Home_b3.Width = 76;
 Home_b3.Height = 35;
 Home_b3.Pen_Width = 1;
 Home_b3.Pen_Color = 0x0000;
 Home_b3.Visible = 1;
 Home_b3.Active = 1;
 Home_b3.Transparent = 1;
 Home_b3.Caption = Home_b3_Caption;
 Home_b3.TextAlign = _taCenter;
 Home_b3.TextAlignVertical= _tavMiddle;
 Home_b3.FontName =  0x00005242 ;
 Home_b3.PressColEnabled = 1;
 Home_b3.Font_Color = 0xFFFF;
 Home_b3.VerticalText = 0;
 Home_b3.Gradient = 1;
 Home_b3.Gradient_Orientation = 0;
 Home_b3.Gradient_Start_Color = 0x0418;
 Home_b3.Gradient_End_Color = 0x00A5;
 Home_b3.Color = 0xC618;
 Home_b3.Press_Color = 0xE71C;
 Home_b3.Corner_Radius = 3;
 Home_b3.OnUpPtr = 0;
 Home_b3.OnDownPtr = 0;
 Home_b3.OnClickPtr = BackToHome;
 Home_b3.OnPressPtr = 0;

 Image32.OwnerScreen = &SetRTC;
 Image32.Order = 0;
 Image32.Left = 0;
 Image32.Top = 0;
 Image32.Width = 480;
 Image32.Height = 272;
 Image32.Picture_Type = 1;
 Image32.Picture_Ratio = 1;
 Image32.Picture_Name =  0x0003CAAE ;
 Image32.Visible = 1;
 Image32.Active = 0;
 Image32.OnUpPtr = 0;
 Image32.OnDownPtr = 0;
 Image32.OnClickPtr = 0;
 Image32.OnPressPtr = 0;

 Ten_minutesUp.OwnerScreen = &SetRTC;
 Ten_minutesUp.Order = 1;
 Ten_minutesUp.Left = 399;
 Ten_minutesUp.Top = 42;
 Ten_minutesUp.Width = 37;
 Ten_minutesUp.Height = 42;
 Ten_minutesUp.Pen_Width = 1;
 Ten_minutesUp.Pen_Color = 0x0000;
 Ten_minutesUp.Visible = 1;
 Ten_minutesUp.Active = 1;
 Ten_minutesUp.Transparent = 1;
 Ten_minutesUp.Caption = Ten_minutesUp_Caption;
 Ten_minutesUp.TextAlign = _taCenter;
 Ten_minutesUp.TextAlignVertical= _tavMiddle;
 Ten_minutesUp.FontName =  0x0001F2E5 ;
 Ten_minutesUp.PressColEnabled = 1;
 Ten_minutesUp.Font_Color = 0x0000;
 Ten_minutesUp.VerticalText = 0;
 Ten_minutesUp.Gradient = 1;
 Ten_minutesUp.Gradient_Orientation = 0;
 Ten_minutesUp.Gradient_Start_Color = 0xFFFF;
 Ten_minutesUp.Gradient_End_Color = 0xC618;
 Ten_minutesUp.Color = 0xC618;
 Ten_minutesUp.Press_Color = 0xE71C;
 Ten_minutesUp.OnUpPtr = Ten_minutesUpOnUp;
 Ten_minutesUp.OnDownPtr = 0;
 Ten_minutesUp.OnClickPtr = Ten_minutesUpOnClick;
 Ten_minutesUp.OnPressPtr = Ten_minutesUpOnPress;

 Ten_minutesDwn.OwnerScreen = &SetRTC;
 Ten_minutesDwn.Order = 2;
 Ten_minutesDwn.Left = 399;
 Ten_minutesDwn.Top = 84;
 Ten_minutesDwn.Width = 37;
 Ten_minutesDwn.Height = 42;
 Ten_minutesDwn.Pen_Width = 1;
 Ten_minutesDwn.Pen_Color = 0x0000;
 Ten_minutesDwn.Visible = 1;
 Ten_minutesDwn.Active = 1;
 Ten_minutesDwn.Transparent = 1;
 Ten_minutesDwn.Caption = Ten_minutesDwn_Caption;
 Ten_minutesDwn.TextAlign = _taCenter;
 Ten_minutesDwn.TextAlignVertical= _tavMiddle;
 Ten_minutesDwn.FontName =  0x0001F2E5 ;
 Ten_minutesDwn.PressColEnabled = 1;
 Ten_minutesDwn.Font_Color = 0x0000;
 Ten_minutesDwn.VerticalText = 0;
 Ten_minutesDwn.Gradient = 1;
 Ten_minutesDwn.Gradient_Orientation = 0;
 Ten_minutesDwn.Gradient_Start_Color = 0xFFFF;
 Ten_minutesDwn.Gradient_End_Color = 0xC618;
 Ten_minutesDwn.Color = 0xC618;
 Ten_minutesDwn.Press_Color = 0xE71C;
 Ten_minutesDwn.OnUpPtr = Ten_minutesDwnOnUp;
 Ten_minutesDwn.OnDownPtr = 0;
 Ten_minutesDwn.OnClickPtr = Ten_minutesDwnOnClick;
 Ten_minutesDwn.OnPressPtr = Ten_minutesDwnOnPress;

 Ten_minutes.OwnerScreen = &SetRTC;
 Ten_minutes.Order = 3;
 Ten_minutes.Left = 402;
 Ten_minutes.Top = 48;
 Ten_minutes.Width = 32;
 Ten_minutes.Height = 75;
 Ten_minutes.Visible = 1;
 Ten_minutes.Active = 0;
 Ten_minutes.Caption = Ten_minutes_Caption;
 Ten_minutes.FontName =  0x000351E7 ;
 Ten_minutes.Font_Color = 0x738E;
 Ten_minutes.VerticalText = 0;
 Ten_minutes.OnUpPtr = 0;
 Ten_minutes.OnDownPtr = 0;
 Ten_minutes.OnClickPtr = 0;
 Ten_minutes.OnPressPtr = 0;

 Unit_minutesUp.OwnerScreen = &SetRTC;
 Unit_minutesUp.Order = 4;
 Unit_minutesUp.Left = 435;
 Unit_minutesUp.Top = 42;
 Unit_minutesUp.Width = 37;
 Unit_minutesUp.Height = 42;
 Unit_minutesUp.Pen_Width = 1;
 Unit_minutesUp.Pen_Color = 0x0000;
 Unit_minutesUp.Visible = 1;
 Unit_minutesUp.Active = 1;
 Unit_minutesUp.Transparent = 1;
 Unit_minutesUp.Caption = Unit_minutesUp_Caption;
 Unit_minutesUp.TextAlign = _taCenter;
 Unit_minutesUp.TextAlignVertical= _tavMiddle;
 Unit_minutesUp.FontName =  0x0001F2E5 ;
 Unit_minutesUp.PressColEnabled = 1;
 Unit_minutesUp.Font_Color = 0x0000;
 Unit_minutesUp.VerticalText = 0;
 Unit_minutesUp.Gradient = 1;
 Unit_minutesUp.Gradient_Orientation = 0;
 Unit_minutesUp.Gradient_Start_Color = 0xFFFF;
 Unit_minutesUp.Gradient_End_Color = 0xC618;
 Unit_minutesUp.Color = 0xC618;
 Unit_minutesUp.Press_Color = 0xE71C;
 Unit_minutesUp.OnUpPtr = Unit_minutesUpOnUp;
 Unit_minutesUp.OnDownPtr = 0;
 Unit_minutesUp.OnClickPtr = Unit_minutesUpOnClick;
 Unit_minutesUp.OnPressPtr = Unit_minutesUpOnPress;

 Unit_minutesDwn.OwnerScreen = &SetRTC;
 Unit_minutesDwn.Order = 5;
 Unit_minutesDwn.Left = 435;
 Unit_minutesDwn.Top = 84;
 Unit_minutesDwn.Width = 37;
 Unit_minutesDwn.Height = 42;
 Unit_minutesDwn.Pen_Width = 1;
 Unit_minutesDwn.Pen_Color = 0x0000;
 Unit_minutesDwn.Visible = 1;
 Unit_minutesDwn.Active = 1;
 Unit_minutesDwn.Transparent = 1;
 Unit_minutesDwn.Caption = Unit_minutesDwn_Caption;
 Unit_minutesDwn.TextAlign = _taCenter;
 Unit_minutesDwn.TextAlignVertical= _tavMiddle;
 Unit_minutesDwn.FontName =  0x0001F2E5 ;
 Unit_minutesDwn.PressColEnabled = 1;
 Unit_minutesDwn.Font_Color = 0x0000;
 Unit_minutesDwn.VerticalText = 0;
 Unit_minutesDwn.Gradient = 1;
 Unit_minutesDwn.Gradient_Orientation = 0;
 Unit_minutesDwn.Gradient_Start_Color = 0xFFFF;
 Unit_minutesDwn.Gradient_End_Color = 0xC618;
 Unit_minutesDwn.Color = 0xC618;
 Unit_minutesDwn.Press_Color = 0xE71C;
 Unit_minutesDwn.OnUpPtr = Unit_minutesDwnOnUp;
 Unit_minutesDwn.OnDownPtr = 0;
 Unit_minutesDwn.OnClickPtr = Unit_minutesDwnOnClick;
 Unit_minutesDwn.OnPressPtr = Unit_minutesDwnOnPress;

 Unit_minutes.OwnerScreen = &SetRTC;
 Unit_minutes.Order = 6;
 Unit_minutes.Left = 438;
 Unit_minutes.Top = 48;
 Unit_minutes.Width = 32;
 Unit_minutes.Height = 75;
 Unit_minutes.Visible = 1;
 Unit_minutes.Active = 0;
 Unit_minutes.Caption = Unit_minutes_Caption;
 Unit_minutes.FontName =  0x000351E7 ;
 Unit_minutes.Font_Color = 0x738E;
 Unit_minutes.VerticalText = 0;
 Unit_minutes.OnUpPtr = 0;
 Unit_minutes.OnDownPtr = 0;
 Unit_minutes.OnClickPtr = 0;
 Unit_minutes.OnPressPtr = 0;

 SetDateAndTime.OwnerScreen = &SetRTC;
 SetDateAndTime.Order = 7;
 SetDateAndTime.Left = 295;
 SetDateAndTime.Top = 160;
 SetDateAndTime.Width = 109;
 SetDateAndTime.Height = 42;
 SetDateAndTime.Pen_Width = 0;
 SetDateAndTime.Pen_Color = 0xFFFF;
 SetDateAndTime.Visible = 1;
 SetDateAndTime.Active = 0;
 SetDateAndTime.Transparent = 1;
 SetDateAndTime.Caption = SetDateAndTime_Caption;
 SetDateAndTime.TextAlign = _taCenter;
 SetDateAndTime.TextAlignVertical= _tavMiddle;
 SetDateAndTime.FontName =  0x00005242 ;
 SetDateAndTime.PressColEnabled = 1;
 SetDateAndTime.Font_Color = 0xF800;
 SetDateAndTime.VerticalText = 0;
 SetDateAndTime.Gradient = 1;
 SetDateAndTime.Gradient_Orientation = 0;
 SetDateAndTime.Gradient_Start_Color = 0xFFDF;
 SetDateAndTime.Gradient_End_Color = 0xC618;
 SetDateAndTime.Color = 0xC618;
 SetDateAndTime.Press_Color = 0xAD75;
 SetDateAndTime.OnUpPtr = 0;
 SetDateAndTime.OnDownPtr = 0;
 SetDateAndTime.OnClickPtr = SetDateAndTimeOnClick;
 SetDateAndTime.OnPressPtr = 0;

 Year_word.OwnerScreen = &SetRTC;
 Year_word.Order = 8;
 Year_word.Left = 27;
 Year_word.Top = 130;
 Year_word.Width = 46;
 Year_word.Height = 20;
 Year_word.Visible = 1;
 Year_word.Active = 1;
 Year_word.Caption = Year_word_Caption;
 Year_word.FontName =  0x00005242 ;
 Year_word.Font_Color = 0xEF7D;
 Year_word.VerticalText = 0;
 Year_word.OnUpPtr = 0;
 Year_word.OnDownPtr = 0;
 Year_word.OnClickPtr = 0;
 Year_word.OnPressPtr = 0;

 Month_Word.OwnerScreen = &SetRTC;
 Month_Word.Order = 9;
 Month_Word.Left = 120;
 Month_Word.Top = 130;
 Month_Word.Width = 62;
 Month_Word.Height = 20;
 Month_Word.Visible = 1;
 Month_Word.Active = 1;
 Month_Word.Caption = Month_Word_Caption;
 Month_Word.FontName =  0x00005242 ;
 Month_Word.Font_Color = 0xEF7D;
 Month_Word.VerticalText = 0;
 Month_Word.OnUpPtr = 0;
 Month_Word.OnDownPtr = 0;
 Month_Word.OnClickPtr = 0;
 Month_Word.OnPressPtr = 0;

 Day_word.OwnerScreen = &SetRTC;
 Day_word.Order = 10;
 Day_word.Left = 231;
 Day_word.Top = 130;
 Day_word.Width = 35;
 Day_word.Height = 20;
 Day_word.Visible = 1;
 Day_word.Active = 1;
 Day_word.Caption = Day_word_Caption;
 Day_word.FontName =  0x00005242 ;
 Day_word.Font_Color = 0xEF7D;
 Day_word.VerticalText = 0;
 Day_word.OnUpPtr = 0;
 Day_word.OnDownPtr = 0;
 Day_word.OnClickPtr = 0;
 Day_word.OnPressPtr = 0;

 Hour_word.OwnerScreen = &SetRTC;
 Hour_word.Order = 11;
 Hour_word.Left = 334;
 Hour_word.Top = 130;
 Hour_word.Width = 50;
 Hour_word.Height = 20;
 Hour_word.Visible = 1;
 Hour_word.Active = 1;
 Hour_word.Caption = Hour_word_Caption;
 Hour_word.FontName =  0x00005242 ;
 Hour_word.Font_Color = 0xEF7D;
 Hour_word.VerticalText = 0;
 Hour_word.OnUpPtr = 0;
 Hour_word.OnDownPtr = 0;
 Hour_word.OnClickPtr = 0;
 Hour_word.OnPressPtr = 0;

 Min_word.OwnerScreen = &SetRTC;
 Min_word.Order = 12;
 Min_word.Left = 425;
 Min_word.Top = 130;
 Min_word.Width = 31;
 Min_word.Height = 20;
 Min_word.Visible = 1;
 Min_word.Active = 1;
 Min_word.Caption = Min_word_Caption;
 Min_word.FontName =  0x00005242 ;
 Min_word.Font_Color = 0xEF7D;
 Min_word.VerticalText = 0;
 Min_word.OnUpPtr = 0;
 Min_word.OnDownPtr = 0;
 Min_word.OnClickPtr = 0;
 Min_word.OnPressPtr = 0;

 Day_unitUp.OwnerScreen = &SetRTC;
 Day_unitUp.Order = 13;
 Day_unitUp.Left = 314;
 Day_unitUp.Top = 42;
 Day_unitUp.Width = 37;
 Day_unitUp.Height = 42;
 Day_unitUp.Pen_Width = 1;
 Day_unitUp.Pen_Color = 0x0000;
 Day_unitUp.Visible = 1;
 Day_unitUp.Active = 1;
 Day_unitUp.Transparent = 1;
 Day_unitUp.Caption = Day_unitUp_Caption;
 Day_unitUp.TextAlign = _taCenter;
 Day_unitUp.TextAlignVertical= _tavMiddle;
 Day_unitUp.FontName =  0x0001F2E5 ;
 Day_unitUp.PressColEnabled = 1;
 Day_unitUp.Font_Color = 0x0000;
 Day_unitUp.VerticalText = 0;
 Day_unitUp.Gradient = 1;
 Day_unitUp.Gradient_Orientation = 0;
 Day_unitUp.Gradient_Start_Color = 0xFFFF;
 Day_unitUp.Gradient_End_Color = 0xC618;
 Day_unitUp.Color = 0xC618;
 Day_unitUp.Press_Color = 0xE71C;
 Day_unitUp.OnUpPtr = Day_unitUpOnUp;
 Day_unitUp.OnDownPtr = 0;
 Day_unitUp.OnClickPtr = Day_unitUpOnClick;
 Day_unitUp.OnPressPtr = Day_unitUpOnPress;

 Day_unitDwn.OwnerScreen = &SetRTC;
 Day_unitDwn.Order = 14;
 Day_unitDwn.Left = 314;
 Day_unitDwn.Top = 84;
 Day_unitDwn.Width = 37;
 Day_unitDwn.Height = 42;
 Day_unitDwn.Pen_Width = 1;
 Day_unitDwn.Pen_Color = 0x0000;
 Day_unitDwn.Visible = 1;
 Day_unitDwn.Active = 1;
 Day_unitDwn.Transparent = 1;
 Day_unitDwn.Caption = Day_unitDwn_Caption;
 Day_unitDwn.TextAlign = _taCenter;
 Day_unitDwn.TextAlignVertical= _tavMiddle;
 Day_unitDwn.FontName =  0x0001F2E5 ;
 Day_unitDwn.PressColEnabled = 1;
 Day_unitDwn.Font_Color = 0x0000;
 Day_unitDwn.VerticalText = 0;
 Day_unitDwn.Gradient = 1;
 Day_unitDwn.Gradient_Orientation = 0;
 Day_unitDwn.Gradient_Start_Color = 0xFFFF;
 Day_unitDwn.Gradient_End_Color = 0xC618;
 Day_unitDwn.Color = 0xC618;
 Day_unitDwn.Press_Color = 0xE71C;
 Day_unitDwn.OnUpPtr = Day_unitDwnOnUp;
 Day_unitDwn.OnDownPtr = 0;
 Day_unitDwn.OnClickPtr = Day_unitDwnOnClick;
 Day_unitDwn.OnPressPtr = Day_unitDwnOnPress;

 Unit_hoursUp.OwnerScreen = &SetRTC;
 Unit_hoursUp.Order = 15;
 Unit_hoursUp.Left = 350;
 Unit_hoursUp.Top = 42;
 Unit_hoursUp.Width = 37;
 Unit_hoursUp.Height = 42;
 Unit_hoursUp.Pen_Width = 1;
 Unit_hoursUp.Pen_Color = 0x0000;
 Unit_hoursUp.Visible = 1;
 Unit_hoursUp.Active = 1;
 Unit_hoursUp.Transparent = 1;
 Unit_hoursUp.Caption = Unit_hoursUp_Caption;
 Unit_hoursUp.TextAlign = _taCenter;
 Unit_hoursUp.TextAlignVertical= _tavMiddle;
 Unit_hoursUp.FontName =  0x0001F2E5 ;
 Unit_hoursUp.PressColEnabled = 1;
 Unit_hoursUp.Font_Color = 0x0000;
 Unit_hoursUp.VerticalText = 0;
 Unit_hoursUp.Gradient = 1;
 Unit_hoursUp.Gradient_Orientation = 0;
 Unit_hoursUp.Gradient_Start_Color = 0xFFFF;
 Unit_hoursUp.Gradient_End_Color = 0xC618;
 Unit_hoursUp.Color = 0xC618;
 Unit_hoursUp.Press_Color = 0xE71C;
 Unit_hoursUp.OnUpPtr = Unit_hoursUpOnUp;
 Unit_hoursUp.OnDownPtr = 0;
 Unit_hoursUp.OnClickPtr = Unit_hoursUpOnClick;
 Unit_hoursUp.OnPressPtr = Unit_hoursUpOnPress;

 Unit_hoursDwn.OwnerScreen = &SetRTC;
 Unit_hoursDwn.Order = 16;
 Unit_hoursDwn.Left = 350;
 Unit_hoursDwn.Top = 84;
 Unit_hoursDwn.Width = 37;
 Unit_hoursDwn.Height = 42;
 Unit_hoursDwn.Pen_Width = 1;
 Unit_hoursDwn.Pen_Color = 0x0000;
 Unit_hoursDwn.Visible = 1;
 Unit_hoursDwn.Active = 1;
 Unit_hoursDwn.Transparent = 1;
 Unit_hoursDwn.Caption = Unit_hoursDwn_Caption;
 Unit_hoursDwn.TextAlign = _taCenter;
 Unit_hoursDwn.TextAlignVertical= _tavMiddle;
 Unit_hoursDwn.FontName =  0x0001F2E5 ;
 Unit_hoursDwn.PressColEnabled = 1;
 Unit_hoursDwn.Font_Color = 0x0000;
 Unit_hoursDwn.VerticalText = 0;
 Unit_hoursDwn.Gradient = 1;
 Unit_hoursDwn.Gradient_Orientation = 0;
 Unit_hoursDwn.Gradient_Start_Color = 0xFFFF;
 Unit_hoursDwn.Gradient_End_Color = 0xC618;
 Unit_hoursDwn.Color = 0xC618;
 Unit_hoursDwn.Press_Color = 0xE71C;
 Unit_hoursDwn.OnUpPtr = Unit_hoursDwnOnUp;
 Unit_hoursDwn.OnDownPtr = 0;
 Unit_hoursDwn.OnClickPtr = Unit_hoursDwnOnClick;
 Unit_hoursDwn.OnPressPtr = Unit_hoursDwnOnPress;

 Unit_hours.OwnerScreen = &SetRTC;
 Unit_hours.Order = 17;
 Unit_hours.Left = 353;
 Unit_hours.Top = 48;
 Unit_hours.Width = 32;
 Unit_hours.Height = 75;
 Unit_hours.Visible = 1;
 Unit_hours.Active = 0;
 Unit_hours.Caption = Unit_hours_Caption;
 Unit_hours.FontName =  0x000351E7 ;
 Unit_hours.Font_Color = 0x738E;
 Unit_hours.VerticalText = 0;
 Unit_hours.OnUpPtr = 0;
 Unit_hours.OnDownPtr = 0;
 Unit_hours.OnClickPtr = 0;
 Unit_hours.OnPressPtr = 0;

 Day_unit.OwnerScreen = &SetRTC;
 Day_unit.Order = 18;
 Day_unit.Left = 318;
 Day_unit.Top = 48;
 Day_unit.Width = 32;
 Day_unit.Height = 75;
 Day_unit.Visible = 1;
 Day_unit.Active = 0;
 Day_unit.Caption = Day_unit_Caption;
 Day_unit.FontName =  0x000351E7 ;
 Day_unit.Font_Color = 0x738E;
 Day_unit.VerticalText = 0;
 Day_unit.OnUpPtr = 0;
 Day_unit.OnDownPtr = 0;
 Day_unit.OnClickPtr = 0;
 Day_unit.OnPressPtr = 0;

 OneDayUp.OwnerScreen = &SetRTC;
 OneDayUp.Order = 19;
 OneDayUp.Left = 242;
 OneDayUp.Top = 42;
 OneDayUp.Width = 37;
 OneDayUp.Height = 42;
 OneDayUp.Pen_Width = 1;
 OneDayUp.Pen_Color = 0x0000;
 OneDayUp.Visible = 1;
 OneDayUp.Active = 1;
 OneDayUp.Transparent = 1;
 OneDayUp.Caption = OneDayUp_Caption;
 OneDayUp.TextAlign = _taCenter;
 OneDayUp.TextAlignVertical= _tavMiddle;
 OneDayUp.FontName =  0x0001F2E5 ;
 OneDayUp.PressColEnabled = 1;
 OneDayUp.Font_Color = 0x0000;
 OneDayUp.VerticalText = 0;
 OneDayUp.Gradient = 1;
 OneDayUp.Gradient_Orientation = 0;
 OneDayUp.Gradient_Start_Color = 0xFFFF;
 OneDayUp.Gradient_End_Color = 0xC618;
 OneDayUp.Color = 0xC618;
 OneDayUp.Press_Color = 0xE71C;
 OneDayUp.OnUpPtr = OneDayUpOnUp;
 OneDayUp.OnDownPtr = 0;
 OneDayUp.OnClickPtr = OneDayUpOnClick;
 OneDayUp.OnPressPtr = OneDayUpOnPress;

 OneDayDwn.OwnerScreen = &SetRTC;
 OneDayDwn.Order = 20;
 OneDayDwn.Left = 242;
 OneDayDwn.Top = 84;
 OneDayDwn.Width = 37;
 OneDayDwn.Height = 42;
 OneDayDwn.Pen_Width = 1;
 OneDayDwn.Pen_Color = 0x0000;
 OneDayDwn.Visible = 1;
 OneDayDwn.Active = 1;
 OneDayDwn.Transparent = 1;
 OneDayDwn.Caption = OneDayDwn_Caption;
 OneDayDwn.TextAlign = _taCenter;
 OneDayDwn.TextAlignVertical= _tavMiddle;
 OneDayDwn.FontName =  0x0001F2E5 ;
 OneDayDwn.PressColEnabled = 1;
 OneDayDwn.Font_Color = 0x0000;
 OneDayDwn.VerticalText = 0;
 OneDayDwn.Gradient = 1;
 OneDayDwn.Gradient_Orientation = 0;
 OneDayDwn.Gradient_Start_Color = 0xFFFF;
 OneDayDwn.Gradient_End_Color = 0xC618;
 OneDayDwn.Color = 0xC618;
 OneDayDwn.Press_Color = 0xE71C;
 OneDayDwn.OnUpPtr = OneDayDwnOnUp;
 OneDayDwn.OnDownPtr = 0;
 OneDayDwn.OnClickPtr = OneDayDwnOnClick;
 OneDayDwn.OnPressPtr = OneDayDwnOnPress;

 LineSlash.OwnerScreen = &SetRTC;
 LineSlash.Order = 21;
 LineSlash.First_Point_X = 303;
 LineSlash.First_Point_Y = 57;
 LineSlash.Second_Point_X = 289;
 LineSlash.Second_Point_Y = 111;
 LineSlash.Visible = 1;
 LineSlash.Pen_Width = 3;
 LineSlash.Color = 0xC618;

 TenDayUp.OwnerScreen = &SetRTC;
 TenDayUp.Order = 22;
 TenDayUp.Left = 206;
 TenDayUp.Top = 42;
 TenDayUp.Width = 37;
 TenDayUp.Height = 42;
 TenDayUp.Pen_Width = 1;
 TenDayUp.Pen_Color = 0x0000;
 TenDayUp.Visible = 1;
 TenDayUp.Active = 1;
 TenDayUp.Transparent = 1;
 TenDayUp.Caption = TenDayUp_Caption;
 TenDayUp.TextAlign = _taCenter;
 TenDayUp.TextAlignVertical= _tavMiddle;
 TenDayUp.FontName =  0x0001F2E5 ;
 TenDayUp.PressColEnabled = 1;
 TenDayUp.Font_Color = 0x0000;
 TenDayUp.VerticalText = 0;
 TenDayUp.Gradient = 1;
 TenDayUp.Gradient_Orientation = 0;
 TenDayUp.Gradient_Start_Color = 0xFFFF;
 TenDayUp.Gradient_End_Color = 0xC618;
 TenDayUp.Color = 0xC618;
 TenDayUp.Press_Color = 0xE71C;
 TenDayUp.OnUpPtr = TenDayUpOnUp;
 TenDayUp.OnDownPtr = 0;
 TenDayUp.OnClickPtr = TenDayUpOnClick;
 TenDayUp.OnPressPtr = TenDayUpOnPress;

 TenDayDwn.OwnerScreen = &SetRTC;
 TenDayDwn.Order = 23;
 TenDayDwn.Left = 206;
 TenDayDwn.Top = 84;
 TenDayDwn.Width = 37;
 TenDayDwn.Height = 42;
 TenDayDwn.Pen_Width = 1;
 TenDayDwn.Pen_Color = 0x0000;
 TenDayDwn.Visible = 1;
 TenDayDwn.Active = 1;
 TenDayDwn.Transparent = 1;
 TenDayDwn.Caption = TenDayDwn_Caption;
 TenDayDwn.TextAlign = _taCenter;
 TenDayDwn.TextAlignVertical= _tavMiddle;
 TenDayDwn.FontName =  0x0001F2E5 ;
 TenDayDwn.PressColEnabled = 1;
 TenDayDwn.Font_Color = 0x0000;
 TenDayDwn.VerticalText = 0;
 TenDayDwn.Gradient = 1;
 TenDayDwn.Gradient_Orientation = 0;
 TenDayDwn.Gradient_Start_Color = 0xFFFF;
 TenDayDwn.Gradient_End_Color = 0xC618;
 TenDayDwn.Color = 0xC618;
 TenDayDwn.Press_Color = 0xE71C;
 TenDayDwn.OnUpPtr = TenDayDwnOnUp;
 TenDayDwn.OnDownPtr = 0;
 TenDayDwn.OnClickPtr = TenDayDwnOnClick;
 TenDayDwn.OnPressPtr = TenDayDwnOnPress;

 TenDay.OwnerScreen = &SetRTC;
 TenDay.Order = 24;
 TenDay.Left = 210;
 TenDay.Top = 48;
 TenDay.Width = 32;
 TenDay.Height = 75;
 TenDay.Visible = 1;
 TenDay.Active = 0;
 TenDay.Caption = TenDay_Caption;
 TenDay.FontName =  0x000351E7 ;
 TenDay.Font_Color = 0x738E;
 TenDay.VerticalText = 0;
 TenDay.OnUpPtr = 0;
 TenDay.OnDownPtr = 0;
 TenDay.OnClickPtr = 0;
 TenDay.OnPressPtr = 0;

 OneDay.OwnerScreen = &SetRTC;
 OneDay.Order = 25;
 OneDay.Left = 245;
 OneDay.Top = 48;
 OneDay.Width = 32;
 OneDay.Height = 75;
 OneDay.Visible = 1;
 OneDay.Active = 0;
 OneDay.Caption = OneDay_Caption;
 OneDay.FontName =  0x000351E7 ;
 OneDay.Font_Color = 0x738E;
 OneDay.VerticalText = 0;
 OneDay.OnUpPtr = 0;
 OneDay.OnDownPtr = 0;
 OneDay.OnClickPtr = 0;
 OneDay.OnPressPtr = 0;

 MonthDateUp.OwnerScreen = &SetRTC;
 MonthDateUp.Order = 26;
 MonthDateUp.Left = 88;
 MonthDateUp.Top = 42;
 MonthDateUp.Width = 115;
 MonthDateUp.Height = 42;
 MonthDateUp.Pen_Width = 1;
 MonthDateUp.Pen_Color = 0x0000;
 MonthDateUp.Visible = 1;
 MonthDateUp.Active = 1;
 MonthDateUp.Transparent = 1;
 MonthDateUp.Caption = MonthDateUp_Caption;
 MonthDateUp.TextAlign = _taCenter;
 MonthDateUp.TextAlignVertical= _tavMiddle;
 MonthDateUp.FontName =  0x0001F2E5 ;
 MonthDateUp.PressColEnabled = 1;
 MonthDateUp.Font_Color = 0x0000;
 MonthDateUp.VerticalText = 0;
 MonthDateUp.Gradient = 1;
 MonthDateUp.Gradient_Orientation = 0;
 MonthDateUp.Gradient_Start_Color = 0xFFFF;
 MonthDateUp.Gradient_End_Color = 0xC618;
 MonthDateUp.Color = 0xC618;
 MonthDateUp.Press_Color = 0xE71C;
 MonthDateUp.OnUpPtr = MonthDateUpOnUp;
 MonthDateUp.OnDownPtr = 0;
 MonthDateUp.OnClickPtr = MonthDateUpOnClick;
 MonthDateUp.OnPressPtr = MonthDateUpOnPress;

 MonthDateDwn.OwnerScreen = &SetRTC;
 MonthDateDwn.Order = 27;
 MonthDateDwn.Left = 88;
 MonthDateDwn.Top = 84;
 MonthDateDwn.Width = 115;
 MonthDateDwn.Height = 42;
 MonthDateDwn.Pen_Width = 1;
 MonthDateDwn.Pen_Color = 0x0000;
 MonthDateDwn.Visible = 1;
 MonthDateDwn.Active = 1;
 MonthDateDwn.Transparent = 1;
 MonthDateDwn.Caption = MonthDateDwn_Caption;
 MonthDateDwn.TextAlign = _taCenter;
 MonthDateDwn.TextAlignVertical= _tavMiddle;
 MonthDateDwn.FontName =  0x0001F2E5 ;
 MonthDateDwn.PressColEnabled = 1;
 MonthDateDwn.Font_Color = 0x0000;
 MonthDateDwn.VerticalText = 0;
 MonthDateDwn.Gradient = 1;
 MonthDateDwn.Gradient_Orientation = 0;
 MonthDateDwn.Gradient_Start_Color = 0xFFFF;
 MonthDateDwn.Gradient_End_Color = 0xC618;
 MonthDateDwn.Color = 0xC618;
 MonthDateDwn.Press_Color = 0xE71C;
 MonthDateDwn.OnUpPtr = MonthDateDwnOnUp;
 MonthDateDwn.OnDownPtr = 0;
 MonthDateDwn.OnClickPtr = MonthDateDwnOnClick;
 MonthDateDwn.OnPressPtr = MonthDateDwnOnPress;

 MonthDate.OwnerScreen = &SetRTC;
 MonthDate.Order = 28;
 MonthDate.Left = 98;
 MonthDate.Top = 48;
 MonthDate.Width = 97;
 MonthDate.Height = 75;
 MonthDate.Visible = 1;
 MonthDate.Active = 0;
 MonthDate.Caption = MonthDate_Caption;
 MonthDate.FontName =  0x000351E7 ;
 MonthDate.Font_Color = 0x738E;
 MonthDate.VerticalText = 0;
 MonthDate.OnUpPtr = 0;
 MonthDate.OnDownPtr = 0;
 MonthDate.OnClickPtr = 0;
 MonthDate.OnPressPtr = 0;

 TenYearUp.OwnerScreen = &SetRTC;
 TenYearUp.Order = 29;
 TenYearUp.Left = 45;
 TenYearUp.Top = 42;
 TenYearUp.Width = 37;
 TenYearUp.Height = 42;
 TenYearUp.Pen_Width = 1;
 TenYearUp.Pen_Color = 0x0000;
 TenYearUp.Visible = 1;
 TenYearUp.Active = 1;
 TenYearUp.Transparent = 1;
 TenYearUp.Caption = TenYearUp_Caption;
 TenYearUp.TextAlign = _taCenter;
 TenYearUp.TextAlignVertical= _tavMiddle;
 TenYearUp.FontName =  0x0001F2E5 ;
 TenYearUp.PressColEnabled = 1;
 TenYearUp.Font_Color = 0x0000;
 TenYearUp.VerticalText = 0;
 TenYearUp.Gradient = 1;
 TenYearUp.Gradient_Orientation = 0;
 TenYearUp.Gradient_Start_Color = 0xFFFF;
 TenYearUp.Gradient_End_Color = 0xC618;
 TenYearUp.Color = 0xC618;
 TenYearUp.Press_Color = 0xE71C;
 TenYearUp.OnUpPtr = TenYearUpOnUp;
 TenYearUp.OnDownPtr = 0;
 TenYearUp.OnClickPtr = TenYearUpOnClick;
 TenYearUp.OnPressPtr = TenYearUpOnPress;

 TenYearDwn.OwnerScreen = &SetRTC;
 TenYearDwn.Order = 30;
 TenYearDwn.Left = 45;
 TenYearDwn.Top = 84;
 TenYearDwn.Width = 37;
 TenYearDwn.Height = 42;
 TenYearDwn.Pen_Width = 1;
 TenYearDwn.Pen_Color = 0x0000;
 TenYearDwn.Visible = 1;
 TenYearDwn.Active = 1;
 TenYearDwn.Transparent = 1;
 TenYearDwn.Caption = TenYearDwn_Caption;
 TenYearDwn.TextAlign = _taCenter;
 TenYearDwn.TextAlignVertical= _tavMiddle;
 TenYearDwn.FontName =  0x0001F2E5 ;
 TenYearDwn.PressColEnabled = 1;
 TenYearDwn.Font_Color = 0x0000;
 TenYearDwn.VerticalText = 0;
 TenYearDwn.Gradient = 1;
 TenYearDwn.Gradient_Orientation = 0;
 TenYearDwn.Gradient_Start_Color = 0xFFFF;
 TenYearDwn.Gradient_End_Color = 0xC618;
 TenYearDwn.Color = 0xC618;
 TenYearDwn.Press_Color = 0xE71C;
 TenYearDwn.OnUpPtr = TenYearDwnOnUp;
 TenYearDwn.OnDownPtr = 0;
 TenYearDwn.OnClickPtr = TenYearDwnOnClick;
 TenYearDwn.OnPressPtr = TenYearDwnOnPress;

 OneYearUp.OwnerScreen = &SetRTC;
 OneYearUp.Order = 31;
 OneYearUp.Left = 9;
 OneYearUp.Top = 42;
 OneYearUp.Width = 37;
 OneYearUp.Height = 42;
 OneYearUp.Pen_Width = 1;
 OneYearUp.Pen_Color = 0x0000;
 OneYearUp.Visible = 1;
 OneYearUp.Active = 1;
 OneYearUp.Transparent = 1;
 OneYearUp.Caption = OneYearUp_Caption;
 OneYearUp.TextAlign = _taCenter;
 OneYearUp.TextAlignVertical= _tavMiddle;
 OneYearUp.FontName =  0x0001F2E5 ;
 OneYearUp.PressColEnabled = 1;
 OneYearUp.Font_Color = 0x0000;
 OneYearUp.VerticalText = 0;
 OneYearUp.Gradient = 1;
 OneYearUp.Gradient_Orientation = 0;
 OneYearUp.Gradient_Start_Color = 0xFFFF;
 OneYearUp.Gradient_End_Color = 0xC618;
 OneYearUp.Color = 0xC618;
 OneYearUp.Press_Color = 0xE71C;
 OneYearUp.OnUpPtr = OneYearUpOnUp;
 OneYearUp.OnDownPtr = 0;
 OneYearUp.OnClickPtr = OneYearUpOnClick;
 OneYearUp.OnPressPtr = OneYearUpOnPress;

 OneYearDwn.OwnerScreen = &SetRTC;
 OneYearDwn.Order = 32;
 OneYearDwn.Left = 9;
 OneYearDwn.Top = 84;
 OneYearDwn.Width = 37;
 OneYearDwn.Height = 42;
 OneYearDwn.Pen_Width = 1;
 OneYearDwn.Pen_Color = 0x0000;
 OneYearDwn.Visible = 1;
 OneYearDwn.Active = 1;
 OneYearDwn.Transparent = 1;
 OneYearDwn.Caption = OneYearDwn_Caption;
 OneYearDwn.TextAlign = _taCenter;
 OneYearDwn.TextAlignVertical= _tavMiddle;
 OneYearDwn.FontName =  0x0001F2E5 ;
 OneYearDwn.PressColEnabled = 1;
 OneYearDwn.Font_Color = 0x0000;
 OneYearDwn.VerticalText = 0;
 OneYearDwn.Gradient = 1;
 OneYearDwn.Gradient_Orientation = 0;
 OneYearDwn.Gradient_Start_Color = 0xFFFF;
 OneYearDwn.Gradient_End_Color = 0xC618;
 OneYearDwn.Color = 0xC618;
 OneYearDwn.Press_Color = 0xE71C;
 OneYearDwn.OnUpPtr = OneYearDwnOnUp;
 OneYearDwn.OnDownPtr = 0;
 OneYearDwn.OnClickPtr = OneYearDwnOnClick;
 OneYearDwn.OnPressPtr = OneYearDwnOnPress;

 OneYear.OwnerScreen = &SetRTC;
 OneYear.Order = 33;
 OneYear.Left = 12;
 OneYear.Top = 48;
 OneYear.Width = 32;
 OneYear.Height = 75;
 OneYear.Visible = 1;
 OneYear.Active = 0;
 OneYear.Caption = OneYear_Caption;
 OneYear.FontName =  0x000351E7 ;
 OneYear.Font_Color = 0x738E;
 OneYear.VerticalText = 0;
 OneYear.OnUpPtr = 0;
 OneYear.OnDownPtr = 0;
 OneYear.OnClickPtr = 0;
 OneYear.OnPressPtr = 0;

 TenYear.OwnerScreen = &SetRTC;
 TenYear.Order = 34;
 TenYear.Left = 48;
 TenYear.Top = 48;
 TenYear.Width = 32;
 TenYear.Height = 75;
 TenYear.Visible = 1;
 TenYear.Active = 0;
 TenYear.Caption = TenYear_Caption;
 TenYear.FontName =  0x000351E7 ;
 TenYear.Font_Color = 0x738E;
 TenYear.VerticalText = 0;
 TenYear.OnUpPtr = 0;
 TenYear.OnDownPtr = 0;
 TenYear.OnClickPtr = 0;
 TenYear.OnPressPtr = 0;

 DayOfWeek.OwnerScreen = &SetRTC;
 DayOfWeek.Order = 35;
 DayOfWeek.Left = 93;
 DayOfWeek.Top = 160;
 DayOfWeek.Width = 136;
 DayOfWeek.Height = 42;
 DayOfWeek.Pen_Width = 0;
 DayOfWeek.Pen_Color = 0xFFFF;
 DayOfWeek.Visible = 1;
 DayOfWeek.Active = 0;
 DayOfWeek.Transparent = 1;
 DayOfWeek.Caption = DayOfWeek_Caption;
 DayOfWeek.TextAlign = _taCenter;
 DayOfWeek.TextAlignVertical= _tavMiddle;
 DayOfWeek.FontName =  0x00005242 ;
 DayOfWeek.PressColEnabled = 1;
 DayOfWeek.Font_Color = 0x0410;
 DayOfWeek.VerticalText = 0;
 DayOfWeek.Gradient = 0;
 DayOfWeek.Gradient_Orientation = 0;
 DayOfWeek.Gradient_Start_Color = 0xFFFF;
 DayOfWeek.Gradient_End_Color = 0xC618;
 DayOfWeek.Color = 0xEF5D;
 DayOfWeek.Press_Color = 0xE71C;
 DayOfWeek.OnUpPtr = 0;
 DayOfWeek.OnDownPtr = 0;
 DayOfWeek.OnClickPtr = 0;
 DayOfWeek.OnPressPtr = 0;

 Time_setting_label.OwnerScreen = &SetRTC;
 Time_setting_label.Order = 36;
 Time_setting_label.Left = 193;
 Time_setting_label.Top = 5;
 Time_setting_label.Width = 119;
 Time_setting_label.Height = 20;
 Time_setting_label.Visible = 1;
 Time_setting_label.Active = 0;
 Time_setting_label.Caption = Time_setting_label_Caption;
 Time_setting_label.FontName =  0x00005242 ;
 Time_setting_label.Font_Color = 0xE7FC;
 Time_setting_label.VerticalText = 0;
 Time_setting_label.OnUpPtr = 0;
 Time_setting_label.OnDownPtr = 0;
 Time_setting_label.OnClickPtr = 0;
 Time_setting_label.OnPressPtr = 0;

 home_b4.OwnerScreen = &SetRTC;
 home_b4.Order = 37;
 home_b4.Left = 252;
 home_b4.Top = 232;
 home_b4.Width = 78;
 home_b4.Height = 35;
 home_b4.Pen_Width = 1;
 home_b4.Pen_Color = 0xC618;
 home_b4.Visible = 1;
 home_b4.Active = 1;
 home_b4.Transparent = 1;
 home_b4.Caption = home_b4_Caption;
 home_b4.TextAlign = _taCenter;
 home_b4.TextAlignVertical= _tavMiddle;
 home_b4.FontName =  0x00005242 ;
 home_b4.PressColEnabled = 1;
 home_b4.Font_Color = 0xD6BA;
 home_b4.VerticalText = 0;
 home_b4.Gradient = 1;
 home_b4.Gradient_Orientation = 0;
 home_b4.Gradient_Start_Color = 0x0418;
 home_b4.Gradient_End_Color = 0x00A5;
 home_b4.Color = 0xC618;
 home_b4.Press_Color = 0xE71C;
 home_b4.Corner_Radius = 5;
 home_b4.OnUpPtr = 0;
 home_b4.OnDownPtr = 0;
 home_b4.OnClickPtr = BackToHome;
 home_b4.OnPressPtr = 0;

 Back_b3.OwnerScreen = &SetRTC;
 Back_b3.Order = 38;
 Back_b3.Left = 163;
 Back_b3.Top = 232;
 Back_b3.Width = 78;
 Back_b3.Height = 35;
 Back_b3.Pen_Width = 1;
 Back_b3.Pen_Color = 0xC618;
 Back_b3.Visible = 1;
 Back_b3.Active = 1;
 Back_b3.Transparent = 1;
 Back_b3.Caption = Back_b3_Caption;
 Back_b3.TextAlign = _taCenter;
 Back_b3.TextAlignVertical= _tavMiddle;
 Back_b3.FontName =  0x00005242 ;
 Back_b3.PressColEnabled = 1;
 Back_b3.Font_Color = 0xD6BA;
 Back_b3.VerticalText = 0;
 Back_b3.Gradient = 1;
 Back_b3.Gradient_Orientation = 0;
 Back_b3.Gradient_Start_Color = 0x0418;
 Back_b3.Gradient_End_Color = 0x00A5;
 Back_b3.Color = 0xC618;
 Back_b3.Press_Color = 0xE71C;
 Back_b3.Corner_Radius = 5;
 Back_b3.OnUpPtr = 0;
 Back_b3.OnDownPtr = 0;
 Back_b3.OnClickPtr = goToBack;
 Back_b3.OnPressPtr = 0;

 Image45.OwnerScreen = &ERRORS;
 Image45.Order = 0;
 Image45.Left = 0;
 Image45.Top = 0;
 Image45.Width = 480;
 Image45.Height = 272;
 Image45.Picture_Type = 1;
 Image45.Picture_Ratio = 1;
 Image45.Picture_Name =  0x0003CAAE ;
 Image45.Visible = 1;
 Image45.Active = 0;
 Image45.OnUpPtr = 0;
 Image45.OnDownPtr = 0;
 Image45.OnClickPtr = 0;
 Image45.OnPressPtr = 0;

 Error_label.OwnerScreen = &ERRORS;
 Error_label.Order = 1;
 Error_label.Left = 176;
 Error_label.Top = 5;
 Error_label.Width = 119;
 Error_label.Height = 20;
 Error_label.Visible = 1;
 Error_label.Active = 0;
 Error_label.Caption = Error_label_Caption;
 Error_label.FontName =  0x00005242 ;
 Error_label.Font_Color = 0xE7FC;
 Error_label.VerticalText = 0;
 Error_label.OnUpPtr = 0;
 Error_label.OnDownPtr = 0;
 Error_label.OnClickPtr = 0;
 Error_label.OnPressPtr = 0;

 Error_message.OwnerScreen = &ERRORS;
 Error_message.Order = 2;
 Error_message.Left = 30;
 Error_message.Top = 65;
 Error_message.Width = 0;
 Error_message.Height = 20;
 Error_message.Visible = 1;
 Error_message.Active = 0;
 Error_message.Caption = Error_message_Caption;
 Error_message.FontName =  0x00005242 ;
 Error_message.Font_Color = 0xFFFF;
 Error_message.VerticalText = 0;
 Error_message.OnUpPtr = 0;
 Error_message.OnDownPtr = 0;
 Error_message.OnClickPtr = 0;
 Error_message.OnPressPtr = 0;

 Text_error.OwnerScreen = &ERRORS;
 Text_error.Order = 3;
 Text_error.Left = 213;
 Text_error.Top = 35;
 Text_error.Width = 66;
 Text_error.Height = 20;
 Text_error.Visible = 1;
 Text_error.Active = 1;
 Text_error.Caption = Text_error_Caption;
 Text_error.FontName =  0x00005242 ;
 Text_error.Font_Color = 0xF800;
 Text_error.VerticalText = 0;
 Text_error.OnUpPtr = 0;
 Text_error.OnDownPtr = 0;
 Text_error.OnClickPtr = 0;
 Text_error.OnPressPtr = 0;

 Label2.OwnerScreen = &ERRORS;
 Label2.Order = 4;
 Label2.Left = 60;
 Label2.Top = 135;
 Label2.Width = 50;
 Label2.Height = 57;
 Label2.Visible = 1;
 Label2.Active = 1;
 Label2.Caption = Label2_Caption;
 Label2.FontName =  0x0003150F ;
 Label2.Font_Color = 0xF800;
 Label2.VerticalText = 0;
 Label2.OnUpPtr = 0;
 Label2.OnDownPtr = 0;
 Label2.OnClickPtr = 0;
 Label2.OnPressPtr = 0;

 Home_b5.OwnerScreen = &ERRORS;
 Home_b5.Order = 5;
 Home_b5.Left = 237;
 Home_b5.Top = 232;
 Home_b5.Width = 78;
 Home_b5.Height = 35;
 Home_b5.Pen_Width = 1;
 Home_b5.Pen_Color = 0xC618;
 Home_b5.Visible = 1;
 Home_b5.Active = 1;
 Home_b5.Transparent = 1;
 Home_b5.Caption = Home_b5_Caption;
 Home_b5.TextAlign = _taCenter;
 Home_b5.TextAlignVertical= _tavMiddle;
 Home_b5.FontName =  0x00005242 ;
 Home_b5.PressColEnabled = 1;
 Home_b5.Font_Color = 0xD6BA;
 Home_b5.VerticalText = 0;
 Home_b5.Gradient = 1;
 Home_b5.Gradient_Orientation = 0;
 Home_b5.Gradient_Start_Color = 0x0418;
 Home_b5.Gradient_End_Color = 0x00A5;
 Home_b5.Color = 0xC618;
 Home_b5.Press_Color = 0xE71C;
 Home_b5.Corner_Radius = 5;
 Home_b5.OnUpPtr = 0;
 Home_b5.OnDownPtr = 0;
 Home_b5.OnClickPtr = BackToHome;
 Home_b5.OnPressPtr = 0;

 Back_b4.OwnerScreen = &ERRORS;
 Back_b4.Order = 6;
 Back_b4.Left = 153;
 Back_b4.Top = 232;
 Back_b4.Width = 78;
 Back_b4.Height = 35;
 Back_b4.Pen_Width = 1;
 Back_b4.Pen_Color = 0xC618;
 Back_b4.Visible = 1;
 Back_b4.Active = 1;
 Back_b4.Transparent = 1;
 Back_b4.Caption = Back_b4_Caption;
 Back_b4.TextAlign = _taCenter;
 Back_b4.TextAlignVertical= _tavMiddle;
 Back_b4.FontName =  0x00005242 ;
 Back_b4.PressColEnabled = 1;
 Back_b4.Font_Color = 0xD6BA;
 Back_b4.VerticalText = 0;
 Back_b4.Gradient = 1;
 Back_b4.Gradient_Orientation = 0;
 Back_b4.Gradient_Start_Color = 0x0418;
 Back_b4.Gradient_End_Color = 0x00A5;
 Back_b4.Color = 0xC618;
 Back_b4.Press_Color = 0xE71C;
 Back_b4.Corner_Radius = 5;
 Back_b4.OnUpPtr = 0;
 Back_b4.OnDownPtr = 0;
 Back_b4.OnClickPtr = goToBack;
 Back_b4.OnPressPtr = 0;

 Image23.OwnerScreen = &PASSWORD;
 Image23.Order = 0;
 Image23.Left = 0;
 Image23.Top = 0;
 Image23.Width = 480;
 Image23.Height = 272;
 Image23.Picture_Type = 1;
 Image23.Picture_Ratio = 1;
 Image23.Picture_Name =  0x0003CAAE ;
 Image23.Visible = 1;
 Image23.Active = 0;
 Image23.OnUpPtr = 0;
 Image23.OnDownPtr = 0;
 Image23.OnClickPtr = 0;
 Image23.OnPressPtr = 0;

 Password_label.OwnerScreen = &PASSWORD;
 Password_label.Order = 1;
 Password_label.Left = 200;
 Password_label.Top = 5;
 Password_label.Width = 99;
 Password_label.Height = 20;
 Password_label.Visible = 1;
 Password_label.Active = 0;
 Password_label.Caption = Password_label_Caption;
 Password_label.FontName =  0x00005242 ;
 Password_label.Font_Color = 0xE7FC;
 Password_label.VerticalText = 0;
 Password_label.OnUpPtr = 0;
 Password_label.OnDownPtr = 0;
 Password_label.OnClickPtr = 0;
 Password_label.OnPressPtr = 0;

 Admin_Set.OwnerScreen = &PASSWORD;
 Admin_Set.Order = 2;
 Admin_Set.Left = 178;
 Admin_Set.Top = 159;
 Admin_Set.Width = 125;
 Admin_Set.Height = 40;
 Admin_Set.Pen_Width = 1;
 Admin_Set.Pen_Color = 0x0000;
 Admin_Set.Visible = 1;
 Admin_Set.Active = 1;
 Admin_Set.Transparent = 1;
 Admin_Set.Caption = Admin_Set_Caption;
 Admin_Set.TextAlign = _taCenter;
 Admin_Set.TextAlignVertical= _tavMiddle;
 Admin_Set.FontName =  0x00005242 ;
 Admin_Set.PressColEnabled = 1;
 Admin_Set.Font_Color = 0xFFFF;
 Admin_Set.VerticalText = 0;
 Admin_Set.Gradient = 1;
 Admin_Set.Gradient_Orientation = 0;
 Admin_Set.Gradient_Start_Color = 0xD6BA;
 Admin_Set.Gradient_End_Color = 0x528A;
 Admin_Set.Color = 0xC618;
 Admin_Set.Press_Color = 0xE71C;
 Admin_Set.Corner_Radius = 3;
 Admin_Set.OnUpPtr = 0;
 Admin_Set.OnDownPtr = 0;
 Admin_Set.OnClickPtr = Admin_SetOnClick;
 Admin_Set.OnPressPtr = 0;

 Admin_text.OwnerScreen = &PASSWORD;
 Admin_text.Order = 3;
 Admin_text.Left = 159;
 Admin_text.Top = 95;
 Admin_text.Width = 163;
 Admin_text.Height = 20;
 Admin_text.Visible = 1;
 Admin_text.Active = 0;
 Admin_text.Caption = Admin_text_Caption;
 Admin_text.FontName =  0x00005242 ;
 Admin_text.Font_Color = 0x07E0;
 Admin_text.VerticalText = 0;
 Admin_text.OnUpPtr = 0;
 Admin_text.OnDownPtr = 0;
 Admin_text.OnClickPtr = 0;
 Admin_text.OnPressPtr = 0;

 Home_b6.OwnerScreen = &PASSWORD;
 Home_b6.Order = 4;
 Home_b6.Left = 242;
 Home_b6.Top = 232;
 Home_b6.Width = 78;
 Home_b6.Height = 35;
 Home_b6.Pen_Width = 1;
 Home_b6.Pen_Color = 0xC618;
 Home_b6.Visible = 1;
 Home_b6.Active = 1;
 Home_b6.Transparent = 1;
 Home_b6.Caption = Home_b6_Caption;
 Home_b6.TextAlign = _taCenter;
 Home_b6.TextAlignVertical= _tavMiddle;
 Home_b6.FontName =  0x00005242 ;
 Home_b6.PressColEnabled = 1;
 Home_b6.Font_Color = 0xD6BA;
 Home_b6.VerticalText = 0;
 Home_b6.Gradient = 1;
 Home_b6.Gradient_Orientation = 0;
 Home_b6.Gradient_Start_Color = 0x0418;
 Home_b6.Gradient_End_Color = 0x00A5;
 Home_b6.Color = 0xC618;
 Home_b6.Press_Color = 0xE71C;
 Home_b6.Corner_Radius = 5;
 Home_b6.OnUpPtr = 0;
 Home_b6.OnDownPtr = 0;
 Home_b6.OnClickPtr = BackToHome;
 Home_b6.OnPressPtr = 0;

 Back_b5.OwnerScreen = &PASSWORD;
 Back_b5.Order = 5;
 Back_b5.Left = 158;
 Back_b5.Top = 232;
 Back_b5.Width = 78;
 Back_b5.Height = 35;
 Back_b5.Pen_Width = 1;
 Back_b5.Pen_Color = 0xC618;
 Back_b5.Visible = 1;
 Back_b5.Active = 1;
 Back_b5.Transparent = 1;
 Back_b5.Caption = Back_b5_Caption;
 Back_b5.TextAlign = _taCenter;
 Back_b5.TextAlignVertical= _tavMiddle;
 Back_b5.FontName =  0x00005242 ;
 Back_b5.PressColEnabled = 1;
 Back_b5.Font_Color = 0xD6BA;
 Back_b5.VerticalText = 0;
 Back_b5.Gradient = 1;
 Back_b5.Gradient_Orientation = 0;
 Back_b5.Gradient_Start_Color = 0x0418;
 Back_b5.Gradient_End_Color = 0x00A5;
 Back_b5.Color = 0xC618;
 Back_b5.Press_Color = 0xE71C;
 Back_b5.Corner_Radius = 5;
 Back_b5.OnUpPtr = 0;
 Back_b5.OnDownPtr = 0;
 Back_b5.OnClickPtr = goToBack;
 Back_b5.OnPressPtr = 0;

 Image38.OwnerScreen = &GAUGE1;
 Image38.Order = 0;
 Image38.Left = 0;
 Image38.Top = 0;
 Image38.Width = 480;
 Image38.Height = 272;
 Image38.Picture_Type = 1;
 Image38.Picture_Ratio = 1;
 Image38.Picture_Name =  0x0003CAAE ;
 Image38.Visible = 1;
 Image38.Active = 0;
 Image38.OnUpPtr = 0;
 Image38.OnDownPtr = 0;
 Image38.OnClickPtr = 0;
 Image38.OnPressPtr = 0;

 LP1_gauge.OwnerScreen = &GAUGE1;
 LP1_gauge.Order = 1;
 LP1_gauge.Left = 250;
 LP1_gauge.Top = 33;
 LP1_gauge.Width = 189;
 LP1_gauge.Height = 189;
 LP1_gauge.Picture_Type = 1;
 LP1_gauge.Picture_Ratio = 1;
 LP1_gauge.Picture_Name =  0x000D5C76 ;
 LP1_gauge.Visible = 1;
 LP1_gauge.Active = 0;
 LP1_gauge.OnUpPtr = 0;
 LP1_gauge.OnDownPtr = 0;
 LP1_gauge.OnClickPtr = 0;
 LP1_gauge.OnPressPtr = 0;

 HP1_gauge.OwnerScreen = &GAUGE1;
 HP1_gauge.Order = 2;
 HP1_gauge.Left = 34;
 HP1_gauge.Top = 32;
 HP1_gauge.Width = 189;
 HP1_gauge.Height = 189;
 HP1_gauge.Picture_Type = 1;
 HP1_gauge.Picture_Ratio = 1;
 HP1_gauge.Picture_Name =  0x000E738E ;
 HP1_gauge.Visible = 1;
 HP1_gauge.Active = 0;
 HP1_gauge.OnUpPtr = 0;
 HP1_gauge.OnDownPtr = 0;
 HP1_gauge.OnClickPtr = 0;
 HP1_gauge.OnPressPtr = 0;

 HP_arrow.OwnerScreen = &GAUGE1;
 HP_arrow.Order = 3;
 HP_arrow.First_Point_X = 126;
 HP_arrow.First_Point_Y = 128;
 HP_arrow.Second_Point_X = 64;
 HP_arrow.Second_Point_Y = 177;
 HP_arrow.Visible = 0;
 HP_arrow.Pen_Width = 2;
 HP_arrow.Color = 0x213B;

 Gauge_label.OwnerScreen = &GAUGE1;
 Gauge_label.Order = 4;
 Gauge_label.Left = 215;
 Gauge_label.Top = 5;
 Gauge_label.Width = 61;
 Gauge_label.Height = 20;
 Gauge_label.Visible = 1;
 Gauge_label.Active = 0;
 Gauge_label.Caption = Gauge_label_Caption;
 Gauge_label.FontName =  0x00005242 ;
 Gauge_label.Font_Color = 0xE7FC;
 Gauge_label.VerticalText = 0;
 Gauge_label.OnUpPtr = 0;
 Gauge_label.OnDownPtr = 0;
 Gauge_label.OnClickPtr = 0;
 Gauge_label.OnPressPtr = 0;

 LP_arrow.OwnerScreen = &GAUGE1;
 LP_arrow.Order = 5;
 LP_arrow.First_Point_X = 344;
 LP_arrow.First_Point_Y = 128;
 LP_arrow.Second_Point_X = 283;
 LP_arrow.Second_Point_Y = 177;
 LP_arrow.Visible = 0;
 LP_arrow.Pen_Width = 2;
 LP_arrow.Color = 0x213B;

 Image104.OwnerScreen = &GAUGE1;
 Image104.Order = 6;
 Image104.Left = 0;
 Image104.Top = 0;
 Image104.Width = 30;
 Image104.Height = 30;
 Image104.Picture_Type = 1;
 Image104.Picture_Ratio = 1;
 Image104.Picture_Name =  0x00087E16 ;
 Image104.Visible = 1;
 Image104.Active = 1;
 Image104.OnUpPtr = 0;
 Image104.OnDownPtr = 0;
 Image104.OnClickPtr = 0;
 Image104.OnPressPtr = 0;

 Home_b7.OwnerScreen = &GAUGE1;
 Home_b7.Order = 7;
 Home_b7.Left = 147;
 Home_b7.Top = 232;
 Home_b7.Width = 78;
 Home_b7.Height = 35;
 Home_b7.Pen_Width = 1;
 Home_b7.Pen_Color = 0xC618;
 Home_b7.Visible = 1;
 Home_b7.Active = 1;
 Home_b7.Transparent = 1;
 Home_b7.Caption = Home_b7_Caption;
 Home_b7.TextAlign = _taCenter;
 Home_b7.TextAlignVertical= _tavMiddle;
 Home_b7.FontName =  0x00005242 ;
 Home_b7.PressColEnabled = 1;
 Home_b7.Font_Color = 0xD6BA;
 Home_b7.VerticalText = 0;
 Home_b7.Gradient = 1;
 Home_b7.Gradient_Orientation = 0;
 Home_b7.Gradient_Start_Color = 0x0418;
 Home_b7.Gradient_End_Color = 0x00A5;
 Home_b7.Color = 0xC618;
 Home_b7.Press_Color = 0xE71C;
 Home_b7.Corner_Radius = 5;
 Home_b7.OnUpPtr = 0;
 Home_b7.OnDownPtr = 0;
 Home_b7.OnClickPtr = BackToHome;
 Home_b7.OnPressPtr = 0;

 Next_b2.OwnerScreen = &GAUGE1;
 Next_b2.Order = 8;
 Next_b2.Left = 231;
 Next_b2.Top = 232;
 Next_b2.Width = 82;
 Next_b2.Height = 35;
 Next_b2.Pen_Width = 1;
 Next_b2.Pen_Color = 0xC618;
 Next_b2.Visible = 1;
 Next_b2.Active = 1;
 Next_b2.Transparent = 1;
 Next_b2.Caption = Next_b2_Caption;
 Next_b2.TextAlign = _taCenter;
 Next_b2.TextAlignVertical= _tavMiddle;
 Next_b2.FontName =  0x00005242 ;
 Next_b2.PressColEnabled = 1;
 Next_b2.Font_Color = 0xD6BA;
 Next_b2.VerticalText = 0;
 Next_b2.Gradient = 1;
 Next_b2.Gradient_Orientation = 0;
 Next_b2.Gradient_Start_Color = 0x0418;
 Next_b2.Gradient_End_Color = 0x00A5;
 Next_b2.Color = 0xC618;
 Next_b2.Press_Color = 0xE71C;
 Next_b2.Corner_Radius = 5;
 Next_b2.OnUpPtr = 0;
 Next_b2.OnDownPtr = 0;
 Next_b2.OnClickPtr = nextPage;
 Next_b2.OnPressPtr = 0;

 CircleButton8.OwnerScreen = &GAUGE1;
 CircleButton8.Order = 9;
 CircleButton8.Left = 450;
 CircleButton8.Top = 3;
 CircleButton8.Radius = 12;
 CircleButton8.Pen_Width = 1;
 CircleButton8.Pen_Color = 0x0000;
 CircleButton8.Visible = 1;
 CircleButton8.Active = 1;
 CircleButton8.Transparent = 1;
 CircleButton8.Caption = CircleButton8_Caption;
 CircleButton8.TextAlign = _taCenter;
 CircleButton8.TextAlignVertical= _tavMiddle;
 CircleButton8.FontName =  0x00005242 ;
 CircleButton8.PressColEnabled = 1;
 CircleButton8.Font_Color = 0x0000;
 CircleButton8.VerticalText = 0;
 CircleButton8.Gradient = 1;
 CircleButton8.Gradient_Orientation = 0;
 CircleButton8.Gradient_Start_Color = 0xFFFF;
 CircleButton8.Gradient_End_Color = 0xC618;
 CircleButton8.Color = 0xC618;
 CircleButton8.Press_Color = 0xE71C;
 CircleButton8.OnUpPtr = 0;
 CircleButton8.OnDownPtr = 0;
 CircleButton8.OnClickPtr = 0;
 CircleButton8.OnPressPtr = 0;

 Image81.OwnerScreen = &SYSTEM_SET;
 Image81.Order = 0;
 Image81.Left = 0;
 Image81.Top = 0;
 Image81.Width = 480;
 Image81.Height = 272;
 Image81.Picture_Type = 1;
 Image81.Picture_Ratio = 1;
 Image81.Picture_Name =  0x0003CAAE ;
 Image81.Visible = 1;
 Image81.Active = 0;
 Image81.OnUpPtr = 0;
 Image81.OnDownPtr = 0;
 Image81.OnClickPtr = 0;
 Image81.OnPressPtr = 0;

 Image300.OwnerScreen = &SYSTEM_SET;
 Image300.Order = 1;
 Image300.Left = 0;
 Image300.Top = 252;
 Image300.Width = 480;
 Image300.Height = 27;
 Image300.Picture_Type = 1;
 Image300.Picture_Ratio = 1;
 Image300.Picture_Name =  0x000F8AA6 ;
 Image300.Visible = 0;
 Image300.Active = 0;
 Image300.OnUpPtr = 0;
 Image300.OnDownPtr = 0;
 Image300.OnClickPtr = 0;
 Image300.OnPressPtr = 0;

 System_setting_label.OwnerScreen = &SYSTEM_SET;
 System_setting_label.Order = 2;
 System_setting_label.Left = 167;
 System_setting_label.Top = 5;
 System_setting_label.Width = 148;
 System_setting_label.Height = 20;
 System_setting_label.Visible = 1;
 System_setting_label.Active = 0;
 System_setting_label.Caption = System_setting_label_Caption;
 System_setting_label.FontName =  0x00005242 ;
 System_setting_label.Font_Color = 0xE7FC;
 System_setting_label.VerticalText = 0;
 System_setting_label.OnUpPtr = 0;
 System_setting_label.OnDownPtr = 0;
 System_setting_label.OnClickPtr = 0;
 System_setting_label.OnPressPtr = 0;

 sys_access.OwnerScreen = &SYSTEM_SET;
 sys_access.Order = 3;
 sys_access.Left = 46;
 sys_access.Top = 112;
 sys_access.Width = 55;
 sys_access.Height = 20;
 sys_access.Visible = 1;
 sys_access.Active = 1;
 sys_access.Caption = sys_access_Caption;
 sys_access.FontName =  0x00005242 ;
 sys_access.Font_Color = 0xFFFF;
 sys_access.VerticalText = 0;
 sys_access.OnUpPtr = 0;
 sys_access.OnDownPtr = 0;
 sys_access.OnClickPtr = 0;
 sys_access.OnPressPtr = 0;

 Label138.OwnerScreen = &SYSTEM_SET;
 Label138.Order = 4;
 Label138.Left = 380;
 Label138.Top = 112;
 Label138.Width = 70;
 Label138.Height = 20;
 Label138.Visible = 1;
 Label138.Active = 1;
 Label138.Caption = Label138_Caption;
 Label138.FontName =  0x00005242 ;
 Label138.Font_Color = 0xFFFF;
 Label138.VerticalText = 0;
 Label138.OnUpPtr = 0;
 Label138.OnDownPtr = 0;
 Label138.OnClickPtr = 0;
 Label138.OnPressPtr = 0;

 Label139.OwnerScreen = &SYSTEM_SET;
 Label139.Order = 5;
 Label139.Left = 141;
 Label139.Top = 112;
 Label139.Width = 34;
 Label139.Height = 20;
 Label139.Visible = 1;
 Label139.Active = 1;
 Label139.Caption = Label139_Caption;
 Label139.FontName =  0x00005242 ;
 Label139.Font_Color = 0xFFFF;
 Label139.VerticalText = 0;
 Label139.OnUpPtr = 0;
 Label139.OnDownPtr = 0;
 Label139.OnClickPtr = 0;
 Label139.OnPressPtr = 0;

 Label142.OwnerScreen = &SYSTEM_SET;
 Label142.Order = 6;
 Label142.Left = 220;
 Label142.Top = 212;
 Label142.Width = 45;
 Label142.Height = 20;
 Label142.Visible = 1;
 Label142.Active = 1;
 Label142.Caption = Label142_Caption;
 Label142.FontName =  0x00005242 ;
 Label142.Font_Color = 0xFFFF;
 Label142.VerticalText = 0;
 Label142.OnUpPtr = 0;
 Label142.OnDownPtr = 0;
 Label142.OnClickPtr = 0;
 Label142.OnPressPtr = 0;

 Label143.OwnerScreen = &SYSTEM_SET;
 Label143.Order = 7;
 Label143.Left = 136;
 Label143.Top = 212;
 Label143.Width = 44;
 Label143.Height = 20;
 Label143.Visible = 1;
 Label143.Active = 1;
 Label143.Caption = Label143_Caption;
 Label143.FontName =  0x00005242 ;
 Label143.Font_Color = 0xFFFF;
 Label143.VerticalText = 0;
 Label143.OnUpPtr = 0;
 Label143.OnDownPtr = 0;
 Label143.OnClickPtr = 0;
 Label143.OnPressPtr = 0;

 Label144.OwnerScreen = &SYSTEM_SET;
 Label144.Order = 8;
 Label144.Left = 46;
 Label144.Top = 212;
 Label144.Width = 54;
 Label144.Height = 20;
 Label144.Visible = 1;
 Label144.Active = 1;
 Label144.Caption = Label144_Caption;
 Label144.FontName =  0x00005242 ;
 Label144.Font_Color = 0xFFFF;
 Label144.VerticalText = 0;
 Label144.OnUpPtr = 0;
 Label144.OnDownPtr = 0;
 Label144.OnClickPtr = 0;
 Label144.OnPressPtr = 0;

 Label145.OwnerScreen = &SYSTEM_SET;
 Label145.Order = 9;
 Label145.Left = 305;
 Label145.Top = 112;
 Label145.Width = 47;
 Label145.Height = 20;
 Label145.Visible = 1;
 Label145.Active = 1;
 Label145.Caption = Label145_Caption;
 Label145.FontName =  0x00005242 ;
 Label145.Font_Color = 0xFFFF;
 Label145.VerticalText = 0;
 Label145.OnUpPtr = 0;
 Label145.OnDownPtr = 0;
 Label145.OnClickPtr = 0;
 Label145.OnPressPtr = 0;

 Image90.OwnerScreen = &SYSTEM_SET;
 Image90.Order = 10;
 Image90.Left = 115;
 Image90.Top = 137;
 Image90.Width = 79;
 Image90.Height = 74;
 Image90.Picture_Type = 1;
 Image90.Picture_Ratio = 1;
 Image90.Picture_Name =  0x000FEFEC ;
 Image90.Visible = 0;
 Image90.Active = 0;
 Image90.OnUpPtr = 0;
 Image90.OnDownPtr = 0;
 Image90.OnClickPtr = 0;
 Image90.OnPressPtr = 0;

 Image91.OwnerScreen = &SYSTEM_SET;
 Image91.Order = 11;
 Image91.Left = 200;
 Image91.Top = 137;
 Image91.Width = 79;
 Image91.Height = 74;
 Image91.Picture_Type = 1;
 Image91.Picture_Ratio = 1;
 Image91.Picture_Name =  0x00101D9E ;
 Image91.Visible = 0;
 Image91.Active = 0;
 Image91.OnUpPtr = 0;
 Image91.OnDownPtr = 0;
 Image91.OnClickPtr = 0;
 Image91.OnPressPtr = 0;

 system_delay.OwnerScreen = &SYSTEM_SET;
 system_delay.Order = 12;
 system_delay.Left = 115;
 system_delay.Top = 137;
 system_delay.Width = 79;
 system_delay.Height = 74;
 system_delay.Picture_Type = 1;
 system_delay.Picture_Ratio = 1;
 system_delay.Picture_Name =  0x00104B50 ;
 system_delay.Visible = 1;
 system_delay.Active = 1;
 system_delay.OnUpPtr = system_delayOnUp;
 system_delay.OnDownPtr = system_delayOnDown;
 system_delay.OnClickPtr = 0;
 system_delay.OnPressPtr = 0;

 system_limits.OwnerScreen = &SYSTEM_SET;
 system_limits.Order = 13;
 system_limits.Left = 200;
 system_limits.Top = 137;
 system_limits.Width = 79;
 system_limits.Height = 74;
 system_limits.Picture_Type = 1;
 system_limits.Picture_Ratio = 1;
 system_limits.Picture_Name =  0x00107902 ;
 system_limits.Visible = 1;
 system_limits.Active = 1;
 system_limits.OnUpPtr = system_limitsOnDown;
 system_limits.OnDownPtr = system_limitsOnUp;
 system_limits.OnClickPtr = 0;
 system_limits.OnPressPtr = 0;

 Label238.OwnerScreen = &SYSTEM_SET;
 Label238.Order = 14;
 Label238.Left = 222;
 Label238.Top = 112;
 Label238.Width = 43;
 Label238.Height = 20;
 Label238.Visible = 1;
 Label238.Active = 1;
 Label238.Caption = Label238_Caption;
 Label238.FontName =  0x00005242 ;
 Label238.Font_Color = 0xFFFF;
 Label238.VerticalText = 0;
 Label238.OnUpPtr = 0;
 Label238.OnDownPtr = 0;
 Label238.OnClickPtr = 0;
 Label238.OnPressPtr = 0;

 System_Set_Message.OwnerScreen = &SYSTEM_SET;
 System_Set_Message.Order = 15;
 System_Set_Message.Left = 15;
 System_Set_Message.Top = 245;
 System_Set_Message.Width = 170;
 System_Set_Message.Height = 25;
 System_Set_Message.Pen_Width = 0;
 System_Set_Message.Pen_Color = 0x0000;
 System_Set_Message.Visible = 0;
 System_Set_Message.Active = 0;
 System_Set_Message.Transparent = 0;
 System_Set_Message.Caption = System_Set_Message_Caption;
 System_Set_Message.TextAlign = _taCenter;
 System_Set_Message.TextAlignVertical= _tavMiddle;
 System_Set_Message.FontName =  0x00020922 ;
 System_Set_Message.PressColEnabled = 0;
 System_Set_Message.Font_Color = 0xF800;
 System_Set_Message.VerticalText = 0;
 System_Set_Message.Gradient = 0;
 System_Set_Message.Gradient_Orientation = 0;
 System_Set_Message.Gradient_Start_Color = 0xFFFF;
 System_Set_Message.Gradient_End_Color = 0xC618;
 System_Set_Message.Color = 0xC618;
 System_Set_Message.Press_Color = 0xE71C;
 System_Set_Message.OnUpPtr = 0;
 System_Set_Message.OnDownPtr = 0;
 System_Set_Message.OnClickPtr = 0;
 System_Set_Message.OnPressPtr = 0;

 Image85.OwnerScreen = &SYSTEM_SET;
 Image85.Order = 16;
 Image85.Left = 200;
 Image85.Top = 37;
 Image85.Width = 79;
 Image85.Height = 74;
 Image85.Picture_Type = 1;
 Image85.Picture_Ratio = 1;
 Image85.Picture_Name =  0x0010A6B4 ;
 Image85.Visible = 1;
 Image85.Active = 0;
 Image85.OnUpPtr = 0;
 Image85.OnDownPtr = 0;
 Image85.OnClickPtr = 0;
 Image85.OnPressPtr = 0;

 Image92.OwnerScreen = &SYSTEM_SET;
 Image92.Order = 17;
 Image92.Left = 285;
 Image92.Top = 37;
 Image92.Width = 79;
 Image92.Height = 74;
 Image92.Picture_Type = 1;
 Image92.Picture_Ratio = 1;
 Image92.Picture_Name =  0x0010D466 ;
 Image92.Visible = 1;
 Image92.Active = 0;
 Image92.OnUpPtr = 0;
 Image92.OnDownPtr = 0;
 Image92.OnClickPtr = 0;
 Image92.OnPressPtr = 0;

 Image88.OwnerScreen = &SYSTEM_SET;
 Image88.Order = 18;
 Image88.Left = 370;
 Image88.Top = 37;
 Image88.Width = 79;
 Image88.Height = 74;
 Image88.Picture_Type = 1;
 Image88.Picture_Ratio = 1;
 Image88.Picture_Name =  0x00110218 ;
 Image88.Visible = 1;
 Image88.Active = 0;
 Image88.OnUpPtr = 0;
 Image88.OnDownPtr = 0;
 Image88.OnClickPtr = 0;
 Image88.OnPressPtr = 0;

 Image93.OwnerScreen = &SYSTEM_SET;
 Image93.Order = 19;
 Image93.Left = 30;
 Image93.Top = 137;
 Image93.Width = 79;
 Image93.Height = 74;
 Image93.Picture_Type = 1;
 Image93.Picture_Ratio = 1;
 Image93.Picture_Name =  0x00112FCA ;
 Image93.Visible = 0;
 Image93.Active = 0;
 Image93.OnUpPtr = 0;
 Image93.OnDownPtr = 0;
 Image93.OnClickPtr = 0;
 Image93.OnPressPtr = 0;

 system_history.OwnerScreen = &SYSTEM_SET;
 system_history.Order = 20;
 system_history.Left = 30;
 system_history.Top = 137;
 system_history.Width = 79;
 system_history.Height = 74;
 system_history.Picture_Type = 1;
 system_history.Picture_Ratio = 1;
 system_history.Picture_Name =  0x00115D7C ;
 system_history.Visible = 1;
 system_history.Active = 1;
 system_history.OnUpPtr = system_historyOnUp;
 system_history.OnDownPtr = system_historyOnDown;
 system_history.OnClickPtr = 0;
 system_history.OnPressPtr = 0;

 Image89.OwnerScreen = &SYSTEM_SET;
 Image89.Order = 21;
 Image89.Left = 115;
 Image89.Top = 37;
 Image89.Width = 79;
 Image89.Height = 74;
 Image89.Picture_Type = 1;
 Image89.Picture_Ratio = 1;
 Image89.Picture_Name =  0x00118B2E ;
 Image89.Visible = 1;
 Image89.Active = 0;
 Image89.OnUpPtr = 0;
 Image89.OnDownPtr = 0;
 Image89.OnClickPtr = 0;
 Image89.OnPressPtr = 0;

 Image83.OwnerScreen = &SYSTEM_SET;
 Image83.Order = 22;
 Image83.Left = 30;
 Image83.Top = 37;
 Image83.Width = 79;
 Image83.Height = 74;
 Image83.Picture_Type = 1;
 Image83.Picture_Ratio = 1;
 Image83.Picture_Name =  0x0011B8E0 ;
 Image83.Visible = 1;
 Image83.Active = 0;
 Image83.OnUpPtr = 0;
 Image83.OnDownPtr = 0;
 Image83.OnClickPtr = 0;
 Image83.OnPressPtr = 0;

 system_EEV.OwnerScreen = &SYSTEM_SET;
 system_EEV.Order = 23;
 system_EEV.Left = 115;
 system_EEV.Top = 37;
 system_EEV.Width = 79;
 system_EEV.Height = 74;
 system_EEV.Picture_Type = 1;
 system_EEV.Picture_Ratio = 1;
 system_EEV.Picture_Name =  0x0011E692 ;
 system_EEV.Visible = 1;
 system_EEV.Active = 1;
 system_EEV.OnUpPtr = system_EEVOnUp;
 system_EEV.OnDownPtr = system_EEVOnDown;
 system_EEV.OnClickPtr = 0;
 system_EEV.OnPressPtr = 0;

 system_pass.OwnerScreen = &SYSTEM_SET;
 system_pass.Order = 24;
 system_pass.Left = 30;
 system_pass.Top = 37;
 system_pass.Width = 79;
 system_pass.Height = 74;
 system_pass.Picture_Type = 1;
 system_pass.Picture_Ratio = 1;
 system_pass.Picture_Name =  0x00121444 ;
 system_pass.Visible = 1;
 system_pass.Active = 0;
 system_pass.OnUpPtr = system_passOnUp;
 system_pass.OnDownPtr = system_passOnDown;
 system_pass.OnClickPtr = 0;
 system_pass.OnPressPtr = 0;

 system_mode.OwnerScreen = &SYSTEM_SET;
 system_mode.Order = 25;
 system_mode.Left = 200;
 system_mode.Top = 37;
 system_mode.Width = 79;
 system_mode.Height = 74;
 system_mode.Picture_Type = 1;
 system_mode.Picture_Ratio = 1;
 system_mode.Picture_Name =  0x001241F6 ;
 system_mode.Visible = 1;
 system_mode.Active = 1;
 system_mode.OnUpPtr = system_modeOnUp;
 system_mode.OnDownPtr = system_modeOnDown;
 system_mode.OnClickPtr = 0;
 system_mode.OnPressPtr = 0;

 system_graph.OwnerScreen = &SYSTEM_SET;
 system_graph.Order = 26;
 system_graph.Left = 285;
 system_graph.Top = 37;
 system_graph.Width = 79;
 system_graph.Height = 74;
 system_graph.Picture_Type = 1;
 system_graph.Picture_Ratio = 1;
 system_graph.Picture_Name =  0x00126FA8 ;
 system_graph.Visible = 1;
 system_graph.Active = 0;
 system_graph.OnUpPtr = system_graphOnUp;
 system_graph.OnDownPtr = system_graphOnDown;
 system_graph.OnClickPtr = 0;
 system_graph.OnPressPtr = 0;

 system_microSD.OwnerScreen = &SYSTEM_SET;
 system_microSD.Order = 27;
 system_microSD.Left = 370;
 system_microSD.Top = 37;
 system_microSD.Width = 79;
 system_microSD.Height = 74;
 system_microSD.Picture_Type = 1;
 system_microSD.Picture_Ratio = 1;
 system_microSD.Picture_Name =  0x00129D5A ;
 system_microSD.Visible = 1;
 system_microSD.Active = 0;
 system_microSD.OnUpPtr = system_microSDOnUp;
 system_microSD.OnDownPtr = system_microSDOnDown;
 system_microSD.OnClickPtr = 0;
 system_microSD.OnPressPtr = 0;

 Home_b8.OwnerScreen = &SYSTEM_SET;
 Home_b8.Order = 28;
 Home_b8.Left = 387;
 Home_b8.Top = 227;
 Home_b8.Width = 78;
 Home_b8.Height = 35;
 Home_b8.Pen_Width = 1;
 Home_b8.Pen_Color = 0xC618;
 Home_b8.Visible = 1;
 Home_b8.Active = 1;
 Home_b8.Transparent = 1;
 Home_b8.Caption = Home_b8_Caption;
 Home_b8.TextAlign = _taCenter;
 Home_b8.TextAlignVertical= _tavMiddle;
 Home_b8.FontName =  0x00005242 ;
 Home_b8.PressColEnabled = 1;
 Home_b8.Font_Color = 0xD6BA;
 Home_b8.VerticalText = 0;
 Home_b8.Gradient = 1;
 Home_b8.Gradient_Orientation = 0;
 Home_b8.Gradient_Start_Color = 0x0418;
 Home_b8.Gradient_End_Color = 0x00A5;
 Home_b8.Color = 0xC618;
 Home_b8.Press_Color = 0xE71C;
 Home_b8.Corner_Radius = 5;
 Home_b8.OnUpPtr = 0;
 Home_b8.OnDownPtr = 0;
 Home_b8.OnClickPtr = BackToHome;
 Home_b8.OnPressPtr = 0;

 Back_b30.OwnerScreen = &SYSTEM_SET;
 Back_b30.Order = 29;
 Back_b30.Left = 298;
 Back_b30.Top = 227;
 Back_b30.Width = 78;
 Back_b30.Height = 35;
 Back_b30.Pen_Width = 1;
 Back_b30.Pen_Color = 0xC618;
 Back_b30.Visible = 1;
 Back_b30.Active = 1;
 Back_b30.Transparent = 1;
 Back_b30.Caption = Back_b30_Caption;
 Back_b30.TextAlign = _taCenter;
 Back_b30.TextAlignVertical= _tavMiddle;
 Back_b30.FontName =  0x00005242 ;
 Back_b30.PressColEnabled = 1;
 Back_b30.Font_Color = 0xD6BA;
 Back_b30.VerticalText = 0;
 Back_b30.Gradient = 1;
 Back_b30.Gradient_Orientation = 0;
 Back_b30.Gradient_Start_Color = 0x0418;
 Back_b30.Gradient_End_Color = 0x00A5;
 Back_b30.Color = 0xC618;
 Back_b30.Press_Color = 0xE71C;
 Back_b30.Corner_Radius = 5;
 Back_b30.OnUpPtr = 0;
 Back_b30.OnDownPtr = 0;
 Back_b30.OnClickPtr = goToBack;
 Back_b30.OnPressPtr = 0;

 delay_bgd.OwnerScreen = &DELAY_MENU;
 delay_bgd.Order = 0;
 delay_bgd.Left = 1;
 delay_bgd.Top = 1;
 delay_bgd.Width = 480;
 delay_bgd.Height = 272;
 delay_bgd.Picture_Type = 1;
 delay_bgd.Picture_Ratio = 1;
 delay_bgd.Picture_Name =  0x0012CB0C ;
 delay_bgd.Visible = 1;
 delay_bgd.Active = 0;
 delay_bgd.OnUpPtr = 0;
 delay_bgd.OnDownPtr = 0;
 delay_bgd.OnClickPtr = 0;
 delay_bgd.OnPressPtr = 0;

 Image306.OwnerScreen = &DELAY_MENU;
 Image306.Order = 1;
 Image306.Left = 375;
 Image306.Top = 34;
 Image306.Width = 28;
 Image306.Height = 32;
 Image306.Picture_Type = 1;
 Image306.Picture_Ratio = 1;
 Image306.Picture_Name =  0x0016C712 ;
 Image306.Visible = 1;
 Image306.Active = 0;
 Image306.OnUpPtr = 0;
 Image306.OnDownPtr = 0;
 Image306.OnClickPtr = 0;
 Image306.OnPressPtr = 0;

 Image307.OwnerScreen = &DELAY_MENU;
 Image307.Order = 2;
 Image307.Left = 375;
 Image307.Top = 67;
 Image307.Width = 28;
 Image307.Height = 32;
 Image307.Picture_Type = 1;
 Image307.Picture_Ratio = 1;
 Image307.Picture_Name =  0x0016C712 ;
 Image307.Visible = 1;
 Image307.Active = 0;
 Image307.OnUpPtr = 0;
 Image307.OnDownPtr = 0;
 Image307.OnClickPtr = 0;
 Image307.OnPressPtr = 0;

 Image308.OwnerScreen = &DELAY_MENU;
 Image308.Order = 3;
 Image308.Left = 375;
 Image308.Top = 100;
 Image308.Width = 28;
 Image308.Height = 32;
 Image308.Picture_Type = 1;
 Image308.Picture_Ratio = 1;
 Image308.Picture_Name =  0x0016C712 ;
 Image308.Visible = 1;
 Image308.Active = 0;
 Image308.OnUpPtr = 0;
 Image308.OnDownPtr = 0;
 Image308.OnClickPtr = 0;
 Image308.OnPressPtr = 0;

 Image309.OwnerScreen = &DELAY_MENU;
 Image309.Order = 4;
 Image309.Left = 375;
 Image309.Top = 133;
 Image309.Width = 28;
 Image309.Height = 32;
 Image309.Picture_Type = 1;
 Image309.Picture_Ratio = 1;
 Image309.Picture_Name =  0x0016C712 ;
 Image309.Visible = 1;
 Image309.Active = 0;
 Image309.OnUpPtr = 0;
 Image309.OnDownPtr = 0;
 Image309.OnClickPtr = 0;
 Image309.OnPressPtr = 0;

 Image314.OwnerScreen = &DELAY_MENU;
 Image314.Order = 5;
 Image314.Left = 408;
 Image314.Top = 100;
 Image314.Width = 28;
 Image314.Height = 32;
 Image314.Picture_Type = 1;
 Image314.Picture_Ratio = 1;
 Image314.Picture_Name =  0x0016CE18 ;
 Image314.Visible = 1;
 Image314.Active = 0;
 Image314.OnUpPtr = 0;
 Image314.OnDownPtr = 0;
 Image314.OnClickPtr = 0;
 Image314.OnPressPtr = 0;

 Image313.OwnerScreen = &DELAY_MENU;
 Image313.Order = 6;
 Image313.Left = 408;
 Image313.Top = 67;
 Image313.Width = 28;
 Image313.Height = 32;
 Image313.Picture_Type = 1;
 Image313.Picture_Ratio = 1;
 Image313.Picture_Name =  0x0016CE18 ;
 Image313.Visible = 1;
 Image313.Active = 0;
 Image313.OnUpPtr = 0;
 Image313.OnDownPtr = 0;
 Image313.OnClickPtr = 0;
 Image313.OnPressPtr = 0;

 Image312.OwnerScreen = &DELAY_MENU;
 Image312.Order = 7;
 Image312.Left = 408;
 Image312.Top = 34;
 Image312.Width = 28;
 Image312.Height = 32;
 Image312.Picture_Type = 1;
 Image312.Picture_Ratio = 1;
 Image312.Picture_Name =  0x0016CE18 ;
 Image312.Visible = 1;
 Image312.Active = 0;
 Image312.OnUpPtr = 0;
 Image312.OnDownPtr = 0;
 Image312.OnClickPtr = 0;
 Image312.OnPressPtr = 0;

 Image344.OwnerScreen = &DELAY_MENU;
 Image344.Order = 8;
 Image344.Left = 440;
 Image344.Top = 34;
 Image344.Width = 34;
 Image344.Height = 32;
 Image344.Picture_Type = 1;
 Image344.Picture_Ratio = 1;
 Image344.Picture_Name =  0x0016D51E ;
 Image344.Visible = 1;
 Image344.Active = 0;
 Image344.OnUpPtr = 0;
 Image344.OnDownPtr = 0;
 Image344.OnClickPtr = 0;
 Image344.OnPressPtr = 0;

 Image345.OwnerScreen = &DELAY_MENU;
 Image345.Order = 9;
 Image345.Left = 440;
 Image345.Top = 67;
 Image345.Width = 34;
 Image345.Height = 32;
 Image345.Picture_Type = 1;
 Image345.Picture_Ratio = 1;
 Image345.Picture_Name =  0x0016D51E ;
 Image345.Visible = 1;
 Image345.Active = 0;
 Image345.OnUpPtr = 0;
 Image345.OnDownPtr = 0;
 Image345.OnClickPtr = 0;
 Image345.OnPressPtr = 0;

 Image346.OwnerScreen = &DELAY_MENU;
 Image346.Order = 10;
 Image346.Left = 440;
 Image346.Top = 100;
 Image346.Width = 34;
 Image346.Height = 32;
 Image346.Picture_Type = 1;
 Image346.Picture_Ratio = 1;
 Image346.Picture_Name =  0x0016D51E ;
 Image346.Visible = 1;
 Image346.Active = 0;
 Image346.OnUpPtr = 0;
 Image346.OnDownPtr = 0;
 Image346.OnClickPtr = 0;
 Image346.OnPressPtr = 0;

 Image315.OwnerScreen = &DELAY_MENU;
 Image315.Order = 11;
 Image315.Left = 408;
 Image315.Top = 133;
 Image315.Width = 28;
 Image315.Height = 32;
 Image315.Picture_Type = 1;
 Image315.Picture_Ratio = 1;
 Image315.Picture_Name =  0x0016CE18 ;
 Image315.Visible = 1;
 Image315.Active = 0;
 Image315.OnUpPtr = 0;
 Image315.OnDownPtr = 0;
 Image315.OnClickPtr = 0;
 Image315.OnPressPtr = 0;

 Image347.OwnerScreen = &DELAY_MENU;
 Image347.Order = 12;
 Image347.Left = 440;
 Image347.Top = 133;
 Image347.Width = 34;
 Image347.Height = 32;
 Image347.Picture_Type = 1;
 Image347.Picture_Ratio = 1;
 Image347.Picture_Name =  0x0016D51E ;
 Image347.Visible = 1;
 Image347.Active = 0;
 Image347.OnUpPtr = 0;
 Image347.OnDownPtr = 0;
 Image347.OnClickPtr = 0;
 Image347.OnPressPtr = 0;

 Image348.OwnerScreen = &DELAY_MENU;
 Image348.Order = 13;
 Image348.Left = 440;
 Image348.Top = 166;
 Image348.Width = 34;
 Image348.Height = 32;
 Image348.Picture_Type = 1;
 Image348.Picture_Ratio = 1;
 Image348.Picture_Name =  0x0016D51E ;
 Image348.Visible = 1;
 Image348.Active = 0;
 Image348.OnUpPtr = 0;
 Image348.OnDownPtr = 0;
 Image348.OnClickPtr = 0;
 Image348.OnPressPtr = 0;

 Image311.OwnerScreen = &DELAY_MENU;
 Image311.Order = 14;
 Image311.Left = 375;
 Image311.Top = 199;
 Image311.Width = 28;
 Image311.Height = 32;
 Image311.Picture_Type = 1;
 Image311.Picture_Ratio = 1;
 Image311.Picture_Name =  0x0016C712 ;
 Image311.Visible = 1;
 Image311.Active = 0;
 Image311.OnUpPtr = 0;
 Image311.OnDownPtr = 0;
 Image311.OnClickPtr = 0;
 Image311.OnPressPtr = 0;

 Image310.OwnerScreen = &DELAY_MENU;
 Image310.Order = 15;
 Image310.Left = 375;
 Image310.Top = 166;
 Image310.Width = 28;
 Image310.Height = 32;
 Image310.Picture_Type = 1;
 Image310.Picture_Ratio = 1;
 Image310.Picture_Name =  0x0016C712 ;
 Image310.Visible = 1;
 Image310.Active = 0;
 Image310.OnUpPtr = 0;
 Image310.OnDownPtr = 0;
 Image310.OnClickPtr = 0;
 Image310.OnPressPtr = 0;

 Image316.OwnerScreen = &DELAY_MENU;
 Image316.Order = 16;
 Image316.Left = 408;
 Image316.Top = 166;
 Image316.Width = 28;
 Image316.Height = 32;
 Image316.Picture_Type = 1;
 Image316.Picture_Ratio = 1;
 Image316.Picture_Name =  0x0016CE18 ;
 Image316.Visible = 1;
 Image316.Active = 0;
 Image316.OnUpPtr = 0;
 Image316.OnDownPtr = 0;
 Image316.OnClickPtr = 0;
 Image316.OnPressPtr = 0;

 Image317.OwnerScreen = &DELAY_MENU;
 Image317.Order = 17;
 Image317.Left = 408;
 Image317.Top = 199;
 Image317.Width = 28;
 Image317.Height = 32;
 Image317.Picture_Type = 1;
 Image317.Picture_Ratio = 1;
 Image317.Picture_Name =  0x0016CE18 ;
 Image317.Visible = 1;
 Image317.Active = 0;
 Image317.OnUpPtr = 0;
 Image317.OnDownPtr = 0;
 Image317.OnClickPtr = 0;
 Image317.OnPressPtr = 0;

 Image349.OwnerScreen = &DELAY_MENU;
 Image349.Order = 18;
 Image349.Left = 440;
 Image349.Top = 199;
 Image349.Width = 34;
 Image349.Height = 32;
 Image349.Picture_Type = 1;
 Image349.Picture_Ratio = 1;
 Image349.Picture_Name =  0x0016D51E ;
 Image349.Visible = 1;
 Image349.Active = 0;
 Image349.OnUpPtr = 0;
 Image349.OnDownPtr = 0;
 Image349.OnClickPtr = 0;
 Image349.OnPressPtr = 0;

 Box63.OwnerScreen = &DELAY_MENU;
 Box63.Order = 19;
 Box63.Left = 302;
 Box63.Top = 107;
 Box63.Width = 34;
 Box63.Height = 18;
 Box63.Pen_Width = 0;
 Box63.Pen_Color = 0x0000;
 Box63.Visible = 1;
 Box63.Active = 0;
 Box63.Transparent = 1;
 Box63.Gradient = 0;
 Box63.Gradient_Orientation = 0;
 Box63.Gradient_Start_Color = 0xFFFF;
 Box63.Gradient_End_Color = 0xC618;
 Box63.Color = 0xFFFF;
 Box63.PressColEnabled = 0;
 Box63.Press_Color = 0xE71C;
 Box63.OnUpPtr = 0;
 Box63.OnDownPtr = 0;
 Box63.OnClickPtr = 0;
 Box63.OnPressPtr = 0;

 Box64.OwnerScreen = &DELAY_MENU;
 Box64.Order = 20;
 Box64.Left = 302;
 Box64.Top = 140;
 Box64.Width = 34;
 Box64.Height = 18;
 Box64.Pen_Width = 0;
 Box64.Pen_Color = 0x0000;
 Box64.Visible = 1;
 Box64.Active = 0;
 Box64.Transparent = 1;
 Box64.Gradient = 0;
 Box64.Gradient_Orientation = 0;
 Box64.Gradient_Start_Color = 0xFFFF;
 Box64.Gradient_End_Color = 0xC618;
 Box64.Color = 0xFFFF;
 Box64.PressColEnabled = 0;
 Box64.Press_Color = 0xE71C;
 Box64.OnUpPtr = 0;
 Box64.OnDownPtr = 0;
 Box64.OnClickPtr = 0;
 Box64.OnPressPtr = 0;

 Box66.OwnerScreen = &DELAY_MENU;
 Box66.Order = 21;
 Box66.Left = 302;
 Box66.Top = 206;
 Box66.Width = 34;
 Box66.Height = 18;
 Box66.Pen_Width = 0;
 Box66.Pen_Color = 0x0000;
 Box66.Visible = 1;
 Box66.Active = 0;
 Box66.Transparent = 1;
 Box66.Gradient = 0;
 Box66.Gradient_Orientation = 0;
 Box66.Gradient_Start_Color = 0xFFFF;
 Box66.Gradient_End_Color = 0xC618;
 Box66.Color = 0xFFFF;
 Box66.PressColEnabled = 0;
 Box66.Press_Color = 0xE71C;
 Box66.OnUpPtr = 0;
 Box66.OnDownPtr = 0;
 Box66.OnClickPtr = 0;
 Box66.OnPressPtr = 0;

 Delay_Source_UP.OwnerScreen = &DELAY_MENU;
 Delay_Source_UP.Order = 22;
 Delay_Source_UP.Left = 407;
 Delay_Source_UP.Top = 34;
 Delay_Source_UP.Width = 28;
 Delay_Source_UP.Height = 32;
 Delay_Source_UP.Picture_Type = 1;
 Delay_Source_UP.Picture_Ratio = 1;
 Delay_Source_UP.Picture_Name =  0x0016DDA4 ;
 Delay_Source_UP.Visible = 1;
 Delay_Source_UP.Active = 1;
 Delay_Source_UP.OnUpPtr = Delay_Source_UPOnUp;
 Delay_Source_UP.OnDownPtr = 0;
 Delay_Source_UP.OnClickPtr = 0;
 Delay_Source_UP.OnPressPtr = Delay_Source_UPOnPress;

 Delay_heat_pump_up.OwnerScreen = &DELAY_MENU;
 Delay_heat_pump_up.Order = 23;
 Delay_heat_pump_up.Left = 407;
 Delay_heat_pump_up.Top = 67;
 Delay_heat_pump_up.Width = 28;
 Delay_heat_pump_up.Height = 32;
 Delay_heat_pump_up.Picture_Type = 1;
 Delay_heat_pump_up.Picture_Ratio = 1;
 Delay_heat_pump_up.Picture_Name =  0x0016DDA4 ;
 Delay_heat_pump_up.Visible = 1;
 Delay_heat_pump_up.Active = 1;
 Delay_heat_pump_up.OnUpPtr = Delay_heat_pump_upOnUp;
 Delay_heat_pump_up.OnDownPtr = 0;
 Delay_heat_pump_up.OnClickPtr = 0;
 Delay_heat_pump_up.OnPressPtr = Delay_heat_pump_upOnPress;

 Delay_reversing_UP.OwnerScreen = &DELAY_MENU;
 Delay_reversing_UP.Order = 24;
 Delay_reversing_UP.Left = 407;
 Delay_reversing_UP.Top = 100;
 Delay_reversing_UP.Width = 28;
 Delay_reversing_UP.Height = 32;
 Delay_reversing_UP.Picture_Type = 1;
 Delay_reversing_UP.Picture_Ratio = 1;
 Delay_reversing_UP.Picture_Name =  0x0016DDA4 ;
 Delay_reversing_UP.Visible = 1;
 Delay_reversing_UP.Active = 1;
 Delay_reversing_UP.OnUpPtr = Delay_reversing_UPOnUp;
 Delay_reversing_UP.OnDownPtr = 0;
 Delay_reversing_UP.OnClickPtr = 0;
 Delay_reversing_UP.OnPressPtr = Delay_reversing_UPOnPress;

 Delay_trv_up.OwnerScreen = &DELAY_MENU;
 Delay_trv_up.Order = 25;
 Delay_trv_up.Left = 407;
 Delay_trv_up.Top = 133;
 Delay_trv_up.Width = 28;
 Delay_trv_up.Height = 32;
 Delay_trv_up.Picture_Type = 1;
 Delay_trv_up.Picture_Ratio = 1;
 Delay_trv_up.Picture_Name =  0x0016DDA4 ;
 Delay_trv_up.Visible = 1;
 Delay_trv_up.Active = 1;
 Delay_trv_up.OnUpPtr = Delay_trv_UPOnUp;
 Delay_trv_up.OnDownPtr = 0;
 Delay_trv_up.OnClickPtr = 0;
 Delay_trv_up.OnPressPtr = Delay_trv_UPOnPress;

 Delay_DHW_valve_UP.OwnerScreen = &DELAY_MENU;
 Delay_DHW_valve_UP.Order = 26;
 Delay_DHW_valve_UP.Left = 407;
 Delay_DHW_valve_UP.Top = 166;
 Delay_DHW_valve_UP.Width = 28;
 Delay_DHW_valve_UP.Height = 32;
 Delay_DHW_valve_UP.Picture_Type = 1;
 Delay_DHW_valve_UP.Picture_Ratio = 1;
 Delay_DHW_valve_UP.Picture_Name =  0x0016DDA4 ;
 Delay_DHW_valve_UP.Visible = 1;
 Delay_DHW_valve_UP.Active = 1;
 Delay_DHW_valve_UP.OnUpPtr = Delay_DHW_valve_UPOnUp;
 Delay_DHW_valve_UP.OnDownPtr = 0;
 Delay_DHW_valve_UP.OnClickPtr = 0;
 Delay_DHW_valve_UP.OnPressPtr = Delay_DHW_valve_UPOnPress;

 Delay_compressor_UP.OwnerScreen = &DELAY_MENU;
 Delay_compressor_UP.Order = 27;
 Delay_compressor_UP.Left = 407;
 Delay_compressor_UP.Top = 199;
 Delay_compressor_UP.Width = 28;
 Delay_compressor_UP.Height = 32;
 Delay_compressor_UP.Picture_Type = 1;
 Delay_compressor_UP.Picture_Ratio = 1;
 Delay_compressor_UP.Picture_Name =  0x0016DDA4 ;
 Delay_compressor_UP.Visible = 1;
 Delay_compressor_UP.Active = 1;
 Delay_compressor_UP.OnUpPtr = Delay_compressor_UPOnUp;
 Delay_compressor_UP.OnDownPtr = 0;
 Delay_compressor_UP.OnClickPtr = 0;
 Delay_compressor_UP.OnPressPtr = Delay_compressor_UPOnPress;

 Delay_Source_SET.OwnerScreen = &DELAY_MENU;
 Delay_Source_SET.Order = 28;
 Delay_Source_SET.Left = 439;
 Delay_Source_SET.Top = 34;
 Delay_Source_SET.Width = 34;
 Delay_Source_SET.Height = 32;
 Delay_Source_SET.Picture_Type = 1;
 Delay_Source_SET.Picture_Ratio = 1;
 Delay_Source_SET.Picture_Name =  0x0016E4AA ;
 Delay_Source_SET.Visible = 1;
 Delay_Source_SET.Active = 1;
 Delay_Source_SET.OnUpPtr = Delay_Source_SETOnUp;
 Delay_Source_SET.OnDownPtr = Delay_Source_SETOnDown;
 Delay_Source_SET.OnClickPtr = 0;
 Delay_Source_SET.OnPressPtr = 0;

 Delay_heat_pump_SET.OwnerScreen = &DELAY_MENU;
 Delay_heat_pump_SET.Order = 29;
 Delay_heat_pump_SET.Left = 439;
 Delay_heat_pump_SET.Top = 67;
 Delay_heat_pump_SET.Width = 34;
 Delay_heat_pump_SET.Height = 32;
 Delay_heat_pump_SET.Picture_Type = 1;
 Delay_heat_pump_SET.Picture_Ratio = 1;
 Delay_heat_pump_SET.Picture_Name =  0x0016E4AA ;
 Delay_heat_pump_SET.Visible = 1;
 Delay_heat_pump_SET.Active = 1;
 Delay_heat_pump_SET.OnUpPtr = Delay_heat_pump_SETOnUp;
 Delay_heat_pump_SET.OnDownPtr = Delay_heat_pump_SETOnDown;
 Delay_heat_pump_SET.OnClickPtr = 0;
 Delay_heat_pump_SET.OnPressPtr = 0;

 Delay_reversing_SET.OwnerScreen = &DELAY_MENU;
 Delay_reversing_SET.Order = 30;
 Delay_reversing_SET.Left = 439;
 Delay_reversing_SET.Top = 100;
 Delay_reversing_SET.Width = 34;
 Delay_reversing_SET.Height = 32;
 Delay_reversing_SET.Picture_Type = 1;
 Delay_reversing_SET.Picture_Ratio = 1;
 Delay_reversing_SET.Picture_Name =  0x0016E4AA ;
 Delay_reversing_SET.Visible = 1;
 Delay_reversing_SET.Active = 1;
 Delay_reversing_SET.OnUpPtr = Delay_reversing_SETOnUp;
 Delay_reversing_SET.OnDownPtr = Delay_reversing_SETOnDown;
 Delay_reversing_SET.OnClickPtr = 0;
 Delay_reversing_SET.OnPressPtr = 0;

 Delay_EEV_SET.OwnerScreen = &DELAY_MENU;
 Delay_EEV_SET.Order = 31;
 Delay_EEV_SET.Left = 439;
 Delay_EEV_SET.Top = 133;
 Delay_EEV_SET.Width = 34;
 Delay_EEV_SET.Height = 32;
 Delay_EEV_SET.Picture_Type = 1;
 Delay_EEV_SET.Picture_Ratio = 1;
 Delay_EEV_SET.Picture_Name =  0x0016E4AA ;
 Delay_EEV_SET.Visible = 1;
 Delay_EEV_SET.Active = 1;
 Delay_EEV_SET.OnUpPtr = Delay_EEV_SETOnUp;
 Delay_EEV_SET.OnDownPtr = Delay_EEV_SETOnDown;
 Delay_EEV_SET.OnClickPtr = 0;
 Delay_EEV_SET.OnPressPtr = 0;

 Delay_DHW_valve_SET.OwnerScreen = &DELAY_MENU;
 Delay_DHW_valve_SET.Order = 32;
 Delay_DHW_valve_SET.Left = 439;
 Delay_DHW_valve_SET.Top = 166;
 Delay_DHW_valve_SET.Width = 34;
 Delay_DHW_valve_SET.Height = 32;
 Delay_DHW_valve_SET.Picture_Type = 1;
 Delay_DHW_valve_SET.Picture_Ratio = 1;
 Delay_DHW_valve_SET.Picture_Name =  0x0016E4AA ;
 Delay_DHW_valve_SET.Visible = 1;
 Delay_DHW_valve_SET.Active = 1;
 Delay_DHW_valve_SET.OnUpPtr = Delay_DHW_valve_SETOnUp;
 Delay_DHW_valve_SET.OnDownPtr = Delay_DHW_valve_SETOnDown;
 Delay_DHW_valve_SET.OnClickPtr = 0;
 Delay_DHW_valve_SET.OnPressPtr = 0;

 Delay_compressor_SET.OwnerScreen = &DELAY_MENU;
 Delay_compressor_SET.Order = 33;
 Delay_compressor_SET.Left = 439;
 Delay_compressor_SET.Top = 199;
 Delay_compressor_SET.Width = 34;
 Delay_compressor_SET.Height = 32;
 Delay_compressor_SET.Picture_Type = 1;
 Delay_compressor_SET.Picture_Ratio = 1;
 Delay_compressor_SET.Picture_Name =  0x0016E4AA ;
 Delay_compressor_SET.Visible = 1;
 Delay_compressor_SET.Active = 1;
 Delay_compressor_SET.OnUpPtr = Delay_compressor_SETOnUp;
 Delay_compressor_SET.OnDownPtr = Delay_compressor_SETOnDown;
 Delay_compressor_SET.OnClickPtr = 0;
 Delay_compressor_SET.OnPressPtr = 0;

 Delay_setting_label.OwnerScreen = &DELAY_MENU;
 Delay_setting_label.Order = 34;
 Delay_setting_label.Left = 176;
 Delay_setting_label.Top = 5;
 Delay_setting_label.Width = 134;
 Delay_setting_label.Height = 20;
 Delay_setting_label.Visible = 1;
 Delay_setting_label.Active = 0;
 Delay_setting_label.Caption = Delay_setting_label_Caption;
 Delay_setting_label.FontName =  0x00005242 ;
 Delay_setting_label.Font_Color = 0xE7FC;
 Delay_setting_label.VerticalText = 0;
 Delay_setting_label.OnUpPtr = 0;
 Delay_setting_label.OnDownPtr = 0;
 Delay_setting_label.OnClickPtr = 0;
 Delay_setting_label.OnPressPtr = 0;

 Home_b9.OwnerScreen = &DELAY_MENU;
 Home_b9.Order = 35;
 Home_b9.Left = 244;
 Home_b9.Top = 232;
 Home_b9.Width = 78;
 Home_b9.Height = 35;
 Home_b9.Pen_Width = 1;
 Home_b9.Pen_Color = 0xC618;
 Home_b9.Visible = 1;
 Home_b9.Active = 1;
 Home_b9.Transparent = 1;
 Home_b9.Caption = Home_b9_Caption;
 Home_b9.TextAlign = _taCenter;
 Home_b9.TextAlignVertical= _tavMiddle;
 Home_b9.FontName =  0x00005242 ;
 Home_b9.PressColEnabled = 1;
 Home_b9.Font_Color = 0xD6BA;
 Home_b9.VerticalText = 0;
 Home_b9.Gradient = 1;
 Home_b9.Gradient_Orientation = 0;
 Home_b9.Gradient_Start_Color = 0x0418;
 Home_b9.Gradient_End_Color = 0x00A5;
 Home_b9.Color = 0xC618;
 Home_b9.Press_Color = 0xE71C;
 Home_b9.Corner_Radius = 5;
 Home_b9.OnUpPtr = 0;
 Home_b9.OnDownPtr = 0;
 Home_b9.OnClickPtr = BackToHome;
 Home_b9.OnPressPtr = 0;

 Back_b6.OwnerScreen = &DELAY_MENU;
 Back_b6.Order = 36;
 Back_b6.Left = 160;
 Back_b6.Top = 232;
 Back_b6.Width = 78;
 Back_b6.Height = 35;
 Back_b6.Pen_Width = 1;
 Back_b6.Pen_Color = 0xC618;
 Back_b6.Visible = 1;
 Back_b6.Active = 1;
 Back_b6.Transparent = 1;
 Back_b6.Caption = Back_b6_Caption;
 Back_b6.TextAlign = _taCenter;
 Back_b6.TextAlignVertical= _tavMiddle;
 Back_b6.FontName =  0x00005242 ;
 Back_b6.PressColEnabled = 1;
 Back_b6.Font_Color = 0xD6BA;
 Back_b6.VerticalText = 0;
 Back_b6.Gradient = 1;
 Back_b6.Gradient_Orientation = 0;
 Back_b6.Gradient_Start_Color = 0x0418;
 Back_b6.Gradient_End_Color = 0x00A5;
 Back_b6.Color = 0xC618;
 Back_b6.Press_Color = 0xE71C;
 Back_b6.Corner_Radius = 5;
 Back_b6.OnUpPtr = 0;
 Back_b6.OnDownPtr = 0;
 Back_b6.OnClickPtr = goToBack;
 Back_b6.OnPressPtr = 0;

 Delay_Source_DOWN.OwnerScreen = &DELAY_MENU;
 Delay_Source_DOWN.Order = 37;
 Delay_Source_DOWN.Left = 376;
 Delay_Source_DOWN.Top = 34;
 Delay_Source_DOWN.Width = 28;
 Delay_Source_DOWN.Height = 32;
 Delay_Source_DOWN.Picture_Type = 1;
 Delay_Source_DOWN.Picture_Ratio = 1;
 Delay_Source_DOWN.Picture_Name =  0x0016ED30 ;
 Delay_Source_DOWN.Visible = 1;
 Delay_Source_DOWN.Active = 1;
 Delay_Source_DOWN.OnUpPtr = Delay_Source_DOWNOnUp;
 Delay_Source_DOWN.OnDownPtr = 0;
 Delay_Source_DOWN.OnClickPtr = 0;
 Delay_Source_DOWN.OnPressPtr = Delay_Source_DOWNOnPress;

 Delay_heat_pump_DOWN.OwnerScreen = &DELAY_MENU;
 Delay_heat_pump_DOWN.Order = 38;
 Delay_heat_pump_DOWN.Left = 376;
 Delay_heat_pump_DOWN.Top = 67;
 Delay_heat_pump_DOWN.Width = 28;
 Delay_heat_pump_DOWN.Height = 32;
 Delay_heat_pump_DOWN.Picture_Type = 1;
 Delay_heat_pump_DOWN.Picture_Ratio = 1;
 Delay_heat_pump_DOWN.Picture_Name =  0x0016ED30 ;
 Delay_heat_pump_DOWN.Visible = 1;
 Delay_heat_pump_DOWN.Active = 1;
 Delay_heat_pump_DOWN.OnUpPtr = Delay_heat_pump_DOWNOnUp;
 Delay_heat_pump_DOWN.OnDownPtr = 0;
 Delay_heat_pump_DOWN.OnClickPtr = 0;
 Delay_heat_pump_DOWN.OnPressPtr = Delay_heat_pump_DOWNOnPress;

 Delay_reversing_DOWN.OwnerScreen = &DELAY_MENU;
 Delay_reversing_DOWN.Order = 39;
 Delay_reversing_DOWN.Left = 376;
 Delay_reversing_DOWN.Top = 100;
 Delay_reversing_DOWN.Width = 28;
 Delay_reversing_DOWN.Height = 32;
 Delay_reversing_DOWN.Picture_Type = 1;
 Delay_reversing_DOWN.Picture_Ratio = 1;
 Delay_reversing_DOWN.Picture_Name =  0x0016ED30 ;
 Delay_reversing_DOWN.Visible = 1;
 Delay_reversing_DOWN.Active = 1;
 Delay_reversing_DOWN.OnUpPtr = Delay_reversing_DOWNOnUp;
 Delay_reversing_DOWN.OnDownPtr = 0;
 Delay_reversing_DOWN.OnClickPtr = 0;
 Delay_reversing_DOWN.OnPressPtr = Delay_reversing_DOWNOnPress;

 Delay_trv_DOWN.OwnerScreen = &DELAY_MENU;
 Delay_trv_DOWN.Order = 40;
 Delay_trv_DOWN.Left = 376;
 Delay_trv_DOWN.Top = 133;
 Delay_trv_DOWN.Width = 28;
 Delay_trv_DOWN.Height = 32;
 Delay_trv_DOWN.Picture_Type = 1;
 Delay_trv_DOWN.Picture_Ratio = 1;
 Delay_trv_DOWN.Picture_Name =  0x0016ED30 ;
 Delay_trv_DOWN.Visible = 1;
 Delay_trv_DOWN.Active = 1;
 Delay_trv_DOWN.OnUpPtr = Delay_trv_DOWNOnUp;
 Delay_trv_DOWN.OnDownPtr = 0;
 Delay_trv_DOWN.OnClickPtr = 0;
 Delay_trv_DOWN.OnPressPtr = Delay_trv_DOWNOnPress;

 Delay_DHW_valve_DOWN.OwnerScreen = &DELAY_MENU;
 Delay_DHW_valve_DOWN.Order = 41;
 Delay_DHW_valve_DOWN.Left = 376;
 Delay_DHW_valve_DOWN.Top = 166;
 Delay_DHW_valve_DOWN.Width = 28;
 Delay_DHW_valve_DOWN.Height = 32;
 Delay_DHW_valve_DOWN.Picture_Type = 1;
 Delay_DHW_valve_DOWN.Picture_Ratio = 1;
 Delay_DHW_valve_DOWN.Picture_Name =  0x0016ED30 ;
 Delay_DHW_valve_DOWN.Visible = 1;
 Delay_DHW_valve_DOWN.Active = 1;
 Delay_DHW_valve_DOWN.OnUpPtr = Delay_DHW_valve_DOWNOnUp;
 Delay_DHW_valve_DOWN.OnDownPtr = 0;
 Delay_DHW_valve_DOWN.OnClickPtr = 0;
 Delay_DHW_valve_DOWN.OnPressPtr = Delay_DHW_valve_DOWNOnPress;

 Delay_compressor_DOWN.OwnerScreen = &DELAY_MENU;
 Delay_compressor_DOWN.Order = 42;
 Delay_compressor_DOWN.Left = 376;
 Delay_compressor_DOWN.Top = 199;
 Delay_compressor_DOWN.Width = 28;
 Delay_compressor_DOWN.Height = 32;
 Delay_compressor_DOWN.Picture_Type = 1;
 Delay_compressor_DOWN.Picture_Ratio = 1;
 Delay_compressor_DOWN.Picture_Name =  0x0016ED30 ;
 Delay_compressor_DOWN.Visible = 1;
 Delay_compressor_DOWN.Active = 1;
 Delay_compressor_DOWN.OnUpPtr = Delay_compressor_DOWNOnUp;
 Delay_compressor_DOWN.OnDownPtr = 0;
 Delay_compressor_DOWN.OnClickPtr = 0;
 Delay_compressor_DOWN.OnPressPtr = Delay_compressor_DOWNOnPress;

 Delay_Source.OwnerScreen = &DELAY_MENU;
 Delay_Source.Order = 43;
 Delay_Source.Left = 300;
 Delay_Source.Top = 38;
 Delay_Source.Width = 40;
 Delay_Source.Height = 23;
 Delay_Source.Pen_Width = 1;
 Delay_Source.Pen_Color = 0x0000;
 Delay_Source.Visible = 1;
 Delay_Source.Active = 1;
 Delay_Source.Transparent = 1;
 Delay_Source.Caption = Delay_Source_Caption;
 Delay_Source.TextAlign = _taCenter;
 Delay_Source.TextAlignVertical= _tavMiddle;
 Delay_Source.FontName =  0x00005242 ;
 Delay_Source.PressColEnabled = 1;
 Delay_Source.Font_Color = 0x0000;
 Delay_Source.VerticalText = 0;
 Delay_Source.Gradient = 0;
 Delay_Source.Gradient_Orientation = 0;
 Delay_Source.Gradient_Start_Color = 0xFFFF;
 Delay_Source.Gradient_End_Color = 0xC618;
 Delay_Source.Color = 0xFFFF;
 Delay_Source.Press_Color = 0xE71C;
 Delay_Source.Corner_Radius = 3;
 Delay_Source.OnUpPtr = 0;
 Delay_Source.OnDownPtr = 0;
 Delay_Source.OnClickPtr = 0;
 Delay_Source.OnPressPtr = 0;

 Delay_heat_pump.OwnerScreen = &DELAY_MENU;
 Delay_heat_pump.Order = 44;
 Delay_heat_pump.Left = 299;
 Delay_heat_pump.Top = 71;
 Delay_heat_pump.Width = 40;
 Delay_heat_pump.Height = 23;
 Delay_heat_pump.Pen_Width = 1;
 Delay_heat_pump.Pen_Color = 0x0000;
 Delay_heat_pump.Visible = 1;
 Delay_heat_pump.Active = 1;
 Delay_heat_pump.Transparent = 1;
 Delay_heat_pump.Caption = Delay_heat_pump_Caption;
 Delay_heat_pump.TextAlign = _taCenter;
 Delay_heat_pump.TextAlignVertical= _tavMiddle;
 Delay_heat_pump.FontName =  0x00005242 ;
 Delay_heat_pump.PressColEnabled = 1;
 Delay_heat_pump.Font_Color = 0x0000;
 Delay_heat_pump.VerticalText = 0;
 Delay_heat_pump.Gradient = 0;
 Delay_heat_pump.Gradient_Orientation = 0;
 Delay_heat_pump.Gradient_Start_Color = 0xFFFF;
 Delay_heat_pump.Gradient_End_Color = 0xC618;
 Delay_heat_pump.Color = 0xFFFF;
 Delay_heat_pump.Press_Color = 0xE71C;
 Delay_heat_pump.Corner_Radius = 3;
 Delay_heat_pump.OnUpPtr = 0;
 Delay_heat_pump.OnDownPtr = 0;
 Delay_heat_pump.OnClickPtr = 0;
 Delay_heat_pump.OnPressPtr = 0;

 Delay_reversing.OwnerScreen = &DELAY_MENU;
 Delay_reversing.Order = 45;
 Delay_reversing.Left = 299;
 Delay_reversing.Top = 104;
 Delay_reversing.Width = 40;
 Delay_reversing.Height = 23;
 Delay_reversing.Pen_Width = 1;
 Delay_reversing.Pen_Color = 0x0000;
 Delay_reversing.Visible = 1;
 Delay_reversing.Active = 1;
 Delay_reversing.Transparent = 1;
 Delay_reversing.Caption = Delay_reversing_Caption;
 Delay_reversing.TextAlign = _taCenter;
 Delay_reversing.TextAlignVertical= _tavMiddle;
 Delay_reversing.FontName =  0x00005242 ;
 Delay_reversing.PressColEnabled = 1;
 Delay_reversing.Font_Color = 0x0000;
 Delay_reversing.VerticalText = 0;
 Delay_reversing.Gradient = 0;
 Delay_reversing.Gradient_Orientation = 0;
 Delay_reversing.Gradient_Start_Color = 0xFFFF;
 Delay_reversing.Gradient_End_Color = 0xC618;
 Delay_reversing.Color = 0xFFFF;
 Delay_reversing.Press_Color = 0xE71C;
 Delay_reversing.Corner_Radius = 3;
 Delay_reversing.OnUpPtr = 0;
 Delay_reversing.OnDownPtr = 0;
 Delay_reversing.OnClickPtr = 0;
 Delay_reversing.OnPressPtr = 0;

 Delay_EEV.OwnerScreen = &DELAY_MENU;
 Delay_EEV.Order = 46;
 Delay_EEV.Left = 299;
 Delay_EEV.Top = 137;
 Delay_EEV.Width = 40;
 Delay_EEV.Height = 23;
 Delay_EEV.Pen_Width = 1;
 Delay_EEV.Pen_Color = 0x0000;
 Delay_EEV.Visible = 1;
 Delay_EEV.Active = 1;
 Delay_EEV.Transparent = 1;
 Delay_EEV.Caption = Delay_EEV_Caption;
 Delay_EEV.TextAlign = _taCenter;
 Delay_EEV.TextAlignVertical= _tavMiddle;
 Delay_EEV.FontName =  0x00005242 ;
 Delay_EEV.PressColEnabled = 1;
 Delay_EEV.Font_Color = 0x0000;
 Delay_EEV.VerticalText = 0;
 Delay_EEV.Gradient = 0;
 Delay_EEV.Gradient_Orientation = 0;
 Delay_EEV.Gradient_Start_Color = 0xFFFF;
 Delay_EEV.Gradient_End_Color = 0xC618;
 Delay_EEV.Color = 0xFFFF;
 Delay_EEV.Press_Color = 0xE71C;
 Delay_EEV.Corner_Radius = 3;
 Delay_EEV.OnUpPtr = 0;
 Delay_EEV.OnDownPtr = 0;
 Delay_EEV.OnClickPtr = 0;
 Delay_EEV.OnPressPtr = 0;

 Delay_DHW_valve.OwnerScreen = &DELAY_MENU;
 Delay_DHW_valve.Order = 47;
 Delay_DHW_valve.Left = 299;
 Delay_DHW_valve.Top = 170;
 Delay_DHW_valve.Width = 40;
 Delay_DHW_valve.Height = 23;
 Delay_DHW_valve.Pen_Width = 1;
 Delay_DHW_valve.Pen_Color = 0x0000;
 Delay_DHW_valve.Visible = 1;
 Delay_DHW_valve.Active = 1;
 Delay_DHW_valve.Transparent = 1;
 Delay_DHW_valve.Caption = Delay_DHW_valve_Caption;
 Delay_DHW_valve.TextAlign = _taCenter;
 Delay_DHW_valve.TextAlignVertical= _tavMiddle;
 Delay_DHW_valve.FontName =  0x00005242 ;
 Delay_DHW_valve.PressColEnabled = 1;
 Delay_DHW_valve.Font_Color = 0x0000;
 Delay_DHW_valve.VerticalText = 0;
 Delay_DHW_valve.Gradient = 0;
 Delay_DHW_valve.Gradient_Orientation = 0;
 Delay_DHW_valve.Gradient_Start_Color = 0xFFFF;
 Delay_DHW_valve.Gradient_End_Color = 0xC618;
 Delay_DHW_valve.Color = 0xFFFF;
 Delay_DHW_valve.Press_Color = 0xE71C;
 Delay_DHW_valve.Corner_Radius = 3;
 Delay_DHW_valve.OnUpPtr = 0;
 Delay_DHW_valve.OnDownPtr = 0;
 Delay_DHW_valve.OnClickPtr = 0;
 Delay_DHW_valve.OnPressPtr = 0;

 Delay_compressor.OwnerScreen = &DELAY_MENU;
 Delay_compressor.Order = 48;
 Delay_compressor.Left = 299;
 Delay_compressor.Top = 203;
 Delay_compressor.Width = 40;
 Delay_compressor.Height = 23;
 Delay_compressor.Pen_Width = 1;
 Delay_compressor.Pen_Color = 0x0000;
 Delay_compressor.Visible = 1;
 Delay_compressor.Active = 1;
 Delay_compressor.Transparent = 1;
 Delay_compressor.Caption = Delay_compressor_Caption;
 Delay_compressor.TextAlign = _taCenter;
 Delay_compressor.TextAlignVertical= _tavMiddle;
 Delay_compressor.FontName =  0x00005242 ;
 Delay_compressor.PressColEnabled = 1;
 Delay_compressor.Font_Color = 0x0000;
 Delay_compressor.VerticalText = 0;
 Delay_compressor.Gradient = 0;
 Delay_compressor.Gradient_Orientation = 0;
 Delay_compressor.Gradient_Start_Color = 0xFFFF;
 Delay_compressor.Gradient_End_Color = 0xC618;
 Delay_compressor.Color = 0xFFFF;
 Delay_compressor.Press_Color = 0xE71C;
 Delay_compressor.Corner_Radius = 3;
 Delay_compressor.OnUpPtr = 0;
 Delay_compressor.OnDownPtr = 0;
 Delay_compressor.OnClickPtr = 0;
 Delay_compressor.OnPressPtr = 0;

 Image171.OwnerScreen = &SYSTEM_EVENTS;
 Image171.Order = 0;
 Image171.Left = 0;
 Image171.Top = 1;
 Image171.Width = 480;
 Image171.Height = 272;
 Image171.Picture_Type = 1;
 Image171.Picture_Ratio = 1;
 Image171.Picture_Name =  0x0016F436 ;
 Image171.Visible = 1;
 Image171.Active = 1;
 Image171.OnUpPtr = 0;
 Image171.OnDownPtr = 0;
 Image171.OnClickPtr = 0;
 Image171.OnPressPtr = 0;

 Home_b10.OwnerScreen = &SYSTEM_EVENTS;
 Home_b10.Order = 1;
 Home_b10.Left = 201;
 Home_b10.Top = 232;
 Home_b10.Width = 78;
 Home_b10.Height = 35;
 Home_b10.Pen_Width = 1;
 Home_b10.Pen_Color = 0xC618;
 Home_b10.Visible = 1;
 Home_b10.Active = 1;
 Home_b10.Transparent = 1;
 Home_b10.Caption = Home_b10_Caption;
 Home_b10.TextAlign = _taCenter;
 Home_b10.TextAlignVertical= _tavMiddle;
 Home_b10.FontName =  0x00005242 ;
 Home_b10.PressColEnabled = 1;
 Home_b10.Font_Color = 0xD6BA;
 Home_b10.VerticalText = 0;
 Home_b10.Gradient = 1;
 Home_b10.Gradient_Orientation = 0;
 Home_b10.Gradient_Start_Color = 0x0418;
 Home_b10.Gradient_End_Color = 0x00A5;
 Home_b10.Color = 0xC618;
 Home_b10.Press_Color = 0xE71C;
 Home_b10.Corner_Radius = 5;
 Home_b10.OnUpPtr = 0;
 Home_b10.OnDownPtr = 0;
 Home_b10.OnClickPtr = BackToHome;
 Home_b10.OnPressPtr = 0;

 Back_b7.OwnerScreen = &SYSTEM_EVENTS;
 Back_b7.Order = 2;
 Back_b7.Left = 113;
 Back_b7.Top = 232;
 Back_b7.Width = 78;
 Back_b7.Height = 35;
 Back_b7.Pen_Width = 1;
 Back_b7.Pen_Color = 0xC618;
 Back_b7.Visible = 1;
 Back_b7.Active = 1;
 Back_b7.Transparent = 1;
 Back_b7.Caption = Back_b7_Caption;
 Back_b7.TextAlign = _taCenter;
 Back_b7.TextAlignVertical= _tavMiddle;
 Back_b7.FontName =  0x00005242 ;
 Back_b7.PressColEnabled = 1;
 Back_b7.Font_Color = 0xD6BA;
 Back_b7.VerticalText = 0;
 Back_b7.Gradient = 1;
 Back_b7.Gradient_Orientation = 0;
 Back_b7.Gradient_Start_Color = 0x0418;
 Back_b7.Gradient_End_Color = 0x00A5;
 Back_b7.Color = 0xC618;
 Back_b7.Press_Color = 0xE71C;
 Back_b7.Corner_Radius = 5;
 Back_b7.OnUpPtr = 0;
 Back_b7.OnDownPtr = 0;
 Back_b7.OnClickPtr = goToBack;
 Back_b7.OnPressPtr = 0;

 Next_b3.OwnerScreen = &SYSTEM_EVENTS;
 Next_b3.Order = 3;
 Next_b3.Left = 289;
 Next_b3.Top = 232;
 Next_b3.Width = 78;
 Next_b3.Height = 35;
 Next_b3.Pen_Width = 1;
 Next_b3.Pen_Color = 0xC618;
 Next_b3.Visible = 1;
 Next_b3.Active = 1;
 Next_b3.Transparent = 1;
 Next_b3.Caption = Next_b3_Caption;
 Next_b3.TextAlign = _taCenter;
 Next_b3.TextAlignVertical= _tavMiddle;
 Next_b3.FontName =  0x00005242 ;
 Next_b3.PressColEnabled = 1;
 Next_b3.Font_Color = 0xD6BA;
 Next_b3.VerticalText = 0;
 Next_b3.Gradient = 1;
 Next_b3.Gradient_Orientation = 0;
 Next_b3.Gradient_Start_Color = 0x0418;
 Next_b3.Gradient_End_Color = 0x00A5;
 Next_b3.Color = 0xC618;
 Next_b3.Press_Color = 0xE71C;
 Next_b3.Corner_Radius = 5;
 Next_b3.OnUpPtr = 0;
 Next_b3.OnDownPtr = 0;
 Next_b3.OnClickPtr = nextPage;
 Next_b3.OnPressPtr = 0;

 Time_source1.OwnerScreen = &SYSTEM_EVENTS;
 Time_source1.Order = 4;
 Time_source1.Left = 393;
 Time_source1.Top = 100;
 Time_source1.Width = 73;
 Time_source1.Height = 23;
 Time_source1.Pen_Width = 0;
 Time_source1.Pen_Color = 0x0000;
 Time_source1.Visible = 1;
 Time_source1.Active = 0;
 Time_source1.Transparent = 1;
 Time_source1.Caption = Time_source1_Caption;
 Time_source1.TextAlign = _taCenter;
 Time_source1.TextAlignVertical= _tavMiddle;
 Time_source1.FontName =  0x00005242 ;
 Time_source1.PressColEnabled = 1;
 Time_source1.Font_Color = 0x0585;
 Time_source1.VerticalText = 0;
 Time_source1.Gradient = 1;
 Time_source1.Gradient_Orientation = 0;
 Time_source1.Gradient_Start_Color = 0xFFFF;
 Time_source1.Gradient_End_Color = 0xFFFF;
 Time_source1.Color = 0xC618;
 Time_source1.Press_Color = 0xE71C;
 Time_source1.Corner_Radius = 5;
 Time_source1.OnUpPtr = 0;
 Time_source1.OnDownPtr = 0;
 Time_source1.OnClickPtr = 0;
 Time_source1.OnPressPtr = 0;

 Time_heat1.OwnerScreen = &SYSTEM_EVENTS;
 Time_heat1.Order = 5;
 Time_heat1.Left = 393;
 Time_heat1.Top = 132;
 Time_heat1.Width = 73;
 Time_heat1.Height = 23;
 Time_heat1.Pen_Width = 0;
 Time_heat1.Pen_Color = 0x0000;
 Time_heat1.Visible = 1;
 Time_heat1.Active = 0;
 Time_heat1.Transparent = 1;
 Time_heat1.Caption = Time_heat1_Caption;
 Time_heat1.TextAlign = _taCenter;
 Time_heat1.TextAlignVertical= _tavMiddle;
 Time_heat1.FontName =  0x00005242 ;
 Time_heat1.PressColEnabled = 1;
 Time_heat1.Font_Color = 0x0585;
 Time_heat1.VerticalText = 0;
 Time_heat1.Gradient = 1;
 Time_heat1.Gradient_Orientation = 0;
 Time_heat1.Gradient_Start_Color = 0xFFFF;
 Time_heat1.Gradient_End_Color = 0xFFFF;
 Time_heat1.Color = 0xC618;
 Time_heat1.Press_Color = 0xE71C;
 Time_heat1.Corner_Radius = 5;
 Time_heat1.OnUpPtr = 0;
 Time_heat1.OnDownPtr = 0;
 Time_heat1.OnClickPtr = 0;
 Time_heat1.OnPressPtr = 0;

 Time_Electric.OwnerScreen = &SYSTEM_EVENTS;
 Time_Electric.Order = 6;
 Time_Electric.Left = 393;
 Time_Electric.Top = 163;
 Time_Electric.Width = 73;
 Time_Electric.Height = 23;
 Time_Electric.Pen_Width = 0;
 Time_Electric.Pen_Color = 0x0000;
 Time_Electric.Visible = 1;
 Time_Electric.Active = 0;
 Time_Electric.Transparent = 1;
 Time_Electric.Caption = Time_Electric_Caption;
 Time_Electric.TextAlign = _taCenter;
 Time_Electric.TextAlignVertical= _tavMiddle;
 Time_Electric.FontName =  0x00005242 ;
 Time_Electric.PressColEnabled = 1;
 Time_Electric.Font_Color = 0x0585;
 Time_Electric.VerticalText = 0;
 Time_Electric.Gradient = 1;
 Time_Electric.Gradient_Orientation = 0;
 Time_Electric.Gradient_Start_Color = 0xFFFF;
 Time_Electric.Gradient_End_Color = 0xFFFF;
 Time_Electric.Color = 0xC618;
 Time_Electric.Press_Color = 0xE71C;
 Time_Electric.Corner_Radius = 5;
 Time_Electric.OnUpPtr = 0;
 Time_Electric.OnDownPtr = 0;
 Time_Electric.OnClickPtr = 0;
 Time_Electric.OnPressPtr = 0;

 Time_reversing1.OwnerScreen = &SYSTEM_EVENTS;
 Time_reversing1.Order = 7;
 Time_reversing1.Left = 393;
 Time_reversing1.Top = 67;
 Time_reversing1.Width = 73;
 Time_reversing1.Height = 23;
 Time_reversing1.Pen_Width = 0;
 Time_reversing1.Pen_Color = 0x0000;
 Time_reversing1.Visible = 1;
 Time_reversing1.Active = 0;
 Time_reversing1.Transparent = 1;
 Time_reversing1.Caption = Time_reversing1_Caption;
 Time_reversing1.TextAlign = _taCenter;
 Time_reversing1.TextAlignVertical= _tavMiddle;
 Time_reversing1.FontName =  0x00005242 ;
 Time_reversing1.PressColEnabled = 1;
 Time_reversing1.Font_Color = 0x0585;
 Time_reversing1.VerticalText = 0;
 Time_reversing1.Gradient = 1;
 Time_reversing1.Gradient_Orientation = 0;
 Time_reversing1.Gradient_Start_Color = 0xFFFF;
 Time_reversing1.Gradient_End_Color = 0xFFFF;
 Time_reversing1.Color = 0xC618;
 Time_reversing1.Press_Color = 0xE71C;
 Time_reversing1.Corner_Radius = 5;
 Time_reversing1.OnUpPtr = 0;
 Time_reversing1.OnDownPtr = 0;
 Time_reversing1.OnClickPtr = 0;
 Time_reversing1.OnPressPtr = 0;

 Time_compressor1.OwnerScreen = &SYSTEM_EVENTS;
 Time_compressor1.Order = 8;
 Time_compressor1.Left = 394;
 Time_compressor1.Top = 34;
 Time_compressor1.Width = 73;
 Time_compressor1.Height = 23;
 Time_compressor1.Pen_Width = 0;
 Time_compressor1.Pen_Color = 0x0000;
 Time_compressor1.Visible = 1;
 Time_compressor1.Active = 0;
 Time_compressor1.Transparent = 1;
 Time_compressor1.Caption = Time_compressor1_Caption;
 Time_compressor1.TextAlign = _taCenter;
 Time_compressor1.TextAlignVertical= _tavMiddle;
 Time_compressor1.FontName =  0x00005242 ;
 Time_compressor1.PressColEnabled = 1;
 Time_compressor1.Font_Color = 0x0585;
 Time_compressor1.VerticalText = 0;
 Time_compressor1.Gradient = 1;
 Time_compressor1.Gradient_Orientation = 0;
 Time_compressor1.Gradient_Start_Color = 0xFFFF;
 Time_compressor1.Gradient_End_Color = 0xFFFF;
 Time_compressor1.Color = 0xC618;
 Time_compressor1.Press_Color = 0xE71C;
 Time_compressor1.Corner_Radius = 5;
 Time_compressor1.OnUpPtr = 0;
 Time_compressor1.OnDownPtr = 0;
 Time_compressor1.OnClickPtr = 0;
 Time_compressor1.OnPressPtr = 0;

 Time_furnance.OwnerScreen = &SYSTEM_EVENTS;
 Time_furnance.Order = 9;
 Time_furnance.Left = 394;
 Time_furnance.Top = 195;
 Time_furnance.Width = 73;
 Time_furnance.Height = 23;
 Time_furnance.Pen_Width = 0;
 Time_furnance.Pen_Color = 0x0000;
 Time_furnance.Visible = 1;
 Time_furnance.Active = 0;
 Time_furnance.Transparent = 1;
 Time_furnance.Caption = Time_furnance_Caption;
 Time_furnance.TextAlign = _taCenter;
 Time_furnance.TextAlignVertical= _tavMiddle;
 Time_furnance.FontName =  0x00005242 ;
 Time_furnance.PressColEnabled = 1;
 Time_furnance.Font_Color = 0x0585;
 Time_furnance.VerticalText = 0;
 Time_furnance.Gradient = 1;
 Time_furnance.Gradient_Orientation = 0;
 Time_furnance.Gradient_Start_Color = 0xFFFF;
 Time_furnance.Gradient_End_Color = 0xFFFF;
 Time_furnance.Color = 0xC618;
 Time_furnance.Press_Color = 0xE71C;
 Time_furnance.Corner_Radius = 5;
 Time_furnance.OnUpPtr = 0;
 Time_furnance.OnDownPtr = 0;
 Time_furnance.OnClickPtr = 0;
 Time_furnance.OnPressPtr = 0;

 total_time_label.OwnerScreen = &SYSTEM_EVENTS;
 total_time_label.Order = 10;
 total_time_label.Left = 199;
 total_time_label.Top = 5;
 total_time_label.Width = 100;
 total_time_label.Height = 20;
 total_time_label.Visible = 1;
 total_time_label.Active = 0;
 total_time_label.Caption = total_time_label_Caption;
 total_time_label.FontName =  0x00005242 ;
 total_time_label.Font_Color = 0xE7FC;
 total_time_label.VerticalText = 0;
 total_time_label.OnUpPtr = 0;
 total_time_label.OnDownPtr = 0;
 total_time_label.OnClickPtr = 0;
 total_time_label.OnPressPtr = 0;

 CircleButton6.OwnerScreen = &SYSTEM_EVENTS;
 CircleButton6.Order = 11;
 CircleButton6.Left = 450;
 CircleButton6.Top = 3;
 CircleButton6.Radius = 12;
 CircleButton6.Pen_Width = 1;
 CircleButton6.Pen_Color = 0x0000;
 CircleButton6.Visible = 0;
 CircleButton6.Active = 0;
 CircleButton6.Transparent = 1;
 CircleButton6.Caption = CircleButton6_Caption;
 CircleButton6.TextAlign = _taCenter;
 CircleButton6.TextAlignVertical= _tavMiddle;
 CircleButton6.FontName =  0x00005242 ;
 CircleButton6.PressColEnabled = 1;
 CircleButton6.Font_Color = 0x0000;
 CircleButton6.VerticalText = 0;
 CircleButton6.Gradient = 1;
 CircleButton6.Gradient_Orientation = 0;
 CircleButton6.Gradient_Start_Color = 0xFFFF;
 CircleButton6.Gradient_End_Color = 0xC618;
 CircleButton6.Color = 0xC618;
 CircleButton6.Press_Color = 0xE71C;
 CircleButton6.OnUpPtr = 0;
 CircleButton6.OnDownPtr = 0;
 CircleButton6.OnClickPtr = 0;
 CircleButton6.OnPressPtr = 0;

 Label6.OwnerScreen = &SYSTEM_EVENTS;
 Label6.Order = 12;
 Label6.Left = 410;
 Label6.Top = 222;
 Label6.Width = 46;
 Label6.Height = 20;
 Label6.Visible = 1;
 Label6.Active = 1;
 Label6.Caption = Label6_Caption;
 Label6.FontName =  0x00005242 ;
 Label6.Font_Color = 0xFFFF;
 Label6.VerticalText = 0;
 Label6.OnUpPtr = 0;
 Label6.OnDownPtr = 0;
 Label6.OnClickPtr = 0;
 Label6.OnPressPtr = 0;

 Image102.OwnerScreen = &LIMITS1;
 Image102.Order = 0;
 Image102.Left = 1;
 Image102.Top = 0;
 Image102.Width = 480;
 Image102.Height = 272;
 Image102.Picture_Type = 1;
 Image102.Picture_Ratio = 1;
 Image102.Picture_Name =  0x001AF03C ;
 Image102.Visible = 1;
 Image102.Active = 0;
 Image102.OnUpPtr = 0;
 Image102.OnDownPtr = 0;
 Image102.OnClickPtr = 0;
 Image102.OnPressPtr = 0;

 Image200.OwnerScreen = &LIMITS1;
 Image200.Order = 1;
 Image200.Left = 376;
 Image200.Top = 32;
 Image200.Width = 28;
 Image200.Height = 32;
 Image200.Picture_Type = 1;
 Image200.Picture_Ratio = 1;
 Image200.Picture_Name =  0x0016C712 ;
 Image200.Visible = 1;
 Image200.Active = 0;
 Image200.OnUpPtr = 0;
 Image200.OnDownPtr = 0;
 Image200.OnClickPtr = 0;
 Image200.OnPressPtr = 0;

 Image205.OwnerScreen = &LIMITS1;
 Image205.Order = 2;
 Image205.Left = 376;
 Image205.Top = 64;
 Image205.Width = 28;
 Image205.Height = 32;
 Image205.Picture_Type = 1;
 Image205.Picture_Ratio = 1;
 Image205.Picture_Name =  0x0016C712 ;
 Image205.Visible = 1;
 Image205.Active = 0;
 Image205.OnUpPtr = 0;
 Image205.OnDownPtr = 0;
 Image205.OnClickPtr = 0;
 Image205.OnPressPtr = 0;

 Image206.OwnerScreen = &LIMITS1;
 Image206.Order = 3;
 Image206.Left = 376;
 Image206.Top = 96;
 Image206.Width = 28;
 Image206.Height = 32;
 Image206.Picture_Type = 1;
 Image206.Picture_Ratio = 1;
 Image206.Picture_Name =  0x0016C712 ;
 Image206.Visible = 1;
 Image206.Active = 0;
 Image206.OnUpPtr = 0;
 Image206.OnDownPtr = 0;
 Image206.OnClickPtr = 0;
 Image206.OnPressPtr = 0;

 Image207.OwnerScreen = &LIMITS1;
 Image207.Order = 4;
 Image207.Left = 376;
 Image207.Top = 128;
 Image207.Width = 28;
 Image207.Height = 32;
 Image207.Picture_Type = 1;
 Image207.Picture_Ratio = 1;
 Image207.Picture_Name =  0x0016C712 ;
 Image207.Visible = 1;
 Image207.Active = 0;
 Image207.OnUpPtr = 0;
 Image207.OnDownPtr = 0;
 Image207.OnClickPtr = 0;
 Image207.OnPressPtr = 0;

 Image208.OwnerScreen = &LIMITS1;
 Image208.Order = 5;
 Image208.Left = 376;
 Image208.Top = 160;
 Image208.Width = 28;
 Image208.Height = 32;
 Image208.Picture_Type = 1;
 Image208.Picture_Ratio = 1;
 Image208.Picture_Name =  0x0016C712 ;
 Image208.Visible = 1;
 Image208.Active = 0;
 Image208.OnUpPtr = 0;
 Image208.OnDownPtr = 0;
 Image208.OnClickPtr = 0;
 Image208.OnPressPtr = 0;

 Image209.OwnerScreen = &LIMITS1;
 Image209.Order = 6;
 Image209.Left = 376;
 Image209.Top = 192;
 Image209.Width = 28;
 Image209.Height = 32;
 Image209.Picture_Type = 1;
 Image209.Picture_Ratio = 1;
 Image209.Picture_Name =  0x0016C712 ;
 Image209.Visible = 1;
 Image209.Active = 0;
 Image209.OnUpPtr = 0;
 Image209.OnDownPtr = 0;
 Image209.OnClickPtr = 0;
 Image209.OnPressPtr = 0;

 Image218.OwnerScreen = &LIMITS1;
 Image218.Order = 7;
 Image218.Left = 406;
 Image218.Top = 32;
 Image218.Width = 28;
 Image218.Height = 32;
 Image218.Picture_Type = 1;
 Image218.Picture_Ratio = 1;
 Image218.Picture_Name =  0x0016CE18 ;
 Image218.Visible = 1;
 Image218.Active = 0;
 Image218.OnUpPtr = 0;
 Image218.OnDownPtr = 0;
 Image218.OnClickPtr = 0;
 Image218.OnPressPtr = 0;

 Image219.OwnerScreen = &LIMITS1;
 Image219.Order = 8;
 Image219.Left = 406;
 Image219.Top = 64;
 Image219.Width = 28;
 Image219.Height = 32;
 Image219.Picture_Type = 1;
 Image219.Picture_Ratio = 1;
 Image219.Picture_Name =  0x0016CE18 ;
 Image219.Visible = 1;
 Image219.Active = 0;
 Image219.OnUpPtr = 0;
 Image219.OnDownPtr = 0;
 Image219.OnClickPtr = 0;
 Image219.OnPressPtr = 0;

 Image220.OwnerScreen = &LIMITS1;
 Image220.Order = 9;
 Image220.Left = 406;
 Image220.Top = 96;
 Image220.Width = 28;
 Image220.Height = 32;
 Image220.Picture_Type = 1;
 Image220.Picture_Ratio = 1;
 Image220.Picture_Name =  0x0016CE18 ;
 Image220.Visible = 1;
 Image220.Active = 0;
 Image220.OnUpPtr = 0;
 Image220.OnDownPtr = 0;
 Image220.OnClickPtr = 0;
 Image220.OnPressPtr = 0;

 Image221.OwnerScreen = &LIMITS1;
 Image221.Order = 10;
 Image221.Left = 406;
 Image221.Top = 129;
 Image221.Width = 28;
 Image221.Height = 32;
 Image221.Picture_Type = 1;
 Image221.Picture_Ratio = 1;
 Image221.Picture_Name =  0x0016CE18 ;
 Image221.Visible = 1;
 Image221.Active = 0;
 Image221.OnUpPtr = 0;
 Image221.OnDownPtr = 0;
 Image221.OnClickPtr = 0;
 Image221.OnPressPtr = 0;

 Image222.OwnerScreen = &LIMITS1;
 Image222.Order = 11;
 Image222.Left = 406;
 Image222.Top = 160;
 Image222.Width = 28;
 Image222.Height = 32;
 Image222.Picture_Type = 1;
 Image222.Picture_Ratio = 1;
 Image222.Picture_Name =  0x0016CE18 ;
 Image222.Visible = 1;
 Image222.Active = 0;
 Image222.OnUpPtr = 0;
 Image222.OnDownPtr = 0;
 Image222.OnClickPtr = 0;
 Image222.OnPressPtr = 0;

 Image223.OwnerScreen = &LIMITS1;
 Image223.Order = 12;
 Image223.Left = 406;
 Image223.Top = 192;
 Image223.Width = 28;
 Image223.Height = 32;
 Image223.Picture_Type = 1;
 Image223.Picture_Ratio = 1;
 Image223.Picture_Name =  0x0016CE18 ;
 Image223.Visible = 1;
 Image223.Active = 0;
 Image223.OnUpPtr = 0;
 Image223.OnDownPtr = 0;
 Image223.OnClickPtr = 0;
 Image223.OnPressPtr = 0;

 Image246.OwnerScreen = &LIMITS1;
 Image246.Order = 13;
 Image246.Left = 439;
 Image246.Top = 33;
 Image246.Width = 34;
 Image246.Height = 32;
 Image246.Picture_Type = 1;
 Image246.Picture_Ratio = 1;
 Image246.Picture_Name =  0x0016D51E ;
 Image246.Visible = 1;
 Image246.Active = 0;
 Image246.OnUpPtr = 0;
 Image246.OnDownPtr = 0;
 Image246.OnClickPtr = 0;
 Image246.OnPressPtr = 0;

 Image247.OwnerScreen = &LIMITS1;
 Image247.Order = 14;
 Image247.Left = 439;
 Image247.Top = 65;
 Image247.Width = 34;
 Image247.Height = 32;
 Image247.Picture_Type = 1;
 Image247.Picture_Ratio = 1;
 Image247.Picture_Name =  0x0016D51E ;
 Image247.Visible = 1;
 Image247.Active = 0;
 Image247.OnUpPtr = 0;
 Image247.OnDownPtr = 0;
 Image247.OnClickPtr = 0;
 Image247.OnPressPtr = 0;

 Image248.OwnerScreen = &LIMITS1;
 Image248.Order = 15;
 Image248.Left = 439;
 Image248.Top = 97;
 Image248.Width = 34;
 Image248.Height = 32;
 Image248.Picture_Type = 1;
 Image248.Picture_Ratio = 1;
 Image248.Picture_Name =  0x0016D51E ;
 Image248.Visible = 1;
 Image248.Active = 0;
 Image248.OnUpPtr = 0;
 Image248.OnDownPtr = 0;
 Image248.OnClickPtr = 0;
 Image248.OnPressPtr = 0;

 Image249.OwnerScreen = &LIMITS1;
 Image249.Order = 16;
 Image249.Left = 439;
 Image249.Top = 129;
 Image249.Width = 34;
 Image249.Height = 32;
 Image249.Picture_Type = 1;
 Image249.Picture_Ratio = 1;
 Image249.Picture_Name =  0x0016D51E ;
 Image249.Visible = 1;
 Image249.Active = 0;
 Image249.OnUpPtr = 0;
 Image249.OnDownPtr = 0;
 Image249.OnClickPtr = 0;
 Image249.OnPressPtr = 0;

 Image250.OwnerScreen = &LIMITS1;
 Image250.Order = 17;
 Image250.Left = 439;
 Image250.Top = 161;
 Image250.Width = 34;
 Image250.Height = 32;
 Image250.Picture_Type = 1;
 Image250.Picture_Ratio = 1;
 Image250.Picture_Name =  0x0016D51E ;
 Image250.Visible = 1;
 Image250.Active = 0;
 Image250.OnUpPtr = 0;
 Image250.OnDownPtr = 0;
 Image250.OnClickPtr = 0;
 Image250.OnPressPtr = 0;

 Image251.OwnerScreen = &LIMITS1;
 Image251.Order = 18;
 Image251.Left = 439;
 Image251.Top = 193;
 Image251.Width = 34;
 Image251.Height = 32;
 Image251.Picture_Type = 1;
 Image251.Picture_Ratio = 1;
 Image251.Picture_Name =  0x0016D51E ;
 Image251.Visible = 1;
 Image251.Active = 0;
 Image251.OnUpPtr = 0;
 Image251.OnDownPtr = 0;
 Image251.OnClickPtr = 0;
 Image251.OnPressPtr = 0;

 Down_1_.OwnerScreen = &LIMITS1;
 Down_1_.Order = 19;
 Down_1_.Left = 377;
 Down_1_.Top = 32;
 Down_1_.Width = 28;
 Down_1_.Height = 32;
 Down_1_.Picture_Type = 1;
 Down_1_.Picture_Ratio = 1;
 Down_1_.Picture_Name =  0x0016ED30 ;
 Down_1_.Visible = 1;
 Down_1_.Active = 1;
 Down_1_.OnUpPtr = Down_1_OnUp;
 Down_1_.OnDownPtr = 0;
 Down_1_.OnClickPtr = 0;
 Down_1_.OnPressPtr = Down_1_OnPress;

 Down_2_.OwnerScreen = &LIMITS1;
 Down_2_.Order = 20;
 Down_2_.Left = 376;
 Down_2_.Top = 64;
 Down_2_.Width = 28;
 Down_2_.Height = 32;
 Down_2_.Picture_Type = 1;
 Down_2_.Picture_Ratio = 1;
 Down_2_.Picture_Name =  0x0016ED30 ;
 Down_2_.Visible = 1;
 Down_2_.Active = 1;
 Down_2_.OnUpPtr = Down_2_OnUp;
 Down_2_.OnDownPtr = 0;
 Down_2_.OnClickPtr = 0;
 Down_2_.OnPressPtr = Down_2_OnPress;

 Down_3_.OwnerScreen = &LIMITS1;
 Down_3_.Order = 21;
 Down_3_.Left = 376;
 Down_3_.Top = 96;
 Down_3_.Width = 28;
 Down_3_.Height = 32;
 Down_3_.Picture_Type = 1;
 Down_3_.Picture_Ratio = 1;
 Down_3_.Picture_Name =  0x0016ED30 ;
 Down_3_.Visible = 1;
 Down_3_.Active = 1;
 Down_3_.OnUpPtr = Down_3_OnUp;
 Down_3_.OnDownPtr = 0;
 Down_3_.OnClickPtr = 0;
 Down_3_.OnPressPtr = Down_3_OnPress;

 Down_4_.OwnerScreen = &LIMITS1;
 Down_4_.Order = 22;
 Down_4_.Left = 376;
 Down_4_.Top = 128;
 Down_4_.Width = 28;
 Down_4_.Height = 32;
 Down_4_.Picture_Type = 1;
 Down_4_.Picture_Ratio = 1;
 Down_4_.Picture_Name =  0x0016ED30 ;
 Down_4_.Visible = 1;
 Down_4_.Active = 1;
 Down_4_.OnUpPtr = Down_4_OnUp;
 Down_4_.OnDownPtr = 0;
 Down_4_.OnClickPtr = 0;
 Down_4_.OnPressPtr = Down_4_OnPress;

 Down_5_.OwnerScreen = &LIMITS1;
 Down_5_.Order = 23;
 Down_5_.Left = 376;
 Down_5_.Top = 160;
 Down_5_.Width = 28;
 Down_5_.Height = 32;
 Down_5_.Picture_Type = 1;
 Down_5_.Picture_Ratio = 1;
 Down_5_.Picture_Name =  0x0016ED30 ;
 Down_5_.Visible = 1;
 Down_5_.Active = 1;
 Down_5_.OnUpPtr = Down_5_OnUp;
 Down_5_.OnDownPtr = 0;
 Down_5_.OnClickPtr = 0;
 Down_5_.OnPressPtr = Down_5_OnPress;

 Down_6_.OwnerScreen = &LIMITS1;
 Down_6_.Order = 24;
 Down_6_.Left = 376;
 Down_6_.Top = 192;
 Down_6_.Width = 28;
 Down_6_.Height = 32;
 Down_6_.Picture_Type = 1;
 Down_6_.Picture_Ratio = 1;
 Down_6_.Picture_Name =  0x0016ED30 ;
 Down_6_.Visible = 1;
 Down_6_.Active = 1;
 Down_6_.OnUpPtr = Down_6_OnUp;
 Down_6_.OnDownPtr = 0;
 Down_6_.OnClickPtr = 0;
 Down_6_.OnPressPtr = Down_6_OnPress;

 Up_1_.OwnerScreen = &LIMITS1;
 Up_1_.Order = 25;
 Up_1_.Left = 406;
 Up_1_.Top = 32;
 Up_1_.Width = 28;
 Up_1_.Height = 32;
 Up_1_.Picture_Type = 1;
 Up_1_.Picture_Ratio = 1;
 Up_1_.Picture_Name =  0x0016DDA4 ;
 Up_1_.Visible = 1;
 Up_1_.Active = 1;
 Up_1_.OnUpPtr = Up_1_OnUp;
 Up_1_.OnDownPtr = 0;
 Up_1_.OnClickPtr = 0;
 Up_1_.OnPressPtr = Up_1_OnPress;

 Up_2_.OwnerScreen = &LIMITS1;
 Up_2_.Order = 26;
 Up_2_.Left = 406;
 Up_2_.Top = 64;
 Up_2_.Width = 28;
 Up_2_.Height = 32;
 Up_2_.Picture_Type = 1;
 Up_2_.Picture_Ratio = 1;
 Up_2_.Picture_Name =  0x0016DDA4 ;
 Up_2_.Visible = 1;
 Up_2_.Active = 1;
 Up_2_.OnUpPtr = Up_2_OnUp;
 Up_2_.OnDownPtr = 0;
 Up_2_.OnClickPtr = 0;
 Up_2_.OnPressPtr = Up_2_OnPress;

 Up_3_.OwnerScreen = &LIMITS1;
 Up_3_.Order = 27;
 Up_3_.Left = 406;
 Up_3_.Top = 96;
 Up_3_.Width = 28;
 Up_3_.Height = 32;
 Up_3_.Picture_Type = 1;
 Up_3_.Picture_Ratio = 1;
 Up_3_.Picture_Name =  0x0016DDA4 ;
 Up_3_.Visible = 1;
 Up_3_.Active = 1;
 Up_3_.OnUpPtr = Up_3_OnUp;
 Up_3_.OnDownPtr = 0;
 Up_3_.OnClickPtr = 0;
 Up_3_.OnPressPtr = Up_3_OnPress;

 Up_4_.OwnerScreen = &LIMITS1;
 Up_4_.Order = 28;
 Up_4_.Left = 406;
 Up_4_.Top = 128;
 Up_4_.Width = 28;
 Up_4_.Height = 32;
 Up_4_.Picture_Type = 1;
 Up_4_.Picture_Ratio = 1;
 Up_4_.Picture_Name =  0x0016DDA4 ;
 Up_4_.Visible = 1;
 Up_4_.Active = 1;
 Up_4_.OnUpPtr = Up_4_OnUp;
 Up_4_.OnDownPtr = 0;
 Up_4_.OnClickPtr = 0;
 Up_4_.OnPressPtr = Up_4_OnPress;

 Up_5_.OwnerScreen = &LIMITS1;
 Up_5_.Order = 29;
 Up_5_.Left = 406;
 Up_5_.Top = 160;
 Up_5_.Width = 28;
 Up_5_.Height = 32;
 Up_5_.Picture_Type = 1;
 Up_5_.Picture_Ratio = 1;
 Up_5_.Picture_Name =  0x0016DDA4 ;
 Up_5_.Visible = 1;
 Up_5_.Active = 1;
 Up_5_.OnUpPtr = Up_5_OnUp;
 Up_5_.OnDownPtr = 0;
 Up_5_.OnClickPtr = 0;
 Up_5_.OnPressPtr = Up_5_OnPress;

 Up_6_.OwnerScreen = &LIMITS1;
 Up_6_.Order = 30;
 Up_6_.Left = 406;
 Up_6_.Top = 192;
 Up_6_.Width = 28;
 Up_6_.Height = 32;
 Up_6_.Picture_Type = 1;
 Up_6_.Picture_Ratio = 1;
 Up_6_.Picture_Name =  0x0016DDA4 ;
 Up_6_.Visible = 1;
 Up_6_.Active = 1;
 Up_6_.OnUpPtr = Up_6_OnUp;
 Up_6_.OnDownPtr = 0;
 Up_6_.OnClickPtr = 0;
 Up_6_.OnPressPtr = Up_6_OnPress;

 Set_1_.OwnerScreen = &LIMITS1;
 Set_1_.Order = 31;
 Set_1_.Left = 439;
 Set_1_.Top = 32;
 Set_1_.Width = 34;
 Set_1_.Height = 32;
 Set_1_.Picture_Type = 1;
 Set_1_.Picture_Ratio = 1;
 Set_1_.Picture_Name =  0x0016E4AA ;
 Set_1_.Visible = 1;
 Set_1_.Active = 1;
 Set_1_.OnUpPtr = Set_1_OnUp;
 Set_1_.OnDownPtr = Set_1_OnDown;
 Set_1_.OnClickPtr = 0;
 Set_1_.OnPressPtr = 0;

 Set_2_.OwnerScreen = &LIMITS1;
 Set_2_.Order = 32;
 Set_2_.Left = 439;
 Set_2_.Top = 64;
 Set_2_.Width = 34;
 Set_2_.Height = 32;
 Set_2_.Picture_Type = 1;
 Set_2_.Picture_Ratio = 1;
 Set_2_.Picture_Name =  0x0016E4AA ;
 Set_2_.Visible = 1;
 Set_2_.Active = 1;
 Set_2_.OnUpPtr = Set_2_OnUp;
 Set_2_.OnDownPtr = Set_2_OnDown;
 Set_2_.OnClickPtr = 0;
 Set_2_.OnPressPtr = 0;

 Set_3_.OwnerScreen = &LIMITS1;
 Set_3_.Order = 33;
 Set_3_.Left = 439;
 Set_3_.Top = 96;
 Set_3_.Width = 34;
 Set_3_.Height = 32;
 Set_3_.Picture_Type = 1;
 Set_3_.Picture_Ratio = 1;
 Set_3_.Picture_Name =  0x0016E4AA ;
 Set_3_.Visible = 1;
 Set_3_.Active = 1;
 Set_3_.OnUpPtr = Set_3_OnUp;
 Set_3_.OnDownPtr = Set_3_OnDown;
 Set_3_.OnClickPtr = 0;
 Set_3_.OnPressPtr = 0;

 Set_4_.OwnerScreen = &LIMITS1;
 Set_4_.Order = 34;
 Set_4_.Left = 439;
 Set_4_.Top = 128;
 Set_4_.Width = 34;
 Set_4_.Height = 32;
 Set_4_.Picture_Type = 1;
 Set_4_.Picture_Ratio = 1;
 Set_4_.Picture_Name =  0x0016E4AA ;
 Set_4_.Visible = 1;
 Set_4_.Active = 1;
 Set_4_.OnUpPtr = Set_4_OnUp;
 Set_4_.OnDownPtr = Set_4_OnDown;
 Set_4_.OnClickPtr = 0;
 Set_4_.OnPressPtr = 0;

 Set_5_.OwnerScreen = &LIMITS1;
 Set_5_.Order = 35;
 Set_5_.Left = 439;
 Set_5_.Top = 160;
 Set_5_.Width = 34;
 Set_5_.Height = 32;
 Set_5_.Picture_Type = 1;
 Set_5_.Picture_Ratio = 1;
 Set_5_.Picture_Name =  0x0016E4AA ;
 Set_5_.Visible = 1;
 Set_5_.Active = 1;
 Set_5_.OnUpPtr = Set_5_OnUp;
 Set_5_.OnDownPtr = Set_5_OnDown;
 Set_5_.OnClickPtr = 0;
 Set_5_.OnPressPtr = 0;

 Set_6_.OwnerScreen = &LIMITS1;
 Set_6_.Order = 36;
 Set_6_.Left = 439;
 Set_6_.Top = 192;
 Set_6_.Width = 34;
 Set_6_.Height = 32;
 Set_6_.Picture_Type = 1;
 Set_6_.Picture_Ratio = 1;
 Set_6_.Picture_Name =  0x0016E4AA ;
 Set_6_.Visible = 1;
 Set_6_.Active = 1;
 Set_6_.OnUpPtr = Set_6_OnUp;
 Set_6_.OnDownPtr = Set_6_OnDown;
 Set_6_.OnClickPtr = 0;
 Set_6_.OnPressPtr = 0;

 Set_min_heating_HP.OwnerScreen = &LIMITS1;
 Set_min_heating_HP.Order = 37;
 Set_min_heating_HP.Left = 305;
 Set_min_heating_HP.Top = 36;
 Set_min_heating_HP.Width = 40;
 Set_min_heating_HP.Height = 23;
 Set_min_heating_HP.Pen_Width = 1;
 Set_min_heating_HP.Pen_Color = 0x0000;
 Set_min_heating_HP.Visible = 1;
 Set_min_heating_HP.Active = 0;
 Set_min_heating_HP.Transparent = 1;
 Set_min_heating_HP.Caption = Set_min_heating_HP_Caption;
 Set_min_heating_HP.TextAlign = _taCenter;
 Set_min_heating_HP.TextAlignVertical= _tavMiddle;
 Set_min_heating_HP.FontName =  0x00005242 ;
 Set_min_heating_HP.PressColEnabled = 1;
 Set_min_heating_HP.Font_Color = 0x0408;
 Set_min_heating_HP.VerticalText = 0;
 Set_min_heating_HP.Gradient = 0;
 Set_min_heating_HP.Gradient_Orientation = 0;
 Set_min_heating_HP.Gradient_Start_Color = 0xFFFF;
 Set_min_heating_HP.Gradient_End_Color = 0xC618;
 Set_min_heating_HP.Color = 0xFFFF;
 Set_min_heating_HP.Press_Color = 0xE71C;
 Set_min_heating_HP.Corner_Radius = 2;
 Set_min_heating_HP.OnUpPtr = 0;
 Set_min_heating_HP.OnDownPtr = 0;
 Set_min_heating_HP.OnClickPtr = 0;
 Set_min_heating_HP.OnPressPtr = 0;

 Set_max_heating_HP.OwnerScreen = &LIMITS1;
 Set_max_heating_HP.Order = 38;
 Set_max_heating_HP.Left = 305;
 Set_max_heating_HP.Top = 68;
 Set_max_heating_HP.Width = 40;
 Set_max_heating_HP.Height = 23;
 Set_max_heating_HP.Pen_Width = 1;
 Set_max_heating_HP.Pen_Color = 0x0000;
 Set_max_heating_HP.Visible = 1;
 Set_max_heating_HP.Active = 0;
 Set_max_heating_HP.Transparent = 1;
 Set_max_heating_HP.Caption = Set_max_heating_HP_Caption;
 Set_max_heating_HP.TextAlign = _taCenter;
 Set_max_heating_HP.TextAlignVertical= _tavMiddle;
 Set_max_heating_HP.FontName =  0x00005242 ;
 Set_max_heating_HP.PressColEnabled = 1;
 Set_max_heating_HP.Font_Color = 0x0408;
 Set_max_heating_HP.VerticalText = 0;
 Set_max_heating_HP.Gradient = 0;
 Set_max_heating_HP.Gradient_Orientation = 0;
 Set_max_heating_HP.Gradient_Start_Color = 0xFFFF;
 Set_max_heating_HP.Gradient_End_Color = 0xC618;
 Set_max_heating_HP.Color = 0xFFFF;
 Set_max_heating_HP.Press_Color = 0xE71C;
 Set_max_heating_HP.Corner_Radius = 2;
 Set_max_heating_HP.OnUpPtr = 0;
 Set_max_heating_HP.OnDownPtr = 0;
 Set_max_heating_HP.OnClickPtr = 0;
 Set_max_heating_HP.OnPressPtr = 0;

 Set_max_exhaust.OwnerScreen = &LIMITS1;
 Set_max_exhaust.Order = 39;
 Set_max_exhaust.Left = 305;
 Set_max_exhaust.Top = 100;
 Set_max_exhaust.Width = 40;
 Set_max_exhaust.Height = 23;
 Set_max_exhaust.Pen_Width = 1;
 Set_max_exhaust.Pen_Color = 0x0000;
 Set_max_exhaust.Visible = 1;
 Set_max_exhaust.Active = 0;
 Set_max_exhaust.Transparent = 1;
 Set_max_exhaust.Caption = Set_max_exhaust_Caption;
 Set_max_exhaust.TextAlign = _taCenter;
 Set_max_exhaust.TextAlignVertical= _tavMiddle;
 Set_max_exhaust.FontName =  0x00005242 ;
 Set_max_exhaust.PressColEnabled = 1;
 Set_max_exhaust.Font_Color = 0x0408;
 Set_max_exhaust.VerticalText = 0;
 Set_max_exhaust.Gradient = 0;
 Set_max_exhaust.Gradient_Orientation = 0;
 Set_max_exhaust.Gradient_Start_Color = 0xFFFF;
 Set_max_exhaust.Gradient_End_Color = 0xC618;
 Set_max_exhaust.Color = 0xFFFF;
 Set_max_exhaust.Press_Color = 0xE71C;
 Set_max_exhaust.Corner_Radius = 2;
 Set_max_exhaust.OnUpPtr = 0;
 Set_max_exhaust.OnDownPtr = 0;
 Set_max_exhaust.OnClickPtr = 0;
 Set_max_exhaust.OnPressPtr = 0;

 Set_min_source_temp.OwnerScreen = &LIMITS1;
 Set_min_source_temp.Order = 40;
 Set_min_source_temp.Left = 305;
 Set_min_source_temp.Top = 132;
 Set_min_source_temp.Width = 40;
 Set_min_source_temp.Height = 23;
 Set_min_source_temp.Pen_Width = 1;
 Set_min_source_temp.Pen_Color = 0x0000;
 Set_min_source_temp.Visible = 1;
 Set_min_source_temp.Active = 0;
 Set_min_source_temp.Transparent = 1;
 Set_min_source_temp.Caption = Set_min_source_temp_Caption;
 Set_min_source_temp.TextAlign = _taCenter;
 Set_min_source_temp.TextAlignVertical= _tavMiddle;
 Set_min_source_temp.FontName =  0x00005242 ;
 Set_min_source_temp.PressColEnabled = 1;
 Set_min_source_temp.Font_Color = 0x0408;
 Set_min_source_temp.VerticalText = 0;
 Set_min_source_temp.Gradient = 0;
 Set_min_source_temp.Gradient_Orientation = 0;
 Set_min_source_temp.Gradient_Start_Color = 0xFFFF;
 Set_min_source_temp.Gradient_End_Color = 0xC618;
 Set_min_source_temp.Color = 0xFFFF;
 Set_min_source_temp.Press_Color = 0xE71C;
 Set_min_source_temp.Corner_Radius = 2;
 Set_min_source_temp.OnUpPtr = 0;
 Set_min_source_temp.OnDownPtr = 0;
 Set_min_source_temp.OnClickPtr = 0;
 Set_min_source_temp.OnPressPtr = 0;

 Set_max_source_temp.OwnerScreen = &LIMITS1;
 Set_max_source_temp.Order = 41;
 Set_max_source_temp.Left = 305;
 Set_max_source_temp.Top = 164;
 Set_max_source_temp.Width = 40;
 Set_max_source_temp.Height = 23;
 Set_max_source_temp.Pen_Width = 1;
 Set_max_source_temp.Pen_Color = 0x0000;
 Set_max_source_temp.Visible = 1;
 Set_max_source_temp.Active = 0;
 Set_max_source_temp.Transparent = 1;
 Set_max_source_temp.Caption = Set_max_source_temp_Caption;
 Set_max_source_temp.TextAlign = _taCenter;
 Set_max_source_temp.TextAlignVertical= _tavMiddle;
 Set_max_source_temp.FontName =  0x00005242 ;
 Set_max_source_temp.PressColEnabled = 1;
 Set_max_source_temp.Font_Color = 0x0408;
 Set_max_source_temp.VerticalText = 0;
 Set_max_source_temp.Gradient = 0;
 Set_max_source_temp.Gradient_Orientation = 0;
 Set_max_source_temp.Gradient_Start_Color = 0xFFFF;
 Set_max_source_temp.Gradient_End_Color = 0xC618;
 Set_max_source_temp.Color = 0xFFFF;
 Set_max_source_temp.Press_Color = 0xE71C;
 Set_max_source_temp.Corner_Radius = 2;
 Set_max_source_temp.OnUpPtr = 0;
 Set_max_source_temp.OnDownPtr = 0;
 Set_max_source_temp.OnClickPtr = 0;
 Set_max_source_temp.OnPressPtr = 0;

 Set_min_delta_heat.OwnerScreen = &LIMITS1;
 Set_min_delta_heat.Order = 42;
 Set_min_delta_heat.Left = 305;
 Set_min_delta_heat.Top = 195;
 Set_min_delta_heat.Width = 40;
 Set_min_delta_heat.Height = 23;
 Set_min_delta_heat.Pen_Width = 1;
 Set_min_delta_heat.Pen_Color = 0x0000;
 Set_min_delta_heat.Visible = 1;
 Set_min_delta_heat.Active = 0;
 Set_min_delta_heat.Transparent = 1;
 Set_min_delta_heat.Caption = Set_min_delta_heat_Caption;
 Set_min_delta_heat.TextAlign = _taCenter;
 Set_min_delta_heat.TextAlignVertical= _tavMiddle;
 Set_min_delta_heat.FontName =  0x00005242 ;
 Set_min_delta_heat.PressColEnabled = 1;
 Set_min_delta_heat.Font_Color = 0x0408;
 Set_min_delta_heat.VerticalText = 0;
 Set_min_delta_heat.Gradient = 0;
 Set_min_delta_heat.Gradient_Orientation = 0;
 Set_min_delta_heat.Gradient_Start_Color = 0xFFFF;
 Set_min_delta_heat.Gradient_End_Color = 0xC618;
 Set_min_delta_heat.Color = 0xFFFF;
 Set_min_delta_heat.Press_Color = 0xE71C;
 Set_min_delta_heat.Corner_Radius = 2;
 Set_min_delta_heat.OnUpPtr = 0;
 Set_min_delta_heat.OnDownPtr = 0;
 Set_min_delta_heat.OnClickPtr = 0;
 Set_min_delta_heat.OnPressPtr = 0;

 Home_b11.OwnerScreen = &LIMITS1;
 Home_b11.Order = 43;
 Home_b11.Left = 201;
 Home_b11.Top = 232;
 Home_b11.Width = 78;
 Home_b11.Height = 35;
 Home_b11.Pen_Width = 1;
 Home_b11.Pen_Color = 0xC618;
 Home_b11.Visible = 1;
 Home_b11.Active = 1;
 Home_b11.Transparent = 1;
 Home_b11.Caption = Home_b11_Caption;
 Home_b11.TextAlign = _taCenter;
 Home_b11.TextAlignVertical= _tavMiddle;
 Home_b11.FontName =  0x00005242 ;
 Home_b11.PressColEnabled = 1;
 Home_b11.Font_Color = 0xD6BA;
 Home_b11.VerticalText = 0;
 Home_b11.Gradient = 1;
 Home_b11.Gradient_Orientation = 0;
 Home_b11.Gradient_Start_Color = 0x0418;
 Home_b11.Gradient_End_Color = 0x00A5;
 Home_b11.Color = 0xC618;
 Home_b11.Press_Color = 0xE71C;
 Home_b11.Corner_Radius = 5;
 Home_b11.OnUpPtr = 0;
 Home_b11.OnDownPtr = 0;
 Home_b11.OnClickPtr = BackToHome;
 Home_b11.OnPressPtr = 0;

 Back_b8.OwnerScreen = &LIMITS1;
 Back_b8.Order = 44;
 Back_b8.Left = 113;
 Back_b8.Top = 231;
 Back_b8.Width = 78;
 Back_b8.Height = 35;
 Back_b8.Pen_Width = 1;
 Back_b8.Pen_Color = 0xC618;
 Back_b8.Visible = 1;
 Back_b8.Active = 1;
 Back_b8.Transparent = 1;
 Back_b8.Caption = Back_b8_Caption;
 Back_b8.TextAlign = _taCenter;
 Back_b8.TextAlignVertical= _tavMiddle;
 Back_b8.FontName =  0x00005242 ;
 Back_b8.PressColEnabled = 1;
 Back_b8.Font_Color = 0xD6BA;
 Back_b8.VerticalText = 0;
 Back_b8.Gradient = 1;
 Back_b8.Gradient_Orientation = 0;
 Back_b8.Gradient_Start_Color = 0x0418;
 Back_b8.Gradient_End_Color = 0x00A5;
 Back_b8.Color = 0xC618;
 Back_b8.Press_Color = 0xE71C;
 Back_b8.Corner_Radius = 5;
 Back_b8.OnUpPtr = 0;
 Back_b8.OnDownPtr = 0;
 Back_b8.OnClickPtr = goToBack;
 Back_b8.OnPressPtr = 0;

 Next_b4.OwnerScreen = &LIMITS1;
 Next_b4.Order = 45;
 Next_b4.Left = 288;
 Next_b4.Top = 232;
 Next_b4.Width = 78;
 Next_b4.Height = 35;
 Next_b4.Pen_Width = 1;
 Next_b4.Pen_Color = 0xC618;
 Next_b4.Visible = 1;
 Next_b4.Active = 1;
 Next_b4.Transparent = 1;
 Next_b4.Caption = Next_b4_Caption;
 Next_b4.TextAlign = _taCenter;
 Next_b4.TextAlignVertical= _tavMiddle;
 Next_b4.FontName =  0x00005242 ;
 Next_b4.PressColEnabled = 1;
 Next_b4.Font_Color = 0xD6BA;
 Next_b4.VerticalText = 0;
 Next_b4.Gradient = 1;
 Next_b4.Gradient_Orientation = 0;
 Next_b4.Gradient_Start_Color = 0x0418;
 Next_b4.Gradient_End_Color = 0x00A5;
 Next_b4.Color = 0xC618;
 Next_b4.Press_Color = 0xE71C;
 Next_b4.Corner_Radius = 5;
 Next_b4.OnUpPtr = 0;
 Next_b4.OnDownPtr = 0;
 Next_b4.OnClickPtr = nextPage;
 Next_b4.OnPressPtr = 0;

 Settings1_label.OwnerScreen = &LIMITS1;
 Settings1_label.Order = 46;
 Settings1_label.Left = 206;
 Settings1_label.Top = 4;
 Settings1_label.Width = 85;
 Settings1_label.Height = 20;
 Settings1_label.Visible = 1;
 Settings1_label.Active = 0;
 Settings1_label.Caption = Settings1_label_Caption;
 Settings1_label.FontName =  0x00005242 ;
 Settings1_label.Font_Color = 0xE7FC;
 Settings1_label.VerticalText = 0;
 Settings1_label.OnUpPtr = 0;
 Settings1_label.OnDownPtr = 0;
 Settings1_label.OnClickPtr = 0;
 Settings1_label.OnPressPtr = 0;

 CircleButton1.OwnerScreen = &LIMITS1;
 CircleButton1.Order = 47;
 CircleButton1.Left = 450;
 CircleButton1.Top = 3;
 CircleButton1.Radius = 12;
 CircleButton1.Pen_Width = 1;
 CircleButton1.Pen_Color = 0x0000;
 CircleButton1.Visible = 1;
 CircleButton1.Active = 0;
 CircleButton1.Transparent = 1;
 CircleButton1.Caption = CircleButton1_Caption;
 CircleButton1.TextAlign = _taCenter;
 CircleButton1.TextAlignVertical= _tavMiddle;
 CircleButton1.FontName =  0x00005242 ;
 CircleButton1.PressColEnabled = 1;
 CircleButton1.Font_Color = 0x0000;
 CircleButton1.VerticalText = 0;
 CircleButton1.Gradient = 1;
 CircleButton1.Gradient_Orientation = 0;
 CircleButton1.Gradient_Start_Color = 0xFFFF;
 CircleButton1.Gradient_End_Color = 0xC618;
 CircleButton1.Color = 0xC618;
 CircleButton1.Press_Color = 0xE71C;
 CircleButton1.OnUpPtr = 0;
 CircleButton1.OnDownPtr = 0;
 CircleButton1.OnClickPtr = 0;
 CircleButton1.OnPressPtr = 0;

 Image3.OwnerScreen = &LIMITS2;
 Image3.Order = 0;
 Image3.Left = 0;
 Image3.Top = 0;
 Image3.Width = 480;
 Image3.Height = 272;
 Image3.Picture_Type = 1;
 Image3.Picture_Ratio = 1;
 Image3.Picture_Name =  0x0003CAAE ;
 Image3.Visible = 1;
 Image3.Active = 0;
 Image3.OnUpPtr = 0;
 Image3.OnDownPtr = 0;
 Image3.OnClickPtr = 0;
 Image3.OnPressPtr = 0;

 Image186.OwnerScreen = &LIMITS2;
 Image186.Order = 1;
 Image186.Left = 0;
 Image186.Top = 0;
 Image186.Width = 480;
 Image186.Height = 272;
 Image186.Picture_Type = 1;
 Image186.Picture_Ratio = 1;
 Image186.Picture_Name =  0x001EEC42 ;
 Image186.Visible = 1;
 Image186.Active = 0;
 Image186.OnUpPtr = 0;
 Image186.OnDownPtr = 0;
 Image186.OnClickPtr = 0;
 Image186.OnPressPtr = 0;

 Image257.OwnerScreen = &LIMITS2;
 Image257.Order = 2;
 Image257.Left = 439;
 Image257.Top = 192;
 Image257.Width = 34;
 Image257.Height = 32;
 Image257.Picture_Type = 1;
 Image257.Picture_Ratio = 1;
 Image257.Picture_Name =  0x0016D51E ;
 Image257.Visible = 1;
 Image257.Active = 0;
 Image257.OnUpPtr = 0;
 Image257.OnDownPtr = 0;
 Image257.OnClickPtr = 0;
 Image257.OnPressPtr = 0;

 Image256.OwnerScreen = &LIMITS2;
 Image256.Order = 3;
 Image256.Left = 439;
 Image256.Top = 95;
 Image256.Width = 34;
 Image256.Height = 32;
 Image256.Picture_Type = 1;
 Image256.Picture_Ratio = 1;
 Image256.Picture_Name =  0x0016D51E ;
 Image256.Visible = 1;
 Image256.Active = 0;
 Image256.OnUpPtr = 0;
 Image256.OnDownPtr = 0;
 Image256.OnClickPtr = 0;
 Image256.OnPressPtr = 0;

 Image255.OwnerScreen = &LIMITS2;
 Image255.Order = 4;
 Image255.Left = 439;
 Image255.Top = 159;
 Image255.Width = 34;
 Image255.Height = 32;
 Image255.Picture_Type = 1;
 Image255.Picture_Ratio = 1;
 Image255.Picture_Name =  0x0016D51E ;
 Image255.Visible = 1;
 Image255.Active = 0;
 Image255.OnUpPtr = 0;
 Image255.OnDownPtr = 0;
 Image255.OnClickPtr = 0;
 Image255.OnPressPtr = 0;

 Image254.OwnerScreen = &LIMITS2;
 Image254.Order = 5;
 Image254.Left = 439;
 Image254.Top = 127;
 Image254.Width = 34;
 Image254.Height = 32;
 Image254.Picture_Type = 1;
 Image254.Picture_Ratio = 1;
 Image254.Picture_Name =  0x0016D51E ;
 Image254.Visible = 1;
 Image254.Active = 0;
 Image254.OnUpPtr = 0;
 Image254.OnDownPtr = 0;
 Image254.OnClickPtr = 0;
 Image254.OnPressPtr = 0;

 Image253.OwnerScreen = &LIMITS2;
 Image253.Order = 6;
 Image253.Left = 439;
 Image253.Top = 64;
 Image253.Width = 34;
 Image253.Height = 32;
 Image253.Picture_Type = 1;
 Image253.Picture_Ratio = 1;
 Image253.Picture_Name =  0x0016D51E ;
 Image253.Visible = 1;
 Image253.Active = 0;
 Image253.OnUpPtr = 0;
 Image253.OnDownPtr = 0;
 Image253.OnClickPtr = 0;
 Image253.OnPressPtr = 0;

 Image252.OwnerScreen = &LIMITS2;
 Image252.Order = 7;
 Image252.Left = 439;
 Image252.Top = 31;
 Image252.Width = 34;
 Image252.Height = 32;
 Image252.Picture_Type = 1;
 Image252.Picture_Ratio = 1;
 Image252.Picture_Name =  0x0016D51E ;
 Image252.Visible = 1;
 Image252.Active = 0;
 Image252.OnUpPtr = 0;
 Image252.OnDownPtr = 0;
 Image252.OnClickPtr = 0;
 Image252.OnPressPtr = 0;

 Image224.OwnerScreen = &LIMITS2;
 Image224.Order = 8;
 Image224.Left = 406;
 Image224.Top = 32;
 Image224.Width = 28;
 Image224.Height = 32;
 Image224.Picture_Type = 1;
 Image224.Picture_Ratio = 1;
 Image224.Picture_Name =  0x0016CE18 ;
 Image224.Visible = 1;
 Image224.Active = 0;
 Image224.OnUpPtr = 0;
 Image224.OnDownPtr = 0;
 Image224.OnClickPtr = 0;
 Image224.OnPressPtr = 0;

 Image225.OwnerScreen = &LIMITS2;
 Image225.Order = 9;
 Image225.Left = 406;
 Image225.Top = 64;
 Image225.Width = 28;
 Image225.Height = 32;
 Image225.Picture_Type = 1;
 Image225.Picture_Ratio = 1;
 Image225.Picture_Name =  0x0016CE18 ;
 Image225.Visible = 1;
 Image225.Active = 0;
 Image225.OnUpPtr = 0;
 Image225.OnDownPtr = 0;
 Image225.OnClickPtr = 0;
 Image225.OnPressPtr = 0;

 Image226.OwnerScreen = &LIMITS2;
 Image226.Order = 10;
 Image226.Left = 406;
 Image226.Top = 128;
 Image226.Width = 28;
 Image226.Height = 32;
 Image226.Picture_Type = 1;
 Image226.Picture_Ratio = 1;
 Image226.Picture_Name =  0x0016CE18 ;
 Image226.Visible = 1;
 Image226.Active = 0;
 Image226.OnUpPtr = 0;
 Image226.OnDownPtr = 0;
 Image226.OnClickPtr = 0;
 Image226.OnPressPtr = 0;

 Image227.OwnerScreen = &LIMITS2;
 Image227.Order = 11;
 Image227.Left = 406;
 Image227.Top = 160;
 Image227.Width = 28;
 Image227.Height = 32;
 Image227.Picture_Type = 1;
 Image227.Picture_Ratio = 1;
 Image227.Picture_Name =  0x0016CE18 ;
 Image227.Visible = 1;
 Image227.Active = 0;
 Image227.OnUpPtr = 0;
 Image227.OnDownPtr = 0;
 Image227.OnClickPtr = 0;
 Image227.OnPressPtr = 0;

 Image228.OwnerScreen = &LIMITS2;
 Image228.Order = 12;
 Image228.Left = 406;
 Image228.Top = 96;
 Image228.Width = 28;
 Image228.Height = 32;
 Image228.Picture_Type = 1;
 Image228.Picture_Ratio = 1;
 Image228.Picture_Name =  0x0016CE18 ;
 Image228.Visible = 1;
 Image228.Active = 0;
 Image228.OnUpPtr = 0;
 Image228.OnDownPtr = 0;
 Image228.OnClickPtr = 0;
 Image228.OnPressPtr = 0;

 Image229.OwnerScreen = &LIMITS2;
 Image229.Order = 13;
 Image229.Left = 406;
 Image229.Top = 192;
 Image229.Width = 28;
 Image229.Height = 32;
 Image229.Picture_Type = 1;
 Image229.Picture_Ratio = 1;
 Image229.Picture_Name =  0x0016CE18 ;
 Image229.Visible = 1;
 Image229.Active = 0;
 Image229.OnUpPtr = 0;
 Image229.OnDownPtr = 0;
 Image229.OnClickPtr = 0;
 Image229.OnPressPtr = 0;

 Image215.OwnerScreen = &LIMITS2;
 Image215.Order = 14;
 Image215.Left = 376;
 Image215.Top = 192;
 Image215.Width = 28;
 Image215.Height = 32;
 Image215.Picture_Type = 1;
 Image215.Picture_Ratio = 1;
 Image215.Picture_Name =  0x0016C712 ;
 Image215.Visible = 1;
 Image215.Active = 0;
 Image215.OnUpPtr = 0;
 Image215.OnDownPtr = 0;
 Image215.OnClickPtr = 0;
 Image215.OnPressPtr = 0;

 Image214.OwnerScreen = &LIMITS2;
 Image214.Order = 15;
 Image214.Left = 376;
 Image214.Top = 96;
 Image214.Width = 28;
 Image214.Height = 32;
 Image214.Picture_Type = 1;
 Image214.Picture_Ratio = 1;
 Image214.Picture_Name =  0x0016C712 ;
 Image214.Visible = 1;
 Image214.Active = 0;
 Image214.OnUpPtr = 0;
 Image214.OnDownPtr = 0;
 Image214.OnClickPtr = 0;
 Image214.OnPressPtr = 0;

 Image213.OwnerScreen = &LIMITS2;
 Image213.Order = 16;
 Image213.Left = 376;
 Image213.Top = 160;
 Image213.Width = 28;
 Image213.Height = 32;
 Image213.Picture_Type = 1;
 Image213.Picture_Ratio = 1;
 Image213.Picture_Name =  0x0016C712 ;
 Image213.Visible = 1;
 Image213.Active = 0;
 Image213.OnUpPtr = 0;
 Image213.OnDownPtr = 0;
 Image213.OnClickPtr = 0;
 Image213.OnPressPtr = 0;

 Image212.OwnerScreen = &LIMITS2;
 Image212.Order = 17;
 Image212.Left = 376;
 Image212.Top = 128;
 Image212.Width = 28;
 Image212.Height = 32;
 Image212.Picture_Type = 1;
 Image212.Picture_Ratio = 1;
 Image212.Picture_Name =  0x0016C712 ;
 Image212.Visible = 1;
 Image212.Active = 0;
 Image212.OnUpPtr = 0;
 Image212.OnDownPtr = 0;
 Image212.OnClickPtr = 0;
 Image212.OnPressPtr = 0;

 Image211.OwnerScreen = &LIMITS2;
 Image211.Order = 18;
 Image211.Left = 376;
 Image211.Top = 64;
 Image211.Width = 28;
 Image211.Height = 32;
 Image211.Picture_Type = 1;
 Image211.Picture_Ratio = 1;
 Image211.Picture_Name =  0x0016C712 ;
 Image211.Visible = 1;
 Image211.Active = 0;
 Image211.OnUpPtr = 0;
 Image211.OnDownPtr = 0;
 Image211.OnClickPtr = 0;
 Image211.OnPressPtr = 0;

 Image210.OwnerScreen = &LIMITS2;
 Image210.Order = 19;
 Image210.Left = 376;
 Image210.Top = 32;
 Image210.Width = 28;
 Image210.Height = 32;
 Image210.Picture_Type = 1;
 Image210.Picture_Ratio = 1;
 Image210.Picture_Name =  0x0016C712 ;
 Image210.Visible = 1;
 Image210.Active = 0;
 Image210.OnUpPtr = 0;
 Image210.OnDownPtr = 0;
 Image210.OnClickPtr = 0;
 Image210.OnPressPtr = 0;

 Down_8_.OwnerScreen = &LIMITS2;
 Down_8_.Order = 20;
 Down_8_.Left = 375;
 Down_8_.Top = 64;
 Down_8_.Width = 28;
 Down_8_.Height = 32;
 Down_8_.Picture_Type = 1;
 Down_8_.Picture_Ratio = 1;
 Down_8_.Picture_Name =  0x0016ED30 ;
 Down_8_.Visible = 1;
 Down_8_.Active = 1;
 Down_8_.OnUpPtr = Down_8_OnUp;
 Down_8_.OnDownPtr = 0;
 Down_8_.OnClickPtr = 0;
 Down_8_.OnPressPtr = Down_8_OnPress;

 Down_10_.OwnerScreen = &LIMITS2;
 Down_10_.Order = 21;
 Down_10_.Left = 375;
 Down_10_.Top = 128;
 Down_10_.Width = 28;
 Down_10_.Height = 32;
 Down_10_.Picture_Type = 1;
 Down_10_.Picture_Ratio = 1;
 Down_10_.Picture_Name =  0x0016ED30 ;
 Down_10_.Visible = 1;
 Down_10_.Active = 1;
 Down_10_.OnUpPtr = Down_10_OnUp;
 Down_10_.OnDownPtr = 0;
 Down_10_.OnClickPtr = 0;
 Down_10_.OnPressPtr = Down_10_OnPress;

 Down_11_.OwnerScreen = &LIMITS2;
 Down_11_.Order = 22;
 Down_11_.Left = 375;
 Down_11_.Top = 161;
 Down_11_.Width = 28;
 Down_11_.Height = 32;
 Down_11_.Picture_Type = 1;
 Down_11_.Picture_Ratio = 1;
 Down_11_.Picture_Name =  0x0016ED30 ;
 Down_11_.Visible = 1;
 Down_11_.Active = 1;
 Down_11_.OnUpPtr = Down_11_OnUp;
 Down_11_.OnDownPtr = 0;
 Down_11_.OnClickPtr = 0;
 Down_11_.OnPressPtr = Down_11_OnPress;

 Down_9_.OwnerScreen = &LIMITS2;
 Down_9_.Order = 23;
 Down_9_.Left = 375;
 Down_9_.Top = 96;
 Down_9_.Width = 28;
 Down_9_.Height = 32;
 Down_9_.Picture_Type = 1;
 Down_9_.Picture_Ratio = 1;
 Down_9_.Picture_Name =  0x0016ED30 ;
 Down_9_.Visible = 1;
 Down_9_.Active = 1;
 Down_9_.OnUpPtr = Down_9_OnUp;
 Down_9_.OnDownPtr = 0;
 Down_9_.OnClickPtr = 0;
 Down_9_.OnPressPtr = Down_9_OnPress;

 Down_12_.OwnerScreen = &LIMITS2;
 Down_12_.Order = 24;
 Down_12_.Left = 375;
 Down_12_.Top = 192;
 Down_12_.Width = 28;
 Down_12_.Height = 32;
 Down_12_.Picture_Type = 1;
 Down_12_.Picture_Ratio = 1;
 Down_12_.Picture_Name =  0x0016ED30 ;
 Down_12_.Visible = 1;
 Down_12_.Active = 1;
 Down_12_.OnUpPtr = Down_12_OnUp;
 Down_12_.OnDownPtr = 0;
 Down_12_.OnClickPtr = 0;
 Down_12_.OnPressPtr = Down_12_OnPress;

 Up_8_.OwnerScreen = &LIMITS2;
 Up_8_.Order = 25;
 Up_8_.Left = 405;
 Up_8_.Top = 64;
 Up_8_.Width = 28;
 Up_8_.Height = 32;
 Up_8_.Picture_Type = 1;
 Up_8_.Picture_Ratio = 1;
 Up_8_.Picture_Name =  0x0016DDA4 ;
 Up_8_.Visible = 1;
 Up_8_.Active = 1;
 Up_8_.OnUpPtr = Up_8_OnUp;
 Up_8_.OnDownPtr = 0;
 Up_8_.OnClickPtr = 0;
 Up_8_.OnPressPtr = Up_8_OnPress;

 Up_10_.OwnerScreen = &LIMITS2;
 Up_10_.Order = 26;
 Up_10_.Left = 405;
 Up_10_.Top = 128;
 Up_10_.Width = 28;
 Up_10_.Height = 32;
 Up_10_.Picture_Type = 1;
 Up_10_.Picture_Ratio = 1;
 Up_10_.Picture_Name =  0x0016DDA4 ;
 Up_10_.Visible = 1;
 Up_10_.Active = 1;
 Up_10_.OnUpPtr = Up_10_OnUp;
 Up_10_.OnDownPtr = 0;
 Up_10_.OnClickPtr = 0;
 Up_10_.OnPressPtr = Up_10_OnPress;

 Up_11_.OwnerScreen = &LIMITS2;
 Up_11_.Order = 27;
 Up_11_.Left = 405;
 Up_11_.Top = 160;
 Up_11_.Width = 28;
 Up_11_.Height = 32;
 Up_11_.Picture_Type = 1;
 Up_11_.Picture_Ratio = 1;
 Up_11_.Picture_Name =  0x0016DDA4 ;
 Up_11_.Visible = 1;
 Up_11_.Active = 1;
 Up_11_.OnUpPtr = Up_11_OnUp;
 Up_11_.OnDownPtr = 0;
 Up_11_.OnClickPtr = 0;
 Up_11_.OnPressPtr = Up_11_OnPress;

 Up_9_.OwnerScreen = &LIMITS2;
 Up_9_.Order = 28;
 Up_9_.Left = 405;
 Up_9_.Top = 96;
 Up_9_.Width = 28;
 Up_9_.Height = 32;
 Up_9_.Picture_Type = 1;
 Up_9_.Picture_Ratio = 1;
 Up_9_.Picture_Name =  0x0016DDA4 ;
 Up_9_.Visible = 1;
 Up_9_.Active = 1;
 Up_9_.OnUpPtr = Up_9_OnUp;
 Up_9_.OnDownPtr = 0;
 Up_9_.OnClickPtr = 0;
 Up_9_.OnPressPtr = Up_9_OnPress;

 Up_12_.OwnerScreen = &LIMITS2;
 Up_12_.Order = 29;
 Up_12_.Left = 405;
 Up_12_.Top = 192;
 Up_12_.Width = 28;
 Up_12_.Height = 32;
 Up_12_.Picture_Type = 1;
 Up_12_.Picture_Ratio = 1;
 Up_12_.Picture_Name =  0x0016DDA4 ;
 Up_12_.Visible = 1;
 Up_12_.Active = 1;
 Up_12_.OnUpPtr = Up_12_OnUp;
 Up_12_.OnDownPtr = 0;
 Up_12_.OnClickPtr = 0;
 Up_12_.OnPressPtr = Up_12_OnPress;

 Set_8_.OwnerScreen = &LIMITS2;
 Set_8_.Order = 30;
 Set_8_.Left = 440;
 Set_8_.Top = 64;
 Set_8_.Width = 34;
 Set_8_.Height = 32;
 Set_8_.Picture_Type = 1;
 Set_8_.Picture_Ratio = 1;
 Set_8_.Picture_Name =  0x0016E4AA ;
 Set_8_.Visible = 1;
 Set_8_.Active = 1;
 Set_8_.OnUpPtr = Set_8_OnUp;
 Set_8_.OnDownPtr = Set_8_OnDown;
 Set_8_.OnClickPtr = 0;
 Set_8_.OnPressPtr = 0;

 Set_10_.OwnerScreen = &LIMITS2;
 Set_10_.Order = 31;
 Set_10_.Left = 439;
 Set_10_.Top = 128;
 Set_10_.Width = 34;
 Set_10_.Height = 32;
 Set_10_.Picture_Type = 1;
 Set_10_.Picture_Ratio = 1;
 Set_10_.Picture_Name =  0x0016E4AA ;
 Set_10_.Visible = 1;
 Set_10_.Active = 1;
 Set_10_.OnUpPtr = Set_10_OnUp;
 Set_10_.OnDownPtr = Set_10_OnDown;
 Set_10_.OnClickPtr = 0;
 Set_10_.OnPressPtr = 0;

 Set_11_.OwnerScreen = &LIMITS2;
 Set_11_.Order = 32;
 Set_11_.Left = 439;
 Set_11_.Top = 160;
 Set_11_.Width = 34;
 Set_11_.Height = 32;
 Set_11_.Picture_Type = 1;
 Set_11_.Picture_Ratio = 1;
 Set_11_.Picture_Name =  0x0016E4AA ;
 Set_11_.Visible = 1;
 Set_11_.Active = 1;
 Set_11_.OnUpPtr = Set_11_OnUp;
 Set_11_.OnDownPtr = Set_11_OnDown;
 Set_11_.OnClickPtr = 0;
 Set_11_.OnPressPtr = 0;

 Set_9_.OwnerScreen = &LIMITS2;
 Set_9_.Order = 33;
 Set_9_.Left = 439;
 Set_9_.Top = 94;
 Set_9_.Width = 34;
 Set_9_.Height = 32;
 Set_9_.Picture_Type = 1;
 Set_9_.Picture_Ratio = 1;
 Set_9_.Picture_Name =  0x0016E4AA ;
 Set_9_.Visible = 1;
 Set_9_.Active = 1;
 Set_9_.OnUpPtr = Set_9_OnUp;
 Set_9_.OnDownPtr = Set_9_OnDown;
 Set_9_.OnClickPtr = 0;
 Set_9_.OnPressPtr = 0;

 Set_12_.OwnerScreen = &LIMITS2;
 Set_12_.Order = 34;
 Set_12_.Left = 439;
 Set_12_.Top = 192;
 Set_12_.Width = 34;
 Set_12_.Height = 32;
 Set_12_.Picture_Type = 1;
 Set_12_.Picture_Ratio = 1;
 Set_12_.Picture_Name =  0x0016E4AA ;
 Set_12_.Visible = 1;
 Set_12_.Active = 1;
 Set_12_.OnUpPtr = Set_12_OnUp;
 Set_12_.OnDownPtr = Set_12_OnDown;
 Set_12_.OnClickPtr = 0;
 Set_12_.OnPressPtr = 0;

 Set_max_delta_heat.OwnerScreen = &LIMITS2;
 Set_max_delta_heat.Order = 35;
 Set_max_delta_heat.Left = 304;
 Set_max_delta_heat.Top = 36;
 Set_max_delta_heat.Width = 40;
 Set_max_delta_heat.Height = 23;
 Set_max_delta_heat.Pen_Width = 1;
 Set_max_delta_heat.Pen_Color = 0x0000;
 Set_max_delta_heat.Visible = 1;
 Set_max_delta_heat.Active = 0;
 Set_max_delta_heat.Transparent = 1;
 Set_max_delta_heat.Caption = Set_max_delta_heat_Caption;
 Set_max_delta_heat.TextAlign = _taCenter;
 Set_max_delta_heat.TextAlignVertical= _tavMiddle;
 Set_max_delta_heat.FontName =  0x00005242 ;
 Set_max_delta_heat.PressColEnabled = 1;
 Set_max_delta_heat.Font_Color = 0x0408;
 Set_max_delta_heat.VerticalText = 0;
 Set_max_delta_heat.Gradient = 0;
 Set_max_delta_heat.Gradient_Orientation = 0;
 Set_max_delta_heat.Gradient_Start_Color = 0xFFFF;
 Set_max_delta_heat.Gradient_End_Color = 0xC618;
 Set_max_delta_heat.Color = 0xFFFF;
 Set_max_delta_heat.Press_Color = 0xE71C;
 Set_max_delta_heat.Corner_Radius = 2;
 Set_max_delta_heat.OnUpPtr = 0;
 Set_max_delta_heat.OnDownPtr = 0;
 Set_max_delta_heat.OnClickPtr = 0;
 Set_max_delta_heat.OnPressPtr = 0;

 Set_min_delta_DHW.OwnerScreen = &LIMITS2;
 Set_min_delta_DHW.Order = 36;
 Set_min_delta_DHW.Left = 304;
 Set_min_delta_DHW.Top = 68;
 Set_min_delta_DHW.Width = 40;
 Set_min_delta_DHW.Height = 23;
 Set_min_delta_DHW.Pen_Width = 1;
 Set_min_delta_DHW.Pen_Color = 0x0000;
 Set_min_delta_DHW.Visible = 1;
 Set_min_delta_DHW.Active = 0;
 Set_min_delta_DHW.Transparent = 1;
 Set_min_delta_DHW.Caption = Set_min_delta_DHW_Caption;
 Set_min_delta_DHW.TextAlign = _taCenter;
 Set_min_delta_DHW.TextAlignVertical= _tavMiddle;
 Set_min_delta_DHW.FontName =  0x00005242 ;
 Set_min_delta_DHW.PressColEnabled = 1;
 Set_min_delta_DHW.Font_Color = 0x0408;
 Set_min_delta_DHW.VerticalText = 0;
 Set_min_delta_DHW.Gradient = 0;
 Set_min_delta_DHW.Gradient_Orientation = 0;
 Set_min_delta_DHW.Gradient_Start_Color = 0xFFFF;
 Set_min_delta_DHW.Gradient_End_Color = 0xC618;
 Set_min_delta_DHW.Color = 0xFFFF;
 Set_min_delta_DHW.Press_Color = 0xE71C;
 Set_min_delta_DHW.Corner_Radius = 2;
 Set_min_delta_DHW.OnUpPtr = 0;
 Set_min_delta_DHW.OnDownPtr = 0;
 Set_min_delta_DHW.OnClickPtr = 0;
 Set_min_delta_DHW.OnPressPtr = 0;

 Set_min_delta_source.OwnerScreen = &LIMITS2;
 Set_min_delta_source.Order = 37;
 Set_min_delta_source.Left = 304;
 Set_min_delta_source.Top = 131;
 Set_min_delta_source.Width = 40;
 Set_min_delta_source.Height = 23;
 Set_min_delta_source.Pen_Width = 1;
 Set_min_delta_source.Pen_Color = 0x0000;
 Set_min_delta_source.Visible = 1;
 Set_min_delta_source.Active = 0;
 Set_min_delta_source.Transparent = 1;
 Set_min_delta_source.Caption = Set_min_delta_source_Caption;
 Set_min_delta_source.TextAlign = _taCenter;
 Set_min_delta_source.TextAlignVertical= _tavMiddle;
 Set_min_delta_source.FontName =  0x00005242 ;
 Set_min_delta_source.PressColEnabled = 1;
 Set_min_delta_source.Font_Color = 0x0408;
 Set_min_delta_source.VerticalText = 0;
 Set_min_delta_source.Gradient = 0;
 Set_min_delta_source.Gradient_Orientation = 0;
 Set_min_delta_source.Gradient_Start_Color = 0xFFFF;
 Set_min_delta_source.Gradient_End_Color = 0xC618;
 Set_min_delta_source.Color = 0xFFFF;
 Set_min_delta_source.Press_Color = 0xE71C;
 Set_min_delta_source.Corner_Radius = 2;
 Set_min_delta_source.OnUpPtr = 0;
 Set_min_delta_source.OnDownPtr = 0;
 Set_min_delta_source.OnClickPtr = 0;
 Set_min_delta_source.OnPressPtr = 0;

 Set_max_source_delta.OwnerScreen = &LIMITS2;
 Set_max_source_delta.Order = 38;
 Set_max_source_delta.Left = 304;
 Set_max_source_delta.Top = 164;
 Set_max_source_delta.Width = 40;
 Set_max_source_delta.Height = 23;
 Set_max_source_delta.Pen_Width = 1;
 Set_max_source_delta.Pen_Color = 0x0000;
 Set_max_source_delta.Visible = 1;
 Set_max_source_delta.Active = 0;
 Set_max_source_delta.Transparent = 1;
 Set_max_source_delta.Caption = Set_max_source_delta_Caption;
 Set_max_source_delta.TextAlign = _taCenter;
 Set_max_source_delta.TextAlignVertical= _tavMiddle;
 Set_max_source_delta.FontName =  0x00005242 ;
 Set_max_source_delta.PressColEnabled = 1;
 Set_max_source_delta.Font_Color = 0x0408;
 Set_max_source_delta.VerticalText = 0;
 Set_max_source_delta.Gradient = 0;
 Set_max_source_delta.Gradient_Orientation = 0;
 Set_max_source_delta.Gradient_Start_Color = 0xFFFF;
 Set_max_source_delta.Gradient_End_Color = 0xC618;
 Set_max_source_delta.Color = 0xFFFF;
 Set_max_source_delta.Press_Color = 0xE71C;
 Set_max_source_delta.Corner_Radius = 2;
 Set_max_source_delta.OnUpPtr = 0;
 Set_max_source_delta.OnDownPtr = 0;
 Set_max_source_delta.OnClickPtr = 0;
 Set_max_source_delta.OnPressPtr = 0;

 Set_max_delta_DHW.OwnerScreen = &LIMITS2;
 Set_max_delta_DHW.Order = 39;
 Set_max_delta_DHW.Left = 304;
 Set_max_delta_DHW.Top = 99;
 Set_max_delta_DHW.Width = 40;
 Set_max_delta_DHW.Height = 23;
 Set_max_delta_DHW.Pen_Width = 1;
 Set_max_delta_DHW.Pen_Color = 0x0000;
 Set_max_delta_DHW.Visible = 1;
 Set_max_delta_DHW.Active = 0;
 Set_max_delta_DHW.Transparent = 1;
 Set_max_delta_DHW.Caption = Set_max_delta_DHW_Caption;
 Set_max_delta_DHW.TextAlign = _taCenter;
 Set_max_delta_DHW.TextAlignVertical= _tavMiddle;
 Set_max_delta_DHW.FontName =  0x00005242 ;
 Set_max_delta_DHW.PressColEnabled = 1;
 Set_max_delta_DHW.Font_Color = 0x0408;
 Set_max_delta_DHW.VerticalText = 0;
 Set_max_delta_DHW.Gradient = 0;
 Set_max_delta_DHW.Gradient_Orientation = 0;
 Set_max_delta_DHW.Gradient_Start_Color = 0xFFFF;
 Set_max_delta_DHW.Gradient_End_Color = 0xC618;
 Set_max_delta_DHW.Color = 0xFFFF;
 Set_max_delta_DHW.Press_Color = 0xE71C;
 Set_max_delta_DHW.Corner_Radius = 2;
 Set_max_delta_DHW.OnUpPtr = 0;
 Set_max_delta_DHW.OnDownPtr = 0;
 Set_max_delta_DHW.OnClickPtr = 0;
 Set_max_delta_DHW.OnPressPtr = 0;

 Set_preset_time_electric.OwnerScreen = &LIMITS2;
 Set_preset_time_electric.Order = 40;
 Set_preset_time_electric.Left = 304;
 Set_preset_time_electric.Top = 196;
 Set_preset_time_electric.Width = 40;
 Set_preset_time_electric.Height = 23;
 Set_preset_time_electric.Pen_Width = 1;
 Set_preset_time_electric.Pen_Color = 0x0000;
 Set_preset_time_electric.Visible = 1;
 Set_preset_time_electric.Active = 0;
 Set_preset_time_electric.Transparent = 1;
 Set_preset_time_electric.Caption = Set_preset_time_electric_Caption;
 Set_preset_time_electric.TextAlign = _taCenter;
 Set_preset_time_electric.TextAlignVertical= _tavMiddle;
 Set_preset_time_electric.FontName =  0x00005242 ;
 Set_preset_time_electric.PressColEnabled = 1;
 Set_preset_time_electric.Font_Color = 0x0408;
 Set_preset_time_electric.VerticalText = 0;
 Set_preset_time_electric.Gradient = 0;
 Set_preset_time_electric.Gradient_Orientation = 0;
 Set_preset_time_electric.Gradient_Start_Color = 0xFFFF;
 Set_preset_time_electric.Gradient_End_Color = 0xC618;
 Set_preset_time_electric.Color = 0xFFFF;
 Set_preset_time_electric.Press_Color = 0xE71C;
 Set_preset_time_electric.Corner_Radius = 2;
 Set_preset_time_electric.OnUpPtr = 0;
 Set_preset_time_electric.OnDownPtr = 0;
 Set_preset_time_electric.OnClickPtr = 0;
 Set_preset_time_electric.OnPressPtr = 0;

 Down_7_.OwnerScreen = &LIMITS2;
 Down_7_.Order = 41;
 Down_7_.Left = 375;
 Down_7_.Top = 32;
 Down_7_.Width = 28;
 Down_7_.Height = 32;
 Down_7_.Picture_Type = 1;
 Down_7_.Picture_Ratio = 1;
 Down_7_.Picture_Name =  0x0016ED30 ;
 Down_7_.Visible = 1;
 Down_7_.Active = 1;
 Down_7_.OnUpPtr = Down_7_OnUp;
 Down_7_.OnDownPtr = 0;
 Down_7_.OnClickPtr = 0;
 Down_7_.OnPressPtr = Down_7_OnPress;

 Up_7_.OwnerScreen = &LIMITS2;
 Up_7_.Order = 42;
 Up_7_.Left = 405;
 Up_7_.Top = 32;
 Up_7_.Width = 28;
 Up_7_.Height = 32;
 Up_7_.Picture_Type = 1;
 Up_7_.Picture_Ratio = 1;
 Up_7_.Picture_Name =  0x0016DDA4 ;
 Up_7_.Visible = 1;
 Up_7_.Active = 1;
 Up_7_.OnUpPtr = Up_7_OnUp;
 Up_7_.OnDownPtr = 0;
 Up_7_.OnClickPtr = 0;
 Up_7_.OnPressPtr = Up_7_OnPress;

 Set_7_.OwnerScreen = &LIMITS2;
 Set_7_.Order = 43;
 Set_7_.Left = 439;
 Set_7_.Top = 32;
 Set_7_.Width = 34;
 Set_7_.Height = 32;
 Set_7_.Picture_Type = 1;
 Set_7_.Picture_Ratio = 1;
 Set_7_.Picture_Name =  0x0016E4AA ;
 Set_7_.Visible = 1;
 Set_7_.Active = 1;
 Set_7_.OnUpPtr = Set_7_OnUp;
 Set_7_.OnDownPtr = Set_7_OnDown;
 Set_7_.OnClickPtr = 0;
 Set_7_.OnPressPtr = 0;

 Home_b12.OwnerScreen = &LIMITS2;
 Home_b12.Order = 44;
 Home_b12.Left = 201;
 Home_b12.Top = 232;
 Home_b12.Width = 78;
 Home_b12.Height = 35;
 Home_b12.Pen_Width = 1;
 Home_b12.Pen_Color = 0xC618;
 Home_b12.Visible = 1;
 Home_b12.Active = 1;
 Home_b12.Transparent = 1;
 Home_b12.Caption = Home_b12_Caption;
 Home_b12.TextAlign = _taCenter;
 Home_b12.TextAlignVertical= _tavMiddle;
 Home_b12.FontName =  0x00005242 ;
 Home_b12.PressColEnabled = 1;
 Home_b12.Font_Color = 0xD6BA;
 Home_b12.VerticalText = 0;
 Home_b12.Gradient = 1;
 Home_b12.Gradient_Orientation = 0;
 Home_b12.Gradient_Start_Color = 0x0418;
 Home_b12.Gradient_End_Color = 0x00A5;
 Home_b12.Color = 0xC618;
 Home_b12.Press_Color = 0xE71C;
 Home_b12.Corner_Radius = 5;
 Home_b12.OnUpPtr = 0;
 Home_b12.OnDownPtr = 0;
 Home_b12.OnClickPtr = BackToHome;
 Home_b12.OnPressPtr = 0;

 Back_b9.OwnerScreen = &LIMITS2;
 Back_b9.Order = 45;
 Back_b9.Left = 113;
 Back_b9.Top = 232;
 Back_b9.Width = 78;
 Back_b9.Height = 35;
 Back_b9.Pen_Width = 1;
 Back_b9.Pen_Color = 0xC618;
 Back_b9.Visible = 1;
 Back_b9.Active = 1;
 Back_b9.Transparent = 1;
 Back_b9.Caption = Back_b9_Caption;
 Back_b9.TextAlign = _taCenter;
 Back_b9.TextAlignVertical= _tavMiddle;
 Back_b9.FontName =  0x00005242 ;
 Back_b9.PressColEnabled = 1;
 Back_b9.Font_Color = 0xD6BA;
 Back_b9.VerticalText = 0;
 Back_b9.Gradient = 1;
 Back_b9.Gradient_Orientation = 0;
 Back_b9.Gradient_Start_Color = 0x0418;
 Back_b9.Gradient_End_Color = 0x00A5;
 Back_b9.Color = 0xC618;
 Back_b9.Press_Color = 0xE71C;
 Back_b9.Corner_Radius = 5;
 Back_b9.OnUpPtr = 0;
 Back_b9.OnDownPtr = 0;
 Back_b9.OnClickPtr = goToBack;
 Back_b9.OnPressPtr = 0;

 Next_b5.OwnerScreen = &LIMITS2;
 Next_b5.Order = 46;
 Next_b5.Left = 286;
 Next_b5.Top = 232;
 Next_b5.Width = 78;
 Next_b5.Height = 35;
 Next_b5.Pen_Width = 1;
 Next_b5.Pen_Color = 0xC618;
 Next_b5.Visible = 1;
 Next_b5.Active = 1;
 Next_b5.Transparent = 1;
 Next_b5.Caption = Next_b5_Caption;
 Next_b5.TextAlign = _taCenter;
 Next_b5.TextAlignVertical= _tavMiddle;
 Next_b5.FontName =  0x00005242 ;
 Next_b5.PressColEnabled = 1;
 Next_b5.Font_Color = 0xD6BA;
 Next_b5.VerticalText = 0;
 Next_b5.Gradient = 1;
 Next_b5.Gradient_Orientation = 0;
 Next_b5.Gradient_Start_Color = 0x0418;
 Next_b5.Gradient_End_Color = 0x00A5;
 Next_b5.Color = 0xC618;
 Next_b5.Press_Color = 0xE71C;
 Next_b5.Corner_Radius = 5;
 Next_b5.OnUpPtr = 0;
 Next_b5.OnDownPtr = 0;
 Next_b5.OnClickPtr = nextPage;
 Next_b5.OnPressPtr = 0;

 Settings2_label.OwnerScreen = &LIMITS2;
 Settings2_label.Order = 47;
 Settings2_label.Left = 206;
 Settings2_label.Top = 5;
 Settings2_label.Width = 85;
 Settings2_label.Height = 20;
 Settings2_label.Visible = 1;
 Settings2_label.Active = 0;
 Settings2_label.Caption = Settings2_label_Caption;
 Settings2_label.FontName =  0x00005242 ;
 Settings2_label.Font_Color = 0xE7FC;
 Settings2_label.VerticalText = 0;
 Settings2_label.OnUpPtr = 0;
 Settings2_label.OnDownPtr = 0;
 Settings2_label.OnClickPtr = 0;
 Settings2_label.OnPressPtr = 0;

 CircleButton2.OwnerScreen = &LIMITS2;
 CircleButton2.Order = 48;
 CircleButton2.Left = 450;
 CircleButton2.Top = 3;
 CircleButton2.Radius = 12;
 CircleButton2.Pen_Width = 1;
 CircleButton2.Pen_Color = 0x0000;
 CircleButton2.Visible = 1;
 CircleButton2.Active = 0;
 CircleButton2.Transparent = 1;
 CircleButton2.Caption = CircleButton2_Caption;
 CircleButton2.TextAlign = _taCenter;
 CircleButton2.TextAlignVertical= _tavMiddle;
 CircleButton2.FontName =  0x00005242 ;
 CircleButton2.PressColEnabled = 1;
 CircleButton2.Font_Color = 0x0000;
 CircleButton2.VerticalText = 0;
 CircleButton2.Gradient = 1;
 CircleButton2.Gradient_Orientation = 0;
 CircleButton2.Gradient_Start_Color = 0xFFFF;
 CircleButton2.Gradient_End_Color = 0xC618;
 CircleButton2.Color = 0xC618;
 CircleButton2.Press_Color = 0xE71C;
 CircleButton2.OnUpPtr = 0;
 CircleButton2.OnDownPtr = 0;
 CircleButton2.OnClickPtr = 0;
 CircleButton2.OnPressPtr = 0;

 Image380.OwnerScreen = &SENSOR1;
 Image380.Order = 0;
 Image380.Left = 1;
 Image380.Top = 0;
 Image380.Width = 480;
 Image380.Height = 272;
 Image380.Picture_Type = 1;
 Image380.Picture_Ratio = 1;
 Image380.Picture_Name =  0x0003CAAE ;
 Image380.Visible = 1;
 Image380.Active = 0;
 Image380.OnUpPtr = 0;
 Image380.OnDownPtr = 0;
 Image380.OnClickPtr = 0;
 Image380.OnPressPtr = 0;

 Sensors2_label.OwnerScreen = &SENSOR1;
 Sensors2_label.Order = 1;
 Sensors2_label.Left = 214;
 Sensors2_label.Top = 5;
 Sensors2_label.Width = 56;
 Sensors2_label.Height = 20;
 Sensors2_label.Visible = 1;
 Sensors2_label.Active = 0;
 Sensors2_label.Caption = Sensors2_label_Caption;
 Sensors2_label.FontName =  0x00005242 ;
 Sensors2_label.Font_Color = 0xE7FC;
 Sensors2_label.VerticalText = 0;
 Sensors2_label.OnUpPtr = 0;
 Sensors2_label.OnDownPtr = 0;
 Sensors2_label.OnClickPtr = 0;
 Sensors2_label.OnPressPtr = 0;

 Label285.OwnerScreen = &SENSOR1;
 Label285.Order = 2;
 Label285.Left = 28;
 Label285.Top = 62;
 Label285.Width = 91;
 Label285.Height = 20;
 Label285.Visible = 1;
 Label285.Active = 0;
 Label285.Caption = Label285_Caption;
 Label285.FontName =  0x00005242 ;
 Label285.Font_Color = 0xFFFF;
 Label285.VerticalText = 0;
 Label285.OnUpPtr = 0;
 Label285.OnDownPtr = 0;
 Label285.OnClickPtr = 0;
 Label285.OnPressPtr = 0;

 Label286.OwnerScreen = &SENSOR1;
 Label286.Order = 3;
 Label286.Left = 28;
 Label286.Top = 36;
 Label286.Width = 81;
 Label286.Height = 20;
 Label286.Visible = 1;
 Label286.Active = 0;
 Label286.Caption = Label286_Caption;
 Label286.FontName =  0x00005242 ;
 Label286.Font_Color = 0xFFFF;
 Label286.VerticalText = 0;
 Label286.OnUpPtr = 0;
 Label286.OnDownPtr = 0;
 Label286.OnClickPtr = 0;
 Label286.OnPressPtr = 0;

 Label287.OwnerScreen = &SENSOR1;
 Label287.Order = 4;
 Label287.Left = 28;
 Label287.Top = 87;
 Label287.Width = 100;
 Label287.Height = 20;
 Label287.Visible = 1;
 Label287.Active = 0;
 Label287.Caption = Label287_Caption;
 Label287.FontName =  0x00005242 ;
 Label287.Font_Color = 0xFFFF;
 Label287.VerticalText = 0;
 Label287.OnUpPtr = 0;
 Label287.OnDownPtr = 0;
 Label287.OnClickPtr = 0;
 Label287.OnPressPtr = 0;

 Label288.OwnerScreen = &SENSOR1;
 Label288.Order = 5;
 Label288.Left = 28;
 Label288.Top = 113;
 Label288.Width = 110;
 Label288.Height = 20;
 Label288.Visible = 1;
 Label288.Active = 0;
 Label288.Caption = Label288_Caption;
 Label288.FontName =  0x00005242 ;
 Label288.Font_Color = 0xFFFF;
 Label288.VerticalText = 0;
 Label288.OnUpPtr = 0;
 Label288.OnDownPtr = 0;
 Label288.OnClickPtr = 0;
 Label288.OnPressPtr = 0;

 Label289.OwnerScreen = &SENSOR1;
 Label289.Order = 6;
 Label289.Left = 29;
 Label289.Top = 138;
 Label289.Width = 93;
 Label289.Height = 20;
 Label289.Visible = 1;
 Label289.Active = 0;
 Label289.Caption = Label289_Caption;
 Label289.FontName =  0x00005242 ;
 Label289.Font_Color = 0xFFFF;
 Label289.VerticalText = 0;
 Label289.OnUpPtr = 0;
 Label289.OnDownPtr = 0;
 Label289.OnClickPtr = 0;
 Label289.OnPressPtr = 0;

 Label290.OwnerScreen = &SENSOR1;
 Label290.Order = 7;
 Label290.Left = 246;
 Label290.Top = 88;
 Label290.Width = 40;
 Label290.Height = 20;
 Label290.Visible = 1;
 Label290.Active = 0;
 Label290.Caption = Label290_Caption;
 Label290.FontName =  0x00005242 ;
 Label290.Font_Color = 0xFFFF;
 Label290.VerticalText = 0;
 Label290.OnUpPtr = 0;
 Label290.OnDownPtr = 0;
 Label290.OnClickPtr = 0;
 Label290.OnPressPtr = 0;

 Label293.OwnerScreen = &SENSOR1;
 Label293.Order = 8;
 Label293.Left = 28;
 Label293.Top = 164;
 Label293.Width = 102;
 Label293.Height = 20;
 Label293.Visible = 1;
 Label293.Active = 0;
 Label293.Caption = Label293_Caption;
 Label293.FontName =  0x00005242 ;
 Label293.Font_Color = 0xFFFF;
 Label293.VerticalText = 0;
 Label293.OnUpPtr = 0;
 Label293.OnDownPtr = 0;
 Label293.OnClickPtr = 0;
 Label293.OnPressPtr = 0;

 Label294.OwnerScreen = &SENSOR1;
 Label294.Order = 9;
 Label294.Left = 28;
 Label294.Top = 190;
 Label294.Width = 85;
 Label294.Height = 20;
 Label294.Visible = 1;
 Label294.Active = 0;
 Label294.Caption = Label294_Caption;
 Label294.FontName =  0x00005242 ;
 Label294.Font_Color = 0xFFFF;
 Label294.VerticalText = 0;
 Label294.OnUpPtr = 0;
 Label294.OnDownPtr = 0;
 Label294.OnClickPtr = 0;
 Label294.OnPressPtr = 0;

 S_Brine_Inlet_1.OwnerScreen = &SENSOR1;
 S_Brine_Inlet_1.Order = 10;
 S_Brine_Inlet_1.Left = 145;
 S_Brine_Inlet_1.Top = 32;
 S_Brine_Inlet_1.Width = 45;
 S_Brine_Inlet_1.Height = 23;
 S_Brine_Inlet_1.Pen_Width = 1;
 S_Brine_Inlet_1.Pen_Color = 0xC618;
 S_Brine_Inlet_1.Visible = 1;
 S_Brine_Inlet_1.Active = 0;
 S_Brine_Inlet_1.Transparent = 1;
 S_Brine_Inlet_1.Caption = S_Brine_Inlet_1_Caption;
 S_Brine_Inlet_1.TextAlign = _taRight;
 S_Brine_Inlet_1.TextAlignVertical= _tavMiddle;
 S_Brine_Inlet_1.FontName =  0x00005242 ;
 S_Brine_Inlet_1.PressColEnabled = 0;
 S_Brine_Inlet_1.Font_Color = 0x0000;
 S_Brine_Inlet_1.VerticalText = 0;
 S_Brine_Inlet_1.Gradient = 0;
 S_Brine_Inlet_1.Gradient_Orientation = 0;
 S_Brine_Inlet_1.Gradient_Start_Color = 0xFFFF;
 S_Brine_Inlet_1.Gradient_End_Color = 0xC618;
 S_Brine_Inlet_1.Color = 0xFFFF;
 S_Brine_Inlet_1.Press_Color = 0xE71C;
 S_Brine_Inlet_1.Corner_Radius = 3;
 S_Brine_Inlet_1.OnUpPtr = 0;
 S_Brine_Inlet_1.OnDownPtr = 0;
 S_Brine_Inlet_1.OnClickPtr = 0;
 S_Brine_Inlet_1.OnPressPtr = 0;

 S_Brine_Outlet_1.OwnerScreen = &SENSOR1;
 S_Brine_Outlet_1.Order = 11;
 S_Brine_Outlet_1.Left = 145;
 S_Brine_Outlet_1.Top = 58;
 S_Brine_Outlet_1.Width = 45;
 S_Brine_Outlet_1.Height = 23;
 S_Brine_Outlet_1.Pen_Width = 1;
 S_Brine_Outlet_1.Pen_Color = 0xC618;
 S_Brine_Outlet_1.Visible = 1;
 S_Brine_Outlet_1.Active = 0;
 S_Brine_Outlet_1.Transparent = 1;
 S_Brine_Outlet_1.Caption = S_Brine_Outlet_1_Caption;
 S_Brine_Outlet_1.TextAlign = _taRight;
 S_Brine_Outlet_1.TextAlignVertical= _tavMiddle;
 S_Brine_Outlet_1.FontName =  0x00005242 ;
 S_Brine_Outlet_1.PressColEnabled = 0;
 S_Brine_Outlet_1.Font_Color = 0x0000;
 S_Brine_Outlet_1.VerticalText = 0;
 S_Brine_Outlet_1.Gradient = 0;
 S_Brine_Outlet_1.Gradient_Orientation = 0;
 S_Brine_Outlet_1.Gradient_Start_Color = 0xFFFF;
 S_Brine_Outlet_1.Gradient_End_Color = 0xC618;
 S_Brine_Outlet_1.Color = 0xFFFF;
 S_Brine_Outlet_1.Press_Color = 0xE71C;
 S_Brine_Outlet_1.Corner_Radius = 3;
 S_Brine_Outlet_1.OnUpPtr = 0;
 S_Brine_Outlet_1.OnDownPtr = 0;
 S_Brine_Outlet_1.OnClickPtr = 0;
 S_Brine_Outlet_1.OnPressPtr = 0;

 S_Heat_Inlet_1.OwnerScreen = &SENSOR1;
 S_Heat_Inlet_1.Order = 12;
 S_Heat_Inlet_1.Left = 145;
 S_Heat_Inlet_1.Top = 84;
 S_Heat_Inlet_1.Width = 45;
 S_Heat_Inlet_1.Height = 23;
 S_Heat_Inlet_1.Pen_Width = 1;
 S_Heat_Inlet_1.Pen_Color = 0xC618;
 S_Heat_Inlet_1.Visible = 1;
 S_Heat_Inlet_1.Active = 0;
 S_Heat_Inlet_1.Transparent = 1;
 S_Heat_Inlet_1.Caption = S_Heat_Inlet_1_Caption;
 S_Heat_Inlet_1.TextAlign = _taRight;
 S_Heat_Inlet_1.TextAlignVertical= _tavMiddle;
 S_Heat_Inlet_1.FontName =  0x00005242 ;
 S_Heat_Inlet_1.PressColEnabled = 0;
 S_Heat_Inlet_1.Font_Color = 0x0000;
 S_Heat_Inlet_1.VerticalText = 0;
 S_Heat_Inlet_1.Gradient = 0;
 S_Heat_Inlet_1.Gradient_Orientation = 0;
 S_Heat_Inlet_1.Gradient_Start_Color = 0xFFFF;
 S_Heat_Inlet_1.Gradient_End_Color = 0xC618;
 S_Heat_Inlet_1.Color = 0xFFFF;
 S_Heat_Inlet_1.Press_Color = 0xE71C;
 S_Heat_Inlet_1.Corner_Radius = 3;
 S_Heat_Inlet_1.OnUpPtr = 0;
 S_Heat_Inlet_1.OnDownPtr = 0;
 S_Heat_Inlet_1.OnClickPtr = 0;
 S_Heat_Inlet_1.OnPressPtr = 0;

 S_Heat_Outlet_1.OwnerScreen = &SENSOR1;
 S_Heat_Outlet_1.Order = 13;
 S_Heat_Outlet_1.Left = 145;
 S_Heat_Outlet_1.Top = 110;
 S_Heat_Outlet_1.Width = 45;
 S_Heat_Outlet_1.Height = 23;
 S_Heat_Outlet_1.Pen_Width = 1;
 S_Heat_Outlet_1.Pen_Color = 0xC618;
 S_Heat_Outlet_1.Visible = 1;
 S_Heat_Outlet_1.Active = 0;
 S_Heat_Outlet_1.Transparent = 1;
 S_Heat_Outlet_1.Caption = S_Heat_Outlet_1_Caption;
 S_Heat_Outlet_1.TextAlign = _taRight;
 S_Heat_Outlet_1.TextAlignVertical= _tavMiddle;
 S_Heat_Outlet_1.FontName =  0x00005242 ;
 S_Heat_Outlet_1.PressColEnabled = 0;
 S_Heat_Outlet_1.Font_Color = 0x0000;
 S_Heat_Outlet_1.VerticalText = 0;
 S_Heat_Outlet_1.Gradient = 0;
 S_Heat_Outlet_1.Gradient_Orientation = 0;
 S_Heat_Outlet_1.Gradient_Start_Color = 0xFFFF;
 S_Heat_Outlet_1.Gradient_End_Color = 0xC618;
 S_Heat_Outlet_1.Color = 0xFFFF;
 S_Heat_Outlet_1.Press_Color = 0xE71C;
 S_Heat_Outlet_1.Corner_Radius = 3;
 S_Heat_Outlet_1.OnUpPtr = 0;
 S_Heat_Outlet_1.OnDownPtr = 0;
 S_Heat_Outlet_1.OnClickPtr = 0;
 S_Heat_Outlet_1.OnPressPtr = 0;

 S_Compressor_1.OwnerScreen = &SENSOR1;
 S_Compressor_1.Order = 14;
 S_Compressor_1.Left = 145;
 S_Compressor_1.Top = 136;
 S_Compressor_1.Width = 45;
 S_Compressor_1.Height = 23;
 S_Compressor_1.Pen_Width = 1;
 S_Compressor_1.Pen_Color = 0xC618;
 S_Compressor_1.Visible = 1;
 S_Compressor_1.Active = 0;
 S_Compressor_1.Transparent = 1;
 S_Compressor_1.Caption = S_Compressor_1_Caption;
 S_Compressor_1.TextAlign = _taRight;
 S_Compressor_1.TextAlignVertical= _tavMiddle;
 S_Compressor_1.FontName =  0x00005242 ;
 S_Compressor_1.PressColEnabled = 0;
 S_Compressor_1.Font_Color = 0x0000;
 S_Compressor_1.VerticalText = 0;
 S_Compressor_1.Gradient = 0;
 S_Compressor_1.Gradient_Orientation = 0;
 S_Compressor_1.Gradient_Start_Color = 0xFFFF;
 S_Compressor_1.Gradient_End_Color = 0xC618;
 S_Compressor_1.Color = 0xFFFF;
 S_Compressor_1.Press_Color = 0xE71C;
 S_Compressor_1.Corner_Radius = 3;
 S_Compressor_1.OnUpPtr = 0;
 S_Compressor_1.OnDownPtr = 0;
 S_Compressor_1.OnClickPtr = 0;
 S_Compressor_1.OnPressPtr = 0;

 S_DHW.OwnerScreen = &SENSOR1;
 S_DHW.Order = 15;
 S_DHW.Left = 391;
 S_DHW.Top = 84;
 S_DHW.Width = 45;
 S_DHW.Height = 23;
 S_DHW.Pen_Width = 1;
 S_DHW.Pen_Color = 0xC618;
 S_DHW.Visible = 1;
 S_DHW.Active = 0;
 S_DHW.Transparent = 1;
 S_DHW.Caption = S_DHW_Caption;
 S_DHW.TextAlign = _taRight;
 S_DHW.TextAlignVertical= _tavMiddle;
 S_DHW.FontName =  0x00005242 ;
 S_DHW.PressColEnabled = 0;
 S_DHW.Font_Color = 0x0000;
 S_DHW.VerticalText = 0;
 S_DHW.Gradient = 0;
 S_DHW.Gradient_Orientation = 0;
 S_DHW.Gradient_Start_Color = 0xFFFF;
 S_DHW.Gradient_End_Color = 0xC618;
 S_DHW.Color = 0xFFFF;
 S_DHW.Press_Color = 0xE71C;
 S_DHW.Corner_Radius = 3;
 S_DHW.OnUpPtr = 0;
 S_DHW.OnDownPtr = 0;
 S_DHW.OnClickPtr = 0;
 S_DHW.OnPressPtr = 0;

 S_Superheat_1.OwnerScreen = &SENSOR1;
 S_Superheat_1.Order = 16;
 S_Superheat_1.Left = 145;
 S_Superheat_1.Top = 162;
 S_Superheat_1.Width = 45;
 S_Superheat_1.Height = 23;
 S_Superheat_1.Pen_Width = 1;
 S_Superheat_1.Pen_Color = 0xC618;
 S_Superheat_1.Visible = 1;
 S_Superheat_1.Active = 0;
 S_Superheat_1.Transparent = 1;
 S_Superheat_1.Caption = S_Superheat_1_Caption;
 S_Superheat_1.TextAlign = _taRight;
 S_Superheat_1.TextAlignVertical= _tavMiddle;
 S_Superheat_1.FontName =  0x00005242 ;
 S_Superheat_1.PressColEnabled = 0;
 S_Superheat_1.Font_Color = 0x0000;
 S_Superheat_1.VerticalText = 0;
 S_Superheat_1.Gradient = 0;
 S_Superheat_1.Gradient_Orientation = 0;
 S_Superheat_1.Gradient_Start_Color = 0xFFFF;
 S_Superheat_1.Gradient_End_Color = 0xC618;
 S_Superheat_1.Color = 0xFFFF;
 S_Superheat_1.Press_Color = 0xE71C;
 S_Superheat_1.Corner_Radius = 3;
 S_Superheat_1.OnUpPtr = 0;
 S_Superheat_1.OnDownPtr = 0;
 S_Superheat_1.OnClickPtr = 0;
 S_Superheat_1.OnPressPtr = 0;

 S_Subcool_1.OwnerScreen = &SENSOR1;
 S_Subcool_1.Order = 17;
 S_Subcool_1.Left = 145;
 S_Subcool_1.Top = 188;
 S_Subcool_1.Width = 45;
 S_Subcool_1.Height = 23;
 S_Subcool_1.Pen_Width = 1;
 S_Subcool_1.Pen_Color = 0xC618;
 S_Subcool_1.Visible = 1;
 S_Subcool_1.Active = 0;
 S_Subcool_1.Transparent = 1;
 S_Subcool_1.Caption = S_Subcool_1_Caption;
 S_Subcool_1.TextAlign = _taRight;
 S_Subcool_1.TextAlignVertical= _tavMiddle;
 S_Subcool_1.FontName =  0x00005242 ;
 S_Subcool_1.PressColEnabled = 0;
 S_Subcool_1.Font_Color = 0x0000;
 S_Subcool_1.VerticalText = 0;
 S_Subcool_1.Gradient = 0;
 S_Subcool_1.Gradient_Orientation = 0;
 S_Subcool_1.Gradient_Start_Color = 0xFFFF;
 S_Subcool_1.Gradient_End_Color = 0xC618;
 S_Subcool_1.Color = 0xFFFF;
 S_Subcool_1.Press_Color = 0xE71C;
 S_Subcool_1.Corner_Radius = 3;
 S_Subcool_1.OnUpPtr = 0;
 S_Subcool_1.OnDownPtr = 0;
 S_Subcool_1.OnClickPtr = 0;
 S_Subcool_1.OnPressPtr = 0;

 Label297.OwnerScreen = &SENSOR1;
 Label297.Order = 18;
 Label297.Left = 200;
 Label297.Top = 34;
 Label297.Width = 12;
 Label297.Height = 20;
 Label297.Visible = 1;
 Label297.Active = 0;
 Label297.Caption = Label297_Caption;
 Label297.FontName =  0x00005242 ;
 Label297.Font_Color = 0xFFFF;
 Label297.VerticalText = 0;
 Label297.OnUpPtr = 0;
 Label297.OnDownPtr = 0;
 Label297.OnClickPtr = 0;
 Label297.OnPressPtr = 0;

 Label298.OwnerScreen = &SENSOR1;
 Label298.Order = 19;
 Label298.Left = 191;
 Label298.Top = 34;
 Label298.Width = 7;
 Label298.Height = 20;
 Label298.Visible = 1;
 Label298.Active = 0;
 Label298.Caption = Label298_Caption;
 Label298.FontName =  0x00005242 ;
 Label298.Font_Color = 0xFFFF;
 Label298.VerticalText = 0;
 Label298.OnUpPtr = 0;
 Label298.OnDownPtr = 0;
 Label298.OnClickPtr = 0;
 Label298.OnPressPtr = 0;

 Label299.OwnerScreen = &SENSOR1;
 Label299.Order = 20;
 Label299.Left = 202;
 Label299.Top = 60;
 Label299.Width = 12;
 Label299.Height = 20;
 Label299.Visible = 1;
 Label299.Active = 0;
 Label299.Caption = Label299_Caption;
 Label299.FontName =  0x00005242 ;
 Label299.Font_Color = 0xFFFF;
 Label299.VerticalText = 0;
 Label299.OnUpPtr = 0;
 Label299.OnDownPtr = 0;
 Label299.OnClickPtr = 0;
 Label299.OnPressPtr = 0;

 Label300.OwnerScreen = &SENSOR1;
 Label300.Order = 21;
 Label300.Left = 193;
 Label300.Top = 87;
 Label300.Width = 7;
 Label300.Height = 20;
 Label300.Visible = 1;
 Label300.Active = 0;
 Label300.Caption = Label300_Caption;
 Label300.FontName =  0x00005242 ;
 Label300.Font_Color = 0xFFFF;
 Label300.VerticalText = 0;
 Label300.OnUpPtr = 0;
 Label300.OnDownPtr = 0;
 Label300.OnClickPtr = 0;
 Label300.OnPressPtr = 0;

 Label301.OwnerScreen = &SENSOR1;
 Label301.Order = 22;
 Label301.Left = 202;
 Label301.Top = 87;
 Label301.Width = 12;
 Label301.Height = 20;
 Label301.Visible = 1;
 Label301.Active = 0;
 Label301.Caption = Label301_Caption;
 Label301.FontName =  0x00005242 ;
 Label301.Font_Color = 0xFFFF;
 Label301.VerticalText = 0;
 Label301.OnUpPtr = 0;
 Label301.OnDownPtr = 0;
 Label301.OnClickPtr = 0;
 Label301.OnPressPtr = 0;

 Label302.OwnerScreen = &SENSOR1;
 Label302.Order = 23;
 Label302.Left = 193;
 Label302.Top = 60;
 Label302.Width = 7;
 Label302.Height = 20;
 Label302.Visible = 1;
 Label302.Active = 0;
 Label302.Caption = Label302_Caption;
 Label302.FontName =  0x00005242 ;
 Label302.Font_Color = 0xFFFF;
 Label302.VerticalText = 0;
 Label302.OnUpPtr = 0;
 Label302.OnDownPtr = 0;
 Label302.OnClickPtr = 0;
 Label302.OnPressPtr = 0;

 Label303.OwnerScreen = &SENSOR1;
 Label303.Order = 24;
 Label303.Left = 192;
 Label303.Top = 113;
 Label303.Width = 7;
 Label303.Height = 20;
 Label303.Visible = 1;
 Label303.Active = 0;
 Label303.Caption = Label303_Caption;
 Label303.FontName =  0x00005242 ;
 Label303.Font_Color = 0xFFFF;
 Label303.VerticalText = 0;
 Label303.OnUpPtr = 0;
 Label303.OnDownPtr = 0;
 Label303.OnClickPtr = 0;
 Label303.OnPressPtr = 0;

 Label304.OwnerScreen = &SENSOR1;
 Label304.Order = 25;
 Label304.Left = 201;
 Label304.Top = 113;
 Label304.Width = 12;
 Label304.Height = 20;
 Label304.Visible = 1;
 Label304.Active = 0;
 Label304.Caption = Label304_Caption;
 Label304.FontName =  0x00005242 ;
 Label304.Font_Color = 0xFFFF;
 Label304.VerticalText = 0;
 Label304.OnUpPtr = 0;
 Label304.OnDownPtr = 0;
 Label304.OnClickPtr = 0;
 Label304.OnPressPtr = 0;

 Label305.OwnerScreen = &SENSOR1;
 Label305.Order = 26;
 Label305.Left = 192;
 Label305.Top = 139;
 Label305.Width = 7;
 Label305.Height = 20;
 Label305.Visible = 1;
 Label305.Active = 0;
 Label305.Caption = Label305_Caption;
 Label305.FontName =  0x00005242 ;
 Label305.Font_Color = 0xFFFF;
 Label305.VerticalText = 0;
 Label305.OnUpPtr = 0;
 Label305.OnDownPtr = 0;
 Label305.OnClickPtr = 0;
 Label305.OnPressPtr = 0;

 Label306.OwnerScreen = &SENSOR1;
 Label306.Order = 27;
 Label306.Left = 201;
 Label306.Top = 139;
 Label306.Width = 12;
 Label306.Height = 20;
 Label306.Visible = 1;
 Label306.Active = 0;
 Label306.Caption = Label306_Caption;
 Label306.FontName =  0x00005242 ;
 Label306.Font_Color = 0xFFFF;
 Label306.VerticalText = 0;
 Label306.OnUpPtr = 0;
 Label306.OnDownPtr = 0;
 Label306.OnClickPtr = 0;
 Label306.OnPressPtr = 0;

 Label309.OwnerScreen = &SENSOR1;
 Label309.Order = 28;
 Label309.Left = 438;
 Label309.Top = 86;
 Label309.Width = 7;
 Label309.Height = 20;
 Label309.Visible = 1;
 Label309.Active = 0;
 Label309.Caption = Label309_Caption;
 Label309.FontName =  0x00005242 ;
 Label309.Font_Color = 0xFFFF;
 Label309.VerticalText = 0;
 Label309.OnUpPtr = 0;
 Label309.OnDownPtr = 0;
 Label309.OnClickPtr = 0;
 Label309.OnPressPtr = 0;

 Label310.OwnerScreen = &SENSOR1;
 Label310.Order = 29;
 Label310.Left = 447;
 Label310.Top = 86;
 Label310.Width = 12;
 Label310.Height = 20;
 Label310.Visible = 1;
 Label310.Active = 0;
 Label310.Caption = Label310_Caption;
 Label310.FontName =  0x00005242 ;
 Label310.Font_Color = 0xFFFF;
 Label310.VerticalText = 0;
 Label310.OnUpPtr = 0;
 Label310.OnDownPtr = 0;
 Label310.OnClickPtr = 0;
 Label310.OnPressPtr = 0;

 Label315.OwnerScreen = &SENSOR1;
 Label315.Order = 30;
 Label315.Left = 201;
 Label315.Top = 164;
 Label315.Width = 12;
 Label315.Height = 20;
 Label315.Visible = 1;
 Label315.Active = 0;
 Label315.Caption = Label315_Caption;
 Label315.FontName =  0x00005242 ;
 Label315.Font_Color = 0xFFFF;
 Label315.VerticalText = 0;
 Label315.OnUpPtr = 0;
 Label315.OnDownPtr = 0;
 Label315.OnClickPtr = 0;
 Label315.OnPressPtr = 0;

 Label316.OwnerScreen = &SENSOR1;
 Label316.Order = 31;
 Label316.Left = 192;
 Label316.Top = 191;
 Label316.Width = 7;
 Label316.Height = 20;
 Label316.Visible = 1;
 Label316.Active = 0;
 Label316.Caption = Label316_Caption;
 Label316.FontName =  0x00005242 ;
 Label316.Font_Color = 0xFFFF;
 Label316.VerticalText = 0;
 Label316.OnUpPtr = 0;
 Label316.OnDownPtr = 0;
 Label316.OnClickPtr = 0;
 Label316.OnPressPtr = 0;

 Label317.OwnerScreen = &SENSOR1;
 Label317.Order = 32;
 Label317.Left = 201;
 Label317.Top = 191;
 Label317.Width = 12;
 Label317.Height = 20;
 Label317.Visible = 1;
 Label317.Active = 0;
 Label317.Caption = Label317_Caption;
 Label317.FontName =  0x00005242 ;
 Label317.Font_Color = 0xFFFF;
 Label317.VerticalText = 0;
 Label317.OnUpPtr = 0;
 Label317.OnDownPtr = 0;
 Label317.OnClickPtr = 0;
 Label317.OnPressPtr = 0;

 Label318.OwnerScreen = &SENSOR1;
 Label318.Order = 33;
 Label318.Left = 192;
 Label318.Top = 164;
 Label318.Width = 7;
 Label318.Height = 20;
 Label318.Visible = 1;
 Label318.Active = 0;
 Label318.Caption = Label318_Caption;
 Label318.FontName =  0x00005242 ;
 Label318.Font_Color = 0xFFFF;
 Label318.VerticalText = 0;
 Label318.OnUpPtr = 0;
 Label318.OnDownPtr = 0;
 Label318.OnClickPtr = 0;
 Label318.OnPressPtr = 0;

 Label319.OwnerScreen = &SENSOR1;
 Label319.Order = 34;
 Label319.Left = 246;
 Label319.Top = 36;
 Label319.Width = 89;
 Label319.Height = 20;
 Label319.Visible = 1;
 Label319.Active = 0;
 Label319.Caption = Label319_Caption;
 Label319.FontName =  0x00005242 ;
 Label319.Font_Color = 0xFFFF;
 Label319.VerticalText = 0;
 Label319.OnUpPtr = 0;
 Label319.OnDownPtr = 0;
 Label319.OnClickPtr = 0;
 Label319.OnPressPtr = 0;

 S_Source_Flow_1.OwnerScreen = &SENSOR1;
 S_Source_Flow_1.Order = 35;
 S_Source_Flow_1.Left = 391;
 S_Source_Flow_1.Top = 32;
 S_Source_Flow_1.Width = 51;
 S_Source_Flow_1.Height = 23;
 S_Source_Flow_1.Pen_Width = 1;
 S_Source_Flow_1.Pen_Color = 0xC618;
 S_Source_Flow_1.Visible = 1;
 S_Source_Flow_1.Active = 0;
 S_Source_Flow_1.Transparent = 1;
 S_Source_Flow_1.Caption = S_Source_Flow_1_Caption;
 S_Source_Flow_1.TextAlign = _taRight;
 S_Source_Flow_1.TextAlignVertical= _tavMiddle;
 S_Source_Flow_1.FontName =  0x00005242 ;
 S_Source_Flow_1.PressColEnabled = 0;
 S_Source_Flow_1.Font_Color = 0x0000;
 S_Source_Flow_1.VerticalText = 0;
 S_Source_Flow_1.Gradient = 0;
 S_Source_Flow_1.Gradient_Orientation = 0;
 S_Source_Flow_1.Gradient_Start_Color = 0xFFFF;
 S_Source_Flow_1.Gradient_End_Color = 0xC618;
 S_Source_Flow_1.Color = 0xFFFF;
 S_Source_Flow_1.Press_Color = 0xE71C;
 S_Source_Flow_1.Corner_Radius = 3;
 S_Source_Flow_1.OnUpPtr = 0;
 S_Source_Flow_1.OnDownPtr = 0;
 S_Source_Flow_1.OnClickPtr = 0;
 S_Source_Flow_1.OnPressPtr = 0;

 Label320.OwnerScreen = &SENSOR1;
 Label320.Order = 36;
 Label320.Left = 246;
 Label320.Top = 62;
 Label320.Width = 71;
 Label320.Height = 20;
 Label320.Visible = 1;
 Label320.Active = 0;
 Label320.Caption = Label320_Caption;
 Label320.FontName =  0x00005242 ;
 Label320.Font_Color = 0xFFFF;
 Label320.VerticalText = 0;
 Label320.OnUpPtr = 0;
 Label320.OnDownPtr = 0;
 Label320.OnClickPtr = 0;
 Label320.OnPressPtr = 0;

 S_Heat_Flow_1.OwnerScreen = &SENSOR1;
 S_Heat_Flow_1.Order = 37;
 S_Heat_Flow_1.Left = 391;
 S_Heat_Flow_1.Top = 58;
 S_Heat_Flow_1.Width = 51;
 S_Heat_Flow_1.Height = 23;
 S_Heat_Flow_1.Pen_Width = 1;
 S_Heat_Flow_1.Pen_Color = 0xC618;
 S_Heat_Flow_1.Visible = 1;
 S_Heat_Flow_1.Active = 0;
 S_Heat_Flow_1.Transparent = 1;
 S_Heat_Flow_1.Caption = S_Heat_Flow_1_Caption;
 S_Heat_Flow_1.TextAlign = _taRight;
 S_Heat_Flow_1.TextAlignVertical= _tavMiddle;
 S_Heat_Flow_1.FontName =  0x00005242 ;
 S_Heat_Flow_1.PressColEnabled = 0;
 S_Heat_Flow_1.Font_Color = 0x0000;
 S_Heat_Flow_1.VerticalText = 0;
 S_Heat_Flow_1.Gradient = 0;
 S_Heat_Flow_1.Gradient_Orientation = 0;
 S_Heat_Flow_1.Gradient_Start_Color = 0xFFFF;
 S_Heat_Flow_1.Gradient_End_Color = 0xC618;
 S_Heat_Flow_1.Color = 0xFFFF;
 S_Heat_Flow_1.Press_Color = 0xE71C;
 S_Heat_Flow_1.Corner_Radius = 3;
 S_Heat_Flow_1.OnUpPtr = 0;
 S_Heat_Flow_1.OnDownPtr = 0;
 S_Heat_Flow_1.OnClickPtr = 0;
 S_Heat_Flow_1.OnPressPtr = 0;

 Label321.OwnerScreen = &SENSOR1;
 Label321.Order = 38;
 Label321.Left = 444;
 Label321.Top = 61;
 Label321.Width = 18;
 Label321.Height = 20;
 Label321.Visible = 1;
 Label321.Active = 0;
 Label321.Caption = Label321_Caption;
 Label321.FontName =  0x00005242 ;
 Label321.Font_Color = 0xFFFF;
 Label321.VerticalText = 0;
 Label321.OnUpPtr = 0;
 Label321.OnDownPtr = 0;
 Label321.OnClickPtr = 0;
 Label321.OnPressPtr = 0;

 Label322.OwnerScreen = &SENSOR1;
 Label322.Order = 39;
 Label322.Left = 444;
 Label322.Top = 35;
 Label322.Width = 18;
 Label322.Height = 20;
 Label322.Visible = 1;
 Label322.Active = 0;
 Label322.Caption = Label322_Caption;
 Label322.FontName =  0x00005242 ;
 Label322.Font_Color = 0xFFFF;
 Label322.VerticalText = 0;
 Label322.OnUpPtr = 0;
 Label322.OnDownPtr = 0;
 Label322.OnClickPtr = 0;
 Label322.OnPressPtr = 0;

 SS_tank.OwnerScreen = &SENSOR1;
 SS_tank.Order = 40;
 SS_tank.Left = 391;
 SS_tank.Top = 110;
 SS_tank.Width = 45;
 SS_tank.Height = 23;
 SS_tank.Pen_Width = 1;
 SS_tank.Pen_Color = 0xC618;
 SS_tank.Visible = 1;
 SS_tank.Active = 0;
 SS_tank.Transparent = 1;
 SS_tank.Caption = SS_tank_Caption;
 SS_tank.TextAlign = _taRight;
 SS_tank.TextAlignVertical= _tavMiddle;
 SS_tank.FontName =  0x00005242 ;
 SS_tank.PressColEnabled = 0;
 SS_tank.Font_Color = 0x0000;
 SS_tank.VerticalText = 0;
 SS_tank.Gradient = 0;
 SS_tank.Gradient_Orientation = 0;
 SS_tank.Gradient_Start_Color = 0xFFFF;
 SS_tank.Gradient_End_Color = 0xC618;
 SS_tank.Color = 0xFFFF;
 SS_tank.Press_Color = 0xE71C;
 SS_tank.Corner_Radius = 3;
 SS_tank.OnUpPtr = 0;
 SS_tank.OnDownPtr = 0;
 SS_tank.OnClickPtr = 0;
 SS_tank.OnPressPtr = 0;

 Label12.OwnerScreen = &SENSOR1;
 Label12.Order = 41;
 Label12.Left = 247;
 Label12.Top = 113;
 Label12.Width = 38;
 Label12.Height = 20;
 Label12.Visible = 1;
 Label12.Active = 0;
 Label12.Caption = Label12_Caption;
 Label12.FontName =  0x00005242 ;
 Label12.Font_Color = 0xFFFF;
 Label12.VerticalText = 0;
 Label12.OnUpPtr = 0;
 Label12.OnDownPtr = 0;
 Label12.OnClickPtr = 0;
 Label12.OnPressPtr = 0;

 Label13.OwnerScreen = &SENSOR1;
 Label13.Order = 42;
 Label13.Left = 447;
 Label13.Top = 113;
 Label13.Width = 12;
 Label13.Height = 20;
 Label13.Visible = 1;
 Label13.Active = 0;
 Label13.Caption = Label13_Caption;
 Label13.FontName =  0x00005242 ;
 Label13.Font_Color = 0xFFFF;
 Label13.VerticalText = 0;
 Label13.OnUpPtr = 0;
 Label13.OnDownPtr = 0;
 Label13.OnClickPtr = 0;
 Label13.OnPressPtr = 0;

 Label14.OwnerScreen = &SENSOR1;
 Label14.Order = 43;
 Label14.Left = 439;
 Label14.Top = 108;
 Label14.Width = 7;
 Label14.Height = 20;
 Label14.Visible = 1;
 Label14.Active = 0;
 Label14.Caption = Label14_Caption;
 Label14.FontName =  0x00005242 ;
 Label14.Font_Color = 0xFFFF;
 Label14.VerticalText = 0;
 Label14.OnUpPtr = 0;
 Label14.OnDownPtr = 0;
 Label14.OnClickPtr = 0;
 Label14.OnPressPtr = 0;

 S_condenser_1.OwnerScreen = &SENSOR1;
 S_condenser_1.Order = 44;
 S_condenser_1.Left = 391;
 S_condenser_1.Top = 136;
 S_condenser_1.Width = 45;
 S_condenser_1.Height = 23;
 S_condenser_1.Pen_Width = 1;
 S_condenser_1.Pen_Color = 0xC618;
 S_condenser_1.Visible = 1;
 S_condenser_1.Active = 0;
 S_condenser_1.Transparent = 1;
 S_condenser_1.Caption = S_condenser_1_Caption;
 S_condenser_1.TextAlign = _taRight;
 S_condenser_1.TextAlignVertical= _tavMiddle;
 S_condenser_1.FontName =  0x00005242 ;
 S_condenser_1.PressColEnabled = 0;
 S_condenser_1.Font_Color = 0x0000;
 S_condenser_1.VerticalText = 0;
 S_condenser_1.Gradient = 0;
 S_condenser_1.Gradient_Orientation = 0;
 S_condenser_1.Gradient_Start_Color = 0xFFFF;
 S_condenser_1.Gradient_End_Color = 0xC618;
 S_condenser_1.Color = 0xFFFF;
 S_condenser_1.Press_Color = 0xE71C;
 S_condenser_1.Corner_Radius = 3;
 S_condenser_1.OnUpPtr = 0;
 S_condenser_1.OnDownPtr = 0;
 S_condenser_1.OnClickPtr = 0;
 S_condenser_1.OnPressPtr = 0;

 S_suction_1.OwnerScreen = &SENSOR1;
 S_suction_1.Order = 45;
 S_suction_1.Left = 391;
 S_suction_1.Top = 162;
 S_suction_1.Width = 45;
 S_suction_1.Height = 23;
 S_suction_1.Pen_Width = 1;
 S_suction_1.Pen_Color = 0xC618;
 S_suction_1.Visible = 1;
 S_suction_1.Active = 0;
 S_suction_1.Transparent = 1;
 S_suction_1.Caption = S_suction_1_Caption;
 S_suction_1.TextAlign = _taRight;
 S_suction_1.TextAlignVertical= _tavMiddle;
 S_suction_1.FontName =  0x00005242 ;
 S_suction_1.PressColEnabled = 0;
 S_suction_1.Font_Color = 0x0000;
 S_suction_1.VerticalText = 0;
 S_suction_1.Gradient = 0;
 S_suction_1.Gradient_Orientation = 0;
 S_suction_1.Gradient_Start_Color = 0xFFFF;
 S_suction_1.Gradient_End_Color = 0xC618;
 S_suction_1.Color = 0xFFFF;
 S_suction_1.Press_Color = 0xE71C;
 S_suction_1.Corner_Radius = 3;
 S_suction_1.OnUpPtr = 0;
 S_suction_1.OnDownPtr = 0;
 S_suction_1.OnClickPtr = 0;
 S_suction_1.OnPressPtr = 0;

 Label15.OwnerScreen = &SENSOR1;
 Label15.Order = 46;
 Label15.Left = 439;
 Label15.Top = 136;
 Label15.Width = 7;
 Label15.Height = 20;
 Label15.Visible = 1;
 Label15.Active = 0;
 Label15.Caption = Label15_Caption;
 Label15.FontName =  0x00005242 ;
 Label15.Font_Color = 0xFFFF;
 Label15.VerticalText = 0;
 Label15.OnUpPtr = 0;
 Label15.OnDownPtr = 0;
 Label15.OnClickPtr = 0;
 Label15.OnPressPtr = 0;

 Label17.OwnerScreen = &SENSOR1;
 Label17.Order = 47;
 Label17.Left = 439;
 Label17.Top = 162;
 Label17.Width = 7;
 Label17.Height = 20;
 Label17.Visible = 1;
 Label17.Active = 0;
 Label17.Caption = Label17_Caption;
 Label17.FontName =  0x00005242 ;
 Label17.Font_Color = 0xFFFF;
 Label17.VerticalText = 0;
 Label17.OnUpPtr = 0;
 Label17.OnDownPtr = 0;
 Label17.OnClickPtr = 0;
 Label17.OnPressPtr = 0;

 Label18.OwnerScreen = &SENSOR1;
 Label18.Order = 48;
 Label18.Left = 447;
 Label18.Top = 140;
 Label18.Width = 12;
 Label18.Height = 20;
 Label18.Visible = 1;
 Label18.Active = 0;
 Label18.Caption = Label18_Caption;
 Label18.FontName =  0x00005242 ;
 Label18.Font_Color = 0xFFFF;
 Label18.VerticalText = 0;
 Label18.OnUpPtr = 0;
 Label18.OnDownPtr = 0;
 Label18.OnClickPtr = 0;
 Label18.OnPressPtr = 0;

 Label28.OwnerScreen = &SENSOR1;
 Label28.Order = 49;
 Label28.Left = 447;
 Label28.Top = 167;
 Label28.Width = 12;
 Label28.Height = 20;
 Label28.Visible = 1;
 Label28.Active = 0;
 Label28.Caption = Label28_Caption;
 Label28.FontName =  0x00005242 ;
 Label28.Font_Color = 0xFFFF;
 Label28.VerticalText = 0;
 Label28.OnUpPtr = 0;
 Label28.OnDownPtr = 0;
 Label28.OnClickPtr = 0;
 Label28.OnPressPtr = 0;

 Label31.OwnerScreen = &SENSOR1;
 Label31.Order = 50;
 Label31.Left = 247;
 Label31.Top = 139;
 Label31.Width = 131;
 Label31.Height = 20;
 Label31.Visible = 1;
 Label31.Active = 0;
 Label31.Caption = Label31_Caption;
 Label31.FontName =  0x00005242 ;
 Label31.Font_Color = 0xFFFF;
 Label31.VerticalText = 0;
 Label31.OnUpPtr = 0;
 Label31.OnDownPtr = 0;
 Label31.OnClickPtr = 0;
 Label31.OnPressPtr = 0;

 Label32.OwnerScreen = &SENSOR1;
 Label32.Order = 51;
 Label32.Left = 248;
 Label32.Top = 165;
 Label32.Width = 105;
 Label32.Height = 20;
 Label32.Visible = 1;
 Label32.Active = 0;
 Label32.Caption = Label32_Caption;
 Label32.FontName =  0x00005242 ;
 Label32.Font_Color = 0xFFFF;
 Label32.VerticalText = 0;
 Label32.OnUpPtr = 0;
 Label32.OnDownPtr = 0;
 Label32.OnClickPtr = 0;
 Label32.OnPressPtr = 0;

 Home_b13.OwnerScreen = &SENSOR1;
 Home_b13.Order = 52;
 Home_b13.Left = 202;
 Home_b13.Top = 232;
 Home_b13.Width = 78;
 Home_b13.Height = 35;
 Home_b13.Pen_Width = 1;
 Home_b13.Pen_Color = 0xC618;
 Home_b13.Visible = 1;
 Home_b13.Active = 1;
 Home_b13.Transparent = 1;
 Home_b13.Caption = Home_b13_Caption;
 Home_b13.TextAlign = _taCenter;
 Home_b13.TextAlignVertical= _tavMiddle;
 Home_b13.FontName =  0x00005242 ;
 Home_b13.PressColEnabled = 1;
 Home_b13.Font_Color = 0xD6BA;
 Home_b13.VerticalText = 0;
 Home_b13.Gradient = 1;
 Home_b13.Gradient_Orientation = 0;
 Home_b13.Gradient_Start_Color = 0x0418;
 Home_b13.Gradient_End_Color = 0x00A5;
 Home_b13.Color = 0xC618;
 Home_b13.Press_Color = 0xE71C;
 Home_b13.Corner_Radius = 5;
 Home_b13.OnUpPtr = 0;
 Home_b13.OnDownPtr = 0;
 Home_b13.OnClickPtr = BackToHome;
 Home_b13.OnPressPtr = 0;

 Back_b10.OwnerScreen = &SENSOR1;
 Back_b10.Order = 53;
 Back_b10.Left = 113;
 Back_b10.Top = 232;
 Back_b10.Width = 78;
 Back_b10.Height = 35;
 Back_b10.Pen_Width = 1;
 Back_b10.Pen_Color = 0xC618;
 Back_b10.Visible = 1;
 Back_b10.Active = 1;
 Back_b10.Transparent = 1;
 Back_b10.Caption = Back_b10_Caption;
 Back_b10.TextAlign = _taCenter;
 Back_b10.TextAlignVertical= _tavMiddle;
 Back_b10.FontName =  0x00005242 ;
 Back_b10.PressColEnabled = 1;
 Back_b10.Font_Color = 0xD6BA;
 Back_b10.VerticalText = 0;
 Back_b10.Gradient = 1;
 Back_b10.Gradient_Orientation = 0;
 Back_b10.Gradient_Start_Color = 0x0418;
 Back_b10.Gradient_End_Color = 0x00A5;
 Back_b10.Color = 0xC618;
 Back_b10.Press_Color = 0xE71C;
 Back_b10.Corner_Radius = 5;
 Back_b10.OnUpPtr = 0;
 Back_b10.OnDownPtr = 0;
 Back_b10.OnClickPtr = goToBack;
 Back_b10.OnPressPtr = 0;

 CircleButton10.OwnerScreen = &SENSOR1;
 CircleButton10.Order = 54;
 CircleButton10.Left = 450;
 CircleButton10.Top = 3;
 CircleButton10.Radius = 12;
 CircleButton10.Pen_Width = 1;
 CircleButton10.Pen_Color = 0x0000;
 CircleButton10.Visible = 1;
 CircleButton10.Active = 1;
 CircleButton10.Transparent = 1;
 CircleButton10.Caption = CircleButton10_Caption;
 CircleButton10.TextAlign = _taCenter;
 CircleButton10.TextAlignVertical= _tavMiddle;
 CircleButton10.FontName =  0x00005242 ;
 CircleButton10.PressColEnabled = 1;
 CircleButton10.Font_Color = 0x0000;
 CircleButton10.VerticalText = 0;
 CircleButton10.Gradient = 1;
 CircleButton10.Gradient_Orientation = 0;
 CircleButton10.Gradient_Start_Color = 0xFFFF;
 CircleButton10.Gradient_End_Color = 0xC618;
 CircleButton10.Color = 0xC618;
 CircleButton10.Press_Color = 0xE71C;
 CircleButton10.OnUpPtr = 0;
 CircleButton10.OnDownPtr = 0;
 CircleButton10.OnClickPtr = 0;
 CircleButton10.OnPressPtr = 0;

 S_Low_Pressure_1.OwnerScreen = &SENSOR1;
 S_Low_Pressure_1.Order = 55;
 S_Low_Pressure_1.Left = 391;
 S_Low_Pressure_1.Top = 188;
 S_Low_Pressure_1.Width = 45;
 S_Low_Pressure_1.Height = 23;
 S_Low_Pressure_1.Pen_Width = 1;
 S_Low_Pressure_1.Pen_Color = 0xC618;
 S_Low_Pressure_1.Visible = 1;
 S_Low_Pressure_1.Active = 0;
 S_Low_Pressure_1.Transparent = 1;
 S_Low_Pressure_1.Caption = S_Low_Pressure_1_Caption;
 S_Low_Pressure_1.TextAlign = _taRight;
 S_Low_Pressure_1.TextAlignVertical= _tavMiddle;
 S_Low_Pressure_1.FontName =  0x00005242 ;
 S_Low_Pressure_1.PressColEnabled = 0;
 S_Low_Pressure_1.Font_Color = 0x0418;
 S_Low_Pressure_1.VerticalText = 0;
 S_Low_Pressure_1.Gradient = 0;
 S_Low_Pressure_1.Gradient_Orientation = 0;
 S_Low_Pressure_1.Gradient_Start_Color = 0xFFFF;
 S_Low_Pressure_1.Gradient_End_Color = 0xC618;
 S_Low_Pressure_1.Color = 0xFFFF;
 S_Low_Pressure_1.Press_Color = 0xE71C;
 S_Low_Pressure_1.Corner_Radius = 3;
 S_Low_Pressure_1.OnUpPtr = 0;
 S_Low_Pressure_1.OnDownPtr = 0;
 S_Low_Pressure_1.OnClickPtr = 0;
 S_Low_Pressure_1.OnPressPtr = 0;

 S_High_Pressure_1.OwnerScreen = &SENSOR1;
 S_High_Pressure_1.Order = 56;
 S_High_Pressure_1.Left = 274;
 S_High_Pressure_1.Top = 188;
 S_High_Pressure_1.Width = 45;
 S_High_Pressure_1.Height = 23;
 S_High_Pressure_1.Pen_Width = 1;
 S_High_Pressure_1.Pen_Color = 0xC618;
 S_High_Pressure_1.Visible = 1;
 S_High_Pressure_1.Active = 0;
 S_High_Pressure_1.Transparent = 1;
 S_High_Pressure_1.Caption = S_High_Pressure_1_Caption;
 S_High_Pressure_1.TextAlign = _taRight;
 S_High_Pressure_1.TextAlignVertical= _tavMiddle;
 S_High_Pressure_1.FontName =  0x00005242 ;
 S_High_Pressure_1.PressColEnabled = 0;
 S_High_Pressure_1.Font_Color = 0x06A0;
 S_High_Pressure_1.VerticalText = 0;
 S_High_Pressure_1.Gradient = 0;
 S_High_Pressure_1.Gradient_Orientation = 0;
 S_High_Pressure_1.Gradient_Start_Color = 0xFFFF;
 S_High_Pressure_1.Gradient_End_Color = 0xC618;
 S_High_Pressure_1.Color = 0xFFFF;
 S_High_Pressure_1.Press_Color = 0xE71C;
 S_High_Pressure_1.Corner_Radius = 3;
 S_High_Pressure_1.OnUpPtr = 0;
 S_High_Pressure_1.OnDownPtr = 0;
 S_High_Pressure_1.OnClickPtr = 0;
 S_High_Pressure_1.OnPressPtr = 0;

 Label70.OwnerScreen = &SENSOR1;
 Label70.Order = 57;
 Label70.Left = 248;
 Label70.Top = 190;
 Label70.Width = 24;
 Label70.Height = 20;
 Label70.Visible = 1;
 Label70.Active = 0;
 Label70.Caption = Label70_Caption;
 Label70.FontName =  0x00005242 ;
 Label70.Font_Color = 0xFFFF;
 Label70.VerticalText = 0;
 Label70.OnUpPtr = 0;
 Label70.OnDownPtr = 0;
 Label70.OnClickPtr = 0;
 Label70.OnPressPtr = 0;

 Label72.OwnerScreen = &SENSOR1;
 Label72.Order = 58;
 Label72.Left = 368;
 Label72.Top = 190;
 Label72.Width = 21;
 Label72.Height = 20;
 Label72.Visible = 1;
 Label72.Active = 0;
 Label72.Caption = Label72_Caption;
 Label72.FontName =  0x00005242 ;
 Label72.Font_Color = 0xFFFF;
 Label72.VerticalText = 0;
 Label72.OnUpPtr = 0;
 Label72.OnDownPtr = 0;
 Label72.OnClickPtr = 0;
 Label72.OnPressPtr = 0;

 Next_b6.OwnerScreen = &SENSOR1;
 Next_b6.Order = 59;
 Next_b6.Left = 290;
 Next_b6.Top = 232;
 Next_b6.Width = 78;
 Next_b6.Height = 35;
 Next_b6.Pen_Width = 1;
 Next_b6.Pen_Color = 0xC618;
 Next_b6.Visible = 1;
 Next_b6.Active = 1;
 Next_b6.Transparent = 1;
 Next_b6.Caption = Next_b6_Caption;
 Next_b6.TextAlign = _taCenter;
 Next_b6.TextAlignVertical= _tavMiddle;
 Next_b6.FontName =  0x00005242 ;
 Next_b6.PressColEnabled = 1;
 Next_b6.Font_Color = 0xD6BA;
 Next_b6.VerticalText = 0;
 Next_b6.Gradient = 1;
 Next_b6.Gradient_Orientation = 0;
 Next_b6.Gradient_Start_Color = 0x0418;
 Next_b6.Gradient_End_Color = 0x00A5;
 Next_b6.Color = 0xC618;
 Next_b6.Press_Color = 0xE71C;
 Next_b6.Corner_Radius = 5;
 Next_b6.OnUpPtr = 0;
 Next_b6.OnDownPtr = 0;
 Next_b6.OnClickPtr = nextPage;
 Next_b6.OnPressPtr = 0;

 Label27.OwnerScreen = &SENSOR1;
 Label27.Order = 60;
 Label27.Left = 326;
 Label27.Top = 190;
 Label27.Width = 25;
 Label27.Height = 20;
 Label27.Visible = 1;
 Label27.Active = 0;
 Label27.Caption = Label27_Caption;
 Label27.FontName =  0x00005242 ;
 Label27.Font_Color = 0xFFFF;
 Label27.VerticalText = 0;
 Label27.OnUpPtr = 0;
 Label27.OnDownPtr = 0;
 Label27.OnClickPtr = 0;
 Label27.OnPressPtr = 0;

 Label35.OwnerScreen = &SENSOR1;
 Label35.Order = 61;
 Label35.Left = 444;
 Label35.Top = 190;
 Label35.Width = 25;
 Label35.Height = 20;
 Label35.Visible = 1;
 Label35.Active = 0;
 Label35.Caption = Label35_Caption;
 Label35.FontName =  0x00005242 ;
 Label35.Font_Color = 0xFFFF;
 Label35.VerticalText = 0;
 Label35.OnUpPtr = 0;
 Label35.OnDownPtr = 0;
 Label35.OnClickPtr = 0;
 Label35.OnPressPtr = 0;

 Image192.OwnerScreen = &LIMITS4;
 Image192.Order = 0;
 Image192.Left = 0;
 Image192.Top = 0;
 Image192.Width = 480;
 Image192.Height = 272;
 Image192.Picture_Type = 1;
 Image192.Picture_Ratio = 1;
 Image192.Picture_Name =  0x0022E848 ;
 Image192.Visible = 1;
 Image192.Active = 0;
 Image192.OnUpPtr = 0;
 Image192.OnDownPtr = 0;
 Image192.OnClickPtr = 0;
 Image192.OnPressPtr = 0;

 Image33.OwnerScreen = &LIMITS4;
 Image33.Order = 1;
 Image33.Left = 439;
 Image33.Top = 160;
 Image33.Width = 34;
 Image33.Height = 32;
 Image33.Picture_Type = 1;
 Image33.Picture_Ratio = 1;
 Image33.Picture_Name =  0x0016D51E ;
 Image33.Visible = 1;
 Image33.Active = 0;
 Image33.OnUpPtr = 0;
 Image33.OnDownPtr = 0;
 Image33.OnClickPtr = 0;
 Image33.OnPressPtr = 0;

 Image34.OwnerScreen = &LIMITS4;
 Image34.Order = 2;
 Image34.Left = 439;
 Image34.Top = 127;
 Image34.Width = 34;
 Image34.Height = 32;
 Image34.Picture_Type = 1;
 Image34.Picture_Ratio = 1;
 Image34.Picture_Name =  0x0016D51E ;
 Image34.Visible = 1;
 Image34.Active = 0;
 Image34.OnUpPtr = 0;
 Image34.OnDownPtr = 0;
 Image34.OnClickPtr = 0;
 Image34.OnPressPtr = 0;

 Image266.OwnerScreen = &LIMITS4;
 Image266.Order = 3;
 Image266.Left = 439;
 Image266.Top = 96;
 Image266.Width = 34;
 Image266.Height = 32;
 Image266.Picture_Type = 1;
 Image266.Picture_Ratio = 1;
 Image266.Picture_Name =  0x0016D51E ;
 Image266.Visible = 1;
 Image266.Active = 0;
 Image266.OnUpPtr = 0;
 Image266.OnDownPtr = 0;
 Image266.OnClickPtr = 0;
 Image266.OnPressPtr = 0;

 Image265.OwnerScreen = &LIMITS4;
 Image265.Order = 4;
 Image265.Left = 439;
 Image265.Top = 64;
 Image265.Width = 34;
 Image265.Height = 32;
 Image265.Picture_Type = 1;
 Image265.Picture_Ratio = 1;
 Image265.Picture_Name =  0x0016D51E ;
 Image265.Visible = 1;
 Image265.Active = 0;
 Image265.OnUpPtr = 0;
 Image265.OnDownPtr = 0;
 Image265.OnClickPtr = 0;
 Image265.OnPressPtr = 0;

 Image264.OwnerScreen = &LIMITS4;
 Image264.Order = 5;
 Image264.Left = 439;
 Image264.Top = 32;
 Image264.Width = 34;
 Image264.Height = 32;
 Image264.Picture_Type = 1;
 Image264.Picture_Ratio = 1;
 Image264.Picture_Name =  0x0016D51E ;
 Image264.Visible = 1;
 Image264.Active = 0;
 Image264.OnUpPtr = 0;
 Image264.OnDownPtr = 0;
 Image264.OnClickPtr = 0;
 Image264.OnPressPtr = 0;

 Image243.OwnerScreen = &LIMITS4;
 Image243.Order = 6;
 Image243.Left = 379;
 Image243.Top = 32;
 Image243.Width = 28;
 Image243.Height = 32;
 Image243.Picture_Type = 1;
 Image243.Picture_Ratio = 1;
 Image243.Picture_Name =  0x0016C712 ;
 Image243.Visible = 1;
 Image243.Active = 0;
 Image243.OnUpPtr = 0;
 Image243.OnDownPtr = 0;
 Image243.OnClickPtr = 0;
 Image243.OnPressPtr = 0;

 Image244.OwnerScreen = &LIMITS4;
 Image244.Order = 7;
 Image244.Left = 379;
 Image244.Top = 65;
 Image244.Width = 28;
 Image244.Height = 32;
 Image244.Picture_Type = 1;
 Image244.Picture_Ratio = 1;
 Image244.Picture_Name =  0x0016C712 ;
 Image244.Visible = 1;
 Image244.Active = 0;
 Image244.OnUpPtr = 0;
 Image244.OnDownPtr = 0;
 Image244.OnClickPtr = 0;
 Image244.OnPressPtr = 0;

 Image245.OwnerScreen = &LIMITS4;
 Image245.Order = 8;
 Image245.Left = 379;
 Image245.Top = 96;
 Image245.Width = 28;
 Image245.Height = 32;
 Image245.Picture_Type = 1;
 Image245.Picture_Ratio = 1;
 Image245.Picture_Name =  0x0016C712 ;
 Image245.Visible = 1;
 Image245.Active = 0;
 Image245.OnUpPtr = 0;
 Image245.OnDownPtr = 0;
 Image245.OnClickPtr = 0;
 Image245.OnPressPtr = 0;

 Image24.OwnerScreen = &LIMITS4;
 Image24.Order = 9;
 Image24.Left = 379;
 Image24.Top = 128;
 Image24.Width = 28;
 Image24.Height = 32;
 Image24.Picture_Type = 1;
 Image24.Picture_Ratio = 1;
 Image24.Picture_Name =  0x0016C712 ;
 Image24.Visible = 1;
 Image24.Active = 0;
 Image24.OnUpPtr = 0;
 Image24.OnDownPtr = 0;
 Image24.OnClickPtr = 0;
 Image24.OnPressPtr = 0;

 Home_b14.OwnerScreen = &LIMITS4;
 Home_b14.Order = 10;
 Home_b14.Left = 201;
 Home_b14.Top = 232;
 Home_b14.Width = 78;
 Home_b14.Height = 35;
 Home_b14.Pen_Width = 1;
 Home_b14.Pen_Color = 0xC618;
 Home_b14.Visible = 1;
 Home_b14.Active = 1;
 Home_b14.Transparent = 1;
 Home_b14.Caption = Home_b14_Caption;
 Home_b14.TextAlign = _taCenter;
 Home_b14.TextAlignVertical= _tavMiddle;
 Home_b14.FontName =  0x00005242 ;
 Home_b14.PressColEnabled = 1;
 Home_b14.Font_Color = 0xD6BA;
 Home_b14.VerticalText = 0;
 Home_b14.Gradient = 1;
 Home_b14.Gradient_Orientation = 0;
 Home_b14.Gradient_Start_Color = 0x0418;
 Home_b14.Gradient_End_Color = 0x00A5;
 Home_b14.Color = 0xC618;
 Home_b14.Press_Color = 0xE71C;
 Home_b14.Corner_Radius = 5;
 Home_b14.OnUpPtr = 0;
 Home_b14.OnDownPtr = 0;
 Home_b14.OnClickPtr = BackToHome;
 Home_b14.OnPressPtr = 0;

 Next_b7.OwnerScreen = &LIMITS4;
 Next_b7.Order = 11;
 Next_b7.Left = 290;
 Next_b7.Top = 232;
 Next_b7.Width = 78;
 Next_b7.Height = 35;
 Next_b7.Pen_Width = 1;
 Next_b7.Pen_Color = 0xC618;
 Next_b7.Visible = 1;
 Next_b7.Active = 1;
 Next_b7.Transparent = 1;
 Next_b7.Caption = Next_b7_Caption;
 Next_b7.TextAlign = _taCenter;
 Next_b7.TextAlignVertical= _tavMiddle;
 Next_b7.FontName =  0x00005242 ;
 Next_b7.PressColEnabled = 1;
 Next_b7.Font_Color = 0xD6BA;
 Next_b7.VerticalText = 0;
 Next_b7.Gradient = 1;
 Next_b7.Gradient_Orientation = 0;
 Next_b7.Gradient_Start_Color = 0x0418;
 Next_b7.Gradient_End_Color = 0x00A5;
 Next_b7.Color = 0xC618;
 Next_b7.Press_Color = 0xE71C;
 Next_b7.Corner_Radius = 5;
 Next_b7.OnUpPtr = 0;
 Next_b7.OnDownPtr = 0;
 Next_b7.OnClickPtr = nextPage;
 Next_b7.OnPressPtr = 0;

 Image236.OwnerScreen = &LIMITS4;
 Image236.Order = 12;
 Image236.Left = 409;
 Image236.Top = 32;
 Image236.Width = 28;
 Image236.Height = 32;
 Image236.Picture_Type = 1;
 Image236.Picture_Ratio = 1;
 Image236.Picture_Name =  0x0016CE18 ;
 Image236.Visible = 1;
 Image236.Active = 0;
 Image236.OnUpPtr = 0;
 Image236.OnDownPtr = 0;
 Image236.OnClickPtr = 0;
 Image236.OnPressPtr = 0;

 Image237.OwnerScreen = &LIMITS4;
 Image237.Order = 13;
 Image237.Left = 409;
 Image237.Top = 65;
 Image237.Width = 28;
 Image237.Height = 32;
 Image237.Picture_Type = 1;
 Image237.Picture_Ratio = 1;
 Image237.Picture_Name =  0x0016CE18 ;
 Image237.Visible = 1;
 Image237.Active = 0;
 Image237.OnUpPtr = 0;
 Image237.OnDownPtr = 0;
 Image237.OnClickPtr = 0;
 Image237.OnPressPtr = 0;

 Image238.OwnerScreen = &LIMITS4;
 Image238.Order = 14;
 Image238.Left = 409;
 Image238.Top = 96;
 Image238.Width = 28;
 Image238.Height = 32;
 Image238.Picture_Type = 1;
 Image238.Picture_Ratio = 1;
 Image238.Picture_Name =  0x0016CE18 ;
 Image238.Visible = 1;
 Image238.Active = 0;
 Image238.OnUpPtr = 0;
 Image238.OnDownPtr = 0;
 Image238.OnClickPtr = 0;
 Image238.OnPressPtr = 0;

 Image53.OwnerScreen = &LIMITS4;
 Image53.Order = 15;
 Image53.Left = 409;
 Image53.Top = 128;
 Image53.Width = 28;
 Image53.Height = 32;
 Image53.Picture_Type = 1;
 Image53.Picture_Ratio = 1;
 Image53.Picture_Name =  0x0016CE18 ;
 Image53.Visible = 1;
 Image53.Active = 0;
 Image53.OnUpPtr = 0;
 Image53.OnDownPtr = 0;
 Image53.OnClickPtr = 0;
 Image53.OnPressPtr = 0;

 Image86.OwnerScreen = &LIMITS4;
 Image86.Order = 16;
 Image86.Left = 379;
 Image86.Top = 160;
 Image86.Width = 28;
 Image86.Height = 32;
 Image86.Picture_Type = 1;
 Image86.Picture_Ratio = 1;
 Image86.Picture_Name =  0x0016C712 ;
 Image86.Visible = 1;
 Image86.Active = 0;
 Image86.OnUpPtr = 0;
 Image86.OnDownPtr = 0;
 Image86.OnClickPtr = 0;
 Image86.OnPressPtr = 0;

 Image95.OwnerScreen = &LIMITS4;
 Image95.Order = 17;
 Image95.Left = 409;
 Image95.Top = 160;
 Image95.Width = 28;
 Image95.Height = 32;
 Image95.Picture_Type = 1;
 Image95.Picture_Ratio = 1;
 Image95.Picture_Name =  0x0016CE18 ;
 Image95.Visible = 1;
 Image95.Active = 0;
 Image95.OnUpPtr = 0;
 Image95.OnDownPtr = 0;
 Image95.OnClickPtr = 0;
 Image95.OnPressPtr = 0;

 Set_max_superheat.OwnerScreen = &LIMITS4;
 Set_max_superheat.Order = 18;
 Set_max_superheat.Left = 300;
 Set_max_superheat.Top = 36;
 Set_max_superheat.Width = 40;
 Set_max_superheat.Height = 23;
 Set_max_superheat.Pen_Width = 1;
 Set_max_superheat.Pen_Color = 0x0000;
 Set_max_superheat.Visible = 1;
 Set_max_superheat.Active = 0;
 Set_max_superheat.Transparent = 1;
 Set_max_superheat.Caption = Set_max_superheat_Caption;
 Set_max_superheat.TextAlign = _taCenter;
 Set_max_superheat.TextAlignVertical= _tavMiddle;
 Set_max_superheat.FontName =  0x00005242 ;
 Set_max_superheat.PressColEnabled = 1;
 Set_max_superheat.Font_Color = 0x0408;
 Set_max_superheat.VerticalText = 0;
 Set_max_superheat.Gradient = 0;
 Set_max_superheat.Gradient_Orientation = 0;
 Set_max_superheat.Gradient_Start_Color = 0xFFFF;
 Set_max_superheat.Gradient_End_Color = 0xC618;
 Set_max_superheat.Color = 0xFFFF;
 Set_max_superheat.Press_Color = 0xE71C;
 Set_max_superheat.Corner_Radius = 2;
 Set_max_superheat.OnUpPtr = 0;
 Set_max_superheat.OnDownPtr = 0;
 Set_max_superheat.OnClickPtr = 0;
 Set_max_superheat.OnPressPtr = 0;

 Set_min_subcooling.OwnerScreen = &LIMITS4;
 Set_min_subcooling.Order = 19;
 Set_min_subcooling.Left = 300;
 Set_min_subcooling.Top = 68;
 Set_min_subcooling.Width = 40;
 Set_min_subcooling.Height = 23;
 Set_min_subcooling.Pen_Width = 1;
 Set_min_subcooling.Pen_Color = 0x0000;
 Set_min_subcooling.Visible = 1;
 Set_min_subcooling.Active = 0;
 Set_min_subcooling.Transparent = 1;
 Set_min_subcooling.Caption = Set_min_subcooling_Caption;
 Set_min_subcooling.TextAlign = _taCenter;
 Set_min_subcooling.TextAlignVertical= _tavMiddle;
 Set_min_subcooling.FontName =  0x00005242 ;
 Set_min_subcooling.PressColEnabled = 1;
 Set_min_subcooling.Font_Color = 0x0408;
 Set_min_subcooling.VerticalText = 0;
 Set_min_subcooling.Gradient = 0;
 Set_min_subcooling.Gradient_Orientation = 0;
 Set_min_subcooling.Gradient_Start_Color = 0xFFFF;
 Set_min_subcooling.Gradient_End_Color = 0xC618;
 Set_min_subcooling.Color = 0xFFFF;
 Set_min_subcooling.Press_Color = 0xE71C;
 Set_min_subcooling.Corner_Radius = 2;
 Set_min_subcooling.OnUpPtr = 0;
 Set_min_subcooling.OnDownPtr = 0;
 Set_min_subcooling.OnClickPtr = 0;
 Set_min_subcooling.OnPressPtr = 0;

 Set_max_subcooling.OwnerScreen = &LIMITS4;
 Set_max_subcooling.Order = 20;
 Set_max_subcooling.Left = 300;
 Set_max_subcooling.Top = 100;
 Set_max_subcooling.Width = 40;
 Set_max_subcooling.Height = 23;
 Set_max_subcooling.Pen_Width = 1;
 Set_max_subcooling.Pen_Color = 0x0000;
 Set_max_subcooling.Visible = 1;
 Set_max_subcooling.Active = 0;
 Set_max_subcooling.Transparent = 1;
 Set_max_subcooling.Caption = Set_max_subcooling_Caption;
 Set_max_subcooling.TextAlign = _taCenter;
 Set_max_subcooling.TextAlignVertical= _tavMiddle;
 Set_max_subcooling.FontName =  0x00005242 ;
 Set_max_subcooling.PressColEnabled = 1;
 Set_max_subcooling.Font_Color = 0x0408;
 Set_max_subcooling.VerticalText = 0;
 Set_max_subcooling.Gradient = 0;
 Set_max_subcooling.Gradient_Orientation = 0;
 Set_max_subcooling.Gradient_Start_Color = 0xFFFF;
 Set_max_subcooling.Gradient_End_Color = 0xC618;
 Set_max_subcooling.Color = 0xFFFF;
 Set_max_subcooling.Press_Color = 0xE71C;
 Set_max_subcooling.Corner_Radius = 2;
 Set_max_subcooling.OnUpPtr = 0;
 Set_max_subcooling.OnDownPtr = 0;
 Set_max_subcooling.OnClickPtr = 0;
 Set_max_subcooling.OnPressPtr = 0;

 Set_max_high_pressure.OwnerScreen = &LIMITS4;
 Set_max_high_pressure.Order = 21;
 Set_max_high_pressure.Left = 299;
 Set_max_high_pressure.Top = 131;
 Set_max_high_pressure.Width = 41;
 Set_max_high_pressure.Height = 24;
 Set_max_high_pressure.Pen_Width = 1;
 Set_max_high_pressure.Pen_Color = 0x0000;
 Set_max_high_pressure.Visible = 1;
 Set_max_high_pressure.Active = 0;
 Set_max_high_pressure.Transparent = 1;
 Set_max_high_pressure.Caption = Set_max_high_pressure_Caption;
 Set_max_high_pressure.TextAlign = _taCenter;
 Set_max_high_pressure.TextAlignVertical= _tavMiddle;
 Set_max_high_pressure.FontName =  0x00005242 ;
 Set_max_high_pressure.PressColEnabled = 1;
 Set_max_high_pressure.Font_Color = 0x0408;
 Set_max_high_pressure.VerticalText = 0;
 Set_max_high_pressure.Gradient = 0;
 Set_max_high_pressure.Gradient_Orientation = 0;
 Set_max_high_pressure.Gradient_Start_Color = 0xFFFF;
 Set_max_high_pressure.Gradient_End_Color = 0xC618;
 Set_max_high_pressure.Color = 0xFFFF;
 Set_max_high_pressure.Press_Color = 0xE71C;
 Set_max_high_pressure.Corner_Radius = 2;
 Set_max_high_pressure.OnUpPtr = 0;
 Set_max_high_pressure.OnDownPtr = 0;
 Set_max_high_pressure.OnClickPtr = 0;
 Set_max_high_pressure.OnPressPtr = 0;

 Set_min_lhigh_pressure.OwnerScreen = &LIMITS4;
 Set_min_lhigh_pressure.Order = 22;
 Set_min_lhigh_pressure.Left = 300;
 Set_min_lhigh_pressure.Top = 164;
 Set_min_lhigh_pressure.Width = 40;
 Set_min_lhigh_pressure.Height = 23;
 Set_min_lhigh_pressure.Pen_Width = 1;
 Set_min_lhigh_pressure.Pen_Color = 0x0000;
 Set_min_lhigh_pressure.Visible = 1;
 Set_min_lhigh_pressure.Active = 0;
 Set_min_lhigh_pressure.Transparent = 1;
 Set_min_lhigh_pressure.Caption = Set_min_lhigh_pressure_Caption;
 Set_min_lhigh_pressure.TextAlign = _taCenter;
 Set_min_lhigh_pressure.TextAlignVertical= _tavMiddle;
 Set_min_lhigh_pressure.FontName =  0x00005242 ;
 Set_min_lhigh_pressure.PressColEnabled = 1;
 Set_min_lhigh_pressure.Font_Color = 0x0408;
 Set_min_lhigh_pressure.VerticalText = 0;
 Set_min_lhigh_pressure.Gradient = 0;
 Set_min_lhigh_pressure.Gradient_Orientation = 0;
 Set_min_lhigh_pressure.Gradient_Start_Color = 0xFFFF;
 Set_min_lhigh_pressure.Gradient_End_Color = 0xC618;
 Set_min_lhigh_pressure.Color = 0xFFFF;
 Set_min_lhigh_pressure.Press_Color = 0xE71C;
 Set_min_lhigh_pressure.Corner_Radius = 2;
 Set_min_lhigh_pressure.OnUpPtr = 0;
 Set_min_lhigh_pressure.OnDownPtr = 0;
 Set_min_lhigh_pressure.OnClickPtr = 0;
 Set_min_lhigh_pressure.OnPressPtr = 0;

 Seeting4_label.OwnerScreen = &LIMITS4;
 Seeting4_label.Order = 23;
 Seeting4_label.Left = 206;
 Seeting4_label.Top = 5;
 Seeting4_label.Width = 85;
 Seeting4_label.Height = 20;
 Seeting4_label.Visible = 1;
 Seeting4_label.Active = 0;
 Seeting4_label.Caption = Seeting4_label_Caption;
 Seeting4_label.FontName =  0x00005242 ;
 Seeting4_label.Font_Color = 0xE7FC;
 Seeting4_label.VerticalText = 0;
 Seeting4_label.OnUpPtr = 0;
 Seeting4_label.OnDownPtr = 0;
 Seeting4_label.OnClickPtr = 0;
 Seeting4_label.OnPressPtr = 0;

 CircleButton4.OwnerScreen = &LIMITS4;
 CircleButton4.Order = 24;
 CircleButton4.Left = 450;
 CircleButton4.Top = 3;
 CircleButton4.Radius = 12;
 CircleButton4.Pen_Width = 1;
 CircleButton4.Pen_Color = 0x0000;
 CircleButton4.Visible = 1;
 CircleButton4.Active = 0;
 CircleButton4.Transparent = 1;
 CircleButton4.Caption = CircleButton4_Caption;
 CircleButton4.TextAlign = _taCenter;
 CircleButton4.TextAlignVertical= _tavMiddle;
 CircleButton4.FontName =  0x00005242 ;
 CircleButton4.PressColEnabled = 1;
 CircleButton4.Font_Color = 0x0000;
 CircleButton4.VerticalText = 0;
 CircleButton4.Gradient = 1;
 CircleButton4.Gradient_Orientation = 0;
 CircleButton4.Gradient_Start_Color = 0xFFFF;
 CircleButton4.Gradient_End_Color = 0xC618;
 CircleButton4.Color = 0xC618;
 CircleButton4.Press_Color = 0xE71C;
 CircleButton4.OnUpPtr = 0;
 CircleButton4.OnDownPtr = 0;
 CircleButton4.OnClickPtr = 0;
 CircleButton4.OnPressPtr = 0;

 Back_b11.OwnerScreen = &LIMITS4;
 Back_b11.Order = 25;
 Back_b11.Left = 112;
 Back_b11.Top = 231;
 Back_b11.Width = 78;
 Back_b11.Height = 35;
 Back_b11.Pen_Width = 1;
 Back_b11.Pen_Color = 0xC618;
 Back_b11.Visible = 1;
 Back_b11.Active = 1;
 Back_b11.Transparent = 1;
 Back_b11.Caption = Back_b11_Caption;
 Back_b11.TextAlign = _taCenter;
 Back_b11.TextAlignVertical= _tavMiddle;
 Back_b11.FontName =  0x00005242 ;
 Back_b11.PressColEnabled = 1;
 Back_b11.Font_Color = 0xD6BA;
 Back_b11.VerticalText = 0;
 Back_b11.Gradient = 1;
 Back_b11.Gradient_Orientation = 0;
 Back_b11.Gradient_Start_Color = 0x0418;
 Back_b11.Gradient_End_Color = 0x00A5;
 Back_b11.Color = 0xC618;
 Back_b11.Press_Color = 0xE71C;
 Back_b11.Corner_Radius = 5;
 Back_b11.OnUpPtr = 0;
 Back_b11.OnDownPtr = 0;
 Back_b11.OnClickPtr = goToBack;
 Back_b11.OnPressPtr = 0;

 Label390.OwnerScreen = &LIMITS4;
 Label390.Order = 26;
 Label390.Left = 371;
 Label390.Top = 186;
 Label390.Width = 4;
 Label390.Height = 11;
 Label390.Visible = 0;
 Label390.Active = 1;
 Label390.Caption = Label390_Caption;
 Label390.FontName =  0x0003B7D7 ;
 Label390.Font_Color = 0x0000;
 Label390.VerticalText = 0;
 Label390.OnUpPtr = 0;
 Label390.OnDownPtr = 0;
 Label390.OnClickPtr = 0;
 Label390.OnPressPtr = 0;

 Down_21_.OwnerScreen = &LIMITS4;
 Down_21_.Order = 27;
 Down_21_.Left = 379;
 Down_21_.Top = 96;
 Down_21_.Width = 28;
 Down_21_.Height = 32;
 Down_21_.Picture_Type = 1;
 Down_21_.Picture_Ratio = 1;
 Down_21_.Picture_Name =  0x0016ED30 ;
 Down_21_.Visible = 1;
 Down_21_.Active = 1;
 Down_21_.OnUpPtr = Down_21_OnUp;
 Down_21_.OnDownPtr = 0;
 Down_21_.OnClickPtr = 0;
 Down_21_.OnPressPtr = Down_21_OnPress;

 Down_20_.OwnerScreen = &LIMITS4;
 Down_20_.Order = 28;
 Down_20_.Left = 379;
 Down_20_.Top = 64;
 Down_20_.Width = 28;
 Down_20_.Height = 32;
 Down_20_.Picture_Type = 1;
 Down_20_.Picture_Ratio = 1;
 Down_20_.Picture_Name =  0x0016ED30 ;
 Down_20_.Visible = 1;
 Down_20_.Active = 1;
 Down_20_.OnUpPtr = Down_20_OnUp;
 Down_20_.OnDownPtr = 0;
 Down_20_.OnClickPtr = 0;
 Down_20_.OnPressPtr = Down_20_OnPress;

 Down_19_.OwnerScreen = &LIMITS4;
 Down_19_.Order = 29;
 Down_19_.Left = 379;
 Down_19_.Top = 32;
 Down_19_.Width = 28;
 Down_19_.Height = 32;
 Down_19_.Picture_Type = 1;
 Down_19_.Picture_Ratio = 1;
 Down_19_.Picture_Name =  0x0016ED30 ;
 Down_19_.Visible = 1;
 Down_19_.Active = 1;
 Down_19_.OnUpPtr = Down_19_OnUp;
 Down_19_.OnDownPtr = 0;
 Down_19_.OnClickPtr = 0;
 Down_19_.OnPressPtr = Down_19_OnPress;

 Down_22_.OwnerScreen = &LIMITS4;
 Down_22_.Order = 30;
 Down_22_.Left = 379;
 Down_22_.Top = 128;
 Down_22_.Width = 28;
 Down_22_.Height = 32;
 Down_22_.Picture_Type = 1;
 Down_22_.Picture_Ratio = 1;
 Down_22_.Picture_Name =  0x0016ED30 ;
 Down_22_.Visible = 1;
 Down_22_.Active = 1;
 Down_22_.OnUpPtr = Down_22_OnUp;
 Down_22_.OnDownPtr = 0;
 Down_22_.OnClickPtr = 0;
 Down_22_.OnPressPtr = Down_22_OnPress;

 Down_23_.OwnerScreen = &LIMITS4;
 Down_23_.Order = 31;
 Down_23_.Left = 379;
 Down_23_.Top = 160;
 Down_23_.Width = 28;
 Down_23_.Height = 32;
 Down_23_.Picture_Type = 1;
 Down_23_.Picture_Ratio = 1;
 Down_23_.Picture_Name =  0x0016ED30 ;
 Down_23_.Visible = 1;
 Down_23_.Active = 1;
 Down_23_.OnUpPtr = Down_23_OnUp;
 Down_23_.OnDownPtr = 0;
 Down_23_.OnClickPtr = 0;
 Down_23_.OnPressPtr = Down_23_OnPress;

 Up_22_.OwnerScreen = &LIMITS4;
 Up_22_.Order = 32;
 Up_22_.Left = 409;
 Up_22_.Top = 128;
 Up_22_.Width = 28;
 Up_22_.Height = 32;
 Up_22_.Picture_Type = 1;
 Up_22_.Picture_Ratio = 1;
 Up_22_.Picture_Name =  0x0016DDA4 ;
 Up_22_.Visible = 1;
 Up_22_.Active = 1;
 Up_22_.OnUpPtr = Up_22_OnUp;
 Up_22_.OnDownPtr = 0;
 Up_22_.OnClickPtr = 0;
 Up_22_.OnPressPtr = Up_22_OnPress;

 Up_21_.OwnerScreen = &LIMITS4;
 Up_21_.Order = 33;
 Up_21_.Left = 409;
 Up_21_.Top = 96;
 Up_21_.Width = 28;
 Up_21_.Height = 32;
 Up_21_.Picture_Type = 1;
 Up_21_.Picture_Ratio = 1;
 Up_21_.Picture_Name =  0x0016DDA4 ;
 Up_21_.Visible = 1;
 Up_21_.Active = 1;
 Up_21_.OnUpPtr = Up_21_OnUp;
 Up_21_.OnDownPtr = 0;
 Up_21_.OnClickPtr = 0;
 Up_21_.OnPressPtr = Up_21_OnPress;

 Up_20_.OwnerScreen = &LIMITS4;
 Up_20_.Order = 34;
 Up_20_.Left = 409;
 Up_20_.Top = 64;
 Up_20_.Width = 28;
 Up_20_.Height = 32;
 Up_20_.Picture_Type = 1;
 Up_20_.Picture_Ratio = 1;
 Up_20_.Picture_Name =  0x0016DDA4 ;
 Up_20_.Visible = 1;
 Up_20_.Active = 1;
 Up_20_.OnUpPtr = Up_20_OnUp;
 Up_20_.OnDownPtr = 0;
 Up_20_.OnClickPtr = 0;
 Up_20_.OnPressPtr = Up_20_OnPress;

 Up_19_.OwnerScreen = &LIMITS4;
 Up_19_.Order = 35;
 Up_19_.Left = 409;
 Up_19_.Top = 32;
 Up_19_.Width = 28;
 Up_19_.Height = 32;
 Up_19_.Picture_Type = 1;
 Up_19_.Picture_Ratio = 1;
 Up_19_.Picture_Name =  0x0016DDA4 ;
 Up_19_.Visible = 1;
 Up_19_.Active = 1;
 Up_19_.OnUpPtr = Up_19_OnUp;
 Up_19_.OnDownPtr = 0;
 Up_19_.OnClickPtr = 0;
 Up_19_.OnPressPtr = Up_19_OnPress;

 Up_23_.OwnerScreen = &LIMITS4;
 Up_23_.Order = 36;
 Up_23_.Left = 409;
 Up_23_.Top = 160;
 Up_23_.Width = 28;
 Up_23_.Height = 32;
 Up_23_.Picture_Type = 1;
 Up_23_.Picture_Ratio = 1;
 Up_23_.Picture_Name =  0x0016DDA4 ;
 Up_23_.Visible = 1;
 Up_23_.Active = 1;
 Up_23_.OnUpPtr = Up_23_OnUp;
 Up_23_.OnDownPtr = 0;
 Up_23_.OnClickPtr = 0;
 Up_23_.OnPressPtr = Up_23_OnPress;

 Set_22_.OwnerScreen = &LIMITS4;
 Set_22_.Order = 37;
 Set_22_.Left = 439;
 Set_22_.Top = 128;
 Set_22_.Width = 34;
 Set_22_.Height = 32;
 Set_22_.Picture_Type = 1;
 Set_22_.Picture_Ratio = 1;
 Set_22_.Picture_Name =  0x0016E4AA ;
 Set_22_.Visible = 1;
 Set_22_.Active = 1;
 Set_22_.OnUpPtr = Set_22_OnUp;
 Set_22_.OnDownPtr = Set_22_OnDown;
 Set_22_.OnClickPtr = 0;
 Set_22_.OnPressPtr = 0;

 Set_21_.OwnerScreen = &LIMITS4;
 Set_21_.Order = 38;
 Set_21_.Left = 439;
 Set_21_.Top = 96;
 Set_21_.Width = 34;
 Set_21_.Height = 32;
 Set_21_.Picture_Type = 1;
 Set_21_.Picture_Ratio = 1;
 Set_21_.Picture_Name =  0x0016E4AA ;
 Set_21_.Visible = 1;
 Set_21_.Active = 1;
 Set_21_.OnUpPtr = Set_21_OnUp;
 Set_21_.OnDownPtr = Set_21_OnDown;
 Set_21_.OnClickPtr = 0;
 Set_21_.OnPressPtr = 0;

 Set_20_.OwnerScreen = &LIMITS4;
 Set_20_.Order = 39;
 Set_20_.Left = 439;
 Set_20_.Top = 64;
 Set_20_.Width = 34;
 Set_20_.Height = 32;
 Set_20_.Picture_Type = 1;
 Set_20_.Picture_Ratio = 1;
 Set_20_.Picture_Name =  0x0016E4AA ;
 Set_20_.Visible = 1;
 Set_20_.Active = 1;
 Set_20_.OnUpPtr = Set_20_OnUp;
 Set_20_.OnDownPtr = Set_20_OnDown;
 Set_20_.OnClickPtr = 0;
 Set_20_.OnPressPtr = 0;

 Set_19_.OwnerScreen = &LIMITS4;
 Set_19_.Order = 40;
 Set_19_.Left = 439;
 Set_19_.Top = 32;
 Set_19_.Width = 34;
 Set_19_.Height = 32;
 Set_19_.Picture_Type = 1;
 Set_19_.Picture_Ratio = 1;
 Set_19_.Picture_Name =  0x0016E4AA ;
 Set_19_.Visible = 1;
 Set_19_.Active = 1;
 Set_19_.OnUpPtr = Set_19_OnUp;
 Set_19_.OnDownPtr = Set_19_OnDown;
 Set_19_.OnClickPtr = 0;
 Set_19_.OnPressPtr = 0;

 Set_23_.OwnerScreen = &LIMITS4;
 Set_23_.Order = 41;
 Set_23_.Left = 439;
 Set_23_.Top = 160;
 Set_23_.Width = 34;
 Set_23_.Height = 32;
 Set_23_.Picture_Type = 1;
 Set_23_.Picture_Ratio = 1;
 Set_23_.Picture_Name =  0x0016E4AA ;
 Set_23_.Visible = 1;
 Set_23_.Active = 1;
 Set_23_.OnUpPtr = Set_23_OnUp;
 Set_23_.OnDownPtr = Set_23_OnDown;
 Set_23_.OnClickPtr = 0;
 Set_23_.OnPressPtr = 0;

 Image1.OwnerScreen = &DEVICES;
 Image1.Order = 1;
 Image1.Left = 93;
 Image1.Top = 43;
 Image1.Width = 58;
 Image1.Height = 59;
 Image1.Picture_Type = 1;
 Image1.Picture_Ratio = 1;
 Image1.Picture_Name =  0x0026E44E ;
 Image1.Visible = 0;
 Image1.Active = 0;
 Image1.OnUpPtr = 0;
 Image1.OnDownPtr = 0;
 Image1.OnClickPtr = 0;
 Image1.OnPressPtr = 0;

 Image4.OwnerScreen = &DEVICES;
 Image4.Order = 2;
 Image4.Left = 172;
 Image4.Top = 139;
 Image4.Width = 61;
 Image4.Height = 59;
 Image4.Picture_Type = 1;
 Image4.Picture_Ratio = 1;
 Image4.Picture_Name =  0x0026FF10 ;
 Image4.Visible = 0;
 Image4.Active = 0;
 Image4.OnUpPtr = 0;
 Image4.OnDownPtr = 0;
 Image4.OnClickPtr = 0;
 Image4.OnPressPtr = 0;

 Image98.OwnerScreen = &DEVICES;
 Image98.Order = 3;
 Image98.Left = 410;
 Image98.Top = 139;
 Image98.Width = 53;
 Image98.Height = 59;
 Image98.Picture_Type = 1;
 Image98.Picture_Ratio = 1;
 Image98.Picture_Name =  0x00271B34 ;
 Image98.Visible = 0;
 Image98.Active = 0;
 Image98.OnUpPtr = 0;
 Image98.OnDownPtr = 0;
 Image98.OnClickPtr = 0;
 Image98.OnPressPtr = 0;

 Image94.OwnerScreen = &DEVICES;
 Image94.Order = 4;
 Image94.Left = 328;
 Image94.Top = 139;
 Image94.Width = 60;
 Image94.Height = 59;
 Image94.Picture_Type = 1;
 Image94.Picture_Ratio = 1;
 Image94.Picture_Name =  0x002733A8 ;
 Image94.Visible = 0;
 Image94.Active = 0;
 Image94.OnUpPtr = 0;
 Image94.OnDownPtr = 0;
 Image94.OnClickPtr = 0;
 Image94.OnPressPtr = 0;

 Image68.OwnerScreen = &DEVICES;
 Image68.Order = 5;
 Image68.Left = 252;
 Image68.Top = 139;
 Image68.Width = 55;
 Image68.Height = 59;
 Image68.Picture_Type = 1;
 Image68.Picture_Ratio = 1;
 Image68.Picture_Name =  0x00274F56 ;
 Image68.Visible = 0;
 Image68.Active = 0;
 Image68.OnUpPtr = 0;
 Image68.OnDownPtr = 0;
 Image68.OnClickPtr = 0;
 Image68.OnPressPtr = 0;

 Image67.OwnerScreen = &DEVICES;
 Image67.Order = 6;
 Image67.Left = 178;
 Image67.Top = 139;
 Image67.Width = 55;
 Image67.Height = 59;
 Image67.Picture_Type = 1;
 Image67.Picture_Ratio = 1;
 Image67.Picture_Name =  0x002768B6 ;
 Image67.Visible = 0;
 Image67.Active = 0;
 Image67.OnUpPtr = 0;
 Image67.OnDownPtr = 0;
 Image67.OnClickPtr = 0;
 Image67.OnPressPtr = 0;

 Image66.OwnerScreen = &DEVICES;
 Image66.Order = 7;
 Image66.Left = 107;
 Image66.Top = 138;
 Image66.Width = 35;
 Image66.Height = 59;
 Image66.Picture_Type = 1;
 Image66.Picture_Ratio = 1;
 Image66.Picture_Name =  0x00278216 ;
 Image66.Visible = 0;
 Image66.Active = 0;
 Image66.OnUpPtr = 0;
 Image66.OnDownPtr = 0;
 Image66.OnClickPtr = 0;
 Image66.OnPressPtr = 0;

 Image65.OwnerScreen = &DEVICES;
 Image65.Order = 8;
 Image65.Left = 26;
 Image65.Top = 139;
 Image65.Width = 43;
 Image65.Height = 59;
 Image65.Picture_Type = 1;
 Image65.Picture_Ratio = 1;
 Image65.Picture_Name =  0x0027923E ;
 Image65.Visible = 1;
 Image65.Active = 0;
 Image65.OnUpPtr = 0;
 Image65.OnDownPtr = 0;
 Image65.OnClickPtr = 0;
 Image65.OnPressPtr = 0;

 Image64.OwnerScreen = &DEVICES;
 Image64.Order = 9;
 Image64.Left = 411;
 Image64.Top = 44;
 Image64.Width = 53;
 Image64.Height = 58;
 Image64.Picture_Type = 1;
 Image64.Picture_Ratio = 1;
 Image64.Picture_Name =  0x0027A616 ;
 Image64.Visible = 1;
 Image64.Active = 0;
 Image64.OnUpPtr = 0;
 Image64.OnDownPtr = 0;
 Image64.OnClickPtr = 0;
 Image64.OnPressPtr = 0;

 Image36.OwnerScreen = &DEVICES;
 Image36.Order = 10;
 Image36.Left = 330;
 Image36.Top = 44;
 Image36.Width = 54;
 Image36.Height = 58;
 Image36.Picture_Type = 1;
 Image36.Picture_Ratio = 1;
 Image36.Picture_Name =  0x0027BE20 ;
 Image36.Visible = 1;
 Image36.Active = 0;
 Image36.OnUpPtr = 0;
 Image36.OnDownPtr = 0;
 Image36.OnClickPtr = 0;
 Image36.OnPressPtr = 0;

 Image35.OwnerScreen = &DEVICES;
 Image35.Order = 11;
 Image35.Left = 250;
 Image35.Top = 44;
 Image35.Width = 56;
 Image35.Height = 58;
 Image35.Picture_Type = 1;
 Image35.Picture_Ratio = 1;
 Image35.Picture_Name =  0x0027D69E ;
 Image35.Visible = 1;
 Image35.Active = 0;
 Image35.OnUpPtr = 0;
 Image35.OnDownPtr = 0;
 Image35.OnClickPtr = 0;
 Image35.OnPressPtr = 0;

 Image19.OwnerScreen = &DEVICES;
 Image19.Order = 12;
 Image19.Left = 177;
 Image19.Top = 44;
 Image19.Width = 54;
 Image19.Height = 58;
 Image19.Picture_Type = 1;
 Image19.Picture_Ratio = 1;
 Image19.Picture_Name =  0x0027F004 ;
 Image19.Visible = 1;
 Image19.Active = 0;
 Image19.OnUpPtr = 0;
 Image19.OnDownPtr = 0;
 Image19.OnClickPtr = 0;
 Image19.OnPressPtr = 0;

 Image9.OwnerScreen = &DEVICES;
 Image9.Order = 13;
 Image9.Left = 95;
 Image9.Top = 44;
 Image9.Width = 54;
 Image9.Height = 58;
 Image9.Picture_Type = 1;
 Image9.Picture_Ratio = 1;
 Image9.Picture_Name =  0x00280882 ;
 Image9.Visible = 1;
 Image9.Active = 0;
 Image9.OnUpPtr = 0;
 Image9.OnDownPtr = 0;
 Image9.OnClickPtr = 0;
 Image9.OnPressPtr = 0;

 Image8.OwnerScreen = &DEVICES;
 Image8.Order = 14;
 Image8.Left = 33;
 Image8.Top = 44;
 Image8.Width = 35;
 Image8.Height = 58;
 Image8.Picture_Type = 1;
 Image8.Picture_Ratio = 1;
 Image8.Picture_Name =  0x00282100 ;
 Image8.Visible = 1;
 Image8.Active = 0;
 Image8.OnUpPtr = 0;
 Image8.OnDownPtr = 0;
 Image8.OnClickPtr = 0;
 Image8.OnPressPtr = 0;

 D_Source_1.OwnerScreen = &DEVICES;
 D_Source_1.Order = 15;
 D_Source_1.Left = 95;
 D_Source_1.Top = 44;
 D_Source_1.Width = 54;
 D_Source_1.Height = 58;
 D_Source_1.Picture_Type = 1;
 D_Source_1.Picture_Ratio = 1;
 D_Source_1.Picture_Name =  0x002830E2 ;
 D_Source_1.Visible = 0;
 D_Source_1.Active = 0;
 D_Source_1.OnUpPtr = 0;
 D_Source_1.OnDownPtr = 0;
 D_Source_1.OnClickPtr = 0;
 D_Source_1.OnPressPtr = 0;

 D_Heating_1.OwnerScreen = &DEVICES;
 D_Heating_1.Order = 16;
 D_Heating_1.Left = 175;
 D_Heating_1.Top = 44;
 D_Heating_1.Width = 54;
 D_Heating_1.Height = 58;
 D_Heating_1.Picture_Type = 1;
 D_Heating_1.Picture_Ratio = 1;
 D_Heating_1.Picture_Name =  0x00284960 ;
 D_Heating_1.Visible = 0;
 D_Heating_1.Active = 0;
 D_Heating_1.OnUpPtr = 0;
 D_Heating_1.OnDownPtr = 0;
 D_Heating_1.OnClickPtr = 0;
 D_Heating_1.OnPressPtr = 0;

 D_Reverse_1.OwnerScreen = &DEVICES;
 D_Reverse_1.Order = 17;
 D_Reverse_1.Left = 250;
 D_Reverse_1.Top = 44;
 D_Reverse_1.Width = 56;
 D_Reverse_1.Height = 58;
 D_Reverse_1.Picture_Type = 1;
 D_Reverse_1.Picture_Ratio = 1;
 D_Reverse_1.Picture_Name =  0x002861DE ;
 D_Reverse_1.Visible = 0;
 D_Reverse_1.Active = 0;
 D_Reverse_1.OnUpPtr = 0;
 D_Reverse_1.OnDownPtr = 0;
 D_Reverse_1.OnClickPtr = 0;
 D_Reverse_1.OnPressPtr = 0;

 D_Compr_1.OwnerScreen = &DEVICES;
 D_Compr_1.Order = 18;
 D_Compr_1.Left = 30;
 D_Compr_1.Top = 44;
 D_Compr_1.Width = 35;
 D_Compr_1.Height = 58;
 D_Compr_1.Picture_Type = 1;
 D_Compr_1.Picture_Ratio = 1;
 D_Compr_1.Picture_Name =  0x00287B44 ;
 D_Compr_1.Visible = 0;
 D_Compr_1.Active = 0;
 D_Compr_1.OnUpPtr = 0;
 D_Compr_1.OnDownPtr = 0;
 D_Compr_1.OnClickPtr = 0;
 D_Compr_1.OnPressPtr = 0;

 D_DHW.OwnerScreen = &DEVICES;
 D_DHW.Order = 19;
 D_DHW.Left = 331;
 D_DHW.Top = 44;
 D_DHW.Width = 54;
 D_DHW.Height = 58;
 D_DHW.Picture_Type = 1;
 D_DHW.Picture_Ratio = 1;
 D_DHW.Picture_Name =  0x00288B26 ;
 D_DHW.Visible = 0;
 D_DHW.Active = 0;
 D_DHW.OnUpPtr = 0;
 D_DHW.OnDownPtr = 0;
 D_DHW.OnClickPtr = 0;
 D_DHW.OnPressPtr = 0;

 Device_label.OwnerScreen = &DEVICES;
 Device_label.Order = 20;
 Device_label.Left = 210;
 Device_label.Top = 5;
 Device_label.Width = 75;
 Device_label.Height = 20;
 Device_label.Visible = 1;
 Device_label.Active = 0;
 Device_label.Caption = Device_label_Caption;
 Device_label.FontName =  0x00005242 ;
 Device_label.Font_Color = 0xE7FC;
 Device_label.VerticalText = 0;
 Device_label.OnUpPtr = 0;
 Device_label.OnDownPtr = 0;
 Device_label.OnClickPtr = 0;
 Device_label.OnPressPtr = 0;

 D_Electric.OwnerScreen = &DEVICES;
 D_Electric.Order = 21;
 D_Electric.Left = 409;
 D_Electric.Top = 44;
 D_Electric.Width = 53;
 D_Electric.Height = 58;
 D_Electric.Picture_Type = 1;
 D_Electric.Picture_Ratio = 1;
 D_Electric.Picture_Name =  0x0028A3A4 ;
 D_Electric.Visible = 0;
 D_Electric.Active = 0;
 D_Electric.OnUpPtr = 0;
 D_Electric.OnDownPtr = 0;
 D_Electric.OnClickPtr = 0;
 D_Electric.OnPressPtr = 0;

 D_GAZ.OwnerScreen = &DEVICES;
 D_GAZ.Order = 22;
 D_GAZ.Left = 26;
 D_GAZ.Top = 139;
 D_GAZ.Width = 43;
 D_GAZ.Height = 59;
 D_GAZ.Picture_Type = 1;
 D_GAZ.Picture_Ratio = 1;
 D_GAZ.Picture_Name =  0x0028BBAE ;
 D_GAZ.Visible = 0;
 D_GAZ.Active = 0;
 D_GAZ.OnUpPtr = 0;
 D_GAZ.OnDownPtr = 0;
 D_GAZ.OnClickPtr = 0;
 D_GAZ.OnPressPtr = 0;

 D_Compr_2.OwnerScreen = &DEVICES;
 D_Compr_2.Order = 23;
 D_Compr_2.Left = 107;
 D_Compr_2.Top = 139;
 D_Compr_2.Width = 35;
 D_Compr_2.Height = 59;
 D_Compr_2.Picture_Type = 1;
 D_Compr_2.Picture_Ratio = 1;
 D_Compr_2.Picture_Name =  0x0028CF86 ;
 D_Compr_2.Visible = 0;
 D_Compr_2.Active = 0;
 D_Compr_2.OnUpPtr = 0;
 D_Compr_2.OnDownPtr = 0;
 D_Compr_2.OnClickPtr = 0;
 D_Compr_2.OnPressPtr = 0;

 D_Source_2.OwnerScreen = &DEVICES;
 D_Source_2.Order = 24;
 D_Source_2.Left = 174;
 D_Source_2.Top = 139;
 D_Source_2.Width = 58;
 D_Source_2.Height = 59;
 D_Source_2.Picture_Type = 1;
 D_Source_2.Picture_Ratio = 1;
 D_Source_2.Picture_Name =  0x0028DFAE ;
 D_Source_2.Visible = 0;
 D_Source_2.Active = 0;
 D_Source_2.OnUpPtr = 0;
 D_Source_2.OnDownPtr = 0;
 D_Source_2.OnClickPtr = 0;
 D_Source_2.OnPressPtr = 0;

 D_Heating_2.OwnerScreen = &DEVICES;
 D_Heating_2.Order = 25;
 D_Heating_2.Left = 251;
 D_Heating_2.Top = 139;
 D_Heating_2.Width = 55;
 D_Heating_2.Height = 59;
 D_Heating_2.Picture_Type = 1;
 D_Heating_2.Picture_Ratio = 1;
 D_Heating_2.Picture_Name =  0x0028FA70 ;
 D_Heating_2.Visible = 0;
 D_Heating_2.Active = 0;
 D_Heating_2.OnUpPtr = 0;
 D_Heating_2.OnDownPtr = 0;
 D_Heating_2.OnClickPtr = 0;
 D_Heating_2.OnPressPtr = 0;

 D_Reverse_2.OwnerScreen = &DEVICES;
 D_Reverse_2.Order = 26;
 D_Reverse_2.Left = 326;
 D_Reverse_2.Top = 139;
 D_Reverse_2.Width = 60;
 D_Reverse_2.Height = 59;
 D_Reverse_2.Picture_Type = 1;
 D_Reverse_2.Picture_Ratio = 1;
 D_Reverse_2.Picture_Name =  0x002913D0 ;
 D_Reverse_2.Visible = 0;
 D_Reverse_2.Active = 0;
 D_Reverse_2.OnUpPtr = 0;
 D_Reverse_2.OnDownPtr = 0;
 D_Reverse_2.OnClickPtr = 0;
 D_Reverse_2.OnPressPtr = 0;

 D_Solar.OwnerScreen = &DEVICES;
 D_Solar.Order = 27;
 D_Solar.Left = 409;
 D_Solar.Top = 139;
 D_Solar.Width = 53;
 D_Solar.Height = 59;
 D_Solar.Picture_Type = 1;
 D_Solar.Picture_Ratio = 1;
 D_Solar.Picture_Name =  0x00292F7E ;
 D_Solar.Visible = 0;
 D_Solar.Active = 0;
 D_Solar.OnUpPtr = 0;
 D_Solar.OnDownPtr = 0;
 D_Solar.OnClickPtr = 0;
 D_Solar.OnPressPtr = 0;

 D_fan2.OwnerScreen = &DEVICES;
 D_fan2.Order = 28;
 D_fan2.Left = 171;
 D_fan2.Top = 140;
 D_fan2.Width = 61;
 D_fan2.Height = 59;
 D_fan2.Picture_Type = 1;
 D_fan2.Picture_Ratio = 1;
 D_fan2.Picture_Name =  0x002947F2 ;
 D_fan2.Visible = 0;
 D_fan2.Active = 0;
 D_fan2.OnUpPtr = 0;
 D_fan2.OnDownPtr = 0;
 D_fan2.OnClickPtr = 0;
 D_fan2.OnPressPtr = 0;

 D_fan1.OwnerScreen = &DEVICES;
 D_fan1.Order = 29;
 D_fan1.Left = 95;
 D_fan1.Top = 45;
 D_fan1.Width = 58;
 D_fan1.Height = 59;
 D_fan1.Picture_Type = 1;
 D_fan1.Picture_Ratio = 1;
 D_fan1.Picture_Name =  0x00296416 ;
 D_fan1.Visible = 0;
 D_fan1.Active = 0;
 D_fan1.OnUpPtr = 0;
 D_fan1.OnDownPtr = 0;
 D_fan1.OnClickPtr = 0;
 D_fan1.OnPressPtr = 0;

 Pump1.OwnerScreen = &DEVICES;
 Pump1.Order = 30;
 Pump1.Left = 94;
 Pump1.Top = 106;
 Pump1.Width = 59;
 Pump1.Height = 16;
 Pump1.Visible = 1;
 Pump1.Active = 0;
 Pump1.Caption = Pump1_Caption;
 Pump1.FontName =  0x00003E9A ;
 Pump1.Font_Color = 0xFFFF;
 Pump1.VerticalText = 0;
 Pump1.OnUpPtr = 0;
 Pump1.OnDownPtr = 0;
 Pump1.OnClickPtr = 0;
 Pump1.OnPressPtr = 0;

 Pump2.OwnerScreen = &DEVICES;
 Pump2.Order = 31;
 Pump2.Left = 183;
 Pump2.Top = 106;
 Pump2.Width = 37;
 Pump2.Height = 16;
 Pump2.Visible = 1;
 Pump2.Active = 0;
 Pump2.Caption = Pump2_Caption;
 Pump2.FontName =  0x00003E9A ;
 Pump2.Font_Color = 0xFFFF;
 Pump2.VerticalText = 0;
 Pump2.OnUpPtr = 0;
 Pump2.OnDownPtr = 0;
 Pump2.OnClickPtr = 0;
 Pump2.OnPressPtr = 0;

 Revers1.OwnerScreen = &DEVICES;
 Revers1.Order = 32;
 Revers1.Left = 245;
 Revers1.Top = 106;
 Revers1.Width = 66;
 Revers1.Height = 16;
 Revers1.Visible = 1;
 Revers1.Active = 0;
 Revers1.Caption = Revers1_Caption;
 Revers1.FontName =  0x00003E9A ;
 Revers1.Font_Color = 0xFFFF;
 Revers1.VerticalText = 0;
 Revers1.OnUpPtr = 0;
 Revers1.OnDownPtr = 0;
 Revers1.OnClickPtr = 0;
 Revers1.OnPressPtr = 0;

 Compr_1.OwnerScreen = &DEVICES;
 Compr_1.Order = 33;
 Compr_1.Left = 29;
 Compr_1.Top = 106;
 Compr_1.Width = 41;
 Compr_1.Height = 16;
 Compr_1.Visible = 1;
 Compr_1.Active = 0;
 Compr_1.Caption = Compr_1_Caption;
 Compr_1.FontName =  0x00003E9A ;
 Compr_1.Font_Color = 0xFFFF;
 Compr_1.VerticalText = 0;
 Compr_1.OnUpPtr = 0;
 Compr_1.OnDownPtr = 0;
 Compr_1.OnClickPtr = 0;
 Compr_1.OnPressPtr = 0;

 Valve_1.OwnerScreen = &DEVICES;
 Valve_1.Order = 34;
 Valve_1.Left = 342;
 Valve_1.Top = 106;
 Valve_1.Width = 33;
 Valve_1.Height = 16;
 Valve_1.Visible = 1;
 Valve_1.Active = 0;
 Valve_1.Caption = Valve_1_Caption;
 Valve_1.FontName =  0x00003E9A ;
 Valve_1.Font_Color = 0xFFFF;
 Valve_1.VerticalText = 0;
 Valve_1.OnUpPtr = 0;
 Valve_1.OnDownPtr = 0;
 Valve_1.OnClickPtr = 0;
 Valve_1.OnPressPtr = 0;

 Label59.OwnerScreen = &DEVICES;
 Label59.Order = 35;
 Label59.Left = 98;
 Label59.Top = 202;
 Label59.Width = 53;
 Label59.Height = 16;
 Label59.Visible = 0;
 Label59.Active = 0;
 Label59.Caption = Label59_Caption;
 Label59.FontName =  0x00003E9A ;
 Label59.Font_Color = 0xFFFF;
 Label59.VerticalText = 0;
 Label59.OnUpPtr = 0;
 Label59.OnDownPtr = 0;
 Label59.OnClickPtr = 0;
 Label59.OnPressPtr = 0;

 Label62.OwnerScreen = &DEVICES;
 Label62.Order = 36;
 Label62.Left = 168;
 Label62.Top = 202;
 Label62.Width = 70;
 Label62.Height = 16;
 Label62.Visible = 0;
 Label62.Active = 0;
 Label62.Caption = Label62_Caption;
 Label62.FontName =  0x00003E9A ;
 Label62.Font_Color = 0xFFFF;
 Label62.VerticalText = 0;
 Label62.OnUpPtr = 0;
 Label62.OnDownPtr = 0;
 Label62.OnClickPtr = 0;
 Label62.OnPressPtr = 0;

 Label64.OwnerScreen = &DEVICES;
 Label64.Order = 37;
 Label64.Left = 255;
 Label64.Top = 202;
 Label64.Width = 48;
 Label64.Height = 16;
 Label64.Visible = 0;
 Label64.Active = 0;
 Label64.Caption = Label64_Caption;
 Label64.FontName =  0x00003E9A ;
 Label64.Font_Color = 0xFFFF;
 Label64.VerticalText = 0;
 Label64.OnUpPtr = 0;
 Label64.OnDownPtr = 0;
 Label64.OnClickPtr = 0;
 Label64.OnPressPtr = 0;

 Label65.OwnerScreen = &DEVICES;
 Label65.Order = 38;
 Label65.Left = 31;
 Label65.Top = 202;
 Label65.Width = 28;
 Label65.Height = 16;
 Label65.Visible = 1;
 Label65.Active = 0;
 Label65.Caption = Label65_Caption;
 Label65.FontName =  0x00003E9A ;
 Label65.Font_Color = 0xFFFF;
 Label65.VerticalText = 0;
 Label65.OnUpPtr = 0;
 Label65.OnDownPtr = 0;
 Label65.OnClickPtr = 0;
 Label65.OnPressPtr = 0;

 Label67.OwnerScreen = &DEVICES;
 Label67.Order = 39;
 Label67.Left = 318;
 Label67.Top = 202;
 Label67.Width = 77;
 Label67.Height = 16;
 Label67.Visible = 0;
 Label67.Active = 0;
 Label67.Caption = Label67_Caption;
 Label67.FontName =  0x00003E9A ;
 Label67.Font_Color = 0xFFFF;
 Label67.VerticalText = 0;
 Label67.OnUpPtr = 0;
 Label67.OnDownPtr = 0;
 Label67.OnClickPtr = 0;
 Label67.OnPressPtr = 0;

 Label68.OwnerScreen = &DEVICES;
 Label68.Order = 40;
 Label68.Left = 416;
 Label68.Top = 202;
 Label68.Width = 47;
 Label68.Height = 16;
 Label68.Visible = 0;
 Label68.Active = 0;
 Label68.Caption = Label68_Caption;
 Label68.FontName =  0x00003E9A ;
 Label68.Font_Color = 0xFFFF;
 Label68.VerticalText = 0;
 Label68.OnUpPtr = 0;
 Label68.OnDownPtr = 0;
 Label68.OnClickPtr = 0;
 Label68.OnPressPtr = 0;

 Home_b15.OwnerScreen = &DEVICES;
 Home_b15.Order = 41;
 Home_b15.Left = 201;
 Home_b15.Top = 232;
 Home_b15.Width = 78;
 Home_b15.Height = 35;
 Home_b15.Pen_Width = 1;
 Home_b15.Pen_Color = 0xC618;
 Home_b15.Visible = 1;
 Home_b15.Active = 1;
 Home_b15.Transparent = 1;
 Home_b15.Caption = Home_b15_Caption;
 Home_b15.TextAlign = _taCenter;
 Home_b15.TextAlignVertical= _tavMiddle;
 Home_b15.FontName =  0x00005242 ;
 Home_b15.PressColEnabled = 1;
 Home_b15.Font_Color = 0xD6BA;
 Home_b15.VerticalText = 0;
 Home_b15.Gradient = 1;
 Home_b15.Gradient_Orientation = 0;
 Home_b15.Gradient_Start_Color = 0x0418;
 Home_b15.Gradient_End_Color = 0x00A5;
 Home_b15.Color = 0xC618;
 Home_b15.Press_Color = 0xE71C;
 Home_b15.Corner_Radius = 5;
 Home_b15.OnUpPtr = 0;
 Home_b15.OnDownPtr = 0;
 Home_b15.OnClickPtr = BackToHome;
 Home_b15.OnPressPtr = 0;

 Electricobject_TatDiagram.OwnerScreen = &DEVICES;
 Electricobject_TatDiagram.Order = 42;
 Electricobject_TatDiagram.Left = 401;
 Electricobject_TatDiagram.Top = 106;
 Electricobject_TatDiagram.Width = 68;
 Electricobject_TatDiagram.Height = 16;
 Electricobject_TatDiagram.Visible = 1;
 Electricobject_TatDiagram.Active = 0;
 Electricobject_TatDiagram.Caption = Electricobject_TatDiagram_Caption;
 Electricobject_TatDiagram.FontName =  0x00003E9A ;
 Electricobject_TatDiagram.Font_Color = 0xFFFF;
 Electricobject_TatDiagram.VerticalText = 0;
 Electricobject_TatDiagram.OnUpPtr = 0;
 Electricobject_TatDiagram.OnDownPtr = 0;
 Electricobject_TatDiagram.OnClickPtr = 0;
 Electricobject_TatDiagram.OnPressPtr = 0;

 Image37.OwnerScreen = &Graph;
 Image37.Order = 0;
 Image37.Left = 0;
 Image37.Top = 0;
 Image37.Width = 480;
 Image37.Height = 272;
 Image37.Picture_Type = 1;
 Image37.Picture_Ratio = 1;
 Image37.Picture_Name =  0x0003CAAE ;
 Image37.Visible = 1;
 Image37.Active = 0;
 Image37.OnUpPtr = 0;
 Image37.OnDownPtr = 0;
 Image37.OnClickPtr = 0;
 Image37.OnPressPtr = 0;

 Box23.OwnerScreen = &Graph;
 Box23.Order = 1;
 Box23.Left = 40;
 Box23.Top = 70;
 Box23.Width = 360;
 Box23.Height = 180;
 Box23.Pen_Width = 1;
 Box23.Pen_Color = 0x07FF;
 Box23.Visible = 1;
 Box23.Active = 0;
 Box23.Transparent = 1;
 Box23.Gradient = 0;
 Box23.Gradient_Orientation = 0;
 Box23.Gradient_Start_Color = 0xFFFF;
 Box23.Gradient_End_Color = 0xC618;
 Box23.Color = 0xFFFF;
 Box23.PressColEnabled = 1;
 Box23.Press_Color = 0xE71C;
 Box23.OnUpPtr = 0;
 Box23.OnDownPtr = 0;
 Box23.OnClickPtr = 0;
 Box23.OnPressPtr = 0;

 Line1.OwnerScreen = &Graph;
 Line1.Order = 2;
 Line1.First_Point_X = 40;
 Line1.First_Point_Y = 85;
 Line1.Second_Point_X = 400;
 Line1.Second_Point_Y = 85;
 Line1.Visible = 1;
 Line1.Pen_Width = 1;
 Line1.Color = 0x07FF;

 Line2.OwnerScreen = &Graph;
 Line2.Order = 3;
 Line2.First_Point_X = 40;
 Line2.First_Point_Y = 110;
 Line2.Second_Point_X = 400;
 Line2.Second_Point_Y = 110;
 Line2.Visible = 1;
 Line2.Pen_Width = 1;
 Line2.Color = 0x07FF;

 Line3.OwnerScreen = &Graph;
 Line3.Order = 4;
 Line3.First_Point_X = 40;
 Line3.First_Point_Y = 135;
 Line3.Second_Point_X = 400;
 Line3.Second_Point_Y = 135;
 Line3.Visible = 1;
 Line3.Pen_Width = 1;
 Line3.Color = 0x07FF;

 Line8.OwnerScreen = &Graph;
 Line8.Order = 5;
 Line8.First_Point_X = 100;
 Line8.First_Point_Y = 70;
 Line8.Second_Point_X = 100;
 Line8.Second_Point_Y = 250;
 Line8.Visible = 1;
 Line8.Pen_Width = 1;
 Line8.Color = 0x07FF;

 Line9.OwnerScreen = &Graph;
 Line9.Order = 6;
 Line9.First_Point_X = 160;
 Line9.First_Point_Y = 70;
 Line9.Second_Point_X = 160;
 Line9.Second_Point_Y = 250;
 Line9.Visible = 1;
 Line9.Pen_Width = 1;
 Line9.Color = 0x07FF;

 Line10.OwnerScreen = &Graph;
 Line10.Order = 7;
 Line10.First_Point_X = 220;
 Line10.First_Point_Y = 70;
 Line10.Second_Point_X = 220;
 Line10.Second_Point_Y = 250;
 Line10.Visible = 1;
 Line10.Pen_Width = 1;
 Line10.Color = 0x07FF;

 Line11.OwnerScreen = &Graph;
 Line11.Order = 8;
 Line11.First_Point_X = 280;
 Line11.First_Point_Y = 70;
 Line11.Second_Point_X = 280;
 Line11.Second_Point_Y = 250;
 Line11.Visible = 1;
 Line11.Pen_Width = 1;
 Line11.Color = 0x07FF;

 Line12.OwnerScreen = &Graph;
 Line12.Order = 9;
 Line12.First_Point_X = 340;
 Line12.First_Point_Y = 70;
 Line12.Second_Point_X = 340;
 Line12.Second_Point_Y = 250;
 Line12.Visible = 1;
 Line12.Pen_Width = 1;
 Line12.Color = 0x07FF;

 graph1_pos.OwnerScreen = &Graph;
 graph1_pos.Order = 10;
 graph1_pos.Left = 445;
 graph1_pos.Top = 81;
 graph1_pos.Width = 28;
 graph1_pos.Height = 20;
 graph1_pos.Visible = 1;
 graph1_pos.Active = 0;
 graph1_pos.Caption = graph1_pos_Caption;
 graph1_pos.FontName =  0x00005242 ;
 graph1_pos.Font_Color = 0xFFFF;
 graph1_pos.VerticalText = 0;
 graph1_pos.OnUpPtr = 0;
 graph1_pos.OnDownPtr = 0;
 graph1_pos.OnClickPtr = 0;
 graph1_pos.OnPressPtr = 0;

 Label83.OwnerScreen = &Graph;
 Label83.Order = 11;
 Label83.Left = 20;
 Label83.Top = 125;
 Label83.Width = 19;
 Label83.Height = 20;
 Label83.Visible = 1;
 Label83.Active = 0;
 Label83.Caption = Label83_Caption;
 Label83.FontName =  0x00005242 ;
 Label83.Font_Color = 0xFFFF;
 Label83.VerticalText = 0;
 Label83.OnUpPtr = 0;
 Label83.OnDownPtr = 0;
 Label83.OnClickPtr = 0;
 Label83.OnPressPtr = 0;

 Label84.OwnerScreen = &Graph;
 Label84.Order = 12;
 Label84.Left = 20;
 Label84.Top = 200;
 Label84.Width = 19;
 Label84.Height = 20;
 Label84.Visible = 1;
 Label84.Active = 0;
 Label84.Caption = Label84_Caption;
 Label84.FontName =  0x00005242 ;
 Label84.Font_Color = 0xFFFF;
 Label84.VerticalText = 0;
 Label84.OnUpPtr = 0;
 Label84.OnDownPtr = 0;
 Label84.OnClickPtr = 0;
 Label84.OnPressPtr = 0;

 Label85.OwnerScreen = &Graph;
 Label85.Order = 13;
 Label85.Left = 20;
 Label85.Top = 175;
 Label85.Width = 19;
 Label85.Height = 20;
 Label85.Visible = 1;
 Label85.Active = 0;
 Label85.Caption = Label85_Caption;
 Label85.FontName =  0x00005242 ;
 Label85.Font_Color = 0xFFFF;
 Label85.VerticalText = 0;
 Label85.OnUpPtr = 0;
 Label85.OnDownPtr = 0;
 Label85.OnClickPtr = 0;
 Label85.OnPressPtr = 0;

 Label86.OwnerScreen = &Graph;
 Label86.Order = 14;
 Label86.Left = 20;
 Label86.Top = 150;
 Label86.Width = 19;
 Label86.Height = 20;
 Label86.Visible = 1;
 Label86.Active = 0;
 Label86.Caption = Label86_Caption;
 Label86.FontName =  0x00005242 ;
 Label86.Font_Color = 0xFFFF;
 Label86.VerticalText = 0;
 Label86.OnUpPtr = 0;
 Label86.OnDownPtr = 0;
 Label86.OnClickPtr = 0;
 Label86.OnPressPtr = 0;

 Label87.OwnerScreen = &Graph;
 Label87.Order = 15;
 Label87.Left = 30;
 Label87.Top = 225;
 Label87.Width = 9;
 Label87.Height = 20;
 Label87.Visible = 1;
 Label87.Active = 0;
 Label87.Caption = Label87_Caption;
 Label87.FontName =  0x00005242 ;
 Label87.Font_Color = 0xFFFF;
 Label87.VerticalText = 0;
 Label87.OnUpPtr = 0;
 Label87.OnDownPtr = 0;
 Label87.OnClickPtr = 0;
 Label87.OnPressPtr = 0;

 Label88.OwnerScreen = &Graph;
 Label88.Order = 16;
 Label88.Left = 95;
 Label88.Top = 250;
 Label88.Width = 9;
 Label88.Height = 20;
 Label88.Visible = 1;
 Label88.Active = 0;
 Label88.Caption = Label88_Caption;
 Label88.FontName =  0x00005242 ;
 Label88.Font_Color = 0xFFFF;
 Label88.VerticalText = 0;
 Label88.OnUpPtr = 0;
 Label88.OnDownPtr = 0;
 Label88.OnClickPtr = 0;
 Label88.OnPressPtr = 0;

 Label89.OwnerScreen = &Graph;
 Label89.Order = 17;
 Label89.Left = 155;
 Label89.Top = 250;
 Label89.Width = 9;
 Label89.Height = 20;
 Label89.Visible = 1;
 Label89.Active = 0;
 Label89.Caption = Label89_Caption;
 Label89.FontName =  0x00005242 ;
 Label89.Font_Color = 0xFFFF;
 Label89.VerticalText = 0;
 Label89.OnUpPtr = 0;
 Label89.OnDownPtr = 0;
 Label89.OnClickPtr = 0;
 Label89.OnPressPtr = 0;

 Label90.OwnerScreen = &Graph;
 Label90.Order = 18;
 Label90.Left = 215;
 Label90.Top = 250;
 Label90.Width = 9;
 Label90.Height = 20;
 Label90.Visible = 1;
 Label90.Active = 0;
 Label90.Caption = Label90_Caption;
 Label90.FontName =  0x00005242 ;
 Label90.Font_Color = 0xFFFF;
 Label90.VerticalText = 0;
 Label90.OnUpPtr = 0;
 Label90.OnDownPtr = 0;
 Label90.OnClickPtr = 0;
 Label90.OnPressPtr = 0;

 Label91.OwnerScreen = &Graph;
 Label91.Order = 19;
 Label91.Left = 275;
 Label91.Top = 250;
 Label91.Width = 9;
 Label91.Height = 20;
 Label91.Visible = 1;
 Label91.Active = 0;
 Label91.Caption = Label91_Caption;
 Label91.FontName =  0x00005242 ;
 Label91.Font_Color = 0xFFFF;
 Label91.VerticalText = 0;
 Label91.OnUpPtr = 0;
 Label91.OnDownPtr = 0;
 Label91.OnClickPtr = 0;
 Label91.OnPressPtr = 0;

 Label92.OwnerScreen = &Graph;
 Label92.Order = 20;
 Label92.Left = 335;
 Label92.Top = 250;
 Label92.Width = 9;
 Label92.Height = 20;
 Label92.Visible = 1;
 Label92.Active = 0;
 Label92.Caption = Label92_Caption;
 Label92.FontName =  0x00005242 ;
 Label92.Font_Color = 0xFFFF;
 Label92.VerticalText = 0;
 Label92.OnUpPtr = 0;
 Label92.OnDownPtr = 0;
 Label92.OnClickPtr = 0;
 Label92.OnPressPtr = 0;

 Label93.OwnerScreen = &Graph;
 Label93.Order = 21;
 Label93.Left = 365;
 Label93.Top = 250;
 Label93.Width = 28;
 Label93.Height = 20;
 Label93.Visible = 1;
 Label93.Active = 0;
 Label93.Caption = Label93_Caption;
 Label93.FontName =  0x00005242 ;
 Label93.Font_Color = 0xFFFF;
 Label93.VerticalText = 0;
 Label93.OnUpPtr = 0;
 Label93.OnDownPtr = 0;
 Label93.OnClickPtr = 0;
 Label93.OnPressPtr = 0;

 Line4.OwnerScreen = &Graph;
 Line4.Order = 22;
 Line4.First_Point_X = 40;
 Line4.First_Point_Y = 160;
 Line4.Second_Point_X = 400;
 Line4.Second_Point_Y = 160;
 Line4.Visible = 1;
 Line4.Pen_Width = 1;
 Line4.Color = 0x07FF;

 Line5.OwnerScreen = &Graph;
 Line5.Order = 23;
 Line5.First_Point_X = 40;
 Line5.First_Point_Y = 185;
 Line5.Second_Point_X = 400;
 Line5.Second_Point_Y = 185;
 Line5.Visible = 1;
 Line5.Pen_Width = 1;
 Line5.Color = 0x07FF;

 Line6.OwnerScreen = &Graph;
 Line6.Order = 24;
 Line6.First_Point_X = 40;
 Line6.First_Point_Y = 210;
 Line6.Second_Point_X = 400;
 Line6.Second_Point_Y = 210;
 Line6.Visible = 1;
 Line6.Pen_Width = 1;
 Line6.Color = 0x07FF;

 Label47.OwnerScreen = &Graph;
 Label47.Order = 25;
 Label47.Left = 20;
 Label47.Top = 100;
 Label47.Width = 19;
 Label47.Height = 20;
 Label47.Visible = 1;
 Label47.Active = 0;
 Label47.Caption = Label47_Caption;
 Label47.FontName =  0x00005242 ;
 Label47.Font_Color = 0xFFFF;
 Label47.VerticalText = 0;
 Label47.OnUpPtr = 0;
 Label47.OnDownPtr = 0;
 Label47.OnClickPtr = 0;
 Label47.OnPressPtr = 0;

 Label94.OwnerScreen = &Graph;
 Label94.Order = 26;
 Label94.Left = 20;
 Label94.Top = 75;
 Label94.Width = 19;
 Label94.Height = 20;
 Label94.Visible = 1;
 Label94.Active = 0;
 Label94.Caption = Label94_Caption;
 Label94.FontName =  0x00005242 ;
 Label94.Font_Color = 0xFFFF;
 Label94.VerticalText = 0;
 Label94.OnUpPtr = 0;
 Label94.OnDownPtr = 0;
 Label94.OnClickPtr = 0;
 Label94.OnPressPtr = 0;

 Line7.OwnerScreen = &Graph;
 Line7.Order = 27;
 Line7.First_Point_X = 40;
 Line7.First_Point_Y = 235;
 Line7.Second_Point_X = 400;
 Line7.Second_Point_Y = 235;
 Line7.Visible = 1;
 Line7.Pen_Width = 1;
 Line7.Color = 0x07FF;

 Image269.OwnerScreen = &Graph;
 Image269.Order = 28;
 Image269.Left = 30;
 Image269.Top = 0;
 Image269.Width = 110;
 Image269.Height = 30;
 Image269.Picture_Type = 1;
 Image269.Picture_Ratio = 1;
 Image269.Picture_Name =  0x00089838 ;
 Image269.Visible = 1;
 Image269.Active = 1;
 Image269.OnUpPtr = 0;
 Image269.OnDownPtr = 0;
 Image269.OnClickPtr = 0;
 Image269.OnPressPtr = 0;

 GraphTimelabel.OwnerScreen = &Graph;
 GraphTimelabel.Order = 29;
 GraphTimelabel.Left = 40;
 GraphTimelabel.Top = 5;
 GraphTimelabel.Width = 67;
 GraphTimelabel.Height = 20;
 GraphTimelabel.Visible = 1;
 GraphTimelabel.Active = 0;
 GraphTimelabel.Caption = GraphTimelabel_Caption;
 GraphTimelabel.FontName =  0x00005242 ;
 GraphTimelabel.Font_Color = 0xFFFF;
 GraphTimelabel.VerticalText = 0;
 GraphTimelabel.OnUpPtr = 0;
 GraphTimelabel.OnDownPtr = 0;
 GraphTimelabel.OnClickPtr = 0;
 GraphTimelabel.OnPressPtr = 0;

 Graph_Label.OwnerScreen = &Graph;
 Graph_Label.Order = 30;
 Graph_Label.Left = 208;
 Graph_Label.Top = 4;
 Graph_Label.Width = 60;
 Graph_Label.Height = 20;
 Graph_Label.Visible = 1;
 Graph_Label.Active = 0;
 Graph_Label.Caption = Graph_Label_Caption;
 Graph_Label.FontName =  0x00005242 ;
 Graph_Label.Font_Color = 0xE7FC;
 Graph_Label.VerticalText = 0;
 Graph_Label.OnUpPtr = 0;
 Graph_Label.OnDownPtr = 0;
 Graph_Label.OnClickPtr = 0;
 Graph_Label.OnPressPtr = 0;

 graph_br1_in.OwnerScreen = &Graph;
 graph_br1_in.Order = 31;
 graph_br1_in.Left = 62;
 graph_br1_in.Top = 38;
 graph_br1_in.Width = 48;
 graph_br1_in.Height = 23;
 graph_br1_in.Pen_Width = 1;
 graph_br1_in.Pen_Color = 0x0000;
 graph_br1_in.Visible = 1;
 graph_br1_in.Active = 1;
 graph_br1_in.Transparent = 1;
 graph_br1_in.Caption = graph_br1_in_Caption;
 graph_br1_in.TextAlign = _taCenter;
 graph_br1_in.TextAlignVertical= _tavMiddle;
 graph_br1_in.FontName =  0x00005242 ;
 graph_br1_in.PressColEnabled = 1;
 graph_br1_in.Font_Color = 0xF800;
 graph_br1_in.VerticalText = 0;
 graph_br1_in.Gradient = 0;
 graph_br1_in.Gradient_Orientation = 0;
 graph_br1_in.Gradient_Start_Color = 0xFFFF;
 graph_br1_in.Gradient_End_Color = 0xC618;
 graph_br1_in.Color = 0xE73C;
 graph_br1_in.Press_Color = 0xE71C;
 graph_br1_in.Corner_Radius = 3;
 graph_br1_in.OnUpPtr = 0;
 graph_br1_in.OnDownPtr = 0;
 graph_br1_in.OnClickPtr = 0;
 graph_br1_in.OnPressPtr = 0;

 graph_br1_out.OwnerScreen = &Graph;
 graph_br1_out.Order = 32;
 graph_br1_out.Left = 161;
 graph_br1_out.Top = 39;
 graph_br1_out.Width = 41;
 graph_br1_out.Height = 23;
 graph_br1_out.Pen_Width = 1;
 graph_br1_out.Pen_Color = 0x0000;
 graph_br1_out.Visible = 1;
 graph_br1_out.Active = 1;
 graph_br1_out.Transparent = 1;
 graph_br1_out.Caption = graph_br1_out_Caption;
 graph_br1_out.TextAlign = _taCenter;
 graph_br1_out.TextAlignVertical= _tavMiddle;
 graph_br1_out.FontName =  0x00005242 ;
 graph_br1_out.PressColEnabled = 1;
 graph_br1_out.Font_Color = 0x001F;
 graph_br1_out.VerticalText = 0;
 graph_br1_out.Gradient = 0;
 graph_br1_out.Gradient_Orientation = 0;
 graph_br1_out.Gradient_Start_Color = 0xFFFF;
 graph_br1_out.Gradient_End_Color = 0xC618;
 graph_br1_out.Color = 0xE73C;
 graph_br1_out.Press_Color = 0xE71C;
 graph_br1_out.Corner_Radius = 3;
 graph_br1_out.OnUpPtr = 0;
 graph_br1_out.OnDownPtr = 0;
 graph_br1_out.OnClickPtr = 0;
 graph_br1_out.OnPressPtr = 0;

 graph_heat1_in.OwnerScreen = &Graph;
 graph_heat1_in.Order = 33;
 graph_heat1_in.Left = 261;
 graph_heat1_in.Top = 40;
 graph_heat1_in.Width = 41;
 graph_heat1_in.Height = 23;
 graph_heat1_in.Pen_Width = 1;
 graph_heat1_in.Pen_Color = 0x0000;
 graph_heat1_in.Visible = 1;
 graph_heat1_in.Active = 1;
 graph_heat1_in.Transparent = 1;
 graph_heat1_in.Caption = graph_heat1_in_Caption;
 graph_heat1_in.TextAlign = _taCenter;
 graph_heat1_in.TextAlignVertical= _tavMiddle;
 graph_heat1_in.FontName =  0x00005242 ;
 graph_heat1_in.PressColEnabled = 1;
 graph_heat1_in.Font_Color = 0x0400;
 graph_heat1_in.VerticalText = 0;
 graph_heat1_in.Gradient = 0;
 graph_heat1_in.Gradient_Orientation = 0;
 graph_heat1_in.Gradient_Start_Color = 0xFFFF;
 graph_heat1_in.Gradient_End_Color = 0xC618;
 graph_heat1_in.Color = 0xE73C;
 graph_heat1_in.Press_Color = 0xE71C;
 graph_heat1_in.Corner_Radius = 3;
 graph_heat1_in.OnUpPtr = 0;
 graph_heat1_in.OnDownPtr = 0;
 graph_heat1_in.OnClickPtr = 0;
 graph_heat1_in.OnPressPtr = 0;

 graph_heat1_out.OwnerScreen = &Graph;
 graph_heat1_out.Order = 34;
 graph_heat1_out.Left = 360;
 graph_heat1_out.Top = 40;
 graph_heat1_out.Width = 41;
 graph_heat1_out.Height = 23;
 graph_heat1_out.Pen_Width = 1;
 graph_heat1_out.Pen_Color = 0x0000;
 graph_heat1_out.Visible = 1;
 graph_heat1_out.Active = 1;
 graph_heat1_out.Transparent = 1;
 graph_heat1_out.Caption = graph_heat1_out_Caption;
 graph_heat1_out.TextAlign = _taCenter;
 graph_heat1_out.TextAlignVertical= _tavMiddle;
 graph_heat1_out.FontName =  0x00005242 ;
 graph_heat1_out.PressColEnabled = 1;
 graph_heat1_out.Font_Color = 0x0000;
 graph_heat1_out.VerticalText = 0;
 graph_heat1_out.Gradient = 0;
 graph_heat1_out.Gradient_Orientation = 0;
 graph_heat1_out.Gradient_Start_Color = 0xFFFF;
 graph_heat1_out.Gradient_End_Color = 0xC618;
 graph_heat1_out.Color = 0xE73C;
 graph_heat1_out.Press_Color = 0xE71C;
 graph_heat1_out.Corner_Radius = 3;
 graph_heat1_out.OnUpPtr = 0;
 graph_heat1_out.OnDownPtr = 0;
 graph_heat1_out.OnClickPtr = 0;
 graph_heat1_out.OnPressPtr = 0;

 Home_b16.OwnerScreen = &Graph;
 Home_b16.Order = 35;
 Home_b16.Left = 410;
 Home_b16.Top = 168;
 Home_b16.Width = 60;
 Home_b16.Height = 35;
 Home_b16.Pen_Width = 1;
 Home_b16.Pen_Color = 0xC618;
 Home_b16.Visible = 1;
 Home_b16.Active = 1;
 Home_b16.Transparent = 1;
 Home_b16.Caption = Home_b16_Caption;
 Home_b16.TextAlign = _taCenter;
 Home_b16.TextAlignVertical= _tavMiddle;
 Home_b16.FontName =  0x00005242 ;
 Home_b16.PressColEnabled = 1;
 Home_b16.Font_Color = 0xD6BA;
 Home_b16.VerticalText = 0;
 Home_b16.Gradient = 1;
 Home_b16.Gradient_Orientation = 0;
 Home_b16.Gradient_Start_Color = 0x0418;
 Home_b16.Gradient_End_Color = 0x00A5;
 Home_b16.Color = 0xC618;
 Home_b16.Press_Color = 0xE71C;
 Home_b16.Corner_Radius = 5;
 Home_b16.OnUpPtr = 0;
 Home_b16.OnDownPtr = 0;
 Home_b16.OnClickPtr = BackToHome;
 Home_b16.OnPressPtr = 0;

 Next_b8.OwnerScreen = &Graph;
 Next_b8.Order = 36;
 Next_b8.Left = 410;
 Next_b8.Top = 216;
 Next_b8.Width = 60;
 Next_b8.Height = 35;
 Next_b8.Pen_Width = 1;
 Next_b8.Pen_Color = 0xC618;
 Next_b8.Visible = 0;
 Next_b8.Active = 1;
 Next_b8.Transparent = 1;
 Next_b8.Caption = Next_b8_Caption;
 Next_b8.TextAlign = _taCenter;
 Next_b8.TextAlignVertical= _tavMiddle;
 Next_b8.FontName =  0x00005242 ;
 Next_b8.PressColEnabled = 1;
 Next_b8.Font_Color = 0xD6BA;
 Next_b8.VerticalText = 0;
 Next_b8.Gradient = 1;
 Next_b8.Gradient_Orientation = 0;
 Next_b8.Gradient_Start_Color = 0x0418;
 Next_b8.Gradient_End_Color = 0x00A5;
 Next_b8.Color = 0xC618;
 Next_b8.Press_Color = 0xE71C;
 Next_b8.Corner_Radius = 5;
 Next_b8.OnUpPtr = 0;
 Next_b8.OnDownPtr = 0;
 Next_b8.OnClickPtr = nextPage;
 Next_b8.OnPressPtr = 0;

 Back_b12.OwnerScreen = &Graph;
 Back_b12.Order = 37;
 Back_b12.Left = 410;
 Back_b12.Top = 120;
 Back_b12.Width = 60;
 Back_b12.Height = 35;
 Back_b12.Pen_Width = 1;
 Back_b12.Pen_Color = 0xC618;
 Back_b12.Visible = 0;
 Back_b12.Active = 0;
 Back_b12.Transparent = 1;
 Back_b12.Caption = Back_b12_Caption;
 Back_b12.TextAlign = _taCenter;
 Back_b12.TextAlignVertical= _tavMiddle;
 Back_b12.FontName =  0x00005242 ;
 Back_b12.PressColEnabled = 1;
 Back_b12.Font_Color = 0xD6BA;
 Back_b12.VerticalText = 0;
 Back_b12.Gradient = 1;
 Back_b12.Gradient_Orientation = 0;
 Back_b12.Gradient_Start_Color = 0x0418;
 Back_b12.Gradient_End_Color = 0x00A5;
 Back_b12.Color = 0xC618;
 Back_b12.Press_Color = 0xE71C;
 Back_b12.Corner_Radius = 5;
 Back_b12.OnUpPtr = 0;
 Back_b12.OnDownPtr = 0;
 Back_b12.OnClickPtr = goToBack;
 Back_b12.OnPressPtr = 0;

 CircleButton11.OwnerScreen = &Graph;
 CircleButton11.Order = 38;
 CircleButton11.Left = 450;
 CircleButton11.Top = 3;
 CircleButton11.Radius = 12;
 CircleButton11.Pen_Width = 1;
 CircleButton11.Pen_Color = 0x0000;
 CircleButton11.Visible = 0;
 CircleButton11.Active = 0;
 CircleButton11.Transparent = 1;
 CircleButton11.Caption = CircleButton11_Caption;
 CircleButton11.TextAlign = _taCenter;
 CircleButton11.TextAlignVertical= _tavMiddle;
 CircleButton11.FontName =  0x00005242 ;
 CircleButton11.PressColEnabled = 1;
 CircleButton11.Font_Color = 0x0000;
 CircleButton11.VerticalText = 0;
 CircleButton11.Gradient = 1;
 CircleButton11.Gradient_Orientation = 0;
 CircleButton11.Gradient_Start_Color = 0xFFFF;
 CircleButton11.Gradient_End_Color = 0xC618;
 CircleButton11.Color = 0xC618;
 CircleButton11.Press_Color = 0xE71C;
 CircleButton11.OnUpPtr = 0;
 CircleButton11.OnDownPtr = 0;
 CircleButton11.OnClickPtr = 0;
 CircleButton11.OnPressPtr = 0;

 Label377.OwnerScreen = &Graph;
 Label377.Order = 39;
 Label377.Left = 407;
 Label377.Top = 81;
 Label377.Width = 41;
 Label377.Height = 20;
 Label377.Visible = 1;
 Label377.Active = 0;
 Label377.Caption = Label377_Caption;
 Label377.FontName =  0x00005242 ;
 Label377.Font_Color = 0xFFFF;
 Label377.VerticalText = 0;
 Label377.OnUpPtr = 0;
 Label377.OnDownPtr = 0;
 Label377.OnClickPtr = 0;
 Label377.OnPressPtr = 0;

 Label378.OwnerScreen = &Graph;
 Label378.Order = 40;
 Label378.Left = 224;
 Label378.Top = 41;
 Label378.Width = 32;
 Label378.Height = 20;
 Label378.Visible = 1;
 Label378.Active = 0;
 Label378.Caption = Label378_Caption;
 Label378.FontName =  0x00005242 ;
 Label378.Font_Color = 0xFFFF;
 Label378.VerticalText = 0;
 Label378.OnUpPtr = 0;
 Label378.OnDownPtr = 0;
 Label378.OnClickPtr = 0;
 Label378.OnPressPtr = 0;

 Label380.OwnerScreen = &Graph;
 Label380.Order = 41;
 Label380.Left = 314;
 Label380.Top = 41;
 Label380.Width = 45;
 Label380.Height = 20;
 Label380.Visible = 1;
 Label380.Active = 0;
 Label380.Caption = Label380_Caption;
 Label380.FontName =  0x00005242 ;
 Label380.Font_Color = 0xFFFF;
 Label380.VerticalText = 0;
 Label380.OnUpPtr = 0;
 Label380.OnDownPtr = 0;
 Label380.OnClickPtr = 0;
 Label380.OnPressPtr = 0;

 Label381.OwnerScreen = &Graph;
 Label381.Order = 42;
 Label381.Left = 28;
 Label381.Top = 41;
 Label381.Width = 32;
 Label381.Height = 20;
 Label381.Visible = 1;
 Label381.Active = 0;
 Label381.Caption = Label381_Caption;
 Label381.FontName =  0x00005242 ;
 Label381.Font_Color = 0xFFFF;
 Label381.VerticalText = 0;
 Label381.OnUpPtr = 0;
 Label381.OnDownPtr = 0;
 Label381.OnClickPtr = 0;
 Label381.OnPressPtr = 0;

 Label382.OwnerScreen = &Graph;
 Label382.Order = 43;
 Label382.Left = 116;
 Label382.Top = 41;
 Label382.Width = 45;
 Label382.Height = 20;
 Label382.Visible = 1;
 Label382.Active = 0;
 Label382.Caption = Label382_Caption;
 Label382.FontName =  0x00005242 ;
 Label382.Font_Color = 0xFFFF;
 Label382.VerticalText = 0;
 Label382.OnUpPtr = 0;
 Label382.OnDownPtr = 0;
 Label382.OnClickPtr = 0;
 Label382.OnPressPtr = 0;

 Image69.OwnerScreen = &Schema1;
 Image69.Order = 0;
 Image69.Left = 0;
 Image69.Top = 0;
 Image69.Width = 480;
 Image69.Height = 272;
 Image69.Picture_Type = 1;
 Image69.Picture_Ratio = 1;
 Image69.Picture_Name =  0x00297ED8 ;
 Image69.Visible = 1;
 Image69.Active = 0;
 Image69.OnUpPtr = 0;
 Image69.OnDownPtr = 0;
 Image69.OnClickPtr = BackToHome;
 Image69.OnPressPtr = 0;

 Image71.OwnerScreen = &Schema1;
 Image71.Order = 1;
 Image71.Left = 0;
 Image71.Top = 0;
 Image71.Width = 480;
 Image71.Height = 28;
 Image71.Picture_Type = 1;
 Image71.Picture_Ratio = 1;
 Image71.Picture_Name =  0x002D7ADE ;
 Image71.Visible = 1;
 Image71.Active = 0;
 Image71.OnUpPtr = 0;
 Image71.OnDownPtr = 0;
 Image71.OnClickPtr = 0;
 Image71.OnPressPtr = 0;

 Label42.OwnerScreen = &Schema1;
 Label42.Order = 2;
 Label42.Left = 207;
 Label42.Top = 5;
 Label42.Width = 82;
 Label42.Height = 20;
 Label42.Visible = 1;
 Label42.Active = 0;
 Label42.Caption = Label42_Caption;
 Label42.FontName =  0x00005242 ;
 Label42.Font_Color = 0xE7FC;
 Label42.VerticalText = 0;
 Label42.OnUpPtr = 0;
 Label42.OnDownPtr = 0;
 Label42.OnClickPtr = 0;
 Label42.OnPressPtr = 0;

 Image73.OwnerScreen = &Schema1;
 Image73.Order = 3;
 Image73.Left = 178;
 Image73.Top = 72;
 Image73.Width = 16;
 Image73.Height = 34;
 Image73.Picture_Type = 1;
 Image73.Picture_Ratio = 1;
 Image73.Picture_Name =  0x002DE3E4 ;
 Image73.Visible = 1;
 Image73.Active = 1;
 Image73.OnUpPtr = 0;
 Image73.OnDownPtr = 0;
 Image73.OnClickPtr = 0;
 Image73.OnPressPtr = 0;

 Image74.OwnerScreen = &Schema1;
 Image74.Order = 4;
 Image74.Left = 16;
 Image74.Top = 42;
 Image74.Width = 36;
 Image74.Height = 34;
 Image74.Picture_Type = 1;
 Image74.Picture_Ratio = 1;
 Image74.Picture_Name =  0x002DE82A ;
 Image74.Visible = 1;
 Image74.Active = 1;
 Image74.OnUpPtr = 0;
 Image74.OnDownPtr = 0;
 Image74.OnClickPtr = 0;
 Image74.OnPressPtr = 0;

 Image75.OwnerScreen = &Schema1;
 Image75.Order = 5;
 Image75.Left = 323;
 Image75.Top = 217;
 Image75.Width = 36;
 Image75.Height = 34;
 Image75.Picture_Type = 1;
 Image75.Picture_Ratio = 1;
 Image75.Picture_Name =  0x002DE82A ;
 Image75.Visible = 1;
 Image75.Active = 1;
 Image75.OnUpPtr = 0;
 Image75.OnDownPtr = 0;
 Image75.OnClickPtr = 0;
 Image75.OnPressPtr = 0;

 Image76.OwnerScreen = &Schema1;
 Image76.Order = 6;
 Image76.Left = 164;
 Image76.Top = 126;
 Image76.Width = 37;
 Image76.Height = 38;
 Image76.Picture_Type = 1;
 Image76.Picture_Ratio = 1;
 Image76.Picture_Name =  0x002DF1C0 ;
 Image76.Visible = 1;
 Image76.Active = 1;
 Image76.OnUpPtr = 0;
 Image76.OnDownPtr = 0;
 Image76.OnClickPtr = 0;
 Image76.OnPressPtr = 0;

 Image77.OwnerScreen = &Schema1;
 Image77.Order = 7;
 Image77.Left = 322;
 Image77.Top = 54;
 Image77.Width = 22;
 Image77.Height = 18;
 Image77.Picture_Type = 1;
 Image77.Picture_Ratio = 1;
 Image77.Picture_Name =  0x002DFCC2 ;
 Image77.Visible = 1;
 Image77.Active = 1;
 Image77.OnUpPtr = 0;
 Image77.OnDownPtr = 0;
 Image77.OnClickPtr = 0;
 Image77.OnPressPtr = 0;

 Image79.OwnerScreen = &Schema1;
 Image79.Order = 8;
 Image79.Left = 431;
 Image79.Top = 154;
 Image79.Width = 36;
 Image79.Height = 53;
 Image79.Picture_Type = 1;
 Image79.Picture_Ratio = 1;
 Image79.Picture_Name =  0x002DFFE0 ;
 Image79.Visible = 1;
 Image79.Active = 1;
 Image79.OnUpPtr = 0;
 Image79.OnDownPtr = 0;
 Image79.OnClickPtr = 0;
 Image79.OnPressPtr = 0;

 S_Brine_In_1.OwnerScreen = &Schema1;
 S_Brine_In_1.Order = 9;
 S_Brine_In_1.Left = 66;
 S_Brine_In_1.Top = 66;
 S_Brine_In_1.Width = 19;
 S_Brine_In_1.Height = 18;
 S_Brine_In_1.Pen_Width = 0;
 S_Brine_In_1.Pen_Color = 0x0000;
 S_Brine_In_1.Visible = 1;
 S_Brine_In_1.Active = 1;
 S_Brine_In_1.Transparent = 1;
 S_Brine_In_1.Caption = S_Brine_In_1_Caption;
 S_Brine_In_1.TextAlign = _taRight;
 S_Brine_In_1.TextAlignVertical= _tavMiddle;
 S_Brine_In_1.FontName =  0x00003E9A ;
 S_Brine_In_1.PressColEnabled = 1;
 S_Brine_In_1.Font_Color = 0x001F;
 S_Brine_In_1.VerticalText = 0;
 S_Brine_In_1.Gradient = 0;
 S_Brine_In_1.Gradient_Orientation = 0;
 S_Brine_In_1.Gradient_Start_Color = 0xFFFF;
 S_Brine_In_1.Gradient_End_Color = 0xC618;
 S_Brine_In_1.Color = 0xFFFF;
 S_Brine_In_1.Press_Color = 0xE71C;
 S_Brine_In_1.OnUpPtr = 0;
 S_Brine_In_1.OnDownPtr = 0;
 S_Brine_In_1.OnClickPtr = 0;
 S_Brine_In_1.OnPressPtr = 0;

 S_Brine_Out_1.OwnerScreen = &Schema1;
 S_Brine_Out_1.Order = 10;
 S_Brine_Out_1.Left = 68;
 S_Brine_Out_1.Top = 203;
 S_Brine_Out_1.Width = 18;
 S_Brine_Out_1.Height = 18;
 S_Brine_Out_1.Pen_Width = 0;
 S_Brine_Out_1.Pen_Color = 0x0000;
 S_Brine_Out_1.Visible = 1;
 S_Brine_Out_1.Active = 1;
 S_Brine_Out_1.Transparent = 1;
 S_Brine_Out_1.Caption = S_Brine_Out_1_Caption;
 S_Brine_Out_1.TextAlign = _taRight;
 S_Brine_Out_1.TextAlignVertical= _tavMiddle;
 S_Brine_Out_1.FontName =  0x00003E9A ;
 S_Brine_Out_1.PressColEnabled = 1;
 S_Brine_Out_1.Font_Color = 0x001F;
 S_Brine_Out_1.VerticalText = 0;
 S_Brine_Out_1.Gradient = 0;
 S_Brine_Out_1.Gradient_Orientation = 0;
 S_Brine_Out_1.Gradient_Start_Color = 0xFFFF;
 S_Brine_Out_1.Gradient_End_Color = 0xC618;
 S_Brine_Out_1.Color = 0xFFFF;
 S_Brine_Out_1.Press_Color = 0xE71C;
 S_Brine_Out_1.OnUpPtr = 0;
 S_Brine_Out_1.OnDownPtr = 0;
 S_Brine_Out_1.OnClickPtr = 0;
 S_Brine_Out_1.OnPressPtr = 0;

 S_Heat_Out_1.OwnerScreen = &Schema1;
 S_Heat_Out_1.Order = 11;
 S_Heat_Out_1.Left = 288;
 S_Heat_Out_1.Top = 66;
 S_Heat_Out_1.Width = 19;
 S_Heat_Out_1.Height = 18;
 S_Heat_Out_1.Pen_Width = 0;
 S_Heat_Out_1.Pen_Color = 0x0000;
 S_Heat_Out_1.Visible = 1;
 S_Heat_Out_1.Active = 1;
 S_Heat_Out_1.Transparent = 1;
 S_Heat_Out_1.Caption = S_Heat_Out_1_Caption;
 S_Heat_Out_1.TextAlign = _taRight;
 S_Heat_Out_1.TextAlignVertical= _tavMiddle;
 S_Heat_Out_1.FontName =  0x00003E9A ;
 S_Heat_Out_1.PressColEnabled = 1;
 S_Heat_Out_1.Font_Color = 0xFC10;
 S_Heat_Out_1.VerticalText = 0;
 S_Heat_Out_1.Gradient = 0;
 S_Heat_Out_1.Gradient_Orientation = 0;
 S_Heat_Out_1.Gradient_Start_Color = 0xFFFF;
 S_Heat_Out_1.Gradient_End_Color = 0xC618;
 S_Heat_Out_1.Color = 0xFFFF;
 S_Heat_Out_1.Press_Color = 0xE71C;
 S_Heat_Out_1.OnUpPtr = 0;
 S_Heat_Out_1.OnDownPtr = 0;
 S_Heat_Out_1.OnClickPtr = 0;
 S_Heat_Out_1.OnPressPtr = 0;

 S_Heat_In_1.OwnerScreen = &Schema1;
 S_Heat_In_1.Order = 12;
 S_Heat_In_1.Left = 292;
 S_Heat_In_1.Top = 205;
 S_Heat_In_1.Width = 19;
 S_Heat_In_1.Height = 18;
 S_Heat_In_1.Pen_Width = 0;
 S_Heat_In_1.Pen_Color = 0x0000;
 S_Heat_In_1.Visible = 1;
 S_Heat_In_1.Active = 1;
 S_Heat_In_1.Transparent = 1;
 S_Heat_In_1.Caption = S_Heat_In_1_Caption;
 S_Heat_In_1.TextAlign = _taRight;
 S_Heat_In_1.TextAlignVertical= _tavMiddle;
 S_Heat_In_1.FontName =  0x00003E9A ;
 S_Heat_In_1.PressColEnabled = 1;
 S_Heat_In_1.Font_Color = 0xFC10;
 S_Heat_In_1.VerticalText = 0;
 S_Heat_In_1.Gradient = 0;
 S_Heat_In_1.Gradient_Orientation = 0;
 S_Heat_In_1.Gradient_Start_Color = 0xFFFF;
 S_Heat_In_1.Gradient_End_Color = 0xC618;
 S_Heat_In_1.Color = 0xFFFF;
 S_Heat_In_1.Press_Color = 0xE71C;
 S_Heat_In_1.OnUpPtr = 0;
 S_Heat_In_1.OnDownPtr = 0;
 S_Heat_In_1.OnClickPtr = 0;
 S_Heat_In_1.OnPressPtr = 0;

 Sens_DHW.OwnerScreen = &Schema1;
 Sens_DHW.Order = 13;
 Sens_DHW.Left = 387;
 Sens_DHW.Top = 62;
 Sens_DHW.Width = 16;
 Sens_DHW.Height = 18;
 Sens_DHW.Pen_Width = 0;
 Sens_DHW.Pen_Color = 0x0000;
 Sens_DHW.Visible = 1;
 Sens_DHW.Active = 1;
 Sens_DHW.Transparent = 1;
 Sens_DHW.Caption = Sens_DHW_Caption;
 Sens_DHW.TextAlign = _taRight;
 Sens_DHW.TextAlignVertical= _tavMiddle;
 Sens_DHW.FontName =  0x00003E9A ;
 Sens_DHW.PressColEnabled = 1;
 Sens_DHW.Font_Color = 0xF800;
 Sens_DHW.VerticalText = 0;
 Sens_DHW.Gradient = 0;
 Sens_DHW.Gradient_Orientation = 0;
 Sens_DHW.Gradient_Start_Color = 0xFFFF;
 Sens_DHW.Gradient_End_Color = 0xC618;
 Sens_DHW.Color = 0xFFFF;
 Sens_DHW.Press_Color = 0xE71C;
 Sens_DHW.OnUpPtr = 0;
 Sens_DHW.OnDownPtr = 0;
 Sens_DHW.OnClickPtr = 0;
 Sens_DHW.OnPressPtr = 0;

 S_tank.OwnerScreen = &Schema1;
 S_tank.Order = 14;
 S_tank.Left = 387;
 S_tank.Top = 197;
 S_tank.Width = 18;
 S_tank.Height = 20;
 S_tank.Pen_Width = 0;
 S_tank.Pen_Color = 0x0000;
 S_tank.Visible = 1;
 S_tank.Active = 1;
 S_tank.Transparent = 1;
 S_tank.Caption = S_tank_Caption;
 S_tank.TextAlign = _taRight;
 S_tank.TextAlignVertical= _tavMiddle;
 S_tank.FontName =  0x00003E9A ;
 S_tank.PressColEnabled = 1;
 S_tank.Font_Color = 0xFC08;
 S_tank.VerticalText = 0;
 S_tank.Gradient = 0;
 S_tank.Gradient_Orientation = 0;
 S_tank.Gradient_Start_Color = 0xFFFF;
 S_tank.Gradient_End_Color = 0xC618;
 S_tank.Color = 0xFFFF;
 S_tank.Press_Color = 0xE71C;
 S_tank.OnUpPtr = 0;
 S_tank.OnDownPtr = 0;
 S_tank.OnClickPtr = 0;
 S_tank.OnPressPtr = 0;

 S_ComprEx_1.OwnerScreen = &Schema1;
 S_ComprEx_1.Order = 15;
 S_ComprEx_1.Left = 147;
 S_ComprEx_1.Top = 167;
 S_ComprEx_1.Width = 27;
 S_ComprEx_1.Height = 18;
 S_ComprEx_1.Pen_Width = 0;
 S_ComprEx_1.Pen_Color = 0x0000;
 S_ComprEx_1.Visible = 1;
 S_ComprEx_1.Active = 1;
 S_ComprEx_1.Transparent = 1;
 S_ComprEx_1.Caption = S_ComprEx_1_Caption;
 S_ComprEx_1.TextAlign = _taRight;
 S_ComprEx_1.TextAlignVertical= _tavMiddle;
 S_ComprEx_1.FontName =  0x00003E9A ;
 S_ComprEx_1.PressColEnabled = 1;
 S_ComprEx_1.Font_Color = 0xF81F;
 S_ComprEx_1.VerticalText = 0;
 S_ComprEx_1.Gradient = 0;
 S_ComprEx_1.Gradient_Orientation = 0;
 S_ComprEx_1.Gradient_Start_Color = 0xFFFF;
 S_ComprEx_1.Gradient_End_Color = 0xC618;
 S_ComprEx_1.Color = 0xFFFF;
 S_ComprEx_1.Press_Color = 0xE71C;
 S_ComprEx_1.OnUpPtr = 0;
 S_ComprEx_1.OnDownPtr = 0;
 S_ComprEx_1.OnClickPtr = 0;
 S_ComprEx_1.OnPressPtr = 0;

 S_High_Press_1.OwnerScreen = &Schema1;
 S_High_Press_1.Order = 16;
 S_High_Press_1.Left = 137;
 S_High_Press_1.Top = 104;
 S_High_Press_1.Width = 19;
 S_High_Press_1.Height = 18;
 S_High_Press_1.Pen_Width = 0;
 S_High_Press_1.Pen_Color = 0x0000;
 S_High_Press_1.Visible = 1;
 S_High_Press_1.Active = 1;
 S_High_Press_1.Transparent = 1;
 S_High_Press_1.Caption = S_High_Press_1_Caption;
 S_High_Press_1.TextAlign = _taRight;
 S_High_Press_1.TextAlignVertical= _tavMiddle;
 S_High_Press_1.FontName =  0x00003E9A ;
 S_High_Press_1.PressColEnabled = 1;
 S_High_Press_1.Font_Color = 0x0400;
 S_High_Press_1.VerticalText = 0;
 S_High_Press_1.Gradient = 0;
 S_High_Press_1.Gradient_Orientation = 0;
 S_High_Press_1.Gradient_Start_Color = 0xFFFF;
 S_High_Press_1.Gradient_End_Color = 0xC618;
 S_High_Press_1.Color = 0xFFFF;
 S_High_Press_1.Press_Color = 0xE71C;
 S_High_Press_1.OnUpPtr = 0;
 S_High_Press_1.OnDownPtr = 0;
 S_High_Press_1.OnClickPtr = 0;
 S_High_Press_1.OnPressPtr = 0;

 S_Low_Press_1.OwnerScreen = &Schema1;
 S_Low_Press_1.Order = 17;
 S_Low_Press_1.Left = 208;
 S_Low_Press_1.Top = 106;
 S_Low_Press_1.Width = 19;
 S_Low_Press_1.Height = 18;
 S_Low_Press_1.Pen_Width = 0;
 S_Low_Press_1.Pen_Color = 0x0000;
 S_Low_Press_1.Visible = 1;
 S_Low_Press_1.Active = 1;
 S_Low_Press_1.Transparent = 1;
 S_Low_Press_1.Caption = S_Low_Press_1_Caption;
 S_Low_Press_1.TextAlign = _taRight;
 S_Low_Press_1.TextAlignVertical= _tavMiddle;
 S_Low_Press_1.FontName =  0x00003E9A ;
 S_Low_Press_1.PressColEnabled = 1;
 S_Low_Press_1.Font_Color = 0x0400;
 S_Low_Press_1.VerticalText = 0;
 S_Low_Press_1.Gradient = 0;
 S_Low_Press_1.Gradient_Orientation = 0;
 S_Low_Press_1.Gradient_Start_Color = 0xFFFF;
 S_Low_Press_1.Gradient_End_Color = 0xC618;
 S_Low_Press_1.Color = 0xFFFF;
 S_Low_Press_1.Press_Color = 0xE71C;
 S_Low_Press_1.OnUpPtr = 0;
 S_Low_Press_1.OnDownPtr = 0;
 S_Low_Press_1.OnClickPtr = 0;
 S_Low_Press_1.OnPressPtr = 0;

 S_SH_1.OwnerScreen = &Schema1;
 S_SH_1.Order = 18;
 S_SH_1.Left = 145;
 S_SH_1.Top = 209;
 S_SH_1.Width = 19;
 S_SH_1.Height = 18;
 S_SH_1.Pen_Width = 0;
 S_SH_1.Pen_Color = 0x0000;
 S_SH_1.Visible = 1;
 S_SH_1.Active = 1;
 S_SH_1.Transparent = 1;
 S_SH_1.Caption = S_SH_1_Caption;
 S_SH_1.TextAlign = _taRight;
 S_SH_1.TextAlignVertical= _tavMiddle;
 S_SH_1.FontName =  0x00003E9A ;
 S_SH_1.PressColEnabled = 1;
 S_SH_1.Font_Color = 0x8208;
 S_SH_1.VerticalText = 0;
 S_SH_1.Gradient = 0;
 S_SH_1.Gradient_Orientation = 0;
 S_SH_1.Gradient_Start_Color = 0xFFFF;
 S_SH_1.Gradient_End_Color = 0xC618;
 S_SH_1.Color = 0xFFFF;
 S_SH_1.Press_Color = 0xE71C;
 S_SH_1.OnUpPtr = 0;
 S_SH_1.OnDownPtr = 0;
 S_SH_1.OnClickPtr = 0;
 S_SH_1.OnPressPtr = 0;

 Image78.OwnerScreen = &Schema1;
 Image78.Order = 19;
 Image78.Left = 430;
 Image78.Top = 112;
 Image78.Width = 36;
 Image78.Height = 34;
 Image78.Picture_Type = 1;
 Image78.Picture_Ratio = 1;
 Image78.Picture_Name =  0x002DE82A ;
 Image78.Visible = 1;
 Image78.Active = 1;
 Image78.OnUpPtr = 0;
 Image78.OnDownPtr = 0;
 Image78.OnClickPtr = 0;
 Image78.OnPressPtr = 0;

 Image80.OwnerScreen = &Schema1;
 Image80.Order = 20;
 Image80.Left = 349;
 Image80.Top = 89;
 Image80.Width = 20;
 Image80.Height = 20;
 Image80.Picture_Type = 1;
 Image80.Picture_Ratio = 1;
 Image80.Picture_Name =  0x002E0ECE ;
 Image80.Visible = 1;
 Image80.Active = 1;
 Image80.OnUpPtr = 0;
 Image80.OnDownPtr = 0;
 Image80.OnClickPtr = 0;
 Image80.OnPressPtr = 0;

 flow_source.OwnerScreen = &Schema1;
 flow_source.Order = 21;
 flow_source.Left = 14;
 flow_source.Top = 80;
 flow_source.Width = 43;
 flow_source.Height = 18;
 flow_source.Pen_Width = 0;
 flow_source.Pen_Color = 0x0000;
 flow_source.Visible = 1;
 flow_source.Active = 1;
 flow_source.Transparent = 1;
 flow_source.Caption = flow_source_Caption;
 flow_source.TextAlign = _taRight;
 flow_source.TextAlignVertical= _tavMiddle;
 flow_source.FontName =  0x00003E9A ;
 flow_source.PressColEnabled = 1;
 flow_source.Font_Color = 0x8408;
 flow_source.VerticalText = 0;
 flow_source.Gradient = 0;
 flow_source.Gradient_Orientation = 0;
 flow_source.Gradient_Start_Color = 0xFFFF;
 flow_source.Gradient_End_Color = 0xC618;
 flow_source.Color = 0xFFFF;
 flow_source.Press_Color = 0xE71C;
 flow_source.OnUpPtr = 0;
 flow_source.OnDownPtr = 0;
 flow_source.OnClickPtr = 0;
 flow_source.OnPressPtr = 0;

 flow_heat.OwnerScreen = &Schema1;
 flow_heat.Order = 22;
 flow_heat.Left = 324;
 flow_heat.Top = 252;
 flow_heat.Width = 41;
 flow_heat.Height = 18;
 flow_heat.Pen_Width = 0;
 flow_heat.Pen_Color = 0x0000;
 flow_heat.Visible = 1;
 flow_heat.Active = 1;
 flow_heat.Transparent = 1;
 flow_heat.Caption = flow_heat_Caption;
 flow_heat.TextAlign = _taRight;
 flow_heat.TextAlignVertical= _tavMiddle;
 flow_heat.FontName =  0x00003E9A ;
 flow_heat.PressColEnabled = 1;
 flow_heat.Font_Color = 0x8408;
 flow_heat.VerticalText = 0;
 flow_heat.Gradient = 0;
 flow_heat.Gradient_Orientation = 0;
 flow_heat.Gradient_Start_Color = 0xFFFF;
 flow_heat.Gradient_End_Color = 0xC618;
 flow_heat.Color = 0xFFFF;
 flow_heat.Press_Color = 0xE71C;
 flow_heat.OnUpPtr = 0;
 flow_heat.OnDownPtr = 0;
 flow_heat.OnClickPtr = 0;
 flow_heat.OnPressPtr = 0;

 Image117.OwnerScreen = &Schema1;
 Image117.Order = 23;
 Image117.Left = 16;
 Image117.Top = 42;
 Image117.Width = 36;
 Image117.Height = 34;
 Image117.Picture_Type = 1;
 Image117.Picture_Ratio = 1;
 Image117.Picture_Name =  0x002E11F4 ;
 Image117.Visible = 1;
 Image117.Active = 1;
 Image117.OnUpPtr = 0;
 Image117.OnDownPtr = 0;
 Image117.OnClickPtr = 0;
 Image117.OnPressPtr = 0;

 Image118.OwnerScreen = &Schema1;
 Image118.Order = 24;
 Image118.Left = 178;
 Image118.Top = 72;
 Image118.Width = 16;
 Image118.Height = 35;
 Image118.Picture_Type = 1;
 Image118.Picture_Ratio = 1;
 Image118.Picture_Name =  0x002E1B8A ;
 Image118.Visible = 1;
 Image118.Active = 1;
 Image118.OnUpPtr = 0;
 Image118.OnDownPtr = 0;
 Image118.OnClickPtr = 0;
 Image118.OnPressPtr = 0;

 Image119.OwnerScreen = &Schema1;
 Image119.Order = 25;
 Image119.Left = 164;
 Image119.Top = 126;
 Image119.Width = 38;
 Image119.Height = 37;
 Image119.Picture_Type = 1;
 Image119.Picture_Ratio = 1;
 Image119.Picture_Name =  0x002E1FF0 ;
 Image119.Visible = 1;
 Image119.Active = 1;
 Image119.OnUpPtr = 0;
 Image119.OnDownPtr = 0;
 Image119.OnClickPtr = 0;
 Image119.OnPressPtr = 0;

 Image120.OwnerScreen = &Schema1;
 Image120.Order = 26;
 Image120.Left = 323;
 Image120.Top = 54;
 Image120.Width = 22;
 Image120.Height = 19;
 Image120.Picture_Type = 1;
 Image120.Picture_Ratio = 1;
 Image120.Picture_Name =  0x002E2AF2 ;
 Image120.Visible = 1;
 Image120.Active = 1;
 Image120.OnUpPtr = 0;
 Image120.OnDownPtr = 0;
 Image120.OnClickPtr = 0;
 Image120.OnPressPtr = 0;

 Image124.OwnerScreen = &Schema1;
 Image124.Order = 27;
 Image124.Left = 323;
 Image124.Top = 216;
 Image124.Width = 36;
 Image124.Height = 34;
 Image124.Picture_Type = 1;
 Image124.Picture_Ratio = 1;
 Image124.Picture_Name =  0x002E11F4 ;
 Image124.Visible = 1;
 Image124.Active = 1;
 Image124.OnUpPtr = 0;
 Image124.OnDownPtr = 0;
 Image124.OnClickPtr = 0;
 Image124.OnPressPtr = 0;

 Image126.OwnerScreen = &Schema1;
 Image126.Order = 28;
 Image126.Left = 430;
 Image126.Top = 112;
 Image126.Width = 36;
 Image126.Height = 34;
 Image126.Picture_Type = 1;
 Image126.Picture_Ratio = 1;
 Image126.Picture_Name =  0x002E11F4 ;
 Image126.Visible = 1;
 Image126.Active = 1;
 Image126.OnUpPtr = 0;
 Image126.OnDownPtr = 0;
 Image126.OnClickPtr = 0;
 Image126.OnPressPtr = 0;

 Image127.OwnerScreen = &Schema1;
 Image127.Order = 29;
 Image127.Left = 349;
 Image127.Top = 89;
 Image127.Width = 20;
 Image127.Height = 20;
 Image127.Picture_Type = 1;
 Image127.Picture_Ratio = 1;
 Image127.Picture_Name =  0x002E2E3C ;
 Image127.Visible = 1;
 Image127.Active = 1;
 Image127.OnUpPtr = 0;
 Image127.OnDownPtr = 0;
 Image127.OnClickPtr = 0;
 Image127.OnPressPtr = 0;

 Image131.OwnerScreen = &Schema1;
 Image131.Order = 30;
 Image131.Left = 431;
 Image131.Top = 152;
 Image131.Width = 36;
 Image131.Height = 55;
 Image131.Picture_Type = 1;
 Image131.Picture_Ratio = 1;
 Image131.Picture_Name =  0x002E3162 ;
 Image131.Visible = 1;
 Image131.Active = 1;
 Image131.OnUpPtr = 0;
 Image131.OnDownPtr = 0;
 Image131.OnClickPtr = 0;
 Image131.OnPressPtr = 0;

 flow_sun.OwnerScreen = &Schema1;
 flow_sun.Order = 31;
 flow_sun.Left = 434;
 flow_sun.Top = 88;
 flow_sun.Width = 25;
 flow_sun.Height = 18;
 flow_sun.Pen_Width = 0;
 flow_sun.Pen_Color = 0x0000;
 flow_sun.Visible = 1;
 flow_sun.Active = 1;
 flow_sun.Transparent = 1;
 flow_sun.Caption = flow_sun_Caption;
 flow_sun.TextAlign = _taRight;
 flow_sun.TextAlignVertical= _tavMiddle;
 flow_sun.FontName =  0x00003E9A ;
 flow_sun.PressColEnabled = 1;
 flow_sun.Font_Color = 0xB5A0;
 flow_sun.VerticalText = 0;
 flow_sun.Gradient = 0;
 flow_sun.Gradient_Orientation = 0;
 flow_sun.Gradient_Start_Color = 0xFFFF;
 flow_sun.Gradient_End_Color = 0xC618;
 flow_sun.Color = 0xFFFF;
 flow_sun.Press_Color = 0xE71C;
 flow_sun.OnUpPtr = 0;
 flow_sun.OnDownPtr = 0;
 flow_sun.OnClickPtr = 0;
 flow_sun.OnPressPtr = 0;

 draw_One_ground_back.OwnerScreen = &Schema1;
 draw_One_ground_back.Order = 32;
 draw_One_ground_back.Left = 0;
 draw_One_ground_back.Top = 27;
 draw_One_ground_back.Width = 479;
 draw_One_ground_back.Height = 243;
 draw_One_ground_back.Pen_Width = 0;
 draw_One_ground_back.Pen_Color = 0x0000;
 draw_One_ground_back.Visible = 1;
 draw_One_ground_back.Active = 1;
 draw_One_ground_back.Transparent = 0;
 draw_One_ground_back.Caption = draw_One_ground_back_Caption;
 draw_One_ground_back.TextAlign = _taCenter;
 draw_One_ground_back.TextAlignVertical= _tavMiddle;
 draw_One_ground_back.FontName =  0x00005242 ;
 draw_One_ground_back.PressColEnabled = 1;
 draw_One_ground_back.Font_Color = 0x0000;
 draw_One_ground_back.VerticalText = 0;
 draw_One_ground_back.Gradient = 0;
 draw_One_ground_back.Gradient_Orientation = 0;
 draw_One_ground_back.Gradient_Start_Color = 0xFFFF;
 draw_One_ground_back.Gradient_End_Color = 0xC618;
 draw_One_ground_back.Color = 0xC618;
 draw_One_ground_back.Press_Color = 0xE71C;
 draw_One_ground_back.OnUpPtr = 0;
 draw_One_ground_back.OnDownPtr = 0;
 draw_One_ground_back.OnClickPtr = BackToHome;
 draw_One_ground_back.OnPressPtr = 0;

 Image41.OwnerScreen = &MODE;
 Image41.Order = 0;
 Image41.Left = 0;
 Image41.Top = 0;
 Image41.Width = 480;
 Image41.Height = 272;
 Image41.Picture_Type = 1;
 Image41.Picture_Ratio = 1;
 Image41.Picture_Name =  0x002E40E0 ;
 Image41.Visible = 1;
 Image41.Active = 0;
 Image41.OnUpPtr = 0;
 Image41.OnDownPtr = 0;
 Image41.OnClickPtr = 0;
 Image41.OnPressPtr = 0;

 Power_220V.OwnerScreen = &MODE;
 Power_220V.Order = 1;
 Power_220V.Left = 416;
 Power_220V.Top = 200;
 Power_220V.Width = 50;
 Power_220V.Height = 28;
 Power_220V.Picture_Type = 1;
 Power_220V.Picture_Ratio = 1;
 Power_220V.Picture_Name =  0x00323CE6 ;
 Power_220V.Visible = 1;
 Power_220V.Active = 0;
 Power_220V.OnUpPtr = 0;
 Power_220V.OnDownPtr = 0;
 Power_220V.OnClickPtr = 0;
 Power_220V.OnPressPtr = 0;

 Label239.OwnerScreen = &MODE;
 Label239.Order = 2;
 Label239.Left = 220;
 Label239.Top = 5;
 Label239.Width = 51;
 Label239.Height = 20;
 Label239.Visible = 1;
 Label239.Active = 0;
 Label239.Caption = Label239_Caption;
 Label239.FontName =  0x00005242 ;
 Label239.Font_Color = 0xE7FC;
 Label239.VerticalText = 0;
 Label239.OnUpPtr = 0;
 Label239.OnDownPtr = 0;
 Label239.OnClickPtr = 0;
 Label239.OnPressPtr = 0;

 Two_Compressors.OwnerScreen = &MODE;
 Two_Compressors.Order = 3;
 Two_Compressors.Left = 415;
 Two_Compressors.Top = 33;
 Two_Compressors.Width = 50;
 Two_Compressors.Height = 30;
 Two_Compressors.Picture_Type = 1;
 Two_Compressors.Picture_Ratio = 1;
 Two_Compressors.Picture_Name =  0x003247DC ;
 Two_Compressors.Visible = 1;
 Two_Compressors.Active = 0;
 Two_Compressors.OnUpPtr = 0;
 Two_Compressors.OnDownPtr = 0;
 Two_Compressors.OnClickPtr = 0;
 Two_Compressors.OnPressPtr = 0;

 Reversing_Heat_OFF.OwnerScreen = &MODE;
 Reversing_Heat_OFF.Order = 4;
 Reversing_Heat_OFF.Left = 415;
 Reversing_Heat_OFF.Top = 66;
 Reversing_Heat_OFF.Width = 50;
 Reversing_Heat_OFF.Height = 30;
 Reversing_Heat_OFF.Picture_Type = 1;
 Reversing_Heat_OFF.Picture_Ratio = 1;
 Reversing_Heat_OFF.Picture_Name =  0x0032539A ;
 Reversing_Heat_OFF.Visible = 1;
 Reversing_Heat_OFF.Active = 0;
 Reversing_Heat_OFF.OnUpPtr = 0;
 Reversing_Heat_OFF.OnDownPtr = 0;
 Reversing_Heat_OFF.OnClickPtr = 0;
 Reversing_Heat_OFF.OnPressPtr = 0;

 Flow_Source_sensor_OFF.OwnerScreen = &MODE;
 Flow_Source_sensor_OFF.Order = 5;
 Flow_Source_sensor_OFF.Left = 415;
 Flow_Source_sensor_OFF.Top = 99;
 Flow_Source_sensor_OFF.Width = 50;
 Flow_Source_sensor_OFF.Height = 30;
 Flow_Source_sensor_OFF.Picture_Type = 1;
 Flow_Source_sensor_OFF.Picture_Ratio = 1;
 Flow_Source_sensor_OFF.Picture_Name =  0x0032539A ;
 Flow_Source_sensor_OFF.Visible = 1;
 Flow_Source_sensor_OFF.Active = 0;
 Flow_Source_sensor_OFF.OnUpPtr = 0;
 Flow_Source_sensor_OFF.OnDownPtr = 0;
 Flow_Source_sensor_OFF.OnClickPtr = 0;
 Flow_Source_sensor_OFF.OnPressPtr = 0;

 Flow_Source_Heat1_OFF.OwnerScreen = &MODE;
 Flow_Source_Heat1_OFF.Order = 6;
 Flow_Source_Heat1_OFF.Left = 415;
 Flow_Source_Heat1_OFF.Top = 132;
 Flow_Source_Heat1_OFF.Width = 50;
 Flow_Source_Heat1_OFF.Height = 30;
 Flow_Source_Heat1_OFF.Picture_Type = 1;
 Flow_Source_Heat1_OFF.Picture_Ratio = 1;
 Flow_Source_Heat1_OFF.Picture_Name =  0x0032539A ;
 Flow_Source_Heat1_OFF.Visible = 1;
 Flow_Source_Heat1_OFF.Active = 0;
 Flow_Source_Heat1_OFF.OnUpPtr = 0;
 Flow_Source_Heat1_OFF.OnDownPtr = 0;
 Flow_Source_Heat1_OFF.OnClickPtr = 0;
 Flow_Source_Heat1_OFF.OnPressPtr = 0;

 Flow_Source_Heat2_OFF.OwnerScreen = &MODE;
 Flow_Source_Heat2_OFF.Order = 7;
 Flow_Source_Heat2_OFF.Left = 415;
 Flow_Source_Heat2_OFF.Top = 164;
 Flow_Source_Heat2_OFF.Width = 50;
 Flow_Source_Heat2_OFF.Height = 30;
 Flow_Source_Heat2_OFF.Picture_Type = 1;
 Flow_Source_Heat2_OFF.Picture_Ratio = 1;
 Flow_Source_Heat2_OFF.Picture_Name =  0x0032539A ;
 Flow_Source_Heat2_OFF.Visible = 1;
 Flow_Source_Heat2_OFF.Active = 0;
 Flow_Source_Heat2_OFF.OnUpPtr = 0;
 Flow_Source_Heat2_OFF.OnDownPtr = 0;
 Flow_Source_Heat2_OFF.OnClickPtr = 0;
 Flow_Source_Heat2_OFF.OnPressPtr = 0;

 One_Compressors.OwnerScreen = &MODE;
 One_Compressors.Order = 8;
 One_Compressors.Left = 415;
 One_Compressors.Top = 33;
 One_Compressors.Width = 50;
 One_Compressors.Height = 30;
 One_Compressors.Picture_Type = 1;
 One_Compressors.Picture_Ratio = 1;
 One_Compressors.Picture_Name =  0x00325F58 ;
 One_Compressors.Visible = 1;
 One_Compressors.Active = 1;
 One_Compressors.OnUpPtr = 0;
 One_Compressors.OnDownPtr = 0;
 One_Compressors.OnClickPtr = One_CompressorsOnClick;
 One_Compressors.OnPressPtr = 0;

 Reversing_ON_HEAT.OwnerScreen = &MODE;
 Reversing_ON_HEAT.Order = 9;
 Reversing_ON_HEAT.Left = 415;
 Reversing_ON_HEAT.Top = 66;
 Reversing_ON_HEAT.Width = 50;
 Reversing_ON_HEAT.Height = 30;
 Reversing_ON_HEAT.Picture_Type = 1;
 Reversing_ON_HEAT.Picture_Ratio = 1;
 Reversing_ON_HEAT.Picture_Name =  0x00326B16 ;
 Reversing_ON_HEAT.Visible = 1;
 Reversing_ON_HEAT.Active = 1;
 Reversing_ON_HEAT.OnUpPtr = 0;
 Reversing_ON_HEAT.OnDownPtr = 0;
 Reversing_ON_HEAT.OnClickPtr = Reversing_ON_HEATOnClick;
 Reversing_ON_HEAT.OnPressPtr = 0;

 Flow_Source__Sensor_ON.OwnerScreen = &MODE;
 Flow_Source__Sensor_ON.Order = 10;
 Flow_Source__Sensor_ON.Left = 415;
 Flow_Source__Sensor_ON.Top = 99;
 Flow_Source__Sensor_ON.Width = 50;
 Flow_Source__Sensor_ON.Height = 30;
 Flow_Source__Sensor_ON.Picture_Type = 1;
 Flow_Source__Sensor_ON.Picture_Ratio = 1;
 Flow_Source__Sensor_ON.Picture_Name =  0x00326B16 ;
 Flow_Source__Sensor_ON.Visible = 1;
 Flow_Source__Sensor_ON.Active = 1;
 Flow_Source__Sensor_ON.OnUpPtr = 0;
 Flow_Source__Sensor_ON.OnDownPtr = 0;
 Flow_Source__Sensor_ON.OnClickPtr = Flow_Source__Sensor_ONOnClick;
 Flow_Source__Sensor_ON.OnPressPtr = 0;

 Flow_Source__Heat1_ON.OwnerScreen = &MODE;
 Flow_Source__Heat1_ON.Order = 11;
 Flow_Source__Heat1_ON.Left = 415;
 Flow_Source__Heat1_ON.Top = 132;
 Flow_Source__Heat1_ON.Width = 50;
 Flow_Source__Heat1_ON.Height = 30;
 Flow_Source__Heat1_ON.Picture_Type = 1;
 Flow_Source__Heat1_ON.Picture_Ratio = 1;
 Flow_Source__Heat1_ON.Picture_Name =  0x00326B16 ;
 Flow_Source__Heat1_ON.Visible = 1;
 Flow_Source__Heat1_ON.Active = 1;
 Flow_Source__Heat1_ON.OnUpPtr = 0;
 Flow_Source__Heat1_ON.OnDownPtr = 0;
 Flow_Source__Heat1_ON.OnClickPtr = Flow_Source__Heat1_ONOnClick;
 Flow_Source__Heat1_ON.OnPressPtr = 0;

 Flow_Source__Heat2_ON.OwnerScreen = &MODE;
 Flow_Source__Heat2_ON.Order = 12;
 Flow_Source__Heat2_ON.Left = 415;
 Flow_Source__Heat2_ON.Top = 165;
 Flow_Source__Heat2_ON.Width = 50;
 Flow_Source__Heat2_ON.Height = 30;
 Flow_Source__Heat2_ON.Picture_Type = 1;
 Flow_Source__Heat2_ON.Picture_Ratio = 1;
 Flow_Source__Heat2_ON.Picture_Name =  0x00326B16 ;
 Flow_Source__Heat2_ON.Visible = 1;
 Flow_Source__Heat2_ON.Active = 1;
 Flow_Source__Heat2_ON.OnUpPtr = 0;
 Flow_Source__Heat2_ON.OnDownPtr = 0;
 Flow_Source__Heat2_ON.OnClickPtr = Flow_Source__Heat2_ONOnClick;
 Flow_Source__Heat2_ON.OnPressPtr = 0;

 Power_380V.OwnerScreen = &MODE;
 Power_380V.Order = 13;
 Power_380V.Left = 416;
 Power_380V.Top = 200;
 Power_380V.Width = 50;
 Power_380V.Height = 28;
 Power_380V.Picture_Type = 1;
 Power_380V.Picture_Ratio = 1;
 Power_380V.Picture_Name =  0x003276D4 ;
 Power_380V.Visible = 1;
 Power_380V.Active = 1;
 Power_380V.OnUpPtr = 0;
 Power_380V.OnDownPtr = 0;
 Power_380V.OnClickPtr = Power_380VOnClick;
 Power_380V.OnPressPtr = 0;

 Home_b17.OwnerScreen = &MODE;
 Home_b17.Order = 14;
 Home_b17.Left = 201;
 Home_b17.Top = 232;
 Home_b17.Width = 78;
 Home_b17.Height = 35;
 Home_b17.Pen_Width = 1;
 Home_b17.Pen_Color = 0xC618;
 Home_b17.Visible = 1;
 Home_b17.Active = 1;
 Home_b17.Transparent = 1;
 Home_b17.Caption = Home_b17_Caption;
 Home_b17.TextAlign = _taCenter;
 Home_b17.TextAlignVertical= _tavMiddle;
 Home_b17.FontName =  0x00005242 ;
 Home_b17.PressColEnabled = 1;
 Home_b17.Font_Color = 0xD6BA;
 Home_b17.VerticalText = 0;
 Home_b17.Gradient = 1;
 Home_b17.Gradient_Orientation = 0;
 Home_b17.Gradient_Start_Color = 0x0418;
 Home_b17.Gradient_End_Color = 0x00A5;
 Home_b17.Color = 0xC618;
 Home_b17.Press_Color = 0xE71C;
 Home_b17.Corner_Radius = 5;
 Home_b17.OnUpPtr = 0;
 Home_b17.OnDownPtr = 0;
 Home_b17.OnClickPtr = BackToHome;
 Home_b17.OnPressPtr = 0;

 Next_b9.OwnerScreen = &MODE;
 Next_b9.Order = 15;
 Next_b9.Left = 287;
 Next_b9.Top = 232;
 Next_b9.Width = 78;
 Next_b9.Height = 35;
 Next_b9.Pen_Width = 1;
 Next_b9.Pen_Color = 0xC618;
 Next_b9.Visible = 1;
 Next_b9.Active = 1;
 Next_b9.Transparent = 1;
 Next_b9.Caption = Next_b9_Caption;
 Next_b9.TextAlign = _taCenter;
 Next_b9.TextAlignVertical= _tavMiddle;
 Next_b9.FontName =  0x00005242 ;
 Next_b9.PressColEnabled = 1;
 Next_b9.Font_Color = 0xD6BA;
 Next_b9.VerticalText = 0;
 Next_b9.Gradient = 1;
 Next_b9.Gradient_Orientation = 0;
 Next_b9.Gradient_Start_Color = 0x0418;
 Next_b9.Gradient_End_Color = 0x00A5;
 Next_b9.Color = 0xC618;
 Next_b9.Press_Color = 0xE71C;
 Next_b9.Corner_Radius = 5;
 Next_b9.OnUpPtr = 0;
 Next_b9.OnDownPtr = 0;
 Next_b9.OnClickPtr = nextPage;
 Next_b9.OnPressPtr = 0;

 Back_13.OwnerScreen = &MODE;
 Back_13.Order = 16;
 Back_13.Left = 113;
 Back_13.Top = 232;
 Back_13.Width = 78;
 Back_13.Height = 35;
 Back_13.Pen_Width = 1;
 Back_13.Pen_Color = 0xC618;
 Back_13.Visible = 1;
 Back_13.Active = 1;
 Back_13.Transparent = 1;
 Back_13.Caption = Back_13_Caption;
 Back_13.TextAlign = _taCenter;
 Back_13.TextAlignVertical= _tavMiddle;
 Back_13.FontName =  0x00005242 ;
 Back_13.PressColEnabled = 1;
 Back_13.Font_Color = 0xD6BA;
 Back_13.VerticalText = 0;
 Back_13.Gradient = 1;
 Back_13.Gradient_Orientation = 0;
 Back_13.Gradient_Start_Color = 0x0418;
 Back_13.Gradient_End_Color = 0x00A5;
 Back_13.Color = 0xC618;
 Back_13.Press_Color = 0xE71C;
 Back_13.Corner_Radius = 5;
 Back_13.OnUpPtr = 0;
 Back_13.OnDownPtr = 0;
 Back_13.OnClickPtr = goToBack;
 Back_13.OnPressPtr = 0;

 CircleButton12.OwnerScreen = &MODE;
 CircleButton12.Order = 17;
 CircleButton12.Left = 450;
 CircleButton12.Top = 3;
 CircleButton12.Radius = 12;
 CircleButton12.Pen_Width = 1;
 CircleButton12.Pen_Color = 0x0000;
 CircleButton12.Visible = 1;
 CircleButton12.Active = 0;
 CircleButton12.Transparent = 1;
 CircleButton12.Caption = CircleButton12_Caption;
 CircleButton12.TextAlign = _taCenter;
 CircleButton12.TextAlignVertical= _tavMiddle;
 CircleButton12.FontName =  0x00005242 ;
 CircleButton12.PressColEnabled = 1;
 CircleButton12.Font_Color = 0x0000;
 CircleButton12.VerticalText = 0;
 CircleButton12.Gradient = 1;
 CircleButton12.Gradient_Orientation = 0;
 CircleButton12.Gradient_Start_Color = 0xFFFF;
 CircleButton12.Gradient_End_Color = 0xC618;
 CircleButton12.Color = 0xC618;
 CircleButton12.Press_Color = 0xE71C;
 CircleButton12.OnUpPtr = 0;
 CircleButton12.OnDownPtr = 0;
 CircleButton12.OnClickPtr = 0;
 CircleButton12.OnPressPtr = 0;

 Image43.OwnerScreen = &FURNANCE;
 Image43.Order = 0;
 Image43.Left = 0;
 Image43.Top = 0;
 Image43.Width = 480;
 Image43.Height = 272;
 Image43.Picture_Type = 1;
 Image43.Picture_Ratio = 1;
 Image43.Picture_Name =  0x003281CA ;
 Image43.Visible = 1;
 Image43.Active = 0;
 Image43.OnUpPtr = 0;
 Image43.OnDownPtr = 0;
 Image43.OnClickPtr = 0;
 Image43.OnPressPtr = 0;

 Image140.OwnerScreen = &FURNANCE;
 Image140.Order = 1;
 Image140.Left = 10;
 Image140.Top = 145;
 Image140.Width = 463;
 Image140.Height = 32;
 Image140.Picture_Type = 1;
 Image140.Picture_Ratio = 1;
 Image140.Picture_Name =  0x00367DD0 ;
 Image140.Visible = 1;
 Image140.Active = 0;
 Image140.OnUpPtr = 0;
 Image140.OnDownPtr = 0;
 Image140.OnClickPtr = 0;
 Image140.OnPressPtr = 0;

 Image150.OwnerScreen = &FURNANCE;
 Image150.Order = 2;
 Image150.Left = 10;
 Image150.Top = 40;
 Image150.Width = 463;
 Image150.Height = 32;
 Image150.Picture_Type = 1;
 Image150.Picture_Ratio = 1;
 Image150.Picture_Name =  0x0036F196 ;
 Image150.Visible = 1;
 Image150.Active = 1;
 Image150.OnUpPtr = 0;
 Image150.OnDownPtr = 0;
 Image150.OnClickPtr = 0;
 Image150.OnPressPtr = 0;

 Image136.OwnerScreen = &FURNANCE;
 Image136.Order = 3;
 Image136.Left = 10;
 Image136.Top = 75;
 Image136.Width = 463;
 Image136.Height = 32;
 Image136.Picture_Type = 1;
 Image136.Picture_Ratio = 1;
 Image136.Picture_Name =  0x0037655C ;
 Image136.Visible = 1;
 Image136.Active = 0;
 Image136.OnUpPtr = 0;
 Image136.OnDownPtr = 0;
 Image136.OnClickPtr = 0;
 Image136.OnPressPtr = 0;

 Image137.OwnerScreen = &FURNANCE;
 Image137.Order = 4;
 Image137.Left = 10;
 Image137.Top = 110;
 Image137.Width = 463;
 Image137.Height = 32;
 Image137.Picture_Type = 1;
 Image137.Picture_Ratio = 1;
 Image137.Picture_Name =  0x0037D922 ;
 Image137.Visible = 1;
 Image137.Active = 0;
 Image137.OnUpPtr = 0;
 Image137.OnDownPtr = 0;
 Image137.OnClickPtr = 0;
 Image137.OnPressPtr = 0;

 Image151.OwnerScreen = &FURNANCE;
 Image151.Order = 5;
 Image151.Left = 347;
 Image151.Top = 146;
 Image151.Width = 28;
 Image151.Height = 32;
 Image151.Picture_Type = 1;
 Image151.Picture_Ratio = 1;
 Image151.Picture_Name =  0x0016C712 ;
 Image151.Visible = 1;
 Image151.Active = 1;
 Image151.OnUpPtr = 0;
 Image151.OnDownPtr = 0;
 Image151.OnClickPtr = 0;
 Image151.OnPressPtr = 0;

 Image191.OwnerScreen = &FURNANCE;
 Image191.Order = 6;
 Image191.Left = 372;
 Image191.Top = 146;
 Image191.Width = 28;
 Image191.Height = 32;
 Image191.Picture_Type = 1;
 Image191.Picture_Ratio = 1;
 Image191.Picture_Name =  0x0016CE18 ;
 Image191.Visible = 1;
 Image191.Active = 1;
 Image191.OnUpPtr = 0;
 Image191.OnDownPtr = 0;
 Image191.OnClickPtr = 0;
 Image191.OnPressPtr = 0;

 Image190.OwnerScreen = &FURNANCE;
 Image190.Order = 7;
 Image190.Left = 372;
 Image190.Top = 110;
 Image190.Width = 28;
 Image190.Height = 32;
 Image190.Picture_Type = 1;
 Image190.Picture_Ratio = 1;
 Image190.Picture_Name =  0x0016CE18 ;
 Image190.Visible = 1;
 Image190.Active = 1;
 Image190.OnUpPtr = 0;
 Image190.OnDownPtr = 0;
 Image190.OnClickPtr = 0;
 Image190.OnPressPtr = 0;

 Image148.OwnerScreen = &FURNANCE;
 Image148.Order = 8;
 Image148.Left = 347;
 Image148.Top = 110;
 Image148.Width = 28;
 Image148.Height = 32;
 Image148.Picture_Type = 1;
 Image148.Picture_Ratio = 1;
 Image148.Picture_Name =  0x0016C712 ;
 Image148.Visible = 1;
 Image148.Active = 1;
 Image148.OnUpPtr = 0;
 Image148.OnDownPtr = 0;
 Image148.OnClickPtr = 0;
 Image148.OnPressPtr = 0;

 Image149.OwnerScreen = &FURNANCE;
 Image149.Order = 9;
 Image149.Left = 347;
 Image149.Top = 76;
 Image149.Width = 28;
 Image149.Height = 32;
 Image149.Picture_Type = 1;
 Image149.Picture_Ratio = 1;
 Image149.Picture_Name =  0x0016C712 ;
 Image149.Visible = 1;
 Image149.Active = 1;
 Image149.OnUpPtr = 0;
 Image149.OnDownPtr = 0;
 Image149.OnClickPtr = 0;
 Image149.OnPressPtr = 0;

 Image189.OwnerScreen = &FURNANCE;
 Image189.Order = 10;
 Image189.Left = 372;
 Image189.Top = 76;
 Image189.Width = 28;
 Image189.Height = 32;
 Image189.Picture_Type = 1;
 Image189.Picture_Ratio = 1;
 Image189.Picture_Name =  0x0016CE18 ;
 Image189.Visible = 1;
 Image189.Active = 1;
 Image189.OnUpPtr = 0;
 Image189.OnDownPtr = 0;
 Image189.OnClickPtr = 0;
 Image189.OnPressPtr = 0;

 Image188.OwnerScreen = &FURNANCE;
 Image188.Order = 11;
 Image188.Left = 372;
 Image188.Top = 41;
 Image188.Width = 28;
 Image188.Height = 32;
 Image188.Picture_Type = 1;
 Image188.Picture_Ratio = 1;
 Image188.Picture_Name =  0x0016CE18 ;
 Image188.Visible = 1;
 Image188.Active = 1;
 Image188.OnUpPtr = 0;
 Image188.OnDownPtr = 0;
 Image188.OnClickPtr = 0;
 Image188.OnPressPtr = 0;

 Image143.OwnerScreen = &FURNANCE;
 Image143.Order = 12;
 Image143.Left = 347;
 Image143.Top = 41;
 Image143.Width = 28;
 Image143.Height = 32;
 Image143.Picture_Type = 1;
 Image143.Picture_Ratio = 1;
 Image143.Picture_Name =  0x0016C712 ;
 Image143.Visible = 1;
 Image143.Active = 1;
 Image143.OnUpPtr = 0;
 Image143.OnDownPtr = 0;
 Image143.OnClickPtr = 0;
 Image143.OnPressPtr = 0;

 Label63.OwnerScreen = &FURNANCE;
 Label63.Order = 13;
 Label63.Left = 187;
 Label63.Top = 5;
 Label63.Width = 132;
 Label63.Height = 20;
 Label63.Visible = 1;
 Label63.Active = 0;
 Label63.Caption = Label63_Caption;
 Label63.FontName =  0x00005242 ;
 Label63.Font_Color = 0xE7FC;
 Label63.VerticalText = 0;
 Label63.OnUpPtr = 0;
 Label63.OnDownPtr = 0;
 Label63.OnClickPtr = 0;
 Label63.OnPressPtr = 0;

 Image152.OwnerScreen = &FURNANCE;
 Image152.Order = 14;
 Image152.Left = 407;
 Image152.Top = 41;
 Image152.Width = 64;
 Image152.Height = 32;
 Image152.Picture_Type = 1;
 Image152.Picture_Ratio = 1;
 Image152.Picture_Name =  0x00384CE8 ;
 Image152.Visible = 1;
 Image152.Active = 1;
 Image152.OnUpPtr = 0;
 Image152.OnDownPtr = 0;
 Image152.OnClickPtr = 0;
 Image152.OnPressPtr = 0;

 furnance_time_ON.OwnerScreen = &FURNANCE;
 furnance_time_ON.Order = 15;
 furnance_time_ON.Left = 407;
 furnance_time_ON.Top = 146;
 furnance_time_ON.Width = 64;
 furnance_time_ON.Height = 32;
 furnance_time_ON.Picture_Type = 1;
 furnance_time_ON.Picture_Ratio = 1;
 furnance_time_ON.Picture_Name =  0x00384CE8 ;
 furnance_time_ON.Visible = 1;
 furnance_time_ON.Active = 1;
 furnance_time_ON.OnUpPtr = 0;
 furnance_time_ON.OnDownPtr = 0;
 furnance_time_ON.OnClickPtr = 0;
 furnance_time_ON.OnPressPtr = 0;

 Furnance_start_temp_Down.OwnerScreen = &FURNANCE;
 Furnance_start_temp_Down.Order = 16;
 Furnance_start_temp_Down.Left = 347;
 Furnance_start_temp_Down.Top = 40;
 Furnance_start_temp_Down.Width = 28;
 Furnance_start_temp_Down.Height = 32;
 Furnance_start_temp_Down.Picture_Type = 1;
 Furnance_start_temp_Down.Picture_Ratio = 1;
 Furnance_start_temp_Down.Picture_Name =  0x0016ED30 ;
 Furnance_start_temp_Down.Visible = 1;
 Furnance_start_temp_Down.Active = 1;
 Furnance_start_temp_Down.OnUpPtr = Furnance_start_temp_DownOnUp;
 Furnance_start_temp_Down.OnDownPtr = 0;
 Furnance_start_temp_Down.OnClickPtr = 0;
 Furnance_start_temp_Down.OnPressPtr = Furnance_start_temp_DownOnPress;

 Furnance_off_down.OwnerScreen = &FURNANCE;
 Furnance_off_down.Order = 17;
 Furnance_off_down.Left = 347;
 Furnance_off_down.Top = 110;
 Furnance_off_down.Width = 28;
 Furnance_off_down.Height = 32;
 Furnance_off_down.Picture_Type = 1;
 Furnance_off_down.Picture_Ratio = 1;
 Furnance_off_down.Picture_Name =  0x0016ED30 ;
 Furnance_off_down.Visible = 1;
 Furnance_off_down.Active = 1;
 Furnance_off_down.OnUpPtr = Furnance_off_downOnUp;
 Furnance_off_down.OnDownPtr = 0;
 Furnance_off_down.OnClickPtr = 0;
 Furnance_off_down.OnPressPtr = Furnance_off_downOnPress;

 Furnance_time_down.OwnerScreen = &FURNANCE;
 Furnance_time_down.Order = 18;
 Furnance_time_down.Left = 347;
 Furnance_time_down.Top = 145;
 Furnance_time_down.Width = 28;
 Furnance_time_down.Height = 32;
 Furnance_time_down.Picture_Type = 1;
 Furnance_time_down.Picture_Ratio = 1;
 Furnance_time_down.Picture_Name =  0x0016ED30 ;
 Furnance_time_down.Visible = 1;
 Furnance_time_down.Active = 1;
 Furnance_time_down.OnUpPtr = Furnance_time_downOnUp;
 Furnance_time_down.OnDownPtr = 0;
 Furnance_time_down.OnClickPtr = 0;
 Furnance_time_down.OnPressPtr = Furnance_time_downOnPress;

 Furnance_start_temp_UP.OwnerScreen = &FURNANCE;
 Furnance_start_temp_UP.Order = 19;
 Furnance_start_temp_UP.Left = 373;
 Furnance_start_temp_UP.Top = 40;
 Furnance_start_temp_UP.Width = 28;
 Furnance_start_temp_UP.Height = 32;
 Furnance_start_temp_UP.Picture_Type = 1;
 Furnance_start_temp_UP.Picture_Ratio = 1;
 Furnance_start_temp_UP.Picture_Name =  0x0016DDA4 ;
 Furnance_start_temp_UP.Visible = 1;
 Furnance_start_temp_UP.Active = 1;
 Furnance_start_temp_UP.OnUpPtr = Furnance_start_temp_UPOnUp;
 Furnance_start_temp_UP.OnDownPtr = 0;
 Furnance_start_temp_UP.OnClickPtr = 0;
 Furnance_start_temp_UP.OnPressPtr = Furnance_start_temp_UPOnPress;

 Furnance_HP_OFF_UP.OwnerScreen = &FURNANCE;
 Furnance_HP_OFF_UP.Order = 20;
 Furnance_HP_OFF_UP.Left = 373;
 Furnance_HP_OFF_UP.Top = 75;
 Furnance_HP_OFF_UP.Width = 28;
 Furnance_HP_OFF_UP.Height = 32;
 Furnance_HP_OFF_UP.Picture_Type = 1;
 Furnance_HP_OFF_UP.Picture_Ratio = 1;
 Furnance_HP_OFF_UP.Picture_Name =  0x0016DDA4 ;
 Furnance_HP_OFF_UP.Visible = 1;
 Furnance_HP_OFF_UP.Active = 1;
 Furnance_HP_OFF_UP.OnUpPtr = Furnance_HP_OFF_UPOnUp;
 Furnance_HP_OFF_UP.OnDownPtr = 0;
 Furnance_HP_OFF_UP.OnClickPtr = 0;
 Furnance_HP_OFF_UP.OnPressPtr = Furnance_HP_OFF_UPOnPress;

 Furnance_off_up.OwnerScreen = &FURNANCE;
 Furnance_off_up.Order = 21;
 Furnance_off_up.Left = 373;
 Furnance_off_up.Top = 110;
 Furnance_off_up.Width = 28;
 Furnance_off_up.Height = 32;
 Furnance_off_up.Picture_Type = 1;
 Furnance_off_up.Picture_Ratio = 1;
 Furnance_off_up.Picture_Name =  0x0016DDA4 ;
 Furnance_off_up.Visible = 1;
 Furnance_off_up.Active = 1;
 Furnance_off_up.OnUpPtr = Furnance_off_upOnUp;
 Furnance_off_up.OnDownPtr = 0;
 Furnance_off_up.OnClickPtr = 0;
 Furnance_off_up.OnPressPtr = Furnance_off_upOnPress;

 Furnance_time_up.OwnerScreen = &FURNANCE;
 Furnance_time_up.Order = 22;
 Furnance_time_up.Left = 373;
 Furnance_time_up.Top = 145;
 Furnance_time_up.Width = 28;
 Furnance_time_up.Height = 32;
 Furnance_time_up.Picture_Type = 1;
 Furnance_time_up.Picture_Ratio = 1;
 Furnance_time_up.Picture_Name =  0x0016DDA4 ;
 Furnance_time_up.Visible = 1;
 Furnance_time_up.Active = 1;
 Furnance_time_up.OnUpPtr = Furnance_time_upOnUp;
 Furnance_time_up.OnDownPtr = 0;
 Furnance_time_up.OnClickPtr = 0;
 Furnance_time_up.OnPressPtr = Furnance_time_upOnPress;

 Furnance_HP_OFF_Dowm.OwnerScreen = &FURNANCE;
 Furnance_HP_OFF_Dowm.Order = 23;
 Furnance_HP_OFF_Dowm.Left = 347;
 Furnance_HP_OFF_Dowm.Top = 75;
 Furnance_HP_OFF_Dowm.Width = 28;
 Furnance_HP_OFF_Dowm.Height = 32;
 Furnance_HP_OFF_Dowm.Picture_Type = 1;
 Furnance_HP_OFF_Dowm.Picture_Ratio = 1;
 Furnance_HP_OFF_Dowm.Picture_Name =  0x0016ED30 ;
 Furnance_HP_OFF_Dowm.Visible = 1;
 Furnance_HP_OFF_Dowm.Active = 1;
 Furnance_HP_OFF_Dowm.OnUpPtr = Furnance_HP_OFF_DowmOnUp;
 Furnance_HP_OFF_Dowm.OnDownPtr = 0;
 Furnance_HP_OFF_Dowm.OnClickPtr = 0;
 Furnance_HP_OFF_Dowm.OnPressPtr = Furnance_HP_OFF_DowmOnPress;

 furnance_time_OFF.OwnerScreen = &FURNANCE;
 furnance_time_OFF.Order = 24;
 furnance_time_OFF.Left = 408;
 furnance_time_OFF.Top = 145;
 furnance_time_OFF.Width = 64;
 furnance_time_OFF.Height = 32;
 furnance_time_OFF.Picture_Type = 1;
 furnance_time_OFF.Picture_Ratio = 1;
 furnance_time_OFF.Picture_Name =  0x00385CEE ;
 furnance_time_OFF.Visible = 1;
 furnance_time_OFF.Active = 1;
 furnance_time_OFF.OnUpPtr = 0;
 furnance_time_OFF.OnDownPtr = 0;
 furnance_time_OFF.OnClickPtr = furnance_time_OFFOnClick;
 furnance_time_OFF.OnPressPtr = 0;

 furnance_Mode_on.OwnerScreen = &FURNANCE;
 furnance_Mode_on.Order = 25;
 furnance_Mode_on.Left = 408;
 furnance_Mode_on.Top = 40;
 furnance_Mode_on.Width = 64;
 furnance_Mode_on.Height = 32;
 furnance_Mode_on.Picture_Type = 1;
 furnance_Mode_on.Picture_Ratio = 1;
 furnance_Mode_on.Picture_Name =  0x00385CEE ;
 furnance_Mode_on.Visible = 1;
 furnance_Mode_on.Active = 1;
 furnance_Mode_on.OnUpPtr = 0;
 furnance_Mode_on.OnDownPtr = 0;
 furnance_Mode_on.OnClickPtr = furnance_Mode_onOnClick;
 furnance_Mode_on.OnPressPtr = 0;

 Box14.OwnerScreen = &FURNANCE;
 Box14.Order = 26;
 Box14.Left = 270;
 Box14.Top = 116;
 Box14.Width = 35;
 Box14.Height = 18;
 Box14.Pen_Width = 0;
 Box14.Pen_Color = 0x0000;
 Box14.Visible = 1;
 Box14.Active = 1;
 Box14.Transparent = 1;
 Box14.Gradient = 0;
 Box14.Gradient_Orientation = 0;
 Box14.Gradient_Start_Color = 0xFFFF;
 Box14.Gradient_End_Color = 0xC618;
 Box14.Color = 0xFFFF;
 Box14.PressColEnabled = 1;
 Box14.Press_Color = 0xE71C;
 Box14.OnUpPtr = 0;
 Box14.OnDownPtr = 0;
 Box14.OnClickPtr = 0;
 Box14.OnPressPtr = 0;

 Box15.OwnerScreen = &FURNANCE;
 Box15.Order = 27;
 Box15.Left = 270;
 Box15.Top = 151;
 Box15.Width = 35;
 Box15.Height = 18;
 Box15.Pen_Width = 0;
 Box15.Pen_Color = 0x0000;
 Box15.Visible = 1;
 Box15.Active = 1;
 Box15.Transparent = 1;
 Box15.Gradient = 0;
 Box15.Gradient_Orientation = 0;
 Box15.Gradient_Start_Color = 0xFFFF;
 Box15.Gradient_End_Color = 0xC618;
 Box15.Color = 0xFFFF;
 Box15.PressColEnabled = 1;
 Box15.Press_Color = 0xE71C;
 Box15.OnUpPtr = 0;
 Box15.OnDownPtr = 0;
 Box15.OnClickPtr = 0;
 Box15.OnPressPtr = 0;

 Home_b18.OwnerScreen = &FURNANCE;
 Home_b18.Order = 28;
 Home_b18.Left = 246;
 Home_b18.Top = 232;
 Home_b18.Width = 78;
 Home_b18.Height = 35;
 Home_b18.Pen_Width = 1;
 Home_b18.Pen_Color = 0xC618;
 Home_b18.Visible = 1;
 Home_b18.Active = 1;
 Home_b18.Transparent = 1;
 Home_b18.Caption = Home_b18_Caption;
 Home_b18.TextAlign = _taCenter;
 Home_b18.TextAlignVertical= _tavMiddle;
 Home_b18.FontName =  0x00005242 ;
 Home_b18.PressColEnabled = 1;
 Home_b18.Font_Color = 0xD6BA;
 Home_b18.VerticalText = 0;
 Home_b18.Gradient = 1;
 Home_b18.Gradient_Orientation = 0;
 Home_b18.Gradient_Start_Color = 0x0418;
 Home_b18.Gradient_End_Color = 0x00A5;
 Home_b18.Color = 0xC618;
 Home_b18.Press_Color = 0xE71C;
 Home_b18.Corner_Radius = 5;
 Home_b18.OnUpPtr = 0;
 Home_b18.OnDownPtr = 0;
 Home_b18.OnClickPtr = BackToHome;
 Home_b18.OnPressPtr = 0;

 Back_b14.OwnerScreen = &FURNANCE;
 Back_b14.Order = 29;
 Back_b14.Left = 162;
 Back_b14.Top = 232;
 Back_b14.Width = 78;
 Back_b14.Height = 35;
 Back_b14.Pen_Width = 1;
 Back_b14.Pen_Color = 0xC618;
 Back_b14.Visible = 1;
 Back_b14.Active = 1;
 Back_b14.Transparent = 1;
 Back_b14.Caption = Back_b14_Caption;
 Back_b14.TextAlign = _taCenter;
 Back_b14.TextAlignVertical= _tavMiddle;
 Back_b14.FontName =  0x00005242 ;
 Back_b14.PressColEnabled = 1;
 Back_b14.Font_Color = 0xD6BA;
 Back_b14.VerticalText = 0;
 Back_b14.Gradient = 1;
 Back_b14.Gradient_Orientation = 0;
 Back_b14.Gradient_Start_Color = 0x0418;
 Back_b14.Gradient_End_Color = 0x00A5;
 Back_b14.Color = 0xC618;
 Back_b14.Press_Color = 0xE71C;
 Back_b14.Corner_Radius = 5;
 Back_b14.OnUpPtr = 0;
 Back_b14.OnDownPtr = 0;
 Back_b14.OnClickPtr = goToBack;
 Back_b14.OnPressPtr = 0;

 Furnance_temperature_ON.OwnerScreen = &FURNANCE;
 Furnance_temperature_ON.Order = 30;
 Furnance_temperature_ON.Left = 268;
 Furnance_temperature_ON.Top = 45;
 Furnance_temperature_ON.Width = 39;
 Furnance_temperature_ON.Height = 22;
 Furnance_temperature_ON.Pen_Width = 1;
 Furnance_temperature_ON.Pen_Color = 0x0000;
 Furnance_temperature_ON.Visible = 1;
 Furnance_temperature_ON.Active = 0;
 Furnance_temperature_ON.Transparent = 1;
 Furnance_temperature_ON.Caption = Furnance_temperature_ON_Caption;
 Furnance_temperature_ON.TextAlign = _taCenter;
 Furnance_temperature_ON.TextAlignVertical= _tavMiddle;
 Furnance_temperature_ON.FontName =  0x00005242 ;
 Furnance_temperature_ON.PressColEnabled = 1;
 Furnance_temperature_ON.Font_Color = 0x0000;
 Furnance_temperature_ON.VerticalText = 0;
 Furnance_temperature_ON.Gradient = 0;
 Furnance_temperature_ON.Gradient_Orientation = 0;
 Furnance_temperature_ON.Gradient_Start_Color = 0xFFFF;
 Furnance_temperature_ON.Gradient_End_Color = 0xC618;
 Furnance_temperature_ON.Color = 0xFFFF;
 Furnance_temperature_ON.Press_Color = 0xE71C;
 Furnance_temperature_ON.Corner_Radius = 3;
 Furnance_temperature_ON.OnUpPtr = 0;
 Furnance_temperature_ON.OnDownPtr = 0;
 Furnance_temperature_ON.OnClickPtr = 0;
 Furnance_temperature_ON.OnPressPtr = 0;

 heat_pump_OFF.OwnerScreen = &FURNANCE;
 heat_pump_OFF.Order = 31;
 heat_pump_OFF.Left = 268;
 heat_pump_OFF.Top = 80;
 heat_pump_OFF.Width = 39;
 heat_pump_OFF.Height = 22;
 heat_pump_OFF.Pen_Width = 1;
 heat_pump_OFF.Pen_Color = 0x0000;
 heat_pump_OFF.Visible = 1;
 heat_pump_OFF.Active = 0;
 heat_pump_OFF.Transparent = 1;
 heat_pump_OFF.Caption = heat_pump_OFF_Caption;
 heat_pump_OFF.TextAlign = _taCenter;
 heat_pump_OFF.TextAlignVertical= _tavMiddle;
 heat_pump_OFF.FontName =  0x00005242 ;
 heat_pump_OFF.PressColEnabled = 1;
 heat_pump_OFF.Font_Color = 0x0000;
 heat_pump_OFF.VerticalText = 0;
 heat_pump_OFF.Gradient = 0;
 heat_pump_OFF.Gradient_Orientation = 0;
 heat_pump_OFF.Gradient_Start_Color = 0xFFFF;
 heat_pump_OFF.Gradient_End_Color = 0xC618;
 heat_pump_OFF.Color = 0xFFFF;
 heat_pump_OFF.Press_Color = 0xE71C;
 heat_pump_OFF.Corner_Radius = 3;
 heat_pump_OFF.OnUpPtr = 0;
 heat_pump_OFF.OnDownPtr = 0;
 heat_pump_OFF.OnClickPtr = 0;
 heat_pump_OFF.OnPressPtr = 0;

 furnance_OFF.OwnerScreen = &FURNANCE;
 furnance_OFF.Order = 32;
 furnance_OFF.Left = 268;
 furnance_OFF.Top = 115;
 furnance_OFF.Width = 39;
 furnance_OFF.Height = 22;
 furnance_OFF.Pen_Width = 1;
 furnance_OFF.Pen_Color = 0x0000;
 furnance_OFF.Visible = 1;
 furnance_OFF.Active = 0;
 furnance_OFF.Transparent = 1;
 furnance_OFF.Caption = furnance_OFF_Caption;
 furnance_OFF.TextAlign = _taCenter;
 furnance_OFF.TextAlignVertical= _tavMiddle;
 furnance_OFF.FontName =  0x00005242 ;
 furnance_OFF.PressColEnabled = 1;
 furnance_OFF.Font_Color = 0x0000;
 furnance_OFF.VerticalText = 0;
 furnance_OFF.Gradient = 0;
 furnance_OFF.Gradient_Orientation = 0;
 furnance_OFF.Gradient_Start_Color = 0xFFFF;
 furnance_OFF.Gradient_End_Color = 0xC618;
 furnance_OFF.Color = 0xFFFF;
 furnance_OFF.Press_Color = 0xE71C;
 furnance_OFF.Corner_Radius = 3;
 furnance_OFF.OnUpPtr = 0;
 furnance_OFF.OnDownPtr = 0;
 furnance_OFF.OnClickPtr = 0;
 furnance_OFF.OnPressPtr = 0;

 furnance_Timer.OwnerScreen = &FURNANCE;
 furnance_Timer.Order = 33;
 furnance_Timer.Left = 268;
 furnance_Timer.Top = 150;
 furnance_Timer.Width = 39;
 furnance_Timer.Height = 22;
 furnance_Timer.Pen_Width = 1;
 furnance_Timer.Pen_Color = 0x0000;
 furnance_Timer.Visible = 1;
 furnance_Timer.Active = 0;
 furnance_Timer.Transparent = 1;
 furnance_Timer.Caption = furnance_Timer_Caption;
 furnance_Timer.TextAlign = _taCenter;
 furnance_Timer.TextAlignVertical= _tavMiddle;
 furnance_Timer.FontName =  0x00005242 ;
 furnance_Timer.PressColEnabled = 1;
 furnance_Timer.Font_Color = 0x0000;
 furnance_Timer.VerticalText = 0;
 furnance_Timer.Gradient = 0;
 furnance_Timer.Gradient_Orientation = 0;
 furnance_Timer.Gradient_Start_Color = 0xFFFF;
 furnance_Timer.Gradient_End_Color = 0xC618;
 furnance_Timer.Color = 0xFFFF;
 furnance_Timer.Press_Color = 0xE71C;
 furnance_Timer.Corner_Radius = 3;
 furnance_Timer.OnUpPtr = 0;
 furnance_Timer.OnDownPtr = 0;
 furnance_Timer.OnClickPtr = 0;
 furnance_Timer.OnPressPtr = 0;

 Furnance_off_save.OwnerScreen = &FURNANCE;
 Furnance_off_save.Order = 34;
 Furnance_off_save.Left = 421;
 Furnance_off_save.Top = 110;
 Furnance_off_save.Width = 34;
 Furnance_off_save.Height = 32;
 Furnance_off_save.Picture_Type = 1;
 Furnance_off_save.Picture_Ratio = 1;
 Furnance_off_save.Picture_Name =  0x0016E4AA ;
 Furnance_off_save.Visible = 1;
 Furnance_off_save.Active = 1;
 Furnance_off_save.OnUpPtr = Furnance_off_save_onup;
 Furnance_off_save.OnDownPtr = Furnance_off_save_ondown;
 Furnance_off_save.OnClickPtr = 0;
 Furnance_off_save.OnPressPtr = 0;

 Furnance_HP_OFF_save.OwnerScreen = &FURNANCE;
 Furnance_HP_OFF_save.Order = 35;
 Furnance_HP_OFF_save.Left = 421;
 Furnance_HP_OFF_save.Top = 75;
 Furnance_HP_OFF_save.Width = 34;
 Furnance_HP_OFF_save.Height = 32;
 Furnance_HP_OFF_save.Picture_Type = 1;
 Furnance_HP_OFF_save.Picture_Ratio = 1;
 Furnance_HP_OFF_save.Picture_Name =  0x0016E4AA ;
 Furnance_HP_OFF_save.Visible = 1;
 Furnance_HP_OFF_save.Active = 1;
 Furnance_HP_OFF_save.OnUpPtr = Furnance_HP_OFF_save_onup;
 Furnance_HP_OFF_save.OnDownPtr = Set_6_OnDown;
 Furnance_HP_OFF_save.OnClickPtr = 0;
 Furnance_HP_OFF_save.OnPressPtr = 0;

 Image107.OwnerScreen = &Ethernet;
 Image107.Order = 0;
 Image107.Left = 0;
 Image107.Top = 0;
 Image107.Width = 480;
 Image107.Height = 272;
 Image107.Picture_Type = 1;
 Image107.Picture_Ratio = 1;
 Image107.Picture_Name =  0x0003CAAE ;
 Image107.Visible = 1;
 Image107.Active = 0;
 Image107.OnUpPtr = 0;
 Image107.OnDownPtr = 0;
 Image107.OnClickPtr = 0;
 Image107.OnPressPtr = 0;

 Box7.OwnerScreen = &Ethernet;
 Box7.Order = 1;
 Box7.Left = 184;
 Box7.Top = 38;
 Box7.Width = 144;
 Box7.Height = 25;
 Box7.Pen_Width = 1;
 Box7.Pen_Color = 0x0000;
 Box7.Visible = 1;
 Box7.Active = 0;
 Box7.Transparent = 1;
 Box7.Gradient = 0;
 Box7.Gradient_Orientation = 0;
 Box7.Gradient_Start_Color = 0xFFFF;
 Box7.Gradient_End_Color = 0xC618;
 Box7.Color = 0xC618;
 Box7.PressColEnabled = 0;
 Box7.Press_Color = 0xE71C;
 Box7.OnUpPtr = 0;
 Box7.OnDownPtr = 0;
 Box7.OnClickPtr = 0;
 Box7.OnPressPtr = 0;

 Box8.OwnerScreen = &Ethernet;
 Box8.Order = 2;
 Box8.Left = 184;
 Box8.Top = 72;
 Box8.Width = 144;
 Box8.Height = 25;
 Box8.Pen_Width = 1;
 Box8.Pen_Color = 0x0000;
 Box8.Visible = 1;
 Box8.Active = 0;
 Box8.Transparent = 1;
 Box8.Gradient = 0;
 Box8.Gradient_Orientation = 0;
 Box8.Gradient_Start_Color = 0xFFFF;
 Box8.Gradient_End_Color = 0xC618;
 Box8.Color = 0xC618;
 Box8.PressColEnabled = 0;
 Box8.Press_Color = 0xE71C;
 Box8.OnUpPtr = 0;
 Box8.OnDownPtr = 0;
 Box8.OnClickPtr = 0;
 Box8.OnPressPtr = 0;

 Box9.OwnerScreen = &Ethernet;
 Box9.Order = 3;
 Box9.Left = 184;
 Box9.Top = 104;
 Box9.Width = 144;
 Box9.Height = 25;
 Box9.Pen_Width = 1;
 Box9.Pen_Color = 0x0000;
 Box9.Visible = 1;
 Box9.Active = 0;
 Box9.Transparent = 1;
 Box9.Gradient = 0;
 Box9.Gradient_Orientation = 0;
 Box9.Gradient_Start_Color = 0xFFFF;
 Box9.Gradient_End_Color = 0xC618;
 Box9.Color = 0xC618;
 Box9.PressColEnabled = 0;
 Box9.Press_Color = 0xE71C;
 Box9.OnUpPtr = 0;
 Box9.OnDownPtr = 0;
 Box9.OnClickPtr = 0;
 Box9.OnPressPtr = 0;

 Box10.OwnerScreen = &Ethernet;
 Box10.Order = 4;
 Box10.Left = 184;
 Box10.Top = 138;
 Box10.Width = 144;
 Box10.Height = 25;
 Box10.Pen_Width = 1;
 Box10.Pen_Color = 0x0000;
 Box10.Visible = 1;
 Box10.Active = 0;
 Box10.Transparent = 1;
 Box10.Gradient = 0;
 Box10.Gradient_Orientation = 0;
 Box10.Gradient_Start_Color = 0xFFFF;
 Box10.Gradient_End_Color = 0xC618;
 Box10.Color = 0xC618;
 Box10.PressColEnabled = 0;
 Box10.Press_Color = 0xE71C;
 Box10.OnUpPtr = 0;
 Box10.OnDownPtr = 0;
 Box10.OnClickPtr = 0;
 Box10.OnPressPtr = 0;

 IPAddressLabel.OwnerScreen = &Ethernet;
 IPAddressLabel.Order = 5;
 IPAddressLabel.Left = 191;
 IPAddressLabel.Top = 41;
 IPAddressLabel.Width = 129;
 IPAddressLabel.Height = 20;
 IPAddressLabel.Visible = 1;
 IPAddressLabel.Active = 1;
 IPAddressLabel.Caption = IPAddressLabel_Caption;
 IPAddressLabel.FontName =  0x00005242 ;
 IPAddressLabel.Font_Color = 0x0010;
 IPAddressLabel.VerticalText = 0;
 IPAddressLabel.OnUpPtr = 0;
 IPAddressLabel.OnDownPtr = 0;
 IPAddressLabel.OnClickPtr = 0;
 IPAddressLabel.OnPressPtr = 0;

 MaskLabel.OwnerScreen = &Ethernet;
 MaskLabel.Order = 6;
 MaskLabel.Left = 191;
 MaskLabel.Top = 75;
 MaskLabel.Width = 129;
 MaskLabel.Height = 20;
 MaskLabel.Visible = 1;
 MaskLabel.Active = 1;
 MaskLabel.Caption = MaskLabel_Caption;
 MaskLabel.FontName =  0x00005242 ;
 MaskLabel.Font_Color = 0x0010;
 MaskLabel.VerticalText = 0;
 MaskLabel.OnUpPtr = 0;
 MaskLabel.OnDownPtr = 0;
 MaskLabel.OnClickPtr = 0;
 MaskLabel.OnPressPtr = 0;

 GATELabel.OwnerScreen = &Ethernet;
 GATELabel.Order = 7;
 GATELabel.Left = 192;
 GATELabel.Top = 108;
 GATELabel.Width = 129;
 GATELabel.Height = 20;
 GATELabel.Visible = 1;
 GATELabel.Active = 1;
 GATELabel.Caption = GATELabel_Caption;
 GATELabel.FontName =  0x00005242 ;
 GATELabel.Font_Color = 0x0010;
 GATELabel.VerticalText = 0;
 GATELabel.OnUpPtr = 0;
 GATELabel.OnDownPtr = 0;
 GATELabel.OnClickPtr = 0;
 GATELabel.OnPressPtr = 0;

 DNSLabel.OwnerScreen = &Ethernet;
 DNSLabel.Order = 8;
 DNSLabel.Left = 191;
 DNSLabel.Top = 140;
 DNSLabel.Width = 129;
 DNSLabel.Height = 20;
 DNSLabel.Visible = 1;
 DNSLabel.Active = 1;
 DNSLabel.Caption = DNSLabel_Caption;
 DNSLabel.FontName =  0x00005242 ;
 DNSLabel.Font_Color = 0x0010;
 DNSLabel.VerticalText = 0;
 DNSLabel.OnUpPtr = 0;
 DNSLabel.OnDownPtr = 0;
 DNSLabel.OnClickPtr = 0;
 DNSLabel.OnPressPtr = 0;

 LANSet.OwnerScreen = &Ethernet;
 LANSet.Order = 9;
 LANSet.Left = 354;
 LANSet.Top = 128;
 LANSet.Width = 84;
 LANSet.Height = 35;
 LANSet.Pen_Width = 1;
 LANSet.Pen_Color = 0x0000;
 LANSet.Visible = 1;
 LANSet.Active = 1;
 LANSet.Transparent = 1;
 LANSet.Caption = LANSet_Caption;
 LANSet.TextAlign = _taCenter;
 LANSet.TextAlignVertical= _tavMiddle;
 LANSet.FontName =  0x00005242 ;
 LANSet.PressColEnabled = 1;
 LANSet.Font_Color = 0xFFFF;
 LANSet.VerticalText = 0;
 LANSet.Gradient = 1;
 LANSet.Gradient_Orientation = 0;
 LANSet.Gradient_Start_Color = 0x03DE;
 LANSet.Gradient_End_Color = 0x0210;
 LANSet.Color = 0xC618;
 LANSet.Press_Color = 0xE71C;
 LANSet.Corner_Radius = 3;
 LANSet.OnUpPtr = 0;
 LANSet.OnDownPtr = 0;
 LANSet.OnClickPtr = LANSetOnClick;
 LANSet.OnPressPtr = 0;

 SetGateWay.OwnerScreen = &Ethernet;
 SetGateWay.Order = 10;
 SetGateWay.Left = 44;
 SetGateWay.Top = 104;
 SetGateWay.Width = 135;
 SetGateWay.Height = 25;
 SetGateWay.Pen_Width = 1;
 SetGateWay.Pen_Color = 0x0000;
 SetGateWay.Visible = 1;
 SetGateWay.Active = 1;
 SetGateWay.Transparent = 1;
 SetGateWay.Caption = SetGateWay_Caption;
 SetGateWay.TextAlign = _taCenter;
 SetGateWay.TextAlignVertical= _tavMiddle;
 SetGateWay.FontName =  0x00005242 ;
 SetGateWay.PressColEnabled = 1;
 SetGateWay.Font_Color = 0xFFFF;
 SetGateWay.VerticalText = 0;
 SetGateWay.Gradient = 1;
 SetGateWay.Gradient_Orientation = 0;
 SetGateWay.Gradient_Start_Color = 0x9CF3;
 SetGateWay.Gradient_End_Color = 0x2965;
 SetGateWay.Color = 0xC618;
 SetGateWay.Press_Color = 0xE71C;
 SetGateWay.Corner_Radius = 1;
 SetGateWay.OnUpPtr = 0;
 SetGateWay.OnDownPtr = 0;
 SetGateWay.OnClickPtr = SetGateWayOnClick;
 SetGateWay.OnPressPtr = 0;

 SetDNS.OwnerScreen = &Ethernet;
 SetDNS.Order = 11;
 SetDNS.Left = 44;
 SetDNS.Top = 138;
 SetDNS.Width = 135;
 SetDNS.Height = 25;
 SetDNS.Pen_Width = 1;
 SetDNS.Pen_Color = 0x0000;
 SetDNS.Visible = 1;
 SetDNS.Active = 1;
 SetDNS.Transparent = 1;
 SetDNS.Caption = SetDNS_Caption;
 SetDNS.TextAlign = _taCenter;
 SetDNS.TextAlignVertical= _tavMiddle;
 SetDNS.FontName =  0x00005242 ;
 SetDNS.PressColEnabled = 1;
 SetDNS.Font_Color = 0xFFFF;
 SetDNS.VerticalText = 0;
 SetDNS.Gradient = 1;
 SetDNS.Gradient_Orientation = 0;
 SetDNS.Gradient_Start_Color = 0x9CF3;
 SetDNS.Gradient_End_Color = 0x2965;
 SetDNS.Color = 0xC618;
 SetDNS.Press_Color = 0xE71C;
 SetDNS.Corner_Radius = 1;
 SetDNS.OnUpPtr = 0;
 SetDNS.OnDownPtr = 0;
 SetDNS.OnClickPtr = SetDNSOnClick;
 SetDNS.OnPressPtr = 0;

 SetIPAddress.OwnerScreen = &Ethernet;
 SetIPAddress.Order = 12;
 SetIPAddress.Left = 44;
 SetIPAddress.Top = 38;
 SetIPAddress.Width = 135;
 SetIPAddress.Height = 25;
 SetIPAddress.Pen_Width = 1;
 SetIPAddress.Pen_Color = 0x0000;
 SetIPAddress.Visible = 1;
 SetIPAddress.Active = 1;
 SetIPAddress.Transparent = 1;
 SetIPAddress.Caption = SetIPAddress_Caption;
 SetIPAddress.TextAlign = _taCenter;
 SetIPAddress.TextAlignVertical= _tavMiddle;
 SetIPAddress.FontName =  0x00005242 ;
 SetIPAddress.PressColEnabled = 1;
 SetIPAddress.Font_Color = 0xFFFF;
 SetIPAddress.VerticalText = 0;
 SetIPAddress.Gradient = 1;
 SetIPAddress.Gradient_Orientation = 0;
 SetIPAddress.Gradient_Start_Color = 0x9CF3;
 SetIPAddress.Gradient_End_Color = 0x2965;
 SetIPAddress.Color = 0xC618;
 SetIPAddress.Press_Color = 0xE71C;
 SetIPAddress.Corner_Radius = 1;
 SetIPAddress.OnUpPtr = 0;
 SetIPAddress.OnDownPtr = 0;
 SetIPAddress.OnClickPtr = SetIPAddressOnClick;
 SetIPAddress.OnPressPtr = 0;

 SetMask.OwnerScreen = &Ethernet;
 SetMask.Order = 13;
 SetMask.Left = 44;
 SetMask.Top = 72;
 SetMask.Width = 135;
 SetMask.Height = 25;
 SetMask.Pen_Width = 1;
 SetMask.Pen_Color = 0x0000;
 SetMask.Visible = 1;
 SetMask.Active = 1;
 SetMask.Transparent = 1;
 SetMask.Caption = SetMask_Caption;
 SetMask.TextAlign = _taCenter;
 SetMask.TextAlignVertical= _tavMiddle;
 SetMask.FontName =  0x00005242 ;
 SetMask.PressColEnabled = 1;
 SetMask.Font_Color = 0xFFFF;
 SetMask.VerticalText = 0;
 SetMask.Gradient = 1;
 SetMask.Gradient_Orientation = 0;
 SetMask.Gradient_Start_Color = 0x9CF3;
 SetMask.Gradient_End_Color = 0x2965;
 SetMask.Color = 0xC618;
 SetMask.Press_Color = 0xE71C;
 SetMask.Corner_Radius = 1;
 SetMask.OnUpPtr = 0;
 SetMask.OnDownPtr = 0;
 SetMask.OnClickPtr = SetMaskOnClick;
 SetMask.OnPressPtr = 0;

 LAN_Key_1.OwnerScreen = &Ethernet;
 LAN_Key_1.Order = 14;
 LAN_Key_1.Left = 4;
 LAN_Key_1.Top = 184;
 LAN_Key_1.Width = 32;
 LAN_Key_1.Height = 32;
 LAN_Key_1.Pen_Width = 1;
 LAN_Key_1.Pen_Color = 0x0000;
 LAN_Key_1.Visible = 1;
 LAN_Key_1.Active = 1;
 LAN_Key_1.Transparent = 1;
 LAN_Key_1.Caption = LAN_Key_1_Caption;
 LAN_Key_1.TextAlign = _taCenter;
 LAN_Key_1.TextAlignVertical= _tavMiddle;
 LAN_Key_1.FontName =  0x00005242 ;
 LAN_Key_1.PressColEnabled = 1;
 LAN_Key_1.Font_Color = 0xEF5D;
 LAN_Key_1.VerticalText = 0;
 LAN_Key_1.Gradient = 1;
 LAN_Key_1.Gradient_Orientation = 0;
 LAN_Key_1.Gradient_Start_Color = 0x8410;
 LAN_Key_1.Gradient_End_Color = 0x4A49;
 LAN_Key_1.Color = 0xC618;
 LAN_Key_1.Press_Color = 0xE71C;
 LAN_Key_1.Corner_Radius = 4;
 LAN_Key_1.OnUpPtr = 0;
 LAN_Key_1.OnDownPtr = 0;
 LAN_Key_1.OnClickPtr = LAN_Key_1OnClick;
 LAN_Key_1.OnPressPtr = 0;

 LAN_Key_2.OwnerScreen = &Ethernet;
 LAN_Key_2.Order = 15;
 LAN_Key_2.Left = 44;
 LAN_Key_2.Top = 184;
 LAN_Key_2.Width = 32;
 LAN_Key_2.Height = 32;
 LAN_Key_2.Pen_Width = 1;
 LAN_Key_2.Pen_Color = 0x0000;
 LAN_Key_2.Visible = 1;
 LAN_Key_2.Active = 1;
 LAN_Key_2.Transparent = 1;
 LAN_Key_2.Caption = LAN_Key_2_Caption;
 LAN_Key_2.TextAlign = _taCenter;
 LAN_Key_2.TextAlignVertical= _tavMiddle;
 LAN_Key_2.FontName =  0x00005242 ;
 LAN_Key_2.PressColEnabled = 1;
 LAN_Key_2.Font_Color = 0xEF5D;
 LAN_Key_2.VerticalText = 0;
 LAN_Key_2.Gradient = 1;
 LAN_Key_2.Gradient_Orientation = 0;
 LAN_Key_2.Gradient_Start_Color = 0x8410;
 LAN_Key_2.Gradient_End_Color = 0x4A49;
 LAN_Key_2.Color = 0xC618;
 LAN_Key_2.Press_Color = 0xE71C;
 LAN_Key_2.Corner_Radius = 4;
 LAN_Key_2.OnUpPtr = 0;
 LAN_Key_2.OnDownPtr = 0;
 LAN_Key_2.OnClickPtr = LAN_Key_2OnClick;
 LAN_Key_2.OnPressPtr = 0;

 LAN_Key_3.OwnerScreen = &Ethernet;
 LAN_Key_3.Order = 16;
 LAN_Key_3.Left = 84;
 LAN_Key_3.Top = 184;
 LAN_Key_3.Width = 32;
 LAN_Key_3.Height = 32;
 LAN_Key_3.Pen_Width = 1;
 LAN_Key_3.Pen_Color = 0x0000;
 LAN_Key_3.Visible = 1;
 LAN_Key_3.Active = 1;
 LAN_Key_3.Transparent = 1;
 LAN_Key_3.Caption = LAN_Key_3_Caption;
 LAN_Key_3.TextAlign = _taCenter;
 LAN_Key_3.TextAlignVertical= _tavMiddle;
 LAN_Key_3.FontName =  0x00005242 ;
 LAN_Key_3.PressColEnabled = 1;
 LAN_Key_3.Font_Color = 0xEF5D;
 LAN_Key_3.VerticalText = 0;
 LAN_Key_3.Gradient = 1;
 LAN_Key_3.Gradient_Orientation = 0;
 LAN_Key_3.Gradient_Start_Color = 0x8410;
 LAN_Key_3.Gradient_End_Color = 0x4A49;
 LAN_Key_3.Color = 0xC618;
 LAN_Key_3.Press_Color = 0xE71C;
 LAN_Key_3.Corner_Radius = 4;
 LAN_Key_3.OnUpPtr = 0;
 LAN_Key_3.OnDownPtr = 0;
 LAN_Key_3.OnClickPtr = LAN_Key_3OnClick;
 LAN_Key_3.OnPressPtr = 0;

 LAN_Key_4.OwnerScreen = &Ethernet;
 LAN_Key_4.Order = 17;
 LAN_Key_4.Left = 124;
 LAN_Key_4.Top = 184;
 LAN_Key_4.Width = 32;
 LAN_Key_4.Height = 32;
 LAN_Key_4.Pen_Width = 1;
 LAN_Key_4.Pen_Color = 0x0000;
 LAN_Key_4.Visible = 1;
 LAN_Key_4.Active = 1;
 LAN_Key_4.Transparent = 1;
 LAN_Key_4.Caption = LAN_Key_4_Caption;
 LAN_Key_4.TextAlign = _taCenter;
 LAN_Key_4.TextAlignVertical= _tavMiddle;
 LAN_Key_4.FontName =  0x00005242 ;
 LAN_Key_4.PressColEnabled = 1;
 LAN_Key_4.Font_Color = 0xEF5D;
 LAN_Key_4.VerticalText = 0;
 LAN_Key_4.Gradient = 1;
 LAN_Key_4.Gradient_Orientation = 0;
 LAN_Key_4.Gradient_Start_Color = 0x8410;
 LAN_Key_4.Gradient_End_Color = 0x4A49;
 LAN_Key_4.Color = 0xC618;
 LAN_Key_4.Press_Color = 0xE71C;
 LAN_Key_4.Corner_Radius = 4;
 LAN_Key_4.OnUpPtr = 0;
 LAN_Key_4.OnDownPtr = 0;
 LAN_Key_4.OnClickPtr = LAN_Key_4OnClick;
 LAN_Key_4.OnPressPtr = 0;

 LAN_Key_5.OwnerScreen = &Ethernet;
 LAN_Key_5.Order = 18;
 LAN_Key_5.Left = 164;
 LAN_Key_5.Top = 184;
 LAN_Key_5.Width = 32;
 LAN_Key_5.Height = 32;
 LAN_Key_5.Pen_Width = 1;
 LAN_Key_5.Pen_Color = 0x0000;
 LAN_Key_5.Visible = 1;
 LAN_Key_5.Active = 1;
 LAN_Key_5.Transparent = 1;
 LAN_Key_5.Caption = LAN_Key_5_Caption;
 LAN_Key_5.TextAlign = _taCenter;
 LAN_Key_5.TextAlignVertical= _tavMiddle;
 LAN_Key_5.FontName =  0x00005242 ;
 LAN_Key_5.PressColEnabled = 1;
 LAN_Key_5.Font_Color = 0xEF5D;
 LAN_Key_5.VerticalText = 0;
 LAN_Key_5.Gradient = 1;
 LAN_Key_5.Gradient_Orientation = 0;
 LAN_Key_5.Gradient_Start_Color = 0x8410;
 LAN_Key_5.Gradient_End_Color = 0x4A49;
 LAN_Key_5.Color = 0xC618;
 LAN_Key_5.Press_Color = 0xE71C;
 LAN_Key_5.Corner_Radius = 4;
 LAN_Key_5.OnUpPtr = 0;
 LAN_Key_5.OnDownPtr = 0;
 LAN_Key_5.OnClickPtr = LAN_Key_5OnClick;
 LAN_Key_5.OnPressPtr = 0;

 LAN_Key_6.OwnerScreen = &Ethernet;
 LAN_Key_6.Order = 19;
 LAN_Key_6.Left = 204;
 LAN_Key_6.Top = 184;
 LAN_Key_6.Width = 32;
 LAN_Key_6.Height = 32;
 LAN_Key_6.Pen_Width = 1;
 LAN_Key_6.Pen_Color = 0x0000;
 LAN_Key_6.Visible = 1;
 LAN_Key_6.Active = 1;
 LAN_Key_6.Transparent = 1;
 LAN_Key_6.Caption = LAN_Key_6_Caption;
 LAN_Key_6.TextAlign = _taCenter;
 LAN_Key_6.TextAlignVertical= _tavMiddle;
 LAN_Key_6.FontName =  0x00005242 ;
 LAN_Key_6.PressColEnabled = 1;
 LAN_Key_6.Font_Color = 0xEF5D;
 LAN_Key_6.VerticalText = 0;
 LAN_Key_6.Gradient = 1;
 LAN_Key_6.Gradient_Orientation = 0;
 LAN_Key_6.Gradient_Start_Color = 0x8410;
 LAN_Key_6.Gradient_End_Color = 0x4A49;
 LAN_Key_6.Color = 0xC618;
 LAN_Key_6.Press_Color = 0xE71C;
 LAN_Key_6.Corner_Radius = 4;
 LAN_Key_6.OnUpPtr = 0;
 LAN_Key_6.OnDownPtr = 0;
 LAN_Key_6.OnClickPtr = LAN_Key_6OnClick;
 LAN_Key_6.OnPressPtr = 0;

 LAN_Key_7.OwnerScreen = &Ethernet;
 LAN_Key_7.Order = 20;
 LAN_Key_7.Left = 244;
 LAN_Key_7.Top = 184;
 LAN_Key_7.Width = 32;
 LAN_Key_7.Height = 32;
 LAN_Key_7.Pen_Width = 1;
 LAN_Key_7.Pen_Color = 0x0000;
 LAN_Key_7.Visible = 1;
 LAN_Key_7.Active = 1;
 LAN_Key_7.Transparent = 1;
 LAN_Key_7.Caption = LAN_Key_7_Caption;
 LAN_Key_7.TextAlign = _taCenter;
 LAN_Key_7.TextAlignVertical= _tavMiddle;
 LAN_Key_7.FontName =  0x00005242 ;
 LAN_Key_7.PressColEnabled = 1;
 LAN_Key_7.Font_Color = 0xEF5D;
 LAN_Key_7.VerticalText = 0;
 LAN_Key_7.Gradient = 1;
 LAN_Key_7.Gradient_Orientation = 0;
 LAN_Key_7.Gradient_Start_Color = 0x8410;
 LAN_Key_7.Gradient_End_Color = 0x4A49;
 LAN_Key_7.Color = 0xC618;
 LAN_Key_7.Press_Color = 0xE71C;
 LAN_Key_7.Corner_Radius = 4;
 LAN_Key_7.OnUpPtr = 0;
 LAN_Key_7.OnDownPtr = 0;
 LAN_Key_7.OnClickPtr = LAN_Key_7OnClick;
 LAN_Key_7.OnPressPtr = 0;

 LAN_Key_8.OwnerScreen = &Ethernet;
 LAN_Key_8.Order = 21;
 LAN_Key_8.Left = 284;
 LAN_Key_8.Top = 184;
 LAN_Key_8.Width = 32;
 LAN_Key_8.Height = 32;
 LAN_Key_8.Pen_Width = 1;
 LAN_Key_8.Pen_Color = 0x0000;
 LAN_Key_8.Visible = 1;
 LAN_Key_8.Active = 1;
 LAN_Key_8.Transparent = 1;
 LAN_Key_8.Caption = LAN_Key_8_Caption;
 LAN_Key_8.TextAlign = _taCenter;
 LAN_Key_8.TextAlignVertical= _tavMiddle;
 LAN_Key_8.FontName =  0x00005242 ;
 LAN_Key_8.PressColEnabled = 1;
 LAN_Key_8.Font_Color = 0xEF5D;
 LAN_Key_8.VerticalText = 0;
 LAN_Key_8.Gradient = 1;
 LAN_Key_8.Gradient_Orientation = 0;
 LAN_Key_8.Gradient_Start_Color = 0x8410;
 LAN_Key_8.Gradient_End_Color = 0x4A49;
 LAN_Key_8.Color = 0xC618;
 LAN_Key_8.Press_Color = 0xE71C;
 LAN_Key_8.Corner_Radius = 4;
 LAN_Key_8.OnUpPtr = 0;
 LAN_Key_8.OnDownPtr = 0;
 LAN_Key_8.OnClickPtr = LAN_Key_8OnClick;
 LAN_Key_8.OnPressPtr = 0;

 LAN_Key_9.OwnerScreen = &Ethernet;
 LAN_Key_9.Order = 22;
 LAN_Key_9.Left = 324;
 LAN_Key_9.Top = 184;
 LAN_Key_9.Width = 32;
 LAN_Key_9.Height = 32;
 LAN_Key_9.Pen_Width = 1;
 LAN_Key_9.Pen_Color = 0x0000;
 LAN_Key_9.Visible = 1;
 LAN_Key_9.Active = 1;
 LAN_Key_9.Transparent = 1;
 LAN_Key_9.Caption = LAN_Key_9_Caption;
 LAN_Key_9.TextAlign = _taCenter;
 LAN_Key_9.TextAlignVertical= _tavMiddle;
 LAN_Key_9.FontName =  0x00005242 ;
 LAN_Key_9.PressColEnabled = 1;
 LAN_Key_9.Font_Color = 0xEF5D;
 LAN_Key_9.VerticalText = 0;
 LAN_Key_9.Gradient = 1;
 LAN_Key_9.Gradient_Orientation = 0;
 LAN_Key_9.Gradient_Start_Color = 0x8410;
 LAN_Key_9.Gradient_End_Color = 0x4A49;
 LAN_Key_9.Color = 0xC618;
 LAN_Key_9.Press_Color = 0xE71C;
 LAN_Key_9.Corner_Radius = 4;
 LAN_Key_9.OnUpPtr = 0;
 LAN_Key_9.OnDownPtr = 0;
 LAN_Key_9.OnClickPtr = LAN_Key_9OnClick;
 LAN_Key_9.OnPressPtr = 0;

 LAN_Key_0.OwnerScreen = &Ethernet;
 LAN_Key_0.Order = 23;
 LAN_Key_0.Left = 364;
 LAN_Key_0.Top = 184;
 LAN_Key_0.Width = 32;
 LAN_Key_0.Height = 32;
 LAN_Key_0.Pen_Width = 1;
 LAN_Key_0.Pen_Color = 0x0000;
 LAN_Key_0.Visible = 1;
 LAN_Key_0.Active = 1;
 LAN_Key_0.Transparent = 1;
 LAN_Key_0.Caption = LAN_Key_0_Caption;
 LAN_Key_0.TextAlign = _taCenter;
 LAN_Key_0.TextAlignVertical= _tavMiddle;
 LAN_Key_0.FontName =  0x00005242 ;
 LAN_Key_0.PressColEnabled = 1;
 LAN_Key_0.Font_Color = 0xEF5D;
 LAN_Key_0.VerticalText = 0;
 LAN_Key_0.Gradient = 1;
 LAN_Key_0.Gradient_Orientation = 0;
 LAN_Key_0.Gradient_Start_Color = 0x8410;
 LAN_Key_0.Gradient_End_Color = 0x4A49;
 LAN_Key_0.Color = 0xC618;
 LAN_Key_0.Press_Color = 0xE71C;
 LAN_Key_0.Corner_Radius = 4;
 LAN_Key_0.OnUpPtr = 0;
 LAN_Key_0.OnDownPtr = 0;
 LAN_Key_0.OnClickPtr = LAN_Key_0OnClick;
 LAN_Key_0.OnPressPtr = 0;

 Label40.OwnerScreen = &Ethernet;
 Label40.Order = 24;
 Label40.Left = 204;
 Label40.Top = 5;
 Label40.Width = 91;
 Label40.Height = 20;
 Label40.Visible = 1;
 Label40.Active = 0;
 Label40.Caption = Label40_Caption;
 Label40.FontName =  0x00005242 ;
 Label40.Font_Color = 0xE7FC;
 Label40.VerticalText = 0;
 Label40.OnUpPtr = 0;
 Label40.OnDownPtr = 0;
 Label40.OnClickPtr = 0;
 Label40.OnPressPtr = 0;

 LAN_Key_Dot.OwnerScreen = &Ethernet;
 LAN_Key_Dot.Order = 25;
 LAN_Key_Dot.Left = 404;
 LAN_Key_Dot.Top = 184;
 LAN_Key_Dot.Width = 32;
 LAN_Key_Dot.Height = 32;
 LAN_Key_Dot.Pen_Width = 1;
 LAN_Key_Dot.Pen_Color = 0x0000;
 LAN_Key_Dot.Visible = 1;
 LAN_Key_Dot.Active = 1;
 LAN_Key_Dot.Transparent = 1;
 LAN_Key_Dot.Caption = LAN_Key_Dot_Caption;
 LAN_Key_Dot.TextAlign = _taCenter;
 LAN_Key_Dot.TextAlignVertical= _tavMiddle;
 LAN_Key_Dot.FontName =  0x00005242 ;
 LAN_Key_Dot.PressColEnabled = 1;
 LAN_Key_Dot.Font_Color = 0xEF5D;
 LAN_Key_Dot.VerticalText = 0;
 LAN_Key_Dot.Gradient = 1;
 LAN_Key_Dot.Gradient_Orientation = 0;
 LAN_Key_Dot.Gradient_Start_Color = 0x8410;
 LAN_Key_Dot.Gradient_End_Color = 0x4A49;
 LAN_Key_Dot.Color = 0xC618;
 LAN_Key_Dot.Press_Color = 0xE71C;
 LAN_Key_Dot.Corner_Radius = 4;
 LAN_Key_Dot.OnUpPtr = 0;
 LAN_Key_Dot.OnDownPtr = 0;
 LAN_Key_Dot.OnClickPtr = LAN_Key_DotOnClick;
 LAN_Key_Dot.OnPressPtr = 0;

 LAN_Key_Clear.OwnerScreen = &Ethernet;
 LAN_Key_Clear.Order = 26;
 LAN_Key_Clear.Left = 444;
 LAN_Key_Clear.Top = 184;
 LAN_Key_Clear.Width = 32;
 LAN_Key_Clear.Height = 32;
 LAN_Key_Clear.Pen_Width = 1;
 LAN_Key_Clear.Pen_Color = 0x0000;
 LAN_Key_Clear.Visible = 1;
 LAN_Key_Clear.Active = 1;
 LAN_Key_Clear.Transparent = 1;
 LAN_Key_Clear.Caption = LAN_Key_Clear_Caption;
 LAN_Key_Clear.TextAlign = _taCenter;
 LAN_Key_Clear.TextAlignVertical= _tavMiddle;
 LAN_Key_Clear.FontName =  0x00005242 ;
 LAN_Key_Clear.PressColEnabled = 1;
 LAN_Key_Clear.Font_Color = 0xFFFF;
 LAN_Key_Clear.VerticalText = 0;
 LAN_Key_Clear.Gradient = 1;
 LAN_Key_Clear.Gradient_Orientation = 0;
 LAN_Key_Clear.Gradient_Start_Color = 0x8410;
 LAN_Key_Clear.Gradient_End_Color = 0x4A49;
 LAN_Key_Clear.Color = 0x8410;
 LAN_Key_Clear.Press_Color = 0xE71C;
 LAN_Key_Clear.Corner_Radius = 4;
 LAN_Key_Clear.OnUpPtr = 0;
 LAN_Key_Clear.OnDownPtr = 0;
 LAN_Key_Clear.OnClickPtr = LAN_Key_ClearOnClick;
 LAN_Key_Clear.OnPressPtr = 0;

 Home_b19.OwnerScreen = &Ethernet;
 Home_b19.Order = 27;
 Home_b19.Left = 246;
 Home_b19.Top = 232;
 Home_b19.Width = 78;
 Home_b19.Height = 35;
 Home_b19.Pen_Width = 1;
 Home_b19.Pen_Color = 0xC618;
 Home_b19.Visible = 1;
 Home_b19.Active = 1;
 Home_b19.Transparent = 1;
 Home_b19.Caption = Home_b19_Caption;
 Home_b19.TextAlign = _taCenter;
 Home_b19.TextAlignVertical= _tavMiddle;
 Home_b19.FontName =  0x00005242 ;
 Home_b19.PressColEnabled = 1;
 Home_b19.Font_Color = 0xD6BA;
 Home_b19.VerticalText = 0;
 Home_b19.Gradient = 1;
 Home_b19.Gradient_Orientation = 0;
 Home_b19.Gradient_Start_Color = 0x0418;
 Home_b19.Gradient_End_Color = 0x00A5;
 Home_b19.Color = 0xC618;
 Home_b19.Press_Color = 0xE71C;
 Home_b19.Corner_Radius = 5;
 Home_b19.OnUpPtr = 0;
 Home_b19.OnDownPtr = 0;
 Home_b19.OnClickPtr = BackToHome;
 Home_b19.OnPressPtr = 0;

 Back_b15.OwnerScreen = &Ethernet;
 Back_b15.Order = 28;
 Back_b15.Left = 162;
 Back_b15.Top = 232;
 Back_b15.Width = 78;
 Back_b15.Height = 35;
 Back_b15.Pen_Width = 1;
 Back_b15.Pen_Color = 0xC618;
 Back_b15.Visible = 1;
 Back_b15.Active = 1;
 Back_b15.Transparent = 1;
 Back_b15.Caption = Back_b15_Caption;
 Back_b15.TextAlign = _taCenter;
 Back_b15.TextAlignVertical= _tavMiddle;
 Back_b15.FontName =  0x00005242 ;
 Back_b15.PressColEnabled = 1;
 Back_b15.Font_Color = 0xD6BA;
 Back_b15.VerticalText = 0;
 Back_b15.Gradient = 1;
 Back_b15.Gradient_Orientation = 0;
 Back_b15.Gradient_Start_Color = 0x0418;
 Back_b15.Gradient_End_Color = 0x00A5;
 Back_b15.Color = 0xC618;
 Back_b15.Press_Color = 0xE71C;
 Back_b15.Corner_Radius = 5;
 Back_b15.OnUpPtr = 0;
 Back_b15.OnDownPtr = 0;
 Back_b15.OnClickPtr = goToBack;
 Back_b15.OnPressPtr = 0;

 Image146.OwnerScreen = &SETTINGS;
 Image146.Order = 0;
 Image146.Left = 1;
 Image146.Top = 0;
 Image146.Width = 480;
 Image146.Height = 272;
 Image146.Picture_Type = 0;
 Image146.Picture_Ratio = 1;
 Image146.Picture_Name =  0x00386CF4 ;
 Image146.Visible = 1;
 Image146.Active = 1;
 Image146.OnUpPtr = 0;
 Image146.OnDownPtr = 0;
 Image146.OnClickPtr = 0;
 Image146.OnPressPtr = 0;

 Image109.OwnerScreen = &SETTINGS;
 Image109.Order = 1;
 Image109.Left = 10;
 Image109.Top = 32;
 Image109.Width = 463;
 Image109.Height = 32;
 Image109.Picture_Type = 1;
 Image109.Picture_Ratio = 1;
 Image109.Picture_Name =  0x003C68FA ;
 Image109.Visible = 1;
 Image109.Active = 1;
 Image109.OnUpPtr = 0;
 Image109.OnDownPtr = 0;
 Image109.OnClickPtr = 0;
 Image109.OnPressPtr = 0;

 Image147.OwnerScreen = &SETTINGS;
 Image147.Order = 2;
 Image147.Left = 10;
 Image147.Top = 64;
 Image147.Width = 463;
 Image147.Height = 34;
 Image147.Picture_Type = 1;
 Image147.Picture_Ratio = 1;
 Image147.Picture_Name =  0x003CDCC0 ;
 Image147.Visible = 1;
 Image147.Active = 1;
 Image147.OnUpPtr = 0;
 Image147.OnDownPtr = 0;
 Image147.OnClickPtr = 0;
 Image147.OnPressPtr = 0;

 Image153.OwnerScreen = &SETTINGS;
 Image153.Order = 3;
 Image153.Left = 9;
 Image153.Top = 99;
 Image153.Width = 463;
 Image153.Height = 33;
 Image153.Picture_Type = 1;
 Image153.Picture_Ratio = 1;
 Image153.Picture_Name =  0x003D57C2 ;
 Image153.Visible = 1;
 Image153.Active = 1;
 Image153.OnUpPtr = 0;
 Image153.OnDownPtr = 0;
 Image153.OnClickPtr = 0;
 Image153.OnPressPtr = 0;

 Label44.OwnerScreen = &SETTINGS;
 Label44.Order = 4;
 Label44.Left = 206;
 Label44.Top = 5;
 Label44.Width = 85;
 Label44.Height = 20;
 Label44.Visible = 1;
 Label44.Active = 0;
 Label44.Caption = Label44_Caption;
 Label44.FontName =  0x00005242 ;
 Label44.Font_Color = 0xE7FC;
 Label44.VerticalText = 0;
 Label44.OnUpPtr = 0;
 Label44.OnDownPtr = 0;
 Label44.OnClickPtr = 0;
 Label44.OnPressPtr = 0;

 Image114.OwnerScreen = &SETTINGS;
 Image114.Order = 5;
 Image114.Left = 376;
 Image114.Top = 33;
 Image114.Width = 28;
 Image114.Height = 32;
 Image114.Picture_Type = 1;
 Image114.Picture_Ratio = 1;
 Image114.Picture_Name =  0x0016C712 ;
 Image114.Visible = 1;
 Image114.Active = 0;
 Image114.OnUpPtr = 0;
 Image114.OnDownPtr = 0;
 Image114.OnClickPtr = 0;
 Image114.OnPressPtr = 0;

 Image115.OwnerScreen = &SETTINGS;
 Image115.Order = 6;
 Image115.Left = 376;
 Image115.Top = 67;
 Image115.Width = 28;
 Image115.Height = 32;
 Image115.Picture_Type = 1;
 Image115.Picture_Ratio = 1;
 Image115.Picture_Name =  0x0016C712 ;
 Image115.Visible = 1;
 Image115.Active = 0;
 Image115.OnUpPtr = 0;
 Image115.OnDownPtr = 0;
 Image115.OnClickPtr = 0;
 Image115.OnPressPtr = 0;

 Image116.OwnerScreen = &SETTINGS;
 Image116.Order = 7;
 Image116.Left = 377;
 Image116.Top = 100;
 Image116.Width = 28;
 Image116.Height = 32;
 Image116.Picture_Type = 1;
 Image116.Picture_Ratio = 1;
 Image116.Picture_Name =  0x0016C712 ;
 Image116.Visible = 0;
 Image116.Active = 0;
 Image116.OnUpPtr = 0;
 Image116.OnDownPtr = 0;
 Image116.OnClickPtr = 0;
 Image116.OnPressPtr = 0;

 Image121.OwnerScreen = &SETTINGS;
 Image121.Order = 8;
 Image121.Left = 406;
 Image121.Top = 33;
 Image121.Width = 28;
 Image121.Height = 32;
 Image121.Picture_Type = 1;
 Image121.Picture_Ratio = 1;
 Image121.Picture_Name =  0x0016CE18 ;
 Image121.Visible = 1;
 Image121.Active = 0;
 Image121.OnUpPtr = 0;
 Image121.OnDownPtr = 0;
 Image121.OnClickPtr = 0;
 Image121.OnPressPtr = 0;

 Image122.OwnerScreen = &SETTINGS;
 Image122.Order = 9;
 Image122.Left = 406;
 Image122.Top = 67;
 Image122.Width = 28;
 Image122.Height = 32;
 Image122.Picture_Type = 1;
 Image122.Picture_Ratio = 1;
 Image122.Picture_Name =  0x0016CE18 ;
 Image122.Visible = 1;
 Image122.Active = 0;
 Image122.OnUpPtr = 0;
 Image122.OnDownPtr = 0;
 Image122.OnClickPtr = 0;
 Image122.OnPressPtr = 0;

 Image123.OwnerScreen = &SETTINGS;
 Image123.Order = 10;
 Image123.Left = 406;
 Image123.Top = 100;
 Image123.Width = 28;
 Image123.Height = 32;
 Image123.Picture_Type = 1;
 Image123.Picture_Ratio = 1;
 Image123.Picture_Name =  0x0016CE18 ;
 Image123.Visible = 0;
 Image123.Active = 0;
 Image123.OnUpPtr = 0;
 Image123.OnDownPtr = 0;
 Image123.OnClickPtr = 0;
 Image123.OnPressPtr = 0;

 Image128.OwnerScreen = &SETTINGS;
 Image128.Order = 11;
 Image128.Left = 439;
 Image128.Top = 33;
 Image128.Width = 34;
 Image128.Height = 32;
 Image128.Picture_Type = 1;
 Image128.Picture_Ratio = 1;
 Image128.Picture_Name =  0x0016D51E ;
 Image128.Visible = 1;
 Image128.Active = 0;
 Image128.OnUpPtr = 0;
 Image128.OnDownPtr = 0;
 Image128.OnClickPtr = 0;
 Image128.OnPressPtr = 0;

 Image129.OwnerScreen = &SETTINGS;
 Image129.Order = 12;
 Image129.Left = 439;
 Image129.Top = 67;
 Image129.Width = 34;
 Image129.Height = 32;
 Image129.Picture_Type = 1;
 Image129.Picture_Ratio = 1;
 Image129.Picture_Name =  0x0016D51E ;
 Image129.Visible = 1;
 Image129.Active = 0;
 Image129.OnUpPtr = 0;
 Image129.OnDownPtr = 0;
 Image129.OnClickPtr = 0;
 Image129.OnPressPtr = 0;

 Image130.OwnerScreen = &SETTINGS;
 Image130.Order = 13;
 Image130.Left = 439;
 Image130.Top = 101;
 Image130.Width = 34;
 Image130.Height = 32;
 Image130.Picture_Type = 1;
 Image130.Picture_Ratio = 1;
 Image130.Picture_Name =  0x0016D51E ;
 Image130.Visible = 0;
 Image130.Active = 0;
 Image130.OnUpPtr = 0;
 Image130.OnDownPtr = 0;
 Image130.OnClickPtr = 0;
 Image130.OnPressPtr = 0;

 Image135.OwnerScreen = &SETTINGS;
 Image135.Order = 14;
 Image135.Left = 439;
 Image135.Top = 32;
 Image135.Width = 34;
 Image135.Height = 32;
 Image135.Picture_Type = 1;
 Image135.Picture_Ratio = 1;
 Image135.Picture_Name =  0x0016E4AA ;
 Image135.Visible = 1;
 Image135.Active = 1;
 Image135.OnUpPtr = Set_heat_onup;
 Image135.OnDownPtr = Set_heat_OnDown;
 Image135.OnClickPtr = 0;
 Image135.OnPressPtr = 0;

 Image138.OwnerScreen = &SETTINGS;
 Image138.Order = 15;
 Image138.Left = 439;
 Image138.Top = 66;
 Image138.Width = 34;
 Image138.Height = 32;
 Image138.Picture_Type = 1;
 Image138.Picture_Ratio = 1;
 Image138.Picture_Name =  0x0016E4AA ;
 Image138.Visible = 1;
 Image138.Active = 1;
 Image138.OnUpPtr = Set_cool_OnUp;
 Image138.OnDownPtr = Set_cool_OnDown;
 Image138.OnClickPtr = 0;
 Image138.OnPressPtr = 0;

 Set_DHW_HY.OwnerScreen = &SETTINGS;
 Set_DHW_HY.Order = 16;
 Set_DHW_HY.Left = 439;
 Set_DHW_HY.Top = 100;
 Set_DHW_HY.Width = 34;
 Set_DHW_HY.Height = 32;
 Set_DHW_HY.Picture_Type = 1;
 Set_DHW_HY.Picture_Ratio = 1;
 Set_DHW_HY.Picture_Name =  0x0016E4AA ;
 Set_DHW_HY.Visible = 1;
 Set_DHW_HY.Active = 1;
 Set_DHW_HY.OnUpPtr = Set_dhw_OnUp;
 Set_DHW_HY.OnDownPtr = Set_dhw_OnDown;
 Set_DHW_HY.OnClickPtr = 0;
 Set_DHW_HY.OnPressPtr = 0;

 Hyst_Heat_down.OwnerScreen = &SETTINGS;
 Hyst_Heat_down.Order = 17;
 Hyst_Heat_down.Left = 376;
 Hyst_Heat_down.Top = 32;
 Hyst_Heat_down.Width = 28;
 Hyst_Heat_down.Height = 32;
 Hyst_Heat_down.Picture_Type = 1;
 Hyst_Heat_down.Picture_Ratio = 1;
 Hyst_Heat_down.Picture_Name =  0x0016ED30 ;
 Hyst_Heat_down.Visible = 1;
 Hyst_Heat_down.Active = 1;
 Hyst_Heat_down.OnUpPtr = Hyst_Heat_downOnUp;
 Hyst_Heat_down.OnDownPtr = 0;
 Hyst_Heat_down.OnClickPtr = 0;
 Hyst_Heat_down.OnPressPtr = Hyst_Heat_downOnPress;

 Hyst_DHW_down.OwnerScreen = &SETTINGS;
 Hyst_DHW_down.Order = 18;
 Hyst_DHW_down.Left = 376;
 Hyst_DHW_down.Top = 100;
 Hyst_DHW_down.Width = 28;
 Hyst_DHW_down.Height = 32;
 Hyst_DHW_down.Picture_Type = 1;
 Hyst_DHW_down.Picture_Ratio = 1;
 Hyst_DHW_down.Picture_Name =  0x0016ED30 ;
 Hyst_DHW_down.Visible = 1;
 Hyst_DHW_down.Active = 1;
 Hyst_DHW_down.OnUpPtr = Hyst_DHW_downOnUp;
 Hyst_DHW_down.OnDownPtr = 0;
 Hyst_DHW_down.OnClickPtr = 0;
 Hyst_DHW_down.OnPressPtr = Hyst_DHW_downOnPress;

 Hyst_Heat_up.OwnerScreen = &SETTINGS;
 Hyst_Heat_up.Order = 19;
 Hyst_Heat_up.Left = 406;
 Hyst_Heat_up.Top = 32;
 Hyst_Heat_up.Width = 28;
 Hyst_Heat_up.Height = 32;
 Hyst_Heat_up.Picture_Type = 1;
 Hyst_Heat_up.Picture_Ratio = 1;
 Hyst_Heat_up.Picture_Name =  0x0016DDA4 ;
 Hyst_Heat_up.Visible = 1;
 Hyst_Heat_up.Active = 1;
 Hyst_Heat_up.OnUpPtr = Hyst_Heat_upOnUp;
 Hyst_Heat_up.OnDownPtr = 0;
 Hyst_Heat_up.OnClickPtr = 0;
 Hyst_Heat_up.OnPressPtr = Hyst_Heat_upOnPress;

 Hyst_Cool_up.OwnerScreen = &SETTINGS;
 Hyst_Cool_up.Order = 20;
 Hyst_Cool_up.Left = 406;
 Hyst_Cool_up.Top = 66;
 Hyst_Cool_up.Width = 28;
 Hyst_Cool_up.Height = 32;
 Hyst_Cool_up.Picture_Type = 1;
 Hyst_Cool_up.Picture_Ratio = 1;
 Hyst_Cool_up.Picture_Name =  0x0016DDA4 ;
 Hyst_Cool_up.Visible = 1;
 Hyst_Cool_up.Active = 1;
 Hyst_Cool_up.OnUpPtr = Hyst_Cool_upOnUp;
 Hyst_Cool_up.OnDownPtr = 0;
 Hyst_Cool_up.OnClickPtr = 0;
 Hyst_Cool_up.OnPressPtr = Hyst_Cool_upOnPress;

 Hyst_DHW_up.OwnerScreen = &SETTINGS;
 Hyst_DHW_up.Order = 21;
 Hyst_DHW_up.Left = 406;
 Hyst_DHW_up.Top = 100;
 Hyst_DHW_up.Width = 28;
 Hyst_DHW_up.Height = 32;
 Hyst_DHW_up.Picture_Type = 1;
 Hyst_DHW_up.Picture_Ratio = 1;
 Hyst_DHW_up.Picture_Name =  0x0016DDA4 ;
 Hyst_DHW_up.Visible = 1;
 Hyst_DHW_up.Active = 1;
 Hyst_DHW_up.OnUpPtr = Hyst_DHW_upOnUp;
 Hyst_DHW_up.OnDownPtr = 0;
 Hyst_DHW_up.OnClickPtr = 0;
 Hyst_DHW_up.OnPressPtr = Hyst_DHW_upOnPress;

 Hyst_Cool_down.OwnerScreen = &SETTINGS;
 Hyst_Cool_down.Order = 22;
 Hyst_Cool_down.Left = 376;
 Hyst_Cool_down.Top = 66;
 Hyst_Cool_down.Width = 28;
 Hyst_Cool_down.Height = 32;
 Hyst_Cool_down.Picture_Type = 1;
 Hyst_Cool_down.Picture_Ratio = 1;
 Hyst_Cool_down.Picture_Name =  0x0016ED30 ;
 Hyst_Cool_down.Visible = 1;
 Hyst_Cool_down.Active = 1;
 Hyst_Cool_down.OnUpPtr = Hyst_Cool_downOnUp;
 Hyst_Cool_down.OnDownPtr = 0;
 Hyst_Cool_down.OnClickPtr = 0;
 Hyst_Cool_down.OnPressPtr = Hyst_Cool_downOnPress;

 Home_b20.OwnerScreen = &SETTINGS;
 Home_b20.Order = 23;
 Home_b20.Left = 246;
 Home_b20.Top = 232;
 Home_b20.Width = 78;
 Home_b20.Height = 35;
 Home_b20.Pen_Width = 1;
 Home_b20.Pen_Color = 0xC618;
 Home_b20.Visible = 1;
 Home_b20.Active = 1;
 Home_b20.Transparent = 1;
 Home_b20.Caption = Home_b20_Caption;
 Home_b20.TextAlign = _taCenter;
 Home_b20.TextAlignVertical= _tavMiddle;
 Home_b20.FontName =  0x00005242 ;
 Home_b20.PressColEnabled = 1;
 Home_b20.Font_Color = 0xD6BA;
 Home_b20.VerticalText = 0;
 Home_b20.Gradient = 1;
 Home_b20.Gradient_Orientation = 0;
 Home_b20.Gradient_Start_Color = 0x0418;
 Home_b20.Gradient_End_Color = 0x00A5;
 Home_b20.Color = 0xC618;
 Home_b20.Press_Color = 0xE71C;
 Home_b20.Corner_Radius = 5;
 Home_b20.OnUpPtr = 0;
 Home_b20.OnDownPtr = 0;
 Home_b20.OnClickPtr = BackToHome;
 Home_b20.OnPressPtr = 0;

 Back_b16.OwnerScreen = &SETTINGS;
 Back_b16.Order = 24;
 Back_b16.Left = 162;
 Back_b16.Top = 232;
 Back_b16.Width = 78;
 Back_b16.Height = 35;
 Back_b16.Pen_Width = 1;
 Back_b16.Pen_Color = 0xC618;
 Back_b16.Visible = 1;
 Back_b16.Active = 1;
 Back_b16.Transparent = 1;
 Back_b16.Caption = Back_b16_Caption;
 Back_b16.TextAlign = _taCenter;
 Back_b16.TextAlignVertical= _tavMiddle;
 Back_b16.FontName =  0x00005242 ;
 Back_b16.PressColEnabled = 1;
 Back_b16.Font_Color = 0xD6BA;
 Back_b16.VerticalText = 0;
 Back_b16.Gradient = 1;
 Back_b16.Gradient_Orientation = 0;
 Back_b16.Gradient_Start_Color = 0x0418;
 Back_b16.Gradient_End_Color = 0x00A5;
 Back_b16.Color = 0xC618;
 Back_b16.Press_Color = 0xE71C;
 Back_b16.Corner_Radius = 5;
 Back_b16.OnUpPtr = 0;
 Back_b16.OnDownPtr = 0;
 Back_b16.OnClickPtr = goToBack;
 Back_b16.OnPressPtr = 0;

 Hysteresis_heating.OwnerScreen = &SETTINGS;
 Hysteresis_heating.Order = 25;
 Hysteresis_heating.Left = 305;
 Hysteresis_heating.Top = 36;
 Hysteresis_heating.Width = 40;
 Hysteresis_heating.Height = 23;
 Hysteresis_heating.Pen_Width = 1;
 Hysteresis_heating.Pen_Color = 0x0000;
 Hysteresis_heating.Visible = 1;
 Hysteresis_heating.Active = 0;
 Hysteresis_heating.Transparent = 1;
 Hysteresis_heating.Caption = Hysteresis_heating_Caption;
 Hysteresis_heating.TextAlign = _taCenter;
 Hysteresis_heating.TextAlignVertical= _tavMiddle;
 Hysteresis_heating.FontName =  0x00005242 ;
 Hysteresis_heating.PressColEnabled = 1;
 Hysteresis_heating.Font_Color = 0x0408;
 Hysteresis_heating.VerticalText = 0;
 Hysteresis_heating.Gradient = 0;
 Hysteresis_heating.Gradient_Orientation = 0;
 Hysteresis_heating.Gradient_Start_Color = 0xFFFF;
 Hysteresis_heating.Gradient_End_Color = 0xC618;
 Hysteresis_heating.Color = 0xFFFF;
 Hysteresis_heating.Press_Color = 0xE71C;
 Hysteresis_heating.Corner_Radius = 3;
 Hysteresis_heating.OnUpPtr = 0;
 Hysteresis_heating.OnDownPtr = 0;
 Hysteresis_heating.OnClickPtr = 0;
 Hysteresis_heating.OnPressPtr = 0;

 Hysteresis_cooling.OwnerScreen = &SETTINGS;
 Hysteresis_cooling.Order = 26;
 Hysteresis_cooling.Left = 305;
 Hysteresis_cooling.Top = 69;
 Hysteresis_cooling.Width = 40;
 Hysteresis_cooling.Height = 23;
 Hysteresis_cooling.Pen_Width = 1;
 Hysteresis_cooling.Pen_Color = 0x0000;
 Hysteresis_cooling.Visible = 1;
 Hysteresis_cooling.Active = 0;
 Hysteresis_cooling.Transparent = 1;
 Hysteresis_cooling.Caption = Hysteresis_cooling_Caption;
 Hysteresis_cooling.TextAlign = _taCenter;
 Hysteresis_cooling.TextAlignVertical= _tavMiddle;
 Hysteresis_cooling.FontName =  0x00005242 ;
 Hysteresis_cooling.PressColEnabled = 1;
 Hysteresis_cooling.Font_Color = 0x0408;
 Hysteresis_cooling.VerticalText = 0;
 Hysteresis_cooling.Gradient = 0;
 Hysteresis_cooling.Gradient_Orientation = 0;
 Hysteresis_cooling.Gradient_Start_Color = 0xFFFF;
 Hysteresis_cooling.Gradient_End_Color = 0xC618;
 Hysteresis_cooling.Color = 0xFFFF;
 Hysteresis_cooling.Press_Color = 0xE71C;
 Hysteresis_cooling.Corner_Radius = 3;
 Hysteresis_cooling.OnUpPtr = 0;
 Hysteresis_cooling.OnDownPtr = 0;
 Hysteresis_cooling.OnClickPtr = 0;
 Hysteresis_cooling.OnPressPtr = 0;

 Hysteresis_DHW.OwnerScreen = &SETTINGS;
 Hysteresis_DHW.Order = 27;
 Hysteresis_DHW.Left = 305;
 Hysteresis_DHW.Top = 103;
 Hysteresis_DHW.Width = 40;
 Hysteresis_DHW.Height = 23;
 Hysteresis_DHW.Pen_Width = 1;
 Hysteresis_DHW.Pen_Color = 0x0000;
 Hysteresis_DHW.Visible = 1;
 Hysteresis_DHW.Active = 0;
 Hysteresis_DHW.Transparent = 1;
 Hysteresis_DHW.Caption = Hysteresis_DHW_Caption;
 Hysteresis_DHW.TextAlign = _taCenter;
 Hysteresis_DHW.TextAlignVertical= _tavMiddle;
 Hysteresis_DHW.FontName =  0x00005242 ;
 Hysteresis_DHW.PressColEnabled = 1;
 Hysteresis_DHW.Font_Color = 0x0408;
 Hysteresis_DHW.VerticalText = 0;
 Hysteresis_DHW.Gradient = 0;
 Hysteresis_DHW.Gradient_Orientation = 0;
 Hysteresis_DHW.Gradient_Start_Color = 0xFFFF;
 Hysteresis_DHW.Gradient_End_Color = 0xC618;
 Hysteresis_DHW.Color = 0xFFFF;
 Hysteresis_DHW.Press_Color = 0xE71C;
 Hysteresis_DHW.Corner_Radius = 3;
 Hysteresis_DHW.OnUpPtr = 0;
 Hysteresis_DHW.OnDownPtr = 0;
 Hysteresis_DHW.OnClickPtr = 0;
 Hysteresis_DHW.OnPressPtr = 0;

 Image62.OwnerScreen = &Gauge2;
 Image62.Order = 0;
 Image62.Left = 0;
 Image62.Top = 0;
 Image62.Width = 480;
 Image62.Height = 272;
 Image62.Picture_Type = 1;
 Image62.Picture_Ratio = 1;
 Image62.Picture_Name =  0x0003CAAE ;
 Image62.Visible = 1;
 Image62.Active = 0;
 Image62.OnUpPtr = 0;
 Image62.OnDownPtr = 0;
 Image62.OnClickPtr = 0;
 Image62.OnPressPtr = 0;

 Label69.OwnerScreen = &Gauge2;
 Label69.Order = 1;
 Label69.Left = 162;
 Label69.Top = 5;
 Label69.Width = 156;
 Label69.Height = 20;
 Label69.Visible = 1;
 Label69.Active = 0;
 Label69.Caption = Label69_Caption;
 Label69.FontName =  0x00005242 ;
 Label69.Font_Color = 0xE7FC;
 Label69.VerticalText = 0;
 Label69.OnUpPtr = 0;
 Label69.OnDownPtr = 0;
 Label69.OnClickPtr = 0;
 Label69.OnPressPtr = 0;

 Image134.OwnerScreen = &Gauge2;
 Image134.Order = 2;
 Image134.Left = 0;
 Image134.Top = 0;
 Image134.Width = 30;
 Image134.Height = 30;
 Image134.Picture_Type = 1;
 Image134.Picture_Ratio = 1;
 Image134.Picture_Name =  0x00087E16 ;
 Image134.Visible = 1;
 Image134.Active = 1;
 Image134.OnUpPtr = 0;
 Image134.OnDownPtr = 0;
 Image134.OnClickPtr = 0;
 Image134.OnPressPtr = 0;

 HP2_gauge.OwnerScreen = &Gauge2;
 HP2_gauge.Order = 3;
 HP2_gauge.Left = 39;
 HP2_gauge.Top = 34;
 HP2_gauge.Width = 189;
 HP2_gauge.Height = 189;
 HP2_gauge.Picture_Type = 1;
 HP2_gauge.Picture_Ratio = 1;
 HP2_gauge.Picture_Name =  0x000E738E ;
 HP2_gauge.Visible = 1;
 HP2_gauge.Active = 0;
 HP2_gauge.OnUpPtr = 0;
 HP2_gauge.OnDownPtr = 0;
 HP2_gauge.OnClickPtr = 0;
 HP2_gauge.OnPressPtr = 0;

 LP2_gauge.OwnerScreen = &Gauge2;
 LP2_gauge.Order = 4;
 LP2_gauge.Left = 250;
 LP2_gauge.Top = 34;
 LP2_gauge.Width = 189;
 LP2_gauge.Height = 189;
 LP2_gauge.Picture_Type = 1;
 LP2_gauge.Picture_Ratio = 1;
 LP2_gauge.Picture_Name =  0x000D5C76 ;
 LP2_gauge.Visible = 1;
 LP2_gauge.Active = 0;
 LP2_gauge.OnUpPtr = 0;
 LP2_gauge.OnDownPtr = 0;
 LP2_gauge.OnClickPtr = 0;
 LP2_gauge.OnPressPtr = 0;

 HP2_arrow.OwnerScreen = &Gauge2;
 HP2_arrow.Order = 5;
 HP2_arrow.First_Point_X = 131;
 HP2_arrow.First_Point_Y = 129;
 HP2_arrow.Second_Point_X = 69;
 HP2_arrow.Second_Point_Y = 178;
 HP2_arrow.Visible = 0;
 HP2_arrow.Pen_Width = 2;
 HP2_arrow.Color = 0x213B;

 LP2_arrow.OwnerScreen = &Gauge2;
 LP2_arrow.Order = 6;
 LP2_arrow.First_Point_X = 344;
 LP2_arrow.First_Point_Y = 129;
 LP2_arrow.Second_Point_X = 283;
 LP2_arrow.Second_Point_Y = 178;
 LP2_arrow.Visible = 0;
 LP2_arrow.Pen_Width = 2;
 LP2_arrow.Color = 0x213B;

 Home_b22.OwnerScreen = &Gauge2;
 Home_b22.Order = 7;
 Home_b22.Left = 237;
 Home_b22.Top = 232;
 Home_b22.Width = 78;
 Home_b22.Height = 35;
 Home_b22.Pen_Width = 1;
 Home_b22.Pen_Color = 0xC618;
 Home_b22.Visible = 1;
 Home_b22.Active = 1;
 Home_b22.Transparent = 1;
 Home_b22.Caption = Home_b22_Caption;
 Home_b22.TextAlign = _taCenter;
 Home_b22.TextAlignVertical= _tavMiddle;
 Home_b22.FontName =  0x00005242 ;
 Home_b22.PressColEnabled = 1;
 Home_b22.Font_Color = 0xD6BA;
 Home_b22.VerticalText = 0;
 Home_b22.Gradient = 1;
 Home_b22.Gradient_Orientation = 0;
 Home_b22.Gradient_Start_Color = 0x0418;
 Home_b22.Gradient_End_Color = 0x00A5;
 Home_b22.Color = 0xC618;
 Home_b22.Press_Color = 0xE71C;
 Home_b22.Corner_Radius = 5;
 Home_b22.OnUpPtr = 0;
 Home_b22.OnDownPtr = 0;
 Home_b22.OnClickPtr = BackToHome;
 Home_b22.OnPressPtr = 0;

 Back_b18.OwnerScreen = &Gauge2;
 Back_b18.Order = 8;
 Back_b18.Left = 153;
 Back_b18.Top = 232;
 Back_b18.Width = 78;
 Back_b18.Height = 35;
 Back_b18.Pen_Width = 1;
 Back_b18.Pen_Color = 0xC618;
 Back_b18.Visible = 1;
 Back_b18.Active = 1;
 Back_b18.Transparent = 1;
 Back_b18.Caption = Back_b18_Caption;
 Back_b18.TextAlign = _taCenter;
 Back_b18.TextAlignVertical= _tavMiddle;
 Back_b18.FontName =  0x00005242 ;
 Back_b18.PressColEnabled = 1;
 Back_b18.Font_Color = 0xD6BA;
 Back_b18.VerticalText = 0;
 Back_b18.Gradient = 1;
 Back_b18.Gradient_Orientation = 0;
 Back_b18.Gradient_Start_Color = 0x0418;
 Back_b18.Gradient_End_Color = 0x00A5;
 Back_b18.Color = 0xC618;
 Back_b18.Press_Color = 0xE71C;
 Back_b18.Corner_Radius = 5;
 Back_b18.OnUpPtr = 0;
 Back_b18.OnDownPtr = 0;
 Back_b18.OnClickPtr = goToBack;
 Back_b18.OnPressPtr = 0;

 CircleButton15.OwnerScreen = &Gauge2;
 CircleButton15.Order = 9;
 CircleButton15.Left = 450;
 CircleButton15.Top = 3;
 CircleButton15.Radius = 12;
 CircleButton15.Pen_Width = 1;
 CircleButton15.Pen_Color = 0x0000;
 CircleButton15.Visible = 1;
 CircleButton15.Active = 0;
 CircleButton15.Transparent = 1;
 CircleButton15.Caption = CircleButton15_Caption;
 CircleButton15.TextAlign = _taCenter;
 CircleButton15.TextAlignVertical= _tavMiddle;
 CircleButton15.FontName =  0x00005242 ;
 CircleButton15.PressColEnabled = 1;
 CircleButton15.Font_Color = 0x0000;
 CircleButton15.VerticalText = 0;
 CircleButton15.Gradient = 1;
 CircleButton15.Gradient_Orientation = 0;
 CircleButton15.Gradient_Start_Color = 0xFFFF;
 CircleButton15.Gradient_End_Color = 0xC618;
 CircleButton15.Color = 0xC618;
 CircleButton15.Press_Color = 0xE71C;
 CircleButton15.OnUpPtr = 0;
 CircleButton15.OnDownPtr = 0;
 CircleButton15.OnClickPtr = 0;
 CircleButton15.OnPressPtr = 0;

 Image142.OwnerScreen = &Sensor2;
 Image142.Order = 0;
 Image142.Left = 1;
 Image142.Top = 0;
 Image142.Width = 480;
 Image142.Height = 272;
 Image142.Picture_Type = 1;
 Image142.Picture_Ratio = 1;
 Image142.Picture_Name =  0x0003CAAE ;
 Image142.Visible = 1;
 Image142.Active = 0;
 Image142.OnUpPtr = 0;
 Image142.OnDownPtr = 0;
 Image142.OnClickPtr = 0;
 Image142.OnPressPtr = 0;

 Module2_br_outlet.OwnerScreen = &Sensor2;
 Module2_br_outlet.Order = 1;
 Module2_br_outlet.Left = 36;
 Module2_br_outlet.Top = 66;
 Module2_br_outlet.Width = 91;
 Module2_br_outlet.Height = 20;
 Module2_br_outlet.Visible = 1;
 Module2_br_outlet.Active = 0;
 Module2_br_outlet.Caption = Module2_br_outlet_Caption;
 Module2_br_outlet.FontName =  0x00005242 ;
 Module2_br_outlet.Font_Color = 0xFFFF;
 Module2_br_outlet.VerticalText = 0;
 Module2_br_outlet.OnUpPtr = 0;
 Module2_br_outlet.OnDownPtr = 0;
 Module2_br_outlet.OnClickPtr = 0;
 Module2_br_outlet.OnPressPtr = 0;

 Label81.OwnerScreen = &Sensor2;
 Label81.Order = 2;
 Label81.Left = 36;
 Label81.Top = 40;
 Label81.Width = 81;
 Label81.Height = 20;
 Label81.Visible = 1;
 Label81.Active = 0;
 Label81.Caption = Label81_Caption;
 Label81.FontName =  0x00005242 ;
 Label81.Font_Color = 0xFFFF;
 Label81.VerticalText = 0;
 Label81.OnUpPtr = 0;
 Label81.OnDownPtr = 0;
 Label81.OnClickPtr = 0;
 Label81.OnPressPtr = 0;

 Module2_heat_inlet.OwnerScreen = &Sensor2;
 Module2_heat_inlet.Order = 3;
 Module2_heat_inlet.Left = 36;
 Module2_heat_inlet.Top = 93;
 Module2_heat_inlet.Width = 100;
 Module2_heat_inlet.Height = 20;
 Module2_heat_inlet.Visible = 1;
 Module2_heat_inlet.Active = 0;
 Module2_heat_inlet.Caption = Module2_heat_inlet_Caption;
 Module2_heat_inlet.FontName =  0x00005242 ;
 Module2_heat_inlet.Font_Color = 0xFFFF;
 Module2_heat_inlet.VerticalText = 0;
 Module2_heat_inlet.OnUpPtr = 0;
 Module2_heat_inlet.OnDownPtr = 0;
 Module2_heat_inlet.OnClickPtr = 0;
 Module2_heat_inlet.OnPressPtr = 0;

 Module2_heat_outlet.OwnerScreen = &Sensor2;
 Module2_heat_outlet.Order = 4;
 Module2_heat_outlet.Left = 36;
 Module2_heat_outlet.Top = 119;
 Module2_heat_outlet.Width = 110;
 Module2_heat_outlet.Height = 20;
 Module2_heat_outlet.Visible = 1;
 Module2_heat_outlet.Active = 0;
 Module2_heat_outlet.Caption = Module2_heat_outlet_Caption;
 Module2_heat_outlet.FontName =  0x00005242 ;
 Module2_heat_outlet.Font_Color = 0xFFFF;
 Module2_heat_outlet.VerticalText = 0;
 Module2_heat_outlet.OnUpPtr = 0;
 Module2_heat_outlet.OnDownPtr = 0;
 Module2_heat_outlet.OnClickPtr = 0;
 Module2_heat_outlet.OnPressPtr = 0;

 Module2_compressor.OwnerScreen = &Sensor2;
 Module2_compressor.Order = 5;
 Module2_compressor.Left = 37;
 Module2_compressor.Top = 146;
 Module2_compressor.Width = 93;
 Module2_compressor.Height = 20;
 Module2_compressor.Visible = 1;
 Module2_compressor.Active = 0;
 Module2_compressor.Caption = Module2_compressor_Caption;
 Module2_compressor.FontName =  0x00005242 ;
 Module2_compressor.Font_Color = 0xFFFF;
 Module2_compressor.VerticalText = 0;
 Module2_compressor.OnUpPtr = 0;
 Module2_compressor.OnDownPtr = 0;
 Module2_compressor.OnClickPtr = 0;
 Module2_compressor.OnPressPtr = 0;

 Module2_SH.OwnerScreen = &Sensor2;
 Module2_SH.Order = 6;
 Module2_SH.Left = 37;
 Module2_SH.Top = 170;
 Module2_SH.Width = 102;
 Module2_SH.Height = 20;
 Module2_SH.Visible = 1;
 Module2_SH.Active = 0;
 Module2_SH.Caption = Module2_SH_Caption;
 Module2_SH.FontName =  0x00005242 ;
 Module2_SH.Font_Color = 0xFFFF;
 Module2_SH.VerticalText = 0;
 Module2_SH.OnUpPtr = 0;
 Module2_SH.OnDownPtr = 0;
 Module2_SH.OnClickPtr = 0;
 Module2_SH.OnPressPtr = 0;

 Module2_SC.OwnerScreen = &Sensor2;
 Module2_SC.Order = 7;
 Module2_SC.Left = 248;
 Module2_SC.Top = 145;
 Module2_SC.Width = 85;
 Module2_SC.Height = 20;
 Module2_SC.Visible = 1;
 Module2_SC.Active = 0;
 Module2_SC.Caption = Module2_SC_Caption;
 Module2_SC.FontName =  0x00005242 ;
 Module2_SC.Font_Color = 0xFFFF;
 Module2_SC.VerticalText = 0;
 Module2_SC.OnUpPtr = 0;
 Module2_SC.OnDownPtr = 0;
 Module2_SC.OnClickPtr = 0;
 Module2_SC.OnPressPtr = 0;

 S_Brine_Inlet_2.OwnerScreen = &Sensor2;
 S_Brine_Inlet_2.Order = 8;
 S_Brine_Inlet_2.Left = 144;
 S_Brine_Inlet_2.Top = 38;
 S_Brine_Inlet_2.Width = 45;
 S_Brine_Inlet_2.Height = 23;
 S_Brine_Inlet_2.Pen_Width = 1;
 S_Brine_Inlet_2.Pen_Color = 0xC618;
 S_Brine_Inlet_2.Visible = 1;
 S_Brine_Inlet_2.Active = 0;
 S_Brine_Inlet_2.Transparent = 1;
 S_Brine_Inlet_2.Caption = S_Brine_Inlet_2_Caption;
 S_Brine_Inlet_2.TextAlign = _taRight;
 S_Brine_Inlet_2.TextAlignVertical= _tavMiddle;
 S_Brine_Inlet_2.FontName =  0x00005242 ;
 S_Brine_Inlet_2.PressColEnabled = 0;
 S_Brine_Inlet_2.Font_Color = 0x0000;
 S_Brine_Inlet_2.VerticalText = 0;
 S_Brine_Inlet_2.Gradient = 0;
 S_Brine_Inlet_2.Gradient_Orientation = 0;
 S_Brine_Inlet_2.Gradient_Start_Color = 0xFFFF;
 S_Brine_Inlet_2.Gradient_End_Color = 0xC618;
 S_Brine_Inlet_2.Color = 0xFFFF;
 S_Brine_Inlet_2.Press_Color = 0xE71C;
 S_Brine_Inlet_2.Corner_Radius = 3;
 S_Brine_Inlet_2.OnUpPtr = 0;
 S_Brine_Inlet_2.OnDownPtr = 0;
 S_Brine_Inlet_2.OnClickPtr = 0;
 S_Brine_Inlet_2.OnPressPtr = 0;

 S_Brine_Outlet_2.OwnerScreen = &Sensor2;
 S_Brine_Outlet_2.Order = 9;
 S_Brine_Outlet_2.Left = 144;
 S_Brine_Outlet_2.Top = 64;
 S_Brine_Outlet_2.Width = 45;
 S_Brine_Outlet_2.Height = 23;
 S_Brine_Outlet_2.Pen_Width = 1;
 S_Brine_Outlet_2.Pen_Color = 0xC618;
 S_Brine_Outlet_2.Visible = 1;
 S_Brine_Outlet_2.Active = 0;
 S_Brine_Outlet_2.Transparent = 1;
 S_Brine_Outlet_2.Caption = S_Brine_Outlet_2_Caption;
 S_Brine_Outlet_2.TextAlign = _taRight;
 S_Brine_Outlet_2.TextAlignVertical= _tavMiddle;
 S_Brine_Outlet_2.FontName =  0x00005242 ;
 S_Brine_Outlet_2.PressColEnabled = 0;
 S_Brine_Outlet_2.Font_Color = 0x0000;
 S_Brine_Outlet_2.VerticalText = 0;
 S_Brine_Outlet_2.Gradient = 0;
 S_Brine_Outlet_2.Gradient_Orientation = 0;
 S_Brine_Outlet_2.Gradient_Start_Color = 0xFFFF;
 S_Brine_Outlet_2.Gradient_End_Color = 0xC618;
 S_Brine_Outlet_2.Color = 0xFFFF;
 S_Brine_Outlet_2.Press_Color = 0xE71C;
 S_Brine_Outlet_2.Corner_Radius = 3;
 S_Brine_Outlet_2.OnUpPtr = 0;
 S_Brine_Outlet_2.OnDownPtr = 0;
 S_Brine_Outlet_2.OnClickPtr = 0;
 S_Brine_Outlet_2.OnPressPtr = 0;

 S_Heat_Inlet_2.OwnerScreen = &Sensor2;
 S_Heat_Inlet_2.Order = 10;
 S_Heat_Inlet_2.Left = 144;
 S_Heat_Inlet_2.Top = 90;
 S_Heat_Inlet_2.Width = 45;
 S_Heat_Inlet_2.Height = 23;
 S_Heat_Inlet_2.Pen_Width = 1;
 S_Heat_Inlet_2.Pen_Color = 0xC618;
 S_Heat_Inlet_2.Visible = 1;
 S_Heat_Inlet_2.Active = 0;
 S_Heat_Inlet_2.Transparent = 1;
 S_Heat_Inlet_2.Caption = S_Heat_Inlet_2_Caption;
 S_Heat_Inlet_2.TextAlign = _taRight;
 S_Heat_Inlet_2.TextAlignVertical= _tavMiddle;
 S_Heat_Inlet_2.FontName =  0x00005242 ;
 S_Heat_Inlet_2.PressColEnabled = 0;
 S_Heat_Inlet_2.Font_Color = 0x0000;
 S_Heat_Inlet_2.VerticalText = 0;
 S_Heat_Inlet_2.Gradient = 0;
 S_Heat_Inlet_2.Gradient_Orientation = 0;
 S_Heat_Inlet_2.Gradient_Start_Color = 0xFFFF;
 S_Heat_Inlet_2.Gradient_End_Color = 0xC618;
 S_Heat_Inlet_2.Color = 0xFFFF;
 S_Heat_Inlet_2.Press_Color = 0xE71C;
 S_Heat_Inlet_2.Corner_Radius = 3;
 S_Heat_Inlet_2.OnUpPtr = 0;
 S_Heat_Inlet_2.OnDownPtr = 0;
 S_Heat_Inlet_2.OnClickPtr = 0;
 S_Heat_Inlet_2.OnPressPtr = 0;

 S_Heat_Outlet_2.OwnerScreen = &Sensor2;
 S_Heat_Outlet_2.Order = 11;
 S_Heat_Outlet_2.Left = 144;
 S_Heat_Outlet_2.Top = 116;
 S_Heat_Outlet_2.Width = 45;
 S_Heat_Outlet_2.Height = 23;
 S_Heat_Outlet_2.Pen_Width = 1;
 S_Heat_Outlet_2.Pen_Color = 0xC618;
 S_Heat_Outlet_2.Visible = 1;
 S_Heat_Outlet_2.Active = 0;
 S_Heat_Outlet_2.Transparent = 1;
 S_Heat_Outlet_2.Caption = S_Heat_Outlet_2_Caption;
 S_Heat_Outlet_2.TextAlign = _taRight;
 S_Heat_Outlet_2.TextAlignVertical= _tavMiddle;
 S_Heat_Outlet_2.FontName =  0x00005242 ;
 S_Heat_Outlet_2.PressColEnabled = 0;
 S_Heat_Outlet_2.Font_Color = 0x0000;
 S_Heat_Outlet_2.VerticalText = 0;
 S_Heat_Outlet_2.Gradient = 0;
 S_Heat_Outlet_2.Gradient_Orientation = 0;
 S_Heat_Outlet_2.Gradient_Start_Color = 0xFFFF;
 S_Heat_Outlet_2.Gradient_End_Color = 0xC618;
 S_Heat_Outlet_2.Color = 0xFFFF;
 S_Heat_Outlet_2.Press_Color = 0xE71C;
 S_Heat_Outlet_2.Corner_Radius = 3;
 S_Heat_Outlet_2.OnUpPtr = 0;
 S_Heat_Outlet_2.OnDownPtr = 0;
 S_Heat_Outlet_2.OnClickPtr = 0;
 S_Heat_Outlet_2.OnPressPtr = 0;

 S_Compressor_2.OwnerScreen = &Sensor2;
 S_Compressor_2.Order = 12;
 S_Compressor_2.Left = 144;
 S_Compressor_2.Top = 142;
 S_Compressor_2.Width = 45;
 S_Compressor_2.Height = 23;
 S_Compressor_2.Pen_Width = 1;
 S_Compressor_2.Pen_Color = 0xC618;
 S_Compressor_2.Visible = 1;
 S_Compressor_2.Active = 0;
 S_Compressor_2.Transparent = 1;
 S_Compressor_2.Caption = S_Compressor_2_Caption;
 S_Compressor_2.TextAlign = _taRight;
 S_Compressor_2.TextAlignVertical= _tavMiddle;
 S_Compressor_2.FontName =  0x00005242 ;
 S_Compressor_2.PressColEnabled = 0;
 S_Compressor_2.Font_Color = 0x0000;
 S_Compressor_2.VerticalText = 0;
 S_Compressor_2.Gradient = 0;
 S_Compressor_2.Gradient_Orientation = 0;
 S_Compressor_2.Gradient_Start_Color = 0xFFFF;
 S_Compressor_2.Gradient_End_Color = 0xC618;
 S_Compressor_2.Color = 0xFFFF;
 S_Compressor_2.Press_Color = 0xE71C;
 S_Compressor_2.Corner_Radius = 3;
 S_Compressor_2.OnUpPtr = 0;
 S_Compressor_2.OnDownPtr = 0;
 S_Compressor_2.OnClickPtr = 0;
 S_Compressor_2.OnPressPtr = 0;

 S_Superheat_2.OwnerScreen = &Sensor2;
 S_Superheat_2.Order = 13;
 S_Superheat_2.Left = 144;
 S_Superheat_2.Top = 168;
 S_Superheat_2.Width = 45;
 S_Superheat_2.Height = 23;
 S_Superheat_2.Pen_Width = 1;
 S_Superheat_2.Pen_Color = 0xC618;
 S_Superheat_2.Visible = 1;
 S_Superheat_2.Active = 0;
 S_Superheat_2.Transparent = 1;
 S_Superheat_2.Caption = S_Superheat_2_Caption;
 S_Superheat_2.TextAlign = _taRight;
 S_Superheat_2.TextAlignVertical= _tavMiddle;
 S_Superheat_2.FontName =  0x00005242 ;
 S_Superheat_2.PressColEnabled = 0;
 S_Superheat_2.Font_Color = 0x0000;
 S_Superheat_2.VerticalText = 0;
 S_Superheat_2.Gradient = 0;
 S_Superheat_2.Gradient_Orientation = 0;
 S_Superheat_2.Gradient_Start_Color = 0xFFFF;
 S_Superheat_2.Gradient_End_Color = 0xC618;
 S_Superheat_2.Color = 0xFFFF;
 S_Superheat_2.Press_Color = 0xE71C;
 S_Superheat_2.Corner_Radius = 3;
 S_Superheat_2.OnUpPtr = 0;
 S_Superheat_2.OnDownPtr = 0;
 S_Superheat_2.OnClickPtr = 0;
 S_Superheat_2.OnPressPtr = 0;

 S_Subcool_2.OwnerScreen = &Sensor2;
 S_Subcool_2.Order = 14;
 S_Subcool_2.Left = 391;
 S_Subcool_2.Top = 142;
 S_Subcool_2.Width = 45;
 S_Subcool_2.Height = 23;
 S_Subcool_2.Pen_Width = 1;
 S_Subcool_2.Pen_Color = 0xC618;
 S_Subcool_2.Visible = 1;
 S_Subcool_2.Active = 0;
 S_Subcool_2.Transparent = 1;
 S_Subcool_2.Caption = S_Subcool_2_Caption;
 S_Subcool_2.TextAlign = _taRight;
 S_Subcool_2.TextAlignVertical= _tavMiddle;
 S_Subcool_2.FontName =  0x00005242 ;
 S_Subcool_2.PressColEnabled = 0;
 S_Subcool_2.Font_Color = 0x0000;
 S_Subcool_2.VerticalText = 0;
 S_Subcool_2.Gradient = 0;
 S_Subcool_2.Gradient_Orientation = 0;
 S_Subcool_2.Gradient_Start_Color = 0xFFFF;
 S_Subcool_2.Gradient_End_Color = 0xC618;
 S_Subcool_2.Color = 0xFFFF;
 S_Subcool_2.Press_Color = 0xE71C;
 S_Subcool_2.Corner_Radius = 3;
 S_Subcool_2.OnUpPtr = 0;
 S_Subcool_2.OnDownPtr = 0;
 S_Subcool_2.OnClickPtr = 0;
 S_Subcool_2.OnPressPtr = 0;

 Label100.OwnerScreen = &Sensor2;
 Label100.Order = 15;
 Label100.Left = 198;
 Label100.Top = 40;
 Label100.Width = 12;
 Label100.Height = 20;
 Label100.Visible = 1;
 Label100.Active = 0;
 Label100.Caption = Label100_Caption;
 Label100.FontName =  0x00005242 ;
 Label100.Font_Color = 0xFFFF;
 Label100.VerticalText = 0;
 Label100.OnUpPtr = 0;
 Label100.OnDownPtr = 0;
 Label100.OnClickPtr = 0;
 Label100.OnPressPtr = 0;

 Label101.OwnerScreen = &Sensor2;
 Label101.Order = 16;
 Label101.Left = 191;
 Label101.Top = 40;
 Label101.Width = 7;
 Label101.Height = 20;
 Label101.Visible = 1;
 Label101.Active = 0;
 Label101.Caption = Label101_Caption;
 Label101.FontName =  0x00005242 ;
 Label101.Font_Color = 0xFFFF;
 Label101.VerticalText = 0;
 Label101.OnUpPtr = 0;
 Label101.OnDownPtr = 0;
 Label101.OnClickPtr = 0;
 Label101.OnPressPtr = 0;

 Label102.OwnerScreen = &Sensor2;
 Label102.Order = 17;
 Label102.Left = 200;
 Label102.Top = 66;
 Label102.Width = 12;
 Label102.Height = 20;
 Label102.Visible = 1;
 Label102.Active = 0;
 Label102.Caption = Label102_Caption;
 Label102.FontName =  0x00005242 ;
 Label102.Font_Color = 0xFFFF;
 Label102.VerticalText = 0;
 Label102.OnUpPtr = 0;
 Label102.OnDownPtr = 0;
 Label102.OnClickPtr = 0;
 Label102.OnPressPtr = 0;

 Label103.OwnerScreen = &Sensor2;
 Label103.Order = 18;
 Label103.Left = 193;
 Label103.Top = 93;
 Label103.Width = 7;
 Label103.Height = 20;
 Label103.Visible = 1;
 Label103.Active = 0;
 Label103.Caption = Label103_Caption;
 Label103.FontName =  0x00005242 ;
 Label103.Font_Color = 0xFFFF;
 Label103.VerticalText = 0;
 Label103.OnUpPtr = 0;
 Label103.OnDownPtr = 0;
 Label103.OnClickPtr = 0;
 Label103.OnPressPtr = 0;

 Label105.OwnerScreen = &Sensor2;
 Label105.Order = 19;
 Label105.Left = 200;
 Label105.Top = 93;
 Label105.Width = 12;
 Label105.Height = 20;
 Label105.Visible = 1;
 Label105.Active = 0;
 Label105.Caption = Label105_Caption;
 Label105.FontName =  0x00005242 ;
 Label105.Font_Color = 0xFFFF;
 Label105.VerticalText = 0;
 Label105.OnUpPtr = 0;
 Label105.OnDownPtr = 0;
 Label105.OnClickPtr = 0;
 Label105.OnPressPtr = 0;

 Label106.OwnerScreen = &Sensor2;
 Label106.Order = 20;
 Label106.Left = 193;
 Label106.Top = 66;
 Label106.Width = 7;
 Label106.Height = 20;
 Label106.Visible = 1;
 Label106.Active = 0;
 Label106.Caption = Label106_Caption;
 Label106.FontName =  0x00005242 ;
 Label106.Font_Color = 0xFFFF;
 Label106.VerticalText = 0;
 Label106.OnUpPtr = 0;
 Label106.OnDownPtr = 0;
 Label106.OnClickPtr = 0;
 Label106.OnPressPtr = 0;

 Label107.OwnerScreen = &Sensor2;
 Label107.Order = 21;
 Label107.Left = 192;
 Label107.Top = 119;
 Label107.Width = 7;
 Label107.Height = 20;
 Label107.Visible = 1;
 Label107.Active = 0;
 Label107.Caption = Label107_Caption;
 Label107.FontName =  0x00005242 ;
 Label107.Font_Color = 0xFFFF;
 Label107.VerticalText = 0;
 Label107.OnUpPtr = 0;
 Label107.OnDownPtr = 0;
 Label107.OnClickPtr = 0;
 Label107.OnPressPtr = 0;

 Label108.OwnerScreen = &Sensor2;
 Label108.Order = 22;
 Label108.Left = 199;
 Label108.Top = 119;
 Label108.Width = 12;
 Label108.Height = 20;
 Label108.Visible = 1;
 Label108.Active = 0;
 Label108.Caption = Label108_Caption;
 Label108.FontName =  0x00005242 ;
 Label108.Font_Color = 0xFFFF;
 Label108.VerticalText = 0;
 Label108.OnUpPtr = 0;
 Label108.OnDownPtr = 0;
 Label108.OnClickPtr = 0;
 Label108.OnPressPtr = 0;

 Label109.OwnerScreen = &Sensor2;
 Label109.Order = 23;
 Label109.Left = 192;
 Label109.Top = 145;
 Label109.Width = 7;
 Label109.Height = 20;
 Label109.Visible = 1;
 Label109.Active = 0;
 Label109.Caption = Label109_Caption;
 Label109.FontName =  0x00005242 ;
 Label109.Font_Color = 0xFFFF;
 Label109.VerticalText = 0;
 Label109.OnUpPtr = 0;
 Label109.OnDownPtr = 0;
 Label109.OnClickPtr = 0;
 Label109.OnPressPtr = 0;

 Label110.OwnerScreen = &Sensor2;
 Label110.Order = 24;
 Label110.Left = 199;
 Label110.Top = 145;
 Label110.Width = 12;
 Label110.Height = 20;
 Label110.Visible = 1;
 Label110.Active = 0;
 Label110.Caption = Label110_Caption;
 Label110.FontName =  0x00005242 ;
 Label110.Font_Color = 0xFFFF;
 Label110.VerticalText = 0;
 Label110.OnUpPtr = 0;
 Label110.OnDownPtr = 0;
 Label110.OnClickPtr = 0;
 Label110.OnPressPtr = 0;

 Label111.OwnerScreen = &Sensor2;
 Label111.Order = 25;
 Label111.Left = 438;
 Label111.Top = 93;
 Label111.Width = 7;
 Label111.Height = 20;
 Label111.Visible = 1;
 Label111.Active = 0;
 Label111.Caption = Label111_Caption;
 Label111.FontName =  0x00005242 ;
 Label111.Font_Color = 0xFFFF;
 Label111.VerticalText = 0;
 Label111.OnUpPtr = 0;
 Label111.OnDownPtr = 0;
 Label111.OnClickPtr = 0;
 Label111.OnPressPtr = 0;

 Label112.OwnerScreen = &Sensor2;
 Label112.Order = 26;
 Label112.Left = 445;
 Label112.Top = 93;
 Label112.Width = 12;
 Label112.Height = 20;
 Label112.Visible = 1;
 Label112.Active = 0;
 Label112.Caption = Label112_Caption;
 Label112.FontName =  0x00005242 ;
 Label112.Font_Color = 0xFFFF;
 Label112.VerticalText = 0;
 Label112.OnUpPtr = 0;
 Label112.OnDownPtr = 0;
 Label112.OnClickPtr = 0;
 Label112.OnPressPtr = 0;

 Label113.OwnerScreen = &Sensor2;
 Label113.Order = 27;
 Label113.Left = 199;
 Label113.Top = 170;
 Label113.Width = 12;
 Label113.Height = 20;
 Label113.Visible = 1;
 Label113.Active = 0;
 Label113.Caption = Label113_Caption;
 Label113.FontName =  0x00005242 ;
 Label113.Font_Color = 0xFFFF;
 Label113.VerticalText = 0;
 Label113.OnUpPtr = 0;
 Label113.OnDownPtr = 0;
 Label113.OnClickPtr = 0;
 Label113.OnPressPtr = 0;

 Label114.OwnerScreen = &Sensor2;
 Label114.Order = 28;
 Label114.Left = 440;
 Label114.Top = 145;
 Label114.Width = 7;
 Label114.Height = 20;
 Label114.Visible = 1;
 Label114.Active = 0;
 Label114.Caption = Label114_Caption;
 Label114.FontName =  0x00005242 ;
 Label114.Font_Color = 0xFFFF;
 Label114.VerticalText = 0;
 Label114.OnUpPtr = 0;
 Label114.OnDownPtr = 0;
 Label114.OnClickPtr = 0;
 Label114.OnPressPtr = 0;

 Label115.OwnerScreen = &Sensor2;
 Label115.Order = 29;
 Label115.Left = 447;
 Label115.Top = 145;
 Label115.Width = 12;
 Label115.Height = 20;
 Label115.Visible = 1;
 Label115.Active = 0;
 Label115.Caption = Label115_Caption;
 Label115.FontName =  0x00005242 ;
 Label115.Font_Color = 0xFFFF;
 Label115.VerticalText = 0;
 Label115.OnUpPtr = 0;
 Label115.OnDownPtr = 0;
 Label115.OnClickPtr = 0;
 Label115.OnPressPtr = 0;

 Label116.OwnerScreen = &Sensor2;
 Label116.Order = 30;
 Label116.Left = 192;
 Label116.Top = 170;
 Label116.Width = 7;
 Label116.Height = 20;
 Label116.Visible = 1;
 Label116.Active = 0;
 Label116.Caption = Label116_Caption;
 Label116.FontName =  0x00005242 ;
 Label116.Font_Color = 0xFFFF;
 Label116.VerticalText = 0;
 Label116.OnUpPtr = 0;
 Label116.OnDownPtr = 0;
 Label116.OnClickPtr = 0;
 Label116.OnPressPtr = 0;

 Module2_br_flow.OwnerScreen = &Sensor2;
 Module2_br_flow.Order = 31;
 Module2_br_flow.Left = 246;
 Module2_br_flow.Top = 42;
 Module2_br_flow.Width = 89;
 Module2_br_flow.Height = 20;
 Module2_br_flow.Visible = 1;
 Module2_br_flow.Active = 0;
 Module2_br_flow.Caption = Module2_br_flow_Caption;
 Module2_br_flow.FontName =  0x00005242 ;
 Module2_br_flow.Font_Color = 0xFFFF;
 Module2_br_flow.VerticalText = 0;
 Module2_br_flow.OnUpPtr = 0;
 Module2_br_flow.OnDownPtr = 0;
 Module2_br_flow.OnClickPtr = 0;
 Module2_br_flow.OnPressPtr = 0;

 S_Source_Flow_2.OwnerScreen = &Sensor2;
 S_Source_Flow_2.Order = 32;
 S_Source_Flow_2.Left = 391;
 S_Source_Flow_2.Top = 38;
 S_Source_Flow_2.Width = 51;
 S_Source_Flow_2.Height = 23;
 S_Source_Flow_2.Pen_Width = 1;
 S_Source_Flow_2.Pen_Color = 0xC618;
 S_Source_Flow_2.Visible = 1;
 S_Source_Flow_2.Active = 0;
 S_Source_Flow_2.Transparent = 1;
 S_Source_Flow_2.Caption = S_Source_Flow_2_Caption;
 S_Source_Flow_2.TextAlign = _taRight;
 S_Source_Flow_2.TextAlignVertical= _tavMiddle;
 S_Source_Flow_2.FontName =  0x00005242 ;
 S_Source_Flow_2.PressColEnabled = 0;
 S_Source_Flow_2.Font_Color = 0x0000;
 S_Source_Flow_2.VerticalText = 0;
 S_Source_Flow_2.Gradient = 0;
 S_Source_Flow_2.Gradient_Orientation = 0;
 S_Source_Flow_2.Gradient_Start_Color = 0xFFFF;
 S_Source_Flow_2.Gradient_End_Color = 0xC618;
 S_Source_Flow_2.Color = 0xFFFF;
 S_Source_Flow_2.Press_Color = 0xE71C;
 S_Source_Flow_2.Corner_Radius = 3;
 S_Source_Flow_2.OnUpPtr = 0;
 S_Source_Flow_2.OnDownPtr = 0;
 S_Source_Flow_2.OnClickPtr = 0;
 S_Source_Flow_2.OnPressPtr = 0;

 Module2_heat_flow.OwnerScreen = &Sensor2;
 Module2_heat_flow.Order = 33;
 Module2_heat_flow.Left = 246;
 Module2_heat_flow.Top = 67;
 Module2_heat_flow.Width = 71;
 Module2_heat_flow.Height = 20;
 Module2_heat_flow.Visible = 1;
 Module2_heat_flow.Active = 0;
 Module2_heat_flow.Caption = Module2_heat_flow_Caption;
 Module2_heat_flow.FontName =  0x00005242 ;
 Module2_heat_flow.Font_Color = 0xFFFF;
 Module2_heat_flow.VerticalText = 0;
 Module2_heat_flow.OnUpPtr = 0;
 Module2_heat_flow.OnDownPtr = 0;
 Module2_heat_flow.OnClickPtr = 0;
 Module2_heat_flow.OnPressPtr = 0;

 S_Heat_Flow_2.OwnerScreen = &Sensor2;
 S_Heat_Flow_2.Order = 34;
 S_Heat_Flow_2.Left = 391;
 S_Heat_Flow_2.Top = 64;
 S_Heat_Flow_2.Width = 51;
 S_Heat_Flow_2.Height = 23;
 S_Heat_Flow_2.Pen_Width = 1;
 S_Heat_Flow_2.Pen_Color = 0xC618;
 S_Heat_Flow_2.Visible = 1;
 S_Heat_Flow_2.Active = 0;
 S_Heat_Flow_2.Transparent = 1;
 S_Heat_Flow_2.Caption = S_Heat_Flow_2_Caption;
 S_Heat_Flow_2.TextAlign = _taRight;
 S_Heat_Flow_2.TextAlignVertical= _tavMiddle;
 S_Heat_Flow_2.FontName =  0x00005242 ;
 S_Heat_Flow_2.PressColEnabled = 0;
 S_Heat_Flow_2.Font_Color = 0x0000;
 S_Heat_Flow_2.VerticalText = 0;
 S_Heat_Flow_2.Gradient = 0;
 S_Heat_Flow_2.Gradient_Orientation = 0;
 S_Heat_Flow_2.Gradient_Start_Color = 0xFFFF;
 S_Heat_Flow_2.Gradient_End_Color = 0xC618;
 S_Heat_Flow_2.Color = 0xFFFF;
 S_Heat_Flow_2.Press_Color = 0xE71C;
 S_Heat_Flow_2.Corner_Radius = 3;
 S_Heat_Flow_2.OnUpPtr = 0;
 S_Heat_Flow_2.OnDownPtr = 0;
 S_Heat_Flow_2.OnClickPtr = 0;
 S_Heat_Flow_2.OnPressPtr = 0;

 Label119.OwnerScreen = &Sensor2;
 Label119.Order = 35;
 Label119.Left = 444;
 Label119.Top = 67;
 Label119.Width = 18;
 Label119.Height = 20;
 Label119.Visible = 1;
 Label119.Active = 0;
 Label119.Caption = Label119_Caption;
 Label119.FontName =  0x00005242 ;
 Label119.Font_Color = 0xFFFF;
 Label119.VerticalText = 0;
 Label119.OnUpPtr = 0;
 Label119.OnDownPtr = 0;
 Label119.OnClickPtr = 0;
 Label119.OnPressPtr = 0;

 Label120.OwnerScreen = &Sensor2;
 Label120.Order = 36;
 Label120.Left = 444;
 Label120.Top = 43;
 Label120.Width = 18;
 Label120.Height = 20;
 Label120.Visible = 1;
 Label120.Active = 0;
 Label120.Caption = Label120_Caption;
 Label120.FontName =  0x00005242 ;
 Label120.Font_Color = 0xFFFF;
 Label120.VerticalText = 0;
 Label120.OnUpPtr = 0;
 Label120.OnDownPtr = 0;
 Label120.OnClickPtr = 0;
 Label120.OnPressPtr = 0;

 Label128.OwnerScreen = &Sensor2;
 Label128.Order = 37;
 Label128.Left = 445;
 Label128.Top = 120;
 Label128.Width = 12;
 Label128.Height = 20;
 Label128.Visible = 1;
 Label128.Active = 0;
 Label128.Caption = Label128_Caption;
 Label128.FontName =  0x00005242 ;
 Label128.Font_Color = 0xFFFF;
 Label128.VerticalText = 0;
 Label128.OnUpPtr = 0;
 Label128.OnDownPtr = 0;
 Label128.OnClickPtr = 0;
 Label128.OnPressPtr = 0;

 Label129.OwnerScreen = &Sensor2;
 Label129.Order = 38;
 Label129.Left = 439;
 Label129.Top = 115;
 Label129.Width = 7;
 Label129.Height = 20;
 Label129.Visible = 1;
 Label129.Active = 0;
 Label129.Caption = Label129_Caption;
 Label129.FontName =  0x00005242 ;
 Label129.Font_Color = 0xFFFF;
 Label129.VerticalText = 0;
 Label129.OnUpPtr = 0;
 Label129.OnDownPtr = 0;
 Label129.OnClickPtr = 0;
 Label129.OnPressPtr = 0;

 Label76.OwnerScreen = &Sensor2;
 Label76.Order = 39;
 Label76.Left = 167;
 Label76.Top = 5;
 Label76.Width = 146;
 Label76.Height = 20;
 Label76.Visible = 1;
 Label76.Active = 0;
 Label76.Caption = Label76_Caption;
 Label76.FontName =  0x00005242 ;
 Label76.Font_Color = 0xE7FC;
 Label76.VerticalText = 0;
 Label76.OnUpPtr = 0;
 Label76.OnDownPtr = 0;
 Label76.OnClickPtr = 0;
 Label76.OnPressPtr = 0;

 S_condenser_2.OwnerScreen = &Sensor2;
 S_condenser_2.Order = 40;
 S_condenser_2.Left = 391;
 S_condenser_2.Top = 90;
 S_condenser_2.Width = 45;
 S_condenser_2.Height = 23;
 S_condenser_2.Pen_Width = 1;
 S_condenser_2.Pen_Color = 0xC618;
 S_condenser_2.Visible = 1;
 S_condenser_2.Active = 0;
 S_condenser_2.Transparent = 1;
 S_condenser_2.Caption = S_condenser_2_Caption;
 S_condenser_2.TextAlign = _taRight;
 S_condenser_2.TextAlignVertical= _tavMiddle;
 S_condenser_2.FontName =  0x00005242 ;
 S_condenser_2.PressColEnabled = 0;
 S_condenser_2.Font_Color = 0x0000;
 S_condenser_2.VerticalText = 0;
 S_condenser_2.Gradient = 0;
 S_condenser_2.Gradient_Orientation = 0;
 S_condenser_2.Gradient_Start_Color = 0xFFFF;
 S_condenser_2.Gradient_End_Color = 0xC618;
 S_condenser_2.Color = 0xFFFF;
 S_condenser_2.Press_Color = 0xE71C;
 S_condenser_2.Corner_Radius = 3;
 S_condenser_2.OnUpPtr = 0;
 S_condenser_2.OnDownPtr = 0;
 S_condenser_2.OnClickPtr = 0;
 S_condenser_2.OnPressPtr = 0;

 S_suction_2.OwnerScreen = &Sensor2;
 S_suction_2.Order = 41;
 S_suction_2.Left = 391;
 S_suction_2.Top = 116;
 S_suction_2.Width = 45;
 S_suction_2.Height = 23;
 S_suction_2.Pen_Width = 1;
 S_suction_2.Pen_Color = 0xC618;
 S_suction_2.Visible = 1;
 S_suction_2.Active = 0;
 S_suction_2.Transparent = 1;
 S_suction_2.Caption = S_suction_2_Caption;
 S_suction_2.TextAlign = _taRight;
 S_suction_2.TextAlignVertical= _tavMiddle;
 S_suction_2.FontName =  0x00005242 ;
 S_suction_2.PressColEnabled = 0;
 S_suction_2.Font_Color = 0x0000;
 S_suction_2.VerticalText = 0;
 S_suction_2.Gradient = 0;
 S_suction_2.Gradient_Orientation = 0;
 S_suction_2.Gradient_Start_Color = 0xFFFF;
 S_suction_2.Gradient_End_Color = 0xC618;
 S_suction_2.Color = 0xFFFF;
 S_suction_2.Press_Color = 0xE71C;
 S_suction_2.Corner_Radius = 3;
 S_suction_2.OnUpPtr = 0;
 S_suction_2.OnDownPtr = 0;
 S_suction_2.OnClickPtr = 0;
 S_suction_2.OnPressPtr = 0;

 Module2_cond.OwnerScreen = &Sensor2;
 Module2_cond.Order = 42;
 Module2_cond.Left = 247;
 Module2_cond.Top = 94;
 Module2_cond.Width = 131;
 Module2_cond.Height = 20;
 Module2_cond.Visible = 1;
 Module2_cond.Active = 0;
 Module2_cond.Caption = Module2_cond_Caption;
 Module2_cond.FontName =  0x00005242 ;
 Module2_cond.Font_Color = 0xFFFF;
 Module2_cond.VerticalText = 0;
 Module2_cond.OnUpPtr = 0;
 Module2_cond.OnDownPtr = 0;
 Module2_cond.OnClickPtr = 0;
 Module2_cond.OnPressPtr = 0;

 Module2_suct.OwnerScreen = &Sensor2;
 Module2_suct.Order = 43;
 Module2_suct.Left = 248;
 Module2_suct.Top = 118;
 Module2_suct.Width = 105;
 Module2_suct.Height = 20;
 Module2_suct.Visible = 1;
 Module2_suct.Active = 0;
 Module2_suct.Caption = Module2_suct_Caption;
 Module2_suct.FontName =  0x00005242 ;
 Module2_suct.Font_Color = 0xFFFF;
 Module2_suct.VerticalText = 0;
 Module2_suct.OnUpPtr = 0;
 Module2_suct.OnDownPtr = 0;
 Module2_suct.OnClickPtr = 0;
 Module2_suct.OnPressPtr = 0;

 ButtonRound14.OwnerScreen = &Sensor2;
 ButtonRound14.Order = 44;
 ButtonRound14.Left = 248;
 ButtonRound14.Top = 232;
 ButtonRound14.Width = 78;
 ButtonRound14.Height = 35;
 ButtonRound14.Pen_Width = 1;
 ButtonRound14.Pen_Color = 0xC618;
 ButtonRound14.Visible = 1;
 ButtonRound14.Active = 1;
 ButtonRound14.Transparent = 1;
 ButtonRound14.Caption = ButtonRound14_Caption;
 ButtonRound14.TextAlign = _taCenter;
 ButtonRound14.TextAlignVertical= _tavMiddle;
 ButtonRound14.FontName =  0x00005242 ;
 ButtonRound14.PressColEnabled = 1;
 ButtonRound14.Font_Color = 0xD6BA;
 ButtonRound14.VerticalText = 0;
 ButtonRound14.Gradient = 1;
 ButtonRound14.Gradient_Orientation = 0;
 ButtonRound14.Gradient_Start_Color = 0x0418;
 ButtonRound14.Gradient_End_Color = 0x00A5;
 ButtonRound14.Color = 0xC618;
 ButtonRound14.Press_Color = 0xE71C;
 ButtonRound14.Corner_Radius = 5;
 ButtonRound14.OnUpPtr = 0;
 ButtonRound14.OnDownPtr = 0;
 ButtonRound14.OnClickPtr = BackToHome;
 ButtonRound14.OnPressPtr = 0;

 Home_b23.OwnerScreen = &Sensor2;
 Home_b23.Order = 45;
 Home_b23.Left = 164;
 Home_b23.Top = 232;
 Home_b23.Width = 78;
 Home_b23.Height = 35;
 Home_b23.Pen_Width = 1;
 Home_b23.Pen_Color = 0xC618;
 Home_b23.Visible = 1;
 Home_b23.Active = 1;
 Home_b23.Transparent = 1;
 Home_b23.Caption = Home_b23_Caption;
 Home_b23.TextAlign = _taCenter;
 Home_b23.TextAlignVertical= _tavMiddle;
 Home_b23.FontName =  0x00005242 ;
 Home_b23.PressColEnabled = 1;
 Home_b23.Font_Color = 0xD6BA;
 Home_b23.VerticalText = 0;
 Home_b23.Gradient = 1;
 Home_b23.Gradient_Orientation = 0;
 Home_b23.Gradient_Start_Color = 0x0418;
 Home_b23.Gradient_End_Color = 0x00A5;
 Home_b23.Color = 0xC618;
 Home_b23.Press_Color = 0xE71C;
 Home_b23.Corner_Radius = 5;
 Home_b23.OnUpPtr = 0;
 Home_b23.OnDownPtr = 0;
 Home_b23.OnClickPtr = goToBack;
 Home_b23.OnPressPtr = 0;

 CircleButton16.OwnerScreen = &Sensor2;
 CircleButton16.Order = 46;
 CircleButton16.Left = 450;
 CircleButton16.Top = 3;
 CircleButton16.Radius = 12;
 CircleButton16.Pen_Width = 1;
 CircleButton16.Pen_Color = 0x0000;
 CircleButton16.Visible = 1;
 CircleButton16.Active = 0;
 CircleButton16.Transparent = 1;
 CircleButton16.Caption = CircleButton16_Caption;
 CircleButton16.TextAlign = _taCenter;
 CircleButton16.TextAlignVertical= _tavMiddle;
 CircleButton16.FontName =  0x00005242 ;
 CircleButton16.PressColEnabled = 1;
 CircleButton16.Font_Color = 0x0000;
 CircleButton16.VerticalText = 0;
 CircleButton16.Gradient = 1;
 CircleButton16.Gradient_Orientation = 0;
 CircleButton16.Gradient_Start_Color = 0xFFFF;
 CircleButton16.Gradient_End_Color = 0xC618;
 CircleButton16.Color = 0xC618;
 CircleButton16.Press_Color = 0xE71C;
 CircleButton16.OnUpPtr = 0;
 CircleButton16.OnDownPtr = 0;
 CircleButton16.OnClickPtr = 0;
 CircleButton16.OnPressPtr = 0;

 S_Low_Pressure_2.OwnerScreen = &Sensor2;
 S_Low_Pressure_2.Order = 47;
 S_Low_Pressure_2.Left = 391;
 S_Low_Pressure_2.Top = 168;
 S_Low_Pressure_2.Width = 45;
 S_Low_Pressure_2.Height = 23;
 S_Low_Pressure_2.Pen_Width = 1;
 S_Low_Pressure_2.Pen_Color = 0xC618;
 S_Low_Pressure_2.Visible = 1;
 S_Low_Pressure_2.Active = 0;
 S_Low_Pressure_2.Transparent = 1;
 S_Low_Pressure_2.Caption = S_Low_Pressure_2_Caption;
 S_Low_Pressure_2.TextAlign = _taRight;
 S_Low_Pressure_2.TextAlignVertical= _tavMiddle;
 S_Low_Pressure_2.FontName =  0x00005242 ;
 S_Low_Pressure_2.PressColEnabled = 0;
 S_Low_Pressure_2.Font_Color = 0x0418;
 S_Low_Pressure_2.VerticalText = 0;
 S_Low_Pressure_2.Gradient = 0;
 S_Low_Pressure_2.Gradient_Orientation = 0;
 S_Low_Pressure_2.Gradient_Start_Color = 0xFFFF;
 S_Low_Pressure_2.Gradient_End_Color = 0xC618;
 S_Low_Pressure_2.Color = 0xFFFF;
 S_Low_Pressure_2.Press_Color = 0xE71C;
 S_Low_Pressure_2.Corner_Radius = 3;
 S_Low_Pressure_2.OnUpPtr = 0;
 S_Low_Pressure_2.OnDownPtr = 0;
 S_Low_Pressure_2.OnClickPtr = 0;
 S_Low_Pressure_2.OnPressPtr = 0;

 S_High_Pressure_2.OwnerScreen = &Sensor2;
 S_High_Pressure_2.Order = 48;
 S_High_Pressure_2.Left = 274;
 S_High_Pressure_2.Top = 168;
 S_High_Pressure_2.Width = 45;
 S_High_Pressure_2.Height = 23;
 S_High_Pressure_2.Pen_Width = 1;
 S_High_Pressure_2.Pen_Color = 0xC618;
 S_High_Pressure_2.Visible = 1;
 S_High_Pressure_2.Active = 0;
 S_High_Pressure_2.Transparent = 1;
 S_High_Pressure_2.Caption = S_High_Pressure_2_Caption;
 S_High_Pressure_2.TextAlign = _taRight;
 S_High_Pressure_2.TextAlignVertical= _tavMiddle;
 S_High_Pressure_2.FontName =  0x00005242 ;
 S_High_Pressure_2.PressColEnabled = 0;
 S_High_Pressure_2.Font_Color = 0x06A0;
 S_High_Pressure_2.VerticalText = 0;
 S_High_Pressure_2.Gradient = 0;
 S_High_Pressure_2.Gradient_Orientation = 0;
 S_High_Pressure_2.Gradient_Start_Color = 0xFFFF;
 S_High_Pressure_2.Gradient_End_Color = 0xC618;
 S_High_Pressure_2.Color = 0xFFFF;
 S_High_Pressure_2.Press_Color = 0xE71C;
 S_High_Pressure_2.Corner_Radius = 3;
 S_High_Pressure_2.OnUpPtr = 0;
 S_High_Pressure_2.OnDownPtr = 0;
 S_High_Pressure_2.OnClickPtr = 0;
 S_High_Pressure_2.OnPressPtr = 0;

 Label283.OwnerScreen = &Sensor2;
 Label283.Order = 49;
 Label283.Left = 248;
 Label283.Top = 170;
 Label283.Width = 24;
 Label283.Height = 20;
 Label283.Visible = 1;
 Label283.Active = 0;
 Label283.Caption = Label283_Caption;
 Label283.FontName =  0x00005242 ;
 Label283.Font_Color = 0xFFFF;
 Label283.VerticalText = 0;
 Label283.OnUpPtr = 0;
 Label283.OnDownPtr = 0;
 Label283.OnClickPtr = 0;
 Label283.OnPressPtr = 0;

 Label284.OwnerScreen = &Sensor2;
 Label284.Order = 50;
 Label284.Left = 368;
 Label284.Top = 170;
 Label284.Width = 21;
 Label284.Height = 20;
 Label284.Visible = 1;
 Label284.Active = 0;
 Label284.Caption = Label284_Caption;
 Label284.FontName =  0x00005242 ;
 Label284.Font_Color = 0xFFFF;
 Label284.VerticalText = 0;
 Label284.OnUpPtr = 0;
 Label284.OnDownPtr = 0;
 Label284.OnClickPtr = 0;
 Label284.OnPressPtr = 0;

 Label3.OwnerScreen = &Sensor2;
 Label3.Order = 51;
 Label3.Left = 326;
 Label3.Top = 170;
 Label3.Width = 25;
 Label3.Height = 20;
 Label3.Visible = 1;
 Label3.Active = 0;
 Label3.Caption = Label3_Caption;
 Label3.FontName =  0x00005242 ;
 Label3.Font_Color = 0xFFFF;
 Label3.VerticalText = 0;
 Label3.OnUpPtr = 0;
 Label3.OnDownPtr = 0;
 Label3.OnClickPtr = 0;
 Label3.OnPressPtr = 0;

 Label26.OwnerScreen = &Sensor2;
 Label26.Order = 52;
 Label26.Left = 444;
 Label26.Top = 170;
 Label26.Width = 25;
 Label26.Height = 20;
 Label26.Visible = 1;
 Label26.Active = 0;
 Label26.Caption = Label26_Caption;
 Label26.FontName =  0x00005242 ;
 Label26.Font_Color = 0xFFFF;
 Label26.VerticalText = 0;
 Label26.OnUpPtr = 0;
 Label26.OnDownPtr = 0;
 Label26.OnClickPtr = 0;
 Label26.OnPressPtr = 0;

 Image157.OwnerScreen = &MODE2;
 Image157.Order = 0;
 Image157.Left = 0;
 Image157.Top = 0;
 Image157.Width = 480;
 Image157.Height = 272;
 Image157.Picture_Type = 1;
 Image157.Picture_Ratio = 1;
 Image157.Picture_Name =  0x003DCF26 ;
 Image157.Visible = 1;
 Image157.Active = 0;
 Image157.OnUpPtr = 0;
 Image157.OnDownPtr = 0;
 Image157.OnClickPtr = 0;
 Image157.OnPressPtr = 0;

 Label80.OwnerScreen = &MODE2;
 Label80.Order = 1;
 Label80.Left = 220;
 Label80.Top = 5;
 Label80.Width = 51;
 Label80.Height = 20;
 Label80.Visible = 1;
 Label80.Active = 0;
 Label80.Caption = Label80_Caption;
 Label80.FontName =  0x00005242 ;
 Label80.Font_Color = 0xE7FC;
 Label80.VerticalText = 0;
 Label80.OnUpPtr = 0;
 Label80.OnDownPtr = 0;
 Label80.OnClickPtr = 0;
 Label80.OnPressPtr = 0;

 Mode_air_on.OwnerScreen = &MODE2;
 Mode_air_on.Order = 2;
 Mode_air_on.Left = 345;
 Mode_air_on.Top = 33;
 Mode_air_on.Width = 128;
 Mode_air_on.Height = 30;
 Mode_air_on.Picture_Type = 1;
 Mode_air_on.Picture_Ratio = 1;
 Mode_air_on.Picture_Name =  0x0041CB2C ;
 Mode_air_on.Visible = 1;
 Mode_air_on.Active = 1;
 Mode_air_on.OnUpPtr = 0;
 Mode_air_on.OnDownPtr = 0;
 Mode_air_on.OnClickPtr = 0;
 Mode_air_on.OnPressPtr = 0;

 Mode_ground_on.OwnerScreen = &MODE2;
 Mode_ground_on.Order = 3;
 Mode_ground_on.Left = 345;
 Mode_ground_on.Top = 33;
 Mode_ground_on.Width = 128;
 Mode_ground_on.Height = 30;
 Mode_ground_on.Picture_Type = 1;
 Mode_ground_on.Picture_Ratio = 1;
 Mode_ground_on.Picture_Name =  0x0041E932 ;
 Mode_ground_on.Visible = 1;
 Mode_ground_on.Active = 1;
 Mode_ground_on.OnUpPtr = 0;
 Mode_ground_on.OnDownPtr = 0;
 Mode_ground_on.OnClickPtr = Mode_ground_onOnClick;
 Mode_ground_on.OnPressPtr = 0;

 Home_b24.OwnerScreen = &MODE2;
 Home_b24.Order = 4;
 Home_b24.Left = 236;
 Home_b24.Top = 232;
 Home_b24.Width = 78;
 Home_b24.Height = 35;
 Home_b24.Pen_Width = 1;
 Home_b24.Pen_Color = 0xC618;
 Home_b24.Visible = 1;
 Home_b24.Active = 1;
 Home_b24.Transparent = 1;
 Home_b24.Caption = Home_b24_Caption;
 Home_b24.TextAlign = _taCenter;
 Home_b24.TextAlignVertical= _tavMiddle;
 Home_b24.FontName =  0x00005242 ;
 Home_b24.PressColEnabled = 1;
 Home_b24.Font_Color = 0xD6BA;
 Home_b24.VerticalText = 0;
 Home_b24.Gradient = 1;
 Home_b24.Gradient_Orientation = 0;
 Home_b24.Gradient_Start_Color = 0x0418;
 Home_b24.Gradient_End_Color = 0x00A5;
 Home_b24.Color = 0xC618;
 Home_b24.Press_Color = 0xE71C;
 Home_b24.Corner_Radius = 5;
 Home_b24.OnUpPtr = 0;
 Home_b24.OnDownPtr = 0;
 Home_b24.OnClickPtr = BackToHome;
 Home_b24.OnPressPtr = 0;

 Back_20.OwnerScreen = &MODE2;
 Back_20.Order = 5;
 Back_20.Left = 152;
 Back_20.Top = 232;
 Back_20.Width = 78;
 Back_20.Height = 35;
 Back_20.Pen_Width = 1;
 Back_20.Pen_Color = 0xC618;
 Back_20.Visible = 1;
 Back_20.Active = 1;
 Back_20.Transparent = 1;
 Back_20.Caption = Back_20_Caption;
 Back_20.TextAlign = _taCenter;
 Back_20.TextAlignVertical= _tavMiddle;
 Back_20.FontName =  0x00005242 ;
 Back_20.PressColEnabled = 1;
 Back_20.Font_Color = 0xD6BA;
 Back_20.VerticalText = 0;
 Back_20.Gradient = 1;
 Back_20.Gradient_Orientation = 0;
 Back_20.Gradient_Start_Color = 0x0418;
 Back_20.Gradient_End_Color = 0x00A5;
 Back_20.Color = 0xC618;
 Back_20.Press_Color = 0xE71C;
 Back_20.Corner_Radius = 5;
 Back_20.OnUpPtr = 0;
 Back_20.OnDownPtr = 0;
 Back_20.OnClickPtr = goToBack;
 Back_20.OnPressPtr = 0;

 CircleButton13.OwnerScreen = &MODE2;
 CircleButton13.Order = 6;
 CircleButton13.Left = 450;
 CircleButton13.Top = 3;
 CircleButton13.Radius = 12;
 CircleButton13.Pen_Width = 1;
 CircleButton13.Pen_Color = 0x0000;
 CircleButton13.Visible = 1;
 CircleButton13.Active = 0;
 CircleButton13.Transparent = 1;
 CircleButton13.Caption = CircleButton13_Caption;
 CircleButton13.TextAlign = _taCenter;
 CircleButton13.TextAlignVertical= _tavMiddle;
 CircleButton13.FontName =  0x00005242 ;
 CircleButton13.PressColEnabled = 1;
 CircleButton13.Font_Color = 0x0000;
 CircleButton13.VerticalText = 0;
 CircleButton13.Gradient = 1;
 CircleButton13.Gradient_Orientation = 0;
 CircleButton13.Gradient_Start_Color = 0xFFFF;
 CircleButton13.Gradient_End_Color = 0xC618;
 CircleButton13.Color = 0xC618;
 CircleButton13.Press_Color = 0xE71C;
 CircleButton13.OnUpPtr = 0;
 CircleButton13.OnDownPtr = 0;
 CircleButton13.OnClickPtr = 0;
 CircleButton13.OnPressPtr = 0;

 Image159.OwnerScreen = &Schema2;
 Image159.Order = 0;
 Image159.Left = 4;
 Image159.Top = 29;
 Image159.Width = 472;
 Image159.Height = 240;
 Image159.Picture_Type = 1;
 Image159.Picture_Ratio = 1;
 Image159.Picture_Name =  0x00420738 ;
 Image159.Visible = 1;
 Image159.Active = 1;
 Image159.OnUpPtr = 0;
 Image159.OnDownPtr = 0;
 Image159.OnClickPtr = BackToHome;
 Image159.OnPressPtr = 0;

 Image273.OwnerScreen = &Schema2;
 Image273.Order = 1;
 Image273.Left = 167;
 Image273.Top = 54;
 Image273.Width = 9;
 Image273.Height = 18;
 Image273.Picture_Type = 1;
 Image273.Picture_Ratio = 1;
 Image273.Picture_Name =  0x00457C3E ;
 Image273.Visible = 0;
 Image273.Active = 1;
 Image273.OnUpPtr = 0;
 Image273.OnDownPtr = 0;
 Image273.OnClickPtr = 0;
 Image273.OnPressPtr = 0;

 Image162.OwnerScreen = &Schema2;
 Image162.Order = 2;
 Image162.Left = 168;
 Image162.Top = 181;
 Image162.Width = 9;
 Image162.Height = 18;
 Image162.Picture_Type = 1;
 Image162.Picture_Ratio = 1;
 Image162.Picture_Name =  0x00457C3E ;
 Image162.Visible = 0;
 Image162.Active = 1;
 Image162.OnUpPtr = 0;
 Image162.OnDownPtr = 0;
 Image162.OnClickPtr = 0;
 Image162.OnPressPtr = 0;

 Image176.OwnerScreen = &Schema2;
 Image176.Order = 3;
 Image176.Left = 336;
 Image176.Top = 73;
 Image176.Width = 20;
 Image176.Height = 20;
 Image176.Picture_Type = 1;
 Image176.Picture_Ratio = 1;
 Image176.Picture_Name =  0x002E0ECE ;
 Image176.Visible = 1;
 Image176.Active = 1;
 Image176.OnUpPtr = 0;
 Image176.OnDownPtr = 0;
 Image176.OnClickPtr = 0;
 Image176.OnPressPtr = 0;

 Image174.OwnerScreen = &Schema2;
 Image174.Order = 4;
 Image174.Left = 353;
 Image174.Top = 148;
 Image174.Width = 37;
 Image174.Height = 57;
 Image174.Picture_Type = 1;
 Image174.Picture_Ratio = 1;
 Image174.Picture_Name =  0x00457D88 ;
 Image174.Visible = 1;
 Image174.Active = 1;
 Image174.OnUpPtr = 0;
 Image174.OnDownPtr = 0;
 Image174.OnClickPtr = 0;
 Image174.OnPressPtr = 0;

 Image166.OwnerScreen = &Schema2;
 Image166.Order = 5;
 Image166.Left = 128;
 Image166.Top = 209;
 Image166.Width = 25;
 Image166.Height = 24;
 Image166.Picture_Type = 1;
 Image166.Picture_Ratio = 1;
 Image166.Picture_Name =  0x00458E08 ;
 Image166.Visible = 1;
 Image166.Active = 1;
 Image166.OnUpPtr = 0;
 Image166.OnDownPtr = 0;
 Image166.OnClickPtr = 0;
 Image166.OnPressPtr = 0;

 Image276.OwnerScreen = &Schema2;
 Image276.Order = 6;
 Image276.Left = 128;
 Image276.Top = 83;
 Image276.Width = 25;
 Image276.Height = 24;
 Image276.Picture_Type = 1;
 Image276.Picture_Ratio = 1;
 Image276.Picture_Name =  0x00458E08 ;
 Image276.Visible = 1;
 Image276.Active = 1;
 Image276.OnUpPtr = 0;
 Image276.OnDownPtr = 0;
 Image276.OnClickPtr = 0;
 Image276.OnPressPtr = 0;

 Image175.OwnerScreen = &Schema2;
 Image175.Order = 7;
 Image175.Left = 416;
 Image175.Top = 103;
 Image175.Width = 23;
 Image175.Height = 26;
 Image175.Picture_Type = 1;
 Image175.Picture_Ratio = 1;
 Image175.Picture_Name =  0x004592BE ;
 Image175.Visible = 1;
 Image175.Active = 1;
 Image175.OnUpPtr = 0;
 Image175.OnDownPtr = 0;
 Image175.OnClickPtr = 0;
 Image175.OnPressPtr = 0;

 Image274.OwnerScreen = &Schema2;
 Image274.Order = 8;
 Image274.Left = 167;
 Image274.Top = 54;
 Image274.Width = 9;
 Image274.Height = 18;
 Image274.Picture_Type = 1;
 Image274.Picture_Ratio = 1;
 Image274.Picture_Name =  0x00459770 ;
 Image274.Visible = 1;
 Image274.Active = 1;
 Image274.OnUpPtr = 0;
 Image274.OnDownPtr = 0;
 Image274.OnClickPtr = 0;
 Image274.OnPressPtr = 0;

 Image267.OwnerScreen = &Schema2;
 Image267.Order = 9;
 Image267.Left = 22;
 Image267.Top = 35;
 Image267.Width = 27;
 Image267.Height = 24;
 Image267.Picture_Type = 1;
 Image267.Picture_Ratio = 1;
 Image267.Picture_Name =  0x004598BA ;
 Image267.Visible = 1;
 Image267.Active = 1;
 Image267.OnUpPtr = 0;
 Image267.OnDownPtr = 0;
 Image267.OnClickPtr = 0;
 Image267.OnPressPtr = 0;

 Image164.OwnerScreen = &Schema2;
 Image164.Order = 10;
 Image164.Left = 19;
 Image164.Top = 161;
 Image164.Width = 27;
 Image164.Height = 24;
 Image164.Picture_Type = 1;
 Image164.Picture_Ratio = 1;
 Image164.Picture_Name =  0x004598BA ;
 Image164.Visible = 1;
 Image164.Active = 1;
 Image164.OnUpPtr = 0;
 Image164.OnDownPtr = 0;
 Image164.OnClickPtr = 0;
 Image164.OnPressPtr = 0;

 Image270.OwnerScreen = &Schema2;
 Image270.Order = 11;
 Image270.Left = 289;
 Image270.Top = 105;
 Image270.Width = 27;
 Image270.Height = 24;
 Image270.Picture_Type = 1;
 Image270.Picture_Ratio = 1;
 Image270.Picture_Name =  0x004598BA ;
 Image270.Visible = 0;
 Image270.Active = 1;
 Image270.OnUpPtr = 0;
 Image270.OnDownPtr = 0;
 Image270.OnClickPtr = 0;
 Image270.OnPressPtr = 0;

 Image165.OwnerScreen = &Schema2;
 Image165.Order = 12;
 Image165.Left = 288;
 Image165.Top = 232;
 Image165.Width = 27;
 Image165.Height = 24;
 Image165.Picture_Type = 1;
 Image165.Picture_Ratio = 1;
 Image165.Picture_Name =  0x004598BA ;
 Image165.Visible = 0;
 Image165.Active = 1;
 Image165.OnUpPtr = 0;
 Image165.OnDownPtr = 0;
 Image165.OnClickPtr = 0;
 Image165.OnPressPtr = 0;

 Label82.OwnerScreen = &Schema2;
 Label82.Order = 13;
 Label82.Left = 205;
 Label82.Top = 5;
 Label82.Width = 81;
 Label82.Height = 20;
 Label82.Visible = 1;
 Label82.Active = 0;
 Label82.Caption = Label82_Caption;
 Label82.FontName =  0x0001FD49 ;
 Label82.Font_Color = 0xC618;
 Label82.VerticalText = 0;
 Label82.OnUpPtr = 0;
 Label82.OnDownPtr = 0;
 Label82.OnClickPtr = 0;
 Label82.OnPressPtr = 0;

 Image203.OwnerScreen = &Schema2;
 Image203.Order = 14;
 Image203.Left = 336;
 Image203.Top = 74;
 Image203.Width = 20;
 Image203.Height = 20;
 Image203.Picture_Type = 1;
 Image203.Picture_Ratio = 1;
 Image203.Picture_Name =  0x002E2E3C ;
 Image203.Visible = 1;
 Image203.Active = 1;
 Image203.OnUpPtr = 0;
 Image203.OnDownPtr = 0;
 Image203.OnClickPtr = 0;
 Image203.OnPressPtr = 0;

 Module1_br_inlet.OwnerScreen = &Schema2;
 Module1_br_inlet.Order = 15;
 Module1_br_inlet.Left = 73;
 Module1_br_inlet.Top = 179;
 Module1_br_inlet.Width = 19;
 Module1_br_inlet.Height = 19;
 Module1_br_inlet.Pen_Width = 0;
 Module1_br_inlet.Pen_Color = 0x0000;
 Module1_br_inlet.Visible = 1;
 Module1_br_inlet.Active = 1;
 Module1_br_inlet.Transparent = 1;
 Module1_br_inlet.Caption = Module1_br_inlet_Caption;
 Module1_br_inlet.TextAlign = _taRight;
 Module1_br_inlet.TextAlignVertical= _tavMiddle;
 Module1_br_inlet.FontName =  0x00003E9A ;
 Module1_br_inlet.PressColEnabled = 1;
 Module1_br_inlet.Font_Color = 0x001F;
 Module1_br_inlet.VerticalText = 0;
 Module1_br_inlet.Gradient = 0;
 Module1_br_inlet.Gradient_Orientation = 0;
 Module1_br_inlet.Gradient_Start_Color = 0xFFFF;
 Module1_br_inlet.Gradient_End_Color = 0xC618;
 Module1_br_inlet.Color = 0xFFFF;
 Module1_br_inlet.Press_Color = 0xE71C;
 Module1_br_inlet.OnUpPtr = 0;
 Module1_br_inlet.OnDownPtr = 0;
 Module1_br_inlet.OnClickPtr = 0;
 Module1_br_inlet.OnPressPtr = 0;

 Module1_br_outlet.OwnerScreen = &Schema2;
 Module1_br_outlet.Order = 16;
 Module1_br_outlet.Left = 73;
 Module1_br_outlet.Top = 220;
 Module1_br_outlet.Width = 19;
 Module1_br_outlet.Height = 17;
 Module1_br_outlet.Pen_Width = 0;
 Module1_br_outlet.Pen_Color = 0x0000;
 Module1_br_outlet.Visible = 1;
 Module1_br_outlet.Active = 1;
 Module1_br_outlet.Transparent = 1;
 Module1_br_outlet.Caption = Module1_br_outlet_Caption;
 Module1_br_outlet.TextAlign = _taRight;
 Module1_br_outlet.TextAlignVertical= _tavMiddle;
 Module1_br_outlet.FontName =  0x00003E9A ;
 Module1_br_outlet.PressColEnabled = 1;
 Module1_br_outlet.Font_Color = 0x001F;
 Module1_br_outlet.VerticalText = 0;
 Module1_br_outlet.Gradient = 0;
 Module1_br_outlet.Gradient_Orientation = 0;
 Module1_br_outlet.Gradient_Start_Color = 0xFFFF;
 Module1_br_outlet.Gradient_End_Color = 0xC618;
 Module1_br_outlet.Color = 0xFFFF;
 Module1_br_outlet.Press_Color = 0xE71C;
 Module1_br_outlet.OnUpPtr = 0;
 Module1_br_outlet.OnDownPtr = 0;
 Module1_br_outlet.OnClickPtr = 0;
 Module1_br_outlet.OnPressPtr = 0;

 Module1_heat_outlet.OwnerScreen = &Schema2;
 Module1_heat_outlet.Order = 17;
 Module1_heat_outlet.Left = 237;
 Module1_heat_outlet.Top = 176;
 Module1_heat_outlet.Width = 19;
 Module1_heat_outlet.Height = 18;
 Module1_heat_outlet.Pen_Width = 0;
 Module1_heat_outlet.Pen_Color = 0x0000;
 Module1_heat_outlet.Visible = 1;
 Module1_heat_outlet.Active = 1;
 Module1_heat_outlet.Transparent = 1;
 Module1_heat_outlet.Caption = Module1_heat_outlet_Caption;
 Module1_heat_outlet.TextAlign = _taRight;
 Module1_heat_outlet.TextAlignVertical= _tavMiddle;
 Module1_heat_outlet.FontName =  0x00003E9A ;
 Module1_heat_outlet.PressColEnabled = 1;
 Module1_heat_outlet.Font_Color = 0xFC10;
 Module1_heat_outlet.VerticalText = 0;
 Module1_heat_outlet.Gradient = 0;
 Module1_heat_outlet.Gradient_Orientation = 0;
 Module1_heat_outlet.Gradient_Start_Color = 0xFFFF;
 Module1_heat_outlet.Gradient_End_Color = 0xC618;
 Module1_heat_outlet.Color = 0xFFFF;
 Module1_heat_outlet.Press_Color = 0xE71C;
 Module1_heat_outlet.OnUpPtr = 0;
 Module1_heat_outlet.OnDownPtr = 0;
 Module1_heat_outlet.OnClickPtr = 0;
 Module1_heat_outlet.OnPressPtr = 0;

 Module1_heat_inlet.OwnerScreen = &Schema2;
 Module1_heat_inlet.Order = 18;
 Module1_heat_inlet.Left = 239;
 Module1_heat_inlet.Top = 219;
 Module1_heat_inlet.Width = 19;
 Module1_heat_inlet.Height = 18;
 Module1_heat_inlet.Pen_Width = 0;
 Module1_heat_inlet.Pen_Color = 0x0000;
 Module1_heat_inlet.Visible = 1;
 Module1_heat_inlet.Active = 1;
 Module1_heat_inlet.Transparent = 1;
 Module1_heat_inlet.Caption = Module1_heat_inlet_Caption;
 Module1_heat_inlet.TextAlign = _taRight;
 Module1_heat_inlet.TextAlignVertical= _tavMiddle;
 Module1_heat_inlet.FontName =  0x00003E9A ;
 Module1_heat_inlet.PressColEnabled = 1;
 Module1_heat_inlet.Font_Color = 0xFC10;
 Module1_heat_inlet.VerticalText = 0;
 Module1_heat_inlet.Gradient = 0;
 Module1_heat_inlet.Gradient_Orientation = 0;
 Module1_heat_inlet.Gradient_Start_Color = 0xFFFF;
 Module1_heat_inlet.Gradient_End_Color = 0xC618;
 Module1_heat_inlet.Color = 0xFFFF;
 Module1_heat_inlet.Press_Color = 0xE71C;
 Module1_heat_inlet.OnUpPtr = 0;
 Module1_heat_inlet.OnDownPtr = 0;
 Module1_heat_inlet.OnClickPtr = 0;
 Module1_heat_inlet.OnPressPtr = 0;

 TANK.OwnerScreen = &Schema2;
 TANK.Order = 19;
 TANK.Left = 374;
 TANK.Top = 55;
 TANK.Width = 17;
 TANK.Height = 18;
 TANK.Pen_Width = 0;
 TANK.Pen_Color = 0x0000;
 TANK.Visible = 1;
 TANK.Active = 1;
 TANK.Transparent = 1;
 TANK.Caption = TANK_Caption;
 TANK.TextAlign = _taRight;
 TANK.TextAlignVertical= _tavMiddle;
 TANK.FontName =  0x00003E9A ;
 TANK.PressColEnabled = 1;
 TANK.Font_Color = 0xF800;
 TANK.VerticalText = 0;
 TANK.Gradient = 0;
 TANK.Gradient_Orientation = 0;
 TANK.Gradient_Start_Color = 0xFFFF;
 TANK.Gradient_End_Color = 0xC618;
 TANK.Color = 0xFFFF;
 TANK.Press_Color = 0xE71C;
 TANK.OnUpPtr = 0;
 TANK.OnDownPtr = 0;
 TANK.OnClickPtr = 0;
 TANK.OnPressPtr = 0;

 DHW.OwnerScreen = &Schema2;
 DHW.Order = 20;
 DHW.Left = 419;
 DHW.Top = 181;
 DHW.Width = 17;
 DHW.Height = 19;
 DHW.Pen_Width = 0;
 DHW.Pen_Color = 0x0000;
 DHW.Visible = 1;
 DHW.Active = 1;
 DHW.Transparent = 1;
 DHW.Caption = DHW_Caption;
 DHW.TextAlign = _taRight;
 DHW.TextAlignVertical= _tavMiddle;
 DHW.FontName =  0x0002FD46 ;
 DHW.PressColEnabled = 1;
 DHW.Font_Color = 0xFC08;
 DHW.VerticalText = 0;
 DHW.Gradient = 0;
 DHW.Gradient_Orientation = 0;
 DHW.Gradient_Start_Color = 0xFFFF;
 DHW.Gradient_End_Color = 0xC618;
 DHW.Color = 0xFFFF;
 DHW.Press_Color = 0xE71C;
 DHW.OnUpPtr = 0;
 DHW.OnDownPtr = 0;
 DHW.OnClickPtr = 0;
 DHW.OnPressPtr = 0;

 Module1_exhaust.OwnerScreen = &Schema2;
 Module1_exhaust.Order = 21;
 Module1_exhaust.Left = 154;
 Module1_exhaust.Top = 223;
 Module1_exhaust.Width = 27;
 Module1_exhaust.Height = 18;
 Module1_exhaust.Pen_Width = 0;
 Module1_exhaust.Pen_Color = 0x0000;
 Module1_exhaust.Visible = 1;
 Module1_exhaust.Active = 1;
 Module1_exhaust.Transparent = 1;
 Module1_exhaust.Caption = Module1_exhaust_Caption;
 Module1_exhaust.TextAlign = _taRight;
 Module1_exhaust.TextAlignVertical= _tavMiddle;
 Module1_exhaust.FontName =  0x00003E9A ;
 Module1_exhaust.PressColEnabled = 1;
 Module1_exhaust.Font_Color = 0xF81F;
 Module1_exhaust.VerticalText = 0;
 Module1_exhaust.Gradient = 0;
 Module1_exhaust.Gradient_Orientation = 0;
 Module1_exhaust.Gradient_Start_Color = 0xFFFF;
 Module1_exhaust.Gradient_End_Color = 0xC618;
 Module1_exhaust.Color = 0xFFFF;
 Module1_exhaust.Press_Color = 0xE71C;
 Module1_exhaust.OnUpPtr = 0;
 Module1_exhaust.OnDownPtr = 0;
 Module1_exhaust.OnClickPtr = 0;
 Module1_exhaust.OnPressPtr = 0;

 Module1_superheat.OwnerScreen = &Schema2;
 Module1_superheat.Order = 22;
 Module1_superheat.Left = 118;
 Module1_superheat.Top = 248;
 Module1_superheat.Width = 19;
 Module1_superheat.Height = 17;
 Module1_superheat.Pen_Width = 0;
 Module1_superheat.Pen_Color = 0x0000;
 Module1_superheat.Visible = 1;
 Module1_superheat.Active = 1;
 Module1_superheat.Transparent = 1;
 Module1_superheat.Caption = Module1_superheat_Caption;
 Module1_superheat.TextAlign = _taRight;
 Module1_superheat.TextAlignVertical= _tavMiddle;
 Module1_superheat.FontName =  0x00003E9A ;
 Module1_superheat.PressColEnabled = 1;
 Module1_superheat.Font_Color = 0x8208;
 Module1_superheat.VerticalText = 0;
 Module1_superheat.Gradient = 0;
 Module1_superheat.Gradient_Orientation = 0;
 Module1_superheat.Gradient_Start_Color = 0xFFFF;
 Module1_superheat.Gradient_End_Color = 0xC618;
 Module1_superheat.Color = 0xFFFF;
 Module1_superheat.Press_Color = 0xE71C;
 Module1_superheat.OnUpPtr = 0;
 Module1_superheat.OnDownPtr = 0;
 Module1_superheat.OnClickPtr = 0;
 Module1_superheat.OnPressPtr = 0;

 Module1_heat_flow.OwnerScreen = &Schema2;
 Module1_heat_flow.Order = 23;
 Module1_heat_flow.Left = 12;
 Module1_heat_flow.Top = 188;
 Module1_heat_flow.Width = 40;
 Module1_heat_flow.Height = 18;
 Module1_heat_flow.Pen_Width = 0;
 Module1_heat_flow.Pen_Color = 0x0000;
 Module1_heat_flow.Visible = 0;
 Module1_heat_flow.Active = 1;
 Module1_heat_flow.Transparent = 1;
 Module1_heat_flow.Caption = Module1_heat_flow_Caption;
 Module1_heat_flow.TextAlign = _taRight;
 Module1_heat_flow.TextAlignVertical= _tavMiddle;
 Module1_heat_flow.FontName =  0x00003E9A ;
 Module1_heat_flow.PressColEnabled = 1;
 Module1_heat_flow.Font_Color = 0x8408;
 Module1_heat_flow.VerticalText = 0;
 Module1_heat_flow.Gradient = 0;
 Module1_heat_flow.Gradient_Orientation = 0;
 Module1_heat_flow.Gradient_Start_Color = 0xFFFF;
 Module1_heat_flow.Gradient_End_Color = 0xC618;
 Module1_heat_flow.Color = 0xFFFF;
 Module1_heat_flow.Press_Color = 0xE71C;
 Module1_heat_flow.OnUpPtr = 0;
 Module1_heat_flow.OnDownPtr = 0;
 Module1_heat_flow.OnClickPtr = 0;
 Module1_heat_flow.OnPressPtr = 0;

 Image181.OwnerScreen = &Schema2;
 Image181.Order = 24;
 Image181.Left = 128;
 Image181.Top = 209;
 Image181.Width = 25;
 Image181.Height = 24;
 Image181.Picture_Type = 1;
 Image181.Picture_Ratio = 1;
 Image181.Picture_Name =  0x00459DD0 ;
 Image181.Visible = 1;
 Image181.Active = 1;
 Image181.OnUpPtr = 0;
 Image181.OnDownPtr = 0;
 Image181.OnClickPtr = 0;
 Image181.OnPressPtr = 0;

 Image160.OwnerScreen = &Schema2;
 Image160.Order = 25;
 Image160.Left = 0;
 Image160.Top = 0;
 Image160.Width = 480;
 Image160.Height = 28;
 Image160.Picture_Type = 1;
 Image160.Picture_Ratio = 1;
 Image160.Picture_Name =  0x002D7ADE ;
 Image160.Visible = 1;
 Image160.Active = 1;
 Image160.OnUpPtr = 0;
 Image160.OnDownPtr = 0;
 Image160.OnClickPtr = 0;
 Image160.OnPressPtr = 0;

 Button7.OwnerScreen = &Schema2;
 Button7.Order = 26;
 Button7.Left = 72;
 Button7.Top = 52;
 Button7.Width = 19;
 Button7.Height = 20;
 Button7.Pen_Width = 0;
 Button7.Pen_Color = 0x0000;
 Button7.Visible = 1;
 Button7.Active = 1;
 Button7.Transparent = 1;
 Button7.Caption = Button7_Caption;
 Button7.TextAlign = _taRight;
 Button7.TextAlignVertical= _tavMiddle;
 Button7.FontName =  0x00003E9A ;
 Button7.PressColEnabled = 1;
 Button7.Font_Color = 0x001F;
 Button7.VerticalText = 0;
 Button7.Gradient = 0;
 Button7.Gradient_Orientation = 0;
 Button7.Gradient_Start_Color = 0xFFFF;
 Button7.Gradient_End_Color = 0xC618;
 Button7.Color = 0xFFFF;
 Button7.Press_Color = 0xE71C;
 Button7.OnUpPtr = 0;
 Button7.OnDownPtr = 0;
 Button7.OnClickPtr = 0;
 Button7.OnPressPtr = 0;

 Button9.OwnerScreen = &Schema2;
 Button9.Order = 27;
 Button9.Left = 73;
 Button9.Top = 91;
 Button9.Width = 19;
 Button9.Height = 19;
 Button9.Pen_Width = 0;
 Button9.Pen_Color = 0x0000;
 Button9.Visible = 1;
 Button9.Active = 1;
 Button9.Transparent = 1;
 Button9.Caption = Button9_Caption;
 Button9.TextAlign = _taRight;
 Button9.TextAlignVertical= _tavMiddle;
 Button9.FontName =  0x00003E9A ;
 Button9.PressColEnabled = 1;
 Button9.Font_Color = 0x001F;
 Button9.VerticalText = 0;
 Button9.Gradient = 0;
 Button9.Gradient_Orientation = 0;
 Button9.Gradient_Start_Color = 0xFFFF;
 Button9.Gradient_End_Color = 0xC618;
 Button9.Color = 0xFFFF;
 Button9.Press_Color = 0xE71C;
 Button9.OnUpPtr = 0;
 Button9.OnDownPtr = 0;
 Button9.OnClickPtr = 0;
 Button9.OnPressPtr = 0;

 Button10.OwnerScreen = &Schema2;
 Button10.Order = 28;
 Button10.Left = 238;
 Button10.Top = 51;
 Button10.Width = 17;
 Button10.Height = 18;
 Button10.Pen_Width = 0;
 Button10.Pen_Color = 0x0000;
 Button10.Visible = 1;
 Button10.Active = 1;
 Button10.Transparent = 1;
 Button10.Caption = Button10_Caption;
 Button10.TextAlign = _taRight;
 Button10.TextAlignVertical= _tavMiddle;
 Button10.FontName =  0x00003E9A ;
 Button10.PressColEnabled = 1;
 Button10.Font_Color = 0xFC10;
 Button10.VerticalText = 0;
 Button10.Gradient = 0;
 Button10.Gradient_Orientation = 0;
 Button10.Gradient_Start_Color = 0xFFFF;
 Button10.Gradient_End_Color = 0xC618;
 Button10.Color = 0xFFFF;
 Button10.Press_Color = 0xE71C;
 Button10.OnUpPtr = 0;
 Button10.OnDownPtr = 0;
 Button10.OnClickPtr = 0;
 Button10.OnPressPtr = 0;

 Button11.OwnerScreen = &Schema2;
 Button11.Order = 29;
 Button11.Left = 238;
 Button11.Top = 90;
 Button11.Width = 19;
 Button11.Height = 18;
 Button11.Pen_Width = 0;
 Button11.Pen_Color = 0x0000;
 Button11.Visible = 1;
 Button11.Active = 1;
 Button11.Transparent = 1;
 Button11.Caption = Button11_Caption;
 Button11.TextAlign = _taRight;
 Button11.TextAlignVertical= _tavMiddle;
 Button11.FontName =  0x00003E9A ;
 Button11.PressColEnabled = 1;
 Button11.Font_Color = 0xFC10;
 Button11.VerticalText = 0;
 Button11.Gradient = 0;
 Button11.Gradient_Orientation = 0;
 Button11.Gradient_Start_Color = 0xFFFF;
 Button11.Gradient_End_Color = 0xC618;
 Button11.Color = 0xFFFF;
 Button11.Press_Color = 0xE71C;
 Button11.OnUpPtr = 0;
 Button11.OnDownPtr = 0;
 Button11.OnClickPtr = 0;
 Button11.OnPressPtr = 0;

 Module2_exhaust.OwnerScreen = &Schema2;
 Module2_exhaust.Order = 30;
 Module2_exhaust.Left = 151;
 Module2_exhaust.Top = 93;
 Module2_exhaust.Width = 27;
 Module2_exhaust.Height = 19;
 Module2_exhaust.Pen_Width = 0;
 Module2_exhaust.Pen_Color = 0x0000;
 Module2_exhaust.Visible = 1;
 Module2_exhaust.Active = 1;
 Module2_exhaust.Transparent = 1;
 Module2_exhaust.Caption = Module2_exhaust_Caption;
 Module2_exhaust.TextAlign = _taRight;
 Module2_exhaust.TextAlignVertical= _tavMiddle;
 Module2_exhaust.FontName =  0x00003E9A ;
 Module2_exhaust.PressColEnabled = 1;
 Module2_exhaust.Font_Color = 0xF81F;
 Module2_exhaust.VerticalText = 0;
 Module2_exhaust.Gradient = 0;
 Module2_exhaust.Gradient_Orientation = 0;
 Module2_exhaust.Gradient_Start_Color = 0xFFFF;
 Module2_exhaust.Gradient_End_Color = 0xC618;
 Module2_exhaust.Color = 0xFFFF;
 Module2_exhaust.Press_Color = 0xE71C;
 Module2_exhaust.OnUpPtr = 0;
 Module2_exhaust.OnDownPtr = 0;
 Module2_exhaust.OnClickPtr = 0;
 Module2_exhaust.OnPressPtr = 0;

 Module2_superheat.OwnerScreen = &Schema2;
 Module2_superheat.Order = 31;
 Module2_superheat.Left = 124;
 Module2_superheat.Top = 120;
 Module2_superheat.Width = 19;
 Module2_superheat.Height = 18;
 Module2_superheat.Pen_Width = 0;
 Module2_superheat.Pen_Color = 0x0000;
 Module2_superheat.Visible = 1;
 Module2_superheat.Active = 1;
 Module2_superheat.Transparent = 1;
 Module2_superheat.Caption = Module2_superheat_Caption;
 Module2_superheat.TextAlign = _taRight;
 Module2_superheat.TextAlignVertical= _tavMiddle;
 Module2_superheat.FontName =  0x00003E9A ;
 Module2_superheat.PressColEnabled = 1;
 Module2_superheat.Font_Color = 0x8208;
 Module2_superheat.VerticalText = 0;
 Module2_superheat.Gradient = 0;
 Module2_superheat.Gradient_Orientation = 0;
 Module2_superheat.Gradient_Start_Color = 0xFFFF;
 Module2_superheat.Gradient_End_Color = 0xC618;
 Module2_superheat.Color = 0xFFFF;
 Module2_superheat.Press_Color = 0xE71C;
 Module2_superheat.OnUpPtr = 0;
 Module2_superheat.OnDownPtr = 0;
 Module2_superheat.OnClickPtr = 0;
 Module2_superheat.OnPressPtr = 0;

 Module2_brine_flow.OwnerScreen = &Schema2;
 Module2_brine_flow.Order = 32;
 Module2_brine_flow.Left = 16;
 Module2_brine_flow.Top = 60;
 Module2_brine_flow.Width = 41;
 Module2_brine_flow.Height = 18;
 Module2_brine_flow.Pen_Width = 0;
 Module2_brine_flow.Pen_Color = 0x0000;
 Module2_brine_flow.Visible = 0;
 Module2_brine_flow.Active = 1;
 Module2_brine_flow.Transparent = 1;
 Module2_brine_flow.Caption = Module2_brine_flow_Caption;
 Module2_brine_flow.TextAlign = _taRight;
 Module2_brine_flow.TextAlignVertical= _tavMiddle;
 Module2_brine_flow.FontName =  0x00003E9A ;
 Module2_brine_flow.PressColEnabled = 1;
 Module2_brine_flow.Font_Color = 0x8408;
 Module2_brine_flow.VerticalText = 0;
 Module2_brine_flow.Gradient = 0;
 Module2_brine_flow.Gradient_Orientation = 0;
 Module2_brine_flow.Gradient_Start_Color = 0xFFFF;
 Module2_brine_flow.Gradient_End_Color = 0xC618;
 Module2_brine_flow.Color = 0xFFFF;
 Module2_brine_flow.Press_Color = 0xE71C;
 Module2_brine_flow.OnUpPtr = 0;
 Module2_brine_flow.OnDownPtr = 0;
 Module2_brine_flow.OnClickPtr = 0;
 Module2_brine_flow.OnPressPtr = 0;

 Button15.OwnerScreen = &Schema2;
 Button15.Order = 33;
 Button15.Left = 285;
 Button15.Top = 131;
 Button15.Width = 32;
 Button15.Height = 19;
 Button15.Pen_Width = 0;
 Button15.Pen_Color = 0x0000;
 Button15.Visible = 0;
 Button15.Active = 1;
 Button15.Transparent = 1;
 Button15.Caption = Button15_Caption;
 Button15.TextAlign = _taRight;
 Button15.TextAlignVertical= _tavMiddle;
 Button15.FontName =  0x00003E9A ;
 Button15.PressColEnabled = 1;
 Button15.Font_Color = 0x8408;
 Button15.VerticalText = 0;
 Button15.Gradient = 0;
 Button15.Gradient_Orientation = 0;
 Button15.Gradient_Start_Color = 0xFFFF;
 Button15.Gradient_End_Color = 0xC618;
 Button15.Color = 0xFFFF;
 Button15.Press_Color = 0xE71C;
 Button15.OnUpPtr = 0;
 Button15.OnDownPtr = 0;
 Button15.OnClickPtr = 0;
 Button15.OnPressPtr = 0;

 Image178.OwnerScreen = &Schema2;
 Image178.Order = 34;
 Image178.Left = 19;
 Image178.Top = 161;
 Image178.Width = 27;
 Image178.Height = 24;
 Image178.Picture_Type = 1;
 Image178.Picture_Ratio = 1;
 Image178.Picture_Name =  0x0045A286 ;
 Image178.Visible = 1;
 Image178.Active = 1;
 Image178.OnUpPtr = 0;
 Image178.OnDownPtr = 0;
 Image178.OnClickPtr = 0;
 Image178.OnPressPtr = 0;

 Image183.OwnerScreen = &Schema2;
 Image183.Order = 35;
 Image183.Left = 288;
 Image183.Top = 232;
 Image183.Width = 27;
 Image183.Height = 24;
 Image183.Picture_Type = 1;
 Image183.Picture_Ratio = 1;
 Image183.Picture_Name =  0x0045A286 ;
 Image183.Visible = 1;
 Image183.Active = 1;
 Image183.OnUpPtr = 0;
 Image183.OnDownPtr = 0;
 Image183.OnClickPtr = 0;
 Image183.OnPressPtr = 0;

 Image271.OwnerScreen = &Schema2;
 Image271.Order = 36;
 Image271.Left = 22;
 Image271.Top = 35;
 Image271.Width = 27;
 Image271.Height = 24;
 Image271.Picture_Type = 1;
 Image271.Picture_Ratio = 1;
 Image271.Picture_Name =  0x0045A286 ;
 Image271.Visible = 1;
 Image271.Active = 1;
 Image271.OnUpPtr = 0;
 Image271.OnDownPtr = 0;
 Image271.OnClickPtr = 0;
 Image271.OnPressPtr = 0;

 Image272.OwnerScreen = &Schema2;
 Image272.Order = 37;
 Image272.Left = 289;
 Image272.Top = 105;
 Image272.Width = 27;
 Image272.Height = 24;
 Image272.Picture_Type = 1;
 Image272.Picture_Ratio = 1;
 Image272.Picture_Name =  0x0045A286 ;
 Image272.Visible = 1;
 Image272.Active = 1;
 Image272.OnUpPtr = 0;
 Image272.OnDownPtr = 0;
 Image272.OnClickPtr = 0;
 Image272.OnPressPtr = 0;

 Image172.OwnerScreen = &Schema2;
 Image172.Order = 38;
 Image172.Left = 332;
 Image172.Top = 236;
 Image172.Width = 20;
 Image172.Height = 17;
 Image172.Picture_Type = 1;
 Image172.Picture_Ratio = 1;
 Image172.Picture_Name =  0x0045A79C ;
 Image172.Visible = 1;
 Image172.Active = 1;
 Image172.OnUpPtr = 0;
 Image172.OnDownPtr = 0;
 Image172.OnClickPtr = 0;
 Image172.OnPressPtr = 0;

 Image182.OwnerScreen = &Schema2;
 Image182.Order = 39;
 Image182.Left = 332;
 Image182.Top = 235;
 Image182.Width = 20;
 Image182.Height = 18;
 Image182.Picture_Type = 1;
 Image182.Picture_Ratio = 1;
 Image182.Picture_Name =  0x0045AA4A ;
 Image182.Visible = 1;
 Image182.Active = 1;
 Image182.OnUpPtr = 0;
 Image182.OnDownPtr = 0;
 Image182.OnClickPtr = 0;
 Image182.OnPressPtr = 0;

 Image204.OwnerScreen = &Schema2;
 Image204.Order = 40;
 Image204.Left = 352;
 Image204.Top = 148;
 Image204.Width = 37;
 Image204.Height = 57;
 Image204.Picture_Type = 1;
 Image204.Picture_Ratio = 1;
 Image204.Picture_Name =  0x0027923E ;
 Image204.Visible = 1;
 Image204.Active = 1;
 Image204.OnUpPtr = 0;
 Image204.OnDownPtr = 0;
 Image204.OnClickPtr = 0;
 Image204.OnPressPtr = 0;

 Image180.OwnerScreen = &Schema2;
 Image180.Order = 41;
 Image180.Left = 168;
 Image180.Top = 181;
 Image180.Width = 9;
 Image180.Height = 18;
 Image180.Picture_Type = 1;
 Image180.Picture_Ratio = 1;
 Image180.Picture_Name =  0x00459770 ;
 Image180.Visible = 1;
 Image180.Active = 1;
 Image180.OnUpPtr = 0;
 Image180.OnDownPtr = 0;
 Image180.OnClickPtr = 0;
 Image180.OnPressPtr = 0;

 Image275.OwnerScreen = &Schema2;
 Image275.Order = 42;
 Image275.Left = 128;
 Image275.Top = 83;
 Image275.Width = 25;
 Image275.Height = 24;
 Image275.Picture_Type = 1;
 Image275.Picture_Ratio = 1;
 Image275.Picture_Name =  0x00459DD0 ;
 Image275.Visible = 1;
 Image275.Active = 1;
 Image275.OnUpPtr = 0;
 Image275.OnDownPtr = 0;
 Image275.OnClickPtr = 0;
 Image275.OnPressPtr = 0;

 Image202.OwnerScreen = &Schema2;
 Image202.Order = 43;
 Image202.Left = 416;
 Image202.Top = 103;
 Image202.Width = 23;
 Image202.Height = 26;
 Image202.Picture_Type = 1;
 Image202.Picture_Ratio = 1;
 Image202.Picture_Name =  0x00271B34 ;
 Image202.Visible = 1;
 Image202.Active = 1;
 Image202.OnUpPtr = 0;
 Image202.OnDownPtr = 0;
 Image202.OnClickPtr = 0;
 Image202.OnPressPtr = 0;

 Label95.OwnerScreen = &Schema2;
 Label95.Order = 44;
 Label95.Left = 207;
 Label95.Top = 3;
 Label95.Width = 82;
 Label95.Height = 20;
 Label95.Visible = 1;
 Label95.Active = 0;
 Label95.Caption = Label95_Caption;
 Label95.FontName =  0x00005242 ;
 Label95.Font_Color = 0xE7FC;
 Label95.VerticalText = 0;
 Label95.OnUpPtr = 0;
 Label95.OnDownPtr = 0;
 Label95.OnClickPtr = 0;
 Label95.OnPressPtr = 0;

 Button13.OwnerScreen = &Schema2;
 Button13.Order = 45;
 Button13.Left = 432;
 Button13.Top = 75;
 Button13.Width = 27;
 Button13.Height = 18;
 Button13.Pen_Width = 0;
 Button13.Pen_Color = 0x0000;
 Button13.Visible = 1;
 Button13.Active = 1;
 Button13.Transparent = 1;
 Button13.Caption = Button13_Caption;
 Button13.TextAlign = _taRight;
 Button13.TextAlignVertical= _tavMiddle;
 Button13.FontName =  0x00003E9A ;
 Button13.PressColEnabled = 1;
 Button13.Font_Color = 0xB5A0;
 Button13.VerticalText = 0;
 Button13.Gradient = 0;
 Button13.Gradient_Orientation = 0;
 Button13.Gradient_Start_Color = 0xFFFF;
 Button13.Gradient_End_Color = 0xC618;
 Button13.Color = 0xFFFF;
 Button13.Press_Color = 0xE71C;
 Button13.OnUpPtr = 0;
 Button13.OnDownPtr = 0;
 Button13.OnClickPtr = 0;
 Button13.OnPressPtr = 0;

 Button5.OwnerScreen = &Schema2;
 Button5.Order = 46;
 Button5.Left = 284;
 Button5.Top = 211;
 Button5.Width = 32;
 Button5.Height = 19;
 Button5.Pen_Width = 0;
 Button5.Pen_Color = 0x0000;
 Button5.Visible = 0;
 Button5.Active = 1;
 Button5.Transparent = 1;
 Button5.Caption = Button5_Caption;
 Button5.TextAlign = _taRight;
 Button5.TextAlignVertical= _tavMiddle;
 Button5.FontName =  0x00003E9A ;
 Button5.PressColEnabled = 1;
 Button5.Font_Color = 0x8408;
 Button5.VerticalText = 0;
 Button5.Gradient = 0;
 Button5.Gradient_Orientation = 0;
 Button5.Gradient_Start_Color = 0xFFFF;
 Button5.Gradient_End_Color = 0xC618;
 Button5.Color = 0xFFFF;
 Button5.Press_Color = 0xE71C;
 Button5.OnUpPtr = 0;
 Button5.OnDownPtr = 0;
 Button5.OnClickPtr = 0;
 Button5.OnPressPtr = 0;

 Image278.OwnerScreen = &SYSTEM_EVENTS2;
 Image278.Order = 0;
 Image278.Left = 0;
 Image278.Top = 0;
 Image278.Width = 480;
 Image278.Height = 272;
 Image278.Picture_Type = 1;
 Image278.Picture_Ratio = 1;
 Image278.Picture_Name =  0x0045AD20 ;
 Image278.Visible = 1;
 Image278.Active = 0;
 Image278.OnUpPtr = 0;
 Image278.OnDownPtr = 0;
 Image278.OnClickPtr = 0;
 Image278.OnPressPtr = 0;

 Label96.OwnerScreen = &SYSTEM_EVENTS2;
 Label96.Order = 1;
 Label96.Left = 203;
 Label96.Top = 5;
 Label96.Width = 91;
 Label96.Height = 20;
 Label96.Visible = 1;
 Label96.Active = 0;
 Label96.Caption = Label96_Caption;
 Label96.FontName =  0x00005242 ;
 Label96.Font_Color = 0xE7FC;
 Label96.VerticalText = 0;
 Label96.OnUpPtr = 0;
 Label96.OnDownPtr = 0;
 Label96.OnClickPtr = 0;
 Label96.OnPressPtr = 0;

 Time2_reverse.OwnerScreen = &SYSTEM_EVENTS2;
 Time2_reverse.Order = 2;
 Time2_reverse.Left = 394;
 Time2_reverse.Top = 100;
 Time2_reverse.Width = 70;
 Time2_reverse.Height = 23;
 Time2_reverse.Pen_Width = 0;
 Time2_reverse.Pen_Color = 0x0000;
 Time2_reverse.Visible = 0;
 Time2_reverse.Active = 0;
 Time2_reverse.Transparent = 1;
 Time2_reverse.Caption = Time2_reverse_Caption;
 Time2_reverse.TextAlign = _taCenter;
 Time2_reverse.TextAlignVertical= _tavMiddle;
 Time2_reverse.FontName =  0x00005242 ;
 Time2_reverse.PressColEnabled = 1;
 Time2_reverse.Font_Color = 0x0585;
 Time2_reverse.VerticalText = 0;
 Time2_reverse.Gradient = 1;
 Time2_reverse.Gradient_Orientation = 0;
 Time2_reverse.Gradient_Start_Color = 0xFFFF;
 Time2_reverse.Gradient_End_Color = 0xFFFF;
 Time2_reverse.Color = 0xC618;
 Time2_reverse.Press_Color = 0xE71C;
 Time2_reverse.Corner_Radius = 5;
 Time2_reverse.OnUpPtr = 0;
 Time2_reverse.OnDownPtr = 0;
 Time2_reverse.OnClickPtr = 0;
 Time2_reverse.OnPressPtr = 0;

 Time2_ground_pump.OwnerScreen = &SYSTEM_EVENTS2;
 Time2_ground_pump.Order = 3;
 Time2_ground_pump.Left = 394;
 Time2_ground_pump.Top = 132;
 Time2_ground_pump.Width = 70;
 Time2_ground_pump.Height = 23;
 Time2_ground_pump.Pen_Width = 0;
 Time2_ground_pump.Pen_Color = 0x0000;
 Time2_ground_pump.Visible = 0;
 Time2_ground_pump.Active = 0;
 Time2_ground_pump.Transparent = 1;
 Time2_ground_pump.Caption = Time2_ground_pump_Caption;
 Time2_ground_pump.TextAlign = _taCenter;
 Time2_ground_pump.TextAlignVertical= _tavMiddle;
 Time2_ground_pump.FontName =  0x00005242 ;
 Time2_ground_pump.PressColEnabled = 1;
 Time2_ground_pump.Font_Color = 0x0585;
 Time2_ground_pump.VerticalText = 0;
 Time2_ground_pump.Gradient = 1;
 Time2_ground_pump.Gradient_Orientation = 0;
 Time2_ground_pump.Gradient_Start_Color = 0xFFFF;
 Time2_ground_pump.Gradient_End_Color = 0xFFFF;
 Time2_ground_pump.Color = 0xC618;
 Time2_ground_pump.Press_Color = 0xE71C;
 Time2_ground_pump.Corner_Radius = 5;
 Time2_ground_pump.OnUpPtr = 0;
 Time2_ground_pump.OnDownPtr = 0;
 Time2_ground_pump.OnClickPtr = 0;
 Time2_ground_pump.OnPressPtr = 0;

 Time2_heat_pump.OwnerScreen = &SYSTEM_EVENTS2;
 Time2_heat_pump.Order = 4;
 Time2_heat_pump.Left = 394;
 Time2_heat_pump.Top = 163;
 Time2_heat_pump.Width = 70;
 Time2_heat_pump.Height = 23;
 Time2_heat_pump.Pen_Width = 0;
 Time2_heat_pump.Pen_Color = 0x0000;
 Time2_heat_pump.Visible = 0;
 Time2_heat_pump.Active = 0;
 Time2_heat_pump.Transparent = 1;
 Time2_heat_pump.Caption = Time2_heat_pump_Caption;
 Time2_heat_pump.TextAlign = _taCenter;
 Time2_heat_pump.TextAlignVertical= _tavMiddle;
 Time2_heat_pump.FontName =  0x00005242 ;
 Time2_heat_pump.PressColEnabled = 1;
 Time2_heat_pump.Font_Color = 0x0585;
 Time2_heat_pump.VerticalText = 0;
 Time2_heat_pump.Gradient = 1;
 Time2_heat_pump.Gradient_Orientation = 0;
 Time2_heat_pump.Gradient_Start_Color = 0xFFFF;
 Time2_heat_pump.Gradient_End_Color = 0xFFFF;
 Time2_heat_pump.Color = 0xC618;
 Time2_heat_pump.Press_Color = 0xE71C;
 Time2_heat_pump.Corner_Radius = 5;
 Time2_heat_pump.OnUpPtr = 0;
 Time2_heat_pump.OnDownPtr = 0;
 Time2_heat_pump.OnClickPtr = 0;
 Time2_heat_pump.OnPressPtr = 0;

 Time2_compressor.OwnerScreen = &SYSTEM_EVENTS2;
 Time2_compressor.Order = 5;
 Time2_compressor.Left = 394;
 Time2_compressor.Top = 68;
 Time2_compressor.Width = 70;
 Time2_compressor.Height = 23;
 Time2_compressor.Pen_Width = 0;
 Time2_compressor.Pen_Color = 0x0000;
 Time2_compressor.Visible = 0;
 Time2_compressor.Active = 0;
 Time2_compressor.Transparent = 1;
 Time2_compressor.Caption = Time2_compressor_Caption;
 Time2_compressor.TextAlign = _taCenter;
 Time2_compressor.TextAlignVertical= _tavMiddle;
 Time2_compressor.FontName =  0x00005242 ;
 Time2_compressor.PressColEnabled = 1;
 Time2_compressor.Font_Color = 0x0585;
 Time2_compressor.VerticalText = 0;
 Time2_compressor.Gradient = 1;
 Time2_compressor.Gradient_Orientation = 0;
 Time2_compressor.Gradient_Start_Color = 0xFFFF;
 Time2_compressor.Gradient_End_Color = 0xFFFF;
 Time2_compressor.Color = 0xC618;
 Time2_compressor.Press_Color = 0xE71C;
 Time2_compressor.Corner_Radius = 5;
 Time2_compressor.OnUpPtr = 0;
 Time2_compressor.OnDownPtr = 0;
 Time2_compressor.OnClickPtr = 0;
 Time2_compressor.OnPressPtr = 0;

 Home_b25.OwnerScreen = &SYSTEM_EVENTS2;
 Home_b25.Order = 6;
 Home_b25.Left = 235;
 Home_b25.Top = 232;
 Home_b25.Width = 78;
 Home_b25.Height = 35;
 Home_b25.Pen_Width = 1;
 Home_b25.Pen_Color = 0xC618;
 Home_b25.Visible = 1;
 Home_b25.Active = 1;
 Home_b25.Transparent = 1;
 Home_b25.Caption = Home_b25_Caption;
 Home_b25.TextAlign = _taCenter;
 Home_b25.TextAlignVertical= _tavMiddle;
 Home_b25.FontName =  0x00005242 ;
 Home_b25.PressColEnabled = 1;
 Home_b25.Font_Color = 0xD6BA;
 Home_b25.VerticalText = 0;
 Home_b25.Gradient = 1;
 Home_b25.Gradient_Orientation = 0;
 Home_b25.Gradient_Start_Color = 0x0418;
 Home_b25.Gradient_End_Color = 0x00A5;
 Home_b25.Color = 0xC618;
 Home_b25.Press_Color = 0xE71C;
 Home_b25.Corner_Radius = 5;
 Home_b25.OnUpPtr = 0;
 Home_b25.OnDownPtr = 0;
 Home_b25.OnClickPtr = BackToHome;
 Home_b25.OnPressPtr = 0;

 Time_solar.OwnerScreen = &SYSTEM_EVENTS2;
 Time_solar.Order = 7;
 Time_solar.Left = 394;
 Time_solar.Top = 36;
 Time_solar.Width = 70;
 Time_solar.Height = 22;
 Time_solar.Pen_Width = 0;
 Time_solar.Pen_Color = 0x0000;
 Time_solar.Visible = 1;
 Time_solar.Active = 0;
 Time_solar.Transparent = 1;
 Time_solar.Caption = Time_solar_Caption;
 Time_solar.TextAlign = _taCenter;
 Time_solar.TextAlignVertical= _tavMiddle;
 Time_solar.FontName =  0x00005242 ;
 Time_solar.PressColEnabled = 1;
 Time_solar.Font_Color = 0x0585;
 Time_solar.VerticalText = 0;
 Time_solar.Gradient = 1;
 Time_solar.Gradient_Orientation = 0;
 Time_solar.Gradient_Start_Color = 0xFFFF;
 Time_solar.Gradient_End_Color = 0xFFFF;
 Time_solar.Color = 0xC618;
 Time_solar.Press_Color = 0xE71C;
 Time_solar.Corner_Radius = 5;
 Time_solar.OnUpPtr = 0;
 Time_solar.OnDownPtr = 0;
 Time_solar.OnClickPtr = 0;
 Time_solar.OnPressPtr = 0;

 CircleButton7.OwnerScreen = &SYSTEM_EVENTS2;
 CircleButton7.Order = 8;
 CircleButton7.Left = 450;
 CircleButton7.Top = 3;
 CircleButton7.Radius = 12;
 CircleButton7.Pen_Width = 1;
 CircleButton7.Pen_Color = 0x0000;
 CircleButton7.Visible = 1;
 CircleButton7.Active = 0;
 CircleButton7.Transparent = 1;
 CircleButton7.Caption = CircleButton7_Caption;
 CircleButton7.TextAlign = _taCenter;
 CircleButton7.TextAlignVertical= _tavMiddle;
 CircleButton7.FontName =  0x00005242 ;
 CircleButton7.PressColEnabled = 1;
 CircleButton7.Font_Color = 0x0000;
 CircleButton7.VerticalText = 0;
 CircleButton7.Gradient = 1;
 CircleButton7.Gradient_Orientation = 0;
 CircleButton7.Gradient_Start_Color = 0xFFFF;
 CircleButton7.Gradient_End_Color = 0xC618;
 CircleButton7.Color = 0xC618;
 CircleButton7.Press_Color = 0xE71C;
 CircleButton7.OnUpPtr = 0;
 CircleButton7.OnDownPtr = 0;
 CircleButton7.OnClickPtr = 0;
 CircleButton7.OnPressPtr = 0;

 Back_b21.OwnerScreen = &SYSTEM_EVENTS2;
 Back_b21.Order = 9;
 Back_b21.Left = 149;
 Back_b21.Top = 232;
 Back_b21.Width = 78;
 Back_b21.Height = 35;
 Back_b21.Pen_Width = 1;
 Back_b21.Pen_Color = 0xC618;
 Back_b21.Visible = 1;
 Back_b21.Active = 1;
 Back_b21.Transparent = 1;
 Back_b21.Caption = Back_b21_Caption;
 Back_b21.TextAlign = _taCenter;
 Back_b21.TextAlignVertical= _tavMiddle;
 Back_b21.FontName =  0x00005242 ;
 Back_b21.PressColEnabled = 1;
 Back_b21.Font_Color = 0xD6BA;
 Back_b21.VerticalText = 0;
 Back_b21.Gradient = 1;
 Back_b21.Gradient_Orientation = 0;
 Back_b21.Gradient_Start_Color = 0x0418;
 Back_b21.Gradient_End_Color = 0x00A5;
 Back_b21.Color = 0xC618;
 Back_b21.Press_Color = 0xE71C;
 Back_b21.Corner_Radius = 5;
 Back_b21.OnUpPtr = 0;
 Back_b21.OnDownPtr = 0;
 Back_b21.OnClickPtr = goToBack;
 Back_b21.OnPressPtr = 0;

 Label9.OwnerScreen = &SYSTEM_EVENTS2;
 Label9.Order = 10;
 Label9.Left = 409;
 Label9.Top = 191;
 Label9.Width = 46;
 Label9.Height = 20;
 Label9.Visible = 1;
 Label9.Active = 1;
 Label9.Caption = Label9_Caption;
 Label9.FontName =  0x00005242 ;
 Label9.Font_Color = 0xFFFF;
 Label9.VerticalText = 0;
 Label9.OnUpPtr = 0;
 Label9.OnDownPtr = 0;
 Label9.OnClickPtr = 0;
 Label9.OnPressPtr = 0;

 Image289.OwnerScreen = &AIR_TWO;
 Image289.Order = 0;
 Image289.Left = 16;
 Image289.Top = 31;
 Image289.Width = 443;
 Image289.Height = 238;
 Image289.Picture_Type = 1;
 Image289.Picture_Ratio = 1;
 Image289.Picture_Name =  0x0049A926 ;
 Image289.Visible = 1;
 Image289.Active = 0;
 Image289.OnUpPtr = 0;
 Image289.OnDownPtr = 0;
 Image289.OnClickPtr = BackToHome;
 Image289.OnPressPtr = 0;

 Image324.OwnerScreen = &AIR_TWO;
 Image324.Order = 1;
 Image324.Left = 331;
 Image324.Top = 145;
 Image324.Width = 37;
 Image324.Height = 57;
 Image324.Picture_Type = 1;
 Image324.Picture_Ratio = 1;
 Image324.Picture_Name =  0x00457D88 ;
 Image324.Visible = 1;
 Image324.Active = 1;
 Image324.OnUpPtr = 0;
 Image324.OnDownPtr = 0;
 Image324.OnClickPtr = 0;
 Image324.OnPressPtr = 0;

 Image290.OwnerScreen = &AIR_TWO;
 Image290.Order = 2;
 Image290.Left = 398;
 Image290.Top = 108;
 Image290.Width = 23;
 Image290.Height = 26;
 Image290.Picture_Type = 1;
 Image290.Picture_Ratio = 1;
 Image290.Picture_Name =  0x004592BE ;
 Image290.Visible = 1;
 Image290.Active = 1;
 Image290.OnUpPtr = 0;
 Image290.OnDownPtr = 0;
 Image290.OnClickPtr = 0;
 Image290.OnPressPtr = 0;

 Image297.OwnerScreen = &AIR_TWO;
 Image297.Order = 3;
 Image297.Left = 263;
 Image297.Top = 232;
 Image297.Width = 27;
 Image297.Height = 24;
 Image297.Picture_Type = 1;
 Image297.Picture_Ratio = 1;
 Image297.Picture_Name =  0x004598BA ;
 Image297.Visible = 1;
 Image297.Active = 1;
 Image297.OnUpPtr = 0;
 Image297.OnDownPtr = 0;
 Image297.OnClickPtr = 0;
 Image297.OnPressPtr = 0;

 Image296.OwnerScreen = &AIR_TWO;
 Image296.Order = 4;
 Image296.Left = 263;
 Image296.Top = 111;
 Image296.Width = 27;
 Image296.Height = 24;
 Image296.Picture_Type = 1;
 Image296.Picture_Ratio = 1;
 Image296.Picture_Name =  0x004598BA ;
 Image296.Visible = 1;
 Image296.Active = 1;
 Image296.OnUpPtr = 0;
 Image296.OnDownPtr = 0;
 Image296.OnClickPtr = 0;
 Image296.OnPressPtr = 0;

 Image326.OwnerScreen = &AIR_TWO;
 Image326.Order = 5;
 Image326.Left = 134;
 Image326.Top = 177;
 Image326.Width = 9;
 Image326.Height = 18;
 Image326.Picture_Type = 1;
 Image326.Picture_Ratio = 1;
 Image326.Picture_Name =  0x00457C3E ;
 Image326.Visible = 0;
 Image326.Active = 1;
 Image326.OnUpPtr = 0;
 Image326.OnDownPtr = 0;
 Image326.OnClickPtr = 0;
 Image326.OnPressPtr = 0;

 Image327.OwnerScreen = &AIR_TWO;
 Image327.Order = 6;
 Image327.Left = 133;
 Image327.Top = 55;
 Image327.Width = 9;
 Image327.Height = 18;
 Image327.Picture_Type = 1;
 Image327.Picture_Ratio = 1;
 Image327.Picture_Name =  0x00457C3E ;
 Image327.Visible = 0;
 Image327.Active = 1;
 Image327.OnUpPtr = 0;
 Image327.OnDownPtr = 0;
 Image327.OnClickPtr = 0;
 Image327.OnPressPtr = 0;

 Image330.OwnerScreen = &AIR_TWO;
 Image330.Order = 7;
 Image330.Left = 91;
 Image330.Top = 84;
 Image330.Width = 25;
 Image330.Height = 24;
 Image330.Picture_Type = 1;
 Image330.Picture_Ratio = 1;
 Image330.Picture_Name =  0x00458E08 ;
 Image330.Visible = 1;
 Image330.Active = 1;
 Image330.OnUpPtr = 0;
 Image330.OnDownPtr = 0;
 Image330.OnClickPtr = 0;
 Image330.OnPressPtr = 0;

 Image329.OwnerScreen = &AIR_TWO;
 Image329.Order = 8;
 Image329.Left = 92;
 Image329.Top = 208;
 Image329.Width = 25;
 Image329.Height = 24;
 Image329.Picture_Type = 1;
 Image329.Picture_Ratio = 1;
 Image329.Picture_Name =  0x00458E08 ;
 Image329.Visible = 1;
 Image329.Active = 1;
 Image329.OnUpPtr = 0;
 Image329.OnDownPtr = 0;
 Image329.OnClickPtr = 0;
 Image329.OnPressPtr = 0;

 Image325.OwnerScreen = &AIR_TWO;
 Image325.Order = 9;
 Image325.Left = 134;
 Image325.Top = 177;
 Image325.Width = 9;
 Image325.Height = 18;
 Image325.Picture_Type = 1;
 Image325.Picture_Ratio = 1;
 Image325.Picture_Name =  0x00459770 ;
 Image325.Visible = 1;
 Image325.Active = 1;
 Image325.OnUpPtr = 0;
 Image325.OnDownPtr = 0;
 Image325.OnClickPtr = 0;
 Image325.OnPressPtr = 0;

 Image291.OwnerScreen = &AIR_TWO;
 Image291.Order = 10;
 Image291.Left = 133;
 Image291.Top = 55;
 Image291.Width = 9;
 Image291.Height = 18;
 Image291.Picture_Type = 1;
 Image291.Picture_Ratio = 1;
 Image291.Picture_Name =  0x00459770 ;
 Image291.Visible = 1;
 Image291.Active = 1;
 Image291.OnUpPtr = 0;
 Image291.OnDownPtr = 0;
 Image291.OnClickPtr = 0;
 Image291.OnPressPtr = 0;

 Label97.OwnerScreen = &AIR_TWO;
 Label97.Order = 11;
 Label97.Left = 205;
 Label97.Top = 5;
 Label97.Width = 81;
 Label97.Height = 20;
 Label97.Visible = 1;
 Label97.Active = 0;
 Label97.Caption = Label97_Caption;
 Label97.FontName =  0x0001FD49 ;
 Label97.Font_Color = 0xC618;
 Label97.VerticalText = 0;
 Label97.OnUpPtr = 0;
 Label97.OnDownPtr = 0;
 Label97.OnClickPtr = 0;
 Label97.OnPressPtr = 0;

 Image303.OwnerScreen = &AIR_TWO;
 Image303.Order = 12;
 Image303.Left = 0;
 Image303.Top = 0;
 Image303.Width = 480;
 Image303.Height = 28;
 Image303.Picture_Type = 1;
 Image303.Picture_Ratio = 1;
 Image303.Picture_Name =  0x002D7ADE ;
 Image303.Visible = 1;
 Image303.Active = 0;
 Image303.OnUpPtr = 0;
 Image303.OnDownPtr = 0;
 Image303.OnClickPtr = 0;
 Image303.OnPressPtr = 0;

 Label98.OwnerScreen = &AIR_TWO;
 Label98.Order = 13;
 Label98.Left = 207;
 Label98.Top = 4;
 Label98.Width = 82;
 Label98.Height = 20;
 Label98.Visible = 1;
 Label98.Active = 0;
 Label98.Caption = Label98_Caption;
 Label98.FontName =  0x00005242 ;
 Label98.Font_Color = 0xE7FC;
 Label98.VerticalText = 0;
 Label98.OnUpPtr = 0;
 Label98.OnDownPtr = 0;
 Label98.OnClickPtr = 0;
 Label98.OnPressPtr = 0;

 Image301.OwnerScreen = &AIR_TWO;
 Image301.Order = 14;
 Image301.Left = 92;
 Image301.Top = 208;
 Image301.Width = 25;
 Image301.Height = 24;
 Image301.Picture_Type = 1;
 Image301.Picture_Ratio = 1;
 Image301.Picture_Name =  0x00459DD0 ;
 Image301.Visible = 1;
 Image301.Active = 1;
 Image301.OnUpPtr = 0;
 Image301.OnDownPtr = 0;
 Image301.OnClickPtr = 0;
 Image301.OnPressPtr = 0;

 Image318.OwnerScreen = &AIR_TWO;
 Image318.Order = 15;
 Image318.Left = 263;
 Image318.Top = 232;
 Image318.Width = 27;
 Image318.Height = 24;
 Image318.Picture_Type = 1;
 Image318.Picture_Ratio = 1;
 Image318.Picture_Name =  0x0045A286 ;
 Image318.Visible = 1;
 Image318.Active = 1;
 Image318.OnUpPtr = 0;
 Image318.OnDownPtr = 0;
 Image318.OnClickPtr = 0;
 Image318.OnPressPtr = 0;

 Image320.OwnerScreen = &AIR_TWO;
 Image320.Order = 16;
 Image320.Left = 263;
 Image320.Top = 111;
 Image320.Width = 27;
 Image320.Height = 24;
 Image320.Picture_Type = 1;
 Image320.Picture_Ratio = 1;
 Image320.Picture_Name =  0x0045A286 ;
 Image320.Visible = 1;
 Image320.Active = 1;
 Image320.OnUpPtr = 0;
 Image320.OnDownPtr = 0;
 Image320.OnClickPtr = 0;
 Image320.OnPressPtr = 0;

 Image328.OwnerScreen = &AIR_TWO;
 Image328.Order = 17;
 Image328.Left = 91;
 Image328.Top = 84;
 Image328.Width = 25;
 Image328.Height = 24;
 Image328.Picture_Type = 1;
 Image328.Picture_Ratio = 1;
 Image328.Picture_Name =  0x00459DD0 ;
 Image328.Visible = 1;
 Image328.Active = 1;
 Image328.OnUpPtr = 0;
 Image328.OnDownPtr = 0;
 Image328.OnClickPtr = 0;
 Image328.OnPressPtr = 0;

 Image331.OwnerScreen = &AIR_TWO;
 Image331.Order = 18;
 Image331.Left = 398;
 Image331.Top = 108;
 Image331.Width = 23;
 Image331.Height = 26;
 Image331.Picture_Type = 1;
 Image331.Picture_Ratio = 1;
 Image331.Picture_Name =  0x00271B34 ;
 Image331.Visible = 1;
 Image331.Active = 1;
 Image331.OnUpPtr = 0;
 Image331.OnDownPtr = 0;
 Image331.OnClickPtr = 0;
 Image331.OnPressPtr = 0;

 Image322.OwnerScreen = &AIR_TWO;
 Image322.Order = 19;
 Image322.Left = 308;
 Image322.Top = 235;
 Image322.Width = 20;
 Image322.Height = 18;
 Image322.Picture_Type = 1;
 Image322.Picture_Ratio = 1;
 Image322.Picture_Name =  0x0045AA4A ;
 Image322.Visible = 1;
 Image322.Active = 1;
 Image322.OnUpPtr = 0;
 Image322.OnDownPtr = 0;
 Image322.OnClickPtr = 0;
 Image322.OnPressPtr = 0;

 Image321.OwnerScreen = &AIR_TWO;
 Image321.Order = 20;
 Image321.Left = 308;
 Image321.Top = 236;
 Image321.Width = 20;
 Image321.Height = 17;
 Image321.Picture_Type = 1;
 Image321.Picture_Ratio = 1;
 Image321.Picture_Name =  0x0045A79C ;
 Image321.Visible = 0;
 Image321.Active = 1;
 Image321.OnUpPtr = 0;
 Image321.OnDownPtr = 0;
 Image321.OnClickPtr = 0;
 Image321.OnPressPtr = 0;

 Image332.OwnerScreen = &AIR_TWO;
 Image332.Order = 21;
 Image332.Left = 315;
 Image332.Top = 73;
 Image332.Width = 20;
 Image332.Height = 20;
 Image332.Picture_Type = 1;
 Image332.Picture_Ratio = 1;
 Image332.Picture_Name =  0x002E0ECE ;
 Image332.Visible = 0;
 Image332.Active = 1;
 Image332.OnUpPtr = 0;
 Image332.OnDownPtr = 0;
 Image332.OnClickPtr = 0;
 Image332.OnPressPtr = 0;

 Image323.OwnerScreen = &AIR_TWO;
 Image323.Order = 22;
 Image323.Left = 331;
 Image323.Top = 145;
 Image323.Width = 37;
 Image323.Height = 57;
 Image323.Picture_Type = 1;
 Image323.Picture_Ratio = 1;
 Image323.Picture_Name =  0x0027923E ;
 Image323.Visible = 1;
 Image323.Active = 1;
 Image323.OnUpPtr = 0;
 Image323.OnDownPtr = 0;
 Image323.OnClickPtr = 0;
 Image323.OnPressPtr = 0;

 Image292.OwnerScreen = &AIR_TWO;
 Image292.Order = 23;
 Image292.Left = 26;
 Image292.Top = 41;
 Image292.Width = 25;
 Image292.Height = 93;
 Image292.Picture_Type = 1;
 Image292.Picture_Ratio = 1;
 Image292.Picture_Name =  0x004CE0E0 ;
 Image292.Visible = 1;
 Image292.Active = 1;
 Image292.OnUpPtr = 0;
 Image292.OnDownPtr = 0;
 Image292.OnClickPtr = 0;
 Image292.OnPressPtr = 0;

 Image293.OwnerScreen = &AIR_TWO;
 Image293.Order = 24;
 Image293.Left = 26;
 Image293.Top = 164;
 Image293.Width = 25;
 Image293.Height = 93;
 Image293.Picture_Type = 1;
 Image293.Picture_Ratio = 1;
 Image293.Picture_Name =  0x004CE0E0 ;
 Image293.Visible = 1;
 Image293.Active = 1;
 Image293.OnUpPtr = 0;
 Image293.OnDownPtr = 0;
 Image293.OnClickPtr = 0;
 Image293.OnPressPtr = 0;

 Image305.OwnerScreen = &AIR_TWO;
 Image305.Order = 25;
 Image305.Left = 26;
 Image305.Top = 41;
 Image305.Width = 25;
 Image305.Height = 93;
 Image305.Picture_Type = 1;
 Image305.Picture_Ratio = 1;
 Image305.Picture_Name =  0x004CF310 ;
 Image305.Visible = 1;
 Image305.Active = 1;
 Image305.OnUpPtr = 0;
 Image305.OnDownPtr = 0;
 Image305.OnClickPtr = 0;
 Image305.OnPressPtr = 0;

 Image319.OwnerScreen = &AIR_TWO;
 Image319.Order = 26;
 Image319.Left = 26;
 Image319.Top = 164;
 Image319.Width = 25;
 Image319.Height = 93;
 Image319.Picture_Type = 1;
 Image319.Picture_Ratio = 1;
 Image319.Picture_Name =  0x004CF310 ;
 Image319.Visible = 1;
 Image319.Active = 1;
 Image319.OnUpPtr = 0;
 Image319.OnDownPtr = 0;
 Image319.OnClickPtr = 0;
 Image319.OnPressPtr = 0;

 Button17.OwnerScreen = &AIR_TWO;
 Button17.Order = 27;
 Button17.Left = 205;
 Button17.Top = 175;
 Button17.Width = 20;
 Button17.Height = 18;
 Button17.Pen_Width = 0;
 Button17.Pen_Color = 0x0000;
 Button17.Visible = 1;
 Button17.Active = 1;
 Button17.Transparent = 1;
 Button17.Caption = Button17_Caption;
 Button17.TextAlign = _taRight;
 Button17.TextAlignVertical= _tavMiddle;
 Button17.FontName =  0x00003E9A ;
 Button17.PressColEnabled = 1;
 Button17.Font_Color = 0xFC10;
 Button17.VerticalText = 0;
 Button17.Gradient = 0;
 Button17.Gradient_Orientation = 0;
 Button17.Gradient_Start_Color = 0xFFFF;
 Button17.Gradient_End_Color = 0xC618;
 Button17.Color = 0xFFFF;
 Button17.Press_Color = 0xE71C;
 Button17.OnUpPtr = 0;
 Button17.OnDownPtr = 0;
 Button17.OnClickPtr = 0;
 Button17.OnPressPtr = 0;

 Button18.OwnerScreen = &AIR_TWO;
 Button18.Order = 28;
 Button18.Left = 208;
 Button18.Top = 218;
 Button18.Width = 19;
 Button18.Height = 18;
 Button18.Pen_Width = 0;
 Button18.Pen_Color = 0x0000;
 Button18.Visible = 1;
 Button18.Active = 1;
 Button18.Transparent = 1;
 Button18.Caption = Button18_Caption;
 Button18.TextAlign = _taRight;
 Button18.TextAlignVertical= _tavMiddle;
 Button18.FontName =  0x00003E9A ;
 Button18.PressColEnabled = 1;
 Button18.Font_Color = 0xFC10;
 Button18.VerticalText = 0;
 Button18.Gradient = 0;
 Button18.Gradient_Orientation = 0;
 Button18.Gradient_Start_Color = 0xFFFF;
 Button18.Gradient_End_Color = 0xC618;
 Button18.Color = 0xFFFF;
 Button18.Press_Color = 0xE71C;
 Button18.OnUpPtr = 0;
 Button18.OnDownPtr = 0;
 Button18.OnClickPtr = 0;
 Button18.OnPressPtr = 0;

 Button19.OwnerScreen = &AIR_TWO;
 Button19.Order = 29;
 Button19.Left = 350;
 Button19.Top = 73;
 Button19.Width = 22;
 Button19.Height = 18;
 Button19.Pen_Width = 0;
 Button19.Pen_Color = 0x0000;
 Button19.Visible = 1;
 Button19.Active = 1;
 Button19.Transparent = 1;
 Button19.Caption = Button19_Caption;
 Button19.TextAlign = _taRight;
 Button19.TextAlignVertical= _tavMiddle;
 Button19.FontName =  0x00003E9A ;
 Button19.PressColEnabled = 1;
 Button19.Font_Color = 0xF800;
 Button19.VerticalText = 0;
 Button19.Gradient = 0;
 Button19.Gradient_Orientation = 0;
 Button19.Gradient_Start_Color = 0xFFFF;
 Button19.Gradient_End_Color = 0xC618;
 Button19.Color = 0xFFFF;
 Button19.Press_Color = 0xE71C;
 Button19.OnUpPtr = 0;
 Button19.OnDownPtr = 0;
 Button19.OnClickPtr = 0;
 Button19.OnPressPtr = 0;

 Button20.OwnerScreen = &AIR_TWO;
 Button20.Order = 30;
 Button20.Left = 400;
 Button20.Top = 183;
 Button20.Width = 18;
 Button20.Height = 18;
 Button20.Pen_Width = 0;
 Button20.Pen_Color = 0x0000;
 Button20.Visible = 1;
 Button20.Active = 1;
 Button20.Transparent = 1;
 Button20.Caption = Button20_Caption;
 Button20.TextAlign = _taRight;
 Button20.TextAlignVertical= _tavMiddle;
 Button20.FontName =  0x00003E9A ;
 Button20.PressColEnabled = 1;
 Button20.Font_Color = 0xFC08;
 Button20.VerticalText = 0;
 Button20.Gradient = 0;
 Button20.Gradient_Orientation = 0;
 Button20.Gradient_Start_Color = 0xFFFF;
 Button20.Gradient_End_Color = 0xC618;
 Button20.Color = 0xFFFF;
 Button20.Press_Color = 0xE71C;
 Button20.OnUpPtr = 0;
 Button20.OnDownPtr = 0;
 Button20.OnClickPtr = 0;
 Button20.OnPressPtr = 0;

 Button22.OwnerScreen = &AIR_TWO;
 Button22.Order = 31;
 Button22.Left = 119;
 Button22.Top = 223;
 Button22.Width = 22;
 Button22.Height = 16;
 Button22.Pen_Width = 0;
 Button22.Pen_Color = 0x0000;
 Button22.Visible = 1;
 Button22.Active = 1;
 Button22.Transparent = 1;
 Button22.Caption = Button22_Caption;
 Button22.TextAlign = _taRight;
 Button22.TextAlignVertical= _tavMiddle;
 Button22.FontName =  0x0001EBD7 ;
 Button22.PressColEnabled = 1;
 Button22.Font_Color = 0xF81F;
 Button22.VerticalText = 0;
 Button22.Gradient = 0;
 Button22.Gradient_Orientation = 0;
 Button22.Gradient_Start_Color = 0xFFFF;
 Button22.Gradient_End_Color = 0xC618;
 Button22.Color = 0xFFFF;
 Button22.Press_Color = 0xE71C;
 Button22.OnUpPtr = 0;
 Button22.OnDownPtr = 0;
 Button22.OnClickPtr = 0;
 Button22.OnPressPtr = 0;

 Button23.OwnerScreen = &AIR_TWO;
 Button23.Order = 32;
 Button23.Left = 79;
 Button23.Top = 247;
 Button23.Width = 17;
 Button23.Height = 18;
 Button23.Pen_Width = 0;
 Button23.Pen_Color = 0x0000;
 Button23.Visible = 1;
 Button23.Active = 1;
 Button23.Transparent = 1;
 Button23.Caption = Button23_Caption;
 Button23.TextAlign = _taRight;
 Button23.TextAlignVertical= _tavMiddle;
 Button23.FontName =  0x00003E9A ;
 Button23.PressColEnabled = 1;
 Button23.Font_Color = 0x8208;
 Button23.VerticalText = 0;
 Button23.Gradient = 0;
 Button23.Gradient_Orientation = 0;
 Button23.Gradient_Start_Color = 0xFFFF;
 Button23.Gradient_End_Color = 0xC618;
 Button23.Color = 0xFFFF;
 Button23.Press_Color = 0xE71C;
 Button23.OnUpPtr = 0;
 Button23.OnDownPtr = 0;
 Button23.OnClickPtr = 0;
 Button23.OnPressPtr = 0;

 Button25.OwnerScreen = &AIR_TWO;
 Button25.Order = 33;
 Button25.Left = 251;
 Button25.Top = 213;
 Button25.Width = 43;
 Button25.Height = 18;
 Button25.Pen_Width = 0;
 Button25.Pen_Color = 0x0000;
 Button25.Visible = 0;
 Button25.Active = 1;
 Button25.Transparent = 1;
 Button25.Caption = Button25_Caption;
 Button25.TextAlign = _taRight;
 Button25.TextAlignVertical= _tavMiddle;
 Button25.FontName =  0x00003E9A ;
 Button25.PressColEnabled = 1;
 Button25.Font_Color = 0x8408;
 Button25.VerticalText = 0;
 Button25.Gradient = 0;
 Button25.Gradient_Orientation = 0;
 Button25.Gradient_Start_Color = 0xFFFF;
 Button25.Gradient_End_Color = 0xC618;
 Button25.Color = 0xFFFF;
 Button25.Press_Color = 0xE71C;
 Button25.OnUpPtr = 0;
 Button25.OnDownPtr = 0;
 Button25.OnClickPtr = 0;
 Button25.OnPressPtr = 0;

 Button28.OwnerScreen = &AIR_TWO;
 Button28.Order = 34;
 Button28.Left = 206;
 Button28.Top = 53;
 Button28.Width = 19;
 Button28.Height = 18;
 Button28.Pen_Width = 0;
 Button28.Pen_Color = 0x0000;
 Button28.Visible = 1;
 Button28.Active = 1;
 Button28.Transparent = 1;
 Button28.Caption = Button28_Caption;
 Button28.TextAlign = _taRight;
 Button28.TextAlignVertical= _tavMiddle;
 Button28.FontName =  0x00003E9A ;
 Button28.PressColEnabled = 1;
 Button28.Font_Color = 0xFC10;
 Button28.VerticalText = 0;
 Button28.Gradient = 0;
 Button28.Gradient_Orientation = 0;
 Button28.Gradient_Start_Color = 0xFFFF;
 Button28.Gradient_End_Color = 0xC618;
 Button28.Color = 0xFFFF;
 Button28.Press_Color = 0xE71C;
 Button28.OnUpPtr = 0;
 Button28.OnDownPtr = 0;
 Button28.OnClickPtr = 0;
 Button28.OnPressPtr = 0;

 Button29.OwnerScreen = &AIR_TWO;
 Button29.Order = 35;
 Button29.Left = 206;
 Button29.Top = 100;
 Button29.Width = 22;
 Button29.Height = 17;
 Button29.Pen_Width = 0;
 Button29.Pen_Color = 0x0000;
 Button29.Visible = 1;
 Button29.Active = 1;
 Button29.Transparent = 1;
 Button29.Caption = Button29_Caption;
 Button29.TextAlign = _taRight;
 Button29.TextAlignVertical= _tavMiddle;
 Button29.FontName =  0x00003E9A ;
 Button29.PressColEnabled = 1;
 Button29.Font_Color = 0xFC10;
 Button29.VerticalText = 0;
 Button29.Gradient = 0;
 Button29.Gradient_Orientation = 0;
 Button29.Gradient_Start_Color = 0xFFFF;
 Button29.Gradient_End_Color = 0xC618;
 Button29.Color = 0xFFFF;
 Button29.Press_Color = 0xE71C;
 Button29.OnUpPtr = 0;
 Button29.OnDownPtr = 0;
 Button29.OnClickPtr = 0;
 Button29.OnPressPtr = 0;

 Button30.OwnerScreen = &AIR_TWO;
 Button30.Order = 36;
 Button30.Left = 117;
 Button30.Top = 100;
 Button30.Width = 24;
 Button30.Height = 18;
 Button30.Pen_Width = 0;
 Button30.Pen_Color = 0x0000;
 Button30.Visible = 1;
 Button30.Active = 1;
 Button30.Transparent = 1;
 Button30.Caption = Button30_Caption;
 Button30.TextAlign = _taRight;
 Button30.TextAlignVertical= _tavMiddle;
 Button30.FontName =  0x00003E9A ;
 Button30.PressColEnabled = 1;
 Button30.Font_Color = 0xF81F;
 Button30.VerticalText = 0;
 Button30.Gradient = 0;
 Button30.Gradient_Orientation = 0;
 Button30.Gradient_Start_Color = 0xFFFF;
 Button30.Gradient_End_Color = 0xC618;
 Button30.Color = 0xFFFF;
 Button30.Press_Color = 0xE71C;
 Button30.OnUpPtr = 0;
 Button30.OnDownPtr = 0;
 Button30.OnClickPtr = 0;
 Button30.OnPressPtr = 0;

 Button31.OwnerScreen = &AIR_TWO;
 Button31.Order = 37;
 Button31.Left = 80;
 Button31.Top = 125;
 Button31.Width = 17;
 Button31.Height = 18;
 Button31.Pen_Width = 0;
 Button31.Pen_Color = 0x0000;
 Button31.Visible = 1;
 Button31.Active = 1;
 Button31.Transparent = 1;
 Button31.Caption = Button31_Caption;
 Button31.TextAlign = _taRight;
 Button31.TextAlignVertical= _tavMiddle;
 Button31.FontName =  0x00003E9A ;
 Button31.PressColEnabled = 1;
 Button31.Font_Color = 0x8208;
 Button31.VerticalText = 0;
 Button31.Gradient = 0;
 Button31.Gradient_Orientation = 0;
 Button31.Gradient_Start_Color = 0xFFFF;
 Button31.Gradient_End_Color = 0xC618;
 Button31.Color = 0xFFFF;
 Button31.Press_Color = 0xE71C;
 Button31.OnUpPtr = 0;
 Button31.OnDownPtr = 0;
 Button31.OnClickPtr = 0;
 Button31.OnPressPtr = 0;

 Button33.OwnerScreen = &AIR_TWO;
 Button33.Order = 38;
 Button33.Left = 252;
 Button33.Top = 92;
 Button33.Width = 41;
 Button33.Height = 18;
 Button33.Pen_Width = 0;
 Button33.Pen_Color = 0x0000;
 Button33.Visible = 0;
 Button33.Active = 1;
 Button33.Transparent = 1;
 Button33.Caption = Button33_Caption;
 Button33.TextAlign = _taRight;
 Button33.TextAlignVertical= _tavMiddle;
 Button33.FontName =  0x00003E9A ;
 Button33.PressColEnabled = 1;
 Button33.Font_Color = 0x8408;
 Button33.VerticalText = 0;
 Button33.Gradient = 0;
 Button33.Gradient_Orientation = 0;
 Button33.Gradient_Start_Color = 0xFFFF;
 Button33.Gradient_End_Color = 0xC618;
 Button33.Color = 0xFFFF;
 Button33.Press_Color = 0xE71C;
 Button33.OnUpPtr = 0;
 Button33.OnDownPtr = 0;
 Button33.OnClickPtr = 0;
 Button33.OnPressPtr = 0;

 Button34.OwnerScreen = &AIR_TWO;
 Button34.Order = 39;
 Button34.Left = 414;
 Button34.Top = 82;
 Button34.Width = 27;
 Button34.Height = 17;
 Button34.Pen_Width = 0;
 Button34.Pen_Color = 0x0000;
 Button34.Visible = 1;
 Button34.Active = 1;
 Button34.Transparent = 1;
 Button34.Caption = Button34_Caption;
 Button34.TextAlign = _taRight;
 Button34.TextAlignVertical= _tavMiddle;
 Button34.FontName =  0x00003E9A ;
 Button34.PressColEnabled = 1;
 Button34.Font_Color = 0xB5A0;
 Button34.VerticalText = 0;
 Button34.Gradient = 0;
 Button34.Gradient_Orientation = 0;
 Button34.Gradient_Start_Color = 0xFFFF;
 Button34.Gradient_End_Color = 0xC618;
 Button34.Color = 0xFFFF;
 Button34.Press_Color = 0xE71C;
 Button34.OnUpPtr = 0;
 Button34.OnDownPtr = 0;
 Button34.OnClickPtr = 0;
 Button34.OnPressPtr = 0;

 Button16.OwnerScreen = &AIR_TWO;
 Button16.Order = 40;
 Button16.Left = 25;
 Button16.Top = 166;
 Button16.Width = 16;
 Button16.Height = 18;
 Button16.Pen_Width = 0;
 Button16.Pen_Color = 0x0000;
 Button16.Visible = 1;
 Button16.Active = 1;
 Button16.Transparent = 1;
 Button16.Caption = Button16_Caption;
 Button16.TextAlign = _taRight;
 Button16.TextAlignVertical= _tavMiddle;
 Button16.FontName =  0x00003E9A ;
 Button16.PressColEnabled = 1;
 Button16.Font_Color = 0x001F;
 Button16.VerticalText = 0;
 Button16.Gradient = 0;
 Button16.Gradient_Orientation = 0;
 Button16.Gradient_Start_Color = 0xFFFF;
 Button16.Gradient_End_Color = 0xC618;
 Button16.Color = 0xFFFF;
 Button16.Press_Color = 0xE71C;
 Button16.OnUpPtr = 0;
 Button16.OnDownPtr = 0;
 Button16.OnClickPtr = 0;
 Button16.OnPressPtr = 0;

 Image299.OwnerScreen = &AIR_TWO;
 Image299.Order = 41;
 Image299.Left = 315;
 Image299.Top = 73;
 Image299.Width = 20;
 Image299.Height = 20;
 Image299.Picture_Type = 1;
 Image299.Picture_Ratio = 1;
 Image299.Picture_Name =  0x002E2E3C ;
 Image299.Visible = 1;
 Image299.Active = 1;
 Image299.OnUpPtr = 0;
 Image299.OnDownPtr = 0;
 Image299.OnClickPtr = 0;
 Image299.OnPressPtr = 0;

 Button6.OwnerScreen = &AIR_TWO;
 Button6.Order = 42;
 Button6.Left = 23;
 Button6.Top = 40;
 Button6.Width = 16;
 Button6.Height = 18;
 Button6.Pen_Width = 0;
 Button6.Pen_Color = 0x0000;
 Button6.Visible = 1;
 Button6.Active = 1;
 Button6.Transparent = 1;
 Button6.Caption = Button6_Caption;
 Button6.TextAlign = _taRight;
 Button6.TextAlignVertical= _tavMiddle;
 Button6.FontName =  0x00003E9A ;
 Button6.PressColEnabled = 1;
 Button6.Font_Color = 0x001F;
 Button6.VerticalText = 0;
 Button6.Gradient = 0;
 Button6.Gradient_Orientation = 0;
 Button6.Gradient_Start_Color = 0xFFFF;
 Button6.Gradient_End_Color = 0xC618;
 Button6.Color = 0xFFFF;
 Button6.Press_Color = 0xE71C;
 Button6.OnUpPtr = 0;
 Button6.OnDownPtr = 0;
 Button6.OnClickPtr = 0;
 Button6.OnPressPtr = 0;

 Image333.OwnerScreen = &AIR_ONE;
 Image333.Order = 0;
 Image333.Left = 6;
 Image333.Top = 38;
 Image333.Width = 466;
 Image333.Height = 231;
 Image333.Picture_Type = 1;
 Image333.Picture_Ratio = 1;
 Image333.Picture_Name =  0x004D0540 ;
 Image333.Visible = 1;
 Image333.Active = 0;
 Image333.OnUpPtr = 0;
 Image333.OnDownPtr = 0;
 Image333.OnClickPtr = BackToHome;
 Image333.OnPressPtr = 0;

 Image336.OwnerScreen = &AIR_ONE;
 Image336.Order = 1;
 Image336.Left = 170;
 Image336.Top = 73;
 Image336.Width = 16;
 Image336.Height = 34;
 Image336.Picture_Type = 1;
 Image336.Picture_Ratio = 1;
 Image336.Picture_Name =  0x002DE3E4 ;
 Image336.Visible = 1;
 Image336.Active = 1;
 Image336.OnUpPtr = 0;
 Image336.OnDownPtr = 0;
 Image336.OnClickPtr = 0;
 Image336.OnPressPtr = 0;

 Image339.OwnerScreen = &AIR_ONE;
 Image339.Order = 2;
 Image339.Left = 156;
 Image339.Top = 128;
 Image339.Width = 37;
 Image339.Height = 38;
 Image339.Picture_Type = 1;
 Image339.Picture_Ratio = 1;
 Image339.Picture_Name =  0x002DF1C0 ;
 Image339.Visible = 1;
 Image339.Active = 1;
 Image339.OnUpPtr = 0;
 Image339.OnDownPtr = 0;
 Image339.OnClickPtr = 0;
 Image339.OnPressPtr = 0;

 Image338.OwnerScreen = &AIR_ONE;
 Image338.Order = 3;
 Image338.Left = 316;
 Image338.Top = 218;
 Image338.Width = 36;
 Image338.Height = 34;
 Image338.Picture_Type = 1;
 Image338.Picture_Ratio = 1;
 Image338.Picture_Name =  0x002DE82A ;
 Image338.Visible = 1;
 Image338.Active = 1;
 Image338.OnUpPtr = 0;
 Image338.OnDownPtr = 0;
 Image338.OnClickPtr = 0;
 Image338.OnPressPtr = 0;

 Image343.OwnerScreen = &AIR_ONE;
 Image343.Order = 4;
 Image343.Left = 342;
 Image343.Top = 91;
 Image343.Width = 20;
 Image343.Height = 20;
 Image343.Picture_Type = 1;
 Image343.Picture_Ratio = 1;
 Image343.Picture_Name =  0x002E0ECE ;
 Image343.Visible = 1;
 Image343.Active = 1;
 Image343.OnUpPtr = 0;
 Image343.OnDownPtr = 0;
 Image343.OnClickPtr = 0;
 Image343.OnPressPtr = 0;

 Image342.OwnerScreen = &AIR_ONE;
 Image342.Order = 5;
 Image342.Left = 422;
 Image342.Top = 114;
 Image342.Width = 36;
 Image342.Height = 34;
 Image342.Picture_Type = 1;
 Image342.Picture_Ratio = 1;
 Image342.Picture_Name =  0x002DE82A ;
 Image342.Visible = 1;
 Image342.Active = 1;
 Image342.OnUpPtr = 0;
 Image342.OnDownPtr = 0;
 Image342.OnClickPtr = 0;
 Image342.OnPressPtr = 0;

 Image341.OwnerScreen = &AIR_ONE;
 Image341.Order = 6;
 Image341.Left = 423;
 Image341.Top = 154;
 Image341.Width = 36;
 Image341.Height = 53;
 Image341.Picture_Type = 1;
 Image341.Picture_Ratio = 1;
 Image341.Picture_Name =  0x002DFFE0 ;
 Image341.Visible = 1;
 Image341.Active = 1;
 Image341.OnUpPtr = 0;
 Image341.OnDownPtr = 0;
 Image341.OnClickPtr = 0;
 Image341.OnPressPtr = 0;

 Image352.OwnerScreen = &AIR_ONE;
 Image352.Order = 7;
 Image352.Left = 28;
 Image352.Top = 58;
 Image352.Width = 60;
 Image352.Height = 194;
 Image352.Picture_Type = 1;
 Image352.Picture_Ratio = 1;
 Image352.Picture_Name =  0x00504E42 ;
 Image352.Visible = 1;
 Image352.Active = 1;
 Image352.OnUpPtr = 0;
 Image352.OnDownPtr = 0;
 Image352.OnClickPtr = 0;
 Image352.OnPressPtr = 0;

 Image334.OwnerScreen = &AIR_ONE;
 Image334.Order = 8;
 Image334.Left = 0;
 Image334.Top = 0;
 Image334.Width = 480;
 Image334.Height = 28;
 Image334.Picture_Type = 1;
 Image334.Picture_Ratio = 1;
 Image334.Picture_Name =  0x002D7ADE ;
 Image334.Visible = 1;
 Image334.Active = 0;
 Image334.OnUpPtr = 0;
 Image334.OnDownPtr = 0;
 Image334.OnClickPtr = 0;
 Image334.OnPressPtr = 0;

 Label99.OwnerScreen = &AIR_ONE;
 Label99.Order = 9;
 Label99.Left = 207;
 Label99.Top = 5;
 Label99.Width = 82;
 Label99.Height = 20;
 Label99.Visible = 1;
 Label99.Active = 0;
 Label99.Caption = Label99_Caption;
 Label99.FontName =  0x00005242 ;
 Label99.Font_Color = 0xE7FC;
 Label99.VerticalText = 0;
 Label99.OnUpPtr = 0;
 Label99.OnDownPtr = 0;
 Label99.OnClickPtr = 0;
 Label99.OnPressPtr = 0;

 Image358.OwnerScreen = &AIR_ONE;
 Image358.Order = 10;
 Image358.Left = 170;
 Image358.Top = 73;
 Image358.Width = 16;
 Image358.Height = 35;
 Image358.Picture_Type = 1;
 Image358.Picture_Ratio = 1;
 Image358.Picture_Name =  0x002E1B8A ;
 Image358.Visible = 1;
 Image358.Active = 1;
 Image358.OnUpPtr = 0;
 Image358.OnDownPtr = 0;
 Image358.OnClickPtr = 0;
 Image358.OnPressPtr = 0;

 Image360.OwnerScreen = &AIR_ONE;
 Image360.Order = 11;
 Image360.Left = 156;
 Image360.Top = 129;
 Image360.Width = 38;
 Image360.Height = 37;
 Image360.Picture_Type = 1;
 Image360.Picture_Ratio = 1;
 Image360.Picture_Name =  0x002E1FF0 ;
 Image360.Visible = 1;
 Image360.Active = 1;
 Image360.OnUpPtr = 0;
 Image360.OnDownPtr = 0;
 Image360.OnClickPtr = 0;
 Image360.OnPressPtr = 0;

 Image362.OwnerScreen = &AIR_ONE;
 Image362.Order = 12;
 Image362.Left = 316;
 Image362.Top = 218;
 Image362.Width = 36;
 Image362.Height = 34;
 Image362.Picture_Type = 1;
 Image362.Picture_Ratio = 1;
 Image362.Picture_Name =  0x002E11F4 ;
 Image362.Visible = 1;
 Image362.Active = 1;
 Image362.OnUpPtr = 0;
 Image362.OnDownPtr = 0;
 Image362.OnClickPtr = 0;
 Image362.OnPressPtr = 0;

 Image365.OwnerScreen = &AIR_ONE;
 Image365.Order = 13;
 Image365.Left = 422;
 Image365.Top = 114;
 Image365.Width = 36;
 Image365.Height = 34;
 Image365.Picture_Type = 1;
 Image365.Picture_Ratio = 1;
 Image365.Picture_Name =  0x002E11F4 ;
 Image365.Visible = 1;
 Image365.Active = 1;
 Image365.OnUpPtr = 0;
 Image365.OnDownPtr = 0;
 Image365.OnClickPtr = 0;
 Image365.OnPressPtr = 0;

 Image367.OwnerScreen = &AIR_ONE;
 Image367.Order = 14;
 Image367.Left = 342;
 Image367.Top = 91;
 Image367.Width = 20;
 Image367.Height = 20;
 Image367.Picture_Type = 1;
 Image367.Picture_Ratio = 1;
 Image367.Picture_Name =  0x002E2E3C ;
 Image367.Visible = 1;
 Image367.Active = 1;
 Image367.OnUpPtr = 0;
 Image367.OnDownPtr = 0;
 Image367.OnClickPtr = 0;
 Image367.OnPressPtr = 0;

 Image368.OwnerScreen = &AIR_ONE;
 Image368.Order = 15;
 Image368.Left = 423;
 Image368.Top = 154;
 Image368.Width = 36;
 Image368.Height = 55;
 Image368.Picture_Type = 1;
 Image368.Picture_Ratio = 1;
 Image368.Picture_Name =  0x002E3162 ;
 Image368.Visible = 1;
 Image368.Active = 1;
 Image368.OnUpPtr = 0;
 Image368.OnDownPtr = 0;
 Image368.OnClickPtr = 0;
 Image368.OnPressPtr = 0;

 Image361.OwnerScreen = &AIR_ONE;
 Image361.Order = 16;
 Image361.Left = 314;
 Image361.Top = 55;
 Image361.Width = 22;
 Image361.Height = 19;
 Image361.Picture_Type = 1;
 Image361.Picture_Ratio = 1;
 Image361.Picture_Name =  0x002E2AF2 ;
 Image361.Visible = 1;
 Image361.Active = 1;
 Image361.OnUpPtr = 0;
 Image361.OnDownPtr = 0;
 Image361.OnClickPtr = 0;
 Image361.OnPressPtr = 0;

 Image340.OwnerScreen = &AIR_ONE;
 Image340.Order = 17;
 Image340.Left = 314;
 Image340.Top = 56;
 Image340.Width = 22;
 Image340.Height = 18;
 Image340.Picture_Type = 1;
 Image340.Picture_Ratio = 1;
 Image340.Picture_Name =  0x002DFCC2 ;
 Image340.Visible = 1;
 Image340.Active = 1;
 Image340.OnUpPtr = 0;
 Image340.OnDownPtr = 0;
 Image340.OnClickPtr = 0;
 Image340.OnPressPtr = 0;

 Image337.OwnerScreen = &AIR_ONE;
 Image337.Order = 18;
 Image337.Left = 28;
 Image337.Top = 58;
 Image337.Width = 60;
 Image337.Height = 194;
 Image337.Picture_Type = 1;
 Image337.Picture_Ratio = 1;
 Image337.Picture_Name =  0x0050A938 ;
 Image337.Visible = 1;
 Image337.Active = 1;
 Image337.OnUpPtr = 0;
 Image337.OnDownPtr = 0;
 Image337.OnClickPtr = 0;
 Image337.OnPressPtr = 0;

 Button14.OwnerScreen = &AIR_ONE;
 Button14.Order = 19;
 Button14.Left = 35;
 Button14.Top = 53;
 Button14.Width = 33;
 Button14.Height = 26;
 Button14.Pen_Width = 0;
 Button14.Pen_Color = 0x0000;
 Button14.Visible = 1;
 Button14.Active = 1;
 Button14.Transparent = 1;
 Button14.Caption = Button14_Caption;
 Button14.TextAlign = _taRight;
 Button14.TextAlignVertical= _tavMiddle;
 Button14.FontName =  0x00003E9A ;
 Button14.PressColEnabled = 1;
 Button14.Font_Color = 0x001F;
 Button14.VerticalText = 0;
 Button14.Gradient = 0;
 Button14.Gradient_Orientation = 0;
 Button14.Gradient_Start_Color = 0xFFFF;
 Button14.Gradient_End_Color = 0xC618;
 Button14.Color = 0xFFFF;
 Button14.Press_Color = 0xE71C;
 Button14.OnUpPtr = 0;
 Button14.OnDownPtr = 0;
 Button14.OnClickPtr = 0;
 Button14.OnPressPtr = 0;

 Button26.OwnerScreen = &AIR_ONE;
 Button26.Order = 20;
 Button26.Left = 279;
 Button26.Top = 69;
 Button26.Width = 18;
 Button26.Height = 18;
 Button26.Pen_Width = 0;
 Button26.Pen_Color = 0x0000;
 Button26.Visible = 1;
 Button26.Active = 1;
 Button26.Transparent = 1;
 Button26.Caption = Button26_Caption;
 Button26.TextAlign = _taRight;
 Button26.TextAlignVertical= _tavMiddle;
 Button26.FontName =  0x00003E9A ;
 Button26.PressColEnabled = 1;
 Button26.Font_Color = 0xFC10;
 Button26.VerticalText = 0;
 Button26.Gradient = 0;
 Button26.Gradient_Orientation = 0;
 Button26.Gradient_Start_Color = 0xFFFF;
 Button26.Gradient_End_Color = 0xC618;
 Button26.Color = 0xFFFF;
 Button26.Press_Color = 0xE71C;
 Button26.OnUpPtr = 0;
 Button26.OnDownPtr = 0;
 Button26.OnClickPtr = 0;
 Button26.OnPressPtr = 0;

 Button27.OwnerScreen = &AIR_ONE;
 Button27.Order = 21;
 Button27.Left = 280;
 Button27.Top = 202;
 Button27.Width = 21;
 Button27.Height = 18;
 Button27.Pen_Width = 0;
 Button27.Pen_Color = 0x0000;
 Button27.Visible = 1;
 Button27.Active = 1;
 Button27.Transparent = 1;
 Button27.Caption = Button27_Caption;
 Button27.TextAlign = _taRight;
 Button27.TextAlignVertical= _tavMiddle;
 Button27.FontName =  0x00003E9A ;
 Button27.PressColEnabled = 1;
 Button27.Font_Color = 0xFC10;
 Button27.VerticalText = 0;
 Button27.Gradient = 0;
 Button27.Gradient_Orientation = 0;
 Button27.Gradient_Start_Color = 0xFFFF;
 Button27.Gradient_End_Color = 0xC618;
 Button27.Color = 0xFFFF;
 Button27.Press_Color = 0xE71C;
 Button27.OnUpPtr = 0;
 Button27.OnDownPtr = 0;
 Button27.OnClickPtr = 0;
 Button27.OnPressPtr = 0;

 Button32.OwnerScreen = &AIR_ONE;
 Button32.Order = 22;
 Button32.Left = 376;
 Button32.Top = 56;
 Button32.Width = 22;
 Button32.Height = 21;
 Button32.Pen_Width = 0;
 Button32.Pen_Color = 0x0000;
 Button32.Visible = 1;
 Button32.Active = 1;
 Button32.Transparent = 1;
 Button32.Caption = Button32_Caption;
 Button32.TextAlign = _taRight;
 Button32.TextAlignVertical= _tavMiddle;
 Button32.FontName =  0x00003E9A ;
 Button32.PressColEnabled = 1;
 Button32.Font_Color = 0xF800;
 Button32.VerticalText = 0;
 Button32.Gradient = 0;
 Button32.Gradient_Orientation = 0;
 Button32.Gradient_Start_Color = 0xFFFF;
 Button32.Gradient_End_Color = 0xC618;
 Button32.Color = 0xFFFF;
 Button32.Press_Color = 0xE71C;
 Button32.OnUpPtr = 0;
 Button32.OnDownPtr = 0;
 Button32.OnClickPtr = 0;
 Button32.OnPressPtr = 0;

 Button35.OwnerScreen = &AIR_ONE;
 Button35.Order = 23;
 Button35.Left = 378;
 Button35.Top = 191;
 Button35.Width = 19;
 Button35.Height = 18;
 Button35.Pen_Width = 0;
 Button35.Pen_Color = 0x0000;
 Button35.Visible = 1;
 Button35.Active = 1;
 Button35.Transparent = 1;
 Button35.Caption = Button35_Caption;
 Button35.TextAlign = _taRight;
 Button35.TextAlignVertical= _tavMiddle;
 Button35.FontName =  0x00003E9A ;
 Button35.PressColEnabled = 1;
 Button35.Font_Color = 0xFC08;
 Button35.VerticalText = 0;
 Button35.Gradient = 0;
 Button35.Gradient_Orientation = 0;
 Button35.Gradient_Start_Color = 0xFFFF;
 Button35.Gradient_End_Color = 0xC618;
 Button35.Color = 0xFFFF;
 Button35.Press_Color = 0xE71C;
 Button35.OnUpPtr = 0;
 Button35.OnDownPtr = 0;
 Button35.OnClickPtr = 0;
 Button35.OnPressPtr = 0;

 Button36.OwnerScreen = &AIR_ONE;
 Button36.Order = 24;
 Button36.Left = 140;
 Button36.Top = 168;
 Button36.Width = 27;
 Button36.Height = 17;
 Button36.Pen_Width = 0;
 Button36.Pen_Color = 0x0000;
 Button36.Visible = 1;
 Button36.Active = 1;
 Button36.Transparent = 1;
 Button36.Caption = Button36_Caption;
 Button36.TextAlign = _taRight;
 Button36.TextAlignVertical= _tavMiddle;
 Button36.FontName =  0x00003E9A ;
 Button36.PressColEnabled = 1;
 Button36.Font_Color = 0xF81F;
 Button36.VerticalText = 0;
 Button36.Gradient = 0;
 Button36.Gradient_Orientation = 0;
 Button36.Gradient_Start_Color = 0xFFFF;
 Button36.Gradient_End_Color = 0xC618;
 Button36.Color = 0xFFFF;
 Button36.Press_Color = 0xE71C;
 Button36.OnUpPtr = 0;
 Button36.OnDownPtr = 0;
 Button36.OnClickPtr = 0;
 Button36.OnPressPtr = 0;

 Button37.OwnerScreen = &AIR_ONE;
 Button37.Order = 25;
 Button37.Left = 128;
 Button37.Top = 105;
 Button37.Width = 19;
 Button37.Height = 19;
 Button37.Pen_Width = 0;
 Button37.Pen_Color = 0x0000;
 Button37.Visible = 1;
 Button37.Active = 1;
 Button37.Transparent = 1;
 Button37.Caption = Button37_Caption;
 Button37.TextAlign = _taRight;
 Button37.TextAlignVertical= _tavMiddle;
 Button37.FontName =  0x00003E9A ;
 Button37.PressColEnabled = 1;
 Button37.Font_Color = 0x0400;
 Button37.VerticalText = 0;
 Button37.Gradient = 0;
 Button37.Gradient_Orientation = 0;
 Button37.Gradient_Start_Color = 0xFFFF;
 Button37.Gradient_End_Color = 0xC618;
 Button37.Color = 0xFFFF;
 Button37.Press_Color = 0xE71C;
 Button37.OnUpPtr = 0;
 Button37.OnDownPtr = 0;
 Button37.OnClickPtr = 0;
 Button37.OnPressPtr = 0;

 Button38.OwnerScreen = &AIR_ONE;
 Button38.Order = 26;
 Button38.Left = 200;
 Button38.Top = 106;
 Button38.Width = 19;
 Button38.Height = 18;
 Button38.Pen_Width = 0;
 Button38.Pen_Color = 0x0000;
 Button38.Visible = 1;
 Button38.Active = 1;
 Button38.Transparent = 1;
 Button38.Caption = Button38_Caption;
 Button38.TextAlign = _taRight;
 Button38.TextAlignVertical= _tavMiddle;
 Button38.FontName =  0x00003E9A ;
 Button38.PressColEnabled = 1;
 Button38.Font_Color = 0x0400;
 Button38.VerticalText = 0;
 Button38.Gradient = 0;
 Button38.Gradient_Orientation = 0;
 Button38.Gradient_Start_Color = 0xFFFF;
 Button38.Gradient_End_Color = 0xC618;
 Button38.Color = 0xFFFF;
 Button38.Press_Color = 0xE71C;
 Button38.OnUpPtr = 0;
 Button38.OnDownPtr = 0;
 Button38.OnClickPtr = 0;
 Button38.OnPressPtr = 0;

 Button39.OwnerScreen = &AIR_ONE;
 Button39.Order = 27;
 Button39.Left = 139;
 Button39.Top = 210;
 Button39.Width = 19;
 Button39.Height = 18;
 Button39.Pen_Width = 0;
 Button39.Pen_Color = 0x0000;
 Button39.Visible = 1;
 Button39.Active = 1;
 Button39.Transparent = 1;
 Button39.Caption = Button39_Caption;
 Button39.TextAlign = _taRight;
 Button39.TextAlignVertical= _tavMiddle;
 Button39.FontName =  0x00003E9A ;
 Button39.PressColEnabled = 1;
 Button39.Font_Color = 0x8208;
 Button39.VerticalText = 0;
 Button39.Gradient = 0;
 Button39.Gradient_Orientation = 0;
 Button39.Gradient_Start_Color = 0xFFFF;
 Button39.Gradient_End_Color = 0xC618;
 Button39.Color = 0xFFFF;
 Button39.Press_Color = 0xE71C;
 Button39.OnUpPtr = 0;
 Button39.OnDownPtr = 0;
 Button39.OnClickPtr = 0;
 Button39.OnPressPtr = 0;

 Button41.OwnerScreen = &AIR_ONE;
 Button41.Order = 28;
 Button41.Left = 313;
 Button41.Top = 197;
 Button41.Width = 40;
 Button41.Height = 18;
 Button41.Pen_Width = 0;
 Button41.Pen_Color = 0x0000;
 Button41.Visible = 0;
 Button41.Active = 1;
 Button41.Transparent = 1;
 Button41.Caption = Button41_Caption;
 Button41.TextAlign = _taRight;
 Button41.TextAlignVertical= _tavMiddle;
 Button41.FontName =  0x00003E9A ;
 Button41.PressColEnabled = 1;
 Button41.Font_Color = 0x8408;
 Button41.VerticalText = 0;
 Button41.Gradient = 0;
 Button41.Gradient_Orientation = 0;
 Button41.Gradient_Start_Color = 0xFFFF;
 Button41.Gradient_End_Color = 0xC618;
 Button41.Color = 0xFFFF;
 Button41.Press_Color = 0xE71C;
 Button41.OnUpPtr = 0;
 Button41.OnDownPtr = 0;
 Button41.OnClickPtr = 0;
 Button41.OnPressPtr = 0;

 Button42.OwnerScreen = &AIR_ONE;
 Button42.Order = 29;
 Button42.Left = 427;
 Button42.Top = 86;
 Button42.Width = 27;
 Button42.Height = 18;
 Button42.Pen_Width = 0;
 Button42.Pen_Color = 0x0000;
 Button42.Visible = 1;
 Button42.Active = 1;
 Button42.Transparent = 1;
 Button42.Caption = Button42_Caption;
 Button42.TextAlign = _taRight;
 Button42.TextAlignVertical= _tavMiddle;
 Button42.FontName =  0x00003E9A ;
 Button42.PressColEnabled = 1;
 Button42.Font_Color = 0xB5A0;
 Button42.VerticalText = 0;
 Button42.Gradient = 0;
 Button42.Gradient_Orientation = 0;
 Button42.Gradient_Start_Color = 0xFFFF;
 Button42.Gradient_End_Color = 0xC618;
 Button42.Color = 0xFFFF;
 Button42.Press_Color = 0xE71C;
 Button42.OnUpPtr = 0;
 Button42.OnDownPtr = 0;
 Button42.OnClickPtr = 0;
 Button42.OnPressPtr = 0;

 Button2.OwnerScreen = &AIR_ONE;
 Button2.Order = 30;
 Button2.Left = 1;
 Button2.Top = 31;
 Button2.Width = 478;
 Button2.Height = 240;
 Button2.Pen_Width = 0;
 Button2.Pen_Color = 0x0000;
 Button2.Visible = 1;
 Button2.Active = 1;
 Button2.Transparent = 0;
 Button2.Caption = Button2_Caption;
 Button2.TextAlign = _taCenter;
 Button2.TextAlignVertical= _tavMiddle;
 Button2.FontName =  0x00005242 ;
 Button2.PressColEnabled = 1;
 Button2.Font_Color = 0x0000;
 Button2.VerticalText = 0;
 Button2.Gradient = 0;
 Button2.Gradient_Orientation = 0;
 Button2.Gradient_Start_Color = 0xFFFF;
 Button2.Gradient_End_Color = 0xC618;
 Button2.Color = 0xC618;
 Button2.Press_Color = 0xE71C;
 Button2.OnUpPtr = 0;
 Button2.OnDownPtr = 0;
 Button2.OnClickPtr = BackToHome;
 Button2.OnPressPtr = 0;

 Image374.OwnerScreen = &GRAPH2;
 Image374.Order = 0;
 Image374.Left = 0;
 Image374.Top = 0;
 Image374.Width = 480;
 Image374.Height = 272;
 Image374.Picture_Type = 1;
 Image374.Picture_Ratio = 1;
 Image374.Picture_Name =  0x0003CAAE ;
 Image374.Visible = 1;
 Image374.Active = 0;
 Image374.OnUpPtr = 0;
 Image374.OnDownPtr = 0;
 Image374.OnClickPtr = 0;
 Image374.OnPressPtr = 0;

 Box28.OwnerScreen = &GRAPH2;
 Box28.Order = 1;
 Box28.Left = 40;
 Box28.Top = 70;
 Box28.Width = 360;
 Box28.Height = 180;
 Box28.Pen_Width = 1;
 Box28.Pen_Color = 0x07FF;
 Box28.Visible = 1;
 Box28.Active = 0;
 Box28.Transparent = 1;
 Box28.Gradient = 0;
 Box28.Gradient_Orientation = 0;
 Box28.Gradient_Start_Color = 0xFFFF;
 Box28.Gradient_End_Color = 0xC618;
 Box28.Color = 0xFFFF;
 Box28.PressColEnabled = 1;
 Box28.Press_Color = 0xE71C;
 Box28.OnUpPtr = 0;
 Box28.OnDownPtr = 0;
 Box28.OnClickPtr = 0;
 Box28.OnPressPtr = 0;

 Line13.OwnerScreen = &GRAPH2;
 Line13.Order = 2;
 Line13.First_Point_X = 40;
 Line13.First_Point_Y = 85;
 Line13.Second_Point_X = 400;
 Line13.Second_Point_Y = 85;
 Line13.Visible = 1;
 Line13.Pen_Width = 1;
 Line13.Color = 0x07FF;

 Line14.OwnerScreen = &GRAPH2;
 Line14.Order = 3;
 Line14.First_Point_X = 40;
 Line14.First_Point_Y = 110;
 Line14.Second_Point_X = 400;
 Line14.Second_Point_Y = 110;
 Line14.Visible = 1;
 Line14.Pen_Width = 1;
 Line14.Color = 0x07FF;

 Line15.OwnerScreen = &GRAPH2;
 Line15.Order = 4;
 Line15.First_Point_X = 40;
 Line15.First_Point_Y = 135;
 Line15.Second_Point_X = 400;
 Line15.Second_Point_Y = 135;
 Line15.Visible = 1;
 Line15.Pen_Width = 1;
 Line15.Color = 0x07FF;

 Line17.OwnerScreen = &GRAPH2;
 Line17.Order = 5;
 Line17.First_Point_X = 100;
 Line17.First_Point_Y = 70;
 Line17.Second_Point_X = 100;
 Line17.Second_Point_Y = 250;
 Line17.Visible = 1;
 Line17.Pen_Width = 1;
 Line17.Color = 0x07FF;

 Line18.OwnerScreen = &GRAPH2;
 Line18.Order = 6;
 Line18.First_Point_X = 160;
 Line18.First_Point_Y = 70;
 Line18.Second_Point_X = 160;
 Line18.Second_Point_Y = 250;
 Line18.Visible = 1;
 Line18.Pen_Width = 1;
 Line18.Color = 0x07FF;

 Line19.OwnerScreen = &GRAPH2;
 Line19.Order = 7;
 Line19.First_Point_X = 220;
 Line19.First_Point_Y = 70;
 Line19.Second_Point_X = 220;
 Line19.Second_Point_Y = 250;
 Line19.Visible = 1;
 Line19.Pen_Width = 1;
 Line19.Color = 0x07FF;

 Line20.OwnerScreen = &GRAPH2;
 Line20.Order = 8;
 Line20.First_Point_X = 280;
 Line20.First_Point_Y = 70;
 Line20.Second_Point_X = 280;
 Line20.Second_Point_Y = 250;
 Line20.Visible = 1;
 Line20.Pen_Width = 1;
 Line20.Color = 0x07FF;

 Line21.OwnerScreen = &GRAPH2;
 Line21.Order = 9;
 Line21.First_Point_X = 340;
 Line21.First_Point_Y = 70;
 Line21.Second_Point_X = 340;
 Line21.Second_Point_Y = 250;
 Line21.Visible = 1;
 Line21.Pen_Width = 1;
 Line21.Color = 0x07FF;

 Label121.OwnerScreen = &GRAPH2;
 Label121.Order = 10;
 Label121.Left = 20;
 Label121.Top = 125;
 Label121.Width = 19;
 Label121.Height = 20;
 Label121.Visible = 1;
 Label121.Active = 0;
 Label121.Caption = Label121_Caption;
 Label121.FontName =  0x00005242 ;
 Label121.Font_Color = 0xFFFF;
 Label121.VerticalText = 0;
 Label121.OnUpPtr = 0;
 Label121.OnDownPtr = 0;
 Label121.OnClickPtr = 0;
 Label121.OnPressPtr = 0;

 Label122.OwnerScreen = &GRAPH2;
 Label122.Order = 11;
 Label122.Left = 20;
 Label122.Top = 200;
 Label122.Width = 19;
 Label122.Height = 20;
 Label122.Visible = 1;
 Label122.Active = 0;
 Label122.Caption = Label122_Caption;
 Label122.FontName =  0x00005242 ;
 Label122.Font_Color = 0xFFFF;
 Label122.VerticalText = 0;
 Label122.OnUpPtr = 0;
 Label122.OnDownPtr = 0;
 Label122.OnClickPtr = 0;
 Label122.OnPressPtr = 0;

 Label125.OwnerScreen = &GRAPH2;
 Label125.Order = 12;
 Label125.Left = 20;
 Label125.Top = 175;
 Label125.Width = 19;
 Label125.Height = 20;
 Label125.Visible = 1;
 Label125.Active = 0;
 Label125.Caption = Label125_Caption;
 Label125.FontName =  0x00005242 ;
 Label125.Font_Color = 0xFFFF;
 Label125.VerticalText = 0;
 Label125.OnUpPtr = 0;
 Label125.OnDownPtr = 0;
 Label125.OnClickPtr = 0;
 Label125.OnPressPtr = 0;

 Label127.OwnerScreen = &GRAPH2;
 Label127.Order = 13;
 Label127.Left = 20;
 Label127.Top = 150;
 Label127.Width = 19;
 Label127.Height = 20;
 Label127.Visible = 1;
 Label127.Active = 0;
 Label127.Caption = Label127_Caption;
 Label127.FontName =  0x00005242 ;
 Label127.Font_Color = 0xFFFF;
 Label127.VerticalText = 0;
 Label127.OnUpPtr = 0;
 Label127.OnDownPtr = 0;
 Label127.OnClickPtr = 0;
 Label127.OnPressPtr = 0;

 Label130.OwnerScreen = &GRAPH2;
 Label130.Order = 14;
 Label130.Left = 30;
 Label130.Top = 225;
 Label130.Width = 9;
 Label130.Height = 20;
 Label130.Visible = 1;
 Label130.Active = 0;
 Label130.Caption = Label130_Caption;
 Label130.FontName =  0x00005242 ;
 Label130.Font_Color = 0xFFFF;
 Label130.VerticalText = 0;
 Label130.OnUpPtr = 0;
 Label130.OnDownPtr = 0;
 Label130.OnClickPtr = 0;
 Label130.OnPressPtr = 0;

 Label131.OwnerScreen = &GRAPH2;
 Label131.Order = 15;
 Label131.Left = 95;
 Label131.Top = 250;
 Label131.Width = 9;
 Label131.Height = 20;
 Label131.Visible = 1;
 Label131.Active = 0;
 Label131.Caption = Label131_Caption;
 Label131.FontName =  0x00005242 ;
 Label131.Font_Color = 0xFFFF;
 Label131.VerticalText = 0;
 Label131.OnUpPtr = 0;
 Label131.OnDownPtr = 0;
 Label131.OnClickPtr = 0;
 Label131.OnPressPtr = 0;

 Label132.OwnerScreen = &GRAPH2;
 Label132.Order = 16;
 Label132.Left = 155;
 Label132.Top = 250;
 Label132.Width = 9;
 Label132.Height = 20;
 Label132.Visible = 1;
 Label132.Active = 0;
 Label132.Caption = Label132_Caption;
 Label132.FontName =  0x00005242 ;
 Label132.Font_Color = 0xFFFF;
 Label132.VerticalText = 0;
 Label132.OnUpPtr = 0;
 Label132.OnDownPtr = 0;
 Label132.OnClickPtr = 0;
 Label132.OnPressPtr = 0;

 Label133.OwnerScreen = &GRAPH2;
 Label133.Order = 17;
 Label133.Left = 215;
 Label133.Top = 250;
 Label133.Width = 9;
 Label133.Height = 20;
 Label133.Visible = 1;
 Label133.Active = 0;
 Label133.Caption = Label133_Caption;
 Label133.FontName =  0x00005242 ;
 Label133.Font_Color = 0xFFFF;
 Label133.VerticalText = 0;
 Label133.OnUpPtr = 0;
 Label133.OnDownPtr = 0;
 Label133.OnClickPtr = 0;
 Label133.OnPressPtr = 0;

 Label134.OwnerScreen = &GRAPH2;
 Label134.Order = 18;
 Label134.Left = 275;
 Label134.Top = 250;
 Label134.Width = 9;
 Label134.Height = 20;
 Label134.Visible = 1;
 Label134.Active = 0;
 Label134.Caption = Label134_Caption;
 Label134.FontName =  0x00005242 ;
 Label134.Font_Color = 0xFFFF;
 Label134.VerticalText = 0;
 Label134.OnUpPtr = 0;
 Label134.OnDownPtr = 0;
 Label134.OnClickPtr = 0;
 Label134.OnPressPtr = 0;

 Label135.OwnerScreen = &GRAPH2;
 Label135.Order = 19;
 Label135.Left = 335;
 Label135.Top = 250;
 Label135.Width = 9;
 Label135.Height = 20;
 Label135.Visible = 1;
 Label135.Active = 0;
 Label135.Caption = Label135_Caption;
 Label135.FontName =  0x00005242 ;
 Label135.Font_Color = 0xFFFF;
 Label135.VerticalText = 0;
 Label135.OnUpPtr = 0;
 Label135.OnDownPtr = 0;
 Label135.OnClickPtr = 0;
 Label135.OnPressPtr = 0;

 Label136.OwnerScreen = &GRAPH2;
 Label136.Order = 20;
 Label136.Left = 365;
 Label136.Top = 250;
 Label136.Width = 28;
 Label136.Height = 20;
 Label136.Visible = 1;
 Label136.Active = 0;
 Label136.Caption = Label136_Caption;
 Label136.FontName =  0x00005242 ;
 Label136.Font_Color = 0xFFFF;
 Label136.VerticalText = 0;
 Label136.OnUpPtr = 0;
 Label136.OnDownPtr = 0;
 Label136.OnClickPtr = 0;
 Label136.OnPressPtr = 0;

 Line22.OwnerScreen = &GRAPH2;
 Line22.Order = 21;
 Line22.First_Point_X = 40;
 Line22.First_Point_Y = 160;
 Line22.Second_Point_X = 400;
 Line22.Second_Point_Y = 160;
 Line22.Visible = 1;
 Line22.Pen_Width = 1;
 Line22.Color = 0x07FF;

 Line23.OwnerScreen = &GRAPH2;
 Line23.Order = 22;
 Line23.First_Point_X = 40;
 Line23.First_Point_Y = 185;
 Line23.Second_Point_X = 400;
 Line23.Second_Point_Y = 185;
 Line23.Visible = 1;
 Line23.Pen_Width = 1;
 Line23.Color = 0x07FF;

 Line24.OwnerScreen = &GRAPH2;
 Line24.Order = 23;
 Line24.First_Point_X = 40;
 Line24.First_Point_Y = 210;
 Line24.Second_Point_X = 400;
 Line24.Second_Point_Y = 210;
 Line24.Visible = 1;
 Line24.Pen_Width = 1;
 Line24.Color = 0x07FF;

 Label137.OwnerScreen = &GRAPH2;
 Label137.Order = 24;
 Label137.Left = 20;
 Label137.Top = 100;
 Label137.Width = 19;
 Label137.Height = 20;
 Label137.Visible = 1;
 Label137.Active = 0;
 Label137.Caption = Label137_Caption;
 Label137.FontName =  0x00005242 ;
 Label137.Font_Color = 0xFFFF;
 Label137.VerticalText = 0;
 Label137.OnUpPtr = 0;
 Label137.OnDownPtr = 0;
 Label137.OnClickPtr = 0;
 Label137.OnPressPtr = 0;

 Label146.OwnerScreen = &GRAPH2;
 Label146.Order = 25;
 Label146.Left = 20;
 Label146.Top = 75;
 Label146.Width = 19;
 Label146.Height = 20;
 Label146.Visible = 1;
 Label146.Active = 0;
 Label146.Caption = Label146_Caption;
 Label146.FontName =  0x00005242 ;
 Label146.Font_Color = 0xFFFF;
 Label146.VerticalText = 0;
 Label146.OnUpPtr = 0;
 Label146.OnDownPtr = 0;
 Label146.OnClickPtr = 0;
 Label146.OnPressPtr = 0;

 Line25.OwnerScreen = &GRAPH2;
 Line25.Order = 26;
 Line25.First_Point_X = 40;
 Line25.First_Point_Y = 235;
 Line25.Second_Point_X = 400;
 Line25.Second_Point_Y = 235;
 Line25.Visible = 1;
 Line25.Pen_Width = 1;
 Line25.Color = 0x07FF;

 Image378.OwnerScreen = &GRAPH2;
 Image378.Order = 27;
 Image378.Left = 30;
 Image378.Top = 0;
 Image378.Width = 110;
 Image378.Height = 30;
 Image378.Picture_Type = 1;
 Image378.Picture_Ratio = 1;
 Image378.Picture_Name =  0x00089838 ;
 Image378.Visible = 1;
 Image378.Active = 1;
 Image378.OnUpPtr = 0;
 Image378.OnDownPtr = 0;
 Image378.OnClickPtr = 0;
 Image378.OnPressPtr = 0;

 Label151.OwnerScreen = &GRAPH2;
 Label151.Order = 28;
 Label151.Left = 40;
 Label151.Top = 5;
 Label151.Width = 67;
 Label151.Height = 20;
 Label151.Visible = 1;
 Label151.Active = 0;
 Label151.Caption = Label151_Caption;
 Label151.FontName =  0x00005242 ;
 Label151.Font_Color = 0xFFFF;
 Label151.VerticalText = 0;
 Label151.OnUpPtr = 0;
 Label151.OnDownPtr = 0;
 Label151.OnClickPtr = 0;
 Label151.OnPressPtr = 0;

 _.OwnerScreen = &GRAPH2;
 _.Order = 29;
 _.Left = 161;
 _.Top = 5;
 _.Width = 151;
 _.Height = 20;
 _.Visible = 1;
 _.Active = 0;
 _.Caption = __Caption;
 _.FontName =  0x00005242 ;
 _.Font_Color = 0xE7FC;
 _.VerticalText = 0;
 _.OnUpPtr = 0;
 _.OnDownPtr = 0;
 _.OnClickPtr = 0;
 _.OnPressPtr = 0;

 Home_b26.OwnerScreen = &GRAPH2;
 Home_b26.Order = 30;
 Home_b26.Left = 410;
 Home_b26.Top = 216;
 Home_b26.Width = 60;
 Home_b26.Height = 35;
 Home_b26.Pen_Width = 1;
 Home_b26.Pen_Color = 0xC618;
 Home_b26.Visible = 1;
 Home_b26.Active = 1;
 Home_b26.Transparent = 1;
 Home_b26.Caption = Home_b26_Caption;
 Home_b26.TextAlign = _taCenter;
 Home_b26.TextAlignVertical= _tavMiddle;
 Home_b26.FontName =  0x00005242 ;
 Home_b26.PressColEnabled = 1;
 Home_b26.Font_Color = 0xD6BA;
 Home_b26.VerticalText = 0;
 Home_b26.Gradient = 1;
 Home_b26.Gradient_Orientation = 0;
 Home_b26.Gradient_Start_Color = 0x0418;
 Home_b26.Gradient_End_Color = 0x00A5;
 Home_b26.Color = 0xC618;
 Home_b26.Press_Color = 0xE71C;
 Home_b26.Corner_Radius = 5;
 Home_b26.OnUpPtr = 0;
 Home_b26.OnDownPtr = 0;
 Home_b26.OnClickPtr = BackToHome;
 Home_b26.OnPressPtr = 0;

 Back_b22.OwnerScreen = &GRAPH2;
 Back_b22.Order = 31;
 Back_b22.Left = 410;
 Back_b22.Top = 170;
 Back_b22.Width = 60;
 Back_b22.Height = 35;
 Back_b22.Pen_Width = 1;
 Back_b22.Pen_Color = 0xC618;
 Back_b22.Visible = 1;
 Back_b22.Active = 1;
 Back_b22.Transparent = 1;
 Back_b22.Caption = Back_b22_Caption;
 Back_b22.TextAlign = _taCenter;
 Back_b22.TextAlignVertical= _tavMiddle;
 Back_b22.FontName =  0x00005242 ;
 Back_b22.PressColEnabled = 1;
 Back_b22.Font_Color = 0xD6BA;
 Back_b22.VerticalText = 0;
 Back_b22.Gradient = 1;
 Back_b22.Gradient_Orientation = 0;
 Back_b22.Gradient_Start_Color = 0x0418;
 Back_b22.Gradient_End_Color = 0x00A5;
 Back_b22.Color = 0xC618;
 Back_b22.Press_Color = 0xE71C;
 Back_b22.Corner_Radius = 5;
 Back_b22.OnUpPtr = 0;
 Back_b22.OnDownPtr = 0;
 Back_b22.OnClickPtr = goToBack;
 Back_b22.OnPressPtr = 0;

 graph2_pos.OwnerScreen = &GRAPH2;
 graph2_pos.Order = 32;
 graph2_pos.Left = 445;
 graph2_pos.Top = 81;
 graph2_pos.Width = 28;
 graph2_pos.Height = 20;
 graph2_pos.Visible = 1;
 graph2_pos.Active = 0;
 graph2_pos.Caption = graph2_pos_Caption;
 graph2_pos.FontName =  0x00005242 ;
 graph2_pos.Font_Color = 0xFFFF;
 graph2_pos.VerticalText = 0;
 graph2_pos.OnUpPtr = 0;
 graph2_pos.OnDownPtr = 0;
 graph2_pos.OnClickPtr = 0;
 graph2_pos.OnPressPtr = 0;

 graph_br2_in.OwnerScreen = &GRAPH2;
 graph_br2_in.Order = 33;
 graph_br2_in.Left = 52;
 graph_br2_in.Top = 38;
 graph_br2_in.Width = 50;
 graph_br2_in.Height = 26;
 graph_br2_in.Pen_Width = 1;
 graph_br2_in.Pen_Color = 0x0000;
 graph_br2_in.Visible = 1;
 graph_br2_in.Active = 1;
 graph_br2_in.Transparent = 1;
 graph_br2_in.Caption = graph_br2_in_Caption;
 graph_br2_in.TextAlign = _taCenter;
 graph_br2_in.TextAlignVertical= _tavMiddle;
 graph_br2_in.FontName =  0x00003E9A ;
 graph_br2_in.PressColEnabled = 1;
 graph_br2_in.Font_Color = 0xF800;
 graph_br2_in.VerticalText = 0;
 graph_br2_in.Gradient = 0;
 graph_br2_in.Gradient_Orientation = 0;
 graph_br2_in.Gradient_Start_Color = 0xFFFF;
 graph_br2_in.Gradient_End_Color = 0xC618;
 graph_br2_in.Color = 0xE73C;
 graph_br2_in.Press_Color = 0xE71C;
 graph_br2_in.Corner_Radius = 3;
 graph_br2_in.OnUpPtr = 0;
 graph_br2_in.OnDownPtr = 0;
 graph_br2_in.OnClickPtr = 0;
 graph_br2_in.OnPressPtr = 0;

 graph_br2_out.OwnerScreen = &GRAPH2;
 graph_br2_out.Order = 34;
 graph_br2_out.Left = 163;
 graph_br2_out.Top = 38;
 graph_br2_out.Width = 50;
 graph_br2_out.Height = 26;
 graph_br2_out.Pen_Width = 1;
 graph_br2_out.Pen_Color = 0x0000;
 graph_br2_out.Visible = 1;
 graph_br2_out.Active = 1;
 graph_br2_out.Transparent = 1;
 graph_br2_out.Caption = graph_br2_out_Caption;
 graph_br2_out.TextAlign = _taCenter;
 graph_br2_out.TextAlignVertical= _tavMiddle;
 graph_br2_out.FontName =  0x00003E9A ;
 graph_br2_out.PressColEnabled = 1;
 graph_br2_out.Font_Color = 0x001F;
 graph_br2_out.VerticalText = 0;
 graph_br2_out.Gradient = 0;
 graph_br2_out.Gradient_Orientation = 0;
 graph_br2_out.Gradient_Start_Color = 0xFFFF;
 graph_br2_out.Gradient_End_Color = 0xC618;
 graph_br2_out.Color = 0xE73C;
 graph_br2_out.Press_Color = 0xE71C;
 graph_br2_out.Corner_Radius = 3;
 graph_br2_out.OnUpPtr = 0;
 graph_br2_out.OnDownPtr = 0;
 graph_br2_out.OnClickPtr = 0;
 graph_br2_out.OnPressPtr = 0;

 graph_heat2_in.OwnerScreen = &GRAPH2;
 graph_heat2_in.Order = 35;
 graph_heat2_in.Left = 255;
 graph_heat2_in.Top = 38;
 graph_heat2_in.Width = 50;
 graph_heat2_in.Height = 26;
 graph_heat2_in.Pen_Width = 1;
 graph_heat2_in.Pen_Color = 0x0000;
 graph_heat2_in.Visible = 1;
 graph_heat2_in.Active = 1;
 graph_heat2_in.Transparent = 1;
 graph_heat2_in.Caption = graph_heat2_in_Caption;
 graph_heat2_in.TextAlign = _taCenter;
 graph_heat2_in.TextAlignVertical= _tavMiddle;
 graph_heat2_in.FontName =  0x00003E9A ;
 graph_heat2_in.PressColEnabled = 1;
 graph_heat2_in.Font_Color = 0x0400;
 graph_heat2_in.VerticalText = 0;
 graph_heat2_in.Gradient = 0;
 graph_heat2_in.Gradient_Orientation = 0;
 graph_heat2_in.Gradient_Start_Color = 0xFFFF;
 graph_heat2_in.Gradient_End_Color = 0xC618;
 graph_heat2_in.Color = 0xE73C;
 graph_heat2_in.Press_Color = 0xE71C;
 graph_heat2_in.Corner_Radius = 3;
 graph_heat2_in.OnUpPtr = 0;
 graph_heat2_in.OnDownPtr = 0;
 graph_heat2_in.OnClickPtr = 0;
 graph_heat2_in.OnPressPtr = 0;

 graph_heat2_out.OwnerScreen = &GRAPH2;
 graph_heat2_out.Order = 36;
 graph_heat2_out.Left = 356;
 graph_heat2_out.Top = 38;
 graph_heat2_out.Width = 50;
 graph_heat2_out.Height = 26;
 graph_heat2_out.Pen_Width = 1;
 graph_heat2_out.Pen_Color = 0x0000;
 graph_heat2_out.Visible = 1;
 graph_heat2_out.Active = 1;
 graph_heat2_out.Transparent = 1;
 graph_heat2_out.Caption = graph_heat2_out_Caption;
 graph_heat2_out.TextAlign = _taCenter;
 graph_heat2_out.TextAlignVertical= _tavMiddle;
 graph_heat2_out.FontName =  0x00003E9A ;
 graph_heat2_out.PressColEnabled = 1;
 graph_heat2_out.Font_Color = 0x0000;
 graph_heat2_out.VerticalText = 0;
 graph_heat2_out.Gradient = 0;
 graph_heat2_out.Gradient_Orientation = 0;
 graph_heat2_out.Gradient_Start_Color = 0xFFFF;
 graph_heat2_out.Gradient_End_Color = 0xC618;
 graph_heat2_out.Color = 0xE73C;
 graph_heat2_out.Press_Color = 0xE71C;
 graph_heat2_out.Corner_Radius = 3;
 graph_heat2_out.OnUpPtr = 0;
 graph_heat2_out.OnDownPtr = 0;
 graph_heat2_out.OnClickPtr = 0;
 graph_heat2_out.OnPressPtr = 0;

 Label5.OwnerScreen = &GRAPH2;
 Label5.Order = 37;
 Label5.Left = 407;
 Label5.Top = 81;
 Label5.Width = 41;
 Label5.Height = 20;
 Label5.Visible = 1;
 Label5.Active = 0;
 Label5.Caption = Label5_Caption;
 Label5.FontName =  0x00005242 ;
 Label5.Font_Color = 0xFFFF;
 Label5.VerticalText = 0;
 Label5.OnUpPtr = 0;
 Label5.OnDownPtr = 0;
 Label5.OnClickPtr = 0;
 Label5.OnPressPtr = 0;

 Label8.OwnerScreen = &GRAPH2;
 Label8.Order = 38;
 Label8.Left = 220;
 Label8.Top = 41;
 Label8.Width = 32;
 Label8.Height = 20;
 Label8.Visible = 1;
 Label8.Active = 0;
 Label8.Caption = Label8_Caption;
 Label8.FontName =  0x00005242 ;
 Label8.Font_Color = 0xFFFF;
 Label8.VerticalText = 0;
 Label8.OnUpPtr = 0;
 Label8.OnDownPtr = 0;
 Label8.OnClickPtr = 0;
 Label8.OnPressPtr = 0;

 Label16.OwnerScreen = &GRAPH2;
 Label16.Order = 39;
 Label16.Left = 308;
 Label16.Top = 41;
 Label16.Width = 45;
 Label16.Height = 20;
 Label16.Visible = 1;
 Label16.Active = 0;
 Label16.Caption = Label16_Caption;
 Label16.FontName =  0x00005242 ;
 Label16.Font_Color = 0xFFFF;
 Label16.VerticalText = 0;
 Label16.OnUpPtr = 0;
 Label16.OnDownPtr = 0;
 Label16.OnClickPtr = 0;
 Label16.OnPressPtr = 0;

 Label19.OwnerScreen = &GRAPH2;
 Label19.Order = 40;
 Label19.Left = 18;
 Label19.Top = 41;
 Label19.Width = 32;
 Label19.Height = 20;
 Label19.Visible = 1;
 Label19.Active = 0;
 Label19.Caption = Label19_Caption;
 Label19.FontName =  0x00005242 ;
 Label19.Font_Color = 0xFFFF;
 Label19.VerticalText = 0;
 Label19.OnUpPtr = 0;
 Label19.OnDownPtr = 0;
 Label19.OnClickPtr = 0;
 Label19.OnPressPtr = 0;

 Label21.OwnerScreen = &GRAPH2;
 Label21.Order = 41;
 Label21.Left = 110;
 Label21.Top = 41;
 Label21.Width = 45;
 Label21.Height = 20;
 Label21.Visible = 1;
 Label21.Active = 0;
 Label21.Caption = Label21_Caption;
 Label21.FontName =  0x00005242 ;
 Label21.Font_Color = 0xFFFF;
 Label21.VerticalText = 0;
 Label21.OnUpPtr = 0;
 Label21.OnDownPtr = 0;
 Label21.OnClickPtr = 0;
 Label21.OnPressPtr = 0;

 CircleButton5.OwnerScreen = &GRAPH2;
 CircleButton5.Order = 42;
 CircleButton5.Left = 450;
 CircleButton5.Top = 3;
 CircleButton5.Radius = 12;
 CircleButton5.Pen_Width = 1;
 CircleButton5.Pen_Color = 0x0000;
 CircleButton5.Visible = 1;
 CircleButton5.Active = 0;
 CircleButton5.Transparent = 1;
 CircleButton5.Caption = CircleButton5_Caption;
 CircleButton5.TextAlign = _taCenter;
 CircleButton5.TextAlignVertical= _tavMiddle;
 CircleButton5.FontName =  0x00005242 ;
 CircleButton5.PressColEnabled = 1;
 CircleButton5.Font_Color = 0x0000;
 CircleButton5.VerticalText = 0;
 CircleButton5.Gradient = 1;
 CircleButton5.Gradient_Orientation = 0;
 CircleButton5.Gradient_Start_Color = 0xFFFF;
 CircleButton5.Gradient_End_Color = 0xC618;
 CircleButton5.Color = 0xC618;
 CircleButton5.Press_Color = 0xE71C;
 CircleButton5.OnUpPtr = 0;
 CircleButton5.OnDownPtr = 0;
 CircleButton5.OnClickPtr = 0;
 CircleButton5.OnPressPtr = 0;

 Image133.OwnerScreen = &TIMERS;
 Image133.Order = 0;
 Image133.Left = 0;
 Image133.Top = 0;
 Image133.Width = 480;
 Image133.Height = 272;
 Image133.Picture_Type = 1;
 Image133.Picture_Ratio = 1;
 Image133.Picture_Name =  0x0003CAAE ;
 Image133.Visible = 1;
 Image133.Active = 0;
 Image133.OnUpPtr = 0;
 Image133.OnDownPtr = 0;
 Image133.OnClickPtr = 0;
 Image133.OnPressPtr = 0;

 Image395.OwnerScreen = &TIMERS;
 Image395.Order = 1;
 Image395.Left = 389;
 Image395.Top = 36;
 Image395.Width = 21;
 Image395.Height = 16;
 Image395.Picture_Type = 1;
 Image395.Picture_Ratio = 1;
 Image395.Picture_Name =  0x0051042E ;
 Image395.Visible = 0;
 Image395.Active = 0;
 Image395.OnUpPtr = 0;
 Image395.OnDownPtr = 0;
 Image395.OnClickPtr = 0;
 Image395.OnPressPtr = 0;

 Image393.OwnerScreen = &TIMERS;
 Image393.Order = 2;
 Image393.Left = 314;
 Image393.Top = 42;
 Image393.Width = 21;
 Image393.Height = 16;
 Image393.Picture_Type = 1;
 Image393.Picture_Ratio = 1;
 Image393.Picture_Name =  0x0051042E ;
 Image393.Visible = 0;
 Image393.Active = 0;
 Image393.OnUpPtr = 0;
 Image393.OnDownPtr = 0;
 Image393.OnClickPtr = 0;
 Image393.OnPressPtr = 0;

 Image161.OwnerScreen = &TIMERS;
 Image161.Order = 3;
 Image161.Left = 244;
 Image161.Top = 36;
 Image161.Width = 21;
 Image161.Height = 16;
 Image161.Picture_Type = 1;
 Image161.Picture_Ratio = 1;
 Image161.Picture_Name =  0x0051042E ;
 Image161.Visible = 0;
 Image161.Active = 0;
 Image161.OnUpPtr = 0;
 Image161.OnDownPtr = 0;
 Image161.OnClickPtr = 0;
 Image161.OnPressPtr = 0;

 Image295.OwnerScreen = &TIMERS;
 Image295.Order = 4;
 Image295.Left = 193;
 Image295.Top = 36;
 Image295.Width = 21;
 Image295.Height = 16;
 Image295.Picture_Type = 1;
 Image295.Picture_Ratio = 1;
 Image295.Picture_Name =  0x0051042E ;
 Image295.Visible = 0;
 Image295.Active = 0;
 Image295.OnUpPtr = 0;
 Image295.OnDownPtr = 0;
 Image295.OnClickPtr = 0;
 Image295.OnPressPtr = 0;

 Image376.OwnerScreen = &TIMERS;
 Image376.Order = 5;
 Image376.Left = 109;
 Image376.Top = 36;
 Image376.Width = 21;
 Image376.Height = 16;
 Image376.Picture_Type = 1;
 Image376.Picture_Ratio = 1;
 Image376.Picture_Name =  0x0051042E ;
 Image376.Visible = 0;
 Image376.Active = 0;
 Image376.OnUpPtr = 0;
 Image376.OnDownPtr = 0;
 Image376.OnClickPtr = 0;
 Image376.OnPressPtr = 0;

 Image391.OwnerScreen = &TIMERS;
 Image391.Order = 6;
 Image391.Left = 59;
 Image391.Top = 36;
 Image391.Width = 21;
 Image391.Height = 16;
 Image391.Picture_Type = 1;
 Image391.Picture_Ratio = 1;
 Image391.Picture_Name =  0x0051042E ;
 Image391.Visible = 0;
 Image391.Active = 0;
 Image391.OnUpPtr = 0;
 Image391.OnDownPtr = 0;
 Image391.OnClickPtr = 0;
 Image391.OnPressPtr = 0;

 Image111.OwnerScreen = &TIMERS;
 Image111.Order = 7;
 Image111.Left = 59;
 Image111.Top = 52;
 Image111.Width = 21;
 Image111.Height = 14;
 Image111.Picture_Type = 1;
 Image111.Picture_Ratio = 1;
 Image111.Picture_Name =  0x005106D4 ;
 Image111.Visible = 0;
 Image111.Active = 0;
 Image111.OnUpPtr = 0;
 Image111.OnDownPtr = 0;
 Image111.OnClickPtr = 0;
 Image111.OnPressPtr = 0;

 Image402.OwnerScreen = &TIMERS;
 Image402.Order = 8;
 Image402.Left = 109;
 Image402.Top = 52;
 Image402.Width = 21;
 Image402.Height = 14;
 Image402.Picture_Type = 1;
 Image402.Picture_Ratio = 1;
 Image402.Picture_Name =  0x005106D4 ;
 Image402.Visible = 0;
 Image402.Active = 0;
 Image402.OnUpPtr = 0;
 Image402.OnDownPtr = 0;
 Image402.OnClickPtr = 0;
 Image402.OnPressPtr = 0;

 Image403.OwnerScreen = &TIMERS;
 Image403.Order = 9;
 Image403.Left = 193;
 Image403.Top = 52;
 Image403.Width = 21;
 Image403.Height = 14;
 Image403.Picture_Type = 1;
 Image403.Picture_Ratio = 1;
 Image403.Picture_Name =  0x005106D4 ;
 Image403.Visible = 0;
 Image403.Active = 0;
 Image403.OnUpPtr = 0;
 Image403.OnDownPtr = 0;
 Image403.OnClickPtr = 0;
 Image403.OnPressPtr = 0;

 Image405.OwnerScreen = &TIMERS;
 Image405.Order = 10;
 Image405.Left = 244;
 Image405.Top = 52;
 Image405.Width = 21;
 Image405.Height = 14;
 Image405.Picture_Type = 1;
 Image405.Picture_Ratio = 1;
 Image405.Picture_Name =  0x005106D4 ;
 Image405.Visible = 0;
 Image405.Active = 0;
 Image405.OnUpPtr = 0;
 Image405.OnDownPtr = 0;
 Image405.OnClickPtr = 0;
 Image405.OnPressPtr = 0;

 Image404.OwnerScreen = &TIMERS;
 Image404.Order = 11;
 Image404.Left = 314;
 Image404.Top = 52;
 Image404.Width = 21;
 Image404.Height = 14;
 Image404.Picture_Type = 1;
 Image404.Picture_Ratio = 1;
 Image404.Picture_Name =  0x005106D4 ;
 Image404.Visible = 0;
 Image404.Active = 0;
 Image404.OnUpPtr = 0;
 Image404.OnDownPtr = 0;
 Image404.OnClickPtr = 0;
 Image404.OnPressPtr = 0;

 Image406.OwnerScreen = &TIMERS;
 Image406.Order = 12;
 Image406.Left = 389;
 Image406.Top = 52;
 Image406.Width = 21;
 Image406.Height = 14;
 Image406.Picture_Type = 1;
 Image406.Picture_Ratio = 1;
 Image406.Picture_Name =  0x005106D4 ;
 Image406.Visible = 0;
 Image406.Active = 0;
 Image406.OnUpPtr = 0;
 Image406.OnDownPtr = 0;
 Image406.OnClickPtr = 0;
 Image406.OnPressPtr = 0;

 Image113.OwnerScreen = &TIMERS;
 Image113.Order = 13;
 Image113.Left = 444;
 Image113.Top = 36;
 Image113.Width = 28;
 Image113.Height = 30;
 Image113.Picture_Type = 1;
 Image113.Picture_Ratio = 1;
 Image113.Picture_Name =  0x00510926 ;
 Image113.Visible = 0;
 Image113.Active = 0;
 Image113.OnUpPtr = 0;
 Image113.OnDownPtr = 0;
 Image113.OnClickPtr = 0;
 Image113.OnPressPtr = 0;

 Label162.OwnerScreen = &TIMERS;
 Label162.Order = 14;
 Label162.Left = 214;
 Label162.Top = 5;
 Label162.Width = 64;
 Label162.Height = 20;
 Label162.Visible = 1;
 Label162.Active = 0;
 Label162.Caption = Label162_Caption;
 Label162.FontName =  0x00005242 ;
 Label162.Font_Color = 0xE7FC;
 Label162.VerticalText = 0;
 Label162.OnUpPtr = 0;
 Label162.OnDownPtr = 0;
 Label162.OnClickPtr = 0;
 Label162.OnPressPtr = 0;

 Home_b27.OwnerScreen = &TIMERS;
 Home_b27.Order = 15;
 Home_b27.Left = 246;
 Home_b27.Top = 232;
 Home_b27.Width = 78;
 Home_b27.Height = 35;
 Home_b27.Pen_Width = 1;
 Home_b27.Pen_Color = 0xC618;
 Home_b27.Visible = 1;
 Home_b27.Active = 1;
 Home_b27.Transparent = 1;
 Home_b27.Caption = Home_b27_Caption;
 Home_b27.TextAlign = _taCenter;
 Home_b27.TextAlignVertical= _tavMiddle;
 Home_b27.FontName =  0x00005242 ;
 Home_b27.PressColEnabled = 1;
 Home_b27.Font_Color = 0xD6BA;
 Home_b27.VerticalText = 0;
 Home_b27.Gradient = 1;
 Home_b27.Gradient_Orientation = 0;
 Home_b27.Gradient_Start_Color = 0x0418;
 Home_b27.Gradient_End_Color = 0x00A5;
 Home_b27.Color = 0xC618;
 Home_b27.Press_Color = 0xE71C;
 Home_b27.Corner_Radius = 5;
 Home_b27.OnUpPtr = 0;
 Home_b27.OnDownPtr = 0;
 Home_b27.OnClickPtr = BackToHome;
 Home_b27.OnPressPtr = 0;

 Back_b23.OwnerScreen = &TIMERS;
 Back_b23.Order = 16;
 Back_b23.Left = 162;
 Back_b23.Top = 232;
 Back_b23.Width = 78;
 Back_b23.Height = 35;
 Back_b23.Pen_Width = 1;
 Back_b23.Pen_Color = 0xC618;
 Back_b23.Visible = 1;
 Back_b23.Active = 1;
 Back_b23.Transparent = 1;
 Back_b23.Caption = Back_b23_Caption;
 Back_b23.TextAlign = _taCenter;
 Back_b23.TextAlignVertical= _tavMiddle;
 Back_b23.FontName =  0x00005242 ;
 Back_b23.PressColEnabled = 1;
 Back_b23.Font_Color = 0xD6BA;
 Back_b23.VerticalText = 0;
 Back_b23.Gradient = 1;
 Back_b23.Gradient_Orientation = 0;
 Back_b23.Gradient_Start_Color = 0x0418;
 Back_b23.Gradient_End_Color = 0x00A5;
 Back_b23.Color = 0xC618;
 Back_b23.Press_Color = 0xE71C;
 Back_b23.Corner_Radius = 5;
 Back_b23.OnUpPtr = 0;
 Back_b23.OnDownPtr = 0;
 Back_b23.OnClickPtr = goToBack;
 Back_b23.OnPressPtr = 0;

 Image108.OwnerScreen = &ENERGY;
 Image108.Order = 0;
 Image108.Left = 0;
 Image108.Top = 0;
 Image108.Width = 480;
 Image108.Height = 272;
 Image108.Picture_Type = 1;
 Image108.Picture_Ratio = 1;
 Image108.Picture_Name =  0x0003CAAE ;
 Image108.Visible = 1;
 Image108.Active = 0;
 Image108.OnUpPtr = 0;
 Image108.OnDownPtr = 0;
 Image108.OnClickPtr = 0;
 Image108.OnPressPtr = 0;

 Label126.OwnerScreen = &ENERGY;
 Label126.Order = 1;
 Label126.Left = 211;
 Label126.Top = 5;
 Label126.Width = 72;
 Label126.Height = 20;
 Label126.Visible = 1;
 Label126.Active = 0;
 Label126.Caption = Label126_Caption;
 Label126.FontName =  0x00005242 ;
 Label126.Font_Color = 0xE7FC;
 Label126.VerticalText = 0;
 Label126.OnUpPtr = 0;
 Label126.OnDownPtr = 0;
 Label126.OnClickPtr = 0;
 Label126.OnPressPtr = 0;

 Home_b28.OwnerScreen = &ENERGY;
 Home_b28.Order = 2;
 Home_b28.Left = 246;
 Home_b28.Top = 232;
 Home_b28.Width = 78;
 Home_b28.Height = 35;
 Home_b28.Pen_Width = 1;
 Home_b28.Pen_Color = 0xC618;
 Home_b28.Visible = 1;
 Home_b28.Active = 1;
 Home_b28.Transparent = 1;
 Home_b28.Caption = Home_b28_Caption;
 Home_b28.TextAlign = _taCenter;
 Home_b28.TextAlignVertical= _tavMiddle;
 Home_b28.FontName =  0x00005242 ;
 Home_b28.PressColEnabled = 1;
 Home_b28.Font_Color = 0xD6BA;
 Home_b28.VerticalText = 0;
 Home_b28.Gradient = 1;
 Home_b28.Gradient_Orientation = 0;
 Home_b28.Gradient_Start_Color = 0x0418;
 Home_b28.Gradient_End_Color = 0x00A5;
 Home_b28.Color = 0xC618;
 Home_b28.Press_Color = 0xE71C;
 Home_b28.Corner_Radius = 5;
 Home_b28.OnUpPtr = 0;
 Home_b28.OnDownPtr = 0;
 Home_b28.OnClickPtr = BackToHome;
 Home_b28.OnPressPtr = 0;

 Back_b24.OwnerScreen = &ENERGY;
 Back_b24.Order = 3;
 Back_b24.Left = 162;
 Back_b24.Top = 232;
 Back_b24.Width = 78;
 Back_b24.Height = 35;
 Back_b24.Pen_Width = 1;
 Back_b24.Pen_Color = 0xC618;
 Back_b24.Visible = 1;
 Back_b24.Active = 1;
 Back_b24.Transparent = 1;
 Back_b24.Caption = Back_b24_Caption;
 Back_b24.TextAlign = _taCenter;
 Back_b24.TextAlignVertical= _tavMiddle;
 Back_b24.FontName =  0x00005242 ;
 Back_b24.PressColEnabled = 1;
 Back_b24.Font_Color = 0xD6BA;
 Back_b24.VerticalText = 0;
 Back_b24.Gradient = 1;
 Back_b24.Gradient_Orientation = 0;
 Back_b24.Gradient_Start_Color = 0x0418;
 Back_b24.Gradient_End_Color = 0x00A5;
 Back_b24.Color = 0xC618;
 Back_b24.Press_Color = 0xE71C;
 Back_b24.Corner_Radius = 5;
 Back_b24.OnUpPtr = 0;
 Back_b24.OnDownPtr = 0;
 Back_b24.OnClickPtr = goToBack;
 Back_b24.OnPressPtr = 0;

 Energy_Volt_1.OwnerScreen = &ENERGY;
 Energy_Volt_1.Order = 4;
 Energy_Volt_1.Left = 185;
 Energy_Volt_1.Top = 85;
 Energy_Volt_1.Width = 65;
 Energy_Volt_1.Height = 27;
 Energy_Volt_1.Pen_Width = 1;
 Energy_Volt_1.Pen_Color = 0x0000;
 Energy_Volt_1.Visible = 1;
 Energy_Volt_1.Active = 1;
 Energy_Volt_1.Transparent = 1;
 Energy_Volt_1.Caption = Energy_Volt_1_Caption;
 Energy_Volt_1.TextAlign = _taCenter;
 Energy_Volt_1.TextAlignVertical= _tavMiddle;
 Energy_Volt_1.FontName =  0x00005242 ;
 Energy_Volt_1.PressColEnabled = 1;
 Energy_Volt_1.Font_Color = 0x0210;
 Energy_Volt_1.VerticalText = 0;
 Energy_Volt_1.Gradient = 0;
 Energy_Volt_1.Gradient_Orientation = 0;
 Energy_Volt_1.Gradient_Start_Color = 0xFFFF;
 Energy_Volt_1.Gradient_End_Color = 0xC618;
 Energy_Volt_1.Color = 0xF7BE;
 Energy_Volt_1.Press_Color = 0xE71C;
 Energy_Volt_1.Corner_Radius = 3;
 Energy_Volt_1.OnUpPtr = 0;
 Energy_Volt_1.OnDownPtr = 0;
 Energy_Volt_1.OnClickPtr = 0;
 Energy_Volt_1.OnPressPtr = 0;

 Label251.OwnerScreen = &ENERGY;
 Label251.Order = 5;
 Label251.Left = 60;
 Label251.Top = 90;
 Label251.Width = 64;
 Label251.Height = 20;
 Label251.Visible = 1;
 Label251.Active = 1;
 Label251.Caption = Label251_Caption;
 Label251.FontName =  0x00005242 ;
 Label251.Font_Color = 0xFFFF;
 Label251.VerticalText = 0;
 Label251.OnUpPtr = 0;
 Label251.OnDownPtr = 0;
 Label251.OnClickPtr = 0;
 Label251.OnPressPtr = 0;

 Label252.OwnerScreen = &ENERGY;
 Label252.Order = 6;
 Label252.Left = 260;
 Label252.Top = 90;
 Label252.Width = 11;
 Label252.Height = 20;
 Label252.Visible = 1;
 Label252.Active = 1;
 Label252.Caption = Label252_Caption;
 Label252.FontName =  0x00005242 ;
 Label252.Font_Color = 0xFFFF;
 Label252.VerticalText = 0;
 Label252.OnUpPtr = 0;
 Label252.OnDownPtr = 0;
 Label252.OnClickPtr = 0;
 Label252.OnPressPtr = 0;

 S_Current_1.OwnerScreen = &ENERGY;
 S_Current_1.Order = 7;
 S_Current_1.Left = 295;
 S_Current_1.Top = 85;
 S_Current_1.Width = 65;
 S_Current_1.Height = 27;
 S_Current_1.Pen_Width = 1;
 S_Current_1.Pen_Color = 0x0000;
 S_Current_1.Visible = 1;
 S_Current_1.Active = 1;
 S_Current_1.Transparent = 1;
 S_Current_1.Caption = S_Current_1_Caption;
 S_Current_1.TextAlign = _taCenter;
 S_Current_1.TextAlignVertical= _tavMiddle;
 S_Current_1.FontName =  0x00005242 ;
 S_Current_1.PressColEnabled = 1;
 S_Current_1.Font_Color = 0xC800;
 S_Current_1.VerticalText = 0;
 S_Current_1.Gradient = 0;
 S_Current_1.Gradient_Orientation = 0;
 S_Current_1.Gradient_Start_Color = 0xFFFF;
 S_Current_1.Gradient_End_Color = 0xC618;
 S_Current_1.Color = 0xF7BE;
 S_Current_1.Press_Color = 0xE71C;
 S_Current_1.Corner_Radius = 3;
 S_Current_1.OnUpPtr = 0;
 S_Current_1.OnDownPtr = 0;
 S_Current_1.OnClickPtr = 0;
 S_Current_1.OnPressPtr = 0;

 Label253.OwnerScreen = &ENERGY;
 Label253.Order = 8;
 Label253.Left = 370;
 Label253.Top = 90;
 Label253.Width = 11;
 Label253.Height = 20;
 Label253.Visible = 1;
 Label253.Active = 1;
 Label253.Caption = Label253_Caption;
 Label253.FontName =  0x00005242 ;
 Label253.Font_Color = 0xFFFF;
 Label253.VerticalText = 0;
 Label253.OnUpPtr = 0;
 Label253.OnDownPtr = 0;
 Label253.OnClickPtr = 0;
 Label253.OnPressPtr = 0;

 Energy_Volt_2.OwnerScreen = &ENERGY;
 Energy_Volt_2.Order = 9;
 Energy_Volt_2.Left = 185;
 Energy_Volt_2.Top = 120;
 Energy_Volt_2.Width = 65;
 Energy_Volt_2.Height = 27;
 Energy_Volt_2.Pen_Width = 1;
 Energy_Volt_2.Pen_Color = 0x0000;
 Energy_Volt_2.Visible = 1;
 Energy_Volt_2.Active = 1;
 Energy_Volt_2.Transparent = 1;
 Energy_Volt_2.Caption = Energy_Volt_2_Caption;
 Energy_Volt_2.TextAlign = _taCenter;
 Energy_Volt_2.TextAlignVertical= _tavMiddle;
 Energy_Volt_2.FontName =  0x00005242 ;
 Energy_Volt_2.PressColEnabled = 1;
 Energy_Volt_2.Font_Color = 0x0210;
 Energy_Volt_2.VerticalText = 0;
 Energy_Volt_2.Gradient = 0;
 Energy_Volt_2.Gradient_Orientation = 0;
 Energy_Volt_2.Gradient_Start_Color = 0xFFFF;
 Energy_Volt_2.Gradient_End_Color = 0xC618;
 Energy_Volt_2.Color = 0xF7BE;
 Energy_Volt_2.Press_Color = 0xE71C;
 Energy_Volt_2.Corner_Radius = 3;
 Energy_Volt_2.OnUpPtr = 0;
 Energy_Volt_2.OnDownPtr = 0;
 Energy_Volt_2.OnClickPtr = 0;
 Energy_Volt_2.OnPressPtr = 0;

 Label254.OwnerScreen = &ENERGY;
 Label254.Order = 10;
 Label254.Left = 60;
 Label254.Top = 125;
 Label254.Width = 64;
 Label254.Height = 20;
 Label254.Visible = 1;
 Label254.Active = 1;
 Label254.Caption = Label254_Caption;
 Label254.FontName =  0x00005242 ;
 Label254.Font_Color = 0xFFFF;
 Label254.VerticalText = 0;
 Label254.OnUpPtr = 0;
 Label254.OnDownPtr = 0;
 Label254.OnClickPtr = 0;
 Label254.OnPressPtr = 0;

 Label255.OwnerScreen = &ENERGY;
 Label255.Order = 11;
 Label255.Left = 260;
 Label255.Top = 125;
 Label255.Width = 11;
 Label255.Height = 20;
 Label255.Visible = 1;
 Label255.Active = 1;
 Label255.Caption = Label255_Caption;
 Label255.FontName =  0x00005242 ;
 Label255.Font_Color = 0xFFFF;
 Label255.VerticalText = 0;
 Label255.OnUpPtr = 0;
 Label255.OnDownPtr = 0;
 Label255.OnClickPtr = 0;
 Label255.OnPressPtr = 0;

 S_Current_2.OwnerScreen = &ENERGY;
 S_Current_2.Order = 12;
 S_Current_2.Left = 295;
 S_Current_2.Top = 120;
 S_Current_2.Width = 65;
 S_Current_2.Height = 27;
 S_Current_2.Pen_Width = 1;
 S_Current_2.Pen_Color = 0x0000;
 S_Current_2.Visible = 1;
 S_Current_2.Active = 1;
 S_Current_2.Transparent = 1;
 S_Current_2.Caption = S_Current_2_Caption;
 S_Current_2.TextAlign = _taCenter;
 S_Current_2.TextAlignVertical= _tavMiddle;
 S_Current_2.FontName =  0x00005242 ;
 S_Current_2.PressColEnabled = 1;
 S_Current_2.Font_Color = 0xC800;
 S_Current_2.VerticalText = 0;
 S_Current_2.Gradient = 0;
 S_Current_2.Gradient_Orientation = 0;
 S_Current_2.Gradient_Start_Color = 0xFFFF;
 S_Current_2.Gradient_End_Color = 0xC618;
 S_Current_2.Color = 0xF7BE;
 S_Current_2.Press_Color = 0xE71C;
 S_Current_2.Corner_Radius = 3;
 S_Current_2.OnUpPtr = 0;
 S_Current_2.OnDownPtr = 0;
 S_Current_2.OnClickPtr = 0;
 S_Current_2.OnPressPtr = 0;

 Label256.OwnerScreen = &ENERGY;
 Label256.Order = 13;
 Label256.Left = 370;
 Label256.Top = 125;
 Label256.Width = 11;
 Label256.Height = 20;
 Label256.Visible = 1;
 Label256.Active = 1;
 Label256.Caption = Label256_Caption;
 Label256.FontName =  0x00005242 ;
 Label256.Font_Color = 0xFFFF;
 Label256.VerticalText = 0;
 Label256.OnUpPtr = 0;
 Label256.OnDownPtr = 0;
 Label256.OnClickPtr = 0;
 Label256.OnPressPtr = 0;

 Energy_Volt_3.OwnerScreen = &ENERGY;
 Energy_Volt_3.Order = 14;
 Energy_Volt_3.Left = 185;
 Energy_Volt_3.Top = 155;
 Energy_Volt_3.Width = 65;
 Energy_Volt_3.Height = 27;
 Energy_Volt_3.Pen_Width = 1;
 Energy_Volt_3.Pen_Color = 0x0000;
 Energy_Volt_3.Visible = 1;
 Energy_Volt_3.Active = 1;
 Energy_Volt_3.Transparent = 1;
 Energy_Volt_3.Caption = Energy_Volt_3_Caption;
 Energy_Volt_3.TextAlign = _taCenter;
 Energy_Volt_3.TextAlignVertical= _tavMiddle;
 Energy_Volt_3.FontName =  0x00005242 ;
 Energy_Volt_3.PressColEnabled = 1;
 Energy_Volt_3.Font_Color = 0x0210;
 Energy_Volt_3.VerticalText = 0;
 Energy_Volt_3.Gradient = 0;
 Energy_Volt_3.Gradient_Orientation = 0;
 Energy_Volt_3.Gradient_Start_Color = 0xFFFF;
 Energy_Volt_3.Gradient_End_Color = 0xC618;
 Energy_Volt_3.Color = 0xF7BE;
 Energy_Volt_3.Press_Color = 0xE71C;
 Energy_Volt_3.Corner_Radius = 3;
 Energy_Volt_3.OnUpPtr = 0;
 Energy_Volt_3.OnDownPtr = 0;
 Energy_Volt_3.OnClickPtr = 0;
 Energy_Volt_3.OnPressPtr = 0;

 Label257.OwnerScreen = &ENERGY;
 Label257.Order = 15;
 Label257.Left = 60;
 Label257.Top = 160;
 Label257.Width = 65;
 Label257.Height = 20;
 Label257.Visible = 1;
 Label257.Active = 1;
 Label257.Caption = Label257_Caption;
 Label257.FontName =  0x00005242 ;
 Label257.Font_Color = 0xFFFF;
 Label257.VerticalText = 0;
 Label257.OnUpPtr = 0;
 Label257.OnDownPtr = 0;
 Label257.OnClickPtr = 0;
 Label257.OnPressPtr = 0;

 Label258.OwnerScreen = &ENERGY;
 Label258.Order = 16;
 Label258.Left = 260;
 Label258.Top = 160;
 Label258.Width = 11;
 Label258.Height = 20;
 Label258.Visible = 1;
 Label258.Active = 1;
 Label258.Caption = Label258_Caption;
 Label258.FontName =  0x00005242 ;
 Label258.Font_Color = 0xFFFF;
 Label258.VerticalText = 0;
 Label258.OnUpPtr = 0;
 Label258.OnDownPtr = 0;
 Label258.OnClickPtr = 0;
 Label258.OnPressPtr = 0;

 S_Current_3.OwnerScreen = &ENERGY;
 S_Current_3.Order = 17;
 S_Current_3.Left = 295;
 S_Current_3.Top = 155;
 S_Current_3.Width = 65;
 S_Current_3.Height = 27;
 S_Current_3.Pen_Width = 1;
 S_Current_3.Pen_Color = 0x0000;
 S_Current_3.Visible = 1;
 S_Current_3.Active = 1;
 S_Current_3.Transparent = 1;
 S_Current_3.Caption = S_Current_3_Caption;
 S_Current_3.TextAlign = _taCenter;
 S_Current_3.TextAlignVertical= _tavMiddle;
 S_Current_3.FontName =  0x00005242 ;
 S_Current_3.PressColEnabled = 1;
 S_Current_3.Font_Color = 0xC800;
 S_Current_3.VerticalText = 0;
 S_Current_3.Gradient = 0;
 S_Current_3.Gradient_Orientation = 0;
 S_Current_3.Gradient_Start_Color = 0xFFFF;
 S_Current_3.Gradient_End_Color = 0xC618;
 S_Current_3.Color = 0xF7BE;
 S_Current_3.Press_Color = 0xE71C;
 S_Current_3.Corner_Radius = 3;
 S_Current_3.OnUpPtr = 0;
 S_Current_3.OnDownPtr = 0;
 S_Current_3.OnClickPtr = 0;
 S_Current_3.OnPressPtr = 0;

 Label259.OwnerScreen = &ENERGY;
 Label259.Order = 18;
 Label259.Left = 370;
 Label259.Top = 160;
 Label259.Width = 11;
 Label259.Height = 20;
 Label259.Visible = 1;
 Label259.Active = 1;
 Label259.Caption = Label259_Caption;
 Label259.FontName =  0x00005242 ;
 Label259.Font_Color = 0xFFFF;
 Label259.VerticalText = 0;
 Label259.OnUpPtr = 0;
 Label259.OnDownPtr = 0;
 Label259.OnClickPtr = 0;
 Label259.OnPressPtr = 0;

 Energy_Power_1.OwnerScreen = &ENERGY;
 Energy_Power_1.Order = 19;
 Energy_Power_1.Left = 185;
 Energy_Power_1.Top = 50;
 Energy_Power_1.Width = 65;
 Energy_Power_1.Height = 27;
 Energy_Power_1.Pen_Width = 1;
 Energy_Power_1.Pen_Color = 0x0000;
 Energy_Power_1.Visible = 1;
 Energy_Power_1.Active = 1;
 Energy_Power_1.Transparent = 1;
 Energy_Power_1.Caption = Energy_Power_1_Caption;
 Energy_Power_1.TextAlign = _taCenter;
 Energy_Power_1.TextAlignVertical= _tavMiddle;
 Energy_Power_1.FontName =  0x00005242 ;
 Energy_Power_1.PressColEnabled = 1;
 Energy_Power_1.Font_Color = 0x0580;
 Energy_Power_1.VerticalText = 0;
 Energy_Power_1.Gradient = 0;
 Energy_Power_1.Gradient_Orientation = 0;
 Energy_Power_1.Gradient_Start_Color = 0xFFFF;
 Energy_Power_1.Gradient_End_Color = 0xC618;
 Energy_Power_1.Color = 0xF7BE;
 Energy_Power_1.Press_Color = 0xE71C;
 Energy_Power_1.Corner_Radius = 3;
 Energy_Power_1.OnUpPtr = 0;
 Energy_Power_1.OnDownPtr = 0;
 Energy_Power_1.OnClickPtr = 0;
 Energy_Power_1.OnPressPtr = 0;

 Label260.OwnerScreen = &ENERGY;
 Label260.Order = 20;
 Label260.Left = 260;
 Label260.Top = 55;
 Label260.Width = 24;
 Label260.Height = 20;
 Label260.Visible = 1;
 Label260.Active = 1;
 Label260.Caption = Label260_Caption;
 Label260.FontName =  0x00005242 ;
 Label260.Font_Color = 0xFFFF;
 Label260.VerticalText = 0;
 Label260.OnUpPtr = 0;
 Label260.OnDownPtr = 0;
 Label260.OnClickPtr = 0;
 Label260.OnPressPtr = 0;

 Label261.OwnerScreen = &ENERGY;
 Label261.Order = 21;
 Label261.Left = 60;
 Label261.Top = 55;
 Label261.Width = 48;
 Label261.Height = 20;
 Label261.Visible = 1;
 Label261.Active = 1;
 Label261.Caption = Label261_Caption;
 Label261.FontName =  0x00005242 ;
 Label261.Font_Color = 0xFFFF;
 Label261.VerticalText = 0;
 Label261.OnUpPtr = 0;
 Label261.OnDownPtr = 0;
 Label261.OnClickPtr = 0;
 Label261.OnPressPtr = 0;

 ButtonRound12.OwnerScreen = &ENERGY;
 ButtonRound12.Order = 22;
 ButtonRound12.Left = 185;
 ButtonRound12.Top = 190;
 ButtonRound12.Width = 65;
 ButtonRound12.Height = 27;
 ButtonRound12.Pen_Width = 1;
 ButtonRound12.Pen_Color = 0x0000;
 ButtonRound12.Visible = 1;
 ButtonRound12.Active = 1;
 ButtonRound12.Transparent = 1;
 ButtonRound12.Caption = ButtonRound12_Caption;
 ButtonRound12.TextAlign = _taCenter;
 ButtonRound12.TextAlignVertical= _tavMiddle;
 ButtonRound12.FontName =  0x00005242 ;
 ButtonRound12.PressColEnabled = 1;
 ButtonRound12.Font_Color = 0x0580;
 ButtonRound12.VerticalText = 0;
 ButtonRound12.Gradient = 0;
 ButtonRound12.Gradient_Orientation = 0;
 ButtonRound12.Gradient_Start_Color = 0xFFFF;
 ButtonRound12.Gradient_End_Color = 0xC618;
 ButtonRound12.Color = 0xF7BE;
 ButtonRound12.Press_Color = 0xE71C;
 ButtonRound12.Corner_Radius = 3;
 ButtonRound12.OnUpPtr = 0;
 ButtonRound12.OnDownPtr = 0;
 ButtonRound12.OnClickPtr = 0;
 ButtonRound12.OnPressPtr = 0;

 Label400.OwnerScreen = &ENERGY;
 Label400.Order = 23;
 Label400.Left = 260;
 Label400.Top = 195;
 Label400.Width = 24;
 Label400.Height = 20;
 Label400.Visible = 1;
 Label400.Active = 1;
 Label400.Caption = Label400_Caption;
 Label400.FontName =  0x00005242 ;
 Label400.Font_Color = 0xFFFF;
 Label400.VerticalText = 0;
 Label400.OnUpPtr = 0;
 Label400.OnDownPtr = 0;
 Label400.OnClickPtr = 0;
 Label400.OnPressPtr = 0;

 Label401.OwnerScreen = &ENERGY;
 Label401.Order = 24;
 Label401.Left = 60;
 Label401.Top = 195;
 Label401.Width = 87;
 Label401.Height = 20;
 Label401.Visible = 1;
 Label401.Active = 1;
 Label401.Caption = Label401_Caption;
 Label401.FontName =  0x00005242 ;
 Label401.Font_Color = 0xFFFF;
 Label401.VerticalText = 0;
 Label401.OnUpPtr = 0;
 Label401.OnDownPtr = 0;
 Label401.OnClickPtr = 0;
 Label401.OnPressPtr = 0;

 Image82.OwnerScreen = &DEFROST;
 Image82.Order = 0;
 Image82.Left = 0;
 Image82.Top = 0;
 Image82.Width = 480;
 Image82.Height = 272;
 Image82.Picture_Type = 1;
 Image82.Picture_Ratio = 1;
 Image82.Picture_Name =  0x00510FBC ;
 Image82.Visible = 1;
 Image82.Active = 1;
 Image82.OnUpPtr = 0;
 Image82.OnDownPtr = 0;
 Image82.OnClickPtr = 0;
 Image82.OnPressPtr = 0;

 Image388.OwnerScreen = &DEFROST;
 Image388.Order = 1;
 Image388.Left = 439;
 Image388.Top = 127;
 Image388.Width = 34;
 Image388.Height = 32;
 Image388.Picture_Type = 1;
 Image388.Picture_Ratio = 1;
 Image388.Picture_Name =  0x0016D51E ;
 Image388.Visible = 1;
 Image388.Active = 0;
 Image388.OnUpPtr = 0;
 Image388.OnDownPtr = 0;
 Image388.OnClickPtr = 0;
 Image388.OnPressPtr = 0;

 Defrost_set4.OwnerScreen = &DEFROST;
 Defrost_set4.Order = 2;
 Defrost_set4.Left = 439;
 Defrost_set4.Top = 128;
 Defrost_set4.Width = 34;
 Defrost_set4.Height = 32;
 Defrost_set4.Picture_Type = 1;
 Defrost_set4.Picture_Ratio = 1;
 Defrost_set4.Picture_Name =  0x0016E4AA ;
 Defrost_set4.Visible = 1;
 Defrost_set4.Active = 1;
 Defrost_set4.OnUpPtr = 0;
 Defrost_set4.OnDownPtr = 0;
 Defrost_set4.OnClickPtr = 0;
 Defrost_set4.OnPressPtr = 0;

 Image355.OwnerScreen = &DEFROST;
 Image355.Order = 3;
 Image355.Left = 439;
 Image355.Top = 32;
 Image355.Width = 34;
 Image355.Height = 32;
 Image355.Picture_Type = 1;
 Image355.Picture_Ratio = 1;
 Image355.Picture_Name =  0x0016D51E ;
 Image355.Visible = 1;
 Image355.Active = 0;
 Image355.OnUpPtr = 0;
 Image355.OnDownPtr = 0;
 Image355.OnClickPtr = 0;
 Image355.OnPressPtr = 0;

 Image198.OwnerScreen = &DEFROST;
 Image198.Order = 4;
 Image198.Left = 377;
 Image198.Top = 32;
 Image198.Width = 28;
 Image198.Height = 32;
 Image198.Picture_Type = 1;
 Image198.Picture_Ratio = 1;
 Image198.Picture_Name =  0x0016C712 ;
 Image198.Visible = 1;
 Image198.Active = 0;
 Image198.OnUpPtr = 0;
 Image198.OnDownPtr = 0;
 Image198.OnClickPtr = 0;
 Image198.OnPressPtr = 0;

 Image199.OwnerScreen = &DEFROST;
 Image199.Order = 5;
 Image199.Left = 408;
 Image199.Top = 33;
 Image199.Width = 28;
 Image199.Height = 32;
 Image199.Picture_Type = 1;
 Image199.Picture_Ratio = 1;
 Image199.Picture_Name =  0x0016CE18 ;
 Image199.Visible = 1;
 Image199.Active = 0;
 Image199.OnUpPtr = 0;
 Image199.OnDownPtr = 0;
 Image199.OnClickPtr = 0;
 Image199.OnPressPtr = 0;

 Defrost_on_time.OwnerScreen = &DEFROST;
 Defrost_on_time.Order = 6;
 Defrost_on_time.Left = 299;
 Defrost_on_time.Top = 36;
 Defrost_on_time.Width = 41;
 Defrost_on_time.Height = 23;
 Defrost_on_time.Pen_Width = 1;
 Defrost_on_time.Pen_Color = 0x0000;
 Defrost_on_time.Visible = 1;
 Defrost_on_time.Active = 0;
 Defrost_on_time.Transparent = 1;
 Defrost_on_time.Caption = Defrost_on_time_Caption;
 Defrost_on_time.TextAlign = _taCenter;
 Defrost_on_time.TextAlignVertical= _tavMiddle;
 Defrost_on_time.FontName =  0x00005242 ;
 Defrost_on_time.PressColEnabled = 1;
 Defrost_on_time.Font_Color = 0x0408;
 Defrost_on_time.VerticalText = 0;
 Defrost_on_time.Gradient = 0;
 Defrost_on_time.Gradient_Orientation = 0;
 Defrost_on_time.Gradient_Start_Color = 0xFFFF;
 Defrost_on_time.Gradient_End_Color = 0xC618;
 Defrost_on_time.Color = 0xFFFF;
 Defrost_on_time.Press_Color = 0xE71C;
 Defrost_on_time.Corner_Radius = 2;
 Defrost_on_time.OnUpPtr = 0;
 Defrost_on_time.OnDownPtr = 0;
 Defrost_on_time.OnClickPtr = 0;
 Defrost_on_time.OnPressPtr = 0;

 Image377.OwnerScreen = &DEFROST;
 Image377.Order = 7;
 Image377.Left = 377;
 Image377.Top = 64;
 Image377.Width = 28;
 Image377.Height = 32;
 Image377.Picture_Type = 1;
 Image377.Picture_Ratio = 1;
 Image377.Picture_Name =  0x0016C712 ;
 Image377.Visible = 1;
 Image377.Active = 0;
 Image377.OnUpPtr = 0;
 Image377.OnDownPtr = 0;
 Image377.OnClickPtr = 0;
 Image377.OnPressPtr = 0;

 Image379.OwnerScreen = &DEFROST;
 Image379.Order = 8;
 Image379.Left = 408;
 Image379.Top = 64;
 Image379.Width = 28;
 Image379.Height = 32;
 Image379.Picture_Type = 1;
 Image379.Picture_Ratio = 1;
 Image379.Picture_Name =  0x0016CE18 ;
 Image379.Visible = 1;
 Image379.Active = 0;
 Image379.OnUpPtr = 0;
 Image379.OnDownPtr = 0;
 Image379.OnClickPtr = 0;
 Image379.OnPressPtr = 0;

 Image382.OwnerScreen = &DEFROST;
 Image382.Order = 9;
 Image382.Left = 377;
 Image382.Top = 96;
 Image382.Width = 28;
 Image382.Height = 32;
 Image382.Picture_Type = 1;
 Image382.Picture_Ratio = 1;
 Image382.Picture_Name =  0x0016C712 ;
 Image382.Visible = 1;
 Image382.Active = 0;
 Image382.OnUpPtr = 0;
 Image382.OnDownPtr = 0;
 Image382.OnClickPtr = 0;
 Image382.OnPressPtr = 0;

 Image383.OwnerScreen = &DEFROST;
 Image383.Order = 10;
 Image383.Left = 408;
 Image383.Top = 96;
 Image383.Width = 28;
 Image383.Height = 32;
 Image383.Picture_Type = 1;
 Image383.Picture_Ratio = 1;
 Image383.Picture_Name =  0x0016CE18 ;
 Image383.Visible = 1;
 Image383.Active = 0;
 Image383.OnUpPtr = 0;
 Image383.OnDownPtr = 0;
 Image383.OnClickPtr = 0;
 Image383.OnPressPtr = 0;

 Image381.OwnerScreen = &DEFROST;
 Image381.Order = 11;
 Image381.Left = 439;
 Image381.Top = 65;
 Image381.Width = 34;
 Image381.Height = 32;
 Image381.Picture_Type = 1;
 Image381.Picture_Ratio = 1;
 Image381.Picture_Name =  0x0016D51E ;
 Image381.Visible = 1;
 Image381.Active = 0;
 Image381.OnUpPtr = 0;
 Image381.OnDownPtr = 0;
 Image381.OnClickPtr = 0;
 Image381.OnPressPtr = 0;

 Image384.OwnerScreen = &DEFROST;
 Image384.Order = 12;
 Image384.Left = 439;
 Image384.Top = 96;
 Image384.Width = 34;
 Image384.Height = 32;
 Image384.Picture_Type = 1;
 Image384.Picture_Ratio = 1;
 Image384.Picture_Name =  0x0016D51E ;
 Image384.Visible = 1;
 Image384.Active = 0;
 Image384.OnUpPtr = 0;
 Image384.OnDownPtr = 0;
 Image384.OnClickPtr = 0;
 Image384.OnPressPtr = 0;

 Defrost_off_time.OwnerScreen = &DEFROST;
 Defrost_off_time.Order = 13;
 Defrost_off_time.Left = 299;
 Defrost_off_time.Top = 67;
 Defrost_off_time.Width = 42;
 Defrost_off_time.Height = 23;
 Defrost_off_time.Pen_Width = 1;
 Defrost_off_time.Pen_Color = 0x0000;
 Defrost_off_time.Visible = 1;
 Defrost_off_time.Active = 0;
 Defrost_off_time.Transparent = 1;
 Defrost_off_time.Caption = Defrost_off_time_Caption;
 Defrost_off_time.TextAlign = _taCenter;
 Defrost_off_time.TextAlignVertical= _tavMiddle;
 Defrost_off_time.FontName =  0x00005242 ;
 Defrost_off_time.PressColEnabled = 1;
 Defrost_off_time.Font_Color = 0x0408;
 Defrost_off_time.VerticalText = 0;
 Defrost_off_time.Gradient = 0;
 Defrost_off_time.Gradient_Orientation = 0;
 Defrost_off_time.Gradient_Start_Color = 0xFFFF;
 Defrost_off_time.Gradient_End_Color = 0xC618;
 Defrost_off_time.Color = 0xFFFF;
 Defrost_off_time.Press_Color = 0xE71C;
 Defrost_off_time.Corner_Radius = 2;
 Defrost_off_time.OnUpPtr = 0;
 Defrost_off_time.OnDownPtr = 0;
 Defrost_off_time.OnClickPtr = 0;
 Defrost_off_time.OnPressPtr = 0;

 Defrost_on_temperature.OwnerScreen = &DEFROST;
 Defrost_on_temperature.Order = 14;
 Defrost_on_temperature.Left = 299;
 Defrost_on_temperature.Top = 99;
 Defrost_on_temperature.Width = 42;
 Defrost_on_temperature.Height = 23;
 Defrost_on_temperature.Pen_Width = 1;
 Defrost_on_temperature.Pen_Color = 0x0000;
 Defrost_on_temperature.Visible = 1;
 Defrost_on_temperature.Active = 0;
 Defrost_on_temperature.Transparent = 1;
 Defrost_on_temperature.Caption = Defrost_on_temperature_Caption;
 Defrost_on_temperature.TextAlign = _taCenter;
 Defrost_on_temperature.TextAlignVertical= _tavMiddle;
 Defrost_on_temperature.FontName =  0x00005242 ;
 Defrost_on_temperature.PressColEnabled = 1;
 Defrost_on_temperature.Font_Color = 0x0408;
 Defrost_on_temperature.VerticalText = 0;
 Defrost_on_temperature.Gradient = 0;
 Defrost_on_temperature.Gradient_Orientation = 0;
 Defrost_on_temperature.Gradient_Start_Color = 0xFFFF;
 Defrost_on_temperature.Gradient_End_Color = 0xC618;
 Defrost_on_temperature.Color = 0xFFFF;
 Defrost_on_temperature.Press_Color = 0xE71C;
 Defrost_on_temperature.Corner_Radius = 2;
 Defrost_on_temperature.OnUpPtr = 0;
 Defrost_on_temperature.OnDownPtr = 0;
 Defrost_on_temperature.OnClickPtr = 0;
 Defrost_on_temperature.OnPressPtr = 0;

 Defrost_off_temperature.OwnerScreen = &DEFROST;
 Defrost_off_temperature.Order = 15;
 Defrost_off_temperature.Left = 298;
 Defrost_off_temperature.Top = 131;
 Defrost_off_temperature.Width = 43;
 Defrost_off_temperature.Height = 23;
 Defrost_off_temperature.Pen_Width = 1;
 Defrost_off_temperature.Pen_Color = 0x0000;
 Defrost_off_temperature.Visible = 1;
 Defrost_off_temperature.Active = 0;
 Defrost_off_temperature.Transparent = 1;
 Defrost_off_temperature.Caption = Defrost_off_temperature_Caption;
 Defrost_off_temperature.TextAlign = _taCenter;
 Defrost_off_temperature.TextAlignVertical= _tavMiddle;
 Defrost_off_temperature.FontName =  0x00005242 ;
 Defrost_off_temperature.PressColEnabled = 1;
 Defrost_off_temperature.Font_Color = 0x0408;
 Defrost_off_temperature.VerticalText = 0;
 Defrost_off_temperature.Gradient = 0;
 Defrost_off_temperature.Gradient_Orientation = 0;
 Defrost_off_temperature.Gradient_Start_Color = 0xFFFF;
 Defrost_off_temperature.Gradient_End_Color = 0xC618;
 Defrost_off_temperature.Color = 0xFFFF;
 Defrost_off_temperature.Press_Color = 0xE71C;
 Defrost_off_temperature.Corner_Radius = 2;
 Defrost_off_temperature.OnUpPtr = 0;
 Defrost_off_temperature.OnDownPtr = 0;
 Defrost_off_temperature.OnClickPtr = 0;
 Defrost_off_temperature.OnPressPtr = 0;

 Home_b29.OwnerScreen = &DEFROST;
 Home_b29.Order = 16;
 Home_b29.Left = 246;
 Home_b29.Top = 232;
 Home_b29.Width = 78;
 Home_b29.Height = 35;
 Home_b29.Pen_Width = 1;
 Home_b29.Pen_Color = 0xC618;
 Home_b29.Visible = 1;
 Home_b29.Active = 1;
 Home_b29.Transparent = 1;
 Home_b29.Caption = Home_b29_Caption;
 Home_b29.TextAlign = _taCenter;
 Home_b29.TextAlignVertical= _tavMiddle;
 Home_b29.FontName =  0x00005242 ;
 Home_b29.PressColEnabled = 1;
 Home_b29.Font_Color = 0xD6BA;
 Home_b29.VerticalText = 0;
 Home_b29.Gradient = 1;
 Home_b29.Gradient_Orientation = 0;
 Home_b29.Gradient_Start_Color = 0x0418;
 Home_b29.Gradient_End_Color = 0x00A5;
 Home_b29.Color = 0xC618;
 Home_b29.Press_Color = 0xE71C;
 Home_b29.Corner_Radius = 5;
 Home_b29.OnUpPtr = 0;
 Home_b29.OnDownPtr = 0;
 Home_b29.OnClickPtr = BackToHome;
 Home_b29.OnPressPtr = 0;

 Back_b25.OwnerScreen = &DEFROST;
 Back_b25.Order = 17;
 Back_b25.Left = 162;
 Back_b25.Top = 232;
 Back_b25.Width = 78;
 Back_b25.Height = 35;
 Back_b25.Pen_Width = 1;
 Back_b25.Pen_Color = 0xC618;
 Back_b25.Visible = 1;
 Back_b25.Active = 1;
 Back_b25.Transparent = 1;
 Back_b25.Caption = Back_b25_Caption;
 Back_b25.TextAlign = _taCenter;
 Back_b25.TextAlignVertical= _tavMiddle;
 Back_b25.FontName =  0x00005242 ;
 Back_b25.PressColEnabled = 1;
 Back_b25.Font_Color = 0xD6BA;
 Back_b25.VerticalText = 0;
 Back_b25.Gradient = 1;
 Back_b25.Gradient_Orientation = 0;
 Back_b25.Gradient_Start_Color = 0x0418;
 Back_b25.Gradient_End_Color = 0x00A5;
 Back_b25.Color = 0xC618;
 Back_b25.Press_Color = 0xE71C;
 Back_b25.Corner_Radius = 5;
 Back_b25.OnUpPtr = 0;
 Back_b25.OnDownPtr = 0;
 Back_b25.OnClickPtr = goToBack;
 Back_b25.OnPressPtr = 0;

 Defrost_minus1.OwnerScreen = &DEFROST;
 Defrost_minus1.Order = 18;
 Defrost_minus1.Left = 377;
 Defrost_minus1.Top = 33;
 Defrost_minus1.Width = 28;
 Defrost_minus1.Height = 32;
 Defrost_minus1.Picture_Type = 1;
 Defrost_minus1.Picture_Ratio = 1;
 Defrost_minus1.Picture_Name =  0x0016ED30 ;
 Defrost_minus1.Visible = 1;
 Defrost_minus1.Active = 1;
 Defrost_minus1.OnUpPtr = 0;
 Defrost_minus1.OnDownPtr = 0;
 Defrost_minus1.OnClickPtr = 0;
 Defrost_minus1.OnPressPtr = 0;

 Defrost_minus2.OwnerScreen = &DEFROST;
 Defrost_minus2.Order = 19;
 Defrost_minus2.Left = 377;
 Defrost_minus2.Top = 64;
 Defrost_minus2.Width = 28;
 Defrost_minus2.Height = 32;
 Defrost_minus2.Picture_Type = 1;
 Defrost_minus2.Picture_Ratio = 1;
 Defrost_minus2.Picture_Name =  0x0016ED30 ;
 Defrost_minus2.Visible = 1;
 Defrost_minus2.Active = 1;
 Defrost_minus2.OnUpPtr = 0;
 Defrost_minus2.OnDownPtr = 0;
 Defrost_minus2.OnClickPtr = 0;
 Defrost_minus2.OnPressPtr = 0;

 Defrost_minus3.OwnerScreen = &DEFROST;
 Defrost_minus3.Order = 20;
 Defrost_minus3.Left = 377;
 Defrost_minus3.Top = 96;
 Defrost_minus3.Width = 28;
 Defrost_minus3.Height = 32;
 Defrost_minus3.Picture_Type = 1;
 Defrost_minus3.Picture_Ratio = 1;
 Defrost_minus3.Picture_Name =  0x0016ED30 ;
 Defrost_minus3.Visible = 1;
 Defrost_minus3.Active = 1;
 Defrost_minus3.OnUpPtr = 0;
 Defrost_minus3.OnDownPtr = 0;
 Defrost_minus3.OnClickPtr = 0;
 Defrost_minus3.OnPressPtr = 0;

 Defrost_plus1.OwnerScreen = &DEFROST;
 Defrost_plus1.Order = 21;
 Defrost_plus1.Left = 408;
 Defrost_plus1.Top = 33;
 Defrost_plus1.Width = 28;
 Defrost_plus1.Height = 32;
 Defrost_plus1.Picture_Type = 1;
 Defrost_plus1.Picture_Ratio = 1;
 Defrost_plus1.Picture_Name =  0x0016DDA4 ;
 Defrost_plus1.Visible = 1;
 Defrost_plus1.Active = 1;
 Defrost_plus1.OnUpPtr = 0;
 Defrost_plus1.OnDownPtr = 0;
 Defrost_plus1.OnClickPtr = 0;
 Defrost_plus1.OnPressPtr = 0;

 Defrost_plus2.OwnerScreen = &DEFROST;
 Defrost_plus2.Order = 22;
 Defrost_plus2.Left = 408;
 Defrost_plus2.Top = 64;
 Defrost_plus2.Width = 28;
 Defrost_plus2.Height = 32;
 Defrost_plus2.Picture_Type = 1;
 Defrost_plus2.Picture_Ratio = 1;
 Defrost_plus2.Picture_Name =  0x0016DDA4 ;
 Defrost_plus2.Visible = 1;
 Defrost_plus2.Active = 1;
 Defrost_plus2.OnUpPtr = 0;
 Defrost_plus2.OnDownPtr = 0;
 Defrost_plus2.OnClickPtr = 0;
 Defrost_plus2.OnPressPtr = 0;

 Defrost_plus3.OwnerScreen = &DEFROST;
 Defrost_plus3.Order = 23;
 Defrost_plus3.Left = 408;
 Defrost_plus3.Top = 96;
 Defrost_plus3.Width = 28;
 Defrost_plus3.Height = 32;
 Defrost_plus3.Picture_Type = 1;
 Defrost_plus3.Picture_Ratio = 1;
 Defrost_plus3.Picture_Name =  0x0016DDA4 ;
 Defrost_plus3.Visible = 1;
 Defrost_plus3.Active = 1;
 Defrost_plus3.OnUpPtr = 0;
 Defrost_plus3.OnDownPtr = 0;
 Defrost_plus3.OnClickPtr = 0;
 Defrost_plus3.OnPressPtr = 0;

 Defrost_set1.OwnerScreen = &DEFROST;
 Defrost_set1.Order = 24;
 Defrost_set1.Left = 439;
 Defrost_set1.Top = 32;
 Defrost_set1.Width = 34;
 Defrost_set1.Height = 32;
 Defrost_set1.Picture_Type = 1;
 Defrost_set1.Picture_Ratio = 1;
 Defrost_set1.Picture_Name =  0x0016E4AA ;
 Defrost_set1.Visible = 1;
 Defrost_set1.Active = 1;
 Defrost_set1.OnUpPtr = 0;
 Defrost_set1.OnDownPtr = 0;
 Defrost_set1.OnClickPtr = 0;
 Defrost_set1.OnPressPtr = 0;

 Defrost_set2.OwnerScreen = &DEFROST;
 Defrost_set2.Order = 25;
 Defrost_set2.Left = 439;
 Defrost_set2.Top = 64;
 Defrost_set2.Width = 34;
 Defrost_set2.Height = 32;
 Defrost_set2.Picture_Type = 1;
 Defrost_set2.Picture_Ratio = 1;
 Defrost_set2.Picture_Name =  0x0016E4AA ;
 Defrost_set2.Visible = 1;
 Defrost_set2.Active = 1;
 Defrost_set2.OnUpPtr = 0;
 Defrost_set2.OnDownPtr = 0;
 Defrost_set2.OnClickPtr = 0;
 Defrost_set2.OnPressPtr = 0;

 Defrost_set3.OwnerScreen = &DEFROST;
 Defrost_set3.Order = 26;
 Defrost_set3.Left = 439;
 Defrost_set3.Top = 96;
 Defrost_set3.Width = 34;
 Defrost_set3.Height = 32;
 Defrost_set3.Picture_Type = 1;
 Defrost_set3.Picture_Ratio = 1;
 Defrost_set3.Picture_Name =  0x0016E4AA ;
 Defrost_set3.Visible = 1;
 Defrost_set3.Active = 1;
 Defrost_set3.OnUpPtr = 0;
 Defrost_set3.OnDownPtr = 0;
 Defrost_set3.OnClickPtr = 0;
 Defrost_set3.OnPressPtr = 0;

 Image386.OwnerScreen = &DEFROST;
 Image386.Order = 27;
 Image386.Left = 377;
 Image386.Top = 128;
 Image386.Width = 28;
 Image386.Height = 32;
 Image386.Picture_Type = 1;
 Image386.Picture_Ratio = 1;
 Image386.Picture_Name =  0x0016C712 ;
 Image386.Visible = 1;
 Image386.Active = 0;
 Image386.OnUpPtr = 0;
 Image386.OnDownPtr = 0;
 Image386.OnClickPtr = 0;
 Image386.OnPressPtr = 0;

 Image387.OwnerScreen = &DEFROST;
 Image387.Order = 28;
 Image387.Left = 408;
 Image387.Top = 128;
 Image387.Width = 28;
 Image387.Height = 32;
 Image387.Picture_Type = 1;
 Image387.Picture_Ratio = 1;
 Image387.Picture_Name =  0x0016CE18 ;
 Image387.Visible = 1;
 Image387.Active = 0;
 Image387.OnUpPtr = 0;
 Image387.OnDownPtr = 0;
 Image387.OnClickPtr = 0;
 Image387.OnPressPtr = 0;

 Defrost_plus4.OwnerScreen = &DEFROST;
 Defrost_plus4.Order = 29;
 Defrost_plus4.Left = 408;
 Defrost_plus4.Top = 128;
 Defrost_plus4.Width = 28;
 Defrost_plus4.Height = 32;
 Defrost_plus4.Picture_Type = 1;
 Defrost_plus4.Picture_Ratio = 1;
 Defrost_plus4.Picture_Name =  0x0016DDA4 ;
 Defrost_plus4.Visible = 1;
 Defrost_plus4.Active = 1;
 Defrost_plus4.OnUpPtr = 0;
 Defrost_plus4.OnDownPtr = 0;
 Defrost_plus4.OnClickPtr = 0;
 Defrost_plus4.OnPressPtr = 0;

 Defrost_minus4.OwnerScreen = &DEFROST;
 Defrost_minus4.Order = 30;
 Defrost_minus4.Left = 377;
 Defrost_minus4.Top = 128;
 Defrost_minus4.Width = 28;
 Defrost_minus4.Height = 32;
 Defrost_minus4.Picture_Type = 1;
 Defrost_minus4.Picture_Ratio = 1;
 Defrost_minus4.Picture_Name =  0x0016ED30 ;
 Defrost_minus4.Visible = 1;
 Defrost_minus4.Active = 1;
 Defrost_minus4.OnUpPtr = 0;
 Defrost_minus4.OnDownPtr = 0;
 Defrost_minus4.OnClickPtr = 0;
 Defrost_minus4.OnPressPtr = 0;

 Defrost_on_humidity.OwnerScreen = &DEFROST;
 Defrost_on_humidity.Order = 31;
 Defrost_on_humidity.Left = 298;
 Defrost_on_humidity.Top = 163;
 Defrost_on_humidity.Width = 43;
 Defrost_on_humidity.Height = 23;
 Defrost_on_humidity.Pen_Width = 1;
 Defrost_on_humidity.Pen_Color = 0x0000;
 Defrost_on_humidity.Visible = 1;
 Defrost_on_humidity.Active = 0;
 Defrost_on_humidity.Transparent = 1;
 Defrost_on_humidity.Caption = Defrost_on_humidity_Caption;
 Defrost_on_humidity.TextAlign = _taCenter;
 Defrost_on_humidity.TextAlignVertical= _tavMiddle;
 Defrost_on_humidity.FontName =  0x00005242 ;
 Defrost_on_humidity.PressColEnabled = 1;
 Defrost_on_humidity.Font_Color = 0x0408;
 Defrost_on_humidity.VerticalText = 0;
 Defrost_on_humidity.Gradient = 0;
 Defrost_on_humidity.Gradient_Orientation = 0;
 Defrost_on_humidity.Gradient_Start_Color = 0xFFFF;
 Defrost_on_humidity.Gradient_End_Color = 0xC618;
 Defrost_on_humidity.Color = 0xFFFF;
 Defrost_on_humidity.Press_Color = 0xE71C;
 Defrost_on_humidity.Corner_Radius = 2;
 Defrost_on_humidity.OnUpPtr = 0;
 Defrost_on_humidity.OnDownPtr = 0;
 Defrost_on_humidity.OnClickPtr = 0;
 Defrost_on_humidity.OnPressPtr = 0;

 Image47.OwnerScreen = &DEFROST;
 Image47.Order = 32;
 Image47.Left = 377;
 Image47.Top = 160;
 Image47.Width = 28;
 Image47.Height = 32;
 Image47.Picture_Type = 1;
 Image47.Picture_Ratio = 1;
 Image47.Picture_Name =  0x0016C712 ;
 Image47.Visible = 1;
 Image47.Active = 0;
 Image47.OnUpPtr = 0;
 Image47.OnDownPtr = 0;
 Image47.OnClickPtr = 0;
 Image47.OnPressPtr = 0;

 Image70.OwnerScreen = &DEFROST;
 Image70.Order = 33;
 Image70.Left = 408;
 Image70.Top = 160;
 Image70.Width = 28;
 Image70.Height = 32;
 Image70.Picture_Type = 1;
 Image70.Picture_Ratio = 1;
 Image70.Picture_Name =  0x0016CE18 ;
 Image70.Visible = 1;
 Image70.Active = 0;
 Image70.OnUpPtr = 0;
 Image70.OnDownPtr = 0;
 Image70.OnClickPtr = 0;
 Image70.OnPressPtr = 0;

 Image103.OwnerScreen = &DEFROST;
 Image103.Order = 34;
 Image103.Left = 439;
 Image103.Top = 160;
 Image103.Width = 34;
 Image103.Height = 32;
 Image103.Picture_Type = 1;
 Image103.Picture_Ratio = 1;
 Image103.Picture_Name =  0x0016D51E ;
 Image103.Visible = 1;
 Image103.Active = 0;
 Image103.OnUpPtr = 0;
 Image103.OnDownPtr = 0;
 Image103.OnClickPtr = 0;
 Image103.OnPressPtr = 0;

 Label51.OwnerScreen = &DEFROST;
 Label51.Order = 35;
 Label51.Left = 196;
 Label51.Top = 5;
 Label51.Width = 111;
 Label51.Height = 20;
 Label51.Visible = 1;
 Label51.Active = 0;
 Label51.Caption = Label51_Caption;
 Label51.FontName =  0x00005242 ;
 Label51.Font_Color = 0xE7FC;
 Label51.VerticalText = 0;
 Label51.OnUpPtr = 0;
 Label51.OnDownPtr = 0;
 Label51.OnClickPtr = 0;
 Label51.OnPressPtr = 0;

 humidity_down.OwnerScreen = &DEFROST;
 humidity_down.Order = 36;
 humidity_down.Left = 377;
 humidity_down.Top = 160;
 humidity_down.Width = 28;
 humidity_down.Height = 32;
 humidity_down.Picture_Type = 1;
 humidity_down.Picture_Ratio = 1;
 humidity_down.Picture_Name =  0x0016ED30 ;
 humidity_down.Visible = 1;
 humidity_down.Active = 1;
 humidity_down.OnUpPtr = 0;
 humidity_down.OnDownPtr = 0;
 humidity_down.OnClickPtr = 0;
 humidity_down.OnPressPtr = 0;

 humidity_up.OwnerScreen = &DEFROST;
 humidity_up.Order = 37;
 humidity_up.Left = 408;
 humidity_up.Top = 160;
 humidity_up.Width = 28;
 humidity_up.Height = 32;
 humidity_up.Picture_Type = 1;
 humidity_up.Picture_Ratio = 1;
 humidity_up.Picture_Name =  0x0016DDA4 ;
 humidity_up.Visible = 1;
 humidity_up.Active = 1;
 humidity_up.OnUpPtr = 0;
 humidity_up.OnDownPtr = 0;
 humidity_up.OnClickPtr = 0;
 humidity_up.OnPressPtr = 0;

 humidity_set.OwnerScreen = &DEFROST;
 humidity_set.Order = 38;
 humidity_set.Left = 439;
 humidity_set.Top = 160;
 humidity_set.Width = 34;
 humidity_set.Height = 32;
 humidity_set.Picture_Type = 1;
 humidity_set.Picture_Ratio = 1;
 humidity_set.Picture_Name =  0x0016E4AA ;
 humidity_set.Visible = 1;
 humidity_set.Active = 1;
 humidity_set.OnUpPtr = 0;
 humidity_set.OnDownPtr = 0;
 humidity_set.OnClickPtr = 0;
 humidity_set.OnPressPtr = 0;

 Image63.OwnerScreen = &EVENTS;
 Image63.Order = 0;
 Image63.Left = 0;
 Image63.Top = 0;
 Image63.Width = 480;
 Image63.Height = 272;
 Image63.Picture_Type = 1;
 Image63.Picture_Ratio = 1;
 Image63.Picture_Name =  0x0003CAAE ;
 Image63.Visible = 1;
 Image63.Active = 1;
 Image63.OnUpPtr = 0;
 Image63.OnDownPtr = 0;
 Image63.OnClickPtr = 0;
 Image63.OnPressPtr = 0;

 Home_b30.OwnerScreen = &EVENTS;
 Home_b30.Order = 1;
 Home_b30.Left = 241;
 Home_b30.Top = 232;
 Home_b30.Width = 78;
 Home_b30.Height = 35;
 Home_b30.Pen_Width = 1;
 Home_b30.Pen_Color = 0xC618;
 Home_b30.Visible = 1;
 Home_b30.Active = 1;
 Home_b30.Transparent = 1;
 Home_b30.Caption = Home_b30_Caption;
 Home_b30.TextAlign = _taCenter;
 Home_b30.TextAlignVertical= _tavMiddle;
 Home_b30.FontName =  0x00005242 ;
 Home_b30.PressColEnabled = 1;
 Home_b30.Font_Color = 0xD6BA;
 Home_b30.VerticalText = 0;
 Home_b30.Gradient = 1;
 Home_b30.Gradient_Orientation = 0;
 Home_b30.Gradient_Start_Color = 0x0418;
 Home_b30.Gradient_End_Color = 0x00A5;
 Home_b30.Color = 0xC618;
 Home_b30.Press_Color = 0xE71C;
 Home_b30.Corner_Radius = 5;
 Home_b30.OnUpPtr = 0;
 Home_b30.OnDownPtr = 0;
 Home_b30.OnClickPtr = BackToHome;
 Home_b30.OnPressPtr = 0;

 BoxRound1.OwnerScreen = &EVENTS;
 BoxRound1.Order = 2;
 BoxRound1.Left = 12;
 BoxRound1.Top = 34;
 BoxRound1.Width = 457;
 BoxRound1.Height = 191;
 BoxRound1.Pen_Width = 1;
 BoxRound1.Pen_Color = 0x0000;
 BoxRound1.Visible = 1;
 BoxRound1.Active = 1;
 BoxRound1.Transparent = 1;
 BoxRound1.Gradient = 0;
 BoxRound1.Gradient_Orientation = 0;
 BoxRound1.Gradient_Start_Color = 0xFFFF;
 BoxRound1.Gradient_End_Color = 0xC618;
 BoxRound1.Color = 0xFFFF;
 BoxRound1.PressColEnabled = 1;
 BoxRound1.Press_Color = 0xE71C;
 BoxRound1.Corner_Radius = 3;
 BoxRound1.OnUpPtr = 0;
 BoxRound1.OnDownPtr = 0;
 BoxRound1.OnClickPtr = 0;
 BoxRound1.OnPressPtr = 0;

 Back_b26.OwnerScreen = &EVENTS;
 Back_b26.Order = 3;
 Back_b26.Left = 157;
 Back_b26.Top = 232;
 Back_b26.Width = 78;
 Back_b26.Height = 35;
 Back_b26.Pen_Width = 1;
 Back_b26.Pen_Color = 0xC618;
 Back_b26.Visible = 1;
 Back_b26.Active = 1;
 Back_b26.Transparent = 1;
 Back_b26.Caption = Back_b26_Caption;
 Back_b26.TextAlign = _taCenter;
 Back_b26.TextAlignVertical= _tavMiddle;
 Back_b26.FontName =  0x00005242 ;
 Back_b26.PressColEnabled = 1;
 Back_b26.Font_Color = 0xD6BA;
 Back_b26.VerticalText = 0;
 Back_b26.Gradient = 1;
 Back_b26.Gradient_Orientation = 0;
 Back_b26.Gradient_Start_Color = 0x0418;
 Back_b26.Gradient_End_Color = 0x00A5;
 Back_b26.Color = 0xC618;
 Back_b26.Press_Color = 0xE71C;
 Back_b26.Corner_Radius = 5;
 Back_b26.OnUpPtr = 0;
 Back_b26.OnDownPtr = 0;
 Back_b26.OnClickPtr = goToBack;
 Back_b26.OnPressPtr = 0;

 Label50.OwnerScreen = &EVENTS;
 Label50.Order = 4;
 Label50.Left = 213;
 Label50.Top = 5;
 Label50.Width = 68;
 Label50.Height = 20;
 Label50.Visible = 1;
 Label50.Active = 0;
 Label50.Caption = Label50_Caption;
 Label50.FontName =  0x00005242 ;
 Label50.Font_Color = 0xE7FC;
 Label50.VerticalText = 0;
 Label50.OnUpPtr = 0;
 Label50.OnDownPtr = 0;
 Label50.OnClickPtr = 0;
 Label50.OnPressPtr = 0;

 Image21.OwnerScreen = &LIMITS5;
 Image21.Order = 0;
 Image21.Left = 0;
 Image21.Top = 0;
 Image21.Width = 480;
 Image21.Height = 272;
 Image21.Picture_Type = 1;
 Image21.Picture_Ratio = 1;
 Image21.Picture_Name =  0x00550BC2 ;
 Image21.Visible = 1;
 Image21.Active = 0;
 Image21.OnUpPtr = 0;
 Image21.OnDownPtr = 0;
 Image21.OnClickPtr = 0;
 Image21.OnPressPtr = 0;

 Image22.OwnerScreen = &LIMITS5;
 Image22.Order = 1;
 Image22.Left = 438;
 Image22.Top = 64;
 Image22.Width = 34;
 Image22.Height = 32;
 Image22.Picture_Type = 1;
 Image22.Picture_Ratio = 1;
 Image22.Picture_Name =  0x0016D51E ;
 Image22.Visible = 1;
 Image22.Active = 0;
 Image22.OnUpPtr = 0;
 Image22.OnDownPtr = 0;
 Image22.OnClickPtr = 0;
 Image22.OnPressPtr = 0;

 Image29.OwnerScreen = &LIMITS5;
 Image29.Order = 2;
 Image29.Left = 438;
 Image29.Top = 31;
 Image29.Width = 34;
 Image29.Height = 32;
 Image29.Picture_Type = 1;
 Image29.Picture_Ratio = 1;
 Image29.Picture_Name =  0x0016D51E ;
 Image29.Visible = 1;
 Image29.Active = 0;
 Image29.OnUpPtr = 0;
 Image29.OnDownPtr = 0;
 Image29.OnClickPtr = 0;
 Image29.OnPressPtr = 0;

 Image280.OwnerScreen = &LIMITS5;
 Image280.Order = 3;
 Image280.Left = 377;
 Image280.Top = 64;
 Image280.Width = 28;
 Image280.Height = 32;
 Image280.Picture_Type = 1;
 Image280.Picture_Ratio = 1;
 Image280.Picture_Name =  0x0016C712 ;
 Image280.Visible = 1;
 Image280.Active = 0;
 Image280.OnUpPtr = 0;
 Image280.OnDownPtr = 0;
 Image280.OnClickPtr = 0;
 Image280.OnPressPtr = 0;

 Image99.OwnerScreen = &LIMITS5;
 Image99.Order = 4;
 Image99.Left = 376;
 Image99.Top = 32;
 Image99.Width = 28;
 Image99.Height = 32;
 Image99.Picture_Type = 1;
 Image99.Picture_Ratio = 1;
 Image99.Picture_Name =  0x0016C712 ;
 Image99.Visible = 1;
 Image99.Active = 0;
 Image99.OnUpPtr = 0;
 Image99.OnDownPtr = 0;
 Image99.OnClickPtr = 0;
 Image99.OnPressPtr = 0;

 Image100.OwnerScreen = &LIMITS5;
 Image100.Order = 5;
 Image100.Left = 406;
 Image100.Top = 32;
 Image100.Width = 28;
 Image100.Height = 32;
 Image100.Picture_Type = 1;
 Image100.Picture_Ratio = 1;
 Image100.Picture_Name =  0x0016CE18 ;
 Image100.Visible = 1;
 Image100.Active = 0;
 Image100.OnUpPtr = 0;
 Image100.OnDownPtr = 0;
 Image100.OnClickPtr = 0;
 Image100.OnPressPtr = 0;

 Image281.OwnerScreen = &LIMITS5;
 Image281.Order = 6;
 Image281.Left = 407;
 Image281.Top = 64;
 Image281.Width = 28;
 Image281.Height = 32;
 Image281.Picture_Type = 1;
 Image281.Picture_Ratio = 1;
 Image281.Picture_Name =  0x0016CE18 ;
 Image281.Visible = 1;
 Image281.Active = 0;
 Image281.OnUpPtr = 0;
 Image281.OnDownPtr = 0;
 Image281.OnClickPtr = 0;
 Image281.OnPressPtr = 0;

 Home_b31.OwnerScreen = &LIMITS5;
 Home_b31.Order = 7;
 Home_b31.Left = 247;
 Home_b31.Top = 232;
 Home_b31.Width = 78;
 Home_b31.Height = 35;
 Home_b31.Pen_Width = 1;
 Home_b31.Pen_Color = 0xC618;
 Home_b31.Visible = 1;
 Home_b31.Active = 1;
 Home_b31.Transparent = 1;
 Home_b31.Caption = Home_b31_Caption;
 Home_b31.TextAlign = _taCenter;
 Home_b31.TextAlignVertical= _tavMiddle;
 Home_b31.FontName =  0x00005242 ;
 Home_b31.PressColEnabled = 1;
 Home_b31.Font_Color = 0xD6BA;
 Home_b31.VerticalText = 0;
 Home_b31.Gradient = 1;
 Home_b31.Gradient_Orientation = 0;
 Home_b31.Gradient_Start_Color = 0x0418;
 Home_b31.Gradient_End_Color = 0x00A5;
 Home_b31.Color = 0xC618;
 Home_b31.Press_Color = 0xE71C;
 Home_b31.Corner_Radius = 5;
 Home_b31.OnUpPtr = 0;
 Home_b31.OnDownPtr = 0;
 Home_b31.OnClickPtr = BackToHome;
 Home_b31.OnPressPtr = 0;

 Set_max_low_pressure.OwnerScreen = &LIMITS5;
 Set_max_low_pressure.Order = 8;
 Set_max_low_pressure.Left = 298;
 Set_max_low_pressure.Top = 35;
 Set_max_low_pressure.Width = 43;
 Set_max_low_pressure.Height = 23;
 Set_max_low_pressure.Pen_Width = 1;
 Set_max_low_pressure.Pen_Color = 0x0400;
 Set_max_low_pressure.Visible = 1;
 Set_max_low_pressure.Active = 1;
 Set_max_low_pressure.Transparent = 1;
 Set_max_low_pressure.Caption = Set_max_low_pressure_Caption;
 Set_max_low_pressure.TextAlign = _taCenter;
 Set_max_low_pressure.TextAlignVertical= _tavMiddle;
 Set_max_low_pressure.FontName =  0x00005242 ;
 Set_max_low_pressure.PressColEnabled = 1;
 Set_max_low_pressure.Font_Color = 0x0408;
 Set_max_low_pressure.VerticalText = 0;
 Set_max_low_pressure.Gradient = 0;
 Set_max_low_pressure.Gradient_Orientation = 0;
 Set_max_low_pressure.Gradient_Start_Color = 0xFFFF;
 Set_max_low_pressure.Gradient_End_Color = 0xC618;
 Set_max_low_pressure.Color = 0xFFFF;
 Set_max_low_pressure.Press_Color = 0xE71C;
 Set_max_low_pressure.Corner_Radius = 2;
 Set_max_low_pressure.OnUpPtr = 0;
 Set_max_low_pressure.OnDownPtr = 0;
 Set_max_low_pressure.OnClickPtr = 0;
 Set_max_low_pressure.OnPressPtr = 0;

 Set_min_low_pressure.OwnerScreen = &LIMITS5;
 Set_min_low_pressure.Order = 9;
 Set_min_low_pressure.Left = 298;
 Set_min_low_pressure.Top = 67;
 Set_min_low_pressure.Width = 43;
 Set_min_low_pressure.Height = 23;
 Set_min_low_pressure.Pen_Width = 1;
 Set_min_low_pressure.Pen_Color = 0x0400;
 Set_min_low_pressure.Visible = 1;
 Set_min_low_pressure.Active = 1;
 Set_min_low_pressure.Transparent = 1;
 Set_min_low_pressure.Caption = Set_min_low_pressure_Caption;
 Set_min_low_pressure.TextAlign = _taCenter;
 Set_min_low_pressure.TextAlignVertical= _tavMiddle;
 Set_min_low_pressure.FontName =  0x00005242 ;
 Set_min_low_pressure.PressColEnabled = 1;
 Set_min_low_pressure.Font_Color = 0x0408;
 Set_min_low_pressure.VerticalText = 0;
 Set_min_low_pressure.Gradient = 0;
 Set_min_low_pressure.Gradient_Orientation = 0;
 Set_min_low_pressure.Gradient_Start_Color = 0xFFFF;
 Set_min_low_pressure.Gradient_End_Color = 0xC618;
 Set_min_low_pressure.Color = 0xFFFF;
 Set_min_low_pressure.Press_Color = 0xE71C;
 Set_min_low_pressure.Corner_Radius = 2;
 Set_min_low_pressure.OnUpPtr = 0;
 Set_min_low_pressure.OnDownPtr = 0;
 Set_min_low_pressure.OnClickPtr = 0;
 Set_min_low_pressure.OnPressPtr = 0;

 Image12.OwnerScreen = &LIMITS5;
 Image12.Order = 10;
 Image12.Left = 407;
 Image12.Top = 32;
 Image12.Width = 28;
 Image12.Height = 32;
 Image12.Picture_Type = 1;
 Image12.Picture_Ratio = 1;
 Image12.Picture_Name =  0x0016DDA4 ;
 Image12.Visible = 1;
 Image12.Active = 1;
 Image12.OnUpPtr = Up_24_OnUp;
 Image12.OnDownPtr = 0;
 Image12.OnClickPtr = 0;
 Image12.OnPressPtr = Up_24_OnPress;

 Image14.OwnerScreen = &LIMITS5;
 Image14.Order = 11;
 Image14.Left = 407;
 Image14.Top = 64;
 Image14.Width = 28;
 Image14.Height = 32;
 Image14.Picture_Type = 1;
 Image14.Picture_Ratio = 1;
 Image14.Picture_Name =  0x0016DDA4 ;
 Image14.Visible = 1;
 Image14.Active = 1;
 Image14.OnUpPtr = Up_25_OnUp;
 Image14.OnDownPtr = 0;
 Image14.OnClickPtr = 0;
 Image14.OnPressPtr = Up_25_OnPress;

 Image17.OwnerScreen = &LIMITS5;
 Image17.Order = 12;
 Image17.Left = 376;
 Image17.Top = 32;
 Image17.Width = 28;
 Image17.Height = 32;
 Image17.Picture_Type = 1;
 Image17.Picture_Ratio = 1;
 Image17.Picture_Name =  0x0016ED30 ;
 Image17.Visible = 1;
 Image17.Active = 1;
 Image17.OnUpPtr = Down_24_OnUp;
 Image17.OnDownPtr = 0;
 Image17.OnClickPtr = 0;
 Image17.OnPressPtr = Down_24_OnPress;

 Image18.OwnerScreen = &LIMITS5;
 Image18.Order = 13;
 Image18.Left = 377;
 Image18.Top = 64;
 Image18.Width = 28;
 Image18.Height = 32;
 Image18.Picture_Type = 1;
 Image18.Picture_Ratio = 1;
 Image18.Picture_Name =  0x0016ED30 ;
 Image18.Visible = 1;
 Image18.Active = 1;
 Image18.OnUpPtr = Down_25_OnUp;
 Image18.OnDownPtr = 0;
 Image18.OnClickPtr = 0;
 Image18.OnPressPtr = Down_25_OnPress;

 Image282.OwnerScreen = &LIMITS5;
 Image282.Order = 14;
 Image282.Left = 438;
 Image282.Top = 64;
 Image282.Width = 34;
 Image282.Height = 32;
 Image282.Picture_Type = 1;
 Image282.Picture_Ratio = 1;
 Image282.Picture_Name =  0x0016E4AA ;
 Image282.Visible = 1;
 Image282.Active = 1;
 Image282.OnUpPtr = Set_25_OnUp;
 Image282.OnDownPtr = Set_25_OnDown;
 Image282.OnClickPtr = 0;
 Image282.OnPressPtr = 0;

 Image279.OwnerScreen = &LIMITS5;
 Image279.Order = 15;
 Image279.Left = 438;
 Image279.Top = 32;
 Image279.Width = 34;
 Image279.Height = 32;
 Image279.Picture_Type = 1;
 Image279.Picture_Ratio = 1;
 Image279.Picture_Name =  0x0016E4AA ;
 Image279.Visible = 1;
 Image279.Active = 1;
 Image279.OnUpPtr = Set_24_OnUp;
 Image279.OnDownPtr = Set_24_OnDown;
 Image279.OnClickPtr = 0;
 Image279.OnPressPtr = 0;

 Back_b27.OwnerScreen = &LIMITS5;
 Back_b27.Order = 16;
 Back_b27.Left = 166;
 Back_b27.Top = 232;
 Back_b27.Width = 78;
 Back_b27.Height = 35;
 Back_b27.Pen_Width = 1;
 Back_b27.Pen_Color = 0xC618;
 Back_b27.Visible = 1;
 Back_b27.Active = 1;
 Back_b27.Transparent = 1;
 Back_b27.Caption = Back_b27_Caption;
 Back_b27.TextAlign = _taCenter;
 Back_b27.TextAlignVertical= _tavMiddle;
 Back_b27.FontName =  0x00005242 ;
 Back_b27.PressColEnabled = 1;
 Back_b27.Font_Color = 0xD6BA;
 Back_b27.VerticalText = 0;
 Back_b27.Gradient = 1;
 Back_b27.Gradient_Orientation = 0;
 Back_b27.Gradient_Start_Color = 0x0418;
 Back_b27.Gradient_End_Color = 0x00A5;
 Back_b27.Color = 0xC618;
 Back_b27.Press_Color = 0xE71C;
 Back_b27.Corner_Radius = 5;
 Back_b27.OnUpPtr = 0;
 Back_b27.OnDownPtr = 0;
 Back_b27.OnClickPtr = goToBack;
 Back_b27.OnPressPtr = 0;

 Label46.OwnerScreen = &LIMITS5;
 Label46.Order = 17;
 Label46.Left = 206;
 Label46.Top = 5;
 Label46.Width = 85;
 Label46.Height = 20;
 Label46.Visible = 1;
 Label46.Active = 0;
 Label46.Caption = Label46_Caption;
 Label46.FontName =  0x00005242 ;
 Label46.Font_Color = 0xE7FC;
 Label46.VerticalText = 0;
 Label46.OnUpPtr = 0;
 Label46.OnDownPtr = 0;
 Label46.OnClickPtr = 0;
 Label46.OnPressPtr = 0;

 CircleButton3.OwnerScreen = &LIMITS5;
 CircleButton3.Order = 18;
 CircleButton3.Left = 450;
 CircleButton3.Top = 3;
 CircleButton3.Radius = 12;
 CircleButton3.Pen_Width = 1;
 CircleButton3.Pen_Color = 0x0000;
 CircleButton3.Visible = 1;
 CircleButton3.Active = 0;
 CircleButton3.Transparent = 1;
 CircleButton3.Caption = CircleButton3_Caption;
 CircleButton3.TextAlign = _taCenter;
 CircleButton3.TextAlignVertical= _tavMiddle;
 CircleButton3.FontName =  0x00005242 ;
 CircleButton3.PressColEnabled = 1;
 CircleButton3.Font_Color = 0x0000;
 CircleButton3.VerticalText = 0;
 CircleButton3.Gradient = 1;
 CircleButton3.Gradient_Orientation = 0;
 CircleButton3.Gradient_Start_Color = 0xFFFF;
 CircleButton3.Gradient_End_Color = 0xC618;
 CircleButton3.Color = 0xC618;
 CircleButton3.Press_Color = 0xE71C;
 CircleButton3.OnUpPtr = 0;
 CircleButton3.OnDownPtr = 0;
 CircleButton3.OnClickPtr = 0;
 CircleButton3.OnPressPtr = 0;

 Set_phase_off.OwnerScreen = &LIMITS5;
 Set_phase_off.Order = 19;
 Set_phase_off.Left = 417;
 Set_phase_off.Top = 129;
 Set_phase_off.Width = 50;
 Set_phase_off.Height = 30;
 Set_phase_off.Picture_Type = 1;
 Set_phase_off.Picture_Ratio = 1;
 Set_phase_off.Picture_Name =  0x0032539A ;
 Set_phase_off.Visible = 1;
 Set_phase_off.Active = 1;
 Set_phase_off.OnUpPtr = 0;
 Set_phase_off.OnDownPtr = 0;
 Set_phase_off.OnClickPtr = 0;
 Set_phase_off.OnPressPtr = 0;

 Set_voltage_off.OwnerScreen = &LIMITS5;
 Set_voltage_off.Order = 20;
 Set_voltage_off.Left = 417;
 Set_voltage_off.Top = 162;
 Set_voltage_off.Width = 50;
 Set_voltage_off.Height = 30;
 Set_voltage_off.Picture_Type = 1;
 Set_voltage_off.Picture_Ratio = 1;
 Set_voltage_off.Picture_Name =  0x0032539A ;
 Set_voltage_off.Visible = 1;
 Set_voltage_off.Active = 1;
 Set_voltage_off.OnUpPtr = 0;
 Set_voltage_off.OnDownPtr = 0;
 Set_voltage_off.OnClickPtr = 0;
 Set_voltage_off.OnPressPtr = 0;

 Set_voltage_on.OwnerScreen = &LIMITS5;
 Set_voltage_on.Order = 21;
 Set_voltage_on.Left = 416;
 Set_voltage_on.Top = 162;
 Set_voltage_on.Width = 50;
 Set_voltage_on.Height = 30;
 Set_voltage_on.Picture_Type = 1;
 Set_voltage_on.Picture_Ratio = 1;
 Set_voltage_on.Picture_Name =  0x00326B16 ;
 Set_voltage_on.Visible = 1;
 Set_voltage_on.Active = 1;
 Set_voltage_on.OnUpPtr = 0;
 Set_voltage_on.OnDownPtr = 0;
 Set_voltage_on.OnClickPtr = Set_voltage_check;
 Set_voltage_on.OnPressPtr = 0;

 Set_phase_on.OwnerScreen = &LIMITS5;
 Set_phase_on.Order = 22;
 Set_phase_on.Left = 416;
 Set_phase_on.Top = 129;
 Set_phase_on.Width = 50;
 Set_phase_on.Height = 30;
 Set_phase_on.Picture_Type = 1;
 Set_phase_on.Picture_Ratio = 1;
 Set_phase_on.Picture_Name =  0x00326B16 ;
 Set_phase_on.Visible = 1;
 Set_phase_on.Active = 1;
 Set_phase_on.OnUpPtr = 0;
 Set_phase_on.OnDownPtr = 0;
 Set_phase_on.OnClickPtr = Set_phase_check;
 Set_phase_on.OnPressPtr = 0;

 Image5.OwnerScreen = &LIMITS5;
 Image5.Order = 23;
 Image5.Left = 377;
 Image5.Top = 96;
 Image5.Width = 28;
 Image5.Height = 32;
 Image5.Picture_Type = 1;
 Image5.Picture_Ratio = 1;
 Image5.Picture_Name =  0x0016C712 ;
 Image5.Visible = 1;
 Image5.Active = 0;
 Image5.OnUpPtr = 0;
 Image5.OnDownPtr = 0;
 Image5.OnClickPtr = 0;
 Image5.OnPressPtr = 0;

 Image6.OwnerScreen = &LIMITS5;
 Image6.Order = 24;
 Image6.Left = 407;
 Image6.Top = 96;
 Image6.Width = 28;
 Image6.Height = 32;
 Image6.Picture_Type = 1;
 Image6.Picture_Ratio = 1;
 Image6.Picture_Name =  0x0016CE18 ;
 Image6.Visible = 1;
 Image6.Active = 0;
 Image6.OnUpPtr = 0;
 Image6.OnDownPtr = 0;
 Image6.OnClickPtr = 0;
 Image6.OnPressPtr = 0;

 Image46.OwnerScreen = &LIMITS5;
 Image46.Order = 25;
 Image46.Left = 438;
 Image46.Top = 96;
 Image46.Width = 34;
 Image46.Height = 32;
 Image46.Picture_Type = 1;
 Image46.Picture_Ratio = 1;
 Image46.Picture_Name =  0x0016D51E ;
 Image46.Visible = 1;
 Image46.Active = 0;
 Image46.OnUpPtr = 0;
 Image46.OnDownPtr = 0;
 Image46.OnClickPtr = 0;
 Image46.OnPressPtr = 0;

 UP_26_.OwnerScreen = &LIMITS5;
 UP_26_.Order = 26;
 UP_26_.Left = 407;
 UP_26_.Top = 96;
 UP_26_.Width = 28;
 UP_26_.Height = 32;
 UP_26_.Picture_Type = 1;
 UP_26_.Picture_Ratio = 1;
 UP_26_.Picture_Name =  0x0016DDA4 ;
 UP_26_.Visible = 1;
 UP_26_.Active = 1;
 UP_26_.OnUpPtr = UP_26_OnUp;
 UP_26_.OnDownPtr = 0;
 UP_26_.OnClickPtr = 0;
 UP_26_.OnPressPtr = UP_26_OnPress;

 Set_26_.OwnerScreen = &LIMITS5;
 Set_26_.Order = 27;
 Set_26_.Left = 438;
 Set_26_.Top = 96;
 Set_26_.Width = 34;
 Set_26_.Height = 32;
 Set_26_.Picture_Type = 1;
 Set_26_.Picture_Ratio = 1;
 Set_26_.Picture_Name =  0x0016E4AA ;
 Set_26_.Visible = 1;
 Set_26_.Active = 1;
 Set_26_.OnUpPtr = Set_26_OnUp;
 Set_26_.OnDownPtr = Set_26_OnDown;
 Set_26_.OnClickPtr = 0;
 Set_26_.OnPressPtr = 0;

 Set_eev_on.OwnerScreen = &LIMITS5;
 Set_eev_on.Order = 28;
 Set_eev_on.Left = 298;
 Set_eev_on.Top = 99;
 Set_eev_on.Width = 43;
 Set_eev_on.Height = 23;
 Set_eev_on.Pen_Width = 1;
 Set_eev_on.Pen_Color = 0x0400;
 Set_eev_on.Visible = 1;
 Set_eev_on.Active = 1;
 Set_eev_on.Transparent = 1;
 Set_eev_on.Caption = Set_eev_on_Caption;
 Set_eev_on.TextAlign = _taCenter;
 Set_eev_on.TextAlignVertical= _tavMiddle;
 Set_eev_on.FontName =  0x00005242 ;
 Set_eev_on.PressColEnabled = 1;
 Set_eev_on.Font_Color = 0x0408;
 Set_eev_on.VerticalText = 0;
 Set_eev_on.Gradient = 0;
 Set_eev_on.Gradient_Orientation = 0;
 Set_eev_on.Gradient_Start_Color = 0xFFFF;
 Set_eev_on.Gradient_End_Color = 0xC618;
 Set_eev_on.Color = 0xFFFF;
 Set_eev_on.Press_Color = 0xE71C;
 Set_eev_on.Corner_Radius = 2;
 Set_eev_on.OnUpPtr = 0;
 Set_eev_on.OnDownPtr = 0;
 Set_eev_on.OnClickPtr = 0;
 Set_eev_on.OnPressPtr = 0;

 Image7.OwnerScreen = &LIMITS5;
 Image7.Order = 29;
 Image7.Left = 376;
 Image7.Top = 96;
 Image7.Width = 28;
 Image7.Height = 32;
 Image7.Picture_Type = 1;
 Image7.Picture_Ratio = 1;
 Image7.Picture_Name =  0x0016ED30 ;
 Image7.Visible = 1;
 Image7.Active = 1;
 Image7.OnUpPtr = Down_26_OnUp;
 Image7.OnDownPtr = 0;
 Image7.OnClickPtr = 0;
 Image7.OnPressPtr = Down_26_OnPress;

 Image2.OwnerScreen = &MICRO_SD;
 Image2.Order = 0;
 Image2.Left = 0;
 Image2.Top = 0;
 Image2.Width = 480;
 Image2.Height = 272;
 Image2.Picture_Type = 1;
 Image2.Picture_Ratio = 1;
 Image2.Picture_Name =  0x0003CAAE ;
 Image2.Visible = 1;
 Image2.Active = 1;
 Image2.OnUpPtr = 0;
 Image2.OnDownPtr = 0;
 Image2.OnClickPtr = 0;
 Image2.OnPressPtr = 0;

 Back_b28.OwnerScreen = &MICRO_SD;
 Back_b28.Order = 1;
 Back_b28.Left = 163;
 Back_b28.Top = 232;
 Back_b28.Width = 78;
 Back_b28.Height = 35;
 Back_b28.Pen_Width = 1;
 Back_b28.Pen_Color = 0xC618;
 Back_b28.Visible = 1;
 Back_b28.Active = 1;
 Back_b28.Transparent = 1;
 Back_b28.Caption = Back_b28_Caption;
 Back_b28.TextAlign = _taCenter;
 Back_b28.TextAlignVertical= _tavMiddle;
 Back_b28.FontName =  0x00005242 ;
 Back_b28.PressColEnabled = 1;
 Back_b28.Font_Color = 0xD6BA;
 Back_b28.VerticalText = 0;
 Back_b28.Gradient = 1;
 Back_b28.Gradient_Orientation = 0;
 Back_b28.Gradient_Start_Color = 0x0418;
 Back_b28.Gradient_End_Color = 0x00A5;
 Back_b28.Color = 0xC618;
 Back_b28.Press_Color = 0xE71C;
 Back_b28.Corner_Radius = 5;
 Back_b28.OnUpPtr = 0;
 Back_b28.OnDownPtr = 0;
 Back_b28.OnClickPtr = goToBack;
 Back_b28.OnPressPtr = 0;

 Home_b32.OwnerScreen = &MICRO_SD;
 Home_b32.Order = 2;
 Home_b32.Left = 248;
 Home_b32.Top = 232;
 Home_b32.Width = 78;
 Home_b32.Height = 35;
 Home_b32.Pen_Width = 1;
 Home_b32.Pen_Color = 0xC618;
 Home_b32.Visible = 1;
 Home_b32.Active = 1;
 Home_b32.Transparent = 1;
 Home_b32.Caption = Home_b32_Caption;
 Home_b32.TextAlign = _taCenter;
 Home_b32.TextAlignVertical= _tavMiddle;
 Home_b32.FontName =  0x00005242 ;
 Home_b32.PressColEnabled = 1;
 Home_b32.Font_Color = 0xD6BA;
 Home_b32.VerticalText = 0;
 Home_b32.Gradient = 1;
 Home_b32.Gradient_Orientation = 0;
 Home_b32.Gradient_Start_Color = 0x0418;
 Home_b32.Gradient_End_Color = 0x00A5;
 Home_b32.Color = 0xC618;
 Home_b32.Press_Color = 0xE71C;
 Home_b32.Corner_Radius = 5;
 Home_b32.OnUpPtr = 0;
 Home_b32.OnDownPtr = 0;
 Home_b32.OnClickPtr = BackToHome;
 Home_b32.OnPressPtr = 0;

 Label7.OwnerScreen = &MICRO_SD;
 Label7.Order = 3;
 Label7.Left = 206;
 Label7.Top = 5;
 Label7.Width = 85;
 Label7.Height = 20;
 Label7.Visible = 1;
 Label7.Active = 0;
 Label7.Caption = Label7_Caption;
 Label7.FontName =  0x00005242 ;
 Label7.Font_Color = 0xE7FC;
 Label7.VerticalText = 0;
 Label7.OnUpPtr = 0;
 Label7.OnDownPtr = 0;
 Label7.OnClickPtr = 0;
 Label7.OnPressPtr = 0;

 Image461.OwnerScreen = &LIMITS3;
 Image461.Order = 0;
 Image461.Left = 0;
 Image461.Top = 0;
 Image461.Width = 480;
 Image461.Height = 272;
 Image461.Picture_Type = 1;
 Image461.Picture_Ratio = 1;
 Image461.Picture_Name =  0x005907C8 ;
 Image461.Visible = 1;
 Image461.Active = 0;
 Image461.OnUpPtr = 0;
 Image461.OnDownPtr = 0;
 Image461.OnClickPtr = 0;
 Image461.OnPressPtr = 0;

 Image469.OwnerScreen = &LIMITS3;
 Image469.Order = 1;
 Image469.Left = 439;
 Image469.Top = 32;
 Image469.Width = 34;
 Image469.Height = 32;
 Image469.Picture_Type = 1;
 Image469.Picture_Ratio = 1;
 Image469.Picture_Name =  0x0016D51E ;
 Image469.Visible = 1;
 Image469.Active = 0;
 Image469.OnUpPtr = 0;
 Image469.OnDownPtr = 0;
 Image469.OnClickPtr = 0;
 Image469.OnPressPtr = 0;

 Image471.OwnerScreen = &LIMITS3;
 Image471.Order = 2;
 Image471.Left = 406;
 Image471.Top = 32;
 Image471.Width = 28;
 Image471.Height = 32;
 Image471.Picture_Type = 1;
 Image471.Picture_Ratio = 1;
 Image471.Picture_Name =  0x0016CE18 ;
 Image471.Visible = 1;
 Image471.Active = 0;
 Image471.OnUpPtr = 0;
 Image471.OnDownPtr = 0;
 Image471.OnClickPtr = 0;
 Image471.OnPressPtr = 0;

 Image472.OwnerScreen = &LIMITS3;
 Image472.Order = 3;
 Image472.Left = 376;
 Image472.Top = 32;
 Image472.Width = 28;
 Image472.Height = 32;
 Image472.Picture_Type = 1;
 Image472.Picture_Ratio = 1;
 Image472.Picture_Name =  0x0016C712 ;
 Image472.Visible = 1;
 Image472.Active = 0;
 Image472.OnUpPtr = 0;
 Image472.OnDownPtr = 0;
 Image472.OnClickPtr = 0;
 Image472.OnPressPtr = 0;

 Image473.OwnerScreen = &LIMITS3;
 Image473.Order = 4;
 Image473.Left = 376;
 Image473.Top = 64;
 Image473.Width = 28;
 Image473.Height = 32;
 Image473.Picture_Type = 1;
 Image473.Picture_Ratio = 1;
 Image473.Picture_Name =  0x0016C712 ;
 Image473.Visible = 1;
 Image473.Active = 0;
 Image473.OnUpPtr = 0;
 Image473.OnDownPtr = 0;
 Image473.OnClickPtr = 0;
 Image473.OnPressPtr = 0;

 Image470.OwnerScreen = &LIMITS3;
 Image470.Order = 5;
 Image470.Left = 406;
 Image470.Top = 64;
 Image470.Width = 28;
 Image470.Height = 32;
 Image470.Picture_Type = 1;
 Image470.Picture_Ratio = 1;
 Image470.Picture_Name =  0x0016CE18 ;
 Image470.Visible = 1;
 Image470.Active = 0;
 Image470.OnUpPtr = 0;
 Image470.OnDownPtr = 0;
 Image470.OnClickPtr = 0;
 Image470.OnPressPtr = 0;

 Image468.OwnerScreen = &LIMITS3;
 Image468.Order = 6;
 Image468.Left = 439;
 Image468.Top = 63;
 Image468.Width = 34;
 Image468.Height = 32;
 Image468.Picture_Type = 1;
 Image468.Picture_Ratio = 1;
 Image468.Picture_Name =  0x0016D51E ;
 Image468.Visible = 1;
 Image468.Active = 0;
 Image468.OnUpPtr = 0;
 Image468.OnDownPtr = 0;
 Image468.OnClickPtr = 0;
 Image468.OnPressPtr = 0;

 Image482.OwnerScreen = &LIMITS3;
 Image482.Order = 7;
 Image482.Left = 439;
 Image482.Top = 96;
 Image482.Width = 34;
 Image482.Height = 32;
 Image482.Picture_Type = 1;
 Image482.Picture_Ratio = 1;
 Image482.Picture_Name =  0x0016D51E ;
 Image482.Visible = 1;
 Image482.Active = 0;
 Image482.OnUpPtr = 0;
 Image482.OnDownPtr = 0;
 Image482.OnClickPtr = 0;
 Image482.OnPressPtr = 0;

 Image474.OwnerScreen = &LIMITS3;
 Image474.Order = 8;
 Image474.Left = 406;
 Image474.Top = 96;
 Image474.Width = 28;
 Image474.Height = 32;
 Image474.Picture_Type = 1;
 Image474.Picture_Ratio = 1;
 Image474.Picture_Name =  0x0016CE18 ;
 Image474.Visible = 1;
 Image474.Active = 0;
 Image474.OnUpPtr = 0;
 Image474.OnDownPtr = 0;
 Image474.OnClickPtr = 0;
 Image474.OnPressPtr = 0;

 Image478.OwnerScreen = &LIMITS3;
 Image478.Order = 9;
 Image478.Left = 376;
 Image478.Top = 96;
 Image478.Width = 28;
 Image478.Height = 32;
 Image478.Picture_Type = 1;
 Image478.Picture_Ratio = 1;
 Image478.Picture_Name =  0x0016C712 ;
 Image478.Visible = 1;
 Image478.Active = 0;
 Image478.OnUpPtr = 0;
 Image478.OnDownPtr = 0;
 Image478.OnClickPtr = 0;
 Image478.OnPressPtr = 0;

 Image479.OwnerScreen = &LIMITS3;
 Image479.Order = 10;
 Image479.Left = 376;
 Image479.Top = 128;
 Image479.Width = 28;
 Image479.Height = 32;
 Image479.Picture_Type = 1;
 Image479.Picture_Ratio = 1;
 Image479.Picture_Name =  0x0016C712 ;
 Image479.Visible = 1;
 Image479.Active = 0;
 Image479.OnUpPtr = 0;
 Image479.OnDownPtr = 0;
 Image479.OnClickPtr = 0;
 Image479.OnPressPtr = 0;

 Image475.OwnerScreen = &LIMITS3;
 Image475.Order = 11;
 Image475.Left = 406;
 Image475.Top = 128;
 Image475.Width = 28;
 Image475.Height = 32;
 Image475.Picture_Type = 1;
 Image475.Picture_Ratio = 1;
 Image475.Picture_Name =  0x0016CE18 ;
 Image475.Visible = 1;
 Image475.Active = 0;
 Image475.OnUpPtr = 0;
 Image475.OnDownPtr = 0;
 Image475.OnClickPtr = 0;
 Image475.OnPressPtr = 0;

 Image483.OwnerScreen = &LIMITS3;
 Image483.Order = 12;
 Image483.Left = 439;
 Image483.Top = 127;
 Image483.Width = 34;
 Image483.Height = 32;
 Image483.Picture_Type = 1;
 Image483.Picture_Ratio = 1;
 Image483.Picture_Name =  0x0016D51E ;
 Image483.Visible = 1;
 Image483.Active = 0;
 Image483.OnUpPtr = 0;
 Image483.OnDownPtr = 0;
 Image483.OnClickPtr = 0;
 Image483.OnPressPtr = 0;

 Image484.OwnerScreen = &LIMITS3;
 Image484.Order = 13;
 Image484.Left = 439;
 Image484.Top = 159;
 Image484.Width = 34;
 Image484.Height = 32;
 Image484.Picture_Type = 1;
 Image484.Picture_Ratio = 1;
 Image484.Picture_Name =  0x0016D51E ;
 Image484.Visible = 1;
 Image484.Active = 0;
 Image484.OnUpPtr = 0;
 Image484.OnDownPtr = 0;
 Image484.OnClickPtr = 0;
 Image484.OnPressPtr = 0;

 Image476.OwnerScreen = &LIMITS3;
 Image476.Order = 14;
 Image476.Left = 405;
 Image476.Top = 160;
 Image476.Width = 28;
 Image476.Height = 32;
 Image476.Picture_Type = 1;
 Image476.Picture_Ratio = 1;
 Image476.Picture_Name =  0x0016CE18 ;
 Image476.Visible = 1;
 Image476.Active = 0;
 Image476.OnUpPtr = 0;
 Image476.OnDownPtr = 0;
 Image476.OnClickPtr = 0;
 Image476.OnPressPtr = 0;

 Image480.OwnerScreen = &LIMITS3;
 Image480.Order = 15;
 Image480.Left = 376;
 Image480.Top = 160;
 Image480.Width = 28;
 Image480.Height = 32;
 Image480.Picture_Type = 1;
 Image480.Picture_Ratio = 1;
 Image480.Picture_Name =  0x0016C712 ;
 Image480.Visible = 1;
 Image480.Active = 0;
 Image480.OnUpPtr = 0;
 Image480.OnDownPtr = 0;
 Image480.OnClickPtr = 0;
 Image480.OnPressPtr = 0;

 Image481.OwnerScreen = &LIMITS3;
 Image481.Order = 16;
 Image481.Left = 376;
 Image481.Top = 192;
 Image481.Width = 28;
 Image481.Height = 32;
 Image481.Picture_Type = 1;
 Image481.Picture_Ratio = 1;
 Image481.Picture_Name =  0x0016C712 ;
 Image481.Visible = 1;
 Image481.Active = 0;
 Image481.OnUpPtr = 0;
 Image481.OnDownPtr = 0;
 Image481.OnClickPtr = 0;
 Image481.OnPressPtr = 0;

 Image477.OwnerScreen = &LIMITS3;
 Image477.Order = 17;
 Image477.Left = 406;
 Image477.Top = 192;
 Image477.Width = 28;
 Image477.Height = 32;
 Image477.Picture_Type = 1;
 Image477.Picture_Ratio = 1;
 Image477.Picture_Name =  0x0016CE18 ;
 Image477.Visible = 1;
 Image477.Active = 0;
 Image477.OnUpPtr = 0;
 Image477.OnDownPtr = 0;
 Image477.OnClickPtr = 0;
 Image477.OnPressPtr = 0;

 Image485.OwnerScreen = &LIMITS3;
 Image485.Order = 18;
 Image485.Left = 439;
 Image485.Top = 192;
 Image485.Width = 34;
 Image485.Height = 32;
 Image485.Picture_Type = 1;
 Image485.Picture_Ratio = 1;
 Image485.Picture_Name =  0x0016D51E ;
 Image485.Visible = 1;
 Image485.Active = 0;
 Image485.OnUpPtr = 0;
 Image485.OnDownPtr = 0;
 Image485.OnClickPtr = 0;
 Image485.OnPressPtr = 0;

 Home_b33.OwnerScreen = &LIMITS3;
 Home_b33.Order = 19;
 Home_b33.Left = 202;
 Home_b33.Top = 232;
 Home_b33.Width = 78;
 Home_b33.Height = 35;
 Home_b33.Pen_Width = 1;
 Home_b33.Pen_Color = 0xC618;
 Home_b33.Visible = 1;
 Home_b33.Active = 1;
 Home_b33.Transparent = 1;
 Home_b33.Caption = Home_b33_Caption;
 Home_b33.TextAlign = _taCenter;
 Home_b33.TextAlignVertical= _tavMiddle;
 Home_b33.FontName =  0x00005242 ;
 Home_b33.PressColEnabled = 1;
 Home_b33.Font_Color = 0xD6BA;
 Home_b33.VerticalText = 0;
 Home_b33.Gradient = 1;
 Home_b33.Gradient_Orientation = 0;
 Home_b33.Gradient_Start_Color = 0x0418;
 Home_b33.Gradient_End_Color = 0x00A5;
 Home_b33.Color = 0xC618;
 Home_b33.Press_Color = 0xE71C;
 Home_b33.Corner_Radius = 5;
 Home_b33.OnUpPtr = 0;
 Home_b33.OnDownPtr = 0;
 Home_b33.OnClickPtr = BackToHome;
 Home_b33.OnPressPtr = 0;

 Back_b29.OwnerScreen = &LIMITS3;
 Back_b29.Order = 20;
 Back_b29.Left = 118;
 Back_b29.Top = 232;
 Back_b29.Width = 78;
 Back_b29.Height = 35;
 Back_b29.Pen_Width = 1;
 Back_b29.Pen_Color = 0xC618;
 Back_b29.Visible = 1;
 Back_b29.Active = 1;
 Back_b29.Transparent = 1;
 Back_b29.Caption = Back_b29_Caption;
 Back_b29.TextAlign = _taCenter;
 Back_b29.TextAlignVertical= _tavMiddle;
 Back_b29.FontName =  0x00005242 ;
 Back_b29.PressColEnabled = 1;
 Back_b29.Font_Color = 0xD6BA;
 Back_b29.VerticalText = 0;
 Back_b29.Gradient = 1;
 Back_b29.Gradient_Orientation = 0;
 Back_b29.Gradient_Start_Color = 0x0418;
 Back_b29.Gradient_End_Color = 0x00A5;
 Back_b29.Color = 0xC618;
 Back_b29.Press_Color = 0xE71C;
 Back_b29.Corner_Radius = 5;
 Back_b29.OnUpPtr = 0;
 Back_b29.OnDownPtr = 0;
 Back_b29.OnClickPtr = goToBack;
 Back_b29.OnPressPtr = 0;

 Next_b10.OwnerScreen = &LIMITS3;
 Next_b10.Order = 21;
 Next_b10.Left = 286;
 Next_b10.Top = 232;
 Next_b10.Width = 78;
 Next_b10.Height = 35;
 Next_b10.Pen_Width = 1;
 Next_b10.Pen_Color = 0xC618;
 Next_b10.Visible = 1;
 Next_b10.Active = 1;
 Next_b10.Transparent = 1;
 Next_b10.Caption = Next_b10_Caption;
 Next_b10.TextAlign = _taCenter;
 Next_b10.TextAlignVertical= _tavMiddle;
 Next_b10.FontName =  0x00005242 ;
 Next_b10.PressColEnabled = 1;
 Next_b10.Font_Color = 0xD6BA;
 Next_b10.VerticalText = 0;
 Next_b10.Gradient = 1;
 Next_b10.Gradient_Orientation = 0;
 Next_b10.Gradient_Start_Color = 0x0418;
 Next_b10.Gradient_End_Color = 0x00A5;
 Next_b10.Color = 0xC618;
 Next_b10.Press_Color = 0xE71C;
 Next_b10.Corner_Radius = 5;
 Next_b10.OnUpPtr = 0;
 Next_b10.OnDownPtr = 0;
 Next_b10.OnClickPtr = nextPage;
 Next_b10.OnPressPtr = 0;

 Down_15_.OwnerScreen = &LIMITS3;
 Down_15_.Order = 22;
 Down_15_.Left = 376;
 Down_15_.Top = 96;
 Down_15_.Width = 28;
 Down_15_.Height = 32;
 Down_15_.Picture_Type = 1;
 Down_15_.Picture_Ratio = 1;
 Down_15_.Picture_Name =  0x0016ED30 ;
 Down_15_.Visible = 1;
 Down_15_.Active = 1;
 Down_15_.OnUpPtr = Down_15_OnUp;
 Down_15_.OnDownPtr = 0;
 Down_15_.OnClickPtr = 0;
 Down_15_.OnPressPtr = Down_15_OnPress;

 Down_16_.OwnerScreen = &LIMITS3;
 Down_16_.Order = 23;
 Down_16_.Left = 376;
 Down_16_.Top = 128;
 Down_16_.Width = 28;
 Down_16_.Height = 32;
 Down_16_.Picture_Type = 1;
 Down_16_.Picture_Ratio = 1;
 Down_16_.Picture_Name =  0x0016ED30 ;
 Down_16_.Visible = 1;
 Down_16_.Active = 1;
 Down_16_.OnUpPtr = Down_16_OnUp;
 Down_16_.OnDownPtr = 0;
 Down_16_.OnClickPtr = 0;
 Down_16_.OnPressPtr = Down_16_OnPress;

 Down_17_.OwnerScreen = &LIMITS3;
 Down_17_.Order = 24;
 Down_17_.Left = 376;
 Down_17_.Top = 160;
 Down_17_.Width = 28;
 Down_17_.Height = 32;
 Down_17_.Picture_Type = 1;
 Down_17_.Picture_Ratio = 1;
 Down_17_.Picture_Name =  0x0016ED30 ;
 Down_17_.Visible = 1;
 Down_17_.Active = 1;
 Down_17_.OnUpPtr = Down_17_OnUp;
 Down_17_.OnDownPtr = 0;
 Down_17_.OnClickPtr = 0;
 Down_17_.OnPressPtr = Down_17_OnPress;

 Down_18_.OwnerScreen = &LIMITS3;
 Down_18_.Order = 25;
 Down_18_.Left = 376;
 Down_18_.Top = 192;
 Down_18_.Width = 28;
 Down_18_.Height = 32;
 Down_18_.Picture_Type = 1;
 Down_18_.Picture_Ratio = 1;
 Down_18_.Picture_Name =  0x0016ED30 ;
 Down_18_.Visible = 1;
 Down_18_.Active = 1;
 Down_18_.OnUpPtr = Down_18_OnUp;
 Down_18_.OnDownPtr = 0;
 Down_18_.OnClickPtr = 0;
 Down_18_.OnPressPtr = Down_18_OnPress;

 Up_15_.OwnerScreen = &LIMITS3;
 Up_15_.Order = 26;
 Up_15_.Left = 406;
 Up_15_.Top = 96;
 Up_15_.Width = 28;
 Up_15_.Height = 32;
 Up_15_.Picture_Type = 1;
 Up_15_.Picture_Ratio = 1;
 Up_15_.Picture_Name =  0x0016DDA4 ;
 Up_15_.Visible = 1;
 Up_15_.Active = 1;
 Up_15_.OnUpPtr = Up_15_OnUp;
 Up_15_.OnDownPtr = 0;
 Up_15_.OnClickPtr = 0;
 Up_15_.OnPressPtr = Up_15_OnPress;

 Up_16_.OwnerScreen = &LIMITS3;
 Up_16_.Order = 27;
 Up_16_.Left = 406;
 Up_16_.Top = 128;
 Up_16_.Width = 28;
 Up_16_.Height = 32;
 Up_16_.Picture_Type = 1;
 Up_16_.Picture_Ratio = 1;
 Up_16_.Picture_Name =  0x0016DDA4 ;
 Up_16_.Visible = 1;
 Up_16_.Active = 1;
 Up_16_.OnUpPtr = Up_16_OnUp;
 Up_16_.OnDownPtr = 0;
 Up_16_.OnClickPtr = 0;
 Up_16_.OnPressPtr = Up_16_OnPress;

 Up_17_.OwnerScreen = &LIMITS3;
 Up_17_.Order = 28;
 Up_17_.Left = 406;
 Up_17_.Top = 160;
 Up_17_.Width = 28;
 Up_17_.Height = 32;
 Up_17_.Picture_Type = 1;
 Up_17_.Picture_Ratio = 1;
 Up_17_.Picture_Name =  0x0016DDA4 ;
 Up_17_.Visible = 1;
 Up_17_.Active = 1;
 Up_17_.OnUpPtr = Up_17_OnUp;
 Up_17_.OnDownPtr = 0;
 Up_17_.OnClickPtr = 0;
 Up_17_.OnPressPtr = Up_17_OnPress;

 Up_18_.OwnerScreen = &LIMITS3;
 Up_18_.Order = 29;
 Up_18_.Left = 406;
 Up_18_.Top = 192;
 Up_18_.Width = 28;
 Up_18_.Height = 32;
 Up_18_.Picture_Type = 1;
 Up_18_.Picture_Ratio = 1;
 Up_18_.Picture_Name =  0x0016DDA4 ;
 Up_18_.Visible = 1;
 Up_18_.Active = 1;
 Up_18_.OnUpPtr = Up_18_OnUp;
 Up_18_.OnDownPtr = 0;
 Up_18_.OnClickPtr = 0;
 Up_18_.OnPressPtr = Up_18_OnPress;

 Set_15_.OwnerScreen = &LIMITS3;
 Set_15_.Order = 30;
 Set_15_.Left = 439;
 Set_15_.Top = 96;
 Set_15_.Width = 34;
 Set_15_.Height = 32;
 Set_15_.Picture_Type = 1;
 Set_15_.Picture_Ratio = 1;
 Set_15_.Picture_Name =  0x0016E4AA ;
 Set_15_.Visible = 1;
 Set_15_.Active = 1;
 Set_15_.OnUpPtr = Set_15_OnUp;
 Set_15_.OnDownPtr = Set_15_OnDown;
 Set_15_.OnClickPtr = 0;
 Set_15_.OnPressPtr = 0;

 Set_16_.OwnerScreen = &LIMITS3;
 Set_16_.Order = 31;
 Set_16_.Left = 439;
 Set_16_.Top = 128;
 Set_16_.Width = 34;
 Set_16_.Height = 32;
 Set_16_.Picture_Type = 1;
 Set_16_.Picture_Ratio = 1;
 Set_16_.Picture_Name =  0x0016E4AA ;
 Set_16_.Visible = 1;
 Set_16_.Active = 1;
 Set_16_.OnUpPtr = Set_16_OnUp;
 Set_16_.OnDownPtr = Set_16_OnDown;
 Set_16_.OnClickPtr = 0;
 Set_16_.OnPressPtr = 0;

 Set_17_.OwnerScreen = &LIMITS3;
 Set_17_.Order = 32;
 Set_17_.Left = 439;
 Set_17_.Top = 160;
 Set_17_.Width = 34;
 Set_17_.Height = 32;
 Set_17_.Picture_Type = 1;
 Set_17_.Picture_Ratio = 1;
 Set_17_.Picture_Name =  0x0016E4AA ;
 Set_17_.Visible = 1;
 Set_17_.Active = 1;
 Set_17_.OnUpPtr = Set_17_OnUp;
 Set_17_.OnDownPtr = Set_17_OnDown;
 Set_17_.OnClickPtr = 0;
 Set_17_.OnPressPtr = 0;

 Set_18_.OwnerScreen = &LIMITS3;
 Set_18_.Order = 33;
 Set_18_.Left = 440;
 Set_18_.Top = 192;
 Set_18_.Width = 34;
 Set_18_.Height = 32;
 Set_18_.Picture_Type = 1;
 Set_18_.Picture_Ratio = 1;
 Set_18_.Picture_Name =  0x0016E4AA ;
 Set_18_.Visible = 1;
 Set_18_.Active = 1;
 Set_18_.OnUpPtr = Set_18_OnUp;
 Set_18_.OnDownPtr = Set_18_OnDown;
 Set_18_.OnClickPtr = 0;
 Set_18_.OnPressPtr = 0;

 Set_14_.OwnerScreen = &LIMITS3;
 Set_14_.Order = 34;
 Set_14_.Left = 439;
 Set_14_.Top = 64;
 Set_14_.Width = 34;
 Set_14_.Height = 32;
 Set_14_.Picture_Type = 1;
 Set_14_.Picture_Ratio = 1;
 Set_14_.Picture_Name =  0x0016E4AA ;
 Set_14_.Visible = 1;
 Set_14_.Active = 1;
 Set_14_.OnUpPtr = Set_14_OnUp;
 Set_14_.OnDownPtr = Set_14_OnDown;
 Set_14_.OnClickPtr = 0;
 Set_14_.OnPressPtr = 0;

 Set_13_.OwnerScreen = &LIMITS3;
 Set_13_.Order = 35;
 Set_13_.Left = 439;
 Set_13_.Top = 32;
 Set_13_.Width = 34;
 Set_13_.Height = 32;
 Set_13_.Picture_Type = 1;
 Set_13_.Picture_Ratio = 1;
 Set_13_.Picture_Name =  0x0016E4AA ;
 Set_13_.Visible = 1;
 Set_13_.Active = 1;
 Set_13_.OnUpPtr = Set_13_OnUp;
 Set_13_.OnDownPtr = Set_13_OnDown;
 Set_13_.OnClickPtr = 0;
 Set_13_.OnPressPtr = 0;

 Up_14_.OwnerScreen = &LIMITS3;
 Up_14_.Order = 36;
 Up_14_.Left = 406;
 Up_14_.Top = 64;
 Up_14_.Width = 28;
 Up_14_.Height = 32;
 Up_14_.Picture_Type = 1;
 Up_14_.Picture_Ratio = 1;
 Up_14_.Picture_Name =  0x0016DDA4 ;
 Up_14_.Visible = 1;
 Up_14_.Active = 1;
 Up_14_.OnUpPtr = Up_14_OnUp;
 Up_14_.OnDownPtr = 0;
 Up_14_.OnClickPtr = 0;
 Up_14_.OnPressPtr = Up_14_OnPress;

 Up_13_.OwnerScreen = &LIMITS3;
 Up_13_.Order = 37;
 Up_13_.Left = 407;
 Up_13_.Top = 32;
 Up_13_.Width = 28;
 Up_13_.Height = 32;
 Up_13_.Picture_Type = 1;
 Up_13_.Picture_Ratio = 1;
 Up_13_.Picture_Name =  0x0016DDA4 ;
 Up_13_.Visible = 1;
 Up_13_.Active = 1;
 Up_13_.OnUpPtr = Up_13_OnUp;
 Up_13_.OnDownPtr = 0;
 Up_13_.OnClickPtr = 0;
 Up_13_.OnPressPtr = Up_13_OnPress;

 Down_14_.OwnerScreen = &LIMITS3;
 Down_14_.Order = 38;
 Down_14_.Left = 376;
 Down_14_.Top = 64;
 Down_14_.Width = 28;
 Down_14_.Height = 32;
 Down_14_.Picture_Type = 1;
 Down_14_.Picture_Ratio = 1;
 Down_14_.Picture_Name =  0x0016ED30 ;
 Down_14_.Visible = 1;
 Down_14_.Active = 1;
 Down_14_.OnUpPtr = Down_14_OnUp;
 Down_14_.OnDownPtr = 0;
 Down_14_.OnClickPtr = 0;
 Down_14_.OnPressPtr = Down_14_OnPress;

 Down_13_.OwnerScreen = &LIMITS3;
 Down_13_.Order = 39;
 Down_13_.Left = 376;
 Down_13_.Top = 32;
 Down_13_.Width = 28;
 Down_13_.Height = 32;
 Down_13_.Picture_Type = 1;
 Down_13_.Picture_Ratio = 1;
 Down_13_.Picture_Name =  0x0016ED30 ;
 Down_13_.Visible = 1;
 Down_13_.Active = 1;
 Down_13_.OnUpPtr = Down_13_OnUp;
 Down_13_.OnDownPtr = 0;
 Down_13_.OnClickPtr = 0;
 Down_13_.OnPressPtr = Down_13_OnPress;

 Set_Furnance_one_preset.OwnerScreen = &LIMITS3;
 Set_Furnance_one_preset.Order = 40;
 Set_Furnance_one_preset.Left = 305;
 Set_Furnance_one_preset.Top = 36;
 Set_Furnance_one_preset.Width = 40;
 Set_Furnance_one_preset.Height = 23;
 Set_Furnance_one_preset.Pen_Width = 1;
 Set_Furnance_one_preset.Pen_Color = 0x0000;
 Set_Furnance_one_preset.Visible = 1;
 Set_Furnance_one_preset.Active = 0;
 Set_Furnance_one_preset.Transparent = 1;
 Set_Furnance_one_preset.Caption = Set_Furnance_one_preset_Caption;
 Set_Furnance_one_preset.TextAlign = _taCenter;
 Set_Furnance_one_preset.TextAlignVertical= _tavMiddle;
 Set_Furnance_one_preset.FontName =  0x00005242 ;
 Set_Furnance_one_preset.PressColEnabled = 1;
 Set_Furnance_one_preset.Font_Color = 0x0408;
 Set_Furnance_one_preset.VerticalText = 0;
 Set_Furnance_one_preset.Gradient = 0;
 Set_Furnance_one_preset.Gradient_Orientation = 0;
 Set_Furnance_one_preset.Gradient_Start_Color = 0xFFFF;
 Set_Furnance_one_preset.Gradient_End_Color = 0xC618;
 Set_Furnance_one_preset.Color = 0xFFFF;
 Set_Furnance_one_preset.Press_Color = 0xE71C;
 Set_Furnance_one_preset.Corner_Radius = 2;
 Set_Furnance_one_preset.OnUpPtr = 0;
 Set_Furnance_one_preset.OnDownPtr = 0;
 Set_Furnance_one_preset.OnClickPtr = 0;
 Set_Furnance_one_preset.OnPressPtr = 0;

 Set_solar_max.OwnerScreen = &LIMITS3;
 Set_solar_max.Order = 41;
 Set_solar_max.Left = 305;
 Set_solar_max.Top = 68;
 Set_solar_max.Width = 40;
 Set_solar_max.Height = 23;
 Set_solar_max.Pen_Width = 1;
 Set_solar_max.Pen_Color = 0x0000;
 Set_solar_max.Visible = 1;
 Set_solar_max.Active = 0;
 Set_solar_max.Transparent = 1;
 Set_solar_max.Caption = Set_solar_max_Caption;
 Set_solar_max.TextAlign = _taCenter;
 Set_solar_max.TextAlignVertical= _tavMiddle;
 Set_solar_max.FontName =  0x00005242 ;
 Set_solar_max.PressColEnabled = 1;
 Set_solar_max.Font_Color = 0x0408;
 Set_solar_max.VerticalText = 0;
 Set_solar_max.Gradient = 0;
 Set_solar_max.Gradient_Orientation = 0;
 Set_solar_max.Gradient_Start_Color = 0xFFFF;
 Set_solar_max.Gradient_End_Color = 0xC618;
 Set_solar_max.Color = 0xFFFF;
 Set_solar_max.Press_Color = 0xE71C;
 Set_solar_max.Corner_Radius = 2;
 Set_solar_max.OnUpPtr = 0;
 Set_solar_max.OnDownPtr = 0;
 Set_solar_max.OnClickPtr = 0;
 Set_solar_max.OnPressPtr = 0;

 Set_max_electric.OwnerScreen = &LIMITS3;
 Set_max_electric.Order = 42;
 Set_max_electric.Left = 305;
 Set_max_electric.Top = 100;
 Set_max_electric.Width = 40;
 Set_max_electric.Height = 23;
 Set_max_electric.Pen_Width = 1;
 Set_max_electric.Pen_Color = 0x0000;
 Set_max_electric.Visible = 1;
 Set_max_electric.Active = 0;
 Set_max_electric.Transparent = 1;
 Set_max_electric.Caption = Set_max_electric_Caption;
 Set_max_electric.TextAlign = _taCenter;
 Set_max_electric.TextAlignVertical= _tavMiddle;
 Set_max_electric.FontName =  0x00005242 ;
 Set_max_electric.PressColEnabled = 1;
 Set_max_electric.Font_Color = 0x0408;
 Set_max_electric.VerticalText = 0;
 Set_max_electric.Gradient = 0;
 Set_max_electric.Gradient_Orientation = 0;
 Set_max_electric.Gradient_Start_Color = 0xFFFF;
 Set_max_electric.Gradient_End_Color = 0xC618;
 Set_max_electric.Color = 0xFFFF;
 Set_max_electric.Press_Color = 0xE71C;
 Set_max_electric.Corner_Radius = 2;
 Set_max_electric.OnUpPtr = 0;
 Set_max_electric.OnDownPtr = 0;
 Set_max_electric.OnClickPtr = 0;
 Set_max_electric.OnPressPtr = 0;

 Set_max_furnance.OwnerScreen = &LIMITS3;
 Set_max_furnance.Order = 43;
 Set_max_furnance.Left = 305;
 Set_max_furnance.Top = 131;
 Set_max_furnance.Width = 40;
 Set_max_furnance.Height = 23;
 Set_max_furnance.Pen_Width = 1;
 Set_max_furnance.Pen_Color = 0x0000;
 Set_max_furnance.Visible = 1;
 Set_max_furnance.Active = 0;
 Set_max_furnance.Transparent = 1;
 Set_max_furnance.Caption = Set_max_furnance_Caption;
 Set_max_furnance.TextAlign = _taCenter;
 Set_max_furnance.TextAlignVertical= _tavMiddle;
 Set_max_furnance.FontName =  0x00005242 ;
 Set_max_furnance.PressColEnabled = 1;
 Set_max_furnance.Font_Color = 0x0408;
 Set_max_furnance.VerticalText = 0;
 Set_max_furnance.Gradient = 0;
 Set_max_furnance.Gradient_Orientation = 0;
 Set_max_furnance.Gradient_Start_Color = 0xFFFF;
 Set_max_furnance.Gradient_End_Color = 0xC618;
 Set_max_furnance.Color = 0xFFFF;
 Set_max_furnance.Press_Color = 0xE71C;
 Set_max_furnance.Corner_Radius = 2;
 Set_max_furnance.OnUpPtr = 0;
 Set_max_furnance.OnDownPtr = 0;
 Set_max_furnance.OnClickPtr = 0;
 Set_max_furnance.OnPressPtr = 0;

 Set_electric_preset.OwnerScreen = &LIMITS3;
 Set_electric_preset.Order = 44;
 Set_electric_preset.Left = 305;
 Set_electric_preset.Top = 164;
 Set_electric_preset.Width = 40;
 Set_electric_preset.Height = 23;
 Set_electric_preset.Pen_Width = 1;
 Set_electric_preset.Pen_Color = 0x0000;
 Set_electric_preset.Visible = 1;
 Set_electric_preset.Active = 0;
 Set_electric_preset.Transparent = 1;
 Set_electric_preset.Caption = Set_electric_preset_Caption;
 Set_electric_preset.TextAlign = _taCenter;
 Set_electric_preset.TextAlignVertical= _tavMiddle;
 Set_electric_preset.FontName =  0x00005242 ;
 Set_electric_preset.PressColEnabled = 1;
 Set_electric_preset.Font_Color = 0x0408;
 Set_electric_preset.VerticalText = 0;
 Set_electric_preset.Gradient = 0;
 Set_electric_preset.Gradient_Orientation = 0;
 Set_electric_preset.Gradient_Start_Color = 0xFFFF;
 Set_electric_preset.Gradient_End_Color = 0xC618;
 Set_electric_preset.Color = 0xFFFF;
 Set_electric_preset.Press_Color = 0xE71C;
 Set_electric_preset.Corner_Radius = 2;
 Set_electric_preset.OnUpPtr = 0;
 Set_electric_preset.OnDownPtr = 0;
 Set_electric_preset.OnClickPtr = 0;
 Set_electric_preset.OnPressPtr = 0;

 Set_min_superheat.OwnerScreen = &LIMITS3;
 Set_min_superheat.Order = 45;
 Set_min_superheat.Left = 305;
 Set_min_superheat.Top = 195;
 Set_min_superheat.Width = 40;
 Set_min_superheat.Height = 23;
 Set_min_superheat.Pen_Width = 1;
 Set_min_superheat.Pen_Color = 0x0000;
 Set_min_superheat.Visible = 1;
 Set_min_superheat.Active = 0;
 Set_min_superheat.Transparent = 1;
 Set_min_superheat.Caption = Set_min_superheat_Caption;
 Set_min_superheat.TextAlign = _taCenter;
 Set_min_superheat.TextAlignVertical= _tavMiddle;
 Set_min_superheat.FontName =  0x00005242 ;
 Set_min_superheat.PressColEnabled = 1;
 Set_min_superheat.Font_Color = 0x0408;
 Set_min_superheat.VerticalText = 0;
 Set_min_superheat.Gradient = 0;
 Set_min_superheat.Gradient_Orientation = 0;
 Set_min_superheat.Gradient_Start_Color = 0xFFFF;
 Set_min_superheat.Gradient_End_Color = 0xC618;
 Set_min_superheat.Color = 0xFFFF;
 Set_min_superheat.Press_Color = 0xE71C;
 Set_min_superheat.Corner_Radius = 2;
 Set_min_superheat.OnUpPtr = 0;
 Set_min_superheat.OnDownPtr = 0;
 Set_min_superheat.OnClickPtr = 0;
 Set_min_superheat.OnPressPtr = 0;

 Label341.OwnerScreen = &LIMITS3;
 Label341.Order = 46;
 Label341.Left = 206;
 Label341.Top = 5;
 Label341.Width = 85;
 Label341.Height = 20;
 Label341.Visible = 1;
 Label341.Active = 0;
 Label341.Caption = Label341_Caption;
 Label341.FontName =  0x00005242 ;
 Label341.Font_Color = 0xE7FC;
 Label341.VerticalText = 0;
 Label341.OnUpPtr = 0;
 Label341.OnDownPtr = 0;
 Label341.OnClickPtr = 0;
 Label341.OnPressPtr = 0;

 CircleButton17.OwnerScreen = &LIMITS3;
 CircleButton17.Order = 47;
 CircleButton17.Left = 450;
 CircleButton17.Top = 3;
 CircleButton17.Radius = 12;
 CircleButton17.Pen_Width = 1;
 CircleButton17.Pen_Color = 0x0000;
 CircleButton17.Visible = 1;
 CircleButton17.Active = 0;
 CircleButton17.Transparent = 1;
 CircleButton17.Caption = CircleButton17_Caption;
 CircleButton17.TextAlign = _taCenter;
 CircleButton17.TextAlignVertical= _tavMiddle;
 CircleButton17.FontName =  0x00005242 ;
 CircleButton17.PressColEnabled = 1;
 CircleButton17.Font_Color = 0x0000;
 CircleButton17.VerticalText = 0;
 CircleButton17.Gradient = 1;
 CircleButton17.Gradient_Orientation = 0;
 CircleButton17.Gradient_Start_Color = 0xFFFF;
 CircleButton17.Gradient_End_Color = 0xC618;
 CircleButton17.Color = 0xC618;
 CircleButton17.Press_Color = 0xE71C;
 CircleButton17.OnUpPtr = 0;
 CircleButton17.OnDownPtr = 0;
 CircleButton17.OnClickPtr = 0;
 CircleButton17.OnPressPtr = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}
#line 29101 "C:/Users/User/Desktop/alta_2_compressor_display/Controller_Code/mikroC PRO for ARM/Controller_driver.c"
void DrawButton(TButton *Abutton) {
unsigned int ALeft, ATop;
 if (Abutton->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
 }
 TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
 TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
 if (Abutton->VerticalText != 0)
 TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
 if (Abutton->TextAlign == _taLeft)
 ALeft = Abutton->Left + 4;
 else if (Abutton->TextAlign == _taCenter)
 ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
 else if (Abutton->TextAlign == _taRight)
 ALeft = Abutton->Left + Abutton->Width - caption_length - 4;

 if (Abutton->TextAlignVertical == _tavTop)
 ATop = Abutton->Top + 4;
 else if (Abutton->TextAlignVertical == _tavMiddle)
 ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
 else if (Abutton->TextAlignVertical == _tavBottom)
 ATop = Abutton->Top + (Abutton->Height - caption_height - 4);

 TFT_Write_Text(Abutton->Caption, ALeft, ATop);
 }
}

void DrawRoundButton(TButton_Round *Around_button) {
unsigned int ALeft, ATop;
 if (Around_button->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 if (Around_button->VerticalText != 0)
 TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 ALeft = Around_button->Left + 4;
 else if (Around_button->TextAlign == _taCenter)
 ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
 else if (Around_button->TextAlign == _taRight)
 ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

 if (Around_button->TextAlignVertical == _tavTop)
 ATop = Around_button->Top + 3;
 else if (Around_button->TextAlignVertical == _tavMiddle)
 ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
 else if (Around_button->TextAlignVertical == _tavBottom)
 ATop = Around_button->Top + Around_button->Height - caption_height - 4;

 TFT_Write_Text(Around_button->Caption, ALeft, ATop);
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible != 0) {
 if (ALabel->VerticalText != 0)
 TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawImage(TImage *AImage) {
 if (AImage->Visible != 0) {
 TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
 }
}

void DrawCImage(TCImage *AImage) {
 if (AImage->Visible != 0) {
 TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
 }
}

void DrawCircle(TCircle *ACircle) {
 if (ACircle->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
 ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
 ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
 }
 TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
 TFT_Circle(ACircle->Left + ACircle->Radius,
 ACircle->Top + ACircle->Radius,
 ACircle->Radius);
 }
}

void DrawCircleButton(TCircleButton *ACircle_button) {
unsigned int ALeft, ATop;
 if (ACircle_button->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
 ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
 ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
 }
 TFT_Set_Pen(ACircle_button->Pen_Color, ACircle_button->Pen_Width);
 TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
 ACircle_button->Top + ACircle_button->Radius,
 ACircle_button->Radius);
 if (ACircle_button->VerticalText != 0)
 TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(ACircle_button->Caption, ACircle_button->Left, ACircle_button->Top);

 if (ACircle_button->TextAlign == _taLeft)
 ALeft = ACircle_button->Left + 4;
 else if (ACircle_button->TextAlign == _taCenter)
 ALeft = ACircle_button->Left + (ACircle_button->Radius*2 - caption_length) / 2;
 else if (ACircle_button->TextAlign == _taRight)
 ALeft = ACircle_button->Left + ACircle_button->Radius*2 - caption_length - 4;

 if (ACircle_button->TextAlignVertical == _tavTop)
 ATop = ACircle_button->Top + 3;
 else if (ACircle_button->TextAlignVertical == _tavMiddle)
 ATop = ACircle_button->Top + ACircle_button->Radius - caption_height / 2;
 else if (ACircle_button->TextAlignVertical == _tavBottom)
 ATop = ACircle_button->Top + (ACircle_button->Radius * 2) - caption_height - 4;

 TFT_Write_Text(ACircle_button->Caption, ALeft, ATop);
 }
}

void DrawBox(TBox *ABox) {
 if (ABox->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
 }
 TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
 TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
 }
}

void DrawRoundBox(TBox_Round *Around_box) {
 if (Around_box->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
 Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
 Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_box->Pen_Color, Around_box->Pen_Width);
 TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
 Around_box->Left + Around_box->Width - 2,
 Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
 }
}

void DrawLine(TLine *Aline) {
 if (Aline->Visible != 0) {
 TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
 TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
 }
}

unsigned int GetColorFromGradientRange(unsigned int start_color, unsigned int end_color,
 unsigned int distance, unsigned int range) {

 char red_start, red_end, red_current;
 char green_start, green_end, green_current;
 char blue_start, blue_end, blue_current;

 if (distance == 0)
 return start_color;
 else if (distance == range)
 return end_color;
 else {
 TFT_Color16bitToRGB(start_color, &red_start, &green_start, &blue_start);
 TFT_Color16bitToRGB(end_color, &red_end, &green_end, &blue_end);

 red_current = red_start + (long)distance * ((int)red_end - red_start) / range;
 green_current = green_start + (long)distance * ((int)green_end - green_start) / range;
 blue_current = blue_start + (long)distance * ((int)blue_end - blue_start) / range;
 return TFT_RGBToColor16bit(red_current, green_current, blue_current);
 }
}

void Update_Percentage(TProgressBar *AProgressBar, unsigned int locPosition) {
char tmpStr[8];

 if (AProgressBar->Show_Position != 0) {
 if (AProgressBar->Show_Percentage != 0) {
 WordToStr(locPosition , tmpStr);
 Ltrim(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 strcat(AProgressBar->Caption, "\%");
 } else {
 WordToStr(AProgressBar->Position , tmpStr);
 Ltrim(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 }
 TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
 }
}

void Update_Sector(TProgressBar *AProgressBar, unsigned int AStartPos, unsigned int AEndPos, TProgressBarSector ASectorAction) {
unsigned int tmpWidth = 0;
unsigned int tmpRound = 0;
unsigned cnt = 0;
unsigned int startcolor, endcolor;
int move_offset;
unsigned int locPosition = 0;

 if (AStartPos == AEndPos)
 return;


 if (AStartPos <= AProgressBar->Left) {
 if (AProgressBar->Rounded != 0)
 AStartPos = AProgressBar->Left + AProgressBar->Corner_Radius;
 else
 AStartPos = AProgressBar->Left + 1;
 }

 if (AEndPos >= AProgressBar->Left + AProgressBar->Width) {
 if (AProgressBar->Rounded != 0)
 AEndPos = AProgressBar->Left + AProgressBar->Width - (AProgressBar->Corner_Radius*2);
 else
 AEndPos = AProgressBar->Left + AProgressBar->Width - 1;
 }

 if (AProgressBar->Rounded != 0) {
 tmpRound = AProgressBar->Corner_Radius;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 }
 else {
 tmpRound = 0;
 tmpWidth = AProgressBar->Width;
 }


 TFT_Set_Pen(0, 0);
 if (ASectorAction == _pbsFillSector) {
 if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
 startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AStartPos, AProgressBar->Left + tmpWidth + tmpRound);
 endcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AEndPos, AProgressBar->Left + tmpWidth + tmpRound);
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, startcolor, endcolor);
 } else
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 } else {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 AEndPos += 1;
 }
 TFT_Rectangle(AStartPos, AProgressBar->Top + 1, AEndPos, AProgressBar->Top + 1 + AProgressBar->Height - 1);


 if ((AProgressBar->Smooth == 0) && (ASectorAction == _pbsFillSector)) {
 move_offset = 10;
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 locPosition = AStartPos;
 while (locPosition < AEndPos) {
 if (((locPosition - AProgressBar->Left - tmpRound)%(move_offset + 3) == 0) && (locPosition - 3 > AProgressBar->Left + tmpRound)) {
 if (locPosition + 3 >= AProgressBar->Left + tmpWidth + tmpRound)
 TFT_Rectangle(locPosition - 3, AProgressBar->Top, AProgressBar->Left + tmpWidth + tmpRound, AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(locPosition - 3, AProgressBar->Top, locPosition, AProgressBar->Top + AProgressBar->Height);
 locPosition += move_offset + 3;
 } else
 locPosition++;
 }
 }
}

void UpdatePBPosition(TProgressBar *AProgressBar) {
TProgressBarSector sector_action;
unsigned long locPosition = 0;
unsigned int _temp, _tempII;
unsigned int locStartPos = 0;
unsigned int locEndPos = 0;

 if (AProgressBar->Prev_Position == AProgressBar->Position)
 return;

 locPosition = (unsigned long)(AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
 if (AProgressBar->Visible != 0) {

 _temp = (AProgressBar->Position - AProgressBar->Min);
 _tempII = AProgressBar->Max - AProgressBar->Min;
 locEndPos = _temp * 100 / _tempII;
 _temp = (AProgressBar->Prev_Position - AProgressBar->Min);
 locStartPos = _temp * 100 / _tempII;
 if (AProgressBar->Rounded != 0) {
 _temp = AProgressBar->Width - (AProgressBar->Corner_Radius * 2);
 _tempII = AProgressBar->Left + AProgressBar->Corner_Radius;
 } else {
 _temp = (AProgressBar->Width - 2);
 _tempII = AProgressBar->Left + 1;
 }
 locStartPos = _tempII + locStartPos * _temp / 100;
 locEndPos = _tempII + locEndPos * _temp / 100;

 if (locStartPos < locEndPos)
 sector_action = _pbsFillSector;
 else {
 sector_action = _pbsClearSector;
 _temp = locStartPos;
 locStartPos = locEndPos;
 locEndPos = _temp;
 }
 Update_Sector(AProgressBar, locStartPos, locEndPos, sector_action);

 if (AProgressBar->Show_Position == 0) {
 AProgressBar->Prev_Position = AProgressBar->Position;
 return;
 }


 TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 if (caption_length > AProgressBar->Width)
 caption_length = AProgressBar->Width;
 _temp = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2;
 _tempII = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length;


 if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (locEndPos <= _temp))
 Update_Sector(AProgressBar, _temp, _tempII, _pbsClearSector);
 else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (_tempII <= locStartPos) && (_temp <= locEndPos))
 Update_Sector(AProgressBar, _temp, _tempII, _pbsFillSector);
 else if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (_temp <= locEndPos))
 Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
 else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos))
 Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
 else if ((locEndPos <= _tempII) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos)) {
 Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
 Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
 }


 Update_Percentage(AProgressBar, locPosition);
 AProgressBar->Prev_Position = AProgressBar->Position;
 }
}

void DrawProgressBar(TProgressBar *AProgressBar) {
unsigned long locPosition = 0;
int move_offset = 0;
unsigned cnt = 0;
unsigned int tmpWidth = 0;
unsigned int tmpRound = 0;
unsigned int startcolor, endcolor;
unsigned int _tmpI, _tmpII;
 move_offset = 10;
 _tmpI = AProgressBar->Position - AProgressBar->Min;
 _tmpII = AProgressBar->Max - AProgressBar->Min;
 locPosition = (unsigned long)_tmpI * 100 / _tmpII;
 if (AProgressBar->Visible != 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);

 if (AProgressBar->Rounded != 0) {
 tmpRound = AProgressBar->Corner_Radius;
 cnt = move_offset + tmpRound;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 } else {
 tmpRound = 0;
 cnt = move_offset;
 tmpWidth = AProgressBar->Width;
 }

 if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
 startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
 0, AProgressBar->Max - AProgressBar->Min);
 endcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
 AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
 } else {
 startcolor = AProgressBar->Gradient_Start_Color;
 endcolor = AProgressBar->Gradient_End_Color;
 }


 if (AProgressBar->Rounded != 0)
 TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
 AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
 else
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
 AProgressBar->Top + AProgressBar->Height);

 if (locPosition > 0) {
 if (AProgressBar->Rounded != 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
 AProgressBar->Gradient_Orientation, startcolor, endcolor);
 TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,
 AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100,
 AProgressBar->Top + AProgressBar->Height);
 } else {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
 AProgressBar->Gradient_Orientation, startcolor, endcolor);
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
 AProgressBar->Top + AProgressBar->Height);
 }

 if (AProgressBar->Smooth == 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
 if (cnt - tmpRound + 3 >= tmpWidth * locPosition)
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
 cnt = cnt + move_offset + 3;
 }
 }
 }

 Update_Percentage(AProgressBar, locPosition);
 AProgressBar->Prev_Position = AProgressBar->Position;
 }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 unsigned short button_idx;
 TButton *local_button;
 unsigned short round_button_idx;
 TButton_Round *local_round_button;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short image_idx;
 TImage *local_image;
 unsigned short cimage_idx;
 TCImage *local_cimage;
 unsigned short circle_idx;
 TCircle *local_circle;
 unsigned short circle_button_idx;
 TCircleButton *local_circle_button;
 unsigned short box_idx;
 TBox *local_box;
 unsigned short round_box_idx;
 TBox_Round *local_round_box;
 unsigned short line_idx;
 TLine *local_line;
 unsigned short progress_bar_idx;
 TProgressBar *local_progress_bar;
 char save_bled, save_bled_direction;

 object_pressed = 0;
 order = 0;
 button_idx = 0;
 round_button_idx = 0;
 label_idx = 0;
 image_idx = 0;
 cimage_idx = 0;
 circle_idx = 0;
 circle_button_idx = 0;
 box_idx = 0;
 round_box_idx = 0;
 line_idx = 0;
 progress_bar_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 TFT_BLED = 0;
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
 STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Set_Ext_Buffer(TFT_Get_Data);
 TFT_Fill_Screen(CurrentScreen->Color);
 TFT_Set_DBC_SSD1963(255);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (button_idx < CurrentScreen->ButtonsCount) {
 local_button =  CurrentScreen->Buttons[button_idx] ;
 if (order == local_button->Order) {
 button_idx++;
 order++;
 DrawButton(local_button);
 }
 }

 if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
 local_round_button =  CurrentScreen->Buttons_Round[round_button_idx] ;
 if (order == local_round_button->Order) {
 round_button_idx++;
 order++;
 DrawRoundButton(local_round_button);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (circle_idx < CurrentScreen->CirclesCount) {
 local_circle =  CurrentScreen->Circles[circle_idx] ;
 if (order == local_circle->Order) {
 circle_idx++;
 order++;
 DrawCircle(local_circle);
 }
 }

 if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
 local_circle_button =  CurrentScreen->CircleButtons[circle_button_idx] ;
 if (order == local_circle_button->Order) {
 circle_button_idx++;
 order++;
 DrawCircleButton(local_circle_button);
 }
 }

 if (box_idx < CurrentScreen->BoxesCount) {
 local_box =  CurrentScreen->Boxes[box_idx] ;
 if (order == local_box->Order) {
 box_idx++;
 order++;
 DrawBox(local_box);
 }
 }

 if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
 local_round_box =  CurrentScreen->Boxes_Round[round_box_idx] ;
 if (order == local_round_box->Order) {
 round_box_idx++;
 order++;
 DrawRoundBox(local_round_box);
 }
 }

 if (line_idx < CurrentScreen->LinesCount) {
 local_line =  CurrentScreen->Lines[line_idx] ;
 if (order == local_line->Order) {
 line_idx++;
 order++;
 DrawLine(local_line);
 }
 }

 if (image_idx < CurrentScreen->ImagesCount) {
 local_image =  CurrentScreen->Images[image_idx] ;
 if (order == local_image->Order) {
 image_idx++;
 order++;
 DrawImage(local_image);
 }
 }

 if (cimage_idx < CurrentScreen->CImagesCount) {
 local_cimage =  CurrentScreen->CImages[cimage_idx] ;
 if (order == local_cimage->Order) {
 cimage_idx++;
 order++;
 DrawCImage(local_cimage);
 }
 }

 if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
 local_progress_bar =  CurrentScreen->ProgressBars[progress_bar_idx] ;
 if (order == local_progress_bar->Order) {
 progress_bar_idx++;
 order++;
 DrawProgressBar(local_progress_bar);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 button_order = -1;
 round_button_order = -1;
 label_order = -1;
 image_order = -1;
 cimage_order = -1;
 circle_order = -1;
 circle_button_order = -1;
 box_order = -1;
 box_round_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
 local_button =  CurrentScreen->Buttons[_object_count] ;
 if (local_button->Active != 0) {
 if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
 local_button->Width, local_button->Height) == 1) {
 button_order = local_button->Order;
 exec_button = local_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
 local_round_button =  CurrentScreen->Buttons_Round[_object_count] ;
 if (local_round_button->Active != 0) {
 if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
 local_round_button->Width, local_round_button->Height) == 1) {
 round_button_order = local_round_button->Order;
 exec_round_button = local_round_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active != 0) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
 local_image =  CurrentScreen->Images[_object_count] ;
 if (local_image->Active != 0) {
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 image_order = local_image->Order;
 exec_image = local_image;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
 local_cimage =  CurrentScreen->CImages[_object_count] ;
 if (local_cimage->Active != 0) {
 if (IsInsideObject(X, Y, local_cimage->Left, local_cimage->Top,
 local_cimage->Width, local_cimage->Height) == 1) {
 cimage_order = local_cimage->Order;
 exec_cimage = local_cimage;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
 local_circle =  CurrentScreen->Circles[_object_count] ;
 if (local_circle->Active != 0) {
 if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
 (local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
 circle_order = local_circle->Order;
 exec_circle = local_circle;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
 local_circle_button =  CurrentScreen->CircleButtons[_object_count] ;
 if (local_circle_button->Active != 0) {
 if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
 (local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
 circle_button_order = local_circle_button->Order;
 exec_circle_button = local_circle_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
 local_box =  CurrentScreen->Boxes[_object_count] ;
 if (local_box->Active != 0) {
 if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
 local_box->Width, local_box->Height) == 1) {
 box_order = local_box->Order;
 exec_box = local_box;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
 local_round_box =  CurrentScreen->Boxes_Round[_object_count] ;
 if (local_round_box->Active != 0) {
 if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
 local_round_box->Width, local_round_box->Height) == 1) {
 box_round_order = local_round_box->Order;
 exec_round_box = local_round_box;
 }
 }
 }

 _object_count = -1;
 if (button_order > _object_count )
 _object_count = button_order;
 if (round_button_order > _object_count )
 _object_count = round_button_order;
 if (label_order > _object_count )
 _object_count = label_order;
 if (image_order > _object_count )
 _object_count = image_order;
 if (cimage_order > _object_count )
 _object_count = cimage_order;
 if (circle_order > _object_count )
 _object_count = circle_order;
 if (circle_button_order > _object_count )
 _object_count = circle_button_order;
 if (box_order > _object_count )
 _object_count = box_order;
 if (box_round_order > _object_count )
 _object_count = box_round_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_button = 0;
 exec_round_button = 0;
 exec_label = 0;
 exec_image = 0;
 exec_cimage = 0;
 exec_circle = 0;
 exec_circle_button = 0;
 exec_box = 0;
 exec_round_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->OnPressPtr != 0) {
 exec_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnPressPtr != 0) {
 exec_round_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 if (exec_image->OnPressPtr != 0) {
 exec_image->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == cimage_order) {
 if (exec_cimage->Active != 0) {
 if (exec_cimage->OnPressPtr != 0) {
 exec_cimage->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == circle_order) {
 if (exec_circle->Active != 0) {
 if (exec_circle->OnPressPtr != 0) {
 exec_circle->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == circle_button_order) {
 if (exec_circle_button->Active != 0) {
 if (exec_circle_button->OnPressPtr != 0) {
 exec_circle_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->OnPressPtr != 0) {
 exec_box->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == box_round_order) {
 if (exec_round_box->Active != 0) {
 if (exec_round_box->OnPressPtr != 0) {
 exec_round_box->OnPressPtr();
 return;
 }
 }
 }

 }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 0: {
 if (PressedObject != 0) {
 exec_button = (TButton*)PressedObject;
 if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
 DrawButton(exec_button);
 }
 break;
 }
 break;
 }

 case 1: {
 if (PressedObject != 0) {
 exec_round_button = (TButton_Round*)PressedObject;
 if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
 DrawRoundButton(exec_round_button);
 }
 break;
 }
 break;
 }

 case 4: {
 if (PressedObject != 0) {
 exec_circle = (TCircle*)PressedObject;
 if ((exec_circle->PressColEnabled != 0) && (exec_circle->OwnerScreen == CurrentScreen)) {
 DrawCircle(exec_circle);
 }
 break;
 }
 break;
 }

 case 5: {
 if (PressedObject != 0) {
 exec_circle_button = (TCircleButton*)PressedObject;
 if ((exec_circle_button->PressColEnabled != 0) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
 DrawCircleButton(exec_circle_button);
 }
 break;
 }
 break;
 }

 case 6: {
 if (PressedObject != 0) {
 exec_box = (TBox*)PressedObject;
 if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
 DrawBox(exec_box);
 }
 break;
 }
 break;
 }

 case 7: {
 if (PressedObject != 0) {
 exec_round_box = (TBox_Round*)PressedObject;
 if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
 DrawRoundBox(exec_round_box);
 }
 break;
 }
 break;
 }
 }

 exec_label = 0;
 exec_image = 0;
 exec_cimage = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->OnUpPtr != 0)
 exec_button->OnUpPtr();
 if (PressedObject == (TPointer)exec_button)
 if (exec_button->OnClickPtr != 0)
 exec_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnUpPtr != 0)
 exec_round_button->OnUpPtr();
 if (PressedObject == (TPointer)exec_round_button)
 if (exec_round_button->OnClickPtr != 0)
 exec_round_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (TPointer)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 if (exec_image->OnUpPtr != 0)
 exec_image->OnUpPtr();
 if (PressedObject == (TPointer)exec_image)
 if (exec_image->OnClickPtr != 0)
 exec_image->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == cimage_order) {
 if (exec_cimage->Active != 0) {
 if (exec_cimage->OnUpPtr != 0)
 exec_cimage->OnUpPtr();
 if (PressedObject == (TPointer)exec_cimage)
 if (exec_cimage->OnClickPtr != 0)
 exec_cimage->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == circle_order) {
 if (exec_circle->Active != 0) {
 if (exec_circle->OnUpPtr != 0)
 exec_circle->OnUpPtr();
 if (PressedObject == (TPointer)exec_circle)
 if (exec_circle->OnClickPtr != 0)
 exec_circle->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == circle_button_order) {
 if (exec_circle_button->Active != 0) {
 if (exec_circle_button->OnUpPtr != 0)
 exec_circle_button->OnUpPtr();
 if (PressedObject == (TPointer)exec_circle_button)
 if (exec_circle_button->OnClickPtr != 0)
 exec_circle_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->OnUpPtr != 0)
 exec_box->OnUpPtr();
 if (PressedObject == (TPointer)exec_box)
 if (exec_box->OnClickPtr != 0)
 exec_box->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == box_round_order) {
 if (exec_round_box->Active != 0) {
 if (exec_round_box->OnUpPtr != 0)
 exec_round_box->OnUpPtr();
 if (PressedObject == (TPointer)exec_round_box)
 if (exec_round_box->OnClickPtr != 0)
 exec_round_box->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_button = 0;
 exec_round_button = 0;
 exec_label = 0;
 exec_image = 0;
 exec_cimage = 0;
 exec_circle = 0;
 exec_circle_button = 0;
 exec_box = 0;
 exec_round_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawButton(exec_button);
 }
 PressedObject = (TPointer)exec_button;
 PressedObjectType = 0;
 if (exec_button->OnDownPtr != 0) {
 exec_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawRoundButton(exec_round_button);
 }
 PressedObject = (TPointer)exec_round_button;
 PressedObjectType = 1;
 if (exec_round_button->OnDownPtr != 0) {
 exec_round_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 PressedObject = (TPointer)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 PressedObject = (TPointer)exec_image;
 PressedObjectType = 3;
 if (exec_image->OnDownPtr != 0) {
 exec_image->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == cimage_order) {
 if (exec_cimage->Active != 0) {
 PressedObject = (TPointer)exec_cimage;
 PressedObjectType = 11;
 if (exec_cimage->OnDownPtr != 0) {
 exec_cimage->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == circle_order) {
 if (exec_circle->Active != 0) {
 if (exec_circle->PressColEnabled != 0) {
 object_pressed = 1;
 DrawCircle(exec_circle);
 }
 PressedObject = (TPointer)exec_circle;
 PressedObjectType = 4;
 if (exec_circle->OnDownPtr != 0) {
 exec_circle->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == circle_button_order) {
 if (exec_circle_button->Active != 0) {
 if (exec_circle_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawCircleButton(exec_circle_button);
 }
 PressedObject = (TPointer)exec_circle_button;
 PressedObjectType = 5;
 if (exec_circle_button->OnDownPtr != 0) {
 exec_circle_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->PressColEnabled != 0) {
 object_pressed = 1;
 DrawBox(exec_box);
 }
 PressedObject = (TPointer)exec_box;
 PressedObjectType = 6;
 if (exec_box->OnDownPtr != 0) {
 exec_box->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == box_round_order) {
 if (exec_round_box->Active != 0) {
 if (exec_round_box->PressColEnabled != 0) {
 object_pressed = 1;
 DrawRoundBox(exec_round_box);
 }
 PressedObject = (TPointer)exec_round_box;
 PressedObjectType = 7;
 if (exec_round_box->OnDownPtr != 0) {
 exec_round_box->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (STMPE610_PressDetect()) {
 if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {

 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU() {



 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
 GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
 GPIOB_ODR.B6 = 1;
 while (GPIOB_IDR.B7 == 0) {
 GPIOB_ODR.B6 = 0;
 Delay_us(10);
 GPIOB_ODR.B6 = 1;
 Delay_us(10);
 }
 I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);

 TFT_Set_Default_Mode();
 GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
 GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
 GPIOB_ODR.B4 = 0;
 TFT_Set_Default_Mode();
 TFT_Set_MM_Plus();
 STMPE610_SetDefaultMode();
}

void Init_Ext_Mem() {

 SDIO_Reset();

 SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
 | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);


 GPIOD_PUPDRbits.PUPDR2 = 1;
 GPIOC_PUPDRbits.PUPDR8 = 1;
 GPIOC_PUPDRbits.PUPDR9 = 1;
 GPIOC_PUPDRbits.PUPDR10 = 1;
 GPIOC_PUPDRbits.PUPDR11 = 1;

 Mmc_Set_Interface(_MMC_INTERFACE_SDIO);


 if (!Mmc_Fat_Init()) {

 SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
 | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);


 Mmc_Fat_Assign("Controll.RES", 0);
 Mmc_Fat_Reset(&res_file_size);
 }
}

char STMPE610_Config() {
 STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
 if (STMPE610_IsOperational() != 0){
 return STMPE610_IO_NOT_OPERATIONAL;
 }

 STMPE610_Reset();
 STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
 STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
 STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);
 STMPE610_SetSize(480,272);
 STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
 STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
 STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
 STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_12BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
 Delay_10ms(); Delay_10ms();
 STMPE610_SetADCClock(STMPE610_ADC_CTRL2_3250_kHZ);
 STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
 STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_4S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
 STMPE610_SetFIFOThreshold(1);
 STMPE610_ResetFIFO();
 STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
 STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
 STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
 STMPE610_SetTouchPressureThreshold(70);
 STMPE610_ClearInterrupts();
 STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
 return STMPE610_OK;
}


void Start_TP() {
TTPConstants TPConstsStruct;
 Init_MCU();

 Init_Ext_Mem();

 InitializeTouchPanel();
 if (STMPE610_Config() == STMPE610_OK) {
 } else {
 while(1);
 }



 TPConstsStruct.X_Min = 105;
 TPConstsStruct.X_Max = 3925;
 TPConstsStruct.Y_Min = 250;
 TPConstsStruct.Y_Max = 3820;
 TPConstsStruct.Rotate = 0;
 STMPE610_SetCalibrationConsts(&TPConstsStruct);

 InitializeObjects();
 display_width = HOME.Width;
 display_height = HOME.Height;
 DrawScreen(&HOME);
}
