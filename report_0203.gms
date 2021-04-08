*-------------------------------------------------------------------------------
*        Compile report:
*-------------------------------------------------------------------------------

$ontext
set        report_itm      items included in summary report
                           /"%deaths_avd_prm/all", "%deaths_avd/all",
                            deaths_avd, deaths_avd_prm/
;

parameter  report_health(report_itm,diet_scn_p,riskf_p,cause_p,rgs,stats) report of health analysis
;
$offtext

*-------------------------------------------------------------------------------

*        compile report:

report_health(report_itm,diet_scn_p,riskf_p,cause_p,rgs,stats)
         = health_scn(report_itm,diet_scn_p,riskf_p,cause_p,rgs,"2010",stats);

report_health(report_itm,diet_scn_p,riskf_p,cause_p,rgs,"std") = 0;

*-------------------------------------------------------------------------------
*        Unload data:
*-------------------------------------------------------------------------------

*        write to database:
execute_unload '%report_name%.gdx' report_health, cons_scn, weight_ref, RR_scn, r_data;

*-------------------------------------------------------------------------------

*        uncomment $exit (*$exit) for writing results to spreadsheet:
$exit

*        write to spreadsheet:
$onecho >gdxxrw.rsp
text="item"            rng="health_analysis!a1"
text="diet_scn"        rng="health_analysis!b1"
text="risk_fct"        rng="health_analysis!c1"
text="disease"         rng="health_analysis!d1"
text="region"          rng="health_analysis!e1"
text="stats"           rng="health_analysis!f1"
text="value"           rng="health_analysis!g1"
par=report_health cdim=0 rng="health_analysis!a2"
$offecho

execute 'gdxxrw.exe i=%report_name%.gdx o=%report_name%.xlsx @gdxxrw.rsp';

*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
