
LIST P=16F877A
#INCLUDE <P16F877A.INC>
    R0 EQU H'0020'
    R1 EQU H'0020'
    R2 EQU H'0020'
    ORG 0X00
 
    BANKSEL TRISB
    CLRF TRISB
    BANKSEL PORTB
    CLRF TRISB
 
 BASLA
 
    MOVLW B'00000001'
    MOVWF PORTB
  
    movlw   	.255    	; desimal olarak 255 say?s?n? w registerine yükle
    movwf   	R2    	; w registerindeki say?y? R7 registerine yükle
z0      	movlw   	.255    	; desimal olarak 255 say?s?n? w registerine yükle
    movwf   	R1    	; w registerindeki say?y? R6 registerine yükle
z1      	decfsz  	R1,F  	; R6 nin de?erini bir azalt ve 0 de?ilse 
    goto    	z1      	; Z1 ye git
    decfsz  	R2,F  	; R7 in de?erini bir azalt ve 0 de?ilse
    goto    	z0      	; Z0 e git

    MOVLW B'00000010'
    MOVWF PORTB
    CALL ZAMAN
 
    MOVLW B'00000100'
    MOVWF PORTB
    CALL ZAMAN
 
    MOVLW B'00001000'
    MOVWF PORTB
    CALL ZAMAN
 
    MOVLW B'00010000'
    MOVWF PORTB
    CALL ZAMAN
 
    MOVLW B'00100000'
    MOVWF PORTB
    CALL ZAMAN
 
    MOVLW B'01000000'
    MOVWF PORTB
    CALL ZAMAN
 
    MOVLW B'10000000'
    MOVWF PORTB
    CALL ZAMAN
 

 
    GOTO BASLA
 
; Z1
; MOVLW .255
; MOVWF R1
; D1 DECFSZ R1,F
; GOTO D1
; RETURN
; 
; ZAMAN MOVLW .255
; MOVWF R2
; DECFSZ R2,F
; GOTO Z1
; RETURN
 
; ZAMAN MOVLW .255
; MOVWF R1
; D0 MOVLW .255
; MOVWF R2
 D1 DECFSZ R2,F
; GOTO D1
; DECFSZ R1,F
; GOTO D0
; RETLW 00
 ZAMAN   	movlw   	.255    	; desimal olarak 255 say?s?n? w registerine yükle
    movwf   	R2    	; w registerindeki say?y? R7 registerine yükle
z4      	movlw   	.255    	; desimal olarak 255 say?s?n? w registerine yükle
    movwf   	R1    	; w registerindeki say?y? R6 registerine yükle
z5      	decfsz  	R1,F  	; R6 nin de?erini bir azalt ve 0 de?ilse 
    goto    	z1      	; Z1 ye git
    decfsz  	R2,F  	; R7 in de?erini bir azalt ve 0 de?ilse
    goto    	z0      	; Z0 e git
    RETURN      	; geldi?in yere geri git

    END
 
 
