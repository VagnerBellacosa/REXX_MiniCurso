/* ADDRSPACE */

ADDRESS TSO
"STATUS"

say "ACTIVE ADDRESS SPACES"

do i=1 to queued()
 pull line
 parse var line jobname asid type .
 if jobname <> "" then
    say jobname "ASID:" asid "TYPE:" type
end