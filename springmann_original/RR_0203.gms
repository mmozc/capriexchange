*-------------------------------------------------------------------------------
*        relative risk factors:
*-------------------------------------------------------------------------------

$ontext
sets     riskf(riskf_p)          food-related risk factors
         /fruits, vegetables, nuts_seeds, legumes, red_meat,
          underweight, overweight, obese, obese_g1, obese_g2, obese_g3/
         riskf_pos(riskf_p)      risk factors with positive health impacts
         /fruits, vegetables, legumes, nuts_seeds/
         riskf_neg(riskf_p)      risk factors with negtiave health impacts
         /red_meat, underweight, overweight, obese, obese_g1, obese_g2, obese_g3/
         riskf_max(riskf_p)      food-related risk factors with TMREL
         /nuts_seeds/
         cause_bmi(cause_p)
         /CHD, stroke, cancer, resp_dis, T2DM/
;

parameters RR_data(riskf,cause,stats)       relative risks per 100 g
           RR_age(riskf,cause,stats,age_p)  relative risks scaled by age
           RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,stats)           relative risks for consumption scenarios
           RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,stats,age_p) relative risks by scenario and age
           TMREL              theoretical minimum risk exposure level for risk factor
           TMREL_max(riskf_d) max intake after which no additional benefit occurs
;
$offtext

*-------------------------------------------------------------------------------

*        RRs for fruits and vegetables from Aune et al (2017):
*        - use RRs for mortality (instead of incidence or both)

*        no further increase in benefits beyond 800-900 g/d (due to no data):
TMREL("FV")         = 900;
TMREL("fruits")     = 800;
TMREL("vegetables") = 600;

*        FV and CHD:

*        - non-linear until 850 g/d:
RR_data("FV","CHD","mean") = 0.96;
RR_data("FV","CHD","low")  = 0.94;
RR_data("FV","CHD","high") = 0.98;

*        - non-linear until 800 g/d
RR_data("fruits","CHD","mean") = 0.95;
RR_data("fruits","CHD","low")  = 0.92;
RR_data("fruits","CHD","high") = 0.99;

*        - non-linear until 600 g/d:
RR_data("vegetables","CHD","mean") = 0.84;
RR_data("vegetables","CHD","low")  = 0.80;
RR_data("vegetables","CHD","high") = 0.88;

*        FV and stroke:

*        - non-linear until 850 g/d:
RR_data("FV","stroke","mean") = 0.90;
RR_data("FV","stroke","low")  = 0.87;
RR_data("FV","stroke","high") = 0.93;

*        - non-linear until 800 g/d
RR_data("fruits","stroke","mean") = 0.77;
RR_data("fruits","stroke","low")  = 0.70;
RR_data("fruits","stroke","high") = 0.84;

*        - non-linear until 500 g/d:
RR_data("vegetables","stroke","mean") = 0.95;
RR_data("vegetables","stroke","low")  = 0.87;
RR_data("vegetables","stroke","high") = 1.03;

*        FV and cancer:

*        - non-linear until 900 g/d:
RR_data("FV","cancer","mean") = 0.97;
RR_data("FV","cancer","low")  = 0.96;
RR_data("FV","cancer","high") = 0.98;

*        - non-linear until 600 g/d
RR_data("fruits","cancer","mean") = 0.94;
RR_data("fruits","cancer","low")  = 0.91;
RR_data("fruits","cancer","high") = 0.97;

*        - non-linear until 600 g/d:
RR_data("vegetables","cancer","mean") = 0.93;
RR_data("vegetables","cancer","low")  = 0.91;
RR_data("vegetables","cancer","high") = 0.95;

*        non-linear RRs (Aune et al, 2016, 2017):

set
*         stats   /mean, low, high, std/
         intake  /0*900/;

table    RR_FV_CHD(intake,stats)
           mean        low         high
36         1.00        1.00        1.00
50         0.99        0.98        0.99
100        0.96        0.94        0.98
150        0.93        0.90        0.96
200        0.91        0.87        0.94
250        0.88        0.84        0.93
300        0.86        0.82        0.91
350        0.84        0.79        0.90
400        0.83        0.78        0.88
450        0.81        0.76        0.87
500        0.80        0.75        0.85
550        0.79        0.73        0.84
600        0.77        0.72        0.83
650        0.76        0.71        0.82
700        0.75        0.70        0.81
750        0.74        0.69        0.80
800        0.73        0.68        0.79
850        0.72        0.67        0.78
;

table    RR_fruits_CHD(intake,stats)
           mean        low         high
