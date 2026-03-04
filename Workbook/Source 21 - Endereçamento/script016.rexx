/* IOSCONFIG */

ADDRESS OPER
"D IOS,CONFIG"

say "IOS CONFIGURATION"

do i=1 to queued()
 pull line
 say line
end