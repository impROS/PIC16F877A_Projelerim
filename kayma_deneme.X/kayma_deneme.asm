LIST P=16F877A
    INCLUDE<P16F877A.INC>
    SAY EQU 0X20
    SAY2 EQU 0X21
    ORG 0X00
 
    BANKSEL TRISB
    CLRF TRISB
    
    BANKSEL PORTB
    CLRF PORTB
    
    MOVLW .8
    MOVWF SAY2
    
    MOVLW .1
    MOVFW SAY
    
D1: #DEFINE KONTROL_LED PORTB,SAY
    BTFSC KONTROL_LED
    GOTO SIFIRLA
    BSF KONTROL_LED
    GOTO DEVAM
SIFIRLA:
    BCF KONTROL_LED
    GOTO DEVAM
    
DEVAM:
    INCF SAY,F
    DECFSZ SAY2
    GOTO D1
    GOTO SAY_SIFIRLA
    
SAY_SIFIRLA:
    MOVLW .8
    MOVFW SAY2
    MOVLW 0
    MOVFW SAY
    GOTO D1
    
    END