6          1.00        1.00        1.00
50         0.98        0.96        0.99
100        0.95        0.92        0.99
150        0.93        0.89        0.98
200        0.91        0.86        0.96
250        0.89        0.84        0.94
300        0.87        0.81        0.92
350        0.85        0.79        0.90
400        0.82        0.77        0.88
450        0.81        0.75        0.86
500        0.79        0.73        0.85
550        0.77        0.71        0.83
600        0.75        0.69        0.82
650        0.73        0.67        0.80
700        0.71        0.65        0.79
750        0.70        0.63        0.78
800        0.69        0.62        0.77
;

table RR_vegetables_CHD(intake,stats)
           mean        low         high
11         1.00        1.00        1.00
50         0.92        0.90        0.95
100        0.84        0.80        0.88
150        0.78        0.72        0.83
200        0.73        0.67        0.79
250        0.70        0.64        0.77
300        0.68        0.62        0.75
350        0.67        0.60        0.73
400        0.66        0.60        0.73
450        0.65        0.59        0.72
500        0.65        0.59        0.71
550        0.64        0.58        0.71
600        0.64        0.58        0.70
;

table    RR_FV_stroke(intake,stats)
           mean        low         high
34         1.00        1.00        1.00
50         0.98        0.97        0.98
100        0.90        0.87        0.93
150        0.83        0.79        0.87
200        0.77        0.72        0.83
250        0.73        0.67        0.79
300        0.69        0.63        0.76
350        0.66        0.60        0.73
400        0.63        0.57        0.70
450        0.61        0.55        0.68
500        0.59        0.53        0.67
550        0.57        0.50        0.65
600        0.56        0.48        0.64
650        0.54        0.46        0.63
700        0.52        0.44        0.61
750        0.50        0.42        0.60
800        0.49        0.40        0.59
850        0.48        0.39        0.59
;

table    RR_fruits_stroke(intake,stats)
           mean        low         high
6          1.00        1.00        1.00
50         0.88        0.84        0.92
100        0.77        0.70        0.84
150        0.70        0.61        0.79
200        0.64        0.55        0.75
250        0.61        0.52        0.72
300        0.59        0.49        0.70
350        0.57        0.48        0.69
400        0.57        0.47        0.69
450        0.56        0.46        0.69
500        0.56        0.46        0.69
550        0.56        0.45        0.69
600        0.56        0.45        0.69
650        0.55        0.44        0.70
700        0.55        0.43        0.70
750        0.55        0.43        0.71
800        0.55        0.42        0.71
;

*        no significant risk reduction of stroke for vegetables,
*        but keep in as significant effect in all other recent
*        meta-analyses (see, e.g., Micha et al, 2017)
*        [NB: incidence stroke is significant and combination of
*         incidence and mortality as well, which might also have
*         been used by Micha et al (2017)]:
table    RR_vegetables_stroke(intake,stats)
           mean        low         high
11         1.00        1.00        1.00
50         0.98        0.94        1.02
100        0.95        0.87        1.03
150        0.92        0.82        1.04
200        0.90        0.78        1.04
250        0.88        0.76        1.03
300        0.86        0.74        1.01
350        0.85        0.72        1.00
400        0.83        0.71        0.98
450        0.82        0.69        0.97
500        0.81        0.68        0.96
;

table    RR_FV_cancer(intake,stats)
           mean        low         high
40         1.00        1.00        1.00
50         0.99        0.99        1.00
100        0.97        0.96        0.98
150        0.94        0.93        0.96
200        0.92        0.89        0.94
250        0.90        0.87        0.93
300        0.88        0.84        0.91
350        0.86        0.83        0.90
400        0.85        0.81        0.89
450        0.84        0.80        0.88
500        0.83        0.79        0.88
550        0.83        0.79        0.87
600        0.83        0.79        0.86
650        0.82        0.79        0.86
700        0.82        0.79        0.86
750        0.82        0.79        0.86
800        0.82        0.78        0.85
850        0.82        0.78        0.85
900        0.82        0.78        0.85
;

table    RR_fruits_cancer(intake,stats)
           mean        low         high
6          1.00        1.00        1.00
50         0.97        0.95        0.98
100        0.94        0.91        0.97
150        0.92        0.88        0.96
200        0.90        0.86        0.95
250        0.89        0.84        0.94
300        0.88        0.83        0.93
350        0.88        0.83        0.93
400        0.87        0.83        0.92
450        0.87        0.83        0.92
500        0.87        0.83        0.91
550        0.87        0.82        0.91
600        0.86        0.82        0.91
;

table    RR_vegetables_cancer(intake,stats)
           mean        low         high
20         1.00        1.00        1.00
50         0.96        0.95        0.98
100        0.93        0.91        0.95
150        0.90        0.86        0.93
200        0.87        0.83        0.91
250        0.85        0.80        0.89
300        0.83        0.78        0.88
350        0.82        0.77        0.88
400        0.82        0.76        0.87
450        0.82        0.76        0.87
500        0.81        0.76        0.88
550        0.81        0.75        0.88
600        0.81        0.75        0.88
;

