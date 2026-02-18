/* ============================================================ */
/*  SMF70 MSU Calculator - Bellacosa Mainframe Edition         */
/* ============================================================ */

PARSE ARG DSN NOMINAL_MSU LPAR_FILTER .

IF DSN = '' | NOMINAL_MSU = '' THEN DO
   SAY 'Uso: EXEC SMF70MSU dataset.smf MSU_NOMINAL [LPAR]'
   SAY 'Exemplo: EXEC SMF70MSU SMF.DUMP 1200 PRD1'
   EXIT 8
END

/* Intervalo típico SMF 70 = 5 minutos */
INTERVAL_SEC = 300

ADDRESS TSO "ALLOC F(SMFDD) DA('"DSN"') SHR REUSE"
ADDRESS TSO "EXECIO * DISKR SMFDD (STEM REC. FINIS)"

MAX_MSU = 0
COUNT   = 0

DO I = 1 TO REC.0

   R = REC.I

   /* Verifica se é tipo 70 */
   RTYPE = C2D(SUBSTR(R,3,1))
   IF RTYPE ¬= 70 THEN ITERATE

   /* Nome da LPAR (offset exemplo) */
   LPAR = STRIP(SUBSTR(R,41,8))

   IF LPAR_FILTER ¬= '' THEN
      IF LPAR ¬= LPAR_FILTER THEN ITERATE

   /* CPU total time (offset exemplo) */
   CPU_RAW = SUBSTR(R,101,8)
   CPU_TIME = C2D(CPU_RAW)

   /* Converter se necessário (depende da unidade real do campo) */
   /* Ajuste caso esteja em centésimos ou microssegundos */

   UTIL = CPU_TIME / INTERVAL_SEC

   MSU_USED = UTIL * NOMINAL_MSU

   COUNT = COUNT + 1

   IF MSU_USED > MAX_MSU THEN DO
      MAX_MSU = MSU_USED
      PEAK_LPAR = LPAR
      PEAK_REC  = COUNT
   END

END

SAY "==============================================="
SAY " MSU NOMINAL DA MÁQUINA:" NOMINAL_MSU
SAY " MAIOR MSU UTILIZADO:" MAX_MSU
SAY " LPAR DO PICO:" PEAK_LPAR
SAY "==============================================="

EXIT 0
