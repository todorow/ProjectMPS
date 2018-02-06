
_main:

;MyProject.c,24 :: 		void main() {
;MyProject.c,26 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,29 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;MyProject.c,30 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;MyProject.c,31 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,32 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;MyProject.c,33 :: 		addr=0x00;
	CLRF       _addr+0
	CLRF       _addr+1
;MyProject.c,34 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;MyProject.c,35 :: 		while(1)
L_main1:
;MyProject.c,37 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,38 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,41 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,44 :: 		ADDOption();
	CALL       _ADDOption+0
;MyProject.c,45 :: 		if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
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
	GOTO       L__main34
	MOVLW      0
	XORWF      R0+0, 0
L__main34:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;MyProject.c,46 :: 		Lcd_Out(2,1,strstr(string,"ERASE"));
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
;MyProject.c,47 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
L_main4:
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
	GOTO       L__main35
	MOVLW      0
	XORWF      R0+0, 0
L__main35:
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;MyProject.c,48 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,50 :: 		if(strcmp(strstr(string,"START"),"START")==0){
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
	GOTO       L__main36
	MOVLW      0
	XORWF      R0+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;MyProject.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,53 :: 		Lcd_Out(2,1,strstr(string,"START"));
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
;MyProject.c,54 :: 		}
L_main6:
;MyProject.c,55 :: 		}
	GOTO       L_main4
L_main5:
;MyProject.c,56 :: 		}
L_main3:
;MyProject.c,57 :: 		if(strcmp(strstr(string,"END"),"END")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      0
	XORWF      R0+0, 0
L__main37:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;MyProject.c,58 :: 		Lcd_Out(2,1,strstr(string,"END"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,60 :: 		}
L_main7:
;MyProject.c,61 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,62 :: 		}
	GOTO       L_main1
;MyProject.c,65 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ADDOption:

;MyProject.c,66 :: 		void ADDOption(){
;MyProject.c,67 :: 		if(strcmp(strstr(string,"ADD"),"ADD")==0)
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
	GOTO       L__ADDOption39
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption39:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption8
;MyProject.c,69 :: 		Lcd_Out(2,1,strstr(string,"ADD"));
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
;MyProject.c,70 :: 		while(strcmp(strstr(string,"START"),"START")!=0)
L_ADDOption9:
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
	GOTO       L__ADDOption40
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption40:
	BTFSC      STATUS+0, 2
	GOTO       L_ADDOption10
;MyProject.c,72 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,75 :: 		if(strcmp(strstr(string,"START"),"START")==0)
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
	GOTO       L__ADDOption41
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption41:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption11
;MyProject.c,78 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,79 :: 		Lcd_Out(2,1,strstr(string,"START"));
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
;MyProject.c,80 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,83 :: 		WriteInEEPROM();
	CALL       _WriteInEEPROM+0
;MyProject.c,85 :: 		break;
	GOTO       L_ADDOption10
;MyProject.c,86 :: 		}
L_ADDOption11:
;MyProject.c,90 :: 		}
	GOTO       L_ADDOption9
L_ADDOption10:
;MyProject.c,93 :: 		}
L_ADDOption8:
;MyProject.c,94 :: 		}
L_end_ADDOption:
	RETURN
; end of _ADDOption

_WriteInEEPROM:

