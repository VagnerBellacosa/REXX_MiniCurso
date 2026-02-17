/* REXX */

/* SMF 99 Binary Reader - RDW Interpretation */

parse arg dataset

if dataset = "" then do
   say "Uso: EXEC SMF99BIN 'HLQ.SMF99.DATA'"
   exit 8
end

address tso
"ALLOC FI(SMFDD) DA('"dataset"') SHR REUSE"

/* Lê registro binário */
"EXECIO 1 DISKR SMFDD (STEM REC. BLOCK 32760"

do while rc = 0

   rec = REC.1

   /* --- RDW --- */
   rdw_len = c2d(substr(rec,1,2))   /* bytes 1-2 */
   rdw_flag = c2d(substr(rec,3,2))  /* bytes 3-4 */

   /* Remove RDW */
   smf_record = substr(rec,5)

   /* --- SMF HEADER --- */
   smf_type = c2d(substr(smf_record,3,1))
   smf_subtype = c2d(substr(smf_record,4,1))

   smf_date = c2d(substr(smf_record,5,4))
   smf_time = c2d(substr(smf_record,9,4))

   if smf_type = 99 then do
      say "-------------------------------------"
      say "SMF Record Length :" rdw_len
      say "SMF Type          :" smf_type
      say "SMF Subtype       :" smf_subtype
      say "Raw Date (STCK)   :" smf_date
      say "Raw Time (STCK)   :" smf_time
   end

   "EXECIO 1 DISKR SMFDD (STEM REC. BLOCK 32760"
end

"FREE FI(SMFDD)"
say "Fim do processamento."
