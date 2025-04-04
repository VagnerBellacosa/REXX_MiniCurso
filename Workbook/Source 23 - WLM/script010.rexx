/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Confirma execução da região CICS */

Address SDSF "ISFEXEC DA"
if rc <> 0 then exit 8

do i = 1 to isfrows
  if pos("CICS", jobname.i) > 0 then do
    say "CICS ativo:" jobname.i
    exit 0
  end
end

say "CICS não encontrado"
exit 4