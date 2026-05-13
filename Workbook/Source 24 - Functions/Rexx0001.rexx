/* REXX */
/* FUNCTIONS AND SUBROUTINES */

SAY "=== INICIO DO PROGRAMA ==="

nome = "Bellacosa Mainframe"

resultado = Maiusculo(nome)

SAY "Texto original : " nome
SAY "Texto convertido: " resultado

CALL Linha

CALL Saudacao "Vagner"

SAY "=== FIM DO PROGRAMA ==="
EXIT

/* --------------------------- */
/* FUNCTION */
/* --------------------------- */

Maiusculo:
   PARSE ARG texto
   RETURN TRANSLATE(texto)

/* --------------------------- */
/* SUBROUTINE */
/* --------------------------- */

Linha:
   SAY "--------------------------------------"
RETURN

Saudacao:
   PARSE ARG usuario
   SAY "Bem-vindo ao mundo REXX, " usuario
RETURN