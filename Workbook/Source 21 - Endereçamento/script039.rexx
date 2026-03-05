/* REXX */
/* HyperPAV Pool Analyzer */

ADDRESS TSO

threshold = 20
basecount = 0
aliascount = 0
highiosq = 0

say "------------------------------------"
say "HyperPAV Pool Diagnostic"
say "------------------------------------"

"OUTTRAP OUT."

"CONSOLE D IOS,DEV"

"OUTTRAP OFF"

do i = 1 to OUT.0

   line = OUT.i

   /* detect device */

   if pos("DEV=",line) > 0 then do

      parse var line . "DEV=" dev . "IOSQ=" iosq .

      iosq = strip(iosq)

      if datatype(iosq,"N") then do

         if iosq > threshold then do
            highiosq = highiosq + 1
         end

      end

   end

   /* detect alias */

   if pos("ALIAS",line) > 0 then
      aliascount = aliascount + 1

   if pos("BASE",line) > 0 then
      basecount = basecount + 1

end

say ""
say "Base devices :" basecount
say "Alias devices:" aliascount
say "High IOSQ    :" highiosq
say ""

if highiosq > 5 & aliascount < basecount then do

   say "⚠ WARNING: HyperPAV pool may be undersized"

end
else do

   say "HyperPAV pool appears healthy"

end

say ""
say "------------------------------------"
say "Analysis complete"
say "------------------------------------"

exit