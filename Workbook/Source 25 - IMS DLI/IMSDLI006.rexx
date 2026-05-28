/* rexx */

/* Monitorar Regiões IMS */
ADDRESS IMS

"CMD '/DIS REGION ALL'"

DO FOREVER
   PARSE PULL X
   IF X = "" THEN LEAVE
   SAY X
END