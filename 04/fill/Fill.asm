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

(MLOOP)
  @0
  D=A-1
  @paint
  M=D

  @24576  // read keyborad
  D=M
  @FILL  // is pressed
  D;JNE

  @0      // 16bit white
  D=A
  @paint
  M=D
(FILL)
  @count
  M=0
  (FLOOP)
    @count
    D=M
    @8192
    D=D-A
    @MLOOP
    D;JGE

    @SCREEN // select address
    D=A
    @count
    D=D+M
    @absAd
    M=D
    @paint
    D=M
    @absAd
    A=M
    M=D
    @count
    M=M+1
    @FLOOP
    0;JMP
