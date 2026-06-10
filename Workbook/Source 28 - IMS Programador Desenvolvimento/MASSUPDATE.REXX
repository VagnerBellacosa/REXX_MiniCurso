/* REXX */
/* Executa atualização em massa de registros IMS. Utilizado em campanhas, ajustes globais e saneamento de dados. */

ADDRESS IMS

"GU CLIENTE"

DO FOREVER

   "GHN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   NOVO = LIMITE * 1.10

   "REPL CLIENTE LIMITE="NOVO

END