*-------------------------------------------------------------------------------

*        RRs for nuts and seeds from Aune et al (2016):
*        - use RRs for mortality (instead of incidence or both)
*        - for increase of 28 g/d;

*        no further increase in benefits beyond 20 g/d:
*        but non-linear RRs are defined until 28:
TMREL("nuts_seeds") = 28;

*        nuts_seeds and CHD:

*        - non-linear until 28 g/d:
RR_data("nuts_seeds","CHD","mean") = 0.71**(1/0.28);
RR_data("nuts_seeds","CHD","low")  = 0.63**(1/0.28);
RR_data("nuts_seeds","CHD","high") = 0.80**(1/0.28);

*        nuts_seeds and stroke:

*        - non-linear until 28 g/d:
RR_data("nuts_seeds","stroke","mean") = 0.93**(1/0.28);
RR_data("nuts_seeds","stroke","low")  = 0.83**(1/0.28);
RR_data("nuts_seeds","stroke","high") = 1.05**(1/0.28);

*        nuts_seeds and cancer:

*        - non-linear until 28 g/d:
RR_data("nuts_seeds","cancer","mean") = 0.85**(1/0.28);
RR_data("nuts_seeds","cancer","low")  = 0.76**(1/0.28);
RR_data("nuts_seeds","cancer","high") = 0.94**(1/0.28);

*        nuts_seeds and T2DM:

*        - non-linear until 28 g/d:
RR_data("nuts_seeds","T2DM","mean") = 0.61**(1/0.28);
RR_data("nuts_seeds","T2DM","low")  = 0.43**(1/0.28);
RR_data("nuts_seeds","T2DM","high") = 0.88**(1/0.28);


table    RR_nuts_CHD(intake,stats)
          mean        low         high
0         1.00        1.00        1.00
5         0.88        0.86        0.90
10        0.81        0.78        0.83
15        0.77        0.74        0.79
20        0.75        0.72        0.77
25        0.74        0.71        0.77
28        0.73        0.70        0.77
;

*        no statistically significant risk reduction of stroke for nuts:
table    RR_nuts_stroke(intake,stats)
          mean        low         high
0         1.00        1.00        1.00
5         0.97        0.92        1.01
10        0.95        0.90        1.01
15        0.96        0.90        1.02
20        0.97        0.91        1.04
25        0.99        0.91        1.08
;

table    RR_nuts_cancer(intake,stats)
          mean        low         high
0         1.00        1.00        1.00
5         0.93        0.91        0.96
10        0.90        0.86        0.94
15        0.88        0.85        0.92
20        0.88        0.85        0.91
25        0.89        0.85        0.92
;

table    RR_nuts_T2DM(intake,stats)
          mean        low         high
0         1.00        1.00        1.00
5         0.80        0.69        0.93
10        0.72        0.60        0.86
15        0.71        0.62        0.82
20        0.74        0.63        0.86
25        0.76        0.60        0.97
;

*-------------------------------------------------------------------------------

*        RRs for legumes from Afshin et al (2014):
*        - serving size: 4 x 100 g/wk

*        - median intake ranged from 0 to 938 g/wk -> TMREL = 938/7 = 134
TMREL("legumes") = 138;

RR_data("legumes","CHD","mean") = 0.86**(1/(4/7));
RR_data("legumes","CHD","low")  = 0.78**(1/(4/7));
RR_data("legumes","CHD","high") = 0.94**(1/(4/7));

*-------------------------------------------------------------------------------

*        RR for red and processed meat:

*        - no lower bound for red meat consumption:
TMREL("r+p_meat") = 0.001;

*        Bechthold et al (2019),
*        "Food groups and risk of coronary heart disease,
*        stroke and heart failure: A systematic review
*        and dose-response meta-analysis of prospective
*        studies"

*        Schwingshackl et al (2017),
*        "Food groups and risk of type 2 diabetes mellitus: a systematic
*        review and meta-analysis of prospective studies"

*        - per 100 g/d increase
RR_data("red_meat","CHD","mean") = 1.15;
RR_data("red_meat","CHD","low")  = 1.08;
RR_data("red_meat","CHD","high") = 1.23;

RR_data("red_meat","Stroke","mean") = 1.12;
RR_data("red_meat","Stroke","low")  = 1.06;
RR_data("red_meat","Stroke","high") = 1.17;

RR_data("red_meat","T2DM","mean") = 1.17;
RR_data("red_meat","T2DM","low")  = 1.08;
RR_data("red_meat","T2DM","high") = 1.26;

