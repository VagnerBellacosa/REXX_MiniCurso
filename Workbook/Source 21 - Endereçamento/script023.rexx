/* IODFSTATUS */

ADDRESS OPER
"D IOS,CONFIG"

do i=1 to queued()
 pull line
 if pos("IODF",line) > 0 then
    say line
end