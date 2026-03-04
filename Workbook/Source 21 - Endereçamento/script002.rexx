/* REXX */

ADDRESS OPER

"DISPLAY ACTIVE,L"

say " "
say "====== ADDRESS SPACES ATIVOS ======"
say " "

do i=1 to queued()

 pull line

 if pos("JOBNAME",line) > 0 then iterate

 parse var line jobname asid status .

 if jobname <> "" then
    say jobname " ASID:" asid " STATUS:" status

end

exit