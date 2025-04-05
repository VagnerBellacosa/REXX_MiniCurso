/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Lista AS em estado WAIT */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

do i = 1 to isfrows
  if pos.i = "WAIT" then
    say jobname.i "em WAIT"
end

exit 0