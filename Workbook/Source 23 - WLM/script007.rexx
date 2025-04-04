Detectar paging alto
/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Identifica alta paginação */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

do i = 1 to isfrows
  if paging.i > 10 then
    say "Paging alto:" jobname.i paging.i
end

exit 0