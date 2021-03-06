LIST P=16F877A
    INCLUDE<P16F877A.INC>
    SAY1 EQU 0X20
    SAY2 EQU 0X21
 DCounter1 EQU 0X0C
DCounter2 EQU 0X0D
DCounter3 EQU 0X0E

    #DEFINE LED PORTB,0
    ORG 0X00
    
    BANKSEL TRISB 
    CLRF TRISB
    
    BANKSEL PORTB
    CLRF PORTB
    ;;YONTEM 1
    
;D1:
;    BCF LED
;    CALL ZAMANLAYICI
;    BSF LED
;    CALL ZAMANLAYICI
;    GOTO D1
    
    
    ;YONTEM2
D2:
    BTFSC LED
    GOTO SON
    GOTO YAK
D3:
    CALL     DELAY
   
    GOTO D2
    
    
YAK:
    BSF LED
    GOTO D3
    
SON:
    BCF LED
    GOTO D3
ZAMANLAYICI:
    MOVLW .255
    MOVWF SAY1
    
Z0:MOVLW .255
    MOVWF SAY2
Z1: DECFSZ SAY2
    GOTO Z1
    DECFSZ SAY1
    GOTO Z0
    RETURN
    
    
; Delay = 5 seconds
; Clock frequency = 4 MHz

; Actual delay = 5 seconds = 5000000 cycles
; Error = 0 %
DELAY
MOVLW 0X83
MOVWF DCounter1
MOVLW 0Xec
MOVWF DCounter2
MOVLW 0Xcb
MOVWF DCounter3
LOOP
DECFSZ DCounter1, 1
GOTO LOOP
DECFSZ DCounter2, 1
GOTO LOOP
DECFSZ DCounter3, 1
GOTO LOOP
RETURN

    END
    


