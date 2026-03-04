/* PATHALERT */

ADDRESS OPER
"D M=CHP"

do i=1 to queued()
 pull line
 if pos("OFFLINE",line) > 0 then
    say "PATH OFFLINE ->" line
end