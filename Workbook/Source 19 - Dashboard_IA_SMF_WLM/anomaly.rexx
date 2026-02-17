/* REXX */
/* Automatic CPU Anomaly Detector */
/* Bellacosa Mode 💣 */

histdsn = "'USER.CPU.HIST'"

address tso

say "==========================================="
say "        CPU ANOMALY DETECTOR              "
say "==========================================="

/* ============================= */
/* Capturar CPU atual            */
/* ============================= */

address tso "ALLOC FI(CMDOUT) DA('&&CPUTMP') NEW DELETE SPACE(1,1) TRACKS RECFM(VB) LRECL(255)"
address tso "D M=CPU"

/* ⚠️ Aqui simplificado: substitua por parsing real */
say "Digite CPU atual (%):"
pull cpu_now
cpu_now = cpu_now + 0

say "CPU Atual:" cpu_now "%"

/* ============================= */
/* Ler histórico                 */
/* ============================= */

if sysdsn(histdsn) <> "OK" then do
   say "Criando dataset histórico..."
   address tso "ALLOC DA("histdsn") NEW SPACE(1,1) TRACKS RECFM(FB) LRECL(10)"
end

address tso "ALLOC FI(HIST) DA("histdsn") SHR"
address tso "EXECIO * DISKR HIST (STEM H. FINIS"

count = H.0

if count = 0 then do
   say "Sem histórico suficiente."
   mean = cpu_now
   stddev = 0
end
else do

   sum = 0
   do i = 1 to count
      sum = sum + H.i
   end

   mean = sum / count

   variance = 0
   do i = 1 to count
      variance = variance + (H.i - mean) ** 2
   end

   variance = variance / count
   stddev = sqrt(variance)

end

say "-------------------------------------------"
say "Média histórica :" format(mean,5,2)
say "Desvio padrão   :" format(stddev,5,2)
say "-------------------------------------------"

/* ============================= */
/* Detectar anomalia             */
/* ============================= */

threshold = mean + (2 * stddev)

if cpu_now > threshold then do
   say "💣 ANOMALIA DETECTADA!"
   say "CPU acima do limiar:" format(threshold,5,2)
end
else do
   say "CPU dentro do padrão."
end

/* ============================= */
/* Atualizar histórico           */
/* ============================= */

address tso "ALLOC FI(HIST) DA("histdsn") MOD"
address tso "EXECIO 1 DISKW HIST (STRING '"cpu_now"') FINIS"

say "Histórico atualizado."

say "==========================================="
exit 0

