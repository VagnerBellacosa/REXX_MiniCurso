/* REXX */
/* SMF 100 Db2 Dashboard */

parse arg dsn

if dsn = "" then do
   say "Uso: EXEC SMF100DASH 'HLQ.SMF100.DATA'"
   exit 8
end

address tso
"ALLOC FI(SMFDD) DA('"dsn"') SHR REUSE"

total_cpu = 0
record_count = 0

say "==============================================="
say "        DB2 DASHBOARD - SMF 100               "
say "==============================================="

do forever

   "EXECIO 1 DISKR SMFDD (STEM REC. FINIS"
   if rc <> 0 then leave

   rec = REC.1

   /* RDW */
   rdw_len = c2d(substr(rec,1,2))

   /* Remove RDW */
   smf = substr(rec,5)

   smf_type = c2d(substr(smf,3,1))

   if smf_type = 100 then do

      record_count = record_count + 1

      /* ⚠️ Offset ilustrativo – depende da versão */
      cpu = c2d(substr(smf,40,4))

      total_cpu = total_cpu + cpu

      say "---------------------------------------"
      say "SMF 100 Record Length :" rdw_len
      say "CPU Used (raw)        :" cpu

   end

end

say "-----------------------------------------------"
say "Total SMF 100 Records :" record_count
say "Total CPU (raw units) :" total_cpu
say "-----------------------------------------------"

"FREE FI(SMFDD)"
exit 0
