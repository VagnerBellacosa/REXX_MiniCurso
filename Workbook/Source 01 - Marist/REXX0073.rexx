/*REXX*/
/*                                                     */
/* exemplo de tratamento de arquivos                   */
/*                                                     */

/* LEITURA DE UM ARQUIVO DE UMA SO VEZ */

/* Aloca um DDNAME com um arquivo existente (in/out) */
"FREE FI(SYSUT1)"
"ALLOC FI(SYSUT1) DSN("ADCDMST.REXX.TESTE01") SHR"

/* Leitura de TODOS os registros do arquivo */

"EXECIO * DISKR SYSUT1 (FINIS STEM UT1.)"

I1 = UT1.0

/* Libera o DDNAME alocado */

"FREE FI(SYSUT1)"

/* Processamento */

SAY ' '
SAY ' '
SAY ' '
Say 'Li o arquivo SYSUT1 com 'I1' registros'

/* FINALIZA O PROGRAMA RETORNANDO O NUMERO DE REGISTROS */
EXIT I1

