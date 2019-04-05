
#include <16f877a.h>
#fuses XT,NOWDT,NOPROTECT,NOBROWNOUT,NOLVP,NOPUT,NOWRT,NODEBUG,NOCPD
#use delay(clock=4000000) // 4MHz kristal

// Kolaylik saglamasi acisindan bacaklara bagli butonlar tanitiliyor.
#define B_ileri pin_e0 
#define B_geri pin_e1 
#define B_dur pin_e2

int i = 0, hiz = 250;

// Yarim adim atmasini istedigimiz icin adimlar sirasiyla diziye tanimlaniyor.
const int y_adim_bin[] = {0b0000001, 0b00000011, 0b00000010, 0b00000110, 0b00000100, 0b00001100, 0b00001000, 0b00001001};

void main() {
    setup_psp(PSP_DISABLED);
    setup_spi(SPI_SS_DISABLED);
    setup_timer_1(T1_DISABLED);
    setup_timer_2(T2_DISABLED, 0, 1);
    setup_adc_ports(NO_ANALOGS);
    setup_adc(ADC_OFF);
    setup_CCP1(CCP_OFF);
    setup_CCP2(CCP_OFF);

    output_b(0x00);

    while (1) {
        if (input(B_ileri)) // Eger ileri butonuna basildiysa
        {
            delay_ms(20); // buton arki onleme gecikmesi
            while (!(input(B_dur))) // (Dur butonuna basilmadigi surece) isleyecek dongu
            {
                if (i == 8)
                    i = 0;
                output_b(y_adim_bin[i]);
                delay_ms(hiz); // step motorun adimlarini gorebilmek icin
                i++;
            }
            //        output_b(0x00); // Dur butonuna basildiginda donguden cikip ilk pozisyonunu almasini
            // istersek bu satiri eklememiz gerekir.
        }

        if (input(B_geri)) // Eger geri butonuna basildiysa
        {
            delay_ms(20);
            while (!(input(B_dur))) // (Dur butonuna basilmadigi surece) isleyecek dongu
            {
                if (i == 0)
                    i = 8;
                i--;
                output_b(y_adim_bin[i]);
                delay_ms(hiz);
            }
            //         output_b(0x00);    // Baslangic pozisyonunu almasini isteseydik yazardik.
            // Biz dur diyerek oldugu halde kalmasini istedik.
        }
    }
}

