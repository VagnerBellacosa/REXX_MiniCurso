/* REXX */
/* Percorre todos os registros de um segmento IMS. Ideal para auditorias, consultas e relatórios completos. */

ADDRESS IMS

"GU CLIENTE"

DO FOREVER

   "GN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   SAY IMSDATA

END