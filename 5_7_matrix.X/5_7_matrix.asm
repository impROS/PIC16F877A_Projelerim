list p=16f877a
    include<p16f877a.inc>
        
    SAYAC1 equ 0x020
    SAYAC2 equ 0x021
    SAYAC3 equ 0x022
    org 0x00
_main:

;LED_Matrix.c,55 :: 		void main() {
;LED_Matrix.c,56 :: 		TRISB = 0b00000000; // Set PORTB direction to be output
    CLRF        TRISB+0 
;LED_Matrix.c,57 :: 		TRISA = 0x00; // Set PORTA direction to be output
    CLRF        TRISA+0 
;LED_Matrix.c,58 :: 		PORTB = 0x00; // Turn OFF LEDs on PORTB
    CLRF        PORTB+0 
;LED_Matrix.c,59 :: 		CMCON = 7 ; // Disable comparators
    MOVLW       7
    MOVWF       CMCON+0 
;LED_Matrix.c,60 :: 		ADCON1 = 0x0F;  // Disable Analog functions
    MOVLW       15
    MOVWF       ADCON1+0 
;LED_Matrix.c,61 :: 		do{
L_main0:
;LED_Matrix.c,63 :: 		for (num=0; num<26; num++) {
    CLRF        _num+0 
L_main3:
    MOVLW       26
    SUBWF       _num+0, 0 
    BTFSC       STATUS+0, 0 
    GOTO        L_main4
;LED_Matrix.c,65 :: 		for (repeat=0; repeat<100; repeat++){
    CLRF        _repeat+0 
L_main6:
    MOVLW       100
    SUBWF       _repeat+0, 0 
    BTFSC       STATUS+0, 0 
    GOTO        L_main7
;LED_Matrix.c,66 :: 		column = 1;
    MOVLW       1
    MOVWF       _column+0 
;LED_Matrix.c,67 :: 		for(count = num*5;count < (num*5+6);count++){
    MOVLW       5
	MULWF       _num+0 
    MOVF        PRODL+0, 0 
    MOVWF       _count+0 
L_main9:
    MOVLW       5
	MULWF       _num+0 
    MOVF        PRODL+0, 0 
    MOVWF       R0 
    MOVF        PRODH+0, 0 
    MOVWF       R1 
    MOVLW       6
    ADDWF       R0, 0 
    MOVWF       R2 
    MOVLW       0
    ADDWFC      R1, 0 
    MOVWF       R3 
    MOVLW       128
    MOVWF       R0 
    MOVLW       128
    XORWF       R3, 0 
    SUBWF       R0, 0 
    BTFSS       STATUS+0, 2 
    GOTO        L__main23
    MOVF        R2, 0 
    SUBWF       _count+0, 0 
L__main23:
    BTFSC       STATUS+0, 0 
    GOTO        L_main10
;LED_Matrix.c,68 :: 		PORTB = Alphabets[count];
    MOVLW       _Alphabets+0
    MOVWF       FSR0L 
    MOVLW       hi_addr(_Alphabets+0)
    MOVWF       FSR0H 
    MOVF        _count+0, 0 
    ADDWF       FSR0L, 1 
    BTFSC       STATUS+0, 0 
    INCF        FSR0H, 1 
    MOVF        POSTINC0+0, 0 
    MOVWF       PORTB+0 
;LED_Matrix.c,69 :: 		PORTA = column;
    MOVF        _column+0, 0 
    MOVWF       PORTA+0 
;LED_Matrix.c,70 :: 		Delay_ms(1);
    MOVLW       16
    MOVWF       R12, 0
    MOVLW       148
    MOVWF       R13, 0
L_main12:
    DECFSZ      R13, 1, 1
    BRA         L_main12
    DECFSZ      R12, 1, 1
    BRA         L_main12
    NOP
;LED_Matrix.c,71 :: 		column = column<<1;
	RLCF        _column+0, 1 
    BCF         _column+0, 0 
;LED_Matrix.c,67 :: 		for(count = num*5;count < (num*5+6);count++){
    INCF        _count+0, 1 
;LED_Matrix.c,72 :: 		}
    GOTO        L_main9
L_main10:
;LED_Matrix.c,65 :: 		for (repeat=0; repeat<100; repeat++){
    INCF        _repeat+0, 1 
;LED_Matrix.c,73 :: 		}
    GOTO        L_main6
L_main7:
;LED_Matrix.c,63 :: 		for (num=0; num<26; num++) {
    INCF        _num+0, 1 
;LED_Matrix.c,74 :: 		}
    GOTO        L_main3
L_main4:
;LED_Matrix.c,77 :: 		for (num=0; num<6; num++) {
    CLRF        _num+0 
L_main13:
    MOVLW       6
    SUBWF       _num+0, 0 
    BTFSC       STATUS+0, 0 
    GOTO        L_main14
;LED_Matrix.c,79 :: 		for (repeat=0; repeat<100; repeat++){
    CLRF        _repeat+0 
L_main16:
    MOVLW       100
    SUBWF       _repeat+0, 0 
    BTFSC       STATUS+0, 0 
    GOTO        L_main17
;LED_Matrix.c,80 :: 		column = 1;
    MOVLW       1
    MOVWF       _column+0 
;LED_Matrix.c,81 :: 		for(count = num*5;count < (num*5+6);count++){
    MOVLW       5
	MULWF       _num+0 
    MOVF        PRODL+0, 0 
    MOVWF       _count+0 
L_main19:
    MOVLW       5
	MULWF       _num+0 
    MOVF        PRODL+0, 0 
    MOVWF       R0 
    MOVF        PRODH+0, 0 
    MOVWF       R1 
    MOVLW       6
    ADDWF       R0, 0 
    MOVWF       R2 
    MOVLW       0
    ADDWFC      R1, 0 
    MOVWF       R3 
    MOVLW       128
    MOVWF       R0 
    MOVLW       128
    XORWF       R3, 0 
    SUBWF       R0, 0 
    BTFSS       STATUS+0, 2 
    GOTO        L__main24
    MOVF        R2, 0 
    SUBWF       _count+0, 0 
L__main24:
    BTFSC       STATUS+0, 0 
    GOTO        L_main20
;LED_Matrix.c,82 :: 		PORTB = characters[count];
    MOVLW       _characters+0
    ADDWF       _count+0, 0 
    MOVWF       TBLPTRL 
    MOVLW       hi_addr(_characters+0)
    MOVWF       TBLPTRH 
    MOVLW       0
    ADDWFC      TBLPTRH, 1 
    MOVLW       higher_addr(_characters+0)
    MOVWF       TBLPTRU 
    MOVLW       0
    ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTB+0
;LED_Matrix.c,83 :: 		PORTA = column;
    MOVF        _column+0, 0 
    MOVWF       PORTA+0 
;LED_Matrix.c,84 :: 		Delay_ms(1);
    MOVLW       16
    MOVWF       R12, 0
    MOVLW       148
    MOVWF       R13, 0
L_main22:
    DECFSZ      R13, 1, 1
    BRA         L_main22
    DECFSZ      R12, 1, 1
    BRA         L_main22
    NOP
;LED_Matrix.c,85 :: 		column = column<<1;
	RLCF        _column+0, 1 
    BCF         _column+0, 0 
;LED_Matrix.c,81 :: 		for(count = num*5;count < (num*5+6);count++){
    INCF        _count+0, 1 
;LED_Matrix.c,86 :: 		}
    GOTO        L_main19
L_main20:
;LED_Matrix.c,79 :: 		for (repeat=0; repeat<100; repeat++){
    INCF        _repeat+0, 1 
;LED_Matrix.c,87 :: 		}
    GOTO        L_main16
L_main17:
;LED_Matrix.c,77 :: 		for (num=0; num<6; num++) {
    INCF        _num+0, 1 
;LED_Matrix.c,88 :: 		}
    GOTO        L_main13
L_main14:
;LED_Matrix.c,90 :: 		} while(1);
    GOTO        L_main0
;LED_Matrix.c,92 :: 		}
    GOTO        $+0
; end of _main
