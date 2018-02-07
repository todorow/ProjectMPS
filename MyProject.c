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
char kp;
char string[16];
char text[16];
int i,j,numUsers,addr;
char uart_rd,ch,users;
char userCode[16];
unsigned int temp_res;
short ifinterupt=0;
int counter;
int iterator;
int locker;
int mutex,mutex1;

void ReadFromUART(){
i=0;
             while(1)         {
               Delay_ms(10);
                 if (UART1_Data_Ready())
                    {
                      uart_rd = UART1_Read();
                      string[i]=uart_rd;
                      i++;
                     }
                     Delay_ms(10);
                     if (!UART1_Data_Ready()&&i!=0)
                        {
//
                         break;
//

                         }
            }
}
 int NumOfUsers(){
    ch = EEPROM_Read(0x10);
    return atoi(ch);

}
int CheckEEPROM(){
    users=NumOfUsers();
    if(users!=255){
    return 1;

    }else{
    return 0;
    }

}

int NextUserNum(){
    if(CheckEEPROM()){
      return NumOfUsers()*16;
    }else{
      return 16;
    }
}

int ValidateUserNum( int num)  {
if(num>=160){
return 0;
}else{
return 1;
}
}

int AddressVal(){
if(ValidateUserNum(NextUserNum())){
return NextUserNum()+16;
}else{
return 0;
}
}
int ValidateInput(){
 if(strcmp(strstr(string," ")," ")==0)
 {


  counter=0;
  iterator=0;
  locker=1;
 Lcd_Out(1,1,"DEBUG");
   for(j=0;j<strlen(string);j++){
    if(isdigit(string[j])&&locker==1){
    counter++;
         Lcd_Out(1,1,"DEBUG2");
    }else if(isspace(string[j])&&counter==j){
            locker=0;
            Lcd_Out(1,1,"DEBUG3");


    }else{
    Lcd_Out(1,1,"DEBUG4");
    return 0;
    }
    if(locker==0){
       if(isdigit(string[j])){
       Lcd_Out(1,1,"DEBUG");
         userCode[iterator]=string[j];
         iterator++;

       } else{
       return 0;
       }
    }


   }
   if(atoi(userCode)>1023&&atoi(userCode)!=0){
   return 0;
   }else{
   Lcd_Out(1,1,"DEBUG");
   return 1;
   }
 }else{
 return 0;
 }



}
void WriteInEEPROM(){
  if(AddressVal()!=0){
                   addr+=AddressVal();

                   ReadFromUART();
          if( ValidateInput()!=0){
                   for(j=0; j<=15; j++)
                   {
                    EEPROM_Write(addr + j,string[j]);
                    }
                    numUsers=NumOfUsers();
                    numUsers++;

                   EEPROM_Write(0x00,numUsers);
                   Lcd_Out(1,1,"OK");
//                   Lcd_Cmd(_LCD_CLEAR);
                    }else{
                    Lcd_Out(1,1,"EROR");

                    }
                    }
}
void EraseUser(int address){
 memset(text,255,sizeof(text));
    for(j=0; j<=15; j++)
     {
        EEPROM_Write(addr + j,text[j]);
      }
      numUsers--;
       EEPROM_Write(0x00,numUsers);
}
void findUserId(){
    memset(string,0,sizeof(string));
    ReadFromUART();
    memset(text,0,sizeof(text));
    addr=0x10;
    for(i-0;i<10;i++){
       for(j=0;j<=15;j++)
    {
         ch = EEPROM_Read(addr+j);
         text[j]=ch;
    }
    if(strcmp(strstr(string,text),text)==0){
       EraseUser(addr);

    }
    addr+=16;
    }


}
void EraseOption(){
    if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
             Lcd_Out(2,1,strstr(string,"ERASE"));
            while(strcmp(strstr(string,"START"),"START")!=0){
             ReadFromUART();

            if(strcmp(strstr(string,"START"),"START")==0){

                   Lcd_Cmd(_LCD_CLEAR);
                  Lcd_Out(2,1,strstr(string,"START"));
                  findUserId();
            }
            }
            }


}

