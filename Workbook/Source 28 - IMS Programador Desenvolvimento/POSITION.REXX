/* REXX */
/* Posiciona o cursor lógico em um registro específico. Serve como ponto inicial para leituras e pesquisas subsequentes. */

ADDRESS IMS

"GU CLIENTE CODCLI=5000"

IF RC = 0 THEN
   SAY "POSICIONADO"