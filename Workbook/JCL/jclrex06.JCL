//CATPDSE6 JOB 'INEFE','CRIAR PDSE  ',CLASS=A,MSGCLASS=W,               JOB00242
//         MSGLEVEL=(1,1)
//*
//**********************************************************
//**           EXEMPLO DE IF ANINHADO                     **
//**********************************************************
//STEP1    EXEC PGM=IEBGENER
//SYSUT1   DD *,DLM=@@
/* REXX */
/* Main program */
i = 50
if (i < 10) then
   do
      say "i EH MENOR QUE 10"
   end
else
if (i < 7) then
   do
      say "i EH MENOR QUE 7"
   end
else
   do
      say "i EH MAIOR OU IGUAL A 10"
   end
exit
@@
//SYSUT2   DD DSN=&&PDS(PROG1),DISP=(,PASS),UNIT=VIO,
//         SPACE=(CYL,(1,1,1),RLSE)
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//*
//STEP2    EXEC PGM=IRXJCL,PARM='PROG1'
//SYSEXEC  DD DSN=&&PDS,DISP=(OLD,PASS)
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DUMMY
//*
