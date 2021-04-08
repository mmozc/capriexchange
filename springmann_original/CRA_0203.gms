*-------------------------------------------------------------------------------
*        Health modelling of diet scenarios:
*-------------------------------------------------------------------------------

*        Reference:

*        Springmann, M., Wiebe, K., Mason-D'Croz, D., Sulser, T. B., Rayner, M.,
*        & Scarborough, P. (2018). Health and nutritional aspects of sustainable
*        diet strategies and their relationship to environmental impacts - a
*        comparative global modelling analysis with country-level detail.
*        Lancet Planetary Health, 2, e451-e461

*-------------------------------------------------------------------------------

*        set name of output file:
$if not set report_name  $set report_name CRA_0203

*-------------------------------------------------------------------------------

*        load regional aggregation
$include regions_0203

*-------------------------------------------------------------------------------

*        initialise sets and parameters:
$include sets_0203
$include parameters_0203

*-------------------------------------------------------------------------------

*        load mortality and population stats (< dr_0203.gdx):
$include data_0203

*-------------------------------------------------------------------------------

*        load consumption data (< cons_scn_0203.gdx):
$include cons_0203

*-------------------------------------------------------------------------------

*        load weight data (< weight_data_0203.gdx):
$include weight_0203

*-------------------------------------------------------------------------------

*        calculate relative risks:
$include RR_0203

*-------------------------------------------------------------------------------

*        calculate population attributable fractions (PAFs):
$include PAF_0203

*-------------------------------------------------------------------------------

*        estimate final health outcomes (attributable deaths, etc):
$include health_0203

*-------------------------------------------------------------------------------

*        write report to database and spreadsheet:
$include report_0203

*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------




