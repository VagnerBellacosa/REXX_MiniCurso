//CATPDSE1 JOB 'INEFE','CRIAR PDSE  ',CLASS=A,MSGCLASS=W,
//         MSGLEVEL=(1,1)
//*
//*------------------------------------------------------------------
//* criar particionado
//**********************************************************
//**           CREATE THE PDSE                            **
//**********************************************************
//STEP01  EXEC PGM=IEFBR14
//DD01      DD DSN=KC02746.WORKBOOK.REXX,
//             DISP=(NEW,CATLG,DELETE),                    *
//             VOLUME=SER=WRKA02,                          *
//             UNIT=DISK,SPACE=(CYL,(2,1)),                *
//             DCB=(LRECL=80,BLKSIZE=0,DSORG=PO,RECFM=FB), *
//             DSNTYPE=LIBRARY                             *
//**********************************************************
//**           CREATE A PDSE MEMBER                       **
//**********************************************************
//STEP20  EXEC PGM=ICEGENER
//SYSUT1    DD *
//SYSUT2    DD DSN=KC02746.WORKBOOK.REXX(REXX),DISP=SHR
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD DUMMY
//************************** FIM DO JCL     ****************
