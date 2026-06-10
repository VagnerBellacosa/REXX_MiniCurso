/* REXX */

/* auditoria em recon , busca inconsistencias dbrc */
ADDRESS TSO

"DBRC LIST.RECON"

DO WHILE QUEUED() > 0

   PULL LINHA

   IF POS("ERROR",LINHA) > 0 THEN
      SAY "PROBLEMA:" LINHA

END
