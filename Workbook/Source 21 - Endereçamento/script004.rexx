/* LISTASPACE */

ADDRESS TSO
"STATUS"

say "ACTIVE ADDRESS SPACES"
say "---------------------"

do i=1 to queued()
  pull line
  if pos("ASID",line) > 0 then iterate
  parse var line jobname asid type .
  if jobname <> "" then
     say jobname " ASID:" asid " TYPE:" type
end