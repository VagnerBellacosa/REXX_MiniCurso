/* REXX */
"ALLOC FI(IN) DA('USER.TEST') SHR"
"EXECIO * DISKR IN (STEM DADOS."
"FREE FI(IN)"

do i=1 to dados.0
 say dados.i
end