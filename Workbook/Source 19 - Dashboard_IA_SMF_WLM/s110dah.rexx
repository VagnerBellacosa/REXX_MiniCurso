 IBMUSER.WORKBOOK.REXX(COUNTREC)


/* REXX */
/* SMF 110 CICS Dashboard */

parse arg dsn

if dsn = "" then do
   say "Uso: EXEC SMF110DASH 'HLQ.SMF110.DATA'"
   exit 8
end

address tso
"ALLOC FI(SMFDD) DA('"dsn"') SHR REUSE"

total_cpu = 0
rec_count = 0

say "================================================"
say "           CICS DASHBOARD - SMF 110            "
say "================================================"

do forever

   "EXECIO 1 DISKR SMFDD (STEM REC. FINIS"
   if rc <> 0 then leave

   rec = REC.1

   /* RDW */
   rdw_len = c2d(substr(rec,1,2))

   /* Remove RDW */
   smf = substr(rec,5)

   smf_type = c2d(substr(smf,3,1))
   smf_subtype = c2d(substr(smf,4,1))

   if smf_type = 110 then do

      rec_count = rec_count + 1

      /* ⚠️ Offsets ilustrativos (variam por versão) */
      tranid = substr(smf,50,4)
      cpu    = c2d(substr(smf,100,4))
      resp   = c2d(substr(smf,120,4))

      total_cpu = total_cpu + cpu

      say "--------------------------------------------"
      say "Subtype        :" smf_subtype
      say "Transaction ID :" tranid
      say "CPU (raw)      :" cpu
      say "Resp Time(raw) :" resp

   end

end

say "--------------------------------------------"
say "Total Records  :" rec_count
say "Total CPU Used :" total_cpu
say "--------------------------------------------"

"FREE FI(SMFDD)"
exit 0
