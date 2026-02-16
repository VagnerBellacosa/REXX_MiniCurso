/* REXX */

/*------------------------------------------------------------------*/
/* CAPACITYSCAN - Analisa Capacidade da LPAR vs Consumo            */
/*------------------------------------------------------------------*/

ADDRESS SDSF

isfcols = "TYPE CPU% MVS% LPARNAME"

"ISFEXEC CPU"

if rc <> 0 then do
   say "Erro ao acessar painel CPU via SDSF"
   exit 8
end

rows = isfrows

if rows = 0 then do
   say "Nenhum dado de CPU encontrado."
   exit 4
end

say "==============================================="
say "      LPAR CAPACITY ANALYSIS REPORT"
say "==============================================="

total_busy = 0
cp_count = 0

do i = 1 to rows
   if type.i = "CP" then do
      cpuval = strip(cpu%.i,"%")
      total_busy = total_busy + cpuval
      cp_count = cp_count + 1
   end
end

if cp_count = 0 then do
   say "Nenhum CP encontrado."
   exit 8
end

avg_busy = total_busy / cp_count

say "LPAR:" lparname.1
say "CPs Online:" cp_count
say "CPU Média Busy:" format(avg_busy,5,2) "%"

say "-----------------------------------------------"

/* Diagnóstico */

if avg_busy > 85 then
   say "⚠ ALERTA: LPAR próxima da saturação."
else if avg_busy > 70 then
   say "⚠ Atenção: Alta utilização."
else if avg_busy < 30 then
   say "ℹ LPAR subutilizada."
else
   say "✔ Utilização saudável."

say "==============================================="

exit 0