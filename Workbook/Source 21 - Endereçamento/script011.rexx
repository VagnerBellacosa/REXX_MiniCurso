/* PATHIMBAL */

ADDRESS OPER
"D M=CHP"

say "CHECKING CHANNEL PATHS"

do i=1 to queued()
 pull line

 if pos("OFFLINE",line) > 0 then
    say "ALERT PATH OFFLINE ->" line

end