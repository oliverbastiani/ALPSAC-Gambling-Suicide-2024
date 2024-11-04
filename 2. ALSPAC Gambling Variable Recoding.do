***** Clean variables *****
use (add filepath...) datasetfull.dta clear

***Gambling Exposures *********************************************
** PGSI coded differently across questionnaires, recode so 1=1, etc
*PGSI 20 Years
gen PGSI20Q1=.
replace PGSI20Q1=0 if CCU1141==4
replace PGSI20Q1=1 if CCU1141==3
replace PGSI20Q1=2 if CCU1141==2
replace PGSI20Q1=3 if CCU1141==1
gen PGSI20Q2=.
replace PGSI20Q2=0 if CCU1142==4
replace PGSI20Q2=1 if CCU1142==3
replace PGSI20Q2=2 if CCU1142==2
replace PGSI20Q2=3 if CCU1142==1
gen PGSI20Q3=.
replace PGSI20Q3=0 if CCU1140==4
replace PGSI20Q3=1 if CCU1140==3
replace PGSI20Q3=2 if CCU1140==2
replace PGSI20Q3=3 if CCU1140==1
gen PGSI20Q4=.
replace PGSI20Q4=0 if CCU1143==4
replace PGSI20Q4=1 if CCU1143==3
replace PGSI20Q4=2 if CCU1143==2
replace PGSI20Q4=3 if CCU1143==1
gen PGSI20Q5=.
replace PGSI20Q5=0 if CCU1144==4
replace PGSI20Q5=1 if CCU1144==3
replace PGSI20Q5=2 if CCU1144==2
replace PGSI20Q5=3 if CCU1144==1
gen PGSI20Q6=.
replace PGSI20Q6=0 if CCU1145==4
replace PGSI20Q6=1 if CCU1145==3
replace PGSI20Q6=2 if CCU1145==2
replace PGSI20Q6=3 if CCU1145==1
gen PGSI20Q7=.
replace PGSI20Q7=0 if CCU1146==4
replace PGSI20Q7=1 if CCU1146==3
replace PGSI20Q7=2 if CCU1146==2
replace PGSI20Q7=3 if CCU1146==1
gen PGSI20Q8=.
replace PGSI20Q8=0 if CCU1147==4
replace PGSI20Q8=1 if CCU1147==3
replace PGSI20Q8=2 if CCU1147==2
replace PGSI20Q8=3 if CCU1147==1
gen PGSI20Q9=.
replace PGSI20Q9=0 if CCU1148==4
replace PGSI20Q9=1 if CCU1148==3
replace PGSI20Q9=2 if CCU1148==2
replace PGSI20Q9=3 if CCU1148==1
gen PGSI20SUM=.
replace PGSI20SUM = PGSI20Q1 + PGSI20Q2 + PGSI20Q3 + PGSI20Q4 + PGSI20Q5 + PGSI20Q6 + PGSI20Q7 + PGSI20Q8 + PGSI20Q9
. label variable PGSI20SUM "Total PGSI Score Age 20"

*BGPS 24 Years
gen BGPS24SUM=.
replace BGPS24SUM = YPD9000 + YPD9001 + YPD9003 + YPD9004 + YPD9005 + YPD9006 + YPD9007 + YPD9008 + YPD9009 + YPD9010 + YPD9011 + YPD9014 + YPD9015

