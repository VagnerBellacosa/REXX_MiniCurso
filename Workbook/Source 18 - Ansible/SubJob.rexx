/* rexx */

/* REXX - Submit JCL and Check Return Code */

ADDRESS TSO

/* Submeter JCL */
"SUBMIT 'USERID.JCL(COMPILE)'"

IF RC <> 0 THEN DO
   SAY "Erro ao submeter JCL"
   EXIT 8
END

SAY "JCL submetido com sucesso."

/* Esperar processamento */
CALL SLEEP 5

/* Obter lista de jobs */
ADDRESS SDSF
"ISFEXEC ST"

IF RC <> 0 THEN DO
   SAY "Erro ao acessar SDSF"
   EXIT 12
END

DO ix = 1 TO ISFROWS
   jobname = ISFJOBNAME.ix
   retcode = ISFRC.ix

   IF jobname = "COMPILE" THEN DO
      SAY "Job encontrado. RC =" retcode
      
      IF retcode <> "0000" THEN DO
         SAY "Erro na execução!"
         EXIT 16
      END
      ELSE DO
         SAY "Execução OK!"
         EXIT 0
      END
   END
END

SAY "Job não encontrado."
EXIT 4
