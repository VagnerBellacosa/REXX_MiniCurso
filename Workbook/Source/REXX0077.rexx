/*REXX*/
/*                                                     */
/* EXEMPLO de programa funcao maximo                   */
/*                                                     */

SAY 'Digite o primeiro numero :'
PULL CTNUM1

SAY 'Digite o segundo numero  :'
PULL CTNUM2

SAY 'Digite o terceiro numero :'
PULL CTNUM3

IF DATATYPE(CTNUM1,'N') = 0 THEN
 DO
   SAY ' ERRO '
   VALOR_RETORNO = 3
 END
ELSE
  IF DATATYPE(CTNUM2,'N') = 0 THEN
   DO
     SAY ' ERRO '
     VALOR_RETORNO = 2
   END
  ELSE
    IF DATATYPE(CTNUM3,'N') = 0 THEN
      DO
       SAY ' ERRO '
       VALOR_RETORNO = 1
      END
    ELSE
      DO
       GREAT = VALUES(CTNUM1, CTNUM2, CTNUM3)

       SAY 'O maior numero e : '  || GREAT
       VALOR_RETORNO = 0
      END

EXIT VALOR_RETORNO

VALUES:

MAIOR=0

IF CTNUM1 > CTNUM2 THEN
    IF CTNUM1 > CTNUM3 THEN
        MAIOR=CTNUM1
    ELSE
        MAIOR=CTNUM3
ELSE
    IF CTNUM2 > CTNUM3 THEN
        MAIOR=CTNUM2
    ELSE
        MAIOR=CTNUM3

RETURN MAIOR

