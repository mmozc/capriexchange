*-------------------------------------------------------------------------------
*        Health impacts:
*-------------------------------------------------------------------------------

$ontext
sets     health_itm      items of health analysis
                         /deaths_avd, deaths_avd_prm, YLL_avd,
                          deaths, deaths_prm, YLL/
         report_itm      items included in summary report
                         /"%deaths_avd_prm/all", "%deaths_avd/all",
                          deaths_avd, deaths_avd_prm/
;

parameter health_scn(health_itm,diet_scn_p,riskf_p,cause_p,rgs,yrs_scn,stats) health analysis of diet scenarios
;
$offtext

*-------------------------------------------------------------------------------

*        select regions with data for health analysis:

r_data("cons",r)$sum(fg, cons_scn_data("BMK","g/d_w",fg,r,"2010")) = yes;
r_data("mort",r)$dr("35-39","CHD",r,"2010") = yes;
r_data("bmi",r)$sum(weight, weight_scn("BMK",weight,r,"2010")) = yes;

r_data("all",r)$r_data("mort",r) = yes;
r_data("all",r)$(not r_data("cons",r)) = no;
r_data("all",r)$(not r_data("bmi",r)) = no;

*-------------------------------------------------------------------------------

*        - avoided deaths:
health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"mean")$r_data("all",r)
         = sum(age, PAF_scn(diet_scn,riskf_p,cause,r,yrs_scn,"mean",age)
         * dr(age,cause,r,yrs_scn) * pop(age,r,yrs_scn) );

health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"std")$r_data("all",r)
         = sum(age, PAF_scn(diet_scn,riskf_p,cause,r,yrs_scn,"std",age)
         *  dr(age,cause,r,yrs_scn) * pop(age,r,yrs_scn) );

health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"low")
         = health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"mean")
         - health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"std");

health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"high")
         = health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"mean")
         + health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,"std");

health_scn("deaths_avd",diet_scn,riskf_p,"all-c",r,yrs_scn,stats)
         = sum(cause, health_scn("deaths_avd",diet_scn,riskf_p,cause,r,yrs_scn,stats));

health_scn("deaths_avd",diet_scn,riskf_p,cause_p,"all-r",yrs_scn,stats)
         = sum(r, health_scn("deaths_avd",diet_scn,riskf_p,cause_p,r,yrs_scn,stats));


*        - avoided premature deaths:
health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"mean")$r_data("all",r)
         = sum(age_prm, PAF_scn(diet_scn,riskf_p,cause,r,yrs_scn,"mean",age_prm)
         * dr(age_prm,cause,r,yrs_scn) * pop(age_prm,r,yrs_scn) );

health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"std")$r_data("all",r)
         = sum(age_prm, PAF_scn(diet_scn,riskf_p,cause,r,yrs_scn,"std",age_prm)
         * dr(age_prm,cause,r,yrs_scn) * pop(age_prm,r,yrs_scn) );

health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"low")
         = health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"mean")
         - health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"std");

health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"high")
         = health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"mean")
         + health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,"std");

health_scn("deaths_avd_prm",diet_scn,riskf_p,"all-c",r,yrs_scn,stats)
         = sum(cause, health_scn("deaths_avd_prm",diet_scn,riskf_p,cause,r,yrs_scn,stats));

health_scn("deaths_avd_prm",diet_scn,riskf_p,cause_p,"all-r",yrs_scn,stats)
         = sum(r, health_scn("deaths_avd_prm",diet_scn,riskf_p,cause_p,r,yrs_scn,stats));


*        - Years of Life Lost (YLL):
health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"mean")$r_data("all",r)
         = sum(age, PAF_scn(diet_scn,riskf_p,cause,r,yrs_scn,"mean",age)
         * dr(age,cause,r,yrs_scn) * pop(age,r,yrs_scn)
         * life_exp(age,"life_exp") );

health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"std")$r_data("all",r)
         = sum(age, PAF_scn(diet_scn,riskf_p,cause,r,yrs_scn,"std",age)
         * dr(age,cause,r,yrs_scn) * pop(age,r,yrs_scn)
         * life_exp(age,"life_exp") );

health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"low")
         = health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"mean")
         - health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"std");

health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"high")
         = health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"mean")
         + health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,"std");

health_scn("YLL_avd",diet_scn,riskf_p,"all-c",r,yrs_scn,stats)
         = sum(cause, health_scn("YLL_avd",diet_scn,riskf_p,cause,r,yrs_scn,stats));

health_scn("YLL_avd",diet_scn,riskf_p,cause_p,"all-r",yrs_scn,stats)
         = sum(r, health_scn("YLL_avd",diet_scn,riskf_p,cause_p,r,yrs_scn,stats));


*        - allocate colorectal cancer to all cancers:
health_scn(health_itm,diet_scn_p,"red_meat","cancer",rgs,yrs_scn,stats)
         = health_scn(health_itm,diet_scn_p,"red_meat","Colon and rectum cancers",rgs,yrs_scn,stats);