;MyProject.c,95 :: 		void WriteInEEPROM(){
;MyProject.c,96 :: 		if(AddressVal()!=0){
	CALL       _AddressVal+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM43
	MOVLW      0
	XORWF      R0+0, 0
L__WriteInEEPROM43:
	BTFSC      STATUS+0, 2
	GOTO       L_WriteInEEPROM12
;MyProject.c,97 :: 		addr+=AddressVal();
	CALL       _AddressVal+0
	MOVF       R0+0, 0
	ADDWF      _addr+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _addr+1, 1
;MyProject.c,99 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,101 :: 		for(j=0; j<=15; j++)
	CLRF       _j+0
	CLRF       _j+1
L_WriteInEEPROM13:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM44
	MOVF       _j+0, 0
	SUBLW      15
L__WriteInEEPROM44:
	BTFSS      STATUS+0, 0
	GOTO       L_WriteInEEPROM14
;MyProject.c,103 :: 		EEPROM_Write(addr + j,string[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,101 :: 		for(j=0; j<=15; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,104 :: 		}
	GOTO       L_WriteInEEPROM13
L_WriteInEEPROM14:
;MyProject.c,105 :: 		numUsers=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,106 :: 		numUsers++;
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,107 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,108 :: 		}
L_WriteInEEPROM12:
;MyProject.c,109 :: 		}
L_end_WriteInEEPROM:
	RETURN
; end of _WriteInEEPROM

_NumOfUsers:

;MyProject.c,110 :: 		int NumOfUsers(){
;MyProject.c,111 :: 		ch = EEPROM_Read(0x10);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MyProject.c,112 :: 		return atoi(ch);
	MOVF       R0+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
;MyProject.c,114 :: 		}
L_end_NumOfUsers:
	RETURN
; end of _NumOfUsers

_CheckEEPROM:

;MyProject.c,115 :: 		int CheckEEPROM(){
;MyProject.c,116 :: 		users=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _users+0
;MyProject.c,117 :: 		if(users!=255){
	MOVF       R0+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_CheckEEPROM16
;MyProject.c,118 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_CheckEEPROM
;MyProject.c,120 :: 		}else{
L_CheckEEPROM16:
;MyProject.c,121 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,124 :: 		}
L_end_CheckEEPROM:
	RETURN
; end of _CheckEEPROM

_NextUserNum:

;MyProject.c,125 :: 		int NextUserNum(){
;MyProject.c,126 :: 		if(CheckEEPROM()){
	CALL       _CheckEEPROM+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_NextUserNum18
;MyProject.c,127 :: 		return NumOfUsers()*16;
	CALL       _NumOfUsers+0
	MOVLW      4
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__NextUserNum48:
	BTFSC      STATUS+0, 2
	GOTO       L__NextUserNum49
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__NextUserNum48
L__NextUserNum49:
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	GOTO       L_end_NextUserNum
;MyProject.c,128 :: 		}else{
L_NextUserNum18:
;MyProject.c,129 :: 		return 16;
	MOVLW      16
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,131 :: 		}
L_end_NextUserNum:
	RETURN
; end of _NextUserNum

_ValidateUserNum:

;MyProject.c,133 :: 		int ValidateUserNum( int num)  {
;MyProject.c,134 :: 		if(num>=160){
	MOVLW      128
	XORWF      FARG_ValidateUserNum_num+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateUserNum51
	MOVLW      160
	SUBWF      FARG_ValidateUserNum_num+0, 0
L__ValidateUserNum51:
	BTFSS      STATUS+0, 0
	GOTO       L_ValidateUserNum20
;MyProject.c,135 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateUserNum
;MyProject.c,136 :: 		}else{
L_ValidateUserNum20:
;MyProject.c,137 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,139 :: 		}
L_end_ValidateUserNum:
	RETURN
; end of _ValidateUserNum

_AddressVal:

;MyProject.c,140 :: 		int AddressVal(){
;MyProject.c,141 :: 		if(ValidateUserNum(NextUserNum())){
	CALL       _NextUserNum+0
	MOVF       R0+0, 0
	MOVWF      FARG_ValidateUserNum_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_ValidateUserNum_num+1
	CALL       _ValidateUserNum+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_AddressVal22
;MyProject.c,142 :: 		return NextUserNum()+16;
	CALL       _NextUserNum+0
	MOVLW      16
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	GOTO       L_end_AddressVal
;MyProject.c,143 :: 		}else{
L_AddressVal22:
;MyProject.c,144 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,146 :: 		}
L_end_AddressVal:
	RETURN
; end of _AddressVal

_ReadFromUART:

;MyProject.c,147 :: 		void ReadFromUART(){
;MyProject.c,148 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,149 :: 		while(1)         {
L_ReadFromUART24:
;MyProject.c,150 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ReadFromUART26:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART26
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART26
	NOP
	NOP
;MyProject.c,151 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART27
;MyProject.c,153 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,154 :: 		string[i]=uart_rd;
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,155 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,156 :: 		}
L_ReadFromUART27:
;MyProject.c,157 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ReadFromUART28:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART28
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART28
	NOP
	NOP
;MyProject.c,158 :: 		if (!UART1_Data_Ready()&&i!=0)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_ReadFromUART31
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadFromUART54
	MOVLW      0
	XORWF      _i+0, 0
L__ReadFromUART54:
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART31
L__ReadFromUART32:
;MyProject.c,161 :: 		break;
	GOTO       L_ReadFromUART25
;MyProject.c,164 :: 		}
L_ReadFromUART31:
;MyProject.c,165 :: 		}
	GOTO       L_ReadFromUART24
L_ReadFromUART25:
;MyProject.c,166 :: 		}
L_end_ReadFromUART:
	RETURN
; end of _ReadFromUART
