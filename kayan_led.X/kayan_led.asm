list p=16f877a
    INCLUDE<P16F877A.INC>
__config h'2f01'
    org 0x00
    goto ANAPROGRAM
    org 0x04
    
    bcf INTCON,INTF
    BANKSEL PORTB
    INCF PORTB,1
    RETFIE
    
    ANAPROGRAM:
    
    BANKSEL PORTB
    CLRF PORTB
/
    BANKSEL TRISB
    MOVLW H'01'
    MOVWF TRISB
    
    MOVLW B'11010000'
    MOVWF INTCON
   ; CLRF TRISB
    
    BANKSEL ADCON1
    MOVLW H'06'
    MOVWF ADCON1
    
    DONGU:
    GOTO DONGU
    END
 
 