/* REXX */

SDSNLOAD = "'DSND10.SDSNLOAD'"

Address ISPEXEC "LIBDEF ISPLLIB DATASET ID("SDSNLOAD")"

/* DBDG */
Address DSNREXX "CONNECT" "DSN1"

if SQLCODE <> 0 then do
   say "Erro ao conectar. SQLCODE =" SQLCODE
   exit 8
end

say "Conectado ao DB2 DSN1 com sucesso!"

Address DSNREXX "DISCONNECT"
say "Desconectado."
EXIT 0
