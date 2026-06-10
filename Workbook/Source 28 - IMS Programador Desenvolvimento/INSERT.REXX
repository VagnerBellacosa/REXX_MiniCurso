/* REXX */
/* Insere um novo segmento no database IMS. Utilizado para carga manual, correções e inclusão emergencial de dados. */

ADDRESS IMS

"ISRT CLIENTE",
"CODCLI=2001",
"NOME=JOAO",
"CIDADE=SAO PAULO"

IF RC = 0 THEN
   SAY "INSERIDO"