/* REXX */
/* Conta a quantidade total de registros existentes em um segmento IMS. Útil para auditorias e conferências. */

ADDRESS IMS

CONTADOR = 0

"GU CLIENTE"

DO FOREVER

   "GN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   CONTADOR = CONTADOR + 1

END

SAY "TOTAL DE REGISTROS:" CONTADOR