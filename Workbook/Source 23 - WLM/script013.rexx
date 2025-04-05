Contar Address Spaces ativos
/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Conta total de AS ativos */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

say "Total AS:" isfrows

exit 0