//CATPDSE7 JOB 'INEFE','CRIAR PDSE  ',CLASS=A,MSGCLASS=W,               JOB00242
//         MSGLEVEL=(1,1)
//*
//**********************************************************
//**           EXEMPLO DE SELECT WHEN                     **
//**********************************************************
//STEP1    EXEC PGM=IEBGENER
//SYSUT1   DD *,DLM=@@
/* REXX */
/* Main program */
i = 50
select
when(i <= 5) then
say "i EH MENOR QUE 5"
when(i <= 7) then
say "i EH MENOR QUE 7"
when(i <= 9) then
say "i EH MENOR QUE 9"
when(i <= 10) then
say "i EH MENOR QUE 10"
otherwise
say "i EH MAIOR QUE 10"
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
