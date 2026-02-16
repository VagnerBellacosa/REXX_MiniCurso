/* REXX */
/*------------------------------------------------------------------*/
/* DB2ENCLWATCH - Monitor de Enclaves DB2 (DRDA/DDF)               */
/*------------------------------------------------------------------*/

ADDRESS SDSF

isfcols = "TYPE SCNAME PERIOD IMP CPU% VEL% RESP%"

"ISFEXEC SR"

if rc <> 0 then do
   say "Erro ao acessar painel WLM (SR)."
   exit 8
end

rows = isfrows

if rows = 0 then do
   say "Nenhum dado WLM encontrado."
   exit 4
end

say "========================================================="
say "              DB2 ENCLAVE MONITOR"
say "========================================================="

alert = 0

do i = 1 to rows

   type   = type.i
   scname = scname.i
   imp    = imp.i
   cpu    = strip(cpu%.i,"%")
   vel    = strip(vel%.i,"%")
   resp   = strip(resp%.i,"%")

   /* Filtra enclaves e possíveis classes DB2 */
   if type = "ENCLAVE" | pos("DB2",scname) > 0 | pos("DDF",scname) > 0 then do

      say "Service Class:" scname
      say "Importance   :" imp
      say "CPU%         :" cpu"%"
      say "Velocity     :" vel"%"
      say "Response     :" resp"%"

      /* Critério 1 – Alta importância degradando */
      if imp <= 2 & vel <> "" & vel < 50 then do
         say "⚠ ALERTA: Enclave crítico com baixa velocity"
         alert = alert + 1
      end

      /* Critério 2 – Resposta alta */
      if imp <= 2 & resp <> "" & resp > 120 then do
         say "⚠ ALERTA: Tempo de resposta degradado"
         alert = alert + 1
      end

      /* Critério 3 – CPU alta */
      if cpu > 80 then do
         say "💣 CPU alta em enclave - verificar zIIP saturation"
         alert = alert + 1
      end

      say "-----------------------------------------------------"
   end

end

if alert = 0 then
   say "✔ Nenhuma anomalia crítica detectada."
else
   say alert "alertas detectados em enclaves DB2."

say "========================================================="

exit alert