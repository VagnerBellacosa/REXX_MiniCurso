/* rexx */

score=100

if reorg>10 then score=score-5

if oldstats>20 then score=score-5

if hitratio<95 then score=score-10

if cpu>80 then score=score-15

if responsetime>300 then score=score-10
