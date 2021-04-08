*-------------------------------------------------------------------------------
*        Data:
*-------------------------------------------------------------------------------

$ontext
$include regions_0203

sets     yrs_scn         years for scenario analysis
                         /2010/
         cause_p         causes of death plus aggregate
                         /"all-c", CHD, Stroke, Cancer, "Colon and rectum cancers",
                          T2DM, Resp_Dis, Other/
         cause(cause_p)  causes of death (without aggregate)
                         /CHD, Stroke, Cancer, "Colon and rectum cancers", T2DM,
                          Resp_Dis, Other/
         age_p           age groups plus aggregate
                         /"all-a", 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50-54,
                          55-59, 60-64, 65-69, 70-74, 75-79, 80-84, 85+/
         age(age_p)      age groups plus aggregate
                         /20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50-54,
                          55-59, 60-64, 65-69, 70-74, 75-79, 80-84, 85+/
         age_prm(age_p)  age groups for which deaths is premature (age 30-70 according to WHO)
                         /30-34, 35-39, 40-44, 45-49, 50-54, 55-59, 60-64, 65-69/
;

parameter dr(age_p,cause_p,rgs,yrs_scn)  mortality rate (deaths per pop)
          pop(age_p,rgs,yrs_scn)         population statistics (thousands)
          life_exp(age_p,*)              GBD 2010 standard abridged life table
;
$offtext

*-------------------------------------------------------------------------------

*        load data on mortality rates, population stats,
*        and life table (for YLL calc):

$gdxin dr_0203.gdx
$load dr, pop, life_exp
$gdxin

*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