void ADDOption(){
Lcd_Cmd(_LCD_CLEAR);
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
                  memset(string,0,sizeof(string));
                  Lcd_Cmd(_LCD_CLEAR);

                     WriteInEEPROM();

                     break;
                   }



                      }


                  }
}









void interrupt(){
if (INTF_bit==1){
 ifinterupt++;
 INTF_bit = 0;
 }
}

void main() {
              Lcd_Init();
              Lcd_Cmd(_LCD_CURSOR_OFF);
              Lcd_Cmd(_LCD_CLEAR);
              C1ON_bit = 0;
              C2ON_bit = 0;
              UART1_Init(9600);
              Delay_ms(5);
              addr=0x00;
              j=0;
              PORTB=0x00;
               TRISB=0x01;
               INTCON=0x90;
              while(1)
              {
              Lcd_Out(1,1,string);
              ReadFromUART();

            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(1,1,string);
            Delay_ms(1);
            ADDOption();
            EraseOption();

              if(strcmp(strstr(string,"END"),"END")==0){
                       memset(string,0,sizeof(string));
j=0;
 Lcd_Cmd(_LCD_CLEAR);
 mutex=0;
 mutex1=0;
while(ifinterupt==0){
           Lcd_Out(1,1,"v n E s i b r o j");
           do
           kp = Keypad_Key_Click();
           while (!kp);
           switch (kp)
           {
           case 1:  kp = 49; break; // 1
           case 2:  kp = 52; break;//4
           case 3:  kp = 55; break; // 7
           case 4:  kp = 126; break; // ~  null
           case 5:  kp=50;  break; // 2
           case 6:  kp = 53; break; // 5
           case 7:  kp = 56; break; // 8
           case 8:  kp = 48; break; // 0
           case 9:  kp=51;   break; //3
           case 10: kp = 54; break; // 6
           case 11: kp = 57; break; // 9
           case 12: kp = 36; break; // $ BACK
           case 13: kp = 37; break; // % ID
           case 14: kp = 33; break; // ! CODE
           case 15: kp = 35; break; // # EXIT
           case 16: kp = 42; break; // * ENTER
           }
           if(kp!=0&&kp!=42&&kp!=35&&kp!=33&&kp!=37&&kp!=36&&kp!=126){
                   string[j]=kp;
           }
           if(kp==36){
                j--;
           }
           if(kp==33){
                temp_res=ADC_Read(2);
                IntToStr(text,temp_res);
                mutex=1 ;

           }
           if(kp==37){
                   mutex1=1;
           }
           if(kp==42&&mutex==1){
               if(strcmp(string,text)==0){
                Lcd_Cmd(_LCD_CLEAR);
                Lcd_Out(1,1,"v a l i d n a");
                Lcd_Out(2,1,"a v t o R i z a c i j a");
                }else{
                 Lcd_Cmd(_LCD_CLEAR);
                Lcd_Out(1,1,"n e v a l i d n a");
                Lcd_Out(2,1,"a v t o R i z a c i j a");
                }
           }
           if(kp==42&&mutex1==1){
               addr=0x10;

                   for(i-0;i<10;i++){
                    memset(text,0,sizeof(text));
                   for(counter=0;counter<=15;counter++)
                    {
                       ch = EEPROM_Read(addr+counter);
                       text[counter]=ch;
                     }
                    if(strcmp(strstr(string,text),string)==0){
                        Lcd_Cmd(_LCD_CLEAR);
                        Lcd_Out(1,1,"V a l i d e n");
                        Lcd_Out(2,1,"k o R i s n i k");

                     }
                     addr+=16;
                     }
                      Lcd_Cmd(_LCD_CLEAR);
                        Lcd_Out(1,1,"n e V a l i d e n");
                        Lcd_Out(2,1,"k o R i s n i k");
           }



            }
            memset(text,255,sizeof(text));
            addr=0x00;
      for(i-0;i<10;i++){
      for(j=0; j<=15; j++)
     {
        EEPROM_Write(addr + j,text[j]);
      }
      addr+=16;
      }
                  }

        }
}