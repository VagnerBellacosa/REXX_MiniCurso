//CATrexx1 JOB 'INEFE','CRIAR PDSE  ',CLASS=A,MSGCLASS=W,
//         MSGLEVEL=(1,1)
//*
//**********************************************************
//**           hello world em modo batch                  **
//**********************************************************
//STEP1    EXEC PGM=IEBGENER
//SYSUT1   DD *,DLM=@@
/* REXX */
Say "Hello, world"
Exit 0
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
//************************** fim do jcl     ****************************
