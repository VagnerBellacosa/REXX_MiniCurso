/* VTOCCHK */

ADDRESS TSO
"LISTCAT LEVEL(*)"

do i=1 to queued()
 pull line
 say line
end