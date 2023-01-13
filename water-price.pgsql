--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: water_wiki; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE water_wiki WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE water_wiki OWNER TO postgres;

\connect water_wiki

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    nat_code character varying(3) NOT NULL,
    nat_name character varying(52) NOT NULL,
    nat_cont character varying(2) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    curr_code character varying(4) NOT NULL,
    curr_name character varying(56) NOT NULL,
    nat_code character varying(3),
    curr_usd numeric
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    region_code character varying(8) NOT NULL,
    region_name character varying(255),
    nat_code character varying(3) NOT NULL,
    region_juris character varying(255)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sector (
    sector_code character varying(11) NOT NULL,
    sector_name character varying(72) NOT NULL,
    sector_note character varying(45) NOT NULL
);


ALTER TABLE public.sector OWNER TO postgres;

--
-- Name: source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source (
    source_uri character varying(1023) NOT NULL,
    source_title character varying(1023) NOT NULL,
    source_date integer,
    source_note character varying(1023),
    source_belief character varying(1023),
    source_creator character varying(1023)
);


ALTER TABLE public.source OWNER TO postgres;

--
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    type_id character varying(3) NOT NULL,
    type_name character varying(19) NOT NULL,
    type_desc character varying(355) NOT NULL
);


ALTER TABLE public.type OWNER TO postgres;

--
-- Name: value_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.value_price (
    field1 integer,
    vp_num numeric NOT NULL,
    curr_code character varying(4) NOT NULL,
    vp_usd numeric,
    vp_date integer NOT NULL,
    vp_wtrunit character varying(30),
    type_id character varying(3) NOT NULL,
    sector_code character varying(11),
    source_uri character varying(1023),
    region_code character varying(8),
    nat_code character varying(3),
    vp_wtrtrt character varying(255)
);


ALTER TABLE public.value_price OWNER TO postgres;

--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (nat_code, nat_name, nat_cont) FROM stdin;
AFG	Afghanistan	AS
ALA	Åland Islands	EU
ALB	Albania	EU
DZA	Algeria	AF
ASM	American Samoa	OC
AND	Andorra	EU
AGO	Angola	AF
AIA	Anguilla	NA
ATA	Antarctica	AQ
ATG	Antigua and Barbuda	NA
ARG	Argentina	SA
ARM	Armenia	AS
ABW	Aruba	NA
AUS	Australia	OC
AUT	Austria	EU
AZE	Azerbaijan	AS
BHS	Bahamas	NA
BHR	Bahrain	AS
BGD	Bangladesh	AS
BRB	Barbados	NA
BLR	Belarus	EU
BEL	Belgium	EU
BLZ	Belize	NA
BEN	Benin	AF
BMU	Bermuda	SA
BTN	Bhutan	AS
BOL	Bolivia (Plurinational State of)	SA
BES	Bonaire, Sint Eustatius and Saba	SA
BIH	Bosnia and Herzegovina	EU
BWA	Botswana	AF
BVT	Bouvet Island	SA
BRA	Brazil	SA
IOT	British Indian Ocean Territory	AF
BRN	Brunei Darussalam	AS
BGR	Bulgaria	EU
BFA	Burkina Faso	AF
BDI	Burundi	AF
CPV	Cabo Verde	AF
KHM	Cambodia	AS
CMR	Cameroon	AF
CAN	Canada	SA
CYM	Cayman Islands	NA
CAF	Central AFn Republic	AF
TCD	Chad	AF
CHL	Chile	SA
CHN	China	AS
CXR	Christmas Island	OC
CCK	Cocos (Keeling) Islands	OC
COL	Colombia	SA
COM	Comoros	AF
COG	Congo	AF
COD	Congo, Democratic Republic of the	AF
COK	Cook Islands	OC
CRI	Costa Rica	NA
CIV	Côte d'Ivoire	AF
HRV	Croatia	EU
CUB	Cuba	NA
CUW	Curaçao	NA
CYP	Cyprus	AS
CZE	Czechia	EU
DNK	Denmark	EU
DJI	Djibouti	AF
DMA	Dominica	NA
DOM	Dominican Republic	NA
ECU	Ecuador	SA
EGY	Egypt	AF
SLV	El Salvador	NA
GNQ	Equatorial Guinea	AF
ERI	Eritrea	AF
EST	Estonia	EU
SWZ	Eswatini	AF
ETH	Ethiopia	AF
FLK	Falkland Islands (Malvinas)	SA
FRO	Faroe Islands	EU
FJI	Fiji	OC
FIN	Finland	EU
FRA	France	EU
GUF	French Guiana	SA
PYF	French Polynesia	OC
ATF	French Southern Territories	AF
GAB	Gabon	AF
GMB	Gambia	AF
GEO	Georgia	AS
DEU	Germany	EU
GHA	Ghana	AF
GIB	Gibraltar	EU
GRC	Greece	EU
GRL	Greenland	SA
GRD	Grenada	NA
GLP	Guadeloupe	NA
GUM	Guam	OC
GTM	Guatemala	NA
GGY	Guernsey	EU
GIN	Guinea	AF
GNB	Guinea-Bissau	AF
GUY	Guyana	SA
HTI	Haiti	NA
HMD	Heard Island and McDonald Islands	OC
VAT	Holy See	EU
HND	Honduras	NA
HKG	Hong Kong	AS
HUN	Hungary	EU
ISL	Iceland	EU
IND	India	AS
IDN	Indonesia	AS
IRN	Iran (Islamic Republic of)	AS
IRQ	Iraq	AS
IRL	Ireland	EU
IMN	Isle of Man	EU
ISR	Israel	AS
ITA	Italy	EU
JAM	Jamaica	NA
JPN	Japan	AS
JEY	Jersey	EU
JOR	Jordan	AS
KAZ	Kazakhstan	AS
KEN	Kenya	AF
KIR	Kiribati	OC
PRK	Korea (Democratic People's Republic of)	AS
KOR	Korea, Republic of	AS
KWT	Kuwait	AS
KGZ	Kyrgyzstan	AS
LAO	Lao People's Democratic Republic	AS
LVA	Latvia	EU
LBN	Lebanon	AS
LSO	Lesotho	AF
LBR	Liberia	AF
LBY	Libya	AF
LIE	Liechtenstein	EU
LTU	Lithuania	EU
LUX	Luxembourg	EU
MAC	Macao	AS
MDG	Madagascar	AF
MWI	Malawi	AF
MYS	Malaysia	AS
MDV	Maldives	AS
MLI	Mali	AF
MLT	Malta	EU
MHL	Marshall Islands	OC
MTQ	Martinique	NA
MRT	Mauritania	AF
MUS	Mauritius	AF
MYT	Mayotte	AF
MEX	Mexico	NA
FSM	Micronesia (Federated States of)	OC
MDA	Moldova, Republic of	EU
MCO	Monaco	EU
MNG	Mongolia	AS
MNE	Montenegro	EU
MSR	Montserrat	NA
MAR	Morocco	AF
MOZ	Mozambique	AF
MMR	Myanmar	AS
NAM	Namibia	AF
NRU	Nauru	OC
NPL	Nepal	AS
NLD	Netherlands	EU
NCL	New Caledonia	OC
NZL	New Zealand	OC
NIC	Nicaragua	NA
NER	Niger	AF
NGA	Nigeria	AF
NIU	Niue	OC
NFK	Norfolk Island	OC
MKD	North Macedonia	EU
MNP	Northern Mariana Islands	OC
NOR	Norway	EU
OMN	Oman	AS
PAK	Pakistan	AS
PLW	Palau	OC
PSE	Palestine, State of	AS
PAN	Panama	NA
PNG	Papua New Guinea	OC
PRY	Paraguay	SA
PER	Peru	SA
PHL	Philippines	AS
PCN	Pitcairn	OC
POL	Poland	EU
PRT	Portugal	EU
PRI	Puerto Rico	NA
QAT	Qatar	AS
REU	Réunion	AF
ROU	Romania	EU
RUS	Russian Federation	EU
RWA	Rwanda	AF
BLM	Saint Barthélemy	NA
SHN	Saint Helena, Ascension and Tristan da Cunha	AF
KNA	Saint Kitts and Nevis	NA
LCA	Saint Lucia	NA
MAF	Saint Martin (French part)	NA
SPM	Saint Pierre and Miquelon	NA
VCT	Saint Vincent and the Grenadines	NA
WSM	Samoa	OC
SMR	San Marino	EU
STP	Sao Tome and Principe	AF
SAU	Saudi Arabia	AS
SEN	Senegal	AF
SRB	Serbia	EU
SYC	Seychelles	AF
SLE	Sierra Leone	AF
SGP	Singapore	AS
SXM	Sint Maarten (Dutch part)	NA
SVK	Slovakia	EU
SVN	Slovenia	EU
SLB	Solomon Islands	OC
SOM	Somalia	AF
ZAF	South Africa	AF
SGS	South Georgia and the South Sandwich Islands	SA
SSD	South Sudan	AF
ESP	Spain	EU
LKA	Sri Lanka	AS
SDN	Sudan	AF
SUR	Suriname	SA
SJM	Svalbard and Jan Mayen	EU
SWE	Sweden	EU
CHE	Switzerland	EU
SYR	Syrian Arab Republic	AS
TWN	Taiwan, Province of China	AS
TJK	Tajikistan	AS
TZA	Tanzania, United Republic of	AF
THA	Thailand	AS
TLS	Timor-Leste	AS
TGO	Togo	AF
TKL	Tokelau	OC
TON	Tonga	OC
TTO	Trinidad and Tobago	NA
TUN	Tunisia	AF
TUR	Turkey	AS
TKM	Turkmenistan	AS
TCA	Turks and Caicos Islands	NA
TUV	Tuvalu	OC
UGA	Uganda	AF
UKR	Ukraine	EU
ARE	United Arab Emirates	AS
GBR	United Kingdom of Great Britain and Northern Ireland	EU
USA	United States of America	NA
UMI	United States Minor Outlying Islands	OC
URY	Uruguay	SA
UZB	Uzbekistan	AS
VUT	Vanuatu	OC
VEN	Venezuela (Bolivarian Republic of)	SA
VNM	Viet Nam	AS
VGB	Virgin Islands (British)	NA
VIR	Virgin Islands (U.S.)	NA
WLF	Wallis and Futuna	OC
ESH	Western Sahara	AF
YEM	Yemen	AS
ZMB	Zambia	AF
ZWE	Zimbabwe	AF
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (curr_code, curr_name, nat_code, curr_usd) FROM stdin;
AED	United Arab Emirates Dirham	ARE	\N
AFN	Afghanistan Afghani	AFG	\N
ALL	Albania Lek	ALB	\N
AMD	Armenia Dram	ARM	\N
ANG	Netherlands Antilles Guilder	NLD	\N
AOA	Angola Kwanza	AGO	\N
ARS	Argentina Peso	ARG	\N
AUD	Australia Dollar	AUS	\N
AWG	Aruba Guilder	ABW	\N
AZN	Azerbaijan Manat	AZE	\N
BAM	Bosnia and Herzegovina Convertible Mark	BIH	\N
BBD	Barbados Dollar	BRB	\N
BDT	Bangladesh Taka	BGD	\N
BGN	Bulgaria Lev	BGR	\N
BHD	Bahrain Dinar	BHR	\N
BIF	Burundi Franc	BDI	\N
BMD	Bermuda Dollar	BMU	\N
BND	Brunei Darussalam Dollar	BRN	\N
BOB	Bolivia Bolíviano	BOL	\N
BRL	Brazil Real	BRA	\N
BSD	Bahamas Dollar	BHS	\N
BTN	Bhutan Ngultrum	BTN	\N
BWP	Botswana Pula	BWA	\N
BYN	Belarus Ruble	BLR	\N
BZD	Belize Dollar	BLZ	\N
CAD	Canada Dollar	CAN	\N
CDF	Congo/Kinshasa Franc	COG	\N
CHF	Switzerland Franc	CHE	\N
CLP	Chile Peso	CHL	\N
CNY	China Yuan Renminbi	CHN	\N
COP	Colombia Peso	COL	\N
CRC	Costa Rica Colon	CRI	\N
CUC	Cuba Convertible Peso	CUB	\N
CUP	Cuba Peso	CUB	\N
CVE	Cape Verde Escudo	CPV	\N
CZK	Czech Republic Koruna	CZE	\N
DJF	Djibouti Franc	DJI	\N
DKK	Denmark Krone	DNK	\N
DOP	Dominican Republic Peso	DOM	\N
DZD	Algeria Dinar	DZA	\N
EGP	Egypt Pound	EGY	\N
ERN	Eritrea Nakfa	ERI	\N
ETB	Ethiopia Birr	ETH	\N
EUR	Euro Member Countries	\N	\N
FJD	Fiji Dollar	FJI	\N
FKP	Falkland Islands (Malvinas) Pound	FLK	\N
GBP	United Kingdom Pound	GBR	\N
GEL	Georgia Lari	GEO	\N
GGP	Guernsey Pound	GGY	\N
GHS	Ghana Cedi	GHA	\N
GIP	Gibraltar Pound	GIB	\N
GMD	Gambia Dalasi	GMB	\N
GNF	Guinea Franc	GNQ	\N
GTQ	Guatemala Quetzal	GTM	\N
GYD	Guyana Dollar	GUY	\N
HKD	Hong Kong Dollar	HKG	\N
HNL	Honduras Lempira	HND	\N
HRK	Croatia Kuna	HRV	\N
HTG	Haiti Gourde	HTI	\N
HUF	Hungary Forint	HUN	\N
IDR	Indonesia Rupiah	IDN	\N
ILS	Israel Shekel	ISR	\N
IMP	Isle of Man Pound	IMN	\N
INR	India Rupee	IND	\N
IQD	Iraq Dinar	IRQ	\N
IRR	Iran Rial	IRN	\N
ISK	Iceland Krona	ISL	\N
JEP	Jersey Pound	JEY	\N
JMD	Jamaica Dollar	JAM	\N
JOD	Jordan Dinar	JOR	\N
JPY	Japan Yen	JPN	\N
KES	Kenya Shilling	KEN	\N
KGS	Kyrgyzstan Som	KGZ	\N
KHR	Cambodia Riel	KHM	\N
KMF	Comorian Franc	COM	\N
KPW	Korea (North) Won	PRK	\N
KRW	Korea (South) Won	KOR	\N
KWD	Kuwait Dinar	KWT	\N
KYD	Cayman Islands Dollar	CYM	\N
KZT	Kazakhstan Tenge	KAZ	\N
LAK	Laos Kip	LAO	\N
LBP	Lebanon Pound	LBN	\N
LKR	Sri Lanka Rupee	LKA	\N
LRD	Liberia Dollar	LBR	\N
LSL	Lesotho Loti	LSO	\N
LYD	Libya Dinar	LBY	\N
MAD	Morocco Dirham	MAR	\N
MDL	Moldova Leu	MDA	\N
MGA	Madagascar Ariary	MDG	\N
MKD	Macedonia Denar	MKD	\N
MMK	Myanmar (Burma) Kyat	MMR	\N
MNT	Mongolia Tughrik	MNG	\N
MOP	Macau Pataca	MAC	\N
MRU	Mauritania Ouguiya	MRT	\N
MUR	Mauritius Rupee	MUS	\N
MVR	Maldives (Maldive Islands) Rufiyaa	MDV	\N
MWK	Malawi Kwacha	MWI	\N
MXN	Mexico Peso	MEX	\N
MYR	Malaysia Ringgit	MYS	\N
MZN	Mozambique Metical	MOZ	\N
NAD	Namibia Dollar	NAM	\N
NGN	Nigeria Naira	NGA	\N
NIO	Nicaragua Cordoba	NIC	\N
NOK	Norway Krone	NOR	\N
NPR	Nepal Rupee	NPL	\N
NZD	New Zealand Dollar	NZL	\N
OMR	Oman Rial	OMN	\N
PAB	Panama Balboa	PAN	\N
PEN	Peru Sol	PER	\N
PGK	Papua New Guinea Kina	PNG	\N
PHP	Philippines Peso	PHL	\N
PKR	Pakistan Rupee	PAK	\N
PLN	Poland Zloty	POL	\N
PYG	Paraguay Guarani	PRY	\N
QAR	Qatar Riyal	QAT	\N
RON	Romania Leu	ROU	\N
RSD	Serbia Dinar	SRB	\N
RUB	Russia Ruble	RUS	\N
RWF	Rwanda Franc	RWA	\N
SAR	Saudi Arabia Riyal	SAU	\N
SBD	Solomon Islands Dollar	SLB	\N
SCR	Seychelles Rupee	SYC	\N
SDG	Sudan Pound	SDN	\N
SEK	Sweden Krona	SWE	\N
SGD	Singapore Dollar	SGP	\N
SHP	Saint Helena Pound	SHN	\N
SLL	Sierra Leone Leone	SLE	\N
SOS	Somalia Shilling	SOM	\N
SPL*	Seborga Luigino	\N	\N
SRD	Suriname Dollar	SUR	\N
STN	São Tomé and Príncipe Dobra	STP	\N
SVC	El Salvador Colon	SLV	\N
SYP	Syria Pound	SYR	\N
SZL	eSwatini Lilangeni	SWZ	\N
THB	Thailand Baht	THA	\N
TJS	Tajikistan Somoni	TJK	\N
TMT	Turkmenistan Manat	TKM	\N
TND	Tunisia Dinar	TUN	\N
TOP	Tonga Pa'anga	TON	\N
TRY	Turkey Lira	TUR	\N
TTD	Trinidad and Tobago Dollar	TTO	\N
TVD	Tuvalu Dollar	TUV	\N
TWD	Taiwan New Dollar	TWN	\N
TZS	Tanzania Shilling	TZA	\N
UAH	Ukraine Hryvnia	UKR	\N
UGX	Uganda Shilling	UGA	\N
USD	United States Dollar	USA	\N
UYU	Uruguay Peso	URY	\N
UZS	Uzbekistan Som	UZB	\N
VEF	Venezuela Bolívar	VEN	\N
VND	Viet Nam Dong	VNM	\N
VUV	Vanuatu Vatu	VUT	\N
WST	Samoa Tala	WSM	\N
XAF	Communauté Financière Africaine (BEAC) CFA Franc BEAC	\N	\N
XCD	East Caribbean Dollar	\N	\N
XDR	International Monetary Fund (IMF) Special Drawing Rights	\N	\N
XOF	Communauté Financière Africaine (BCEAO) Franc	\N	\N
XPF	Comptoirs Français du Pacifique (CFP) Franc	\N	\N
YER	Yemen Rial	YEM	\N
ZAR	South Africa Rand	ZAF	\N
ZMW	Zambia Kwacha	ZMB	\N
ZWD	Zimbabwe Dollar	ZWE	\N
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (region_code, region_name, nat_code, region_juris) FROM stdin;
AR-E	Entre Ríos	ARG	Province
UY-PA	Paysandú	URY	Department
ID-KI	East Kalimantan	IDN	Province
MY-12	Sabah	MYS	State
CL-AP	Arica y Parinacota	CHL	Region
BO-L	La Paz	BOL	Department
BO-O	Oruro	BOL	Department
CL-TA	Tarapacá	CHL	Region
BO-P	Potosí	BOL	Department
CL-AN	Antofagasta	CHL	Region
PE-TAC	Tacna	PER	Department
AR-A	Salta	ARG	Province
AR-Y	Jujuy	ARG	Province
CY-03	Larnaca	CYP	District
IN-LA	Ladakh	IND	Union Territory
CN-XJ	Xinjiang	CHN	Autonomous Region
CN-XZ	Tibet	CHN	Autonomous Region
IL-D	Southern	ISR	District
PS-GZZ	Gaza	PSX	\N
IL-Z	Northern	ISR	District
PS-WBK	West Bank	PSX	\N
IL-HA	Haifa	ISR	District
IL-M	Central	ISR	District
LB-NA	Nabatieh	LBN	Province
LB-JA	South	LBN	Province
ET-SN	Southern Nations	ETH	Administrative State
SS-EE	Eastern Equatoria	SDS	State
ET-SO	Somali	ETH	Administrative State
SO-NU	Nugal	SOM	Region
SO-MU	Mudug	SOM	Region
SO-GA	Galguduud	SOM	Region
SO-HI	Hiran	SOM	Region
SO-BK	Bakool	SOM	Region
SO-GE	Gedo	SOM	Region
KE-700	Rift Valley	KEN	Province
MW-CT	Chitipa	MWI	District
TZ-14	Mbeya	TZA	Region
TZ-29	Njombe	TZA	Region
TZ-21	Ruvuma	TZA	Region
MW-RU	Rumphi	MWI	District
MW-NB	Nkhata Bay	MWI	District
IN-AR	Arunachal Pradesh	IND	State
SY-X01~	Western al-Samadania	SYR	\N
-99-X11~	Somaliland	SOL	\N
SO-BR	Bari	SOM	Region
FR-GF	French Guiana	FRA	Overseas department
SR-SI	Sipaliwini	SUR	District
GY-MA	Mahaica-Berbice	GUY	Region
KR-42	Gangwon	KOR	Province
KP-07	Kangwon	PRK	Province
KR-41	Gyeonggi	KOR	Province
KP-06	North Hwanghae	PRK	Province
MA-14	Guelmim-Es Semara	MAR	Region
EH-X01~	Western Sahara	SAH	\N
MA-15	Laâyoune-Boujdour-Sakia El Hamra	MAR	Region
MA-16	Oued Ed-Dahab	MAR	Region
CR-A	Alajuela	CRI	Province
NI-SJ	Río San Juan	NIC	Department
CG-7	Likouala	COG	Region
CD-EQ	Équateur	COD	Province
CG-8	Cuvette	COG	Region
CG-14	Plateaux	COG	Region
CD-BN	Bandundu	COD	Province
CG-12	Pool	COG	Region
CG-BZV	Brazzaville	COG	Region
CD-KN	Kinshasa	COD	Neutral City
CD-BC	Kongo Central	COD	Province
CG-11	Bouenza	COG	Region
CG-9	Niari	COG	Region
BT-TY	Trashiyangtse	BTN	District
BT-44	Lhuntse	BTN	District
BT-33	Bumthang	BTN	District
UA-74	Chernihiv	UKR	Region
BY-HO	Gomel	BLR	Region
UA-07	Volyn	UKR	Region
BY-BR	Brest	BLR	Region
UA-56	Rivne	UKR	Region
UA-18	Zhytomyr	UKR	Region
UA-32	Kyiv	UKR	Region
NA-KA	Karas	NAM	Region
ZA-NC	Northern Cape	ZAF	Province
LB-BI	Beqaa	LBN	Province
LB-AS	North	LBN	Province
SY-HI	Homs	SYR	Province
SY-TA	Tartus	SYR	Province
SY-RD	Rif Dimashq	SYR	Province
MF-X00~	Saint Martin	MAF	\N
NL-SX	Sint Maarten	SXM	\N
AE-FU	Emirate of Fujairah	ARE	Emirate
OM-MU	Musandam	OMN	Province
AE-SH	Emirate of Sharjah	ARE	Emirate
AE-RK	Emirate of Ras Al Khaimah	ARE	Emirate
MW-LK	Likoma	MWI	District
UZ-FA	Fergana	UZB	Region
KZ-VOS	East Kazakhstan	KAZ	Region
KZ-ALA	Almaty	KAZ	Region
TJ-SU	Khujand	TJK	Region
BY-VI	Vitebsk	BLR	Region
LT-UT	Utena	LTU	County
LT-VL	Vilnius	LTU	County
BY-HR	Grodno	BLR	Region
LT-AL	Alytus	LTU	County
BR-RS	Rio Grande do Sul	BRA	State
UY-AR	Artigas	URY	Department
MN-061	Dornod	MNG	Province
CN-NM	Inner Mongolia	CHN	Autonomous Region
MN-071	Bayan-Ölgii	MNG	Province
MN-043	Khovd	MNG	Province
MN-051	Sükhbaatar	MNG	Province
MN-063	Dornogovi	MNG	Province
MN-065	Govi-Altai	MNG	Province
CN-GS	Gansu	CHN	Province
MN-069	Bayankhongor	MNG	Province
MN-053	Ömnögovi	MNG	Province
RU-AL	Altai Republic	RUS	Republic
CZ-US	Ústí nad Labem	CZE	Region
DE-SN	Saxony	DEU	State
CZ-LI	Liberec	CZE	Region
CZ-KA	Karlovy Vary	CZE	Region
DE-BY	Bavaria	DEU	State
CZ-PL	Plzeň-	CZE	Region
CZ-JC	South Bohemian	CZE	Region
EE-84	Viljandi	EST	County
LV-084	Valmiera	LVA	Municipality
LV-060	Valmiera	LVA	Municipality
EE-67	Pärnu	EST	County
LV-005	Aloja	LVA	Municipality
EE-82	Valga	EST	County
LV-064	Valmiera	LVA	Municipality
LV-085	Salacgrīva	LVA	Municipality
EE-86	Võru	EST	County
LV-009	Valmiera	LVA	Municipality
LV-101	Valka	LVA	Municipality
LV-007	Alūksne	LVA	Municipality
RU-PSK	Pskov	RUS	Region
LV-108	Viļaka	LVA	Municipality
LV-014	Baltinava	LVA	Municipality
LV-044	Kārsava	LVA	Municipality
LV-023	Cibla	LVA	Municipality
LV-058	Ludza	LVA	Municipality
LV-110	Zilupe	LVA	Municipality
LT-PN	Panevėžys	LTU	County
LV-065	Nereta	LVA	Municipality
LV-107	Viesīte	LVA	Municipality
LV-105	Vecumnieki	LVA	Municipality
LT-TE	Telšiai	LTU	County
LV-088	Saldus	LVA	Municipality
LT-KL	Klaipėda	LTU	County
LV-081	Rucava	LVA	Municipality
LV-074	Priekule	LVA	Municipality
LV-100	Vaiņode	LVA	Municipality
LT-SA	Šiauliai	LTU	County
LV-010	Auce	LVA	Municipality
LV-016	Bauska	LVA	Municipality
LV-098	Tērvete	LVA	Municipality
LV-JEL	Jelgava	LVA	Municipality
LV-083	Rundāle	LVA	Municipality
LV-004	Aknīste	LVA	Municipality
LV-036	Ilūkste	LVA	Municipality
LV-DGV	Daugavpils	LVA	Municipality
NO-19	Troms	NOR	County
SE-BD	Norrbotten	SWE	County
NO-18	Nordland	NOR	County
SE-AC	Västerbotten	SWE	County
SE-Z	Jämtland	SWE	County
NO-17	Nord-Trøndelag	NOR	County
NO-16	Sør-Trøndelag	NOR	County
NO-04	Hedmark	NOR	County
SE-W	Dalarna	SWE	County
SE-S	Värmland	SWE	County
NO-02	Akershus	NOR	County
NO-01	Østfold	NOR	County
SE-O	Västra Götaland	SWE	County
FI-10	Lapland	FIN	Province
NO-20	Finnmark	NOR	County
VN-28	Kon Tum	VNM	Province
KH-16	Ratanakiri	KHM	Province
VN-72	Đắk Nông	VNM	Region
KH-11	Mondulkiri	KHM	Province
VN-33	Đắk Lắk	VNM	Region
VN-30	Gia Lai	VNM	Region
VN-58	Bình Phước	VNM	Province
KH-10	Kratié	KHM	Province
VN-37	Tây Ninh	VNM	Province
KH-3	Kampong Cham	KHM	Province
KH-20	Svay Rieng	KHM	Province
KH-14	Prey Veng	KHM	Province
VN-41	Long An	VNM	Province
VN-45	Đồng Tháp	VNM	Province
VN-44	An Giang	VNM	Province
KH-8	Kandal	KHM	Province
KH-21	Takéo	KHM	Province
VN-47	Kiên Giang	VNM	Province
KH-7	Kampot	KHM	Province
DE-RP	Rhineland-Palatinate	DEU	State
LU-D	Diekirch	LUX	District
LU-G	Grevenmacher	LUX	District
DE-SL	Saarland	DEU	State
FR-59	Nord	FRA	Metropolitan department
BE-VWV	West Flanders	BEL	Province
BE-WHT	Hainaut	BEL	Province
FR-08	Ardennes	FRA	Metropolitan department
BE-WNA	Namur	BEL	Province
FR-02	Aisne	FRA	Metropolitan department
BE-WLX	Luxembourg	BEL	Province
FR-55	Meuse	FRA	Metropolitan department
FR-54	Meurthe-et-Moselle	FRA	Metropolitan department
BE-WLG	Liège	BEL	Province
LU-L	Luxembourg	LUX	District
RU-KDA	Krasnodar Krai	RUS	Territory
GE-AB	Abkhazia	GEO	Autonomous Republic
RU-KC	Karachay-Cherkess Republic	RUS	Republic
RU-KB	Kabardino-Balkaria	RUS	Republic
GE-SZ	Samegrelo-Zemo Svaneti	GEO	Region
RU-SE	Republic of North Ossetia-Alania	RUS	Republic
GE-SK	Shida Kartli	GEO	Region
GE-RL	Racha-Lechkhumi and Kvemo Svaneti	GEO	Region
RU-IN	Republic of Ingushetia	RUS	Republic
GE-MM	Mtskheta-Mtianeti	GEO	Region
RU-CE	Chechen Republic	RUS	Republic
GE-KA	Kakheti	GEO	Region
RU-DA	Republic of Dagestan	RUS	Republic
MK-72	Struga	MKD	Statistical Region
AL-09	Dibër	ALB	County
MK-78	Centar Župa	MKD	Statistical Region
MK-21	Debar	MKD	Statistical Region
MK-50	Mavrovo and Rostuša	MKD	Statistical Region
MK-19	Gostivar	MKD	Statistical Region
AL-07	Kukës	ALB	County
AL-06	Korçë	ALB	County
AL-03	Elbasan	ALB	County
MK-12	Vevčani	MKD	Statistical Region
MK-58	Ohrid	MKD	Statistical Region
MK-22	Debarca	MKD	Statistical Region
MK-66	Resen	MKD	Statistical Region
AZ-QAZ	Qazax	AZE	District
XK-X02~	Dečani	KOS	District
XK-X01~	Gjakova	KOS	District
XK-X03~	Dragaš	KOS	District
XK-X21~	Plužine	KOS	District
TR-75	Ardahan	TUR	Province
GE-SJ	Samtskhe–Javakheti	GEO	Region
TR-08	Artvin	TUR	Province
GE-AJ	Adjara	GEO	Autonomous Republic
FR-57	Moselle	FRA	Metropolitan department
ES-CE	Ceuta	ESP	Autonomous City
MA-01	Tangier-Tetouan	MAR	Region
LA-PH	Phongsaly	LAO	Province
CN-YN	Yunnan	CHN	Province
LA-OU	Oudomxay	LAO	Province
LA-LM	Luang Namtha	LAO	Province
KG-Y	Issyk-Kul	KGZ	Region
KG-N	Naryn	KGZ	Region
KG-O	Osh	KGZ	Region
AM-TV	Tavush	ARM	Province
GE-KK	Kvemo Kartli	GEO	Region
AM-LO	Lori	ARM	Province
AM-SH	Shirak	ARM	Province
KZ-ZHA	Jambyl	KAZ	Region
KG-C	Chuy	KGZ	Region
KG-T	Talas	KGZ	Region
KZ-YUZ	Turkistan	KAZ	Region
GY-PM	Pomeroon-Supenaam	GUY	Region
BR-RR	Roraima	BRA	State
GY-PT	Potaro-Siparuni	GUY	Region
GY-UD	Upper Demerara-Berbice	GUY	Region
BR-PA	Pará	BRA	State
DE-SH	Schleswig-Holstein	DEU	State
DK-83	Southern Denmark	DNK	Region
PE-MDD	Madre de Dios	PER	Department
BR-AC	Acre	BRA	State
LY-GD	Ghadames	LBY	Municipality|Governarate
TN-83	Tataouine	TUN	Governorate
TN-82	Medenine	TUN	Governorate
LY-NQ	Nuqat al Khams	LBY	Municipality|Governarate
AZ-AGA	Agstafa	AZE	District
AZ-TOV	Tovuz	AZE	District
AZ-GAD	Gadabay	AZE	District
AM-GR	Gegharkunik	ARM	Province
AZ-DAS	Dashkasan	AZE	District
AZ-KAL	Kalbajar	AZE	District
AM-VD	Vayots Dzor	ARM	Province
AM-SU	Syunik	ARM	Province
AZ-LAN	Lankaran	AZE	District
AZ-QBI	Qubadli	AZE	District
AZ-ZAN	Zangilan	AZE	District
AZ-SAR	Sharur	AZE	District
AM-AR	Ararat	ARM	Province
AZ-SAD	Sadarak	AZE	District
AZ-KAN	Kangarli	AZE	District
AZ-BAB	Babek	AZE	District
AZ-SAH	Shahbuz	AZE	District
AZ-CUL	Julfa	AZE	District
AZ-ORD	Ordubad	AZE	District
RO-SM	Satu Mare	ROU	County
HU-SZ	Szabolcs-Szatmár-Bereg	HUN	County
RO-AR	Arad	ROU	County
HU-BE	Békés	HUN	County
RO-BH	Bihor	ROU	County
HU-HB	Hajdú-Bihar	HUN	County
HU-CS	Csongrád-Csanád	HUN	County
RO-TM	Timiș	ROU	County
KG-J	Jalal-Abad	KGZ	Region
UZ-TO	Tashkent	UZB	Region
UZ-NG	Namangan	UZB	Region
UZ-AN	Andijan	UZB	Region
KG-B	Batken	KGZ	Region
SK-ZI	Žilina	SVK	Region
PL-SL	Silesian Voivodeship	POL	Voivodeship|Province
PL-MA	Lesser Poland Voivodeship	POL	Voivodeship|Province
SK-PV	Prešov	SVK	Region
PL-PK	Podkarpackie Voivodeship	POL	Voivodeship|Province
IE-DL	Donegal	IRL	County
GB-DRY	Derry	GBR	London Borough (city)
GB-STB	Strabane	GBR	District
GB-FER	Fermanagh	GBR	District
IE-LM	Leitrim	IRL	County
IE-CN	Cavan	IRL	County
IE-MN	Monaghan	IRL	Administrative County
GB-DGN	Dungannon and South Tyrone	GBR	District
GB-ARM	Armagh	GBR	District
GB-NYM	Newry and Mourne	GBR	District
IE-LH	Louth	IRL	County
PL-DS	Lower Silesian Voivodeship	POL	Voivodeship|Province
CZ-KR	Hradec Králové	CZE	Region
PL-OP	Opole Voivodeship	POL	Voivodeship|Province
CZ-OL	Olomouc	CZE	Region
CZ-PA	Pardubice	CZE	Region
CZ-MO	Moravian-Silesian	CZE	Region
TJ-X01~	districts of Republican Subordination	TJK	Region
TJ-GB	Gorno-Badakhshan	TJK	Region
GR-C	West Macedonia	GRC	Region
GR-D	Epirus	GRC	Region
AL-05	Gjirokastër	ALB	County
AL-12	Vlorë	ALB	County
ZM-10	Muchinga	ZMB	Province
MW-MZ	Mzimba	MWI	District
ZM-03	Eastern	ZMB	Province
MW-KS	Kasungu	MWI	District
MW-MC	Mchinji	MWI	District
UA-21	Zakarpattia	UKR	Region
SK-KI	Košice	SVK	Region
SL-N	Northern	SLE	Province
GN-FA	Faranah	GIN	Prefecture
GN-KD	Kindia	GIN	Prefecture
GN-MM	Mamou Prefecture	GIN	Prefecture
GN-DB	Dabola Prefecture	GIN	Prefecture
GN-FO	Forécariah Prefecture	GIN	Prefecture
GN-GU	Guéckédou Prefecture	GIN	Prefecture
SL-E	Eastern	SLE	Province
LR-CM	Grand Cape Mount	LBR	County
SL-S	Southern	SLE	Province
LR-X1~	Gbarpolu	LBR	County
LR-LO	Lofa	LBR	County
CF-VK	Vakaga Prefecture	CAF	Prefecture
SD-DE	Central Darfur	SDN	State
CF-HK	Haute-Kotto Prefecture	CAF	Prefecture
SS-BW	Western Bahr el Ghazal	SDS	State
CF-HM	Haut-Mbomou Prefecture	CAF	Prefecture
SS-EW	Western Equatoria	SDS	State
CD-OR	Orientale	COD	Province
SS-EC	Central Equatoria	SDS	State
DJ-AS	Ali Sabieh	DJI	Region
DJ-AR	Arta	DJI	Region
DJ-DI	Dikhil	DJI	Region
ET-AF	Afar	ETH	Administrative State
DJ-TA	Tadjourah	DJI	Region
CD-SK	South Kivu	COD	Province
TZ-08	Kigoma	TZA	Region
CD-KA	Katanga	COD	Province
TZ-28	Katavi	TZA	Region
TZ-20	Rukwa	TZA	Region
DJ-OB	Obock	DJI	Region
ER-DK	Southern Red Sea	ERI	Region
AT-3	Lower Austria	AUT	State
CZ-JM	South Moravian	CZE	Region
AT-4	Upper Austria	AUT	State
IQ-DA	Duhok	IRQ	Province
TR-73	Şırnak	TUR	Province
TR-30	Hakkâri	TUR	Province
IQ-AR	Erbil	IRQ	Province
HU-GS	Győr-Moson-Sopron	HUN	County
AT-1	Burgenland	AUT	State
HU-SN	Sopron	HUN	Urban county
HU-VA	Vas	HUN	County
IT-AO	Aosta	ITA	Province
CH-VS	Valais	CHE	Canton
IT-VB	Verbano-Cusio-Ossola	ITA	Province
CH-TI	Ticino	CHE	Canton
IT-VA	Varese	ITA	Province
IT-CO	Como	ITA	Province
CH-GR	Grisons	CHE	Canton
IT-SO	Sondrio	ITA	Province
IT-BZ	Trentino-South Tyrol	ITA	Province
AT-8	Vorarlberg	AUT	State
AT-7	Tyrol	AUT	State
IR-02	West Azerbaijan	IRN	Province
TR-76	Iğdır	TUR	Province
TR-04	Ağrı	TUR	Province
TR-65	Van	TUR	Province
LT-MR	Marijampolė	LTU	County
PL-PD	Podlaskie Voivodeship	POL	Voivodeship|Province
PL-WN	Warmian-Masurian Voivodeship	POL	Voivodeship|Province
ZM-05	Northern	ZMB	Province
NL-GR	Groningen	NLD	Province
DE-NI	Lower Saxony	DEU	State
NL-DR	Drenthe	NLD	Province
NL-OV	Overijssel	NLD	Province
DE-NW	North Rhine-Westphalia	DEU	State
NL-GE	Gelderland	NLD	Province
NL-LI	Limburg	NLD	Province
LI-09	Triesen	LIE	\N
LI-07	Schaan	LIE	\N
LI-10	Triesenberg	LIE	\N
LI-01	Balzers	LIE	\N
LI-05	Planken	LIE	\N
LI-02	Eschen	LIE	\N
LI-04	Mauren	LIE	\N
LI-08	Schellenberg	LIE	\N
LI-06	Ruggell	LIE	\N
CI-10	Denguélé	CIV	Region
GN-K	Kankan	GIN	Prefecture
GN-MD	Mandiana Prefecture	GIN	Prefecture
GN-BE	Beyla Prefecture	GIN	Prefecture
CI-17	Bafing	CIV	Region
CI-06	Dix-Huit Montagnes	CIV	Department
GN-LO	Lola Prefecture	GIN	Prefecture
IT-IM	Imperia	ITA	Province
FR-06	Alpes-Maritimes	FRA	Metropolitan department
IT-CN	Cuneo	ITA	Province
FR-04	Alpes-de-Haute-Provence	FRA	Metropolitan department
FR-05	Hautes-Alpes	FRA	Metropolitan department
IT-TO	Turin	ITA	Province
FR-73	Savoie	FRA	Metropolitan department
FR-74	Haute-Savoie	FRA	Metropolitan department
RU-MUR	Murmansk	RUS	Region
RU-KR	Karelia	RUS	Republic
FI-14	Northern Ostrobothnia	FIN	Province
FI-05	Kainuu	FIN	Province
FI-13	North Karelia	FIN	Province
FI-02	South Karelia	FIN	Province
RU-LEN	Leningrad	RUS	Region
FI-09	Kymenlaakso	FIN	Province
OM-BA	Al Batinah North	OMN	Region
AE-DU	Emirate of Dubai	ARE	Emirate
AE-X01~	Fujairah	ARE	Emirate
OM-BU	Al Buraimi	OMN	Province
AE-X02~	Sayh Mudayrah	ARE	Emirate
AE-AZ	Emirate of Abu Dhabi	ARE	Emirate
OM-ZA	Ad Dhahirah	OMN	Region
AZ-BAL	Balakan	AZE	District
AZ-ZAQ	Zaqatala	AZE	District
AZ-XAC	Khachmaz	AZE	District
AZ-QUS	Qusar	AZE	District
AZ-OGU	Oghuz	AZE	District
AZ-SA	Sheki	AZE	District
AZ-QAX	Qakh	AZE	District
AZ-QAB	Qabala	AZE	District
BR-AP	Amapá	BRA	State
AZ-SMX	Samukh	AZE	District
RS-01	North Bačka	SRB	District
HU-BK	Bács-Kiskun	HUN	County
RS-05	West Bačka	SRB	District
RS-03	North Banat	SRB	District
HU-SD	Szeged	HUN	Urban county
ML-1	Kayes	MLI	Region
SN-KE	Kédougou	SEN	Region
SN-TC	Tambacounda	SEN	Region
GN-KN	Koundara Prefecture	GIN	Prefecture
SN-KD	Kolda	SEN	Region
GN-ML	Mali Prefecture	GIN	Prefecture
NG-KE	Kebbi State	NGA	State
BJ-AL	Alibori	BEN	Department
NG-NI	Niger State	NGA	State
BJ-BO	Borgou	BEN	Department
NG-KW	Kwara State	NGA	State
NG-OG	Ogun State	NGA	State
BJ-PL	Plateau	BEN	Department
BJ-CO	Collines	BEN	Department
NG-OY	Oyo State	NGA	State
NG-LA	Lagos	NGA	State
BJ-OU	Ouémé	BEN	Department
AO-CAB	Cabinda	AGO	Province
CG-5	Kouilou	COG	Region
HU-ZA	Zala	HUN	County
HR-20	Međimurje	HRV	County
HU-SO	Somogy	HUN	County
HR-10	Virovitica-Podravina	HRV	County
HR-06	Koprivnica-Križevci	HRV	County
HU-BA	Baranya	HUN	County
HR-14	Osijek-Baranja	HRV	County
SI-090	Piran	SVN	Commune|Municipality
HR-18	Istria	HRV	County
SI-078	Moravske Toplice	SVN	Commune|Municipality
SI-033	Šalovci	SVN	Commune|Municipality
SI-161	Hodoš	SVN	Commune|Municipality
SI-031	Gornji Petrovci	SVN	Commune|Municipality
SI-056	Kuzma	SVN	Commune|Municipality
SI-059	Lendava	SVN	Commune|Municipality
SI-156	Dobrovnik	SVN	Commune|Municipality
SI-047	Kobilje	SVN	Commune|Municipality
QA-RA	Al Rayyan	QAT	Municipality
SA-04	Eastern	SAU	Region
BW-NW	North-West	BWA	District
ZW-MN	Matabeleland North	ZWE	Province
BW-CE	Central	BWA	District
ZW-MS	Matabeleland South	ZWE	Province
BW-NE	North-East	BWA	District
PK-GB	Gilgit-Baltistan	PAK	Centrally Administered Area
BG-02	Burgas	BGR	Province
TR-39	Kırklareli	TUR	Province
BG-28	Yambol	BGR	Province
TR-22	Edirne	TUR	Province
BG-26	Haskovo	BGR	Province
KH-22	Oddar Meanchey	KHM	Province
TH-32	Surin	THA	Province
KH-13	Preah Vihear	KHM	Province
TH-33	Si Sa Ket	THA	Province
TH-34	Ubon Ratchathani	THA	Province
KH-17	Siem Reap	KHM	Province
KH-1	Banteay Meanchey	KHM	Province
TH-27	Sa Kaeo	THA	Province
TH-31	Buri Ram	THA	Province
KH-9	Koh Kong	KHM	Province
TH-23	Trat	THA	Province
KH-15	Pursat	KHM	Province
KH-2	Battambang	KHM	Province
KH-24	Pailin	KHM	Municipality
TH-22	Chanthaburi	THA	Province
ES-ML	Melilla	ESP	Autonomous City
MA-04	Oriental	MAR	Region
IN-SK	Sikkim	IND	State
BT-13	Haa	BTN	District
BT-14	Samtse	BTN	District
IN-WB	West Bengal	IND	State
BT-12	Chukha	BTN	District
BT-31	Geylegphug	BTN	District
IN-AS	Assam	IND	State
BT-34	Zhemgang	BTN	District
BT-45	Samdrup Jongkhar	BTN	District
BT-41	Trashigang	BTN	District
MY-09	Perlis	MYS	State
TH-91	Satun	THA	Province
TH-90	Songkhla	THA	Province
MY-02	Kedah	MYS	State
TH-95	Yala	THA	Province
MY-03	Kelantan	MYS	State
TH-96	Narathiwat	THA	Province
MY-08	Perak	MYS	State
SM-09	Serravalle	SMR	\N
IT-RN	Rimini	ITA	Province
SM-03	Domagnano	SMR	\N
SM-04	Faetano	SMR	\N
IT-PU	Pesaro and Urbino	ITA	Province
SM-08	Montegiardino	SMR	\N
SM-05	Fiorentino	SMR	\N
SM-02	Chiesanuova	SMR	\N
SM-07	San Marino	SMR	\N
SM-01	Acquaviva	SMR	\N
SM-06	Borgo Maggiore	SMR	\N
HT-NE	Nord-Est	HTI	Department
DO-15	Monte Cristi	DOM	Province
DO-05	Dajabón	DOM	Province
HT-CE	Centre	HTI	Department
DO-07	La Estrelleta	DOM	Province
DO-10	Independencia	DOM	Province
HT-OU	Ouest	HTI	Department
HT-SE	Sud-Est	HTI	Department
DO-16	Pedernales	DOM	Province
TD-LC	Lac	TCD	Prefecture
NG-BO	Borno State	NGA	State
KW-JA	Al Jahra	KWT	Province
IQ-BA	Basra	IRQ	Province
IQ-MU	Al Muthanna	IRQ	Province
SV-AH	Ahuachapán	SLV	Department
GT-JU	Jutiapa	GTM	Department
SV-SA	Santa Ana	SLV	Department
GT-CQ	Chiquimula	GTM	Department
ID-NT	East Nusa Tenggara	IDN	Province
TL-OE	Oe-Cusse Ambeno	TLS	District|Regencies
TL-BO	Bobonaro	TLS	District|Regencies
TL-CO	Cova Lima	TLS	District|Regencies
MY-13	Sarawak	MYS	State
BN-TE	Temburong	BRN	District
ID-KB	West Kalimantan	IDN	Province
AT-5	Salzburg	AUT	State
IT-BL	Belluno	ITA	Province
AT-2	Carinthia	AUT	State
IT-UD	Udine	ITA	Province
MC-X01~	Monaco	MCO	\N
ML-6	Tombouctou	MLI	Region
DZ-01	Adrar	DZA	Province
SI-053	Kranjska Gora	SVN	Commune|Municipality
SI-006	Bovec	SVN	Commune|Municipality
SI-046	Kobarid	SVN	Commune|Municipality
SI-128	Tolmin	SVN	Commune|Municipality
SI-044	Kanal ob Soči	SVN	Commune|Municipality
SI-007	Brda	SVN	Commune|Municipality
IT-GO	Gorizia	ITA	Province
SI-084	Nova Gorica	SVN	Statistical Region
SI-183	Šempeter–Vrtojba	SVN	Commune|Municipality
SI-075	Miren–Kostanjevica	SVN	Commune|Municipality
SI-049	Komen	SVN	Commune|Municipality
IT-TS	Trieste	ITA	Province
SI-111	Sežana	SVN	Commune|Municipality
SI-035	Hrpelje-Kozina	SVN	Commune|Municipality
SI-050	Koper	SVN	Commune|Municipality
SZ-LU	Lubombo	SWZ	District
BI-MY	Muyinga	BDI	Province
RW-02	Eastern	RWA	Province
BI-KI	Kirundo	BDI	Province
RW-05	Southern	RWA	Province
BI-NG	Ngozi	BDI	Province
BI-CI	Cibitoke	BDI	Province
RW-04	Western	RWA	Province
BI-KY	Kayanza	BDI	Province
MM-16	Rakhine State	MMR	State
BD-B	Chattogram	BGD	Division
MM-14	Chin State	MMR	State
FR-64	Pyrenees-Atlantics	FRA	Metropolitan department
ES-NA	Navarre	ESP	Autonomous Community
ES-SS	Gipuzkoa	ESP	Autonomous Community
ES-HU	Huesca	ESP	Autonomous Community
FR-31	Haute-Garonne	FRA	Metropolitan department
ES-L	Lleida	ESP	Autonomous Community
FR-65	Hautes-Pyrénées	FRA	Metropolitan department
FR-09	Ariège	FRA	Metropolitan department
AD-05	Ordino	AND	\N
AD-02	Canillo	AND	\N
FR-66	Pyrénées-Orientales	FRA	Metropolitan department
AD-03	Encamp	AND	\N
AD-04	La Massana	AND	\N
ES-GI	Girona	ESP	Autonomous Community
AD-06	Sant Julià de Lòria	AND	\N
AD-08	Escaldes-Engordany	AND	\N
AF-BDS	Badakhshan	AFG	Province
GR-B	Centre Macedonia	GRC	Region
MK-56	Novo Selo	MKD	Statistical Region
MK-26	Dojran	MKD	Statistical Region
MK-10	Valandovo	MKD	Statistical Region
MK-73	Strumica	MKD	Statistical Region
MK-05	Bogdanci	MKD	Statistical Region
MK-18	Gevgelija	MKD	Statistical Region
MK-36	Kavadarci	MKD	Statistical Region
MK-55	Novaci	MKD	Statistical Region
MK-62	Prilep	MKD	Statistical Region
MK-04	Bitola	MKD	Statistical Region
XK-X05~	Gnjilane	KOS	District
MK-48	Lipkovo	MKD	Statistical Region
XK-X27~	Viti/Vitina	KOS	District
MK-82	Čučer-Sandevo	MKD	Statistical Region
XK-X07~	Kačanik	KOS	District
MK-29	Gjorče Petrov	MKD	Municipality
MK-68	Saraj	MKD	Municipality
MK-35	Jegunovce	MKD	Municipality
XK-X24~	Štrpce	KOS	District
MK-75	Tearce	MKD	Municipality
MK-76	Tetovo	MKD	Statistical Region
MK-06	Bogovinje	MKD	Statistical Region
MK-16	Vrapčište	MKD	Statistical Region
RS-24	Pčinja	SRB	District
MK-44	Kriva Palanka	MKD	Statistical Region
MK-65	Rankovce	MKD	Statistical Region
MK-71	Staro Nagoričane	MKD	Statistical Region
MK-47	Kumanovo	MKD	Statistical Region
BG-05	Vidin	BGR	Province
RS-14	Bor	SRB	District
RS-15	Zaječar	SRB	District
RS-22	Pirot	SRB	District
BG-14	Pernik	BGR	Province
BG-23	Sofia	BGR	Province
BG-12	Montana	BGR	Province
RS-23	Jablanica	SRB	District
BG-10	Kyustendil	BGR	Province
MK-23	Delčevo	MKD	Statistical Region
MK-51	Makedonska Kamenica	MKD	Statistical Region
BG-01	Blagoevgrad	BGR	Province
MK-03	Berovo	MKD	Statistical Region
MK-60	Pehčevo	MKD	Statistical Region
HR-19	Dubrovnik-Neretva	HRV	County
ME-08	Herceg Novi	MNE	Municipality
BA-X07~	Trebinje	BIH	\N
UG-411	Ntungamo	UGA	District
UG-417	Isingiro	UGA	County
RW-03	Northern	RWA	Province
UG-404	Kabale	UGA	District
UG-408	Kisoro	UGA	District
-99-X13~	USNB, Guantanamo Bay	USG	\N
CU-14	Guantánamo	CUB	Province
IN-UT	Uttarakhand	IND	State
XK-X12~	Leposavić	KOS	District
RS-18	Raška	SRB	District
RS-19	Rasina	SRB	District
RS-21	Toplica	SRB	District
XK-X19~	Podujevo/Podujeva	KOS	District
XK-X29~	Zubin Potok	KOS	District
XK-X30~	Zvečan	KOS	District
XK-X06~	Istok	KOS	District
XK-X20~	Kosovo and Metohija	KOS	District
XK-X10~	Kosovo-Pomoravlje	KOS	District
ME-17	Rožaje	MNE	Municipality
XK-X18~	Peja	KOS	District
ME-03	Berane	MNE	Municipality
ME-13	Plav	MNE	Municipality
ME-14	Pljevlja	MNE	Municipality
RS-16	Zlatibor	SRB	District
ME-04	Bijelo Polje	MNE	Municipality
HN-OC	Ocotepeque	HND	Department
SV-CH	Chalatenango	SLV	Department
HN-LE	Lempira	HND	Department
SV-CA	Cabañas	SLV	Department
HN-IN	Intibucá	HND	Department
SV-MO	Morazán	SLV	Department
HN-LP	La Paz	HND	Department
SV-SM	San Miguel	SLV	Department
SV-UN	La Unión	SLV	Department
HN-VA	Valle	HND	Department
NI-AN	North Caribbean Coast	NIC	Autonomous Region
HN-OL	Olancho	HND	Department
HN-GD	Gracias a Dios	HND	Department
NI-JI	Jinotega	NIC	Department
HN-EP	El Paraíso	HND	Department
NI-NS	Nueva Segovia	NIC	Department
NI-CI	Chinandega	NIC	Department
HN-CH	Choluteca	HND	Department
NI-MD	Madriz	NIC	Department
EC-E	Esmeraldas	ECU	Province
CO-NAR	Nariño	COL	Department
EC-C	Carchi	ECU	Province
EC-U	Sucumbíos	ECU	Province
CO-PUT	Putumayo	COL	Intendancy
SR-NI	Nickerie	SUR	District
SR-MA	Marowijne	SUR	District
BO-T	Tarija	BOL	Department
PY-19	Boquerón	PRY	Department
AR-P	Formosa	ARG	Province
PY-15	Presidente Hayes	PRY	Department
PY-11	Central	PRY	Department
PY-ASU	Asunción	PRY	Capital District
PY-10	Alto Paraná	PRY	Department
AR-N	Misiones	ARG	Province
PY-7	Itapúa	PRY	Department
PY-12	Ñeembucú	PRY	Department
AR-H	Chaco	ARG	Province
AR-W	Corrientes	ARG	Province
PY-8	Misiones	PRY	Department
BO-S	Santa Cruz	BOL	Department
BR-MS	Mato Grosso do Sul	BRA	State
PY-16	Alto Paraguay	PRY	Department
PY-1	Concepción	PRY	Department
PY-13	Amambay	PRY	Department
PY-14	Canindeyú	PRY	Department
BR-PR	Paraná	BRA	State
BR-SC	Santa Catarina	BRA	State
NL-ZE	Zeeland	NLD	Province
BE-VOV	East Flanders	BEL	Province
NL-NB	North Brabant	NLD	Province
BE-VAN	Antwerp	BEL	Province
BE-VLI	Limburg	BEL	Province
DE-BW	Baden-Württemberg	DEU	State
CH-SH	Schaffhausen	CHE	Canton
CH-TG	Thurgau	CHE	Canton
CH-ZH	Zürich	CHE	Canton
CH-AG	Aargau	CHE	Canton
CH-BS	Basel-Stadt	CHE	Canton
CH-BL	Basel-Landschaft	CHE	Canton
FR-67	Bas-Rhin	FRA	Metropolitan department
FR-68	Haut-Rhin	FRA	Metropolitan department
CH-SG	St. Gallen	CHE	Canton
LI-11	Vaduz	LIE	\N
LI-03	Gamprin	LIE	\N
CH-SO	Solothurn	CHE	Canton
CH-JU	Jura	CHE	Canton
FR-90	Territoire de Belfort	FRA	Metropolitan department
FR-25	Doubs	FRA	Metropolitan department
CH-GE	Geneva	CHE	Canton
FR-01	Ain	FRA	Metropolitan department
CH-VD	Vaud	CHE	Canton
FR-39	Jura	FRA	Metropolitan department
CH-NE	Neuchâtel	CHE	Canton
ES-BA	Badajoz	ESP	Autonomous Community
PT-07	Évora	PRT	District
PT-12	Portalegre	PRT	District
SI-105	Rogašovci	SVN	Commune|Municipality
AT-6	Styria	AUT	State
SI-152	Cankova	SVN	Commune|Municipality
SI-029	Gornja Radgona	SVN	Commune|Municipality
SI-195	Apače	SVN	Commune|Municipality
SI-118	Šentilj	SVN	Commune|Municipality
SI-055	Kungota	SVN	Commune|Municipality
SI-070	Maribor	SVN	Commune|Municipality
SI-178	Selnica ob Dravi	SVN	Commune|Municipality
SI-101	Radlje ob Dravi	SVN	Commune|Municipality
SI-081	Muta	SVN	Commune|Municipality
SI-025	Dravograd	SVN	Commune|Municipality
SI-093	Podvelka	SVN	Commune|Municipality
SI-103	Ravne na Koroškem	SVN	Commune|Municipality
SI-175	Prevalje	SVN	Commune|Municipality
SI-074	Mežica	SVN	Commune|Municipality
SI-016	Črna na Koroškem	SVN	Commune|Municipality
SI-131	Tržič	SVN	Commune|Municipality
SI-192	Žirovnica	SVN	Commune|Municipality
SI-041	Jesenice	SVN	Commune|Municipality
SI-180	Solčava	SVN	Commune|Municipality
SI-163	Jezersko	SVN	Commune|Municipality
BA-X06~	Foča	BIH	\N
ME-21	Žabljak	MNE	Municipality
ME-15	Plužine	MNE	Municipality
ME-12	Nikšić	MNE	Municipality
ME-10	Kotor	MNE	Municipality
HR-03	Sisak-Moslavina	HRV	County
BA-X02~	Banja Luka	BIH	\N
HR-04	Karlovac	HRV	County
HR-13	Zadar	HRV	County
BA-X01~	Doboj	BIH	\N
BA-SRP	Posavina Canton	BIH	Canton
HR-16	Vukovar-Syrmia	HRV	County
BA-BRC	Brčko	BIH	\N
BA-X03~	Bijeljina	BIH	\N
HR-17	Split-Dalmatia	HRV	County
RS-07	Srem	SRB	District
RS-08	Mačva	SRB	District
BA-X04~	Vlasenica	BIH	\N
RS-06	South Bačka	SRB	District
SK-BL	Bratislava	SVK	Region
SK-TA	Trnava	SVK	Region
SK-TC	Trenčín	SVK	Region
CZ-ZL	Zlín	CZE	Region
HU-BZ	Borsod-Abaúj-Zemplén	HUN	County
SK-BC	Banská Bystrica	SVK	Region
HU-NO	Nógrád	HUN	County
HU-ST	Salgótarján	HUN	Urban county
SK-NI	Nitra	SVK	Region
HU-KE	Komárom-Esztergom	HUN	County
HU-PE	Pest	HUN	County
PL-LB	Lubusz Voivodeship	POL	Voivodeship|Province
DE-BB	Brandenburg	DEU	State
PL-ZP	West Pomeranian Voivodeship	POL	Voivodeship|Province
DE-MV	Mecklenburg-Western Pomerania	DEU	State
RO-MH	Mehedinți	ROU	County
RO-DJ	Dolj	ROU	County
BG-19	Silistra	BGR	Province
RO-CL	Călărași	ROU	County
BG-18	Ruse	BGR	Province
RO-TR	Teleorman	ROU	County
RO-GR	Giurgiu	ROU	County
RO-CT	Constanța	ROU	County
BG-08	Dobrich	BGR	Province
BG-06	Vratsa	BGR	Province
RO-OT	Olt	ROU	County
BG-15	Pleven	BGR	Province
BG-04	Veliko Tarnovo	BGR	Province
RS-02	Central Banat	SRB	District
RS-04	South Banat	SRB	District
RO-CS	Caraș-Severin	ROU	County
RS-11	Braničevo	SRB	District
GR-A	East Macedonia and Thrace	GRC	Region
BG-09	Kardzhali	BGR	Province
BG-21	Smolyan	BGR	Province
AL-10	Shkodër	ALB	County
ME-01	Andrijevica	MNE	Municipality
ME-16	Podgorica	MNE	Municipality
ME-02	Bar	MNE	Municipality
ME-20	Ulcinj	MNE	Municipality
RO-BT	Botoșani	ROU	County
MD-BR	Briceni	MDA	District
MD-ED	Edineț	MDA	District
MD-RI	Rîșcani	MDA	District
MD-GL	Glodeni	MDA	District
MD-FA	Fălești	MDA	District
RO-IS	Iași	ROU	County
MD-UN	Ungheni	MDA	District
MD-NI	Nisporeni	MDA	District
MD-HI	Hîncești	MDA	District
RO-VS	Vaslui	ROU	County
MD-LE	Leova	MDA	District
MD-CT	Cantemir	MDA	District
MD-CA	Cahul	MDA	District
RO-GL	Galați	ROU	County
UA-77	Chernivtsi	UKR	Region
RO-SV	Suceava	ROU	County
RO-MM	Maramureș	ROU	County
UA-26	Ivano-Frankivsk	UKR	Region
UA-51	Odessa	UKR	Region
RO-TL	Tulcea	ROU	County
MD-OC	Ocnița	MDA	District
UA-05	Vinnytsia	UKR	Region
MD-DO	Dondușeni	MDA	District
MD-SO	Soroca	MDA	District
MD-CAM	Camenca	MDA	District
MD-RE	Rezina	MDA	District
MD-GRI	Grigoriopol	MDA	Territorial Unit
MD-BD	Bender	MDA	City
MD-SV	Ștefan Vodă	MDA	District
MD-CS	Căușeni	MDA	District
MD-CM	Cimișlia	MDA	District
MD-BS	Basarabeasca	MDA	District
MD-TA	Taraclia	MDA	District
MD-GA	Comrat	MDA	Autonomous Territory
PL-LU	Lublin Voivodeship	POL	Voivodeship|Province
UA-46	Lviv	UKR	Region
LV-024	Dagda	LVA	Municipality
LV-047	Krāslava	LVA	Municipality
RU-KGD	Kaliningrad	RUS	Region
LT-TA	Tauragė	LTU	County
RU-SMO	Smolensk	RUS	Region
BY-MA	Mahilioŭ	BLR	Region
RU-BRY	Bryansk	RUS	Region
UA-59	Sumy	UKR	Region
RU-KRS	Kursk	RUS	Region
RU-BEL	Belgorod	RUS	Region
UA-63	Kharkiv	UKR	Region
UA-09	Luhansk	UKR	Region
RU-VOR	Voronezh	RUS	Region
RU-ROS	Rostov	RUS	Region
UA-14	Donetsk	UKR	Region
IR-01	East Azerbaijan	IRN	Province
TR-36	Kars	TUR	Province
AM-AG	Aragatsotn	ARM	Province
AM-AV	Armavir	ARM	Province
IR-03	Ardabil	IRN	Province
AZ-IMI	Imishli	AZE	District
AZ-BIL	Bilasuvar	AZE	District
AZ-CAL	Jalilabad	AZE	District
AZ-YAR	Yardimli	AZE	District
AZ-LER	Lerik	AZE	District
AZ-CAB	Jabrayil	AZE	District
AZ-FUZ	Fuzuli	AZE	District
AZ-BEY	Beylagan	AZE	District
AZ-AST	Astara	AZE	District
IR-19	Gilan	IRN	Province
RU-BU	Republic of Buryatia	RUS	Republic
MN-041	Khövsgöl	MNG	Province
RU-TY	Tuva Republic	RUS	Republic
MN-067	Bulgan	MNG	Province
MN-046	Uvs	MNG	Province
MN-049	Selenge	MNG	Province
RU-ZAB	Zabaykalsky Krai	RUS	Region
MN-057	Zavkhan	MNG	Province
MN-039	Khentii	MNG	Province
CN-HL	Heilongjiang	CHN	Province
RU-AMU	Amur	RUS	Region
RU-YEV	Jewish	RUS	Autonomous Region
RU-KHA	Khabarovsk Krai	RUS	Territory
RU-PRI	Primorsky Krai	RUS	Territory
CN-JL	Jilin	CHN	Province
KP-09	North Hamgyong	PRK	Province
KP-13	Rason	PRK	Province
KP-10	Ryanggang	PRK	Province
KP-04	Chagang	PRK	Province
CN-LN	Liaoning	CHN	Province
KP-03	North Pyongan	PRK	Province
UZ-SI	Sirdaryo	UZB	Region
UZ-JI	Jizzakh	UZB	Region
UZ-SA	Samarqand	UZB	Region
UZ-QA	Qashqadaryo	UZB	Region
UZ-SU	Surxondaryo	UZB	Region
TJ-KT	Khatlon	TJK	Region
AF-TAK	Takhar	AFG	Province
AF-KDZ	Kunduz	AFG	Province
AF-BAL	Balkh	AFG	Province
TM-L	Lebap	TKM	Province
AF-JOW	Jowzjan	AFG	Province
AF-FYB	Faryab	AFG	Province
TM-M	Mary	TKM	Province
AF-BDG	Badghis	AFG	Province
AF-HER	Herat	AFG	Province
TM-A	Ahal	TKM	Province
SY-HA	Al-Hasakah	SYR	Province
TR-47	Mardin	TUR	Province
SY-RA	Al-Raqqah	SYR	Province
TR-63	Şanlıurfa	TUR	Province
SY-HL	Aleppo	SYR	Province
TR-79	Kilis	TUR	Province
TR-27	Gaziantep	TUR	Province
TR-31	Hatay	TUR	Province
SY-ID	Idlib	SYR	Province
SY-LA	Latakia	SYR	Province
IQ-SU	Sulaymaniyah	IRQ	Province
IR-16	Kurdistan	IRN	Province
IR-17	Kermanshah	IRN	Province
IQ-DI	Diyala	IRQ	Province
IR-05	Ilam	IRN	Province
IQ-WA	Wasit	IRQ	Province
IQ-MA	Maysan	IRQ	Province
IR-10	Khuzestan	IRN	Province
JO-IR	Irbid	JOR	Province
JO-MD	Madaba	JOR	Province
JO-KA	Karak	JOR	Province
JO-AT	Tafilah	JOR	Province
JO-AQ	Aqaba	JOR	Province
JO-BA	Balqa	JOR	Province
NP-KA	Karnali Zone	NPL	Administrative Zone
NP-MA	Mahakali Zone	NPL	Administrative Zone
NP-SE	Seti Zone	NPL	District
NP-DH	Dhaulagiri Zone	NPL	Administrative Zone
NP-GA	Gandaki Zone	NPL	District
NP-BA	Bagmati Zone	NPL	District
NP-JA	Janakpur Zone	NPL	Administrative Zone
NP-SA	Sagarmatha Zone	NPL	Administrative Zone
NP-KO	Bhojpur	NPL	District
NP-ME	Mechi Zone	NPL	Administrative Zone
MM-11	Kachin State	MMR	State
MM-01	Sagaing	MMR	Division
IN-NL	Nagaland	IND	State
IN-MN	Manipur	IND	State
IN-MZ	Mizoram	IND	State
TH-57	Chiang Rai	THA	Province
MM-17	Shan State	MMR	State
TH-50	Chiang Mai	THA	Province
TH-58	Mae Hong Son	THA	Province
MM-12	Kayah State	MMR	State
MM-13	Kayin State	MMR	State
TH-63	Tak	THA	Province
TH-71	Kanchanaburi	THA	Province
MM-15	Mon State	MMR	State
MM-05	Tanintharyi	MMR	Division
TH-77	Prachuap Khiri Khan	THA	Province
TH-76	Phetchaburi	THA	Province
TH-70	Ratchaburi	THA	Province
TH-86	Chumphon	THA	Province
TH-85	Ranong	THA	Province
LA-BK	Bokeo	LAO	Province
LA-XA	Sainyabuli	LAO	Province
TH-56	Phayao	THA	Province
TH-55	Nan	THA	Province
TH-53	Uttaradit	THA	Province
TH-65	Phitsanulok	THA	Province
TH-42	Loei	THA	Province
TH-38	Bueng Kan	THA	Province
LA-BL	Bolikhamsai	LAO	Province
TH-43	Nong Khai	THA	Province
TH-48	Nakhon Phanom	THA	Province
LA-KH	Khammouane	LAO	Province
LA-SV	Savannakhet	LAO	Province
TH-49	Mukdahan	THA	Province
TH-37	Amnat Charoen	THA	Province
LA-SL	Salavan	LAO	Province
LA-VI	Vientiane	LAO	Province
LA-CH	Champasak	LAO	Province
VN-71	Điện Biên	VNM	Province
LA-LP	Luang Prabang	LAO	Province
LA-HO	Houaphanh	LAO	Province
VN-05	Sơn La	VNM	Region
VN-21	Thanh Hóa	VNM	Province
VN-22	Nghệ An	VNM	Province
LA-XI	Xiangkhouang	LAO	Province
VN-23	Hà Tĩnh	VNM	Region
VN-24	Quảng Bình	VNM	Province
VN-25	Quảng Trị	VNM	Province
VN-26	Thừa Thiên Huế	VNM	Province
LA-XE	Sekong	LAO	Province
VN-27	Quảng Nam	VNM	Province
LA-AT	Attapeu	LAO	Province
ZA-NL	KwaZulu-Natal	ZAF	Province
LS-J	Mokhotlong	LSO	District
ZA-FS	Free State	ZAF	Province
LS-B	Butha-Buthe	LSO	District
LS-C	Leribe	LSO	District
ZA-EC	Eastern Cape	ZAF	Province
LS-H	Qacha's Nek	LSO	District
LS-K	Thaba-Tseka	LSO	District
LS-D	Berea	LSO	District
LS-A	Maseru	LSO	District
LS-E	Mafeteng	LSO	District
LS-F	Mohale's Hoek	LSO	District
LS-G	Quthing	LSO	District
ZA-LP	Limpopo	ZAF	Province
BW-KL	Kgatleng	BWA	District
ZA-NW	North West	ZAF	Province
BW-SE	South-East	BWA	District
BW-SO	Southern	BWA	District
BW-KG	Kgalagadi	BWA	District
ZW-MV	Masvingo	ZWE	Province
ZM-09	Lusaka	ZMB	Province
ZW-MW	Mashonaland West	ZWE	Province
ZW-MC	Mashonaland Central	ZWE	Province
ZM-07	Southern	ZMB	Province
CF-KG	Kémo Prefecture	CAF	Prefecture
CF-UK	Ouaka Prefecture	CAF	Prefecture
CF-BK	Basse-Kotto Prefecture	CAF	Prefecture
CF-MB	Mbomou Prefecture	CAF	Prefecture
CF-MP	Ombella-M'Poko Prefecture	CAF	Prefecture
CF-BGF	Bangui	CAF	Autonomous Commune
CF-LB	Lobaye Prefecture	CAF	Prefecture
TZ-05	Kagera	TZA	Region
BI-CA	Cankuzo	BDI	Province
BI-RY	Ruyigi	BDI	Province
BI-RT	Rutana	BDI	Province
BI-MA	Makamba	BDI	Province
BI-BB	Bubanza	BDI	Province
BI-BL	Bujumbura Rural	BDI	Province
BI-BM	Bujumbura Mairie	BDI	Province
BI-BR	Bururi	BDI	Province
CD-NK	North Kivu	COD	Province
ET-AM	Amhara	ETH	Administrative State
SD-GD	Al Qadarif	SDN	State
ET-TI	Tigray	ETH	Administrative State
ET-BE	Benishangul-Gumuz	ETH	Administrative State
SD-NB	Blue Nile	SDN	State
SD-SI	Sennar	SDN	Region
ET-GA	Gambela	ETH	Administrative State
SS-NU	Upper Nile	SDS	State
ET-OR	Oromia	ETH	Administrative State
SS-JG	Jonglei	SDS	State
TD-SI	Sila	TCD	Prefecture
TD-SA	Salamat	TCD	Prefecture
CF-BB	Bamingui-Bangoran Prefecture	CAF	Prefecture
TD-MC	Moyen-Chari	TCD	Prefecture
CF-AC	Ouham Prefecture	CAF	Prefecture
TD-MA	Mandoul	TCD	Prefecture
TD-LR	Logone Oriental	TCD	Prefecture
CF-OP	Ouham-Pendé Prefecture	CAF	Prefecture
CM-SU	South	CMR	Province
GA-9	Woleu-Ntem	GAB	Province
CG-13	Sangha	COG	Region
GA-6	Ogooué-Ivindo	GAB	Province
CG-15	Cuvette-Ouest	COG	Region
GA-2	Haut-Ogooué	GAB	Province
GA-7	Ogooué-Lolo	GAB	Province
GA-4	Ngounié	GAB	Province
CG-2	Lékoumou	COG	Region
GA-5	Nyanga	GAB	Province
TD-HL	Hadjer-Lamis	TCD	Prefecture
CM-EN	Far North	CMR	Province
TD-CB	Chari-Baguirmi	TCD	Prefecture
TD-ND	N'Djamena	TCD	Capital
TD-ME	Mayo-Kebbi Est	TCD	Prefecture
TD-MO	Mayo-Kebbi Ouest	TCD	Prefecture
CM-NO	North	CMR	Province
NG-AD	Adamawa State	NGA	State
CM-AD	Adamawa	CMR	Province
NG-TA	Taraba State	NGA	State
CM-NW	Northwest	CMR	Province
CM-SW	Southwest	CMR	Province
NG-BE	Benue State	NGA	State
NG-CR	Cross River State	NGA	State
NG-SO	Sokoto State	NGA	State
NE-5	Tahoua	NER	Department
NE-3	Dosso	NER	Department
NE-2	Diffa	NER	Department
NE-4	Maradi	NER	Department
NG-ZA	Zamfara State	NGA	State
NG-YO	Yobe State	NGA	State
NE-7	Zinder	NER	Department
NG-KT	Katsina State	NGA	State
NG-JI	Jigawa State	NGA	State
NE-6	Tillabéri	NER	Department
BF-TAP	Tapoa	BFA	Province
BJ-AK	Atakora	BEN	Department
BF-KMP	Kompienga	BFA	Province
TG-S	Savanes	TGO	Region
GH-UE	Upper East	GHA	Region
GH-NP	Northern	GHA	Region
TG-K	Kara	TGO	Region
TG-C	Centre	TGO	Region
TG-P	Plateaux	TGO	Region
GH-TV	Volta	GHA	Region
TG-M	Maritime	TGO	Region
CI-08	Zanzan	CIV	Region
GH-BA	Brong-Ahafo	GHA	Region
CI-05	Comoé	CIV	Department
GH-WP	Western	GHA	Region
CI-13	Sud-Comoé	CIV	Region
BF-LER	Léraba	BFA	Province
CI-03	Savanes	CIV	Department
BF-COM	Comoé	BFA	Province
BF-PON	Poni	BFA	Province
BF-NOU	Noumbiel	BFA	Province
BF-OUD	Oudalan	BFA	Province
ML-7	Gao	MLI	Region
BF-SOM	Soum	BFA	Province
ML-5	Mopti	MLI	Region
BF-LOR	Loroum	BFA	Province
BF-YAT	Yatenga	BFA	Province
BF-SOR	Sourou	BFA	Province
BF-KOS	Kossi	BFA	Province
ML-4	Ségou	MLI	Region
BF-BAN	Banwa	BFA	Province
ML-3	Wassoulou	MLI	Region
BF-HOU	Houet	BFA	Province
BF-KEN	Kénédougou	BFA	Province
LR-NI	Nimba	LBR	County
CI-19	Moyen-Cavally	CIV	Department
LR-GG	Grand Gedeh	LBR	County
CI-09	Bas-Sassandra	CIV	Department
LR-X2~	River Gee	LBR	County
LR-MY	Maryland	LBR	County
GN-MC	Macenta Prefecture	GIN	Prefecture
GN-YO	Yomou Prefecture	GIN	Prefecture
LR-BG	Bong	LBR	County
GN-NZ	Nzérékoré Prefecture	GIN	Prefecture
GN-GA	Gaoual Prefecture	GIN	Prefecture
GW-GA	Gabú	GNB	Region
GN-BK	Boké	GIN	Prefecture
GW-TO	Tombali	GNB	Region
GN-SI	Siguiri Prefecture	GIN	Prefecture
ML-2	Koulikoro	MLI	Region
GN-KB	Koubia Prefecture	GIN	Prefecture
GN-TO	Tougué Prefecture	GIN	Prefecture
GN-DI	Dinguiraye Prefecture	GIN	Prefecture
KH-19	Stung Treng	KHM	Province
VN-03	Hà Giang	VNM	Province
CN-GX	Guangxi	CHN	Autonomous Region
VN-04	Cao Bằng	VNM	Province
VN-02	Lào Cai	VNM	Province
VN-01	Lai Châu	VNM	Province
VN-09	Lạng Sơn	VNM	Province
VN-13	Quảng Ninh	VNM	Province
BN-BM	Brunei-Muara	BRN	District
BN-TU	Tutong	BRN	District
BN-BE	Belait	BRN	District
IN-TR	Tripura	IND	State
BD-G	Sylhet	BGD	Division
IN-ML	Meghalaya	IND	State
BD-C	Dhaka	BGD	Division
BD-F	Rangpur	BGD	Division
BD-E	Rajshahi	BGD	Division
BD-D	Khulna	BGD	Division
MZ-P	Cabo Delgado	MOZ	Province
TZ-17	Mtwara	TZA	Region
MZ-A	Niassa	MOZ	Province
GI-X01~	Gibraltar	GIB	\N
ES-CA	Cádiz	ESP	Autonomous Community
US-WA	Washington	USA	State
CA-BC	British Columbia	CAN	Province
US-ID	Idaho	USA	State
US-MT	Montana	USA	State
CA-AB	Alberta	CAN	Province
CA-SK	Saskatchewan	CAN	Province
US-ND	North Dakota	USA	State
CA-MB	Manitoba	CAN	Province
US-MN	Minnesota	USA	State
CA-ON	Ontario	CAN	Province
US-MI	Michigan	USA	State
US-OH	Ohio	USA	State
US-PA	Pennsylvania	USA	State
US-NY	New York	USA	State
CA-QC	Quebec	CAN	Province
US-VT	Vermont	USA	State
US-NH	New Hampshire	USA	State
US-ME	Maine	USA	State
CA-NB	New Brunswick	CAN	Province
US-AZ	Arizona	USA	State
MX-SON	Sonora	MEX	State
MX-BCN	Baja California	MEX	State
US-CA	California	USA	State
US-NM	New Mexico	USA	State
MX-CHH	Chihuahua	MEX	State
US-TX	Texas	USA	State
MX-COA	Coahuila	MEX	State
MX-TAM	Tamaulipas	MEX	State
MX-NLE	Nuevo León	MEX	State
BZ-CY	Cayo	BLZ	District
GT-PE	Petén	GTM	Department
BZ-OW	Orange Walk	BLZ	District
BZ-CZL	Corozal	BLZ	District
MX-ROO	Quintana Roo	MEX	State
MX-CAM	Campeche	MEX	State
MX-TAB	Tabasco	MEX	State
MX-CHP	Chiapas	MEX	State
GT-SM	San Marcos	GTM	Department
GT-HU	Huehuetenango	GTM	Department
GT-QC	Quiché	GTM	Department
GT-AV	Alta Verapaz	GTM	Department
CR-G	Guanacaste	CRI	Province
NI-RI	Rivas	NIC	Department
GT-IZ	Izabal	GTM	Department
HN-CR	Cortés	HND	Department
HN-SB	Santa Bárbara	HND	Department
HN-CP	Copán	HND	Department
GT-ZA	Zacapa	GTM	Department
PA-1	comarca Ngäbe-Buglé	PAN	Province
CR-L	Limón	CRI	Province
CR-P	Puntarenas	CRI	Province
PA-4	Chiriquí	PAN	Province
PA-KY	Guna Yala	PAN	Indigenous Territory
CO-CHO	Chocó	COL	Department
PA-EM	Emberá-Wounaan Comarca	PAN	Indigenous Territory
PA-5	Darién	PAN	Province
GY-BA	Barima-Waini	GUY	Region
VE-Y	Delta Amacuro	VEN	State
VE-F	Bolívar	VEN	State
BR-AM	Amazonas	BRA	State
CO-GUA	Guainía	COL	Commissiary
CO-VAU	Vaupés	COL	Commissiary
CO-AMA	Amazonas	COL	Commissiary
PE-LOR	Loreto	PER	Department
EC-D	Orellana	ECU	Province
EC-Y	Pastaza	ECU	Province
EC-S	Morona-Santiago	ECU	Province
PE-AMA	Amazonas	PER	Department
EC-Z	Zamora Chinchipe	ECU	Province
PE-CAJ	Cajamarca	PER	Department
EC-L	Loja	ECU	Province
PE-TUM	Tumbes	PER	Department
EC-O	El Oro	ECU	Province
PE-PIU	Piura	PER	Department
VE-Z	Amazonas	VEN	State
BO-H	Chuquisaca	BOL	Department
PE-UCA	Ucayali	PER	Department
BO-N	Pando	BOL	Department
BR-RO	Rondônia	BRA	State
BO-B	Beni	BOL	Department
BR-MT	Mato Grosso	BRA	State
PE-PUN	Puno	PER	Department
AR-K	Catamarca	ARG	Province
CL-AT	Atacama	CHL	Region
AR-F	La Rioja	ARG	Province
AR-J	San Juan	ARG	Province
CL-CO	Coquimbo	CHL	Region
AR-M	Mendoza	ARG	Province
CL-RM	Santiago	CHL	Region
CL-VS	Valparaíso	CHL	Region
CL-ML	Maule	CHL	Region
CL-LI	O'Higgins	CHL	Region
AR-Q	Neuquén	ARG	Province
CL-NB	Ñuble	CHL	Region
CL-AR	Araucanía	CHL	Region
CL-BI	Biobío	CHL	Region
CL-LR	Los Ríos	CHL	Region
AR-U	Chubut	ARG	Province
CL-LL	Los Lagos	CHL	Region
AR-R	Río Negro	ARG	Province
CL-AI	Aysén	CHL	Region
AR-Z	Santa Cruz	ARG	Province
CL-MA	Magellan and the Chilean Antarctic	CHL	Region
AR-V	Tierra del Fuego	ARG	National Territory
VE-V	Zulia	VEN	State
CO-LAG	La Guajira	COL	Department
CO-CES	Cesar	COL	Department
CO-NSA	Norte de Santander	COL	Department
VE-S	Tachira	VEN	State
VE-C	Apure	VEN	State
CO-ARA	Arauca	COL	Intendancy
CO-BOY	Boyacá	COL	Department
CO-VID	Vichada	COL	Commissiary
PL-PM	Pomeranian Voivodeship	POL	Voivodeship|Province
ID-PA	Papua	IDN	Province
PG-SAN	Sandaun	PNG	Province
PG-WPD	Western	PNG	Province
TM-B	Balkan	TKM	Province
KZ-MAN	Mangystau	KAZ	Region
KZ-KZY	Kyzylorda	KAZ	Region
UZ-QR	Karakalpakstan	UZB	Automonous Region
KZ-AKT	Aktobe	KAZ	Region
UZ-NW	Navoiy	UZB	Region
TM-D	Daşoguz	TKM	Province
UZ-XO	Xorazm	UZB	Region
UZ-BU	Bukhara	UZB	Region
IR-31	North Khorasan	IRN	Province
IR-27	Golestan	IRN	Province
IR-30	Razavi Khorasan	IRN	Province
IR-29	South Khorasan	IRN	Province
AF-NIM	Nimruz	AFG	Province
IR-13	Sistan and Baluchestan	IRN	Province
AF-FRA	Farah	AFG	Province
PK-KP	Khyber Pakhtunkhwa	PAK	Province
PK-TA	Federally Administered Tribal Areas	PAK	Territory
AF-KNR	Kunar	AFG	Province
AF-NUR	Nuristan	AFG	Province
AF-NAN	Nangarhar	AFG	Province
AF-KHO	Khost	AFG	Province
AF-PKA	Paktia	AFG	Province
PK-BA	Balochistan	PAK	Province
AF-PIA	Paktika	AFG	Province
AF-ZAB	Zabul	AFG	Province
AF-KAN	Kandahar	AFG	Province
AF-HEL	Helmand	AFG	Province
KZ-SEV	North Kazakhstan	KAZ	Region
RU-TYU	Tyumen	RUS	Region
RU-KGN	Kurgan	RUS	Region
RU-OMS	Omsk	RUS	Region
KZ-KUS	Kostanay	KAZ	Region
KZ-PAV	Pavlodar	KAZ	Region
RU-NVS	Novosibirsk	RUS	Region
RU-CHE	Chelyabinsk	RUS	Region
RU-ALT	Altai Republic	RUS	Territory
RU-ORE	Orenburg	RUS	Region
KZ-ZAP	West Kazakhstan	KAZ	Region
RU-SAR	Saratov	RUS	Region
RU-AST	Astrakhan	RUS	Region
RU-VGG	Volgograd	RUS	Region
KZ-ATY	Atyrau	KAZ	Region
JO-MA	Mafraq	JOR	Province
SY-SU	As-Suwayda	SYR	Province
SY-DR	Daraa	SYR	Province
EG-SIN	North Sinai	EGY	Governorate
SA-08	Northern Borders	SAU	Region
IQ-AN	Al Anbar	IRQ	Province
IQ-NA	Najaf	IRQ	Province
SA-12	Al-Jowf	SAU	Region
JO-MN	Ma'an	JOR	Province
JO-AM	Amman	JOR	Province
JO-AZ	Zarqa	JOR	Province
KW-AH	Al Ahmadi	KWT	Province
IQ-NI	Nineveh	IRQ	Province
SY-DY	Deir ez-Zor	SYR	Province
YE-HD	Hadhramaut	YEM	Governorate
OM-ZU	Dhofar	OMN	Province
YE-MR	Al Mahrah	YEM	Governorate
OM-WU	Al Wusta	OMN	Region
SA-10	Najran	SAU	Region
YE-SD	Sa'dah	YEM	Governorate
SA-14	'Asir	SAU	Region
YE-HJ	Hajjah	YEM	Governorate
SA-09	Jazan	SAU	Region
YE-JA	Al Jawf	YEM	Governorate
LY-KF	Kufra	LBY	Municipality|Governarate
TD-X01~	Ennedi	TCD	Préfecture
TD-BO	Borkou	TCD	Préfecture
LY-MQ	Murzuq	LBY	Municipality|Governarate
TD-TI	Tibesti	TCD	Préfecture
NE-1	Agadez	NER	Department
DZ-11	Tamanghasset	DZA	Province
MR-11	Tiris Zemmour	MRT	Region
DZ-37	Tindouf	DZA	Province
TD-KA	Kanem	TCD	Prefecture
SD-NO	Northern	SDN	State
EG-ASN	Aswan	EGY	Governorate
EG-BA	Red Sea	EGY	Governorate
SD-NR	River Nile	SDN	State
KE-400	Eastern	KEN	National Capital Area
KE-500	North Eastern	KEN	Province
DZ-08	Béchar	DZA	Province
MA-06	Meknès-Tafilalet	MAR	Region
MA-13	Suss-Massa-Draa	MAR	Region
MR-08	Dakhlet Nouadhibou	MRT	Region
MR-07	Adrar	MRT	Region
TN-32	Jendouba	TUN	Governorate
DZ-36	El Tarf	DZA	Province
TN-73	Kebili	TUN	Governorate
DZ-39	El Oued	DZA	Province
TN-72	Tozeur	TUN	Governorate
DZ-12	Tébessa	DZA	Province
TN-71	Gafsa	TUN	Governorate
TN-42	Kasserine	TUN	Governorate
TN-33	Kef	TUN	Governorate
DZ-41	Souk Ahras	DZA	Province
DZ-30	Ouargla	DZA	Province
ML-8	Kidal	MLI	Region
SD-DN	North Darfur	SDN	State
SD-DW	West Soudan	SDN	State
TD-OD	Ouaddaï	TCD	Prefecture
TD-WF	Wadi Fira	TCD	Prefecture
LY-BU	Butnan	LBY	Municipality|Governarate
EG-MT	Matrouh	EGY	Governorate
LY-AJ	Ajdabiya	LBY	Municipality|Governarate
EG-WAD	New Valley	EGY	Governorate
GW-BA	Bafatá	GNB	Region
GW-OI	Oio	GNB	Region
SN-SE	Sédhiou	SEN	Region
GW-CA	Cacheu	GNB	Region
SN-ZG	Ziguinchor	SEN	Region
SO-JH	Lower Juba	SOM	Region
KE-300	Coast	KEN	Province
TZ-13	Mara	TZA	Region
KE-600	Nyanza	KEN	Province
TZ-01	Arusha	TZA	Region
TZ-09	Kilimanjaro	TZA	Region
TZ-25	Tanga	TZA	Region
UG-110	Rakai	UGA	District
UG-101	Kalangala	UGA	District
UG-120	Buvuma	UGA	District
UG-214	Mayuge	UGA	District
UG-230	Namayingo	UGA	District
GQ-LI	Litoral	GNQ	Province
GQ-KN	Kié-Ntem	GNQ	Province
GQ-CS	Centro Sur	GNQ	Province
GQ-WN	Wele-Nzas	GNQ	Province
GA-1	Estuaire	GAB	Province
MR-05	Brakna	MRT	Region
SN-SL	Saint-Louis	SEN	Region
MR-06	Trarza	MRT	Region
MR-04	Gorgol	MRT	Region
SN-MT	Matam	SEN	Region
MR-10	Guidimaka	MRT	Region
MR-01	Hodh Ech Chargui	MRT	Region
MR-02	Hodh El Gharbi	MRT	Region
MR-03	Assaba	MRT	Region
ZM-01	Western	ZMB	Province
AO-CCU	Cuando Cubango	AGO	Province
AO-MOX	Moxico	AGO	Province
ZM-06	Northwestern	ZMB	Province
AO-NAM	Namibe	AGO	Province
NA-KU	Kunene	NAM	Region
AO-CNN	Cunene	AGO	Province
NA-OS	Omusati	NAM	Region
NA-OW	Ohangwena	NAM	Region
NA-OK	Kavango	NAM	Region
NA-CA	Zambezi	NAM	Region
MZ-T	Tete	MOZ	Province
ZW-ME	Mashonaland East	ZWE	Province
MZ-B	Manica	MOZ	Province
ZW-MA	Manicaland	ZWE	Province
MZ-G	Gaza	MOZ	Province
AO-ZAI	Zaire	AGO	Province
AO-UIG	Uíge	AGO	Province
CD-KW	Kasaï-Occidental	COD	Province
AO-LNO	Lunda Norte	AGO	Province
AO-MAL	Malanje	AGO	Province
AO-LSU	Lunda Sul	AGO	Province
NA-HA	Hardap	NAM	Region
NA-OD	Otjozondjupa	NAM	Region
NA-OH	Omaheke	NAM	Region
BW-GH	Ghanzi	BWA	District
GM-M	Central River	GMB	Division
SN-KA	Kaffrine	SEN	Region
GM-N	North Bank	GMB	Division
SN-KL	Kaolack	SEN	Region
GM-U	Upper River	GMB	Division
GM-L	Lower River	GMB	Division
SN-FK	Fatick	SEN	Region
GM-W	West Coast	GMB	Division
DZ-33	Illizi	DZA	Province
LY-WS	Ash Shati	LBY	Municipality|Governarate
LY-GT	Ghat	LBY	Municipality|Governarate
BF-SEN	Séno	BFA	Province
BF-YAG	Yagha	BFA	Province
BF-KMD	Komondjari	BFA	Province
CF-SE	Sangha-Mbaéré	CAF	Economic Prefecture
CM-ES	East	CMR	Province
CF-NM	Nana-Mambéré Prefecture	CAF	Prefecture
CF-HS	Mambéré-Kadéï	CAF	Prefecture
UG-315	Kaabong	UGA	District
UG-305	Kitgum	UGA	District
UG-327	Lamwo	UGA	District
UG-319	Amuru	UGA	District
UG-301	Adjumani	UGA	District
UG-309	Moyo	UGA	District
UG-313	Yumbe	UGA	District
UG-316	Koboko	UGA	County
ZA-MP	Mpumalanga	ZAF	Province
SZ-HH	Hhohho	SWZ	District
SZ-MA	Manzini	SWZ	District
SZ-SH	Shiselweni	SWZ	District
ZM-04	Luapula	ZMB	Province
ZM-08	Copperbelt	ZMB	Province
ZM-02	Central	ZMB	Province
BF-KOP	Koulpélogo	BFA	Province
BF-BLG	Boulgou	BFA	Province
BJ-DO	Donga	BEN	Department
BJ-ZO	Zou	BEN	Department
BJ-KO	Kouffo	BEN	Department
BJ-MO	Mono	BEN	Department
BF-NAO	Nahouri	BFA	Province
BF-SIS	Sissili	BFA	Province
GH-UW	Upper West	GHA	Region
BF-IOB	Ioba	BFA	Province
MW-NK	Nkhotakota	MWI	District
MW-SA	Salima	MWI	District
MW-MG	Mangochi	MWI	District
MW-MH	Machinga	MWI	District
MW-DE	Dedza	MWI	District
MW-LI	Lilongwe	MWI	District
MW-NS	Nsanje	MWI	District
MW-CK	Chikwawa	MWI	District
MW-MW	Mwanza	MWI	District
MW-NE	Neno	MWI	District
MW-NU	Ntcheu	MWI	District
MW-ZO	Zomba	MWI	District
MZ-Q	Zambezia	MOZ	Province
MW-PH	Phalombe	MWI	District
MW-MU	Mulanje	MWI	District
MW-TH	Thyolo	MWI	District
UG-308	Moroto	UGA	District
KE-800	Western	KEN	Province
UG-206	Kapchorwa	UGA	District
UG-218	Bukwo	UGA	County
UG-324	Amudat	UGA	District
UG-202	Busia	UGA	District
UG-212	Tororo	UGA	District
UG-221	Manafwa	UGA	District
UG-223	Bududa	UGA	District
UG-320	Maracha	UGA	District
UG-303	Arua	UGA	County
UG-331	Zombo	UGA	District
UG-310	Nebbi	UGA	District
UG-419	Buliisa	UGA	County
UG-403	Hoima	UGA	District
UG-423	Ntoroko	UGA	District
UG-401	Bundibugyo	UGA	District
UG-405	Kabarole	UGA	District
UG-406	Kasese	UGA	District
UG-424	Rubirizi	UGA	District
UG-412	Rukungiri	UGA	District
UG-414	Kanungu	UGA	District
ER-DU	Debub	ERI	Region
SD-RS	Red Sea	SDN	State
ER-SK	Northern Red Sea	ERI	Region
ER-GB	Gash-Barka	ERI	Region
SD-KA	Kassala	SDN	State
ER-MA	Maekel	ERI	Region
EE-44	Ida-Viru	EST	County
EE-65	Põlva	EST	County
EE-78	Tartu	EST	County
EE-49	Jõgeva	EST	County
PK-PB	Punjab	PAK	Province
IN-PB	Punjab	IND	State
IN-RJ	Rajasthan	IND	State
PK-SD	Sindh	PAK	Province
IN-GJ	Gujarat	IND	\N
US-AK	Alaska	USA	State
CA-YT	Yukon	CAN	Territory
SD-NW	White Nile	SDN	State
SD-KS	South Kordofan	SDN	State
SS-UY	Unity	SDS	State
HK-X16~	North District	HKG	\N
CN-GD	Guangdong	CHN	Province
VA-X01~	Vatican City	VAT	\N
SS-BN	Northern Bahr el Ghazal	SDS	State
DZ-45	Naama	DZA	Province
DZ-13	Tlemcen	DZA	Province
IN-HP	Himachal Pradesh	IND	Union Territory
-99-X04~	Northern Cyprus	CYN	\N
CY-04	Famagusta	CYP	District
CY-01	Nicosia	CYP	District
-99-X06~	Kashmir	KAS	\N
-99-X05~	Baikonur	KAB	\N
SY-QU	Quneitra	SYR	Province
-99-X17~	Akrotiri	WSB	\N
CY-02	Limassol	CYP	District
BZ-TOL	Toledo	BLZ	District
BT-15	Thimphu	BTN	District
BT-11	Paro	BTN	District
BT-GA	Gasa	BTN	District
IN-JK	Jammu and Kashmir	IND	Union Territory
UA-43	Autonomous Republic of Crimea	RUS	Autonomous Republic
UA-65	Kherson	UKR	\N
IN-BR	Bihar	IND	State
NP-NA	Narayani Zone	NPL	Administrative Zone
NP-LU	Lumbini Zone	NPL	Administrative Zone
IN-UP	Uttar Pradesh	IND	State
NP-RA	Rapti Zone	NPL	Administrative Zone
NP-BH	Bheri Zone	NPL	District
UY-SA	Salto	URY	Department
UY-RV	Rivera	URY	Department
UY-RO	Rocha	URY	Department
UY-TT	Treinta y Tres	URY	Department
UY-CL	Cerro Largo	URY	Department
CR-H	Heredia	CRI	Province
SI-015	Črenšovci	SVN	Commune|Municipality
SI-063	Ljutomer	SVN	Commune|Municipality
SI-176	Razkrižje	SVN	Commune|Municipality
SI-087	Ormož	SVN	Commune|Municipality
HR-05	Varaždin	HRV	County
SI-143	Zavrč	SVN	Commune|Municipality
SI-028	Gorišnica	SVN	Commune|Municipality
SI-135	Videm	SVN	Commune|Municipality
SI-172	Podlehnik	SVN	Commune|Municipality
SI-191	Žetale	SVN	Commune|Municipality
HR-02	Krapina-Zagorje	HRV	County
SI-107	Rogatec	SVN	Commune|Municipality
SI-106	Rogaška Slatina	SVN	Commune|Municipality
SI-149	Bistrica ob Sotli	SVN	Commune|Municipality
SI-092	Podčetrtek	SVN	Commune|Municipality
SI-009	Brežice	SVN	Commune|Municipality
HR-01	Zagreb	HRV	County
SI-119	Šentjernej	SVN	Commune|Municipality
SI-085	Novo Mesto	SVN	Commune|Municipality
SI-073	Metlika	SVN	Commune|Municipality
SI-017	Črnomelj	SVN	Commune|Municipality
HR-08	Primorje-Gorski	HRV	County
SI-048	Kočevje	SVN	Commune|Municipality
SI-165	Kostel	SVN	Commune|Municipality
SI-066	Loški Potok	SVN	Commune|Municipality
SI-065	Loška Dolina	SVN	Commune|Municipality
SI-038	Ilirska Bistrica	SVN	Commune|Municipality
IL-JM	Jerusalem	ISR	District
PK-JK	Azad Kashmir	PAK	Centrally Administered Area
ES-OR	Ourense	ESP	Autonomous Community
PT-16	Viana do Castelo	PRT	District
ES-CC	Cáceres	ESP	Autonomous Community
PT-05	Castelo Branco	PRT	District
PT-09	Guarda	PRT	District
ES-SA	Salamanca	ESP	Autonomous Community
PT-04	Bragança	PRT	District
ES-ZA	Zamora	ESP	Autonomous Community
PT-17	Vila Real	PRT	District
PT-03	Braga	PRT	District
ES-PO	Pontevedra	ESP	Autonomous Community
ES-H	Huelva	ESP	Autonomous Community
PT-08	Faro	PRT	District
PT-02	Beja	PRT	District
GB-FLN	Flintshire	GBR	Unitary Authority (wales)
GB-CHW	Cheshire West and Chester	GBR	Unitary Authority
GB-WRX	Wrexham	GBR	Unitary Authority (wales)
GB-SHR	Shropshire	GBR	Unitary Single-Tier County
GB-POW	Powys	GBR	Unitary Authority (wales)
GB-HEF	Herefordshire	GBR	Unitary Authority
GB-MON	Monmouthshire	GBR	Unitary Authority (wales)
GB-GLS	Gloucestershire	GBR	Administrative County
GB-SCB	Scottish Borders	GBR	Unitary District
GB-NBL	Northumberland	GBR	Unitary Single-Tier County
GB-CMA	Cumbria	GBR	Administrative County
GB-DGY	Dumfries and Galloway	GBR	Unitary District
BE-BRU	Brussels Capital	BEL	Capital Region
BE-VBR	Flemish Brabant	BEL	Province
BE-WBR	Walloon Brabant	BEL	Province
BA-X05~	Sarajevo-Romanija	BIH	\N
RS-00	Belgrade	SRB	City
RS-10	Podunavlje	SRB	District
GE-GU	Guria	GEO	Region
IQ-SD	Saladin	IRQ	Province
IQ-TS	Kirkuk	IRQ	Province
AQ-X01~	Antarctica	ATA	\N
NZ-X06~	Auckland Islands	NZL	\N
AR-B	Buenos Aires	ARG	Federal District
BR-MA	Maranhão	BRA	State
BR-PI	Piauí	BRA	State
BR-CE	Ceará	BRA	State
BR-RN	Rio Grande do Norte	BRA	State
BR-PB	Paraíba	BRA	State
BR-PE	Pernambuco	BRA	State
BR-AL	Alagoas	BRA	State
BR-SE	Sergipe	BRA	State
BR-BA	Bahia	BRA	State
BR-ES	Espírito Santo	BRA	State
BR-RJ	Rio de Janeiro	BRA	State
BR-SP	São Paulo	BRA	State
UY-MA	Maldonado	URY	Department
UY-CA	Canelones	URY	Department
UY-MO	Montevideo	URY	Department
UY-SJ	San José	URY	Department
UY-CO	Colonia	URY	Department
UY-SO	Soriano	URY	Department
UY-RN	Río Negro	URY	Department
AR-C	Buenos Aires	ARG	Federal District
NC-X03~	North	NCL	Province
AU-WA	Western Australia	AUS	State
AU-NT	Northern Territory	AUS	Territory
AU-SA	South Australia	AUS	State
AU-QLD	Queensland	AUS	State
AU-NSW	New South Wales	AUS	State
AU-X02~	Jervis Bay Territory	AUS	Territory
AU-VIC	Victoria	AUS	State
AO-CUS	Cuanza Sul	AGO	Province
AO-BGU	Benguela	AGO	Province
NA-ER	Erongo	NAM	Region
ZA-WC	Western Cape	ZAF	Province
MZ-L	Maputo	MOZ	Province
MZ-I	Inhambane	MOZ	Province
MZ-S	Sofala	MOZ	Province
MZ-N	Nampula	MOZ	Province
TZ-12	Lindi	TZA	Region
TZ-19	Pwani	TZA	Region
TZ-02	Dar es Salaam	TZA	Region
ID-JI	East Java	IDN	Province
ID-MA	Maluku	IDN	Province
ID-NB	West Nusa Tenggara	IDN	Province
ID-SN	South Sulawesi	IDN	Province
ID-JT	Central Java	IDN	Province
ID-JB	West Java	IDN	Province
ID-JK	Jakarta	IDN	Special district
ID-BT	Banten	IDN	Province
ID-YO	Yogyakarta	IDN	Special region
ID-SG	Southeast Sulawesi	IDN	Province
ID-PB	West Papua	IDN	Province
EC-G	Guayas	ECU	Province
ID-ST	Central Sulawesi	IDN	Province
ID-MU	North Maluku	IDN	Province
EC-W	Galápagos	ECU	Province
PG-ESW	East Sepik	PNG	Province
PG-MPM	Madang	PNG	Province
PG-MPL	Morobe	PNG	Province
PG-NPP	Oro	PNG	Province
PG-MBA	Milne Bay	PNG	Province
PG-CPM	Central	PNG	Province
PG-NCD	Port Moresby	PNG	Province
PG-GPK	Gulf	PNG	Province
ID-KR	Riau Islands	IDN	Province
ID-RI	Riau	IDN	Province
ID-GO	Gorontalo	IDN	Province
ID-SA	North Sulawesi	IDN	Province
ID-SR	West Sulawesi	IDN	Province
CO-CAU	Cauca	COL	Department
PE-MOQ	Moquegua	PER	Department
PE-ARE	Arequipa	PER	Department
PE-ICA	Ica	PER	Department
PE-LIM	Lima	PER	Department
PE-CAL	Callao	PER	Departamento
PE-ANC	Áncash	PER	Department
PE-LAL	La Libertad	PER	Department
PE-LAM	Lambayeque	PER	Department
EC-SE	Santa Elena	ECU	Province
EC-M	Manabí	ECU	Province
CO-VAC	Valle del Cauca	COL	Department
PA-8	Panamá	PAN	Province
PA-2	Coclé	PAN	Province
PH-SLU	Sulu	PHL	Province
ID-JA	Jambi	IDN	Province
ID-SS	South Sumatra	IDN	Province
ID-LA	Lampung	IDN	Province
ID-BE	Bengkulu	IDN	Province
ID-SB	West Sumatra	IDN	Province
ID-SU	North Sumatra	IDN	Province
ID-AC	Aceh	IDN	Autonomous Province
GY-DE	Demerara-Mahaica	GUY	Region
ID-KT	Central Kalimantan	IDN	Province
ID-KS	South Kalimantan	IDN	Province
PH-DAV	Davao del Norte	PHL	Province
PA-9	Veraguas	PAN	Province
PH-ZSI	Zamboanga Sibugay	PHL	Province
PH-PLW	Palawan	PHL	Province
VN-52	Sóc Trăng	VNM	Province
PH-SUN	Dinagat Islands	PHL	Province
PH-SUR	Surigao del Sur	PHL	Province
PH-AGN	Agusan del Norte	PHL	Province
PH-MSR	Misamis Oriental	PHL	Province
PH-LAN	Lanao del Norte	PHL	Province
PH-ZAS	Zamboanga del Sur	PHL	Province
PH-MSC	Misamis Occidental	PHL	Province
PH-ZAN	Zamboanga del Norte	PHL	Province
PH-LAS	Lanao del Sur	PHL	Province
PH-MAG	Maguindanao	PHL	Province
PH-SUK	Sultan Kudarat	PHL	Province
PH-SAR	Sarangani	PHL	Province
PH-DAS	Davao del Sur	PHL	Province
PH-COM	Davao de Oro	PHL	Province
PH-DAO	Davao Oriental	PHL	Province
LK-53	Trincomalee	LKA	District
LK-45	Mullaitivu	LKA	District
LK-41	Jaffna	LKA	District
LK-42	Kilinochchi	LKA	District
LK-43	Mannar	LKA	District
LK-62	Puttalam	LKA	District
LK-12	Gampaha	LKA	District
LK-11	Colombo	LKA	District
LK-13	Kalutara	LKA	District
LK-31	Galle	LKA	District
LK-32	Matara	LKA	District
LK-33	Hambantota	LKA	District
LK-52	Ampara	LKA	District
LK-51	Batticaloa	LKA	District
PH-SLE	Southern Leyte	PHL	Province
VN-46	Tiền Giang	VNM	Province
VN-43	Bà Rịa-Vũng Tàu	VNM	Province
KH-18	Sihanoukville	KHM	Municipality
VN-SG	Ho Chi Minh	VNM	City|Municipality|Thanh Pho
PH-LEY	Leyte	PHL	Province
PH-EAS	Eastern Samar	PHL	Province
PH-BIL	Biliran	PHL	Province
PH-WSA	Samar	PHL	Province
VN-34	Khánh Hòa	VNM	Province
CW-X01~	Curaçao	CUW	\N
PA-3	Colón	PAN	Province
CO-ANT	Antioquia	COL	Department
CO-COR	Córdoba	COL	Department
CO-SUC	Sucre	COL	Department
CO-BOL	Bolívar	COL	Department
CO-ATL	Atlántico	COL	Department
CO-MAG	Magdalena	COL	Department
VE-L	Merida	VEN	State
VE-T	Trujillo	VEN	State
VE-I	Falcón	VEN	State
VE-U	Yaracuy	VEN	State
VE-G	Carabobo	VEN	State
VE-D	Aragua	VEN	State
VE-X	Vargas state	VEN	State
VE-M	Miranda	VEN	State
VE-B	Anzoátegui	VEN	State
VE-R	Sucre	VEN	State
VE-N	Monagas	VEN	State
GY-CU	Cuyuni-Mazaruni	GUY	Region
GY-UT	Upper Takutu-Upper Essequibo	GUY	Region
GY-EB	East Berbice-Corentyne	GUY	Region
GY-ES	Mahaica-Berbice	GUY	Region
SR-CR	Coronie	SUR	District
SR-SA	Saramacca	SUR	District
SR-WA	Wanica	SUR	District
SR-PM	Paramaribo	SUR	District
SR-CM	Commewijne	SUR	District
AW-X01~	Aruba	ABW	\N
IN-AP	Andhra Pradesh	IND	State
HT-SD	Sud	HTI	Department
NG-ON	Ondo State	NGA	State
NG-DE	Delta State	NGA	State
NG-BY	Bayelsa State	NGA	State
NG-RI	Rivers State	NGA	State
NG-AK	Akwa Ibom State	NGA	State
CM-LT	Littoral	CMR	Province
GA-8	Ogooué-Maritime	GAB	Province
CG-16	Pointe-Noire	COG	Region
AO-BGO	Bengo	AGO	Province
AO-LUA	Luanda	AGO	Province
LY-SR	Sirte	LBY	Municipality|Governarate
LY-MI	Misrata	LBY	Municipality|Governarate
LY-MB	Murqub	LBY	Municipality|Governarate
LY-TN	Tripoli District	LBY	Municipality|Governarate
LY-ZA	Zawiya	LBY	Municipality|Governarate
TN-81	Gabès	TUN	Governorate
TN-61	Sfax	TUN	Governorate
TN-53	Mahdia	TUN	Governorate
TN-52	Monastir	TUN	Governorate
TN-51	Sousse	TUN	Governorate
TN-21	Nabeul	TUN	Governorate
TN-13	Ben Arous	TUN	Governorate
TN-11	Tunis	TUN	Governorate
TN-14	Manouba	TUN	Governorate
TN-23	Bizerte	TUN	Governorate
TN-31	Beja	TUN	Governorate
DZ-23	Annaba	DZA	Province
DZ-21	Skikda	DZA	Province
DZ-18	Jijel	DZA	Province
DZ-06	Béjaïa	DZA	Province
DZ-15	Tizi Ouzou	DZA	Province
DZ-35	Boumerdès	DZA	Province
DZ-16	Algiers	DZA	Province
DZ-42	Tipasa	DZA	Province
DZ-02	Chlef	DZA	Province
DZ-27	Mostaganem	DZA	Province
DZ-31	Oran	DZA	Province
DZ-46	Aïn Témouchent	DZA	Province
MA-03	Taza-Al Hoceïma-Taounate	MAR	Region
MA-02	Gharb-Chrarda-Béni Hssen	MAR	Region
MA-07	Rabat-Salé-Zemmour-Zaër	MAR	Region
MA-09	Chaouia-Ouardigha	MAR	Region
MA-08	Grand Casablanca	MAR	Region
MA-10	Doukkala Abda	MAR	Region
MA-11	Marrakesh-Tensift-El Haouz	MAR	Region
MR-12	Inchiri	MRT	Region
MR-NKC	Nouakchott	MRT	District
SN-LG	Louga	SEN	Region
SN-TH	Thiès	SEN	Region
SN-DK	Dakar	SEN	Region
GM-B	Banjul	GMB	Independent City
GW-BM	Biombo	GNB	Region
GW-BS	Bissau	GNB	Autonomous Sector
GW-QU	Quinara	GNB	Region
GW-BL	Bolama	GNB	Region
GN-BF	Boffa Prefecture	GIN	Prefecture
GN-DU	Dubréka Prefecture	GIN	Prefecture
GN-C	Conakry	GIN	Administrative Zone
GN-CO	Coyah Prefecture	GIN	Prefecture
SL-W	Western Area	SLE	Province
LR-BM	Bomi	LBR	County
LR-MO	Montserrado	LBR	County
LR-MG	Margibi	LBR	County
LR-GB	Grand Bassa	LBR	County
LR-RI	River Cess	LBR	County
LR-SI	Sinoe	LBR	County
LR-GK	Grand Kru	LBR	County
CI-15	Sud-Bandama	CIV	Department
CI-01	Lagunes	CIV	Department
GH-CP	Central	GHA	Region
GH-AA	Greater Accra	GHA	Region
BJ-AQ	Atlantique	BEN	Department
BJ-LI	Littoral	BEN	Department
MX-COL	Colima	MEX	State
HT-GA	Grand'Anse	HTI	Department
PH-AUR	Aurora	PHL	Province
PH-QUE	Quezon	PHL	Province
PH-CAN	Camarines Norte	PHL	Province
PH-CAS	Camarines Sur	PHL	Province
PH-ALB	Albay	PHL	Province
PH-SOR	Sorsogon	PHL	Province
PH-BTG	Batangas	PHL	Province
PH-CAV	Cavite	PHL	Province
PH-BUL	Bulacan	PHL	Province
PH-PAM	Pampanga	PHL	Province
PH-BAN	Bataan	PHL	Province
PH-ZMB	Zambales	PHL	Province
PH-PAN	Pangasinan	PHL	Province
PH-LUN	La Union	PHL	Province
PH-ILS	Ilocos Sur	PHL	Province
PH-ILN	Ilocos Norte	PHL	Province
PH-CAG	Cagayan	PHL	Province
PH-ISA	Isabela	PHL	Province
HT-NO	Nord-Ouest	HTI	Department
CN-HI	Hainan	CHN	Province
MX-NAY	Nayarit	MEX	State
BS-IN	Inagua	BHS	District
TC-X03~	Providenciales and West Caicos	TCA	\N
TC-X04~	South Caicos and East Caicos	TCA	\N
TC-X01~	Middle Caicos	TCA	\N
TC-X02~	North Caicos	TCA	\N
BS-MG	Mayaguana	BHS	District
BS-AK	Acklins	BHS	District
CN-FJ	Fujian	CHN	Province
MX-BCS	Baja California Sur	MEX	State
SO-JD	Middle Juba	SOM	Region
SO-SH	Lower Shebelle	SOM	Region
SO-BN	Banaadir	SOM	Region
SO-SD	Middle Shebelle	SOM	Region
DJ-DJ	Djibouti	DJI	City
EG-SUZ	Suez	EGY	Governorate
EG-JS	South Sinai	EGY	Governorate
SA-07	Tabuk	SAU	Region
SA-03	Al Madinah	SAU	Region
SA-02	Makkah	SAU	Region
YE-HU	Al Hudaydah	YEM	Governorate
YE-TA	Ta'izz	YEM	Governorate
YE-LA	Lahij	YEM	Governorate
YE-AD	'Adan	YEM	Governorate
YE-AB	Abyan	YEM	Governorate
YE-SH	Shabwah	YEM	Governorate
OM-SH	Ash Sharqiyah	OMN	Region
OM-SS	Ash Sharqiyah North	OMN	Region
OM-MA	Muscat	OMN	Province
OM-BJ	Al Batinah South	OMN	Region
AE-UQ	Emirate of Umm Al Quwain	ARE	Emirate
AE-AJ	Emirate of Ajman	ARE	Emirate
QA-WA	Al Wakrah	QAT	Municipality
QA-DA	Doha	QAT	Municipality
QA-ZA	Al Daayen	QAT	Municipality
QA-KH	Al Khor	QAT	Municipality
QA-MS	Madinat ash Shamal	QAT	Municipality
KW-MU	Mubarak Al-Kabeer	KWT	Province
KW-HA	Hawally	KWT	Province
KW-KU	Capital	KWT	Province
TW-TAO	Taoyuan	TWN	County
TW-HSQ	Hsinchu	TWN	County
TW-HSZ	Hsinchu	TWN	Provincial City
TW-MIA	Miaoli	TWN	County
TW-TXG	Taichung City	TWN	Special Municipality
TW-CHA	Changhua	TWN	County
TW-YUN	Yunlin	TWN	County
TW-CYQ	Chiayi	TWN	County
TW-TNN	Tainan	TWN	Special Municipality
TW-KHH	Kaohsiung	TWN	Special Municipality
TW-PIF	Pingtung	TWN	County
TW-TTT	Taitung	TWN	County
TW-HUA	Hualien	TWN	County
TW-ILA	Yilan	TWN	County
TW-TPQ	New Taipei	TWN	Special Municipality
TW-KEE	Keelung	TWN	Provincial City
MX-SIN	Sinaloa	MEX	State
US-LA	Louisiana	USA	State
US-MS	Mississippi	USA	State
US-AL	Alabama	USA	State
US-FL	Florida	USA	State
US-GA	Georgia	USA	State
US-SC	South Carolina	USA	State
US-NC	North Carolina	USA	State
US-VA	Virginia	USA	State
US-DC	Washington	USA	Federal District
US-MD	Maryland	USA	State
US-DE	Delaware	USA	State
US-NJ	New Jersey	USA	State
US-CT	Connecticut	USA	State
US-RI	Rhode Island	USA	State
US-MA	Massachusetts	USA	State
PA-NB	Ngöbe-Buglé Comarca	PAN	Indigenous Territory
NI-AS	South Caribbean Coast	NIC	Autonomous Region
HN-CL	Colón	HND	Department
HN-AT	Atlántida	HND	Department
BZ-SC	Stann Creek	BLZ	District
BZ-BZ	Belize	BLZ	District
MX-YUC	Yucatán	MEX	State
MX-VER	Veracruz	MEX	State
MX-JAL	Jalisco	MEX	State
MX-MIC	Michoacán	MEX	State
MX-GRO	Guerrero	MEX	State
MX-OAX	Oaxaca	MEX	State
GT-RE	Retalhuleu	GTM	Department
GT-SU	Suchitepéquez	GTM	Department
GT-ES	Escuintla	GTM	Department
GT-SR	Santa Rosa	GTM	Department
SV-SO	Sonsonate	SLV	Department
SV-LI	La Libertad	SLV	Department
SV-PA	La Paz	SLV	Department
SV-SV	San Vicente	SLV	Department
SV-US	Usulután	SLV	Department
NI-LE	León	NIC	Department
NI-MN	Managua	NIC	Department
NI-CA	Carazo	NIC	Department
PA-7	Los Santos	PAN	Province
PA-6	Herrera	PAN	Province
CN-ZJ	Zhejiang	CHN	Province
CN-SH	Shanghai	CHN	Municipality
JP-46	Kagoshima Prefecture	JPN	Prefecture
CN-JS	Jiangsu	CHN	Province
IR-06	Bushehr	IRN	Province
IR-23	Hormozgan	IRN	Province
IL-TA	Tel Aviv	ISR	District
EG-PTS	Port Said	EGY	Governorate
EG-DK	Dakahlia	EGY	Governorate
EG-SHR	Al Sharqia	EGY	Governorate
EG-IS	Ismailia	EGY	Governorate
EG-DT	Damietta	EGY	Governorate
EG-KFS	Kafr el-Sheikh	EGY	Governorate
EG-BH	Beheira	EGY	Governorate
EG-ALX	Alexandria	EGY	Governorate
LY-QB	Al Qubbah	LBY	Municipality|Governarate
LY-JA	Jabal al Akhdar	LBY	Municipality|Governarate
LY-MJ	Marj	LBY	Municipality|Governarate
LY-BA	Benghazi	LBY	Municipality|Governarate
JP-44	Ōita Prefecture	JPN	Prefecture
JP-40	Fukuoka Prefecture	JPN	Prefecture
JP-41	Saga Prefecture	JPN	Prefecture
JP-42	Nagasaki Prefecture	JPN	Prefecture
JP-43	Kumamoto Prefecture	JPN	Prefecture
JP-45	Miyazaki Prefecture	JPN	Prefecture
JP-36	Tokushima Prefecture	JPN	Prefecture
JP-37	Kagawa Prefecture	JPN	Prefecture
JP-38	Ehime Prefecture	JPN	Prefecture
JP-39	Kōchi Prefecture	JPN	Prefecture
JP-32	Shimane Prefecture	JPN	Prefecture
KR-44	South Chungcheong	KOR	Province
JP-35	Yamaguchi Prefecture	JPN	Prefecture
JP-31	Tottori Prefecture	JPN	Prefecture
JP-28	Hyōgo Prefecture	JPN	Prefecture
JP-26	Kyōto Prefecture	JPN	Urban Prefecture
JP-18	Fukui Prefecture	JPN	Prefecture
JP-17	Ishikawa Prefecture	JPN	Prefecture
JP-16	Toyama Prefecture	JPN	Prefecture
JP-15	Niigata Prefecture	JPN	Prefecture
JP-06	Yamagata Prefecture	JPN	Prefecture
JP-05	Akita Prefecture	JPN	Prefecture
JP-02	Aomori Prefecture	JPN	Prefecture
JP-03	Iwate Prefecture	JPN	Prefecture
JP-04	Miyagi Prefecture	JPN	Prefecture
JP-07	Fukushima Prefecture	JPN	Prefecture
JP-08	Ibaraki Prefecture	JPN	Prefecture
JP-12	Chiba Prefecture	JPN	Prefecture
JP-13	Tokyo	JPN	Metropolis
JP-14	Kanagawa Prefecture	JPN	Prefecture
JP-22	Shizuoka Prefecture	JPN	Prefecture
JP-23	Aichi Prefecture	JPN	Prefecture
JP-24	Mie Prefecture	JPN	Prefecture
JP-30	Wakayama Prefecture	JPN	Prefecture
JP-27	Ōsaka Prefecture	JPN	Urban Prefecture
JP-33	Okayama Prefecture	JPN	Prefecture
JP-34	Hiroshima Prefecture	JPN	Prefecture
US-OR	Oregon	USA	State
CA-NU	Nunavut	CAN	Territory
CA-NL	Newfoundland and Labrador	CAN	Province
CA-NS	Nova Scotia	CAN	Province
JP-01	Hokkaidō	JPN	Circuit
PM-X01~	Saint Pierre and Miquelon	SPM	Commune
PM-X02~	Miquelon-Langlade	SPM	Commune
IN-OR	Odisha	IND	State
BD-A	Barisal	BGD	Division
MM-07	Ayeyarwady	MMR	Division
MM-06	Yangon	MMR	Division
MM-02	Bago	MMR	Division
TH-82	Phang Nga	THA	Province
TH-81	Krabi	THA	Province
TH-92	Trang	THA	Province
MY-07	Penang	MYS	State
MY-10	Selangor	MYS	State
MY-05	Negeri Sembilan	MYS	State
MY-04	Melaka	MYS	State
MY-01	Johor	MYS	State
MY-06	Pahang	MYS	State
MY-11	Terengganu	MYS	State
TH-94	Pattani	THA	Province
TH-93	Phatthalung	THA	Province
TH-80	Nakhon Si Thammarat	THA	Province
TH-84	Surat Thani	THA	Province
TH-75	Samut Songkhram	THA	Province
TH-74	Samut Sakhon	THA	Province
TH-10	Bangkok	THA	Province
TH-11	Samut Prakan	THA	Province
TH-24	Chachoengsao	THA	Province
TH-20	Chon Buri	THA	Province
TH-21	Rayong	THA	Province
KH-23	Kep	KHM	Province
VN-59	Cà Mau	VNM	Province
VN-55	Bạc Liêu	VNM	Province
VN-73	Hậu Giang	VNM	Region
VN-49	Vĩnh Long	VNM	Province
VN-51	Trà Vinh	VNM	Province
VN-50	Bến Tre	VNM	Province
VN-39	Đông Nam Bộ	VNM	Region
VN-40	Bình Thuận	VNM	Province
VN-36	Ninh Thuận	VNM	Province
VN-32	Phú Yên	VNM	Province
VN-31	Bình Định	VNM	Province
VN-29	Quảng Ngãi	VNM	Province
VN-DN	Da Nang	VNM	City|Municipality|Thanh Pho
VN-18	Ninh Bình	VNM	Province
VN-67	Nam Định	VNM	Province
VN-20	Thái Bình	VNM	Province
VN-HP	Haiphong	VNM	Province
CN-SD	Shandong	CHN	Province
CN-HE	Hebei	CHN	Province
CN-TJ	Tianjin	CHN	Municipality
KP-02	South Pyongan	PRK	Province
KP-05	South Hwanghae	PRK	Province
KR-28	Incheon	KOR	Metropolitan City
KR-45	North Jeolla	KOR	Province
KR-46	South Jeolla	KOR	Metropolitan City
KR-48	South Gyeongsang	KOR	Province
KR-26	Busan	KOR	Metropolitan City
KR-31	Ulsan	KOR	Metropolitan City
KR-47	North Gyeongsang	KOR	Metropolitan City
KP-08	South Hamgyong	PRK	Province
RU-MAG	Magadan	RUS	Region
IN-DH	Dadra and Nagar Haveli and Daman and Diu	IND	Union Territory
IN-MH	Maharashtra	IND	State
IN-GA	Goa	IND	State
IN-KA	Karnataka	IND	State
IN-KL	Kerala	IND	State
IN-PY	Puducherry	IND	Union Territory
IN-TN	Tamil Nadu	IND	State
RU-SAK	Sakhalin	RUS	Region
IE-D	Dublin	IRL	County
IE-WW	Wicklow	IRL	County
IE-WX	Wexford	IRL	County
IE-KK	Kilkenny	IRL	County
IE-CO	Cork	IRL	County
IE-KY	Kerry	IRL	County
IE-CE	Clare	IRL	County
IE-G	Galway	IRL	County
IE-MO	Mayo	IRL	County
IE-SO	Sligo	IRL	County
GB-LMV	Limavady	GBR	District
GB-CLR	Coleraine	GBR	District
GB-MYL	Moyle	GBR	District
GB-LRN	Larne	GBR	District
GB-CKF	Carrickfergus	GBR	District
GB-NTA	Newtownabbey	GBR	District
GB-BFS	Belfast	GBR	District
GB-NDN	North Down	GBR	District
GB-ARD	Ards	GBR	District
GB-DOW	Down	GBR	District
IE-MH	Meath	IRL	County
UA-23	Zaporizhzhia	UKR	Region
UA-40	Sevastopol	RUS	Federal City
UA-48	Mykolaiv	UKR	Region
BG-03	Varna	BGR	Province
TR-34	Istanbul	TUR	Province
TR-59	Tekirdağ	TUR	Province
TR-17	Çanakkale	TUR	Province
GB-CLK	Clackmannanshire	GBR	Unitary District
GB-STG	Stirling	GBR	Unitary District
GB-FAL	Falkirk	GBR	Unitary District
GB-WLN	West Lothian	GBR	Unitary District
GB-EDH	Edinburgh	GBR	Unitary District (city)
GB-MLN	Midlothian	GBR	Unitary District
GB-ELN	East Lothian	GBR	Unitary District
GB-NTY	North Tyneside	GBR	Metropolitan Borough
GB-STY	South Tyneside	GBR	Metropolitan Borough
GB-SND	Sunderland	GBR	Metropolitan Borough
GB-DUR	Durham	GBR	Unitary Single-Tier County
GB-HPL	Hartlepool	GBR	Unitary Authority
GB-RCC	Redcar and Cleveland	GBR	Unitary Authority
GB-NYK	North Yorkshire	GBR	Administrative County
GB-ERY	East Riding of Yorkshire	GBR	Unitary Authority
GB-KHL	Kingston upon Hull	GBR	Unitary Authority
GB-NLN	North Lincolnshire	GBR	Unitary Authority
GB-NEL	North East Lincolnshire	GBR	Unitary Authority
GB-LIN	Lincolnshire	GBR	Administrative County
GB-NFK	Norfolk	GBR	Administrative County
GB-SFK	Suffolk	GBR	Administrative County
GB-ESS	Essex	GBR	Administrative County
GB-SOS	Southend-on-Sea	GBR	Unitary Authority
GB-THR	Thurrock	GBR	Unitary Authority
GB-KEN	Kent	GBR	Administrative County
GB-MDW	Medway	GBR	Unitary Authority
GB-ESX	East Sussex	GBR	Administrative County
GB-BNH	Brighton and Hove	GBR	Unitary Authority
GB-WSX	West Sussex	GBR	Administrative County
GB-HAM	Hampshire	GBR	Administrative County
GB-POR	Portsmouth	GBR	Unitary Authority
GB-STH	Southampton	GBR	Unitary Authority
GB-DOR	Dorset	GBR	Administrative County
GB-BMH	Bournemouth	GBR	Unitary Authority
GB-POL	Poole	GBR	Unitary Authority
GB-DEV	Devon	GBR	Administrative County
GB-TOB	Torbay	GBR	Unitary Authority
GB-PLY	Plymouth	GBR	Unitary Authority
GB-CON	Cornwall	GBR	Unitary Single-Tier County
GB-SOM	Somerset	GBR	Administrative County
GB-NSM	North Somerset	GBR	Unitary Authority
GB-BST	Bristol	GBR	Unitary Authority
GB-SGC	South Gloucestershire	GBR	Unitary Authority
GB-NWP	Newport	GBR	Unitary Authority (wales)
GB-CRF	Cardiff	GBR	Unitary Authority (wales)
GB-VGL	Vale of Glamorgan	GBR	Unitary Authority (wales)
GB-BGE	Bridgend	GBR	Unitary Authority (wales)
GB-NTL	Neath Port Talbot	GBR	Unitary Authority (wales)
GB-SWA	Swansea	GBR	Unitary Authority (wales)
GB-CMN	Carmarthenshire	GBR	Unitary Authority (wales)
GB-PEM	Pembrokeshire	GBR	Unitary Authority (wales)
GB-CGN	Ceredigion	GBR	Principality
GB-GWN	Gwynedd	GBR	Unitary Authority (wales)
GB-CWY	Conwy	GBR	Unitary Authority (wales)
GB-DEN	Denbighshire	GBR	Unitary Authority (wales)
GB-WRL	Halton	GBR	Metropolitan Borough
GB-HAL	Halton	GBR	Unitary Authority
GB-KWL	Knowsley	GBR	Metropolitan Borough
GB-LIV	Liverpool	GBR	Metropolitan Borough
GB-SFT	Sefton	GBR	Metropolitan Borough
GB-LAN	Lancashire	GBR	Administrative County
GB-BPL	Blackpool	GBR	Unitary Authority
GB-SAY	South Ayrshire	GBR	Unitary District
GB-NAY	North Ayrshire	GBR	Unitary District
GB-IVC	Inverclyde	GBR	Unitary District
GB-RFW	Renfrewshire	GBR	Unitary District
GB-WDU	West Dunbartonshire	GBR	Unitary District
GB-AGB	Argyll and Bute	GBR	Unitary District
GB-HLD	Highland	GBR	Unitary District
GB-MRY	Moray	GBR	Unitary District
GB-ABD	Aberdeenshire	GBR	Unitary District
GB-ABE	Aberdeen	GBR	Unitary District (city)
GB-ANS	Angus	GBR	Unitary District
GB-DND	Dundee	GBR	Unitary District (city)
GB-PKN	Perth and Kinross	GBR	Unitary District
GB-FIF	Fife	GBR	Unitary District
RU-CHU	Chukotka Autonomous Okrug	RUS	Autonomous Province
IS-7	Austurland	ISL	Region
IS-8	Southern	ISL	Region
IS-2	Southern Peninsula	ISL	Independent Town
IS-0	Reykjavík	ISL	Region
IS-1	Capital	ISL	Region
IS-3	Western	ISL	Region
IS-4	Westfjords	ISL	Region
IS-5	Northwestern	ISL	Region
IS-6	Northeastern	ISL	Region
RU-YAN	Yamalo-Nenets Autonomous Okrug	RUS	Autonomous Province
RU-NEN	Nenets Autonomous Okrug	RUS	Autonomous Province
CA-NT	Northwest Territories	CAN	Territory
RU-SA	Sakha Republic	RUS	Autonomous Province
LV-066	Nīca	LVA	Municipality
LV-LPX	Liepāja	LVA	Republican City
LV-032	Grobiņa	LVA	Municipality
LV-071	Pāvilosta	LVA	Municipality
LV-VEN	Ventspils	LVA	Republican City
LV-027	Dundaga	LVA	Municipality
LV-079	Roja	LVA	Municipality
LV-097	Talsi	LVA	Municipality
LV-063	Mērsrags	LVA	Municipality
LV-029	Engure	LVA	Municipality
LV-JUR	Jūrmala	LVA	Republican City
LV-RIX	Riga	LVA	Republican City
LV-020	Carnikava	LVA	Municipality
LV-089	Saulkrasti	LVA	Municipality
LV-054	Limbaži	LVA	Municipality
EE-57	Lääne	EST	County
EE-37	Harju	EST	County
EE-59	Lääne-Viru	EST	County
RU-SPE	Saint Petersburg	RUS	Federal City
FI-18	Uusimaa	FIN	Province
FI-19	Finland Proper	FIN	Region
FI-17	Satakunta	FIN	Region
FI-12	Ostrobothnia	FIN	Province
FI-07	Central Ostrobothnia	FIN	Province
SE-Y	Västernorrland	SWE	County
SE-X	Gävleborg	SWE	County
SE-C	Uppsala	SWE	County
SE-AB	Stockholm	SWE	County
SE-D	Södermanland	SWE	County
SE-E	Östergötland	SWE	County
SE-H	Kalmar	SWE	County
SE-K	Blekinge	SWE	County
SE-M	Skåne	SWE	County
SE-N	Halland	SWE	County
NO-03	Oslo	NOR	County
NO-06	Buskerud	NOR	County
NO-07	Vestfold	NOR	County
NO-08	Telemark	NOR	County
NO-09	Aust-Agder	NOR	County
NO-10	Vest-Agder	NOR	County
NO-11	Rogaland	NOR	County
NO-12	Hordaland	NOR	County
NO-14	Sogn og Fjordane	NOR	County
NO-15	Møre og Romsdal	NOR	County
TR-53	Rize	TUR	Province
TR-61	Trabzon	TUR	Province
TR-28	Giresun	TUR	Province
TR-52	Ordu	TUR	Province
TR-55	Samsun	TUR	Province
TR-57	Sinop	TUR	Province
TR-37	Kastamonu	TUR	Province
TR-74	Bartın	TUR	Province
TR-67	Zonguldak	TUR	Province
TR-81	Düzce	TUR	Province
TR-54	Sakarya	TUR	Province
TR-41	Kocaeli	TUR	Province
TR-77	Yalova	TUR	Province
TR-16	Bursa	TUR	Province
TR-10	Balıkesir	TUR	Province
TR-35	İzmir	TUR	Province
TR-09	Aydın	TUR	Province
TR-48	Muğla	TUR	Province
TR-07	Antalya	TUR	Province
TR-33	Mersin	TUR	Province
TR-01	Adana	TUR	Province
LB-JL	Mount Lebanon	LBN	Province
LB-BA	Beirut	LBN	Province
RU-ARK	Arkhangelsk	RUS	Region
RU-KYA	Krasnoyarsk Krai	RUS	Territory
GR-69	Mount Athos	GRC	Autonomous Monastic State
GR-E	Thessalia	GRC	Region
GR-H	Central Greece	GRC	Region
GR-A1	Attica	GRC	Region
GR-J	Peloponnese	GRC	Region
GR-G	West Greece	GRC	Region
AL-04	Fier	ALB	County
AL-11	Tirana	ALB	County
AL-02	Durrës	ALB	County
AL-08	Lezhë	ALB	County
ME-05	Budva	MNE	Municipality
ME-19	Tivat	MNE	Municipality
HR-15	Šibenik-Knin	HRV	County
HR-09	Lika-Senj	HRV	County
SI-040	Izola	SVN	Commune|Municipality
IT-VE	Venice	ITA	Province
IT-PD	Padua	ITA	Province
IT-RO	Rovigo	ITA	Province
IT-FE	Ferrara	ITA	Province
IT-RA	Ravenna	ITA	Province
IT-FC	Forlì-Cesena	ITA	Province
IT-AN	Ancona	ITA	Province
IT-MC	Macerata	ITA	Province
IT-FM	Fermo	ITA	Province
IT-AP	Ascoli Piceno	ITA	Province
IT-TE	Teramo	ITA	Province
IT-PE	Pescara	ITA	Province
IT-CH	Chieti	ITA	Province
IT-CB	Campobasso	ITA	Province
IT-FG	Foggia	ITA	Province
IT-BT	Barletta-Andria-Trani	ITA	Province
IT-BA	Bari	ITA	Province
IT-BR	Brindisi	ITA	Province
IT-LE	Lecce	ITA	Province
IT-TA	Taranto	ITA	Province
IT-MT	Matera	ITA	Province
IT-CS	Cosenza	ITA	Province
IT-KR	Crotone	ITA	Province
IT-CZ	Catanzaro	ITA	Province
IT-RC	Reggio Calabria	ITA	Province
IT-VV	Vibo Valentia	ITA	Province
IT-PZ	Potenza	ITA	Province
IT-SA	Salerno	ITA	Province
IT-NA	Naples	ITA	Province
IT-CE	Caserta	ITA	Province
IT-LT	Latina	ITA	Province
IT-RM	Rome	ITA	Province
IT-VT	Viterbo	ITA	Province
IT-GR	Grosseto	ITA	Province
IT-LI	Livorno	ITA	Province
IT-PI	Pisa	ITA	Province
IT-LU	Lucca	ITA	Province
IT-MS	Massa-Carrara	ITA	Province
IT-SP	La Spezia	ITA	Province
IT-GE	Liguria	ITA	Province
IT-SV	Savona	ITA	Province
FR-83	Var	FRA	Metropolitan department
FR-13	Bouches-du-Rhône	FRA	Metropolitan department
FR-30	Gard	FRA	Metropolitan department
FR-34	Hérault	FRA	Metropolitan department
FR-11	Aude	FRA	Metropolitan department
ES-B	Barcelona	ESP	Autonomous Community
ES-T	Tarragona	ESP	Autonomous Community
ES-CS	Castellón	ESP	Autonomous Community
ES-V	Valencia	ESP	Autonomous Community
ES-A	Alicante	ESP	Autonomous Community
ES-MU	Murcia	ESP	Autonomous Community
ES-AL	Almería	ESP	Autonomous Community
ES-GR	Granada	ESP	Autonomous Community
ES-MA	Málaga	ESP	Autonomous Community
ES-SE	Seville	ESP	Autonomous Community
PT-15	Setúbal	PRT	District
PT-11	Lisbon	PRT	District
PT-14	Santarém	PRT	District
PT-10	Leiria	PRT	District
PT-06	Coimbra	PRT	District
PT-01	Aveiro	PRT	District
PT-13	Porto	PRT	District
ES-C	A Coruña	ESP	Autonomous Community
ES-LU	Lugo	ESP	Autonomous Community
ES-O	Asturias	ESP	Autonomous Community
ES-S	Cantabria	ESP	Autonomous Community
ES-BI	Biscay	ESP	Autonomous Community
FR-40	Landes	FRA	Metropolitan department
FR-33	Gironde	FRA	Metropolitan department
FR-17	Charente-Maritime	FRA	Metropolitan department
FR-85	Vendée	FRA	Metropolitan department
FR-44	Loire-Atlantique	FRA	Metropolitan department
FR-56	Morbihan	FRA	Metropolitan department
FR-29	Finistère	FRA	Metropolitan department
FR-22	Côtes-d'Armor	FRA	Metropolitan department
FR-35	Ille-et-Vilaine	FRA	Metropolitan department
FR-50	Manche	FRA	Metropolitan department
FR-14	Calvados	FRA	Metropolitan department
FR-27	Eure	FRA	Metropolitan department
FR-76	Seine-Maritime	FRA	Metropolitan department
FR-80	Somme	FRA	Metropolitan department
FR-62	Pas-de-Calais	FRA	Metropolitan department
NL-ZH	South Holland	NLD	Province
NL-NH	North Holland	NLD	Province
NL-FR	Friesland	NLD	Province
DE-HB	Free Hanseatic Bremen	DEU	State
DE-HH	Hamburg	DEU	State
DK-82	Central Denmark	DNK	Region
DK-81	North Denmark	DNK	Region
GL-SM	Sermersooq	GRL	\N
GL-QA	Qaasuitsup	GRL	\N
GL-QE	Qeqqata	GRL	\N
GL-KU	Kujalleq	GRL	\N
AQ-X02~	\N	ATA	\N
PN-X01~	Pitcairn Islands	PCN	\N
PF-X03~	Tuamotu Archipelago	PYF	\N
PF-X01~	Windward Islands	PYF	\N
TF-X03~	Scattered Islands in the Indian Ocean	ATF	\N
PF-X02~	Leeward Islands	PYF	\N
SC-X02~	Coralline Seychelles	SYC	\N
SC-15	La Digue	SYC	\N
KI-X01~	Kiribati	KIR	\N
MH-L	Ralik Chain	MHL	\N
MH-T	Ratak Chain	MHL	\N
IN-LD	Lakshadweep	IND	Union Territory
VE-O	Nueva Esparta	VEN	State
TT-TUP	Tunapuna-Piarco Regional Corporation	TTO	Region
TT-SJL	San Juan–Laventille	TTO	Region
TT-DMN	Diego Martin Regional Corporation	TTO	Region
TT-POS	Port of Spain	TTO	City
TT-CHA	Chaguanas	TTO	City
TT-CTT	Couva-Tabaquite-Talparo	TTO	Region
TT-SFO	San Fernando	TTO	City
TT-PED	Penal-Debe Regional Corporation	TTO	Region
TT-SIP	Siparia Regional Corporation	TTO	Region
TT-PTF	Point Fortin	TTO	City
TT-PRT	Princes Town	TTO	Region
TT-RCM	Mayaro-Rio Claro	TTO	Region
TT-SGE	Sangre Grande Regional Corporation	TTO	Region
VE-W	Federal Dependencies	VEN	Federal Dependency
TT-ETO	Tobago	TTO	Region
TT-WTO	Tobago	TTO	Region
GD-03	Saint George	GRD	Parish
GD-02	Saint David	GRD	Parish
GD-01	Saint Andrew	GRD	Parish
GD-06	Saint Patrick	GRD	Parish
GD-05	Saint Mark	GRD	Parish
GD-04	Saint John	GRD	Parish
IN-AN	Andaman and Nicobar Islands	IND	Union Territory
NL-BQ1	Bonaire	NLD	Special Municipality
GD-10	Carriacou and Petite Martinique	GRD	Dependency
CO-SAP	Archipelago of Saint Andréws	COL	Department
VC-06	Grenadines	VCT	Parish
BB-06	Saint Joseph	BRB	Parish
BB-02	Saint Andrew	BRB	Parish
BB-09	Saint Peter	BRB	Parish
BB-07	Saint Lucy	BRB	Parish
BB-04	Saint James	BRB	Parish
BB-08	Saint Michael	BRB	Parish
BB-01	Christ Church	BRB	Parish
BB-10	Saint Philip	BRB	Parish
BB-05	Saint John	BRB	Parish
VC-02	Saint Andrew	VCT	Parish
VC-04	Saint George	VCT	Parish
VC-01	Charlotte	VCT	Parish
VC-03	Saint David	VCT	Parish
VC-05	Saint Patrick	VCT	Parish
LC-06	Gros Islet Quarter	LCA	Quarter
LC-02	Castries Quarter	LCA	Quarter
LC-01	Anse la Raye Quarter	LCA	Quarter
LC-10	Soufrière Quarter	LCA	Quarter
LC-03	Choiseul Quarter	LCA	Quarter
LC-07	Laborie Quarter	LCA	Quarter
LC-11	Vieux Fort Quarter	LCA	Quarter
LC-08	Micoud Quarter	LCA	Quarter
LC-09	Praslin Quarter	LCA	Quarter
LC-05	Dennery Quarter	LCA	Quarter
LC-04	Dauphin Quarter	LCA	Quarter
FR-MQ	Martinique	FRA	Overseas department
DM-09	Saint Patrick	DMA	Parish
DM-03	Saint David	DMA	Parish
DM-02	Saint Andrew	DMA	Parish
DM-05	Saint John	DMA	Parish
DM-11	Saint Peter	DMA	Parish
DM-06	Saint Joseph	DMA	Parish
DM-10	Saint Paul	DMA	Parish
DM-04	Saint George	DMA	Parish
DM-07	Saint Luke	DMA	Parish
DM-08	Saint Mark	DMA	Parish
FR-GP	Guadeloupe	FRA	Overseas department
HN-IB	Bay Islands	HND	Department
UM-67	Johnston Atoll	UMI	\N
MS-P	Saint Peter	MSR	Parish
MS-A	Saint Anthony	MSR	Parish
MS-G	Saint George	MSR	Parish
AG-06	Saint Paul	ATG	Parish
AG-08	Saint Philip	ATG	Parish
AG-07	Saint Peter	ATG	Parish
AG-03	Saint George	ATG	Parish
AG-04	Saint John	ATG	Parish
AG-05	Saint Mary	ATG	Parish
KN-10	Saint Paul Charlestown	KNA	Parish
KN-07	Saint John Figtree	KNA	Parish
KN-04	Saint George Gingerland	KNA	Parish
KN-05	Saint James Windward	KNA	Parish
KN-12	Saint Thomas Lowland	KNA	Parish
KN-09	Saint Paul Capisterre	KNA	Parish
KN-02	Saint Anne Sandy Point	KNA	Parish
KN-13	Saint Thomas Middle Island	KNA	Parish
KN-14	Trinity Palmetto Point	KNA	Parish
KN-03	Saint George Basseterre	KNA	Parish
KN-11	Saint Peter Basseterre	KNA	Parish
KN-08	Saint Mary Cayon	KNA	Parish
KN-01	Christ Church Nichola Town	KNA	Parish
KN-06	Saint John Capisterre	KNA	Parish
NL-BQ3	Sint Eustatius	NLD	Special Municipality
AG-10	Barbuda	ATG	Dependency
VI-X01~	Saint Croix	VIR	\N
BL-X00~	Saint Barthélemy	BLM	\N
US-PR	Puerto Rico	PRI	\N
DO-11	La Altagracia	DOM	Province
AI-X02~	East End	AIA	District
AI-X10~	Stoney Ground	AIA	District
AI-X06~	North Side	AIA	District
AI-X13~	The Valley	AIA	District
AI-X05~	North Hill	AIA	District
AI-X07~	Sandy Ground	AIA	District
AI-X09~	South Hill	AIA	District
AI-X14~	West End	AIA	District
AI-X01~	Blowing Point	AIA	District
AI-X11~	The Farrington	AIA	District
AI-X08~	Sandy Hill Bay	AIA	District
AI-X04~	Island Harbour	AIA	District
VI-X03~	Saint John	VIR	\N
VI-X02~	Saint Thomas	VIR	\N
VG-X01~	British Virgin Islands	VGB	\N
JM-06	Saint Ann	JAM	Parish
JM-07	Trelawny	JAM	Parish
JM-08	Saint James	JAM	Parish
JM-09	Hanover	JAM	Parish
JM-10	Westmoreland	JAM	Parish
JM-11	Saint Elizabeth	JAM	Parish
JM-12	Manchester	JAM	Parish
JM-13	Clarendon	JAM	Parish
JM-14	Saint Catherine	JAM	Parish
JM-02	Saint Andrew	JAM	Parish
JM-01	Kingston	JAM	Parish
JM-03	Saint Thomas	JAM	Parish
JM-04	Portland	JAM	Parish
JM-05	Saint Mary	JAM	Parish
KY-X01~	Cayman Islands	CYM	\N
DO-08	El Seibo	DOM	Province
DO-30	Hato Mayor	DOM	Province
DO-20	Samaná	DOM	Province
DO-14	María Trinidad Sánchez	DOM	Province
DO-09	Espaillat	DOM	Province
DO-18	Puerto Plata	DOM	Province
HT-ND	Nord	HTI	Department
HT-AR	Artibonite	HTI	Department
HT-NI	Nippes	HTI	Department
DO-04	Barahona	DOM	Province
DO-02	Azua	DOM	Province
DO-17	Peravia	DOM	Province
DO-21	San Cristóbal	DOM	Province
DO-32	Santo Domingo	DOM	Province
DO-01	Nacional	DOM	National District
DO-23	San Pedro de Macorís	DOM	Province
DO-12	La Romana	DOM	Province
CU-09	Camagüey	CUB	Province
CU-08	Ciego de Ávila	CUB	Province
CU-11	Holguín	CUB	Province
TC-X05~	Grand Turk	TCA	\N
CU-99	Isla de la Juventud	CUB	Special Municipality
BS-CK	Crooked Island	BHS	District
CU-07	Sancti Spíritus	CUB	Province
CU-05	Villa Clara	CUB	Province
CU-04	Matanzas	CUB	Province
BS-EX	Exuma	BHS	District
BS-LI	Long Island	BHS	District
BS-RC	Rum Cay	BHS	District
BS-BP	Black Point	BHS	District
BS-SS	San Salvador Island	BHS	District
BS-CS	Central Andros	BHS	District
BS-MC	Mangrove Cay	BHS	District
BS-SA	South Andros	BHS	District
BS-CI	Cat Island	BHS	District
BS-X01~	New Providence	BHS	Capital
BS-NS	North Andros	BHS	District
BS-CE	Central Eleuthera	BHS	District
BS-NE	North Eleuthera	BHS	District
BS-SE	South Eleuthera	BHS	District
BS-BY	Berry Islands	BHS	District
BS-MI	Moore's Island	BHS	District
BS-FP	Freeport	BHS	District
BS-WG	West Grand Bahama	BHS	District
BS-EG	East Grand Bahama	BHS	District
BS-CO	Central Abaco	BHS	District
BS-SO	South Abaco	BHS	District
BS-NO	North Abaco	BHS	District
BM-HAM	Hamilton	BMU	\N
BM-SMI	Smith's Parish	BMU	\N
BM-DEV	Devonshire	BMU	\N
BM-PEM	Pembroke Parish	BMU	\N
BM-HA	Hamilton	BMU	\N
BM-PAG	Paget Parish	BMU	\N
BM-WAR	Warwick	BMU	\N
BM-SOU	Southampton	BMU	\N
BM-SAN	Sandys Parish	BMU	\N
BM-SGE	Saint George	BMU	\N
RU-KL	Republic of Kalmykia	RUS	Republic
AZ-SBN	Shabran	AZE	District
AZ-SIY	Siyazan	AZE	District
AZ-XIZ	Khizi	AZE	District
AZ-SM	Sumqayit	AZE	Municipality
AZ-BA	Baku	AZE	Municipality
AZ-SAL	Salyan	AZE	District
AZ-NEF	Neftchala	AZE	District
AZ-LA	Lankaran	AZE	District
AZ-MAS	Masally	AZE	District
IR-21	Mazandaran	IRN	Province
HM-X01~	Heard Island and McDonald Islands	HMD	\N
TF-X01~	Kerguelen Islands	ATF	\N
TF-X02~	Crozet Islands	ATF	\N
SH-TA	Tristan da Cunha	SHN	\N
FR-RE	Réunion	FRA	Overseas department
MU-RR	Rivière du Rempart	MUS	District
MU-PA	Pamplemousses	MUS	District
MU-PL	Port Louis	MUS	City
MU-BL	Rivière Noire	MUS	District
MU-SA	Savanne	MUS	District
MU-GP	Grand Port	MUS	District
MU-FL	Flacq	MUS	District
SH-HL	Saint Helena	SHN	\N
FR-YT	Mayotte	FRA	Overseas department
KM-M	Mohéli	COM	\N
KM-A	Anjouan	COM	\N
KM-G	Andjazîdja	COM	\N
MU-AG	Agaléga	MUS	Dependency
SH-AC	Ascension	SHN	\N
TZ-11	Unguja South	TZA	Region
TZ-07	Unguja North	TZA	Region
TZ-15	Mjini Magharibi	TZA	Region
TZ-10	South Pemba	TZA	Region
TZ-06	North Pemba	TZA	Region
SC-13	Grand'Anse Praslin	SYC	\N
SC-02	Anse Boileau	SYC	\N
SC-06	Baie Lazare	SYC	\N
SC-23	Takamaka	SYC	\N
SC-05	Anse Royale	SYC	\N
SC-04	Au Cap	SYC	\N
SC-01	Anse-aux-Pins	SYC	\N
SC-20	Pointe La Rue	SYC	\N
SC-11	Cascade	SYC	\N
SC-25	Roche Caiman	SYC	\N
SC-19	Plaisance	SYC	\N
SC-18	Mont Fleuri	SYC	\N
SC-09	Bel Air	SYC	\N
SC-16	La Rivière Anglaise	SYC	\N
SC-03	Anse Etoile	SYC	\N
SC-12	Glacis	SYC	\N
SC-08	Beau Vallon	SYC	\N
SC-10	Bel Ombre	SYC	\N
SC-21	Port Glaud	SYC	\N
SC-07	Baie Sainte Anne	SYC	\N
SC-14	Grand'Anse Praslin	SYC	\N
GQ-AN	Annobón	GNQ	Province
ST-S	São Tomé	STP	\N
ST-P	Príncipe	STP	\N
GQ-BN	Bioko Norte	GNQ	Province
GQ-BS	Bioko Sur	GNQ	Province
CV-BR	Brava	CPV	\N
CV-CF	Santa Catarina do Fogo	CPV	\N
CV-MO	Mosteiros	CPV	\N
CV-SF	São Filipe	CPV	\N
CV-TA	Tarrafal	CPV	\N
CV-CA	Santa Catarina	CPV	\N
CV-RS	Ribeira Grande de Santiago	CPV	\N
CV-PR	Praia	CPV	\N
CV-SD	São Domingos	CPV	\N
CV-CR	Santa Cruz	CPV	\N
CV-SM	São Miguel	CPV	\N
CV-MA	Maio	CPV	\N
CV-BV	Boa Vista	CPV	\N
CV-RB	Ribeira Brava	CPV	\N
CV-TS	Tarrafal de São Nicolau	CPV	\N
CV-SL	Sal	CPV	\N
CV-SV	São Vicente	CPV	\N
CV-RG	Ribeira Grande	CPV	\N
CV-PN	Porto Novo	CPV	\N
CV-PA	Paul	CPV	\N
ES-TF	Santa Cruz de Tenerife	ESP	Autonomous Community
ES-GC	Las Palmas	ESP	Autonomous Community
PT-30	Madeira	PRT	Autonomous region
GR-M	Crete	GRC	Region
GR-L	South Aegean	GRC	Region
CY-05	Paphos	CYP	District
MT-21	Kalkara	MLT	\N
MT-60	Valletta	MLT	\N
MT-56	Sliema	MLT	\N
MT-48	St. Julian's	MLT	\N
MT-40	Pembroke	MLT	\N
MT-38	Naxxar	MLT	\N
MT-51	St. Paul's Bay	MLT	\N
MT-30	Mellieħa	MLT	\N
MT-31	Mġarr	MLT	\N
MT-46	Rabat	MLT	\N
MT-07	Dingli	MLT	\N
MT-55	Siġġiewi	MLT	\N
MT-44	Qrendi	MLT	\N
MT-68	Żurrieq	MLT	\N
MT-05	Birżebbuġa	MLT	\N
MT-28	Marsaxlokk	MLT	\N
MT-27	Marsaskala	MLT	\N
MT-64	Żabbar	MLT	\N
MT-63	Xgħajra	MLT	\N
MT-50	Saint Lawrence	MLT	\N
MT-22	Kerċem	MLT	\N
MT-36	Munxar	MLT	\N
MT-52	Sannat	MLT	\N
MT-13	Għajnsielem	MLT	\N
MT-42	Qala	MLT	\N
MT-37	Nadur	MLT	\N
MT-61	Xagħra	MLT	\N
MT-65	Żebbuġ	MLT	\N
MT-16	Għasri	MLT	\N
MT-14	Għarb	MLT	\N
IT-TP	Trapani	ITA	Province
PT-20	Azores	PRT	Autonomous region
GR-K	North Aegean	GRC	Region
GR-F	Ionian Islands	GRC	Region
IT-ME	Messina	ITA	Province
IT-PA	Palermo	ITA	Province
IT-AG	Agrigento	ITA	Province
IT-CL	Caltanissetta	ITA	Province
IT-RG	Ragusa	ITA	Province
IT-SR	Syracuse	ITA	Province
IT-CT	Catania	ITA	Province
ES-PM	Balearic Islands	ESP	Autonomous Community
IT-CI	Carbonia-Iglesias	ITA	Province
IT-SS	Sassari	ITA	Province
IT-NU	Nuoro	ITA	Province
IT-OT	Olbia-Tempio	ITA	Province
IT-OR	Oristano	ITA	Province
IT-VS	Medio Campidano	ITA	Province
IT-CA	Cagliari	ITA	Province
IT-OG	Ogliastra	ITA	Province
FR-2B	Haute-Corse	FRA	Metropolitan department
FR-2A	Corse-du-Sud	FRA	Metropolitan department
JE-X01~	Jersey	JEY	\N
GG-X01~	Sark	GGY	\N
GB-IOW	Isle of Wight	GBR	Unitary Authority
GB-AGY	Anglesey	GBR	Unitary Authority (wales)
IM-X01~	Isle of Man	IMN	\N
DK-85	Zealand	DNK	Region
DK-84	Denmark	DNK	Region
GB-ELS	Outer Hebrides	GBR	Island Area
SE-I	Gotland	SWE	County
GB-ORK	Orkney Islands	GBR	Unitary District
GB-ZET	Shetland Islands	GBR	Unitary District (city)
AX-X11~	Lumparland	ALD	\N
AX-X04~	Eckerö	ALD	\N
AX-X12~	Vårdö	ALD	\N
AX-X14~	Kumlinge	ALD	\N
AX-X02~	Jomala	ALD	\N
AX-X09~	Mariehamn	ALD	\N
FO-X00~	Eysturoy	FRO	Region
AU-TAS	Tasmania	AUS	State
-99-X15~	Cocos	IOA	Province
ID-BA	Bali	IDN	Province
IO-X01~	British Indian Ocean Territory	IOT	\N
SG-05	South West Community Development Council	SGP	\N
SG-01	Central Singapore Community Development Council	SGP	\N
SG-04	South East Community Development Council	SGP	\N
SG-02	North East Community Development Council	SGP	\N
SG-03	North West	SGP	\N
MY-15	Labuan	MYS	Federal Territory
TH-83	Phuket	THA	Province
US-HI	Hawaii	USA	State
JP-47	Okinawa Prefecture	JPN	Prefecture
TW-KIN	Kinmen	TWN	County
KR-49	Jeju	KOR	Province
RU-KAM	Kamchatka Krai	RUS	Region
EE-74	Saare	EST	Municipality
EE-39	Hiiu	EST	County
AX-X16~	Kökar	ALD	\N
AX-X06~	Föglö	ALD	\N
AX-X13~	Sottunga	ALD	\N
NO-21	Svalbard	NOR	Territory
AU-X03~	Macquarie Island	AUS	\N
NZ-X05~	Campbell Islands	NZL	\N
NZ-X04~	Antipodes Islands	NZL	\N
NZ-CIT	Chatham Islands	NZL	Special Island Authority
NZ-X01~	Kermadec Islands	NZL	\N
NF-X01~	Norfolk Island	NFK	\N
PF-X04~	Austral Islands	PYF	\N
CK-X03~	Mangaia	COK	\N
CK-X05~	Mitiaro	COK	\N
FJ-E	Eastern	FJI	Division
TO-05	Vavaʻu	TON	\N
WF-SG	Sigave	WLF	\N
WF-AL	Alo	WLF	\N
WS-GE	Gaga'emauga	WSM	\N
WS-GI	Gaga'ifomauga	WSM	\N
WS-VS	Vaisigano	WSM	\N
WS-SA	Satupa'itea	WSM	\N
WS-PA	Palauli	WSM	\N
WS-FA	Fa'asaleleaga	WSM	\N
SB-RB	Rennell and Bellona	SLB	Province
PF-X05~	Marquesas Islands	PYF	\N
SB-MK	Makira-Ulawa	SLB	Province
SB-TE	Temotu	SLB	Province
SB-ML	Malaita	SLB	Province
SB-CT	Honiara	SLB	Province
SB-GU	Guadalcanal	SLB	Province
SB-CE	Central	SLB	Province
CK-X11~	Penrhyn Atoll	COK	\N
TV-X01~	Tuvalu	TUV	\N
SB-IS	Isabel	SLB	Province
TL-AN	Ainaro	TLS	District|Regencies
TL-MF	Manufahi	TLS	District|Regencies
TL-MT	Manatuto	TLS	District|Regencies
TL-VI	Viqueque	TLS	District|Regencies
TL-LA	Lautém	TLS	District|Regencies
TL-BA	Baucau	TLS	District|Regencies
TL-DI	Dili	TLS	District|Regencies
TL-LI	Liquiçá	TLS	District|Regencies
KI-X02~	\N	KIR	\N
PG-NSB	of Bougainville	PNG	Province
PG-WBK	West New Britain	PNG	Province
PG-EBR	East New Britain	PNG	Province
PG-NIK	New Ireland	PNG	Province
ID-BB	Bangka Belitung Islands	IDN	Province
PG-MRL	Manus	PNG	Province
MV-01	Addu Atoll	MDV	City
NR-03	Anetan	NRU	\N
NR-09	Ewa	NRU	\N
NR-05	Baiti	NRU	\N
NR-13	Uaboe	NRU	\N
NR-12	Nibok	NRU	\N
NR-08	Denigomodu	NRU	\N
NR-01	Aiwo	NRU	\N
NR-06	Boe	NRU	\N
NR-14	Yaren	NRU	\N
NR-11	Meneng	NRU	\N
NR-04	Anibare	NRU	\N
NR-10	Ijuw	NRU	\N
NR-02	Anabar	NRU	\N
MV-29	Gnaviyani Atoll	MDV	Atoll
MV-28	Gaafu Dhaalu Atoll	MDV	Atoll
MV-27	Gaafu Alif Atoll	MDV	Atoll
MV-00	Alif Dhaal Atoll	MDV	Atoll
MV-26	Kaafu Atoll	MDV	Atoll
MV-02	Alif Alif Atoll	MDV	Atoll
MV-20	Baa Atoll	MDV	Atoll
MV-03	Lhaviyani Atoll	MDV	Atoll
PH-TAW	Tawi-Tawi	PHL	Province
FM-KSA	Kosrae	FSM	\N
MV-13	Raa Atoll	MDV	Atoll
MV-24	Shaviyani Atoll	MDV	Atoll
PH-BAS	Basilan	PHL	Province
FM-PNI	Pohnpei State	FSM	\N
FM-TRK	Chuuk State	FSM	\N
PH-CAM	Camiguin	PHL	Province
PH-SIG	Siquijor	PHL	Province
PH-BOH	Bohol	PHL	Province
PH-GUI	Guimaras	PHL	Province
PH-BCD	Bacolod	PHL	Highly Urbanized City
PH-NEC	Negros Occidental	PHL	Province
PH-NER	Negros Oriental	PHL	Province
PH-MDE	Mandaue	PHL	Highly Urbanized City
PH-CEB	Cebu	PHL	Province
PH-AKL	Aklan	PHL	Province
PH-ANT	Antique	PHL	Province
PH-ILI	Iloilo	PHL	Province
PH-CAP	Capiz	PHL	Province
PH-ROM	Romblon	PHL	Province
PH-NSA	Northern Samar	PHL	Province
PH-MAS	Masbate	PHL	Province
PH-MDR	Oriental Mindoro	PHL	Province
PH-MDC	Occidental Mindoro	PHL	Province
PH-MAD	Marinduque	PHL	Province
PH-CAT	Catanduanes	PHL	Province
PH-BTN	Batanes	PHL	Province
GS-X01~	South Georgia and the South Sandwich Islands	SGS	\N
NO-X01~	Bouvet Island	NOR	\N
FK-X01~	Falkland Islands	FLK	\N
TF-X1~	Amsterdam and Saint-Paul Islands	ATF	\N
NC-X02~	South	NCL	Province
NC-X01~	Loyalty Islands	NCL	Province
TO-01	ʻEua	TON	\N
CK-X04~	Rarotonga	COK	\N
TO-04	Tongatapu	TON	\N
VU-TAE	Tafea	VUT	Province
TO-02	Haʻapai	TON	\N
MU-RO	Rodrigues	MUS	Dependency
NU-X01~	Niue	NIU	\N
FJ-W	Western	FJI	Division
FJ-C	Central	FJI	Division
VU-SEE	Shefa	VUT	Province
FJ-N	Northern	FJI	Division
VU-MAP	Malampa	VUT	Province
VU-SAM	Sanma	VUT	Province
TO-03	Niuas	TON	\N
VU-PAM	Penama	VUT	Province
AS-X05~	Western District	ASM	\N
AS-X01~	Eastern District	ASM	\N
AS-X02~	Manu'a Islands	ASM	\N
VU-TOB	Torba	VUT	Province
WS-AT	Atua	WSM	\N
WS-VF	Va'a-o-Fonoti	WSM	\N
WS-TU	Tuamasaga	WSM	\N
WS-AA	A'ana	WSM	\N
WS-AL	Aiga-i-le-Tai	WSM	\N
WF-UV	Uvea	WLF	\N
FJ-R	Rotuma	FJI	Division
PW-350	Peleliu	PLW	\N
PW-150	Koror	PLW	\N
PW-227	Ngeremlengui	PLW	\N
PW-224	Ngatpang	PLW	\N
PW-002	Aimeliik	PLW	\N
PW-004	Airai	PLW	\N
PW-226	Ngchesar	PLW	\N
PW-212	Melekeok	PLW	\N
PW-228	Ngiwal	PLW	\N
PW-214	Ngaraard	PLW	\N
PW-218	Ngarchelong	PLW	\N
PW-222	Ngardmau	PLW	\N
FM-YAP	Yap State	FSM	\N
GU-X01~	Guam	GUM	\N
MP-X01~	Rota	MNP	\N
MP-X02~	Tinian	MNP	\N
MP-X03~	Saipan	MNP	\N
CN-X01~	Paracel Islands	CHN	\N
MP-X04~	Northern Mariana Islands	MNP	\N
CU-10	Las Tunas	CUB	Province
CU-16	Mayabeque	CUB	Province
CU-03	Havana	CUB	Province
CU-15	Artemisa	CUB	Province
CU-01	Pinar del Río	CUB	Province
CU-06	Cienfuegos	CUB	Province
CU-12	Granma	CUB	Province
CU-13	Santiago de Cuba	CUB	Province
TW-PEN	Penghu	TWN	County
BH-13	Capital	BHR	Governorate
BH-17	Northern	BHR	Governorate
BH-14	Southern	BHR	Governorate
BH-16	Central	BHR	Governorate
CA-PE	Prince Edward Island	CAN	Province
-99-X03~	Coral Sea Islands	CSI	\N
CK-X06~	Mauke	COK	\N
CK-X01~	Atiu	COK	\N
CK-X02~	Aitutaki	COK	\N
AS-X03~	Rose Atoll	ASM	\N
AS-X04~	Swains Island	ASM	\N
CK-X08~	Pukapuka	COK	\N
-99-X14~	Christmas Island	IOA	\N
CK-X10~	Manihiki	COK	\N
CK-X09~	Rakahanga	COK	\N
TK-X01~	Tokelau	NZL	\N
UM-86	Jarvis Island	UMI	\N
UM-81	Baker Island	UMI	\N
UM-84	Howland Island	UMI	\N
MV-05	Laamu Atoll	MDV	Atoll
MV-08	Thaa Atoll	MDV	Atoll
MV-17	Dhaalu Atoll	MDV	Atoll
PW-050	Hatohobei	PLW	\N
MV-14	Faafu Atoll	MDV	Atoll
MV-04	Vaavu Atoll	MDV	Atoll
CO-X01~	\N	COL	\N
MV-12	Malé	MDV	Capital
PW-370	Sonsorol	PLW	\N
MV-25	Noonu Atoll	MDV	Atoll
MV-23	Haa Dhaalu Atoll	MDV	Atoll
MV-07	Haa Alif Atoll	MDV	Atoll
PW-010	Angaur	PLW	\N
-99-X08~	Spratly Islands	PGA	\N
VE-X01~	\N	VEN	\N
AI-X00	\N	AIA	\N
UM-79	Wake Island	UMI	\N
BS-BI	Bimini	BHS	District
UM-71	Midway Atoll	UMI	\N
GB-IOS	Isles of Scilly	GBR	Unitary Single-Tier County
CK-X07~	Palmerston Island	COK	\N
-99-X02~	Clipperton Island	CLP	\N
NL-BQ2	Saba	NLD	Special Municipality
UM-76	Navassa Island	UMI	\N
TC-X06~	Salt Cay	TCA	\N
MO-M	Macau	MAC	\N
BS-RI	Ragged Island	BHS	District
HK-X18~	Lantau Island	HKG	\N
HK-X04~	Southern District	HKG	\N
HK-X01~	Central and Western District	HKG	\N
HK-X02~	Wan Chai	HKG	\N
HK-X03~	Siu Ma Shan	HKG	\N
HK-X13~	Tsuen Wan	HKG	\N
MX-X01~	\N	MEX	\N
HK-X17~	Tai Po	HKG	\N
HK-X11~	Sha Tin	HKG	\N
HK-X10~	Sai Kung	HKG	\N
HK-X09~	Kwun Tong	HKG	\N
HK-X06~	Kowloon City	HKG	\N
HK-X05~	Yau Tsim Mong	HKG	\N
HK-X07~	Sham Shui Po	HKG	\N
HK-X12~	Kwai Tsing	HKG	\N
HK-X14~	Tuen Mun	HKG	\N
HK-X15~	Yuen Long	HKG	\N
AX-X10~	Lemland	ALD	\N
AX-X15~	Brändö	ALD	\N
RU-X01~	\N	RUS	\N
NZ-X07~	Snares Islands	NZL	\N
NZ-STL	Southland	NZL	Regional Council
NZ-MBH	Marlborough	NZL	Unitary Authority
NZ-NSN	Nelson	NZL	Unitary Authority
NZ-TAS	Tasman	NZL	Unitary Authority
NZ-WTC	West Coast	NZL	Regional Council
NZ-OTA	Otago	NZL	Regional Council
NZ-CAN	Canterbury	NZL	Regional Council
NZ-AUK	Auckland	NZL	Unitary Authority
NZ-WKO	Waikato	NZL	Regional Council
NZ-X03~	Three Kings Islands	NZL	\N
NZ-WGN	Wellington	NZL	Regional Council
NZ-MWT	Manawatū-Whanganui	NZL	Regional Council
NZ-TKI	Taranaki	NZL	Regional Council
NZ-NTL	Northland	NZL	Regional Council
NZ-BOP	Bay of Plenty	NZL	Regional Council
NZ-GIS	Gisborne	NZL	Unitary Authority
NZ-HKB	Hawke's Bay	NZL	Regional Council
AU-X04~	Ashmore and Cartier Islands	ATC	\N
UM-95	Palmyra Atoll	UMI	\N
PW-100	Kayangel	PLW	\N
PH-LAP	Lapu-Lapu	PHL	Highly Urbanized City
AG-11	Redonda	ATG	Dependency
BS-HI	Harbour Island	BHS	District
BS-SW	Spanish Wells	BHS	District
BH-15	Muharraq	BHR	Governorate
ZW-MI	Midlands	ZWE	Province
ZW-HA	Harare	ZWE	City
ZW-BU	Bulawayo	ZWE	City
YE-MA	Ma'rib	YEM	Governorate
YE-SN	Sanaa	YEM	Governorate
YE-RA	Raymah	YEM	Governorate
YE-BA	Al Bayda'	YEM	Governorate
YE-AM	'Amran	YEM	Governorate
YE-DA	Ad Dali'	YEM	Governorate
YE-IB	Ibb	YEM	Governorate
YE-MW	Al Mahwit	YEM	Governorate
YE-DH	Dhamar	YEM	Governorate
VN-14	Hòa Bình	VNM	Province
VN-07	Tuyên Quang	VNM	Province
VN-06	Yên Bái	VNM	Province
VN-70	Vĩnh Phúc	VNM	Province
VN-68	Phú Thọ	VNM	Province
VN-HN	Hanoi	VNM	Province
VN-53	Northeast Vietnam	VNM	Region
VN-66	Red River Delta	VNM	Region
VN-56	Bắc Ninh	VNM	Province
VN-54	Bắc Giang	VNM	Province
VN-69	Thái Nguyên	VNM	Province
VN-61	Hải Dương	VNM	Province
VN-63	Hà Nam	VNM	Province
VN-57	Bình Dương	VNM	Province
VN-35	Lâm Đồng	VNM	Province
VN-CT	Cần Thơ	VNM	Province
UY-TA	Tacuarembó	URY	Department
UY-DU	Durazno	URY	Department
UY-FS	Flores	URY	Department
UY-FD	Florida	URY	Department
UY-LA	Lavalleja	URY	Department
VE-J	Guárico State	VEN	State
VE-H	Cojedes	VEN	State
VE-A	Capital	VEN	Capital District
VE-E	Barinas	VEN	State
VE-K	Lara	VEN	State
VE-P	Portuguesa	VEN	State
UA-53	Poltava	UKR	Region
UA-68	Khmelnytskyi	UKR	Region
UA-61	Ternopil	UKR	Region
UA-12	Dnipropetrovsk	UKR	Region
UA-71	Cherkasy	UKR	Region
UA-35	Kirovohrad	UKR	Region
TN-34	Siliana	TUN	Governorate
TN-43	Sidi Bouzid	TUN	Governorate
TN-41	Kairouan	TUN	Governorate
TN-22	Zaghouan	TUN	Governorate
CH-BE	Bern	CHE	Canton
CH-LU	Lucerne	CHE	Canton
CH-ZG	Zug	CHE	Canton
CH-UR	Uri	CHE	Canton
CH-SZ	Schwyz	CHE	Canton
CH-GL	Glarus	CHE	Canton
CH-NW	Nidwalden	CHE	Canton
CH-FR	Fribourg	CHE	Canton
CH-OW	Obwalden	CHE	Canton
SI-089	Pesnica	SVN	Commune|Municipality
SI-026	Duplek	SVN	Commune|Municipality
SI-169	Miklavž na Dravskem Polju	SVN	Commune|Municipality
SI-160	Hoče-Slivnica	SVN	Commune|Municipality
SI-058	Lenart	SVN	Commune|Municipality
SI-181	Sveta Ana	SVN	Commune|Municipality
SI-167	Lovrenc na Pohorju	SVN	Commune|Municipality
SI-177	Ribnica na Pohorju	SVN	Commune|Municipality
SI-112	Slovenj Gradec	SVN	Statistical Region
SI-141	Vuzenica	SVN	Commune|Municipality
PG-CPK	Chimbu	PNG	Province
PG-EPW	Enga	PNG	Province
PG-WHM	Western Highlands	PNG	Province
PG-SHM	Southern Highlands	PNG	Province
PG-EHG	Eastern Highlands	PNG	Province
MD-CR	Criuleni	MDA	District
MD-ST	Strășeni	MDA	District
MD-AN	Anenii Noi	MDA	District
MD-OR	Orhei	MDA	District
MD-SN	Transnistria	MDA	District
MD-CU	Chișinău	MDA	City
MD-TE	Telenești	MDA	District
MD-SD	Șoldănești	MDA	District
MD-FL	Florești	MDA	District
MD-IA	Ialoveni	MDA	District
TR-14	Bolu	TUR	Province
TR-06	Ankara	TUR	Province
TR-11	Bilecik	TUR	Province
TR-26	Eskişehir	TUR	Province
TR-18	Çankırı	TUR	Province
TR-78	Karabük	TUR	Province
IN-JH	Jharkhand	IND	State
IN-DL	Delhi	IND	Union Territory
IN-CH	Chandigarh	IND	Union Territory
IN-MP	Madhya Pradesh	IND	State
US-UT	Utah	USA	State
US-WY	Wyoming	USA	State
US-NV	Nevada	USA	State
US-CO	Colorado	USA	State
US-SD	South Dakota	USA	State
US-NE	Nebraska	USA	State
US-KS	Kansas	USA	State
US-OK	Oklahoma	USA	State
US-IA	Iowa	USA	State
US-MO	Missouri	USA	State
TT-ARI	Arima	TTO	City
TH-40	Khon Kaen	THA	Province
TH-47	Sakon Nakhon	THA	Province
TH-72	Suphan Buri	THA	Province
TH-17	Sing Buri	THA	Province
TH-18	Chai Nat	THA	Province
TH-15	Ang Thong	THA	Province
TH-19	Saraburi	THA	Province
TH-30	Nakhon Ratchasima	THA	Province
TH-26	Nakhon Nayok	THA	Province
TH-13	Pathum Thani	THA	Province
TH-61	Uthai Thani	THA	Province
TH-46	Kalasin	THA	Province
TH-45	Roi Et	THA	Province
TH-44	Maha Sarakham	THA	Province
TH-39	Nong Bua Lam Phu	THA	Province
TH-16	Lopburi	THA	Province
TH-41	Udon Thani	THA	Province
TH-14	Phra Nakhon Si Ayutthaya	THA	Province
TH-12	Nonthaburi	THA	Province
TH-73	Nakhon Pathom	THA	Province
TH-62	Kamphaeng Phet	THA	Province
TH-52	Lampang	THA	Province
TH-64	Sukhothai	THA	Province
TH-60	Nakhon Sawan	THA	Province
TH-67	Phetchabun	THA	Province
TH-66	Phichit	THA	Province
TH-36	Chaiyaphum	THA	Province
TH-54	Phrae	THA	Province
TH-51	Lamphun	THA	Province
TH-25	Prachin Buri	THA	Province
TH-35	Yasothon	THA	Province
TL-ER	Ermera	TLS	District|Regencies
TL-AL	Aileu	TLS	District|Regencies
TW-NAN	Nantou	TWN	County
TR-60	Tokat	TUR	Province
TR-58	Sivas	TUR	Province
TR-19	Çorum	TUR	Province
TR-05	Amasya	TUR	Province
TZ-16	Morogoro	TZA	Region
TZ-03	Dodoma	TZA	Region
TZ-26	Manyara	TZA	Region
IR-12	Semnan	IRN	Province
IR-11	Zanjan	IRN	Province
IR-28	Qazvin	IRN	Province
TW-TPE	Taipei	TWN	Special Municipality
TW-CYI	Chiayi	TWN	Provincial City
SY-HM	Hama	SYR	Province
SI-095	Preddvor	SVN	Commune|Municipality
SI-117	Šenčur	SVN	Commune|Municipality
SI-012	Cerklje na Gorenjskem	SVN	Commune|Municipality
SI-043	Kamnik	SVN	Commune|Municipality
SI-071	Medvode	SVN	Commune|Municipality
SI-052	Kranj	SVN	Commune|Municipality
SI-122	Škofja Loka	SVN	Commune|Municipality
SI-146	Železniki	SVN	Commune|Municipality
SI-004	Bohinj	SVN	Commune|Municipality
SI-082	Naklo	SVN	Commune|Municipality
SI-102	Radovljica	SVN	Statistical Region
SI-126	Šoštanj	SVN	Commune|Municipality
SI-062	Ljubno	SVN	Commune|Municipality
SI-067	Luče	SVN	Commune|Municipality
SI-068	Lukovica	SVN	Commune|Municipality
SI-148	Benedikt	SVN	Commune|Municipality
SI-057	Laško	SVN	Commune|Municipality
SI-154	Dobje	SVN	Commune|Municipality
SI-108	Ruše	SVN	Commune|Municipality
SI-138	Vodice	SVN	Commune|Municipality
SI-164	Komenda	SVN	Commune|Municipality
SI-072	Mengeš	SVN	Commune|Municipality
SI-140	Vrhnika	SVN	Commune|Municipality
SI-162	Horjul	SVN	Commune|Municipality
SI-153	Cerkvenjak	SVN	Commune|Municipality
SI-186	Trzin	SVN	Commune|Municipality
SI-097	Puconci	SVN	Commune|Municipality
SI-158	Grad	SVN	Commune|Municipality
SI-080	Murska Sobota	SVN	Statistical Region
SI-182	Sveti Andraž v Slovenskih Goricah	SVN	Commune|Municipality
SI-008	Brezovica	SVN	Commune|Municipality
SI-021	Dobrova–Polhov Gradec	SVN	Commune|Municipality
SI-027	Občina Gorenja vas-Poljane	SVN	Commune|Municipality
SI-064	Logatec	SVN	Commune|Municipality
SI-185	Trnovska Vas	SVN	Commune|Municipality
SI-018	Destrnik	SVN	Commune|Municipality
SI-098	Rače–Fram	SVN	Commune|Municipality
SI-115	Starše	SVN	Statistical Region
SI-189	Vransko	SVN	Commune|Municipality
SI-133	Velenje	SVN	Commune|Municipality
SI-173	Polzela	SVN	Commune|Municipality
SI-125	Šmartno ob Paki	SVN	Commune|Municipality
SI-079	Mozirje	SVN	Commune|Municipality
SI-137	Vitanje	SVN	Commune|Municipality
SI-139	Vojnik	SVN	Commune|Municipality
SI-144	Zreče	SVN	Commune|Municipality
SI-076	Mislinja	SVN	Commune|Municipality
SI-05	Zagorje ob Savi	SVN	Statistical Region
SI-060	Litija	SVN	Commune|Municipality
SI-030	Gornji Grad	SVN	Commune|Municipality
SI-013	Cerknica	SVN	Commune|Municipality
SI-134	Velike Lašče	SVN	Commune|Municipality
SI-005	Borovnica	SVN	Commune|Municipality
SI-094	Postojna	SVN	Commune|Municipality
SI-091	Pivka	SVN	Statistical Region
SI-155	Dobrna	SVN	Commune|Municipality
SI-011	Celje	SVN	Commune|Municipality
SI-083	Nazarje	SVN	Commune|Municipality
SI-023	Domžale	SVN	Commune|Municipality
SI-039	Ivančna Gorica	SVN	Commune|Municipality
SI-061	Ljubljana	SVN	Statistical Region
SI-194	Šmartno pri Litiji	SVN	Commune|Municipality
SI-037	Ig	SVN	Commune|Municipality
SI-022	Dol pri Ljubljani	SVN	Commune|Municipality
SI-174	Prebold	SVN	Commune|Municipality
SI-077	Moravče	SVN	Commune|Municipality
CH-AR	Appenzell Ausserrhoden	CHE	Canton
CH-AI	Appenzell Innerrhoden	CHE	Canton
SE-U	Västmanland	SWE	County
SE-F	Jönköping	SWE	County
SE-T	Örebro	SWE	County
SE-G	Kronoberg	SWE	County
SR-PR	Para	SUR	District
SR-BR	Brokopondo	SUR	District
SD-GZ	Al Jazirah	SDN	State
SD-KH	Khartoum	SDN	Region
SD-KN	North Kordofan	SDN	State
SS-LK	Lakes	SDS	State
SS-WR	Warrap	SDS	State
ES-Z	Zaragoza	ESP	Autonomous Community
ES-LO	La Rioja	ESP	Autonomous Community
ES-VI	Araba / Álava	ESP	Autonomous Community
ES-AB	Albacete	ESP	Autonomous Community
ES-TE	Teruel	ESP	Autonomous Community
ES-CU	Cuenca	ESP	Autonomous Community
ES-TO	Toledo	ESP	Autonomous Community
ES-LE	León	ESP	Autonomous Community
ES-SO	Soria	ESP	Autonomous Community
ES-BU	Burgos	ESP	Autonomous Community
ES-AV	Ávila	ESP	Autonomous Community
ZA-GT	Gauteng	ZAF	Province
SI-020	Dobrepolje	SVN	Commune|Municipality
SI-099	Radeče	SVN	Commune|Municipality
SI-127	Štore	SVN	Commune|Municipality
SI-114	Slovenske Konjice	SVN	Commune|Municipality
SI-147	Žiri	SVN	Commune|Municipality
SI-171	Oplotnica	SVN	Commune|Municipality
SI-014	Cerkno	SVN	Commune|Municipality
SI-003	Bled	SVN	Commune|Municipality
SI-001	Ajdovščina	SVN	Commune|Municipality
SI-019	Divača	SVN	Commune|Municipality
SI-036	Idrija	SVN	Commune|Municipality
SI-136	Vipava	SVN	Commune|Municipality
SI-150	Bloke	SVN	Commune|Municipality
SI-120	Šentjur	SVN	Commune|Municipality
SI-051	Kozje	SVN	Commune|Municipality
SI-124	Šmarje pri Jelšah	SVN	Commune|Municipality
SI-110	Sevnica	SVN	Commune|Municipality
SI-170	Mirna Peč	SVN	Commune|Municipality
SI-130	Trebnje	SVN	Commune|Municipality
SI-193	Žužemberk	SVN	Commune|Municipality
SI-132	Turnišče	SVN	Commune|Municipality
SI-100	Radenci	SVN	Commune|Municipality
SI-116	Sveti Jurij ob Ščavnici	SVN	Commune|Municipality
SI-187	Velika Polana	SVN	Commune|Municipality
SI-002	Beltinci	SVN	Commune|Municipality
SI-188	Veržej	SVN	Commune|Municipality
SI-086	Odranci	SVN	Commune|Municipality
SN-DB	Diourbel	SEN	Region
SA-01	Riyadh	SAU	Region
SA-05	Al-Qassim	SAU	Region
SA-06	Ha'il	SAU	Region
SA-11	Al-Baha	SAU	Region
RO-CJ	Cluj	ROU	County
RO-BN	Bistrița-Năsăud	ROU	County
RO-SJ	Sălaj	ROU	County
RO-DB	Dâmbovița	ROU	County
RO-IF	Ilfov	ROU	County
RO-AG	Argeș	ROU	County
RO-GJ	Gorj	ROU	County
RO-HD	Hunedoara	ROU	County
RO-VL	Vâlcea	ROU	County
RO-PH	Prahova	ROU	County
RO-CV	Covasna	ROU	County
RO-VN	Vrancea	ROU	County
RO-BZ	Buzău	ROU	County
RO-BV	Brașov	ROU	County
RO-SB	Sibiu	ROU	County
RO-MS	Mureș	ROU	County
RO-HR	Harghita	ROU	County
RO-NT	Neamț	ROU	County
RO-BC	Bacău	ROU	County
RO-AB	Alba	ROU	County
SI-032	Grosuplje	SVN	Commune|Municipality
SI-123	Škofljica	SVN	Commune|Municipality
SI-034	Hrastnik	SVN	Commune|Municipality
SI-190	Žalec	SVN	Statistical Region
SI-129	Trbovlje	SVN	Statistical Region
SI-151	Braslovče	SVN	Commune|Municipality
SI-184	Tabor	SVN	Commune|Municipality
SI-054	Krsko	SVN	Commune|Municipality
SI-159	Hajdina	SVN	Commune|Municipality
SI-096	Ptuj	SVN	Commune|Municipality
SI-069	Majšperk	SVN	Commune|Municipality
SI-113	Slovenska Bistrica	SVN	Commune|Municipality
SI-168	Markovci	SVN	Commune|Municipality
SI-045	Kidričevo	SVN	Commune|Municipality
SI-024	Dornava	SVN	Commune|Municipality
SI-166	Križevci	SVN	Commune|Municipality
SI-042	Juršinci	SVN	Commune|Municipality
SI-109	Semič	SVN	Commune|Municipality
SI-157	Dolenjske Toplice	SVN	Statistical Region
SI-179	Sodražica	SVN	Commune|Municipality
SI-104	Ribnica	SVN	Commune|Municipality
SI-121	Škocjan	SVN	Commune|Municipality
RS-20	Nišava	SRB	District
RS-13	Pomoravski	SRB	District
RS-12	Šumadija	SRB	District
RS-17	Moravica	SRB	District
RS-09	Kolubara	SRB	District
NO-05	Oppland	NOR	County
MY-14	Kuala Lumpur	MYS	Federal Territory
MY-16	Putrajaya	MYS	Federal Territory
MW-DO	Dowa	MWI	District
MW-BA	Balaka	MWI	District
MW-CR	Chiradzulu	MWI	District
MW-BL	Blantyre	MWI	District
MW-NI	Ntchisi	MWI	District
LT-KU	Kaunas	LTU	County
DO-27	Valverde	DOM	Province
DO-26	Santiago Rodríguez	DOM	Province
DO-13	La Vega	DOM	Province
DO-19	Hermanas Mirabal	DOM	Province
DO-06	Duarte	DOM	Province
DO-25	Santiago	DOM	Province
DO-03	Baoruco	DOM	Province
DO-22	San Juan	DOM	Province
AZ-NX	Nakhchivan	AZE	Municipality
AZ-SUS	Susa	AZE	District
AZ-XCI	Khojali	AZE	District
AZ-X01~	Shusha	AZE	Municipality
AZ-AGM	Agdam	AZE	District
AZ-TAR	Tartar	AZE	District
AZ-GOR	Goranboy	AZE	District
AZ-XVD	Khojavend	AZE	District
AZ-HAC	Hajigabul	AZE	District
AZ-ABS	Absheron	AZE	District
AZ-GYG	Goygol	AZE	District
AZ-KUR	Kurdamir	AZE	District
AZ-ZAR	Zardab	AZE	District
AZ-SAB	Sabirabad	AZE	District
AZ-SR	Şirvan	AZE	Municipality
UG-205	Kamuli	UGA	District
UG-229	Luuka	UGA	District
UG-226	Buyende	UGA	District
UG-204	Jinja	UGA	District
UG-302	Apac	UGA	District
UG-109	Nakasongola	UGA	District
UG-409	Masindi	UGA	District
UG-112	Kayunga	UGA	District
UG-104	Luwero	UGA	County
UG-314	Amolatar	UGA	County
UG-114	Mityana	UGA	County
UG-103	Kiboga	UGA	District
UG-106	Mpigi	UGA	District
UG-119	Butambala	UGA	District
UG-121	Gomba	UGA	District
UG-113	Wakiso	UGA	District
UG-115	Nakaseke	UGA	District
UG-123	Kyankwanzi	UGA	District
UG-213	Kaberamaido	UGA	District
UG-318	Dokolo	UGA	County
UG-415	Kyenjojo	UGA	District
UG-413	Kamwenge	UGA	District
UG-421	Kyegegwa	UGA	District
UG-111	Sembabule	UGA	District
UG-407	Kibaale	UGA	District
UG-107	Mubende	UGA	District
RO-BR	Brăila	ROU	County
RO-IL	Ialomița	ROU	County
QA-US	Umm Salal	QAT	Municipality
PT-18	Viseu	PRT	District
PH-AGS	Agusan del Sur	PHL	Province
PH-BUK	Bukidnon	PHL	Province
PH-NCO	Cotabato	PHL	Province
PH-SCO	South Cotabato	PHL	Province
PE-CUS	Cusco Departament	PER	Department
PE-AYA	Ayacucho	PER	Department
PE-APU	Apurímac	PER	Department
PE-HUV	Huancavelica	PER	Department
PE-SAM	San Martín	PER	Department
PE-HUC	Huanuco	PER	Department
PE-PAS	Pasco	PER	Department
PE-JUN	Junín	PER	Department
PY-2	San Pedro	PRY	Department
PY-5	Caaguazú	PRY	Department
PY-3	Cordillera	PRY	Department
PY-6	Caazapá	PRY	Department
PY-9	Paraguarí	PRY	Department
PY-4	Guairá	PRY	Department
PK-IS	Islamabad Capital Territory	PAK	Capital Territory
NI-MT	Matagalpa	NIC	Department
NI-BO	Boaco	NIC	Department
NI-CO	Chontales	NIC	Department
NI-ES	Estelí	NIC	Department
NI-GR	Granada	NIC	Department
NI-MS	Masaya	NIC	Department
NL-FL	Flevoland	NLD	Province
NL-UT	Utrecht	NLD	Province
MA-05	Fès-méknas-boulmane	MAR	Region
MA-12	Tadla-Azilal	MAR	Region
ME-11	Mojkovac	MNE	Municipality
ME-06	Cetinje	MNE	Municipality
ME-18	Šavnik	MNE	Municipality
ME-09	Kolašin	MNE	Municipality
ME-07	Danilovgrad	MNE	Municipality
MD-CL	Călărași	MDA	District
MD-DR	Drochia	MDA	District
MD-SI	Sîngerei	MDA	District
MD-BA	Bălți	MDA	City
MG-A	Toamasina	MDG	Autonomous Province
LV-094	Valmiera	LVA	Municipality
LV-015	Balvi	LVA	Municipality
LV-096	Valmiera	LVA	Municipality
LV-017	Valmiera	LVA	Municipality
LV-019	Valmiera	LVA	Municipality
LV-045	Valmiera	LVA	Municipality
LV-REZ	Rēzekne	LVA	Municipality
LV-104	Valmiera	LVA	Municipality
LV-076	Valmiera	LVA	Municipality
LV-075	Valmiera	LVA	Municipality
LV-070	Valmiera	LVA	Municipality
LV-048	Krimulda	LVA	Municipality
LV-033	Gulbene	LVA	Municipality
LV-082	Rugāji	LVA	Municipality
LV-039	Valmiera	LVA	Municipality
LV-001	Aglona	LVA	Municipality
LV-078	Riebiņi	LVA	Municipality
LV-109	Viļāni	LVA	Municipality
LV-012	Babīte	LVA	Municipality
LV-031	Garkalne	LVA	Municipality
LV-052	Ķekava	LVA	Municipality
LV-062	Mārupe	LVA	Municipality
LV-068	Olaine	LVA	Municipality
LV-087	Salaspils	LVA	Municipality
LV-095	Stopiņi	LVA	Municipality
LV-090	Sēja	LVA	Municipality
LV-061	Mālpils	LVA	Municipality
LV-091	Sigulda	LVA	Municipality
LV-059	Madona	LVA	Municipality
LV-057	Valmiera	LVA	Municipality
LV-102	Valmiera	LVA	Municipality
LV-008	Valmiera	LVA	Municipality
LV-030	Valmiera	LVA	Municipality
LV-021	Valmiera	LVA	Municipality
LV-067	Ogre	LVA	Municipality
LV-080	Ropaži	LVA	Municipality
LV-035	Ikskile	LVA	Municipality
LV-013	Baldone	LVA	Municipality
LV-051	Ķegums	LVA	Municipality
LV-034	Iecava	LVA	Municipality
LV-072	Pļaviņas	LVA	Municipality
LV-046	Koknese	LVA	Municipality
LV-002	Aizkraukle	LVA	Municipality
LV-092	Skrīveri	LVA	Municipality
LV-053	Lielvārde	LVA	Municipality
LV-038	Jaunjelgava	LVA	Municipality
LV-073	Preiļi	LVA	Municipality
LV-056	Līvāni	LVA	Municipality
LV-103	Vārkava	LVA	Municipality
LV-JKB	Jēkabpils	LVA	Municipality
LV-049	Krustpils	LVA	Municipality
LV-086	Sala	LVA	Municipality
LV-003	Aizpute	LVA	Municipality
LV-050	Kuldīga	LVA	Municipality
LV-006	Alsunga	LVA	Municipality
LV-093	Skrunda	LVA	Municipality
LV-043	Kandava	LVA	Municipality
LV-099	Tukums	LVA	Municipality
LV-026	Dobele	LVA	Municipality
LV-040	Jaunpils	LVA	Municipality
LV-018	Brocēni	LVA	Municipality
LV-069	Ozolnieki	LVA	Municipality
KG-GB	Bishkek	KGZ	Region
KW-FA	Al Farwaniyah	KWT	Province
XK-X17~	Orahovac	KOS	District
XK-X22~	Skenderaj/Srbica	KOS	District
XK-X08~	Klina	KOS	District
XK-X11~	Kosovska Mitrovica	KOS	District
XK-X04~	Glogovac	KOS	District
XK-X14~	Mališevo	KOS	District
KE-110	Nairobi	KEN	National Capital Area
KE-200	Central	KEN	Province
JO-AJ	Ajloun	JOR	Province
JO-JA	Jerash	JOR	Province
JP-10	Gunma Prefecture	JPN	Prefecture
JP-20	Nagano Prefecture	JPN	Prefecture
JP-09	Tochigi Prefecture	JPN	Prefecture
JP-21	Gifu Prefecture	JPN	Prefecture
JP-25	Shiga Prefecture	JPN	Prefecture
JP-11	Saitama Prefecture	JPN	Prefecture
JP-19	Yamanashi Prefecture	JPN	Prefecture
JP-29	Nara Prefecture	JPN	Prefecture
CI-02	Haut-Sassandra	CIV	Department
CI-16	Agnéby	CIV	Department
CI-11	N'zi-Comoé	CIV	Department
CI-12	Marahoué	CIV	Department
CI-18	Fromager	CIV	Region
CI-04	Vallée du Bandama	CIV	Region
CI-07	Lacs	CIV	Department
CI-14	Worodougou	CIV	Region
IE-KE	Kildare	IRL	County
IE-CW	Carlow	IRL	County
IE-LS	Laois	IRL	County
IE-OY	Offaly	IRL	County
IE-WH	Westmeath	IRL	County
IE-LD	Longford	IRL	County
IE-RN	Roscommon	IRL	County
IE-TA	Tipperary	IRL	County
IE-WD	Waterford	IRL	City
IE-LK	Limerick	IRL	City
HN-CM	Comayagua	HND	Department
HN-YO	Yoro	HND	Department
HN-FM	Francisco Morazán	HND	Department
GN-KS	Kissidougou Prefecture	GIN	Prefecture
GN-KE	Kérouané Prefecture	GIN	Prefecture
GN-TE	Télimélé Prefecture	GIN	Prefecture
GN-LE	Lélouma Prefecture	GIN	Prefecture
GN-DL	Dalaba Prefecture	GIN	Prefecture
GN-LA	Labé Prefecture	GIN	Prefecture
GN-PI	Pita Prefecture	GIN	Prefecture
GN-KO	Kouroussa Prefecture	GIN	Prefecture
GN-FR	Fria Prefecture	GIN	Prefecture
GT-CM	Chimaltenango	GTM	Department
GT-SA	Sacatepéquez	GTM	Department
GT-GU	Guatemala	GTM	Department
GT-JA	Jalapa	GTM	Department
GT-PR	El Progreso	GTM	Department
GT-SO	Sololá	GTM	Department
GT-QZ	Quetzaltenango	GTM	Department
GT-BV	Baja Verapaz	GTM	Department
GT-TO	Totonicapán	GTM	Department
GH-AH	Ashanti	GHA	Region
GH-EP	Eastern	GHA	Region
DE-HE	Hesse	DEU	State
DE-TH	Thuringia	DEU	State
DE-ST	Saxony-Anhalt	DEU	State
DE-BE	Berlin	DEU	State
GA-3	Moyen-Ogooué	GAB	Province
EE-70	Rapla	EST	County
EE-51	Järva	EST	County
ER-AN	Anseba	ERI	Region
SV-CU	Cuscatlán	SLV	Department
SV-SS	San Salvador	SLV	Department
EG-C	Cairo	EGY	Governorate
EG-GZ	Giza	EGY	Governorate
EG-MN	Minya	EGY	Governorate
EG-FYM	Faiyum	EGY	Governorate
EG-BNS	Beni Suef	EGY	Governorate
EG-MNF	Monufia	EGY	Governorate
EG-KB	Qalyubia	EGY	Governorate
EG-GH	Gharbia	EGY	Governorate
EG-SHG	Sohag	EGY	Governorate
EG-KN	Qena	EGY	Governorate
EG-AST	Asyut	EGY	Governorate
EC-A	Azuay	ECU	Province
EC-F	Cañar	ECU	Province
EC-N	Napo	ECU	Province
EC-T	Tungurahua	ECU	Province
EC-H	Chimborazo	ECU	Province
EC-B	Bolívar	ECU	Province
EC-I	Imbabura	ECU	Province
EC-X	Cotopaxi	ECU	Province
EC-R	Los Ríos	ECU	Province
EC-P	Pichincha	ECU	Province
EC-SD	Santo Domingo de los Tsáchilas	ECU	Province
DO-28	Monseñor Nouel	DOM	Province
DO-24	Sánchez Ramírez	DOM	Province
DO-31	San José de Ocoa	DOM	Province
DO-29	Monte Plata	DOM	Province
HR-07	Bjelovar-Bilogora	HRV	County
HR-21	Zagreb	HRV	City
CR-SJ	San José	CRI	Province
CR-C	Cartago	CRI	Province
CO-CAQ	Caquetá	COL	Intendancy
CO-HUI	Huila	COL	Department
CO-GUV	Guaviare	COL	Commissiary
CO-CAL	Caldas	COL	Department
CO-CAS	Casanare	COL	Intendancy
CO-MET	Meta	COL	Department
CO-CUN	Bogotá	COL	Federal District
CO-SAN	Santander	COL	Department
CO-TOL	Tolima	COL	Department
CO-QUI	Quindío	COL	Department
CO-RIS	Risaralda	COL	Department
CN-BJ	Beijing	CHN	Municipality
CD-KE	Kasaï-Oriental	COD	Province
CD-MA	Maniema	COD	Province
CN-SC	Sichuan	CHN	Province
CN-CQ	Chongqing	CHN	Municipality
CN-GZ	Guizhou	CHN	Province
CN-HN	Hunan	CHN	Province
CN-NX	Ningxia	CHN	Autonomous Region
CN-SN	Shaanxi	CHN	Province
CN-QH	Qinghai	CHN	Province
CN-SX	Shanxi	CHN	Province
CN-JX	Jiangxi	CHN	Province
CN-HA	Henan	CHN	Province
CN-HB	Hubei	CHN	Province
CN-AH	Anhui	CHN	Province
TD-BG	Bahr el Gazel	TCD	Prefecture
TD-TA	Tandjilé	TCD	Prefecture
TD-LO	Logone Occidental	TCD	Prefecture
TD-GR	Guéra	TCD	Prefecture
TD-BA	Batha	TCD	Prefecture
CM-OU	West	CMR	Province
CM-CE	Centre	CMR	Province
KH-4	Kampong Chhnang	KHM	Province
KH-6	Kampong Thom	KHM	Province
KH-5	Kam	KHM	Province
KH-12	Phnom Penh	KHM	Municipality
BR-GO	Goiás	BRA	State
BR-DF	Federal	BRA	Federal District
BR-MG	Minas Gerais	BRA	State
BR-TO	Tocantins	BRA	State
BW-KW	Kweneng	BWA	District
BW-GA	Gaborone	BWA	City
BW-JW	Jwaneng	BWA	Town
BO-C	Cochabamba	BOL	Department
BT-21	Tsirang	BTN	District
BT-24	Wangdue Phodrang	BTN	District
BT-22	Dagana	BTN	District
BT-23	Punakha	BTN	District
BT-42	Mongar	BTN	District
BT-32	Trongsa	BTN	District
BT-43	Pemagatshel	BTN	District
BY-MI	Minsk	BLR	Municipality
BB-03	Saint George	BRB	Parish
BB-11	Saint Thomas	BRB	Parish
AZ-SAT	Saatly	AZE	District
AZ-BAR	Barda	AZE	District
AZ-SKR	Shamkir	AZE	District
AZ-AGU	Agsu	AZE	District
CF-KB	Nana-Grébizi Economic Prefecture	CAF	Economic Prefecture
AZ-SMI	Shamakhi	AZE	District
AZ-QBA	Quba	AZE	District
AZ-UCA	Ujar	AZE	District
AZ-QOB	Gobustan	AZE	District
AZ-ISM	Ismayilli	AZE	District
AZ-YEV	Yevlakh	AZE	District
AZ-GA	Ganja	AZE	Municipality
AZ-MI	Mingachevir	AZE	Municipality
AZ-GOY	Goychay	AZE	District
AZ-AGS	Agdash	AZE	District
AZ-AGC	Aghjabadi	AZE	District
AU-ACT	Australian Capital Territory	AUS	Territory
AT-9	Vienna	AUT	State
AM-KT	Kotayk	ARM	Province
AM-ER	Yerevan	ARM	City
AR-S	Santa Fe	ARG	Province
AR-T	Tucumán	ARG	Province
AR-G	Santiago del Estero	ARG	Province
AR-D	San Luis	ARG	Province
AR-L	La Pampa	ARG	Province
AR-X	Córdoba	ARG	Province
AO-BIE	Bié	AGO	Province
AO-CNO	Cuanza Norte	AGO	Province
AO-HUI	Huíla	AGO	Province
AO-HUA	Huambo	AGO	Province
DZ-19	Sétif	DZA	Province
DZ-34	Bordj Bou Arréridj	DZA	Province
DZ-10	Bouïra	DZA	Province
DZ-09	Blida	DZA	Province
DZ-38	Tissemsilt	DZA	Province
DZ-44	Aïn Defla	DZA	Province
DZ-48	Relizane	DZA	Province
DZ-32	El Bayadh	DZA	Province
DZ-20	Saïda	DZA	Province
DZ-22	Sidi Bel Abbès	DZA	Province
DZ-29	Mascara	DZA	Province
DZ-47	Ghardaïa	DZA	Province
DZ-03	Laghouat	DZA	Province
DZ-26	Médéa	DZA	Province
DZ-14	Tiaret	DZA	Province
DZ-28	M'Sila	DZA	Province
DZ-05	Batna	DZA	Province
DZ-40	Khenchela	DZA	Province
DZ-24	Guelma	DZA	Province
DZ-25	Constantine	DZA	Province
DZ-43	Mila	DZA	Province
DZ-04	Oum El Bouaghi	DZA	Province
DZ-07	Biskra	DZA	Province
DZ-17	Djelfa	DZA	Province
AL-01	Berat	ALB	County
AF-URU	Urozgan	AFG	Province
AF-GHA	Ghazni	AFG	Province
AF-KAB	Kabul	AFG	Province
AF-LAG	Laghman	AFG	Province
AF-LOG	Logar	AFG	Province
AF-KAP	Kapisa	AFG	Province
AF-WAR	Maidan Wardak	AFG	Province
AF-BAM	Bamyan	AFG	Province
AF-PAR	Parwan	AFG	Province
AF-SAR	Sar-e Pol	AFG	Province
AF-GHO	Ghōr	AFG	Province
AF-BGL	Baghlan	AFG	Province
AF-SAM	Samangan	AFG	Province
GB-CAY	Caerphilly	GBR	Unitary Authority (wales)
GB-RCT	Rhondda Cynon Taf	GBR	Unitary Authority (wales)
GB-BGW	Blaenau Gwent	GBR	Unitary Authority (wales)
UG-321	Oyam	UGA	County
UG-307	Lira	UGA	District
UG-326	Kole	UGA	District
UG-312	Pader	UGA	District
UG-416	Ibanda	UGA	County
UG-304	Gulu	UGA	County
UG-420	Kiryandongo	UGA	District
UG-203	Iganga	UGA	District
UG-124	Lwengo	UGA	District
UG-118	Bukomansimbi	UGA	District
UG-122	Kalungu	UGA	District
UG-102	Kampala	UGA	District
UG-220	Kaliro	UGA	County
UG-322	Agago	UGA	District
UG-306	Kotido	UGA	County
UG-317	Abim	UGA	County
UG-330	Otuke	UGA	District
UG-323	Alebtong	UGA	District
UG-216	Amuria	UGA	District
UG-207	Katakwi	UGA	County
UG-232	Serere	UGA	District
UG-211	Soroti	UGA	District
UG-210	Pallisa	UGA	District
UG-410	Mbarara	UGA	District
UG-116	Lyantonde	UGA	District
UG-105	Masaka	UGA	District
GB-TOF	Torfaen	GBR	Unitary Authority (wales)
GB-MTY	Merthyr Tydfil	GBR	Unitary Authority (wales)
GB-NLK	North Lanarkshire	GBR	Unitary District
GB-EDU	East Dunbartonshire	GBR	Unitary District
GB-GLG	Glasgow	GBR	Unitary District (city)
GB-ERW	East Renfrewshire	GBR	Unitary District
GB-EAY	East Ayrshire	GBR	Unitary District
GB-SLK	South Lanarkshire	GBR	Unitary District
GB-MFT	Magherafelt	GBR	District
GB-OMH	Omagh	GBR	District
GB-CKT	Mid Ulster	GBR	Province
GB-CGV	Craigavon	GBR	District
GB-BNB	Banbridge	GBR	District
GB-ANT	Antrim	GBR	District
GB-LSB	Lisburn	GBR	District
GB-BLY	Ballymoney	GBR	District
GB-BLA	Ballymena	GBR	District
GB-CSR	Castlereagh	GBR	District
GB-WND	Wandsworth	GBR	London Borough
GB-MRT	Merton	GBR	London Borough
GB-WSM	Westminster	GBR	London Borough (city)
GB-KEC	Kensington and Chelsea	GBR	London Borough (royal)
GB-HNS	Hounslow	GBR	London Borough
GB-EAL	Ealing	GBR	London Borough
GB-HMF	Hammersmith and Fulham	GBR	London Borough
GB-STT	Stockton-on-Tees	GBR	Unitary Authority
GB-DAL	Darlington	GBR	Unitary Authority
GB-MDB	Middlesbrough	GBR	Unitary Authority
GB-RIC	Richmond upon Thames	GBR	London Borough
GB-LND	London	GBR	City Corporation
GB-TWH	Tower Hamlets	GBR	London Borough
GB-GAT	Gateshead	GBR	Metropolitan Borough
GB-NET	Newcastle upon Tyne	GBR	Metropolitan Borough
GB-YOR	York	GBR	Unitary Authority
GB-SHN	Merseyside	GBR	Metropolitan Borough
GB-ENF	Enfield	GBR	London Borough
GB-HRT	Hertfordshire	GBR	Administrative County
GB-BNE	Barnet	GBR	London Borough
GB-WFT	Waltham Forest	GBR	London Borough
GB-RDB	Redbridge	GBR	London Borough
GB-HAV	Havering	GBR	London Borough
GB-CAM	Cambridgeshire	GBR	Administrative County
GB-BEX	Bexley	GBR	London Borough
GB-STN	Sutton	GBR	London Borough
GB-MIK	Milton Keynes	GBR	Unitary Authority
GB-BKM	Buckinghamshire	GBR	Administrative County
GB-HIL	Hillingdon	GBR	London Borough
GB-BEN	Brent	GBR	London Borough
GB-LUT	Luton	GBR	Unitary Authority
GB-HRW	Harrow	GBR	London Borough
GB-CBF	Central Bedfordshire	GBR	Unitary Authority
GB-BDF	Bedford	GBR	Unitary Authority
GB-RUT	Rutland	GBR	Unitary Authority
GB-NTT	Nottinghamshire	GBR	Administrative County
GB-NTH	Northamptonshire	GBR	Administrative County
GB-CMD	Camden	GBR	London Borough
GB-ISL	Islington	GBR	London Borough
GB-PTE	Peterborough	GBR	Unitary Authority
GB-LBH	Lambeth	GBR	London Borough
GB-SWK	Southwark	GBR	London Borough
GB-DNC	Doncaster	GBR	Metropolitan Borough
GB-CRY	Croydon	GBR	London Borough
GB-LEW	Lewisham	GBR	London Borough
GB-HRY	Haringey	GBR	London Borough
GB-KTT	Kingston upon Thames	GBR	London Borough (royal)
GB-NWM	Newham	GBR	London Borough
GB-GRE	Greenwich	GBR	London Borough (royal)
GB-HCK	Hackney	GBR	London Borough
GB-BDG	Barking and Dagenham	GBR	London Borough
GB-LEC	Leicestershire	GBR	Kingdom
GB-CHE	Cheshire East	GBR	Unitary Authority
GB-DBY	Derbyshire	GBR	Administrative County
GB-ROT	Rotherham	GBR	Metropolitan Borough
GB-SHF	Sheffield	GBR	Metropolitan Borough
GB-STE	Stoke-on-Trent	GBR	Unitary Authority
GB-TFW	Telford and Wrekin	GBR	Unitary Authority
GB-STS	Staffordshire	GBR	Administrative County
GB-BRY	Bromley	GBR	London Borough
GB-WOR	Worcestershire	GBR	Administrative County
GB-WAR	Warwickshire	GBR	Administrative County
GB-OXF	Oxfordshire	GBR	Administrative County
GB-WGN	Wigan	GBR	Metropolitan Borough
GB-SKP	Stockport	GBR	Metropolitan Borough
GB-WRT	Warrington	GBR	Unitary Authority
GB-WBK	West Berkshire	GBR	Unitary Authority
GB-WOK	Wokingham	GBR	Unitary Authority
GB-BRC	Bracknell Forest	GBR	Unitary Authority
GB-WNM	Windsor and Maidenhead	GBR	Unitary Authority
GB-SLG	Slough	GBR	Unitary Authority
GB-RDG	Reading	GBR	Unitary Authority
GB-SRY	Surrey	GBR	Administrative County
GB-BBD	Blackburn with Darwen	GBR	Unitary Authority
GB-SWD	Swindon	GBR	Unitary Authority
GB-BAS	Bath and North East Somerset	GBR	Unitary Authority
GB-WIL	Wiltshire	GBR	Unitary Single-Tier County
GB-CLD	Calderdale	GBR	Metropolitan Borough
GB-KIR	Kirklees	GBR	Metropolitan Borough
GB-NGM	Nottingham	GBR	Unitary Authority
GB-LCE	Leicester	GBR	Unitary Authority
GB-DER	Derby	GBR	Unitary Authority
UG-108	Mukono	UGA	District
UG-117	Buikwe	UGA	District
UG-311	Nakapiripirit	UGA	District
UG-228	Kween	UGA	District
UG-325	Buhweju	UGA	District
UG-425	Sheema	UGA	District
UG-422	Mitooma	UGA	District
UG-402	Bushenyi	UGA	District
UG-225	Bulambuli	UGA	County
UG-215	Sironko	UGA	County
UG-201	Bugiri	UGA	District
UG-329	Nwoya	UGA	District
UG-209	Mbale	UGA	County
UG-217	Budaka	UGA	County
UG-219	Butaleja	UGA	County
UG-227	Kibuku	UGA	County
UG-328	Napak	UGA	District
UG-208	Kumi	UGA	District
UG-231	Ngora	UGA	District
UG-224	Bukedea	UGA	District
UG-222	Namutumba	UGA	County
TR-43	Kütahya	TUR	Province
TR-42	Konya	TUR	Province
TR-70	Karaman	TUR	Province
TR-51	Niğde	TUR	Province
TR-38	Kayseri	TUR	Province
TR-32	Isparta	TUR	Province
TR-45	Manisa	TUR	Province
TR-20	Denizli	TUR	Province
TR-15	Burdur	TUR	Province
TR-68	Aksaray	TUR	Province
TR-50	Nevşehir	TUR	Province
TR-66	Yozgat	TUR	Province
TR-40	Kırşehir	TUR	Province
TR-64	Uşak	TUR	Province
TR-24	Erzincan	TUR	Province
TR-62	Tunceli	TUR	Province
TR-03	Afyonkarahisar	TUR	Province
TR-71	Kırıkkale	TUR	Province
TR-46	Kahramanmaraş	TUR	Province
TR-49	Muş	TUR	Province
TR-25	Erzurum	TUR	Province
TR-44	Malatya	TUR	Province
TR-23	Elazığ	TUR	Province
TR-13	Bitlis	TUR	Province
TR-12	Bingöl	TUR	Province
NG-AB	Abia State	NGA	State
NG-EB	Ebonyi State	NGA	State
NG-AN	Anambra State	NGA	State
NG-ED	Edo State	NGA	State
NG-BA	Bauchi State	NGA	State
NG-PL	Plateau State	NGA	State
NG-NA	Nasarawa State	NGA	State
NG-GO	Gombe State	NGA	State
NG-EN	Enugu State	NGA	State
NG-KO	Kogi State	NGA	State
NG-OS	Osun State	NGA	State
NG-IM	Imo State	NGA	State
TR-80	Osmaniye	TUR	Province
TR-02	Adıyaman	TUR	Province
TR-21	Diyarbakır	TUR	Province
TR-72	Batman	TUR	Province
TR-56	Siirt	TUR	Province
TR-69	Bayburt	TUR	Province
TR-29	Gümüşhane	TUR	Province
TZ-23	Singida	TZA	Region
TZ-24	Tabora	TZA	Region
TZ-04	Iringa	TZA	Region
TZ-18	Mwanza	TZA	Region
TZ-30	Simiyu	TZA	Region
TZ-27	Geita	TZA	Region
TZ-22	Shinyanga	TZA	Region
LK-91	Ratnapura	LKA	District
LK-82	Monaragala	LKA	District
LK-92	Kegalle	LKA	District
LK-81	Badulla	LKA	District
LK-22	Matale	LKA	District
LK-72	Polonnaruwa	LKA	District
LK-61	Kurunegala	LKA	District
LK-71	Anuradhapura	LKA	District
LK-23	Nuwara Eliya	LKA	District
LK-44	Vavuniya	LKA	District
LK-21	Kandy	LKA	District
SO-BY	Bay	SOM	Region
RU-BA	Bashkortostan	RUS	Republic
RU-SVE	Sverdlovsk	RUS	Region
RU-KHM	Khanty-Mansi Autonomous Okrug	RUS	Autonomous Province
RU-LIP	Lipetsk	RUS	Region
RU-TAM	Tambov	RUS	Region
RU-TOM	Tomsk	RUS	Region
RU-TA	Republic of Tatarstan	RUS	Republic
RU-ULY	Ulyanovsk	RUS	Region
RU-PNZ	Penza	RUS	Region
RU-KEM	Kemerovo	RUS	Region
RU-ORL	Oryol	RUS	Region
RU-IRK	Irkutsk	RUS	Region
RU-KK	Republic of Khakassia	RUS	Republic
RU-MO	Republic of Mordovia	RUS	Republic
RU-KLU	Kaluga	RUS	Region
RU-KOS	Kostroma	RUS	Region
RU-YAR	Yaroslavl	RUS	Region
RU-VLA	Vladimir	RUS	Region
RU-RYA	Ryazan	RUS	Region
RU-IVA	Ivanovo	RUS	Region
RU-NIZ	Nizhny Novgorod	RUS	Region
RU-TUL	Tula	RUS	Region
KR-11	Seoul	KOR	Capital Metropolitan City
KR-30	Daejeon	KOR	Metropolitan City
KR-50	Sejong	KOR	Special self-governing city
KR-43	North Chungcheong	KOR	Province
KR-29	Gwangju	KOR	Metropolitan City
KR-27	Daegu	KOR	Metropolitan City
RU-CU	Chuvash Republic	RUS	Republic
RU-VLG	Vologda	RUS	Region
RU-NGR	Novgorod	RUS	Region
RU-TVE	Tver	RUS	Region
RU-MOW	Moscow	RUS	Region
RU-MOS	Moscow	RUS	Federal City
RU-ME	Mari El Republic	RUS	Republic
RU-KIR	Kirov	RUS	Region
RU-UD	Udmurt Republic	RUS	Republic
RU-KO	Komi Republic	RUS	Republic
RU-PER	Perm Krai	RUS	Territory
RU-SAM	Samara	RUS	Region
RU-STA	Stavropol Krai	RUS	Territory
RU-AD	Republic of Adygea	RUS	Republic
PL-MZ	Masovian Voivodeship	POL	Voivodeship|Province
PL-LD	Łódź Voivodeship	POL	Voivodeship|Province
PL-KP	Kuyavian-Pomeranian Voivodeship	POL	Voivodeship|Province
PL-WP	Greater Poland Voivodeship	POL	Voivodeship|Province
PL-SK	Świętokrzyskie Voivodeship	POL	Voivodeship|Province
PH-NUE	Nueva Ecija	PHL	Province
PH-LAG	Laguna	PHL	Province
PH-RIZ	Rizal	PHL	Province
PH-QUI	Quirino	PHL	Province
PH-NUV	Nueva Vizcaya	PHL	Province
PH-BEN	Benguet	PHL	Province
PH-IFU	Ifugao	PHL	Province
PH-MOU	Mountain	PHL	Province
PH-TAR	Tarlac	PHL	Province
PH-APA	Apayao	PHL	Province
PH-KAL	Kalinga	PHL	Province
PH-ABR	Abra	PHL	Province
OM-DA	Ad Dakhiliyah	OMN	Region
NG-EK	Ekiti State	NGA	State
NG-KD	Kaduna State	NGA	State
NG-KN	Kano State	NGA	State
NG-FC	Federal Capital Territory	NGA	State
KP-01	Pyongyang	PRK	Special City
NA-KH	Khomas	NAM	Region
NA-ON	Oshana	NAM	Region
NA-OT	Oshikoto	NAM	Region
MN-037	Darkhan-Uul	MNG	Municipality
MN-047	Töv	MNG	Province
MN-073	Arkhangai	MNG	Province
MN-035	Orkhon	MNG	Municipality
MN-059	Dundgovi	MNG	Province
MN-055	Övörkhangai	MNG	Province
MN-064	Govisümber	MNG	Municipality
MX-MEX	State of Mexico	MEX	State
MX-PUE	Puebla	MEX	State
MX-MOR	Morelos	MEX	State
MX-QUE	Querétaro	MEX	State
MX-HID	Hidalgo	MEX	State
MX-GUA	Guanajuato	MEX	State
MX-SLP	San Luis Potosí	MEX	State
MX-ZAC	Zacatecas	MEX	State
MX-AGU	Aguascalientes	MEX	State
MX-DUR	Durango	MEX	State
MN-1	Ulaanbaatar	MNG	Municipality
MX-TLA	Tlaxcala	MEX	State
MX-DIF	Mexico	MEX	Federal District
MR-09	Tagant	MRT	Region
MK-30	Želino	MKD	Statistical Region
MK-08	Brvenica	MKD	Statistical Region
MK-52	Makedonski Brod	MKD	Statistical Region
MK-57	Oslomej	MKD	Statistical Region
MK-70	Sopište	MKD	Statistical Region
MK-38	Karpoš	MKD	Municipality
MK-84	Šuto Orizari	MKD	Municipality
MK-09	Butel	MKD	Municipality
MK-79	Čair	MKD	Municipality
MK-77	Centar	MKD	Municipality
MK-31	Zajas	MKD	Statistical Region
MK-27	Dolneni	MKD	Statistical Region
MK-45	Krivogaštani	MKD	Statistical Region
MK-53	Mogila	MKD	Statistical Region
MK-80	Čaška	MKD	Statistical Region
MK-67	Rosoman	MKD	Statistical Region
MK-54	Negotino	MKD	Statistical Region
MK-28	Drugovo	MKD	Statistical Region
MK-17	Gazi Baba	MKD	Municipality
MK-46	Kruševo	MKD	Statistical Region
MK-25	Demir Hisar	MKD	Statistical Region
MK-01	Aerodrom	MKD	Municipality
MK-74	Studeničani	MKD	Statistical Region
MK-39	Kisela Voda	MKD	Municipality
MK-63	Probištip	MKD	Statistical Region
MK-81	Češinovo-Obleševo	MKD	Statistical Region
MK-02	Aračinovo	MKD	Statistical Region
MK-32	Zelenikovo	MKD	Statistical Region
MK-40	Kičevo	MKD	Statistical Region
MK-61	Plasnica	MKD	Statistical Region
MK-15	Vraneštica	MKD	Statistical Region
MK-85	Skopje	MKD	Statistical Region
MK-49	Lozovo	MKD	Statistical Region
MK-69	Sveti Nikole	MKD	Statistical Region
MK-20	Gradsko	MKD	Statistical Region
MK-43	Kratovo	MKD	Statistical Region
MK-34	Ilinden	MKD	Statistical Region
MK-37	Karbinci	MKD	Statistical Region
MK-83	Štip	MKD	Statistical Region
MK-42	Kočani	MKD	Statistical Region
MK-33	Zrnovci	MKD	Statistical Region
MK-13	Veles	MKD	Statistical Region
MK-24	Demir Kapija	MKD	Statistical Region
MK-14	Vinica	MKD	Statistical Region
MK-07	Bosilovo	MKD	Statistical Region
MK-64	Radoviš	MKD	Statistical Region
MK-11	Vasilevo	MKD	Statistical Region
MK-41	Konče	MKD	Statistical Region
LY-JI	Jafara	LBY	Municipality|Governarate
LY-MZ	Mizdah	LBY	Municipality|Governarate
LY-JU	Jufra	LBY	Municipality|Governarate
LY-SB	Sabha	LBY	Municipality|Governarate
LY-WD	Wadi al Hayaa	LBY	Municipality|Governarate
KZ-AKM	Akmola	KAZ	Region
KZ-KAR	Karaganda	KAZ	Region
IQ-BG	Baghdad	IRQ	Province
IQ-BB	Babylon	IRQ	Province
IQ-QA	Al-Qādisiyyah	IRQ	Province
IQ-DQ	Dhi Qar	IRQ	Province
IQ-KA	Karbala	IRQ	Province
IR-22	Markazi	IRN	Province
IR-04	Isfahan	IRN	Province
IR-08	Chaharmahal and Bakhtiari	IRN	Province
IR-18	Kohgiluyeh and Boyer-Ahmad	IRN	Province
IR-14	Fars	IRN	Province
IR-15	Kerman	IRN	Province
IR-24	Hamadan	IRN	Province
IR-20	Lorestan	IRN	Province
IR-25	Yazd	IRN	Province
IR-26	Qom	IRN	Province
IR-07	Tehran	IRN	Province
IN-CT	Chhattisgarh	IND	State
IN-HR	Haryana	IND	State
IN-TG	Telangana	IND	State
HU-JN	Jász-Nagykun-Szolnok	HUN	County
HU-FE	Fejér	HUN	County
HU-VE	Veszprém	HUN	County
HU-TO	Tolna	HUN	County
HU-SK	Szolnok	HUN	Urban county
HU-BU	Budapest	HUN	Capital City
HU-ED	Érd	HUN	Urban county
HU-HE	Heves	HUN	County
HU-EG	Eger	HUN	Urban county
HU-MI	Miskolc	HUN	Urban county
HU-HV	Hódmezővásárhely	HUN	Urban county
HU-DU	Dunaújváros	HUN	Urban county
HU-KM	Kecskemét	HUN	Urban county
HU-TB	Tatabánya	HUN	Urban county
GE-TB	Tbilisi	GEO	Independent City
GE-IM	Imereti	GEO	Region
FI-15	Northern Savonia	FIN	Province
FI-04	Southern Savonia	FIN	Province
FI-08	Central Finland	FIN	Province
FI-03	Southern Ostrobothnia	FIN	Province
FI-11	Pirkanmaa	FIN	Region
FI-06	Tavastia Proper	FIN	Region
FI-16	Päijänne Tavastia	FIN	Province
ET-DD	Dire Dawa	ETH	Administrative State
ET-AA	Addis Ababa	ETH	Administrative State
ET-HA	Harari	ETH	Administrative State
BI-GI	Gitega	BDI	Province
BI-MU	Muramvya	BDI	Province
BI-MW	Mwaro	BDI	Province
BI-KR	Karuzi	BDI	Province
BF-BAL	Balé	BFA	Province
BF-SNG	Sanguié	BFA	Province
BF-TUI	Tuy	BFA	Province
BF-BGR	Bougouriba	BFA	Province
BF-MOU	Mouhoun	BFA	Province
BF-KOT	Kouritenga	BFA	Province
BF-GAN	Ganzourgou	BFA	Province
BF-ZOU	Zoundwéogo	BFA	Province
BF-ZIR	Ziro	BFA	Province
BF-BLK	Boulkiemdé	BFA	Province
BF-KAD	Kadiogo	BFA	Province
BF-OUB	Oubritenga	BFA	Province
BF-GOU	Gourma	BFA	Province
BF-GNA	Gnagna	BFA	Province
BF-BAZ	Bazèga	BFA	Province
BF-KOW	Kourwéogo	BFA	Province
BF-NAY	Nayala	BFA	Province
BF-PAS	Passoré	BFA	Province
BF-ZON	Zondoma	BFA	Province
BF-NAM	Namentenga	BFA	Province
BF-SMT	Sanmatenga	BFA	Province
BF-BAM	Bam	BFA	Province
MM-03	Magway	MMR	Division
MM-04	Mandalay	MMR	Division
BG-16	Plovdiv	BGR	Province
BG-24	Stara Zagora	BGR	Province
BG-20	Sliven	BGR	Province
BG-27	Shumen	BGR	Province
BG-17	Razgrad	BGR	Province
BG-25	Targovishte	BGR	Province
BG-07	Gabrovo	BGR	Province
BG-13	Pazardzhik	BGR	Province
BG-11	Lovech	BGR	Province
BG-22	Sofia	BGR	Province
RW-01	Kigali	RWA	Province
YE-SA	Sanaa	YEM	Governorate
US-WI	Wisconsin	USA	State
US-IL	Illinois	USA	State
US-KY	Kentucky	USA	State
US-AR	Arkansas	USA	State
US-TN	Tennessee	USA	State
US-WV	West Virginia	USA	State
US-IN	Indiana	USA	State
CZ-VY	Vysočina	CZE	Region
CZ-ST	Central Bohemian	CZE	Region
CZ-PR	Prague	CZE	Region
BY-HM	Minsk	BLR	Region
UA-30	Kyiv	UKR	Municipality
UZ-TK	Tashkent	UZB	Region
KZ-AST	Nur-Sultan	KAZ	City
AZ-XA	Stepanakert	AZE	District
SY-DI	Damascus	SYR	Province
RO-B	Bucharest	ROU	City
NE-8	Niamey	NER	Capital District
ML-BKO	Bamako	MLI	District
AD-07	Andorra la Vella	AND	\N
HU-GY	Győr	HUN	Urban county
HU-SH	Szombathely	HUN	Urban county
HU-ZE	Zalaegerszeg	HUN	Urban county
HU-NK	Nagykanizsa	HUN	Urban county
HU-VM	Veszprém	HUN	Urban county
HU-KV	Kaposvár	HUN	Urban county
HU-PS	Pécs	HUN	Urban county
HU-SS	Szekszárd	HUN	Urban county
HU-SF	Székesfehérvár	HUN	Urban county
HU-BC	Békéscsaba	HUN	Urban county
HU-DE	Debrecen	HUN	Urban county
HU-NY	Nyíregyháza	HUN	Urban county
NR-07	Buada	NRU	\N
CV-SS	São Salvador do Mundo	CPV	\N
CV-SO	São Lourenço dos Órgãos	CPV	\N
AI-X03~	George Hill	AIA	District
AI-X12~	The Quarter	AIA	District
BM-SG	St. George	BMU	\N
HK-X08~	Wong Tai Sin District	HKG	\N
MU-MO	Moka	MUS	District
MU-PW	Plaines Wilhems	MUS	District
MU-BR	Beau Bassin-Rose Hill	MUS	City
MU-QB	Quatre Bornes	MUS	City
MU-VP	Vacoas-Phoenix	MUS	City
MU-CU	Curepipe	MUS	City
SC-17	Mont Buxton	SYC	\N
SC-22	Saint Louis	SYC	\N
SC-24	Les Mamelles	SYC	\N
IT-EN	Enna	ITA	Province
IT-BN	Benevento	ITA	Province
IT-AT	Asti	ITA	Province
IT-BG	Bergamo	ITA	Province
IT-BS	Brescia	ITA	Province
IT-CR	Cremona	ITA	Province
IT-MN	Mantua	ITA	Province
IT-MI	Milan	ITA	Province
IT-LC	Lecco	ITA	Province
IT-MB	Monza and Brianza	ITA	Province
IT-LO	Lodi	ITA	Province
IT-SI	Siena	ITA	Province
IT-AR	Arezzo	ITA	Province
IT-FI	Florence	ITA	Province
IT-VC	Vercelli	ITA	Province
IT-PV	Pavia	ITA	Province
IT-RI	Rieti	ITA	Province
IT-NO	Novara	ITA	Province
IT-AL	Alessandria	ITA	Province
IT-TN	Trentino	ITA	Province
IT-VI	Vicenza	ITA	Province
IT-VR	Verona	ITA	Province
IT-TV	Treviso	ITA	Province
IT-PC	Piacenza	ITA	Province
IT-PR	Parma	ITA	Province
IT-RE	Reggio Emilia	ITA	Province
IT-MO	Modena	ITA	Province
IT-BO	Bologna	ITA	Province
IT-PT	Pistoia	ITA	Province
IT-TR	Terni	ITA	Province
IT-PG	Perugia	ITA	Province
IT-FR	Frosinone	ITA	Province
IT-AV	Avellino	ITA	Province
IT-AQ	L'Aquila	ITA	Province
IT-PN	Pordenone	ITA	Province
IT-IS	Isernia	ITA	Province
IT-BI	Biella	ITA	Province
IT-PO	Prato	ITA	Province
FR-32	Gers	FRA	Metropolitan department
FR-87	Haute-Vienne	FRA	Metropolitan department
FR-19	Corrèze	FRA	Metropolitan department
FR-82	Tarn-et-Garonne	FRA	Metropolitan department
FR-81	Tarn	FRA	Metropolitan department
FR-38	Isère	FRA	Metropolitan department
FR-26	Drôme	FRA	Metropolitan department
FR-12	Aveyron	FRA	Metropolitan department
FR-46	Lot	FRA	Metropolitan department
FR-37	Indre-et-Loire	FRA	Metropolitan department
FR-36	Indre	FRA	Metropolitan department
FR-41	Loir-et-Cher	FRA	Metropolitan department
FR-23	Creuse	FRA	Metropolitan department
FR-53	Mayenne	FRA	Metropolitan department
FR-72	Sarthe	FRA	Metropolitan department
FR-84	Vaucluse	FRA	Metropolitan department
FR-52	Haute-Marne	FRA	Metropolitan department
FR-51	Marne	FRA	Metropolitan department
FR-24	Dordogne	FRA	Metropolitan department
FR-69	Rhône	FRA	Metropolitan department
FR-88	Vosges	FRA	Metropolitan department
FR-07	Ardèche	FRA	Metropolitan department
FR-42	Loire	FRA	Metropolitan department
FR-63	Puy-de-Dôme	FRA	Metropolitan department
FR-03	Allier	FRA	Metropolitan department
FR-45	Loiret	FRA	Metropolitan department
FR-49	Maine-et-Loire	FRA	Metropolitan department
FR-10	Aube	FRA	Metropolitan department
FR-75	Paris	FRA	Metropolitan department
FR-92	Hauts-de-Seine	FRA	Metropolitan department
FR-93	Seine-Saint-Denis	FRA	Metropolitan department
FR-95	Val-d'Oise	FRA	Metropolitan department
FR-78	Yvelines	FRA	Metropolitan department
FR-16	Charente	FRA	Metropolitan department
FR-18	Cher	FRA	Metropolitan department
FR-28	Eure-et-Loir	FRA	Metropolitan department
FR-43	Haute-Loire	FRA	Metropolitan department
FR-15	Cantal	FRA	Metropolitan department
FR-47	Lot-et-Garonne	FRA	Metropolitan department
FR-48	Lozère	FRA	Metropolitan department
FR-58	Nièvre	FRA	Metropolitan department
FR-21	Côte-d’Or	FRA	Metropolitan department
FR-60	Oise	FRA	Metropolitan department
FR-61	Orne	FRA	Metropolitan department
FR-70	Haute-Saône	FRA	Metropolitan department
FR-71	Saône-et-Loire	FRA	Metropolitan department
FR-79	Deux-Sèvres	FRA	Metropolitan department
FR-86	Vienne	FRA	Metropolitan department
FR-89	Yonne	FRA	Metropolitan department
FR-91	Essonne	FRA	Metropolitan department
FR-77	Seine-et-Marne	FRA	Metropolitan department
FR-94	Val-de-Marne	FRA	Metropolitan department
TJ-DU	Dushanbe	TJK	Independent City
EG-LX	Luxor	EGY	Governorate
BW-FR	Francistown	BWA	City
BW-LO	Lobatse	BWA	Town
BW-SP	Selebi-Phikwe	BWA	Town
BW-ST	Sowa	BWA	Township
PH-MNL	Mandaluyong	PHL	Province
AZ-NA	Naftalan	AZE	Municipality
GB-LDS	Leeds	GBR	Metropolitan Borough
GB-BRD	Bradford	GBR	Metropolitan Borough
GB-WKF	Wakefield	GBR	Metropolitan Borough
GB-BNS	Barnsley	GBR	Metropolitan Borough
GB-SLF	Salford	GBR	Metropolitan Borough
GB-BOL	Bolton	GBR	Metropolitan Borough
GB-TRF	Trafford	GBR	Metropolitan Borough
GB-MAN	Manchester	GBR	Metropolitan Borough
GB-OLD	Oldham	GBR	Metropolitan Borough
GB-RCH	Rochdale	GBR	Metropolitan Borough
GB-TAM	Tameside	GBR	Metropolitan Borough
GB-BUR	Bury	GBR	Metropolitan Borough
GB-SOL	Solihull	GBR	Metropolitan Borough
GB-COV	Coventry	GBR	Metropolitan Borough
GB-BIR	Birmingham	GBR	Metropolitan Borough
GB-SAW	Sandwell	GBR	Metropolitan Borough
GB-DUD	Dudley	GBR	Metropolitan Borough
GB-WLL	Walsall	GBR	Metropolitan Borough
GB-WLV	Wolverhampton	GBR	Metropolitan Borough
LV-028	Durbe	LVA	Municipality
LV-037	Inčukalns	LVA	Municipality
LV-011	Ādaži	LVA	Municipality
LV-VMR	Valmiera	LVA	Republican City
LV-022	Cēsis	LVA	Municipality
LV-055	Valmiera	LVA	Municipality
ES-P	Palencia	ESP	Autonomous Community
ES-CR	Ciudad Real	ESP	Autonomous Community
ES-CO	Córdoba	ESP	Autonomous Community
ES-GU	Guadalajara	ESP	Autonomous Community
ES-J	Jaén	ESP	Autonomous Community
ES-M	Community of Madrid	ESP	Autonomous Community
ES-SG	Segovia	ESP	Autonomous Community
ES-VA	Valladolid	ESP	Autonomous Community
XK-X25~	Suva Reka	KOS	District
XK-X26~	Uroševac/ferizaj	KOS	District
XK-X15~	Novo Brdo	KOS	District
XK-X16~	Obiliq	KOS	District
XK-X09~	Kosovo Polje	KOS	District
XK-X13~	Lipljan	KOS	District
XK-X23~	Štimlje	KOS	District
XK-X28~	Vučitrn	KOS	District
MT-45	Victoria	MLT	\N
MT-10	Fontana	MLT	\N
MT-62	Xewkija	MLT	\N
MT-32	Mosta	MLT	\N
MT-24	Lija	MLT	\N
MT-01	Attard	MLT	\N
MT-35	Mtarfa	MLT	\N
MT-29	Mdina	MLT	\N
MT-66	Żebbuġ Gozo	MLT	\N
MT-43	Qormi	MLT	\N
MT-57	Swieqi	MLT	\N
MT-15	Għargħur	MLT	\N
MT-49	San Ġwann	MLT	\N
MT-19	Iklin	MLT	\N
MT-04	Birkirkara	MLT	\N
MT-02	Balzan	MLT	\N
MT-54	Santa Venera	MLT	\N
MT-18	Ħamrun	MLT	\N
MT-26	Marsa	MLT	\N
MT-25	Luqa	MLT	\N
MT-33	Mqabba	MLT	\N
MT-23	Kirkop	MLT	\N
MT-47	Safi	MLT	\N
MT-17	Għaxaq	MLT	\N
MT-67	Żejtun	MLT	\N
MT-08	Fgura	MLT	\N
MT-59	Tarxien	MLT	\N
MT-53	Santa Luċija	MLT	\N
MT-11	Gudja	MLT	\N
MT-39	Paola	MLT	\N
MT-12	Gżira	MLT	\N
MT-09	Floriana	MLT	\N
MT-58	Ta' Xbiex	MLT	\N
MT-20	Senglea	MLT	\N
MT-06	Cospicua	MLT	\N
MT-41	Pietà	MLT	\N
MT-34	Msida	MLT	\N
MT-03	Birgu	MLT	\N
\.


--
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sector (sector_code, sector_name, sector_note) FROM stdin;
NAICS 11	Agriculture, Forestry, Fishing and Hunting	North American Industry Classification System
NAICS 21	Mining, Quarrying, and Oil and Gas Extraction	North American Industry Classification System
NAICS 22	Utilities	North American Industry Classification System
NAICS 23	Construction	North American Industry Classification System
NAICS 31-33	Manufacturing	North American Industry Classification System
NAICS 42	Wholesale Trade	North American Industry Classification System
NAICS 44-45	Retail Trade	North American Industry Classification System
NAICS 48-49	Transportation and Warehousing	North American Industry Classification System
NAICS 51	Information	North American Industry Classification System
NAICS 52	Finance and Insurance	North American Industry Classification System
NAICS 53	Real Estate and Rental and Leasing	North American Industry Classification System
NAICS 54	Professional, Scientific, and Technical Services	North American Industry Classification System
NAICS 55	Management of Companies and Enterprises	North American Industry Classification System
NAICS 56	Administrative and Support and Waste Management and Remediation Services	North American Industry Classification System
NAICS 61	Educational Services	North American Industry Classification System
NAICS 62	Health Care and Social Assistance	North American Industry Classification System
NAICS 71	Arts, Entertainment, and Recreation	North American Industry Classification System
NAICS 72	Accommodation and Food Services	North American Industry Classification System
NAICS 81	Other Services (except Public Administration)	North American Industry Classification System
NAICS 92	Public Administration	North American Industry Classification System
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (source_uri, source_title, source_date, source_note, source_belief, source_creator) FROM stdin;
https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	Costo económico del uso de agua desalada en la minería chilena	2017	\N	\N	\N
https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57906	Oficio No 213/2017 de la Comisión de Minería y Energía de la Cámara de Diputados	2017	\N	\N	\N
https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	Abastecimiento de agua para la agricultura en la costa	\N	\N	\N	\N
https://www.bbc.com/news/business-17423097	War for water in Chile's Atacama Desert: Vines or mines?	2012	\N	\N	\N
https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	Tarifas vigentes para lecturas leidas desde el 31 de julio 2018	2018	\N	\N	\N
https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	Resolución Administrativa nro. 034-2019-ANA-AAA I C-O/ALA-MOQ	2019	\N	\N	\N
https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	Importancia de la valoración del agua en las actividades económicas	2018	\N	\N	\N
https://www.oecd.org/centrodemexico/medios/049dolarespormetrocubicodeaguapaganlosmexicanos.htm	0.49 dólares por metro cúbico de agua pagan los mexicanos	2010	\N	\N	\N
https://books.google.ca/books?id=tMozIyKETkYC&pg=PA66&lpg=PA66&dq=market+price+water+mexico&source=bl&ots=Jd6OJn1NVs&sig=ACfU3U0FExeKYfHUJQPsXRIHXNOlujGnFA&hl=es-419&sa=X&ved=2ahUKEwjb4M-ay7bpAhXFl54KHfqPAwYQ6AEwEXoECAwQAQ#v=onepage&q=market%20price%20water%20mexico&f=false	OECD Environmental Performance Reviews: Mexico	2013	\N	\N	\N
http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	Tarifas de agua potable y saneamiento para uso doméstico tipo residencial (2020)	2021	\N	\N	\N
http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	Tarifas domésticas de agua potable, saneamiento e impuestos asociados al servicio en algunas ciudades del mundo, 2015.	2015	\N	\N	\N
http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	Tarifas de agua para los tres usos en algunas ciudades, 2020	2021	\N	\N	\N
https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	Water and Wastewater Annual Price Escalation Rates for Selected Cities across the United States	2017	\N	\N	\N
https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	Water Entitlement Market Prices – Summary Report, December 2018	2019	\N	\N	\N
https://www.oecd.org/eu/45015101.pdf	Agricultural Water Pricing: EU and Mexico	2010	\N	\N	\N
https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	Water Prices in Australia	\N	\N	\N	\N
https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	Residential water prices	2021	\N	\N	\N
https://www.sciencedirect.com/science/article/pii/S2212428421000062	Dynamic water pricing and the risk adjusted user cost (RAUC)	2021	\N	\N	\N
https://doi.org/10.1787/9789264307674-en	Multi-dimensional Review of Thailand (Volume 2)	2019	\N	\N	\N
https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	Water - The right price can encourage efficiency and investment	\N	\N	\N	\N
https://doi.org/10.1787/19964064	Environment at a Glance	2015	\N	\N	\N
https://doi.org/10.1787/22245081	Sustainable Management of Water Resources in Agriculture	2010	\N	\N	\N
https://doi.org/10.1787/eco_surveys-chn-2013-en	OECD Economic Surveys: China 2013	2013	\N	\N	\N
https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	Agricultural Policies in Costa Rica	2017	\N	\N	\N
https://vancouver.ca/home-property-development/metered-rates.aspx	Metered utility rates for water, sewer, and energy	\N	\N	\N	\N
DOI: 10.1007/978-3-319-42806-2_11	Water Pricing in Canada	2017	\N	\N	\N
https://www.comoxvalleyrd.ca/services/water/water-metering-rates	Water Metering & Rates	2022	\N	\N	\N
https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	2020 Water Rates & Fees	2020	\N	\N	\N
https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	Water in Asian Cities: Utilities' Performance and Civil Society Views	2004	\N	\N	\N
https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	Urban Water Supply and Sanitation in Southeast Asia: A Guide to Good Practice	2014	\N	\N	\N
https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	Water Tariffing: What's at stake?	2020	\N	\N	\N
http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	Water Tariffs English	2021	\N	\N	\N
https://www.mdpi.com/2073-4441/7/4/1456	Urban Water Tariffs in Spain: What Needs to Be Done?	2015	\N	\N	\N
https://doi.org/10.1080/07900627.2014.907734	Domestic water access and pricing in urban areas of Mozambique: between equity and cost recovery for the provision of a vital resource	2014	\N	\N	\N
https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	International Statistics for Water Services: Information every water manager should know	2014	\N	\N	\N
doi:10.5923/j.env.20130302.05	Review of Saudi Arabia Municipal Water Tariff	\N	\N	\N	\N
http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	Residential Water Metering in Metro Vancouver: Best Practices Guide for Local Governments	2019	\N	\N	\N
https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	The role of water pricing and water allocation in agriculture in delivering sustainable water use in Europe - FINAL REPORT	2012	\N	\N	\N
https://doi.org/10.1093/acrefore/9780190632366.013.246	Water Tariffs in Spainfree	2020	\N	\N	\N
https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	Utilities	2017	\N	\N	\N
https://tariffs.ib-net.org/sites	International Benchmarking Network for Water and Sanitation Utilities (IBNET)	\N	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	PLACEHOLDER TITLE	\N	\N	\N	\N
https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	PLACEHOLDER TITLE	\N	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	PLACEHOLDER TITLE	\N	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	PLACEHOLDER TITLE	\N	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	PLACEHOLDER TITLE	\N	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	PLACEHOLDER TITLE	\N	\N	\N	\N
https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	PLACEHOLDER TITLE	\N	\N	\N	\N
https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	PLACEHOLDER TITLE	\N	\N	\N	\N
https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	PLACEHOLDER TITLE	\N	\N	\N	\N
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (type_id, type_name, type_desc) FROM stdin;
TRA	Transactional price	Prices listed explicitly in contracts which show the price paid by users for water
REG	Regulatory price	Prices set by governments to regulate individual or corporate water use, including pre-determined compensatory damages for anticipated environmental impacts
ENV	Environmental value	Values derived from the set price of environmental goods which rely on water
DER	Derived value	Values derived from the value of goods produced by corporate or individual water users
\.


--
-- Data for Name: value_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.value_price (field1, vp_num, curr_code, vp_usd, vp_date, vp_wtrunit, type_id, sector_code, source_uri, region_code, nat_code, vp_wtrtrt) FROM stdin;
\N	2.0	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	AUS	Desalination
\N	0.27	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Desalination
\N	0.6	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Desalination
\N	1.09	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	9.48	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	DNK	Desalination
\N	3.85	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	DNK	\N
\N	9.8	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	DNK	\N
\N	4.09	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	DNK	\N
\N	16.13	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Non-Flourated Drinking Water
\N	3.87	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Flourated Drinking Water
\N	20.0	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Flourated Drinking Water
\N	42.77	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Flourated Drinking Water
\N	1.06	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	GH-AA	GHA	Non-Flourated Drinking Water
\N	0.18	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Flourated Drinking Water
\N	0.2	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Flourated Drinking Water
\N	0.24	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Flourated Drinking Water
\N	0.25	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.26	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	0.13	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	0.1	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	0.21	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	0.21	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	0.15	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	0.25	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	0.25	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	Desalination
\N	0.18	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-AA	ETH	\N
\N	1.95	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-SA	AUS	\N
\N	3.01	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-SA	AUS	Drinking water
\N	27.32	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-AGU	MEX	\N
\N	40.71	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-AGU	MEX	\N
\N	52.33	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-AGU	MEX	Drinking Water
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking Water
\N	0.24	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking water
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.24	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking Water
\N	0.25	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking Water
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking Water
\N	0.24	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking Water
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.9024	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	RO-AB	ROU	Domestic use
\N	0.01	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-A	ESP	Domestic use
\N	2.56	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-A	ESP	Domestic use
\N	2.59	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic use
\N	2.64	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic use
\N	1.76	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic use
\N	1.79	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic use
\N	1.58	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic use
\N	1.61	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic use
\N	0.73	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Domestic use
\N	0.68	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Domestic use
\N	0.67	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Domestic use
\N	0.36	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.15	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.36	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.15	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.36	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.15	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ALA	KAZ	Domestic use
\N	0.2	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.2	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.2	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Domestic use
\N	0.42	USD	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	MEX	Domestic use
\N	0.2	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Domestic use
\N	0.23	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Domestic use
\N	0.24	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Domestic use
\N	0.1	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Domestic use
\N	0.1	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Drinking water, sanitation, taxes
\N	0.1	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Drinking water, sanitation, taxes
\N	4.53	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	NLD	Drinking water, sanitation, taxes
\N	2.28	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	NLD	Drinking water, sanitation, taxes
\N	0.28	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water, sanitation, taxes
\N	0.34	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water, sanitation, taxes
\N	0.28	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water, sanitation, taxes
\N	0.29	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water, sanitation, taxes
\N	0.28	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water, sanitation, taxes
\N	0.29	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water, sanitation, taxes
\N	2.1	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	BEL	Drinking water, sanitation, taxes
\N	4.29	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	BE-VAN	BEL	Drinking water, sanitation, taxes
\N	0.27	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking water, sanitation, taxes
\N	0.27	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking water, sanitation, taxes
\N	0.27	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Drinking water, sanitation, taxes
\N	1.24	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	1.09	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	2.85	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	2.5	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	4.34	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	3.81	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	0.56	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	0.8	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	0.91	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	0.8993	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	RO-AR	ROU	Commercial use
\N	0.46	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	0.57	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	0.7	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	2.0	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	1.58	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	3.98	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	3.15	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	6.93	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	5.48	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Commercial use
\N	0.23	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.33	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.36	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.58	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.61	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.32	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.68	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.79	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Commercial use
\N	0.23	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.14	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.11	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.12	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.25	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.14	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.11	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Commercial use
\N	0.12	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	0.25	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	0.14	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	0.11	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	0.12	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	Industrial use
\N	23.92	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Industrial use
\N	3.17	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Industrial use
\N	27.09	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Industrial use
\N	53.83	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Industrial use
\N	0.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.27	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.3	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.24	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.27	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.3	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.24	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.27	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.3	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.24	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-ATY	KAZ	Industrial use
\N	0.11	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Industrial use
\N	0.11	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Industrial use
\N	0.11	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Industrial use
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial use
\N	0.23	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial use
\N	0.26	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial use
\N	2.49	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial use
\N	2.7	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial use
\N	1.83	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial use
\N	2.0	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial use
\N	1.69	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial use
\N	1.85	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial use
\N	0.51	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Industrial use
\N	0.46	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Mining
\N	0.45	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Mining
\N	2.55	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Mining
\N	2.43	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Non-Flourated Drinking Water
\N	2.23	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Flourated Drinking Water
\N	2.19	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Flourated Drinking Water
\N	2.32	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Flourated Drinking Water
\N	2.3	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Non-Flourated Drinking Water
\N	0.1425	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	IRN	Flourated Drinking Water
\N	0.2	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Flourated Drinking Water
\N	0.32	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Flourated Drinking Water
\N	0.54	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Non-Flourated Drinking Water
\N	8.5	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	10.03	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	10.35	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	10.68	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Non-Flourated Drinking Water
\N	11.0	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	11.33	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	12.5	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	12.82	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Non-Flourated Drinking Water
\N	13.15	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	13.47	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	13.8	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Flourated Drinking Water
\N	14.45	THB	\N	2017	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Sewerage water treatment
\N	9.5	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Sewerage water treatment
\N	10.7	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	Sewerage water treatment
\N	10.95	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	13.21	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	13.54	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	13.86	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	14.19	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	14.51	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	14.84	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	15.16	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	1.0	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	15.49	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	15.81	THB	\N	2017	Cubic Meter	TRA	NAICS 55	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	TH-10	THA	\N
\N	0.39	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	TH-10	THA	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	3.4	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	ES-B	ESP	\N
\N	2.1234	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	ES-B	ESP	\N
\N	0.61	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-B	ESP	\N
\N	3.04	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-B	ESP	\N
\N	1.44	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.37	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.33	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.45	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.44	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.49	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.92	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.82	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.77	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.93	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.92	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.98	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.52	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.39	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.32	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.54	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.52	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.61	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.47	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.38	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.95	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.88	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.84	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.78	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	4.57	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	CHE	\N
\N	2.4187	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CHE	\N
\N	0.73	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.63	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.61	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.36	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.35	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	2.05	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.99	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.02	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.03	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.94	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.9	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.34	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.3	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.21	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.17	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Irrigation
\N	0.4889	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	CN-BJ	CHN	Irrigation
\N	0.49	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.66	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	0.81	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	2.53	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.23	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.24	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.97	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	2.01	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	2.67	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	2.7	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	0.56	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Irrigation
\N	0.51	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	0.61	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	0.51	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	0.47	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	0.56	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	0.49	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	0.46	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	0.55	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	All uses
\N	4.03	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	NOR	All uses
\N	1.88	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	NOR	All uses
\N	109.2	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	DE-BE	DEU	All uses
\N	6.22	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	CH-BE	CHE	All uses
\N	2.9655	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	CH-BE	CHE	All uses
\N	1.0688	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	POL	All uses
\N	2.16	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	ESP	All uses
\N	0.9809	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ESP	Irrigation
\N	0.57	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	Irrigation
\N	1.25	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	Irrigation
\N	0.45	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Irrigation
\N	0.43	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Irrigation
\N	0.42	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Residential
\N	0.32	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	\N	VNM	Residential
\N	5.02	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	GB-BIR	GBR	Residential
\N	3.0049	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	GB-BIR	GBR	Residential
\N	0.2	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Residential
\N	0.25	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Residential
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Residential
\N	0.9424	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	Residential
\N	1.44	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	Residential
\N	2.16	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	Residential
\N	1.87	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	Residential
\N	0.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Residential
\N	0.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Residential
\N	0.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Residential
\N	2.4	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	IT-BO	ITA	Residential
\N	0.69	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	IT-BO	ITA	Residential
\N	4.43	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	Residential
\N	2.74	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	Residential
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.44	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.43	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.32	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Residential
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.41	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.46	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.37	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.41	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.46	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	Commerce, Government Agency, State Enterprise and Industry
\N	2.38	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	PT-03	PRT	Commerce, Government Agency, State Enterprise and Industry
\N	1.5004	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	PT-03	PRT	Water supply and sanitation to households
\N	1.0656	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	Water supply and sanitation to households
\N	1.17	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Water supply and sanitation to households
\N	1.03	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Water supply and sanitation to households
\N	2.62	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Water supply and sanitation to households
\N	2.31	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Water supply and sanitation to households
\N	3.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Water supply and sanitation to households
\N	3.02	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Water supply and sanitation to households
\N	1.0194	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	Water supply and sanitation to households
\N	6.15	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	Water supply and sanitation to households
\N	2.73	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	Water supply and sanitation to households
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.27	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.35	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.36	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.37	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.39	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	1.45	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-BR	BLR	Water supply and sanitation to households
\N	0.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Water supply and sanitation to households
\N	0.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Water supply and sanitation to households
\N	0.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Water supply and sanitation to households
\N	3.12	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-QLD	AUS	Water supply and sanitation to households
\N	0.768	AUD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	\N	AUS	Water supply and sanitation to households
\N	1.489	AUD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	\N	AUS	Water supply and sanitation to households
\N	3.25	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Water supply and sanitation to households
\N	3.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Water supply and sanitation to households
\N	3.64	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Water supply and sanitation to households
\N	2.96	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Water supply and sanitation to households
\N	3.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Water supply and sanitation to households
\N	3.29	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Water supply and sanitation to households
\N	2.97	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	3.12	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	3.28	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	4.95	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	BEL	Total annual charge
\N	2.9	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	BEL	Total annual charge
\N	39.9	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	HU-BU	HUN	Total annual charge
\N	3.21	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	HU-BU	HUN	Total annual charge
\N	1.48	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	HU-BU	HUN	Total annual charge
\N	0.48	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Total annual charge
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Total annual charge
\N	0.42	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Total annual charge
\N	0.26	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Total annual charge
\N	0.21	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Total annual charge
\N	0.2	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Total annual charge
\N	1.77	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	0.8	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.77	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.45	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	2.06	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.88	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	0.8925	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	BG-02	BGR	Total annual charge
\N	2.47	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	2.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	2.51	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	2.53	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	2.68	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.18	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.15	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.2	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.21	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.18	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.15	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.2	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.21	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	0.65	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	KR-26	KOR	Total annual charge
\N	0.6531	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	KR-26	KOR	Total annual charge
\N	1.9	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.61	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	2.05	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	2.08	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.2596	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	Total annual charge
\N	3.64	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	POL	Total annual charge
\N	1.82	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	POL	Total annual charge
\N	2.58	USD	\N	2009	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.91	USD	\N	2009	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.99	USD	\N	2009	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	2.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	1.84	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	4.25	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	3.72	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	6.95	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	6.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	1.81	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	3.82	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.16	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	3.17	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.09	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	3.1	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.95	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.91	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.19	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.17	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.03	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	1.01	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Total annual charge
\N	886.48	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	\N	CL-AT	CHL	Total annual charge
\N	885.91	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Total annual charge
\N	1377.2	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Total annual charge
\N	967.91	CLP	\N	2018	Cubic Meter	TRA	NAICS 56	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Total annual charge
\N	3.98	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	CAN	Total annual charge
\N	3.16	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CAN	Total annual charge
\N	2.49	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CA-AB	CAN	Total annual charge
\N	2.43	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	2.05	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	2.07	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	2.14	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.92	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.94	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.92	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.8	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.52	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.53	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.57	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.4	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.37	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.66	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.4	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.42	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.29	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	1.25	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Total annual charge
\N	0.25	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	0.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	0.96	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	1.21	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	1.39	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	1.81	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	2.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	2.2	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	2.51	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	2.46	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-ACT	AUS	Total annual charge
\N	4.94	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-ACT	AUS	Total annual charge
\N	43.52	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Total annual charge
\N	17.41	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Total annual charge
\N	60.93	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Total annual charge
\N	90.57	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Total annual charge
\N	33.55	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Total annual charge
\N	0.61	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	ZA-WC	ZAF	Total annual charge
\N	1.13	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Total annual charge
\N	1.1	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.66	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.62	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.98	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.93	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	5.85	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	GB-CRF	GBR	Irrigation
\N	2.7479	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	GB-CRF	GBR	Irrigation
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	0.37	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	0.47	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.02	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.19	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	1.39	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	0.63	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	0.87	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Household
\N	1.09	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Household
\N	0.6	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	PH-CEB	PHL	Household
\N	2.24	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Household
\N	2.19	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Household
\N	1.73	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Household
\N	1.7	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Household
\N	1.62	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Household
\N	1.59	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Household
\N	2.64	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Household
\N	2.17	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Household
\N	1.95	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Household
\N	1.79	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Household
\N	1.81	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Household
\N	1.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Household
\N	1188.28	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Household
\N	1187.86	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Household
\N	1750.5	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Household
\N	0.07	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-CH	IND	Household
\N	0.07	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-CH	IND	Household
\N	0.1	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-CH	IND	agricultural production
\N	0.12	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-CH	IND	agricultural production
\N	1.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Utilities
\N	0.13	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-CH	IND	agricultural production
\N	0.13	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-CH	IND	agricultural production
\N	5.95	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	BEL	agricultural production
\N	3.5	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	BEL	agricultural production
\N	0.14	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	\N	CHN	agricultural production
\N	0.08	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	agricultural production
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	agricultural production
\N	0.26	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	agricultural production
\N	0.38	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	agricultural production
\N	0.32	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Wastewater charge
\N	0.47	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Wastewater charge
\N	1.5	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	Wastewater charge
\N	1.46	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	USA	Wastewater charge
\N	0.7614	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	USA	Wastewater charge
\N	19.7	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-CHH	MEX	Wastewater charge
\N	28.05	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-CHH	MEX	Wastewater charge
\N	16.79	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Wastewater charge
\N	1.02	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Wastewater charge
\N	17.81	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Wastewater charge
\N	0.00577	PEN	\N	2019	Cubic Meter	REG	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PE-MOQ	PER	Wastewater charge
\N	3.8	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	3.73	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	3.17	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	3.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	3.03	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.98	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.85	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.76	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.79	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.86	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.77	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.33	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	3.04	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.94	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.23	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	22.98	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Wastewater charge
\N	13.8	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	MEX	Wastewater charge
\N	49.31	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Wastewater charge
\N	49.31	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Wastewater charge
\N	1.81	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.03	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	2.38	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Wastewater charge
\N	0.81	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	RO-CJ	ROU	Domestic
\N	0.52	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Industrial
\N	0.16	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Population
\N	0.08	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	2.66	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Other
\N	1.6	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic
\N	2.64	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	1.38	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Population
\N	2.86	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Irrigation
\N	1.45	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Other
\N	0.1	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Domestic
\N	0.11	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Industrial
\N	0.12	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Commercial
\N	1.85	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Utilities
\N	2.69	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	PT-06	PRT	Agribusiness
\N	1.5736	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	PT-06	PRT	Tourism
\N	2.62	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Agriculture
\N	2.83	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Aquaculture
\N	1.96	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Hydropower
\N	2.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Domestic
\N	1.82	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	1.96	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Commercial
\N	6.35	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-COL	MEX	Agribusiness
\N	14.02	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-COL	MEX	Tourism
\N	20.02	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-COL	MEX	Agriculture
\N	17.53	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-COL	MEX	Aquaculture
\N	7.67	MXN	\N	2020	Cubic Meter	REG	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-COL	MEX	\N
\N	0.22	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	LK-11	LKA	\N
\N	0.87	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	1.05	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	1.07	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	1.16	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	110.4	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	DNK	Potable water
\N	7.63	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	DNK	Potable water
\N	3.44	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	DNK	Potable water
\N	5.72	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	\N	DNK	Potable water
\N	1226.13	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	\N	PER	Potable water
\N	1228.15	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Potable water
\N	1226.13	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Potable water
\N	1617.16	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Potable water
\N	655.23	CLP	\N	2018	Cubic Meter	TRA	NAICS 56	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Potable water
\N	0.64	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Potable water
\N	0.97	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.11	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.79	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	1.23	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	0.26	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.26	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.26	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.37	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.63	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.79	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	6.52	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	1.38	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	7.9	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	9.9	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	16.53	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	All consumption
\N	20.01	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	All consumption
\N	24.7	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	All consumption
\N	7.92	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	All consumption
\N	3.96	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Utilities
\N	11.88	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Utilities
\N	0.99	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Utilities
\N	1.09	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Utilities
\N	1.54	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Utilities
\N	2.05	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Utilities
\N	929.24	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Utilities
\N	911.58	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Utilities
\N	1514.5	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Utilities
\N	1251.83	CLP	\N	2018	Cubic Meter	TRA	NAICS 56	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	Utilities
\N	0.55	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	KR-27	KOR	Utilities
\N	0.5494	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	KR-27	KOR	Utilities
\N	0.49	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	KR-30	KOR	Utilities
\N	0.4863	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	KR-30	KOR	Utilities
\N	0.68	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	SN-DK	SEN	Utilities
\N	1.96	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-NT	AUS	Utilities
\N	0.36	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	PH-DAV	PHL	Utilities
\N	0.3	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	2.43	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	HU-DE	HUN	Utilities
\N	1.06	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	HU-DE	HUN	Utilities
\N	0.2	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.25	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.27	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.07	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	IN-DL	IND	Utilities
\N	0.22	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-DL	IND	Utilities
\N	0.24	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-DL	IND	Utilities
\N	0.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-DL	IND	Utilities
\N	0.48	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-DL	IND	Utilities
\N	0.49	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-DL	IND	Utilities
\N	0.59	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-DL	IND	Utilities
\N	18.25	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Utilities
\N	0.18	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Utilities
\N	18.43	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Utilities
\N	25.6	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Utilities
\N	27.03	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Utilities
\N	0.72	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.77	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.72	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.68	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.72	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.66	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	5.0	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	NLD	Utilities
\N	2.52	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	NLD	Utilities
\N	2.64	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	USA	Utilities
\N	1.4996	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	USA	Utilities
\N	0.25	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.36	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.4	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Utilities
\N	0.45	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.43	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.42	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.06	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	BD-C	BGD	Utilities
\N	0.25	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.25	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.25	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.52	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-DD	ETH	Utilities
\N	0.17	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-DD	ETH	Utilities
\N	0.65	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-DD	ETH	Utilities
\N	0.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-DD	ETH	Utilities
\N	0.69	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-DD	ETH	Utilities
\N	0.31	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-DD	ETH	Utilities
\N	0.22	USD	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	MEX	Utilities
\N	0.77	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	Utilities
\N	0.37	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.32	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.31	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	2.54	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Utilities
\N	2.56	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Utilities
\N	1.79	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Utilities
\N	1.8	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Utilities
\N	1.63	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Utilities
\N	1.64	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Utilities
\N	2.83	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	IE-D	IRL	Utilities
\N	0.095	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Utilities
\N	0.012	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Utilities
\N	0.095	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Utilities
\N	0.012	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Utilities
\N	2.14	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	\N	ZAF	Utilities
\N	27.83	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	39.65	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	20.52	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	32.96	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	32.96	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	39.65	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	28.0	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	43.83	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	43.83	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	39.65	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	61.74	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	67.65	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	67.65	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	39.65	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	67.91	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	74.35	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	74.35	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	39.65	ZAR	\N	2021	kL	TRA	NAICS 22	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	\N	ZAF	Utilities
\N	3.27	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	CAN	Utilities
\N	2.33	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CAN	Utilities
\N	0.71	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.84	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.66	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.77	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.64	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.76	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Utilities
\N	0.15	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Utilities
\N	0.011	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Utilities
\N	0.15	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Utilities
\N	0.011	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Utilities
\N	2.01	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Utilities
\N	2.02	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Utilities
\N	2.04	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Utilities
\N	2.1	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Utilities
\N	2.09	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Utilities
\N	2.09	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Utilities
\N	1.84	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.85	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.86	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.95	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.94	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.9	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.92	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.94	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.94	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	2.05	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	2.04	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	1.99	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Drinking water
\N	3.35	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	NLD	Drinking water
\N	1.6	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	NLD	Drinking water
\N	0.43	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.38	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.37	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.42	USD	\N	2006	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.42	USD	\N	2006	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.42	USD	\N	2006	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	20.98	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Drinking water
\N	74.15	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Drinking water
\N	74.15	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Drinking water
\N	0.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.36	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.35	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	8.52	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	DNK	Drinking water
\N	3.66	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	DNK	Drinking water
\N	0.1381	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	IRN	Drinking water
\N	4.63	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FIN	Drinking water
\N	1.88	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FIN	Drinking water
\N	1.81	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.67	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.64	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.88	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.85	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.84	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	2.08	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.68	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.55	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.52	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.75	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.72	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.71	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.93	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.65	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.53	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.5	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.72	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.69	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.68	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	1.9	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Drinking water
\N	44.4	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	TUR	Drinking water
\N	0.9	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.34	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	3.6	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.65	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.63	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.32	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	PT-08	PRT	Drinking water
\N	1.143	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	PT-08	PRT	Drinking water
\N	0.76	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AL-04	ALB	Drinking water
\N	0.65	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AL-04	ALB	Drinking water
\N	0.63	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AL-04	ALB	Drinking water
\N	1.3	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.59	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.07	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.53	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.6	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	3.19	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.39	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.38	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.49	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.6	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.58	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.06	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.86	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.81	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.5	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.9	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.42	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.8	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Drinking water
\N	1.95	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Drinking water
\N	1.77	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	Drinking water
\N	2.24	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	JPN	Drinking water
\N	1.12	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	JPN	Drinking water
\N	1.54	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	Drinking water
\N	0.33	USD	\N	2005	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.33	USD	\N	2005	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.33	USD	\N	2005	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.39	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.53	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.67	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.2	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-GA	ETH	Drinking water
\N	0.25	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-GA	ETH	Drinking water
\N	0.27	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	ET-GA	ETH	Drinking water
\N	0.04	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Drinking water
\N	0.04	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Drinking water
\N	0.04	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	Drinking water
\N	0.56	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.6	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.42	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.34	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.11	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.97	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	0.3577	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	MEX	Drinking water
\N	4.52	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	CH-GE	CHE	Drinking water
\N	3.6617	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	CH-GE	CHE	Drinking water
\N	5.11	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	BEL	Drinking water
\N	2.0	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	BEL	Drinking water
\N	0.38	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	Drinking water
\N	0.71	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	Drinking water
\N	0.51	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.45	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.58	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.47	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.42	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.53	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.46	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.41	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.52	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.27	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.27	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	0.27	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Drinking water
\N	1.03	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.47	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.34	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.92	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	1.67	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.4	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Drinking water
\N	2.43	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.67	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	1.9	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	1.78	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	1.96	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.27	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.44	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.4	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.37	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.44	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.48	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.43	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.48	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.4	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.41	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.45	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.48	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.44	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HO	BLR	Drinking water
\N	0.24	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Drinking water
\N	0.27	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Drinking water
\N	0.28	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Drinking water
\N	3.22	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.52	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.18	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	1.95	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	1.96	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	1.83	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Drinking water
\N	2.2967	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	SWE	Residential water
\N	4.59	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	SWE	Residential water
\N	1.58	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	1.57	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	1.53	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	1.08	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	1.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	1.05	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	0.98	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	0.97	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	0.95	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Residential water
\N	0.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Residential water
\N	1.2	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Residential water
\N	1.71	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Residential water
\N	0.36	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Agriculture
\N	0.33	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Industry
\N	0.36	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Domestic
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Agriculture
\N	0.36	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Industry
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	Domestic
\N	4.59	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	AUT	Domestic
\N	3.1	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	AUS	Agriculture
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Agriculture
\N	0.14	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	industry
\N	0.38	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Industry
\N	0.44	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Domestic
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Domestic
\N	0.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Domestic
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Agriculture
\N	0.41	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Agriculture
\N	0.47	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Domestic
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Industry
\N	0.5	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Indsutry
\N	0.34	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Domestic
\N	0.41	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Domestic
\N	0.48	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Agriculture
\N	0.43	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-HR	BLR	Indsutry
\N	0.4	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Domestic
\N	0.47	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Agriculture
\N	0.54	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Industry
\N	0.64	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Domestic
\N	0.61	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	0.73	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	Irrigation
\N	16.81	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Irrigation
\N	29.17	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Irrigation
\N	30.04	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Irrigation
\N	0.87	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	MEX	Irrigation
\N	0.15	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Irrigation
\N	0.035	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Irrigation
\N	0.15	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Irrigation
\N	0.035	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Irrigation
\N	0.048	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Irrigation
\N	0.025	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	Irrigation
\N	0.048	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Irrigation
\N	0.025	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	Irrigation
\N	27.2	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-GUA	MEX	Irrigation
\N	32.74	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-GUA	MEX	Irrigation
\N	75.29	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-GUA	MEX	Irrigation
\N	0.051	USD	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	MX-GUA	MEX	Irrigation
\N	0.057	USD	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	MX-GUA	MEX	Irrigation
\N	0.3271	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CHN	Irrigation
\N	0.67	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.61	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.02	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.53	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.64	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.79	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.77	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.84	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.26	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.36	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.5	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.48	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.55	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.2	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.42	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.49	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.07	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.12	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.13	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.12	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.19	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.21	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.5	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	KR-29	KOR	\N
\N	0.4973	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	KR-29	KOR	\N
\N	0.59	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	KOR	\N
\N	0.5919	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	KOR	\N
\N	0.29	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	\N	VNM	\N
\N	1.7	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.68	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.0	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.03	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	0.85	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	0.89	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.14	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	Industrial
\N	1.12	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.21	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.34	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.3	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.42	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.03	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.11	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.23	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.19	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.31	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.01	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.21	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	1.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	Industrial
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.3	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.61	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.38	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.71	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.78	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	ZW-HA	ZWE	Industrial
\N	0.03	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-HR	IND	Industrial
\N	0.03	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-HR	IND	Industrial
\N	0.03	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-HR	IND	Industrial
\N	0.11	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.17	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.23	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.18	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	0.24	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	Industrial
\N	3.11	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	2.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	2.74	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	2.48	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	2.74	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	2.65	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	Industrial
\N	4.63	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FIN	Industrial
\N	1.88	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FIN	Industrial
\N	1.81	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.67	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.64	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.88	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.85	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.84	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	2.08	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.68	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.55	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.52	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.75	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.72	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.71	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.93	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.65	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.53	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.5	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.72	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.69	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.68	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	1.9	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	Industrial
\N	17.84	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	Industrial
\N	73.55	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	Industrial
\N	73.55	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	1.9	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	JPN	\N
\N	0.97	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	JPN	\N
\N	0.94	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.18	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	VN-SG	VNM	\N
\N	0.35	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	VN-SG	VNM	\N
\N	1.06	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-TAS	AUS	\N
\N	0.35	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	\N	HKG	\N
\N	0.338	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	HKG	\N
\N	3.23	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.19	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.36	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.88	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.85	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.95	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.59	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.57	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.65	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	905.88	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	1509.15	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	924.1	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	0.15	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.19	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.2	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	1.78	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.78	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.73	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.72	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.69	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.9855	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	0.0056	PEN	\N	2019	Cubic Meter	REG	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PE-MOQ	PER	\N
\N	613.65	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	598.41	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	613.65	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	982.33	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	0.61	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	KR-28	KOR	\N
\N	0.6081	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	KR-28	KOR	\N
\N	2.0	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	AUS	\N
\N	5.0	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	AUT	\N
\N	4.03	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.35	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.38	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.12	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	20.32	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	25.22	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	31.68	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.66	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.88	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.66	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.36	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.93	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.37	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.61	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.75	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.69	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.07	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.32	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.29	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	ID-JK	IDN	\N
\N	0.75	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	\N	IDN	\N
\N	0.88	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	\N	IDN	\N
\N	0.68	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.52	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.76	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	IL-JM	ISR	\N
\N	2.14	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	IL-JM	ISR	\N
\N	0.14	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.24	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.27	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.2	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.87	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.84	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.23	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.19	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.24	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.2	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.9	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.73	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.02	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.65	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.44	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.45	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.78	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.28	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.29	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.6	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.25	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.56	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.18	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	ZA-GT	ZAF	\N
\N	18.75	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	22.98	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	23.9	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.074	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	\N
\N	0.02	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	\N
\N	0.074	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	\N
\N	0.02	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	\N
\N	4.21	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	4.47	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.91	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	3.06	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.63	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.75	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.3709	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	TW-KHH	TWN	\N
\N	1.0	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	HUN	\N
\N	2.05	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	HU-KV	HUN	\N
\N	0.22	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.07	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	PK-SD	PAK	\N
\N	0.32	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.27	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.32	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.27	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.32	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.27	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KAR	KAZ	\N
\N	0.09	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	\N	NPL	\N
\N	0.4	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.96	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	3.31	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.87	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.69	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.5	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.56	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.49	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.53	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.23	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.37	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.78	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	RW-01	RWA	\N
\N	1.09	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	1.54	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.7	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.82	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.85	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.92	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.54	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.7	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.82	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.85	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.92	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.54	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.7	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.82	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.85	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.92	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.09	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.21	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.23	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.21	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.23	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.21	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.23	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.13	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.85	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.9	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.78	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.83	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.77	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.81	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.38	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.36	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.35	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	5.62	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	BEL	\N
\N	2.5	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	BEL	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.18	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.18	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.18	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.63	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.57	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.56	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.42	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.45	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.42	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.42	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.3	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	MY-14	MYS	\N
\N	0.29	USD	\N	2004	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.29	USD	\N	2004	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.29	USD	\N	2004	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	2.61	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.6	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.9	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.37	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.37	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.64	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.32	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.32	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.58	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	0.38	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.35	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.35	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	1.26	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.19	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.11	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.19	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.11	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.19	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	0.11	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-KZY	KAZ	\N
\N	18.54	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	41.63	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	48.0	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.76	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.11	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.33	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.39	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.87	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.76	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.199	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	CY-03	CYP	\N
\N	1.21	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	3.17	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	2.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.1	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.17	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.15	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.96	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.94	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	4.36	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	CHE	\N
\N	3.6728	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CHE	\N
\N	5.83	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	\N
\N	2.84	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	5.18	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	GB-LDS	GBR	\N
\N	2.6093	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	GB-LDS	GBR	\N
\N	1.89	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CYP	\N
\N	0.8	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.14	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.56	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.14	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CYP	\N
\N	2.84	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	MEX	\N
\N	37.21	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	65.44	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	66.27	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	4.87	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	MX-GUA	MEX	\N
\N	0.83	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.72	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.7	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.43	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.54	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.43	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.49	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.43	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.48	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	3.8	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	BEL	\N
\N	6.24	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	BE-WLG	BEL	\N
\N	5.03	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	\N
\N	2.59	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	0.7	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	MW-LI	MWI	\N
\N	0.75	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.78	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.38	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.42	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.96	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.03	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.44	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.63	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.72	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.3298	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	SWE	\N
\N	4.64	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	SWE	\N
\N	3.18	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	AUT	\N
\N	32.5	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	PRT	\N
\N	2.57	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	PT-11	PRT	\N
\N	1.9918	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	PT-11	PRT	\N
\N	4.09	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	4.15	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.21	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.26	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.02	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.61	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	\N	TGO	\N
\N	3.98	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	GB-LND	GBR	\N
\N	2.5876	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	GB-LND	GBR	\N
\N	1.92	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.95	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.15	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.04	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.19	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.62	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.7	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.87	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.78	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.91	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.21	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.28	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.41	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.34	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	66.3	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	GBR	\N
\N	59.3	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	USA	\N
\N	2.72	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	USA	\N
\N	1.3995	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	USA	\N
\N	2.32	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	US-CA	USA	\N
\N	5.52	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	BEL	\N
\N	2.4	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	BEL	\N
\N	0.7	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.64	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.73	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.65	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.6	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.68	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.64	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.59	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.67	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.66	USD	\N	2006	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.66	USD	\N	2006	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.66	USD	\N	2006	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	4.04	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	\N
\N	2.54	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	4.16	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	NLD	\N
\N	2.19	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	NLD	\N
\N	0.54	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CHN	\N
\N	0.72	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.56	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.9	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.69	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.22	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.94	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.76	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.06	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.57	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.17	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.63	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.62	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.24	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.57	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.47	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.84	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.79	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.7	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.08	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.01	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.02	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.96	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	33.0	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	ESP	\N
\N	2.17	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	ESP	\N
\N	1.5531	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ESP	\N
\N	0.13	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	0.5	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	0.21	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	1.41	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	1.36	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	SWE	\N
\N	3.22	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	SWE	\N
\N	0.68	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.68	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.59	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.59	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.57	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.57	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	5.77	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	GB-MAN	GBR	\N
\N	3.2041	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	GB-MAN	GBR	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	PH-RIZ	PHL	\N
\N	0.62	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	PH-RIZ	PHL	\N
\N	0.77	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	PH-RIZ	PHL	\N
\N	0.9332	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	0.76	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.72	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.87	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.91	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.08	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.07	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	4.75	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	\N
\N	2.89	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	0.85	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.35	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.49	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.2179	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	MUS	\N
\N	4.79	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	SZ-HH	SWZ	\N
\N	0.25	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	\N	IDN	\N
\N	0.9824	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	0.1	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.1	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.1	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.16	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.16	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.16	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.19	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.32	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.18	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.28	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.45	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.3	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.49	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.32	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	2.63	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-VIC	AUS	\N
\N	3.35	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-VIC	AUS	\N
\N	4.95	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	6.29	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	6.29	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	1.07	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CA-BC	CAN	\N
\N	6.4	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	50.53	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	50.53	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	1.01	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	USA	\N
\N	0.5161	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	USA	\N
\N	0.028	USD	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	MEX	\N
\N	0.034	USD	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	MEX	\N
\N	0.83	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	IT-MI	ITA	\N
\N	0.189	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	IT-MI	ITA	\N
\N	1.4619	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	USA	\N
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.14	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.29	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.42	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.36	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.29	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.27	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.28	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.35	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.42	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.36	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.33	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.31	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.32	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.36	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.42	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.36	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-MI	BLR	\N
\N	0.33	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.33	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.33	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	2.59	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	HU-MI	HUN	\N
\N	1.15	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	HU-MI	HUN	\N
\N	0.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.92	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.37	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.41	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.48	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.48	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.42	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.41	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.46	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.46	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	4.72	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	MEX	\N
\N	1.6668	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	MEX	\N
\N	0.74	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.2	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.02	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	27.66	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	35.3	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	46.91	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	1.5915	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	PRT	\N
\N	0.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.12	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.99	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-MU	ESP	\N
\N	2.64	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-MU	ESP	\N
\N	1.67	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	JPN	\N
\N	0.7348	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	JPN	\N
\N	1.28	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.1	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.16	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.21	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.08	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.11	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.13	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	4.15	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	\N
\N	2.34	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	1.78	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	IT-NA	ITA	\N
\N	0.8069	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	IT-NA	ITA	\N
\N	1.0	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.37	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.75	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	25.71	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	42.38	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	44.41	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.08	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.08	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.08	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.23	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.23	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.23	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.17	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.24	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.26	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	3.94	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	US-NY	USA	\N
\N	2.8762	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	US-NY	USA	\N
\N	1.74	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	US-NY	USA	\N
\N	2.37	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.1	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.1	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.1	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.012489	PEN	\N	2005	Cubic Meter	REG	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PE-LIM	PER	\N
\N	0.93	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.06	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.88	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.36	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.36	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.36	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	4.07	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-OAX	MEX	\N
\N	5.77	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-OAX	MEX	\N
\N	9.1	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-OAX	MEX	\N
\N	9.37	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	DNK	\N
\N	3.27	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	DNK	\N
\N	1.36	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.7	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.07	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.9732	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	0.36	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.31	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.3	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.27	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.37	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.49	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.52	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.41	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.5	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	1.53	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	JPN	\N
\N	1.37	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	\N	JPN	\N
\N	1.0823	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	JPN	\N
\N	0.97	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	1.52	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.57	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.86	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.73	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.85	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.96	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.99	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.16	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.08	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.08	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.84	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.87	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.95	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.89	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.91	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	4.32	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	NO-03	NOR	\N
\N	1.7	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	NO-03	NOR	\N
\N	1.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.47	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.56	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.69	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.42	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.35	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.56	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.41	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.3	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.32	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.56	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.37	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.29	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	5.21	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FIN	\N
\N	2.07	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FIN	\N
\N	2.08	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.3	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.84	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.04	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.8	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.99	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	0.66	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.65	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.36	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.32	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.93	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.88	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	40.84	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	37.71	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	1.02	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.13	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	3.4	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.4	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	\N	IDN	\N
\N	0.6	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	5.76	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	0.14	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.14	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.14	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	1.82	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	CY-05	CYP	\N
\N	70.7	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	FR-75	FRA	\N
\N	4.16	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	FR-75	FRA	\N
\N	2.03	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	FR-75	FRA	\N
\N	0.94	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.84	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.81	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.11	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.1	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.1	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.11	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.1	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.1	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.11	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.1	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	0.1	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	KZ-PAV	KAZ	\N
\N	1.57	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	HUN	\N
\N	3.48	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	HU-PS	HUN	\N
\N	0.91	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.46	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.86	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.35	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.63	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.33	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.57	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.32	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.56	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.52	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.47	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.46	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	1.82	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-WA	AUS	\N
\N	4.55	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-WA	AUS	\N
\N	0.31	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.31	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.31	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.24	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.27	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.21	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.24	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.27	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.21	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.24	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.27	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.21	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.74	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	US-AZ	USA	\N
\N	0.24	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	KH-12	KHM	\N
\N	0.24	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	KH-12	KHM	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.3	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.37	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.64	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.96	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.18	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.9948	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	1.17	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	BG-15	BGR	\N
\N	0.71	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.82	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.7	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.72	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.69	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.7	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.63	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.58	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.57	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	3.01	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.86	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.5	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.42	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.82	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.75	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.89	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	US-OR	USA	\N
\N	2.39	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	PT-13	PRT	\N
\N	1.5887	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	PT-13	PRT	\N
\N	2.06	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.82	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.77	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.65	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.91	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.94	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.81	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.06	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	ZA-GT	ZAF	\N
\N	0.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-PY	IND	\N
\N	0.05	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-PY	IND	\N
\N	0.05	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-PY	IND	\N
\N	25.71	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-PUE	MEX	\N
\N	26.87	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-PUE	MEX	\N
\N	26.87	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-PUE	MEX	\N
\N	8.62	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	MX-PUE	MEX	\N
\N	2.87	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	MX-PUE	MEX	\N
\N	0.48	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.43	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.42	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	3.96	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	4.02	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.2	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.25	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.04	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	30.83	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-QUE	MEX	\N
\N	50.98	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-QUE	MEX	\N
\N	60.76	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-QUE	MEX	\N
\N	0.36	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.31	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.29	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	2.75	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	POL	\N
\N	1.0854	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	POL	\N
\N	0.31	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-RJ	IND	\N
\N	0.34	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-RJ	IND	\N
\N	0.14	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-RJ	IND	\N
\N	0.15	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-RJ	IND	\N
\N	0.11	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-RJ	IND	\N
\N	0.12	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-RJ	IND	\N
\N	1.67	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	BG-17	BGR	\N
\N	1.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.98	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.59	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.35	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.23	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.9	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	4.52	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	CAN	\N
\N	3.51	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CAN	\N
\N	2.42	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.64	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.9	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.7	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.85	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.64	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.79	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.96	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.83	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.92	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.47	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.61	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.76	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.65	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.72	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	4.32	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	\N
\N	2.03	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	11.34	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	20.58	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	24.93	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.75	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.6	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.06	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	5.04	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	CAN	\N
\N	6.04	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CAN	\N
\N	0.13	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.89	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-RJ	BRA	\N
\N	1.02	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-RJ	BRA	\N
\N	2.2	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-RJ	BRA	\N
\N	2.5	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-RJ	BRA	\N
\N	4.49	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-RJ	BRA	\N
\N	5.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-RJ	BRA	\N
\N	1.67	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.7	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.3	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.44	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.05	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.06	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.15	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.42	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.43	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	29.8	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	ITA	\N
\N	1.78	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	IT-RM	ITA	\N
\N	0.6119	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	IT-RM	ITA	\N
\N	0.5	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.45	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.44	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.63	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.58	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.57	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	4.71	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	NLD	\N
\N	2.17	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	NLD	\N
\N	0.9	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	1.12	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	1.35	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	0.57	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.55	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.54	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.41	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.41	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.41	USD	\N	2008	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.58	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.74	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.11	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	2.05	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.2	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.86	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.01	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.82	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.97	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	16.93	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	26.03	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	26.03	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	1.17	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.35	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.3	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	3.16	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	3.1	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	6.15	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	AT-5	AUT	\N
\N	2.3	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	AUS	\N
\N	3.77	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	US-CA	USA	\N
\N	9.41	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	18.39	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	26.06	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	4.25	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	MEX	\N
\N	0.4068	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	MEX	\N
\N	6.0	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-SLP	MEX	\N
\N	18.53	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-SLP	MEX	\N
\N	46.33	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-SLP	MEX	\N
\N	0.48	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.05	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.4	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.8	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.17	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.63	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-SP	BRA	\N
\N	0.77	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-SP	BRA	\N
\N	0.98	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-SP	BRA	\N
\N	1.84	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-SP	BRA	\N
\N	1.21	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-SP	BRA	\N
\N	2.31	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BR-SP	BRA	\N
\N	2.27	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	JPN	\N
\N	1.5	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	JPN	\N
\N	0.58	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.85	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.74	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.5	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.72	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	2.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.39	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.7	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.83	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	3.06	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.76	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.06	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.33	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.43	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.64	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.77	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.08	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.35	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.46	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.68	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.9578	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	RO-SM	ROU	\N
\N	3.28	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	US-WA	USA	\N
\N	2.7	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	0.163	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	\N
\N	0.038	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	\N
\N	0.163	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	\N
\N	0.038	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	\N
\N	0.32	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.32	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.32	USD	\N	2010	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.08	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.11	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.17	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.17	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.17	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	2.79	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	JPN	\N
\N	2.18	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	JPN	\N
\N	2.02	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.53	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	KR-11	KOR	\N
\N	0.49	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	KR-11	KOR	\N
\N	0.5348	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	KR-11	KOR	\N
\N	0.51	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.51	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.51	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	14.0	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	KOR	\N
\N	0.9578	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	2.99	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	ESP	\N
\N	1.2776	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ESP	\N
\N	0.5	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	1.61	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	0.1	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	CN-SH	CHN	\N
\N	0.3171	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	CN-SH	CHN	\N
\N	0.33	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.18	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.36	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.21	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.37	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.21	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.3799	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CHN	\N
\N	0.124	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	IRN	\N
\N	0.32	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.41	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.38	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.47	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.48	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.45	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.51	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.46	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.45	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.55	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.55	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.55	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	1.53	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.6	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.3	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.37	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.25	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.32	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.27	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.29	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.31	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.27	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.29	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.31	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.27	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.29	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.31	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.8562	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	RO-SB	ROU	\N
\N	0.08	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-SK	IND	\N
\N	0.12	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-SK	IND	\N
\N	0.21	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	IN-SK	IND	\N
\N	1.6463	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	PRT	\N
\N	0.46	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.41	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.41	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.8152	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	BG-23	BGR	\N
\N	0.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.95	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.19	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.016897	PEN	\N	2005	Cubic Meter	REG	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PE-LIM	PER	\N
\N	1.53	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.62	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.61	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.64	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.75	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.09	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.15	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.14	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.17	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.24	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.0	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.05	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.04	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.07	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.47	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	BG-24	BGR	\N
\N	0.97	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.02	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.78	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.88	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.22	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	2.52	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	SE-AB	SWE	\N
\N	1.25	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	SE-AB	SWE	\N
\N	4.19	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FRA	\N
\N	2.53	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FRA	\N
\N	1.0564	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	RO-SV	ROU	\N
\N	2.78	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	\N
\N	2.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	\N
\N	2.77	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	\N
\N	2.2	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	\N
\N	3.04	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	\N
\N	2.34	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	AU-VIC	AUS	\N
\N	1.17	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.93	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.99	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.09	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.04	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.94	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.75	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.8	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.89	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.85	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.93	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.89	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.76	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.84	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.81	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.89	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	90.5	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	AUS	\N
\N	2.35	AUD	\N	2021	kL	REG	NAICS 92	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AU-NSW	AUS	\N
\N	2.31	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	AU-NSW	AUS	\N
\N	2.43	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.86	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.89	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.6	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.78	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.54	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.1414	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	IRN	\N
\N	0.1	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	\N
\N	0.02	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	\N	ESP	\N
\N	0.1	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	\N
\N	0.02	EUR	\N	2007	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ESP	\N
\N	0.4196	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	TW-TPE	TWN	\N
\N	5.3	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FIN	\N
\N	2.26	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FIN	\N
\N	2.34	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.39	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.72	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.89	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.88	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.09	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.8	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.78	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.96	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	0.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.18	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.19	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.19	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.13	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	3.16	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.3	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.69	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.82	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.6	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.72	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.86	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	POL	\N
\N	0.9894	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	POL	\N
\N	0.01	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	UZ-TO	UZB	\N
\N	0.1577	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	IR-07	IRN	\N
\N	0.45	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	22.17	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	25.63	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	41.93	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.927	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	784.53	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	769.26	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	784.53	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	1153.17	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	26.6	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	79.05	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	79.05	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	7.85	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	13.65	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	15.73	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.8192	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	ROU	\N
\N	0.57	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.87	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.52	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.76	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.51	USD	\N	2012	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.74	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	25.39	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	49.29	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	53.21	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	14.3	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	25.37	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	27.23	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	10.08	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MX-TLA	MEX	\N
\N	51.93	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MX-TLA	MEX	\N
\N	35.5	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	JPN	\N
\N	2.18	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	JP-13	JPN	\N
\N	2.21	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	JP-13	JPN	\N
\N	1.416	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	JP-13	JPN	\N
\N	17.3	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	33.95	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	33.95	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	3.38	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.88	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.73	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.77	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.6	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.00559	PEN	\N	2019	Cubic Meter	REG	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PE-MOQ	PER	\N
\N	4.0735	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CA-ON	CAN	\N
\N	4.2878	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CA-ON	CAN	\N
\N	2.8514	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CA-ON	CAN	\N
\N	3.0014	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CA-ON	CAN	\N
\N	3.62	CAD	\N	2019	Cubic Meter	TRA	NAICS 92	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CA-ON	CAN	\N
\N	13.2	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	36.04	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	37.23	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	3.0	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.36	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.02	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.9	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.01	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	0.91	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.19	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.33	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.19	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.75	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.09	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.8	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.13	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.96	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.31	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	5.0	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	NOR	\N
\N	2.05	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	NOR	\N
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.4	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.35	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.18	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.34	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	15.22	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	37.72	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	37.72	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	2.25	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	IT-TO	ITA	\N
\N	0.6218	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	IT-TO	ITA	\N
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.19	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.19	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.19	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	6.39	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FIN	\N
\N	3.22	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FIN	\N
\N	2.92	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.86	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.33	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.27	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.2	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.14	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	19.14	MXN	\N	2020	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	25.07	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	30.87	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.19	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	MN-1	MNG	\N
\N	0.83	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	KR-31	KOR	\N
\N	0.8289	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	KR-31	KOR	\N
\N	0.75	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	1.4	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	1.9	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	2.5	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	3.75	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	1.6	CAD	\N	2021	Cubic Meter	TRA	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CA-BC	CAN	\N
\N	4.55	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	SE-C	SWE	\N
\N	1.665	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	SE-C	SWE	\N
\N	0.48	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.48	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.48	USD	\N	2007	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.15	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.09	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.15	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.09	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.15	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.09	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.17	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.17	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.14	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.16	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.2	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.17	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.12	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	4.28	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	NL-UT	NLD	\N
\N	1.53	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	NL-UT	NLD	\N
\N	2.69	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	ES-V	ESP	\N
\N	1.8899	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	ES-V	ESP	\N
\N	0.47	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-V	ESP	\N
\N	0.55	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-V	ESP	\N
\N	0.27	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-VA	ESP	\N
\N	0.66	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-VA	ESP	\N
\N	715.51	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	699.69	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	715.51	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	1083.94	CLP	\N	2018	Cubic Meter	TRA	NAICS 92	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	1.532303389	CAD	\N	2021	Cubic Meter	TRA	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CA-BC	CAN	\N
\N	1.517471229	CAD	\N	2020	Cubic Meter	TRA	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CA-BC	CAN	\N
\N	1.383275495	CAD	\N	2019	Cubic Meter	TRA	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CA-BC	CAN	\N
\N	1.222593762	CAD	\N	2021	Cubic Meter	TRA	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CA-BC	CAN	\N
\N	1.210586775	CAD	\N	2020	Cubic Meter	TRA	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CA-BC	CAN	\N
\N	1.103583335	CAD	\N	2019	Cubic Meter	TRA	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CA-BC	CAN	\N
\N	1.17	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.02	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.23	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.21	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.37	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.88	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.77	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.82	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.93	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.93	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.06	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.82	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.71	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.76	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.87	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.87	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.0	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	4.63	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	FIN	\N
\N	1.88	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	FIN	\N
\N	1.85	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.84	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	2.08	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.72	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.71	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.93	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.69	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.68	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	1.9	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	FIN	\N
\N	0.53	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.48	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.47	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.43	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.95	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.23	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.64	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	SC-09	SYC	\N
\N	1.74	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.51	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.49	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.64	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.54	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.65	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.32	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.08	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.15	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.27	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.21	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.3	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.23	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.07	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.01	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.07	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.19	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.14	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.23	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	5.2	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	AT-9	AUT	\N
\N	2.4	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	AUS	\N
\N	0.04	USD	\N	2014	Cubic Meter	TRA	NAICS 22	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	LA-VI	LAO	\N
\N	0.23	USD	\N	2011	Cubic Meter	TRA	NAICS 22	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	LA-VI	LAO	\N
\N	0.39	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	1.17	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	\N	ESP	\N
\N	1.53	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	\N	MEX	\N
\N	6.79	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	19.78	MXN	\N	2020	Cubic Meter	REG	NAICS 31-33	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	\N	MEX	\N
\N	0.04	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.06	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.06	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	IND	\N
\N	0.1	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.14	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.28	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.52	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.44	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.33	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.39	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.44	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.57	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.43	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.52	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.38	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.42	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.44	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.58	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.44	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	BY-VI	BLR	\N
\N	0.8	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.97	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.44	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.74	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.65	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.99	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.28	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.55	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.28	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.35	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.5	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.28	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.34	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.49	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.44	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.12	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	1.41	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BRA	\N
\N	0.84	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.74	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.72	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.37	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.32	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.31	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ALB	\N
\N	0.8777	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	RO-VN	ROU	\N
\N	2.15	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.06	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.26	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.17	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.41	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.31	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	4.18	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	USA	\N
\N	87.2	MXN	\N	2015	Cubic Meter	REG	NAICS 92	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	\N	USA	\N
\N	3.4805	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	USA	\N
\N	0.28	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.35	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.38	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	3.71	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.03	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.55	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.93	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.46	USD	\N	2011	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.69	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.29	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.11	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.82	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.65	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.81	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.63	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.14	USD	\N	2019	Cubic Meter	TRA	NAICS 22	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	NA-KH	NAM	\N
\N	1.97	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.07	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.27	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.17	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.36	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.97	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.04	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.17	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.11	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.21	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.76	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.82	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.93	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.89	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	0.97	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.04	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.0	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.02	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.76	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	CAN	\N
\N	2.16	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CAN	\N
\N	1.88	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.09	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.37	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.36	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.44	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.56	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.73	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.68	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.34	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.44	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.59	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	1.53	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	CAN	\N
\N	2.49	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.44	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.9	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.86	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.77	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	1.74	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.77	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	POL	\N
\N	1.35	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	POL	\N
\N	0.32	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.69	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.34	USD	\N	2013	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	ETH	\N
\N	0.00564	PEN	\N	2019	Cubic Meter	REG	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PE-MOQ	PER	\N
\N	2.95	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.69	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.06	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.91	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.27	USD	\N	2015	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	3.15	USD	\N	2016	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	AUS	\N
\N	2.02	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	\N	JPN	\N
\N	0.91	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	JPN	\N
\N	1.13	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	JPN	\N
\N	0.21	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-Z	ESP	\N
\N	1.26	EUR	\N	2020	Cubic Meter	TRA	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	ES-Z	ESP	\N
\N	0.4	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.39	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.44	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.4	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.41	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.46	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.43	USD	\N	2018	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2019	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.46	USD	\N	2020	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	0.42	USD	\N	2021	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	BLR	\N
\N	2.5531	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	\N	CHE	\N
\N	4.65	USD	\N	2015	Cubic Meter	TRA	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	CH-ZH	CHE	\N
\N	0.25	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.18	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.18	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.25	USD	\N	2014	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	0.18	USD	\N	2017	Cubic Meter	TRA	\N	https://tariffs.ib-net.org/sites	\N	KAZ	\N
\N	5.1	USD	\N	2013	Cubic Meter	TRA	NAICS 21	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	CL-AT	CHL	\N
\N	1.9	USD	\N	2016	Cubic Meter	TRA	NAICS 21	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	CL-AT	CHL	\N
\N	2.6	USD	\N	2016	Cubic Meter	TRA	NAICS 21	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57906	CL-AT	CHL	\N
\N	1.6	USD	\N	2013	Cubic Meter	TRA	\N	https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	CL-AT	CHL	\N
\N	1.68	USD	\N	2013	Cubic Meter	TRA	NAICS 21	https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	CL-AT	CHL	\N
\N	80000.0	CLP	\N	2012	Liter	TRA	\N	https://www.bbc.com/news/business-17423097	CL-AT	CHL	\N
\N	120000.0	CLP	\N	2012	Liter	TRA	\N	https://www.bbc.com/news/business-17423097	CL-AT	CHL	\N
\N	758.0	CLP	\N	2018	\N	TRA	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CL-AT	CHL	\N
\N	0.01675	PEN	\N	2005	Cubic Meter	REG	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	\N	PER	\N
\N	0.013257	PEN	\N	2005	Cubic Meter	REG	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	\N	PER	\N
\N	0.007102	PEN	\N	2005	Cubic Meter	REG	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	\N	PER	\N
\N	0.011521	PEN	\N	2005	Cubic Meter	REG	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	\N	PER	\N
\N	0.066	USD	\N	2013	Cubic Meter	TRA	NAICS 21	https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	PE-LAM	PER	\N
\N	0.49	USD	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/centrodemexico/medios/049dolarespormetrocubicodeaguapaganlosmexicanos.htm	\N	MEX	\N
\N	7.0	MXN	\N	2008	Cubic Meter	REG	\N	https://books.google.ca/books?id=tMozIyKETkYC&pg=PA66&lpg=PA66&dq=market+price+water+mexico&source=bl&ots=Jd6OJn1NVs&sig=ACfU3U0FExeKYfHUJQPsXRIHXNOlujGnFA&hl=es-419&sa=X&ved=2ahUKEwjb4M-ay7bpAhXFl54KHfqPAwYQ6AEwEXoECAwQAQ#v=onepage&q=market%20price%20water%20mexico&f=false	\N	MEX	\N
\N	1.6	USD	\N	2018	Cubic Meter	TRA	NAICS 21	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	CL-AT	CHL	\N
\N	0.8	USD	\N	2016	Cubic Meter	TRA	NAICS 21	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	CL-AT	CHL	\N
\N	1.2	USD	\N	2016	Cubic Meter	TRA	NAICS 21	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	CL-AT	CHL	\N
\N	5.08	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AK	USA	\N
\N	2.26	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AL	USA	\N
\N	1.29	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AR	USA	\N
\N	1.64	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AR	USA	\N
\N	2.19	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AZ	USA	\N
\N	3.85	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AZ	USA	\N
\N	3.37	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CA	USA	\N
\N	3.73	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CA	USA	\N
\N	4.51	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CA	USA	\N
\N	5.85	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CA	USA	\N
\N	5.94	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CA	USA	\N
\N	2.71	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CO	USA	\N
\N	5.6	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	\N	USA	\N
\N	1.47	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	1.86	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	7.45	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	4.37	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	2.2	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	2.23	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-GA	USA	\N
\N	1.54	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-GA	USA	\N
\N	1.79	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-IA	USA	\N
\N	1.79	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-IA	USA	\N
\N	3.34	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-IA	USA	\N
\N	5.93	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-IL	USA	\N
\N	2.01	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-KS	USA	\N
\N	3.14	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-KS	USA	\N
\N	1.86	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-KY	USA	\N
\N	2.53	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-KY	USA	\N
\N	1.75	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-LA	USA	\N
\N	1.01	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-MN	USA	\N
\N	2.1	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-NC	USA	\N
\N	4.35	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-NC	USA	\N
\N	2.25	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-NM	USA	\N
\N	2.8	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-NV	USA	\N
\N	1.77	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-NY	USA	\N
\N	1.65	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-OK	USA	\N
\N	5.27	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-OR	USA	\N
\N	3.89	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-PA	USA	\N
\N	1.3	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-SC	USA	\N
\N	3.31	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TN	USA	\N
\N	7.38	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TN	USA	\N
\N	6.27	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	1.57	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	3.14	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	3.3	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	3.62	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	5.79	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	7.34	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	1.55	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-UT	USA	\N
\N	2.25	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-VA	USA	\N
\N	4.88	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-VA	USA	\N
\N	6.89	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-WA	USA	\N
\N	2.01	USD	\N	2016	kGal	TRA	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-WI	USA	\N
\N	5036.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-SA	AUS	\N
\N	3636.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	527.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	4426.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	668.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	3362.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	473.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	2000.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	4334.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-VIC	AUS	\N
\N	4636.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	1560.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	1560.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	5340.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	2100.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	1661.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	2900.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	875.0	AUD	\N	2018	ML	TRA	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AU-NSW	AUS	\N
\N	0.0181	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.014	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0177	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0196	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0221	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0171	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0162	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.026	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0342	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.011	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0148	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0211	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.1	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0115	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.0115	EUR	\N	2008	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.3088	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.2839	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.265	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.1861	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.8852	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.7266	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.184	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.1236	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.2608	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.4763	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.218	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.1512	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.4183	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	13.334	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	13.334	EUR	\N	2008	Cubic Meter	TRA	\N	https://www.oecd.org/eu/45015101.pdf	\N	GRC	\N
\N	0.015	EUR	\N	2003	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ITA	\N
\N	0.04	EUR	\N	2003	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ITA	\N
\N	0.1	EUR	\N	2003	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ITA	\N
\N	0.08	EUR	\N	2003	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ITA	\N
\N	0.1	EUR	\N	2003	Cubic Meter	TRA	NAICS 11	https://www.oecd.org/eu/45015101.pdf	\N	ITA	\N
\N	1.966	AUD	\N	2021	kL	REG	NAICS 92	https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	AU-SA	AUS	\N
\N	2.806	AUD	\N	2021	kL	REG	NAICS 92	https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	AU-SA	AUS	\N
\N	3.04	AUD	\N	2021	kL	REG	NAICS 92	https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	AU-SA	AUS	\N
\N	4.88	AUD	\N	2019	Cubic Meter	REG	NAICS 92	https://www.sciencedirect.com/science/article/pii/S2212428421000062	AU-ACT	AUS	\N
\N	0.49	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	MEX	\N
\N	0.77	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	KOR	\N
\N	1.23	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	PRT	\N
\N	1.4	USD	\N	2006	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	GRC	\N
\N	1.45	USD	\N	2008	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	ITA	\N
\N	1.58	USD	\N	2004	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	CAN	\N
\N	1.85	USD	\N	2003	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	JPN	\N
\N	1.92	USD	\N	2006	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	ESP	\N
\N	1.98	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	NZL	\N
\N	2.02	USD	\N	2005	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	HUN	\N
\N	2.12	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	POL	\N
\N	2.43	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	CZE	\N
\N	2.44	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	AUS	\N
\N	3.13	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	CHE	\N
\N	3.59	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	SWE	\N
\N	3.74	USD	\N	2004	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	FRA	\N
\N	3.82	USD	\N	2006	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	GBR	\N
\N	3.92	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	BEL	\N
\N	4.14	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	BEL	\N
\N	4.41	USD	\N	2008	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	FIN	\N
\N	5.72	USD	\N	2007	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	GBR	\N
\N	6.7	USD	\N	2006	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	DNK	\N
\N	0.53	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	CAN	\N
\N	0.63	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	NZL	\N
\N	0.66	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	KOR	\N
\N	0.66	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	ITA	\N
\N	0.85	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	CHE	\N
\N	0.87	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	ESP	\N
\N	0.94	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	AUS	\N
\N	0.98	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	GRC	\N
\N	1.06	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	LUX	\N
\N	1.09	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	FIN	\N
\N	1.17	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	AUT	\N
\N	1.2	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	PRT	\N
\N	1.22	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	POL	\N
\N	1.45	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	BEL	\N
\N	1.48	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	GBR	\N
\N	1.52	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	HUN	\N
\N	0.842	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	1.6	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	FRA	\N
\N	1.75	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	CZE	\N
\N	2.06	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	DEU	\N
\N	2.09	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	BEL	\N
\N	4.31	USD	\N	2009	Cubic Meter	TRA	NAICS 92	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	\N	GBR	\N
\N	0.28	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	CHN	\N
\N	0.5	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	CAN	\N
\N	0.53	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	USA	\N
\N	0.6	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	KOR	\N
\N	0.7	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	NZL	\N
\N	0.8	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	ITA	\N
\N	0.9	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	ESP	\N
\N	0.9	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	POL	\N
\N	1.0	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	GRC	\N
\N	1.0	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	AUT	\N
\N	1.1	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	HUN	\N
\N	1.2	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	AUS	\N
\N	1.2	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	CHE	\N
\N	1.2	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	PRT	\N
\N	1.3	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	CZE	\N
\N	1.7	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	FIN	\N
\N	1.8	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	GBR	\N
\N	1.9	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	FRA	\N
\N	2.3	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	NLD	\N
\N	2.5	USD	\N	2013	Cubic Meter	TRA	NAICS 92	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	\N	DEU	\N
\N	0.00414	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.0047	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00506	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00482	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00607	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00549	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00531	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.637	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-TE	ESP	\N
\N	0.00488	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00517	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00538	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	0.00419	USD	\N	2019	Cubic Meter	REG	NAICS 11	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	\N	CRI	\N
\N	7.02	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AK	USA	\N
\N	7.04	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AL	USA	\N
\N	1.53	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AR	USA	\N
\N	2.7	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-AZ	USA	\N
\N	5.29	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CA	USA	\N
\N	1.46	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-CA	USA	\N
\N	4.77	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	6.39	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	7.58	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	3.57	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	3.79	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-FL	USA	\N
\N	4.79	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-GA	USA	\N
\N	2.47	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-IL	USA	\N
\N	5.61	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-KS	USA	\N
\N	3.33	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-KS	USA	\N
\N	5.66	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-LA	USA	\N
\N	3.75	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-NC	USA	\N
\N	2.24	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-NM	USA	\N
\N	3.75	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-PA	USA	\N
\N	1.99	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-SC	USA	\N
\N	9.8	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TN	USA	\N
\N	5.92	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TN	USA	\N
\N	9.26	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	2.12	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	6.92	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	3.15	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	1.99	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	3.52	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-TX	USA	\N
\N	4.28	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-UT	USA	\N
\N	2.7	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-VA	USA	\N
\N	17.29	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-WA	USA	\N
\N	3.96	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-WI	USA	\N
\N	2.66	USD	\N	2016	kGal	TRA	NAICS 56	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	US-WI	USA	\N
\N	0.00093	USD	\N	2017	Cubic Meter	REG	NAICS 92	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00005	USD	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00002	USD	\N	2017	Cubic Meter	REG	NAICS 92	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00003	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00001	USD	\N	2017	Cubic Meter	REG	NAICS 81	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00129	USD	\N	2017	Cubic Meter	REG	NAICS 92	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00035	USD	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00002	USD	\N	2017	Cubic Meter	REG	NAICS 92	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00023	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00058	USD	\N	2017	Cubic Meter	REG	NAICS 81	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00263	USD	\N	2017	Cubic Meter	REG	NAICS 92	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00475	USD	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00475	USD	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00342	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00475	USD	\N	2017	Cubic Meter	REG	NAICS 71	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00232	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00022	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00022	USD	\N	2017	Cubic Meter	REG	NAICS 22	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00293	USD	\N	2017	Cubic Meter	REG	NAICS 92	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00585	USD	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00585	USD	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00445	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00585	USD	\N	2017	Cubic Meter	REG	NAICS 71	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00252	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.00029	USD	\N	2017	Cubic Meter	REG	NAICS 11	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	\N	CRI	\N
\N	0.75	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-PE	CAN	\N
\N	1.56	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-NS	CAN	\N
\N	1.79	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-NB	CAN	\N
\N	0.85	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-QC	CAN	\N
\N	1.96	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-ON	CAN	\N
\N	3.07	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-MB	CAN	\N
\N	1.78	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-SK	CAN	\N
\N	1.78	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-AB	CAN	\N
\N	1.27	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-BC	CAN	\N
\N	1.48	CAD	\N	2021	Cubic Meter	TRA	NAICS 92	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CA-NT	CAN	\N
\N	0.493	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	\N	\N
\N	0.418	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.381	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-P	ESP	\N
\N	0.494	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-BU	ESP	\N
\N	0.613	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-SA	ESP	\N
\N	0.409	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.598	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-SG	ESP	\N
\N	0.613	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-GU	ESP	\N
\N	0.591	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.553	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.702	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-S	ESP	\N
\N	0.64	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.589	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-SS	ESP	\N
\N	0.46	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.626	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-HU	ESP	\N
\N	0.604	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.76	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.632	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-ZA	ESP	\N
\N	0.52	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-VA	ESP	\N
\N	0.553	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.644	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-LO	ESP	\N
\N	0.404	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-SO	ESP	\N
\N	0.567	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-Z	ESP	\N
\N	0.446	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.68	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-TO	ESP	\N
\N	0.586	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-CU	ESP	\N
\N	0.828	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-CR	ESP	\N
\N	0.981	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-AB	ESP	\N
\N	0.717	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.699	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.703	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.62	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-O	ESP	\N
\N	1.079	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	1.166	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.83	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.756	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-BA	ESP	\N
\N	1.22	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.864	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-H	ESP	\N
\N	1.063	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	1.023	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.815	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-GR	ESP	\N
\N	0.982	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	1.513	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	ES-MU	ESP	\N
\N	1.382	EUR	\N	2015	Cubic Meter	TRA	NAICS 22	https://www.mdpi.com/2073-4441/7/4/1456	\N	ESP	\N
\N	0.93	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-L	MOZ	\N
\N	0.71	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-G	MOZ	\N
\N	0.72	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-G	MOZ	\N
\N	0.76	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-I	MOZ	\N
\N	0.83	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-I	MOZ	\N
\N	0.85	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-S	MOZ	\N
\N	0.69	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-B	MOZ	\N
\N	0.69	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-T	MOZ	\N
\N	0.83	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	\N	MOZ	\N
\N	0.83	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-N	MOZ	\N
\N	0.69	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-N	MOZ	\N
\N	0.69	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-N	MOZ	\N
\N	0.69	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-A	MOZ	\N
\N	0.69	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-A	MOZ	\N
\N	0.85	USD	\N	2012	Cubic Meter	TRA	NAICS 22	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	MZ-P	MOZ	\N
\N	0.027	USD	\N	2013	Cubic Meter	REG	NAICS 92	doi:10.5923/j.env.20130302.05	\N	SAU	\N
\N	0.04	USD	\N	2013	Cubic Meter	REG	NAICS 92	doi:10.5923/j.env.20130302.05	\N	SAU	\N
\N	0.53	USD	\N	2013	Cubic Meter	REG	NAICS 92	doi:10.5923/j.env.20130302.05	\N	SAU	\N
\N	1.07	USD	\N	2013	Cubic Meter	REG	NAICS 92	doi:10.5923/j.env.20130302.05	\N	SAU	\N
\N	1.6	USD	\N	2013	Cubic Meter	REG	NAICS 92	doi:10.5923/j.env.20130302.05	\N	SAU	\N
\N	0.09	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	AUS	\N
\N	0.09	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	AUS	\N
\N	1.46	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	AUS	\N
\N	0.7	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	CYP	\N
\N	0.19	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	CYP	\N
\N	0.56	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	CYP	\N
\N	0.77	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	CYP	\N
\N	0.1	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	FRA	\N
\N	0.15	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	FRA	\N
\N	0.75	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	FRA	\N
\N	1.1	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	FRA	\N
\N	3.4	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	FRA	\N
\N	1.42	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	FRA	\N
\N	1.45	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	FRA	\N
\N	0.022	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	MEX	\N
\N	0.32	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	MEX	\N
\N	0.35	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	MEX	\N
\N	0.8	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	NLD	\N
\N	1.64	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	NLD	\N
\N	1.0	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	NLD	\N
\N	2.0	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	NLD	\N
\N	0.00071	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	ROU	\N
\N	0.57	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	ROU	\N
\N	0.57	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	ROU	\N
\N	0.0262	EUR	\N	2012	Cubic Meter	TRA	NAICS 11	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	ESP	\N
\N	1.75	EUR	\N	2012	Cubic Meter	TRA	NAICS 31-33	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	ESP	\N
\N	1.47	EUR	\N	2012	Cubic Meter	TRA	NAICS 92	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	\N	ESP	\N
\N	32.8	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-01	MYS	\N
\N	33.3	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-01	MYS	\N
\N	16.4	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.5	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.6	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.8	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.4	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.6	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.8	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	17.1	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.05	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.15	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	16.2	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-02	MYS	\N
\N	18.92	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-03	MYS	\N
\N	19.46	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-03	MYS	\N
\N	19.5	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-03	MYS	\N
\N	27.0	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-04	MYS	\N
\N	27.05	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-04	MYS	\N
\N	27.15	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-04	MYS	\N
\N	16.85	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-05	MYS	\N
\N	17.7	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-05	MYS	\N
\N	30.92	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-06	MYS	\N
\N	30.84	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-06	MYS	\N
\N	21.45	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-06	MYS	\N
\N	10.99	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-06	MYS	\N
\N	1.45	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-06	MYS	\N
\N	12.85	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	13.05	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	13.3	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	13.45	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	15.0	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	57.0	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	13.2	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-08	MYS	\N
\N	13.4	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-08	MYS	\N
\N	13.61	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-08	MYS	\N
\N	9.3	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-09	MYS	\N
\N	6.1	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-09	MYS	\N
\N	51.15	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-11	MYS	\N
\N	15.95	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-11	MYS	\N
\N	16.15	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-11	MYS	\N
\N	18.7	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	19.2	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	38.07	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	38.28	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	\N	MYS	\N
\N	71.6	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-12	MYS	\N
\N	72.0	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-12	MYS	\N
\N	24.1	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-12	MYS	\N
\N	24.5	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-12	MYS	\N
\N	22.97	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	23.06	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	19.53	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	19.65	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	25.25	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	25.52	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	24.2	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	25.41	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	20.9	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	21.89	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	19.53	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	19.65	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	22.95	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	23.2	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	20.88	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	23.2	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	20.88	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	20.96	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	17.75	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\N	17.85	MYR	\N	2017	Cubic Meter	REG	NAICS 31-33	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MY-13	MYS	\N
\.


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (nat_code);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (curr_code);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_code);


--
-- Name: sector sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (sector_code);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (source_uri);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (type_id);


--
-- Name: value_price value_price_curr_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_curr_code_fkey FOREIGN KEY (curr_code) REFERENCES public.currency(curr_code);


--
-- Name: value_price value_price_nat_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_nat_code_fkey FOREIGN KEY (nat_code) REFERENCES public.country(nat_code);


--
-- Name: value_price value_price_region_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_region_code_fkey FOREIGN KEY (region_code) REFERENCES public.region(region_code);


--
-- Name: value_price value_price_sector_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_sector_code_fkey FOREIGN KEY (sector_code) REFERENCES public.sector(sector_code);


--
-- Name: value_price value_price_source_uri_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_source_uri_fkey FOREIGN KEY (source_uri) REFERENCES public.source(source_uri);


--
-- Name: value_price value_price_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- PostgreSQL database dump complete
--

