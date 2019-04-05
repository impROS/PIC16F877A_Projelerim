LIST P=16F877A
    #INCLUDE <P16F877A.INC>
    
    SAY1 EQU H'0020'
    R0 EQU H'0021'
    R1 EQU H'0022'
 
    ORG 0X00;

    BANKSEL TRISB
    CLRF TRISB
    
    BANKSEL PORTB
    CLRF PORTB
    
     MOVLW B'11111111'
     MOVWF SAY1
    
     
    BASLA
  DECF SAY1,F
  MOVF SAY1,W
    MOVWF PORTB
    CALL BEKLE
      GOTO BASLA
    ;;;;;;;;;;;;;;;;;;;;;;;;
   BEKLE MOVLW .255
   MOVWF R0
   
   D1 MOVLW .255
   MOVWF R1
   
   D2 DECFSZ R1,F
   GOTO D2
   
   DECFSZ R0,F
   GOTO  D1
   RETURN
   ;;;;;;;;;;;;;;;;;;;;;;;
  
    END