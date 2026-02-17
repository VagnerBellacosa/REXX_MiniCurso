/* REXX */
/* SMF 90 RACF Security Dashboard */

parse arg dsn

if dsn = "" then do
   say "Uso: EXEC SMF90DASH 'HLQ.SMF90.DATA'"
   exit 8
end

address tso
"ALLOC FI(SMFDD) DA('"dsn"') SHR REUSE"

total_rec = 0
violations = 0
logon_fail = 0

say "==================================================="
say "          SECURITY DASHBOARD - SMF 90              "
say "==================================================="

do forever

   "EXECIO 1 DISKR SMFDD (STEM REC. FINIS"
   if rc <> 0 then leave

   rec = REC.1

   /* RDW */
   rdw_len = c2d(substr(rec,1,2))

   /* Remove RDW */
   smf = substr(rec,5)

   smf_type    = c2d(substr(smf,3,1))
   smf_subtype = c2d(substr(smf,4,1))

   if smf_type = 90 then do

      total_rec = total_rec + 1

      /* ⚠️ Offsets ilustrativos */
      userid = strip(substr(smf,40,8))
      rc_code = c2d(substr(smf,60,2))

      /* Exemplo simples de falha */
      if rc_code > 0 then do
         violations = violations + 1
      end

      /* Logon failure subtype 4 exemplo */
      if smf_subtype = 4 & rc_code > 0 then do
         logon_fail = logon_fail + 1
      end

   end

end

say "---------------------------------------------------"
say "Total Security Events : " total_rec
say "Total Violations      : " violations
say "Logon Failures        : " logon_fail
say "---------------------------------------------------"

/* Mini gráfico */
say ""
say "Violation Ratio Graph"
bar = copies("#", violations % 10)
say bar

"FREE FI(SMFDD)"
exit 0
