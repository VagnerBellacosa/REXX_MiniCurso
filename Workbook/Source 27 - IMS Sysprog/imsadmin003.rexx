/* REXX */

/* encontrar databases sem image copy recente */
ADDRESS TSO

"LISTCAT LEVEL(IMS.IC)"

DO WHILE QUEUED() > 0

   PULL REG

   IF POS("CREATION",REG) > 0 THEN
      SAY REG

END