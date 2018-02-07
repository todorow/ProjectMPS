
_main:

;MyProject.c,41 :: 		void main() {
;MyProject.c,42 :: 		init();
	CALL       _init+0
;MyProject.c,43 :: 		while(1)
L_main0:
;MyProject.c,45 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,46 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,49 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,50 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,51 :: 		ADDOption();
	CALL       _ADDOption+0
;MyProject.c,52 :: 		EraseOption();
	CALL       _EraseOption+0
;MyProject.c,54 :: 		if(strcmp(strstr(string,"END"),"END")==0){
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
	GOTO       L__main93
	MOVLW      0
	XORWF      R0+0, 0
L__main93:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;MyProject.c,55 :: 		Lcd_Out(2,1,strstr(string,"END"));
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
;MyProject.c,57 :: 		}
L_main3:
;MyProject.c,58 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,59 :: 		}
	GOTO       L_main0
;MyProject.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ValidateInput:

;MyProject.c,63 :: 		int ValidateInput(){
;MyProject.c,64 :: 		if(strcmp(strstr(string," ")," ")==0)
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
	GOTO       L__ValidateInput95
	MOVLW      0
	XORWF      R0+0, 0
L__ValidateInput95:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput4
;MyProject.c,68 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,69 :: 		iterator=0;
	CLRF       _iterator+0
	CLRF       _iterator+1
;MyProject.c,70 :: 		locker=1;
	MOVLW      1
	MOVWF      _locker+0
	MOVLW      0
	MOVWF      _locker+1
;MyProject.c,71 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,72 :: 		for(j=0;j<strlen(string);j++){
	CLRF       _j+0
	CLRF       _j+1
L_ValidateInput5:
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
	GOTO       L__ValidateInput96
	MOVF       R0+0, 0
	SUBWF      _j+0, 0
L__ValidateInput96:
	BTFSC      STATUS+0, 0
	GOTO       L_ValidateInput6
;MyProject.c,73 :: 		if(isdigit(string[j])&&locker==1){
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput10
	MOVLW      0
	XORWF      _locker+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput97
	MOVLW      1
	XORWF      _locker+0, 0
L__ValidateInput97:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput10
L__ValidateInput90:
;MyProject.c,74 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;MyProject.c,75 :: 		Lcd_Out(1,1,"DEBUG2");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,76 :: 		}else if(isspace(string[j])&&counter==j){
	GOTO       L_ValidateInput11
L_ValidateInput10:
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isspace_character+0
	CALL       _isspace+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput14
	MOVF       _counter+1, 0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput98
	MOVF       _j+0, 0
	XORWF      _counter+0, 0
L__ValidateInput98:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput14
L__ValidateInput89:
;MyProject.c,77 :: 		locker=0;
	CLRF       _locker+0
	CLRF       _locker+1
;MyProject.c,78 :: 		Lcd_Out(1,1,"DEBUG3");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,81 :: 		}else{
	GOTO       L_ValidateInput15
L_ValidateInput14:
;MyProject.c,82 :: 		Lcd_Out(1,1,"DEBUG4");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,83 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,84 :: 		}
L_ValidateInput15:
L_ValidateInput11:
;MyProject.c,85 :: 		if(locker==0){
	MOVLW      0
	XORWF      _locker+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput99
	MOVLW      0
	XORWF      _locker+0, 0
L__ValidateInput99:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput16
;MyProject.c,86 :: 		if(isdigit(string[j])){
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput17
;MyProject.c,87 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,88 :: 		userCode[iterator]=string[j];
	MOVF       _iterator+0, 0
	ADDWF      _userCode+0, 0
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
;MyProject.c,89 :: 		iterator++;
	INCF       _iterator+0, 1
	BTFSC      STATUS+0, 2
	INCF       _iterator+1, 1
;MyProject.c,91 :: 		} else{
	GOTO       L_ValidateInput18
L_ValidateInput17:
;MyProject.c,92 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,93 :: 		}
L_ValidateInput18:
;MyProject.c,94 :: 		}
L_ValidateInput16:
;MyProject.c,72 :: 		for(j=0;j<strlen(string);j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,97 :: 		}
	GOTO       L_ValidateInput5
L_ValidateInput6:
;MyProject.c,98 :: 		if(atoi(userCode)>1023&&atoi(userCode)!=0){
	MOVF       _userCode+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVLW      128
	XORLW      3
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput100
	MOVF       R0+0, 0
	SUBLW      255
L__ValidateInput100:
	BTFSC      STATUS+0, 0
	GOTO       L_ValidateInput21
	MOVF       _userCode+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput101
	MOVLW      0
	XORWF      R0+0, 0
L__ValidateInput101:
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput21
L__ValidateInput88:
;MyProject.c,99 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,100 :: 		}else{
L_ValidateInput21:
;MyProject.c,101 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,102 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,104 :: 		}else{
L_ValidateInput4:
;MyProject.c,105 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,110 :: 		}
L_end_ValidateInput:
	RETURN
; end of _ValidateInput

_init:

;MyProject.c,111 :: 		void init(){
;MyProject.c,112 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,113 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,114 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,115 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;MyProject.c,116 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;MyProject.c,117 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,118 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_init24:
	DECFSZ     R13+0, 1
	GOTO       L_init24
	DECFSZ     R12+0, 1
	GOTO       L_init24
	NOP
	NOP
;MyProject.c,119 :: 		addr=0x00;
	CLRF       _addr+0
	CLRF       _addr+1
;MyProject.c,120 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;MyProject.c,121 :: 		}
L_end_init:
	RETURN
; end of _init

_ADDOption:

;MyProject.c,122 :: 		void ADDOption(){
;MyProject.c,123 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,124 :: 		if(strcmp(strstr(string,"ADD"),"ADD")==0)
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
	GOTO       L__ADDOption104
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption104:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption25
;MyProject.c,127 :: 		Lcd_Out(2,1,strstr(string,"ADD"));
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
;MyProject.c,128 :: 		while(strcmp(strstr(string,"START"),"START")!=0)
L_ADDOption26:
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
	GOTO       L__ADDOption105
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption105:
	BTFSC      STATUS+0, 2
	GOTO       L_ADDOption27
;MyProject.c,130 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,134 :: 		if(strcmp(strstr(string,"START"),"START")==0)
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
	GOTO       L__ADDOption106
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption106:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption28
;MyProject.c,137 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,138 :: 		Lcd_Out(2,1,strstr(string,"START"));
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
;MyProject.c,139 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,140 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,142 :: 		WriteInEEPROM();
	CALL       _WriteInEEPROM+0
;MyProject.c,144 :: 		break;
	GOTO       L_ADDOption27
;MyProject.c,145 :: 		}
L_ADDOption28:
;MyProject.c,149 :: 		}
	GOTO       L_ADDOption26
L_ADDOption27:
;MyProject.c,152 :: 		}
L_ADDOption25:
;MyProject.c,153 :: 		}
L_end_ADDOption:
	RETURN
