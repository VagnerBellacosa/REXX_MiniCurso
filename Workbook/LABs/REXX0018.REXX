/* REXX */
do forever
   say "Expr ou EXIT:"
   parse pull linha

   if linha="exit" then leave

   interpret "res="linha
   say res
end