/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Loop monitorando CPU */

do forever
  Address SDSF "ISFEXEC DA"
  if rc <> 0 then exit 8

  say "AS ativos:" isfrows
  call sleep 10
end