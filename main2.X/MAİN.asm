list      p=16f877            
	#include <p16f877.inc>        
	__CONFIG 3F71H	

R0      	EQU     	H'0020'     
R6     	EQU     	21H
R7      	EQU     	22h     
	org     	00h     	;Power on g�� verildi?inde bu adresten �al??maya ba?lar
        	goto    	START  	
;**********************************************************************************************************************
;	G?R?? ? �IKI? AYARI YAPILIYOR
;**********************************************************************************************************************
START  	clrf 	PORTB	; PORTB �?k??lar? 0  yap?ld? 
        	bsf     	STATUS,RP0   	; bank1? e ge�ildi
        	movlw   	0x00        	; w registerine 0000-0000 y�kle
        	clrf   	TRISB         	; PORTB? nin �?k?? yap?ld?
	bcf  	STATUS,RP0           	; bank0	
	movlw   	01h          	; w registerine 0f y�kle (0 0 0 0  0 0 0 1)
        	movwf 	R0
j1	movfw  	R0
	movwf	PORTB         	; 
	call    	zaman         	; zaman program?na �a??r
       	rlf	R0,f
	btfss	STATUS,0	;carr biti 1 oldu mu ?
	goto    	j1            	; j1'e git
	rlf	R0,f	;
	
	j2	movfw  	R0
	movwf	PORTB         	; 
	call    	zaman         	; zaman program?na �a??r
       	rrf	R0,f
	btfss	STATUS,0	;carr biti 1 oldu mu ?
	goto    	j2            	; j1'e git
	rrf	R0,f	;
	
	
	goto 	j1
	
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
