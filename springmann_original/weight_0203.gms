*-------------------------------------------------------------------------------
*        weight data:
*-------------------------------------------------------------------------------

$ontext
$include regions_0203

sets     weight  weight classification
                 /underweight, normal, overweight, obese_g1, obese_g2, obese_g3/

         sex     sex     /BTH, FML, MLE/

         diet_scn_p           diet scenarios                /BMK, FLX, PSC, VEG, VGN/
         diet_scn(diet_scn_p) diet scenarios (wo benchmark) /FLX, PSC, VEG, VGN/
;

parameters BMI_data(rgs,sex,yrs_scn,weight)          NCD-RisC data on weight distributions and BMI
           weight_scn(diet_scn_p,weight,rgs,yrs_scn) summary of weight distribution in diet scenarios
           weight_ref(diet_scn_p,weight,rgs,yrs_scn) weight distribution in diet scenarios for reference
;
$offtext

*-------------------------------------------------------------------------------

*        load data on weight distribution:

$gdxin weight_data_0203.gdx
$load BMI_data
$gdxin

*-------------------------------------------------------------------------------

*        assign to weight parameter:
weight_scn("BMK",weight,r,"2010") = BMI_data(r,"BTH","2010",weight);

*        define weight scenarios by moving everybody to normal weight:
weight_scn(diet_scn,weight,r,yrs_scn)   = 0;
weight_scn(diet_scn,"normal",r,yrs_scn) = 1;

*        save weight scenarios for decomposition:
weight_ref(diet_scn_p,weight,r,yrs_scn)
         = weight_scn(diet_scn_p,weight,r,yrs_scn);

*-------------------------------------------------------------------------------