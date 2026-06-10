/* REXX */
/* Recupera o próximo registro na sequência do banco IMS. Utilizado para navegação sequencial após um posicionamento. */

ADDRESS IMS

"GN CLIENTE"

IF RC = 0 THEN
   SAY IMSDATA