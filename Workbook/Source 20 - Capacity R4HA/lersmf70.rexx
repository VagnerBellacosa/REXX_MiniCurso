/* ============================================================ */
/*  R4HA SMF70 Analyzer - Bellacosa Advanced Edition           */
/* ============================================================ */

PARSE ARG DSN LPAR_FILTER .
IF DSN = '' THEN DO
   SAY 'Uso: EXEC R4HA dataset.smf [LPAR]'
   EXIT 8
END

ADDRESS TSO "ALLOC F(SMFDD) DA('"DSN"') SHR REUSE"
ADDRESS TSO "EXECIO * DISKR SMFDD (STEM REC. FINIS)"

INTERVALS = 48
MAX_R4HA  = 0
COUNT     = 0

DO I = 1 TO REC.0

   R = REC.I

   /* Verificar se é SMF tipo 70 */
   RTYPE = C2D(SUBSTR(R,3,1))
   IF RTYPE ¬= 70 THEN ITERATE

   /* Nome LPAR - Offset aproximado */
   LPAR = STRIP(SUBSTR(R,41,8))

   IF LPAR_FILTER ¬= '' THEN
      IF LPAR ¬= LPAR_FILTER THEN ITERATE

   /* CPU total time - offset exemplo */
   CPU_HEX = SUBSTR(R,101,8)
   CPU_TIME = C2D(CPU_HEX)

   COUNT = COUNT + 1
   CPU.COUNT = CPU_TIME

END

/* ------------------------------- */
/* Calcular Rolling 4 Hour Average */
/* ------------------------------- */

DO I = 1 TO COUNT

   IF I + INTERVALS - 1 > COUNT THEN LEAVE

   SUM = 0

   DO J = I TO I + INTERVALS - 1
      SUM = SUM + CPU.J
   END

   R4HA = SUM / INTERVALS

   IF R4HA > MAX_R4HA THEN DO
      MAX_R4HA = R4HA
      PEAK_POS = I
   END

END

SAY "===================================="
SAY "LPAR analisada: " LPAR_FILTER
SAY "Maior R4HA encontrado:"
SAY MAX_R4HA
SAY "Posição inicial do pico:" PEAK_POS
SAY "===================================="

EXIT 0
