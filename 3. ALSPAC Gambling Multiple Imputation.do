clear all

***** Load cleaned dataset *****
*** If statement to only impute for variables with suiattempt24yrall data, and problem gambling possibility
use (add filepath...) dataclean.dta clear
keep if suiattempt24yrall == 0 | suiattempt24yrall == 1 
keep if BGPS24SUM > 0



*** Allocate variables to respective groups for later use
local outcomebin suiattempt25yr //

local exposurecon PGSI24SUM PGSI20SUM //

local covarbin edu24 hyp mat_education suiattempt16li //

local covarcon AUDIT24 //

local outcomeauxbin homeown edu20 loctot socmed //

local outcomeauxcon crowdin PGSIC24 //

local exposureauxbin socclass con ADHD parentgamb //

* Key with no missing
local compc suiattempt24yrall sex smoke24 BGPS24SUM

*** Identify what format the dataset is in
mi set wide

*** use the "mi register" command to identify variables with missing data and register them for imputation
*** apparently more = better as more points to identify patterns with
mi register imputed 	`outcomebin' `exposurecon' `covarbin' `covarcon' `outcomeauxbin' `outcomeauxcon' `exposureauxbin' PGSIC24Diff
mi register regular		`compc'

**** !! Add exposurecon, remove expossurebin, covarauxbin
mi impute chained              ///             
				(logit,   include (`exposurecon' `outcomebin' `covarcon' `exposureauxbin' `outcomeauxcon' `outcomeauxbin')  noimputed) `outcomebin'	///
				(logit,   include (`exposurecon' `outcomebin'  `covarcon' `exposureauxbin' `outcomeauxcon' `outcomeauxbin')  noimputed) `covarbin'	///
				(pmm, knn(3)  include (`exposurecon' `outcomebin' `covarbin' `exposureauxbin' `outcomeauxcon' `outcomeauxbin')  noimputed) `covarcon'	///
				(pmm, knn(3)  include (`exposurecon' `outcomebin' `covarbin' `covarcon' `exposureauxbin' `outcomeauxbin')  noimputed) `exposurecon'	///
				(logit, include (`exposurecon' `outcomebin' `covarbin' `covarcon' `outcomeauxcon' `outcomeauxbin')  noimputed) `exposureauxbin'	///
				(pmm, knn(3)  include (`exposurecon' `outcomebin' `covarbin' `covarcon' `exposureauxbin' `outcomeauxbin')  noimputed) `outcomeauxcon'	///
				(logit,  include (`exposurecon' `outcomebin' `covarbin' `covarcon' `exposureauxbin' `outcomeauxcon')  noimputed) `outcomeauxbin'	///
				 = `compc', burnin(100) add(50) rseed(160870) chaindots augment force

 save (add filepath...) dataimptest.dta, replace
				 
				 
*** DATA ANALYSIS ********
clear all
use (add filepath...) dataimp.dta, clear

**** Generate new PGSI Change score
*** This overrides imputed variable, such that each change score reflects the actual change between imputed scores in each imputation
forvalues i = 1/50 {
    replace _`i'_PGSIC24Diff = _`i'_PGSI24SUM - _`i'_PGSI20SUM
    replace _`i'_PGSIC24 = 1 if _`i'_PGSIC24Diff > 0
    replace _`i'_PGSIC24 = 2 if _`i'_PGSIC24Diff < 0
    replace _`i'_PGSIC24 = 0 if _`i'_PGSIC24Diff == 0
}


**** Run the regressions
**H1 - Cross-sectional
mi estimate, or: logit suiattempt24yrall PGSI24SUM
mi estimate, or: logit suiattempt24yrall PGSI24SUM sex edu24 mat_education
mi estimate, or: logit suiattempt24yrall PGSI24SUM sex edu24 mat_education hyp AUDIT24
mi estimate, or: logit suiattempt24yrall PGSI24SUM sex edu24 mat_education hyp AUDIT24 suiattempt16li

**H2 - Longitudinal 
mi estimate, or: logit suiattempt25yr PGSI24SUM
mi estimate, or: logit suiattempt25yr PGSI24SUM sex edu24 mat_education
mi estimate, or: logit suiattempt25yr PGSI24SUM sex edu24 mat_education hyp AUDIT24
mi estimate, or: logit suiattempt25yr PGSI24SUM sex edu24 mat_education hyp AUDIT24 suiattempt16li
 
mi estimate, or: logit suiattempt24yrall PGSI20SUM
mi estimate, or: logit suiattempt24yrall PGSI20SUM sex edu24 mat_education
mi estimate, or: logit suiattempt24yrall PGSI20SUM sex edu24 mat_education hyp AUDIT24
mi estimate, or: logit suiattempt24yrall PGSI20SUM sex edu24 mat_education hyp AUDIT24 suiattempt16li

mi estimate, or: logit suiattempt25yr PGSI20SUM
mi estimate, or: logit suiattempt25yr PGSI20SUM sex edu24 mat_education
mi estimate, or: logit suiattempt25yr PGSI20SUM sex edu24 mat_education hyp AUDIT24
mi estimate, or: logit suiattempt25yr PGSI20SUM sex edu24 mat_education hyp AUDIT24 suiattempt16li

**H3 - PGSI change
mi estimate, or: logit suiattempt24yrall i.PGSIC24
mi estimate, or: logit suiattempt24yrall i.PGSIC24 PGSI20SUM
mi estimate, or: logit suiattempt24yrall i.PGSIC24 PGSI20SUM sex edu24 mat_education
mi estimate, or: logit suiattempt24yrall i.PGSIC24 PGSI20SUM sex edu24 mat_education hyp AUDIT24
mi estimate, or: logit suiattempt24yrall i.PGSIC24 PGSI20SUM sex edu24 mat_education hyp AUDIT24 suiattempt16li

