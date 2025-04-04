/* REXX */
/* Autor: Bellacosa Mainframe Style */
/* Envia comando ao sistema */

parse arg cmd

Address CONSOLE cmd
if rc <> 0 then exit 8

exit 0