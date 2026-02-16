/* REXX */

/*------------------------------------------------------------------*/
/* SPOOLWATCH - Monitor de Crescimento do Spool JES2               */
/*------------------------------------------------------------------*/

ADDRESS SDSF

isfcols = "PERCENT USED FREE"

"ISFEXEC SP"

if rc <> 0 then do
   say "Erro ao acessar painel SP (Spool)."
   exit 8
end

rows = isfrows

if rows = 0 then do
   say "Sem dados de spool."
   exit 4
end

/* Assume primeira linha consolidada */
percent_used = strip(percent.1,"%")
used_tracks  = used.1
free_tracks  = free.1

total_tracks = used_tracks + free_tracks

date = date("S")
time = time("N")

/* Dataset histórico */
histdsn = "'SYS1.SPOOL.HISTORY'"

address tso
"ALLOC F(HISTDD) DA("histdsn") MOD REUSE"

line = date time "USED="percent_used"%" ,
       "USEDTRK="used_tracks ,
       "FREETRK="free_tracks

"EXECIO 1 DISKW HISTDD (STRING line)"
"FREE F(HISTDD)"

/* Análise básica */

say "========================================="
say "        SPOOL STATUS"
say "========================================="
say "Data:" date time
say "Uso atual:" percent_used"%"
say "Tracks usados:" used_tracks
say "Tracks livres:" free_tracks

if percent_used > 85 then
   say "⚠ ALERTA CRITICO: Spool acima de 85%"
else if percent_used > 70 then
   say "⚠ Atenção: Spool em crescimento"
else
   say "✔ Spool saudável"

say "========================================="

exit 0