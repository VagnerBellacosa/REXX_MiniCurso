//CATPDSE2 JOB 'INEFE','CRIAR PDSE  ',CLASS=A,MSGCLASS=W,               JOB00242
//         MSGLEVEL=(1,1)
//*
//**********************************************************
//**           VALIDAR TIPO DE VARIAVEL                   **
//**********************************************************
//STEP1    EXEC PGM=IEBGENER
//SYSUT1   DD *,DLM=@@
/* REXX */
Say "Hello, world"
say DATATYPE(" 12 ")
say DATATYPE("")
say DATATYPE("123*")
say DATATYPE("12.3","N")
say DATATYPE("12.3","W")
say DATATYPE("Fred","M")
say DATATYPE("","M")
say DATATYPE("Fred","L")
say DATATYPE("?20K","s")
say DATATYPE("BCd3","X")
say DATATYPE("BC d3","X")
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