*        - per 50 g/d increase:
RR_data("prc_meat","CHD","mean") = 1.27**(1/0.5);
RR_data("prc_meat","CHD","low")  = 1.09**(1/0.5);
RR_data("prc_meat","CHD","high") = 1.49**(1/0.5);

RR_data("prc_meat","Stroke","mean") = 1.17**(1/0.5);
RR_data("prc_meat","Stroke","low")  = 1.02**(1/0.5);
RR_data("prc_meat","Stroke","high") = 1.34**(1/0.5);

RR_data("prc_meat","T2DM","mean") = 1.37**(1/0.5);
RR_data("prc_meat","T2DM","low")  = 1.22**(1/0.5);
RR_data("prc_meat","T2DM","high") = 1.55**(1/0.5);

*-------------------------------------------------------------------------------

*        weight-related risk factors from Global BMI Collab (2016):

*        weight classification:
*        - underweight (BMI: 15 to <18.5)
*        - normal weight (BMI: 18.5 to <25)
*        - overweight (BMI: 25 to <30)
*        - obesity grade 1 (BMI: 30 to <35)
*        - obesity grade 2 (BMI: 35 to <40)
*        - obesity grade 3 (BMI: 40 to <60)

RR_data("underweight","CHD","mean") = 1.17;
RR_data("underweight","CHD","low")  = 1.09;
RR_data("underweight","CHD","high") = 1.24;

RR_data("underweight","stroke","mean") = 1.37;
RR_data("underweight","stroke","low")  = 1.23;
RR_data("underweight","stroke","high") = 1.53;

RR_data("underweight","cancer","mean") = 1.10;
RR_data("underweight","cancer","low")  = 1.05;
RR_data("underweight","cancer","high") = 1.16;

RR_data("underweight","resp_dis","mean") = 2.73;
RR_data("underweight","resp_dis","low")  = 2.31;
RR_data("underweight","resp_dis","high") = 3.23;

RR_data("normal",cause_bmi,stats) = 1;

RR_data("overweight","CHD","mean") = 1.34;
RR_data("overweight","CHD","low")  = 1.32;
RR_data("overweight","CHD","high") = 1.35;

RR_data("overweight","stroke","mean") = 1.11;
RR_data("overweight","stroke","low")  = 1.09;
RR_data("overweight","stroke","high") = 1.14;

RR_data("overweight","cancer","mean") = 1.10;
RR_data("overweight","cancer","low")  = 1.09;
RR_data("overweight","cancer","high") = 1.12;

RR_data("overweight","resp_dis","mean") = 0.90;
RR_data("overweight","resp_dis","low")  = 0.87;
RR_data("overweight","resp_dis","high") = 0.94;

RR_data("obese_g1","CHD","mean") = 2.02;
RR_data("obese_g1","CHD","low")  = 1.91;
RR_data("obese_g1","CHD","high") = 2.13;

RR_data("obese_g1","stroke","mean") = 1.46;
RR_data("obese_g1","stroke","low")  = 1.39;
RR_data("obese_g1","stroke","high") = 1.54;

RR_data("obese_g1","cancer","mean") = 1.31;
RR_data("obese_g1","cancer","low")  = 1.28;
RR_data("obese_g1","cancer","high") = 1.34;

RR_data("obese_g1","resp_dis","mean") = 1.16;
RR_data("obese_g1","resp_dis","low")  = 1.08;
RR_data("obese_g1","resp_dis","high") = 1.24;

RR_data("obese_g2","CHD","mean") = 2.81;
RR_data("obese_g2","CHD","low")  = 2.63;
RR_data("obese_g2","CHD","high") = 3.01;

RR_data("obese_g2","stroke","mean") = 2.11;
RR_data("obese_g2","stroke","low")  = 1.93;
RR_data("obese_g2","stroke","high") = 2.30;

RR_data("obese_g2","cancer","mean") = 1.57;
RR_data("obese_g2","cancer","low")  = 1.50;
RR_data("obese_g2","cancer","high") = 1.63;

RR_data("obese_g2","resp_dis","mean") = 1.79;
RR_data("obese_g2","resp_dis","low")  = 1.60;
RR_data("obese_g2","resp_dis","high") = 1.99;

RR_data("obese_g3","CHD","mean") = 3.81;
RR_data("obese_g3","CHD","low")  = 3.47;
RR_data("obese_g3","CHD","high") = 4.17;

RR_data("obese_g3","stroke","mean") = 2.33;
RR_data("obese_g3","stroke","low")  = 2.05;
RR_data("obese_g3","stroke","high") = 2.65;

RR_data("obese_g3","cancer","mean") = 1.96;
RR_data("obese_g3","cancer","low")  = 1.83;
RR_data("obese_g3","cancer","high") = 2.09;

