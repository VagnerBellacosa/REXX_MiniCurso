/* rexx */

/* Cancelar job problemático (com cuidado!) */

PARSE ARG JOBNAME

ADDRESS TSO "CONSOLE 'C "JOBNAME"'"