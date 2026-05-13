/* REXX */
/* READING AND WRITING DATASETS */

ADDRESS TSO

dsn = "'USERID.REXX.TESTE'"

SAY "=== ESCRITA NO DATASET ==="

/* DADOS */
linha.1 = "REGISTRO 001"
linha.2 = "REGISTRO 002"
linha.3 = "REGISTRO 003"

linha.0 = 3

/* ALLOC */
"ALLOC FI(ARQOUT) DA("dsn") SHR REUSE"

/* ESCREVER */
"EXECIO" linha.0 "DISKW ARQOUT (STEM linha. FINIS"

IF RC = 0 THEN
   SAY "Gravacao realizada com sucesso"
ELSE
   SAY "Erro na gravacao RC=" RC

SAY "--------------------------------"

SAY "=== LEITURA DO DATASET ==="

/* LEITURA */
"ALLOC FI(ARQIN) DA("dsn") SHR REUSE"

"EXECIO * DISKR ARQIN (STEM leitura. FINIS"

IF RC = 0 THEN DO
   DO i = 1 TO leitura.0
      SAY leitura.i
   END
END
ELSE
   SAY "Erro na leitura RC=" RC

"FREE FI(ARQOUT)"
"FREE FI(ARQIN)"

SAY "=== FIM ==="

EXIT