; end of _ADDOption

_WriteInEEPROM:

;MyProject.c,154 :: 		void WriteInEEPROM(){
;MyProject.c,155 :: 		if(AddressVal()!=0){
	CALL       _AddressVal+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM108
	MOVLW      0
	XORWF      R0+0, 0
L__WriteInEEPROM108:
	BTFSC      STATUS+0, 2
	GOTO       L_WriteInEEPROM29
;MyProject.c,156 :: 		addr+=AddressVal();
	CALL       _AddressVal+0
	MOVF       R0+0, 0
	ADDWF      _addr+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _addr+1, 1
;MyProject.c,158 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,159 :: 		if( ValidateInput()!=0){
	CALL       _ValidateInput+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM109
	MOVLW      0
	XORWF      R0+0, 0
L__WriteInEEPROM109:
	BTFSC      STATUS+0, 2
	GOTO       L_WriteInEEPROM30
;MyProject.c,160 :: 		for(j=0; j<=15; j++)
	CLRF       _j+0
	CLRF       _j+1
L_WriteInEEPROM31:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM110
	MOVF       _j+0, 0
	SUBLW      15
L__WriteInEEPROM110:
	BTFSS      STATUS+0, 0
	GOTO       L_WriteInEEPROM32
;MyProject.c,162 :: 		EEPROM_Write(addr + j,string[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,160 :: 		for(j=0; j<=15; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,163 :: 		}
	GOTO       L_WriteInEEPROM31
L_WriteInEEPROM32:
;MyProject.c,164 :: 		numUsers=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,165 :: 		numUsers++;
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,167 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,168 :: 		Lcd_Out(1,1,"OK");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,170 :: 		}else{
	GOTO       L_WriteInEEPROM34
L_WriteInEEPROM30:
;MyProject.c,171 :: 		Lcd_Out(1,1,"EROR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,173 :: 		}
L_WriteInEEPROM34:
;MyProject.c,174 :: 		}
L_WriteInEEPROM29:
;MyProject.c,175 :: 		}
L_end_WriteInEEPROM:
	RETURN
; end of _WriteInEEPROM

_NumOfUsers:

;MyProject.c,176 :: 		int NumOfUsers(){
;MyProject.c,177 :: 		ch = EEPROM_Read(0x10);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MyProject.c,178 :: 		return atoi(ch);
	MOVF       R0+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
;MyProject.c,180 :: 		}
L_end_NumOfUsers:
	RETURN
; end of _NumOfUsers

_CheckEEPROM:

;MyProject.c,181 :: 		int CheckEEPROM(){
;MyProject.c,182 :: 		users=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _users+0
;MyProject.c,183 :: 		if(users!=255){
	MOVF       R0+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_CheckEEPROM35
;MyProject.c,184 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_CheckEEPROM
;MyProject.c,186 :: 		}else{
L_CheckEEPROM35:
;MyProject.c,187 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,190 :: 		}
L_end_CheckEEPROM:
	RETURN
; end of _CheckEEPROM

_NextUserNum:

;MyProject.c,191 :: 		int NextUserNum(){
;MyProject.c,192 :: 		if(CheckEEPROM()){
	CALL       _CheckEEPROM+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_NextUserNum37
;MyProject.c,193 :: 		return NumOfUsers()*16;
	CALL       _NumOfUsers+0
	MOVLW      4
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__NextUserNum114:
	BTFSC      STATUS+0, 2
	GOTO       L__NextUserNum115
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__NextUserNum114
L__NextUserNum115:
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	GOTO       L_end_NextUserNum
;MyProject.c,194 :: 		}else{
L_NextUserNum37:
;MyProject.c,195 :: 		return 16;
	MOVLW      16
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,197 :: 		}
L_end_NextUserNum:
	RETURN
; end of _NextUserNum

_ValidateUserNum:

;MyProject.c,198 :: 		int ValidateUserNum( int num)  {
;MyProject.c,199 :: 		if(num>=160){
	MOVLW      128
	XORWF      FARG_ValidateUserNum_num+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateUserNum117
	MOVLW      160
	SUBWF      FARG_ValidateUserNum_num+0, 0
L__ValidateUserNum117:
	BTFSS      STATUS+0, 0
	GOTO       L_ValidateUserNum39
;MyProject.c,200 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateUserNum
;MyProject.c,201 :: 		}else{
L_ValidateUserNum39:
;MyProject.c,202 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,204 :: 		}
L_end_ValidateUserNum:
	RETURN
; end of _ValidateUserNum

_AddressVal:

;MyProject.c,205 :: 		int AddressVal(){
;MyProject.c,206 :: 		if(ValidateUserNum(NextUserNum())){
	CALL       _NextUserNum+0
	MOVF       R0+0, 0
	MOVWF      FARG_ValidateUserNum_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_ValidateUserNum_num+1
	CALL       _ValidateUserNum+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_AddressVal41
;MyProject.c,207 :: 		return NextUserNum()+16;
	CALL       _NextUserNum+0
	MOVLW      16
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	GOTO       L_end_AddressVal
;MyProject.c,208 :: 		}else{
L_AddressVal41:
;MyProject.c,209 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,211 :: 		}
L_end_AddressVal:
	RETURN
; end of _AddressVal

_ReadFromUART:

;MyProject.c,212 :: 		void ReadFromUART(){
;MyProject.c,213 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,214 :: 		while(1)         {
L_ReadFromUART43:
;MyProject.c,215 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_ReadFromUART45:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART45
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART45
	NOP
;MyProject.c,216 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART46
;MyProject.c,218 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,219 :: 		string[i]=uart_rd;
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,220 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,221 :: 		}
L_ReadFromUART46:
;MyProject.c,222 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_ReadFromUART47:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART47
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART47
	NOP
;MyProject.c,223 :: 		if (!UART1_Data_Ready()&&i!=0)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_ReadFromUART50
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadFromUART120
	MOVLW      0
	XORWF      _i+0, 0
L__ReadFromUART120:
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART50
L__ReadFromUART91:
;MyProject.c,226 :: 		break;
	GOTO       L_ReadFromUART44
;MyProject.c,229 :: 		}
L_ReadFromUART50:
;MyProject.c,230 :: 		}
	GOTO       L_ReadFromUART43
L_ReadFromUART44:
;MyProject.c,231 :: 		}
L_end_ReadFromUART:
	RETURN
; end of _ReadFromUART

_findUserId:

;MyProject.c,232 :: 		void findUserId(){
;MyProject.c,233 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,234 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,235 :: 		memset(text,0,sizeof(text));
	MOVLW      _text+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,236 :: 		addr=0x10;
	MOVLW      16
	MOVWF      _addr+0
	MOVLW      0
	MOVWF      _addr+1
;MyProject.c,237 :: 		for(i-0;i<10;i++){
L_findUserId51:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__findUserId122
	MOVLW      10
	SUBWF      _i+0, 0
L__findUserId122:
	BTFSC      STATUS+0, 0
	GOTO       L_findUserId52
;MyProject.c,238 :: 		for(j=0;j<=15;j++)
	CLRF       _j+0
	CLRF       _j+1
L_findUserId54:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__findUserId123
	MOVF       _j+0, 0
	SUBLW      15
L__findUserId123:
	BTFSS      STATUS+0, 0
	GOTO       L_findUserId55
;MyProject.c,240 :: 		ch = EEPROM_Read(addr+j);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MyProject.c,241 :: 		text[j]=ch;
	MOVF       _j+0, 0
	ADDLW      _text+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,238 :: 		for(j=0;j<=15;j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,242 :: 		}
	GOTO       L_findUserId54
L_findUserId55:
;MyProject.c,243 :: 		if(strcmp(strstr(string,text),text)==0){
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
	GOTO       L__findUserId124
	MOVLW      0
	XORWF      R0+0, 0
L__findUserId124:
	BTFSS      STATUS+0, 2
	GOTO       L_findUserId57
;MyProject.c,244 :: 		EraseUser(addr);
	MOVF       _addr+0, 0
	MOVWF      FARG_EraseUser_address+0
	MOVF       _addr+1, 0
	MOVWF      FARG_EraseUser_address+1
	CALL       _EraseUser+0
;MyProject.c,246 :: 		}
L_findUserId57:
;MyProject.c,247 :: 		addr+=16;
	MOVLW      16
	ADDWF      _addr+0, 1
	BTFSC      STATUS+0, 0
	INCF       _addr+1, 1
;MyProject.c,237 :: 		for(i-0;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,248 :: 		}
	GOTO       L_findUserId51
L_findUserId52:
;MyProject.c,251 :: 		}
L_end_findUserId:
	RETURN
; end of _findUserId

_EraseUser:

;MyProject.c,252 :: 		void EraseUser(int address){
;MyProject.c,253 :: 		memset(text,255,sizeof(text));
	MOVLW      _text+0
	MOVWF      FARG_memset_p1+0
	MOVLW      255
	MOVWF      FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,254 :: 		for(j=0; j<=15; j++)
	CLRF       _j+0
	CLRF       _j+1
L_EraseUser58:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EraseUser126
	MOVF       _j+0, 0
	SUBLW      15
L__EraseUser126:
	BTFSS      STATUS+0, 0
	GOTO       L_EraseUser59
;MyProject.c,256 :: 		EEPROM_Write(addr + j,text[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _text+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,254 :: 		for(j=0; j<=15; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,257 :: 		}
	GOTO       L_EraseUser58
L_EraseUser59:
;MyProject.c,258 :: 		numUsers--;
	MOVLW      1
	SUBWF      _numUsers+0, 1
	BTFSS      STATUS+0, 0
	DECF       _numUsers+1, 1
;MyProject.c,259 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _numUsers+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,260 :: 		}
L_end_EraseUser:
	RETURN
; end of _EraseUser

_EraseOption:

;MyProject.c,261 :: 		void EraseOption(){
;MyProject.c,262 :: 		if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
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
	GOTO       L__EraseOption128
	MOVLW      0
	XORWF      R0+0, 0
L__EraseOption128:
	BTFSS      STATUS+0, 2
	GOTO       L_EraseOption61
;MyProject.c,263 :: 		Lcd_Out(2,1,strstr(string,"ERASE"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr24_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,264 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
L_EraseOption62:
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr25_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr26_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EraseOption129
	MOVLW      0
	XORWF      R0+0, 0
L__EraseOption129:
	BTFSC      STATUS+0, 2
	GOTO       L_EraseOption63
;MyProject.c,265 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,267 :: 		if(strcmp(strstr(string,"START"),"START")==0){
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
	GOTO       L__EraseOption130
	MOVLW      0
	XORWF      R0+0, 0
L__EraseOption130:
	BTFSS      STATUS+0, 2
	GOTO       L_EraseOption64
;MyProject.c,269 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,270 :: 		Lcd_Out(2,1,strstr(string,"START"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr29_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,271 :: 		findUserId();
	CALL       _findUserId+0
;MyProject.c,272 :: 		}
L_EraseOption64:
;MyProject.c,273 :: 		}
	GOTO       L_EraseOption62
L_EraseOption63:
;MyProject.c,274 :: 		}
L_EraseOption61:
;MyProject.c,277 :: 		}
L_end_EraseOption:
	RETURN
; end of _EraseOption

_keyPadOn:

;MyProject.c,278 :: 		void keyPadOn(){
;MyProject.c,279 :: 		while(1){
L_keyPadOn65:
;MyProject.c,280 :: 		do
L_keyPadOn67:
;MyProject.c,281 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;MyProject.c,282 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn67
;MyProject.c,283 :: 		switch (kp)
	GOTO       L_keyPadOn70
;MyProject.c,285 :: 		case 1:  kp = 49; break; // 1
L_keyPadOn72:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,286 :: 		case 2:  kp = 52; break;//4
L_keyPadOn73:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,287 :: 		case 3:  kp = 55; break; // 7
L_keyPadOn74:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,288 :: 		case 4:  kp = 126; break; // ~  null
L_keyPadOn75:
	MOVLW      126
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,289 :: 		case 5:  kp=50;  break; // 2
L_keyPadOn76:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,290 :: 		case 6:  kp = 53; break; // 5
L_keyPadOn77:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,291 :: 		case 7:  kp = 56; break; // 8
L_keyPadOn78:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,292 :: 		case 8:  kp = 48; break; // 0
L_keyPadOn79:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,293 :: 		case 9:  kp=51;   break; //3
L_keyPadOn80:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,294 :: 		case 10: kp = 54; break; // 6
L_keyPadOn81:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,295 :: 		case 11: kp = 57; break; // 9
L_keyPadOn82:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,296 :: 		case 12: kp = 36; break; // $ BACK
L_keyPadOn83:
	MOVLW      36
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,297 :: 		case 13: kp = 37; break; // % ID
L_keyPadOn84:
	MOVLW      37
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,298 :: 		case 14: kp = 33; break; // ! CODE
L_keyPadOn85:
	MOVLW      33
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,299 :: 		case 15: kp = 35; break; // # EXIT
L_keyPadOn86:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,300 :: 		case 16: kp = 42; break; // * ENTER
L_keyPadOn87:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_keyPadOn71
;MyProject.c,301 :: 		}
L_keyPadOn70:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn72
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn73
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn74
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn75
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn76
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn77
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn78
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn79
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn80
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn81
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn82
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn83
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn84
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn85
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn86
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadOn87
L_keyPadOn71:
;MyProject.c,304 :: 		}
	GOTO       L_keyPadOn65
;MyProject.c,305 :: 		}
L_end_keyPadOn:
	RETURN
; end of _keyPadOn