**At 24yr, PGSI limited to lifetime gamblers, not last year gamblers, so corrected using prior BGPS answers
**Code for unadjusted PGSI at 24 also availible (mostly just adds 0 scores)
*Correct PGSI @ 24
gen PGSI24Q1adj=.
replace PGSI24Q1adj=0 if YPD9031==0 & BGPS24SUM>0
replace PGSI24Q1adj=1 if YPD9031==1 & BGPS24SUM>0
replace PGSI24Q1adj=2 if YPD9031==2 & BGPS24SUM>0
replace PGSI24Q1adj=3 if YPD9031==3 & BGPS24SUM>0
gen PGSI24Q2adj=.
replace PGSI24Q2adj=0 if YPD9032==0 & BGPS24SUM>0
replace PGSI24Q2adj=1 if YPD9032==1 & BGPS24SUM>0
replace PGSI24Q2adj=2 if YPD9032==2 & BGPS24SUM>0
replace PGSI24Q2adj=3 if YPD9032==3 & BGPS24SUM>0
gen PGSI24Q3adj=.
replace PGSI24Q3adj=0 if YPD9030==0 & BGPS24SUM>0
replace PGSI24Q3adj=1 if YPD9030==1 & BGPS24SUM>0
replace PGSI24Q3adj=2 if YPD9030==2 & BGPS24SUM>0
replace PGSI24Q3adj=3 if YPD9030==3 & BGPS24SUM>0
gen PGSI24Q4adj=.
replace PGSI24Q4adj=0 if YPD9033==0 & BGPS24SUM>0
replace PGSI24Q4adj=1 if YPD9033==1 & BGPS24SUM>0
replace PGSI24Q4adj=2 if YPD9033==2 & BGPS24SUM>0
replace PGSI24Q4adj=3 if YPD9033==3 & BGPS24SUM>0
gen PGSI24Q5adj=.
replace PGSI24Q5adj=0 if YPD9034==0 & BGPS24SUM>0
replace PGSI24Q5adj=1 if YPD9034==1 & BGPS24SUM>0
replace PGSI24Q5adj=2 if YPD9034==2 & BGPS24SUM>0
replace PGSI24Q5adj=3 if YPD9034==3 & BGPS24SUM>0
gen PGSI24Q6adj=.
replace PGSI24Q6adj=0 if YPD9035==0 & BGPS24SUM>0
replace PGSI24Q6adj=1 if YPD9035==1 & BGPS24SUM>0
replace PGSI24Q6adj=2 if YPD9035==2 & BGPS24SUM>0
replace PGSI24Q6adj=3 if YPD9035==3 & BGPS24SUM>0
gen PGSI24Q7adj=.
replace PGSI24Q7adj=0 if YPD9036==0 & BGPS24SUM>0
replace PGSI24Q7adj=1 if YPD9036==1 & BGPS24SUM>0
replace PGSI24Q7adj=2 if YPD9036==2 & BGPS24SUM>0
replace PGSI24Q7adj=3 if YPD9036==3 & BGPS24SUM>0
gen PGSI24Q8adj=.
replace PGSI24Q8adj=0 if YPD9037==0 & BGPS24SUM>0
replace PGSI24Q8adj=1 if YPD9037==1 & BGPS24SUM>0
replace PGSI24Q8adj=2 if YPD9037==2 & BGPS24SUM>0
replace PGSI24Q8adj=3 if YPD9037==3 & BGPS24SUM>0
gen PGSI24Q9adj=.
replace PGSI24Q9adj=0 if YPD9038==0 & BGPS24SUM>0
replace PGSI24Q9adj=1 if YPD9038==1 & BGPS24SUM>0
replace PGSI24Q9adj=2 if YPD9038==2 & BGPS24SUM>0
replace PGSI24Q9adj=3 if YPD9038==3 & BGPS24SUM>0
gen PGSI24SUM=.
replace PGSI24SUM = PGSI24Q1adj + PGSI24Q2adj + PGSI24Q3adj + PGSI24Q4adj + PGSI24Q5adj + PGSI24Q6adj + PGSI24Q7adj + PGSI24Q8adj + PGSI24Q9adj
. label variable PGSI24SUM "Total PGSI Score Age 24"

*PGSI Change 20 - 24 Years
gen PGSIC24Diff = PGSI24SUM - PGSI20SUM
. label variable PGSIC24Diff "Numerical change in PGSI scores from 20 to 24 Years"
gen PGSIC24 = 0
replace PGSIC24=1 if PGSIC24Diff>0
replace PGSIC24=2 if PGSIC24Diff<0
replace PGSIC24=. if PGSIC24Diff==.
. label variable PGSIC24 "Categorical Change in PGSI scores from 20 to 24 Years"

