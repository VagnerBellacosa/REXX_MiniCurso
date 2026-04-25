/* REXX */
do forever
   say "Digite números ou EXIT:"
   parse pull a b

   if a="exit" then leave

   if datatype(a,"N")=0 | datatype(b,"N")=0 then do
      say "Erro: não numérico"
      iterate
   end

   say time() date()
   say a+b
end