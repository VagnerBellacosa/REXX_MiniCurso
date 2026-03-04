/* CHANHEALTH */

ADDRESS OPER
"D M=CHP"

say "CHANNEL HEALTH"

do i=1 to queued()
 pull line
 say line
end