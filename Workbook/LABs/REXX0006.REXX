/* REXX */
do forever
   say "Operação ou EXIT:"
   parse pull op

   if op = "exit" then leave

   if op ¬= "add" & op ¬= "sub" & op ¬= "mul" & op ¬= "div" then do
      say "Inválido"
      iterate
   end

   say "Digite números:"
   parse pull a b

   select
     when op="add" then say a+b
     when op="sub" then say a-b
     when op="mul" then say a*b
     when op="div" then if b=0 then say "Erro"; else say a/b
   end
end