*-------------------------------------------------------------------------------
*        regions:
*-------------------------------------------------------------------------------

*        MCO, NIU, SMR, SSD, TUV are exluded due to missing data
*        PRK included now (upd 12/25/2014)

set      rgs           countries and aggregate regions /
all-r      All regions
HIC        High-income countries
UMC        Upper-middle-income countries
LMC        Lower-middle-income countries
LIC        Low-income countries
AFR        Africa
AMR        Americas
EMR        Eastern Mediterranean
EUR        Europe
SEA        South-East Asia
WPR        Western Pacific
AFG        Afghanistan
ALB        Albania
DZA        Algeria
AND        Andorra
AGO        Angola
ATG        Antigua and Barbuda
ARG        Argentina
ARM        Armenia
AUS        Australia
AUT        Austria
AZE        Azerbaijan
BHS        Bahamas
BHR        Bahrain
BGD        Bangladesh
BRB        Barbados
BLR        Belarus
BEL        Belgium
BLZ        Belize
BEN        Benin
BTN        Bhutan
BOL        Bolivia (Plurinational State of)
BIH        Bosnia and Herzegovina
BWA        Botswana
BRA        Brazil
BRN        Brunei Darussalam
BGR        Bulgaria
BFA        Burkina Faso
BDI        Burundi
CPV        Cabo Verde
KHM        Cambodia
CMR        Cameroon
CAN        Canada
CAF        Central African Republic
TCD        Chad
CHL        Chile
CHN        China
COL        Colombia
COM        Comoros
COG        Congo
COK        Cook Islands
CRI        Costa Rica
CIV        Côte d'Ivoire
HRV        Croatia
CUB        Cuba
CYP        Cyprus
CZE        Czech Republic
PRK        Democratic People's Republic of Korea
COD        Democratic Republic of the Congo
DNK        Denmark
DJI        Djibouti
DMA        Dominica
DOM        Dominican Republic
ECU        Ecuador
EGY        Egypt
SLV        El Salvador
GNQ        Equatorial Guinea
ERI        Eritrea
EST        Estonia
ETH        Ethiopia
FJI        Fiji
FIN        Finland
FRA        France
GAB        Gabon
GMB        Gambia
GEO        Georgia
DEU        Germany
GHA        Ghana
GRC        Greece
GRD        Grenada
GTM        Guatemala
GIN        Guinea
GNB        Guinea-Bissau
GUY        Guyana
HTI        Haiti
HND        Honduras
HUN        Hungary
ISL        Iceland
IND        India
IDN        Indonesia
IRN        Iran (Islamic Republic of)
IRQ        Iraq
IRL        Ireland
ISR        Israel
ITA        Italy
JAM        Jamaica
JPN        Japan
JOR        Jordan
KAZ        Kazakhstan
KEN        Kenya
KIR        Kiribati
KWT        Kuwait
KGZ        Kyrgyzstan
LAO        Lao People's Democratic Republic
LVA        Latvia
LBN        Lebanon
LSO        Lesotho
LBR        Liberia
LBY        Libya
LTU        Lithuania
LUX        Luxembourg
MDG        Madagascar
MWI        Malawi
MYS        Malaysia
MDV        Maldives
MLI        Mali
MLT        Malta
MHL        Marshall Islands
MRT        Mauritania
MUS        Mauritius
MEX        Mexico
FSM        Micronesia (Federated States of)
*MCO        Monaco
MNG        Mongolia
MNE        Montenegro
MAR        Morocco
MOZ        Mozambique
MMR        Myanmar
NAM        Namibia
NRU        Nauru
NPL        Nepal
NLD        Netherlands
NZL        New Zealand
NIC        Nicaragua
NER        Niger
NGA        Nigeria
*NIU        Niue
NOR        Norway
OMN        Oman
PAK        Pakistan
PLW        Palau
PAN        Panama
PNG        Papua New Guinea
PRY        Paraguay
PER        Peru
PHL        Philippines
POL        Poland
PRT        Portugal
QAT        Qatar
KOR        Republic of Korea
MDA        Republic of Moldova
ROU        Romania
RUS        Russian Federation
RWA        Rwanda
KNA        Saint Kitts and Nevis
LCA        Saint Lucia
VCT        Saint Vincent and the Grenadines
WSM        Samoa
*SMR        San Marino
STP        Sao Tome and Principe
SAU        Saudi Arabia
SEN        Senegal
SRB        Serbia
SYC        Seychelles
SLE        Sierra Leone
SGP        Singapore
SVK        Slovakia
SVN        Slovenia
SLB        Solomon Islands
SOM        Somalia
ZAF        South Africa
*SSD        South Sudan
ESP        Spain
LKA        Sri Lanka
PSE        State of Palestine
SDN        Sudan
SUR        Suriname
SWZ        Swaziland
SWE        Sweden
CHE        Switzerland
SYR        Syrian Arab Republic
TJK        Tajikistan
THA        Thailand
MKD        The former Yugoslav Republic of Macedonia
TLS        Timor-Leste
TGO        Togo
TON        Tonga
TTO        Trinidad and Tobago
TUN        Tunisia
TUR        Turkey
TKM        Turkmenistan
*TUV        Tuvalu
UGA        Uganda
UKR        Ukraine
ARE        United Arab Emirates
GBR        United Kingdom
TZA        United Republic of Tanzania
USA        United States of America
URY        Uruguay
UZB        Uzbekistan
VUT        Vanuatu
VEN        Venezuela (Bolivarian Republic of)
VNM        Viet Nam
YEM        Yemen
ZMB        Zambia
ZWE        Zimbabwe
/;

