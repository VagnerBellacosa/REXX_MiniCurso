/* REXX */
/*------------------------------------------------------------------*/
/* DAILYCPUREPORT - Gerador Diário de Capacidade                   */
/*------------------------------------------------------------------*/

ADDRESS SDSF

isfcols = "TYPE CPU% LPARNAME"

"ISFEXEC CPU"

if rc <> 0 then do
   say "Erro ao acessar painel CPU."
   exit 8
end

rows = isfrows

if rows = 0 then do
   say "Sem dados de CPU."
   exit 4
end

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

/* Timestamp */
date = date("S")
time = time("N")

/* Status */
status = "OK"

if cp_avg > 85 then
   status = "SATURACAO"
else if cp_avg > 70 then
   status = "ALERTA"

/* Monta linha de relatório */
report_line = date time lparname.1,
              "CP="format(cp_avg,5,2)"%",
              "zIIP="format(ziip_avg,5,2)"%",
              status

/* Grava em dataset */
outfile = "'SYS1.CAPACITY.REPORT.DAILY'"

address tso
"ALLOC F(OUTDD) DA("outfile") MOD REUSE"
"EXECIO 1 DISKW OUTDD (STRING report_line)"
"FREE F(OUTDD)"

say "Relatório diário gerado com sucesso."
exit 0