/* REXX */

logdsn = "'KC02746.WORKBOOK.REXX(LOG)'"

/* Abrir no modo APPEND */
x = lineout(logdsn,,0)     /* Position to END OF FILE */

/* Gravar texto */
logline = date() time() " - InIcio do processamento"
rc = lineout(logdsn, logline)

if rc <> 0 then say "Erro no LOG RC="rc

/* Fechar o arquivo */
call lineout logdsn







