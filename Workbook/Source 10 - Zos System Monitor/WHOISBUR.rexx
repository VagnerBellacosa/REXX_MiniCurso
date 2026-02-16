/* REXX */
/*------------------------------------------------------------------*/
/*  WHOISBURNING - CPU Consumer Quick Analyzer                      */
/*  Autor: Bellacosa Mainframe                                      */
/*------------------------------------------------------------------*/

ADDRESS SDSF

isfowner = "*"
isfprefix = "*"
isfcols = "ASID JNAME CPU% SRB% TCB%"

"ISFEXEC DA"

if rc <> 0 then do
   say "Erro ao acessar SDSF DA"
   exit 8
end

rows = isfrows

if rows = 0 then do
   say "Nenhum address space encontrado."
   exit 4
end

/* Criar stem para ordenar */
do i = 1 to rows
   parse value jname.i cpu.i with job cpuval
   cpu_numeric = strip(cpu.i,"%")
   cpu_table.i = right(cpu_numeric,5,"0") || " " || jname.i
end

call sortstem "cpu_table.", rows

say "==============================================="
say " TOP CPU CONSUMERS (Descending)"
say "==============================================="

count = rows
if count > 10 then count = 10

do i = rows to rows-count+1 by -1
   parse value cpu_table.i with cpu_val jobname
   say right(cpu_val,5) "%" jobname
end

say "==============================================="

/* Easter Egg */
if rows > 50 then
   say "EASTER EGG: Seu sistema está BEM populado..."
else
   say "EASTER EGG: Sistema leve ou madrugada tranquila?"

exit 0

/*------------------------------------------------*/
/* SORT STEM PROCEDURE                           */
/*------------------------------------------------*/
sortstem:
procedure
parse arg stem, n
do i = 1 to n-1
   do j = i+1 to n
      if value(stem||i) > value(stem||j) then do
         temp = value(stem||i)
         call value stem||i, value(stem||j)
         call value stem||j, temp
      end
   end
end
return