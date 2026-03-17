/* REXX */

/* DB2LIST  Lista todos os SUBSYSTEM-ID do Db2 presentes na LPAR
   Tecnicas utilizadas:
     - Varredura de mÏdulos SSDP:  DSN?SSDP
     - Validacao do mÏdulo via LINKPGM
     - Extracao do SSID de cada mÏdulo (bytes 17-20)
   --------------------------------------------------------------- */
parse source . . myname .
say ">>> " myname " - Listando Subsystems Db2 encontrados na LPAR"
say " "

call list_subsystems

exit 0

/*******************************************************************/
/* ROTINA PRINCIPAL                                                */
/*******************************************************************/
list_subsystems: procedure
   ssids. = ""
   count = 0
   /* Procurar mÏdulos no padrüo DSN?SSDP (DSN1SSDP, DSN2SSDP...) */
   /* DSND10.SDSNLOAD */
   /* DSNCD10  */
   say "Varredura de modulos padrao: DSN?SSDP"
   say "-----------------------------------------------------------"

   do i = '0' to '9'
      modname = 'DSN'i'SSDP'
      found = check_module(modname)
      if found = 1 then do
         ssid = extract_ssid(modname)
         if ssid <> "" then do
            count = count + 1
            ssids.count = ssid
            say "  - Encontrado subsystem: " ssid " (via "modname")"
         end
      end
   end

   if count = 0 then do
      say "Nenhum subsystem encontrado via modulos SSDP."
      return
   end
   say " "
   say "-----------------------------------------------------------"
   say "SUBSYSTEMS IDENTIFICADOS:"
   say "-----------------------------------------------------------"
   do i = 1 to count
      say "  -> " ssids.i
   end
   return

/*******************************************************************/
/* TESTA SE UM M‰DULO EXISTE NA LPA                                */
/*******************************************************************/
check_module: procedure
   parse arg mod
   address linkpgm mod "NOPARM"
   if rc = 0 then return 1
   return 0

/*******************************************************************/
/* EXTRAI O SSID DE UM M‰DULO SSDP                                 */
/*******************************************************************/
extract_ssid: procedure
   parse arg mod
   /* ›rea para receber os 4 bytes do SSID */
   ssidbuf = copies(' ', 4)
   address linkpgm mod "SSID" ssidbuf
   if rc <> 0 then return ""
   ssid = strip(ssidbuf)
   return ssid
