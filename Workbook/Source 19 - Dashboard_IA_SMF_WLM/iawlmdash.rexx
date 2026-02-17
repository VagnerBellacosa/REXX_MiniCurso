/* REXX */
/* OMVS + WLM Dashboard Base para IA */

address tso

tempfile = "'USER.OMVS.TEMP'"

/* Executa comando USS para listar processos */
cmd = "BPXBATCH SH ps -eo pid,user,pcpu,comm > /tmp/omvs_ps.txt"
address tso cmd

/* Copia arquivo USS para dataset */
address tso "OCOPY INDD(PATH('/tmp/omvs_ps.txt'))",
            "OUTDD(OMVSTMP) TEXT"

address tso "ALLOC FI(OMVSTMP) DA("tempfile") NEW SPACE(5,5) TRACKS RECFM(VB) LRECL(255)"
address tso "OCOPY INDD(PATH('/tmp/omvs_ps.txt')) OUTDD(OMVSTMP) TEXT"

/* Lê dataset */
address tso "EXECIO * DISKR OMVSTMP (STEM PROC. FINIS"

say "==============================================="
say "      WLM / OMVS CPU DASHBOARD                "
say "==============================================="

total_cpu = 0

do i = 2 to PROC.0   /* pula header */

   parse var PROC.i pid user cpu cmd

   cpu = cpu + 0

   if cpu > 0 then do
      total_cpu = total_cpu + cpu

      if cpu > 10 then
         say "HIGH CPU -> PID:" pid " USER:" user " CPU:" cpu "% CMD:" cmd
   end
end

say "-----------------------------------------------"
say "Total CPU observed (OMVS processes):" total_cpu "%"
say "-----------------------------------------------"

address tso "FREE FI(OMVSTMP)"
exit 0
