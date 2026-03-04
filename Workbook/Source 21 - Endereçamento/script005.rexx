/* SYSASPACE */

ADDRESS TSO
"STATUS"

syslist = "MASTER JES2 SMF LLA VLF XCF GRS"

say "SYSTEM ADDRESS SPACES"

do i=1 to queued()
 pull line
 parse var line jobname .
 if pos(jobname,syslist) > 0 then
    say jobname
end