/* REXX */
/* HOST COMMANDS + ERROR HANDLING */

ADDRESS TSO

/* USUARIO LOGADO */
userid = SYSVAR(SYSUID)

SAY "===================================="
SAY " EXEC REXX DE AUTOMACAO OPERACIONAL "
SAY "===================================="

SAY "Usuario logado : " userid
SAY ""

/* ---------------------------------- */
/* LISTCAT */
/* ---------------------------------- */

cmd = "LISTCAT LEVEL("userid")"

SAY "Executando:"
SAY cmd
SAY ""

cmd

IF RC = 0 THEN DO
   SAY "LISTCAT executado com sucesso"
END
ELSE DO
   SAY "Erro no LISTCAT"
   SAY "RC = " RC
END

SAY "------------------------------------"

/* ---------------------------------- */
/* PROFILE */
/* ---------------------------------- */

SAY "Mostrando PROFILE..."

"PROFILE"

IF RC = 0 THEN
   SAY "PROFILE executado com sucesso"
ELSE
   SAY "Erro ao executar PROFILE"

SAY "------------------------------------"

/* ---------------------------------- */
/* TIME */
/* ---------------------------------- */

SAY "Mostrando horario do sistema..."

"TIME"

IF RC <> 0 THEN
   SAY "Erro ao executar TIME"

SAY "------------------------------------"

/* ---------------------------------- */
/* LISTA CATALOGADA */
/* ---------------------------------- */

SAY "Datasets encontrados:"
SAY ""

"LISTCAT LEVEL("userid") ALL"

IF RC <> 0 THEN DO
   SAY "Erro ao listar datasets"
   SAY "RC = " RC
END

SAY "------------------------------------"

/* ---------------------------------- */
/* FINAL */
/* ---------------------------------- */

SAY "EXEC finalizado"
SAY "RC FINAL = " RC

EXIT