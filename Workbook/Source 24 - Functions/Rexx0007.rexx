/* REXX */
/* THE PARSE INSTRUCTION */

SAY "=== EXEMPLOS DE PARSE ==="

texto = "DB2 CICS IMS JES2"

PARSE VAR texto subs1 subs2 subs3 subs4

SAY "Subsistema 1 = " subs1
SAY "Subsistema 2 = " subs2
SAY "Subsistema 3 = " subs3
SAY "Subsistema 4 = " subs4

SAY "--------------------------------"

/* PARSE ARG */

ARGUMENTO = "JOB1234 ABEND S0C7"

PARSE VAR ARGUMENTO job status codigo

SAY "JOB    = " job
SAY "STATUS = " status
SAY "CODIGO = " codigo

SAY "--------------------------------"

/* PARSE COM DELIMITADOR */

registro = "VAGNER;MAINFRAME;ZOS"

PARSE VAR registro nome ";" area ";" sistema

SAY "Nome    = " nome
SAY "Area    = " area
SAY "Sistema = " sistema

SAY "=== FIM ==="

EXIT
