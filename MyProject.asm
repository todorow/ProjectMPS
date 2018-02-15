
_main:

;MyProject.c,23 :: 		void main() {
;MyProject.c,25 :: 		ANSEL =0b00100000;// DIGITALNI PINOVI SO ISKLUCOK NA E0;
	MOVLW      32
	MOVWF      ANSEL+0
;MyProject.c,26 :: 		ANSELH =0x00;
	CLRF       ANSELH+0
;MyProject.c,27 :: 		TRISE=0b00000001;//VLEZEN PIN E0
	MOVLW      1
	MOVWF      TRISE+0
;MyProject.c,28 :: 		TRISB=0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,29 :: 		INTCON=0x90;
	MOVLW      144
	MOVWF      INTCON+0
;MyProject.c,30 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;MyProject.c,31 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;MyProject.c,32 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,35 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,37 :: 		addr=0x00;
	CLRF       _addr+0
;MyProject.c,38 :: 		j=0;
	CLRF       _j+0
;MyProject.c,39 :: 		while(1)
L_main0:
;MyProject.c,41 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,42 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,44 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,46 :: 		if(strcmp(strstr(string,"ADD"),"ADD")==0)
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVLW      0
	XORWF      R0+0, 0
L__main82:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;MyProject.c,48 :: 		Lcd_Out(2,1,strstr(string,"ADD"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,49 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
L_main3:
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      0
	XORWF      R0+0, 0
L__main83:
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;MyProject.c,50 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,51 :: 		if(strcmp(strstr(string,"START"),"START")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVLW      0
	XORWF      R0+0, 0
L__main84:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;MyProject.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,54 :: 		Lcd_Out(2,1,strstr(string,"START"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,55 :: 		memset(string,0,strlen(string));
	MOVLW      _string+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      FARG_memset_n+0
	MOVF       R0+1, 0
	MOVWF      FARG_memset_n+1
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	CALL       _memset+0
;MyProject.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,57 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,59 :: 		numUsers=EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
;MyProject.c,60 :: 		j=0;
	CLRF       _j+0
;MyProject.c,62 :: 		for(i=0;i<strlen(string);i++){
	CLRF       _i+0
L_main6:
	MOVLW      _string+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVF       R0+0, 0
	SUBWF      _i+0, 0
L__main85:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,63 :: 		if(string[i]<='9'&&string[i]>='0'){
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_main11
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVLW      48
	SUBWF      INDF+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main11
L__main79:
;MyProject.c,64 :: 		j=1;
	MOVLW      1
	MOVWF      _j+0
;MyProject.c,65 :: 		}else if(isspace(string[i])&&i<=10){
	GOTO       L_main12
L_main11:
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isspace_character+0
	CALL       _isspace+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _i+0, 0
	SUBLW      10
	BTFSS      STATUS+0, 0
	GOTO       L_main15
L__main78:
;MyProject.c,66 :: 		j=2;
	MOVLW      2
	MOVWF      _j+0
;MyProject.c,67 :: 		}else{
	GOTO       L_main16
L_main15:
;MyProject.c,68 :: 		j=0;
	CLRF       _j+0
;MyProject.c,69 :: 		break;
	GOTO       L_main7
;MyProject.c,70 :: 		}
L_main16:
L_main12:
;MyProject.c,62 :: 		for(i=0;i<strlen(string);i++){
	INCF       _i+0, 1
;MyProject.c,71 :: 		}
	GOTO       L_main6
L_main7:
;MyProject.c,73 :: 		if(j==0){
	MOVF       _j+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;MyProject.c,74 :: 		Lcd_Out(1,1,"ERROR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,76 :: 		break;
	GOTO       L_main4
;MyProject.c,77 :: 		}else{
L_main17:
;MyProject.c,78 :: 		if(numUsers<10||numUsers==255){
	MOVLW      10
	SUBWF      _numUsers+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main77
	MOVF       _numUsers+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__main77
	GOTO       L_main21
L__main77:
;MyProject.c,79 :: 		if(numUsers==255){
	MOVF       _numUsers+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;MyProject.c,80 :: 		addr=0x10;
	MOVLW      16
	MOVWF      _addr+0
;MyProject.c,81 :: 		numUsers=0;
	CLRF       _numUsers+0
;MyProject.c,82 :: 		}else{
	GOTO       L_main23
L_main22:
;MyProject.c,83 :: 		addr+=numUsers*0x10;
	MOVF       _numUsers+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      _addr+0, 1
;MyProject.c,84 :: 		}
L_main23:
;MyProject.c,85 :: 		for(j=0; j<strlen(string); j++)
	CLRF       _j+0
L_main24:
	MOVLW      _string+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVF       R0+0, 0
	SUBWF      _j+0, 0
L__main86:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;MyProject.c,87 :: 		EEPROM_Write(addr + j,string[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,85 :: 		for(j=0; j<strlen(string); j++)
	INCF       _j+0, 1
;MyProject.c,88 :: 		}
	GOTO       L_main24
L_main25:
;MyProject.c,89 :: 		numUsers++;
	INCF       _numUsers+0, 1
;MyProject.c,90 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _numUsers+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,91 :: 		Lcd_Out(1,1,"O K  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,92 :: 		break;
	GOTO       L_main4
;MyProject.c,95 :: 		}else {
L_main21:
;MyProject.c,97 :: 		Lcd_Out(1,1,"ERROR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,98 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,99 :: 		break;
	GOTO       L_main4
;MyProject.c,105 :: 		}
L_main5:
;MyProject.c,106 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,107 :: 		}
L_main2:
;MyProject.c,109 :: 		if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr12_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr13_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      0
	XORWF      R0+0, 0
L__main87:
	BTFSS      STATUS+0, 2
	GOTO       L_main28
;MyProject.c,110 :: 		Lcd_Out(2,1,strstr(string,"ERASE"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr14_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,111 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
L_main29:
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr15_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVLW      0
	XORWF      R0+0, 0
L__main88:
	BTFSC      STATUS+0, 2
	GOTO       L_main30
;MyProject.c,112 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,113 :: 		if(strcmp(strstr(string,"START"),"START")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr17_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr18_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main89
	MOVLW      0
	XORWF      R0+0, 0
L__main89:
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;MyProject.c,115 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,116 :: 		Lcd_Out(2,1,strstr(string,"START"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr19_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,117 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,118 :: 		memset(string,0,strlen(string));
	MOVLW      _string+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      FARG_memset_n+0
	MOVF       R0+1, 0
	MOVWF      FARG_memset_n+1
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	CALL       _memset+0
;MyProject.c,119 :: 		memset(string2,0,strlen(string2));
	MOVLW      _string2+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      FARG_memset_n+0
	MOVF       R0+1, 0
	MOVWF      FARG_memset_n+1
	MOVLW      _string2+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	CALL       _memset+0
;MyProject.c,120 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,122 :: 		for(a=0,addr=0x10;a<=numUsers;addr+=0x10,a++){
	CLRF       _a+0
	MOVLW      16
	MOVWF      _addr+0
L_main32:
	MOVF       _a+0, 0
	SUBWF      _numUsers+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main33
;MyProject.c,123 :: 		for(j=0;j<strlen(string);j++){
	CLRF       _j+0
L_main35:
	MOVLW      _string+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main90
	MOVF       R0+0, 0
	SUBWF      _j+0, 0
L__main90:
	BTFSC      STATUS+0, 0
	GOTO       L_main36
;MyProject.c,124 :: 		string2[j]=EEPROM_Read(addr+j);
	MOVF       _j+0, 0
	ADDLW      _string2+0
	MOVWF      FLOC__main+0
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,125 :: 		if(isspace(string2[j])){
	MOVF       _j+0, 0
	ADDLW      _string2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isspace_character+0
	CALL       _isspace+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main38
;MyProject.c,126 :: 		string2[j]='\0';
	MOVF       _j+0, 0
	ADDLW      _string2+0
	MOVWF      FSR
	CLRF       INDF+0
;MyProject.c,127 :: 		break;
	GOTO       L_main36
;MyProject.c,128 :: 		}
L_main38:
;MyProject.c,123 :: 		for(j=0;j<strlen(string);j++){
	INCF       _j+0, 1
;MyProject.c,129 :: 		}
	GOTO       L_main35
L_main36:
;MyProject.c,130 :: 		if(strcmp(strstr(string2,string),string)==0){
	MOVLW      _string2+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      _string+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _string+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVLW      0
	XORWF      R0+0, 0
L__main91:
	BTFSS      STATUS+0, 2
	GOTO       L_main39
;MyProject.c,131 :: 		a=20;
	MOVLW      20
	MOVWF      _a+0
;MyProject.c,132 :: 		break;
	GOTO       L_main33
;MyProject.c,133 :: 		}else{
L_main39:
;MyProject.c,134 :: 		memset(string2,0,strlen(string2));
	MOVLW      _string2+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      FARG_memset_n+0
	MOVF       R0+1, 0
	MOVWF      FARG_memset_n+1
	MOVLW      _string2+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	CALL       _memset+0
;MyProject.c,122 :: 		for(a=0,addr=0x10;a<=numUsers;addr+=0x10,a++){
	MOVLW      16
	ADDWF      _addr+0, 1
	INCF       _a+0, 1
;MyProject.c,137 :: 		}
	GOTO       L_main32
L_main33:
;MyProject.c,138 :: 		if(a==20){
	MOVF       _a+0, 0
	XORLW      20
	BTFSS      STATUS+0, 2
	GOTO       L_main41
;MyProject.c,139 :: 		for(j=0;j<15;j++){
	CLRF       _j+0
L_main42:
	MOVLW      15
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main43
;MyProject.c,140 :: 		EEPROM_Write(addr+j,255);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,139 :: 		for(j=0;j<15;j++){
	INCF       _j+0, 1
;MyProject.c,141 :: 		}
	GOTO       L_main42
L_main43:
;MyProject.c,142 :: 		--numUsers;
	DECF       _numUsers+0, 1
;MyProject.c,143 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _numUsers+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,144 :: 		}
L_main41:
;MyProject.c,147 :: 		break;
	GOTO       L_main30
;MyProject.c,148 :: 		}
L_main31:
;MyProject.c,149 :: 		}
	GOTO       L_main29
L_main30:
;MyProject.c,150 :: 		}
L_main28:
;MyProject.c,151 :: 		if(strcmp(strstr(string,"END"),"END")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr20_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr21_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVLW      0
	XORWF      R0+0, 0
L__main92:
	BTFSS      STATUS+0, 2
	GOTO       L_main45
;MyProject.c,152 :: 		Lcd_Out(2,1,strstr(string,"END"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr22_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,154 :: 		while(1){
L_main46:
;MyProject.c,155 :: 		lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,156 :: 		Lcd_Out(1,1,"vnEsibroj");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,157 :: 		do
L_main48:
;MyProject.c,158 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;MyProject.c,159 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main48
;MyProject.c,160 :: 		switch (kp){
	GOTO       L_main51
;MyProject.c,161 :: 		case 1:  kp = 49; break;// 1
L_main53:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,162 :: 		case 2:  kp = 52; break;// 4
L_main54:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,163 :: 		case 3:  kp = 55; break;// 7
L_main55:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,164 :: 		case 4:  kp = 99;break; // c  null
L_main56:
	MOVLW      99
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,165 :: 		case 5:  kp = 50; break;// 2
L_main57:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,166 :: 		case 6:  kp = 53; break;// 5
L_main58:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,167 :: 		case 7:  kp = 56; break;// 8
L_main59:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,168 :: 		case 8:  kp = 48; break;// 0
L_main60:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,169 :: 		case 9:  kp = 51; break;// 3
L_main61:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,170 :: 		case 10: kp = 54; break;// 6
L_main62:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,171 :: 		case 11: kp = 57; break;// 9
L_main63:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,172 :: 		case 12: kp = 36; break;// $ BACK
L_main64:
	MOVLW      36
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,173 :: 		case 13: kp = 37; break;// % ID
L_main65:
	MOVLW      37
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,174 :: 		case 14: kp = 33; break;// ! CODE
L_main66:
	MOVLW      33
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,175 :: 		case 15: kp = 35; break;// # EXIT
L_main67:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,176 :: 		case 16: kp = 42; break;// * ENTER
L_main68:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main52
;MyProject.c,177 :: 		}
L_main51:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main53
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main54
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main55
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main56
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main57
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main58
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main59
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main60
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main61
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main62
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main63
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main64
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main65
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main66
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main67
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main68
L_main52:
;MyProject.c,181 :: 		}
	GOTO       L_main46
;MyProject.c,182 :: 		}
L_main45:
;MyProject.c,183 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,184 :: 		memset(string,0,strlen(string));
	MOVLW      _string+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      FARG_memset_n+0
	MOVF       R0+1, 0
	MOVWF      FARG_memset_n+1
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	CALL       _memset+0
;MyProject.c,185 :: 		}
	GOTO       L_main0
;MyProject.c,188 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ReadFromUART:

;MyProject.c,191 :: 		void ReadFromUART(){
;MyProject.c,192 :: 		i=0;
	CLRF       _i+0
;MyProject.c,193 :: 		while(1){
L_ReadFromUART69:
;MyProject.c,194 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ReadFromUART71:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART71
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART71
	NOP
	NOP
;MyProject.c,195 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART72
;MyProject.c,197 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,198 :: 		string[i]=uart_rd;
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,199 :: 		i++;
	INCF       _i+0, 1
;MyProject.c,200 :: 		}
L_ReadFromUART72:
;MyProject.c,201 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ReadFromUART73:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART73
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART73
	NOP
	NOP
;MyProject.c,202 :: 		if (!UART1_Data_Ready()&&i!=0)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_ReadFromUART76
	MOVF       _i+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART76
L__ReadFromUART80:
;MyProject.c,204 :: 		break;
	GOTO       L_ReadFromUART70
;MyProject.c,205 :: 		}
L_ReadFromUART76:
;MyProject.c,206 :: 		}
	GOTO       L_ReadFromUART69
L_ReadFromUART70:
;MyProject.c,207 :: 		}
L_end_ReadFromUART:
	RETURN
; end of _ReadFromUART
