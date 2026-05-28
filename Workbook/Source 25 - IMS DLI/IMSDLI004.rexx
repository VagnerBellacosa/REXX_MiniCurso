/* rexx */

/* Ler Resposta de Comando */

ADDRESS IMS

"CMD '/DIS DB ALL'"

PARSE PULL RESPOSTA

SAY RESPOSTA