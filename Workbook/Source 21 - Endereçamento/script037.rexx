/* REXX */
/* IOSQ MONITOR */

ADDRESS TSO

threshold = 20   /* limite de IOSQ em ms */

"ALLOC FI(OUT) DA(*) NEW SPACE(1,1) CYL RECFM(F,B) LRECL(133)"

"OUTTRAP lines."

"CONSOLE D IOS,DEV"

"OUTTRAP OFF"

say "Scanning devices for high IOSQ..."

do i = 1 to lines
   line = lines.i

   /* procura IOSQ na linha */
   posiosq = pos("IOSQ=", line)

   if posiosq > 0 then do
      parse var line . "DEV=" dev . "IOSQ=" iosq .

      iosq = strip(iosq)

      if datatype(iosq,"N") then do
         if iosq > threshold then do
            say "WARNING: Device" dev "IOSQ=" iosq "ms"
         end
      end
   end
end

say "IOSQ scan completed."

exit