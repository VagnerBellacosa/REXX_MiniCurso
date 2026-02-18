/* ============================================================ */
/*  SMF70 TOP 10 CPU INTERVALS                                 */
/*  Bellacosa Mainframe Edition                                 */
/* ============================================================ */

PARSE ARG DSN LPAR_FILTER .
IF DSN = '' THEN DO
   SAY 'Uso: EXEC SMF70TOP10 dataset.smf [LPAR]'
   EXIT 8
END

ADDRESS TSO "ALLOC F(SMFDD) DA('"DSN"') SHR REUSE"
ADDRESS TSO "EXECIO * DISKR SMFDD (STEM REC. FINIS)"

COUNT = 0

DO I = 1 TO REC.0

   R = REC.I

   /* Verificar tipo SMF */
   RTYPE = C2D(SUBSTR(R,3,1))
   IF RTYPE ¬= 70 THEN ITERATE

   /* Nome LPAR (offset exemplo) */
   LPAR = STRIP(SUBSTR(R,41,8))

   IF LPAR_FILTER ¬= '' THEN
      IF LPAR ¬= LPAR_FILTER THEN ITERATE

   /* Data e Hora (offset exemplo) */
   DATE = C2D(SUBSTR(R,11,4))
   TIME = C2D(SUBSTR(R,15,4))

   /* CPU total time (offset exemplo) */
   CPU_RAW = SUBSTR(R,101,8)
   CPU_TIME = C2D(CPU_RAW)

   COUNT = COUNT + 1

   DATA.COUNT = DATE
   HORA.COUNT = TIME
   LPARA.COUNT = LPAR
   CPU.COUNT = CPU_TIME

END

/* ------------------------------------------------ */
/* Ordenar decrescente por CPU                     */
/* ------------------------------------------------ */

DO I = 1 TO COUNT-1
   DO J = I+1 TO COUNT
      IF CPU.J > CPU.I THEN DO
         CALL SWAP I J
      END
   END
END

/* ------------------------------------------------ */
/* Exibir Top 10                                   */
/* ------------------------------------------------ */

SAY "==============================================="
SAY " TOP 10 MAIORES CONSUMOS SMF 70 "
SAY "==============================================="

LIMIT = 10
IF COUNT < 10 THEN LIMIT = COUNT

DO I = 1 TO LIMIT
   SAY I") LPAR:" LPARA.I,
       "CPU:" CPU.I,
       "DATE:" DATA.I,
       "TIME:" HORA.I
END

SAY "==============================================="
SAY "Total registros analisados:" COUNT
SAY "==============================================="

EXIT 0


/* ------------------ */
/* Rotina de troca    */
/* ------------------ */
SWAP:
   PARSE ARG A B

   TEMP = CPU.A
   CPU.A = CPU.B
   CPU.B = TEMP

   TEMP = DATA.A
   DATA.A = DATA.B
   DATA.B = TEMP

   TEMP = HORA.A
   HORA.A = HORA.B
   HORA.B = TEMP

   TEMP = LPARA.A
   LPARA.A = LPARA.B
   LPARA.B = TEMP

RETURN
