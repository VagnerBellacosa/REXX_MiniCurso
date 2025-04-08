/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Combina CPU e I/O altos */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

do i = 1 to isfrows
  if real.i > 70 & sio.i > 40 then
    say "Possível gargalo:" jobname.i
end

exit 0