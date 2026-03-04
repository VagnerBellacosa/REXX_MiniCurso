/* REXX */
/*------------------------------------------------------------------*/
/* LISTADDR - Lista Address Spaces ativos no z/OS                   */
/* Mostra informações úteis para análise de addressability          */
/*------------------------------------------------------------------*/

ADDRESS TSO

"STATUS"

say " "
say "=========================================================="
say "        LISTA DE ADDRESS SPACES ATIVOS (z/OS)             "
say "=========================================================="
say " "

do i = 1 to queued()

    pull line

    if pos("ASID",line) > 0 then iterate

    parse var line jobname asid type . 

    if jobname <> "" then
        say "JOB:" jobname " ASID:" asid " TYPE:" type

end

say " "
say "Total de registros analisados:" queued()

exit