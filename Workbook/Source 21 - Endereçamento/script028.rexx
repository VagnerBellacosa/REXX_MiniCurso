/* IOALERT */

ADDRESS OPER
"D M=DEV"

do i=1 to queued()
 pull line
 if pos("ERROR",line) > 0 then
    say "I/O ERROR ->" line
end