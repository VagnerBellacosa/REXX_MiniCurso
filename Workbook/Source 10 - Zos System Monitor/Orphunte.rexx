/* REXX */

/*------------------------------------------------------------------*/
/* ORPHANHUNTER - Detecta possíveis jobs órfãos                     */
/*------------------------------------------------------------------*/

ADDRESS SDSF
isfowner = "*"
isfprefix = "*"
isfcols = "JNAME JOBID OWNER ST CPU% CPUTIME"

"ISFEXEC ST"

if rc <> 0 then do
   say "Erro ao acessar SDSF ST"
   exit 8
end

rows = isfrows

if rows = 0 then do
   say "Nenhum job encontrado."
   exit 4
end

say "==============================================="
say "   ORPHAN HUNTER REPORT"
say "==============================================="

orphans = 0

do i = 1 to rows

   jobname = jname.i
   jobid   = jobid.i
   owner   = owner.i
   status  = st.i
   cpu     = strip(cpu.i,"%")
   cputime = cputime.i

   /* Critério 1: Executando mas CPU 0 */
   if status = "EXECUTION" & cpu = 0 then do
      say "Possível órfão (CPU zero em execução):"
      say jobname jobid "OWNER:" owner
      say "-----------------------------------"
      orphans = orphans + 1
   end

   /* Critério 2: STC com CPU muito baixo */
   if status = "ACTIVE" & pos("STC",jobid) > 0 & cpu < 1 then do
      say "STC suspeita de inatividade:"
      say jobname jobid "OWNER:" owner
      say "-----------------------------------"
      orphans = orphans + 1
   end

   /* Critério 3: Sem owner válido */
   if owner = "" | owner = "?" then do
      say "Job sem owner válido:"
      say jobname jobid
      say "-----------------------------------"
      orphans = orphans + 1
   end

end

if orphans = 0 then
   say "Nenhum órfão detectado. Sistema saudável."
else
   say orphans "possíveis órfãos detectados."

say "==============================================="

exit 0