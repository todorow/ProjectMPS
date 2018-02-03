
_main:

;MyProject.c,19 :: 		void main() {
;MyProject.c,23 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,24 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,25 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,26 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,27 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;MyProject.c,28 :: 		while(1)
L_main1:
;MyProject.c,30 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,31 :: 		while(1)         {
L_main3:
;MyProject.c,32 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;MyProject.c,33 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
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
L_main6:
;MyProject.c,39 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;MyProject.c,40 :: 		if (!UART1_Data_Ready()&&i!=0)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      0
	XORWF      _i+0, 0
L__main37:
	BTFSC      STATUS+0, 2
	GOTO       L_main10
L__main35:
;MyProject.c,43 :: 		break;
	GOTO       L_main4
;MyProject.c,46 :: 		}
L_main10:
;MyProject.c,47 :: 		}
	GOTO       L_main3
L_main4:
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
;MyProject.c,51 :: 		if(strcmp(strstr(string,"ADD"),"ADD")==0){
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
	GOTO       L__main38
	MOVLW      0
	XORWF      R0+0, 0
L__main38:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;MyProject.c,52 :: 		Lcd_Out(2,1,strstr(string,"ADD"));
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
;MyProject.c,53 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
L_main12:
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
	GOTO       L__main39
	MOVLW      0
	XORWF      R0+0, 0
L__main39:
	BTFSC      STATUS+0, 2
	GOTO       L_main13
;MyProject.c,54 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,55 :: 		while(1)         {
L_main14:
;MyProject.c,56 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
	NOP
;MyProject.c,57 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
;MyProject.c,59 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,60 :: 		string[i]=uart_rd;
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,61 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,62 :: 		}
L_main17:
;MyProject.c,63 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
	NOP
;MyProject.c,64 :: 		if (!UART1_Data_Ready()&&i!=0)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main21
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      0
	XORWF      _i+0, 0
L__main40:
	BTFSC      STATUS+0, 2
	GOTO       L_main21
L__main34:
;MyProject.c,67 :: 		break;
	GOTO       L_main15
;MyProject.c,70 :: 		}
L_main21:
;MyProject.c,71 :: 		}
	GOTO       L_main14
L_main15:
;MyProject.c,72 :: 		if(strcmp(strstr(string,"START"),"START")==0){
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
	GOTO       L__main41
	MOVLW      0
	XORWF      R0+0, 0
L__main41:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;MyProject.c,74 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,75 :: 		Lcd_Out(2,1,strstr(string,"START"));
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
;MyProject.c,76 :: 		} }
L_main22:
	GOTO       L_main12
L_main13:
;MyProject.c,77 :: 		}
L_main11:
;MyProject.c,78 :: 		if(strcmp(strstr(string,"ERASE"),"ERASE")==0){
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
	GOTO       L__main42
	MOVLW      0
	XORWF      R0+0, 0
L__main42:
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;MyProject.c,79 :: 		Lcd_Out(2,1,strstr(string,"ERASE"));
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
;MyProject.c,80 :: 		while(strcmp(strstr(string,"START"),"START")!=0){
L_main24:
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
	GOTO       L__main43
	MOVLW      0
	XORWF      R0+0, 0
L__main43:
	BTFSC      STATUS+0, 2
	GOTO       L_main25
;MyProject.c,81 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,82 :: 		while(1)         {
L_main26:
;MyProject.c,83 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	NOP
	NOP
;MyProject.c,84 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main29
;MyProject.c,86 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,87 :: 		string[i]=uart_rd;
	MOVF       _i+0, 0
	ADDLW      _string+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,88 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,89 :: 		}
L_main29:
;MyProject.c,90 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	NOP
	NOP
;MyProject.c,91 :: 		if (!UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;MyProject.c,94 :: 		break;
	GOTO       L_main27
;MyProject.c,97 :: 		}
L_main31:
;MyProject.c,98 :: 		}
	GOTO       L_main26
L_main27:
;MyProject.c,99 :: 		if(strcmp(strstr(string,"START"),"START")==0){
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
	GOTO       L__main44
	MOVLW      0
	XORWF      R0+0, 0
L__main44:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;MyProject.c,101 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,102 :: 		Lcd_Out(2,1,strstr(string,"START"));
	MOVLW      _string+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject.c,103 :: 		}
L_main32:
;MyProject.c,104 :: 		}
	GOTO       L_main24
L_main25:
;MyProject.c,105 :: 		}
L_main23:
;MyProject.c,106 :: 		if(strcmp(strstr(string,"END"),"END")==0){
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
	GOTO       L__main45
	MOVLW      0
	XORWF      R0+0, 0
L__main45:
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;MyProject.c,107 :: 		Lcd_Out(2,1,strstr(string,"END"));
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
;MyProject.c,109 :: 		}
L_main33:
;MyProject.c,110 :: 		strcpy(string,"");
	MOVLW      _string+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr20_MyProject+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;MyProject.c,111 :: 		}
	GOTO       L_main1
;MyProject.c,114 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
