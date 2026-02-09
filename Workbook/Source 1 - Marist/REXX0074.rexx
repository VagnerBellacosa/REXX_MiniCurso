/*REXX*/
/*                                                          */
/* exemplo de LEITURA DE UM ARQUIVO DE registro a registro  */
/*                                                          */

/* Aloca um DDNAME com um arquivo existente (in/out) */
"FREE FI(SYSUT1)"

"ALLOC FI(SYSUT1) DSN("ADCDMST.REXX.TESTE") shr"

/* Leitura de TODOS os registros do arquivo */

/* abrir o arquivo  */
"EXECIO 0 DISKR SYSUT1 (STEM UT1.)"

I1 = 0

/* loop para leitura */

do forever
"EXECIO 1 DISKR SYSUT1 (STEM UT1.)"   /* LEITURA DE CADA REGISTRO */
IF RC <> 0 THEN LEAVE                 /* EM CASO DE ERRO, SAI DO LOOP */
I1 = I1 + 1                           /* CONTAGEM DOS REGISTROS */
END

/* FECHAMENTO DO ARQUIVO */
"EXECIO 0 DISKR SYSUT1 (FINIS STEM UT1.)"

/* Libera o DDNAME alocado */

"FREE FI(SYSUT1)"

/* Processamento */

Say 'Li o arquivo SYSUT1 com 'I1' registros'

/* FINALIZA O PROGRAMA RETORNANDO O NUMERO DE REGISTROS */
EXIT I1

