
_main:

;MyProject.c,25 :: 		void main() {
;MyProject.c,26 :: 		init();
	CALL       _init+0
;MyProject.c,27 :: 		while(1)
L_main0:
;MyProject.c,29 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,30 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,33 :: 		Lcd_Out(1,1,string);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,34 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,35 :: 		ADDOption();
	CALL       _ADDOption+0
;MyProject.c,36 :: 		if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
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
	GOTO       L__main60
	MOVLW      0
	XORWF      R0+0, 0
L__main60:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;MyProject.c,37 :: 		Lcd_Out(2,1,strstr(string,"ERASE"));
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
;MyProject.c,38 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
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
	GOTO       L__main61
	MOVLW      0
	XORWF      R0+0, 0
L__main61:
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;MyProject.c,39 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,41 :: 		if(strcmp(strstr(string,"START"),"START")==0){
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
	GOTO       L__main62
	MOVLW      0
	XORWF      R0+0, 0
L__main62:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,44 :: 		Lcd_Out(2,1,strstr(string,"START"));
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
;MyProject.c,45 :: 		}
L_main6:
;MyProject.c,46 :: 		}
	GOTO       L_main4
L_main5:
;MyProject.c,47 :: 		}
L_main3:
;MyProject.c,48 :: 		if(strcmp(strstr(string,"END"),"END")==0){
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
	GOTO       L__main63
	MOVLW      0
	XORWF      R0+0, 0
L__main63:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;MyProject.c,49 :: 		Lcd_Out(2,1,strstr(string,"END"));
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
;MyProject.c,51 :: 		}
L_main7:
;MyProject.c,52 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,53 :: 		}
	GOTO       L_main0
;MyProject.c,56 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ValidateInput:

;MyProject.c,57 :: 		int ValidateInput()
;MyProject.c,59 :: 		if(strcmp(strstr(string," ")," ")==0)
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
	GOTO       L__ValidateInput65
	MOVLW      0
	XORWF      R0+0, 0
L__ValidateInput65:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput8
;MyProject.c,63 :: 		int counter=0;
	CLRF       ValidateInput_counter_L1+0
	CLRF       ValidateInput_counter_L1+1
	CLRF       ValidateInput_iterator_L1+0
	CLRF       ValidateInput_iterator_L1+1
	MOVLW      1
	MOVWF      ValidateInput_locker_L1+0
	MOVLW      0
	MOVWF      ValidateInput_locker_L1+1
