LIST P=16F877A
    INCLUDE<P16F877A.INC>
    
    SAY_O EQU H'020'
    SAY_1 EQU H'021'
    SAY_2 EQU H'022'
    SAY_S EQU H'023'
 
    ORG 0x00
    
    BANKSEL TRISB
    CLRF TRISB
   
    BANKSEL PORTB
    CLRF PORTB
   
    
    E_0
    MOVLW .4
    MOVWF SAY_O
    
    MOVLW B'00000001'
    MOVWF SAY_S
    
    E_1  
    MOVFW SAY_S
    MOVWF PORTB
    CALL BEKLE
    RLF SAY_S,F
    DECFSZ SAY_O
    GOTO E_1
    GOTO E_0
   ;;;;;;;;;;;;;;;
   BEKLE
    MOVLW .255
    MOVWF SAY_1
    
    D0 
    MOVLW .255
    MOVWF SAY_2
    
   D1 
    DECFSZ SAY_2
    GOTO D1
    DECFSZ SAY_1
    GOTO D0
    RETURN
    
    END
    
    


