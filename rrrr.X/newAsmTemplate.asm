list      p=16f877            
	#include <p16f877.inc>        
	__CONFIG 3F71H	
R6      	EQU     	H'0020'     
R7     	EQU     	21H     
	org     	00h     	;Power on g�� verildi?inde bu adresten �al??maya ba?lar
        	goto    	START  	
;**********************************************************************************************************************
;	G?R?? ? �IKI? AYARI YAPILIYOR
;**********************************************************************************************************************
START  	clrf 	PORTB	; PORTD �?k??lar? 0  yap?ld? 
        	bsf     	STATUS,RP0   	; bank1? e ge�ildi
        	movlw   	0x00        	; w registerine 0000-0000 y�kle
        	clrf   	TRISB         	; PORTD �?k?? yap?ld?
	bcf  	STATUS,RP0           	; bank0
j1      	movlw   	0xff          	; w registerine ff y�kle (1 1 1 1 1 1 1 1)
        	movwf  	PORTB         	; PORTD' ye ba?l? LED ler yand?
        	call    	zaman         	; zaman program?na ca??r
       	movlw   	0x0           	; w registerine 00 y�kle (0 0 0 0 0 0 0 0)
        	movwf   	PORTB         	; PORTD' ye ba?l? LED ler s�nd�
        	call    	zaman         	; zaman program?n? �a??r
        	goto    	j1            	; j1'e git
;**********************************************************************************************************************
; 	BEKLETME ZAMAN PROGRAMI
;**********************************************************************************************************************
zaman   	movlw   	.255    	; desimal olarak 255 say?s?n? w registerine y�kle
        	movwf   	R7    	; w registerindeki say?y? R7 registerine y�kle
z0      	movlw   	.255    	; desimal olarak 255 say?s?n? w registerine y�kle
        	movwf   	R6    	; w registerindeki say?y? R6 registerine y�kle
z1      	decfsz  	R6,F  	; R6 nin de?erini bir azalt ve 0 de?ilse 
        	goto    	z1      	; Z1 ye git
        	decfsz  	R7,F  	; R7 in de?erini bir azalt ve 0 de?ilse
       	goto    	z0      	; Z0 e git
        	retlw   00      	; geldi?in yere geri git

        END			
