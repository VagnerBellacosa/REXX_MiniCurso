/* REXX */
/* DEBUGGING AND ERROR HANDLING */

SIGNAL ON ERROR
SIGNAL ON NOVALUE

SAY "=== TESTE DE DEBUG ==="

valor1 = 100
valor2 = 0

SAY "Valor1 = " valor1
SAY "Valor2 = " valor2

/* ERRO INTENCIONAL */
resultado = valor1 / valor2

SAY "Resultado = " resultado

EXIT

/* --------------------------- */
/* TRATAMENTO DE ERRO */
/* --------------------------- */

ERROR:
   SAY "!!! ERRO DETECTADO !!!"
   SAY "Codigo RC = " RC
   SAY "Linha      = " SIGL
   SAY "Fonte      = " SOURCELINE(SIGL)
EXIT 8

/* --------------------------- */
/* VARIAVEL NAO DEFINIDA */
/* --------------------------- */

NOVALUE:
   SAY "Variavel nao inicializada detectada!"
   SAY "Linha = " SIGL
EXIT 12