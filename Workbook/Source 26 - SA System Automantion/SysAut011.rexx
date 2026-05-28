/* REXX */

/* Script inteligente de monitoramento */

ADDRESS NETVASIS

'INGAMS'

IF RC ¬= 0 THEN DO
   SAY 'ERRO no Automation Manager!'
   EXIT 8
END

'INGMSGS'

IF RC = 0 THEN
   SAY 'Mensagens encontradas.'

SAY 'Automação operacional.'