set      r(rgs)         countries in database /
AFG        Afghanistan
ALB        Albania
DZA        Algeria
AND        Andorra
AGO        Angola
ATG        Antigua and Barbuda
ARG        Argentina
ARM        Armenia
AUS        Australia
AUT        Austria
AZE        Azerbaijan
BHS        Bahamas
BHR        Bahrain
BGD        Bangladesh
BRB        Barbados
BLR        Belarus
BEL        Belgium
*BLX        Belgium-Luxembourg
BLZ        Belize
BEN        Benin
BTN        Bhutan
BOL        Bolivia (Plurinational State of)
BIH        Bosnia and Herzegovina
BWA        Botswana
BRA        Brazil
BRN        Brunei Darussalam
BGR        Bulgaria
BFA        Burkina Faso
BDI        Burundi
CPV        Cabo Verde
KHM        Cambodia
CMR        Cameroon
CAN        Canada
CAF        Central African Republic
TCD        Chad
CHL        Chile
CHN        China
COL        Colombia
COM        Comoros
COG        Congo
COK        Cook Islands
CRI        Costa Rica
CIV        Côte d'Ivoire
HRV        Croatia
CUB        Cuba
CYP        Cyprus
CZE        Czech Republic
PRK        Democratic People's Republic of Korea
COD        Democratic Republic of the Congo
DNK        Denmark
DJI        Djibouti
DMA        Dominica
DOM        Dominican Republic
ECU        Ecuador
EGY        Egypt
SLV        El Salvador
GNQ        Equatorial Guinea
ERI        Eritrea
EST        Estonia
ETH        Ethiopia
FJI        Fiji
FIN        Finland
FRA        France
GAB        Gabon
GMB        Gambia
GEO        Georgia
DEU        Germany
GHA        Ghana
GRC        Greece
GRD        Grenada
GTM        Guatemala
GIN        Guinea
GNB        Guinea-Bissau
GUY        Guyana
HTI        Haiti
HND        Honduras
HUN        Hungary
ISL        Iceland
IND        India
IDN        Indonesia
IRN        Iran (Islamic Republic of)
IRQ        Iraq
IRL        Ireland
ISR        Israel
ITA        Italy
JAM        Jamaica
JPN        Japan
JOR        Jordan
KAZ        Kazakhstan
KEN        Kenya
KIR        Kiribati
KWT        Kuwait
KGZ        Kyrgyzstan
LAO        Lao People's Democratic Republic
LVA        Latvia
LBN        Lebanon
LSO        Lesotho
LBR        Liberia
LBY        Libya
LTU        Lithuania
LUX        Luxembourg
MDG        Madagascar
MWI        Malawi
MYS        Malaysia
MDV        Maldives
MLI        Mali
MLT        Malta
MHL        Marshall Islands
MRT        Mauritania
MUS        Mauritius
MEX        Mexico
FSM        Micronesia (Federated States of)
*MCO        Monaco
MNG        Mongolia
MNE        Montenegro
MAR        Morocco
MOZ        Mozambique
MMR        Myanmar
NAM        Namibia
NRU        Nauru
NPL        Nepal
NLD        Netherlands
NZL        New Zealand
NIC        Nicaragua
NER        Niger
NGA        Nigeria
*NIU        Niue
NOR        Norway
OMN        Oman
PSE        State of Palestine
PAK        Pakistan
PLW        Palau
PAN        Panama
PNG        Papua New Guinea
PRY        Paraguay
PER        Peru
PHL        Philippines
POL        Poland
PRT        Portugal
QAT        Qatar
KOR        Republic of Korea
MDA        Republic of Moldova
ROU        Romania
RUS        Russian Federation
RWA        Rwanda
KNA        Saint Kitts and Nevis
LCA        Saint Lucia
VCT        Saint Vincent and the Grenadines
WSM        Samoa
*SMR        San Marino
STP        Sao Tome and Principe
SAU        Saudi Arabia
SEN        Senegal
SRB        Serbia
SYC        Seychelles
SLE        Sierra Leone
SGP        Singapore
SVK        Slovakia
SVN        Slovenia
SLB        Solomon Islands
SOM        Somalia
ZAF        South Africa
*SSD        South Sudan
ESP        Spain
LKA        Sri Lanka
*PSE        State of Palestine
SDN        Sudan
SUR        Suriname
SWZ        Swaziland
SWE        Sweden
CHE        Switzerland
SYR        Syrian Arab Republic
TJK        Tajikistan
THA        Thailand
MKD        The former Yugoslav Republic of Macedonia
TLS        Timor-Leste
TGO        Togo
TON        Tonga
TTO        Trinidad and Tobago
TUN        Tunisia
TUR        Turkey
TKM        Turkmenistan
*TUV        Tuvalu
UGA        Uganda
UKR        Ukraine
ARE        United Arab Emirates
GBR        United Kingdom
TZA        United Republic of Tanzania
USA        United States of America
URY        Uruguay
UZB        Uzbekistan
VUT        Vanuatu
VEN        Venezuela (Bolivarian Republic of)
VNM        Viet Nam
YEM        Yemen
ZMB        Zambia
ZWE        Zimbabwe
/;

