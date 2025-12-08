//CATPDS14 JOB 'INEFE','CRIAR PDSE  ',CLASS=A,MSGCLASS=W,               JOB00242
//         MSGLEVEL=(1,1)
//*
//**********************************************************
//**           EXEMPLO DE parse multiplas variaveis       **
//**********************************************************
//STEP1    EXEC PGM=IEBGENER
//SYSUT1   DD *,DLM=@@
/* REXX */
/* Main program */
n = 1
if \ datatype( n, wholenumber ) then
   signal msg
if n < 1 | n > 3 then
   signal msg
   signal value n
   3 : say 'This is the number 3'
   2 : say ' This is the number 2'
   1 : say ' This is the number 1'
   return n
msg :
   say ' This is an incorrect number '
   exit 99
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
