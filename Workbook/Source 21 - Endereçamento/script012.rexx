/* IOSHEALTH */

say "IOS HEALTH CHECK"
say "-----------------"

ADDRESS OPER
"D IOS,CONFIG"

do i=1 to queued()
 pull line
 say line
end

ADDRESS OPER
"D M=CHP"

do i=1 to queued()
 pull line
 say line
end

ADDRESS OPER
"D U,,ONLINE"

do i=1 to queued()
 pull line
 say line
end