/* rexx */

/*  Verificar Transações Paradas */
ADDRESS IMS

"CMD '/DIS TRAN ALL'"

DO FOREVER
   PARSE PULL T

   IF POS("STOPPED",T) > 0 THEN
      SAY "TRANSACAO PARADA:" T
END