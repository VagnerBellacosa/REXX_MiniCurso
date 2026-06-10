/* REXX */
/* Pesquisa registros que atendam a um critério específico. Muito útil para localizar dados durante troubleshooting. */

ADDRESS IMS

"GU CLIENTE"

DO FOREVER

   "GN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   IF POS("CAMPINAS",IMSDATA) > 0 THEN
      SAY IMSDATA

END