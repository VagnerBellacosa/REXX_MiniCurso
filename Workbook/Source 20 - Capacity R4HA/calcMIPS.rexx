/* ============================================================ */
/*  SMF70 MIPS Calculator - Bellacosa Edition                  */
/* ============================================================ */

PARSE ARG DSN NOMINAL_MIPS LPAR_FILTER .

IF DSN = '' | NOMINAL_MIPS = '' THEN DO
   SAY 'Uso: EXEC SMF70MIPS dataset.smf MIPS_NOMINAL [LPAR]'
   SAY 'Exemplo: EXEC SMF70MIPS SMF.DUMP 1500 PRD1'
   EXIT 8
END

INTERVAL_SEC = 300   /* Intervalo típico 5 minutos */

ADDRESS TSO "ALLOC F(SMFDD) DA('"DSN"') SHR REUSE"
ADDRESS TSO "EXECIO * DISKR SMFDD (STEM REC. FINIS)"

MAX_MIPS = 0
COUNT = 0

DO I = 1 TO REC.0

   R = REC.I

   /* Verifica tipo 70 */
   RTYPE = C2D(SUBSTR(R,3,1))
   IF RTYPE ¬= 70 THEN ITERATE

   /* Nome LPAR (offset exemplo) */
   LPAR = STRIP(SUBSTR(R,41,8))

   IF LPAR_FILTER ¬= '' THEN
      IF LPAR ¬= LPAR_FILTER THEN ITERATE

   /* CPU total time (offset exemplo) */
   CPU_RAW = SUBSTR(R,101,8)
   CPU_TIME = C2D(CPU_RAW)

   /* Utilização */
   UTIL = CPU_TIME / INTERVAL_SEC

   /* MIPS estimado */
   MIPS_USED = UTIL * NOMINAL_MIPS

   COUNT = COUNT + 1

   IF MIPS_USED > MAX_MIPS THEN DO
      MAX_MIPS = MIPS_USED
      PEAK_REC = COUNT
      PEAK_LPAR = LPAR
   END

END

SAY "==============================================="
SAY "MIPS NOMINAL INFORMADO:" NOMINAL_MIPS
SAY "MAIOR MIPS UTILIZADO:" MAX_MIPS
SAY "LPAR DO PICO:" PEAK_LPAR
SAY "==============================================="

EXIT 0
