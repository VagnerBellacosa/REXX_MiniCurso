/* REXX */

/* verificar databases em recorevy needed */
ADDRESS TSO

"DBRC LIST.DB ALL"

DO WHILE QUEUED() > 0

   PULL DB

   IF POS("RECOV",DB) > 0 THEN
      SAY "RECOVERY NECESSARIO:" DB

END