*$exit

set      AFR(r)  Africa /
GMB        Gambia
GIN        Guinea
MDG        Madagascar
NER        Niger
CAF        Central African Republic
CMR        Cameroon
MOZ        Mozambique
SYC        Seychelles
BFA        Burkina Faso
COG        Congo
GNQ        Equatorial Guinea
ZMB        Zambia
SEN        Senegal
TGO        Togo
MWI        Malawi
NGA        Nigeria
MLI        Mali
AGO        Angola
MRT        Mauritania
ETH        Ethiopia
SLE        Sierra Leone
BEN        Benin
LBR        Liberia
KEN        Kenya
TZA        United Republic of Tanzania
SWZ        Swaziland
GAB        Gabon
GNB        Guinea-Bissau
STP        Sao Tome and Principe
COD        Democratic Republic of the Congo
ZAF        South Africa
CIV        Côte d'Ivoire
TCD        Chad
ERI        Eritrea
ZWE        Zimbabwe
BDI        Burundi
MUS        Mauritius
UGA        Uganda
NAM        Namibia
CPV        Cabo Verde
RWA        Rwanda
LSO        Lesotho
BWA        Botswana
COM        Comoros
GHA        Ghana
DZA        Algeria
/;

set      AMR(r)     Americas /
MEX        Mexico
BRA        Brazil
ECU        Ecuador
ARG        Argentina
JAM        Jamaica
PRY        Paraguay
BOL        Bolivia (Plurinational State of)
TTO        Trinidad and Tobago
HTI        Haiti
BLZ        Belize
VCT        Saint Vincent and the Grenadines
DMA        Dominica
PAN        Panama
SUR        Suriname
CUB        Cuba
VEN        Venezuela (Bolivarian Republic of)
GRD        Grenada
URY        Uruguay
KNA        Saint Kitts and Nevis
CRI        Costa Rica
NIC        Nicaragua
CAN        Canada
COL        Colombia
LCA        Saint Lucia
DOM        Dominican Republic
HND        Honduras
PER        Peru
SLV        El Salvador
BRB        Barbados
GTM        Guatemala
ATG        Antigua and Barbuda
BHS        Bahamas
CHL        Chile
USA        United States of America
GUY        Guyana
/;

set      EMR(r)        Eastern Mediterranean /
SAU        Saudi Arabia
AFG        Afghanistan
SOM        Somalia
YEM        Yemen
KWT        Kuwait
IRN        Iran (Islamic Republic of)
OMN        Oman
BHR        Bahrain
LBN        Lebanon
ARE        United Arab Emirates
EGY        Egypt
TUN        Tunisia
SYR        Syrian Arab Republic
IRQ        Iraq
LBY        Libya
JOR        Jordan
QAT        Qatar
MAR        Morocco
DJI        Djibouti
SDN        Sudan
*SSD        South Sudan
PAK        Pakistan
PSE        State of Palestine
/;

set      EUR(r)        Europe /
CZE        Czech Republic
GEO        Georgia
KAZ        Kazakhstan
*SMR        San Marino
FIN        Finland
SWE        Sweden
LVA        Latvia
GRC        Greece
AND        Andorra
HRV        Croatia
SVK        Slovakia
NOR        Norway
TKM        Turkmenistan
IRL        Ireland
POL        Poland
ROU        Romania
AUT        Austria
TJK        Tajikistan
ALB        Albania
DNK        Denmark
GBR        United Kingdom
BLR        Belarus
ISL        Iceland
FRA        France
BIH        Bosnia and Herzegovina
*MCO        Monaco
CHE        Switzerland
ISR        Israel
ESP        Spain
LUX        Luxembourg
DEU        Germany
SVN        Slovenia
BEL        Belgium
ARM        Armenia
UKR        Ukraine
RUS        Russian Federation
MKD        The former Yugoslav Republic of Macedonia
ITA        Italy
KGZ        Kyrgyzstan
MNE        Montenegro
AZE        Azerbaijan
UZB        Uzbekistan
PRT        Portugal
SRB        Serbia
CYP        Cyprus
NLD        Netherlands
LTU        Lithuania
MLT        Malta
HUN        Hungary
EST        Estonia
TUR        Turkey
MDA        Republic of Moldova
BGR        Bulgaria
/;

