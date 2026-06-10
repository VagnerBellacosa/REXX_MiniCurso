/* REXX */
/* Verifica a existência de um registro antes de executar processos críticos. Evita erros de inclusão ou atualização. */

ADDRESS IMS

"GU CLIENTE CODCLI=1001"

IF RC = 0 THEN
   SAY "EXISTE"
ELSE
   SAY "NAO EXISTE"