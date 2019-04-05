list      p=16f877            
	#include <p16f877.inc>        
	__CONFIG 3F71H	
R6      	EQU     	H'0020'     
R7     	EQU     	21H     
	org     	00h     	;Power on güç verildi?inde bu adresten çal??maya ba?lar
        	goto    	START  	
;**********************************************************************************************************************
;	G?R?? ? ÇIKI? AYARI YAPILIYOR
;**********************************************************************************************************************
START  	clrf 	PORTB	; PORTD ç?k??lar? 0  yap?ld? 
        	bsf     	STATUS,RP0   	; bank1? e geçildi
        	movlw   	0x00        	; w registerine 0000-0000 yükle
        	clrf   	TRISB         	; PORTD ç?k?? yap?ld?
	bcf  	STATUS,RP0           	; bank0
j1      	movlw   	0xff          	; w registerine ff yükle (1 1 1 1 1 1 1 1)
        	movwf  	PORTB         	; PORTD' ye ba?l? LED ler yand?
        	call    	zaman         	; zaman program?na ca??r
       	movlw   	0x0           	; w registerine 00 yükle (0 0 0 0 0 0 0 0)
        	movwf   	PORTB         	; PORTD' ye ba?l? LED ler söndü
        	call    	zaman         	; zaman program?n? ça??r
        	goto    	j1            	; j1'e git
;**********************************************************************************************************************
; 	BEKLETME ZAMAN PROGRAMI
;**********************************************************************************************************************
zaman   	movlw   	.255    	; desimal olarak 255 say?s?n? w registerine yükle
        	movwf   	R7    	; w registerindeki say?y? R7 registerine yükle
z0      	movlw   	.255    	; desimal olarak 255 say?s?n? w registerine yükle
        	movwf   	R6    	; w registerindeki say?y? R6 registerine yükle
z1      	decfsz  	R6,F  	; R6 nin de?erini bir azalt ve 0 de?ilse 
        	goto    	z1      	; Z1 ye git
        	decfsz  	R7,F  	; R7 in de?erini bir azalt ve 0 de?ilse
       	goto    	z0      	; Z0 e git
        	retlw   00      	; geldi?in yere geri git

        END			
