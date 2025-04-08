/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Lista STCs */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

do i = 1 to isfrows
  if c.i = "STC" then
    say jobname.i
end

exit 0