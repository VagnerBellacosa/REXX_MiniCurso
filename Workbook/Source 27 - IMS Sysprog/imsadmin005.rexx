/* REXX */

/* detectar images copies ausentes validando estrategia de recuperacao */
ADDRESS TSO

"DBRC LIST.IC"

IF RC <> 0 THEN
DO

   SAY "SEM IMAGE COPY"

END
