/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Avalia se muitos AS estão ativos */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

if isfrows > 300 then do
  say "Possível sobrecarga"
  exit 4
end

exit 0