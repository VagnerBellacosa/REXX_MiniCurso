/* REXX */

/* verificar databases em stop */
ADDRESS TSO

"SUBCOM IMS"

"QUERY DB ALL"

DO WHILE QUEUED() > 0
   PULL LINHA

   IF POS("STOPPED",LINHA) > 0 THEN
      SAY "ALERTA ->" LINHA
END