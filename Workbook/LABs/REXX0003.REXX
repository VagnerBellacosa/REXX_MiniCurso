/* REXX */
parse arg a b

if a = "" | b = "" then do
   say "Digite dois números:"
   parse pull a b
end

say "Você digitou:" a b

say a "+" b "=" a + b
say a "-" b "=" a - b
say a "*" b "=" a * b

if b = 0 then
   say "Divisão não pode ser feita"
else do
   say a "/" b "=" a / b
   say a "dividido por" b "é" a % b "resto" a // b
end