RR_data("obese_g3","resp_dis","mean") = 2.85;
RR_data("obese_g3","resp_dis","low")  = 2.43;
RR_data("obese_g3","resp_dis","high") = 3.34;

*        diabetes associations from Prospective Studies Collaboration (2009)
*        (Webtable 9 for never-smokers in line with BMI collab):

*        not significant before BMI 25-50 range:
RR_data("underweight","T2DM",stats) = 1;
RR_data("normal","T2DM",stats)      = 1;

RR_data("overweight","T2DM","mean") = 1.88;
RR_data("overweight","T2DM","low")  = 1.56;
RR_data("overweight","T2DM","high") = 2.11;

RR_data("obese_g1","T2DM","mean") = 1.88**(10/5);
RR_data("obese_g1","T2DM","low")  = 1.56**(10/5);
RR_data("obese_g1","T2DM","high") = 2.11**(10/5);

RR_data("obese_g2","T2DM","mean") = 1.88**(15/5);
RR_data("obese_g2","T2DM","low")  = 1.56**(15/5);
RR_data("obese_g2","T2DM","high") = 2.11**(15/5);

RR_data("obese_g3","T2DM","mean") = 1.88**(20/5);
RR_data("obese_g3","T2DM","low")  = 1.56**(20/5);
RR_data("obese_g3","T2DM","high") = 2.11**(20/5);

*-------------------------------------------------------------------------------

*        assign non-linear relative risks:

*        fruits:

RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=50) = RR_fruits_CHD("50",stats)**(1/0.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>50  and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=100) = RR_fruits_CHD("100",stats);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>100 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=150) = RR_fruits_CHD("150",stats)**(1/1.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>150 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=200) = RR_fruits_CHD("200",stats)**(1/2.0);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>200 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=250) = RR_fruits_CHD("250",stats)**(1/2.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>250 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=300) = RR_fruits_CHD("300",stats)**(1/3.0);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>300 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=350) = RR_fruits_CHD("350",stats)**(1/3.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>350 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=400) = RR_fruits_CHD("400",stats)**(1/4.0);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>400 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=450) = RR_fruits_CHD("450",stats)**(1/4.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>450 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=500) = RR_fruits_CHD("500",stats)**(1/5.0);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>500 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=550) = RR_fruits_CHD("550",stats)**(1/5.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>550 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=600) = RR_fruits_CHD("600",stats)**(1/6.0);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>600 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=650) = RR_fruits_CHD("650",stats)**(1/6.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>650 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=700) = RR_fruits_CHD("700",stats)**(1/7.0);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>700 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=750) = RR_fruits_CHD("750",stats)**(1/7.5);
RR_scn(diet_scn_p,"fruits","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>750) = RR_fruits_CHD("800",stats)**(1/8.0);

RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=50) = RR_fruits_stroke("50",stats)**(1/0.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>50  and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=100) = RR_fruits_stroke("100",stats);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>100 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=150) = RR_fruits_stroke("150",stats)**(1/1.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>150 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=200) = RR_fruits_stroke("200",stats)**(1/2.0);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>200 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=250) = RR_fruits_stroke("250",stats)**(1/2.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>250 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=300) = RR_fruits_stroke("300",stats)**(1/3.0);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>300 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=350) = RR_fruits_stroke("350",stats)**(1/3.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>350 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=400) = RR_fruits_stroke("400",stats)**(1/4.0);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>400 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=450) = RR_fruits_stroke("450",stats)**(1/4.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>450 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=500) = RR_fruits_stroke("500",stats)**(1/5.0);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>500 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=550) = RR_fruits_stroke("550",stats)**(1/5.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>550 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=600) = RR_fruits_stroke("600",stats)**(1/6.0);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>600 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=650) = RR_fruits_stroke("650",stats)**(1/6.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>650 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=700) = RR_fruits_stroke("700",stats)**(1/7.0);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>700 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=750) = RR_fruits_stroke("750",stats)**(1/7.5);
RR_scn(diet_scn_p,"fruits","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>750) = RR_fruits_stroke("800",stats)**(1/8.0);

RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=50) = RR_fruits_cancer("50",stats)**(1/0.5);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>50  and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=100) = RR_fruits_cancer("100",stats);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>100 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=150) = RR_fruits_cancer("150",stats)**(1/1.5);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>150 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=200) = RR_fruits_cancer("200",stats)**(1/2.0);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>200 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=250) = RR_fruits_cancer("250",stats)**(1/2.5);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>250 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=300) = RR_fruits_cancer("300",stats)**(1/3.0);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>300 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=350) = RR_fruits_cancer("350",stats)**(1/3.5);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>350 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=400) = RR_fruits_cancer("400",stats)**(1/4.0);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>400 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=450) = RR_fruits_cancer("450",stats)**(1/4.5);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>450 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=500) = RR_fruits_cancer("500",stats)**(1/5.0);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>500 and cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)<=550) = RR_fruits_cancer("550",stats)**(1/5.5);
RR_scn(diet_scn_p,"fruits","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","fruits",rgs,yrs_scn)>550) = RR_fruits_cancer("600",stats)**(1/6.0);