set      SEA(r)        South-East Asia /
MDV        Maldives
MMR        Myanmar
BGD        Bangladesh
PRK        Democratic People's Republic of Korea
IND        India
BTN        Bhutan
LKA        Sri Lanka
NPL        Nepal
IDN        Indonesia
THA        Thailand
TLS        Timor-Leste
/;

set      WPR(r)        Western Pacific /
MHL        Marshall Islands
MNG        Mongolia
PLW        Palau
COK        Cook Islands
VUT        Vanuatu
BRN        Brunei Darussalam
JPN        Japan
NZL        New Zealand
CHN        China
FSM        Micronesia (Federated States of)
WSM        Samoa
NRU        Nauru
VNM        Viet Nam
*TUV        Tuvalu
*NIU        Niue
FJI        Fiji
MYS        Malaysia
AUS        Australia
SLB        Solomon Islands
LAO        Lao People's Democratic Republic
TON        Tonga
PNG        Papua New Guinea
PHL        Philippines
KHM        Cambodia
KOR        Republic of Korea
SGP        Singapore
KIR        Kiribati
/;


set      ragg          aggregate regions /
AFR        Africa
AMR        Americas
EMR        Eastern Mediterranean
EUR        Europe
SEA        South-East Asia
WPR        Western Pacific
/;

set      raggs          aggregate regions /
AFR        Africa
AMR        Americas
EMR        Eastern Mediterranean
EUR        Europe
SEA        South-East Asia
WPR        Western Pacific
all-r      All regions
LIC        Low-income countries
LMC        Lower-middle-income countries
UMC        Upper-middle-income countries
HIC        High-income countries
/;

*        World Bank income groups:
set      LIC     Low-income countries    /
*NIU, SSD
AFG, BGD, BEN, BFA, BDI, KHM, CAF, TCD, COM, COD, ERI, ETH, GMB, GHA, GIN,
GNB, HTI, KEN, KGZ, LAO, LBR, MDG, MWI, MLI, MRT, MOZ, MMR, NPL, NEW, RWA,
SEN, SLE, SLB, SOM, TJK, TGO, UGA, TZA, UZB, VNM, YEM, ZMB, ZWE, PRK
/;

set      LMC     Lower-middle-income countries     /
ALB, AGO, ARM, AZE, BLZ, BTN, BOL, CMR, CPV, CHN, COG, CIV, DJI, ECU, EGY, SLV,
GEO, GTM, GUY, HND, IND, IDN, IRN, IRQ, JOR, KIR, LSO, MDV, MHL, FSM, MNG, MNE,
MAR, NIC, NGA, PAK, PNG, PRY, PHL, MDA, WSM, STP, SLB, LKA, SDN, SWZ, SYR, THA,
TLS, TON, TUN, TKM, UKR, VUT, AIA, PSE
/;

set      UMC     Upper-middle-income countries   /
*TUV
DZA, ARG, BLR, BIH, BWA, BRA, BGR, CHL, COL, CRI, CUB, DMA, DOM, FJI, GAB, GRD,
JAM, KAZ, LVA, LBN, LBY, LTU, MYS, MUS, MEX, NAM, PLW, PAN, PER, POL, ROU, RUS,
KNA, LCA, VCT, SRB, SYC, ZAF, SUR, MKD, TUR, URY, VEN, MNE
/;

set      HIC     High-income countries   /
*MCO, SMR
AND, ATG, AUS, AUT, BHS, BHR, BRB, BEL, BRN, CAN, COK, HRV, CYP, CZE, DNK, GNQ,
EST, FIN, FRA, DEU, GRC, HUN, ISL, IRL, ISR, ITA, JPN, KWT, LUX, MLT, NRU,
NLD, NZL, NOR, OMN, PRT, QAT, KOR, SAU, SGP, SVK, SVN, ESP, SWE, CHE, TTO,
ARE, GBR, USA
/;