health_scn(health_itm,diet_scn_p,"all-rf","cancer",rgs,yrs_scn,stats)
         = health_scn(health_itm,diet_scn_p,"all-rf","cancer",rgs,yrs_scn,stats)
         + health_scn(health_itm,diet_scn_p,"all-rf","Colon and rectum cancers",rgs,yrs_scn,stats);

health_scn(health_itm,diet_scn_p,riskf_p,"Colon and rectum cancers",rgs,yrs_scn,stats) = 0;


*-------------------------------------------------------------------------------
*        Analysis:
*-------------------------------------------------------------------------------

*        - compare to all deaths and premature deaths:

health_scn("deaths","BMK","all-rf",cause,r,yrs_scn,"mean")$r_data("all",r)
         = sum(age, dr(age,cause,r,yrs_scn) * pop(age,r,yrs_scn) );

health_scn("deaths","BMK","all-rf","all-c",r,yrs_scn,"mean")
         = sum(cause, health_scn("deaths","BMK","all-rf",cause,r,yrs_scn,"mean"));

health_scn("deaths","BMK","all-rf",cause_p,"all-r",yrs_scn,stats)
         = sum(r, health_scn("deaths","BMK","all-rf",cause_p,r,yrs_scn,"mean"));


health_scn("deaths_prm","BMK","all-rf",cause,r,yrs_scn,"mean")$r_data("all",r)
         = sum(age_prm, dr(age_prm,cause,r,yrs_scn) * pop(age_prm,r,yrs_scn) );

health_scn("deaths_prm","BMK","all-rf","all-c",r,yrs_scn,"mean")
         = sum(cause, health_scn("deaths_prm","BMK","all-rf",cause,r,yrs_scn,"mean"));

health_scn("deaths_prm","BMK","all-rf",cause_p,"all-r",yrs_scn,"mean")
         = sum(r, health_scn("deaths_prm","BMK","all-rf",cause_p,r,yrs_scn,"mean"));


health_scn("YLL","BMK","all-rf",cause,r,yrs_scn,"mean")$r_data("all",r)
         = sum(age, dr(age,cause,r,yrs_scn) * pop(age,r,yrs_scn)
         * life_exp(age,"life_exp") );

health_scn("YLL","BMK","all-rf","all-c",r,yrs_scn,"mean")
         = sum(cause, health_scn("YLL","BMK","all-rf",cause,r,yrs_scn,"mean"));

health_scn("YLL","BMK","all-rf",cause_p,"all-r",yrs_scn,"mean")
         = sum(r, health_scn("YLL","BMK","all-rf",cause_p,r,yrs_scn,"mean"));


*        - aggregate regions:

health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"all-r",yrs_scn,stats) = sum(r, health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"HIC",yrs_scn,stats) = sum(r$HIC(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"UMC",yrs_scn,stats) = sum(r$UMC(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"LMC",yrs_scn,stats) = sum(r$LMC(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"LIC",yrs_scn,stats) = sum(r$LIC(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"AMR",yrs_scn,stats) = sum(r$AMR(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"AFR",yrs_scn,stats) = sum(r$AFR(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"EMR",yrs_scn,stats) = sum(r$EMR(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"EUR",yrs_scn,stats) = sum(r$EUR(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"SEA",yrs_scn,stats) = sum(r$SEA(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));
health_scn(health_itm,diet_scn_p,riskf_p,cause_p,"WPR",yrs_scn,stats) = sum(r$WPR(r), health_scn(health_itm,diet_scn_p,riskf_p,cause_p,r,yrs_scn,stats));


*        - calculate percentages:
health_scn("%deaths_avd/all",diet_scn,riskf_p,cause_p,rgs,yrs_scn,stats)
         $health_scn("deaths","BMK","all-rf",cause_p,rgs,yrs_scn,"mean")
         = 100 * health_scn("deaths_avd",diet_scn,riskf_p,cause_p,rgs,yrs_scn,stats)
               / health_scn("deaths","BMK","all-rf",cause_p,rgs,yrs_scn,"mean");

health_scn("%deaths_avd_prm/all",diet_scn,riskf_p,cause_p,rgs,yrs_scn,stats)
         $health_scn("deaths_prm","BMK","all-rf",cause_p,rgs,yrs_scn,"mean")
         = 100 * health_scn("deaths_avd_prm",diet_scn,riskf_p,cause_p,rgs,yrs_scn,stats)
               / health_scn("deaths_prm","BMK","all-rf",cause_p,rgs,yrs_scn,"mean");

health_scn("%YLL_avd/all",diet_scn,riskf_p,cause_p,rgs,yrs_scn,stats)
         $health_scn("YLL","BMK","all-rf",cause_p,rgs,yrs_scn,"mean")
         = 100 * health_scn("YLL_avd",diet_scn,riskf_p,cause_p,rgs,yrs_scn,stats)
               / health_scn("YLL","BMK","all-rf",cause_p,rgs,yrs_scn,"mean");

*-------------------------------------------------------------------------------