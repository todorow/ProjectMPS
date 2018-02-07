
_ReadFromUART:

;MyProject.c,29 :: 		void ReadFromUART(){
;MyProject.c,30 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,31 :: 		while(1)         {
L_ReadFromUART0:
;MyProject.c,32 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_ReadFromUART2:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART2
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART2
	NOP
;MyProject.c,33 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART3
;MyProject.c,35 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,36 :: 		string[i]=uart_rd;
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,37 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,38 :: 		}
L_ReadFromUART3:
;MyProject.c,39 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_ReadFromUART4:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART4
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART4
	NOP
;MyProject.c,40 :: 		if (!UART1_Data_Ready()&&i!=0)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_ReadFromUART7
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadFromUART124
	MOVLW      0
	XORWF      _i+0, 0
L__ReadFromUART124:
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART7
L__ReadFromUART116:
;MyProject.c,43 :: 		break;
	GOTO       L_ReadFromUART1
;MyProject.c,46 :: 		}
L_ReadFromUART7:
;MyProject.c,47 :: 		}
	GOTO       L_ReadFromUART0
L_ReadFromUART1:
;MyProject.c,48 :: 		}
L_end_ReadFromUART:
	RETURN
; end of _ReadFromUART

_NumOfUsers:

;MyProject.c,49 :: 		int NumOfUsers(){
;MyProject.c,50 :: 		ch = EEPROM_Read(0x10);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MyProject.c,51 :: 		return atoi(ch);
	MOVF       R0+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
;MyProject.c,53 :: 		}
L_end_NumOfUsers:
	RETURN
; end of _NumOfUsers

_CheckEEPROM:

