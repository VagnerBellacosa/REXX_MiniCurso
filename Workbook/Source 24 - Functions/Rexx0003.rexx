/* REXX */
/* EXECUTING HOST COMMANDS */

ADDRESS TSO

SAY "=== EXECUTANDO COMANDOS HOST ==="

/* LISTAR DATASETS */
"LISTCAT LEVEL(USERID)"

IF RC <> 0 THEN DO
   SAY "Erro ao executar LISTCAT"
   SAY "RC = " RC
END
ELSE DO
   SAY "LISTCAT executado com sucesso"
END

SAY "--------------------------------"

/* MOSTRAR USUARIO LOGADO */
"PROFILE"

IF RC = 0 THEN
   SAY "PROFILE executado com sucesso"

SAY "=== FIM ==="

EXIT