*** SES Exposures ****************************************************
*Parental Social Class (Highest OPCS job code, uses mother and father)
gen matsocclass=.
replace matsocclass=1 if c755==4 | c755==5 | c755==6
replace matsocclass=0 if c755==1 | c755==2 | c755==3
gen  patsocclass=.
replace patsocclass=1 if c765==4 | c765==5 | c765==6
replace patsocclass=0 if c765==1 | c765==2 | c765==3
gen socclass=.
replace socclass=1 if matsocclass==1 & patsocclass==1
replace socclass=1 if matsocclass==1 & patsocclass==.
replace socclass=1 if matsocclass==. & patsocclass==1
replace socclass=0 if matsocclass==0 | patsocclass==0
. label variable socclass "Parental Social Class, Both Parents Included"
*Mat education
gen mat_education=.
replace mat_education=1 if c645a==4 | c645a==5
replace mat_education=0 if c645a==1 | c645a==2 | c645a==3
. label variable mat_education "Maternal Education Level Recoded"
*Crowding Index
gen crowdin=.
replace crowdin = a550 / a045
. label variable crowdin "Crowding Index During Pregnancy"
gen crowdinbin=.
replace crowdinbin=1 if crowdin>1
replace crowdinbin=0 if crowdin<1
. label variable crowdinbin "Binary Crowding Index During Pregnancy"
*Home Ownership
gen homeown=.
replace homeown=1 if a006==2 | a006==3 | a006==4 | a006==5 | a006==6
replace homeown=0 if a006==1 | a006==0
. label variable homeown "Home Ownership Status"
*Education/Employment Status
*!! Update variables when data available
gen edu24=.
replace edu24=0 if FKFR1300==0 | FKFR1301==0 | FKFR1302==0 | FKFR1303==0 | FKFR1304==0
replace edu24=1 if FKFR1300==1 | FKFR1301==1 | FKFR1302==1 | FKFR1303==1 | FKFR1304==1
. label variable edu24 "Education/Employment/Training Status (Full and Part-time) at 24 Years"

***Suicidality/Mental Health Outcomes
**Suicidality
*16Yr lifetime measures
gen suiattempt16li=.
replace suiattempt16li=1 if ccs6560==1 | ccs6539==1
replace suiattempt16li=0 if ccs6560==2 | ccs6560==-1
*24Yr
gen suiattempt24s23=.
replace suiattempt24s23=1 if YPD1220==1 | YPD1220==2 | YPD1220==3 | YPD1220==4
replace suiattempt24s23=0 if YPD1220==0
gen suiattempt24yr=.
replace suiattempt24yr=1 if YPD6021==1 | YPD6021==2
replace suiattempt24yr=0 if YPD6021==3 | YPD6000==0
* Variable combines both 24yr attempt measures for greater sensitivity
gen suiattempt24yrall=.
replace suiattempt24yrall=0 if suiattempt24s23==0 | suiattempt24yr==0
replace suiattempt24yrall=1 if suiattempt24s23==1 | suiattempt24yr==1
. label variable suiattempt24yrall "Past Year Suicide Attempt at 24, Both Measures"
*35yr
gen suiattempt25yr=.
replace suiattempt25yr=1 if YPE6720==1 | YPE6720==2 | YPE6720==3 | YPE6720==4
replace suiattempt25yr=0 if YPE6720==0

