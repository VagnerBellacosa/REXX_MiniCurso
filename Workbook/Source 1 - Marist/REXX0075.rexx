/*REXX*/
/*                                                     */
/* exemplo de funcao time() hora do sistema            */
/*                                                     */

/*  GRAVACAO DE UM ARQUIVO DE UMA SO VEZ */

/* Aloca um DDNAME com um arquivo existente (in/out) */

"FREE FI(SYSUT1)"

"ALLOC FI(SYSUT1) DSN("ADCDMST.REXX.TESTE01") shr"

/* Gravacao de TODOS os registros do arquivo */

UT1.1 = 'REGISTRO 1'
UT1.2 = 'REGISTRO 2'
UT1.3 = 'REGISTRO 3'
UT1.4 = 'REGISTRO 4'
UT1.5 = 'REGISTRO 5'
UT1.6 = 'REGISTRO 6'
UT1.7 = 'REGISTRO 7'
UT1.8 = 'REGISTRO 8'
UT1.9 = 'REGISTRO 9'
UT1.10 = 'REGISTRO 10'
UT1.11 = 'REGISTRO 11'
UT1.12 = 'REGISTRO 12'

/* grava 12 linhas no arquivo   */
"EXECIO 12  DISKW SYSUT1 (FINIS STEM UT1.)"

/* Libera o DDNAME alocado */

"FREE FI(SYSUT1)"

EXIT 0
