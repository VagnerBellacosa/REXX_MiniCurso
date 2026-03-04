/* IOSDEV */

ADDRESS OPER
"D M=DEV"

say "DEVICE STATUS"

do i=1 to queued()
 pull line
 say line
end