set map_agg(r,ragg) regional aggregation    /
GMB.AFR
GIN.AFR
MDG.AFR
NER.AFR
CAF.AFR
CMR.AFR
MOZ.AFR
SYC.AFR
BFA.AFR
COG.AFR
GNQ.AFR
ZMB.AFR
SEN.AFR
TGO.AFR
MWI.AFR
NGA.AFR
MLI.AFR
AGO.AFR
MRT.AFR
ETH.AFR
SLE.AFR
BEN.AFR
LBR.AFR
KEN.AFR
TZA.AFR
SWZ.AFR
GAB.AFR
GNB.AFR
STP.AFR
COD.AFR
ZAF.AFR
CIV.AFR
TCD.AFR
ERI.AFR
ZWE.AFR
BDI.AFR
MUS.AFR
UGA.AFR
NAM.AFR
CPV.AFR
RWA.AFR
LSO.AFR
BWA.AFR
COM.AFR
GHA.AFR
DZA.AFR
MEX.AMR
BRA.AMR
ECU.AMR
ARG.AMR
JAM.AMR
PRY.AMR
BOL.AMR
TTO.AMR
HTI.AMR
BLZ.AMR
VCT.AMR
DMA.AMR
PAN.AMR
SUR.AMR
CUB.AMR
VEN.AMR
GRD.AMR
URY.AMR
KNA.AMR
CRI.AMR
NIC.AMR
CAN.AMR
COL.AMR
LCA.AMR
DOM.AMR
HND.AMR
PER.AMR
SLV.AMR
BRB.AMR
GTM.AMR
ATG.AMR
BHS.AMR
CHL.AMR
USA.AMR
GUY.AMR
SAU.EMR
AFG.EMR
SOM.EMR
YEM.EMR
KWT.EMR
IRN.EMR
OMN.EMR
BHR.EMR
LBN.EMR
ARE.EMR
EGY.EMR
TUN.EMR
SYR.EMR
IRQ.EMR
LBY.EMR
JOR.EMR
QAT.EMR
MAR.EMR
DJI.EMR
SDN.EMR
PAK.EMR
CZE.EUR
GEO.EUR
KAZ.EUR
FIN.EUR
SWE.EUR
LVA.EUR
GRC.EUR
AND.EUR
HRV.EUR
SVK.EUR
NOR.EUR
TKM.EUR
IRL.EUR
POL.EUR
ROU.EUR
AUT.EUR
TJK.EUR
ALB.EUR
DNK.EUR
GBR.EUR
BLR.EUR
ISL.EUR
FRA.EUR
BIH.EUR
CHE.EUR
ISR.EUR
ESP.EUR
LUX.EUR
DEU.EUR
SVN.EUR
BEL.EUR
ARM.EUR
UKR.EUR
RUS.EUR
MKD.EUR
ITA.EUR
KGZ.EUR
MNE.EUR
AZE.EUR
UZB.EUR
PRT.EUR
SRB.EUR
CYP.EUR
NLD.EUR
LTU.EUR
MLT.EUR
HUN.EUR
EST.EUR
TUR.EUR
MDA.EUR
BGR.EUR
MDV.SEA
MMR.SEA
BGD.SEA
PRK.SEA
IND.SEA
BTN.SEA
LKA.SEA
NPL.SEA
IDN.SEA
THA.SEA
TLS.SEA
MHL.WPR
MNG.WPR
PLW.WPR
COK.WPR
VUT.WPR
BRN.WPR
JPN.WPR
NZL.WPR
CHN.WPR
FSM.WPR
WSM.WPR
NRU.WPR
VNM.WPR
FJI.WPR
MYS.WPR
AUS.WPR
SLB.WPR
LAO.WPR
TON.WPR
PNG.WPR
PHL.WPR
KHM.WPR
KOR.WPR
SGP.WPR
KIR.WPR  /;


set r_names      /
Afghanistan
Albania
Algeria
Andorra
Angola
"Antigua and Barbuda"
Argentina
Armenia
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
"Belgium-Luxembourg"
Belize
Benin
Bhutan
"Bolivia (Plurinational State of)"
"Bolivia"
"Bosnia and Herzegovina"
Botswana
Brazil
"Brunei Darussalam"
Bulgaria
"Burkina Faso"
Burundi
"Cabo Verde"
"Cape Verde"
Cambodia
Cameroon
Canada
"Central African Republic"
Chad
Chile
China
Colombia
Comoros
"Cook Islands"
"Costa Rica"
"Côte d'Ivoire"
"CÃ´te d'Ivoire"
"C“te d'Ivoire"
Croatia
Cuba
Cyprus
"Czech Republic"
"Democratic People's Republic of Korea"
"Democratic Republic of the Congo"
Congo
Denmark
Djibouti
Dominica
"Dominican Republic"
Ecuador
Egypt
"El Salvador"
"Equatorial Guinea"
Eritrea
Estonia
Ethiopia
"Ethiopia PDR"
Fiji
Finland
France
Gabon
Gambia
Georgia
Germany
Ghana
Greece
Grenada
Guatemala
Guinea
Guinea-Bissau
Guyana
Haiti
Honduras
Hungary
Iceland
India
Indonesia
"Iran (Islamic Republic of)"
Iraq
Ireland
Israel
Italy
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kiribati
Kuwait
Kyrgyzstan
"Lao People's Democratic Republic"
Latvia
Lebanon
Lesotho
Liberia
Libya
"Libyan Arab Jamahiriya"
Lithuania
Luxembourg
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
"Marshall Islands"
Mauritania
Mauritius
Mexico
"Micronesia (Federated States of)"
Micronesia
Monaco
Mongolia
Montenegro
Morocco
Mozambique
Myanmar
Namibia
Nauru
Nepal
Netherlands
"New Zealand"
Nicaragua
Niger
Nigeria
Niue
Norway
Oman
"Occupied Palestinian Territory"
"State of Palestine"
Pakistan
Palau
Panama
"Papua New Guinea"
Paraguay
Peru
Philippines
Poland
Portugal
Qatar
"Republic of Korea"
"Republic of Moldova"
"Moldova"
Romania
"Russian Federation"
Rwanda
"Saint Kitts and Nevis"
"Saint Lucia"
"Saint Vincent and the Grenadines"
Samoa
"San Marino"
"Sao Tome and Principe"
"SÆo Tom‚ and Pr¡ncipe"
"Saudi Arabia"
Senegal
Serbia
Seychelles
"Sierra Leone"
Singapore
Slovakia
Slovenia
"Solomon Islands"
Somalia
"South Africa"
"South Sudan"
Spain
"Sri Lanka"
Sudan
"Sudan (former)"
Suriname
Swaziland
Sweden
Switzerland
"Syrian Arab Republic"
Tajikistan
Thailand
"The former Yugoslav Republic of Macedonia"
"Macedonia (Former Yugoslav Republic of)"
Timor-Leste
Togo
Tonga
"Trinidad and Tobago"
Tunisia
Turkey
Turkmenistan
Tuvalu
Uganda
Ukraine
"United Arab Emirates"
"United Kingdom"
"United Republic of Tanzania"
"United States of America"
Uruguay
Uzbekistan
Vanuatu
"Venezuela (Bolivarian Republic of)"
"Viet Nam"
Yemen
Zambia
Zimbabwe
/;

