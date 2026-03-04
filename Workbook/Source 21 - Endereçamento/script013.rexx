/* SYSOVERVIEW */

say "SYSTEM OVERVIEW"
say "---------------"

ADDRESS OPER
"D A,L"

do i=1 to queued()
 pull line
 say line
end