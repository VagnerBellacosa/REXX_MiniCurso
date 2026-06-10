/* REXX */

/* health check de buffers buscando gargalos */
ADDRESS TSO

"QUERY BUFPOOL"

DO WHILE QUEUED() > 0

   PULL X

   SAY X

END