/* VOLCHECK */

ADDRESS OPER
"D SMS,VOL"

say "ACTIVE VOLUMES"

do i=1 to queued()
 pull line
 say line
end