*-------------------------------------------------------------------------------
*        consumption data:
*-------------------------------------------------------------------------------

$ontext
$include regions_0203

set      fg                food groups
         /wheat, rice, maize, othr_grains, roots, sugar, legumes, soybeans,
          nuts_seeds, oil_veg, oil_palm, vegetables, fruits_trop, fruits_temp, fruits_starch,
          beef, lamb, pork, poultry, eggs, milk, shellfish, fish_freshw, fish_pelag, fish_demrs,
          othrcrp/

         riskf_d           diet-related risk factors
         /fruits, vegetables, nuts_seeds, legumes, red_meat/

         fg_redmeat(fg)   /beef, lamb, pork/
         fg_fruits(fg)    /fruits_temp, fruits_trop, fruits_starch/
         fg_legumes(fg)   /legumes, soybeans/
         fg_fish(fg)      /shellfish, fish_freshw, fish_pelag, fish_demrs/

         unit_wpp          consumption unit /"g/d", "kcal/d", "g/d_w", "kcal/d_w"/
         unit_wp(unit_wpp) consumption unit(net of waste)    /"g/d_w", "kcal/d_w"/

         diet_scn_p           diet scenarios                /BMK, FLX, PSC, VEG, VGN/
         diet_scn(diet_scn_p) diet scenarios (wo benchmark) /FLX, PSC, VEG, VGN/
;

parameter cons_scn_data(diet_scn_p,unit_wpp,fg,rgs,yrs_scn) data on consumption scenarios
          cons_scn(diet_scn_p,unit_wpp,riskf_d,rgs,yrs_scn) consumption scenarios
;
$offtext

*-------------------------------------------------------------------------------

*        use dietary patterns defined by EAT-Lancet Commission:

$gdxin cons_scn_0203.gdx
$load cons_scn_data
$gdxin

*-------------------------------------------------------------------------------

*        assign to consumption parameter:

cons_scn(diet_scn_p,"g/d_w","red_meat",rgs,"2010")   = sum(fg_redmeat, cons_scn_data(diet_scn_p,"g/d_w",fg_redmeat,rgs,"2010"));
cons_scn(diet_scn_p,"g/d_w","fruits",rgs,"2010")     = sum(fg_fruits, cons_scn_data(diet_scn_p,"g/d_w",fg_fruits,rgs,"2010"));
cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,"2010") = cons_scn_data(diet_scn_p,"g/d_w","vegetables",rgs,"2010");
cons_scn(diet_scn_p,"g/d_w","legumes",rgs,"2010")    = sum(fg_legumes, cons_scn_data(diet_scn_p,"g/d_w",fg_legumes,rgs,"2010"));
cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,"2010") = cons_scn_data(diet_scn_p,"g/d_w","nuts_seeds",rgs,"2010");
*cons_scn(diet_scn_p,"g/d_w","fish",rgs,"2010")       = sum(fg_fish, cons_scn_data(diet_scn_p,"g/d_w",fg_fish,rgs,"2010"));

*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------

