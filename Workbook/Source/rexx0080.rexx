/*REXX*/
/*                                                     */
/* exemplo de adicao                                   */
/*                                                     */

say 'Digite o primeiro numero'

PULL number1

say 'Digite o segundo numero '

PULL number2

say ' '
say ' '
say ' '

sum = number1 + number2

SAY 'A soma dos dois numeros eh ' || sum || '.'

say ' '
say ' '
say ' '

subtracao = number2 - number1

SAY 'A diferença entre ' || number2 || ' e ' || number1 || ' e ',
subtracao

multip    = number2 * number1
divid     = number2 / number1
expo      = number2 ** number1

say ' o produto da multiplicacao e:' multip
say ' o resultado da divisao e:' divid
say ' o resultado da divisao e:' expo

expo = 'oi'

say expo
