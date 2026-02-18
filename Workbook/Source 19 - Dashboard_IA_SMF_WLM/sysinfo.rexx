/* REXX */

/* REXX **************************************************************/
/* PROGRAM NAME : SYSINFO DISPLAY                                   */
/* DESCRIPTION  : EXIBE TELA COM INFORMACOES BASICAS DO SISTEMA	    */
/*                                                                  */
/* AUTHOR       : Vagner Bellacosa                                  */
/* AREA         : Mainframe Education LAB                           */
/* COMPANY      : BELLACOSA MAINFRAME                               */
/* CREATED ON   : 15/12/2025                                        */
/* VERSION      : 1.0                                               */
/*                                                                  */
/* ================================================================ */
/* CHANGE HISTORY                                                   */
/* ---------------------------------------------------------------  */
/* 1.0  15/12/2025  Initial version                                 */
/* ================================================================ */
/*                                                                  */


/* SYSINFOZ - System Information Dashboard */
/* Bellacosa Mode 😎 */

address tso

say "==============================================="
say "        Z/OS SYSTEM INFORMATION DASHBOARD      "
say "==============================================="

/* ========================= */
/* USER E SESSÃO            */
/* ========================= */

userid = userid()
say "User ID           :" userid

address tso "WHO"
address tso "LISTUSER "userid""

/* ========================= */
/* VERSÃO DO Z/OS           */
/* ========================= */

say ""
say "---- z/OS Version ----"
address tso "D IPLINFO"

/* ========================= */
/* CPU INFO                 */
/* ========================= */

say ""
say "---- CPU Information ----"
address tso "D M=CPU"

/* ========================= */
/* LPAR INFO                */
/* ========================= */

say ""
say "---- LPAR Information ----"
address tso "D M=STATUS"

/* ========================= */
/* TCP/IP STATUS            */
/* ========================= */

say ""
say "---- TCP/IP Status ----"
address tso "NETSTAT HOME"
address tso "NETSTAT DEV"

/* ========================= */
/* OMVS INFO                */
/* ========================= */

say ""
say "---- OMVS Info ----"
address tso "BPXBATCH SH uname -a"
address tso "BPXBATCH SH hostname"

/* ========================= */
/* STORAGE INFO             */
/* ========================= */

say ""
say "---- Storage Info ----"
address tso "D ASM"

/* ========================= */
/* WLM INFO                 */
/* ========================= */

say ""
say "---- WLM Status ----"
address tso "D WLM"

/* ========================= */
/* JES Info                 */
/* ========================= */

say ""
say "---- JES Info ----"
address tso "D JES2"

/* ========================= */

say ""
say "==============================================="
say "            END OF SYSTEM REPORT              "
say "==============================================="

exit 0