set map_names(*,*) mapping of names of regions   /
Afghanistan                                        .       AFG
Albania                                            .       ALB
Algeria                                            .       DZA
Andorra                                            .       AND
Angola                                             .       AGO
"Antigua and Barbuda"                                .       ATG
Argentina                                          .       ARG
Armenia                                            .       ARM
Australia                                          .       AUS
Austria                                            .       AUT
Azerbaijan                                         .       AZE
Bahamas                                            .       BHS
Bahrain                                            .       BHR
Bangladesh                                         .       BGD
Barbados                                           .       BRB
Belarus                                            .       BLR
Belgium                                            .       BEL
"Belgium-Luxembourg"                               .       BLX
Belize                                             .       BLZ
Benin                                              .       BEN
Bhutan                                             .       BTN
"Bolivia (Plurinational State of)"                   .       BOL
"Bolivia"                                         .       BOL
"Bosnia and Herzegovina"                             .       BIH
Botswana                                           .       BWA
Brazil                                             .       BRA
"Brunei Darussalam"                                  .       BRN
Bulgaria                                           .       BGR
"Burkina Faso"                                       .       BFA
Burundi                                            .       BDI
"Cabo Verde"                                         .       CPV
"Cape Verde"                                         .       CPV
Cambodia                                           .       KHM
Cameroon                                           .       CMR
Canada                                             .       CAN
"Central African Republic"                           .       CAF
Chad                                               .       TCD
Chile                                              .       CHL
China                                              .       CHN
Colombia                                           .       COL
Comoros                                            .       COM
Congo                                              .       COG
"Cook Islands"                                       .       COK
"Costa Rica"                                         .       CRI
"Côte d'Ivoire"                                      .       CIV
"CÃ´te d'Ivoire"                                      .       CIV
"C“te d'Ivoire"                                      .       CIV
Croatia                                            .       HRV
Cuba                                               .       CUB
Cyprus                                             .       CYP
"Czech Republic"                                     .       CZE
"Democratic People's Republic of Korea"              .       PRK
"Democratic Republic of the Congo"                   .       COD
Denmark                                            .       DNK
Djibouti                                           .       DJI
Dominica                                           .       DMA
"Dominican Republic"                                 .       DOM
Ecuador                                            .       ECU
Egypt                                              .       EGY
"El Salvador"                                        .       SLV
"Equatorial Guinea"                                  .       GNQ
Eritrea                                            .       ERI
Estonia                                            .       EST
Ethiopia                                           .       ETH
"Ethiopia PDR"                                     .       ETH
Fiji                                               .       FJI
Finland                                            .       FIN
France                                             .       FRA
Gabon                                              .       GAB
Gambia                                             .       GMB
Georgia                                            .       GEO
Germany                                            .       DEU
Ghana                                              .       GHA
Greece                                             .       GRC
Grenada                                            .       GRD
Guatemala                                          .       GTM
Guinea                                             .       GIN
Guinea-Bissau                                      .       GNB
Guyana                                             .       GUY
Haiti                                              .       HTI
Honduras                                           .       HND
Hungary                                            .       HUN
Iceland                                            .       ISL
India                                              .       IND
Indonesia                                          .       IDN
"Iran (Islamic Republic of)"                         .       IRN
Iraq                                               .       IRQ
Ireland                                            .       IRL
Israel                                             .       ISR
Italy                                              .       ITA
Jamaica                                            .       JAM
Japan                                              .       JPN
Jordan                                             .       JOR
Kazakhstan                                         .       KAZ
Kenya                                              .       KEN
Kiribati                                           .       KIR
Kuwait                                             .       KWT
Kyrgyzstan                                         .       KGZ
"Lao People's Democratic Republic"                   .       LAO
Latvia                                             .       LVA
Lebanon                                            .       LBN
Lesotho                                            .       LSO
Liberia                                            .       LBR
Libya                                              .       LBY
"Libyan Arab Jamahiriya"                           .       LBY
Lithuania                                          .       LTU
Luxembourg                                         .       LUX
Madagascar                                         .       MDG
Malawi                                             .       MWI
Malaysia                                           .       MYS
Maldives                                           .       MDV
Mali                                               .       MLI
Malta                                              .       MLT
"Marshall Islands"                                   .       MHL
Mauritania                                         .       MRT
Mauritius                                          .       MUS
Mexico                                             .       MEX
"Micronesia (Federated States of)"                   .       FSM
Micronesia                   .       FSM
Monaco                                            .       MCO
Mongolia                                           .       MNG
Montenegro                                         .       MNE
Morocco                                            .       MAR
Mozambique                                         .       MOZ
Myanmar                                            .       MMR
Namibia                                            .       NAM
Nauru                                              .       NRU
Nepal                                              .       NPL
Netherlands                                        .       NLD
"New Zealand"                                        .       NZL
Nicaragua                                          .       NIC
Niger                                              .       NER
Nigeria                                            .       NGA
Niue                                              .       NIU
Norway                                             .       NOR
Oman                                               .       OMN
"Occupied Palestinian Territory"                   .       PSE
"State of Palestine"                               .       PSE
Pakistan                                           .       PAK
Palau                                              .       PLW
Panama                                             .       PAN
"Papua New Guinea"                                   .       PNG
Paraguay                                           .       PRY
Peru                                               .       PER
Philippines                                        .       PHL
Poland                                             .       POL
Portugal                                           .       PRT
Qatar                                              .       QAT
"Republic of Korea"                                  .       KOR
"Republic of Moldova"                                .       MDA
"Moldova"                                           .       MDA
Romania                                            .       ROU
"Russian Federation"                                 .       RUS
Rwanda                                             .       RWA
"Saint Kitts and Nevis"                              .       KNA
"Saint Lucia"                                        .       LCA
"Saint Vincent and the Grenadines"                   .       VCT
Samoa                                              .       WSM
"San Marino"                                        .       SMR
"Sao Tome and Principe"                              .       STP
"SÆo Tom‚ and Pr¡ncipe"                              .       STP
"Saudi Arabia"                                       .       SAU
Senegal                                            .       SEN
Serbia                                             .       SRB
Seychelles                                         .       SYC
"Sierra Leone"                                       .       SLE
Singapore                                          .       SGP
Slovakia                                           .       SVK
Slovenia                                           .       SVN
"Solomon Islands"                                    .       SLB
Somalia                                            .       SOM
"South Africa"                                       .       ZAF
"South Sudan"                                       .       SSD
Spain                                              .       ESP
"Sri Lanka"                                          .       LKA
Sudan                                              .       SDN
"Sudan (former)"                                     .       SDN
Suriname                                           .       SUR
Swaziland                                          .       SWZ
Sweden                                             .       SWE
Switzerland                                        .       CHE
"Syrian Arab Republic"                               .       SYR
Tajikistan                                         .       TJK
Thailand                                           .       THA
"The former Yugoslav Republic of Macedonia"          .       MKD
"Macedonia (Former Yugoslav Republic of)"            .       MKD
Timor-Leste                                        .       TLS
Togo                                               .       TGO
Tonga                                              .       TON
"Trinidad and Tobago"                                .       TTO
Tunisia                                            .       TUN
Turkey                                             .       TUR
Turkmenistan                                       .       TKM
Tuvalu                                            .       TUV
Uganda                                             .       UGA
Ukraine                                            .       UKR
"United Arab Emirates"                               .       ARE
"United Kingdom"                                     .       GBR
"United Republic of Tanzania"                        .       TZA
"United States of America"                           .       USA
Uruguay                                            .       URY
Uzbekistan                                         .       UZB
Vanuatu                                            .       VUT
"Venezuela (Bolivarian Republic of)"                 .       VEN
"Viet Nam"                                           .       VNM
Yemen                                              .       YEM
Zambia                                             .       ZMB
Zimbabwe                                           .       ZWE
/;


