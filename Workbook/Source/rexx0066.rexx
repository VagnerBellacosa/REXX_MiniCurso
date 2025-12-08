/*REXX*/
/*                                                     */
/* exemplo de funcao time() hora do sistema            */
/*                                                     */

PARSE ARG custo taxa

/* Adiciona a taxa no custo */
total = custo + (custo * taxa)

/* Arredonda e remove casas decimais adicionais */
preco = ((total * 100 + .5) % 1) / 100

SAY 'Seu cuto total eh $'||preco||'.'
