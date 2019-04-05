list      p=16f877            
	#include <p16f877.inc>        
	
    __CONFIG 3f71h
R0      EQU     H'0020'     	
R1      EQU     H'0021'     	
R2      EQU     H'0022'     
R3      EQU     H'0023'
R4      EQU     H'0024'
R5      EQU     H'0025'
R6      EQU     H'0026'
R7      EQU     H'0027'
    org     	00h             	; Power on güç verildi?inde bu adresten çal??maya ba?lar
    goto    	START   	; 0000
START  bsf	STATUS,RP0	; page0
    movlw   0h              	; w registerine 0000-0000 yükle
    movwf   TRISB           	;PORTB nin durum registerine yükle(00 yani PORTB ç?k?s olsun)
    bcf     	STATUS,RP0    ; Page0 
    bcf 	STATUS,0	; carry biti 0 yap?ld?
    
j2:	movlw 	00h
    movwf 	R0		; data table adresi olarak 0 yaz?ld?
    movlw 	.16
    movwf 	R1		; toplam data uzunlu?u 16 byte
j1	movfw 	R0		; R0' data blok adresini w' e yaz
    call 	liste		; listeye git
    movwf 	PORTB		; data blok listesinden ald???n de?eri PORTB' ye yaz
    call 	zaman		; zaman program?n? ça??r
	incf 	R0,1		; datablok adresini bir artt?r
    decfsz 	R1,1		; R1' in de?erini bir azalt ve 0' m? diye sor
    goto 	j1
    goto 	j2
liste  	addwf 	PCL,1		;data blokta okuma yaparken data blok adresin W içinde olmas?
				;ve adresin okuma esnas?nda PCL ile toplanmas? sonucunda data 
				;bloktan okunan de?er w' e yaz?l?r ve geldi?i yere döner
;	    0	1    2      3      4     5       6      7   
    dt 3FH,06H,5BH,4FH,66H,6DH,7DH,07H
;                8     9      A     B      C     D     E      F
    dt 7FH,6FH,77H,7CH,39H,5EH,79H,71H
    
    
zaman  movlw   .250    ; desimal olarak 250 say?s?n? w registerine yükle
    movwf   R7    	; w registerindeki say?y? R7 registerine yükle
Z0     	 movlw  .250    ; desimal olarak 250 say?s?n? w registerine yükle
    movwf   R6    	; w registerindeki say?y? R6 registerine yükle
Z1      	decfsz  	R6,F  	; R6 nin de?erini bir azalt ve 0 de?ilse 
    goto    	Z1      ; z1 ye git
    decfsz  R7,F  	; R7 in de?erini bir azalt ve 0 de?ilse
    goto    	Z0      ; z0 e git
    retlw   	00      ; geldi?in yere geri git
    END
