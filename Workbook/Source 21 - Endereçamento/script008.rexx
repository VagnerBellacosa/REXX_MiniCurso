/* CHPATH */

ADDRESS OPER
"D M=CHP"

say "CHANNEL PATH STATUS"

do i=1 to queued()
 pull line
 say line
end