***Confounders
*Sex
gen sex=.
replace sex=1 if kz021==2
replace sex=0 if kz021==1
. label variable sex "Sex Recoded"
*Hyperactivity Problems
gen hyp=.
replace hyp=0 if ku706a<=7
replace hyp=. if ku706a<0
replace hyp=1 if ku706a>=8
. label variable hyp "Hyperactivity Problems Binary"
*Conduct problems
gen conduct=.
replace conduct=0 if ku708a<=3
replace conduct=. if ku708a<0
replace conduct=1 if ku708a>=4
. label variable conduct "Conduct Problems Binary"
*Locus of Control at 16 Years
gen loc1=.
replace loc1=1 if ccs3000==1
replace loc1=0 if ccs3000==2
gen loc2=.
replace loc2=1 if ccs3001==1
replace loc2=0 if ccs3001==2
gen loc3=.
replace loc3=1 if ccs3002==1
replace loc3=0 if ccs3002==2
gen loc4=.
replace loc4=1 if ccs3003==1
replace loc4=0 if ccs3003==2
gen loc5=.
replace loc5=1 if ccs3004==1
replace loc5=0 if ccs3004==2
gen loc6=.
replace loc6=1 if ccs3005==1
replace loc6=0 if ccs3005==2
gen loc7=.
replace loc7=1 if ccs3006==1
replace loc7=0 if ccs3006==2
gen loc8=.
replace loc8=1 if ccs3007==1
replace loc8=0 if ccs3007==2
gen loc9=.
replace loc9=1 if ccs3008==1
replace loc9=0 if ccs3008==2
gen loc10=.
replace loc10=1 if ccs3009==1
replace loc10=0 if ccs3009==2
gen loc11=.
replace loc11=1 if ccs3010==1
replace loc11=0 if ccs3010==2
gen loc12=.
replace loc12=1 if ccs3011==1
replace loc12=0 if ccs3011==2
gen loctot=.
replace loctot= loc1 + loc2 + loc3 + loc4 + loc5 + loc6 + loc7 + loc8 + loc9 + loc10 + loc11 + loc12
. label variable loctot "Total Locus of Control Score at 16 Years"
*Social Media Use
gen socmed=.
replace socmed=1 if YPD9550==1
replace socmed=0 if YPD9550==2 | YPD9550==3 | YPD9550==4 | YPD9550==5 | YPD9550==6 | YPD9550==7
*ADHD Diagnosis
gen ADHD=.
replace ADHD=1 if kr803a==1
replace ADHD=0 if kr803a==2
. label variable ADHD "ADHD Diagnosis"
***** AUDIT - FJAL4000 CCU3095 FKAL1500 , total scores, can make binary if preferred
*AUDIT at 24 uses the shorter AUDIT-C, could use individual questions from prior AUDITS for comparison
gen AUDIT24=FKAL1500
replace AUDIT24=. if FKAL1500<0
*Smoking24 (every week yes/no)
gen smoke24=.
replace smoke24=1 if YPD7030==1
replace smoke24=0 if YPD7030==0 | YPD7030==-1
*Paternal Gambling
gen patgamb=.
replace patgamb=1 if pj1000==1 | pj1001==1 | pj1002==1 | pj1003==1 | pj1004==1 | pj1005==1 | pj1006==1 | pj1007==1 | pj1008==1 | pj1009==1 | pj1010==1
replace patgamb=0 if pj1000>1 & pj1001>1 & pj1002>1 & pj1003>1 & pj1004>1 & pj1005>1 & pj1006>1 & pj1007>1 & pj1008>1 & pj1009>1 & pj1010>1
*Maternal Gambling
gen matgamb=.
replace matgamb=1 if l1000==1 | l1001==1 | l1002==1 | l1003==1 | l1004==1 | l1005==1 | l1006==1 | l1007==1 | l1008==1 | l1009==1 | l1010==1
replace matgamb=0 if l1000>1 & l1001>1 & l1002>1 & l1003>1 & l1004>1 & l1005>1 & l1006>1 & l1007>1 & l1008>1 & l1009>1 & l1010>1
*Parental Gambling
gen parentgamb=.
replace parentgamb=1 if matgamb==1 | patgamb==1
replace parentgamb=1 if matgamb==1 & patgamb==.
replace parentgamb=1 if matgamb==. & patgamb==1
replace parentgamb=0 if matgamb==0 & patgamb==0
replace parentgamb=0 if matgamb==. & patgamb==0
replace parentgamb=0 if matgamb==0 & patgamb==.
. label variable parentgamb "Either one or both parents are weekly gamblers"

*** CREATE NEW SAVE PATH
save (add filepath...) dataclean.dta replace

