/* REXX */
do forever
   say "Op:"
   parse pull op

   op = abbrev("ADD",op) | abbrev("SUB",op) | abbrev("MUL",op) | abbrev("DIV",op)

   say op
end