;MyProject.c,54 :: 		int CheckEEPROM(){
;MyProject.c,55 :: 		users=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _users+0
;MyProject.c,56 :: 		if(users!=255){
	MOVF       R0+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_CheckEEPROM8
;MyProject.c,57 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_CheckEEPROM
;MyProject.c,59 :: 		}else{
L_CheckEEPROM8:
;MyProject.c,60 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,63 :: 		}
L_end_CheckEEPROM:
	RETURN
; end of _CheckEEPROM

_NextUserNum:

;MyProject.c,65 :: 		int NextUserNum(){
;MyProject.c,66 :: 		if(CheckEEPROM()){
	CALL       _CheckEEPROM+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_NextUserNum10
;MyProject.c,67 :: 		return NumOfUsers()*16;
	CALL       _NumOfUsers+0
	MOVLW      4
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__NextUserNum128:
	BTFSC      STATUS+0, 2
	GOTO       L__NextUserNum129
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__NextUserNum128
L__NextUserNum129:
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	GOTO       L_end_NextUserNum
;MyProject.c,68 :: 		}else{
L_NextUserNum10:
;MyProject.c,69 :: 		return 16;
	MOVLW      16
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,71 :: 		}
L_end_NextUserNum:
	RETURN
; end of _NextUserNum

_ValidateUserNum:

;MyProject.c,73 :: 		int ValidateUserNum( int num)  {
;MyProject.c,74 :: 		if(num>=160){
	MOVLW      128
	XORWF      FARG_ValidateUserNum_num+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateUserNum131
	MOVLW      160
	SUBWF      FARG_ValidateUserNum_num+0, 0
L__ValidateUserNum131:
	BTFSS      STATUS+0, 0
	GOTO       L_ValidateUserNum12
;MyProject.c,75 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateUserNum
;MyProject.c,76 :: 		}else{
L_ValidateUserNum12:
;MyProject.c,77 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,79 :: 		}
L_end_ValidateUserNum:
	RETURN
; end of _ValidateUserNum

_AddressVal:

;MyProject.c,81 :: 		int AddressVal(){
;MyProject.c,82 :: 		if(ValidateUserNum(NextUserNum())){
	CALL       _NextUserNum+0
	MOVF       R0+0, 0
	MOVWF      FARG_ValidateUserNum_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_ValidateUserNum_num+1
	CALL       _ValidateUserNum+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_AddressVal14
;MyProject.c,83 :: 		return NextUserNum()+16;
	CALL       _NextUserNum+0
	MOVLW      16
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	GOTO       L_end_AddressVal
;MyProject.c,84 :: 		}else{
L_AddressVal14:
;MyProject.c,85 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,87 :: 		}
L_end_AddressVal:
	RETURN
; end of _AddressVal

_ValidateInput:

;MyProject.c,88 :: 		int ValidateInput(){
;MyProject.c,89 :: 		if(strcmp(strstr(string," ")," ")==0)
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
	GOTO       L__ValidateInput134
	MOVLW      0
	XORWF      R0+0, 0
L__ValidateInput134:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput16
;MyProject.c,93 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,94 :: 		iterator=0;
	CLRF       _iterator+0
	CLRF       _iterator+1
;MyProject.c,95 :: 		locker=1;
	MOVLW      1
	MOVWF      _locker+0
	MOVLW      0
	MOVWF      _locker+1
;MyProject.c,96 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,97 :: 		for(j=0;j<strlen(string);j++){
	CLRF       _j+0
	CLRF       _j+1
L_ValidateInput17:
	MOVLW      _string+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput135
	MOVF       R0+0, 0
	SUBWF      _j+0, 0
L__ValidateInput135:
	BTFSC      STATUS+0, 0
	GOTO       L_ValidateInput18
;MyProject.c,98 :: 		if(isdigit(string[j])&&locker==1){
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput22
	MOVLW      0
	XORWF      _locker+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput136
	MOVLW      1
	XORWF      _locker+0, 0
L__ValidateInput136:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput22
L__ValidateInput119:
;MyProject.c,99 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;MyProject.c,100 :: 		Lcd_Out(1,1,"DEBUG2");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,101 :: 		}else if(isspace(string[j])&&counter==j){
	GOTO       L_ValidateInput23
L_ValidateInput22:
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isspace_character+0
	CALL       _isspace+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput26
	MOVF       _counter+1, 0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput137
	MOVF       _j+0, 0
	XORWF      _counter+0, 0
L__ValidateInput137:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput26
L__ValidateInput118:
;MyProject.c,102 :: 		locker=0;
	CLRF       _locker+0
	CLRF       _locker+1
;MyProject.c,103 :: 		Lcd_Out(1,1,"DEBUG3");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,106 :: 		}else{
	GOTO       L_ValidateInput27
L_ValidateInput26:
;MyProject.c,107 :: 		Lcd_Out(1,1,"DEBUG4");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,108 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,109 :: 		}
L_ValidateInput27:
L_ValidateInput23:
;MyProject.c,110 :: 		if(locker==0){
	MOVLW      0
	XORWF      _locker+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput138
	MOVLW      0
	XORWF      _locker+0, 0
L__ValidateInput138:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput28
;MyProject.c,111 :: 		if(isdigit(string[j])){
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput29
;MyProject.c,112 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,113 :: 		userCode[iterator]=string[j];
	MOVF       _iterator+0, 0
	ADDLW      _userCode+0
	MOVWF      R1+0
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,114 :: 		iterator++;
	INCF       _iterator+0, 1
	BTFSC      STATUS+0, 2
	INCF       _iterator+1, 1
;MyProject.c,116 :: 		} else{
	GOTO       L_ValidateInput30
L_ValidateInput29:
;MyProject.c,117 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,118 :: 		}
L_ValidateInput30:
;MyProject.c,119 :: 		}
L_ValidateInput28:
;MyProject.c,97 :: 		for(j=0;j<strlen(string);j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,122 :: 		}
	GOTO       L_ValidateInput17
L_ValidateInput18:
;MyProject.c,123 :: 		if(atoi(userCode)>1023&&atoi(userCode)!=0){
	MOVLW      _userCode+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVLW      128
	XORLW      3
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput139
	MOVF       R0+0, 0
	SUBLW      255
L__ValidateInput139:
	BTFSC      STATUS+0, 0
	GOTO       L_ValidateInput33
	MOVLW      _userCode+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput140
	MOVLW      0
	XORWF      R0+0, 0
L__ValidateInput140:
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput33
L__ValidateInput117:
;MyProject.c,124 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,125 :: 		}else{
L_ValidateInput33:
;MyProject.c,126 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,127 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,129 :: 		}else{
L_ValidateInput16:
;MyProject.c,130 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,135 :: 		}
L_end_ValidateInput:
	RETURN
; end of _ValidateInput

_WriteInEEPROM:

;MyProject.c,136 :: 		void WriteInEEPROM(){
;MyProject.c,137 :: 		if(AddressVal()!=0){
	CALL       _AddressVal+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM142
	MOVLW      0
	XORWF      R0+0, 0
L__WriteInEEPROM142:
	BTFSC      STATUS+0, 2
	GOTO       L_WriteInEEPROM36
;MyProject.c,138 :: 		addr+=AddressVal();
	CALL       _AddressVal+0
	MOVF       R0+0, 0
	ADDWF      _addr+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _addr+1, 1
;MyProject.c,140 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,141 :: 		if( ValidateInput()!=0){
	CALL       _ValidateInput+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM143
	MOVLW      0
	XORWF      R0+0, 0
L__WriteInEEPROM143:
	BTFSC      STATUS+0, 2
	GOTO       L_WriteInEEPROM37
;MyProject.c,142 :: 		for(j=0; j<=15; j++)
	CLRF       _j+0
	CLRF       _j+1
L_WriteInEEPROM38:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM144
	MOVF       _j+0, 0
	SUBLW      15
L__WriteInEEPROM144:
	BTFSS      STATUS+0, 0
	GOTO       L_WriteInEEPROM39
;MyProject.c,144 :: 		EEPROM_Write(addr + j,string[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,142 :: 		for(j=0; j<=15; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,145 :: 		}
	GOTO       L_WriteInEEPROM38
L_WriteInEEPROM39:
;MyProject.c,146 :: 		numUsers=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,147 :: 		numUsers++;
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,149 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,150 :: 		Lcd_Out(1,1,"OK");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,152 :: 		}else{
	GOTO       L_WriteInEEPROM41
L_WriteInEEPROM37:
;MyProject.c,153 :: 		Lcd_Out(1,1,"EROR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,155 :: 		}
L_WriteInEEPROM41:
;MyProject.c,156 :: 		}
L_WriteInEEPROM36:
;MyProject.c,157 :: 		}
L_end_WriteInEEPROM:
	RETURN
; end of _WriteInEEPROM

_EraseUser:

;MyProject.c,158 :: 		void EraseUser(int address){
;MyProject.c,159 :: 		memset(text,255,sizeof(text));
	MOVLW      _text+0
	MOVWF      FARG_memset_p1+0
	MOVLW      255
	MOVWF      FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,160 :: 		for(j=0; j<=15; j++)
	CLRF       _j+0
	CLRF       _j+1
L_EraseUser42:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EraseUser146
	MOVF       _j+0, 0
	SUBLW      15
L__EraseUser146:
	BTFSS      STATUS+0, 0
	GOTO       L_EraseUser43
;MyProject.c,162 :: 		EEPROM_Write(addr + j,text[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _text+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,160 :: 		for(j=0; j<=15; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,163 :: 		}
	GOTO       L_EraseUser42
L_EraseUser43:
;MyProject.c,164 :: 		numUsers--;
	MOVLW      1
	SUBWF      _numUsers+0, 1
	BTFSS      STATUS+0, 0
	DECF       _numUsers+1, 1
;MyProject.c,165 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _numUsers+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,166 :: 		}
L_end_EraseUser:
	RETURN
; end of _EraseUser

_findUserId:

;MyProject.c,167 :: 		void findUserId(){
;MyProject.c,168 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,169 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,170 :: 		memset(text,0,sizeof(text));
	MOVLW      _text+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,171 :: 		addr=0x10;
	MOVLW      16
	MOVWF      _addr+0
	MOVLW      0
	MOVWF      _addr+1
;MyProject.c,172 :: 		for(i-0;i<10;i++){
L_findUserId45:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__findUserId148
	MOVLW      10
	SUBWF      _i+0, 0
L__findUserId148:
	BTFSC      STATUS+0, 0
	GOTO       L_findUserId46
;MyProject.c,173 :: 		for(j=0;j<=15;j++)
	CLRF       _j+0
	CLRF       _j+1
L_findUserId48:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__findUserId149
	MOVF       _j+0, 0
	SUBLW      15
L__findUserId149:
	BTFSS      STATUS+0, 0
	GOTO       L_findUserId49
;MyProject.c,175 :: 		ch = EEPROM_Read(addr+j);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MyProject.c,176 :: 		text[j]=ch;
	MOVF       _j+0, 0
	ADDLW      _text+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,173 :: 		for(j=0;j<=15;j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,177 :: 		}
	GOTO       L_findUserId48
L_findUserId49:
;MyProject.c,178 :: 		if(strcmp(strstr(string,text),text)==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      _text+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _text+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__findUserId150
	MOVLW      0
	XORWF      R0+0, 0
L__findUserId150:
	BTFSS      STATUS+0, 2
	GOTO       L_findUserId51
;MyProject.c,179 :: 		EraseUser(addr);
	MOVF       _addr+0, 0
	MOVWF      FARG_EraseUser_address+0
	MOVF       _addr+1, 0
	MOVWF      FARG_EraseUser_address+1
	CALL       _EraseUser+0
;MyProject.c,181 :: 		}
L_findUserId51:
;MyProject.c,182 :: 		addr+=16;
	MOVLW      16
	ADDWF      _addr+0, 1
	BTFSC      STATUS+0, 0
	INCF       _addr+1, 1
;MyProject.c,172 :: 		for(i-0;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,183 :: 		}
	GOTO       L_findUserId45
L_findUserId46:
;MyProject.c,186 :: 		}
L_end_findUserId:
	RETURN
; end of _findUserId

_EraseOption:

;MyProject.c,187 :: 		void EraseOption(){
;MyProject.c,188 :: 		if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr12_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EraseOption152
	MOVLW      0
	XORWF      R0+0, 0
L__EraseOption152:
	BTFSS      STATUS+0, 2
	GOTO       L_EraseOption52
;MyProject.c,189 :: 		Lcd_Out(2,1,strstr(string,"ERASE"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr13_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,190 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
L_EraseOption53:
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr14_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr15_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EraseOption153
	MOVLW      0
	XORWF      R0+0, 0
L__EraseOption153:
	BTFSC      STATUS+0, 2
	GOTO       L_EraseOption54
;MyProject.c,191 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,193 :: 		if(strcmp(strstr(string,"START"),"START")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr17_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EraseOption154
	MOVLW      0
	XORWF      R0+0, 0
L__EraseOption154:
	BTFSS      STATUS+0, 2
	GOTO       L_EraseOption55
;MyProject.c,195 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,196 :: 		Lcd_Out(2,1,strstr(string,"START"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr18_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,197 :: 		findUserId();
	CALL       _findUserId+0
;MyProject.c,198 :: 		}
L_EraseOption55:
;MyProject.c,199 :: 		}
	GOTO       L_EraseOption53
L_EraseOption54:
;MyProject.c,200 :: 		}
L_EraseOption52:
;MyProject.c,203 :: 		}
L_end_EraseOption:
	RETURN
; end of _EraseOption

_ADDOption:

;MyProject.c,205 :: 		void ADDOption(){
;MyProject.c,206 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,207 :: 		if(strcmp(strstr(string,"ADD"),"ADD")==0)
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr19_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr20_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ADDOption156
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption156:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption56
;MyProject.c,210 :: 		Lcd_Out(2,1,strstr(string,"ADD"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr21_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,211 :: 		while(strcmp(strstr(string,"START"),"START")!=0)
L_ADDOption57:
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr22_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr23_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ADDOption157
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption157:
	BTFSC      STATUS+0, 2
	GOTO       L_ADDOption58
;MyProject.c,213 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,217 :: 		if(strcmp(strstr(string,"START"),"START")==0)
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr24_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr25_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ADDOption158
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption158:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption59
;MyProject.c,220 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,221 :: 		Lcd_Out(2,1,strstr(string,"START"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr26_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,222 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,223 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,225 :: 		WriteInEEPROM();
	CALL       _WriteInEEPROM+0
;MyProject.c,227 :: 		break;
	GOTO       L_ADDOption58
;MyProject.c,228 :: 		}
L_ADDOption59:
;MyProject.c,232 :: 		}
	GOTO       L_ADDOption57
L_ADDOption58:
;MyProject.c,235 :: 		}
L_ADDOption56:
;MyProject.c,236 :: 		}
L_end_ADDOption:
	RETURN
; end of _ADDOption

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,246 :: 		void interrupt(){
;MyProject.c,247 :: 		if (INTF_bit==1){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt60
;MyProject.c,248 :: 		ifinterupt++;
	INCF       _ifinterupt+0, 1
;MyProject.c,249 :: 		INTF_bit = 0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;MyProject.c,250 :: 		}
L_interrupt60:
;MyProject.c,251 :: 		}
L_end_interrupt:
L__interrupt160:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,253 :: 		void main() {
;MyProject.c,254 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,255 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,256 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,257 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;MyProject.c,258 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;MyProject.c,259 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,260 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main61:
	DECFSZ     R13+0, 1
	GOTO       L_main61
	DECFSZ     R12+0, 1
	GOTO       L_main61
	NOP
	NOP
;MyProject.c,261 :: 		addr=0x00;
	CLRF       _addr+0
	CLRF       _addr+1
;MyProject.c,262 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;MyProject.c,263 :: 		PORTB=0x00;
	CLRF       PORTB+0
;MyProject.c,264 :: 		TRISB=0x01;
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,265 :: 		INTCON=0x90;
	MOVLW      144
	MOVWF      INTCON+0
;MyProject.c,266 :: 		while(1)
L_main62:
;MyProject.c,268 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,269 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,271 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,272 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,273 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main64:
	DECFSZ     R13+0, 1
	GOTO       L_main64
	DECFSZ     R12+0, 1
	GOTO       L_main64
	NOP
	NOP
;MyProject.c,274 :: 		ADDOption();
	CALL       _ADDOption+0
;MyProject.c,275 :: 		EraseOption();
	CALL       _EraseOption+0
;MyProject.c,277 :: 		if(strcmp(strstr(string,"END"),"END")==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr27_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr28_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main162
	MOVLW      0
	XORWF      R0+0, 0
L__main162:
	BTFSS      STATUS+0, 2
	GOTO       L_main65
;MyProject.c,278 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,279 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;MyProject.c,280 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,281 :: 		mutex=0;
	CLRF       _mutex+0
	CLRF       _mutex+1
;MyProject.c,282 :: 		mutex1=0;
	CLRF       _mutex1+0
	CLRF       _mutex1+1
;MyProject.c,283 :: 		while(ifinterupt==0){
L_main66:
	MOVF       _ifinterupt+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main67
;MyProject.c,284 :: 		Lcd_Out(1,1,"v n E s i b r o j");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr29_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,285 :: 		do
L_main68:
;MyProject.c,286 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;MyProject.c,287 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main68
;MyProject.c,288 :: 		switch (kp)
	GOTO       L_main71
;MyProject.c,290 :: 		case 1:  kp = 49; break; // 1
L_main73:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,291 :: 		case 2:  kp = 52; break;//4
L_main74:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,292 :: 		case 3:  kp = 55; break; // 7
L_main75:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,293 :: 		case 4:  kp = 126; break; // ~  null
L_main76:
	MOVLW      126
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,294 :: 		case 5:  kp=50;  break; // 2
L_main77:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,295 :: 		case 6:  kp = 53; break; // 5
L_main78:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,296 :: 		case 7:  kp = 56; break; // 8
L_main79:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,297 :: 		case 8:  kp = 48; break; // 0
L_main80:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,298 :: 		case 9:  kp=51;   break; //3
L_main81:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,299 :: 		case 10: kp = 54; break; // 6
L_main82:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,300 :: 		case 11: kp = 57; break; // 9
L_main83:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,301 :: 		case 12: kp = 36; break; // $ BACK
L_main84:
	MOVLW      36
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,302 :: 		case 13: kp = 37; break; // % ID
L_main85:
	MOVLW      37
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,303 :: 		case 14: kp = 33; break; // ! CODE
L_main86:
	MOVLW      33
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,304 :: 		case 15: kp = 35; break; // # EXIT
L_main87:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,305 :: 		case 16: kp = 42; break; // * ENTER
L_main88:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main72
;MyProject.c,306 :: 		}
L_main71:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main73
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main74
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main75
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main76
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main77
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main78
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main79
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main80
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main81
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main82
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main83
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main84
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main85
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main86
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main87
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main88
L_main72:
;MyProject.c,307 :: 		if(kp!=0&&kp!=42&&kp!=35&&kp!=33&&kp!=37&&kp!=36&&kp!=126){
	MOVF       _kp+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main91
	MOVF       _kp+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L_main91
	MOVF       _kp+0, 0
	XORLW      35
	BTFSC      STATUS+0, 2
	GOTO       L_main91
	MOVF       _kp+0, 0
	XORLW      33
	BTFSC      STATUS+0, 2
	GOTO       L_main91
	MOVF       _kp+0, 0
	XORLW      37
	BTFSC      STATUS+0, 2
	GOTO       L_main91
	MOVF       _kp+0, 0
	XORLW      36
	BTFSC      STATUS+0, 2
	GOTO       L_main91
	MOVF       _kp+0, 0
	XORLW      126
	BTFSC      STATUS+0, 2
	GOTO       L_main91
L__main122:
;MyProject.c,308 :: 		string[j]=kp;
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
;MyProject.c,309 :: 		}
L_main91:
;MyProject.c,310 :: 		if(kp==36){
	MOVF       _kp+0, 0
	XORLW      36
	BTFSS      STATUS+0, 2
	GOTO       L_main92
;MyProject.c,311 :: 		j--;
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;MyProject.c,312 :: 		}
L_main92:
;MyProject.c,313 :: 		if(kp==33){
	MOVF       _kp+0, 0
	XORLW      33
	BTFSS      STATUS+0, 2
	GOTO       L_main93
;MyProject.c,314 :: 		temp_res=ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;MyProject.c,315 :: 		IntToStr(text,temp_res);
	MOVLW      _text+0
	MOVWF      FARG_IntToStr_input+0
	MOVLW      hi_addr(_text+0)
	MOVWF      FARG_IntToStr_input+1
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,316 :: 		mutex=1 ;
	MOVLW      1
	MOVWF      _mutex+0
	MOVLW      0
	MOVWF      _mutex+1
;MyProject.c,318 :: 		}
L_main93:
;MyProject.c,319 :: 		if(kp==37){
	MOVF       _kp+0, 0
	XORLW      37
	BTFSS      STATUS+0, 2
	GOTO       L_main94
;MyProject.c,320 :: 		mutex1=1;
	MOVLW      1
	MOVWF      _mutex1+0
	MOVLW      0
	MOVWF      _mutex1+1
;MyProject.c,321 :: 		}
L_main94:
;MyProject.c,322 :: 		if(kp==42&&mutex==1){
	MOVF       _kp+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main97
	MOVLW      0
	XORWF      _mutex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main163
	MOVLW      1
	XORWF      _mutex+0, 0
L__main163:
	BTFSS      STATUS+0, 2
	GOTO       L_main97
L__main121:
;MyProject.c,323 :: 		if(strcmp(string,text)==0){
	MOVLW      _string+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _text+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main164
	MOVLW      0
	XORWF      R0+0, 0
L__main164:
	BTFSS      STATUS+0, 2
	GOTO       L_main98
;MyProject.c,324 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,325 :: 		Lcd_Out(1,1,"v a l i d n a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr30_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,326 :: 		Lcd_Out(2,1,"a v t o R i z a c i j a");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr31_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,327 :: 		}else{
	GOTO       L_main99
L_main98:
;MyProject.c,328 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,329 :: 		Lcd_Out(1,1,"n e v a l i d n a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr32_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,330 :: 		Lcd_Out(2,1,"a v t o R i z a c i j a");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr33_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,331 :: 		}
L_main99:
;MyProject.c,332 :: 		}
L_main97:
;MyProject.c,333 :: 		if(kp==42&&mutex1==1){
	MOVF       _kp+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main102
	MOVLW      0
	XORWF      _mutex1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main165
	MOVLW      1
	XORWF      _mutex1+0, 0
L__main165:
	BTFSS      STATUS+0, 2
	GOTO       L_main102
L__main120:
;MyProject.c,334 :: 		addr=0x10;
	MOVLW      16
	MOVWF      _addr+0
	MOVLW      0
	MOVWF      _addr+1
;MyProject.c,336 :: 		for(i-0;i<10;i++){
L_main103:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main166
	MOVLW      10
	SUBWF      _i+0, 0
L__main166:
	BTFSC      STATUS+0, 0
	GOTO       L_main104
;MyProject.c,337 :: 		memset(text,0,sizeof(text));
	MOVLW      _text+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,338 :: 		for(counter=0;counter<=15;counter++)
	CLRF       _counter+0
	CLRF       _counter+1
L_main106:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main167
	MOVF       _counter+0, 0
	SUBLW      15
L__main167:
	BTFSS      STATUS+0, 0
	GOTO       L_main107
;MyProject.c,340 :: 		ch = EEPROM_Read(addr+counter);
	MOVF       _counter+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MyProject.c,341 :: 		text[counter]=ch;
	MOVF       _counter+0, 0
	ADDLW      _text+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,338 :: 		for(counter=0;counter<=15;counter++)
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;MyProject.c,342 :: 		}
	GOTO       L_main106
L_main107:
;MyProject.c,343 :: 		if(strcmp(strstr(string,text),string)==0){
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      _text+0
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
	GOTO       L__main168
	MOVLW      0
	XORWF      R0+0, 0
L__main168:
	BTFSS      STATUS+0, 2
	GOTO       L_main109
;MyProject.c,344 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,345 :: 		Lcd_Out(1,1,"V a l i d e n");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr34_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,346 :: 		Lcd_Out(2,1,"k o R i s n i k");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr35_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,348 :: 		}
L_main109:
;MyProject.c,349 :: 		addr+=16;
	MOVLW      16
	ADDWF      _addr+0, 1
	BTFSC      STATUS+0, 0
	INCF       _addr+1, 1
;MyProject.c,336 :: 		for(i-0;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,350 :: 		}
	GOTO       L_main103
L_main104:
;MyProject.c,351 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,352 :: 		Lcd_Out(1,1,"n e V a l i d e n");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr36_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,353 :: 		Lcd_Out(2,1,"k o R i s n i k");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr37_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,354 :: 		}
L_main102:
;MyProject.c,358 :: 		}
	GOTO       L_main66
L_main67:
;MyProject.c,359 :: 		memset(text,255,sizeof(text));
	MOVLW      _text+0
	MOVWF      FARG_memset_p1+0
	MOVLW      255
	MOVWF      FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,360 :: 		addr=0x00;
	CLRF       _addr+0
	CLRF       _addr+1
;MyProject.c,361 :: 		for(i-0;i<10;i++){
L_main110:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main169
	MOVLW      10
	SUBWF      _i+0, 0
L__main169:
	BTFSC      STATUS+0, 0
	GOTO       L_main111
;MyProject.c,362 :: 		for(j=0; j<=15; j++)
	CLRF       _j+0
	CLRF       _j+1
L_main113:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main170
	MOVF       _j+0, 0
	SUBLW      15
L__main170:
	BTFSS      STATUS+0, 0
	GOTO       L_main114
;MyProject.c,364 :: 		EEPROM_Write(addr + j,text[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _text+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,362 :: 		for(j=0; j<=15; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,365 :: 		}
	GOTO       L_main113
L_main114:
;MyProject.c,366 :: 		addr+=16;
	MOVLW      16
	ADDWF      _addr+0, 1
	BTFSC      STATUS+0, 0
	INCF       _addr+1, 1
;MyProject.c,361 :: 		for(i-0;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,367 :: 		}
	GOTO       L_main110
L_main111:
;MyProject.c,368 :: 		}
L_main65:
;MyProject.c,370 :: 		}
	GOTO       L_main62
;MyProject.c,371 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
