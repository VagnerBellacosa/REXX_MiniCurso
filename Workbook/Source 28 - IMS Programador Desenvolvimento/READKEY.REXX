/* REXX */
/* Lê um único registro IMS através da chave primária informada. Útil para consultas pontuais e validações de dados. */

ADDRESS IMS

"GU CLIENTE CODCLI=1001"

IF RC = 0 THEN
   SAY IMSDATA
ELSE
   SAY "NAO ENCONTRADO"