/* rexx */

/* Loop de Monitoramento */
DO FOREVER

   ADDRESS IMS
   "CMD '/DIS ACTIVE'"

   PARSE PULL X

   SAY DATE() TIME() X

   ADDRESS TSO "WAIT 10"

END