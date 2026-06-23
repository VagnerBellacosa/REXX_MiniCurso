/* rexx */

/* REXX --------------------------------------------------------*/
/* IBM Z Database Health Assistant                             */
/* Exemplo Didático                                            */
/*--------------------------------------------------------------*/

Address TSO

Say '======================================================='
Say '        IBM Z DATABASE HEALTH ASSISTANT'
Say '======================================================='
Say ''

/* Indicadores */

HealthScore = 92
Critical    = 2
Recom       = 7
Systems     = 12

Say 'Health Score   : 'HealthScore' (Healthy)'
Say 'Critical Issues: 'Critical
Say 'Recommendations: 'Recom
Say 'Systems        : 'Systems

Say ''
Say '======================================================='
Say 'RECOMMENDATIONS'
Say '======================================================='

Rec.1='Optimize buffer pools'
Rec.2='Improve hit ratio'
Rec.3='Reduce CPU consumption'
Rec.4='Reorganize objects'
Rec.5='Detect tables requiring REORG'
Rec.6='Update catalog statistics'
Rec.7='Improve access paths'

Do i=1 to 7
   Say right(i,2)'. 'value('Rec.'i)
End

Say ''
Say '======================================================='
Say 'CPU UTILIZATION'
Say '======================================================='


cpu.1=35
cpu.2=48
cpu.3=52
cpu.4=68
cpu.5=71
cpu.6=65
cpu.7=55

Do x=1 to 7

   bars=''

   n=cpu.x % 2

   Do y=1 to n
      bars=bars||'*'
   End

   Say 'Hour 'right(x,2)' ['bars'] 'cpu.x'%'

End



Say ''
Say '======================================================='
Say 'RESPONSE TIME'
Say '======================================================='


resp.1=12
resp.2=10
resp.3=8
resp.4=14
resp.5=16
resp.6=11
resp.7=9


Do x=1 to 7

   bars=''

   Do y=1 to resp.x
      bars=bars||'#'
   End

   Say 'Slot 'right(x,2)' ['bars'] 'resp.x' ms'

End


Say ''
Say '======================================================='
Say 'CONNECTED ENVIRONMENT'
Say '======================================================='

Say ''
Say '          +----------------+'
Say '          |   IBM Z z16    |'
Say '          +----------------+'
Say '                  |'
Say '     --------------------------'
Say '      |          |            |'
Say '   +------+  +------+   +------+'
Say '   | Db2 |  | AI  |   |WLM  |'
Say '   +------+  +------+   +------+'

Say ''
Say 'Assessment completed successfully.'
Say ''

Exit 0