*        vegetables (no impact on stroke):

RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=50) = RR_vegetables_CHD("50",stats)**(1/0.5);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>50  and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=100) = RR_vegetables_CHD("100",stats);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>100 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=150) = RR_vegetables_CHD("150",stats)**(1/1.5);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>150 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=200) = RR_vegetables_CHD("200",stats)**(1/2.0);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>200 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=250) = RR_vegetables_CHD("250",stats)**(1/2.5);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>250 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=300) = RR_vegetables_CHD("300",stats)**(1/3.0);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>300 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=350) = RR_vegetables_CHD("350",stats)**(1/3.5);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>350 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=400) = RR_vegetables_CHD("400",stats)**(1/4.0);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>400 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=450) = RR_vegetables_CHD("450",stats)**(1/4.5);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>450 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=500) = RR_vegetables_CHD("500",stats)**(1/5.0);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>500 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=550) = RR_vegetables_CHD("550",stats)**(1/5.5);
RR_scn(diet_scn_p,"vegetables","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>550) = RR_vegetables_CHD("600",stats)**(1/6.0);

RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=50) = RR_vegetables_stroke("50",stats)**(1/0.5);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>50  and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=100) = RR_vegetables_stroke("100",stats);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>100 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=150) = RR_vegetables_stroke("150",stats)**(1/1.5);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>150 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=200) = RR_vegetables_stroke("200",stats)**(1/2.0);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>200 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=250) = RR_vegetables_stroke("250",stats)**(1/2.5);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>250 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=300) = RR_vegetables_stroke("300",stats)**(1/3.0);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>300 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=350) = RR_vegetables_stroke("350",stats)**(1/3.5);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>350 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=400) = RR_vegetables_stroke("400",stats)**(1/4.0);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>400 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=450) = RR_vegetables_stroke("450",stats)**(1/4.5);
RR_scn(diet_scn_p,"vegetables","stroke",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>450) = RR_vegetables_stroke("500",stats)**(1/5.0);

RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=50) = RR_vegetables_cancer("50",stats)**(1/0.5);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>50  and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=100) = RR_vegetables_cancer("100",stats);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>100 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=150) = RR_vegetables_cancer("150",stats)**(1/1.5);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>150 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=200) = RR_vegetables_cancer("200",stats)**(1/2.0);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>200 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=250) = RR_vegetables_cancer("250",stats)**(1/2.5);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>250 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=300) = RR_vegetables_cancer("300",stats)**(1/3.0);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>300 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=350) = RR_vegetables_cancer("350",stats)**(1/3.5);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>350 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=400) = RR_vegetables_cancer("400",stats)**(1/4.0);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>400 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=450) = RR_vegetables_cancer("450",stats)**(1/4.5);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>450 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=500) = RR_vegetables_cancer("500",stats)**(1/5.0);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>500 and cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)<=550) = RR_vegetables_cancer("550",stats)**(1/5.5);
RR_scn(diet_scn_p,"vegetables","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","vegetables",rgs,yrs_scn)>550) = RR_vegetables_cancer("600",stats)**(1/6.0);

*        nuts and seeds (no impact on stroke) [scale to 10 g/d]:

