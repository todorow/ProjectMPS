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
char string[16];
char *text;
int i,j,numUsers;
char uart_rd,ch,numU;
void ReadFromUART();
void main() {

              Lcd_Init();
              Lcd_Cmd(_LCD_CURSOR_OFF);
              Lcd_Cmd(_LCD_CLEAR);
              UART1_Init(9600);
             Delay_ms(5);
              numUsers=0;
              j=0;
              while(1)
              {
              ReadFromUART();

            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(1,1,string);
            
            if(strcmp(strstr(string,"ADD"),"ADD")==0)
            {
              Lcd_Out(2,1,strstr(string,"ADD"));
              while(strcmp(strstr(string,"START"),"START")!=0)
              {
                ReadFromUART();

                if(strcmp(strstr(string,"START"),"START")==0)
                {

                  Lcd_Cmd(_LCD_CLEAR);
                  Lcd_Out(2,1,strstr(string,"START"));
                  strcpy(string,"");
                  Lcd_Cmd(_LCD_CLEAR);
                  ReadFromUART();

                   for(j=0; j<=15; j++)
                   {
                    EEPROM_Write(0x10 + j,string[j]);
                    }
                              numUsers++;
                              EEPROM_Write(0x00,numUsers);
                              for(j=0; j<16; j++){
                              ch = EEPROM_Read(0x10 + j);
                              text[j]=ch;
                              }
                              Lcd_Out(1,1,text);
                      
                      }

                       break;

                      }
                             
                      
                        }

             if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
             Lcd_Out(2,1,strstr(string,"ERASE"));
            while(strcmp(strstr(string,"START"),"START")!=0){
             ReadFromUART();

            if(strcmp(strstr(string,"START"),"START")==0){
            
                   Lcd_Cmd(_LCD_CLEAR);
                  Lcd_Out(2,1,strstr(string,"START"));
            }
            }
            }
              if(strcmp(strstr(string,"END"),"END")==0){
            Lcd_Out(2,1,strstr(string,"END"));

            }
            strcpy(string,"");
           }
            

}
void ReadFromUART(){
i=0;
             while(1)         {
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
//
                         break;
//

                         }
            }
}