/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Lista jobs do usuário atual */

userid = sysvar("SYSUID")

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

do i = 1 to isfrows
  if owner.i = userid then
    say jobname.i
end

exit 0