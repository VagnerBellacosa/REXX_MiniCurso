/* REXX */
/*------------------------------------------------------------------*/
/* ZIIPOVERFLOW - Detector de zIIP Overflow                        */
/*------------------------------------------------------------------*/

ADDRESS SDSF

isfcols = "TYPE CPU%"

"ISFEXEC CPU"

if rc <> 0 then do
   say "Erro ao acessar painel CPU."
   exit 8
end

rows = isfrows

cp_total = 0
cp_count = 0
ziip_total = 0
ziip_count = 0

do i = 1 to rows

   cpuval = strip(cpu%.i,"%")

   if type.i = "CP" then do
      cp_total = cp_total + cpuval
      cp_count = cp_count + 1
   end

   if type.i = "zIIP" then do
      ziip_total = ziip_total + cpuval
      ziip_count = ziip_count + 1
   end

end

if cp_count > 0 then
   cp_avg = cp_total / cp_count
else
   cp_avg = 0

if ziip_count > 0 then
   ziip_avg = ziip_total / ziip_count
else
   ziip_avg = 0

say "==============================================="
say "        zIIP OVERFLOW ANALYSIS"
say "==============================================="
say "CP Average Busy   :" format(cp_avg,5,2) "%"
say "zIIP Average Busy :" format(ziip_avg,5,2) "%"
say "-----------------------------------------------"

overflow = 0

if ziip_avg > 95 & cp_avg > 70 then do
   say "💣 ALERTA: POSSÍVEL zIIP OVERFLOW DETECTADO"
   say "Workload elegível pode estar rodando em CP"
   overflow = 1
end
else if ziip_avg > 90 then
   say "⚠ zIIP próximo da saturação"
else
   say "✔ Situação normal"

say "==============================================="

exit overflow