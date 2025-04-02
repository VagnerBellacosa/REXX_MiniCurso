/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Verifica se algum AS está consumindo CPU alta */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

alert = 0

do i = 1 to isfrows
  if real.i > 80 then do
    say "CPU alta:" jobname.i real.i
    alert = 1
  end
end

if alert = 1 then exit 4
exit 0