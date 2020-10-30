// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Computes RAM[2]=RAM[0]+RAM[0]+...+RAM[0] {RAM[1] times}
// R2 = 0
// i = 1
// while (i <= R1):
// 	R2 = R0 + R0
// 	i = i + 1
	@i
	M=1 // i=1
	@R2
	M=0 // R2=0
(LOOP)
	@i
	D=M
	@R1
	D=D-M
	@END
	D;JGT
	@R0
	D=M 	
	@R2
	M=D+M // R0 + R0
	@i
	M=M+1 // i++
	@LOOP
	0;JMP
(END)
	@END
	0;JMP