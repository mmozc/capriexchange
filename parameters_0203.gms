*-------------------------------------------------------------------------------
*        Parameters
*-------------------------------------------------------------------------------

*        > data:

parameters dr(age_p,cause_p,rgs,yrs_scn)  mortality rate (deaths per pop)
           pop(age_p,rgs,yrs_scn)         population statistics (thousands)
           life_exp(age_p,*)              GBD 2010 standard abridged life table
;

*-------------------------------------------------------------------------------

*        > cons:

parameters cons_scn_data(diet_scn_p,unit_wpp,fg,rgs,yrs_scn) data on consumption scenarios
           cons_scn(diet_scn_p,unit_wpp,riskf_p,rgs,yrs_scn) consumption scenarios
;

*-------------------------------------------------------------------------------

*        > weight:

parameters BMI_data(rgs,sex,yrs_scn,weight)          NCD-RisC data on weight distributions and BMI
           weight_scn(diet_scn_p,weight,rgs,yrs_scn) summary of weight distribution in diet scenarios
           weight_ref(diet_scn_p,weight,rgs,yrs_scn) weight distribution in diet scenarios for reference
;

*-------------------------------------------------------------------------------

*        > RR:

parameters RR_data(*,cause_p,*)             relative risks per 100 g
           RR_age(riskf_p,cause_p,*,age_p)  relative risks scaled by age
           RR_scn(diet_scn_p,riskf_p,cause_p,rgs,yrs_scn,*)           relative risks for consumption scenarios
           RR_scn_age(diet_scn_p,riskf_p,cause_p,rgs,yrs_scn,*,age_p) relative risks by scenario and age
           TMREL              theoretical minimum risk exposure level for risk factor
           TMREL_max(riskf_p) max intake after which no additional benefit occurs
;

*-------------------------------------------------------------------------------

*        > PAF:

parameters PAF_scn(diet_scn_p,riskf_p,cause,r,yrs_scn,stats,age_p) population attributable fractions by scenario
           serv_size       normalised serving size of 100 grams per day  /100/
;

*-------------------------------------------------------------------------------

*        > health:

parameter  health_scn(health_itm,diet_scn_p,riskf_p,cause_p,rgs,yrs_scn,stats) health analysis of diet scenarios
;

*-------------------------------------------------------------------------------

*        > report:

parameter  report_health(report_itm,diet_scn_p,riskf_p,cause_p,rgs,stats) report of health analysis
;

*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------


