list p=16f877a
    include<p16f877a.inc>
    
    SAYAC1 equ 0x020
    SAYAC2 equ 0x021
    SAYAC3 equ 0x022
    org 0x00
    banksel TRISB
    CLRF TRISB
    BANKSEL PORTB
    CLRF  PORTB
    
BASLA:
    MOVLW .8
    MOVWF PORTB
    CALL DELAY
    MOVLW .0
    MOVWF PORTB
    
    CALL DELAY   
    GOTO BASLA
DELAY        
    MOVLW  D'2'    
    MOVWF  SAYAC1    
DON1        
    MOVLW  D'200'    
    MOVWF  SAYAC2    
DON2        
    MOVLW  D'250'    
    MOVWF  SAYAC3    
DON3        
 
    DECFSZ  SAYAC3,F    
    GOTO  DON3    
    DECFSZ  SAYAC2,F    
    GOTO  DON2    
    DECFSZ  SAYAC1,F    
    GOTO  DON1    
    RETURN       
    END

