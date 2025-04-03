Verificar I/O alto
/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Detecta alto volume de I/O */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

do i = 1 to isfrows
  if sio.i > 50 then
    say "I/O alto:" jobname.i sio.i
end

exit 0