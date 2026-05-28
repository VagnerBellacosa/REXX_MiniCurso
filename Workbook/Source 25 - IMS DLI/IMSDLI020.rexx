/* rexx */

/* Consultar Transações Ativas */ 
ADDRESS IMS

"CMD '/DIS TRAN ALL'"

DO FOREVER
   PARSE PULL T
   IF T = "" THEN LEAVE
   SAY T
END