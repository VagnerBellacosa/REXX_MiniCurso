/* STORAGECHECK */

ADDRESS OPER
"D M=STOR"

do i=1 to queued()
 pull line
 say line
end