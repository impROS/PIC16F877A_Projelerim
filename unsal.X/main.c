
#include <stdio.h>
#include <stdlib.h>
#define _XTAL_FREQ 4000000
#include <xc.h>
// BEGIN CONFIG
#pragma config FOSC = HS // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF // Watchdog Timer Enable bit (WDT enabled)
#pragma config PWRTE = OFF // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = ON // Brown-out Reset Enable bit (BOR enabled)
#pragma config LVP = OFF // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF // Flash Program Memory Code Protection bit (Code protection off)

#define ds PORTCbits.RC0
#define st PORTCbits.RC1
#define sh PORTCbits.RC2
unsigned char khung_du_lieu[32];
unsigned char socot,sohang,tocdo,maled;
unsigned char g,h,a;




void main(void)
{
  TRISD = 0X00;
  TRISC = 0X00;
  PORTD=0xff;
  PORTC=0x00;
  while(1)
   {
 
   }
}






