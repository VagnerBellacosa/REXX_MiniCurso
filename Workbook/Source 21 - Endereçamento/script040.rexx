/* REXX */
/* HOT VOLUME DETECTOR */

ADDRESS TSO

say "--------------------------------------"
say "z/OS Storage Contention Analyzer"
say "--------------------------------------"

"OUTTRAP OUT."

"CONSOLE D IOS,DEV"

"OUTTRAP OFF"

count = 0

do i = 1 to OUT.0
   line = OUT.i

   if pos("DEV=",line) > 0 & pos("IOSQ=",line) > 0 then do

      parse var line . "DEV=" dev . "IOSQ=" iosq .

      iosq = strip(iosq)

      if datatype(iosq,"N") then do
         count = count + 1
         devlist.count = dev
         iosqlist.count = iosq
      end
   end
end

/* sort devices by IOSQ */

do i = 1 to count
   do j = i+1 to count
      if iosqlist.j > iosqlist.i then do
         temp = iosqlist.i
         iosqlist.i = iosqlist.j
         iosqlist.j = temp

         temp2 = devlist.i
         devlist.i = devlist.j
         devlist.j = temp2
      end
   end
end

say ""
say "🔥 TOP 10 HOT VOLUMES (IOSQ)"
say "--------------------------------------"

limit = 10
if count < 10 then limit = count

do i = 1 to limit
   say right(i,2)". Device:" devlist.i ,
       " IOSQ=" iosqlist.i "ms"
end

say ""
say "--------------------------------------"
say "Analysis completed."
say "--------------------------------------"

exit