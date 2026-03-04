/* REXX */
/*------------------------------------------------------------------*/
/* IOSHELP - Diagnóstico rápido de I/O Supervisor (IOS)             */
/* Autor: Sysprog Toolkit                                           */
/*------------------------------------------------------------------*/

ADDRESS OPER

say " "
say "======================================================"
say "        IOS SUPERVISOR QUICK DIAGNOSTIC TOOL          "
say "======================================================"
say " "

/* ----------------------------------------------------- */
/* IOS CONFIGURATION                                     */
/* ----------------------------------------------------- */

say ">>> Verificando configuração IOS"
"DISPLAY IOS,CONFIG"

do i=1 to queued()
  pull line
  say line
end

say " "

/* ----------------------------------------------------- */
/* CHANNEL PATH STATUS                                   */
/* ----------------------------------------------------- */

say ">>> Verificando Channel Paths (CHPID)"
"DISPLAY M=CHP"

do i=1 to queued()
  pull line
  say line
end

say " "

/* ----------------------------------------------------- */
/* DEVICE STATUS                                         */
/* ----------------------------------------------------- */

say ">>> Verificando Devices Online"
"DISPLAY U,,ONLINE"

do i=1 to queued()
  pull line
  say line
end

say " "

/* ----------------------------------------------------- */
/* DEVICE ERRORS                                         */
/* ----------------------------------------------------- */

say ">>> Procurando dispositivos OFFLINE ou em erro"

"DISPLAY M=DEV"

do i=1 to queued()
  pull line

  if pos("OFFLINE",line) > 0 then
     say "ALERTA DEVICE OFFLINE ->" line

  if pos("BOXED",line) > 0 then
     say "DEVICE BOXED ->" line

  if pos("ERROR",line) > 0 then
     say "DEVICE ERROR ->" line

end

say " "

say "======================================================"
say "Diagnóstico IOS finalizado"
say "======================================================"

exit