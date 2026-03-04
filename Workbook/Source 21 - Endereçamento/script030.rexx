/* CPUSTATUS */

ADDRESS OPER
"D M=CPU"

do i=1 to queued()
 pull line
 say line
end