/* XCFSTATUS */

ADDRESS OPER
"D XCF,STR"

do i=1 to queued()
 pull line
 say line
end