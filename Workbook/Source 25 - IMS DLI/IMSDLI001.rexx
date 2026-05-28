/* rexx */

/* 1️⃣ Verificar Status IMS Online */

ADDRESS TSO

"SUBCOM IMS"

IF RC = 0 THEN
   SAY "IMS ONLINE"
ELSE
   SAY "IMS OFFLINE"