;MyProject.c,66 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,67 :: 		for(j=0;j<strlen(string);j++){
	CLRF       _j+0
	CLRF       _j+1
L_ValidateInput9:
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
	GOTO       L__ValidateInput66
	MOVF       R0+0, 0
	SUBWF      _j+0, 0
L__ValidateInput66:
	BTFSC      STATUS+0, 0
	GOTO       L_ValidateInput10
;MyProject.c,68 :: 		if(isdigit(string[j])&&locker==1){
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput14
	MOVLW      0
	XORWF      ValidateInput_locker_L1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput67
	MOVLW      1
	XORWF      ValidateInput_locker_L1+0, 0
L__ValidateInput67:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput14
L__ValidateInput57:
;MyProject.c,69 :: 		counter++;
	INCF       ValidateInput_counter_L1+0, 1
	BTFSC      STATUS+0, 2
	INCF       ValidateInput_counter_L1+1, 1
;MyProject.c,70 :: 		Lcd_Out(1,1,"DEBUG2");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,71 :: 		}else if(isspace(string[j])&&counter==j){
	GOTO       L_ValidateInput15
L_ValidateInput14:
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isspace_character+0
	CALL       _isspace+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput18
	MOVF       ValidateInput_counter_L1+1, 0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput68
	MOVF       _j+0, 0
	XORWF      ValidateInput_counter_L1+0, 0
L__ValidateInput68:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput18
L__ValidateInput56:
;MyProject.c,72 :: 		locker=0;
	CLRF       ValidateInput_locker_L1+0
	CLRF       ValidateInput_locker_L1+1
;MyProject.c,73 :: 		Lcd_Out(1,1,"DEBUG3");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,76 :: 		}else{
	GOTO       L_ValidateInput19
L_ValidateInput18:
;MyProject.c,77 :: 		Lcd_Out(1,1,"DEBUG4");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,78 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,79 :: 		}
L_ValidateInput19:
L_ValidateInput15:
;MyProject.c,80 :: 		if(locker==0){
	MOVLW      0
	XORWF      ValidateInput_locker_L1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput69
	MOVLW      0
	XORWF      ValidateInput_locker_L1+0, 0
L__ValidateInput69:
	BTFSS      STATUS+0, 2
	GOTO       L_ValidateInput20
;MyProject.c,81 :: 		if(isdigit(string[j])){
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput21
;MyProject.c,82 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,83 :: 		userCode[iterator]=string[j];
	MOVF       ValidateInput_iterator_L1+0, 0
	ADDWF      ValidateInput_userCode_L1+0, 0
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
;MyProject.c,84 :: 		iterator++;
	INCF       ValidateInput_iterator_L1+0, 1
	BTFSC      STATUS+0, 2
	INCF       ValidateInput_iterator_L1+1, 1
;MyProject.c,86 :: 		} else{
	GOTO       L_ValidateInput22
L_ValidateInput21:
;MyProject.c,87 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,88 :: 		}
L_ValidateInput22:
;MyProject.c,89 :: 		}
L_ValidateInput20:
;MyProject.c,67 :: 		for(j=0;j<strlen(string);j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,92 :: 		}
	GOTO       L_ValidateInput9
L_ValidateInput10:
;MyProject.c,93 :: 		if(atoi(userCode)>1023&&atoi(userCode)!=0){
	MOVF       ValidateInput_userCode_L1+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVLW      128
	XORLW      3
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput70
	MOVF       R0+0, 0
	SUBLW      255
L__ValidateInput70:
	BTFSC      STATUS+0, 0
	GOTO       L_ValidateInput25
	MOVF       ValidateInput_userCode_L1+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateInput71
	MOVLW      0
	XORWF      R0+0, 0
L__ValidateInput71:
	BTFSC      STATUS+0, 2
	GOTO       L_ValidateInput25
L__ValidateInput55:
;MyProject.c,94 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,95 :: 		}else{
L_ValidateInput25:
;MyProject.c,96 :: 		Lcd_Out(1,1,"DEBUG");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,97 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_ValidateInput
;MyProject.c,99 :: 		}else{
L_ValidateInput8:
;MyProject.c,100 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,105 :: 		}
L_end_ValidateInput:
	RETURN
; end of _ValidateInput

_init:

;MyProject.c,106 :: 		void init(){
;MyProject.c,107 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,108 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,109 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,110 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;MyProject.c,111 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;MyProject.c,112 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,113 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_init28:
	DECFSZ     R13+0, 1
	GOTO       L_init28
	DECFSZ     R12+0, 1
	GOTO       L_init28
	NOP
	NOP
;MyProject.c,114 :: 		addr=0x00;
	CLRF       _addr+0
	CLRF       _addr+1
;MyProject.c,115 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;MyProject.c,116 :: 		}
L_end_init:
	RETURN
; end of _init

_ADDOption:

;MyProject.c,117 :: 		void ADDOption(){
;MyProject.c,118 :: 		if(strcmp(strstr(string,"ADD"),"ADD")==0)
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
	GOTO       L__ADDOption74
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption74:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption29
;MyProject.c,120 :: 		Lcd_Out(2,1,strstr(string,"ADD"));
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
;MyProject.c,121 :: 		while(strcmp(strstr(string,"START"),"START")!=0)
L_ADDOption30:
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr23_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr24_MyProject+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ADDOption75
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption75:
	BTFSC      STATUS+0, 2
	GOTO       L_ADDOption31
;MyProject.c,123 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,127 :: 		if(strcmp(strstr(string,"START"),"START")==0)
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
	GOTO       L__ADDOption76
	MOVLW      0
	XORWF      R0+0, 0
L__ADDOption76:
	BTFSS      STATUS+0, 2
	GOTO       L_ADDOption32
;MyProject.c,130 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,131 :: 		Lcd_Out(2,1,strstr(string,"START"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr27_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,132 :: 		memset(string,0,sizeof(string));
	MOVLW      _string+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      16
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;MyProject.c,133 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,135 :: 		WriteInEEPROM();
	CALL       _WriteInEEPROM+0
;MyProject.c,137 :: 		break;
	GOTO       L_ADDOption31
;MyProject.c,138 :: 		}
L_ADDOption32:
;MyProject.c,142 :: 		}
	GOTO       L_ADDOption30
L_ADDOption31:
;MyProject.c,145 :: 		}
L_ADDOption29:
;MyProject.c,146 :: 		}
L_end_ADDOption:
	RETURN
