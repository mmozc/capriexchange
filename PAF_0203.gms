*-------------------------------------------------------------------------------
*        Population atttributable/impacts fractions:
*-------------------------------------------------------------------------------

$ontext
sets
         riskf_p         all risk factors
                         /fruits, vegetables, nuts_seeds, legumes, red_meat,
                          underweight, overweight, obese, obese_g1, obese_g2, obese_g3,
                          weight, diet, all-rf/
         riskf_d(riskf_p) diet-related risk factors
                         /fruits, vegetables, nuts_seeds, legumes, red_meat/
         riskf_w(riskf_p) weight-related risk factors
                         /weight, underweight, overweight, obese_g1, obese_g2, obese_g3/
         riskf_c(riskf_p) combined risk factors
                         /diet, weight/
         stats           statistics
                         /mean, low, high, std/
;

parameters
         PAF_scn(diet_scn_p,riskf_p,cause,r,yrs_scn,stats,age) population attributable fractions by scenario
         serv_size       normalised serving size of 100 grams per day  /100/
;
$offtext

*-------------------------------------------------------------------------------

*        PAF related to diet:
*        - for FV and meat, everybody in a country is exposed (p_food=1):
*          PAF_food = ( (p_food*RR_food)_ref -(p_food*RR_food)_scn )/(p_food*RR_food)_ref;
*                   = 1 - (p_food*RR_food)_scn/(p_food*RR_food)_ref;
*                   = 1 - ( power(RR_food,cns_chg_food)_scn/power(RR_food,cns_chg_food)_ref );

PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,stats,age)
         $RR_scn_age("BMK",riskf_d,cause,r,yrs_scn,stats,age)
         = 1 - RR_scn_age(diet_scn,riskf_d,cause,r,yrs_scn,stats,age)**(cons_scn(diet_scn,"g/d_w",riskf_d,r,yrs_scn)/serv_size)
             / RR_scn_age("BMK",riskf_d,cause,r,yrs_scn,stats,age)**(cons_scn("BMK","g/d_w",riskf_d,r,yrs_scn)/serv_size);

*        Uncertainty of PAF related to diet:
*        - d_PAF_food = PAF_food * sqrt(  power(d_RR_food/RR_food, 2)_ref
*                                       + power(d_RR_food/RR_food, 2)_scn );
*          with RR_food = RR**cns_chg; d_RR_food = RR**cns_chg * (cns_chg * d_RR/RR)
*          d_PAF_food = PAF_food * sqrt(  power(d_RR_food/RR_food,2)_ref
*                                       + power(d_RR_food/RR_food,2)_scn;

PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,"std",age)
         $(RR_scn_age("BMK",riskf_d,cause,r,yrs_scn,"mean",age) and RR_scn_age(diet_scn,riskf_d,cause,r,yrs_scn,"mean",age))
         = PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,"mean",age)
         * sqrt( power(RR_scn_age("BMK",riskf_d,cause,r,yrs_scn,"std",age)/RR_scn_age("BMK",riskf_d,cause,r,yrs_scn,"mean",age) ,2)
               + power(RR_scn_age(diet_scn,riskf_d,cause,r,yrs_scn,"std",age) /RR_scn_age(diet_scn,riskf_d,cause,r,yrs_scn,"mean",age)  ,2) );


*        PAF for all dietary risks combined:
PAF_scn(diet_scn,"diet",cause,r,yrs_scn,stats,age)
         = 1 - prod(riskf_d, 1-PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,stats,age));

*        Uncertainty of combined PAFs:
*        PAF_cns = 1 - (1-PAF_fvc)*(1-PAF_mtc)
*                = PAF_fvc + PAF_mtc - PAF_fvc*+PAF_mtc
*        -> d_PAF_cns = sqrt(  power(d_PAF_fvc,2) + power(d_PAF_mtc,2)
*                            + power(PAF_fvc*PAF_mtc,2)
*                              * (  power(d_PAF_fvc/PAF_fvc,2)
*                                 + power(d_PAF_mtc/PAF_mtc,2) ) );
*        PAF_all_scn is analogous;

PAF_scn(diet_scn,"diet",cause,r,yrs_scn,"std",age)
         = sqrt(   sum(riskf_d,   power(PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,"std",age) ,2))
                 + prod(riskf_d,  power(PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,"mean",age),2))
                 * ( sum(riskf_d, power(PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,"std",age)
                 /PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,"mean",age),2)$PAF_scn(diet_scn,riskf_d,cause,r,yrs_scn,"mean",age)) ) );

*-------------------------------------------------------------------------------

*        PAF related to weight:
*        - reformulate PAF for ease of calculation:
*          PAF_wgh = ( sum(p_weight*RR_weight)-sum(p'_weight*RR_weight) )/ sum(p_weight*RR_weight);
*                  = 1 - sum(p'_weight*RR_weight)/sum(p_weight*RR_weight);

alias (weight, weightt);
PAF_scn(diet_scn,"weight",cause,r,yrs_scn,"mean",age)
         $sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age))
         = 1- ( sum(weightt, weight_scn(diet_scn,weightt,r,yrs_scn)*RR_scn_age(diet_scn,weightt,cause,r,yrs_scn,"mean",age))
               /sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age)) );

