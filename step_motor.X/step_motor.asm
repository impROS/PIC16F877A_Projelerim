	list      p=16f877A            
	#include <p16f877A.inc>        
    __CONFIG 3F71H	
R6      	EQU     	H'0020'     
R7     	EQU     	21H     
    org     	00h     	;Power on güç verildi?inde bu adresten çal??maya ba?lar
    goto    	START  	
;**********************************************************************************************************************
;	G?R?? ? ÇIKI? AYARI YAPILIYOR
;**********************************************************************************************************************
START  	clrf 	PORTB	
    bsf     	STATUS,RP0   	
    movlw   	0x00        
    clrf   	TRISB         
    bcf  	STATUS,RP0           	
j1      	movlw   	B'00000001'          
    movwf  	PORTB         
    call    	zaman       
    movlw   	B'00000011'         
    movwf   	PORTB         
    call    	zaman         
    movlw   	B'00000010'          
    movwf   	PORTB         
    call    	zaman       
    movlw   	B'00000110'          
    movwf   	PORTB         
    call    	zaman     
    movlw   	B'00000110'          
    movwf   	PORTB         
    call    	zaman   
    movlw   	B'00001100'          
    movwf   	PORTB         
    call    	zaman   
    movlw   	B'00001000'          
    movwf   	PORTB         
    call    	zaman   
    movlw   	B'00001001'          
    movwf   	PORTB         
    call    	zaman   
    goto    	j1            	
;**********************************************************************************************************************
; 	BEKLETME ZAMAN PROGRAMI
;**********************************************************************************************************************
zaman   	movlw   	.50    	; desimal olarak 255 say?s?n? w registerine yükle
    movwf   	R7    	; w registerindeki say?y? R7 registerine yükle
z0      	movlw   	.50    	; desimal olarak 255 say?s?n? w registerine yükle
    movwf   	R6    	; w registerindeki say?y? R6 registerine yükle
z1      	decfsz  	R6,F  	; R6 nin de?erini bir azalt ve 0 de?ilse 
    goto    	z1      	; Z1 ye git
    decfsz  	R7,F  	; R7 in de?erini bir azalt ve 0 de?ilse
    goto    	z0      	; Z0 e git
    retlw   00      	; geldi?in yere geri git

    END
