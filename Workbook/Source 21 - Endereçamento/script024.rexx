/* DASDSTATUS */

ADDRESS OPER
"D U,DASD"

say "DASD STATUS"

do i=1 to queued()
 pull line
 say line
end