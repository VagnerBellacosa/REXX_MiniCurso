/* ============================================================ */
/*  SMF70 MSU + R4HA Analyzer                                  */
/*  Bellacosa Mainframe Edition                                 */
/* ============================================================ */

PARSE ARG DSN NOMINAL_MSU LPAR_FILTER .

IF DSN = '' | NOMINAL_MSU = '' THEN DO
   SAY 'Uso: EXEC SMF70R4HA dataset.smf MSU_NOMINAL [LPAR]'
   EXIT 8
END

INTERVAL_SEC = 300
WINDOW_SIZE  = 48

ADDRESS TSO "ALLOC F(SMFDD) DA('"DSN"') SHR REUSE"
ADDRESS TSO "EXECIO * DISKR SMFDD (STEM REC. FINIS)"

COUNT = 0

/* ------------------------------------------------ */
/* Ler SMF 70 e calcular MSU por intervalo         */
/* ------------------------------------------------ */

DO I = 1 TO REC.0

   R = REC.I

   RTYPE = C2D(SUBSTR(R,3,1))
   IF RTYPE ¬= 70 THEN ITERATE

   LPAR = STRIP(SUBSTR(R,41,8))

   IF LPAR_FILTER ¬= '' THEN
      IF LPAR ¬= LPAR_FILTER THEN ITERATE

   CPU_RAW  = SUBSTR(R,101,8)
   CPU_TIME = C2D(CPU_RAW)

   UTIL = CPU_TIME / INTERVAL_SEC
   MSU_USED = UTIL * NOMINAL_MSU

   COUNT = COUNT + 1
   MSU.COUNT = MSU_USED

END

SAY "Total intervalos processados:" COUNT

/* ------------------------------------------------ */
/* Calcular Rolling 4 Hour Average                 */
/* ------------------------------------------------ */

MAX_R4HA = 0

DO I = 1 TO COUNT

   IF I + WINDOW_SIZE - 1 > COUNT THEN LEAVE

   SUM = 0

   DO J = I TO I + WINDOW_SIZE - 1
      SUM = SUM + MSU.J
   END

   R4HA = SUM / WINDOW_SIZE

   IF R4HA > MAX_R4HA THEN DO
      MAX_R4HA = R4HA
      PEAK_POS = I
   END

END

/* ------------------------------------------------ */
/* Exibir resultados                               */
/* ------------------------------------------------ */

SAY "==============================================="
SAY " MSU NOMINAL DA MÁQUINA:" NOMINAL_MSU
SAY " MAIOR R4HA ENCONTRADO:" MAX_R4HA
SAY " POSIÇÃO INICIAL DA JANELA:" PEAK_POS
SAY "==============================================="

EXIT 0
