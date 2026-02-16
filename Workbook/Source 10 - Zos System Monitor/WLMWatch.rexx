/* REXX */
/*------------------------------------------------------------------*/
/* WLMWATCH - Monitor de Service Classes (WLM)                     */
/*------------------------------------------------------------------*/

ADDRESS SDSF

isfcols = "SCNAME PERIOD IMP CPU% VEL% RESP%"

"ISFEXEC SR"

if rc <> 0 then do
   say "Erro ao acessar painel SR (WLM Service Resource)."
   exit 8
end

rows = isfrows

if rows = 0 then do
   say "Nenhuma Service Class encontrada."
   exit 4
end

say "========================================================="
say "                 WLM SERVICE MONITOR"
say "========================================================="

alert_count = 0

do i = 1 to rows

   scname = scname.i
   period = period.i
   imp    = imp.i
   cpu    = strip(cpu%.i,"%")
   vel    = strip(vel%.i,"%")
   resp   = strip(resp%.i,"%")

   say scname period "IMP="imp,
       "CPU="cpu"%",
       "VEL="vel"%",
       "RESP="resp"%"

   /* Critério 1: Alta importância com baixa performance */
   if imp <= 2 & vel < 50 & vel <> "" then do
      say "⚠ ALERTA: Alta importância com baixa velocity!"
      alert_count = alert_count + 1
   end

   if imp <= 2 & resp > 120 & resp <> "" then do
      say "⚠ ALERTA: Alta importância com resposta degradada!"
      alert_count = alert_count + 1
   end

   say "---------------------------------------------------------"

end

if alert_count = 0 then
   say "✔ Nenhuma anomalia crítica detectada."
else
   say alert_count "situações críticas detectadas."

say "========================================================="

exit alert_count