/* ============================================================ */
/*  REXX - R4HA Analyzer - Bellacosa Mainframe Edition        */
/*  Leitura SMF 70 e cálculo de pico Rolling 4 Hour Average   */
/* ============================================================ */

PARSE ARG DSN .
IF DSN = '' THEN DO
   SAY 'Uso: EXEC R4HA dataset.smf.convertido'
   EXIT 8
END

ADDRESS TSO "ALLOC F(SMFDD) DA('"DSN"') SHR REUSE"
ADDRESS TSO "EXECIO * DISKR SMFDD (STEM SMF. FINIS)"

INTERVALS = 48
MAX_R4HA  = 0
WINDOWSUM = 0

COUNT = SMF.0

/* ------------------------------------------------------------ */
/* Carregar valores em array                                   */
/* ------------------------------------------------------------ */

DO I = 1 TO COUNT
   PARSE VAR SMF.I DATE TIME CPUSEC
   CPU.I = CPUSEC
END

/* ------------------------------------------------------------ */
/* Cálculo Rolling 4-Hour Average                              */
/* ------------------------------------------------------------ */

DO I = 1 TO COUNT
   WINDOWSUM = 0

   IF I + INTERVALS - 1 > COUNT THEN LEAVE

   DO J = I TO I + INTERVALS - 1
      WINDOWSUM = WINDOWSUM + CPU.J
   END

   R4HA = WINDOWSUM / INTERVALS

   IF R4HA > MAX_R4HA THEN DO
      MAX_R4HA = R4HA
      PEAK_POS = I
   END
END

SAY "==========================================="
SAY " MAIOR R4HA ENCONTRADO:"
SAY " Posição Inicial: " PEAK_POS
SAY " Valor Médio CPU: " MAX_R4HA
SAY "==========================================="

EXIT 0
