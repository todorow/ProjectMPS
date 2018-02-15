// Start LCD module connections
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;
// End LCD module connections
char keypadPort at PORTC;
char string[16],string2[10];
char uart_rd,kp;
unsigned short numUsers,i,j,addr,a;
//unsigned short *mutex,*temp_res;
void ReadFromUART();


void main() {
//              init();   CODE BELOW
                ANSEL =0b00100000;// DIGITALNI PINOVI SO ISKLUCOK NA E0;
                ANSELH =0x00;
                TRISE=0b00000001;//VLEZEN PIN E0
                TRISB=0b00000001;
                INTCON=0x90;
                C1ON_bit = 0;
                C2ON_bit = 0;
                Lcd_Init();
                Lcd_Cmd(_LCD_CURSOR_OFF);
                Lcd_Cmd(_LCD_CLEAR);
                UART1_Init(9600);
//                Delay_ms(100);
                addr=0x00;
                j=0;
              while(1)
              {
                  Lcd_Out(1,1,string);
                  ReadFromUART();
                  Lcd_Cmd(_LCD_CLEAR);
                  Lcd_Out(1,1,string);
                   // ADDOption();    ADD OPTION BELOW CODE
                   if(strcmp(strstr(string,"ADD"),"ADD")==0)
                  {
                      Lcd_Out(2,1,strstr(string,"ADD"));
                      while(strcmp(strstr(string,"START"),"START")!=0){
                              ReadFromUART();
                              if(strcmp(strstr(string,"START"),"START")==0){

                                  Lcd_Cmd(_LCD_CLEAR);
                                  Lcd_Out(2,1,strstr(string,"START"));
                                  memset(string,0,strlen(string));
                                  Lcd_Cmd(_LCD_CLEAR);
                                  ReadFromUART();
//                                     WriteInEEPROM(); CODE BELOW
                                  numUsers=EEPROM_Read(0x00);
                                  j=0;

                                    for(i=0;i<strlen(string);i++){
                                       if(string[i]<='9'&&string[i]>='0'){
                                            j=1;
                                       }else if(isspace(string[i])&&i<=10){
                                          j=2;
                                       }else{
                                         j=0;
                                         break;
                                       }
                                    }

                                    if(j==0){
                                        Lcd_Out(1,1,"ERROR");
                                        Lcd_Cmd(_LCD_CLEAR);
                                        break;
                                    }else{
                                        if(numUsers<10||numUsers==255){
                                               if(numUsers==255){
                                                 addr=0x10;
                                                 numUsers=0;
                                               }else{
                                                 addr+=numUsers*0x10;
                                                     }
                                               for(j=0; j<strlen(string); j++)
                                               {
                                                  EEPROM_Write(addr + j,string[j]);
                                                }
                                               numUsers++;
                                               EEPROM_Write(0x00,numUsers);
                                                Lcd_Out(1,1,"O K  ");
                                                break;
                                                     
                                                     
                                          }else {
                                          /// NEMA MESTO ZA DR USERS
                                               Lcd_Out(1,1,"ERROR");
                                               Lcd_Cmd(_LCD_CLEAR);
                                               break;
                                          
                                          }

                                       }

                                 }
                              }
                  }

                if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
                   Lcd_Out(2,1,strstr(string,"ERASE"));
                     while(strcmp(strstr(string,"START"),"START")!=0){
                        ReadFromUART();
                        if(strcmp(strstr(string,"START"),"START")==0){

                               Lcd_Cmd(_LCD_CLEAR);
                               Lcd_Out(2,1,strstr(string,"START"));
                               Lcd_Cmd(_LCD_CLEAR);
                               memset(string,0,strlen(string));
                               memset(string2,0,strlen(string2));
                               ReadFromUART();

                               for(a=0,addr=0x10;a<=numUsers;addr+=0x10,a++){
                                   for(j=0;j<strlen(string);j++){
                                    string2[j]=EEPROM_Read(addr+j);
                                     if(isspace(string2[j])){
                                     string2[j]='\0';
                                     break;
                                     }
                                   }
                                     if(strcmp(strstr(string2,string),string)==0){
                                       a=20;
                                       break;
                                     }else{
                                       memset(string2,0,strlen(string2));
                                     }

                               }
                                 if(a==20){
                                   for(j=0;j<15;j++){
                                      EEPROM_Write(addr+j,255);
                                     }
                                     --numUsers;
                                     EEPROM_Write(0x00,numUsers);
                                 }


                         break;
                        }
                }
              }
                if(strcmp(strstr(string,"END"),"END")==0){
                  Lcd_Out(2,1,strstr(string,"END"));
//
                  while(1){
                        lcd_Cmd(_LCD_CLEAR);
                        Lcd_Out(1,1,"vnEsibroj");
                         do
                           kp = Keypad_Key_Click();
                         while (!kp);
                               switch (kp){
                                 case 1:  kp = 49; break;// 1
                                 case 2:  kp = 52; break;// 4
                                 case 3:  kp = 55; break;// 7
                                 case 4:  kp = 99;break; // c  null
                                 case 5:  kp = 50; break;// 2
                                 case 6:  kp = 53; break;// 5
                                 case 7:  kp = 56; break;// 8
                                 case 8:  kp = 48; break;// 0
                                 case 9:  kp = 51; break;// 3
                                 case 10: kp = 54; break;// 6
                                 case 11: kp = 57; break;// 9
                                 case 12: kp = 36; break;// $ BACK
                                 case 13: kp = 37; break;// % ID
                                 case 14: kp = 33; break;// ! CODE
                                 case 15: kp = 35; break;// # EXIT
                                 case 16: kp = 42; break;// * ENTER
                               }
                               


                                                  }
              }
              Lcd_Cmd(_LCD_CLEAR);
               memset(string,0,strlen(string));
           }


}


void ReadFromUART(){
            i=0;
            while(1){
               Delay_ms(5);
                 if (UART1_Data_Ready())
                    {
                      uart_rd = UART1_Read();
                      string[i]=uart_rd;
                      i++;
                     }
                     Delay_ms(5);
                     if (!UART1_Data_Ready()&&i!=0)
                        {
                         break;
                         }
            }
}