*-------------------------------------------------------------------------------
*        Regional aggregation for waste module for WHO regions
*        (used in FAO_data.gms in \datasets\FAO\):
*-------------------------------------------------------------------------------

set      EUR_w        Europe /
*GRL     Greenland
CZE        Czech Republic
GEO        Georgia
KAZ        Kazakhstan
FIN        Finland
SWE        Sweden
GRC        Greece
ESP        Spain
HRV        Croatia
SVK        Slovakia
NOR        Norway
TKM        Turkmenistan
IRL        Ireland
POL        Poland
ROU        Romania
AUT        Austria
TJK        Tajikistan
ALB        Albania
DNK        Denmark
*GRL        Greenland
GBR        United Kingdom
BLR        Belarus
ISL        Iceland
FRA        France
MCO

*OBN        Other Balkans
BIH,     MKD,    MNE,    SRB,

CHE        Switzerland

ISR        Israel
DEU        Germany
SVN        Slovenia

*BLX        Belgium and Luxembourg
BEL,     LUX,

ARM        Armenia
UKR        Ukraine
RUS        Russian Federation
ITA        Italy
KGZ        Kyrgyzstan
AZE        Azerbaijan
UZB        Uzbekistan
PRT        Portugal
CYP        Cyprus
NLD        Netherlands
HUN        Hungary

