// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
	@8192 	// Number of 16 bit pixel lines to cover the screen
	D=A
	@i	
	M=D
	
(LOOP)
	@i
	M=M-1
	D=M
	@START
	D;JLT	// If i < 0 goto INIT to reset
	@KBD
	D=M
	@WHITE 	// If no key is pressed goto WHITE, else goto BLACK
	D;JEQ
	@BLACK
	0;JMP
	
(BLACK)
	@SCREEN
	D=A
	@i
	A=D+M
	M=-1	// Draw black pixels
	@LOOP
	0;JMP
	
(WHITE)
	@SCREEN
	D=A
	@i
	A=D+M
	M=0	// Draw white pixels
	@LOOP
	0;JMP
