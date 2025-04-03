Verificar status do WLM
/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Executa DISPLAY WLM,SYSTEM */

Address CONSOLE "D WLM,SYSTEM"
if rc <> 0 then do
  say "Erro ao consultar WLM"
  exit 8
end

exit 0