; end of _ADDOption

_WriteInEEPROM:

;MyProject.c,147 :: 		void WriteInEEPROM(){
;MyProject.c,148 :: 		if(AddressVal()!=0){
	CALL       _AddressVal+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM78
	MOVLW      0
	XORWF      R0+0, 0
L__WriteInEEPROM78:
	BTFSC      STATUS+0, 2
	GOTO       L_WriteInEEPROM33
;MyProject.c,149 :: 		addr+=AddressVal();
	CALL       _AddressVal+0
	MOVF       R0+0, 0
	ADDWF      _addr+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _addr+1, 1
;MyProject.c,151 :: 		ReadFromUART();
	CALL       _ReadFromUART+0
;MyProject.c,152 :: 		if( ValidateInput()!=0){
	CALL       _ValidateInput+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM79
	MOVLW      0
	XORWF      R0+0, 0
L__WriteInEEPROM79:
	BTFSC      STATUS+0, 2
	GOTO       L_WriteInEEPROM34
;MyProject.c,153 :: 		for(j=0; j<=15; j++)
	CLRF       _j+0
	CLRF       _j+1
L_WriteInEEPROM35:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WriteInEEPROM80
	MOVF       _j+0, 0
	SUBLW      15
L__WriteInEEPROM80:
	BTFSS      STATUS+0, 0
	GOTO       L_WriteInEEPROM36
;MyProject.c,155 :: 		EEPROM_Write(addr + j,string[j]);
	MOVF       _j+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _j+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,153 :: 		for(j=0; j<=15; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,156 :: 		}
	GOTO       L_WriteInEEPROM35
L_WriteInEEPROM36:
;MyProject.c,157 :: 		numUsers=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,158 :: 		numUsers++;
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _numUsers+0
	MOVF       R0+1, 0
	MOVWF      _numUsers+1
;MyProject.c,160 :: 		EEPROM_Write(0x00,numUsers);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,161 :: 		Lcd_Out(1,1,"OK");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr28_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,163 :: 		}else{
	GOTO       L_WriteInEEPROM38
L_WriteInEEPROM34:
;MyProject.c,164 :: 		Lcd_Out(1,1,"EROR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr29_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,166 :: 		}
L_WriteInEEPROM38:
;MyProject.c,167 :: 		}
L_WriteInEEPROM33:
;MyProject.c,168 :: 		}
L_end_WriteInEEPROM:
	RETURN
; end of _WriteInEEPROM

_NumOfUsers:

;MyProject.c,169 :: 		int NumOfUsers(){
;MyProject.c,170 :: 		ch = EEPROM_Read(0x10);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MyProject.c,171 :: 		return atoi(ch);
	MOVF       R0+0, 0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
;MyProject.c,173 :: 		}
L_end_NumOfUsers:
	RETURN
; end of _NumOfUsers

_CheckEEPROM:

;MyProject.c,174 :: 		int CheckEEPROM(){
;MyProject.c,175 :: 		users=NumOfUsers();
	CALL       _NumOfUsers+0
	MOVF       R0+0, 0
	MOVWF      _users+0
;MyProject.c,176 :: 		if(users!=255){
	MOVF       R0+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_CheckEEPROM39
;MyProject.c,177 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_CheckEEPROM
;MyProject.c,179 :: 		}else{
L_CheckEEPROM39:
;MyProject.c,180 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,183 :: 		}
L_end_CheckEEPROM:
	RETURN
; end of _CheckEEPROM

_NextUserNum:

;MyProject.c,184 :: 		int NextUserNum(){
;MyProject.c,185 :: 		if(CheckEEPROM()){
	CALL       _CheckEEPROM+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_NextUserNum41
;MyProject.c,186 :: 		return NumOfUsers()*16;
	CALL       _NumOfUsers+0
	MOVLW      4
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__NextUserNum84:
	BTFSC      STATUS+0, 2
	GOTO       L__NextUserNum85
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__NextUserNum84
L__NextUserNum85:
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	GOTO       L_end_NextUserNum
;MyProject.c,187 :: 		}else{
L_NextUserNum41:
;MyProject.c,188 :: 		return 16;
	MOVLW      16
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,190 :: 		}
L_end_NextUserNum:
	RETURN
; end of _NextUserNum

_ValidateUserNum:

;MyProject.c,192 :: 		int ValidateUserNum( int num)  {
;MyProject.c,193 :: 		if(num>=160){
	MOVLW      128
	XORWF      FARG_ValidateUserNum_num+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ValidateUserNum87
	MOVLW      160
	SUBWF      FARG_ValidateUserNum_num+0, 0
L__ValidateUserNum87:
	BTFSS      STATUS+0, 0
	GOTO       L_ValidateUserNum43
;MyProject.c,194 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_ValidateUserNum
;MyProject.c,195 :: 		}else{
L_ValidateUserNum43:
;MyProject.c,196 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,198 :: 		}
L_end_ValidateUserNum:
	RETURN
; end of _ValidateUserNum

_AddressVal:

;MyProject.c,199 :: 		int AddressVal(){
;MyProject.c,200 :: 		if(ValidateUserNum(NextUserNum())){
	CALL       _NextUserNum+0
	MOVF       R0+0, 0
	MOVWF      FARG_ValidateUserNum_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_ValidateUserNum_num+1
	CALL       _ValidateUserNum+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_AddressVal45
;MyProject.c,201 :: 		return NextUserNum()+16;
	CALL       _NextUserNum+0
	MOVLW      16
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	GOTO       L_end_AddressVal
;MyProject.c,202 :: 		}else{
L_AddressVal45:
;MyProject.c,203 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,205 :: 		}
L_end_AddressVal:
	RETURN
; end of _AddressVal

_ReadFromUART:

;MyProject.c,206 :: 		void ReadFromUART(){
;MyProject.c,207 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,208 :: 		while(1)         {
L_ReadFromUART47:
;MyProject.c,209 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_ReadFromUART49:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART49
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART49
	NOP
;MyProject.c,210 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART50
;MyProject.c,212 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,213 :: 		string[i]=uart_rd;
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,214 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,215 :: 		}
L_ReadFromUART50:
;MyProject.c,216 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ReadFromUART51:
	DECFSZ     R13+0, 1
	GOTO       L_ReadFromUART51
	DECFSZ     R12+0, 1
	GOTO       L_ReadFromUART51
	NOP
	NOP
;MyProject.c,217 :: 		if (!UART1_Data_Ready()&&i!=0)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_ReadFromUART54
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadFromUART90
	MOVLW      0
	XORWF      _i+0, 0
L__ReadFromUART90:
	BTFSC      STATUS+0, 2
	GOTO       L_ReadFromUART54
L__ReadFromUART58:
;MyProject.c,220 :: 		break;
	GOTO       L_ReadFromUART48
;MyProject.c,223 :: 		}
L_ReadFromUART54:
;MyProject.c,224 :: 		}
	GOTO       L_ReadFromUART47
L_ReadFromUART48:
;MyProject.c,225 :: 		}
L_end_ReadFromUART:
	RETURN
; end of _ReadFromUART
