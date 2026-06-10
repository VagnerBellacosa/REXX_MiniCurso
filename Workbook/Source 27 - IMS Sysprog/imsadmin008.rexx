/* REXX */

/* verificar e detectar crescimento excessivo */
ADDRESS TSO

"LISTCAT LEVEL(PROD.IMS.DB)"

DO WHILE QUEUED() > 0

   PULL REG

   IF POS("SPACE",REG) > 0 THEN
      SAY REG

END
