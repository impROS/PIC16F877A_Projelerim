list      p=16f877            
	#include <p16f877.inc>        
	__CONFIG 3F71H	

R0      	EQU     	H'0020'     
R6     	EQU     	21H
R7      	EQU     	22h     
	org     	00h     	;Power on güç verildi?inde bu adresten çal??maya ba?lar
        	goto    	START  	
;**********************************************************************************************************************
;	G?R?? ? ÇIKI? AYARI YAPILIYOR
;**********************************************************************************************************************
START  	clrf 	PORTB	; PORTB ç?k??lar? 0  yap?ld? 
        	bsf     	STATUS,RP0   	; bank1? e geçildi
        	movlw   	0x00        	; w registerine 0000-0000 yükle
        	clrf   	TRISB         	; PORTB? nin ç?k?? yap?ld?
	bcf  	STATUS,RP0           	; bank0	
	movlw   	01h          	; w registerine 0f yükle (0 0 0 0  0 0 0 1)
        	movwf 	R0
j1	movfw  	R0
	movwf	PORTB         	; 
	call    	zaman         	; zaman program?na ça??r
       	rlf	R0,f
	btfss	STATUS,0	;carr biti 1 oldu mu ?
	goto    	j1            	; j1'e git
	rlf	R0,f	;
	
	j2	movfw  	R0
	movwf	PORTB         	; 
	call    	zaman         	; zaman program?na ça??r
       	rrf	R0,f
	btfss	STATUS,0	;carr biti 1 oldu mu ?
	goto    	j2            	; j1'e git
	rrf	R0,f	;
	
	
	goto 	j1
	
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
