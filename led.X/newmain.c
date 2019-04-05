/* 
 * File:   newmain.c
 * Author: impROS
 *
 * Created on 20 Ocak 2017 Cuma, 20:14
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int buton;
int main(int argc, char** argv) {
set_tris_a(0x1);  //bu sat?rda sadece a0 baca??n?n input, di?er a bacaklar?n?n ise output oldu?u gösterilmi?tir.
set_tris_b(0x00);  //b portu komple output olarak atand?.
   WHILE(1)   //sonsuz döngü
   {
      buton = input(pin_a0);  // butondaki veri okundu. Buton de?i?keni, butona bas?lm??sa 1 bas?lmam??sa 0 yani DO?ru ya da yanl??
      // de?eri alacak.
               //buton ark? önleme gecikmesi. (Bir sonraki yaz?da hakk?nda bilgi bulabilirsiniz.)
     if (buton)
      {
         output_high(pin_b7);
      }

      else
      {
         output_low(pin_b7);
      }
   }
    return (EXIT_SUCCESS);
}

