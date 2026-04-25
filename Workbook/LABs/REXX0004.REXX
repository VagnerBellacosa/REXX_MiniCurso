/* REXX */
say "Operação (add/sub/mul/div):"
parse pull op

say "Digite dois números:"
parse pull a b

select
  when op = "add" then say a+b
  when op = "sub" then say a-b
  when op = "mul" then say a*b
  when op = "div" then do
       if b = 0 then say "Erro"
       else say a/b
  end
  otherwise say "Operação inválida"
end