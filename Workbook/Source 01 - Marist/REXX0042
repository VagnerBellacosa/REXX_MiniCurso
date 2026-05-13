/* REXX */
/**********************************************************************/
/*          TESTE COMPLETO DE SDSF VIA REXX - BELLACOSA MAINFRAME     */
/*                                                                    */
/*  FUNCOES:                                                          */
/*   ? TESTA SUPORTE A ADDRESS SDSF                                   */
/*   ? TESTA PERMISSAO SDSF.ISFOPER                                   */
/*   ? EXECUTA ST PARA VALIDAR RETORNO                                */
/*   ? EXIBE DETALHAMENTO DOS ERROS                                   */
/*                                                                    */
/*  SA•DAS POSS•VEIS:                                                 */
/*    RC=-3  SDSF API NAO ENCONTRADA / NAO AUTORIZADA                 */
/*    RC= 0  SUCESSO                                                  */
/**********************************************************************/

TRACE OFF
SIGNAL ON ERROR
SIGNAL ON FAILURE

LOGFILE = "TESTSDSF.LOG"

CALL LOG "==== TESTE SDSF ===="
CALL LOG "INICIANDO TESTE AS " DATE() TIME()

/*------------------------------------------------------------------*/
/* 1. TESTANDO SE AMBIENTE SUPORTA ADDRESS SDSF                     */
/*------------------------------------------------------------------*/
CALL LOG "TESTANDO ADDRESS SDSF..."

ADDRESS SDSF "ISFEXEC ST"
RC = RC

IF RC = -3 THEN DO
   SAY "  ERRO: ADDRESS SDSF NAO DISPON•VEL OU NAO AUTORIZADO (RC=-3)"
   SAY "   VERIFIQUE NO RACF:"
   SAY "   - CLASSE FACILITY ATIVA"
   SAY "   - RECURSO SDSF.ISFOPER DEFINIDO"
   SAY "   - PERMISSAO READ PARA SEU USUARIO"
   CALL LOG "RC=-3 ? SDSF INDISPONIVEL OU SEM AUTORIZACAO"
   EXIT 12
END
ELSE IF RC > 0 THEN DO
   SAY "? COMANDO SDSF RETORNOU ERRO: RC="RC
   CALL LOG "ERRO INESPERADO, RC="RC
   EXIT 8
END
CALL LOG "ADDRESS SDSF OK"

/*------------------------------------------------------------------*/
/* 2. TESTANDO RETORNO DAS VARIêVEIS DA ISFEXEC                      */
/*------------------------------------------------------------------*/
IF ISFROWS = "" THEN DO
   SAY "? NENHUM RESULTADO RETORNADO PELO SDSF"
   CALL LOG "NENHUMA LINHA RETORNADA"
   EXIT 8
END

CALL LOG "ISFROWS="ISFROWS

SAY "SDSF RETORNOU "ISFROWS" LINHAS."

/*------------------------------------------------------------------*/
/* 3. EXIBINDO AS PRIMEIRAS 5 LINHAS                                */
/*------------------------------------------------------------------*/
LIMITE = MIN(ISFROWS,5)

SAY "=== PRIMEIRAS "LIMITE" LINHAS ==="

CALL LOG "LISTANDO PRIMEIRAS "LIMITE" LINHAS DE SAIDA"

DO I = 1 TO LIMITE
   LINHA = ISFMSG.I
   IF LINHA = "" THEN LINHA = ISFROW.I
   SAY "? " LINHA
END

SAY ""
SAY "? TESTE OK  ADDRESS SDSF FUNCIONANDO."
CALL LOG "TESTE FINALIZADO COM SUCESSO."

EXIT 0

/*------------------------------------------------------------------*/
/* ROTINA DE LOG                                                    */
/*------------------------------------------------------------------*/
LOG:
  PARSE ARG MSG
  MSG = MSG
  "EXECIO 1 DISKW "LOGFILE" (STEM MSG. FINIS"
RETURN

/*------------------------------------------------------------------*/
/* TRATAMENTO DE ERRO GENERICO                                      */
/*------------------------------------------------------------------*/
ERROR:
FAILURE:
   SAY "? REXX FALHOU: " CONDITION()
   CALL LOG "FALHA: "CONDITION()
EXIT 16

