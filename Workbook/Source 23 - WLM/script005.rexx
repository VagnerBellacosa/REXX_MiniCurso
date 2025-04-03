/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Lista enclaves via SDSF ENCLAVES */

Address SDSF "ISFEXEC ENC"
if rc <> 0 then exit 8

do i = 1 to isfrows
  say enclname.i serviceclass.i
end

exit 0