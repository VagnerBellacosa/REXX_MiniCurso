/* REXX */
/* Remove um registro do database IMS. Utilizado para exclusão de dados incorretos ou registros obsoletos. */

ADDRESS IMS

"GHU CLIENTE CODCLI=2001"

IF RC = 0 THEN
DO

   "DLET CLIENTE"

END