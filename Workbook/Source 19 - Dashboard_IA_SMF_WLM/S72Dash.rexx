/* REXX */

/* SMF72 Dashboard Simplificado */

parse arg dataset

if dataset = "" then do
   say "Uso: EXEC SMF72DASH 'HLQ.SMF72.DATA'"
   exit 8
end

address tso

"ALLOC FI(INFILE) DA('"dataset"') SHR REUSE"
"EXECIO * DISKR INFILE (STEM SMF. FINIS"

online_cpu = 0
batch_cpu  = 0
online_cnt = 0
batch_cnt  = 0

do i = 1 to SMF.0
   line = SMF.i

   parse var line "SERVICECLASS=" sc " CPU=" cpu " RESP=" resp

   cpu = cpu + 0
   resp = resp + 0

   select
      when sc = "ONLINE" then do
         online_cpu = online_cpu + cpu
         online_cnt = online_cnt + 1
      end
      when sc = "BATCH" then do
         batch_cpu = batch_cpu + cpu
         batch_cnt = batch_cnt + 1
      end
   end
end

"FREE FI(INFILE)"

say "==========================================="
say "         WLM DASHBOARD - SMF 72           "
say "==========================================="
say ""
say "Service Class   Samples    Total CPU"
say "-------------   -------    ---------"

say "ONLINE          " online_cnt "       " online_cpu
say "BATCH           " batch_cnt  "       " batch_cpu

say ""
say "-------------------------------------------"
say "Total CPU Consumption: " online_cpu + batch_cpu
say "-------------------------------------------"

