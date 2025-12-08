/*REXX*/
/*                                                     */

Say 'Digite sua idade'

/* atencao mainframe usa o EBCDIC logo ira converter para maiuscula */
/* O que você digitar como sua idade será convertido em letras      */
/* maiúsculas                                                       */

Pull idade

Say 'Digite seu nome e sobrenome'

/* O REXX assume que as variáveis são
delimitadas por espaços */

Pull fname fsobrenome fcomp

say ' ola ' || fname || ' ' || fsobrenome  ' idade ' ||   idade

say fname
say fsobrenome
say fcomp
say fcomp2
