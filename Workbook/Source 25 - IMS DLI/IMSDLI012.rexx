/* rexx */

/* Capturar Mensagens IMS */
ADDRESS IMS

"CMD '/DISPLAY MSG'"

DO FOREVER
   PARSE PULL MSG
   IF MSG = "" THEN LEAVE
   SAY MSG
END