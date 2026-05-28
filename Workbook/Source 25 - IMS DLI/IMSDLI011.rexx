/* rexx */

/* Auditoria de Bancos IMS */
ADDRESS IMS

"CMD '/DIS DB ALL'"

DO FOREVER
   PARSE PULL DB
   IF DB = "" THEN LEAVE

   IF POS("ERROR",DB) > 0 THEN
      SAY "ALERTA:" DB
END