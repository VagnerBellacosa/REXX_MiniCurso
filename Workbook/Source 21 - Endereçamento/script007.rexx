/* DEVICECHK */

ADDRESS OPER
"D U,,ONLINE"

say "DEVICE CHECK"

do i=1 to queued()
 pull line

 if pos("OFFLINE",line) > 0 then
    say "OFFLINE ->" line

 if pos("BOXED",line) > 0 then
    say "BOXED ->" line

end