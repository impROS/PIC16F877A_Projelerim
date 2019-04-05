list      p=16f877a            
	#include <p16f877a.inc>        
	__CONFIG 3F71H	
R0      	EQU     	H'0021'     
R1      	EQU     	H'0022'     
R2      	EQU     	H'0023'     
R3      	EQU     	H'0024'     
R6     	EQU     	25H
R7      	EQU     	26h  
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
	movlw   	00h          	; w registerine 0f yükle 
j1	movlw	00h		;
	movwf 	R0	;R0' a 00 say?s? yaz?ld? birler hanesi için
	movlw 	00h		;
	movwf 	R1	;R1' e 00 say?s? yaz?ld? onlar hanesi için
	movlw 	0ah		;
	movwf 	R2		;R2' ye 10 say?s? yaz?ld? birler hanesini sorgulamak için
	movlw 	0ah		;
	movwf 	R3		;R3' e 10 say?s? yaz?ld? onlar hanesini sorgulamak için 
j2	swapf 	R1,w	;R1' in alt 4 biti ile üst 4 bitini yer de?i?tir.
	addwf 	R0,w	;R1 ile R0' ? topla sonucu w' e yaz
	movwf 	PORTB	;desimal say?y? PORTB' ye yaz
	call 	zaman	;zaman program?n? ça??r
	incf 	R0,f	;Birler hanesini bir artt?r
	decfsz 	R2,f	;R2' yi bir azalt ve 0' mi diye sor	
	goto 	j2		
	movlw 	00h			
	movwf 	R0	;Say? on ise birler hanesini 0 yap
	movlw 	0ah			
	movwf 	R2		
	incf 	R1,f	;onlar hanesini bir artt?r	
	decfsz 	R3,f		
	goto 	j2		
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

end

