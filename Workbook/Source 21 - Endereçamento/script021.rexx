/* JOBSTATUS */

ADDRESS OPER
"D A,L"

say "ACTIVE JOBS"

do i=1 to queued()
 pull line
 say line
end