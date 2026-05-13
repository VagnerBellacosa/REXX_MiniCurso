/* REXX */
/* COMPOUND VARIABLES AND DATA STACK */

SAY "=== COMPOUND VARIABLES ==="

/* ARRAY DINAMICO */
usuarios.1 = "VAGNER"
usuarios.2 = "CARLOS"
usuarios.3 = "MARCOS"

usuarios.0 = 3

DO i = 1 TO usuarios.0
   SAY "Usuario" i ":" usuarios.i
END

SAY "--------------------------------"

/* DATA STACK */

SAY "Empilhando dados..."

PUSH "JOB001 EXECUTANDO"
PUSH "JOB002 ABEND S0C7"
PUSH "JOB003 FINALIZADO"

SAY "Desempilhando dados..."

DO 3
   PULL linha
   SAY linha
END

SAY "=== FIM ==="

EXIT