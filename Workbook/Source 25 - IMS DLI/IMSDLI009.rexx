/* rexx */

/* Dashboard Simples IMS */
DO FOREVER

   ADDRESS IMS
   "CMD '/DIS ACTIVE'"

   PARSE PULL A

   ADDRESS IMS
   "CMD '/DIS DB ALL'"

   PARSE PULL B

   CLS

   SAY "IMS STATUS"
   SAY "=========="
   SAY A
   SAY B

   ADDRESS TSO "WAIT 30"

END