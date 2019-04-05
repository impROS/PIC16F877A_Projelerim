list p= 16F877A
#include <P16F877A.inc>
__config h'2F01'
      SAY1 EQU 0X021
    SAY2 EQU 0X022
org 0x00
    goto anaprogram
org 0x04

    bcf INTCON,INTF
banksel PORTD
    MOVLW .1
    MOVWF PORTD
    rlf PORTD,1
    CALL DELAY
    GOTO $-2
retfie

anaprogram:

banksel PORTD
    clrf PORTD
    clrf PORTB
    movlw h'01'
    movwf PORTD
banksel TRISB
    movlw h'01'
    movwf TRISB

    movlw b'11010000'
    movwf INTCON
    clrf TRISD

banksel ADCON1
    movlw h'06'
    movwf ADCON1

dongu:
    goto dongu
    
       ;ZAMANLAYICI
DELAY:
    MOVLW .255
    MOVWF SAY1
    
    MOVLW .255
    MOVFW SAY2
    
    DECFSZ SAY2
    GOTO $-1
    DECFSZ SAY1
    GOTO $-5
    RETURN
    END   

end