RR_scn(diet_scn_p,"nuts_seeds","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=5) = RR_nuts_CHD("5",stats)**(0.10/0.05);
RR_scn(diet_scn_p,"nuts_seeds","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>5  and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=10) = RR_nuts_CHD("10",stats)**(0.10/0.10);
RR_scn(diet_scn_p,"nuts_seeds","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>10 and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=15) = RR_nuts_CHD("15",stats)**(0.10/0.15);
RR_scn(diet_scn_p,"nuts_seeds","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>15 and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=20) = RR_nuts_CHD("20",stats)**(0.10/0.20);
RR_scn(diet_scn_p,"nuts_seeds","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>20 and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=25) = RR_nuts_CHD("25",stats)**(0.10/0.25);
RR_scn(diet_scn_p,"nuts_seeds","CHD",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>28 ) = RR_nuts_CHD("28",stats)**(0.10/0.28);

RR_scn(diet_scn_p,"nuts_seeds","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=5) = RR_nuts_cancer("5",stats)**(0.10/0.05);
RR_scn(diet_scn_p,"nuts_seeds","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>5  and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=10) = RR_nuts_cancer("10",stats)**(0.10/0.10);
RR_scn(diet_scn_p,"nuts_seeds","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>10 and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=15) = RR_nuts_cancer("15",stats)**(0.10/0.15);
RR_scn(diet_scn_p,"nuts_seeds","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>15 and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=20) = RR_nuts_cancer("20",stats)**(0.10/0.20);
RR_scn(diet_scn_p,"nuts_seeds","cancer",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>20) = RR_nuts_cancer("25",stats)**(0.10/0.25);

RR_scn(diet_scn_p,"nuts_seeds","T2DM",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=5) = RR_nuts_T2DM("5",stats)**(0.10/0.05);
RR_scn(diet_scn_p,"nuts_seeds","T2DM",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>5  and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=10) = RR_nuts_T2DM("10",stats)**(0.10/0.10);
RR_scn(diet_scn_p,"nuts_seeds","T2DM",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>10 and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=15) = RR_nuts_T2DM("15",stats)**(0.10/0.15);
RR_scn(diet_scn_p,"nuts_seeds","T2DM",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>15 and cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)<=20) = RR_nuts_T2DM("20",stats)**(0.10/0.20);
RR_scn(diet_scn_p,"nuts_seeds","T2DM",rgs,yrs_scn,stats)$(cons_scn(diet_scn_p,"g/d_w","nuts_seeds",rgs,yrs_scn)>20) = RR_nuts_T2DM("25",stats)**(0.10/0.25);

*        assign others linearly:

RR_scn(diet_scn_p,"red_meat",cause,rgs,yrs_scn,stats) = RR_data("red_meat",cause,stats);
*RR_scn(diet_scn_p,"prc_meat",cause,rgs,yrs_scn,stats) = RR_data("prc_meat",cause,stats);
RR_scn(diet_scn_p,"legumes",cause,rgs,yrs_scn,stats)  = RR_data("legumes",cause,stats);

RR_scn(diet_scn_p,riskf_w,cause,rgs,yrs_scn,stats) = RR_data(riskf_w,cause,stats);
RR_scn(diet_scn_p,"normal",cause,r,yrs_scn,stats) = 1;

*-------------------------------------------------------------------------------

*        age effects of RRs:
*        - RRs decrease with age (see Singh et al, PLOS ONE 2013)
*        > adjust age-adjusted RRs for that by scaling in a similar fashion
*          as Micha et al (PLOS ONE 2017) and GBD 2015 (see age_effects.xls):

table    age_scaling(age,stats)
         mean    std
20-24    0.035   1.25
25-29    0.030   1.20
30-34    0.025   1.25
35-39    0.020   1.20
40-44    0.015   1.15
45-49    0.010   1.10
50-54    0.005   1.05
55-59    0.000   1.00
60-64    0.005   0.95
65-69   -0.010   0.90
70-74   -0.015   0.85
75-79   -0.020   0.70
80-84   -0.025   0.60
85+     -0.030   0.50
;

*        low and high CI intervals as pct deviation from mean:
RR_data(riskf,cause,"std_low")$RR_data(riskf,cause,"mean")
         = RR_data(riskf,cause,"low")/RR_data(riskf,cause,"mean")-1;

RR_data(riskf,cause,"std_high")$RR_data(riskf,cause,"mean")
         = RR_data(riskf,cause,"high")/RR_data(riskf,cause,"mean")-1;

*parameter RR_age;

*        - for positive risk factors:
RR_age(riskf_pos,cause,"mean",age)
         = RR_data(riskf_pos,cause,"mean") * (1-age_scaling(age,"mean"));

RR_age(riskf_pos,cause,"low",age)
         = RR_age(riskf_pos,cause,"mean",age)
         * (1+ RR_data(riskf_pos,cause,"std_low") * age_scaling(age,"std"));

RR_age(riskf_pos,cause,"high",age)
         = RR_age(riskf_pos,cause,"mean",age)
         * (1+ RR_data(riskf_pos,cause,"std_high") * age_scaling(age,"std"));

*        - for negative risk factors:
RR_age(riskf_neg,cause,"mean",age)
         = RR_data(riskf_neg,cause,"mean") * (1+age_scaling(age,"mean"));

RR_age(riskf_neg,cause,"low",age)
         = RR_age(riskf_neg,cause,"mean",age)
         * (1+ RR_data(riskf_neg,cause,"std_low") * age_scaling(age,"std"));

RR_age(riskf_neg,cause,"high",age)
         = RR_age(riskf_neg,cause,"mean",age)
         * (1+ RR_data(riskf_neg,cause,"std_high") * age_scaling(age,"std"));

*-------------------------------------------------------------------------------

*        age effects of RRs:
*        - RRs decrease with age (see Singh et al, PLOS ONE 2013)
*        > adjust age-adjusted RRs for that by scaling in a similar fashion
*          as Micha et al (PLOS ONE 2017) and GBD 2015 (see age_effects.xls):

*        low and high CI intervals as pct deviation from mean:
RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"std_low")$RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"mean")
         = RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"low")
         / RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"mean") - 1;

RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"std_high")$RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"mean")
         = RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"high")
         / RR_scn(diet_scn_p,riskf,cause,rgs,yrs_scn,"mean") - 1;

*parameter RR_scn_age;

*        - for positive risk factors:
RR_scn_age(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"mean",age)
         = RR_scn(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"mean") * (1-age_scaling(age,"mean"));

RR_scn_age(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"low",age)
         = RR_scn_age(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"mean",age)
         * (1+ RR_scn(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"std_low") * age_scaling(age,"std"));

RR_scn_age(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"high",age)
         = RR_scn_age(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"mean",age)
         * (1+ RR_scn(diet_scn_p,riskf_pos,cause,rgs,yrs_scn,"std_high") * age_scaling(age,"std"));

*        - for negative risk factors:
RR_scn_age(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"mean",age)
         = RR_scn(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"mean") * (1+age_scaling(age,"mean"));

RR_scn_age(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"low",age)
         = RR_scn_age(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"mean",age)
         * (1+ RR_scn(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"std_low") * age_scaling(age,"std"));

RR_scn_age(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"high",age)
         = RR_scn_age(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"mean",age)
         * (1+ RR_scn(diet_scn_p,riskf_neg,cause,rgs,yrs_scn,"std_high") * age_scaling(age,"std"));

*        RRs for nuts and seeds become negative if scaled to 100 g portion
*        initially -> scale now back to 100 g portion:

RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"std_low",age)$RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)
         = RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"low",age)
          /RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)-1;

RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"std_high",age)$RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)
         = RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"high",age)
          /RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)-1;

RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)
         = RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)**(1/0.1);

RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"low",age)
         = RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)
         * (1+ RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"std_low",age));

RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"high",age)
         = RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"mean",age)
         * (1+ RR_scn_age(diet_scn_p,"nuts_seeds",cause,rgs,yrs_scn,"std_high",age));

*        calc standard deviation for PAF calculations:

RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"left_CI",age)
         = RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"mean",age)
         - RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"low",age);

RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"right_CI",age)
         = RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"high",age)
         - RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"mean",age);

RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"std",age)
         = RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"right_CI",age)$(RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"right_CI",age)>RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"left_CI",age) )
         + RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"left_CI",age)$(RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"right_CI",age)<RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"left_CI",age) );

*        alternative: use of average
*RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"std",age)
*         = (RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"right_CI",age)
*          + RR_scn_age(diet_scn_p,riskf,cause,rgs,yrs_scn,"left_CI",age))/2;

*-------------------------------------------------------------------------------

*        for foods which have no benefits after a certain point,
*        keep cons at that point to not overestimate impacts:

*set      riskf_max(riskf_d)  food-related risk factors with TMREL
*         /nuts_seeds/;
*parameter TMREL_max;

TMREL_max("nuts_seeds")   = 28;

cons_scn(diet_scn_p,"g/d_w",riskf_max,r,"2010")
         $(cons_scn(diet_scn_p,"g/d_w",riskf_max,r,"2010")>TMREL_max(riskf_max))
         = TMREL_max(riskf_max);

*-------------------------------------------------------------------------------

*        control for spurious values:

*        insert RR of 1 for normal weight:
RR_scn_age(diet_scn_p,"normal",cause,r,yrs_scn,stats,age) = 1;
RR_scn_age(diet_scn_p,"normal",cause,r,yrs_scn,"std",age) = 0;
*        - reset to one (as it got off 1 from age scaling):
RR_scn_age(diet_scn_p,"underweight","T2DM",r,yrs_scn,stats,age) = 1;
RR_scn_age(diet_scn_p,"underweight","T2DM",r,yrs_scn,"std",age) = 0;
*        - zero other risks (not included anymore):
RR_scn_age(diet_scn_p,riskf_w,"Other",r,yrs_scn,stats,age) = 1;
RR_scn_age(diet_scn_p,riskf_w,"Other",r,yrs_scn,"std",age) = 0;
RR_scn_age(diet_scn_p,riskf_w,"Colon and rectum cancers",r,yrs_scn,stats,age) = 1;
RR_scn_age(diet_scn_p,riskf_w,"Colon and rectum cancers",r,yrs_scn,"std",age) = 0;
RR_scn_age(diet_scn_p,riskf_d,"Resp_Dis",r,yrs_scn,stats,age) = 1;
RR_scn_age(diet_scn_p,riskf_d,"Resp_Dis",r,yrs_scn,"std",age) = 0;

*-------------------------------------------------------------------------------



