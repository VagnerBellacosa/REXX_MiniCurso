//CATPDS13 JOB 'INEFE','CRIAR PDSE  ',CLASS=A,MSGCLASS=W,               JOB00242
//         MSGLEVEL=(1,1)
//*
//**********************************************************
//**           EXEMPLO DE parse multiplas variaveis       **
//**********************************************************
//STEP1    EXEC PGM=IEBGENER
//SYSUT1   DD *,DLM=@@
/* REXX */
/* Main program */
n = 100.45
if \ datatype( n, wholenumber ) then
   signal msg
   say 'This is a whole number'
   return 0
msg :
   say 'This is an incorrect number'
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