*BLT        Baltic States
LTU,     LVA,    EST,

TUR        Turkey
MDA        Republic of Moldova
BGR        Bulgaria
/;

set      ACO_w       USA Canada Ocenia /
USA        United States of America
CAN        Canada
NZL        New Zealand
AUS        Australia
/;

set      ASA_w        Industrialized Asia /
JPN        Japan
CHM        China
KOR        Republic of Korea
/;

set      AFR_w  Sub-Saharan Africa /
GMB        Gambia
GIN        Guinea
MDG        Madagascar
NER        Niger
CAF        Central African Republic
CMR        Cameroon
MOZ        Mozambique
BFA        Burkina Faso
COG        Congo
GNQ        Equatorial Guinea
ZMB        Zambia
SEN        Senegal
TGO        Togo
MWI        Malawi
NGA        Nigeria
MLI        Mali
AGO        Angola
MRT        Mauritania
ETH        Ethiopia
SLE        Sierra Leone
BEN        Benin
LBR        Liberia
KEN        Kenya
TZA        United Republic of Tanzania
SWZ        Swaziland
GAB        Gabon
GNB        Guinea-Bissau
COD        Democratic Republic of the Congo
ZAF        South Africa
CIV        Côte d'Ivoire
TCD        Chad
ERI        Eritrea
ZWE        Zimbabwe
BDI        Burundi
UGA        Uganda
NAM        Namibia

*OAO        Other Atlantic Ocean
BMU,     BVT,    CPV,    FLK,    FRO,    SGS,    SHN,    SJM,    SPM,
STP,

RWA        Rwanda
LSO        Lesotho
BWA        Botswana

*OIO        Other Indian Ocean
ATF,     CCK,    COM,    CXR,    HMD,    IOT,    MDV,    MUS,    MYT,
REU,     SYC,

GHA        Ghana
/;

set      EMR_w        Eastern Mediterranean /
*SSD        Southern Sudan
*IRQ        Iraq
*PSE        State of Palestine
DZA        Algeria
SAU        Saudi Arabia
AFG        Afghanistan
SOM        Somalia
YEM        Yemen
IRN        Iran (Islamic Republic of)

*RAP        Rest of Arab Peninsula
ARE,     BHR,    KWT,    OMN,    QAT,

LBN        Lebanon
EGY        Egypt
TUN        Tunisia
SYR        Syrian Arab Republic
LBY        Libya
JOR        Jordan
DJI        Djibouti
SDN        Sudan
PAK        Pakistan
*SSD        Southern Sudan
IRQ        Iraq
*PSE        State of Palestine
/;

set      AMR_w     Americas /
MEX        Mexico
BRA        Brazil
ECU        Ecuador
ARG        Argentina
JAM        Jamaica
PRY        Paraguay
BOL        Bolivia (Plurinational State of)
HTI        Haiti
BLZ        Belize

*CRB        Other Caribbean
ABW,     AIA,    ANT,    ATG,    BES,    BHS,    BLM,    BRB,
CUW,     CYM,    DMA,    GLB,    GRD,    KNA,    LCA,    MAF,
MSR,     MTQ,    PRI,    SXM,    TCA,    TTO,    VCT,    VGB,
VIR,

PAN        Panama
CUB        Cuba
VEN        Venezuela (Bolivarian Republic of)
URY        Uruguay
CRI        Costa Rica
NIC        Nicaragua
COL        Colombia
DOM        Dominican Republic
HND        Honduras
PER        Peru
SLV        El Salvador
GTM        Guatemala
CHL        Chile
GSA        Guyanas South America
/;

set      SEA_w        South-East Asia /
*PRK        Democratic People's Republic of Korea
MMR        Myanmar
BGD        Bangladesh
IND        India
BTN        Bhutan
LKA        Sri Lanka
NPL        Nepal
IDN        Indonesia
THA        Thailand
TLS        Timor-Leste
MNG        Mongolia

*OPO        Other Pacific Ocean
ASM,     COK,    FSM,    GUM,    KIR,    MHL,    MNP,    NCL,
NFK,     NIU,    NRU,    PCN,    PLW,    PYF,    TKL,    TON,
TUV,     UMI,    WLF,    WSM,

VUT        Vanuatu

*OSA        Other Southeast Asia
BRN,     SGP,

VNM        Viet Nam
FJI        Fiji
MYS        Malaysia
SLB        Solomon Islands
LAO        Lao People's Democratic Republic
PNG        Papua New Guinea
PHL        Philippines
KHM        Cambodia
/;

set      ragg_w        aggregate regions for waste module /
EUR_w    Europe (and Russia)
ACO_w    USA Canada Ocenia
ASA_w    Industrialized Asia
AFR_w    Sub-Saharan Africa
EMR_w    North Africa West and Central Asia
SEA_w    South and South-East Asia
AMR_w    Latin America
/;

*-------------------------------------------------------------------------------

