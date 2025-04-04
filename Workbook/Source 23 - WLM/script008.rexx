/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Busca um job específico */

parse arg alvo

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

found = 0

do i = 1 to isfrows
  if jobname.i = alvo then do
    say "Encontrado:" jobname.i
    found = 1
  end
end

if found = 0 then exit 4
exit 0