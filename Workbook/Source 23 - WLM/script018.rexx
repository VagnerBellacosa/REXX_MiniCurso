/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Testa acesso SDSF */

Address SDSF "ISFEXEC DA"

if rc <> 0 then do
  say "Falha SDSF"
  exit 8
end

say "SDSF OK"
exit 0