*        Uncertainty of PAF related to weight:
*        -   PAF_wgh = 1 - sum(p'_weight*RR_weight)/sum(p_weight*RR_weight);
*        - d_PAF_wgh = PAF_wgh * sqrt(  power(d_sum(p'_weight*RR_weight)/sum(p'_weight*RR_weight),2)
*                                     + power(d_sum(p_weight*RR_weight)/sum(p_weight*RR_weight),2) );
*                      with d_sum(p_weight*RR_weight) = sqrt( sum( power(p_weight*d_RR_weight,2) ) );
*          d_PAF_wgh = PAF_wgh * sqrt(  sum( power(p'_weight*d_RR_weight,2) )/power(sum(p'_weight*RR_weight),2)
*                                     + sum( power(p_weight*d_RR_weight,2) )/power(sum(p_weight*RR_weight),2) );

PAF_scn(diet_scn,"weight",cause,r,yrs_scn,"std",age)
         $sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age))
         = PAF_scn(diet_scn,"weight",cause,r,yrs_scn,"mean",age)
         * sqrt(   sum(weight, power(weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"mean",age)),2)
                 + sum(weight, power(weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age)),2) );

*        PAF disagg for underweight:
weight_scn(diet_scn,weight,r,yrs_scn)        = weight_scn("BMK",weight,r,yrs_scn);
weight_scn(diet_scn,"underweight",r,yrs_scn) = weight_ref(diet_scn,"underweight",r,yrs_scn);
weight_scn(diet_scn,"normal",r,yrs_scn)      = 1 - sum(weight_riskf, weight_scn(diet_scn,weight_riskf,r,yrs_scn));
PAF_scn(diet_scn,"underweight",cause,r,yrs_scn,"mean",age)$sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age))
         = 1- ( sum(weightt, weight_scn(diet_scn,weightt,r,yrs_scn)*RR_scn_age(diet_scn,weightt,cause,r,yrs_scn,"mean",age))
               /sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age)) );

PAF_scn(diet_scn,"underweight",cause,r,yrs_scn,"std",age)
         $sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age))
         = PAF_scn(diet_scn,"underweight",cause,r,yrs_scn,"mean",age)
         * sqrt(   sum(weight, power(weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"mean",age)),2)
                 + sum(weight, power(weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age)),2) );

*        PAF disagg for overweight:
weight_scn(diet_scn,weight,r,yrs_scn)       = weight_scn("BMK",weight,r,yrs_scn);
weight_scn(diet_scn,"overweight",r,yrs_scn) = weight_ref(diet_scn,"overweight",r,yrs_scn);
weight_scn(diet_scn,"normal",r,yrs_scn)     = 1 - sum(weight_riskf, weight_scn(diet_scn,weight_riskf,r,yrs_scn));
PAF_scn(diet_scn,"overweight",cause,r,yrs_scn,"mean",age)$sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age))
         = 1- ( sum(weightt, weight_scn(diet_scn,weightt,r,yrs_scn)*RR_scn_age(diet_scn,weightt,cause,r,yrs_scn,"mean",age))
               /sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age)) );

PAF_scn(diet_scn,"overweight",cause,r,yrs_scn,"std",age)
         $sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age))
         = PAF_scn(diet_scn,"overweight",cause,r,yrs_scn,"mean",age)
         * sqrt(   sum(weight, power(weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"mean",age)),2)
                 + sum(weight, power(weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age)),2) );

*        PAF disagg for obesity:
weight_scn(diet_scn,weight,r,yrs_scn)   = weight_scn("BMK",weight,r,yrs_scn);
weight_scn(diet_scn,weight_obese,r,yrs_scn)  = weight_ref(diet_scn,weight_obese,r,yrs_scn);
weight_scn(diet_scn,"normal",r,yrs_scn) = 1 - sum(weight_riskf, weight_scn(diet_scn,weight_riskf,r,yrs_scn));
PAF_scn(diet_scn,"obese",cause,r,yrs_scn,"mean",age)$sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age))
         = 1- ( sum(weightt, weight_scn(diet_scn,weightt,r,yrs_scn)*RR_scn_age(diet_scn,weightt,cause,r,yrs_scn,"mean",age))
               /sum(weightt, weight_scn("BMK",weightt,r,yrs_scn)*RR_scn_age("BMK",weightt,cause,r,yrs_scn,"mean",age)) );

PAF_scn(diet_scn,"obese",cause,r,yrs_scn,"std",age)
         $sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age))
         = PAF_scn(diet_scn,"obese",cause,r,yrs_scn,"mean",age)
         * sqrt(   sum(weight, power(weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn(diet_scn,weight,r,yrs_scn)*RR_scn_age(diet_scn,weight,cause,r,yrs_scn,"mean",age)),2)
                 + sum(weight, power(weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"std",age),2) )
                 / power( sum(weight, weight_scn("BMK",weight,r,yrs_scn)*RR_scn_age("BMK",weight,cause,r,yrs_scn,"mean",age)),2) );

*-------------------------------------------------------------------------------

*        - combined risk factors:
PAF_scn(diet_scn,"all-rf",cause,r,yrs_scn,stats,age)
         = 1 - prod(riskf_c, 1-PAF_scn(diet_scn,riskf_c,cause,r,yrs_scn,stats,age));

PAF_scn(diet_scn,"all-rf",cause,r,yrs_scn,"std",age)
         = sqrt(   sum(riskf_c,   power(PAF_scn(diet_scn,riskf_c,cause,r,yrs_scn,"std",age) ,2))
                 + prod(riskf_c,  power(PAF_scn(diet_scn,riskf_c,cause,r,yrs_scn,"mean",age),2))
                 * ( sum(riskf_c, power(PAF_scn(diet_scn,riskf_c,cause,r,yrs_scn,"std",age)
                                 /PAF_scn(diet_scn,riskf_c,cause,r,yrs_scn,"mean",age),2)$PAF_scn(diet_scn,riskf_c,cause,r,yrs_scn,"mean",age)) ) );

*-------------------------------------------------------------------------------