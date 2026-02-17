/* REXX */

/* SMF 99-2 WLM Dashboard */

parse arg dataset

if dataset = "" then do
   say "Uso: EXEC SMF99DASH 'HLQ.SMF99.TEXT'"
   exit 8
end

address tso
"ALLOC FI(INFILE) DA('"dataset"') SHR REUSE"
"EXECIO * DISKR INFILE (STEM SMF. FINIS"

total_cpu = 0
total_delay = 0

say "===================================================="
say "        AI TELEMETRY DASHBOARD - SMF 99-2          "
say "===================================================="
say ""
say "Service Class | CPU   | Delay | Goal | Status"
say "----------------------------------------------------"

do i = 1 to SMF.0

   line = SMF.i

   parse var line "SERVICECLASS=" sc " CPU=" cpu " DELAY=" delay ,
                   " GOAL=" goal " RESP=" resp

   cpu = cpu + 0
   delay = delay + 0
   total_cpu = total_cpu + cpu
   total_delay = total_delay + delay

   /* Avaliação simples de meta */
   if goal = "0.3" then do
      if resp <= goal then status = "OK"
      else status = "VIOLATION"
   end
   else status = "CHECK"

   say left(sc,13) "|" ,
       right(cpu,6) "|" ,
       right(delay,6) "|" ,
       left(goal,4) "|" ,
       status
end

say "----------------------------------------------------"
say "TOTAL CPU  : " total_cpu
say "TOTAL DELAY: " total_delay
say "----------------------------------------------------"

/* Mini gráfico ASCII */
say ""
say "CPU Distribution Graph"
say "----------------------------------------------------"

do i = 1 to SMF.0
   line = SMF.i
   parse var line "SERVICECLASS=" sc " CPU=" cpu .
   bars = copies("#", cpu % 500)
   say left(sc,13) bars
end

"FREE FI(INFILE)"
