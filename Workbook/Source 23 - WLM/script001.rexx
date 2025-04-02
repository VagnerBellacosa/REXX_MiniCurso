/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Lista Address Spaces ativos via SDSF DA */

Address SDSF "ISFEXEC DA"
if rc <> 0 then do
  say "Erro ao acessar SDSF DA"
  exit 8
end

do i = 1 to isfrows
  say jobname.i dp.i real.i
end

exit 0