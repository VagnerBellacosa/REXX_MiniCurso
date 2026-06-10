/* REXX */
/* Exporta registros IMS para um dataset sequencial. Utilizado para análises externas e geração de relatórios. */

ADDRESS IMS

"ALLOC FI(SAIDA) DA('USER.IMS.EXPORT') SHR"

"GU CLIENTE"

DO FOREVER

   "GN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   EXECIO 1 DISKW SAIDA (STEM IMSDATA.

END

"FREE FI(SAIDA)"