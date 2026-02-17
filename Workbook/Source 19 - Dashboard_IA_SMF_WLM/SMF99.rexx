/* REXX */
/* SMF 99 VB Reader */
/* Autor: Bellacosa Mode 😎 */

parse arg dsn

if dsn = "" then do
   say "Uso: EXEC SMF99VB 'HLQ.SMF99.DATA'"
   exit 8
end

address tso
"ALLOC FI(SMFDD) DA('"dsn"') SHR REUSE"

/* Lê 1 registro binário por vez */
do forever

   "EXECIO 1 DISKR SMFDD (STEM REC. FINIS"
   if rc <> 0 then leave

   rec = REC.1

   /* ============================= */
   /* RDW – Record Descriptor Word */
   /* ============================= */

   rdw_len  = c2d(substr(rec,1,2))   /* Comprimento total */
   rdw_flag = c2d(substr(rec,3,2))   /* Reserved */

   /* Remove RDW */
   smf = substr(rec,5)

   /* ============================= */
   /* SMF Header básico            */
   /* ============================= */

   smf_type    = c2d(substr(smf,3,1))
   smf_subtype = c2d(substr(smf,4,1))

   if smf_type = 99 then do
      say "---------------------------------------"
      say "SMF Record Length :" rdw_len
      say "SMF Type          :" smf_type
      say "SMF Subtype       :" smf_subtype
   end

end

"FREE FI(SMFDD)"

say "Processamento finalizado."
exit 0
