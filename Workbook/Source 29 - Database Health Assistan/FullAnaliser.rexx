/* rexx */
/***************************************************************/
/* HEALTH.REXX - IBM Z Database Health Assistant               */
/***************************************************************/
Parse Arg SSID
If SSID='' Then SSID='DB2P'

score=100
critical=0
reccnt=0

Call ADDREC 'Starting assessment for subsystem 'SSID

Address TSO
"SUBCOM DSNREXX"
If RC<>0 Then "DSNREXX"

Address DSNREXX
"CONNECT" SSID
If RC<>0 Then Do
 Say 'Unable to connect to 'SSID
 Exit 8
End

Call CHECK_REORG
Call CHECK_STATS
Call CHECK_INDEX
Call CLASSIFY
Call REPORT

"DISCONNECT"
Exit 0

ADDREC:
 parse arg txt
 reccnt=reccnt+1
 rec.reccnt=txt
return

CHECK_REORG:
 sql="SELECT DBNAME,NAME,REORGINSERTS,REORGDELETES " ,
     "FROM SYSIBM.SYSTABLESPACESTATS " ,
     "WHERE REORGINSERTS>100000 OR REORGDELETES>100000"
 "EXECSQL DECLARE C1 CURSOR FOR S1"
 "EXECSQL PREPARE S1 FROM :sql"
 "EXECSQL OPEN C1"
 Do Forever
  "EXECSQL FETCH C1 INTO :DB,:TS,:INS,:DEL"
  If SQLCODE<>0 Then Leave
  score=score-2
  critical=critical+1
  Call ADDREC 'REORG 'DB'.'TS
 End
 "EXECSQL CLOSE C1"
return

CHECK_STATS:
 sql="SELECT DBNAME,NAME,STATSTIME FROM SYSIBM.SYSTABLESPACESTATS WHERE STATSTIME < CURRENT TIMESTAMP - 30 DAYS"
 "EXECSQL DECLARE C2 CURSOR FOR S2"
 "EXECSQL PREPARE S2 FROM :sql"
 "EXECSQL OPEN C2"
 Do Forever
  "EXECSQL FETCH C2 INTO :DB,:TS,:ST"
  If SQLCODE<>0 Then Leave
  score=score-1
  Call ADDREC 'RUNSTATS 'DB'.'TS
 End
 "EXECSQL CLOSE C2"
return

CHECK_INDEX:
 sql="SELECT NAME,CLUSTERRATIOF FROM SYSIBM.SYSINDEXSPACESTATS WHERE CLUSTERRATIOF<80"
 "EXECSQL DECLARE C3 CURSOR FOR S3"
 "EXECSQL PREPARE S3 FROM :sql"
 "EXECSQL OPEN C3"
 Do Forever
  "EXECSQL FETCH C3 INTO :IX,:CR"
  If SQLCODE<>0 Then Leave
  score=score-2
  Call ADDREC 'Improve access path for 'IX
 End
 "EXECSQL CLOSE C3"
return

CLASSIFY:
 if score>90 then health='Healthy'
 else if score>80 then health='Good'
 else if score>70 then health='Warning'
 else if score>50 then health='Critical'
 else health='Emergency'
return

REPORT:
 Say '--------------------------------'
 Say 'IBM Z DATABASE HEALTH ASSISTANT'
 Say '--------------------------------'
 Say 'Health Score:' score '('health')'
 Say 'Critical Issues:' critical
 Say 'Recommendations:' reccnt
 Do i=1 to reccnt
  Say i')' rec.i
 End
return

