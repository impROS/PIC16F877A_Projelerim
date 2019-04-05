

list p=16f877a
								include<p16f877a.inc>


PC equ h'02'					;	The program counter will be refered to as PC - The program counter is
								;	a little counter within the microcontroller to let itself know what line number
								;	it is upto when running a program. We can make the microcontroller jump to a certain
								;	line number by changing the value stored in PC. (we will do this in a later tutorial)

    cblock h'20'				;	Within this cblock and endc, we can define our variables. More info on this, later.
	delay_1						;	These next two lines will set aside 1byte of ram for delay_1 and 1byte for delay_2
	delay_2						;	what we will do with these variables is load them with a number each so that we can
    endc						;	count down from that number to zero. when we reach zero, we continue with the program!
						;	more info on these two variables can be found in the delay routine.



    org h'0000'					;	This line just tells the microcontroller what address to start running our program from.
								;	It will always be 0000 hex for all the tutorials.


    movlw h'07'					;	This will turn the comparators OFF.	
    movwf CMCON 				;	(we just want to use the ports as digital ports)


    bsf STATUS, RP0 			;	select bank 1 (to enable us to change the Input / Output status of our ports)
    movlw b'00000000' 			;	set PORTB all outputs (A '0' means output, A '1' means input. We can set each
    movwf TRISB					;	We can set each bit individualy. Each port having 8-bits or 8 pins.
    movlw b'00100000' 			;	set PORTA all outputs except for bit 5. Bit 5 is an input ONLY pin.
    movwf TRISA 				;	It cannot be set to an output!
    bcf STATUS, RP0 			;	select bank 0




setup							;	I always have a title labeled 'setup' this is where we set everything up
    clrf PORTB					;	ensure all LED's are off initially by sending 0's to the anodes
								;	i.e. our variables and flags etc.. so they are ready for the main program


begin							;	This is where our main program starts.
    movlw b'00000000'			;	we want to start off at the very right hand side of the cathode columns, so we
    movwf PORTA					;	send 000 to PORTA (remember we are concerned with PORTA 0, 1 and 2)
    movlw b'00111100'			;	Now that we have our column activated, we send out a byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    movlw b'00000001'			;	activate the next column of cathodes in sequence by incrementing the data
    movwf PORTA					;	on PORTA (which connects to the 7442)
    movlw b'01000010'			;	Now that we have our next column activated, we send out the next byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    movlw b'00000010'			;	activate the next column of cathodes in sequence by incrementing the data
    movwf PORTA					;	on PORTA (which connects to the 7442)
    movlw b'10101001'			;	Now that we have our next column activated, we send out the next byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    movlw b'00000011'			;	activate the next column of cathodes in sequence by incrementing the data
    movwf PORTA					;	on PORTA (which connects to the 7442)
    movlw b'10000101'			;	Now that we have our next column activated, we send out the next byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    movlw b'00000100'			;	activate the next column of cathodes in sequence by incrementing the data
    movwf PORTA					;	on PORTA (which connects to the 7442)
    movlw b'10000101'			;	Now that we have our next column activated, we send out the next byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    movlw b'00000101'			;	activate the next column of cathodes in sequence by incrementing the data
    movwf PORTA					;	on PORTA (which connects to the 7442)
    movlw b'10101001'			;	Now that we have our next column activated, we send out the next byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    movlw b'00000110'			;	activate the next column of cathodes in sequence by incrementing the data
    movwf PORTA					;	on PORTA (which connects to the 7442)
    movlw b'01000010'			;	Now that we have our next column activated, we send out the next byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    movlw b'00000111'			;	activate the next column of cathodes in sequence by incrementing the data
    movwf PORTA					;	on PORTA (which connects to the 7442)
    movlw b'00111100'			;	Now that we have our next column activated, we send out the next byte of data to the anodes
    movwf PORTB					;	by placing the data on PORTB
    call delay					;	hold that column on for a short while... and then go onto the next column
    clrf PORTB				;	This ensures that we don't display the previous columns data on the next column.
    goto begin					;	and now go and do it all again (it will run in a continuous loop)




	
delay
    movlw d'255'				;	try decreasing this number and see what effect it has on the display
    movwf delay_1				;	the number stored in w will now be copied into our two delay variables
    movwf delay_2				;	the higher the number means the longer the delay time
delay_loop						;	We come back to this label when we have not yet reached zero.
    decfsz delay_1, f			;	decrement whatever is in delay_1 by 1 and store the answer back in delay_1
    goto delay_loop			;	if the answer is not zero, then go back to the delay_loop label. but if the
    decfsz delay_2, f			;	answer is zero then decrement delay_2 by one and store the answer in delay_2
    goto delay_loop			;	if the answer is not zero, then go back to delay_loop label. but if the answer
    return						;	is zero, then we have completed our delay and now we can return to our main program!



    end							;	We always need to have end at the end, even if we don't want the program
								;	to actually end, it still must be here!