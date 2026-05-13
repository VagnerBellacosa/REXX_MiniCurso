/* REXX */
/* EXECUTING HOST COMMANDS */

ADDRESS TSO

userid = SYSVAR(SYSUID)

SAY "=== EXECUTANDO COMANDOS HOST ==="
SAY "Usuario logado: " userid

/* LISTAR DATASETS */
"LISTCAT LEVEL("userid")"

IF RC <> 0 THEN DO
   SAY "Erro ao executar LISTCAT"
   SAY "RC = " RC
END
ELSE DO
   SAY "LISTCAT executado com sucesso"
END

SAY "--------------------------------"

/* MOSTRAR PROFILE */
"PROFILE"

IF RC = 0 THEN
   SAY "PROFILE executado com sucesso"

SAY "=== FIM ==="

EXIT