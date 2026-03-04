/* IOSHEALTH */

say "IOS HEALTH CHECK"

ADDRESS OPER "D IOS,CONFIG"
do i=1 to queued()
 pull line
 say line
end

ADDRESS OPER "D M=CHP"
do i=1 to queued()
 pull line
 say line
end