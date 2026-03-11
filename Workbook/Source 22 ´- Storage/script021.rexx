commands = "/D M=STOR /D M=REAL /D ASM"
DO i = 1 TO WORDS(commands)
  cmd = WORD(commands,i)
  ADDRESS SDSF "ISFEXEC CMD '"cmd"'"
END