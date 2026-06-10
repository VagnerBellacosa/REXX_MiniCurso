/* REXX */

/* monitorar utilizacao de areas fast paht evitando overflow */
ADDRESS TSO

"DBRC LIST.DB DBD(FPDB001)"

DO WHILE QUEUED() > 0

   PULL REG

   IF POS("% USED",REG) > 0 THEN
      SAY REG

END
