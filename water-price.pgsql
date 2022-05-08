--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: water_price; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE water_price WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE water_price OWNER TO postgres;

\connect water_price

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
-- Name: community; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.community (
    com_id character varying(255) NOT NULL,
    com_name character varying(255) NOT NULL,
    nation_id character(3)
);


ALTER TABLE public.community OWNER TO postgres;

--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    cmp_id character varying(255) NOT NULL,
    cmp_name character varying(255) NOT NULL,
    water_sector_id character varying(255),
    cmp_product character varying(255),
    nation_id character(3)
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    nat_id character(3) NOT NULL,
    nat_name character varying(255) NOT NULL,
    nat_continent character varying(255) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    curr_id character varying(4) NOT NULL,
    curr_name character varying(255) NOT NULL,
    nation_id character(3),
    curr_conversion double precision
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: non_human; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.non_human (
    nh_id character varying(255) NOT NULL,
    nh_name character varying(255) NOT NULL,
    nh_type character varying(255)
);


ALTER TABLE public.non_human OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    reg_id integer NOT NULL,
    reg_name character varying(255) NOT NULL,
    reg_level character varying(255),
    nation_id character(3),
    reg_sealevel double precision
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_reg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_reg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_reg_id_seq OWNER TO postgres;

--
-- Name: region_reg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_reg_id_seq OWNED BY public.region.reg_id;


--
-- Name: researcher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.researcher (
    rsc_id integer NOT NULL,
    rsc_last_name character varying(30),
    rsc_first_name character varying(30),
    rsc_org_name character varying(255),
    rsc_bio text,
    rsc_affiliations character varying(255)
);


ALTER TABLE public.researcher OWNER TO postgres;

--
-- Name: source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source (
    src_uri text NOT NULL,
    src_title character varying(255) NOT NULL,
    src_date character varying(255),
    src_description text,
    src_belief character varying(255),
    src_author_role character varying(255),
    src_author_notes character varying(255),
    researcher_id text,
    nation_id character(3),
    company_id character(255),
    community_id character(255)
);


ALTER TABLE public.source OWNER TO postgres;

--
-- Name: value_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.value_price (
    vp_id integer NOT NULL,
    vp_num double precision NOT NULL,
    vp_date integer NOT NULL,
    vp_water_unit character varying(255),
    vp_time character varying(255),
    vp_type character varying(255),
    vp_water_treatment character varying(255),
    vp_region_specific character varying(255),
    vp_indigenous_territory character varying(255),
    source_uri text,
    currency_id character(3) NOT NULL,
    water_impact_id character varying(255),
    water_type_id character varying(255),
    water_source_id character varying(255),
    water_sector_id character varying(255),
    region_name character varying(255),
    company_id character varying(255),
    community_id character varying(255),
    location character varying(255),
    nation_id character(3)
);


ALTER TABLE public.value_price OWNER TO postgres;

--
-- Name: value_price_vp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.value_price_vp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.value_price_vp_id_seq OWNER TO postgres;

--
-- Name: value_price_vp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.value_price_vp_id_seq OWNED BY public.value_price.vp_id;


--
-- Name: water_impact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_impact (
    water_impact_id character varying(255) NOT NULL,
    water_impact_name character varying(255) NOT NULL,
    water_impact_description text,
    water_impact_source character varying(255) NOT NULL
);


ALTER TABLE public.water_impact OWNER TO postgres;

--
-- Name: water_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_source (
    water_source_id character varying(255) NOT NULL,
    water_source_name character varying(255) NOT NULL,
    water_source_description text
);


ALTER TABLE public.water_source OWNER TO postgres;

--
-- Name: water_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_type (
    water_type_id character varying(255) NOT NULL,
    water_type_name character varying(255) NOT NULL,
    water_type_description text
);


ALTER TABLE public.water_type OWNER TO postgres;

--
-- Name: water_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_user (
    water_sect_id character varying(255) NOT NULL,
    water_sect_name character varying(255) NOT NULL,
    water_sect_description character varying(255),
    water_sect_source character varying(255)
);


ALTER TABLE public.water_user OWNER TO postgres;

--
-- Name: region reg_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN reg_id SET DEFAULT nextval('public.region_reg_id_seq'::regclass);


--
-- Name: value_price vp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price ALTER COLUMN vp_id SET DEFAULT nextval('public.value_price_vp_id_seq'::regclass);


--
-- Data for Name: community; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.community (com_id, com_name, nation_id) FROM stdin;
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (cmp_id, cmp_name, water_sector_id, cmp_product, nation_id) FROM stdin;
8001	Aguas Cha�ar	\N	Utilities?	\N
8002	Team Poly	\N	Utilities?	\N
8003	SA Water	\N	Utilities?	\N
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (nat_id, nat_name, nat_continent) FROM stdin;
AFG	Afghanistan	AS
ALA	�land Islands	EU
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
CIV	C�te d'Ivoire	AF
HRV	Croatia	EU
CUB	Cuba	NA
CUW	Cura�ao	NA
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
REU	R�union	AF
ROU	Romania	EU
RUS	Russian Federation	EU
RWA	Rwanda	AF
BLM	Saint Barth�lemy	NA
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

COPY public.currency (curr_id, curr_name, nation_id, curr_conversion) FROM stdin;
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
BOB	Bolivia Bol�viano	BOL	\N
BRL	Brazil Real	BRA	\N
BSD	Bahamas Dollar	BHS	\N
BTN	Bhutan Ngultrum	BTN	\N
BWP	Botswana Pula	BWA	\N
BYN	Belarus Ruble	BLR	\N
BZD	Belize Dollar	BLZ	\N
CAD	Canada Dollar	CAN	\N
CDF	Congo/Kinshasa Franc	COG	\N
CHF	Switzerland Franc	CHE	\N
CLP	Chile Peso	CHL	0.0013
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
MXN	Mexico Peso	MEX	0.05
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
PEN	Peru Sol	PER	0.24
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
STN	S�o Tom� and Pr�ncipe Dobra	STP	\N
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
USD	United States Dollar	USA	1
UYU	Uruguay Peso	URY	\N
UZS	Uzbekistan Som	UZB	\N
VEF	Venezuela Bol�var	VEN	\N
VND	Viet Nam Dong	VNM	\N
VUV	Vanuatu Vatu	VUT	\N
WST	Samoa Tala	WSM	\N
XAF	Communaut� Financi�re Africaine (BEAC) CFA Franc BEAC	\N	\N
XCD	East Caribbean Dollar	\N	\N
XDR	International Monetary Fund (IMF) Special Drawing Rights	\N	\N
XOF	Communaut� Financi�re Africaine (BCEAO) Franc	\N	\N
XPF	Comptoirs Fran�ais du Pacifique (CFP) Franc	\N	\N
YER	Yemen Rial	YEM	\N
ZAR	South Africa Rand	ZAF	\N
ZMW	Zambia Kwacha	ZMB	\N
ZWD	Zimbabwe Dollar	ZWE	\N
\.


--
-- Data for Name: non_human; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.non_human (nh_id, nh_name, nh_type) FROM stdin;
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (reg_id, reg_name, reg_level, nation_id, reg_sealevel) FROM stdin;
1	Canillo	Parish	AND	\N
2	Encamp	Parish	AND	\N
3	La Massana	Parish	AND	\N
4	Ordino	Parish	AND	\N
5	Sant Juli� de L�ria	Parish	AND	\N
6	Andorra la Vella	Parish	AND	\N
7	Escaldes-Engordany	Parish	AND	\N
8	'Ajman	Emirate	ARE	\N
9	Abu Z?aby [Abu Dhabi]	Emirate	ARE	\N
10	Dubayy [Dubai]	Emirate	ARE	\N
11	Al Fujayrah	Emirate	ARE	\N
12	Ra�s al Khaymah	Emirate	ARE	\N
13	Ash Shariqah [Sharjah]	Emirate	ARE	\N
14	Umm al Qaywayn	Emirate	ARE	\N
15	Balkh	Province	AFG	\N
16	Bamyan	Province	AFG	\N
17	Badghis	Province	AFG	\N
18	Badakhshan	Province	AFG	\N
19	Baghlan	Province	AFG	\N
20	Daykundi	Province	AFG	\N
21	Farah	Province	AFG	\N
22	Faryab	Province	AFG	\N
23	Ghazni	Province	AFG	\N
24	Ghor	Province	AFG	\N
25	Helmand	Province	AFG	\N
26	Herat	Province	AFG	\N
27	Jowzjan	Province	AFG	\N
28	Kabul	Province	AFG	\N
29	Kandahar	Province	AFG	\N
30	Kapisa	Province	AFG	\N
31	Kunduz	Province	AFG	\N
32	Khost	Province	AFG	\N
33	Kuna?	Province	AFG	\N
34	Laghman	Province	AFG	\N
35	Logar	Province	AFG	\N
36	Nangarhar	Province	AFG	\N
37	Nimroz	Province	AFG	\N
38	Nuristan	Province	AFG	\N
39	Panjshayr	Province	AFG	\N
40	Parwan	Province	AFG	\N
41	Paktiya	Province	AFG	\N
42	Paktika	Province	AFG	\N
43	Samangan	Province	AFG	\N
44	Sar-e Pul	Province	AFG	\N
45	Takhar	Province	AFG	\N
46	Uruzgan	Province	AFG	\N
47	Wardak	Province	AFG	\N
48	Zabul	Province	AFG	\N
49	Saint George	Parish	ATG	\N
50	Saint John	Parish	ATG	\N
51	Saint Mary	Parish	ATG	\N
52	Saint Paul	Parish	ATG	\N
53	Saint Peter	Parish	ATG	\N
54	Saint Philip	Parish	ATG	\N
55	Barbuda	Dependency	ATG	\N
56	Redonda	\N	ATG	\N
57	Berat	County	ALB	\N
58	Durr�s	County	ALB	\N
59	Elbasan	County	ALB	\N
60	Fier	County	ALB	\N
61	Gjirokast�r	County	ALB	\N
62	Kor��	County	ALB	\N
63	Kuk�s	County	ALB	\N
64	Lezh�	County	ALB	\N
65	Dib�r	County	ALB	\N
66	Shkod�r	County	ALB	\N
67	Tiran�	County	ALB	\N
68	Vlor�	County	ALB	\N
69	Aragac?otn	Region	ARM	\N
70	Ararat	Region	ARM	\N
71	Armavir	Region	ARM	\N
72	Erevan	City	ARM	\N
73	Gegark'unik'	Region	ARM	\N
74	Kotayk'	Region	ARM	\N
75	Lo?i	Region	ARM	\N
76	�irak	Region	ARM	\N
77	Syunik'	Region	ARM	\N
78	Tavu�	Region	ARM	\N
79	Vayoc Jor	Region	ARM	\N
80	Bengo	Province	AGO	\N
81	Benguela	Province	AGO	\N
82	Bi�	Province	AGO	\N
83	Cabinda	Province	AGO	\N
84	Cuando Cubango	Province	AGO	\N
85	Cunene	Province	AGO	\N
86	Cuanza-Norte	Province	AGO	\N
87	Cuanza-Sul	Province	AGO	\N
88	Huambo	Province	AGO	\N
89	Hu�la	Province	AGO	\N
90	Lunda-Norte	Province	AGO	\N
91	Lunda Sul	Province	AGO	\N
92	Luanda	Province	AGO	\N
93	Malange	Province	AGO	\N
94	Moxico	Province	AGO	\N
95	Namibe	Province	AGO	\N
96	U�ge	Province	AGO	\N
97	Zaire	Province	AGO	\N
98	Salta	Province	ARG	\N
99	Buenos Aires	Province	ARG	\N
100	Ciudad Aut�noma de Buenos Aires	City	ARG	\N
101	San Luis	Province	ARG	\N
102	Entre R�os	Province	ARG	\N
103	La Rioja	Province	ARG	\N
104	Santiago del Estero	Province	ARG	\N
105	Chaco	Province	ARG	\N
106	San Juan	Province	ARG	\N
107	Catamarca	Province	ARG	\N
108	La Pampa	Province	ARG	\N
109	Mendoza	Province	ARG	\N
110	Misiones	Province	ARG	\N
111	Formosa	Province	ARG	\N
112	Neuqu�n	Province	ARG	\N
113	R�o Negro	Province	ARG	\N
114	Santa Fe	Province	ARG	\N
115	Tucum�n	Province	ARG	\N
116	Chubut	Province	ARG	\N
117	Tierra del Fuego	Province	ARG	\N
118	Corrientes	Province	ARG	\N
119	C�rdoba	Province	ARG	\N
120	Jujuy	Province	ARG	\N
121	Santa Cruz	Province	ARG	\N
122	Burgenland	state	AUT	\N
123	K�rnten	state	AUT	\N
124	Nieder�sterreich	state	AUT	\N
125	Ober�sterreich	state	AUT	\N
126	Salzburg	state	AUT	\N
127	Steiermark	state	AUT	\N
128	Tirol	state	AUT	\N
129	Vorarlberg	state	AUT	\N
130	Wien	state	AUT	\N
131	Australian Capital Territory	Territory	AUS	\N
132	New South Wales	State	AUS	\N
133	Northern Territory	Territory	AUS	\N
134	Queensland	State	AUS	\N
135	South Australia	State	AUS	\N
136	Tasmania	State	AUS	\N
137	Victoria	State	AUS	\N
138	Western Australia	State	AUS	\N
139	Abseron	Rayon	AZE	\N
140	Agstafa	Rayon	AZE	\N
141	Agcab?di	Rayon	AZE	\N
142	Agdam	Rayon	AZE	\N
143	Agdas	Rayon	AZE	\N
144	Agsu	Rayon	AZE	\N
145	Astara	Rayon	AZE	\N
146	Baki	Municipality	AZE	\N
147	Bab?k	Rayon	AZE	\N
148	Balak?n	Rayon	AZE	\N
149	B?rd?	Rayon	AZE	\N
150	Beyl?qan	Rayon	AZE	\N
151	Bil?suvar	Rayon	AZE	\N
152	C?brayil	Rayon	AZE	\N
153	C?lilabad	Rayon	AZE	\N
154	Culfa	Rayon	AZE	\N
155	Dask?s?n	Rayon	AZE	\N
156	F�zuli	Rayon	AZE	\N
157	G?nc?	Municipality	AZE	\N
158	G?d?b?y	Rayon	AZE	\N
159	Goranboy	Rayon	AZE	\N
160	G�y�ay	Rayon	AZE	\N
161	G�yg�l	Rayon	AZE	\N
162	Haciqabul	Rayon	AZE	\N
163	Imisli	Rayon	AZE	\N
164	Ismayilli	Rayon	AZE	\N
165	K?lb?c?r	Rayon	AZE	\N
166	K?ng?rli	Rayon	AZE	\N
167	K�rd?mir	Rayon	AZE	\N
168	L?nk?ran	Municipality	AZE	\N
169	La�in	Rayon	AZE	\N
170	L?nk?ran	Rayon	AZE	\N
171	Lerik	Rayon	AZE	\N
172	Masalli	Rayon	AZE	\N
173	Ming?�evir	Municipality	AZE	\N
174	Naftalan	Municipality	AZE	\N
175	Neft�ala	Rayon	AZE	\N
176	Nax�ivan	Municipality	AZE	\N
177	Nax�ivan	Autonomous republic	AZE	\N
178	Oguz	Rayon	AZE	\N
179	Ordubad	Rayon	AZE	\N
180	Q?b?l?	Rayon	AZE	\N
181	Qax	Rayon	AZE	\N
182	Qazax	Rayon	AZE	\N
183	Quba	Rayon	AZE	\N
184	Qubadli	Rayon	AZE	\N
185	Qobustan	Rayon	AZE	\N
186	Qusar	Rayon	AZE	\N
187	S?ki	Municipality	AZE	\N
188	Sabirabad	Rayon	AZE	\N
189	S?d?r?k	Rayon	AZE	\N
190	Sahbuz	Rayon	AZE	\N
191	S?ki	Rayon	AZE	\N
192	Salyan	Rayon	AZE	\N
193	S?rur	Rayon	AZE	\N
194	Saatli	Rayon	AZE	\N
195	Sabran	Rayon	AZE	\N
196	Siy?z?n	Rayon	AZE	\N
197	S?mkir	Rayon	AZE	\N
198	Sumqayit	Municipality	AZE	\N
199	Samaxi	Rayon	AZE	\N
200	Samux	Rayon	AZE	\N
201	Sirvan	Municipality	AZE	\N
202	Susa	Rayon	AZE	\N
203	T?rt?r	Rayon	AZE	\N
204	Tovuz	Rayon	AZE	\N
205	Ucar	Rayon	AZE	\N
206	Xank?ndi	Municipality	AZE	\N
207	Xa�maz	Rayon	AZE	\N
208	Xocali	Rayon	AZE	\N
209	Xizi	Rayon	AZE	\N
210	Xocav?nd	Rayon	AZE	\N
211	Yardimli	Rayon	AZE	\N
212	Yevlax	Municipality	AZE	\N
213	Yevlax	Rayon	AZE	\N
214	Z?ngilan	Rayon	AZE	\N
215	Zaqatala	Rayon	AZE	\N
216	Z?rdab	Rayon	AZE	\N
217	Federacija Bosne i Hercegovine	Entity	BIH	\N
218	Brcko distrikt	District with special\r\nstatus	BIH	\N
219	Republika Srpska	Entity	BIH	\N
220	Christ Church	Parish	BRB	\N
221	Saint Andrew	Parish	BRB	\N
222	Saint George	Parish	BRB	\N
223	Saint James	Parish	BRB	\N
224	Saint John	Parish	BRB	\N
225	Saint Joseph	Parish	BRB	\N
226	Saint Lucy	Parish	BRB	\N
227	Saint Michael	Parish	BRB	\N
228	Saint Peter	Parish	BRB	\N
229	Saint Philip	Parish	BRB	\N
230	Saint Thomas	Parish	BRB	\N
231	Bandarban	District	BGD	\N
232	Barguna	District	BGD	\N
233	Bogura	District	BGD	\N
234	Brahmanbaria	District	BGD	\N
235	Bagerhat	District	BGD	\N
236	Barishal	District	BGD	\N
237	Bhola	District	BGD	\N
238	Cumilla	District	BGD	\N
239	Chandpur	District	BGD	\N
240	Chattogram	District	BGD	\N
241	Cox's Bazar	District	BGD	\N
242	Chuadanga	District	BGD	\N
243	Dhaka	District	BGD	\N
244	Dinajpur	District	BGD	\N
245	Faridpur	District	BGD	\N
246	Feni	District	BGD	\N
247	Gopalganj	District	BGD	\N
248	Gazipur	District	BGD	\N
249	Gaibandha	District	BGD	\N
250	Habiganj	District	BGD	\N
251	Jamalpur	District	BGD	\N
252	Jashore	District	BGD	\N
253	Jhenaidah	District	BGD	\N
254	Joypurhat	District	BGD	\N
255	Jhalakathi	District	BGD	\N
256	Kishoreganj	District	BGD	\N
257	Khulna	District	BGD	\N
258	Kurigram	District	BGD	\N
259	Khagrachhari	District	BGD	\N
260	Kushtia	District	BGD	\N
261	Lakshmipur	District	BGD	\N
262	Lalmonirhat	District	BGD	\N
263	Manikganj	District	BGD	\N
264	Mymensingh	District	BGD	\N
265	Munshiganj	District	BGD	\N
266	Madaripur	District	BGD	\N
267	Magura	District	BGD	\N
268	Moulvibazar	District	BGD	\N
269	Meherpur	District	BGD	\N
270	Narayanganj	District	BGD	\N
271	Netrakona	District	BGD	\N
272	Narsingdi	District	BGD	\N
273	Narail	District	BGD	\N
274	Natore	District	BGD	\N
275	Chapai Nawabganj	District	BGD	\N
276	Nilphamari	District	BGD	\N
277	Noakhali	District	BGD	\N
278	Naogaon	District	BGD	\N
279	Pabna	District	BGD	\N
280	Pirojpur	District	BGD	\N
281	Patuakhali	District	BGD	\N
282	Panchagarh	District	BGD	\N
283	Rajbari	District	BGD	\N
284	Rajshahi	District	BGD	\N
285	Rangpur	District	BGD	\N
286	Rangamati	District	BGD	\N
287	Sherpur	District	BGD	\N
288	Satkhira	District	BGD	\N
289	Sirajganj	District	BGD	\N
290	Sylhet	District	BGD	\N
291	Sunamganj	District	BGD	\N
292	Shariatpur	District	BGD	\N
293	Tangail	District	BGD	\N
294	Thakurgaon	District	BGD	\N
295	Bruxelles-Capitale, R�gion de	Region	BEL	\N
296	Antwerpen	Province	BEL	\N
297	Vlaams Brabant	Province	BEL	\N
298	Limburg	Province	BEL	\N
299	Oost-Vlaanderen	Province	BEL	\N
300	West-Vlaanderen	Province	BEL	\N
301	Brabant wallon	Province	BEL	\N
302	Hainaut	Province	BEL	\N
303	Li�ge	Province	BEL	\N
304	Luxembourg	Province	BEL	\N
305	Namur	Province	BEL	\N
306	Bal�	Province	BFA	\N
307	Bam	Province	BFA	\N
308	Banwa	Province	BFA	\N
309	Baz�ga\r\nga	Province	BFA	\N
310	Bougouriba	Province	BFA	\N
311	Boulgou	Province	BFA	\N
312	Boulkiemd�	Province	BFA	\N
313	Como�	Province	BFA	\N
314	Ganzourgou	Province	BFA	\N
315	Gnagna	Province	BFA	\N
316	Gourma	Province	BFA	\N
317	Houet	Province	BFA	\N
318	Ioba	Province	BFA	\N
319	Kadiogo	Province	BFA	\N
320	K�n�dougou	Province	BFA	\N
321	Komondjari	Province	BFA	\N
322	Kompienga	Province	BFA	\N
323	Koulp�logo	Province	BFA	\N
324	Kossi	Province	BFA	\N
325	Kouritenga	Province	BFA	\N
326	Kourw�ogo	Province	BFA	\N
327	L�raba	Province	BFA	\N
328	Loroum	Province	BFA	\N
329	Mouhoun	Province	BFA	\N
330	Namentenga	Province	BFA	\N
331	Nahouri	Province	BFA	\N
332	Nayala	Province	BFA	\N
333	Noumbiel	Province	BFA	\N
334	Oubritenga	Province	BFA	\N
335	Oudalan	Province	BFA	\N
336	Passor�	Province	BFA	\N
337	Poni	Province	BFA	\N
338	S�no	Province	BFA	\N
339	Sissili	Province	BFA	\N
340	Sanmatenga	Province	BFA	\N
341	Sangui�	Province	BFA	\N
342	Soum	Province	BFA	\N
343	Sourou	Province	BFA	\N
344	Tapoa	Province	BFA	\N
345	Tuy	Province	BFA	\N
346	Yagha	Province	BFA	\N
347	Yatenga	Province	BFA	\N
348	Ziro	Province	BFA	\N
349	Zondoma	Province	BFA	\N
350	Zoundw�ogo	Province	BFA	\N
351	Blagoevgrad	Region	BGR	\N
352	Burgas	Region	BGR	\N
353	Varna	Region	BGR	\N
354	Veliko Tarnovo	Region	BGR	\N
355	Vidin	Region	BGR	\N
356	Vratsa	Region	BGR	\N
357	Gabrovo	Region	BGR	\N
358	Dobrich	Region	BGR	\N
359	Kardzhali	Region	BGR	\N
360	Kjustendil	Region	BGR	\N
361	Lovech	Region	BGR	\N
362	Montana	Region	BGR	\N
363	Pazardzik	Region	BGR	\N
364	Pernik	Region	BGR	\N
365	Pleven	Region	BGR	\N
366	Plovdiv	Region	BGR	\N
367	Razgrad	Region	BGR	\N
368	Ruse	Region	BGR	\N
369	Silistra	Region	BGR	\N
370	Sliven	Region	BGR	\N
371	Smolyan	Region	BGR	\N
372	Sofia (stolitsa)	Region	BGR	\N
373	Sofia	Region	BGR	\N
374	Stara Zagora	Region	BGR	\N
375	Targovishte	Region	BGR	\N
376	Haskovo	Region	BGR	\N
377	Shumen	Region	BGR	\N
378	Yambol	Region	BGR	\N
379	Al �Asimah	Governorat	BHS	\N
380	Al Janubiyah	Governorat	BHS	\N
381	Al Mu?arraq	Governorat	BHS	\N
382	Ash Shamaliyah	Governorat	BHS	\N
383	Bubanza	Province	BDI	\N
384	Bujumbura Rural	Province	BDI	\N
385	Bujumbura Mairie	Province	BDI	\N
386	Bururi	Province	BDI	\N
387	Cankuzo	Province	BDI	\N
388	Cibitoke	Province	BDI	\N
389	Gitega	Province	BDI	\N
390	Kirundo	Province	BDI	\N
391	Karuzi	Province	BDI	\N
392	Kayanza	Province	BDI	\N
393	Makamba	Province	BDI	\N
394	Muramvya	Province	BDI	\N
395	Mwaro	Province	BDI	\N
396	Muyinga	Province	BDI	\N
397	Ngozi	Province	BDI	\N
398	Rumonge	province	BDI	\N
399	Rutana	Province	BDI	\N
400	Ruyigi	Province	BDI	\N
401	Atacora	 Department	BEN	\N
402	Alibori	 Department	BEN	\N
403	Atlantique	 Department	BEN	\N
404	Borgou	 Department	BEN	\N
405	Collines	 Department	BEN	\N
406	Donga	 Department	BEN	\N
407	Couffo	 Department	BEN	\N
408	Littoral	 Department	BEN	\N
409	Mono	 Department	BEN	\N
410	Ou�m�	 Department	BEN	\N
411	Plateau	 Department	BEN	\N
412	Zou	 Department	BEN	\N
413	Belait	District	BRN	\N
414	Brunei dan -Muara	District	BRN	\N
415	Temburong	District	BRN	\N
416	Tutong	District	BRN	\N
417	El Beni	 Department	BOL	\N
418	Cochabamba	 Department	BOL	\N
419	Chuquisaca	 Department	BOL	\N
420	La Paz	 Department	BOL	\N
421	Pando	 Department	BOL	\N
422	Oruro	 Department	BOL	\N
423	Potos�	 Department	BOL	\N
424	Santa Cruz	 Department	BOL	\N
425	Tarija	 Department	BOL	\N
426	Bonaire	Special Municipality	BES	\N
427	Saba	Special Municipality	BES	\N
428	Sint Eustatius	Special Municipality	BES	\N
429	Acre	State	BRA	\N
430	Alagoas	State	BRA	\N
431	Amazonas	State	BRA	\N
432	Amap�	State	BRA	\N
433	Bahia	State	BRA	\N
434	Cear�	State	BRA	\N
435	Distrito Federal	Federal district	BRA	\N
436	Esp�rito Santo	State	BRA	\N
437	Goi�s	State	BRA	\N
438	Maranh�o	State	BRA	\N
439	Minas Gerais	State	BRA	\N
440	Mato Grosso do Sul	State	BRA	\N
441	Mato Grosso	State	BRA	\N
442	Par�	State	BRA	\N
443	Para�ba	State	BRA	\N
444	Pernambuco	State	BRA	\N
445	Piau�	State	BRA	\N
446	Paran�	State	BRA	\N
447	Rio de Janeiro	State	BRA	\N
448	Rio Grande do Norte	State	BRA	\N
449	Rond�nia	State	BRA	\N
450	Roraima	State	BRA	\N
451	Rio Grande do Sul	State	BRA	\N
452	Santa Catarina	State	BRA	\N
453	Sergipe	State	BRA	\N
454	S�o Paulo	State	BRA	\N
455	Tocantins	State	BRA	\N
456	Acklins	District	BHS	\N
457	Bimini	District	BHS	\N
458	Black Point	District	BHS	\N
459	Berry Islands	District	BHS	\N
460	Central Eleuthera	District	BHS	\N
461	Cat Island	District	BHS	\N
462	Crooked Island and Long Cay	District	BHS	\N
463	Central Abaco	District	BHS	\N
464	Central Andros	District	BHS	\N
465	East Grand Bahama	District	BHS	\N
466	Exuma	District	BHS	\N
467	City of Freeport	District	BHS	\N
468	Grand Cay	District	BHS	\N
469	Harbour Island	District	BHS	\N
470	Hope Town	District	BHS	\N
471	Inagua	District	BHS	\N
472	Long Island	District	BHS	\N
473	Mangrove Cay	District	BHS	\N
474	Mayaguana	District	BHS	\N
475	Moore's Island	District	BHS	\N
476	North Eleuthera	District	BHS	\N
477	North Abaco	District	BHS	\N
478	New Providence	Island	BHS	\N
479	North Andros	District	BHS	\N
480	Rum Cay	District	BHS	\N
481	Ragged Island	District	BHS	\N
482	South Andros	District	BHS	\N
483	South Eleuthera	District	BHS	\N
484	South Abaco	District	BHS	\N
485	San Salvador	District	BHS	\N
486	Spanish Wells	District	BHS	\N
487	West Grand Bahama	District	BHS	\N
488	Paro	District	BTN	\N
489	Chhukha	District	BTN	\N
490	Haa	District	BTN	\N
491	Samtse	District	BTN	\N
492	Thimphu	District	BTN	\N
493	Tsirang	District	BTN	\N
494	Dagana	District	BTN	\N
495	Punakha	District	BTN	\N
496	Wangdue Phodrang	District	BTN	\N
497	Sarpang	District	BTN	\N
498	Trongsa	District	BTN	\N
499	Bumthang	District	BTN	\N
500	Zhemgang	District	BTN	\N
501	Trashigang	District	BTN	\N
502	Monggar	District	BTN	\N
503	Pema Gatshel	District	BTN	\N
504	Lhuentse	District	BTN	\N
505	Samdrup Jongkhar	District	BTN	\N
506	Gasa	District	BTN	\N
507	Trashi Yangtse	District	BTN	\N
508	Central	District	BWA	\N
509	Chobe	District	BWA	\N
510	Francistown	City	BWA	\N
511	Gaborone	City	BWA	\N
512	Ghanzi	District	BWA	\N
513	Jwaneng	Town	BWA	\N
514	Kgalagadi	District	BWA	\N
515	Kgatleng	District	BWA	\N
516	Kweneng	District	BWA	\N
517	Lobatse	Town	BWA	\N
518	North East	District	BWA	\N
519	North West	District	BWA	\N
520	South East	District	BWA	\N
521	Southern	District	BWA	\N
522	Selibe Phikwe	Town	BWA	\N
523	Sowa Town	Town	BWA	\N
524	Bresckaja voblasc (be) - Brestskaja oblast' (ru)	Oblast	BLR	\N
525	Horad Minsk	City	BLR	\N
526	Homyel'skaya voblasts' (be) - Gomel'skaya oblast' (ru)	Oblast	BLR	\N
527	Hrodzyenskaya voblasts' (be) - Grodnenskaya oblast' (ru)	Oblast	BLR	\N
528	Mahilyowskaya voblasts' (be) - Mogilevskaya oblast' (ru)	Oblast	BLR	\N
529	Minskaya voblasts' (be) - Minskaya oblast' (ru)	Oblast	BLR	\N
530	Vitsyebskaya voblasts' (be) - Vitebskaya oblast' (ru)	Oblast	BLR	\N
531	Belize	District	BLZ	\N
532	Cayo	District	BLZ	\N
533	Corozal	District	BLZ	\N
534	Orange Walk	District	BLZ	\N
535	Stann Creek	District	BLZ	\N
536	Toledo	District	BLZ	\N
537	Alberta	Province	CAN	\N
538	British Columbia	Province	CAN	\N
539	Manitoba	Province	CAN	\N
540	New Brunswick	Province	CAN	\N
541	Newfoundland and Labrador	Province	CAN	\N
542	Nova Scotia	Province	CAN	\N
543	Northwest Territories	Territory	CAN	\N
544	Nunavut	Territory	CAN	\N
545	Ontario	Province	CAN	\N
546	Prince Edward Island	Province	CAN	\N
547	Quebec	Province	CAN	\N
548	Saskatchewan	Province	CAN	\N
549	Yukon	Territory	CAN	\N
550	Kongo Central	Province	COD	\N
551	Bas-U�l�	Province	COD	\N
552	�quateur	Province	COD	\N
553	Haut-Katanga	Province	COD	\N
554	Haut-Lomami	Province	COD	\N
555	Haut-U�l�	Province	COD	\N
556	Ituri	Province	COD	\N
557	Kasa� Central	Province	COD	\N
558	Kasa� Oriental	Province	COD	\N
559	Kwango	Province	COD	\N
560	Kwilu	Province	COD	\N
561	Kinshasa	City	COD	\N
562	Kasa�	Province	COD	\N
563	Lomami	Province	COD	\N
564	Lualaba	Province	COD	\N
565	Maniema	Province	COD	\N
566	Mai-Ndombe	Province	COD	\N
567	Mongala	Province	COD	\N
568	Nord-Kivu	Province	COD	\N
569	Nord-Ubangi	Province	COD	\N
570	Sankuru	Province	COD	\N
571	Sud-Kivu	Province	COD	\N
572	Sud-Ubangi	Province	COD	\N
573	Tanganyika	Province	COD	\N
574	Tshopo	Province	COD	\N
575	Tshuapa	Province	COD	\N
576	Ouham	Prefecture	CAF	\N
577	Bamingui-Bangoran	Prefecture	CAF	\N
578	Bangui	Commune	CAF	\N
579	Basse-Kotto	Prefecture	CAF	\N
580	Haute-Kotto	Prefecture	CAF	\N
581	Haut-Mbomou	Prefecture	CAF	\N
582	Mamb�r�-Kad��	Prefecture	CAF	\N
583	Gribingui	economic prefecture	CAF	\N
584	K�mo-Gribingui	Prefecture	CAF	\N
585	Lobaye	Prefecture	CAF	\N
586	Mbomou	Prefecture	CAF	\N
587	Ombella-Mpoko	Prefecture	CAF	\N
588	Nana-Mamb�r�	Prefecture	CAF	\N
589	Ouham-Pend�	Prefecture	CAF	\N
590	Sangha	economic prefecture	CAF	\N
591	Ouaka	Prefecture	CAF	\N
592	Vakaga	Prefecture	CAF	\N
593	Bouenza	 Department	COG	\N
594	Pool	 Department	COG	\N
595	Sangha	 Department	COG	\N
596	Plateaux	 Department	COG	\N
597	Cuvette-Ouest	 Department	COG	\N
598	Pointe-Noire	 Department	COG	\N
599	L�koumou	 Department	COG	\N
600	Kouilou	 Department	COG	\N
601	Likouala	 Department	COG	\N
602	Cuvette	 Department	COG	\N
603	Niari	 Department	COG	\N
604	Brazzaville	 Department	COG	\N
605	Aargau (de)	Canton	CHE	\N
606	Appenzell Innerrhoden (de)	Canton	CHE	\N
607	Appenzell Ausserrhoden (de)	Canton	CHE	\N
608	Bern (de)	Canton	CHE	\N
609	Basel-Landschaft (de)	Canton	CHE	\N
610	Basel-Stadt (de)	Canton	CHE	\N
611	Fribourg (fr)	Canton	CHE	\N
612	Gen�ve (fr)	Canton	CHE	\N
613	Glarus (de)	Canton	CHE	\N
614	Graub�nden (de)	Canton	CHE	\N
615	Jura (fr)	Canton	CHE	\N
616	Luzern (de)	Canton	CHE	\N
617	Neuch�tel (fr)	Canton	CHE	\N
618	Nidwalden (de)	Canton	CHE	\N
619	Obwalden (de)	Canton	CHE	\N
620	Sankt Gallen (de)	Canton	CHE	\N
621	Schaffhausen (de)	Canton	CHE	\N
622	Solothurn (de)	Canton	CHE	\N
623	Schwyz (de)	Canton	CHE	\N
624	Thurgau (de)	Canton	CHE	\N
625	Ticino (it)	Canton	CHE	\N
626	Uri (de)	Canton	CHE	\N
627	Vaud (fr)	Canton	CHE	\N
628	Valais (fr)	Canton	CHE	\N
629	Zug (de)	Canton	CHE	\N
630	Z�rich (de)	Canton	CHE	\N
631	Abidjan	autonomous district	CIV	\N
632	Bas-Sassandra	district	CIV	\N
633	Como�	district	CIV	\N
634	Dengu�l�	district	CIV	\N
635	G�h-Djiboua	district	CIV	\N
636	Lacs	district	CIV	\N
637	Lagunes	district	CIV	\N
638	Montagnes	district	CIV	\N
639	Sassandra-Marahou�	district	CIV	\N
640	Savanes	district	CIV	\N
641	Vall�e du Bandama	district	CIV	\N
642	Woroba	district	CIV	\N
643	Yamoussoukro	autonomous district	CIV	\N
644	Zanzan	district	CIV	\N
645	Ais�n del General Carlos Iba�ez del Campo	Region	CHL	\N
646	Antofagasta	Region	CHL	\N
647	Arica y Parinacota	Region	CHL	\N
648	La Araucan�a	Region	CHL	\N
649	Atacama	Region	CHL	\N
650	Biob�o	Region	CHL	\N
651	Coquimbo	Region	CHL	\N
652	Libertador General Bernardo O'Higgins	Region	CHL	\N
653	Los Lagos	Region	CHL	\N
654	Los R�os	Region	CHL	\N
655	Magallanes	Region	CHL	\N
656	Maule	Region	CHL	\N
657	�uble	Region	CHL	\N
658	Regi�n Metropolitana de Santiago	Region	CHL	\N
659	Tarapac�	Region	CHL	\N
660	Valpara�so	Region	CHL	\N
661	Adamaoua	Region	CMR	\N
662	Centre	Region	CMR	\N
663	Far North	Region	CMR	\N
664	East	Region	CMR	\N
665	Littoral	Region	CMR	\N
666	North	Region	CMR	\N
667	North-West	Region	CMR	\N
668	West	Region	CMR	\N
669	South	Region	CMR	\N
670	South-West	Region	CMR	\N
671	Anhui Sheng	Province	CHN	\N
672	Beijing Shi	Municipality	CHN	\N
673	Chongqing Shi	Municipality	CHN	\N
674	Fujian Sheng	Province	CHN	\N
675	Guangdong Sheng	Province	CHN	\N
676	Gansu Sheng	Province	CHN	\N
677	Guangxi Zhuangzu Zizhiqu	Autonomous Region	CHN	\N
678	Guizhou Sheng	Province	CHN	\N
679	Henan Sheng	Province	CHN	\N
680	Hubei Sheng	Province	CHN	\N
681	Hebei Sheng	Province	CHN	\N
682	Hainan Sheng	Province	CHN	\N
683	Hong Kong SAR	Special Administrative Region	CHN	\N
684	Heilongjiang Sheng	Province	CHN	\N
685	Hunan Sheng	Province	CHN	\N
686	Jilin Sheng	Province	CHN	\N
687	Jiangsu Sheng	Province	CHN	\N
688	Jiangxi Sheng	Province	CHN	\N
689	Liaoning Sheng	Province	CHN	\N
690	Macao SAR	Special Administrative Region	CHN	\N
691	Nei Mongol Zizhiqu	Autonomous Region	CHN	\N
692	Ningxia Huizu Zizhiqu	Autonomous Region	CHN	\N
693	Qinghai Sheng	Province	CHN	\N
694	Sichuan Sheng	Province	CHN	\N
695	Shandong Sheng	Province	CHN	\N
696	Shanghai Shi	Municipality	CHN	\N
697	Shaanxi Sheng	Province	CHN	\N
698	Shanxi Sheng	Province	CHN	\N
699	Tianjin Shi	Municipality	CHN	\N
700	Taiwan Sheng	Province	CHN	\N
701	Xinjiang Uygur Zizhiqu	Autonomous Region	CHN	\N
702	Xizang Zizhiqu	Autonomous Region	CHN	\N
703	Yunnan Sheng	Province	CHN	\N
704	Zhejiang Sheng	Province	CHN	\N
705	Amazonas	 Department	COL	\N
706	Antioquia	 Department	COL	\N
707	Arauca	 Department	COL	\N
708	Atl�ntico	 Department	COL	\N
709	Bol�var	 Department	COL	\N
710	Boyac�	 Department	COL	\N
711	Caldas	 Department	COL	\N
712	Caquet�	 Department	COL	\N
713	Casanare	 Department	COL	\N
714	Cauca	 Department	COL	\N
715	Cesar	 Department	COL	\N
716	Choc�	 Department	COL	\N
717	C�rdoba	 Department	COL	\N
718	Cundinamarca	 Department	COL	\N
719	Distrito Capital de Bogot�	Capital district	COL	\N
720	Guain�a	 Department	COL	\N
721	Guaviare	 Department	COL	\N
722	Huila	 Department	COL	\N
723	La Guajira	 Department	COL	\N
724	Magdalena	 Department	COL	\N
725	Meta	 Department	COL	\N
726	Nari�o	 Department	COL	\N
727	Norte de Santander	 Department	COL	\N
728	Putumayo	 Department	COL	\N
729	Quind�o	 Department	COL	\N
730	Risaralda	 Department	COL	\N
731	Santander	 Department	COL	\N
732	San Andr�s, Providencia y Santa Catalina	 Department	COL	\N
733	Sucre	 Department	COL	\N
734	Tolima	 Department	COL	\N
735	Valle del Cauca	 Department	COL	\N
736	Vaup�s	 Department	COL	\N
737	Vichada	 Department	COL	\N
738	Alajuela	Province	CRI	\N
739	Cartago	Province	CRI	\N
740	Guanacaste	Province	CRI	\N
741	Heredia	Province	CRI	\N
742	Lim�n	Province	CRI	\N
743	Puntarenas	Province	CRI	\N
744	San Jos�	Province	CRI	\N
745	Pinar del R�o	Province	CUB	\N
746	La Habana	Province	CUB	\N
747	Ciudad de La Habana	Province	CUB	\N
748	Matanzas	Province	CUB	\N
749	Villa Clara	Province	CUB	\N
750	Cienfuegos	Province	CUB	\N
751	Sancti Sp�ritus	Province	CUB	\N
752	Ciego de �vila	Province	CUB	\N
753	Camag�ey	Province	CUB	\N
754	Las Tunas	Province	CUB	\N
755	Holgu�n	Province	CUB	\N
756	Granma	Province	CUB	\N
757	Santiago de Cuba	Province	CUB	\N
758	Guant�namo	Province	CUB	\N
759	Artemisa	Province	CUB	\N
760	Mayabeque	Province	CUB	\N
761	Isla de la Juventud	Special municipality	CUB	\N
762	Brava	Municipality	CPV	\N
763	Boa Vista	Municipality	CPV	\N
764	Santa Catarina	Municipality	CPV	\N
765	Santa Catarina do Fogo	Municipality	CPV	\N
766	Santa Cruz	Municipality	CPV	\N
767	Maio	Municipality	CPV	\N
768	Mosteiros	Municipality	CPV	\N
769	Paul	Municipality	CPV	\N
770	Porto Novo	Municipality	CPV	\N
771	Praia	Municipality	CPV	\N
772	Ribeira Brava	Municipality	CPV	\N
773	Ribeira Grande	Municipality	CPV	\N
774	Ribeira Grande de Santiago	Municipality	CPV	\N
775	S�o Domingos	Municipality	CPV	\N
776	S�o Filipe	Municipality	CPV	\N
777	Sal	Municipality	CPV	\N
778	S�o Miguel	Municipality	CPV	\N
779	S�o Louren�o dos �rg�os	Municipality	CPV	\N
780	S�o Salvador do Mundo	Municipality	CPV	\N
781	S�o Vicente	Municipality	CPV	\N
782	Tarrafal	Municipality	CPV	\N
783	Tarrafal de S�o Nicolau	Municipality	CPV	\N
784	Lefkosia	District	CYP	\N
785	Lemesos	District	CYP	\N
786	Larnaka	District	CYP	\N
787	Ammochostos	District	CYP	\N
788	Pafos	District	CYP	\N
789	Keryneia	District	CYP	\N
790	Praha, Hlavn� mesto	Region	CZE	\N
791	Stredocesk? kraj	Region	CZE	\N
792	Jihocesk? kraj	Region	CZE	\N
793	Plzensk? kraj	Region	CZE	\N
794	Karlovarsk? kraj	Region	CZE	\N
795	?steck? kraj	Region	CZE	\N
796	Libereck? kraj	Region	CZE	\N
797	Kr�lov�hradeck? kraj	Region	CZE	\N
798	Pardubick? kraj	Region	CZE	\N
799	Kraj Vysocina	Region	CZE	\N
800	Jihomoravsk? kraj	Region	CZE	\N
801	Olomouck? kraj	Region	CZE	\N
802	Zl�nsk? kraj	Region	CZE	\N
803	Moravskoslezsk? kraj	Region	CZE	\N
804	Brandenburg	Land	DEU	\N
805	Berlin	Land	DEU	\N
806	Baden-W�rttemberg	Land	DEU	\N
807	Bayern	Land	DEU	\N
808	Bremen	Land	DEU	\N
809	Hessen	Land	DEU	\N
810	Hamburg	Land	DEU	\N
811	Mecklenburg-Vorpommern	Land	DEU	\N
812	Niedersachsen	Land	DEU	\N
813	Nordrhein-Westfalen	Land	DEU	\N
814	Rheinland-Pfalz	Land	DEU	\N
815	Schleswig-Holstein	Land	DEU	\N
816	Saarland	Land	DEU	\N
817	Sachsen	Land	DEU	\N
818	Sachsen-Anhalt	Land	DEU	\N
819	Th�ringen	Land	DEU	\N
820	Arta	Region	DJI	\N
821	Ali Sabieh	Region	DJI	\N
822	Dikhil	Region	DJI	\N
823	Djibouti	City	DJI	\N
824	Obock	Region	DJI	\N
825	Tadjourah	Region	DJI	\N
826	Nordjylland	Region	DNK	\N
827	Midtjylland	Region	DNK	\N
828	Syddanmark	Region	DNK	\N
829	Hovedstaden	Region	DNK	\N
830	Sj�lland	Region	DNK	\N
831	Saint Andrew	Parish	DMA	\N
832	Saint David	Parish	DMA	\N
833	Saint George	Parish	DMA	\N
834	Saint John	Parish	DMA	\N
835	Saint Joseph	Parish	DMA	\N
836	Saint Luke	Parish	DMA	\N
837	Saint Mark	Parish	DMA	\N
838	Saint Patrick	Parish	DMA	\N
839	Saint Paul	Parish	DMA	\N
840	Saint Peter	Parish	DMA	\N
841	Distrito Nacional (Santo Domingo)	District	DOM	\N
842	Azua	Province	DOM	\N
843	Baoruco	Province	DOM	\N
844	Barahona	Province	DOM	\N
845	Dajab�n	Province	DOM	\N
846	Duarte	Province	DOM	\N
847	El�as Pi�a	Province	DOM	\N
848	El Seibo	Province	DOM	\N
849	Espaillat	Province	DOM	\N
850	Independencia	Province	DOM	\N
851	La Altagracia	Province	DOM	\N
852	La Romana	Province	DOM	\N
853	La Vega	Province	DOM	\N
854	Mar�a Trinidad S�nchez	Province	DOM	\N
855	Monte Cristi	Province	DOM	\N
856	Pedernales	Province	DOM	\N
857	Peravia	Province	DOM	\N
858	Puerto Plata	Province	DOM	\N
859	Hermanas Mirabal	Province	DOM	\N
860	Saman�	Province	DOM	\N
861	San Crist�bal	Province	DOM	\N
862	San Juan	Province	DOM	\N
863	San Pedro de Macor�s	Province	DOM	\N
864	S�nchez Ram�rez	Province	DOM	\N
865	Santiago	Province	DOM	\N
866	Santiago Rodr�guez	Province	DOM	\N
867	Valverde	Province	DOM	\N
868	Monse�or Nouel	Province	DOM	\N
869	Monte Plata	Province	DOM	\N
870	Hato Mayor	Province	DOM	\N
871	San Jos� de Ocoa	Province	DOM	\N
872	Santo Domingo	Province	DOM	\N
873	Cibao Nordeste	Region	DOM	\N
874	Cibao Noroeste	Region	DOM	\N
875	Cibao Norte	Region	DOM	\N
876	Cibao Sur	Region	DOM	\N
877	El Valle	Region	DOM	\N
878	Enriquillo	Region	DOM	\N
879	Higuamo	Region	DOM	\N
880	Ozama	Region	DOM	\N
881	Valdesia	Region	DOM	\N
882	Yuma	Region	DOM	\N
883	Adrar	Province	\N	\N
884	Chlef	Province	\N	\N
885	Laghouat	Province	\N	\N
886	Oum el Bouaghi	Province	\N	\N
887	Batna	Province	\N	\N
888	B�ja�a	Province	\N	\N
889	Biskra	Province	\N	\N
890	B�char	Province	\N	\N
891	Blida	Province	\N	\N
892	Bouira	Province	\N	\N
893	Tamanrasset	Province	\N	\N
894	T�bessa	Province	\N	\N
895	Tlemcen	Province	\N	\N
896	Tiaret	Province	\N	\N
897	Tizi Ouzou	Province	\N	\N
898	Alger	Province	\N	\N
899	Djelfa	Province	\N	\N
900	Jijel	Province	\N	\N
901	S�tif	Province	\N	\N
902	Sa�da	Province	\N	\N
903	Skikda	Province	\N	\N
904	Sidi Bel Abb�s	Province	\N	\N
905	Annaba	Province	\N	\N
906	Guelma	Province	\N	\N
907	Constantine	Province	\N	\N
908	M�d�a	Province	\N	\N
909	Mostaganem	Province	\N	\N
910	M'sila	Province	\N	\N
911	Mascara	Province	\N	\N
912	Ouargla	Province	\N	\N
913	Oran	Province	\N	\N
914	El Bayadh	Province	\N	\N
915	Illizi	Province	\N	\N
916	Bordj Bou Arr�ridj	Province	\N	\N
917	Boumerd�s	Province	\N	\N
918	El Tarf	Province	\N	\N
919	Tindouf	Province	\N	\N
920	Tissemsilt	Province	\N	\N
921	El Oued	Province	\N	\N
922	Khenchela	Province	\N	\N
923	Souk Ahras	Province	\N	\N
924	Tipaza	Province	\N	\N
925	Mila	Province	\N	\N
926	A�n Defla	Province	\N	\N
927	Naama	Province	\N	\N
928	A�n T�mouchent	Province	\N	\N
929	Gharda�a	Province	\N	\N
930	Relizane	Province	\N	\N
931	Azuay	Province	ECU	\N
932	Bol�var	Province	ECU	\N
933	Carchi	Province	ECU	\N
934	Orellana	Province	ECU	\N
935	Esmeraldas	Province	ECU	\N
936	Ca�ar	Province	ECU	\N
937	Guayas	Province	ECU	\N
938	Chimborazo	Province	ECU	\N
939	Imbabura	Province	ECU	\N
940	Loja	Province	ECU	\N
941	Manab�	Province	ECU	\N
942	Napo	Province	ECU	\N
943	El Oro	Province	ECU	\N
944	Pichincha	Province	ECU	\N
945	Los R�os	Province	ECU	\N
946	Morona-Santiago	Province	ECU	\N
947	Santo Domingo de los Ts�chilas	Province	ECU	\N
948	Santa Elena	Province	ECU	\N
949	Tungurahua	Province	ECU	\N
950	Sucumb�os	Province	ECU	\N
951	Gal�pagos	Province	ECU	\N
952	Cotopaxi	Province	ECU	\N
953	Pastaza	Province	ECU	\N
954	Zamora Chinchipe	Province	ECU	\N
955	Harjumaa	County	EST	\N
956	Hiiumaa	County	EST	\N
957	Ida-Virumaa	County	EST	\N
958	J?gevamaa	County	EST	\N
959	J�rvamaa	County	EST	\N
960	L��nemaa	County	EST	\N
961	L��ne-Virumaa	County	EST	\N
962	P?lvamaa	County	EST	\N
963	P�rnumaa	County	EST	\N
964	Raplamaa	County	EST	\N
965	Saaremaa	County	EST	\N
966	Tartumaa	County	EST	\N
967	Valgamaa	County	EST	\N
968	Viljandimaa	County	EST	\N
969	V?rumaa	County	EST	\N
970	AI Iskandariyah	Governorate	EGY	\N
971	Aswan	Governorate	EGY	\N
972	Asyut	Governorate	EGY	\N
973	Al Ba?r al A?mar	Governorate	EGY	\N
974	Al Bu?ayrah	Governorate	EGY	\N
975	Bani Suwayf	Governorate	EGY	\N
976	AI Qahirah	Governorate	EGY	\N
977	Ad Daqahliyah	Governorate	EGY	\N
978	Dumyat	Governorate	EGY	\N
979	AI Fayyum	Governorate	EGY	\N
980	AI Gharbiyah	Governorate	EGY	\N
981	AI Jizah	Governorate	EGY	\N
982	AI Isma 'iliyah	Governorate	EGY	\N
983	Janub Sina'	Governorate	EGY	\N
984	AI Qalyubiyah	Governorate	EGY	\N
985	Kafr ash Shaykh	Governorate	EGY	\N
986	Qina	Governorate	EGY	\N
987	Al Uqsur	Governorate	EGY	\N
988	AI Minya	Governorate	EGY	\N
989	AI Minufiyah	Governorate	EGY	\N
990	Matruh	Governorate	EGY	\N
991	Bur Sa'id	Governorate	EGY	\N
992	Suhaj	Governorate	EGY	\N
993	Ash Sharqiyah	Governorate	EGY	\N
994	Shamal Sina'	Governorate	EGY	\N
995	As Suways	Governorate	EGY	\N
996	AI Wadi al Jadid	Governorate	EGY	\N
997	�Anseba	Region	ERI	\N
998	Debubawi K�eyyi? Ba?ri	Region	ERI	\N
999	Debub	Region	ERI	\N
1000	Gash-Barka	Region	ERI	\N
1001	Ma�ikel	Region	ERI	\N
1002	Semienawi K�eyyi? Ba?ri	Region	ERI	\N
1003	Alicante / Alacant	Province	ESP	\N
1004	Albacete	Province	ESP	\N
1005	Almer�a	Province	ESP	\N
1006	�vila	Province	ESP	\N
1007	Barcelona  [Barcelona]	Province	ESP	\N
1008	Badajoz	Province	ESP	\N
1009	Biskaia	Province	ESP	\N
1010	Burgos	Province	ESP	\N
1011	A Coru�a  [La Coru�a]	Province	ESP	\N
1012	C�diz	Province	ESP	\N
1013	C�ceres	Province	ESP	\N
1014	Ceuta	Autonomous city in North Africa	ESP	\N
1015	C�rdoba	Province	ESP	\N
1016	Ciudad Real	Province	ESP	\N
1017	Castell�n / Castell�	Province	ESP	\N
1018	Cuenca	Province	ESP	\N
1019	Las Palmas	Province	ESP	\N
1020	Girona  [Gerona]	Province	ESP	\N
1021	Granada	Province	ESP	\N
1022	Guadalajara	Province	ESP	\N
1023	Huelva	Province	ESP	\N
1024	Huesca	Province	ESP	\N
1025	Ja�n	Province	ESP	\N
1026	Lleida  [L�rida]	Province	ESP	\N
1027	Le�n	Province	ESP	\N
1028	La Rioja	Province	ESP	\N
1029	Lugo  [Lugo]	Province	ESP	\N
1030	Madrid	Province	ESP	\N
1031	M�laga	Province	ESP	\N
1032	Melilla	Autonomous city in North Africa	ESP	\N
1033	Murcia	Province	ESP	\N
1034	Navarra / Nafarroa	Province	ESP	\N
1035	Asturias	Province	ESP	\N
1036	Ourense  [Orense]	Province	ESP	\N
1037	Palencia	Province	ESP	\N
1038	Illes Balears [Islas Baleares]	Province	ESP	\N
1039	Pontevedra  [Pontevedra]	Province	ESP	\N
1040	Cantabria	Province	ESP	\N
1041	Salamanca	Province	ESP	\N
1042	Sevilla	Province	ESP	\N
1043	Segovia	Province	ESP	\N
1044	Soria	Province	ESP	\N
1045	Gipuzkoa	Province	ESP	\N
1046	Tarragona  [Tarragona]	Province	ESP	\N
1047	Teruel	Province	ESP	\N
1048	Santa Cruz de Tenerife	Province	ESP	\N
1049	Toledo	Province	ESP	\N
1050	Valencia / Val�ncia	Province	ESP	\N
1051	Valladolid	Province	ESP	\N
1052	�lava / Araba	Province	ESP	\N
1053	Zaragoza	Province	ESP	\N
1054	Zamora	Province	ESP	\N
1055	Adis Abeba	Administration	ETH	\N
1056	Afar	Regional State	ETH	\N
1057	Amara	Regional State	ETH	\N
1058	Binshangul Gumuz	Regional State	ETH	\N
1059	Dire Dawa	Administration	ETH	\N
1060	Gambela Hizboch	Regional State	ETH	\N
1061	Hareri Hizb	Regional State	ETH	\N
1062	Oromiya	Regional State	ETH	\N
1063	YeDebub Biheroch Bihereseboch na Hizboch	Regional State	ETH	\N
1064	Sumale	Regional State	ETH	\N
1065	Tigray	Regional State	ETH	\N
1066	Ahvenanmaan maakunta	Region	FIN	\N
1067	Etel�-Karjala	Region	FIN	\N
1068	Etel�-Pohjanmaa	Region	FIN	\N
1069	Etel�-Savo	Region	FIN	\N
1070	Kainuu	Region	FIN	\N
1071	Kanta-H�me	Region	FIN	\N
1072	Keski-Pohjanmaa	Region	FIN	\N
1073	Keski-Suomi	Region	FIN	\N
1074	Kymenlaakso	Region	FIN	\N
1075	Lappi	Region	FIN	\N
1076	Pirkanmaa	Region	FIN	\N
1077	Pohjanmaa	Region	FIN	\N
1078	Pohjois-Karjala	Region	FIN	\N
1079	Pohjois-Pohjanmaa	Region	FIN	\N
1080	Pohjois-Savo	Region	FIN	\N
1081	P�ij�t-H�me	Region	FIN	\N
1082	Satakunta	Region	FIN	\N
1083	Uusimaa	Region	FIN	\N
1084	Varsinais-Suomi	Region	FIN	\N
1085	Ba	Province	FJI	\N
1086	Bua	Province	FJI	\N
1087	Cakaudrove	Province	FJI	\N
1088	Kadavu	Province	FJI	\N
1089	Lau	Province	FJI	\N
1090	Lomaiviti	Province	FJI	\N
1091	Macuata	Province	FJI	\N
1092	Nadroga and Navosa	Province	FJI	\N
1093	Naitasiri	Province	FJI	\N
1094	Namosi	Province	FJI	\N
1095	Ra	Province	FJI	\N
1096	Rewa	Province	FJI	\N
1097	Serua	Province	FJI	\N
1098	Tailevu	Province	FJI	\N
1099	Rotuma	Dependency	FJI	\N
1100	Kosrae	State	FSM	\N
1101	Pohnpei	State	FSM	\N
1102	Chuuk	State	FSM	\N
1103	Yap	State	FSM	\N
1104	Ain	Metropolitan department	FRA	\N
1105	Aisne	Metropolitan department	FRA	\N
1106	Allier	Metropolitan department	FRA	\N
1107	Alpes-de-Haute-Provence	Metropolitan department	FRA	\N
1108	Hautes-Alpes	Metropolitan department	FRA	\N
1109	Alpes-Maritimes	Metropolitan department	FRA	\N
1110	Ard�che	Metropolitan department	FRA	\N
1111	Ardennes	Metropolitan department	FRA	\N
1112	Ari�ge	Metropolitan department	FRA	\N
1113	Aube	Metropolitan department	FRA	\N
1114	Aude	Metropolitan department	FRA	\N
1115	Aveyron	Metropolitan department	FRA	\N
1116	Bouches-du-Rh�ne	Metropolitan department	FRA	\N
1117	Calvados	Metropolitan department	FRA	\N
1118	Cantal	Metropolitan department	FRA	\N
1119	Charente	Metropolitan department	FRA	\N
1120	Charente-Maritime	Metropolitan department	FRA	\N
1121	Cher	Metropolitan department	FRA	\N
1122	Corr�ze	Metropolitan department	FRA	\N
1123	C�te-d'Or	Metropolitan department	FRA	\N
1124	C�tes-d'Armor	Metropolitan department	FRA	\N
1125	Creuse	Metropolitan department	FRA	\N
1126	Dordogne	Metropolitan department	FRA	\N
1127	Doubs	Metropolitan department	FRA	\N
1128	Dr�me	Metropolitan department	FRA	\N
1129	Eure	Metropolitan department	FRA	\N
1130	Eure-et-Loir	Metropolitan department	FRA	\N
1131	Finist�re	Metropolitan department	FRA	\N
1132	Corse-du-Sud	Metropolitan department	FRA	\N
1133	Haute-Corse	Metropolitan department	FRA	\N
1134	Gard	Metropolitan department	FRA	\N
1135	Haute-Garonne	Metropolitan department	FRA	\N
1136	Gers	Metropolitan department	FRA	\N
1137	Gironde	Metropolitan department	FRA	\N
1138	H�rault	Metropolitan department	FRA	\N
1139	Ille-et-Vilaine	Metropolitan department	FRA	\N
1140	Indre	Metropolitan department	FRA	\N
1141	Indre-et-Loire	Metropolitan department	FRA	\N
1142	Is�re	Metropolitan department	FRA	\N
1143	Jura	Metropolitan department	FRA	\N
1144	Landes	Metropolitan department	FRA	\N
1145	Loir-et-Cher	Metropolitan department	FRA	\N
1146	Loire	Metropolitan department	FRA	\N
1147	Haute-Loire	Metropolitan department	FRA	\N
1148	Loire-Atlantique	Metropolitan department	FRA	\N
1149	Loiret	Metropolitan department	FRA	\N
1150	Lot	Metropolitan department	FRA	\N
1151	Lot-et-Garonne	Metropolitan department	FRA	\N
1152	Loz�re	Metropolitan department	FRA	\N
1153	Maine-et-Loire	Metropolitan department	FRA	\N
1154	Manche	Metropolitan department	FRA	\N
1155	Marne	Metropolitan department	FRA	\N
1156	Haute-Marne	Metropolitan department	FRA	\N
1157	Mayenne	Metropolitan department	FRA	\N
1158	Meurthe-et-Moselle	Metropolitan department	FRA	\N
1159	Meuse	Metropolitan department	FRA	\N
1160	Morbihan	Metropolitan department	FRA	\N
1161	Moselle	Metropolitan department	FRA	\N
1162	Ni�vre	Metropolitan department	FRA	\N
1163	Nord	Metropolitan department	FRA	\N
1164	Oise	Metropolitan department	FRA	\N
1165	Orne	Metropolitan department	FRA	\N
1166	Pas-de-Calais	Metropolitan department	FRA	\N
1167	Puy-de-D�me	Metropolitan department	FRA	\N
1168	Pyr�n�es-Atlantiques	Metropolitan department	FRA	\N
1169	Hautes-Pyr�n�es	Metropolitan department	FRA	\N
1170	Pyr�n�es-Orientales	Metropolitan department	FRA	\N
1171	Bas-Rhin	Metropolitan department	FRA	\N
1172	Haut-Rhin	Metropolitan department	FRA	\N
1173	Rh�ne	Metropolitan department	FRA	\N
1174	Haute-Sa�ne	Metropolitan department	FRA	\N
1175	Sa�ne-et-Loire	Metropolitan department	FRA	\N
1176	Sarthe	Metropolitan department	FRA	\N
1177	Savoie	Metropolitan department	FRA	\N
1178	Haute-Savoie	Metropolitan department	FRA	\N
1179	Paris	Metropolitan department	FRA	\N
1180	Seine-Maritime	Metropolitan department	FRA	\N
1181	Seine-et-Marne	Metropolitan department	FRA	\N
1182	Yvelines	Metropolitan department	FRA	\N
1183	Deux-S�vres	Metropolitan department	FRA	\N
1184	Somme	Metropolitan department	FRA	\N
1185	Tarn	Metropolitan department	FRA	\N
1186	Tarn-et-Garonne	Metropolitan department	FRA	\N
1187	Var	Metropolitan department	FRA	\N
1188	Vaucluse	Metropolitan department	FRA	\N
1189	Vend�e	Metropolitan department	FRA	\N
1190	Vienne	Metropolitan department	FRA	\N
1191	Haute-Vienne	Metropolitan department	FRA	\N
1192	Vosges	Metropolitan department	FRA	\N
1193	Yonne	Metropolitan department	FRA	\N
1194	Territoire de Belfort	Metropolitan department	FRA	\N
1195	Essonne	Metropolitan department	FRA	\N
1196	Hauts-de-Seine	Metropolitan department	FRA	\N
1197	Seine-Saint-Denis	Metropolitan department	FRA	\N
1198	Val-de-Marne	Metropolitan department	FRA	\N
1199	Val-d'Oise	Metropolitan department	FRA	\N
1200	Estuaire	Province	GAB	\N
1201	Haut-Ogoou�	Province	GAB	\N
1202	Moyen-Ogoou�	Province	GAB	\N
1203	Ngouni�	Province	GAB	\N
1204	Nyanga	Province	GAB	\N
1205	Ogoou�-Ivindo	Province	GAB	\N
1206	Ogoou�-Lolo	Province	GAB	\N
1207	Ogoou�-Maritime	Province	GAB	\N
1208	Woleu-Ntem	Province	GAB	\N
1209	Armagh City, Banbridge and Craigavon	district	GBR	\N
1210	Aberdeenshire	Council area	GBR	\N
1211	Aberdeen City	Council area	GBR	\N
1212	Argyll and Bute	Council area	GBR	\N
1213	Isle of Anglesey [Sir Ynys M�n GB-YNM]	Unitary authority	GBR	\N
1214	Ards and North Down	district	GBR	\N
1215	Antrim and Newtownabbey	district	GBR	\N
1216	Angus	Council area	GBR	\N
1217	Bath and North East Somerset	Unitary authority	GBR	\N
1218	Blackburn with Darwen	Unitary authority	GBR	\N
1219	Bournemouth, Christchurch and Poole	unitary authority	GBR	\N
1220	Bedford	Council area	GBR	\N
1221	Barking and Dagenham	London borough	GBR	\N
1222	Brent	Council area	GBR	\N
1223	Bexley	Council area	GBR	\N
1224	Belfast City	District	GBR	\N
1225	Bridgend [Pen-y-bont ar Ogwr GB-POG]	Unitary authority	GBR	\N
1226	Blaenau Gwent	Unitary authority	GBR	\N
1227	Birmingham	Council area	GBR	\N
1228	Buckinghamshire	County	GBR	\N
1229	Barnet	Council area	GBR	\N
1230	Brighton and Hove	Unitary authority	GBR	\N
1231	Barnsley	Council area	GBR	\N
1232	Bolton	Council area	GBR	\N
1233	Blackpool	Unitary authority	GBR	\N
1234	Bracknell Forest	Unitary authority	GBR	\N
1235	Bradford	Council area	GBR	\N
1236	Bromley	Council area	GBR	\N
1237	Bristol, City of	Unitary authority	GBR	\N
1238	Bury	Council area	GBR	\N
1239	Cambridgeshire	County	GBR	\N
1240	Caerphilly [Caerffili GB-CAF]	Unitary authority	GBR	\N
1241	Central Bedfordshire	Unitary authority	GBR	\N
1242	Causeway Coast and Glens	district	GBR	\N
1243	Ceredigion [Sir Ceredigion]	Unitary authority	GBR	\N
1244	Cheshire East	Unitary authority	GBR	\N
1245	Cheshire West and Chester	Unitary authority	GBR	\N
1246	Calderdale	Council area	GBR	\N
1247	Clackmannanshire	Council area	GBR	\N
1248	Cumbria	County	GBR	\N
1249	Camden	Council area	GBR	\N
1250	Carmarthenshire [Sir Gaerfyrddin GB-GFY]	Unitary authority	GBR	\N
1251	Cornwall	Unitary authority	GBR	\N
1252	Coventry	Council area	GBR	\N
1253	Cardiff [Caerdydd GB-CRD]	Unitary authority	GBR	\N
1254	Croydon	Council area	GBR	\N
1255	Conwy	Unitary authority	GBR	\N
1256	Darlington	Unitary authority	GBR	\N
1257	Derbyshire	County	GBR	\N
1258	Denbighshire [Sir Ddinbych GB-DDB]	Unitary authority	GBR	\N
1259	Derby	Unitary authority	GBR	\N
1260	Devon	County	GBR	\N
1261	Dumfries and Galloway	Council area	GBR	\N
1262	Doncaster	Council area	GBR	\N
1263	Dundee City	Council area	GBR	\N
1264	Dorset	County	GBR	\N
1265	Derry and Strabane	district	GBR	\N
1266	Dudley	Council area	GBR	\N
1267	Durham, County	Unitary authority	GBR	\N
1268	Ealing	Council area	GBR	\N
1269	East Ayrshire	Council area	GBR	\N
1270	Edinburgh, City of	Council area	GBR	\N
1271	East Dunbartonshire	Council area	GBR	\N
1272	East Lothian	Council area	GBR	\N
1273	Eilean Siar	Council area	GBR	\N
1274	Enfield	Council area	GBR	\N
1275	East Renfrewshire	Council area	GBR	\N
1276	East Riding of Yorkshire	Unitary authority	GBR	\N
1277	Essex	County	GBR	\N
1278	East Sussex	County	GBR	\N
1279	Falkirk	Council area	GBR	\N
1280	Fife	Council area	GBR	\N
1281	Flintshire [Sir y Fflint GB-FFL]	Unitary authority	GBR	\N
1282	Fermanagh and Omagh	district	GBR	\N
1283	Gateshead	Council area	GBR	\N
1284	Glasgow City	Council area	GBR	\N
1285	Gloucestershire	County	GBR	\N
1286	Greenwich	Council area	GBR	\N
1287	Gwynedd	Unitary authority	GBR	\N
1288	Halton	Unitary authority	GBR	\N
1289	Hampshire	County	GBR	\N
1290	Havering	Council area	GBR	\N
1291	Hackney	Council area	GBR	\N
1292	Herefordshire	Unitary authority	GBR	\N
1293	Hillingdon	Council area	GBR	\N
1294	Highland	Council area	GBR	\N
1295	Hammersmith and Fulham	Council area	GBR	\N
1296	Hounslow	Council area	GBR	\N
1297	Hartlepool	Unitary authority	GBR	\N
1298	Hertfordshire	County	GBR	\N
1299	Harrow	Council area	GBR	\N
1300	Haringey	Council area	GBR	\N
1301	Isles of Scilly	Unitary authority	GBR	\N
1302	Isle of Wight	Unitary authority	GBR	\N
1303	Islington	Council area	GBR	\N
1304	Inverclyde	Council area	GBR	\N
1305	Kensington and Chelsea	Council area	GBR	\N
1306	Kent	County	GBR	\N
1307	Kingston upon Hull	Unitary authority	GBR	\N
1308	Kirklees	Council area	GBR	\N
1309	Kingston upon Thames	Council area	GBR	\N
1310	Knowsley	Council area	GBR	\N
1311	Lancashire	County	GBR	\N
1312	Lisburn and Castlereagh	district	GBR	\N
1313	Lambeth	Council area	GBR	\N
1314	Leicester	Unitary authority	GBR	\N
1315	Leeds	Council area	GBR	\N
1316	Leicestershire	County	GBR	\N
1317	Lewisham	Council area	GBR	\N
1318	Lincolnshire	County	GBR	\N
1319	Liverpool	Council area	GBR	\N
1320	London, City of	City Corporation	GBR	\N
1321	Luton	Unitary authority	GBR	\N
1322	Manchester	Council area	GBR	\N
1323	Middlesbrough	Unitary authority	GBR	\N
1324	Medway	Unitary authority	GBR	\N
1325	Mid and East Antrim	district	GBR	\N
1326	Milton Keynes	Unitary authority	GBR	\N
1327	Midlothian	Council area	GBR	\N
1328	Monmouthshire [Sir Fynwy GB-FYN]	Unitary authority	GBR	\N
1329	Merton	Council area	GBR	\N
1330	Moray	Council area	GBR	\N
1331	Merthyr Tydfil [Merthyr Tudful GB-MTU]	Unitary authority	GBR	\N
1332	Mid-Ulster	district	GBR	\N
1333	North Ayrshire	Council area	GBR	\N
1334	Northumberland	Unitary authority	GBR	\N
1335	North East Lincolnshire	Unitary authority	GBR	\N
1336	Newcastle upon Tyne	Council area	GBR	\N
1337	Norfolk	County	GBR	\N
1338	Nottingham	Unitary authority	GBR	\N
1339	North Lanarkshire	Council area	GBR	\N
1340	North Lincolnshire	Unitary authority	GBR	\N
1341	Newry, Mourne and Down	district	GBR	\N
1342	North Somerset	Unitary authority	GBR	\N
1343	Northamptonshire	County	GBR	\N
1344	Neath Port Talbot [Castell-nedd Port Talbot GB-CTL]	Unitary authority	GBR	\N
1345	Nottinghamshire	County	GBR	\N
1346	North Tyneside	Council area	GBR	\N
1347	Newham	Council area	GBR	\N
1348	Newport [Casnewydd GB-CNW]	Unitary authority	GBR	\N
1349	North Yorkshire	County	GBR	\N
1350	Oldham	Council area	GBR	\N
1351	Orkney Islands	Council area	GBR	\N
1352	Oxfordshire	County	GBR	\N
1353	Pembrokeshire [Sir Benfro GB-BNF]	Unitary authority	GBR	\N
1354	Perth and Kinross	Council area	GBR	\N
1355	Plymouth	Unitary authority	GBR	\N
1356	Portsmouth	Unitary authority	GBR	\N
1357	Powys	Unitary authority	GBR	\N
1358	Peterborough	Unitary authority	GBR	\N
1359	Redcar and Cleveland	Unitary authority	GBR	\N
1360	Rochdale	Council area	GBR	\N
1361	Rhondda Cynon Taff [Rhondda CynonTaf]	Unitary authority	GBR	\N
1362	Redbridge	Council area	GBR	\N
1363	Reading	Unitary authority	GBR	\N
1364	Renfrewshire	Council area	GBR	\N
1365	Richmond upon Thames	Council area	GBR	\N
1366	Rotherham	Council area	GBR	\N
1367	Rutland	Unitary authority	GBR	\N
1368	Sandwell	Council area	GBR	\N
1369	South Ayrshire	Council area	GBR	\N
1370	Scottish Borders	Council area	GBR	\N
1371	Suffolk	County	GBR	\N
1372	Sefton	Council area	GBR	\N
1373	South Gloucestershire	Unitary authority	GBR	\N
1374	Sheffield	Council area	GBR	\N
1375	St. Helens	Council area	GBR	\N
1376	Shropshire	Unitary authority	GBR	\N
1377	Stockport	Council area	GBR	\N
1378	Salford	Council area	GBR	\N
1379	Slough	Unitary authority	GBR	\N
1380	South Lanarkshire	Council area	GBR	\N
1381	Sunderland	Council area	GBR	\N
1382	Solihull	Council area	GBR	\N
1383	Somerset	County	GBR	\N
1384	Southend-on-Sea	Unitary authority	GBR	\N
1385	Surrey	County	GBR	\N
1386	Stoke-on-Trent	Unitary authority	GBR	\N
1387	Stirling	Council area	GBR	\N
1388	Southampton	Unitary authority	GBR	\N
1389	Sutton	Council area	GBR	\N
1390	Staffordshire	County	GBR	\N
1391	Stockton-on-Tees	Unitary authority	GBR	\N
1392	South Tyneside	Council area	GBR	\N
1393	Swansea [Abertawe GB-ATA]	Unitary authority	GBR	\N
1394	Swindon	Unitary authority	GBR	\N
1395	Southwark	Council area	GBR	\N
1396	Tameside	Council area	GBR	\N
1397	Telford and Wrekin	Unitary authority	GBR	\N
1398	Thurrock	Unitary authority	GBR	\N
1399	Torbay	Unitary authority	GBR	\N
1400	Torfaen [Tor-faen]	Unitary authority	GBR	\N
1401	Trafford	Council area	GBR	\N
1402	Tower Hamlets	Council area	GBR	\N
1403	Vale of Glamorgan, The [Bro Morgannwg GB-BMG]	Unitary authority	GBR	\N
1404	Warwickshire	County	GBR	\N
1405	West Berkshire	Unitary authority	GBR	\N
1406	West Dunbartonshire	Council area	GBR	\N
1407	Waltham Forest	Council area	GBR	\N
1408	Wigan	Council area	GBR	\N
1409	Wiltshire	Unitary authority	GBR	\N
1410	Wakefield	Council area	GBR	\N
1411	Walsall	Council area	GBR	\N
1412	West Lothian	Council area	GBR	\N
1413	Wolverhampton	Council area	GBR	\N
1414	Wandsworth	Council area	GBR	\N
1415	Windsor and Maidenhead	Unitary authority	GBR	\N
1416	Wokingham	Unitary authority	GBR	\N
1417	Worcestershire	County	GBR	\N
1418	Wirral	Council area	GBR	\N
1419	Warrington	Unitary authority	GBR	\N
1420	Wrexham [Wrecsam GB-WRC]	Unitary authority	GBR	\N
1421	Westminster	Council area	GBR	\N
1422	West Sussex	County	GBR	\N
1423	York	Unitary authority	GBR	\N
1424	Shetland Islands	Council area	GBR	\N
1425	Saint Andrew	Parish	GRD	\N
1426	Saint David	Parish	GRD	\N
1427	Saint George	Parish	GRD	\N
1428	Saint John	Parish	GRD	\N
1429	Saint Mark	Parish	GRD	\N
1430	Saint Patrick	Parish	GRD	\N
1431	Southern Grenadine Islands	Dependency	GRD	\N
1432	Abkhazia	Autonomous republic	GEO	\N
1433	Ajaria	Autonomous republic	GEO	\N
1434	Guria	Region	GEO	\N
1435	Imeret'i	Region	GEO	\N
1436	Kakhet'i	Region	GEO	\N
1437	K'vemo K'art'li	Region	GEO	\N
1438	Mts'khet'a-Mt'ianet'i	Region	GEO	\N
1439	Racha-Lech�khumi-K�vemo Svanet�i	Region	GEO	\N
1440	Samts'khe-Javakhet'i	Region	GEO	\N
1441	Shida K'art'li	Region	GEO	\N
1442	Samegrelo-Zemo Svanet'i	Region	GEO	\N
1443	T'bilisi	City	GEO	\N
1444	Greater Accra	Region	GHA	\N
1445	Ahafo	Region	GHA	\N
1446	Ashanti	Region	GHA	\N
1447	Bono East	Region	GHA	\N
1448	Bono	Region	GHA	\N
1449	Central	Region	GHA	\N
1450	Eastern	Region	GHA	\N
1451	North East	Region	GHA	\N
1452	Northern	Region	GHA	\N
1453	Oti	Region	GHA	\N
1454	Savannah	Region	GHA	\N
1455	Volta	Region	GHA	\N
1456	Upper East	Region	GHA	\N
1457	Upper West	Region	GHA	\N
1458	Western North	Region	GHA	\N
1459	Western	Region	GHA	\N
1460	Avannaata Kommunia	Municipality	GRL	\N
1461	Kommune Kujalleq	Municipality	GRL	\N
1462	Qeqqata Kommunia	Municipality	GRL	\N
1463	Kommune Qeqertalik	Municipality	GRL	\N
1464	Kommuneqarfik Sermersooq	Municipality	GRL	\N
1465	Banjul	City	GMB	\N
1466	Lower River	Division	GMB	\N
1467	Central River	Division	GMB	\N
1468	North Bank	Division	GMB	\N
1469	Upper River	Division	GMB	\N
1470	Western	Division	GMB	\N
1471	Beyla	Prefecture	GIN	\N
1472	Boffa	Prefecture	GIN	\N
1473	Bok�	Prefecture	GIN	\N
1474	Coyah	Prefecture	GIN	\N
1475	Dabola	Prefecture	GIN	\N
1476	Dinguiraye	Prefecture	GIN	\N
1477	Dalaba	Prefecture	GIN	\N
1478	Dubr�ka	Prefecture	GIN	\N
1479	Faranah	Prefecture	GIN	\N
1480	For�cariah	Prefecture	GIN	\N
1481	Fria	Prefecture	GIN	\N
1482	Gaoual	Prefecture	GIN	\N
1483	Gu�k�dou	Prefecture	GIN	\N
1484	Kankan	Prefecture	GIN	\N
1485	Koubia	Prefecture	GIN	\N
1486	Kindia	Prefecture	GIN	\N
1487	K�rouan�	Prefecture	GIN	\N
1488	Koundara	Prefecture	GIN	\N
1489	Kouroussa	Prefecture	GIN	\N
1490	Kissidougou	Prefecture	GIN	\N
1491	Lab�	Prefecture	GIN	\N
1492	L�louma	Prefecture	GIN	\N
1493	Lola	Prefecture	GIN	\N
1494	Macenta	Prefecture	GIN	\N
1495	Mandiana	Prefecture	GIN	\N
1496	Mali	Prefecture	GIN	\N
1497	Mamou	Prefecture	GIN	\N
1498	Nz�r�kor�	Prefecture	GIN	\N
1499	Pita	Prefecture	GIN	\N
1500	Siguiri	Prefecture	GIN	\N
1501	T�lim�l�	Prefecture	GIN	\N
1502	Tougu�	Prefecture	GIN	\N
1503	Yomou	Prefecture	GIN	\N
1504	Annob�n	Province	GNQ	\N
1505	Bioko Norte	Province	GNQ	\N
1506	Bioko Sur	Province	GNQ	\N
1507	Centro Sur	Province	GNQ	\N
1508	Djibloho	Province	GNQ	\N
1509	Ki�-Ntem	Province	GNQ	\N
1510	Litoral	Province	GNQ	\N
1511	Wele-Nzas	Province	GNQ	\N
1512	Anatolik� Makedon�a kai Thr�ki	Administrative region	GRC	\N
1513	Kentrik� Makedon�a	Administrative region	GRC	\N
1514	Dytiki Makedonia	Administrative region	GRC	\N
1515	�peiros	Administrative region	GRC	\N
1516	 Thessal�a	Administrative region	GRC	\N
1517	Ion�a N�sia	Administrative region	GRC	\N
1518	Dytik� Ell�da	Administrative region	GRC	\N
1519	Stere� Ell�da	Administrative region	GRC	\N
1520	Attik�	Administrative region	GRC	\N
1521	Pelop�nnisos	Administrative region	GRC	\N
1522	V�reio Aiga�o	Administrative region	GRC	\N
1523	N�tio Aiga�o	Administrative region	GRC	\N
1524	Kr�ti	Administrative region	GRC	\N
1525	Alta Verapaz	 Department	GTM	\N
1526	Baja Verapaz	 Department	GTM	\N
1527	Chimaltenango	 Department	GTM	\N
1528	Chiquimula	 Department	GTM	\N
1529	Escuintla	 Department	GTM	\N
1530	Guatemala	 Department	GTM	\N
1531	Huehuetenango	 Department	GTM	\N
1532	Izabal	 Department	GTM	\N
1533	Jalapa	 Department	GTM	\N
1534	Jutiapa	 Department	GTM	\N
1535	Pet�n	 Department	GTM	\N
1536	El Progreso	 Department	GTM	\N
1537	Quich�	 Department	GTM	\N
1538	Quetzaltenango	 Department	GTM	\N
1539	Retalhuleu	 Department	GTM	\N
1540	Sacatep�quez	 Department	GTM	\N
1541	San Marcos	 Department	GTM	\N
1542	Solol�	 Department	GTM	\N
1543	Santa Rosa	 Department	GTM	\N
1544	Suchitep�quez	 Department	GTM	\N
1545	Totonicap�n	 Department	GTM	\N
1546	Zacapa	 Department	GTM	\N
1547	Bafat�	Region	GNB	\N
1548	Bolama/Bijag�s	Region	GNB	\N
1549	Biombo	Region	GNB	\N
1550	Bissau	Autonomous sector	GNB	\N
1551	Cacheu	Region	GNB	\N
1552	Gab?	Region	GNB	\N
1553	Oio	Region	GNB	\N
1554	Quinara	Region	GNB	\N
1555	Tombali 	Region	GNB	\N
1556	Barima-Waini	Region	GUY	\N
1557	Cuyuni-Mazaruni	Region	GUY	\N
1558	Demerara-Mahaica	Region	GUY	\N
1559	East Berbice-Corentyne	Region	GUY	\N
1560	Essequibo Islands-West Demerara	Region	GUY	\N
1561	Mahaica-Berbice	Region	GUY	\N
1562	Pomeroon-Supenaam	Region	GUY	\N
1563	Potaro-Siparuni	Region	GUY	\N
1564	Upper Demerara-Berbice	Region	GUY	\N
1565	Upper Takutu-Upper Essequibo	Region	GUY	\N
1566	Atl�ntida	 Department	HND	\N
1567	Choluteca	 Department	HND	\N
1568	Col�n	 Department	HND	\N
1569	Comayagua	 Department	HND	\N
1570	Cop�n	 Department	HND	\N
1571	Cort�s	 Department	HND	\N
1572	El Para�so	 Department	HND	\N
1573	Francisco Moraz�n	 Department	HND	\N
1574	Gracias a Dios	 Department	HND	\N
1575	Islas de la Bah�a	 Department	HND	\N
1576	Intibuc�	 Department	HND	\N
1577	Lempira	 Department	HND	\N
1578	La Paz	 Department	HND	\N
1579	Ocotepeque	 Department	HND	\N
1580	Olancho	 Department	HND	\N
1581	Santa B�rbara	 Department	HND	\N
1582	Valle	 Department	HND	\N
1583	Yoro	 Department	HND	\N
1584	Zagrebacka �upanija	County	HRV	\N
1585	Krapinsko-zagorska �upanija	County	HRV	\N
1586	Sisacko-moslavacka �upanija	County	HRV	\N
1587	Karlovacka �upanija	County	HRV	\N
1588	Vara�dinska �upanija	County	HRV	\N
1589	Koprivnicko-kri�evacka �upanija	County	HRV	\N
1590	Bjelovarsko-bilogorska �upanija	County	HRV	\N
1591	Primorsko-goranska �upanija	County	HRV	\N
1592	Licko-senjska �upanija	County	HRV	\N
1593	Viroviticko-podravska �upanija	County	HRV	\N
1594	Po�e�ko-slavonska �upanija	County	HRV	\N
1595	Brodsko-posavska �upanija	County	HRV	\N
1596	Zadarska �upanija	County	HRV	\N
1597	Osjecko-baranjska �upanija	County	HRV	\N
1598	�ibensko-kninska �upanija	County	HRV	\N
1599	Vukovarsko-srijemska �upanija	County	HRV	\N
1600	Splitsko-dalmatinska �upanija	County	HRV	\N
1601	Istarska �upanija	County	HRV	\N
1602	Dubrovacko-neretvanska �upanija	County	HRV	\N
1603	Medimurska �upanija	County	HRV	\N
1604	Grad Zagreb	City	HRV	\N
1605	Artibonite	 Department	HTI	\N
1606	Centre	 Department	HTI	\N
1607	Grande�Anse	 Department	HTI	\N
1608	Nord	 Department	HTI	\N
1609	Nord-Est	 Department	HTI	\N
1610	Nippes	 Department	HTI	\N
1611	Nord-Ouest	 Department	HTI	\N
1612	Ouest	 Department	HTI	\N
1613	Sud	 Department	HTI	\N
1614	Sud-Est	 Department	HTI	\N
1615	Baranya	County	HUN	\N
1616	B�k�scsaba	City with county rights	HUN	\N
1617	B�k�s	County	HUN	\N
1618	B�cs-Kiskun	County	HUN	\N
1619	Budapest	Capital City	HUN	\N
1620	Borsod-Aba?j-Zempl�n	County	HUN	\N
1621	Csongr�d	County	HUN	\N
1622	Debrecen	City with county rights	HUN	\N
1623	Duna?jv�ros	City with county rights	HUN	\N
1624	Eger	City with county rights	HUN	\N
1625	�rd	City with county rights	HUN	\N
1626	Fej�r	County	HUN	\N
1627	Gyor-Moson-Sopron	County	HUN	\N
1628	Gyor	City with county rights	HUN	\N
1629	Hajd?-Bihar	County	HUN	\N
1630	Heves	County	HUN	\N
1631	H�dmezov�s�rhely	City with county rights	HUN	\N
1632	J�sz-Nagykun-Szolnok	County	HUN	\N
1633	Kom�rom-Esztergom	County	HUN	\N
1634	Kecskem�t	City with county rights	HUN	\N
1635	Kaposv�r	City with county rights	HUN	\N
1636	Miskolc	City with county rights	HUN	\N
1637	Nagykanizsa	City with county rights	HUN	\N
1638	N�gr�d	County	HUN	\N
1639	Ny�regyh�za	City with county rights	HUN	\N
1640	Pest	County	HUN	\N
1641	P�cs	City with county rights	HUN	\N
1642	Szeged	City with county rights	HUN	\N
1643	Sz�kesfeh�rv�r	City with county rights	HUN	\N
1644	Szombathely	City with county rights	HUN	\N
1645	Szolnok	City with county rights	HUN	\N
1646	Sopron	City with county rights	HUN	\N
1647	Somogy	County	HUN	\N
1648	Szeksz�rd	City with county rights	HUN	\N
1649	Salg�tarj�n	City with county rights	HUN	\N
1650	Szabolcs-Szatm�r-Bereg	County	HUN	\N
1651	Tatab�nya	City with county rights	HUN	\N
1652	Tolna	County	HUN	\N
1653	Vas	County	HUN	\N
1654	Veszpr�m	County	HUN	\N
1655	Veszpr�m	City with county rights	HUN	\N
1656	Zala	County	HUN	\N
1657	Zalaegerszeg	City with county rights	HUN	\N
1658	Aceh	Province	IDN	\N
1659	Bali	Province	IDN	\N
1660	Kepulauan Bangka Belitung	Province	IDN	\N
1661	Bengkulu	Province	IDN	\N
1662	Banten	Province	IDN	\N
1663	Gorontalo	Province	IDN	\N
1664	Jambi	Province	IDN	\N
1665	Jawa Barat	Province	IDN	\N
1666	Jawa Timur	Province	IDN	\N
1667	Jakarta Raya	Capital district	IDN	\N
1668	Jawa Tengah	Province	IDN	\N
1669	Kalimantan Barat	Province	IDN	\N
1670	Kalimantan Timur	Province	IDN	\N
1671	Kepulauan Riau	Province	IDN	\N
1672	Kalimantan Selatan	Province	IDN	\N
1673	Kalimantan Tengah	Province	IDN	\N
1674	Kalimantan Utara	Province	IDN	\N
1675	Lampung	Province	IDN	\N
1676	Maluku	Province	IDN	\N
1677	Maluku Utara	Province	IDN	\N
1678	Nusa Tenggara Barat	Province	IDN	\N
1679	Nusa Tenggara Timur	Province	IDN	\N
1680	Papua	Province	IDN	\N
1681	Papua Barat	Province	IDN	\N
1682	Riau	Province	IDN	\N
1683	Sulawesi Utara	Province	IDN	\N
1684	Sumatera Barat	Province	IDN	\N
1685	Sulawesi Tenggara	Province	IDN	\N
1686	Sulawesi Selatan	Province	IDN	\N
1687	Sulawesi Barat	Province	IDN	\N
1688	Sumatera Selatan	Province	IDN	\N
1689	Sulawesi Tengah	Province	IDN	\N
1690	Sumatera Utara	Province	IDN	\N
1691	Yogyakarta	Special region	IDN	\N
1692	Clare	County	IRL	\N
1693	Cavan	County	IRL	\N
1694	Cork	County	IRL	\N
1695	Carlow	County	IRL	\N
1696	Dublin	County	IRL	\N
1697	Donegal	County	IRL	\N
1698	Galway	County	IRL	\N
1699	Kildare	County	IRL	\N
1700	Kilkenny	County	IRL	\N
1701	Kerry	County	IRL	\N
1702	Longford	County	IRL	\N
1703	Louth	County	IRL	\N
1704	Limerick	County	IRL	\N
1705	Leitrim	County	IRL	\N
1706	Laois	County	IRL	\N
1707	Meath	County	IRL	\N
1708	Monaghan	County	IRL	\N
1709	Mayo	County	IRL	\N
1710	Offaly	County	IRL	\N
1711	Roscommon	County	IRL	\N
1712	Sligo	County	IRL	\N
1713	Tipperary	County	IRL	\N
1714	Waterford	County	IRL	\N
1715	Westmeath	County	IRL	\N
1716	Wicklow	County	IRL	\N
1717	Wexford	County	IRL	\N
1718	Al Janubi	District	ISR	\N
1719	H_efa	District	ISR	\N
1720	Yerushalayim	District	ISR	\N
1721	Al Awsat	District	ISR	\N
1722	Tel-Aviv	District	ISR	\N
1723	Ash Shamali	District	ISR	\N
1724	Andaman and Nicobar Islands	Union territory	IND	\N
1725	Andhra Pradesh	State	IND	\N
1726	Arunachal Pradesh	State	IND	\N
1727	Assam	State	IND	\N
1728	Bihar	State	IND	\N
1729	Chandigarh	Union territory	IND	\N
1730	Chhattisgarh	State	IND	\N
1731	Dadra and Nagar Haveli and Daman and Diu	Union territory	IND	\N
1732	Delhi	Union territory	IND	\N
1733	Goa	State	IND	\N
1734	Gujarat	State	IND	\N
1735	Himachal Pradesh	State	IND	\N
1736	Haryana	State	IND	\N
1737	Jharkhand	State	IND	\N
1738	Jammu and Kashmir	Union territory	IND	\N
1739	Jammu and Kashmir	Union territory	IND	\N
1740	Karnataka	State	IND	\N
1741	Kerala	State	IND	\N
1742	Ladakh	Union territory	IND	\N
1743	Lakshadweep	Union territory	IND	\N
1744	Maharashtra	State	IND	\N
1745	Meghalaya	State	IND	\N
1746	Manipur	State	IND	\N
1747	Madhya Pradesh	State	IND	\N
1748	Mizoram	State	IND	\N
1749	Nagaland	State	IND	\N
1750	Odisha	State	IND	\N
1751	Punjab	State	IND	\N
1752	Puducherry	Union territory	IND	\N
1753	Rajasthan	State	IND	\N
1754	Sikkim	State	IND	\N
1755	Telangana	State	IND	\N
1756	Tamil Nadu	State	IND	\N
1757	Tripura	State	IND	\N
1758	Uttar Pradesh	State	IND	\N
1759	Uttarakhand	State	IND	\N
1760	West Bengal	State	IND	\N
1761	AI Anbar	Governorate	IRQ	\N
1762	Arbil	Governorate	IRQ	\N
1763	Al Basrah	Governorate	IRQ	\N
1764	Babil	Governorate	IRQ	\N
1765	Baghdad	Governorate	IRQ	\N
1766	Dahuk	Governorate	IRQ	\N
1767	Diyal�	Governorate	IRQ	\N
1768	Dhi Qar	Governorate	IRQ	\N
1769	Karbala'	Governorate	IRQ	\N
1770	Kirkuk	Governorate	IRQ	\N
1771	Maysan	Governorate	IRQ	\N
1772	AI Muthann�	Governorate	IRQ	\N
1773	An Najaf	Governorate	IRQ	\N
1774	Ninaw�	Governorate	IRQ	\N
1775	Al Qadisiyah	Governorate	IRQ	\N
1776	Salah ad Din	Governorate	IRQ	\N
1777	As Sulaymaniyah	Governorate	IRQ	\N
1778	Wasit	Governorate	IRQ	\N
1779	Markazi	Province	IRN	\N
1780	Gilan	Province	IRN	\N
1781	Mazandaran	Province	IRN	\N
1782	AZarbayjan-e Sharqi	Province	IRN	\N
1783	AZarbayjan-e Gharbi	Province	IRN	\N
1784	Kermanshah	Province	IRN	\N
1785	Khuzestan	Province	IRN	\N
1786	Fars	Province	IRN	\N
1787	Kerman	Province	IRN	\N
1788	Khorasan-e Ra?avi	Province	IRN	\N
1789	Esfahan	Province	IRN	\N
1790	Sistan va Baluchestan	Province	IRN	\N
1791	Kordestan	Province	IRN	\N
1792	Hamadan	Province	IRN	\N
1793	Chahar Ma?al va Bakhtiari	Province	IRN	\N
1794	Lorestan	Province	IRN	\N
1795	Ilam	Province	IRN	\N
1796	Kohgiluyeh va Bowyer A?mad	Province	IRN	\N
1797	Bushehr	Province	IRN	\N
1798	Zanjan	Province	IRN	\N
1799	Semnan	Province	IRN	\N
1800	Yazd	Province	IRN	\N
1801	Hormozgan	Province	IRN	\N
1802	Tehran	Province	IRN	\N
1803	Ardabil	Province	IRN	\N
1804	Qom	Province	IRN	\N
1805	Qazvin	Province	IRN	\N
1806	Golestan	Province	IRN	\N
1807	Khorasan-e Shomali	Province	IRN	\N
1808	Khorasan-e Jonubi	Province	IRN	\N
1809	Alborz	Province	IRN	\N
1810	H�fu?borgarsv�?i	Region	ISL	\N
1811	Su?urnes	Region	ISL	\N
1812	Vesturland	Region	ISL	\N
1813	Vestfir?ir	Region	ISL	\N
1814	Nor?urland vestra	Region	ISL	\N
1815	Nor?urland eystra	Region	ISL	\N
1816	Austurland	Region	ISL	\N
1817	Su?urland	Region	ISL	\N
1818	Valle d'Aosta / Vall�e d'Aoste (fr)	autonomous region	ITA	\N
1819	Agrigento	Free Communal Consortia	ITA	\N
1820	Alessandria	Province	ITA	\N
1821	Ancona	Province	ITA	\N
1822	Ascoli Piceno	Province	ITA	\N
1823	L'Aquila	Province	ITA	\N
1824	Arezzo	Province	ITA	\N
1825	Asti	Province	ITA	\N
1826	Avellino	Province	ITA	\N
1827	Bari	Metropolitan City	ITA	\N
1828	Bergamo	Province	ITA	\N
1829	Biella	Province	ITA	\N
1830	Belluno	Province	ITA	\N
1831	Benevento	Province	ITA	\N
1832	Bologna	Metropolitan City	ITA	\N
1833	Brindisi	Province	ITA	\N
1834	Brescia	Province	ITA	\N
1835	Barletta-Andria-Trani	Province	ITA	\N
1836	Bolzano / Bozen (de)	autonomous province	ITA	\N
1837	Cagliari	Metropolitan City	ITA	\N
1838	Campobasso	Province	ITA	\N
1839	Caserta	Province	ITA	\N
1840	Chieti	Province	ITA	\N
1841	Caltanissetta	Province	ITA	\N
1842	Cuneo	Province	ITA	\N
1843	Como	Province	ITA	\N
1844	Cremona	Province	ITA	\N
1845	Cosenza	Province	ITA	\N
1846	Catania	Metropolitan City	ITA	\N
1847	Catanzaro	Province	ITA	\N
1848	Enna	Free Communal Consortia	ITA	\N
1849	Forl�-Cesena	Province	ITA	\N
1850	Ferrara	Province	ITA	\N
1851	Foggia	Province	ITA	\N
1852	Firenze	Metropolitan City	ITA	\N
1853	Fermo	Province	ITA	\N
1854	Frosinone	Province	ITA	\N
1855	Genova	Metropolitan City	ITA	\N
1856	Gorizia	Decentralized regional entity	ITA	\N
1857	Grosseto	Province	ITA	\N
1858	Imperia	Province	ITA	\N
1859	Isernia	Province	ITA	\N
1860	Crotone	Province	ITA	\N
1861	Lecco	Province	ITA	\N
1862	Lecce	Province	ITA	\N
1863	Livorno	Province	ITA	\N
1864	Lodi	Province	ITA	\N
1865	Latina	Province	ITA	\N
1866	Lucca	Province	ITA	\N
1867	Monza e Brianza	Province	ITA	\N
1868	Macerata	Province	ITA	\N
1869	Messina	Metropolitan City	ITA	\N
1870	Milano	Metropolitan City	ITA	\N
1871	Mantova	Province	ITA	\N
1872	Modena	Province	ITA	\N
1873	Massa-Carrara	Province	ITA	\N
1874	Matera	Province	ITA	\N
1875	Napoli	Metropolitan City	ITA	\N
1876	Novara	Province	ITA	\N
1877	Nuoro	Province	ITA	\N
1878	Oristano	Province	ITA	\N
1879	Palermo	Metropolitan City	ITA	\N
1880	Piacenza	Province	ITA	\N
1881	Padova	Province	ITA	\N
1882	Pescara	Province	ITA	\N
1883	Perugia	Province	ITA	\N
1884	Pisa	Province	ITA	\N
1885	Pordenone	Decentralized regional	ITA	\N
1886	Prato	Province	ITA	\N
1887	Parma	Province	ITA	\N
1888	Pistoia	Province	ITA	\N
1889	Pesaro e Urbino	Province	ITA	\N
1890	Pavia	Province	ITA	\N
1891	Potenza	Province	ITA	\N
1892	Ravenna	Province	ITA	\N
1893	Reggio Calabria	Metropolitan City	ITA	\N
1894	Reggio Emilia	Province	ITA	\N
1895	Ragusa	Free Communal Consortia	ITA	\N
1896	Rieti	Province	ITA	\N
1897	Roma	Metropolitan City	ITA	\N
1898	Rimini	Province	ITA	\N
1899	Rovigo	Province	ITA	\N
1900	Salerno	Province	ITA	\N
1901	Siena	Province	ITA	\N
1902	Sondrio	Province	ITA	\N
1903	La Spezia	Province	ITA	\N
1904	Siracusa	Free Communal Consortia	ITA	\N
1905	Sassari	Province	ITA	\N
1906	Sud Sardegna	Province	ITA	\N
1907	Savona	Province	ITA	\N
1908	Taranto	Province	ITA	\N
1909	Teramo	Province	ITA	\N
1910	Trento	autonomous province	ITA	\N
1911	Torino	Metropolitan City	ITA	\N
1912	Trapani	Free Communal Consortia	ITA	\N
1913	Terni	Province	ITA	\N
1914	Trieste	Decentralized regional	ITA	\N
1915	Treviso	Province	ITA	\N
1916	Udine	Decentralized regional	ITA	\N
1917	Varese	Province	ITA	\N
1918	Verbano-Cusio-Ossola	Province	ITA	\N
1919	Vercelli	Province	ITA	\N
1920	Venezia	Metropolitan City	ITA	\N
1921	Vicenza	Province	ITA	\N
1922	Verona	Province	ITA	\N
1923	Viterbo	Province	ITA	\N
1924	Vibo Valentia	Province	ITA	\N
1925	Kingston	Partish	JAM	\N
1926	Saint Andrew	Partish	JAM	\N
1927	Saint Thomas	Partish	JAM	\N
1928	Portland	Partish	JAM	\N
1929	Saint Mary	Partish	JAM	\N
1930	Saint Ann	Partish	JAM	\N
1931	Trelawny	Partish	JAM	\N
1932	Saint James	Partish	JAM	\N
1933	Hanover	Partish	JAM	\N
1934	Westmoreland	Partish	JAM	\N
1935	Saint Elizabeth	Partish	JAM	\N
1936	Manchester	Partish	JAM	\N
1937	Clarendon	Partish	JAM	\N
1938	Saint Catherine	Partish	JAM	\N
1939	�Ajlun	Governorate	JOR	\N
1940	Al �A�simah	Governorate	JOR	\N
1941	Al �Aqabah	Governorate	JOR	\N
1942	At Tafilah	Governorate	JOR	\N
1943	Az Zarqa�	Governorate	JOR	\N
1944	Al Balqa�	Governorate	JOR	\N
1945	Irbid	Governorate	JOR	\N
1946	Jarash	Governorate	JOR	\N
1947	AI Karak	Governorate	JOR	\N
1948	AI Mafraq	Governorate	JOR	\N
1949	Madaba	Governorate	JOR	\N
1950	Ma�an	Governorate	JOR	\N
1951	Hokkaid� [Hokkaido]	Prefecture	JPN	\N
1952	Aomori	Prefecture	JPN	\N
1953	Iwate	Prefecture	JPN	\N
1954	Miyagi	Prefecture	JPN	\N
1955	Akita	Prefecture	JPN	\N
1956	Yamagata	Prefecture	JPN	\N
1957	Hukusima [Fukushima]	Prefecture	JPN	\N
1958	Ibaraki	Prefecture	JPN	\N
1959	Totigi [Tochigi]	Prefecture	JPN	\N
1960	Gunma	Prefecture	JPN	\N
1961	Saitama	Prefecture	JPN	\N
1962	Tiba [Chiba]	Prefecture	JPN	\N
1963	T�ky� [Tokyo]	Prefecture	JPN	\N
1964	Kanagawa	Prefecture	JPN	\N
1965	Niigata	Prefecture	JPN	\N
1966	Toyama	Prefecture	JPN	\N
1967	Isikawa [Ishikawa]	Prefecture	JPN	\N
1968	Hukui [Fukui]	Prefecture	JPN	\N
1969	Yamanasi [Yamanashi]	Prefecture	JPN	\N
1970	Nagano	Prefecture	JPN	\N
1971	Gihu [Gifu]	Prefecture	JPN	\N
1972	Sizuoka [Shizuoka]	Prefecture	JPN	\N
1973	Aiti [Aichi]	Prefecture	JPN	\N
1974	Mie	Prefecture	JPN	\N
1975	Siga [Shiga]	Prefecture	JPN	\N
1976	Hy�go [Kyoto]	Prefecture	JPN	\N
1977	�saka [Osaka]	Prefecture	JPN	\N
1978	Hy�go[Hyogo]	Prefecture	JPN	\N
1979	Nara	Prefecture	JPN	\N
1980	Wakayama	Prefecture	JPN	\N
1981	Tottori	Prefecture	JPN	\N
1982	Simane [Shimane]	Prefecture	JPN	\N
1983	Okayama	Prefecture	JPN	\N
1984	Hirosima [Hiroshima]	Prefecture	JPN	\N
1985	Yamaguti [Yamaguchi]	Prefecture	JPN	\N
1986	Tokusima [Tokushima]	Prefecture	JPN	\N
1987	Kagawa	Prefecture	JPN	\N
1988	Ehime	Prefecture	JPN	\N
1989	K�ti [Kochi]	Prefecture	JPN	\N
1990	Hukuoka [Fukuoka]	Prefecture	JPN	\N
1991	Saga	Prefecture	JPN	\N
1992	Nagasaki	Prefecture	JPN	\N
1993	Kumamoto	Prefecture	JPN	\N
1994	�ita [Oita]	Prefecture	JPN	\N
1995	Miyazaki	Prefecture	JPN	\N
1996	Kagosima [Kagoshima]	Prefecture	JPN	\N
1997	Okinawa	Prefecture	JPN	\N
1998	Baringo	County	KEN	\N
1999	Bomet	County	KEN	\N
2000	Bungoma	County	KEN	\N
2001	Busia	County	KEN	\N
2002	Elgeyo/Marakwet	County	KEN	\N
2003	Embu	County	KEN	\N
2004	Garissa	County	KEN	\N
2005	Homa Bay	County	KEN	\N
2006	Isiolo	County	KEN	\N
2007	Kajiado	County	KEN	\N
2008	Kakamega	County	KEN	\N
2009	Kericho	County	KEN	\N
2010	Kiambu	County	KEN	\N
2011	Kilifi	County	KEN	\N
2012	Kirinyaga	County	KEN	\N
2013	Kisii	County	KEN	\N
2014	Kisumu	County	KEN	\N
2015	Kitui	County	KEN	\N
2016	Kwale	County	KEN	\N
2017	Laikipia	County	KEN	\N
2018	Lamu	County	KEN	\N
2019	Machakos	County	KEN	\N
2020	Makueni	County	KEN	\N
2021	Mandera	County	KEN	\N
2022	Marsabit	County	KEN	\N
2023	Meru	County	KEN	\N
2024	Migori	County	KEN	\N
2025	Mombasa	County	KEN	\N
2026	Murang'a	County	KEN	\N
2027	Nairobi City	County	KEN	\N
2028	Nakuru	County	KEN	\N
2029	Nandi	County	KEN	\N
2030	Narok	County	KEN	\N
2031	Nyamira	County	KEN	\N
2032	Nyandarua	County	KEN	\N
2033	Nyeri	County	KEN	\N
2034	Samburu	County	KEN	\N
2035	Siaya	County	KEN	\N
2036	Taita/Taveta	County	KEN	\N
2037	Tana River	County	KEN	\N
2038	Tharaka-Nithi	County	KEN	\N
2039	Trans Nzoia	County	KEN	\N
2040	Turkana	County	KEN	\N
2041	Uasin Gishu	County	KEN	\N
2042	Vihiga	County	KEN	\N
2043	Wajir	County	KEN	\N
2044	West Pokot	County	KEN	\N
2045	Batken	Region	KGZ	\N
2046	Ch�y	Region	KGZ	\N
2047	Bishkek Shaary	City	KGZ	\N
2048	Osh Shaary	City	KGZ	\N
2049	Jalal-Abad	Region	KGZ	\N
2050	Naryn	Region	KGZ	\N
2051	Osh	Region	KGZ	\N
2052	Talas	Region	KGZ	\N
2053	Ysyk-K�l	Region	KGZ	\N
2054	Banteay Mean Choay [B�nt�ay M�anchey]	Province	KHM	\N
2055	Kracheh [Kr�ch�h]	Province	KHM	\N
2056	Mondol Kiri [M�nd�l Kiri]	Province	KHM	\N
2057	Phnom Penh [Phnum P�nh]	Autonomous municipality	KHM	\N
2058	Preah Vihear [Preah Vih�ar]	Province	KHM	\N
2059	Prey Veaeng [Prey V�ng]	Province	KHM	\N
2060	Pousaat [Pouthisat]	Province	KHM	\N
2061	Rotanak Kiri [R�t�n�kiri]	Province	KHM	\N
2062	Siem Reab [Siemr�ab]	Province	KHM	\N
2063	Preah Sihanouk [Preah Seih�nu]	Province	KHM	\N
2064	Stueng Traeng [Stoeng Tr�ng]	Province	KHM	\N
2065	Baat Dambang [Batd�mb�ng]	Province	KHM	\N
2066	Svaay Rieng [Svay Rieng]	Province	KHM	\N
2067	Taakaev [Tak�v]	Province	KHM	\N
2068	Otdar Mean Chey [Otd�r M�an Choay]	Province	KHM	\N
2069	Keb [K�b]	Province	KHM	\N
2070	Pailin [Pailin]	Province	KHM	\N
2071	Tbong Khmum	province	KHM	\N
2072	Kampong Chaam [K�mp�ng Cham]	Province	KHM	\N
2073	Kampong Chhnang [K�mp�ng Chhnang]	Province	KHM	\N
2074	Kampong Spueu [K�mp�ng Sp�]	Province	KHM	\N
2075	Kampong Thum [K�mp�ng Thum]	Province	KHM	\N
2076	Kampot [K�mp�t]	Province	KHM	\N
2077	Kandaal [K�ndal]	Province	KHM	\N
2078	Kaoh Kong [Ka�h Kong]	Province	KHM	\N
2079	Gilbert Islands	Group of islands	KIR	\N
2080	Line Islands	Group of islands	KIR	\N
2081	Phoenix Islands	Group of islands	KIR	\N
2082	Anjouan	Island	COM	\N
2083	Grande Comore	Island	COM	\N
2084	Moh�li	Island	COM	\N
2085	Christ Church Nichola Town	Parish	KNA	\N
2086	Saint Anne Sandy Point	Parish	KNA	\N
2087	Saint George Basseterre	Parish	KNA	\N
2088	Saint George Gingerland	Parish	KNA	\N
2089	Saint James Windward	Parish	KNA	\N
2090	Saint John Capisterre	Parish	KNA	\N
2091	Saint John Figtree	Parish	KNA	\N
2092	Saint Mary Cayon	Parish	KNA	\N
2093	Saint Paul Capisterre	Parish	KNA	\N
2094	Saint Paul Charlestown	Parish	KNA	\N
2095	Saint Peter Basseterre	Parish	KNA	\N
2096	Saint Thomas Lowland	Parish	KNA	\N
2097	Saint Thomas Middle Island	Parish	KNA	\N
2098	Trinity Palmetto Point	Parish	KNA	\N
2099	Phyeongyang	Capital City	PRK	\N
2100	Phyeongannamto	Province	PRK	\N
2101	Phyeonganpukto	Province	PRK	\N
2102	Jakangto	Province	PRK	\N
2103	Hwanghainamto	Province	PRK	\N
2104	Hwanghaipukto	Province	PRK	\N
2105	Kangweonto	Province	PRK	\N
2106	Hamkyeongnamto	Province	PRK	\N
2107	Hamkyeongpukto	Province	PRK	\N
2108	Ryanggang-do	Province	PRK	\N
2109	Rason	Special City	PRK	\N
2110	Namp�o	Metropolitan City	PRK	\N
2111	Seoul-teukbyeolsi [Seoul]	Special city	KOR	\N
2112	Busan Gwang'yeogsi [Pusan-Kwangyokshi]	Metropolitan city	KOR	\N
2113	Daegu Gwang'yeogsi [Taegu-Kwangyokshi]	Metropolitan city	KOR	\N
2114	Incheon Gwang'yeogsi [Incheon]	Metropolitan city	KOR	\N
2115	Gwangju Gwang'yeogsi [Kwangju-Kwangyokshi]	Metropolitan city	KOR	\N
2116	Daejeon Gwang'yeogsi [Taejon-Kwangyokshi]	Metropolitan city	KOR	\N
2117	Ulsan Gwang'yeogsi [Ulsan-Kwangyokshi]	Metropolitan city	KOR	\N
2118	Gyeonggido [Kyonggi-do]	Province	KOR	\N
2119	Gang'weondo [Kang-won-do]	Province	KOR	\N
2120	Chungcheongbugdo [Ch'ungch'ongbuk-do]	Province	KOR	\N
2121	Chungcheongnamdo [Ch'ungch'ongnam-do]	Province	KOR	\N
2122	Jeonrabugdo [Chollabuk-do]	Province	KOR	\N
2123	Jeonranamdo [Chollanam-do]	Province	KOR	\N
2124	Gyeongsangbugdo [Kyongsangbuk-do]	Province	KOR	\N
2125	Gyeongsangnamdo [Kyongsangnam-do]	Province	KOR	\N
2126	Jeju-teukbyeoljachido [Jeju]	Special self-governing province	KOR	\N
2127	Sejong	Special self-governing city	KOR	\N
2128	Al A?madi	Governorate	KWT	\N
2129	Al Farwaniyah	Governorate	KWT	\N
2130	?awalli	Governorate	KWT	\N
2131	Al Jahra�	Governorate	KWT	\N
2132	Al �Asimah	Governorate	KWT	\N
2133	Mubarak al Kabir	Governorate	KWT	\N
2134	Aqmola oblysy	Region	KAZ	\N
2135	Aqt�be oblysy	Region	KAZ	\N
2136	Almaty	City	KAZ	\N
2137	Almaty oblysy	Region	KAZ	\N
2138	Nur-Sultan	City	KAZ	\N
2139	Atyrau oblysy	Region	KAZ	\N
2140	Qaraghandy oblysy	Region	KAZ	\N
2141	Qostanay oblysy	Region	KAZ	\N
2142	Qyzylorda oblysy	Region	KAZ	\N
2143	Mangghystau oblysy	Region	KAZ	\N
2144	Pavlodar oblysy	Region	KAZ	\N
2145	Solt�stik Qazaqstan oblysy	Region	KAZ	\N
2146	�imkent	City	KAZ	\N
2147	Shyghys Qazaqstan oblysy	Region	KAZ	\N
2148	T�rkistan oblysy	Region	KAZ	\N
2149	Batys Qazaqstan oblysy	Region	KAZ	\N
2150	Zhambyl oblysy	Region	KAZ	\N
2151	Attapu [Attapeu]	Province	LAO	\N
2152	Bok�o	Province	LAO	\N
2153	Bolikhamxai [Borikhamxay]	Province	LAO	\N
2154	Champasak [Champasack]	Province	LAO	\N
2155	Houaphan [Huaphanh]	Province	LAO	\N
2156	Khammouan [Khammuane]	Province	LAO	\N
2157	Louang Namtha [Luangnamtha]	Province	LAO	\N
2158	Louangphabang [Luangprabang]	Province	LAO	\N
2159	Oud�mxai [Oudomxay]	Province	LAO	\N
2160	Ph�ngsali [Phongsaly]	Province	LAO	\N
2161	Salavan [Saravane]	Province	LAO	\N
2162	Savannakh�t [Savannakhet]	Province	LAO	\N
2163	Vientiane	Province	LAO	\N
2164	Vientiane	Prefecture	LAO	\N
2165	Xaignabouli [Xayabury]	Province	LAO	\N
2166	X�kong [Sekong]	Province	LAO	\N
2167	Xiangkhouang [Xiengkhuang]	Province	LAO	\N
2168	Xais�mboun [Xaysomboon]	province	LAO	\N
2169	Aakk�r	Governorate	LBN	\N
2170	Liban-Nord	Governorate	LBN	\N
2171	Beyrouth	Governorate	LBN	\N
2172	Baalbek-Hermel	Governorate	LBN	\N
2173	El B�qaa	Governorate	LBN	\N
2174	Liban-Sud	Governorate	LBN	\N
2175	Mont-Liban	Governorate	LBN	\N
2176	Nabat�y�	Governorate	LBN	\N
2177	Anse la Raye	District	LCA	\N
2178	Castries	District	LCA	\N
2179	Choiseul	District	LCA	\N
2180	Dennery	District	LCA	\N
2181	Gros Islet	District	LCA	\N
2182	Laborie	District	LCA	\N
2183	Micoud	District	LCA	\N
2184	Soufri�re	District	LCA	\N
2185	Vieux Fort	District	LCA	\N
2186	Canaries	District	LCA	\N
2187	Balzers	Commune	LIE	\N
2188	Eschen	Commune	LIE	\N
2189	Gamprin	Commune	LIE	\N
2190	Mauren	Commune	LIE	\N
2191	Planken	Commune	LIE	\N
2192	Ruggell	Commune	LIE	\N
2193	Schaan	Commune	LIE	\N
2194	Schellenberg	Commune	LIE	\N
2195	Triesen	Commune	LIE	\N
2196	Triesenberg	Commune	LIE	\N
2197	Vaduz	Commune	LIE	\N
2198	Basnahira pa?ata	Province	LKA	\N
2199	Colombo	District	LKA	\N
2200	Gampaha	District	LKA	\N
2201	Kalutara	District	LKA	\N
2202	Madhyama pa?ata	Province	LKA	\N
2203	Kandy	District	LKA	\N
2204	Matale	District	LKA	\N
2205	Nuwara Eliya	District	LKA	\N
2206	Daku?u pa?ata	Province	LKA	\N
2207	Galle	District	LKA	\N
2208	Matara	District	LKA	\N
2209	Hambantota	District	LKA	\N
2210	Uturu pa?ata	Province	LKA	\N
2211	Jaffna	District	LKA	\N
2212	Kilinochchi	District	LKA	\N
2213	Mannar	District	LKA	\N
2214	Vavuniya	District	LKA	\N
2215	Mullaittivu	District	LKA	\N
2216	N�?genahira pa?ata	Province	LKA	\N
2217	Batticaloa	District	LKA	\N
2218	Ampara	District	LKA	\N
2219	Trincomalee	District	LKA	\N
2220	Vayamba pa?ata	Province	LKA	\N
2221	Kurunegala	District	LKA	\N
2222	Puttalam	District	LKA	\N
2223	Uturum�?da pa?ata	Province	LKA	\N
2224	Anuradhapura	District	LKA	\N
2225	Polonnaruwa	District	LKA	\N
2226	Uva pa?ata	Province	LKA	\N
2227	Badulla	District	LKA	\N
2228	Monaragala	District	LKA	\N
2229	Sabaragamuva pa?ata	Province	LKA	\N
2230	Ratnapura	District	LKA	\N
2231	Kegalla	District	LKA	\N
2232	Bong	County	LBR	\N
2233	Bomi	County	LBR	\N
2234	Grand Cape Mount	County	LBR	\N
2235	Grand Bassa	County	LBR	\N
2236	Grand Gedeh	County	LBR	\N
2237	Grand Kru	County	LBR	\N
2238	Gbarpolu	County	LBR	\N
2239	Lofa	County	LBR	\N
2240	Margibi	County	LBR	\N
2241	Montserrado	County	LBR	\N
2242	Maryland	County	LBR	\N
2243	Nimba	County	LBR	\N
2244	River Gee	County	LBR	\N
2245	River Cess	County	LBR	\N
2246	Sinoe	County	LBR	\N
2247	Maseru	District	LSO	\N
2248	Botha-Bothe	District	LSO	\N
2249	Leribe	District	LSO	\N
2250	Berea	District	LSO	\N
2251	Mafeteng	District	LSO	\N
2252	Mohale's Hoek	District	LSO	\N
2253	Quthing	District	LSO	\N
2254	Qacha's Nek	District	LSO	\N
2255	Mokhotlong	District	LSO	\N
2256	Thaba-Tseka	District	LSO	\N
2257	Akmene	District municipality	LTU	\N
2258	Alytaus miestas	City municipality	LTU	\N
2259	Alytus	District municipality	LTU	\N
2260	Anyk�ciai	District municipality	LTU	\N
2261	Bir�tono	Municipality	LTU	\N
2262	Bir�ai	District municipality	LTU	\N
2263	Druskininkai	Municipality	LTU	\N
2264	Elektr�nai	Municipality	LTU	\N
2265	Ignalina	District municipality	LTU	\N
2266	Jonava	District municipality	LTU	\N
2267	Joni�kis	District municipality	LTU	\N
2268	Jurbarkas	District municipality	LTU	\N
2269	Kai�iadorys	District municipality	LTU	\N
2270	Kalvarijos	Municipality	LTU	\N
2271	Kauno miestas	City municipality	LTU	\N
2272	Kaunas	District municipality	LTU	\N
2273	Kazlu Rudos	Municipality	LTU	\N
2274	Kedainiai	District municipality	LTU	\N
2275	Kelme	District municipality	LTU	\N
2276	Klaipedos miestas	City municipality	LTU	\N
2277	Klaipeda	District municipality	LTU	\N
2278	Kretinga	District municipality	LTU	\N
2279	Kupi�kis	District municipality	LTU	\N
2280	Lazdijai	District municipality	LTU	\N
2281	Marijampole	District municipality	LTU	\N
2282	Ma�eikiai	District municipality	LTU	\N
2283	Moletai	District municipality	LTU	\N
2284	Neringa	Municipality	LTU	\N
2285	Pag�giai	Municipality	LTU	\N
2286	Pakruojis	District municipality	LTU	\N
2287	Palangos miestas	City municipality	LTU	\N
2288	Paneve�io miestas	City municipality	LTU	\N
2289	Paneve�ys	District municipality	LTU	\N
2290	Pasvalys	District municipality	LTU	\N
2291	Plunge	District municipality	LTU	\N
2292	Prienai	District municipality	LTU	\N
2293	Radvili�kis	District municipality	LTU	\N
2294	Raseiniai	District municipality	LTU	\N
2295	Rietavo	Municipality	LTU	\N
2296	Roki�kis	District municipality	LTU	\N
2297	�akiai	District municipality	LTU	\N
2298	�alcininkai	District municipality	LTU	\N
2299	�iauliu miestas	City municipality	LTU	\N
2300	�iauliai	District municipality	LTU	\N
2301	�ilale	District municipality	LTU	\N
2302	�ilute	District municipality	LTU	\N
2303	�irvintos	District municipality	LTU	\N
2304	Skuodas	District municipality	LTU	\N
2305	�vencionys	District municipality	LTU	\N
2306	Taurage	District municipality	LTU	\N
2307	Tel�iai	District municipality	LTU	\N
2308	Trakai	District municipality	LTU	\N
2309	Ukmerge	District municipality	LTU	\N
2310	Utena	District municipality	LTU	\N
2311	Varena	District municipality	LTU	\N
2312	Vilkavi�kis	District municipality	LTU	\N
2313	Vilniaus miestas	City municipality	LTU	\N
2314	Vilnius	District municipality	LTU	\N
2315	Visaginas	Municipality	LTU	\N
2316	Zarasai	District municipality	LTU	\N
2317	Alytaus Apskritis	County	LTU	\N
2318	Klaipedos apskritis	County	LTU	\N
2319	Kauno Apskritis	County	LTU	\N
2320	Marijampoles apskritis	County	LTU	\N
2321	Paneve�io apskritis	County	LTU	\N
2322	�iauliu Apskritis	County	LTU	\N
2323	Taurages apskritis	County	LTU	\N
2324	Tel�iu Apskritis	County	LTU	\N
2325	Utenos Apskritis	County	LTU	\N
2326	Vilniaus Apskritis	County	LTU	\N
2327	Capellen	canton	LUX	\N
2328	Clervaux	canton	LUX	\N
2329	Diekirch	canton	LUX	\N
2330	Echternach	canton	LUX	\N
2331	Esch-sur-Alzette	canton	LUX	\N
2332	Gr�ivemaacher	canton	LUX	\N
2333	Luxembourg	canton	LUX	\N
2334	Mersch	canton	LUX	\N
2335	Redange	canton	LUX	\N
2336	Remich	canton	LUX	\N
2337	Vianden	canton	LUX	\N
2338	Wiltz	canton	LUX	\N
2339	Aglonas novads (Aglona)	Municipality	LVA	\N
2340	Aizkraukles novads (Aizkraukle)	Municipality	LVA	\N
2341	Aizputes novads (Aizpute)	Municipality	LVA	\N
2342	Aknistes novads (Akniste)	Municipality	LVA	\N
2343	Alojas novads (Aloja)	Municipality	LVA	\N
2344	Alsungas novads (Alsunga)	Municipality	LVA	\N
2345	Aluksnes novads (Aluksne)	Municipality	LVA	\N
2346	Amatas novads (Amata)	Municipality	LVA	\N
2347	Apes novads (Ape)	Municipality	LVA	\N
2348	Auces novads (Auce)	Municipality	LVA	\N
2349	Ada�u novads (Ada�i)	Municipality	LVA	\N
2350	Babites novads (Babite)	Municipality	LVA	\N
2351	Baldones novads (Baldone)	Municipality	LVA	\N
2352	Baltinavas novads (Baltinava)	Municipality	LVA	\N
2353	Balvu novads (Balvi)	Municipality	LVA	\N
2354	Bauskas novads (Bauska)	Municipality	LVA	\N
2355	Beverinas novads (Beverina)	Municipality	LVA	\N
2356	Brocenu novads (Broceni)	Municipality	LVA	\N
2357	Burtnieku novads (Burtnieki)	Municipality	LVA	\N
2358	Carnikavas novads (Carnikava)	Municipality	LVA	\N
2359	Cesvaines novads (Cesvaine)	Municipality	LVA	\N
2360	Cesu novads (Cesis)	Municipality	LVA	\N
2361	Ciblas novads (Cibla)	Municipality	LVA	\N
2362	Dagdas novads (Dagda)	Municipality	LVA	\N
2363	Daugavpils novads (Daugavpils)	Municipality	LVA	\N
2364	Dobeles novads (Dobele)	Municipality	LVA	\N
2365	Dundagas novads (Dundaga)	Municipality	LVA	\N
2366	Durbes novads (Durbe)	Municipality	LVA	\N
2367	Engures novads (Engure)	Municipality	LVA	\N
2368	Erglu novads (Ergli)	Municipality	LVA	\N
2369	Garkalnes novads (Garkalne)	Municipality	LVA	\N
2370	Grobinas novads (Grobina)	Municipality	LVA	\N
2371	Gulbenes novads (Gulbene)	Municipality	LVA	\N
2372	Iecavas novads (Iecava)	Municipality	LVA	\N
2373	Ik�kiles novads (Ik�kile)	Municipality	LVA	\N
2374	Ilukstes novads (Ilukste)	Municipality	LVA	\N
2375	Incukalna novads (Incukalns)	Municipality	LVA	\N
2376	Jaunjelgavas novads\r\n(Jaunjelgava)	Municipality	LVA	\N
2377	Jaunpiebalgas novads\r\n(Jaunpiebalga)	Municipality	LVA	\N
2378	Jaunpils novads (Jaunpils)	Municipality	LVA	\N
2379	Jelgavas novads (Jelgava)	Municipality	LVA	\N
2380	Jekabpils novads (Jekabpils)	Municipality	LVA	\N
2381	Kandavas novads (Kandava)	Municipality	LVA	\N
2382	Karsavas novads (Karsava)	Municipality	LVA	\N
2383	Kocenu novads (Koceni)	Municipality	LVA	\N
2384	Kokneses novads (Koknese)	Municipality	LVA	\N
2385	Kraslavas novads (Kraslava)	Municipality	LVA	\N
2386	Krimuldas novads (Krimulda)	Municipality	LVA	\N
2387	Krustpils novads (Krustpils)	Municipality	LVA	\N
2388	Kuldigas novads (Kuldiga)	Municipality	LVA	\N
2389	Keguma novads (Kegums)	Municipality	LVA	\N
2390	Kekavas novads (Kekava)	Municipality	LVA	\N
2391	Lielvardes novads (Lielvarde)	Municipality	LVA	\N
2392	Limba�u novads (Limba�i)	Municipality	LVA	\N
2393	Ligatnes novads (Ligatne)	Municipality	LVA	\N
2394	Livanu novads (Livani)	Municipality	LVA	\N
2395	Lubanas novads (Lubana)	Municipality	LVA	\N
2396	Ludzas novads (Ludza)	Municipality	LVA	\N
2397	Madonas novads (Madona)	Municipality	LVA	\N
2398	Mazsalacas novads (Mazsalaca)	Municipality	LVA	\N
2399	Malpils novads (Malpils)	Municipality	LVA	\N
2400	Marupes novads (Marupe)	Municipality	LVA	\N
2401	Mersraga novads (Mersrags)	Municipality	LVA	\N
2402	Nauk�enu novads (Nauk�eni)	Municipality	LVA	\N
2403	Neretas novads (Nereta)	Municipality	LVA	\N
2404	Nicas novads (Nica)	Municipality	LVA	\N
2405	Ogres novads (Ogre)	Municipality	LVA	\N
2406	Olaines novads (Olaine)	Municipality	LVA	\N
2407	Ozolnieku novads (Ozolnieki)	Municipality	LVA	\N
2408	Pargaujas novads (Pargauja)	Municipality	LVA	\N
2409	Pavilostas novads (Pavilosta)	Municipality	LVA	\N
2410	Plavinu novads (Plavinas)	Municipality	LVA	\N
2411	Preilu novads (Preili)	Municipality	LVA	\N
2412	Priekules novads (Priekule)	Municipality	LVA	\N
2413	Priekulu novads (Priekuli)	Municipality	LVA	\N
2414	Raunas novads (Rauna)	Municipality	LVA	\N
2415	Rezeknes novads (Rezekne)	Municipality	LVA	\N
2416	Riebinu novads (Riebini)	Municipality	LVA	\N
2417	Rojas novads (Roja)	Municipality	LVA	\N
2418	Ropa�u novads (Ropa�i)	Municipality	LVA	\N
2419	Rucavas novads (Rucava)	Municipality	LVA	\N
2420	Rugaju novads (Rugaji)	Municipality	LVA	\N
2421	Rundales novads (Rundale)	Municipality	LVA	\N
2422	Rujienas novads (Rujiena)	Municipality	LVA	\N
2423	Salas novads (Sala)	Municipality	LVA	\N
2424	Salacgrivas novads (Salacgriva)	Municipality	LVA	\N
2425	Salaspils novads (Salaspils)	Municipality	LVA	\N
2426	Saldus novads (Saldus)	Municipality	LVA	\N
2427	Saulkrastu novads (Saulkrasti)	Municipality	LVA	\N
2428	Sejas novads (Seja)	Municipality	LVA	\N
2429	Siguldas novads (Sigulda)	Municipality	LVA	\N
2430	Skriveru novads (Skriveri)	Municipality	LVA	\N
2431	Skrundas novads (Skrunda)	Municipality	LVA	\N
2432	Smiltenes novads (Smiltene)	Municipality	LVA	\N
2433	Stopinu novads (Stopini)	Municipality	LVA	\N
2434	Strencu novads (Strenci)	Municipality	LVA	\N
2435	Talsu novads (Talsi)	Municipality	LVA	\N
2436	Tervetes novads (Tervete)	Municipality	LVA	\N
2437	Tukuma novads (Tukums)	Municipality	LVA	\N
2438	Vainodes novads (Vainode)	Municipality	LVA	\N
2439	Valkas novads (Valka)	Municipality	LVA	\N
2440	Varaklanu novads (Varaklani)	Municipality	LVA	\N
2441	Varkavas novads (Varkava)	Municipality	LVA	\N
2442	Vecpiebalgas novads\r\n(Vecpiebalga)	Municipality	LVA	\N
2443	Vecumnieku novads (Vecumnieki)	Municipality	LVA	\N
2444	Ventspils novads (Ventspils)	Municipality	LVA	\N
2445	Viesites novads (Viesite)	Municipality	LVA	\N
2446	Vilakas novads (Vilaka)	Municipality	LVA	\N
2447	Vilanu novads (Vilani)	Municipality	LVA	\N
2448	Zilupes novads (Zilupe)	Municipality	LVA	\N
2449	Daugavpils	Republican city	LVA	\N
2450	Jelgava	Republican city	LVA	\N
2451	Jekabpils	Republican city	LVA	\N
2452	Jurmala	Republican city	LVA	\N
2453	Liepaja	Republican city	LVA	\N
2454	Rezekne	Republican city	LVA	\N
2455	Riga	Republican city	LVA	\N
2456	Ventspils	Republican city	LVA	\N
2457	Valmiera	Republican city	LVA	\N
2458	Banghazi	Popularate	LBY	\N
2459	Al Butnan	Popularate	LBY	\N
2460	Darnah	Popularate	LBY	\N
2461	Ghat	Popularate	LBY	\N
2462	Al Jabal al Akh?ar	Popularate	LBY	\N
2463	Al Jabal al Gharbi	Popularate	LBY	\N
2464	Al Jafarah	Popularate	LBY	\N
2465	Al Jufrah	Popularate	LBY	\N
2466	Al Kufrah	Popularate	LBY	\N
2467	Al Marqab	Popularate	LBY	\N
2468	Misratah	Popularate	LBY	\N
2469	Al Marj	Popularate	LBY	\N
2470	Murzuq	Popularate	LBY	\N
2471	Nalut	Popularate	LBY	\N
2472	An Nuqat al Khams	Popularate	LBY	\N
2473	Sabha	Popularate	LBY	\N
2474	Surt	Popularate	LBY	\N
2475	Tarabulus	Popularate	LBY	\N
2476	Al Wa?at	Popularate	LBY	\N
2477	Wadi al Hayat	Popularate	LBY	\N
2478	Wadi ash Shati?	Popularate	LBY	\N
2479	Az Zawiyah	Popularate	LBY	\N
2480	Tanger-T�touan-Al Hoce�ma	Region	MAR	\N
2481	L'Oriental	Region	MAR	\N
2482	F�s- Mekn�s	Region	MAR	\N
2483	Rabat-Sal�-K�nitra	Region	MAR	\N
2484	B�ni Mellal-Kh�nifra	Region	MAR	\N
2485	Casablanca-Settat	Region	MAR	\N
2486	Marrakech-Safi	Region	MAR	\N
2487	Dr�a-Tafilalet	Region	MAR	\N
2488	Souss-Massa	Region	MAR	\N
2489	Guelmim-Oued Noun (EH-partial)	Region	MAR	\N
2490	La�youne-Sakia El Hamra (EH-partial)	Region	MAR	\N
2491	Dakhla-Oued Ed-Dahab (EH)	Region	MAR	\N
2492	Agadir-Ida-Ou-Tanane	Prefecture	MAR	\N
2493	Aousserd	Prefecture	MAR	\N
2494	Assa-Zag (EH-partial)	Province	MAR	\N
2495	Azilal	Province	MAR	\N
2496	Beni Mellal	Province	MAR	\N
2497	Berkane	Province	MAR	\N
2498	Benslimane	Province	MAR	\N
2499	Boujdour (EH)	Province	MAR	\N
2500	Boulemane	Province	MAR	\N
2501	Berrechid	Province	MAR	\N
2502	Casablanca [Dar el Be�da]*	Prefecture	MAR	\N
2503	Chefchaouene	Province	MAR	\N
2504	Chichaoua	Province	MAR	\N
2505	Chtouka-Ait Baha	Province	MAR	\N
2506	Chtouka-Ait Baha	Province	MAR	\N
2507	Driouch	Province	MAR	\N
2508	Errachidia	Province	MAR	\N
2509	Essaouira	Province	MAR	\N
2510	Es-Semara (EH-partial)	Province	MAR	\N
2511	Fahs-Anjra	Prefecture	MAR	\N
2512	F�s	Prefecture	MAR	\N
2513	Figuig	Province	MAR	\N
2514	Fquih Ben Salah	Province	MAR	\N
2515	Guelmim	Province	MAR	\N
2516	Guercif	Province	MAR	\N
2517	El Hajeb	Province	MAR	\N
2518	Al Haouz	Province	MAR	\N
2519	Al Hoce�ma	Province	MAR	\N
2520	Ifrane	Province	MAR	\N
2521	Inezgane-Ait Melloul	Prefecture	MAR	\N
2522	El Jadida	Province	MAR	\N
2523	Jerada	Province	MAR	\N
2524	K�nitra	Province	MAR	\N
2525	Kelaat Sraghna	Province	MAR	\N
2526	El Kel�a des Sraghna	Province	MAR	\N
2527	Kh�misset	Province	MAR	\N
2528	Kh�nifra	Province	MAR	\N
2529	Khouribga	Province	MAR	\N
2530	La�youne	Province	MAR	\N
2531	Larache	Province	MAR	\N
2532	Marrakech	Prefecture	MAR	\N
2533	M�diq-Fnideq	Prefecture	MAR	\N
2534	M�diouna	Province	MAR	\N
2535	Mekn�s*	Prefecture	MAR	\N
2536	Midelt	Province	MAR	\N
2537	Marrakech-Medina	Prefecture	MAR	\N
2538	Marrakech-Menara	Prefecture	MAR	\N
2539	Mohammadia	Prefecture	MAR	\N
2540	Moulay Yacoub	Province	MAR	\N
2541	Nador	Province	MAR	\N
2542	Nouaceur	Province	MAR	\N
2543	Ouarzazate	Province	MAR	\N
2544	Oued Ed-Dahab (EH)	Province	MAR	\N
2545	Oujda-Angad	Prefecture	MAR	\N
2546	Ouezzane	Province	MAR	\N
2547	Rabat	Prefecture	MAR	\N
2548	Rehamna	Province	MAR	\N
2549	Safi	Province	MAR	\N
2550	Sal�	Prefecture	MAR	\N
2551	Sefrou	Province	MAR	\N
2552	Settat	Province	MAR	\N
2553	Sidi Bennour	Province	MAR	\N
2554	Sidi Ifni	Province	MAR	\N
2555	Sidi Kacem	Province	MAR	\N
2556	Sidi Slimane	Province	MAR	\N
2557	Skhirate-T�mara	Prefecture	MAR	\N
2558	Sidi Youssef Ben Ali	Prefecture	MAR	\N
2559	Tarfaya (EH-partial)	Province	MAR	\N
2560	Taourirt	Province	MAR	\N
2561	Taounate	Province	MAR	\N
2562	Taroudannt	Province	MAR	\N
2563	Tata	Province	MAR	\N
2564	Taza	Province	MAR	\N
2565	T�touan*	Prefecture	MAR	\N
2566	Tinghir	Province	MAR	\N
2567	Tiznit	Province	MAR	\N
2568	Tanger-Assilah	Prefecture	MAR	\N
2569	Tan-Tan	Province	MAR	\N
2570	Youssoufia	Provicne	MAR	\N
2571	Zagora	Province	MAR	\N
2572	La Colle	Quarter	MCO	\N
2573	La Condamine	Quarter	MCO	\N
2574	Fontvieille	Quarter	MCO	\N
2575	La Gare	Quarter	MCO	\N
2576	Jardin Exotique	Quarter	MCO	\N
2577	Larvotto	Quarter	MCO	\N
2578	Malbousquet	Quarter	MCO	\N
2579	Monte-Carlo	Quarter	MCO	\N
2580	Moneghetti	Quarter	MCO	\N
2581	Monaco-Ville	Quarter	MCO	\N
2582	Moulins	Quarter	MCO	\N
2583	Port-Hercule	Quarter	MCO	\N
2584	Sainte-D�vote	Quarter	MCO	\N
2585	La Source	Quarter	MCO	\N
2586	Sp�lugues	Quarter	MCO	\N
2587	Saint-Roman	Quarter	MCO	\N
2588	Vallon de la Rousse	Quarter	MCO	\N
2589	Anenii Noi	District	MDA	\N
2590	Balti	City	MDA	\N
2591	Bender [Tighina]	City	MDA	\N
2592	Briceni	District	MDA	\N
2593	Basarabeasca	District	MDA	\N
2594	Cahul	District	MDA	\N
2595	Calarasi	District	MDA	\N
2596	Cimislia	District	MDA	\N
2597	Criuleni	District	MDA	\N
2598	Causeni	District	MDA	\N
2599	Cantemir	District	MDA	\N
2600	Chisinau	City	MDA	\N
2601	Donduseni	District	MDA	\N
2602	Drochia	District	MDA	\N
2603	Dubasari	District	MDA	\N
2604	Edinet	District	MDA	\N
2605	Falesti	District	MDA	\N
2606	Floresti	District	MDA	\N
2607	Gagauzia, Unitatea teritoriala\r\nautonoma (UTAG)	Autonomous territory unit	MDA	\N
2608	Glodeni	District	MDA	\N
2609	H�ncesti	District	MDA	\N
2610	Ialoveni	District	MDA	\N
2611	Leova	District	MDA	\N
2612	Nisporeni	District	MDA	\N
2613	Ocni?a	District	MDA	\N
2614	Orhei	District	MDA	\N
2615	Rezina	District	MDA	\N
2616	R�scani	District	MDA	\N
2617	Soldanesti	District	MDA	\N
2618	S�ngerei	District	MDA	\N
2619	St�nga Nistrului, unitatea teritoriala din	Territorial unit	MDA	\N
2620	Soroca	District	MDA	\N
2621	Straseni	District	MDA	\N
2622	Stefan Voda	District	MDA	\N
2623	Taraclia	District	MDA	\N
2624	Telenesti	District	MDA	\N
2625	Ungheni	District	MDA	\N
2626	Andrijevica	Municipality	MNE	\N
2627	Bar	Municipality	MNE	\N
2628	Berane	Municipality	MNE	\N
2629	Bijelo Polje	Municipality	MNE	\N
2630	Budva	Municipality	MNE	\N
2631	Cetinje	Municipality	MNE	\N
2632	Danilovgrad	Municipality	MNE	\N
2633	Herceg-Novi	Municipality	MNE	\N
2634	Kola�in	Municipality	MNE	\N
2635	Kotor	Municipality	MNE	\N
2636	Mojkovac	Municipality	MNE	\N
2637	Nik�ic�	Municipality	MNE	\N
2638	Plav	Municipality	MNE	\N
2639	Pljevlja	Municipality	MNE	\N
2640	Plu�ine	Municipality	MNE	\N
2641	Podgorica	Municipality	MNE	\N
2642	Ro�aje	Municipality	MNE	\N
2643	�avnik	Municipality	MNE	\N
2644	Tivat	Municipality	MNE	\N
2645	Ulcinj	Municipality	MNE	\N
2646	�abljak	Municipality	MNE	\N
2647	Gusinje	Municipality	MNE	\N
2648	Petnjica	Municipality	MNE	\N
2649	Tuzi	Municipality	MNE	\N
2650	Toamasina	Province	MDG	\N
2651	Antsiranana	Province	MDG	\N
2652	Fianarantsoa	Province	MDG	\N
2653	Mahajanga	Province	MDG	\N
2654	Antananarivo	Province	MDG	\N
2655	Toliara	Province	MDG	\N
2656	Ailuk	Municipality	MHL	\N
2657	Ailinglaplap	Municipality	MHL	\N
2658	Arno	Municipality	MHL	\N
2659	Aur	Municipality	MHL	\N
2660	Ebon	Municipality	MHL	\N
2661	Enewetak & Ujelang	Municipality	MHL	\N
2662	Jabat	Municipality	MHL	\N
2663	Jaluit	Municipality	MHL	\N
2664	Bikini & Kili	Municipality	MHL	\N
2665	Kwajalein	Municipality	MHL	\N
2666	Ralik chain	Chains (of islands)	MHL	\N
2667	Lae	Municipality	MHL	\N
2668	Lib	Municipality	MHL	\N
2669	Likiep	Municipality	MHL	\N
2670	Majuro	Municipality	MHL	\N
2671	Maloelap	Municipality	MHL	\N
2672	Mejit	Municipality	MHL	\N
2673	Mili	Municipality	MHL	\N
2674	Namdrik	Municipality	MHL	\N
2675	Namu	Municipality	MHL	\N
2676	Rongelap	Municipality	MHL	\N
2677	Ratak chain	Chains (of islands)	MHL	\N
2678	Ujae	Municipality	MHL	\N
2679	Utrik	Municipality	MHL	\N
2680	Wotho	Municipality	MHL	\N
2681	Wotje	Municipality	MHL	\N
2682	Veles	Municipality	MKD	\N
2683	Gradsko	Municipality	MKD	\N
2684	Demir Kapija	Municipality	MKD	\N
2685	Kavadarci	Municipality	MKD	\N
2686	Lozovo	Municipality	MKD	\N
2687	Negotino	Municipality	MKD	\N
2688	Rosoman	Municipality	MKD	\N
2689	Sveti Nikole	Municipality	MKD	\N
2690	Ca�ka	Municipality	MKD	\N
2691	Berovo	Municipality	MKD	\N
2692	Vinica	Municipality	MKD	\N
2693	Delcevo	Municipality	MKD	\N
2694	Zrnovci	Municipality	MKD	\N
2695	Karbinci	Municipality	MKD	\N
2696	Karbinci	Municipality	MKD	\N
2697	Kocani	Municipality	MKD	\N
2698	Makedonska Kamenica	Municipality	MKD	\N
2699	Pehcevo	Municipality	MKD	\N
2700	Probi�tip	Municipality	MKD	\N
2701	Ce�inovo-Oble�evo	Municipality	MKD	\N
2702	�tip	Municipality	MKD	\N
2703	Vevcani	Municipality	MKD	\N
2704	Debar	Municipality	MKD	\N
2705	Debarca	Municipality	MKD	\N
2706	Kicevo	Municipality	MKD	\N
2707	Makedonski Brod	Municipality	MKD	\N
2708	Ohrid	Municipality	MKD	\N
2709	Plasnica	Municipality	MKD	\N
2710	Struga	Municipality	MKD	\N
2711	Centar �upa	Municipality	MKD	\N
2712	Bogdanci	Municipality	MKD	\N
2713	Bosilovo	Municipality	MKD	\N
2714	Valandovo	Municipality	MKD	\N
2715	Vasilevo	Municipality	MKD	\N
2716	Gevgelija	Municipality	MKD	\N
2717	Dojran	Municipality	MKD	\N
2718	Konce	Municipality	MKD	\N
2719	Novo Selo	Municipality	MKD	\N
2720	Radovi�	Municipality	MKD	\N
2721	Strumica	Municipality	MKD	\N
2722	Bitola	Municipality	MKD	\N
2723	Demir Hisar	Municipality	MKD	\N
2724	Dolneni	Municipality	MKD	\N
2725	Krivoga�tani	Municipality	MKD	\N
2726	Kru�evo	Municipality	MKD	\N
2727	Mogila	Municipality	MKD	\N
2728	Novaci	Municipality	MKD	\N
2729	Prilep	Municipality	MKD	\N
2730	Resen	Municipality	MKD	\N
2731	Bogovinje	Municipality	MKD	\N
2732	Brvenica	Municipality	MKD	\N
2733	Vrapci�te	Municipality	MKD	\N
2734	Gostivar	Municipality	MKD	\N
2735	�elino	Municipality	MKD	\N
2736	Jegunovce	Municipality	MKD	\N
2737	Mavrovo-i-Rostu�a	Municipality	MKD	\N
2738	Tearce	Municipality	MKD	\N
2739	Tetovo	Municipality	MKD	\N
2740	Kratovo	Municipality	MKD	\N
2741	Kriva Palanka	Municipality	MKD	\N
2742	Kumanovo	Municipality	MKD	\N
2743	Lipkovo	Municipality	MKD	\N
2744	Rankovce	Municipality	MKD	\N
2745	Staro Nagoricane	Municipality	MKD	\N
2746	Aerodrom	Municipality	MKD	\N
2747	Aracinovo	Municipality	MKD	\N
2748	Butel	Municipality	MKD	\N
2749	Gazi Baba	Municipality	MKD	\N
2750	Gjorce Petrov	Municipality	MKD	\N
2751	Zelenikovo	Municipality	MKD	\N
2752	Ilinden	Municipality	MKD	\N
2753	Karpo�	Municipality	MKD	\N
2754	Kisela Voda	Municipality	MKD	\N
2755	Petrovec	Municipality	MKD	\N
2756	Saraj	Municipality	MKD	\N
2757	Sopi�te	Municipality	MKD	\N
2758	Studenicani	Municipality	MKD	\N
2759	Centar	Municipality	MKD	\N
2760	Cair	Municipality	MKD	\N
2761	Cucer Sandevo	Municipality	MKD	\N
2762	�uto Orizari	Municipality	MKD	\N
2763	Kayes	Region	MLI	\N
2764	Taoud�nit	Region	MLI	\N
2765	Koulikoro	Region	MLI	\N
2766	Sikasso	Region	MLI	\N
2767	S�gou	Region	MLI	\N
2768	Mopti	Region	MLI	\N
2769	Tombouctou	Region	MLI	\N
2770	Gao	Region	MLI	\N
2771	Kidal	Region	MLI	\N
2772	M�naka	Region	MLI	\N
2773	Bamako	District	MLI	\N
2774	Sagaing	Region	MMR	\N
2775	Bago	Region	MMR	\N
2776	Magway	Region	MMR	\N
2777	Mandalay	Region	MMR	\N
2778	Tanintharyi	Region	MMR	\N
2779	Yangon	Region	MMR	\N
2780	Ayeyarwady	Region	MMR	\N
2781	Kachin	State	MMR	\N
2782	Kayah	State	MMR	\N
2783	Kayin	State	MMR	\N
2784	Chin	State	MMR	\N
2785	Mon	State	MMR	\N
2786	Rakhine	State	MMR	\N
2787	Shan	State	MMR	\N
2788	Nay Pyi Taw	Union territory	MMR	\N
2789	Orhon	Province	MNG	\N
2790	Darhan uul	Province	MNG	\N
2791	Hentiy	Province	MNG	\N
2792	H�vag�l	Province	MNG	\N
2793	Hovd	Province	MNG	\N
2794	Uvs	Province	MNG	\N
2795	T�v	Province	MNG	\N
2796	Selenge	Province	MNG	\N
2797	S�hbaatar	Province	MNG	\N
2798	�mn�govi	Province	MNG	\N
2799	�v�rhangay	Province	MNG	\N
2800	Dzavhan	Province	MNG	\N
2801	Dundgovi	Province	MNG	\N
2802	Dornod	Province	MNG	\N
2803	Dornogovi	Province	MNG	\N
2804	Govi-S�mber	Province	MNG	\N
2805	Govi-Altay	Province	MNG	\N
2806	Bulgan	Province	MNG	\N
2807	Bayanhongor	Province	MNG	\N
2808	Bayan-�lgiy	Province	MNG	\N
2809	Arhangay	Province	MNG	\N
2810	Ulaanbaatar	Capital city	MNG	\N
2811	Hodh ech Chargui	Region	MRT	\N
2812	Hodh el Gharbi	Region	MRT	\N
2813	Assaba	Region	MRT	\N
2814	Gorgol	Region	MRT	\N
2815	Brakna	Region	MRT	\N
2816	Trarza	Region	MRT	\N
2817	Adrar	Region	MRT	\N
2818	Dakhlet Nou�dhibou	Region	MRT	\N
2819	Tagant	Region	MRT	\N
2820	Guidimaka	Region	MRT	\N
2821	Tiris Zemmour	Region	MRT	\N
2822	Inchiri	Region	MRT	\N
2823	Nouakchott Ouest	region	MRT	\N
2824	Nouakchott Nord	region	MRT	\N
2825	Nouakchott Sud	region	MRT	\N
2826	Attard	Local council	MLT	\N
2827	Balzan	Local council	MLT	\N
2828	Birgu	Local council	MLT	\N
2829	Birkirkara	Local council	MLT	\N
2830	Birzebbuga	Local council	MLT	\N
2831	Bormla	Local council	MLT	\N
2832	Dingli	Local council	MLT	\N
2833	Fgura	Local council	MLT	\N
2834	Floriana	Local council	MLT	\N
2835	Fontana	Local council	MLT	\N
2836	Gudja	Local council	MLT	\N
2837	Gzira	Local council	MLT	\N
2838	Ghajnsielem	Local council	MLT	\N
2839	Gharb	Local council	MLT	\N
2840	Gharghur	Local council	MLT	\N
2841	Ghasri	Local council	MLT	\N
2842	Ghaxaq	Local council	MLT	\N
2843	Hamrun	Local council	MLT	\N
2844	Iklin	Local council	MLT	\N
2845	Isla	Local council	MLT	\N
2846	Kalkara	Local council	MLT	\N
2847	Kercem	Local council	MLT	\N
2848	Kirkop	Local council	MLT	\N
2849	Lija	Local council	MLT	\N
2850	Luqa	Local council	MLT	\N
2851	Marsa	Local council	MLT	\N
2852	Marsaskala	Local council	MLT	\N
2853	Marsaxlokk	Local council	MLT	\N
2854	Mdina	Local council	MLT	\N
2855	Mellieha	Local council	MLT	\N
2856	Mgarr	Local council	MLT	\N
2857	Mosta	Local council	MLT	\N
2858	Mqabba	Local council	MLT	\N
2859	Msida	Local council	MLT	\N
2860	Mtarfa	Local council	MLT	\N
2861	Munxar	Local council	MLT	\N
2862	Nadur	Local council	MLT	\N
2863	Naxxar	Local council	MLT	\N
2864	Paola	Local council	MLT	\N
2865	Pembroke	Local council	MLT	\N
2866	Piet�	Local council	MLT	\N
2867	Qala	Local council	MLT	\N
2868	Qormi	Local council	MLT	\N
2869	Qrendi	Local council	MLT	\N
2870	Rabat Gozo	Local council	MLT	\N
2871	Rabat Malta	Local council	MLT	\N
2872	Safi	Local council	MLT	\N
2873	Saint Julian's	Local council	MLT	\N
2874	Saint John	Local council	MLT	\N
2875	Saint Lawrence	Local council	MLT	\N
2876	Saint Paul's Bay	Local council	MLT	\N
2877	Sannat	Local council	MLT	\N
2878	Saint Lucia's	Local council	MLT	\N
2879	Santa Venera	Local council	MLT	\N
2880	Siggiewi	Local council	MLT	\N
2881	Sliema	Local council	MLT	\N
2882	Swieqi	Local council	MLT	\N
2883	Ta' Xbiex	Local council	MLT	\N
2884	Tarxien	Local council	MLT	\N
2885	Valletta	Local council	MLT	\N
2886	Xaghra	Local council	MLT	\N
2887	Xewkija	Local council	MLT	\N
2888	Xghajra	Local council	MLT	\N
2889	Zabbar	Local council	MLT	\N
2890	Zebbug Gozo	Local council	MLT	\N
2891	Zebbug Malta	Local council	MLT	\N
2892	Zejtun	Local council	MLT	\N
2893	Zurrieq	Local council	MLT	\N
2894	Agalega Islands	Dependency	MUS	\N
2895	Black River	District	MUS	\N
2896	Cargados Carajos Shoals [Saint Brandon Islands]	Dependency	MUS	\N
2897	Flacq	District	MUS	\N
2898	Grand Port	District	MUS	\N
2899	Moka	District	MUS	\N
2900	Pamplemousses	District	MUS	\N
2901	Port Louis	District	MUS	\N
2902	Plaines wilhems	District	MUS	\N
2903	Rodrigues Island	Dependency	MUS	\N
2904	Rivi�re du Rempart	District	MUS	\N
2905	Savanne	District	MUS	\N
2906	Alifu Dhaalu	Administrative atoll	MDV	\N
2907	Seenu	City	MDV	\N
2908	Alifu Alifu	Administrative atoll	MDV	\N
2909	Lhaviyani	Administrative atoll	MDV	\N
2910	Vaavu	Administrative atoll	MDV	\N
2911	Hahdhunmathi	Administrative atoll	MDV	\N
2912	Haa Alif	Administrative atoll	MDV	\N
2913	Thaa	Administrative atoll	MDV	\N
2914	Meemu	Administrative atoll	MDV	\N
2915	Raa	Administrative atoll	MDV	\N
2916	Faafu	Administrative atoll	MDV	\N
2917	Dhaalu	Administrative atoll	MDV	\N
2918	Baa	Administrative atoll	MDV	\N
2919	Haa Dhaalu	Administrative atoll	MDV	\N
2920	Shaviyani	Administrative atoll	MDV	\N
2921	Noonu	Administrative atoll	MDV	\N
2922	Kaafu	Administrative atoll	MDV	\N
2923	Gaafu Alifu	Administrative atoll	MDV	\N
2924	Gaafu Dhaalu	Administrative atoll	MDV	\N
2925	Gnaviyani	Administrative atoll	MDV	\N
2926	Male	City	MDV	\N
2927	Balaka	District	MWI	\N
2928	Blantyre	District	MWI	\N
2929	Central	Region	MWI	\N
2930	Chikwawa	District	MWI	\N
2931	Chiradzulu	District	MWI	\N
2932	Chitipa	District	MWI	\N
2933	Dedza	District	MWI	\N
2934	Dowa	District	MWI	\N
2935	Karonga	District	MWI	\N
2936	Kasungu	District	MWI	\N
2937	Lilongwe	District	MWI	\N
2938	Likoma	District	MWI	\N
2939	Mchinji	District	MWI	\N
2940	Mangochi	District	MWI	\N
2941	Machinga	District	MWI	\N
2942	Mulanje	District	MWI	\N
2943	Mwanza	District	MWI	\N
2944	Mzimba	District	MWI	\N
2945	Northern	Region	MWI	\N
2946	Nkhata Bay	District	MWI	\N
2947	Neno	District	MWI	\N
2948	Ntchisi	District	MWI	\N
2949	Nkhotakota	District	MWI	\N
2950	Nsanje	District	MWI	\N
2951	Ntcheu	District	MWI	\N
2952	Phalombe	District	MWI	\N
2953	Rumphi	District	MWI	\N
2954	Southern	Region	MWI	\N
2955	Salima	District	MWI	\N
2956	Thyolo	District	MWI	\N
2957	Zomba	District	MWI	\N
2958	Aguascalientes	State	MEX	\N
2959	Baja California	State	MEX	\N
2960	Baja California Sur	State	MEX	\N
2961	Campeche	State	MEX	\N
2962	Chihuahua	State	MEX	\N
2963	Chiapas	State	MEX	\N
2964	Ciudad de M�xico	Federal District	MEX	\N
2965	Coahuila de Zaragoza	State	MEX	\N
2966	Colima	State	MEX	\N
2967	Durango	State	MEX	\N
2968	Guerrero	State	MEX	\N
2969	Guanajuato	State	MEX	\N
2970	Hidalgo	State	MEX	\N
2971	Jalisco	State	MEX	\N
2972	M�xico	State	MEX	\N
2973	Michoac�n de Ocampo	State	MEX	\N
2974	Morelos	State	MEX	\N
2975	Nayarit	State	MEX	\N
2976	Nuevo Le�n	State	MEX	\N
2977	Oaxaca	State	MEX	\N
2978	Puebla	State	MEX	\N
2979	Quer�taro	State	MEX	\N
2980	Quintana Roo	State	MEX	\N
2981	Sinaloa	State	MEX	\N
2982	San Luis Potos�	State	MEX	\N
2983	Sonora	State	MEX	\N
2984	Tabasco	State	MEX	\N
2985	Tamaulipas	State	MEX	\N
2986	Tlaxcala	State	MEX	\N
2987	Veracruz de Ignacio de la Llave	State	MEX	\N
2988	Yucat�n	State	MEX	\N
2989	Zacatecas	State	MEX	\N
2990	Johor	State	MYS	\N
2991	Kedah	State	MYS	\N
2992	Kelantan	State	MYS	\N
2993	Melaka	State	MYS	\N
2994	Negeri Sembilan	State	MYS	\N
2995	Pahang	State	MYS	\N
2996	Pulau Pinang	State	MYS	\N
2997	Perak	State	MYS	\N
2998	Perlis	State	MYS	\N
2999	Selangor	State	MYS	\N
3000	Terengganu	State	MYS	\N
3001	Sabah	State	MYS	\N
3002	Sarawak	State	MYS	\N
3003	Wilayah Persekutuan Kuala Lumpur	Federal territory	MYS	\N
3004	Wilayah Persekutuan Labuan	Federal territory	MYS	\N
3005	Wilayah Persekutuan Putrajaya	Federal territory	MYS	\N
3006	Niaosa	Province	MOZ	\N
3007	Manica	Province	MOZ	\N
3008	Gaza	Province	MOZ	\N
3009	Inhambane	Province	MOZ	\N
3010	Maputo	Province	MOZ	\N
3011	Maputo	City	MOZ	\N
3012	Nampula	Province	MOZ	\N
3013	Cabo Delgado	Province	MOZ	\N
3014	Zamb�zia	Province	MOZ	\N
3015	Sofala	Province	MOZ	\N
3016	Tete	Province	MOZ	\N
3017	Zambezi	Region	NAM	\N
3018	Erongo	Region	NAM	\N
3019	Hardap	Region	NAM	\N
3020	//Karas	Region	NAM	\N
3021	Kavango East	Region	NAM	\N
3022	Khomas	Region	NAM	\N
3023	Kunene	Region	NAM	\N
3024	Kavango West	\N	NAM	\N
3025	Otjozondjupa	Region	NAM	\N
3026	Omaheke	Region	NAM	\N
3027	Oshana	Region	NAM	\N
3028	Omusati	Region	NAM	\N
3029	Oshikoto	Region	NAM	\N
3030	Ohangwena	Region	NAM	\N
3031	Agadez	Region	NER	\N
3032	Diffa	Region	NER	\N
3033	Dosso	Region	NER	\N
3034	Maradi	Region	NER	\N
3035	Tahoua	Region	NER	\N
3036	Tillab�ri	Region	NER	\N
3037	Zinder	Region	NER	\N
3038	Niamey	Urban community	NER	\N
3039	Abia	State	NGA	\N
3040	Adamawa	State	NGA	\N
3041	Akwa Ibom	State	NGA	\N
3042	Anambra	State	NGA	\N
3043	Bauchi	State	NGA	\N
3044	Benue	State	NGA	\N
3045	Borno	State	NGA	\N
3046	Bayelsa	State	NGA	\N
3047	Cross River	State	NGA	\N
3048	Delta	State	NGA	\N
3049	Ebonyi	State	NGA	\N
3050	Edo	State	NGA	\N
3051	Ekiti	State	NGA	\N
3052	Enugu	State	NGA	\N
3053	Abuja Capital Territory	Capital territory	NGA	\N
3054	Gombe	State	NGA	\N
3055	Imo	State	NGA	\N
3056	Jigawa	State	NGA	\N
3057	Kaduna	State	NGA	\N
3058	Kebbi	State	NGA	\N
3059	Kano	State	NGA	\N
3060	Kogi	State	NGA	\N
3061	Katsina	State	NGA	\N
3062	Kwara	State	NGA	\N
3063	Lagos	State	NGA	\N
3064	Nasarawa	State	NGA	\N
3065	Niger	State	NGA	\N
3066	Ogun	State	NGA	\N
3067	Ondo	State	NGA	\N
3068	Osun	State	NGA	\N
3069	Oyo	State	NGA	\N
3070	Plateau	State	NGA	\N
3071	Rivers	State	NGA	\N
3072	Sokoto	State	NGA	\N
3073	Taraba	State	NGA	\N
3074	Yobe	State	NGA	\N
3075	Zamfara	State	NGA	\N
3076	Atl�ntico Norte	Autonomous region	NIC	\N
3077	Atl�ntico Sur	Autonomous region	NIC	\N
3078	Boaco	 Department	NIC	\N
3079	Carazo	 Department	NIC	\N
3080	Chinandega	 Department	NIC	\N
3081	Chontales	 Department	NIC	\N
3082	Estel�	 Department	NIC	\N
3083	Granada	 Department	NIC	\N
3084	Jinotega	 Department	NIC	\N
3085	Le�n	 Department	NIC	\N
3086	Madriz	 Department	NIC	\N
3087	Managua	 Department	NIC	\N
3088	Masaya	 Department	NIC	\N
3089	Matagalpa	 Department	NIC	\N
3090	Nueva Segovia	 Department	NIC	\N
3091	Rivas	 Department	NIC	\N
3092	R�o San Juan	 Department	NIC	\N
3093	Drenthe	Province	NLD	\N
3094	Flevoland	Province	NLD	\N
3095	Frysl�n	Province	NLD	\N
3096	Gelderland	Province	NLD	\N
3097	Groningen	Province	NLD	\N
3098	Limburg	Province	NLD	\N
3099	Noord-Brabant	Province	NLD	\N
3100	Noord-Holland	Province	NLD	\N
3101	Overijssel	Province	NLD	\N
3102	Utrecht	Province	NLD	\N
3103	Zeeland	Province	NLD	\N
3104	Zuid-Holland	Province	NLD	\N
3105	Oslo	County	NOR	\N
3106	Rogaland	County	NOR	\N
3107	M�re og Romsdal	County	NOR	\N
3108	Nordland	County	NOR	\N
3109	Svalbard (Arctic Region) (See\r\nalso country code SJ)	Arctic region	NOR	\N
3110	Jan Mayen (Arctic Region) (See\r\nalso country code SJ)	Arctic region	NOR	\N
3111	Viken	County	NOR	\N
3112	Innlandet	County	NOR	\N
3113	Vestfold og Telemark	County	NOR	\N
3114	Agder	County	NOR	\N
3115	Vestland	County	NOR	\N
3116	Tr�ndelag	County	NOR	\N
3117	Troms og Finnmark	County	NOR	\N
3118	Bagmati	Zone	NPL	\N
3119	Bheri	Zone	NPL	\N
3120	Dhawalagiri	Zone	NPL	\N
3121	Gandaki	Zone	NPL	\N
3122	Janakpur	Zone	NPL	\N
3123	Karnali	Zone	NPL	\N
3124	Kosi [Koshi]	Zone	NPL	\N
3125	Lumbini	Zone	NPL	\N
3126	Mahakali	Zone	NPL	\N
3127	Mechi	Zone	NPL	\N
3128	Narayani	Zone	NPL	\N
3129	Pradesh 1	Province	NPL	\N
3130	Pradesh 2	Province	NPL	\N
3131	Bagmati	Province	NPL	\N
3132	Gandaki	Province	NPL	\N
3133	Pradesh 5	Province	NPL	\N
3134	Karnali	Province	NPL	\N
3135	Sudur Pashchim	Province	NPL	\N
3136	Rapti	Zone	NPL	\N
3137	Sagarmatha	Zone	NPL	\N
3138	Seti	Zone	NPL	\N
3139	Aiwo	District	NRU	\N
3140	Anabar	District	NRU	\N
3141	Anetan	District	NRU	\N
3142	Anibare	District	NRU	\N
3143	Baitsi	District	NRU	\N
3144	Boe	District	NRU	\N
3145	Buada	District	NRU	\N
3146	Denigomodu	District	NRU	\N
3147	Ewa	District	NRU	\N
3148	Ijuw	District	NRU	\N
3149	Meneng	District	NRU	\N
3150	Nibok	District	NRU	\N
3151	Uaboe	District	NRU	\N
3152	Yaren	District	NRU	\N
3153	Auckland	region	NZL	\N
3154	Bay of Plenty	Region	NZL	\N
3155	Canterbury	Region	NZL	\N
3156	Chatham Islands Territory	Special Island Authorithy	NZL	\N
3157	Gisborne	region	NZL	\N
3158	Hawkes's Bay	Region	NZL	\N
3159	Marlborough	region	NZL	\N
3160	Manawatu-Wanganui	Region	NZL	\N
3161	Nelson	region	NZL	\N
3162	Northland	Region	NZL	\N
3163	Otago	Region	NZL	\N
3164	Southland	Region	NZL	\N
3165	Tasman	Region	NZL	\N
3166	Taranaki	Region	NZL	\N
3167	Wellington	Region	NZL	\N
3168	Waikato	Region	NZL	\N
3169	West Coast	Region	NZL	\N
3170	Janub al Batinah	governorate	OMN	\N
3171	Shamal al Batinah	governorate	OMN	\N
3172	Al Buraymi	governorate	OMN	\N
3173	Ad Dakhiliyah	governorate	OMN	\N
3174	Masqat	governorate	OMN	\N
3175	Musandam	governorate	OMN	\N
3176	Janub ash Sharqiyah	governorate	OMN	\N
3177	Shamal ash Sharqiyah	governorate	OMN	\N
3178	AI Wusta	governorate	OMN	\N
3179	Az Zahirah	Region	OMN	\N
3180	Z?ufar	governorate	OMN	\N
3181	Bocas del Toro	Province	PAN	\N
3182	Panam� Oeste	Province	PAN	\N
3183	Cocl�	Province	PAN	\N
3184	Col�n	Province	PAN	\N
3185	Chiriqu�	Province	PAN	\N
3186	Dari�n	Province	PAN	\N
3187	Herrera	Province	PAN	\N
3188	Los Santos	Province	PAN	\N
3189	Panam�	Province	PAN	\N
3190	Veraguas	Province	PAN	\N
3191	Ember�	indigenous region	PAN	\N
3192	Guna Yala	indigenous region	PAN	\N
3193	Ng�be-Bugl�	indigenous region	PAN	\N
3194	Amazonas	Region	PER	\N
3195	Ancash	Region	PER	\N
3196	Apur�mac	Region	PER	\N
3197	Arequipa	Region	PER	\N
3198	Ayacucho	Region	PER	\N
3199	Cajamarca	Region	PER	\N
3200	El Callao	Region	PER	\N
3201	Cuzco [Cusco]	Region	PER	\N
3202	Hu�nuco	Region	PER	\N
3203	Huancavelica	Region	PER	\N
3204	Ica	Region	PER	\N
3205	Jun�n	Region	PER	\N
3206	La Libertad	Region	PER	\N
3207	Lambayeque	Region	PER	\N
3208	Lima	Region	PER	\N
3209	Lima hatun llaqta	Municipality	PER	\N
3210	Loreto	Region	PER	\N
3211	Madre de Dios	Region	PER	\N
3212	Moquegua	Region	PER	\N
3213	Pasco	Region	PER	\N
3214	Piura	Region	PER	\N
3215	Puno	Region	PER	\N
3216	San Mart�n	Region	PER	\N
3217	Tacna	Region	PER	\N
3218	Tumbes	Region	PER	\N
3219	Ucayali	Region	PER	\N
3220	Chimbu	Province	PNG	\N
3221	Central	Province	PNG	\N
3222	East New Britain	Province	PNG	\N
3223	Eastern Highlands	Province	PNG	\N
3224	Enga	Province	PNG	\N
3225	East Sepik	Province	PNG	\N
3226	Gulf	Province	PNG	\N
3227	Hela	Province	PNG	\N
3228	Jiwaka	Province	PNG	\N
3229	Milne Bay	Province	PNG	\N
3230	Morobe	Province	PNG	\N
3231	Madang	Province	PNG	\N
3232	Manus	Province	PNG	\N
3233	National Capital District (Port Moresby)	District	PNG	\N
3234	New Ireland	Province	PNG	\N
3235	Northern	Province	PNG	\N
3236	Bougainville	autonomous region	PNG	\N
3237	West Sepik	Province	PNG	\N
3238	Southern Highlands	Province	PNG	\N
3239	West New Britain	Province	PNG	\N
3240	Western Highlands	Province	PNG	\N
3241	Western	Province	PNG	\N
3242	National Capital R�gion (Manila)	Region	PHL	\N
3243	Abra	Province	PHL	\N
3244	Agusan del Norte	Province	PHL	\N
3245	Agusan del Sur	Province	PHL	\N
3246	Aklan	Province	PHL	\N
3247	Albay	Province	PHL	\N
3248	Antique	Province	PHL	\N
3249	Apayao	Province	PHL	\N
3250	Aurora	Province	PHL	\N
3251	Bataan	Province	PHL	\N
3252	Basilan	Province	PHL	\N
3253	Benguet	Province	PHL	\N
3254	Biliran	Province	PHL	\N
3255	Bohol	Province	PHL	\N
3256	Batangas	Province	PHL	\N
3257	Batanes	Province	PHL	\N
3258	Bukidnon	Province	PHL	\N
3259	Bulacan	Province	PHL	\N
3260	Cagayan	Province	PHL	\N
3261	Camiguin	Province	PHL	\N
3262	Camarines Norte	Province	PHL	\N
3263	Capiz	Province	PHL	\N
3264	Camarines Sur	Province	PHL	\N
3265	Catanduanes	Province	PHL	\N
3266	Cavite	Province	PHL	\N
3267	Cebu	Province	PHL	\N
3268	Davao de Oro	Province	PHL	\N
3269	Davao Oriental	Province	PHL	\N
3270	Davao del Sur	Province	PHL	\N
3271	Davao del Norte	Province	PHL	\N
3272	Dinagat Islands	Province	PHL	\N
3273	Kanlurang Dabaw	province	PHL	\N
3274	Eastern Samar	Province	PHL	\N
3275	Guimaras	Province	PHL	\N
3276	Ifugao	Province	PHL	\N
3277	Iloilo	Province	PHL	\N
3278	Ilocos Norte	Province	PHL	\N
3279	Ilocos Sur	Province	PHL	\N
3280	Isabela	Province	PHL	\N
3281	Kalinga-Apayao	Province	PHL	\N
3282	Laguna	Province	PHL	\N
3283	Lanao del Norte	Province	PHL	\N
3284	Lanao del Sur	Province	PHL	\N
3285	Leyte	Province	PHL	\N
3286	La Union	Province	PHL	\N
3287	Marinduque	Province	PHL	\N
3288	Maguindanao	Province	PHL	\N
3289	Masbate	Province	PHL	\N
3290	Mindoro Occidental	Province	PHL	\N
3291	Mindoro Oriental	Province	PHL	\N
3292	Mountain Province	Province	PHL	\N
3293	Misamis Occidental	Province	PHL	\N
3294	Misamis Oriental	Province	PHL	\N
3295	Kotabato	Province	PHL	\N
3296	Negros occidental	Province	PHL	\N
3297	Negros oriental	Province	PHL	\N
3298	Northern Samar	Province	PHL	\N
3299	Nueva Ecija	Province	PHL	\N
3300	Nueva Vizcaya	Province	PHL	\N
3301	Pampanga	Province	PHL	\N
3302	Pangasinan	Province	PHL	\N
3303	Palawan	Province	PHL	\N
3304	Quezon	Province	PHL	\N
3305	Quirino	Province	PHL	\N
3306	Rizal	Province	PHL	\N
3307	Romblon	Province	PHL	\N
3308	Sarangani	Province	PHL	\N
3309	South Cotabato	Province	PHL	\N
3310	Siquijor	Province	PHL	\N
3311	Southern Leyte	Province	PHL	\N
3312	Sulu	Province	PHL	\N
3313	Sorsogon	Province	PHL	\N
3314	Sultan Kudarat	Province	PHL	\N
3315	Surigao del Norte	Province	PHL	\N
3316	Surigao del Sur	Province	PHL	\N
3317	Tarlac	Province	PHL	\N
3318	Tawi-Tawi	Province	PHL	\N
3319	Western Samar	Province	PHL	\N
3320	Zamboanga del Norte	Province	PHL	\N
3321	Zamboanga del Sur	Province	PHL	\N
3322	Zambales	Province	PHL	\N
3323	Zamboanga Sibuguey [Zamboanga Sibugay]	Province	PHL	\N
3324	Balochistan	Province	PAK	\N
3325	Gilgit-Baltistan	Pakistan administrered area	PAK	\N
3326	Islamabad	Federal capital territory	PAK	\N
3327	Azad Jammu and Kashmir	Pakistan administrered area	PAK	\N
3328	Khyber Pakhtunkhwa	Province	PAK	\N
3329	Punjab	Province	PAK	\N
3330	Sindh	Province	PAK	\N
3331	Dolnoslaskie	Voivodship	POL	\N
3332	Kujawsko-pomorskie	Voivodship	POL	\N
3333	Lubelskie	Voivodship	POL	\N
3334	Lubuskie	Voivodship	POL	\N
3335	L�dzkie	Voivodship	POL	\N
3336	Malopolskie	Voivodship	POL	\N
3337	Mazowieckie	Voivodship	POL	\N
3338	Opolskie	Voivodship	POL	\N
3339	Podkarpackie	Voivodship	POL	\N
3340	Podlaskie	Voivodship	POL	\N
3341	Pomorskie	Voivodship	POL	\N
3342	Slaskie	Voivodship	POL	\N
3343	Swietokrzyskie	Voivodship	POL	\N
3344	Warminsko-mazurskie	Voivodship	POL	\N
3345	Wielkopolskie	Voivodship	POL	\N
3346	Zachodniopomorskie	Voivodship	POL	\N
3347	Bethlehem	Governorate	PSE	\N
3348	Deir El Balah	Governorate	PSE	\N
3349	Gaza	Governorate	PSE	\N
3350	Hebron	Governorate	PSE	\N
3351	Jerusalem	Governorate	PSE	\N
3352	Jericho and Al Aghwar	Governorate	PSE	\N
3353	Khan Yunis	Governorate	PSE	\N
3354	Nablus	Governorate	PSE	\N
3355	North Gaza	Governorate	PSE	\N
3356	Qalqilya	Governorate	PSE	\N
3357	Ramallah	Governorate	PSE	\N
3358	Rafah	Governorate	PSE	\N
3359	Salfit	Governorate	PSE	\N
3360	Tubas	Governorate	PSE	\N
3361	Tulkarm	Governorate	PSE	\N
3362	Aveiro	District	PRT	\N
3363	Beja	District	PRT	\N
3364	Braga	District	PRT	\N
3365	Bragan�a	District	PRT	\N
3366	Castelo Branco	District	PRT	\N
3367	Coimbra	District	PRT	\N
3368	�vora	District	PRT	\N
3369	Faro	District	PRT	\N
3370	Guarda	District	PRT	\N
3371	Leiria	District	PRT	\N
3372	Lisboa	District	PRT	\N
3373	Portalegre	District	PRT	\N
3374	Porto	District	PRT	\N
3375	Santar�m	District	PRT	\N
3376	Set?bal	District	PRT	\N
3377	Viana do Castelo	District	PRT	\N
3378	Vila Real	District	PRT	\N
3379	Viseu	District	PRT	\N
3380	Regi�o Aut�noma dos A�ores	Autonomous region	PRT	\N
3381	Regi�o Aut�noma da Madeira	Autonomous region	PRT	\N
3382	Aimeliik    	State	PLW	\N
3383	Airai       	State	PLW	\N
3384	Angaur      	State	PLW	\N
3385	Hatohobei	State	PLW	\N
3386	Kayangel    	State	PLW	\N
3387	Koror       	State	PLW	\N
3388	Melekeok    	State	PLW	\N
3389	Ngaraard    	State	PLW	\N
3390	Ngarchelong 	State	PLW	\N
3391	Ngardmau    	State	PLW	\N
3392	Ngatpang    	State	PLW	\N
3393	Ngchesar    	State	PLW	\N
3394	Ngeremlengui	State	PLW	\N
3395	Ngiwal      	State	PLW	\N
3396	Peleliu     	State	PLW	\N
3397	Sonsorol    	State	PLW	\N
3398	Concepci�n	 Department	PRY	\N
3399	Alto Paran�	 Department	PRY	\N
3400	Central	 Department	PRY	\N
3401	�eembuc?	 Department	PRY	\N
3402	Amambay	 Department	PRY	\N
3403	Canindey?	 Department	PRY	\N
3404	Presidente Hayes	 Department	PRY	\N
3405	Alto Paraguay	 Department	PRY	\N
3406	Boquer�n	 Department	PRY	\N
3407	San Pedro	 Department	PRY	\N
3408	Cordillera	 Department	PRY	\N
3409	Guair�	 Department	PRY	\N
3410	Caaguaz?	 Department	PRY	\N
3411	Caazap�	 Department	PRY	\N
3412	Itap?a	 Department	PRY	\N
3413	Misiones	 Department	PRY	\N
3414	Paraguar�	 Department	PRY	\N
3415	Asunci�n	Capital	PRY	\N
3416	Ad Dawhah	Municipality	QAT	\N
3417	Al Khawr wa adh Dhakhirah	Municipality	QAT	\N
3418	Ash Shamal	Municipality	QAT	\N
3419	Ar Rayyan	Municipality	QAT	\N
3420	Ash Shi?aniyah	Municipality	QAT	\N
3421	Umm Salal	Municipality	QAT	\N
3422	Al Wakrah	Municipality	QAT	\N
3423	Az? Z?a�ayin	Municipality	QAT	\N
3424	Alba	Departments	ROU	\N
3425	Arges	Departments	ROU	\N
3426	Arad	Departments	ROU	\N
3427	Bucuresti	Municipality	ROU	\N
3428	Bacau	Departments	ROU	\N
3429	Bihor	Departments	ROU	\N
3430	Bistrita-Nasaud	Departments	ROU	\N
3431	Braila	Departments	ROU	\N
3432	Botosani	Departments	ROU	\N
3433	Brasov	Departments	ROU	\N
3434	Buzau	Departments	ROU	\N
3435	Cluj	Departments	ROU	\N
3436	Calarasi	Departments	ROU	\N
3437	Caras-Severin	Departments	ROU	\N
3438	Constarta	Departments	ROU	\N
3439	Covasna	Departments	ROU	\N
3440	D�mbovita	Departments	ROU	\N
3441	Dolj	Departments	ROU	\N
3442	Gorj	Departments	ROU	\N
3443	Galati	Departments	ROU	\N
3444	Giurgiu	Departments	ROU	\N
3445	Hunedoara	Departments	ROU	\N
3446	Harghita	Departments	ROU	\N
3447	Ilfov	Departments	ROU	\N
3448	Ialomita	Departments	ROU	\N
3449	Iasi	Departments	ROU	\N
3450	Mehedinti	Departments	ROU	\N
3451	Maramures	Departments	ROU	\N
3452	Mures	Departments	ROU	\N
3453	Neamt	Departments	ROU	\N
3454	Olt	Departments	ROU	\N
3455	Prahova	Departments	ROU	\N
3456	Sibiu	Departments	ROU	\N
3457	Salaj	Departments	ROU	\N
3458	Satu Mare	Departments	ROU	\N
3459	Suceava	Departments	ROU	\N
3460	Tulcea	Departments	ROU	\N
3461	Timis	Departments	ROU	\N
3462	Teleorman	Departments	ROU	\N
3463	V�lcea	Departments	ROU	\N
3464	Vrancea	Departments	ROU	\N
3465	Vaslui	Departments	ROU	\N
3466	Beograd	City	SRB	\N
3467	Severnobacki okrug	District	SRB	\N
3468	Srednjebanatski okrug	District	SRB	\N
3469	Severnobanatski okrug	District	SRB	\N
3470	Ju�nobanatski okrug	District	SRB	\N
3471	Zapadnobacki okrug	District	SRB	\N
3472	Ju�nobacki okrug	District	SRB	\N
3473	Sremski okrug	District	SRB	\N
3474	Macvanski okrug	District	SRB	\N
3475	Kolubarski okrug	District	SRB	\N
3476	Podunavski okrug	District	SRB	\N
3477	Branicevski okrug	District	SRB	\N
3478	�umadijski okrug	District	SRB	\N
3479	Pomoravski okrug	District	SRB	\N
3480	Borski okrug	District	SRB	\N
3481	Zajecarski okrug	District	SRB	\N
3482	Zlatiborski okrug	District	SRB	\N
3483	Moravicki okrug	District	SRB	\N
3484	Ra�ki okrug	District	SRB	\N
3485	Rasinski okrug	District	SRB	\N
3486	Ni�avski okrug	District	SRB	\N
3487	Toplicki okrug	District	SRB	\N
3488	Pirotski okrug	District	SRB	\N
3489	Jablanicki okrug	District	SRB	\N
3490	Pcinjski okrug	District	SRB	\N
3491	Kosovski okrug	District	SRB	\N
3492	Pecki okrug	District	SRB	\N
3493	Prizrenski okrug	District	SRB	\N
3494	Kosovsko-Mitrovacki okrug	District	SRB	\N
3495	Kosovsko-Pomoravski okrug	District	SRB	\N
3496	Kosovo-Metohija	Autonomous province	SRB	\N
3497	Vojvodina	Autonomous province	SRB	\N
3498	Adygeya, Respublika	Republic	RUS	\N
3499	Altay, Respublika	Republic	RUS	\N
3500	Altayskiy kray	Administrative territory	RUS	\N
3501	Amurskaya oblast'	Administrative region	RUS	\N
3502	Arkhangel'skaya oblast,	Administrative region	RUS	\N
3503	Astrakhanskaya oblast'	Administrative region	RUS	\N
3504	Bashkortostan, Respublika	Republic	RUS	\N
3505	Belgorodskaya oblast'	Administrative region	RUS	\N
3506	Bryanskaya oblast'	Administrative region	RUS	\N
3507	Buryatiya, Respublika	Republic	RUS	\N
3508	Chechenskaya Respublika	Republic	RUS	\N
3509	Chelyabinskaya oblast'	Administrative region	RUS	\N
3510	Chukotskiy avtonomnyy okrug	Autonomous district	RUS	\N
3511	Chuvashskaya Respublika	Republic	RUS	\N
3512	Dagestan, Respublika	Republic	RUS	\N
3513	Ingushskaya Respublika [Respublika Ingushetiya]	Republic	RUS	\N
3514	Irkutskaya oblast'	Administrative region	RUS	\N
3515	Ivanovskaya oblast'	Administrative region	RUS	\N
3516	Kamchatskaya oblast'	Administrative region	RUS	\N
3517	Kabardino-Balkarskaya Respublika	Republic	RUS	\N
3518	Karachayevo-Cherkesskaya Respublika	Republic	RUS	\N
3519	Krasnodarskiy kray	Administrative territory	RUS	\N
3520	Kemerovskaya oblast'	Administrative region	RUS	\N
3521	Kaliningradskaya oblast,	Administrative region	RUS	\N
3522	Kurganskaya oblast'	Administrative region	RUS	\N
3523	Khabarovskiy kray	Administrative territory	RUS	\N
3524	Khanty-Mansiyskiy avtonomnyy okrug	Autonomous district	RUS	\N
3525	Kirovskaya oblast'	Administrative region	RUS	\N
3526	Khakasiya, Respublika	Republic	RUS	\N
3527	Kalmykiya, Respublika	Republic	RUS	\N
3528	Kaluzhskaya oblast'	Administrative region	RUS	\N
3529	Komi, Respublika	Republic	RUS	\N
3530	Kostromskaya oblast'	Administrative region	RUS	\N
3531	Kareliya, Respublika	Republic	RUS	\N
3532	Kurskaya oblast'	Administrative region	RUS	\N
3533	Krasnoyarskiy kray	Administrative territory	RUS	\N
3534	Leningradskaya oblast'	Administrative region	RUS	\N
3535	Lipetskaya oblast'	Administrative region	RUS	\N
3536	Magadanskaya oblast'	Administrative region	RUS	\N
3537	Mariy El, Respublika	Republic	RUS	\N
3538	Mordoviya, Respublika	Republic	RUS	\N
3657	Uppsala l�n	County	SWE	\N
3539	Moskovskaya oblast'	Administrative region	RUS	\N
3540	Moskva	Autonomous city	RUS	\N
3541	Murmanskaya oblast'	Administrative region	RUS	\N
3542	Nenetskiy avtonomnyy okrug	Autonomous district	RUS	\N
3543	Novgorodskaya oblast'	Administrative region	RUS	\N
3544	Nizhegorodskaya oblast'	Administrative region	RUS	\N
3545	Novosibirskaya oblast'	Administrative region	RUS	\N
3546	Omskaya oblast'	Administrative region	RUS	\N
3547	Orenburgskaya oblast'	Administrative region	RUS	\N
3548	Orlovskaya oblast'	Administrative region	RUS	\N
3549	Perm	Administrative territory	RUS	\N
3550	Penzenskaya oblast'	Administrative region	RUS	\N
3551	Primorskiy kray	Administrative territory	RUS	\N
3552	Pskovskaya oblast'	Administrative region	RUS	\N
3553	Rostovskaya oblast'	Administrative region	RUS	\N
3554	Ryazanskaya oblast'	Administrative region	RUS	\N
3555	Sakha, Respublika [Yakutiya]	Republic	RUS	\N
3556	Sakhalinskaya oblast'	Administrative region	RUS	\N
3557	Samarskaya oblast'	Administrative region	RUS	\N
3558	Saratovskaya oblast'	Administrative region	RUS	\N
3559	Severnaya Osetiya, Respublika Alaniya] [Respublika Severnaya Osetiya-Alaniya]	Republic	RUS	\N
3560	Smolenskaya oblast'	Administrative region	RUS	\N
3561	Sankt-Peterburg	Autonomous city	RUS	\N
3562	Stavropol'skiy kray	Administrative territory	RUS	\N
3563	Sverdlovskaya oblast'	Administrative region	RUS	\N
3564	Tatarstan, Respublika	Republic	RUS	\N
3565	Tambovskaya oblast'	Administrative region	RUS	\N
3566	Tomskaya oblast'	Administrative region	RUS	\N
3567	Tul'skaya oblast'	Administrative region	RUS	\N
3568	Tverskaya oblast'	Administrative region	RUS	\N
3569	Tyva, Respublika [Tuva]	Republic	RUS	\N
3570	Tyumenskaya oblast'	Administrative region	RUS	\N
3571	Udmurtskaya Respublika	Republic	RUS	\N
3572	Ul'yanovskaya oblast'	Administrative region	RUS	\N
3573	Volgogradskaya oblast'	Administrative region	RUS	\N
3574	Vladimirskaya oblast'	Administrative region	RUS	\N
3575	Vologodskaya oblast'	Administrative region	RUS	\N
3576	Voronezhskaya oblast'	Administrative region	RUS	\N
3577	Yamalo-Nenetskiy avtonomnyy okrug	Autonomous district	RUS	\N
3578	Yaroslavskaya oblast'	Administrative region	RUS	\N
3579	Yevreyskaya avtonomnaya oblast'	Autonomous region	RUS	\N
3580	Zabaykal'skiy kray	Administrative territory	RUS	\N
3581	Ville de Kigali	city	RWA	\N
3582	Est	Province	RWA	\N
3583	Nord	Province	RWA	\N
3584	Ouest	Province	RWA	\N
3585	Sud	Province	RWA	\N
3586	Ar Riyad	Region	SAU	\N
3587	Makkah al Mukarramah	Region	SAU	\N
3588	Al Madinah al Munawwarah	Region	SAU	\N
3589	Ash Sharqiyah	Region	SAU	\N
3590	AI Qasim	Region	SAU	\N
3591	Ha'il	Region	SAU	\N
3592	Tabuk	Region	SAU	\N
3593	AI Hudud ash Shamaliyah	Region	SAU	\N
3594	Jazan	Region	SAU	\N
3595	Najran	Region	SAU	\N
3596	AI Bahah	Region	SAU	\N
3597	AI Jawf	Region	SAU	\N
3598	'Asir	Region	SAU	\N
3599	Central	Province	SLB	\N
3600	Choiseul	Province	SLB	\N
3601	Capital Territory (Honiara)	Capital territory	SLB	\N
3602	Guadalcanal	Province	SLB	\N
3603	Isabel	Province	SLB	\N
3604	Makira-Ulawa	Province	SLB	\N
3605	Malaita	Province	SLB	\N
3606	Rennell and Bellona	Province	SLB	\N
3607	Temotu	Province	SLB	\N
3608	Western	Province	SLB	\N
3609	Anse aux Pins	District	SYC	\N
3610	Anse Boileau         	District	SYC	\N
3611	Anse �toile          	District	SYC	\N
3612	Au Cap	District	SYC	\N
3613	Anse Royale          	District	SYC	\N
3614	Baie Lazare          	District	SYC	\N
3615	Baie Sainte Anne     	District	SYC	\N
3616	Beau Vallon          	District	SYC	\N
3617	Bel Air              	District	SYC	\N
3618	Bel Ombre            	District	SYC	\N
3619	Cascade              	District	SYC	\N
3620	Glacis               	District	SYC	\N
3621	Grand'Anse Mah�	District	SYC	\N
3622	Grand'Anse Praslin	District	SYC	\N
3623	La Digue             	District	SYC	\N
3624	La Rivi�re Anglaise  	District	SYC	\N
3625	Mont Buxton          	District	SYC	\N
3626	Mont Fleuri          	District	SYC	\N
3627	Plaisance            	District	SYC	\N
3628	Pointe La Rue        	District	SYC	\N
3629	Port Glaud           	District	SYC	\N
3630	Saint Louis          	District	SYC	\N
3631	Takamaka             	District	SYC	\N
3632	Lemamel	District	SYC	\N
3633	Ros Kaiman	District	SYC	\N
3634	�le Pers�v�rance I	District	SYC	\N
3635	II	District	SYC	\N
3636	Wasat Darfur	State	SDN	\N
3637	Sharq Darfur	State	SDN	\N
3638	Shamal Darfur	State	SDN	\N
3639	Janub Darfur	State	SDN	\N
3640	Gharb Darfur	State	SDN	\N
3641	Al Qadarif	State	SDN	\N
3642	Gharb Kurdufan	state	SDN	\N
3643	Al Jazirah	State	SDN	\N
3644	Kassala	State	SDN	\N
3645	Al Khartum	State	SDN	\N
3646	Shiamal Kurdufan	State	SDN	\N
3647	Janub Kurdufan	State	SDN	\N
3648	An Nil al Azraq	State	SDN	\N
3649	Ash Shamaliyah	State	SDN	\N
3650	Nahr an Nil	State	SDN	\N
3651	An Nil al Abya?	State	SDN	\N
3652	Al Ba?r al A?mar	State	SDN	\N
3653	Sinnar	State	SDN	\N
3654	Stockholms l�n	County	SWE	\N
3655	V�sterbottens l�n	County	SWE	\N
3656	Norrbottens l�n	County	SWE	\N
3658	S�dermanlands l�n	County	SWE	\N
3659	�sterg�tlands l�n	County	SWE	\N
3660	J�nk�pings l�n	County	SWE	\N
3661	Kronoborgs l�n	County	SWE	\N
3662	Kalmar l�n	County	SWE	\N
3663	Gotlands l�n	County	SWE	\N
3664	Blekinge l�n	County	SWE	\N
3665	Sk�ne l�n	County	SWE	\N
3666	Hallands l�n	County	SWE	\N
3667	V�stra G�talands l�n	County	SWE	\N
3668	V�rmlands l�n	County	SWE	\N
3669	�rebro l�n	County	SWE	\N
3670	V�stmanlands l�n	County	SWE	\N
3671	Dalarnes l�n	County	SWE	\N
3672	G�vleborgs l�n	County	SWE	\N
3673	V�sternorrlands l�n	County	SWE	\N
3674	J�mtlands l�n	County	SWE	\N
3675	Central Singapore	District	SGP	\N
3676	North East	District	SGP	\N
3677	North West	District	SGP	\N
3678	South East	District	SGP	\N
3679	South West	District	SGP	\N
3680	Ascension	Geographical entity	SHN	\N
3681	Saint Helena	Geographical entity	SHN	\N
3682	Tristan da Cunha	Geographical entity	SHN	\N
3683	Ajdov�cina	Municipality	SVN	\N
3684	Beltinci	Municipality	SVN	\N
3685	Bled	Municipality	SVN	\N
3686	Bohinj	Municipality	SVN	\N
3687	Borovnica	Municipality	SVN	\N
3688	Bovec	Municipality	SVN	\N
3689	Brda	Municipality	SVN	\N
3690	Brezovica	Municipality	SVN	\N
3691	Bre�ice	Municipality	SVN	\N
3692	Ti�ina	Municipality	SVN	\N
3693	Celje	Municipality	SVN	\N
3694	Cerklje na Gorenjskem	Municipality	SVN	\N
3695	Cerknica	Municipality	SVN	\N
3696	Cerkno	Municipality	SVN	\N
3697	Cren�ovci	Municipality	SVN	\N
3698	Crna na Koro�kem	Municipality	SVN	\N
3699	Crnomelj	Municipality	SVN	\N
3700	Destrnik	Municipality	SVN	\N
3701	Divaca	Municipality	SVN	\N
3702	Dobrepolje	Municipality	SVN	\N
3703	Dobrova-Polhov Gradec	Municipality	SVN	\N
3704	Dol pri Ljubljani	Municipality	SVN	\N
3705	Dom�ale	Municipality	SVN	\N
3706	Dornava	Municipality	SVN	\N
3707	Dravograd	Municipality	SVN	\N
3708	Duplek	Municipality	SVN	\N
3709	Gorenja vas-Poljane	Municipality	SVN	\N
3710	Gori�nica	Municipality	SVN	\N
3711	Gornja Radgona	Municipality	SVN	\N
3712	Gornji Grad	Municipality	SVN	\N
3713	Gornji Petrovci	Municipality	SVN	\N
3714	Grosuplje	Municipality	SVN	\N
3715	�alovci	Municipality	SVN	\N
3716	Hrastnik	Municipality	SVN	\N
3717	Hrpelje-Kozina	Municipality	SVN	\N
3718	Idrija	Municipality	SVN	\N
3719	Ig	Municipality	SVN	\N
3720	Ilirska Bistrica	Municipality	SVN	\N
3721	Ivancna Gorica	Municipality	SVN	\N
3722	Izola	Municipality	SVN	\N
3723	Jesenice	Municipality	SVN	\N
3724	Jur�inci	Municipality	SVN	\N
3725	Kamnik	Municipality	SVN	\N
3726	Kanal	Municipality	SVN	\N
3727	Kidricevo	Municipality	SVN	\N
3728	Kobarid	Municipality	SVN	\N
3729	Kobilje	Municipality	SVN	\N
3730	Kocevje	Municipality	SVN	\N
3731	Komen	Municipality	SVN	\N
3732	Koper	Municipality	SVN	\N
3733	Kozje	Municipality	SVN	\N
3734	Kranj	Municipality	SVN	\N
3735	Kranjska Gora	Municipality	SVN	\N
3736	Kr�ko	Municipality	SVN	\N
3737	Kungota	Municipality	SVN	\N
3738	Kuzma	Municipality	SVN	\N
3739	La�ko	Municipality	SVN	\N
3740	Lenart	Municipality	SVN	\N
3741	Lendava	Municipality	SVN	\N
3742	Litija	Municipality	SVN	\N
3743	Ljubljana	Municipality	SVN	\N
3744	Ljubno	Municipality	SVN	\N
3745	Ljutomer	Municipality	SVN	\N
3746	Logatec	Municipality	SVN	\N
3747	Lo�ka dolina	Municipality	SVN	\N
3748	Lo�ki Potok	Municipality	SVN	\N
3749	Luce	Municipality	SVN	\N
3750	Lukovica	Municipality	SVN	\N
3751	Maj�perk	Municipality	SVN	\N
3752	Maribor	Municipality	SVN	\N
3753	Medvode	Municipality	SVN	\N
3754	Menge�	Municipality	SVN	\N
3755	Metlika	Municipality	SVN	\N
3756	Me�ica	Municipality	SVN	\N
3757	Miren-Kostanjevica	Municipality	SVN	\N
3758	Mislinja	Municipality	SVN	\N
3759	Moravce	Municipality	SVN	\N
3760	Moravske Toplice	Municipality	SVN	\N
3761	Mozirje	Municipality	SVN	\N
3762	Murska Sobota	Municipality	SVN	\N
3763	Muta	Municipality	SVN	\N
3764	Naklo	Municipality	SVN	\N
3765	Nazarje	Municipality	SVN	\N
3766	Nova Gorica	Municipality	SVN	\N
3767	Novo mesto	Municipality	SVN	\N
3768	Odranci	Municipality	SVN	\N
3769	Ormo�	Municipality	SVN	\N
3770	Osilnica	Municipality	SVN	\N
3771	Pesnica	Municipality	SVN	\N
3772	Piran	Municipality	SVN	\N
3773	Pivka	Municipality	SVN	\N
3774	Podcetrtek	Municipality	SVN	\N
3775	Podvelka	Municipality	SVN	\N
3776	Postojna	Municipality	SVN	\N
3777	Preddvor	Municipality	SVN	\N
3778	Ptuj	Municipality	SVN	\N
3779	Puconci	Municipality	SVN	\N
3780	Race-Fram	Municipality	SVN	\N
3781	Radece	Municipality	SVN	\N
3782	Radenci	Municipality	SVN	\N
3783	Radlje ob Dravi	Municipality	SVN	\N
3784	Radovljica	Municipality	SVN	\N
3785	Ravne na Koro�kem	Municipality	SVN	\N
3786	Ribnica	Municipality	SVN	\N
3787	Roga�ovci	Municipality	SVN	\N
3788	Roga�ka Slatina	Municipality	SVN	\N
3789	Rogatec	Municipality	SVN	\N
3790	Ru�e	Municipality	SVN	\N
3791	Semic	Municipality	SVN	\N
3792	Sevnica	Municipality	SVN	\N
3793	Se�ana	Municipality	SVN	\N
3794	Slovenj Gradec	Municipality	SVN	\N
3795	Slovenska Bistrica	Municipality	SVN	\N
3796	Slovenske Konjice	Municipality	SVN	\N
3797	Star�e	Municipality	SVN	\N
3798	Sveti Jurij ob �cavnic	Municipality	SVN	\N
3799	�encur	Municipality	SVN	\N
3800	�entilj	Municipality	SVN	\N
3801	�entjernej	Municipality	SVN	\N
3802	�entjur	Municipality	SVN	\N
3803	�kocjan	Municipality	SVN	\N
3804	�kofja Loka	Municipality	SVN	\N
3805	�kofljica	Municipality	SVN	\N
3806	�marje pri Jel�ah	Municipality	SVN	\N
3807	�martno ob Paki	Municipality	SVN	\N
3808	�o�tanj	Municipality	SVN	\N
3809	�tore	Municipality	SVN	\N
3810	Tolmin	Municipality	SVN	\N
3811	Trbovlje	Municipality	SVN	\N
3812	Trebnje	Municipality	SVN	\N
3813	Tr�ic	Municipality	SVN	\N
3814	Turni�ce	Municipality	SVN	\N
3815	Velenje	Municipality	SVN	\N
3816	Velike La�ce	Municipality	SVN	\N
3817	Videm	Municipality	SVN	\N
3818	Vipava	Municipality	SVN	\N
3819	Vitanje	Municipality	SVN	\N
3820	Vodice	Municipality	SVN	\N
3821	Vojnik	Municipality	SVN	\N
3822	Vrhnika	Municipality	SVN	\N
3823	Vuzenica	Municipality	SVN	\N
3824	Zagorje ob Savi	Municipality	SVN	\N
3825	Zavrc	Municipality	SVN	\N
3826	Zrece	Municipality	SVN	\N
3827	�elezniki	Municipality	SVN	\N
3828	�iri	Municipality	SVN	\N
3829	Benedikt	Municipality	SVN	\N
3830	Bistrica ob Sotli	Municipality	SVN	\N
3831	Bloke	Municipality	SVN	\N
3832	Braslovce	Municipality	SVN	\N
3833	Cankova	Municipality	SVN	\N
3834	Cerkvenjak	Municipality	SVN	\N
3835	Dobje	Municipality	SVN	\N
3836	Dobrna	Municipality	SVN	\N
3837	Dobrovnik	Municipality	SVN	\N
3838	Dolenjske Toplice	Municipality	SVN	\N
3839	Grad	Municipality	SVN	\N
3840	Hajdina	Municipality	SVN	\N
3841	Hoce-Slivnica	Municipality	SVN	\N
3842	Hodo�	Municipality	SVN	\N
3843	Horjul	Municipality	SVN	\N
3844	Jezersko	Municipality	SVN	\N
3845	Komenda	Municipality	SVN	\N
3846	Kostel	Municipality	SVN	\N
3847	Kri�evci	Municipality	SVN	\N
3848	Lovrenc na Pohorju	Municipality	SVN	\N
3849	Markovci	Municipality	SVN	\N
3850	Miklav� na Dravskem polju	Municipality	SVN	\N
3851	Mirna Pec	Municipality	SVN	\N
3852	Oplotnica	Municipality	SVN	\N
3853	Podlehnik	Municipality	SVN	\N
3854	Polzela	Municipality	SVN	\N
3855	Prebold	Municipality	SVN	\N
3856	Prevalje	Municipality	SVN	\N
3857	Razkri�je	Municipality	SVN	\N
3858	Ribnica na Pohorju	Municipality	SVN	\N
3859	Selnica ob Dravi	Municipality	SVN	\N
3860	Sodra�ica	Municipality	SVN	\N
3861	Solcava	Municipality	SVN	\N
3862	Sveta Ana	Municipality	SVN	\N
3863	Sveti Andra� v Slovenskih goricah	Municipality	SVN	\N
3864	�empeter-Vrtojba	Municipality	SVN	\N
3865	Tabor	Municipality	SVN	\N
3866	Trnovska vas	Municipality	SVN	\N
3867	Trzin	Municipality	SVN	\N
3868	Velika Polana	Municipality	SVN	\N
3869	Ver�ej	Municipality	SVN	\N
3870	Vransko	Municipality	SVN	\N
3871	�alec	Municipality	SVN	\N
3872	�etale	Municipality	SVN	\N
3873	�irovnica	Municipality	SVN	\N
3874	�u�emberk	Municipality	SVN	\N
3875	�martno pri Litiji	Municipality	SVN	\N
3876	Apace	Municipality	SVN	\N
3877	Cirkulane	Municipality	SVN	\N
3878	Kosanjevica na Krki	Municipality	SVN	\N
3879	Makole	Municipality	SVN	\N
3880	Mokronog-Trebelno	Municipality	SVN	\N
3881	Poljcane	Municipality	SVN	\N
3882	Ren�e-Vogrsko	Municipality	SVN	\N
3883	Sredi�ce ob Dravi	Municipality	SVN	\N
3884	Stra�a	Municipality	SVN	\N
3885	Sveta Trojica v Slovenskih\r\ngoricah	Municipality	SVN	\N
3886	Sveti Toma�	Municipality	SVN	\N
3887	�marje�ke Toplice	Municipality	SVN	\N
3888	Gorje	Municipality	SVN	\N
3889	Log-Dragomer	Municipality	SVN	\N
3890	Recica ob Savinji	Municipality	SVN	\N
3891	Sveti Jurij v Slovenskih goricah	Municipality	SVN	\N
3892	�entrupert	Municipality	SVN	\N
3893	Mirna	Municipality	SVN	\N
3894	Ankaran	Municipality	SVN	\N
3895	Banskobystrick? kraj	Region	SVK	\N
3896	Bratislavsk? kraj	Region	SVK	\N
3897	Ko�ick? kraj	Region	SVK	\N
3898	Nitriansky kraj	Region	SVK	\N
3899	Pre�ovsk? kraj	Region	SVK	\N
3900	Trnavsk? kraj	Region	SVK	\N
3901	Trenciansky kraj	Region	SVK	\N
3902	�ilinsk? kraj	Region	SVK	\N
3903	Eastern	Province	SLE	\N
3904	Northern	Province	SLE	\N
3905	North Western	Province	SLE	\N
3906	Southern	Province	SLE	\N
3907	Western Area (Freetown)	Area	SLE	\N
3908	Acquaviva      	Municipality	SMR	\N
3909	Chiesanuova    	Municipality	SMR	\N
3910	Domagnano      	Municipality	SMR	\N
3911	Faetano        	Municipality	SMR	\N
3912	Fiorentino     	Municipality	SMR	\N
3913	Borgo Maggiore 	Municipality	SMR	\N
3914	Citt� di SanMarino	Municipality	SMR	\N
3915	Montegiardino  	Municipality	SMR	\N
3916	Serravalle     	Municipality	SMR	\N
3917	Diourbel	Region	SEN	\N
3918	Dakar	Region	SEN	\N
3919	Fatick	Region	SEN	\N
3920	Kaffrine	Region	SEN	\N
3921	Kolda	Region	SEN	\N
3922	K�dougou	Region	SEN	\N
3923	Kaolack	Region	SEN	\N
3924	Louga	Region	SEN	\N
3925	Matam	Region	SEN	\N
3926	S�dhiou	Region	SEN	\N
3927	Saint-Louis	Region	SEN	\N
3928	Tambacounda	Region	SEN	\N
3929	Thi�s	Region	SEN	\N
3930	Ziguinchor	Region	SEN	\N
3931	Awdal	Region	SOM	\N
3932	Bakool	Region	SOM	\N
3933	Banaadir	Region	SOM	\N
3934	Bari	Region	SOM	\N
3935	Bay	Region	SOM	\N
3936	Galguduud	Region	SOM	\N
3937	Gedo	Region	SOM	\N
3938	Hiiraan	Region	SOM	\N
3939	Jubbada Dhexe	Region	SOM	\N
3940	Jubbada Hoose	Region	SOM	\N
3941	Mudug	Region	SOM	\N
3942	Nugaal	Region	SOM	\N
3943	Sanaag	Region	SOM	\N
3944	Shabeellaha Dhexe	Region	SOM	\N
3945	Shabeellaha Hoose	Region	SOM	\N
3946	Sool	Region	SOM	\N
3947	Togdheer	Region	SOM	\N
3948	Woqooyi Galbeed	Region	SOM	\N
3949	Brokopondo	District	SUR	\N
3950	Commewijne	District	SUR	\N
3951	Coronie	District	SUR	\N
3952	Marowijne	District	SUR	\N
3953	Nickerie	District	SUR	\N
3954	Paramaribo	\N	SUR	\N
3955	Para	District	SUR	\N
3956	Saramacca	District	SUR	\N
3957	Sipaliwini	District	SUR	\N
3958	Wanica	District	SUR	\N
3959	Northern Bahr el Ghazal	State	SSD	\N
3960	Western Bahr el Ghazal	State	SSD	\N
3961	Central Equatoria	State	SSD	\N
3962	Eastern Equatoria	State	SSD	\N
3963	Western Equatoria	State	SSD	\N
3964	Jonglei	State	SSD	\N
3965	Lakes	State	SSD	\N
3966	Upper Nile	State	SSD	\N
3967	Unity	State	SSD	\N
3968	Warrap	State	SSD	\N
3969	�gua Grande	District	STP	\N
3970	Cantagalo	District	STP	\N
3971	Cau�	District	STP	\N
3972	Lemb�	District	STP	\N
3973	Lobata	District	STP	\N
3974	M�-Z�ch	District	STP	\N
3975	Pr�ncipe	autonomous region	STP	\N
3976	Ahuachap�n	 Department	SLV	\N
3977	Caba�as	 Department	SLV	\N
3978	Chalatenango	 Department	SLV	\N
3979	Cuscatl�n	 Department	SLV	\N
3980	La Libertad	 Department	SLV	\N
3981	Moraz�n	 Department	SLV	\N
3982	La Paz	 Department	SLV	\N
3983	Santa Ana	 Department	SLV	\N
3984	San Miguel	 Department	SLV	\N
3985	Sonsonate	 Department	SLV	\N
3986	San Salvador	 Department	SLV	\N
3987	San Vicente	 Department	SLV	\N
3988	La Uni�n	 Department	SLV	\N
3989	Usulut�n	 Department	SLV	\N
3990	Dimashq	Province	SYR	\N
3991	Dar'a	Province	SYR	\N
3992	Dayr az Zawr	Province	SYR	\N
3993	AI Hasakah	Province	SYR	\N
3994	Hims	Province	SYR	\N
3995	Halab	Province	SYR	\N
3996	Hamah	Province	SYR	\N
3997	Idlib	Province	SYR	\N
3998	AI Ladhiqiyah	Province	SYR	\N
3999	AI Qunaytirah	Province	SYR	\N
4000	Ar Raqqah	Province	SYR	\N
4001	Rif Dimashq	Province	SYR	\N
4002	As Suwayda'	Province	SYR	\N
4003	Tartus	Province	SYR	\N
4004	Hhohho	Region	SWZ	\N
4005	Lubombo	Region	SWZ	\N
4006	Manzini	Region	SWZ	\N
4007	Shiselweni	Region	SWZ	\N
4008	Batha	Province	TCD	\N
4009	Ba?r al Ghazal	Province	TCD	\N
4010	Burku	Province	TCD	\N
4011	Chari-Baguirmi	Province	TCD	\N
4012	Ennedi-Est	Province	TCD	\N
4013	Ennedi-Ouest	Province	TCD	\N
4014	Gu�ra	Province	TCD	\N
4015	Hadjer Lamis	Province	TCD	\N
4016	Kanem	Province	TCD	\N
4017	Lac	Province	TCD	\N
4018	Logone-Occidental	Province	TCD	\N
4019	Logone-Oriental	Province	TCD	\N
4020	Mandoul	Province	TCD	\N
4021	Moyen-Chari	Province	TCD	\N
4022	Mayo-Kebbi-Est	Province	TCD	\N
4023	Mayo-Kebbi-Ouest	Province	TCD	\N
4024	Ville de Ndjamena	Province	TCD	\N
4025	Ouadda�	Province	TCD	\N
4026	Salamat	Province	TCD	\N
4027	Sila	Province	TCD	\N
4028	Tandjil�	Province	TCD	\N
4029	Tibasti	Province	TCD	\N
4030	Wadi Fira	Province	TCD	\N
4031	Centrale	Region	TGO	\N
4032	Kara	Region	TGO	\N
4033	Maritime (R�gion)	Region	TGO	\N
4034	Plateaux	Region	TGO	\N
4035	Savanes	Region	TGO	\N
4036	Krung Thep Maha Nakhon [Bangkok]	Metropolitan administration	THA	\N
4037	Samut Prakan	Province	THA	\N
4038	Nonthaburi	Province	THA	\N
4039	Pathum Thani	Province	THA	\N
4040	Phra Nakhon Si Ayutthaya	Province	THA	\N
4041	Ang Thong	Province	THA	\N
4042	Lop Buri	Province	THA	\N
4043	Sing Buri	Province	THA	\N
4044	Chai Nat	Province	THA	\N
4045	Saraburi	Province	THA	\N
4046	Chon Buri	Province	THA	\N
4047	Rayong	Province	THA	\N
4048	Chanthaburi	Province	THA	\N
4049	Trat	Province	THA	\N
4050	Chachoengsao	Province	THA	\N
4051	Prachin Buri	Province	THA	\N
4052	Nakhon Nayok	Province	THA	\N
4053	Sa Kaeo	Province	THA	\N
4054	Nakhon Ratchasima	Province	THA	\N
4055	Buri Ram	Province	THA	\N
4056	Surin	Province	THA	\N
4057	Si Sa Ket	Province	THA	\N
4058	Ubon Ratchathani	Province	THA	\N
4059	Yasothon	Province	THA	\N
4060	Chaiyaphum	Province	THA	\N
4061	Amnat Charoen	Province	THA	\N
4062	Bueng Kan	Province	THA	\N
4063	Nong Bua Lam Phu	Province	THA	\N
4064	Khon Kaen	Province	THA	\N
4065	Udon Thani	Province	THA	\N
4066	Loei	Province	THA	\N
4067	Nong Khai	Province	THA	\N
4068	Maha Sarakham	Province	THA	\N
4069	Roi Et	Province	THA	\N
4070	Kalasin	Province	THA	\N
4071	Sakon Nakhon	Province	THA	\N
4072	Nakhon Phanom	Province	THA	\N
4073	Mukdahan	Province	THA	\N
4074	Chiang Mai	Province	THA	\N
4075	Lamphun	Province	THA	\N
4076	Lampang	Province	THA	\N
4077	Uttaradit	Province	THA	\N
4078	Phrae	Province	THA	\N
4079	Nan	Province	THA	\N
4080	Phayao	Province	THA	\N
4081	Chiang Rai	Province	THA	\N
4082	Mae Hong Son	Province	THA	\N
4083	Nakhon Sawan	Province	THA	\N
4084	Uthai Thani	Province	THA	\N
4085	Kamphaeng Phet	Province	THA	\N
4086	Tak	Province	THA	\N
4087	Sukhothai	Province	THA	\N
4088	Phitsanulok	Province	THA	\N
4089	Phichit	Province	THA	\N
4090	Phetchabun	Province	THA	\N
4091	Ratchaburi	Province	THA	\N
4092	Kanchanaburi	Province	THA	\N
4093	Suphan Buri	Province	THA	\N
4094	Nakhon Pathom	Province	THA	\N
4095	Samut Sakhon	Province	THA	\N
4096	Samut Songkhram	Province	THA	\N
4097	Phetchaburi	Province	THA	\N
4098	Prachuap Khiri Khan	Province	THA	\N
4099	Nakhon Si Thammarat	Province	THA	\N
4100	Krabi	Province	THA	\N
4101	Phangnga	Province	THA	\N
4102	Phuket	Province	THA	\N
4103	Surat Thani	Province	THA	\N
4104	Ranong	Province	THA	\N
4105	Chumphon	Province	THA	\N
4106	Songkhla	Province	THA	\N
4107	Satun	Province	THA	\N
4108	Trang	Province	THA	\N
4109	Phatthalung	Province	THA	\N
4110	Pattani	Province	THA	\N
4111	Yala	Province	THA	\N
4112	Narathiwat	Province	THA	\N
4113	Phatthaya	special administrative\r\nSpecial administrative city	THA	\N
4114	Dushanbe	Capital territory	TJK	\N
4115	Kuhistoni Badakhshon	Autonomous region	TJK	\N
4116	Khatlon	Region	TJK	\N
4117	nohiyahoi tobei jumhur�	districts under republic administration	TJK	\N
4118	Sughd	Region	TJK	\N
4119	Aileu	Municipality	TLS	\N
4120	Ainaro	Municipality	TLS	\N
4121	Baucau	Municipality	TLS	\N
4122	Bobonaro	Municipality	TLS	\N
4123	Cova Lima	Municipality	TLS	\N
4124	D�li	Municipality	TLS	\N
4125	Ermera	Municipality	TLS	\N
4126	Laut�m	Municipality	TLS	\N
4127	Liqui�a	Municipality	TLS	\N
4128	Manufahi	Municipality	TLS	\N
4129	Manatuto	Municipality	TLS	\N
4130	O�-Cusse Ambeno	Special administrative region	TLS	\N
4131	Viqueque	Municipality	TLS	\N
4132	Ahal	Region	TKM	\N
4133	Balkan	Region	TKM	\N
4134	Dasoguz	Region	TKM	\N
4135	Lebap	Region	TKM	\N
4136	Mary	Region	TKM	\N
4137	Asgabat	City	TKM	\N
4138	Tunis	Governorate	TUN	\N
4139	L'Ariana	Governorate	TUN	\N
4140	Ben Arous	Governorate	TUN	\N
4141	La Manouba	Governorate	TUN	\N
4142	Nabeul	Governorate	TUN	\N
4143	Zaghouan	Governorate	TUN	\N
4144	Bizerte	Governorate	TUN	\N
4145	B�ja	Governorate	TUN	\N
4146	Jendouba	Governorate	TUN	\N
4147	Le Kef	Governorate	TUN	\N
4148	Siliana	Governorate	TUN	\N
4149	Kairouan	Governorate	TUN	\N
4150	Kasserine	Governorate	TUN	\N
4151	Sidi Bouzid	Governorate	TUN	\N
4152	Sousse	Governorate	TUN	\N
4153	Monastir	Governorate	TUN	\N
4154	Mahdia	Governorate	TUN	\N
4155	Sfax	Governorate	TUN	\N
4156	Gafsa	Governorate	TUN	\N
4157	Tozeur	Governorate	TUN	\N
4158	K�bili	Governorate	TUN	\N
4159	Gab�s	Governorate	TUN	\N
4160	M�denine	Governorate	TUN	\N
4161	Tataouine	Governorate	TUN	\N
4162	'Eua	Division	TON	\N
4163	Ha'apai	Division	TON	\N
4164	Niuas	Division	TON	\N
4165	Tongatapu	Division	TON	\N
4166	Vava'u	Division	TON	\N
4167	Adana	Province	TUR	\N
4168	Adiyaman	Province	TUR	\N
4169	Afyonkarahisar	Province	TUR	\N
4170	Agri	Province	TUR	\N
4171	Amasya	Province	TUR	\N
4172	Ankara	Province	TUR	\N
4173	Antalya	Province	TUR	\N
4174	Artvin	Province	TUR	\N
4175	Aydin	Province	TUR	\N
4176	Balikesir	Province	TUR	\N
4177	Bilecik	Province	TUR	\N
4178	Bing�l	Province	TUR	\N
4179	Bitlis	Province	TUR	\N
4180	Bolu	Province	TUR	\N
4181	Burdur	Province	TUR	\N
4182	Bursa	Province	TUR	\N
4183	Canakkale	Province	TUR	\N
4184	�ankiri	Province	TUR	\N
4185	Corum	Province	TUR	\N
4186	Denizli	Province	TUR	\N
4187	Diyarbakir	Province	TUR	\N
4188	Edirne	Province	TUR	\N
4189	Elazig	Province	TUR	\N
4190	Erzincan	Province	TUR	\N
4191	Erzurum	Province	TUR	\N
4192	Eskisehir	Province	TUR	\N
4193	Gaziantep	Province	TUR	\N
4194	Giresun	Province	TUR	\N
4195	G�m�shane	Province	TUR	\N
4196	Hakkari	Province	TUR	\N
4197	Hatay	Province	TUR	\N
4198	Isparta	Province	TUR	\N
4199	Mersin	Province	TUR	\N
4200	Istanbul	Province	TUR	\N
4201	Izmir	Province	TUR	\N
4202	Kars	Province	TUR	\N
4203	Kastamonu	Province	TUR	\N
4204	Kayseri	Province	TUR	\N
4205	Kirklareli	Province	TUR	\N
4206	Kirsehir	Province	TUR	\N
4207	Kocaeli	Province	TUR	\N
4208	Konya	Province	TUR	\N
4209	K�tahya	Province	TUR	\N
4210	Malatya	Province	TUR	\N
4211	Manisa	Province	TUR	\N
4212	Kahramanmaras	Province	TUR	\N
4213	Mardin	Province	TUR	\N
4214	Mugla	Province	TUR	\N
4215	Mus	Province	TUR	\N
4216	Nevsehir	Province	TUR	\N
4217	Nigde	Province	TUR	\N
4218	Ordu	Province	TUR	\N
4219	Rize	Province	TUR	\N
4220	Sakarya	Province	TUR	\N
4221	Samsun	Province	TUR	\N
4222	Siirt	Province	TUR	\N
4223	Sinop	Province	TUR	\N
4224	Sivas	Province	TUR	\N
4225	Tekirdag	Province	TUR	\N
4226	Tokat	Province	TUR	\N
4227	Trabzon	Province	TUR	\N
4228	Tunceli	Province	TUR	\N
4229	Sanliurfa	Province	TUR	\N
4230	Usak	Province	TUR	\N
4231	Van	Province	TUR	\N
4232	Yozgat	Province	TUR	\N
4233	Zonguldak	Province	TUR	\N
4234	Aksaray	Province	TUR	\N
4235	Bayburt	Province	TUR	\N
4236	Karaman	Province	TUR	\N
4237	Kirikkale	Province	TUR	\N
4238	Batman	Province	TUR	\N
4239	Sirnak	Province	TUR	\N
4240	Bartin	Province	TUR	\N
4241	Ardahan	Province	TUR	\N
4242	Igdir	Province	TUR	\N
4243	Yalova	Province	TUR	\N
4244	Karabuk	Province	TUR	\N
4245	Kilis	Province	TUR	\N
4246	Osmaniye	Province	TUR	\N
4247	D�zce	Province	TUR	\N
4248	Arima	Borough	TTO	\N
4249	Chaguanas	Borough	TTO	\N
4250	Couva-Tabaquite-Talparo	Region	TTO	\N
4251	Diego Martin	Region	TTO	\N
4252	Mayaro-Rio Claro	region	TTO	\N
4253	Penal-Debe	Region	TTO	\N
4254	Port of Spain	City	TTO	\N
4255	Princes Town	Region	TTO	\N
4256	Point Fortin	Borough	TTO	\N
4257	San Fernando	City	TTO	\N
4258	Sangre Grande	Region	TTO	\N
4259	Siparia	Region	TTO	\N
4260	San Juan-Laventille	Region	TTO	\N
4261	Tobago	ward	TTO	\N
4262	Tunapuna-Piarco	Region	TTO	\N
4263	Funafuti	Town council	TUV	\N
4264	Niutao	Island council	TUV	\N
4265	Nui	Island council	TUV	\N
4266	Nukufetau	Island council	TUV	\N
4267	Nukulaelae	Island council	TUV	\N
4268	Nanumea	Island council	TUV	\N
4269	Nanumaga	Island council	TUV	\N
4270	Vaitupu	Island council	TUV	\N
4271	Changhua	County	TWN	\N
4272	Chiayi	City	TWN	\N
4273	Chiayi	County	TWN	\N
4274	Hsinchu	County	TWN	\N
4275	Hsinchu	City	TWN	\N
4276	Hualien	County	TWN	\N
4277	Yilan	County	TWN	\N
4278	Keelung	City	TWN	\N
4279	Kaohsiung	special municipality	TWN	\N
4280	Kinmen	County	TWN	\N
4281	Lienchiang	County	TWN	\N
4282	Miaoli	County	TWN	\N
4283	Nantou	County	TWN	\N
4284	New Taipei	special municipality	TWN	\N
4285	Penghu	County	TWN	\N
4286	Pingtung	County	TWN	\N
4287	Taoyuan	special municipality	TWN	\N
4288	Tainan	special municipality	TWN	\N
4289	Taipei	special municipality	TWN	\N
4290	Taitung	County	TWN	\N
4291	Taichung	special municipality	TWN	\N
4292	Yunlin	County	TWN	\N
4293	Arusha	Region	TZA	\N
4294	Dar es Salaam	Region	TZA	\N
4295	Dodoma	Region	TZA	\N
4296	Iringa	Region	TZA	\N
4297	Kagera	Region	TZA	\N
4298	Kaskazini Pemba	Region	TZA	\N
4299	Kaskazini Unguja	Region	TZA	\N
4300	Kigoma	Region	TZA	\N
4301	Kilimanjaro	Region	TZA	\N
4302	Kusini Pemba	Region	TZA	\N
4303	Kusini Unguja	Region	TZA	\N
4304	Lindi	Region	TZA	\N
4305	Mara	Region	TZA	\N
4306	Mbeya	Region	TZA	\N
4307	Mjini Magharibi	Region	TZA	\N
4308	Morogoro	Region	TZA	\N
4309	Mtwara	Region	TZA	\N
4310	Mwanza	Region	TZA	\N
4311	Pwani	Region	TZA	\N
4312	Rukwa	Region	TZA	\N
4313	Ruvuma	Region	TZA	\N
4314	Shinyanga	Region	TZA	\N
4315	Singida	Region	TZA	\N
4316	Tabora	Region	TZA	\N
4317	Tanga	Region	TZA	\N
4318	Manyara	Region	TZA	\N
4319	Geita	Region	TZA	\N
4320	Katavi	Region	TZA	\N
4321	Njombe	Region	TZA	\N
4322	Simiyu	Region	TZA	\N
4323	Songwe	Region	TZA	\N
4324	Vinnytska oblast	Region	UKR	\N
4325	Volynska oblast	Region	UKR	\N
4326	Luhanska oblast	Region	UKR	\N
4327	Dnipropetrovska oblast	Region	UKR	\N
4328	Donetska oblast	Region	UKR	\N
4329	Zhytomyrska oblast	Region	UKR	\N
4330	Zakarpatska oblast	Region	UKR	\N
4331	Zaporizka oblast	Region	UKR	\N
4332	Ivano-Frankivska oblast	Region	UKR	\N
4333	Kyiv	City	UKR	\N
4334	Kyivska oblast	Region	UKR	\N
4335	Kirovohradska oblast	Region	UKR	\N
4336	Sevastopol	City	UKR	\N
4337	Avtonomna Respublika Krym	Republic	UKR	\N
4338	Lvivska oblast	Region	UKR	\N
4339	Mykolaivska oblast	Region	UKR	\N
4340	Odeska oblast	Region	UKR	\N
4341	Poltavska oblast	Region	UKR	\N
4342	Rivnenska oblast	Region	UKR	\N
4343	Sumska oblast	Region	UKR	\N
4344	Ternopilska oblast	Region	UKR	\N
4345	Kharkivska oblast	Region	UKR	\N
4346	Khersonska oblast	Region	UKR	\N
4347	Khmelnytska oblast	Region	UKR	\N
4348	Cherkaska oblast	Region	UKR	\N
4349	Chernihivska oblast	Region	UKR	\N
4350	Chernivetska oblast	Region	UKR	\N
4351	Kalangala	District	UGA	\N
4352	Kampala	City	UGA	\N
4353	Kiboga	District	UGA	\N
4354	Luwero	District	UGA	\N
4355	Masaka	District	UGA	\N
4356	Mpigi	District	UGA	\N
4357	Mubende	District	UGA	\N
4358	Mukono	District	UGA	\N
4359	Nakasongola	District	UGA	\N
4360	Rakai	District	UGA	\N
4361	Sembabule	District	UGA	\N
4362	Kayunga	District	UGA	\N
4363	Wakiso	District	UGA	\N
4364	Lyantonde	District	UGA	\N
4365	Mityana	District	UGA	\N
4366	Nakaseke	District	UGA	\N
4367	Buikwe	District	UGA	\N
4368	Bukomansibi	District	UGA	\N
4369	Butambala	District	UGA	\N
4370	Buvuma	District	UGA	\N
4371	Gomba	District	UGA	\N
4372	Kalungu	District	UGA	\N
4373	Kyankwanzi	District	UGA	\N
4374	Lwengo	District	UGA	\N
4375	Kyotera	District	UGA	\N
4376	Kasanda	District	UGA	\N
4377	Bugiri	District	UGA	\N
4378	Busia	District	UGA	\N
4379	Iganga	District	UGA	\N
4380	Jinja	District	UGA	\N
4381	Kamuli	District	UGA	\N
4382	Kapchorwa	District	UGA	\N
4383	Katakwi	District	UGA	\N
4384	Kumi	District	UGA	\N
4385	Mbale	District	UGA	\N
4386	Pallisa	District	UGA	\N
4387	Soroti	District	UGA	\N
4388	Tororo	District	UGA	\N
4389	Kaberamaido	District	UGA	\N
4390	Sironko	District	UGA	\N
4391	Amuria	District	UGA	\N
4392	Budaka	District	UGA	\N
4393	Bududa	District	UGA	\N
4394	Bukedea	District	UGA	\N
4395	Bukwo	District	UGA	\N
4396	Butaleja	District	UGA	\N
4397	Kaliro	District	UGA	\N
4398	Manafwa	District	UGA	\N
4399	Namutumba	District	UGA	\N
4400	Bulambuli	District	UGA	\N
4401	Buyende	District	UGA	\N
4402	Kibuku	District	UGA	\N
4403	Kween	District	UGA	\N
4404	Luuka	District	UGA	\N
4405	Namayingo	District	UGA	\N
4406	Ngora	District	UGA	\N
4407	Serere	District	UGA	\N
4408	Butebo	District	UGA	\N
4409	Namisindwa	District	UGA	\N
4410	Bugweri	District	UGA	\N
4411	Kapelebyong	District	UGA	\N
4412	Kalaki	District	UGA	\N
4413	Mayuge	District	UGA	\N
4414	Adjumani	District	UGA	\N
4415	Apac	District	UGA	\N
4416	Arua	District	UGA	\N
4417	Gulu	District	UGA	\N
4418	Kitgum	District	UGA	\N
4419	Kotido	District	UGA	\N
4420	Lira	District	UGA	\N
4421	Moroto	District	UGA	\N
4422	Moyo	District	UGA	\N
4423	Nebbi	District	UGA	\N
4424	Nakapiripirit	District	UGA	\N
4425	Pader	District	UGA	\N
4426	Yumbe	District	UGA	\N
4427	Abim	District	UGA	\N
4428	Amolatar	District	UGA	\N
4429	Amuru	District	UGA	\N
4430	Dokolo	District	UGA	\N
4431	Kaabong	District	UGA	\N
4432	Koboko	District	UGA	\N
4433	Maracha	District	UGA	\N
4434	Oyam	District	UGA	\N
4435	Kole	District	UGA	\N
4436	Lamwo	District	UGA	\N
4437	Napak	District	UGA	\N
4438	Nwoya	District	UGA	\N
4439	Otuke	District	UGA	\N
4440	Zombo	District	UGA	\N
4441	Omoro	District	UGA	\N
4442	Pakwach	District	UGA	\N
4443	Kwania	District	UGA	\N
4444	Nabilatuk	District	UGA	\N
4445	Karenga	District	UGA	\N
4446	Madi-Okollo	District	UGA	\N
4447	Obongi	District	UGA	\N
4448	Bundibugyo	District	UGA	\N
4449	Bushenyi	District	UGA	\N
4450	Hoima	District	UGA	\N
4451	Kabale	District	UGA	\N
4452	Kabarole	District	UGA	\N
4453	Kasese	District	UGA	\N
4454	Kibaale	District	UGA	\N
4455	Kisoro	District	UGA	\N
4456	Masindi	District	UGA	\N
4457	Mbarara	District	UGA	\N
4458	Ntungamo	District	UGA	\N
4459	Rukungiri	District	UGA	\N
4460	Kamwenge	District	UGA	\N
4461	Kanungu	District	UGA	\N
4462	Kyenjojo	District	UGA	\N
4463	Buliisa	District	UGA	\N
4464	Ibanda	District	UGA	\N
4465	Isingiro	District	UGA	\N
4466	Kiruhura	District	UGA	\N
4467	Buhweju	District	UGA	\N
4468	Kiryandongo	District	UGA	\N
4469	Kyegegwa	District	UGA	\N
4470	Mitooma	District	UGA	\N
4471	Ntoroko	District	UGA	\N
4472	Rubirizi	District	UGA	\N
4473	Sheema	District	UGA	\N
4474	Kagadi	District	UGA	\N
4475	Kakumiro	District	UGA	\N
4476	Rubanda	District	UGA	\N
4477	Bunyangabu	District	UGA	\N
4478	Rukiga	District	UGA	\N
4479	Kikuube	District	UGA	\N
4480	Kazo	District	UGA	\N
4481	Kitagwenda	District	UGA	\N
4482	Rwampara	District	UGA	\N
4483	Johnston Atoll (ISO reserved code = JT)	Islands/Groups of Islands	UMI	\N
4484	Midway Islands (ISO reserved code = I)	Islands/Groups of Islands	UMI	\N
4485	Navassa Island (ISO reserved code = NV)	Islands/Groups of Islands	UMI	\N
4486	Wake Island (ISO reserved code = WK)	Islands/Groups of Islands	UMI	\N
4487	Baker Island	Islands/Groups of Islands	UMI	\N
4488	Howland Island	Islands/Groups of Islands	UMI	\N
4489	Jarvis Island	Islands/Groups of Islands	UMI	\N
4490	Kingman Reef	Islands/Groups of Islands	UMI	\N
4491	Palmyra Atoll	Islands/Groups of Islands	UMI	\N
4492	Alaska	State	USA	\N
4493	Alabama	State	USA	\N
4494	Arkansas	State	USA	\N
4495	American Samoa (see also separate entry under AS)	Outlying area	USA	\N
4496	Arizona	State	USA	\N
4497	California	State	USA	\N
4498	Colorado	State	USA	\N
4499	Connecticut	State	USA	\N
4500	District of Columbia	District	USA	\N
4501	Delaware	State	USA	\N
4502	Florida	State	USA	\N
4503	Georgia	State	USA	\N
4504	Guam (see also separate entry under GU)	Outlying area	USA	\N
4505	Hawaii	State	USA	\N
4506	Iowa	State	USA	\N
4507	Idaho	State	USA	\N
4508	Illinois	State	USA	\N
4509	Indiana	State	USA	\N
4510	Kansas	State	USA	\N
4511	Kentucky	State	USA	\N
4512	Louisiana	State	USA	\N
4513	Massachusetts	State	USA	\N
4514	Maryland	State	USA	\N
4515	Maine	State	USA	\N
4516	Michigan	State	USA	\N
4517	Minnesota	State	USA	\N
4518	Missouri	State	USA	\N
4519	Northern Mariana Islands (see also separate entry MP)	Outlying area	USA	\N
4520	Mississippi	State	USA	\N
4521	Montana	State	USA	\N
4522	North Carolina	State	USA	\N
4523	North Dakota	State	USA	\N
4524	Nebraska	State	USA	\N
4525	New Hampshire	State	USA	\N
4526	New Jersey	State	USA	\N
4527	New Mexico	State	USA	\N
4528	Nevada	State	USA	\N
4529	New York	State	USA	\N
4530	Ohio	State	USA	\N
4531	Oklahoma	State	USA	\N
4532	Oregon	State	USA	\N
4533	Pennsylvania	State	USA	\N
4534	Puerto Rico (see also separate entry under PR)	Outlying area	USA	\N
4535	Rhode Island	State	USA	\N
4536	South Carolina	State	USA	\N
4537	South Dakota	State	USA	\N
4538	Tennessee	State	USA	\N
4539	Texas	State	USA	\N
4540	U.S. Minor Outlying Islands (cf. separate entry UM)	Outlying area	USA	\N
4541	Utah	State	USA	\N
4542	Virginia	State	USA	\N
4543	Virgin Islands of the U.S. (see also separate entry VI)	Outlying area	USA	\N
4544	Vermont	State	USA	\N
4545	Washington	State	USA	\N
4546	Wisconsin	State	USA	\N
4547	West Virginia	State	USA	\N
4548	Wyoming	State	USA	\N
4549	Artigas	 Department	URY	\N
4550	Canelones	 Department	URY	\N
4551	Cerro Largo	 Department	URY	\N
4552	Colonia	 Department	URY	\N
4553	Durazno	 Department	URY	\N
4554	Florida	 Department	URY	\N
4555	Flores	 Department	URY	\N
4556	Lavalleja	 Department	URY	\N
4557	Maldonado	 Department	URY	\N
4558	Montevideo	 Department	URY	\N
4559	Paysand?	 Department	URY	\N
4560	R�o Negro	 Department	URY	\N
4561	Rocha	 Department	URY	\N
4562	Rivera	 Department	URY	\N
4563	Salto	 Department	URY	\N
4564	San Jos�	 Department	URY	\N
4565	Soriano	 Department	URY	\N
4566	Tacuaremb�	 Department	URY	\N
4567	Treinta y Tres	 Department	URY	\N
4568	Andijon	Region	UZB	\N
4569	Bukhoro	Region	UZB	\N
4570	Farg�ona	Region	UZB	\N
4571	Jizzax	Region	UZB	\N
4572	Khorazm	Region	UZB	\N
4573	Namangan	Region	UZB	\N
4574	Nawoiy	Region	UZB	\N
4575	Qashqadaryo	Region	UZB	\N
4576	Qoraqalpog�iston Respublikasi	Republic	UZB	\N
4577	Samarqand	Region	UZB	\N
4578	Sirdaryo	Region	UZB	\N
4579	Surkhondaryo	Region	UZB	\N
4580	Toshkent	City	UZB	\N
4581	Toshkent	Region	UZB	\N
4582	Xorazm	Region	UZB	\N
4583	Charlotte     	Parish	VCT	\N
4584	Saint Andrew  	Parish	VCT	\N
4585	Saint David   	Parish	VCT	\N
4586	Saint George  	Parish	VCT	\N
4587	Saint Patrick 	Parish	VCT	\N
4588	Grenadines    	Parish	VCT	\N
4589	Distrito Capital	Capital district	VEN	\N
4590	Anzo�tegui	State	VEN	\N
4591	Apure	State	VEN	\N
4592	Aragua	State	VEN	\N
4593	Barinas	State	VEN	\N
4594	Bol�var	State	VEN	\N
4595	Carabobo	State	VEN	\N
4596	Cojedes	State	VEN	\N
4597	Falc�n	State	VEN	\N
4598	Gu�rico	State	VEN	\N
4599	Lara	State	VEN	\N
4600	M�rida	State	VEN	\N
4601	Miranda	State	VEN	\N
4602	Monagas	State	VEN	\N
4603	Nueva Esparta	State	VEN	\N
4604	Portuguesa	State	VEN	\N
4605	Sucre	State	VEN	\N
4606	T�chira	State	VEN	\N
4607	Trujillo	State	VEN	\N
4608	Yaracuy	State	VEN	\N
4609	Zulia	State	VEN	\N
4610	Dependencias Federales	Federal dependencies	VEN	\N
4611	La Guaira	State	VEN	\N
4612	Delta Amacuro	State	VEN	\N
4613	Amazonas	State	VEN	\N
4614	Lai Ch�u	Province	VNM	\N
4615	L�o Cai	Province	VNM	\N
4616	H� Giang	Province	VNM	\N
4617	Cao B?ng	Province	VNM	\N
4618	Son La	Province	VNM	\N
4619	Y�n B�i	Province	VNM	\N
4620	Tuy�n Quang	Province	VNM	\N
4621	L?ng Son	Province	VNM	\N
4622	Qu?ng Ninh	Province	VNM	\N
4623	H�a B�nh	Province	VNM	\N
4624	Ninh B�nh	Province	VNM	\N
4625	Th�i B�nh	Province	VNM	\N
4626	Thanh H�a	Province	VNM	\N
4627	Ngh? An	Province	VNM	\N
4628	H� Tinh	Province	VNM	\N
4629	Qu?ng B�nh	Province	VNM	\N
4630	Qu?ng Tr?	Province	VNM	\N
4631	Th?a Thi�n-Hu?	Province	VNM	\N
4632	Qu?ng Nam	Province	VNM	\N
4633	Kon Tum	Province	VNM	\N
4634	Qu?ng Ng�i	Province	VNM	\N
4635	Gia Lai	Province	VNM	\N
4636	B�nh �?nh	Province	VNM	\N
4637	Ph? Y�n	Province	VNM	\N
4638	�?k L?k	Province	VNM	\N
4639	Kh�nh H�a	Province	VNM	\N
4640	L�m �?ng	Province	VNM	\N
4641	Ninh Thu?n	Province	VNM	\N
4642	T�y Ninh	Province	VNM	\N
4643	�?ng Nai	Province	VNM	\N
4644	B�nh Thu?n	Province	VNM	\N
4645	Long An	Province	VNM	\N
4646	B� R?a - Vung T�u	Province	VNM	\N
4647	An Giang	Province	VNM	\N
4648	�?ng Th�p	Province	VNM	\N
4649	Ti?n Giang	Province	VNM	\N
4650	Ki?n Giang	Province	VNM	\N
4651	Vinh Long	Province	VNM	\N
4652	B?n Tre	Province	VNM	\N
4653	Tr� Vinh	Province	VNM	\N
4654	S�c Trang	Province	VNM	\N
4655	B?c K?n	Province	VNM	\N
4656	B?c Giang	Province	VNM	\N
4657	B?c Li�u	Province	VNM	\N
4658	B?c Ninh	Province	VNM	\N
4659	B�nh Duong	Province	VNM	\N
4660	B�nh Phu?c	Province	VNM	\N
4661	C� Mau	Province	VNM	\N
4662	H?i Duong	Province	VNM	\N
4663	H� Nam	Province	VNM	\N
4664	Hung Y�n	Province	VNM	\N
4665	Nam �?nh	Province	VNM	\N
4666	Ph? Th?	Province	VNM	\N
4667	Th�i Nguy�n	Province	VNM	\N
4668	Vinh Ph?c	Province	VNM	\N
4669	�i?n Bi�n	Province	VNM	\N
4670	�?k N�ng	Province	VNM	\N
4671	H?u Giang	Province	VNM	\N
4672	C?n Tho	Municipality	VNM	\N
4673	H� N?i	Municipality	VNM	\N
4674	H?i Ph�ng	Municipality	VNM	\N
4675	H? Ch� Minh	Municipality	VNM	\N
4676	Malampa	\N	VUT	\N
4677	P�nama	\N	VUT	\N
4678	Sanma	\N	VUT	\N
4679	Sh�fa	\N	VUT	\N
4680	Taf�a	\N	VUT	\N
4681	Torba	\N	VUT	\N
4682	A'ana	District	WSM	\N
4683	Aiga-i-le-Tai	District	WSM	\N
4684	Atua	District	WSM	\N
4685	Fa'asaleleaga	District	WSM	\N
4686	Gaga'emauga	District	WSM	\N
4687	Gagaifomauga	District	WSM	\N
4688	Palauli	District	WSM	\N
4689	Satupa 'itea	District	WSM	\N
4690	Tuamasaga	District	WSM	\N
4691	Va'a-o-Fonoti	District	WSM	\N
4692	Vaisigano	District	WSM	\N
4693	Abyan	Governorate	YEM	\N
4694	�Adan	Governorate	YEM	\N
4695	�Amran	Governorate	YEM	\N
4696	Al Bay?a�	Governorate	YEM	\N
4697	A? ?ali�	Governorate	YEM	\N
4698	Dhamar	Governorate	YEM	\N
4699	?a?ramawt	Governorate	YEM	\N
4700	?ajjah	Governorate	YEM	\N
4701	Al ?udaydah	Governorate	YEM	\N
4702	Ibb	Governorate	YEM	\N
4703	Al Jawf	Governorate	YEM	\N
4704	Lahij	Governorate	YEM	\N
4705	Ma�rib	Governorate	YEM	\N
4706	Al Mahrah	Governorate	YEM	\N
4707	Al Ma?wit	Governorate	YEM	\N
4708	Raymah	Governorate	YEM	\N
4709	Amanat al �Asimah [city]	Municipality	YEM	\N
4710	Sa'dah	Governorate	YEM	\N
4711	Shabwah	Governorate	YEM	\N
4712	San?a'	Governorate	YEM	\N
4713	Arkhabil Suqutr�	governorate	YEM	\N
4714	Ta'izz	Governorate	YEM	\N
4715	Eastern Cape	Province	ZAF	\N
4716	Free State	Province	ZAF	\N
4717	Gauteng	Province	ZAF	\N
4718	Kwazulu-Natal	Province	ZAF	\N
4719	Limpopo	Province	ZAF	\N
4720	Mpumalanga	Province	ZAF	\N
4721	Northern Cape	Province	ZAF	\N
4722	North-West	Province	ZAF	\N
4723	Western Cape	Province	ZAF	\N
4724	Western	Province	ZMB	\N
4725	Central	Province	ZMB	\N
4726	Eastern	Province	ZMB	\N
4727	Luapula	Province	ZMB	\N
4728	Northern	Province	ZMB	\N
4729	North-Western	Province	ZMB	\N
4730	Southern	Province	ZMB	\N
4731	Copperbelt	Province	ZMB	\N
4732	Lusaka	Province	ZMB	\N
4733	Muchinga	Province	ZMB	\N
4734	Bulawayo	Province	ZWE	\N
4735	Harare	Province	ZWE	\N
4736	Manicaland	Province	ZWE	\N
4737	Mashonaland Central	Province	ZWE	\N
4738	Mashonaland East	Province	ZWE	\N
4739	Midlands	Province	ZWE	\N
4740	Matabeleland North	Province	ZWE	\N
4741	Matabeleland South	Province	ZWE	\N
4742	Masvingo	Province	ZWE	\N
4743	Mashonaland West	Province	ZWE	\N
\.


--
-- Data for Name: researcher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.researcher (rsc_id, rsc_last_name, rsc_first_name, rsc_org_name, rsc_bio, rsc_affiliations) FROM stdin;
9001	Iberico	Jorge	\N	Supervisor L�der de Pol�ticas del Sector Real del BCRP	\N
9002	Moskvitch	Katia	\N	\N	BBC News
9003	Schneir	Eric Rend�n	\N	\N	IPROGA
9004	\N	\N	OECD	\N	\N
9005	\N	\N	AITHER	\N	\N
9006	Chu	Long	\N	\N	\N
9007	Grafton	R. Quentin	\N	\N	\N
9008	Renzetti	Steven	\N	\N	\N
9009	\N	\N	Asian Development Bank	\N	\N
9010	McIntosh	Arthur C.	\N	\N	Asian Development Bank
9011	\N	\N	Stockholm International Water Institute	\N	\N
9012	Garc�a-Rubio	Miguel A.	\N	\N	\N
9013	Ruiz-Villaverde	Alberto	\N	\N	\N
9014	Gonz�lez-G�mez	Francisco	\N	\N	\N
9015	Farolfi	Stefano	\N	\N	\N
9016	Gallego-Ayala	Jordi	\N	\N	\N
9017	\N	\N	International water association	\N	\N
9018	\N	\N	ARCADIS	\N	\N
9019	Arbu�s	Fernando	\N	\N	\N
9020	Garc�a-Vali�as	Mari�n	\N	\N	\N
9021	\N	\N	International Benchmarking Network for Water and Sanitation Utilities (IBNET)	\N	\N
9022	Ouda	Omar K M	\N	\N	Department of Civil Engineering, Prince Mohamed Bin Fahd University, Al Khobar, Kingdom of Saudi Arabia
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (src_uri, src_title, src_date, src_description, src_belief, src_author_role, src_author_notes, researcher_id, nation_id, company_id, community_id) FROM stdin;
https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	Costo econ�mico del uso de agua desalada en la miner�a chilena	20-Sep-17	\N	\N	COUNTRY	\N	\N	CHL	\N	\N
https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57906	Oficio No 213/2017 de la Comisi�n de Miner�a y Energ�a de la C�mara de Diputados	13-Sep-17	\N	\N	COUNTRY	\N	\N	CHL	\N	\N
https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	Abastecimiento de agua para la agricultura en la costa	\N	\N	\N	RESEARCHER	\N	9001	\N	\N	\N
https://www.bbc.com/news/business-17423097	War for water in Chile's Atacama Desert: Vines or mines?	23-Mar-12	\N	\N	RESEARCHER	\N	9002	\N	\N	\N
https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	Tarifas vigentes para lecturas leidas desde el 31 de julio 2018	30-Jul-18	\N	\N	COMPANY	\N	\N	\N	8001                                                                                                                                                                                                                                                           	\N
https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	Resoluci�n Administrativa nro. 034-2019-ANA-AAA I C-O/ALA-MOQ	19-Mar-19	\N	\N	COUNTRY	\N	\N	PER	\N	\N
https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	Importancia de la valoraci�n del agua en las actividades econ�micas	24-Aug-18	\N	\N	RESEARCHER	\N	9003	\N	\N	\N
https://www.oecd.org/centrodemexico/medios/049dolarespormetrocubicodeaguapaganlosmexicanos.htm	0.49 d�lares por metro c�bico de agua pagan los mexicanos	19-Mar-10	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://books.google.ca/books?id=tMozIyKETkYC&pg=PA66&lpg=PA66&dq=market+price+water+mexico&source=bl&ots=Jd6OJn1NVs&sig=ACfU3U0FExeKYfHUJQPsXRIHXNOlujGnFA&hl=es-419&sa=X&ved=2ahUKEwjb4M-ay7bpAhXFl54KHfqPAwYQ6AEwEXoECAwQAQ#v=onepage&q=market%20price%20water%20mexico&f=false	OECD Environmental Performance Reviews: Mexico	2013	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	Tarifas de agua potable y saneamiento para uso dom�stico tipo residencial (2020) 	Oct-21	\N	\N	COUNTRY	Subdirecci�n General de Agua Potable, Drenaje y Saneamiento	\N	MEX	\N	\N
http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	Tarifas dom�sticas de agua potable, saneamiento e impuestos asociados al servicio en algunas ciudades del mundo, 2015.	2015	\N	\N	COUNTRY	Subdirecci�n General de Agua Potable, Drenaje y Saneamiento	\N	MEX	\N	\N
http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	Tarifas de agua para los tres usos en algunas ciudades, 2020	Oct-21	\N	\N	COUNTRY	Subdirecci�n General de Agua Potable, Drenaje y Saneamiento	\N	MEX	\N	\N
https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	Water and Wastewater Annual Price Escalation Rates for Selected Cities across the United States	Sep-17	\N	\N	COUNTRY	U.S. Department of Energy; Office of energy efficiency & renewable energy	\N	USA	\N	\N
https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	Water Entitlement Market Prices � Summary Report, December 2018	2019	\N	\N	RESEARCHER	\N	9005	\N	\N	\N
https://www.oecd.org/eu/45015101.pdf	Agricultural Water Pricing: EU and Mexico	2010	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	Water Prices in Australia	\N	\N	\N	COMPANY	\N	\N	\N	8002                                                                                                                                                                                                                                                           	\N
https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	Residential water prices 	2021-22	\N	\N	COMPANY	\N	\N	\N	8003                                                                                                                                                                                                                                                           	\N
https://www.sciencedirect.com/science/article/pii/S2212428421000062	Dynamic water pricing and the risk adjusted user cost (RAUC)	Jul-21	\N	\N	RESEARCHER	\N	9006; 9007	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	Multi-dimensional Review of Thailand (Volume 2) 	14-Feb-19	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	Water - The right price can encourage efficiency and investment	\N	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	Environment at a Glance 	2015	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	Sustainable Management of Water Resources in Agriculture 	15-Mar-10	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	OECD Economic Surveys: China 2013 	2013	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	Agricultural Policies in Costa Rica 	3-Apr-17	\N	\N	RESEARCHER	\N	9004	\N	\N	\N
https://vancouver.ca/home-property-development/metered-rates.aspx	Metered utility rates for water, sewer, and energy	\N	\N	\N	COUNTRY	City of Vancouver	\N	CAN	\N	\N
https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	Water Pricing in Canada	2017	\N	\N	RESEARCHER	\N	9008	\N	\N	\N
https://www.comoxvalleyrd.ca/services/water/water-metering-rates	Water Metering & Rates	2022	\N	\N	COUNTRY	Comox Valley Regional District	\N	CAN	\N	\N
https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	2020 Water Rates & Fees	2020	\N	\N	COUNTRY	City of Toronto	\N	CAN	\N	\N
https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	Water in Asian Cities: Utilities' Performance and Civil Society Views	2004	\N	\N	RESEARCHER	\N	9009	\N	\N	\N
https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	Urban Water Supply and Sanitation in Southeast Asia: A Guide to Good Practice	2014	\N	\N	RESEARCHER	\N	9010	\N	\N	\N
https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	Water Tariffing: What's at stake?	Jan-20	\N	\N	RESEARCHER	\N	9011	\N	\N	\N
http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	Water Tariffs English 	July 1 2021	\N	\N	COUNTRY	eThekwini Municipality	\N	ZAF	\N	\N
https://www.mdpi.com/2073-4441/7/4/1456	Urban Water Tariffs in Spain: What Needs to Be Done? 	31-Mar-15	\N	\N	RESEARCHER	\N	9012; 9013; 9014	\N	\N	\N
https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	Domestic water access and pricing in urban areas of Mozambique: between equity and cost recovery for the provision of a vital resource	28-Apr-14	\N	\N	RESEARCHER	\N	9015; 9016	\N	\N	\N
https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	International Statistics for Water Services: Information every water manager should know	2014	\N	\N	RESEARCHER	\N	9017	\N	\N	\N
doi:10.5923/j.env.20130302.05	 Review of Saudi Arabia Municipal Water Tariff	\N	\N	\N	RESEARCHER	\N	9022	\N	\N	\N
http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	Residential Water Metering in Metro Vancouver: Best Practices Guide for Local Governments	Aug-19	\N	\N	COUNTRY	Metro Vancouver	\N	CAN	\N	\N
https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	The role of water pricing and water allocation in agriculture in delivering sustainable water use in Europe - FINAL REPORT	Feb-12	\N	\N	RESEARCHER	\N	9018	\N	\N	\N
https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	Water Tariffs in Spainfree	2020	\N	\N	RESEARCHER	\N	9019; 9020	\N	\N	\N
https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	Utilities	2017	\N	\N	COUNTRY	Tenaga Nasional Berhad	\N	MYS	\N	\N
https://tariffs.ib-net.org/sites	International Benchmarking Network for Water and Sanitation Utilities (IBNET)	\N	\N	\N	RESEARCHER	\N	9021	\N	\N	\N
\.


--
-- Data for Name: value_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.value_price (vp_id, vp_num, vp_date, vp_water_unit, vp_time, vp_type, vp_water_treatment, vp_region_specific, vp_indigenous_territory, source_uri, currency_id, water_impact_id, water_type_id, water_source_id, water_sector_id, region_name, company_id, community_id, location, nation_id) FROM stdin;
1	5.1	2013	Cubic Meter	Annual	Transactional price	Desalination	\N	\N	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
2	1.9	2016	Cubic Meter	Annual	Transactional price	Desalination	\N	\N	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
3	2.6	2016	Cubic Meter	Annual	Transactional price	Desalination	\N	\N	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57906	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
4	1.6	2013	Cubic Meter	\N	Transactional price	\N	\N	\N	https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
5	1.68	2013	Cubic Meter	\N	Transactional price	Desalination	\N	\N	https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
6	80000	2012	Liter	Second	Transactional price	\N	\N	\N	https://www.bbc.com/news/business-17423097	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
7	120000	2012	Liter	Second	Transactional price	\N	\N	\N	https://www.bbc.com/news/business-17423097	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
8	758	2018	\N	Monthly	Transactional price	\N	\N	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
9	924.1	2018	Cubic Meter	\N	Transactional price	Non-Flourated Drinking Water	Huasco-Freirina 	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
10	886.48	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Caldera	\N	\N	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
11	1188.28	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Cha�aral	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
12	929.24	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	D. Almagro-El Salado	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
13	715.51	2018	Cubic Meter	\N	Transactional price	Non-Flourated Drinking Water	Vallenar	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
14	784.53	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Tierra Amarilla	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
15	613.65	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Inca de Oro	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
16	1226.13	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Copiapo	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	PER
17	0.00559	2019	Cubic Meter	\N	Statutory price	\N	Torata	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PEN	\N	\N	\N	\N	Moquegua	\N	\N	\N	PER
18	0.00564	2019	Cubic Meter	\N	Statutory price	\N	Yacango	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PEN	\N	\N	\N	\N	Moquegua	\N	\N	\N	PER
19	0.0056	2019	Cubic Meter	\N	Statutory price	\N	Ilubaya	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PEN	\N	\N	\N	\N	Moquegua	\N	\N	\N	PER
20	0.00577	2019	Cubic Meter	\N	Statutory price	\N	Chujulay	\N	https://www.ana.gob.pe/sites/default/files/normatividad/files/30-RA-0034-2019-03.PDF	PEN	\N	\N	\N	\N	Moquegua	\N	\N	\N	PER
21	0.01675	2005	Cubic Meter	\N	Statutory price	\N	\N	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PEN	\N	\N	\N	\N	Central	\N	\N	\N	PER
22	0.013257	2005	Cubic Meter	\N	Statutory price	\N	\N	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PEN	\N	\N	\N	\N	Northern	\N	\N	\N	PER
23	0.012489	2005	Cubic Meter	\N	Statutory price	\N	Northern	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PEN	\N	\N	\N	\N	Lima	\N	\N	\N	PER
24	0.007102	2005	Cubic Meter	\N	Statutory price	\N	\N	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PEN	\N	\N	\N	\N	Southern	\N	\N	\N	PER
25	0.016897	2005	Cubic Meter	\N	Statutory price	\N	Southern	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PEN	\N	\N	\N	\N	Lima	\N	\N	\N	PER
26	0.011521	2005	Cubic Meter	\N	Statutory price	\N	\N	\N	https://iragerblog.files.wordpress.com/2018/08/6c2ba-foro-inter-irager-2018-valor-del-agua-ers-iproga.pdf	PEN	\N	\N	\N	\N	\N	\N	\N	\N	PER
27	0.066	2013	Cubic Meter	\N	Transactional price	Desalination	\N	\N	https://www.bcrp.gob.pe/docs/Publicaciones/Revista-Moneda/moneda-168/moneda-168-07.pdf	USD	\N	\N	\N	\N	Lambayeque	\N	\N	\N	PER
28	0.49	2008	Cubic Meter	\N	Transactional price	\N	\N	\N	https://www.oecd.org/centrodemexico/medios/049dolarespormetrocubicodeaguapaganlosmexicanos.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
29	7	2008	Cubic Meter	\N	Statutory price	\N	\N	\N	https://books.google.ca/books?id=tMozIyKETkYC&pg=PA66&lpg=PA66&dq=market+price+water+mexico&source=bl&ots=Jd6OJn1NVs&sig=ACfU3U0FExeKYfHUJQPsXRIHXNOlujGnFA&hl=es-419&sa=X&ved=2ahUKEwjb4M-ay7bpAhXFl54KHfqPAwYQ6AEwEXoECAwQAQ#v=onepage&q=market%20price%20water%20mexico&f=false	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
30	16.13	2020	Cubic Meter	\N	Statutory price	Drinking water	Acapulco	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
31	3.87	2020	Cubic Meter	\N	Statutory price	\N	Acapulco	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
32	20	2020	Cubic Meter	\N	Statutory price	\N	Acapulco	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
33	27.32	2020	Cubic Meter	\N	Statutory price	Drinking Water	Aguascalientes	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
34	23.92	2020	Cubic Meter	\N	Statutory price	Drinking Water	Atizapan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
35	3.17	2020	Cubic Meter	\N	Statutory price	\N	Atizapan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
36	27.09	2020	Cubic Meter	\N	Statutory price	\N	Atizapan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
37	43.52	2020	Cubic Meter	\N	Statutory price	Drinking water	Cancun	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
38	17.41	2020	Cubic Meter	\N	Statutory price	\N	Cancun	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
39	60.93	2020	Cubic Meter	\N	Statutory price	\N	Cancun	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
40	16.79	2020	Cubic Meter	\N	Statutory price	Drinking Water	Chiuahua	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
41	1.02	2020	Cubic Meter	\N	Statutory price	\N	Chiuahua	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
42	17.81	2020	Cubic Meter	\N	Statutory price	\N	Chiuahua	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
43	22.98	2020	Cubic Meter	\N	Statutory price	Drinking Water	Ciudad de Mexico	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
44	6.35	2020	Cubic Meter	\N	Statutory price	Drinking Water	Colima	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
45	7.67	2020	Cubic Meter	\N	Statutory price	\N	Colima 	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
46	14.02	2020	Cubic Meter	\N	Statutory price	\N	Colima	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
47	6.52	2020	Cubic Meter	\N	Statutory price	Drinking Water	Cuernavaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
48	1.38	2020	Cubic Meter	\N	Statutory price	Domestic use	Cuernavaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
49	7.9	2020	Cubic Meter	\N	Statutory price	Domestic use	Cuernavaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
50	7.92	2020	Cubic Meter	\N	Statutory price	Domestic use	Culiac�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
51	3.96	2020	Cubic Meter	\N	Statutory price	Domestic use	Culiac�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
52	11.88	2020	Cubic Meter	\N	Statutory price	Domestic use	Culiac�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
53	18.25	2020	Cubic Meter	\N	Statutory price	Domestic use	Delicias	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
54	0.18	2020	Cubic Meter	\N	Statutory price	Domestic use	Delicias	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
55	18.43	2020	Cubic Meter	\N	Statutory price	Domestic use	Delicias	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
56	20.98	2020	Cubic Meter	\N	Statutory price	Domestic use	Ensenada	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
57	16.81	2020	Cubic Meter	\N	Statutory price	Domestic use	Guadalajara	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
58	27.2	2020	Cubic Meter	\N	Statutory price	Domestic use	Guanajuato	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
59	17.84	2020	Cubic Meter	\N	Statutory price	Domestic use	Hermosillo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
60	20.32	2020	Cubic Meter	\N	Statutory price	Domestic use	Irapuato	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
61	18.75	2020	Cubic Meter	\N	Statutory price	Domestic use	Ju�rez	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
62	18.54	2020	Cubic Meter	\N	Statutory price	Domestic use	La Paz	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
63	37.21	2020	Cubic Meter	\N	Statutory price	Domestic use	Le�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
64	6.4	2020	Cubic Meter	\N	Statutory price	Domestic use	Mexicali	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
65	27.66	2020	Cubic Meter	\N	Statutory price	Domestic use	Morelia	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
66	4.95	2020	Cubic Meter	\N	Statutory price	Domestic use	M�rida	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
67	25.71	2020	Cubic Meter	\N	Statutory price	Domestic use	Naucalpan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
68	4.07	2020	Cubic Meter	\N	Statutory price	Domestic use	Oaxaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
69	40.84	2020	Cubic Meter	\N	Statutory price	Domestic use	Pachuca de Soto	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
70	25.71	2020	Cubic Meter	\N	Statutory price	Domestic use	Puebla	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
71	30.83	2020	Cubic Meter	\N	Statutory price	Domestic use	Quer�taro	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
72	11.34	2020	Cubic Meter	\N	Statutory price	Domestic use	Reynosa (Ciudad Reynosa)	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
73	16.93	2020	Cubic Meter	\N	Statutory price	Domestic use	Saltillo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
74	9.41	2020	Cubic Meter	\N	Statutory price	Domestic use	San Juan del Rio	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
75	6	2020	Cubic Meter	\N	Statutory price	Domestic use	San Luis Potos�	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
76	22.17	2020	Cubic Meter	\N	Statutory price	Domestic use	Tepic	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
77	26.6	2020	Cubic Meter	\N	Statutory price	Domestic use	Tijuana	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
78	25.39	2020	Cubic Meter	\N	Statutory price	Domestic use	Tlalnepantla de Baz	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
79	14.3	2020	Cubic Meter	\N	Statutory price	Domestic use	Tlaquepaque	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
80	10.08	2020	Cubic Meter	\N	Statutory price	Domestic use	Tlaxcala	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
81	17.3	2020	Cubic Meter	\N	Statutory price	Domestic use	Toluca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
82	13.2	2020	Cubic Meter	\N	Statutory price	Domestic use	Torre�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
83	7.85	2020	Cubic Meter	\N	Statutory price	Domestic use	Tila de Allende	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
84	15.22	2020	Cubic Meter	\N	Statutory price	Domestic use	Tultitl�n de Mariano Escobedo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
85	19.14	2020	Cubic Meter	\N	Statutory price	Domestic use	Tuxtla Guti�rrez	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
86	1.53	2015	Cubic Meter	\N	Statutory price	Domestic use	Villahermosa	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=0&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
87	13.8	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Ciudad de Mexico	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
88	14	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Seul	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	KOR
89	29.8	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Roma	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	ITA
90	32.5	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Lisboa	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	PRT
91	33	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Madrid	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	ESP
92	35.5	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Tokio	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	JPN
93	39.9	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Budapest	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	HUN
94	44.4	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Estambul	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	TUR
95	59.3	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Los Angeles	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	USA
96	66.3	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Londres	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	GBR
97	70.7	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Paris	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	FRA
98	87.2	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Washington DC	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	USA
99	90.5	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Sydney	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	AUS
100	109.2	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Berlin	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	DEU
101	110.4	2015	Cubic Meter	\N	Statutory price	Drinking water, sanitation, taxes	Copenhage	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&n=mundial	MXN	\N	\N	\N	\N	\N	\N	\N	\N	DNK
102	42.77	2020	Cubic Meter	\N	Statutory price	Commercial use	Acapulco	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
103	40.71	2020	Cubic Meter	\N	Statutory price	Commercial use	Aguascalientes	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
104	53.83	2020	Cubic Meter	\N	Statutory price	Commercial use	Atizapan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
105	90.57	2020	Cubic Meter	\N	Statutory price	Commercial use	Cancun	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
106	19.7	2020	Cubic Meter	\N	Statutory price	Commercial use	Chihuahua	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
107	49.31	2020	Cubic Meter	\N	Statutory price	Commercial use	Ciudad de Mexico	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
108	20.02	2020	Cubic Meter	\N	Statutory price	Commercial use	Colima	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
109	9.9	2020	Cubic Meter	\N	Statutory price	Commercial use	Cuernavaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
110	20.01	2020	Cubic Meter	\N	Statutory price	Commercial use	Cuilacan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
111	25.6	2020	Cubic Meter	\N	Statutory price	Commercial use	Delicias	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
112	74.15	2020	Cubic Meter	\N	Statutory price	Commercial use	Ensenada	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
113	29.17	2020	Cubic Meter	\N	Statutory price	Commercial use	Guadalajara	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
114	32.74	2020	Cubic Meter	\N	Statutory price	Commercial use	Guanajuato	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
115	73.55	2020	Cubic Meter	\N	Statutory price	Commercial use	Hermosillo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
116	25.22	2020	Cubic Meter	\N	Statutory price	Commercial use	Irapuato	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
117	22.98	2020	Cubic Meter	\N	Statutory price	Commercial use	Ju�rez	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
118	41.63	2020	Cubic Meter	\N	Statutory price	Commercial use	La Paz	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
119	65.44	2020	Cubic Meter	\N	Statutory price	Commercial use	Le�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
120	50.53	2020	Cubic Meter	\N	Statutory price	Commercial use	Mexicali	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
121	35.3	2020	Cubic Meter	\N	Statutory price	Commercial use	Morelia	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
122	6.29	2020	Cubic Meter	\N	Statutory price	Commercial use	M�rida	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
123	42.38	2020	Cubic Meter	\N	Statutory price	Commercial use	Naucalpan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
124	5.77	2020	Cubic Meter	\N	Statutory price	Commercial use	Oaxaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
125	37.71	2020	Cubic Meter	\N	Statutory price	Commercial use	Pachuca de Soto	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
126	26.87	2020	Cubic Meter	\N	Statutory price	Commercial use	Puebla	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
127	50.98	2020	Cubic Meter	\N	Statutory price	Commercial use	Quer�taro	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
128	20.58	2020	Cubic Meter	\N	Statutory price	Commercial use	Reynosa (Ciudad Reynosa)	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
129	26.03	2020	Cubic Meter	\N	Statutory price	Commercial use	Saltillo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
130	18.39	2020	Cubic Meter	\N	Statutory price	Commercial use	San Juan del Rio	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
131	18.53	2020	Cubic Meter	\N	Statutory price	Commercial use	San Luis Potos�	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
132	25.63	2020	Cubic Meter	\N	Statutory price	Commercial use	Tepic	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
133	79.05	2020	Cubic Meter	\N	Statutory price	Commercial use	Tijuana	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
134	49.29	2020	Cubic Meter	\N	Statutory price	Commercial use	Tlalnepantla de Baz	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
135	25.37	2020	Cubic Meter	\N	Statutory price	Commercial use	Tlaquepaque	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
136	51.93	2020	Cubic Meter	\N	Statutory price	Commercial use	Tlaxcala	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
137	33.95	2020	Cubic Meter	\N	Statutory price	Commercial use	Toluca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
138	36.04	2020	Cubic Meter	\N	Statutory price	Commercial use	Torre�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
139	13.65	2020	Cubic Meter	\N	Statutory price	Commercial use	Tila de Allende	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
140	37.72	2020	Cubic Meter	\N	Statutory price	Commercial use	Tultitl�n de Mariano Escobedo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
141	25.07	2020	Cubic Meter	\N	Statutory price	Commercial use	Tuxtla Guti�rrez	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
142	6.79	2020	Cubic Meter	\N	Statutory price	Commercial use	Villahermosa	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
143	52.33	2020	Cubic Meter	\N	Statutory price	Industrial use	Aguascalientes	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
144	33.55	2020	Cubic Meter	\N	Statutory price	Industrial use	Cancun	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
145	28.05	2020	Cubic Meter	\N	Statutory price	Industrial use	Chihuahua	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
146	49.31	2020	Cubic Meter	\N	Statutory price	Industrial use	Ciudad de Mexico	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
147	17.53	2020	Cubic Meter	\N	Statutory price	Industrial use	Colima	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
148	16.53	2020	Cubic Meter	\N	Statutory price	Industrial use	Cuernavaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
149	24.7	2020	Cubic Meter	\N	Statutory price	Industrial use	Cuilacan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
150	27.03	2020	Cubic Meter	\N	Statutory price	Industrial use	Delicias	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
151	74.15	2020	Cubic Meter	\N	Statutory price	Industrial use	Ensenada	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
152	30.04	2020	Cubic Meter	\N	Statutory price	Industrial use	Guadalajara	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
153	75.29	2020	Cubic Meter	\N	Statutory price	Industrial use	Guanajuato	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
154	73.55	2020	Cubic Meter	\N	Statutory price	Industrial use	Hermosillo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
155	31.68	2020	Cubic Meter	\N	Statutory price	Industrial use	Irapuato	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
156	23.9	2020	Cubic Meter	\N	Statutory price	Industrial use	Ju�rez	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
157	48	2020	Cubic Meter	\N	Statutory price	Industrial use	La Paz	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
158	66.27	2020	Cubic Meter	\N	Statutory price	Industrial use	Le�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
159	50.53	2020	Cubic Meter	\N	Statutory price	Industrial use	Mexicali	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
160	46.91	2020	Cubic Meter	\N	Statutory price	Industrial use	Morelia	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
161	6.29	2020	Cubic Meter	\N	Statutory price	Industrial use	M�rida	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
162	44.41	2020	Cubic Meter	\N	Statutory price	Industrial use	Naucalpan	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
163	9.1	2020	Cubic Meter	\N	Statutory price	Industrial use	Oaxaca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
164	26.87	2020	Cubic Meter	\N	Statutory price	Industrial use	Puebla	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
165	60.76	2020	Cubic Meter	\N	Statutory price	Industrial use	Quer�taro	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
166	24.93	2020	Cubic Meter	\N	Statutory price	Industrial use	Reynosa (Ciudad Reynosa)	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
167	26.03	2020	Cubic Meter	\N	Statutory price	Industrial use	Saltillo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
168	26.06	2020	Cubic Meter	\N	Statutory price	Industrial use	San Juan del Rio	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
169	46.33	2020	Cubic Meter	\N	Statutory price	Industrial use	San Luis Potos�	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
170	41.93	2020	Cubic Meter	\N	Statutory price	Industrial use	Tepic	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
171	79.05	2020	Cubic Meter	\N	Statutory price	Industrial use	Tijuana	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
172	53.21	2020	Cubic Meter	\N	Statutory price	Industrial use	Tlalnepantla de Baz	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
173	27.23	2020	Cubic Meter	\N	Statutory price	Industrial use	Tlaquepaque	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
174	33.95	2020	Cubic Meter	\N	Statutory price	Industrial use	Toluca	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
175	37.23	2020	Cubic Meter	\N	Statutory price	Industrial use	Torre�n	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
176	15.73	2020	Cubic Meter	\N	Statutory price	Industrial use	Tila de Allende	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
177	37.72	2020	Cubic Meter	\N	Statutory price	Industrial use	Tultitl�n de Mariano Escobedo	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
178	30.87	2020	Cubic Meter	\N	Statutory price	Industrial use	Tuxtla Guti�rrez	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
179	19.78	2020	Cubic Meter	\N	Statutory price	Industrial use	Villahermosa	\N	http://sina.conagua.gob.mx/sina/tema.php?tema=tarifas&ver=reporte&o=1&n=nacional	MXN	\N	\N	\N	\N	\N	\N	\N	\N	MEX
180	1.6	2018	Cubic Meter	\N	Transactional price	Mining	\N	\N	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
181	0.8	2016	Cubic Meter	Annual	Transactional price	Mining	\N	\N	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
182	1.2	2016	Cubic Meter	Annual	Transactional price	Mining	\N	\N	https://www.camara.cl/verDoc.aspx?prmTIPO=DOCUMENTOCOMUNICACIONCUENTA&prmID=57905	USD	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
183	699.69	2018	Cubic Meter	\N	Transactional price	Non-Flourated Drinking Water	Vallenar	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
184	769.26	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Tierra Amarilla	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
185	598.41	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Inca de Oro	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
186	1228.15	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Copiap�	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
187	715.51	2018	Cubic Meter	\N	Transactional price	Non-Flourated Drinking Water	Vallenar	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
188	784.53	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Tierra Amarilla	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
189	613.65	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Inca de Oro	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
190	1226.13	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Copiap�	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
191	1083.94	2018	Cubic Meter	\N	Transactional price	Non-Flourated Drinking Water	Vallenar	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
192	1153.17	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Tierra Amarilla	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
193	982.33	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Inca de Oro	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
194	1617.16	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Copiap�	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
195	905.88	2018	Cubic Meter	\N	Transactional price	Non-Flourated Drinking Water	Huasco-Freirina	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
196	885.91	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Caldera	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
197	1187.86	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Cha�aral	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
198	911.58	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	D. Almagro-El Salado	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
199	1509.15	2018	Cubic Meter	\N	Transactional price	Non-Flourated Drinking Water	Huasco-Freirina	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
200	1377.2	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Caldera	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
201	1750.5	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	Cha�aral	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
202	1514.5	2018	Cubic Meter	\N	Transactional price	Flourated Drinking Water	D. Almagro-El Salado	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
203	655.23	2018	Cubic Meter	\N	Transactional price	Sewerage water treatment	Copiapo, T. Amarilla, Vallenar	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
204	967.91	2018	Cubic Meter	\N	Transactional price	Sewerage water treatment	Caldera, Chanaral	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
205	1251.83	2018	Cubic Meter	\N	Transactional price	Sewerage water treatment	D. Almargo-El Salado, Freirina, Huasco	\N	https://www.nuevaatacama.cl/recursos-ata/Tarifas/Tarifa%20ACA%2031%20de%20Julio%202018.pdf	CLP	\N	\N	\N	\N	Atacama	\N	\N	\N	CHL
206	5.08	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Alaska	\N	\N	\N	USA
207	2.26	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Alabama	\N	\N	\N	USA
208	1.29	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Arkansas	\N	\N	\N	USA
209	1.64	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Arkansas	\N	\N	\N	USA
210	2.19	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Arizona	\N	\N	\N	USA
211	3.85	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Arizona	\N	\N	\N	USA
212	3.37	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	California	\N	\N	\N	USA
213	3.73	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	California	\N	\N	\N	USA
214	4.51	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	California	\N	\N	\N	USA
215	5.85	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	California	\N	\N	\N	USA
216	5.94	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	California	\N	\N	\N	USA
217	2.71	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Colorado	\N	\N	\N	USA
218	5.6	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	District of Columbia	\N	\N	\N	USA
219	1.47	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
220	1.86	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
221	7.45	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
222	4.37	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
223	2.2	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
224	2.23	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Georgia	\N	\N	\N	USA
225	1.54	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Georgia	\N	\N	\N	USA
226	1.79	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Iowa	\N	\N	\N	USA
227	1.79	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Iowa	\N	\N	\N	USA
228	3.34	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Iowa	\N	\N	\N	USA
229	5.93	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Illinois	\N	\N	\N	USA
230	2.01	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Kansas	\N	\N	\N	USA
231	3.14	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Kansas	\N	\N	\N	USA
232	1.86	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Kentucky	\N	\N	\N	USA
233	2.53	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Kentucky	\N	\N	\N	USA
234	1.75	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Louisiana	\N	\N	\N	USA
235	1.01	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Minnesota	\N	\N	\N	USA
236	2.1	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	North Carolina	\N	\N	\N	USA
237	4.35	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	North Carolina	\N	\N	\N	USA
238	2.25	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	New Mexico	\N	\N	\N	USA
239	2.8	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Nevada	\N	\N	\N	USA
240	1.77	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	New York	\N	\N	\N	USA
241	1.65	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Oklahoma	\N	\N	\N	USA
242	5.27	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Oregon	\N	\N	\N	USA
243	3.89	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Pennsylvania	\N	\N	\N	USA
244	1.3	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	South Carolina	\N	\N	\N	USA
245	3.31	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Tennessee	\N	\N	\N	USA
246	7.38	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Tennessee	\N	\N	\N	USA
247	6.27	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
248	1.57	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
249	3.14	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
250	3.3	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
251	3.62	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
252	5.79	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
253	7.34	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
254	1.55	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Utah	\N	\N	\N	USA
255	2.25	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Virginia	\N	\N	\N	USA
256	4.88	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Virginia	\N	\N	\N	USA
257	6.89	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Washington	\N	\N	\N	USA
258	2.01	2016	kGal	\N	Transactional price	\N	\N	\N	https://www.energy.gov/sites/prod/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Wisconsin	\N	\N	\N	USA
259	5036	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	South Australia	\N	\N	\N	AUS
260	3636	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
261	527	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
262	4426	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
263	668	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
264	3362	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
265	473	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
266	2000	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
267	4334	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
268	4636	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
269	1560	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
270	1560	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
271	5340	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
272	2100	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
273	1661	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
274	2900	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
275	875	2018	ML	\N	Transactional price	\N	\N	\N	https://www.awe.gov.au/sites/default/files/sitecollectiondocuments/water/market-price/market-prices-sum-dec-2018.pdf	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
276	0.0181	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Pelop�nnisos	\N	\N	\N	GRC
277	0.014	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Pelop�nnisos	\N	\N	\N	GRC
278	0.0177	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Pelop�nnisos	\N	\N	\N	GRC
279	0.0196	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Dytik� Ell�da	\N	\N	\N	GRC
280	0.0221	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	�peiros	\N	\N	\N	GRC
281	0.0171	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Attik�	\N	\N	\N	GRC
282	0.0162	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Stere� Ell�da	\N	\N	\N	GRC
283	0.026	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	 Thessal�a	\N	\N	\N	GRC
284	0.0342	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Dytiki Makedonia	\N	\N	\N	GRC
285	0.011	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Kentrik� Makedon�a	\N	\N	\N	GRC
286	0.0148	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Anatolik� Makedon�a kai Thr�ki	\N	\N	\N	GRC
287	0.0211	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Thrace	\N	\N	\N	GRC
288	0.1	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Kr�ti	\N	\N	\N	GRC
289	0.0115	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	N�tio Aiga�o	\N	\N	\N	GRC
290	0.0115	2008	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	V�reio Aiga�o	\N	\N	\N	GRC
291	0.3088	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Pelop�nnisos	\N	\N	\N	GRC
292	0.2839	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Pelop�nnisos	\N	\N	\N	GRC
293	0.265	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Pelop�nnisos	\N	\N	\N	GRC
294	0.1861	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Dytik� Ell�da	\N	\N	\N	GRC
295	0.8852	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	�peiros	\N	\N	\N	GRC
296	0.7266	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Attik�	\N	\N	\N	GRC
297	0.184	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Stere� Ell�da	\N	\N	\N	GRC
298	0.1236	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	 Thessal�a	\N	\N	\N	GRC
299	0.2608	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Dytiki Makedonia	\N	\N	\N	GRC
300	0.4763	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Kentrik� Makedon�a	\N	\N	\N	GRC
301	0.218	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Anatolik� Makedon�a kai Thr�ki	\N	\N	\N	GRC
302	0.1512	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Thrace	\N	\N	\N	GRC
303	0.4183	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	Kr�ti	\N	\N	\N	GRC
304	13.334	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	N�tio Aiga�o	\N	\N	\N	GRC
305	13.334	2008	Cubic Meter	\N	Transactional price	All uses	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	V�reio Aiga�o	\N	\N	\N	GRC
306	0.015	2003	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ITA
307	0.04	2003	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ITA
308	0.1	2003	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ITA
309	0.08	2003	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ITA
310	0.1	2003	Cubic Meter	\N	Transactional price	Irrigation	\N	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ITA
311	1.95	2021	kL	\N	Statutory price	Residential	Adelaide	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	South Australia	\N	\N	\N	AUS
312	3.01	2021	kL	\N	Statutory price	Residential	Adelaide	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	South Australia	\N	\N	\N	AUS
313	3.12	2021	kL	\N	Statutory price	Residential	Brisbane	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Queensland	\N	\N	\N	AUS
314	2.46	2021	kL	\N	Statutory price	Residential	Canberra	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Australian Capital Territory	\N	\N	\N	AUS
315	4.94	2021	kL	\N	Statutory price	Residential	Canberra	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Australian Capital Territory	\N	\N	\N	AUS
316	1.96	2021	kL	\N	Statutory price	Residential	Darwin	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Northern Territory	\N	\N	\N	AUS
317	1.06	2021	kL	\N	Statutory price	Residential	Hobart	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Tasmania	\N	\N	\N	AUS
318	2.63	2021	kL	\N	Statutory price	Residential	Melbourne	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
319	3.35	2021	kL	\N	Statutory price	Residential	Melbourne	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Victoria	\N	\N	\N	AUS
320	2.35	2021	kL	\N	Statutory price	Residential	Sydney	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
321	1.82	2021	kL	\N	Statutory price	Residential	Perth	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Western Australia	\N	\N	\N	AUS
322	4.55	2021	kL	\N	Statutory price	Residential	Perth	\N	https://www.teampoly.com.au/2018/06/15/water-prices-in-australia/	AUD	\N	\N	\N	\N	Western Australia	\N	\N	\N	AUS
323	1.966	2021	kL	\N	Statutory price	Residential	\N	\N	https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	AUD	\N	\N	\N	\N	South Australia	\N	\N	\N	AUS
324	2.806	2021	kL	\N	Statutory price	Residential	\N	\N	https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	AUD	\N	\N	\N	\N	South Australia	\N	\N	\N	AUS
325	3.04	2021	kL	\N	Statutory price	Residential	\N	\N	https://www.sawater.com.au/my-account/water-and-sewerage-prices/water-prices/residential-water-prices	AUD	\N	\N	\N	\N	South Australia	\N	\N	\N	AUS
326	4.88	2019	Cubic Meter	\N	Statutory price	Residential	\N	\N	https://www.sciencedirect.com/science/article/pii/S2212428421000062	AUD	\N	\N	\N	\N	Australian Capital Territory	\N	\N	\N	AUS
327	8.5	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
328	10.03	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
329	10.35	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
330	10.68	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
331	11	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
332	11.33	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
333	12.5	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
334	12.82	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
335	13.15	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
336	13.47	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
337	13.8	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
338	14.45	2017	Cubic Meter	Monthly	Transactional price	Residential	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
339	9.5	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
340	10.7	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
341	10.95	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
342	13.21	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
343	13.54	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
344	13.86	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
345	14.19	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
346	14.51	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
379	0.94	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
347	14.84	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
348	15.16	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
349	15.49	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
350	15.81	2017	Cubic Meter	Monthly	Transactional price	Commerce, Government Agency, State Enterprise and Industry	Bangkok	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264307674-en.pdf?expires=1638226727&id=id&accname=ocid194914a&checksum=8B1820F1D77E27B06C162822B34E7EC2	THB	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
351	0.49	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
352	0.77	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
353	1.23	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
354	1.4	2006	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	GRC
355	1.45	2008	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
356	1.58	2004	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
357	1.85	2003	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
358	1.92	2006	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
359	1.98	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	NZL
360	2.02	2005	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
361	2.12	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
362	2.43	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	CZE
363	2.44	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
364	3.13	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
365	3.59	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
366	3.74	2004	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
367	3.82	2006	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
368	3.92	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
369	4.14	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
370	4.41	2008	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
371	5.72	2007	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
372	6.7	2006	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
373	0.53	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
374	0.63	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	NZL
375	0.66	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
376	0.66	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
377	0.85	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
378	0.87	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
380	0.98	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	GRC
381	1.06	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	LUX
382	1.09	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
383	1.17	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUT
384	1.2	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
385	1.22	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
386	1.45	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
387	1.48	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
388	1.52	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
389	1.6	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
390	1.75	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	CZE
391	1.85	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	NDL
392	2.06	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	DEU
393	2.09	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
394	4.31	2009	Cubic Meter	\N	Transactional price	Water supply and sanitation to households	\N	\N	https://www.oecd.org/env/resources/water-therightpricecanencourageefficiencyandinvestment.htm	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
395	4.59	2015	Cubic Meter	\N	Transactional price	Total annual charge	Graz	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUT
396	5	2015	Cubic Meter	\N	Transactional price	Total annual charge	Innsbruck	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUT
397	3.18	2015	Cubic Meter	\N	Transactional price	Total annual charge	Linz	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUT
398	6.15	2015	Cubic Meter	\N	Transactional price	Total annual charge	Salzburg	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUT
399	5.2	2015	Cubic Meter	\N	Transactional price	Total annual charge	Vienna	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUT
400	5.52	2015	Cubic Meter	\N	Transactional price	Total annual charge	Louvain	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
401	4.29	2015	Cubic Meter	\N	Transactional price	Total annual charge	Antwerp	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
402	4.95	2015	Cubic Meter	\N	Transactional price	Total annual charge	Brussels	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
403	6.24	2015	Cubic Meter	\N	Transactional price	Total annual charge	Li�ge	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
404	5.62	2015	Cubic Meter	\N	Transactional price	Total annual charge	Kortrijk	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
405	5.11	2015	Cubic Meter	\N	Transactional price	Total annual charge	Genk	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
406	5.95	2015	Cubic Meter	\N	Transactional price	Total annual charge	Charleroi	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
407	3.98	2015	Cubic Meter	\N	Transactional price	Total annual charge	Calgary	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
408	3.76	2015	Cubic Meter	\N	Transactional price	Total annual charge	Winnipeg	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
409	4.52	2015	Cubic Meter	\N	Transactional price	Total annual charge	Regina	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
410	5.04	2015	Cubic Meter	\N	Transactional price	Total annual charge	Richmond	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
411	3.27	2015	Cubic Meter	\N	Transactional price	Total annual charge	Durham	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
412	9.48	2015	Cubic Meter	\N	Transactional price	Total annual charge	Aalborg	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
413	9.8	2015	Cubic Meter	\N	Transactional price	Total annual charge	Aarhus	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
414	7.63	2015	Cubic Meter	\N	Transactional price	Total annual charge	Copenhagen	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
415	8.52	2015	Cubic Meter	\N	Transactional price	Total annual charge	Esbjerg	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
416	9.37	2015	Cubic Meter	\N	Transactional price	Total annual charge	Odense	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
417	4.63	2015	Cubic Meter	\N	Transactional price	Total annual charge	Espoo	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
418	4.63	2015	Cubic Meter	\N	Transactional price	Total annual charge	Helsinki	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
419	5.21	2015	Cubic Meter	\N	Transactional price	Total annual charge	Oulu	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
420	5.3	2015	Cubic Meter	\N	Transactional price	Total annual charge	Tampere	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
421	6.39	2015	Cubic Meter	\N	Transactional price	Total annual charge	Turku	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
422	4.63	2015	Cubic Meter	\N	Transactional price	Total annual charge	Vantaa	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
423	4.43	2015	Cubic Meter	\N	Transactional price	Total annual charge	Bordeaux	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
424	5.03	2015	Cubic Meter	\N	Transactional price	Total annual charge	Lille	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
425	4.04	2015	Cubic Meter	\N	Transactional price	Total annual charge	Lyon	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
426	4.16	2015	Cubic Meter	\N	Transactional price	Total annual charge	Paris	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
427	4.19	2015	Cubic Meter	\N	Transactional price	Total annual charge	Strasbourg	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
428	4.32	2015	Cubic Meter	\N	Transactional price	Total annual charge	Reims	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
429	4.15	2015	Cubic Meter	\N	Transactional price	Total annual charge	Nancy	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
430	5.83	2015	Cubic Meter	\N	Transactional price	Total annual charge	Le Havre	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
431	4.75	2015	Cubic Meter	\N	Transactional price	Total annual charge	Marseille	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
432	6.15	2015	Cubic Meter	\N	Transactional price	Total annual charge	Brest	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
433	3.21	2015	Cubic Meter	\N	Transactional price	Total annual charge	Budapest	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
434	2.43	2015	Cubic Meter	\N	Transactional price	Total annual charge	Debrecen	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
435	2.59	2015	Cubic Meter	\N	Transactional price	Total annual charge	Miskolc	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
436	3.48	2015	Cubic Meter	\N	Transactional price	Total annual charge	P�cs	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
437	2.05	2015	Cubic Meter	\N	Transactional price	Total annual charge	Kaposv�r	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
438	2.76	2015	Cubic Meter	\N	Transactional price	Total annual charge	Jerusalem	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ISR
439	2.4	2015	Cubic Meter	\N	Transactional price	Total annual charge	Bologna	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
440	0.83	2015	Cubic Meter	\N	Transactional price	Total annual charge	Milan	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
441	1.78	2015	Cubic Meter	\N	Transactional price	Total annual charge	Naples	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
442	1.78	2015	Cubic Meter	\N	Transactional price	Total annual charge	Rome	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
443	2.25	2015	Cubic Meter	\N	Transactional price	Total annual charge	Turin	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
444	0.53	2015	Cubic Meter	\N	Transactional price	Total annual charge	Seoul	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
445	0.65	2015	Cubic Meter	\N	Transactional price	Total annual charge	Busan	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
446	0.55	2015	Cubic Meter	\N	Transactional price	Total annual charge	Daegu	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
447	0.61	2015	Cubic Meter	\N	Transactional price	Total annual charge	Incheon	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
448	0.5	2015	Cubic Meter	\N	Transactional price	Total annual charge	Gwangju	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
449	0.49	2015	Cubic Meter	\N	Transactional price	Total annual charge	Daejeon	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
450	0.83	2015	Cubic Meter	\N	Transactional price	Total annual charge	Ulsan	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
451	0.59	2015	Cubic Meter	\N	Transactional price	Total annual charge	Gyeounggi	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
452	1.67	2015	Cubic Meter	\N	Transactional price	Total annual charge	Nagoya	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
453	1.53	2015	Cubic Meter	\N	Transactional price	Total annual charge	Osaka	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
454	1.9	2015	Cubic Meter	\N	Transactional price	Total annual charge	Hiroshima	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
455	2.24	2015	Cubic Meter	\N	Transactional price	Total annual charge	Fukuoka	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
456	2.27	2015	Cubic Meter	\N	Transactional price	Total annual charge	Sapporo	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
457	2.79	2015	Cubic Meter	\N	Transactional price	Total annual charge	Sendai	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
458	2.18	2015	Cubic Meter	\N	Transactional price	Total annual charge	Tokyo	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
459	2.02	2015	Cubic Meter	\N	Transactional price	Total annual charge	Yokohama	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
460	4.25	2015	Cubic Meter	\N	Transactional price	Total annual charge	San Luis Potosi	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
461	0.87	2015	Cubic Meter	\N	Transactional price	Total annual charge	Guadalajara	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
462	4.87	2015	Cubic Meter	\N	Transactional price	Total annual charge	Le�n, Guanajuato	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
463	4.72	2015	Cubic Meter	\N	Transactional price	Total annual charge	Monterrey	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
464	8.62	2015	Cubic Meter	\N	Transactional price	Total annual charge	Puebla	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
465	4.53	2015	Cubic Meter	\N	Transactional price	Total annual charge	Amsterdam	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
466	4.71	2015	Cubic Meter	\N	Transactional price	Total annual charge	Rotterdam	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
467	5	2015	Cubic Meter	\N	Transactional price	Total annual charge	Den Haag	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
468	4.28	2015	Cubic Meter	\N	Transactional price	Total annual charge	Utrecht	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
469	3.35	2015	Cubic Meter	\N	Transactional price	Total annual charge	Eindhoven	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
470	4.16	2015	Cubic Meter	\N	Transactional price	Total annual charge	Maastricht	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
471	4.03	2015	Cubic Meter	\N	Transactional price	Total annual charge	Bergen	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NOR
472	4.32	2015	Cubic Meter	\N	Transactional price	Total annual charge	Oslo	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NOR
473	5	2015	Cubic Meter	\N	Transactional price	Total annual charge	Trondheim	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	NOR
474	3.64	2015	Cubic Meter	\N	Transactional price	Total annual charge	Bydgoszcz	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
475	2.77	2015	Cubic Meter	\N	Transactional price	Total annual charge	Wroclaw	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
476	2.75	2015	Cubic Meter	\N	Transactional price	Total annual charge	Radom	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
477	2.86	2015	Cubic Meter	\N	Transactional price	Total annual charge	Tarnow	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
478	2.57	2015	Cubic Meter	\N	Transactional price	Total annual charge	Lisbon	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
479	2.39	2015	Cubic Meter	\N	Transactional price	Total annual charge	Porto	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
480	2.38	2015	Cubic Meter	\N	Transactional price	Total annual charge	Braga	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
481	2.69	2015	Cubic Meter	\N	Transactional price	Total annual charge	Coimbra	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
482	2.32	2015	Cubic Meter	\N	Transactional price	Total annual charge	Faro	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
483	3.4	2015	Cubic Meter	\N	Transactional price	Total annual charge	Barcelona	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
484	2.16	2015	Cubic Meter	\N	Transactional price	Total annual charge	Bilbao	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
485	2.17	2015	Cubic Meter	\N	Transactional price	Total annual charge	Madrid	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
486	2.99	2015	Cubic Meter	\N	Transactional price	Total annual charge	Sevilla	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
487	2.69	2015	Cubic Meter	\N	Transactional price	Total annual charge	Valencia	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
488	2.52	2015	Cubic Meter	\N	Transactional price	Total annual charge	Stockholm	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
489	4.59	2015	Cubic Meter	\N	Transactional price	Total annual charge	G�teborg	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
490	3.22	2015	Cubic Meter	\N	Transactional price	Total annual charge	Malm�	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
491	4.55	2015	Cubic Meter	\N	Transactional price	Total annual charge	Uppsala	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
492	4.64	2015	Cubic Meter	\N	Transactional price	Total annual charge	Link�ping	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
493	4.52	2015	Cubic Meter	\N	Transactional price	Total annual charge	Geneva	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
494	4.65	2015	Cubic Meter	\N	Transactional price	Total annual charge	Z�rich	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
495	4.36	2015	Cubic Meter	\N	Transactional price	Total annual charge	Lausanne	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
496	4.57	2015	Cubic Meter	\N	Transactional price	Total annual charge	Basel	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
497	6.22	2015	Cubic Meter	\N	Transactional price	Total annual charge	Bern	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
498	5.02	2015	Cubic Meter	\N	Transactional price	Total annual charge	Birmingham	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
499	5.85	2015	Cubic Meter	\N	Transactional price	Total annual charge	Cardiff	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
500	3.98	2015	Cubic Meter	\N	Transactional price	Total annual charge	London	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
501	5.77	2015	Cubic Meter	\N	Transactional price	Total annual charge	Manchester	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
502	5.18	2015	Cubic Meter	\N	Transactional price	Total annual charge	Leeds	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
503	3.94	2015	Cubic Meter	\N	Transactional price	Total annual charge	New York	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
504	4.18	2015	Cubic Meter	\N	Transactional price	Total annual charge	Washington D.C.	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
505	2.72	2015	Cubic Meter	\N	Transactional price	Total annual charge	Los Angeles	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
506	1.46	2015	Cubic Meter	\N	Transactional price	Total annual charge	Chicago	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
507	2.64	2015	Cubic Meter	\N	Transactional price	Total annual charge	Denver	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
508	1.01	2015	Cubic Meter	\N	Transactional price	Total annual charge	Miami	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264235199-en.pdf?expires=1638228547&id=id&accname=ocid194914a&checksum=C8D69F8C193F1A831CA8874A4C370E71	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
509	0.095	2007	Cubic Meter	\N	Transactional price	Irrigation	Duero 	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
510	0.15	2007	Cubic Meter	\N	Transactional price	Irrigation	Ebro	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
511	0.15	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadalquivir	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
512	0.048	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadiana	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
513	0.074	2007	Cubic Meter	\N	Transactional price	Irrigation	Jucar	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
612	1.532303389	2021	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
514	0.163	2007	Cubic Meter	\N	Transactional price	Irrigation	Segura	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
515	0.1	2007	Cubic Meter	\N	Transactional price	Irrigation	Tagus	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
516	0.012	2007	Cubic Meter	\N	Transactional price	Irrigation	Duero 	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
517	0.011	2007	Cubic Meter	\N	Transactional price	Irrigation	Ebro	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
518	0.035	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadalquivir	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
519	0.025	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadiana	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
520	0.02	2007	Cubic Meter	\N	Transactional price	Irrigation	Jucar	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
521	0.038	2007	Cubic Meter	\N	Transactional price	Irrigation	Segura	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
522	0.02	2007	Cubic Meter	\N	Transactional price	Irrigation	Tagus	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264083578-en.pdf?expires=1638229625&id=id&accname=ocid194914a&checksum=5393117626D8C7E0D93EE297534C480E	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
523	0.28	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHN
524	0.5	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
525	0.53	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
526	0.6	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
527	0.7	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	NZL
528	0.8	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
529	0.9	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
530	0.9	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
531	1	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	GRC
532	1	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUT
533	1.1	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
534	1.2	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
535	1.2	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
536	1.2	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
537	1.3	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CZE
538	1.7	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
539	1.8	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
540	1.9	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
541	2.3	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
542	2.5	2013	Cubic Meter	\N	Transactional price	Household 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/economics/oecd-economic-surveys-china-2013/international-household-water-prices_eco_surveys-chn-2013-graph53-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	DEU
543	0.00414	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
544	0.0047	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
545	0.00506	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
546	0.00482	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
547	0.00607	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
548	0.00549	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
549	0.00531	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
550	0.00488	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
551	0.00517	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
552	0.00538	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
553	0.00419	2019	Cubic Meter	\N	Statutory price	agricultural production 	\N	\N	https://www-oecd--ilibrary-org.eu1.proxy.openathens.net/docserver/9789264269125-en.pdf?expires=1638232293&id=id&accname=ocid194914a&checksum=E2C4944A845EC78A3A49DCFBF70F6166	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
554	7.02	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Alaska	\N	\N	\N	USA
555	7.04	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Alabama	\N	\N	\N	USA
556	1.53	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Arkansas	\N	\N	\N	USA
557	2.7	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Arizona	\N	\N	\N	USA
558	5.29	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	California	\N	\N	\N	USA
559	1.46	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	California	\N	\N	\N	USA
560	4.77	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
561	6.39	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
562	7.58	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
563	3.57	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
564	3.79	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Florida	\N	\N	\N	USA
565	4.79	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Georgia	\N	\N	\N	USA
566	2.47	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Illinois	\N	\N	\N	USA
567	5.61	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Kansas	\N	\N	\N	USA
568	3.33	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Kansas	\N	\N	\N	USA
569	5.66	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Louisiana	\N	\N	\N	USA
570	3.75	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	North Carolina	\N	\N	\N	USA
571	2.24	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	New Mexico	\N	\N	\N	USA
572	3.75	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Pennsylvania	\N	\N	\N	USA
573	1.99	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	South Carolina	\N	\N	\N	USA
613	1.517471229	2020	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
574	9.8	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Tennessee	\N	\N	\N	USA
575	5.92	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Tennessee	\N	\N	\N	USA
576	9.26	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
577	2.12	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
578	6.92	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
579	3.15	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
580	1.99	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
581	3.52	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Texas	\N	\N	\N	USA
582	4.28	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Utah	\N	\N	\N	USA
583	2.7	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Virginia	\N	\N	\N	USA
584	17.29	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Washington	\N	\N	\N	USA
585	3.96	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Wisconsin	\N	\N	\N	USA
586	2.66	2016	kGal	\N	Transactional price	Wastewater charge	\N	\N	https://www.energy.gov/sites/default/files/2017/10/f38/water_wastewater_escalation_rate_study.pdf	USD	\N	\N	\N	\N	Wisconsin	\N	\N	\N	USA
587	0.00093	2017	Cubic Meter	\N	Statutory price	Domestic	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
588	5e-05	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
589	2e-05	2017	Cubic Meter	\N	Statutory price	Population	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
590	3e-05	2017	Cubic Meter	\N	Statutory price	Irrigation	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
591	1e-05	2017	Cubic Meter	\N	Statutory price	Other	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
592	0.00129	2017	Cubic Meter	\N	Statutory price	Domestic	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
593	0.00035	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
594	2e-05	2017	Cubic Meter	\N	Statutory price	Population	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
595	0.00023	2017	Cubic Meter	\N	Statutory price	Irrigation	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
596	0.00058	2017	Cubic Meter	\N	Statutory price	Other	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
597	0.00263	2017	Cubic Meter	\N	Statutory price	Domestic	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
598	0.00475	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
599	0.00475	2017	Cubic Meter	\N	Statutory price	Commercial	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
600	0.00342	2017	Cubic Meter	\N	Statutory price	Agribusiness	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
601	0.00475	2017	Cubic Meter	\N	Statutory price	Tourism	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
602	0.00232	2017	Cubic Meter	\N	Statutory price	Agriculture	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
603	0.00022	2017	Cubic Meter	\N	Statutory price	Aquaculture	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
604	0.00022	2017	Cubic Meter	\N	Statutory price	Hydropower	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
605	0.00293	2017	Cubic Meter	\N	Statutory price	Domestic	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
606	0.00585	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
607	0.00585	2017	Cubic Meter	\N	Statutory price	Commercial	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
608	0.00445	2017	Cubic Meter	\N	Statutory price	Agribusiness	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
609	0.00585	2017	Cubic Meter	\N	Statutory price	Tourism	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
610	0.00252	2017	Cubic Meter	\N	Statutory price	Agriculture	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
611	0.00029	2017	Cubic Meter	\N	Statutory price	Aquaculture	\N	\N	https://www.oecd-ilibrary.org/agriculture-and-food/agricultural-policies-in-costa-rica_9789264269125-en	USD	\N	\N	\N	\N	\N	\N	\N	\N	CRI
614	1.383275495	2019	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
615	1.222593762	2021	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
616	1.210586775	2020	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
617	1.103583335	2019	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://vancouver.ca/home-property-development/metered-rates.aspx	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
618	0.75	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Prince Edward Island	\N	\N	\N	CAN
619	1.56	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Nova Scotia	\N	\N	\N	CAN
620	1.79	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	New Brunswick	\N	\N	\N	CAN
621	0.85	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Quebec	\N	\N	\N	CAN
622	1.96	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Ontario	\N	\N	\N	CAN
623	3.07	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Manitoba	\N	\N	\N	CAN
624	1.78	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Saskatchewan	\N	\N	\N	CAN
625	1.78	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Alberta	\N	\N	\N	CAN
626	1.27	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
627	1.48	2021	Cubic Meter	\N	Transactional price	Potable water	\N	\N	https://link.springer.com/chapter/10.1007/978-3-319-42806-2_11	CAD	\N	\N	\N	\N	Northwest Territories	\N	\N	\N	CAN
628	0.87	2021	Cubic Meter	\N	Transactional price	\N	Comox Valley	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
629	1.05	2021	Cubic Meter	\N	Transactional price	\N	Comox Valley	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
630	1.07	2021	Cubic Meter	\N	Transactional price	\N	Comox Valley	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
631	1.44	2021	Cubic Meter	\N	Transactional price	\N	Black Creek/Oyster Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
632	2.16	2021	Cubic Meter	\N	Transactional price	\N	Black Creek/Oyster Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
633	1.87	2021	Cubic Meter	\N	Transactional price	\N	Black Creek/Oyster Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
634	0.9	2021	Cubic Meter	\N	Transactional price	\N	Royston	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
635	1.12	2021	Cubic Meter	\N	Transactional price	\N	Royston	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
636	1.35	2021	Cubic Meter	\N	Transactional price	\N	Royston	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
637	1.4	2021	Cubic Meter	\N	Transactional price	\N	Union Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
638	1.9	2021	Cubic Meter	\N	Transactional price	\N	Union Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
639	2.5	2021	Cubic Meter	\N	Transactional price	\N	Union Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
640	3.75	2021	Cubic Meter	\N	Transactional price	\N	Union Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
641	1.6	2021	Cubic Meter	\N	Transactional price	\N	Union Bay	\N	https://www.comoxvalleyrd.ca/services/water/water-metering-rates	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
642	4.0735	2021	Cubic Meter	\N	Transactional price	All consumption	Toronto	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CAD	\N	\N	\N	\N	Ontario	\N	\N	\N	CAN
643	4.2878	2021	Cubic Meter	\N	Transactional price	All consumption	Toronto	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CAD	\N	\N	\N	\N	Ontario	\N	\N	\N	CAN
644	2.8514	2021	Cubic Meter	\N	Transactional price	All consumption	Toronto	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CAD	\N	\N	\N	\N	Ontario	\N	\N	\N	CAN
645	3.0014	2021	Cubic Meter	\N	Transactional price	All consumption	Toronto	\N	https://www.toronto.ca/services-payments/property-taxes-utilities/utility-bill/water-rates-and-fees-copy/2020-water-rates-fees/	CAD	\N	\N	\N	\N	Ontario	\N	\N	\N	CAN
646	0.14	2014	Cubic Meter	\N	Transactional price	Utilities	Chengdu	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Sichuan Sheng	\N	\N	\N	CHN
647	0.22	2014	Cubic Meter	\N	Transactional price	Utilities	Colombo	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Colombo	\N	\N	\N	LKA
648	0.07	2014	Cubic Meter	\N	Transactional price	Utilities	Delhi	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Delhi	\N	\N	\N	IND
649	0.06	2014	Cubic Meter	\N	Transactional price	Utilities	Dhaka	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Dhaka	\N	\N	\N	BGD
650	0.18	2014	Cubic Meter	\N	Transactional price	Utilities	Ho Chi Minh	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	H? Ch� Minh	\N	\N	\N	VNM
651	0.35	2014	Cubic Meter	\N	Transactional price	Utilities	Hong Kong	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Hong Kong SAR	\N	\N	\N	HKG
652	0.29	2014	Cubic Meter	\N	Transactional price	Utilities	Jakarta	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Jakarta Raya	\N	\N	\N	IDN
653	0.07	2014	Cubic Meter	\N	Transactional price	Utilities	Karachi	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Sindh	\N	\N	\N	PAK
654	0.09	2014	Cubic Meter	\N	Transactional price	Utilities	Kathmandu	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Bagmati	\N	\N	\N	NPL
655	0.3	2014	Cubic Meter	\N	Transactional price	Utilities	Kuala Lumpur	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Wilayah Persekutuan Kuala Lumpur	\N	\N	\N	MYS
656	0.14	2014	Cubic Meter	\N	Transactional price	Utilities	Manila	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Rizal	\N	\N	\N	PHL
657	1.37	2014	Cubic Meter	\N	Transactional price	Utilities	Osaka	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	�saka [Osaka]	\N	\N	\N	JPN
658	0.24	2014	Cubic Meter	\N	Transactional price	Utilities	Phnom Penh	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Phnom Penh [Phnum P�nh]	\N	\N	\N	KHM
659	0.49	2014	Cubic Meter	\N	Transactional price	Utilities	Seoul	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Seoul-teukbyeolsi [Seoul]	\N	\N	\N	KOR
660	0.1	2014	Cubic Meter	\N	Transactional price	Utilities	Shanghai	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Shanghai Shi	\N	\N	\N	CHN
661	0.01	2014	Cubic Meter	\N	Transactional price	Utilities	Tashkent	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Toshkent	\N	\N	\N	UZB
662	0.19	2014	Cubic Meter	\N	Transactional price	Utilities	Ulaanbaatar	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Ulaanbaatar	\N	\N	\N	MNG
663	0.04	2014	Cubic Meter	\N	Transactional price	Utilities	Vientiane	\N	https://www.adb.org/sites/default/files/publication/28452/water-asian-cities.pdf	USD	\N	\N	\N	\N	Vientiane	\N	\N	\N	LAO
664	0.24	2011	Cubic Meter	\N	Transactional price	Utilities	Phnom Penh	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Phnom Penh [Phnum P�nh]	\N	\N	\N	KHM
665	0.75	2011	Cubic Meter	\N	Transactional price	Utilities	Jakarta East	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Jakarta Raya	\N	\N	\N	IDN
666	0.88	2011	Cubic Meter	\N	Transactional price	Utilities	Jakarta West	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Jakarta Raya	\N	\N	\N	IDN
667	0.25	2011	Cubic Meter	\N	Transactional price	Utilities	Medan	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Sumatera Utara	\N	\N	\N	IDN
668	0.4	2011	Cubic Meter	\N	Transactional price	Utilities	Palembang	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Sumatera Selatan	\N	\N	\N	IDN
669	0.23	2011	Cubic Meter	\N	Transactional price	Utilities	Vientiane	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Vientiane	\N	\N	\N	LAO
670	0.62	2011	Cubic Meter	\N	Transactional price	Utilities	Manila East	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Rizal	\N	\N	\N	PHL
671	0.77	2011	Cubic Meter	\N	Transactional price	Utilities	Manila West	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Rizal	\N	\N	\N	PHL
672	0.6	2011	Cubic Meter	\N	Transactional price	Utilities	Cebu	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Cebu	\N	\N	\N	PHL
673	0.36	2011	Cubic Meter	\N	Transactional price	Utilities	Davao	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Davao del Sur	\N	\N	\N	PHL
674	0.39	2011	Cubic Meter	\N	Transactional price	Utilities	Bangkok	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	Krung Thep Maha Nakhon [Bangkok]	\N	\N	\N	THA
675	0.32	2011	Cubic Meter	\N	Transactional price	Utilities	Binh Duong	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	B�nh Duong	\N	\N	\N	VNM
676	0.29	2011	Cubic Meter	\N	Transactional price	Utilities	Hai Phong	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	H?i Duong	\N	\N	\N	VNM
677	0.35	2011	Cubic Meter	\N	Transactional price	Utilities	Ho Chi Minh	\N	https://www.pseau.org/outils/ouvrages/adb_urban_water_supply_and_sanitation_in_southeast_asia_a_guide_to_good_practice_2014.pdf	USD	\N	\N	\N	\N	H? Ch� Minh	\N	\N	\N	VNM
678	0.78	2019	Cubic Meter	\N	Transactional price	Utilities	Kigali	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Ville de Kigali	\N	\N	\N	RWA
679	0.61	2019	Cubic Meter	\N	Transactional price	Utilities	Lome	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Maritime (R�gion)	\N	\N	\N	TGO
680	2.14	2019	Cubic Meter	\N	Transactional price	Utilities	Durban	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
681	4.79	2019	Cubic Meter	\N	Transactional price	Utilities	Mbabane	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Hhohho	\N	\N	\N	SWZ
682	2.06	2019	Cubic Meter	\N	Transactional price	Utilities	Pretoria	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Gauteng	\N	\N	\N	ZAF
683	3.14	2019	Cubic Meter	\N	Transactional price	Utilities	Windhoek	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Khomas	\N	\N	\N	NAM
684	2.18	2019	Cubic Meter	\N	Transactional price	Utilities	Johannesburg	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Gauteng	\N	\N	\N	ZAF
685	1.64	2019	Cubic Meter	\N	Transactional price	Utilities	Victoria	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Bel Air              	\N	\N	\N	SYC
686	1.06	2019	Cubic Meter	\N	Transactional price	Utilities	Accra	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Greater Accra	\N	\N	\N	GHA
687	0.68	2019	Cubic Meter	\N	Transactional price	Utilities	Dakar	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Dakar	\N	\N	\N	SEN
729	0.644	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	La Rioja	\N	\N	\N	ESP
688	0.7	2019	Cubic Meter	\N	Transactional price	Utilities	Lilongwe	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Lilongwe	\N	\N	\N	MWI
689	0.61	2019	Cubic Meter	\N	Transactional price	Utilities	Cape Town	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Western Cape	\N	\N	\N	ZAF
690	0.78	2019	Cubic Meter	\N	Transactional price	Utilities	Harare	\N	https://siwi.org/wp-content/uploads/2020/03/AEWPP_-Water-Tariffing-2020_WEBB.pdf	USD	\N	\N	\N	\N	Harare	\N	\N	\N	ZWE
691	27.83	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
692	39.65	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
693	20.52	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
694	32.96	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
695	32.96	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
696	39.65	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
697	28	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
698	43.83	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
699	43.83	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
700	39.65	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
701	61.74	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
702	67.65	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
703	67.65	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
704	39.65	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
705	67.91	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
706	74.35	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
707	74.35	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
708	39.65	2021	kL	\N	Transactional price	Utilities	Durban	\N	http://www.durban.gov.za/City_Services/water_sanitation/Bylaws_Tariffs/Tariffs/Pages/Water_Tariffs_English.aspx	ZAR	\N	\N	\N	\N	Kwazulu-Natal	\N	\N	\N	ZAF
709	0.493	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Ourense  [Orense]	\N	\N	\N	\N
710	0.418	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Nuevo Le�n	\N	\N	\N	ESP
711	0.381	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Palencia	\N	\N	\N	ESP
712	0.494	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Burgos	\N	\N	\N	ESP
713	0.613	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Salamanca	\N	\N	\N	ESP
714	0.409	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	�vila	\N	\N	\N	ESP
715	0.598	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Segovia	\N	\N	\N	ESP
716	0.613	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Guadalajara	\N	\N	\N	ESP
717	0.591	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	A Coru�a  [La Coru�a]	\N	\N	\N	ESP
718	0.553	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Lugo  [Lugo]	\N	\N	\N	ESP
719	0.702	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Cantabria	\N	\N	\N	ESP
720	0.64	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Nueva Vizcaya	\N	\N	\N	ESP
721	0.589	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Gipuzkoa	\N	\N	\N	ESP
722	0.46	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Navarra / Nafarroa	\N	\N	\N	ESP
723	0.626	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Huesca	\N	\N	\N	ESP
724	0.604	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Lleida  [L�rida]	\N	\N	\N	ESP
725	0.76	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Girona  [Gerona]	\N	\N	\N	ESP
726	0.632	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Zamora	\N	\N	\N	ESP
727	0.52	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Valladolid	\N	\N	\N	ESP
728	0.553	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	�lava / Araba	\N	\N	\N	ESP
730	0.404	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Soria	\N	\N	\N	ESP
731	0.567	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Zaragoza	\N	\N	\N	ESP
732	0.842	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Madrid	\N	\N	\N	ESP
733	0.637	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Teruel	\N	\N	\N	ESP
734	0.446	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Castell�n / Castell�	\N	\N	\N	ESP
735	0.68	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Toledo	\N	\N	\N	ESP
736	0.586	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Cuenca	\N	\N	\N	ESP
737	0.828	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Ciudad Real	\N	\N	\N	ESP
738	0.981	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Albacete	\N	\N	\N	ESP
739	0.717	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Ja�n	\N	\N	\N	ESP
740	0.699	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	C�diz	\N	\N	\N	ESP
741	0.703	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	M�laga	\N	\N	\N	ESP
742	0.62	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Asturias	\N	\N	\N	ESP
743	1.079	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Tarragona  [Tarragona]	\N	\N	\N	ESP
744	1.166	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	C�ceres	\N	\N	\N	ESP
745	0.83	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Valencia / Val�ncia	\N	\N	\N	ESP
746	0.756	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Badajoz	\N	\N	\N	ESP
747	1.22	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Alicante / Alacant	\N	\N	\N	ESP
748	0.864	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Huelva	\N	\N	\N	ESP
749	1.063	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Sevilla	\N	\N	\N	ESP
750	1.023	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	C�rdoba	\N	\N	\N	ESP
751	0.815	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Granada	\N	\N	\N	ESP
752	0.982	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Almer�a	\N	\N	\N	ESP
753	1.513	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Murcia	\N	\N	\N	ESP
754	1.382	2015	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.mdpi.com/2073-4441/7/4/1456	EUR	\N	\N	\N	\N	Barcelona  [Barcelona]	\N	\N	\N	ESP
755	0.93	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Maputo	\N	\N	\N	MOZ
756	0.71	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Gaza	\N	\N	\N	MOZ
757	0.72	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Gaza	\N	\N	\N	MOZ
758	0.76	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Inhambane	\N	\N	\N	MOZ
759	0.83	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Inhambane	\N	\N	\N	MOZ
760	0.85	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Sofala	\N	\N	\N	MOZ
761	0.69	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Manica	\N	\N	\N	MOZ
762	0.69	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Tete	\N	\N	\N	MOZ
763	0.83	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Zamb�zia	\N	\N	\N	MOZ
764	0.83	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Nampula	\N	\N	\N	MOZ
765	0.69	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Nampula	\N	\N	\N	MOZ
766	0.69	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Nampula	\N	\N	\N	MOZ
767	0.69	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Niassa	\N	\N	\N	MOZ
768	0.69	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Niassa	\N	\N	\N	MOZ
769	0.85	2012	Cubic Meter	\N	Transactional price	Utilities	\N	\N	https://www.tandfonline.com/doi/pdf/10.1080/07900627.2014.907734?needAccess=true	USD	\N	\N	\N	\N	Cabo Delgado	\N	\N	\N	MOZ
770	3.1	2013	Cubic Meter	\N	Transactional price	Drinking water	Graz	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
771	2	2013	Cubic Meter	\N	Transactional price	Drinking water	Innsbruch	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
772	2	2013	Cubic Meter	\N	Transactional price	Drinking water	:inz	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
773	2.3	2013	Cubic Meter	\N	Transactional price	Drinking water	Salzburg	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
774	2.4	2013	Cubic Meter	\N	Transactional price	Drinking water	Vienna	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
775	2.4	2013	Cubic Meter	\N	Transactional price	Drinking water	Louvain	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
776	2.1	2013	Cubic Meter	\N	Transactional price	Drinking water	Antweerp	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
777	2.9	2013	Cubic Meter	\N	Transactional price	Drinking water	Brussels	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
778	3.8	2013	Cubic Meter	\N	Transactional price	Drinking water	Liege	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
779	2.5	2013	Cubic Meter	\N	Transactional price	Drinking water	Kortrijk	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
780	2	2013	Cubic Meter	\N	Transactional price	Drinking water	Genk	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
781	3.5	2013	Cubic Meter	\N	Transactional price	Drinking water	Charleroi	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BEL
782	0.8152	2013	Cubic Meter	\N	Transactional price	Drinking water	Sofia	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BGR
783	0.8925	2013	Cubic Meter	\N	Transactional price	Drinking water	Burgas	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BGR
784	1.17	2013	Cubic Meter	\N	Transactional price	Drinking water	Pleven	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BGR
785	1.67	2013	Cubic Meter	\N	Transactional price	Drinking water	Razgrad	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BGR
786	1.47	2013	Cubic Meter	\N	Transactional price	Drinking water	Stara Zagora	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	BGR
787	3.16	2013	Cubic Meter	\N	Transactional price	Drinking water	Calgary	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
788	2.16	2013	Cubic Meter	\N	Transactional price	Drinking water	Winnipeg	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
789	3.51	2013	Cubic Meter	\N	Transactional price	Drinking water	Regina	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
790	6.04	2013	Cubic Meter	\N	Transactional price	Drinking water	Richmond	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
791	2.33	2013	Cubic Meter	\N	Transactional price	Drinking water	Durham	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
792	0.4889	2013	Cubic Meter	\N	Transactional price	Drinking water	Beijing	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHN
793	0.3171	2013	Cubic Meter	\N	Transactional price	Drinking water	Shanghai	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHN
794	0.3799	2013	Cubic Meter	\N	Transactional price	Drinking water	Shenzen	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHN
795	0.3271	2013	Cubic Meter	\N	Transactional price	Drinking water	Guangzhou	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHN
796	0.338	2013	Cubic Meter	\N	Transactional price	Drinking water	Hong Kong	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	HKG
797	0.4196	2013	Cubic Meter	\N	Transactional price	Drinking water	Taipei	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	TWN
798	0.3709	2013	Cubic Meter	\N	Transactional price	Drinking water	Kaohsiung	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	TWN
799	2.199	2013	Cubic Meter	\N	Transactional price	Drinking water	Larnaca	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CYP
800	1.89	2013	Cubic Meter	\N	Transactional price	Drinking water	Lefkosia	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CYP
801	2.14	2013	Cubic Meter	\N	Transactional price	Drinking water	Lemesos	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CYP
802	1.82	2013	Cubic Meter	\N	Transactional price	Drinking water	Paphos	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CYP
803	3.85	2013	Cubic Meter	\N	Transactional price	Drinking water	Aalborg	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
804	4.09	2013	Cubic Meter	\N	Transactional price	Drinking water	Aarhus	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
805	3.44	2013	Cubic Meter	\N	Transactional price	Drinking water	Copenhagen	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
806	3.66	2013	Cubic Meter	\N	Transactional price	Drinking water	Esbjerg	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
807	3.27	2013	Cubic Meter	\N	Transactional price	Drinking water	Odense	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
808	1.88	2013	Cubic Meter	\N	Transactional price	Drinking water	Espoo	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
809	1.88	2013	Cubic Meter	\N	Transactional price	Drinking water	Helsinki	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
951	0.09	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	AUS
810	2.07	2013	Cubic Meter	\N	Transactional price	Drinking water	Oulu	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
811	2.26	2013	Cubic Meter	\N	Transactional price	Drinking water	Tampere	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
812	3.22	2013	Cubic Meter	\N	Transactional price	Drinking water	Turku	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
813	1.88	2013	Cubic Meter	\N	Transactional price	Drinking water	Vantaa	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
814	2.74	2013	Cubic Meter	\N	Transactional price	Drinking water	Bordeaux	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
815	2.7	2013	Cubic Meter	\N	Transactional price	Drinking water	SEDIF	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
816	2.59	2013	Cubic Meter	\N	Transactional price	Drinking water	Lille	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
817	2.54	2013	Cubic Meter	\N	Transactional price	Drinking water	Lyon	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
818	2.03	2013	Cubic Meter	\N	Transactional price	Drinking water	Paris	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
819	2.53	2013	Cubic Meter	\N	Transactional price	Drinking water	Strassbourg	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
820	2.03	2013	Cubic Meter	\N	Transactional price	Drinking water	Reims	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
821	2.34	2013	Cubic Meter	\N	Transactional price	Drinking water	Nancy	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
822	2.84	2013	Cubic Meter	\N	Transactional price	Drinking water	Le Havre	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
823	2.89	2013	Cubic Meter	\N	Transactional price	Drinking water	Marseille	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
824	2.73	2013	Cubic Meter	\N	Transactional price	Drinking water	Brest	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	FRA
825	1.48	2013	Cubic Meter	\N	Transactional price	Drinking water	Budapest	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
826	1.06	2013	Cubic Meter	\N	Transactional price	Drinking water	Debrecen	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
827	1.15	2013	Cubic Meter	\N	Transactional price	Drinking water	Miskolc	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
828	1.57	2013	Cubic Meter	\N	Transactional price	Drinking water	Pecs	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
829	1	2013	Cubic Meter	\N	Transactional price	Drinking water	Kaposvar	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	HUN
830	0.1577	2013	Cubic Meter	\N	Transactional price	Drinking water	Tehran	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	IRN
831	0.1381	2013	Cubic Meter	\N	Transactional price	Drinking water	Esfahan	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	IRN
832	0.124	2013	Cubic Meter	\N	Transactional price	Drinking water	Shiraz	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	IRN
833	0.1414	2013	Cubic Meter	\N	Transactional price	Drinking water	Tabriz	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	IRN
834	0.1425	2013	Cubic Meter	\N	Transactional price	Drinking water	Bandar Abbas	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	IRN
835	2.14	2013	Cubic Meter	\N	Transactional price	Drinking water	Jerusalem	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ISR
836	0.69	2013	Cubic Meter	\N	Transactional price	Drinking water	Bologna	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
837	0.189	2013	Cubic Meter	\N	Transactional price	Drinking water	Milan	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
838	0.8069	2013	Cubic Meter	\N	Transactional price	Drinking water	Naples	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
839	0.6119	2013	Cubic Meter	\N	Transactional price	Drinking water	Rome	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
840	0.6218	2013	Cubic Meter	\N	Transactional price	Drinking water	Turin	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ITA
841	0.7348	2013	Cubic Meter	\N	Transactional price	Drinking water	Nagoya	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
842	1.0823	2013	Cubic Meter	\N	Transactional price	Drinking water	Osaka	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
843	0.97	2013	Cubic Meter	\N	Transactional price	Drinking water	Hiroshima	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
844	1.12	2013	Cubic Meter	\N	Transactional price	Drinking water	Fukuoka	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
952	0.09	2012	Cubic Meter	\N	Transactional price	Industry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	AUS
845	1.5	2013	Cubic Meter	\N	Transactional price	Drinking water	Sapporo	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
846	2.18	2013	Cubic Meter	\N	Transactional price	Drinking water	Sendai	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
847	1.416	2013	Cubic Meter	\N	Transactional price	Drinking water	Tokyo 	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
848	0.91	2013	Cubic Meter	\N	Transactional price	Drinking water	Yokohama	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
849	0.54	2013	Cubic Meter	\N	Transactional price	Drinking water	Macao, China Average	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHN
850	0.2179	2013	Cubic Meter	\N	Transactional price	Drinking water	Mauritius	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MUS
851	0.4068	2013	Cubic Meter	\N	Transactional price	Drinking water	San Luis Potosi	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
852	0.3577	2013	Cubic Meter	\N	Transactional price	Drinking water	Gaudalajara	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
853	2.84	2013	Cubic Meter	\N	Transactional price	Drinking water	Leon	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
854	1.6668	2013	Cubic Meter	\N	Transactional price	Drinking water	Monterrey	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
855	2.87	2013	Cubic Meter	\N	Transactional price	Drinking water	Puebla	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
856	2.28	2013	Cubic Meter	\N	Transactional price	Drinking water	Amsterdam	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
857	2.17	2013	Cubic Meter	\N	Transactional price	Drinking water	Rotterdam	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
858	2.52	2013	Cubic Meter	\N	Transactional price	Drinking water	Den Haag	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
859	1.53	2013	Cubic Meter	\N	Transactional price	Drinking water	Utrecht	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
860	1.6	2013	Cubic Meter	\N	Transactional price	Drinking water	Eindhoven	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
861	2.19	2013	Cubic Meter	\N	Transactional price	Drinking water	Maastricht	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NLD
862	1.88	2013	Cubic Meter	\N	Transactional price	Drinking water	Bergen	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NOR
863	1.7	2013	Cubic Meter	\N	Transactional price	Drinking water	Oslo	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NOR
864	2.05	2013	Cubic Meter	\N	Transactional price	Drinking water	Trondheim	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	NOR
865	1.82	2013	Cubic Meter	\N	Transactional price	Drinking water	Bydgoszcz	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
866	1.35	2013	Cubic Meter	\N	Transactional price	Drinking water	Wroclaw	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
867	1.0854	2013	Cubic Meter	\N	Transactional price	Drinking water	Radom	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
868	1.0688	2013	Cubic Meter	\N	Transactional price	Drinking water	Bialystok	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
869	0.9894	2013	Cubic Meter	\N	Transactional price	Drinking water	Tarnow	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	POL
870	1.9918	2013	Cubic Meter	\N	Transactional price	Drinking water	Lisbon	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
871	1.6463	2013	Cubic Meter	\N	Transactional price	Drinking water	Sintra	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
872	1.5887	2013	Cubic Meter	\N	Transactional price	Drinking water	Porto	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
873	1.5915	2013	Cubic Meter	\N	Transactional price	Drinking water	Moures	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
874	1.5004	2013	Cubic Meter	\N	Transactional price	Drinking water	Braga	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
875	1.5736	2013	Cubic Meter	\N	Transactional price	Drinking water	Coimbra	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
876	1.143	2013	Cubic Meter	\N	Transactional price	Drinking water	Faro	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	PRT
877	0.81	2013	Cubic Meter	\N	Transactional price	Drinking water	Cluj	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
878	0.9855	2013	Cubic Meter	\N	Transactional price	Drinking water	Iasi	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
879	0.9732	2013	Cubic Meter	\N	Transactional price	Drinking water	Oradea	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
953	1.46	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	AUS
880	1.0194	2013	Cubic Meter	\N	Transactional price	Drinking water	Brasov	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
881	0.8192	2013	Cubic Meter	\N	Transactional price	Drinking water	Timisoara	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
882	1.0656	2013	Cubic Meter	\N	Transactional price	Drinking water	Braila	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
883	0.8562	2013	Cubic Meter	\N	Transactional price	Drinking water	Sibiu	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
884	1.16	2013	Cubic Meter	\N	Transactional price	Drinking water	Constanta	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
885	0.8993	2013	Cubic Meter	\N	Transactional price	Drinking water	Arad	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
886	0.9424	2013	Cubic Meter	\N	Transactional price	Drinking water	Bistrita	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
887	1.2596	2013	Cubic Meter	\N	Transactional price	Drinking water	Buzau	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
888	0.927	2013	Cubic Meter	\N	Transactional price	Drinking water	Tg Mures	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
889	0.9578	2013	Cubic Meter	\N	Transactional price	Drinking water	Satu Mare	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
890	0.8777	2013	Cubic Meter	\N	Transactional price	Drinking water	Vrancea	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
891	0.9024	2013	Cubic Meter	\N	Transactional price	Drinking water	Alba	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
892	0.9332	2013	Cubic Meter	\N	Transactional price	Drinking water	Maramures	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
893	0.9578	2013	Cubic Meter	\N	Transactional price	Drinking water	Severin	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
894	0.9824	2013	Cubic Meter	\N	Transactional price	Drinking water	Medias	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
895	1.0564	2013	Cubic Meter	\N	Transactional price	Drinking water	Suceava	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
896	0.9948	2013	Cubic Meter	\N	Transactional price	Drinking water	Pitesti	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ROU
897	0.5348	2013	Cubic Meter	\N	Transactional price	Drinking water	Seoul	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
898	0.6531	2013	Cubic Meter	\N	Transactional price	Drinking water	Busan	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
899	0.5494	2013	Cubic Meter	\N	Transactional price	Drinking water	Daegu	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
900	0.6081	2013	Cubic Meter	\N	Transactional price	Drinking water	Incheon	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
901	0.4973	2013	Cubic Meter	\N	Transactional price	Drinking water	Gwangju	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
902	0.4863	2013	Cubic Meter	\N	Transactional price	Drinking water	Daejeon	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
903	0.8289	2013	Cubic Meter	\N	Transactional price	Drinking water	Ulsan	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
904	0.5919	2013	Cubic Meter	\N	Transactional price	Drinking water	Gyeounggi	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	KOR
905	2.1234	2013	Cubic Meter	\N	Transactional price	Drinking water	Barcelona	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
906	0.9809	2013	Cubic Meter	\N	Transactional price	Drinking water	Bilbao	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
907	1.5531	2013	Cubic Meter	\N	Transactional price	Drinking water	Madrid	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
908	1.2776	2013	Cubic Meter	\N	Transactional price	Drinking water	Sevilla	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
909	1.8899	2013	Cubic Meter	\N	Transactional price	Drinking water	Valencia	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	ESP
910	1.25	2013	Cubic Meter	\N	Transactional price	Drinking water	Stockholm	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
911	2.2967	2013	Cubic Meter	\N	Transactional price	Drinking water	Goteborg	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
912	1.36	2013	Cubic Meter	\N	Transactional price	Drinking water	Malmo	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
913	1.665	2013	Cubic Meter	\N	Transactional price	Drinking water	Uppsala	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
914	2.3298	2013	Cubic Meter	\N	Transactional price	Drinking water	Linkoping	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	SWE
954	0.7	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	CYP
915	3.6617	2013	Cubic Meter	\N	Transactional price	Drinking water	Geneva	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
916	2.5531	2013	Cubic Meter	\N	Transactional price	Drinking water	Zurich	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
917	3.6728	2013	Cubic Meter	\N	Transactional price	Drinking water	Lausanne	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
918	2.4187	2013	Cubic Meter	\N	Transactional price	Drinking water	Basel	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
919	2.9655	2013	Cubic Meter	\N	Transactional price	Drinking water	Bern	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	CHE
920	3.0049	2013	Cubic Meter	\N	Transactional price	Drinking water	Birmingham	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
921	2.7479	2013	Cubic Meter	\N	Transactional price	Drinking water	Cardiff	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
922	2.5876	2013	Cubic Meter	\N	Transactional price	Drinking water	London	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
923	3.2041	2013	Cubic Meter	\N	Transactional price	Drinking water	Manchester	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
924	2.6093	2013	Cubic Meter	\N	Transactional price	Drinking water	Leeds	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	GBR
925	2.8762	2013	Cubic Meter	\N	Transactional price	Drinking water	New York	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
926	3.4805	2013	Cubic Meter	\N	Transactional price	Drinking water	Washington DC	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
927	1.3995	2013	Cubic Meter	\N	Transactional price	Drinking water	Los Angeles	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
928	0.7614	2013	Cubic Meter	\N	Transactional price	Drinking water	Chicago	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
929	1.4996	2013	Cubic Meter	\N	Transactional price	Drinking water	Denver	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
930	0.5161	2013	Cubic Meter	\N	Transactional price	Drinking water	Miami	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
931	1.4619	2013	Cubic Meter	\N	Transactional price	Drinking water	Minneapolis	\N	https://iwa-network.org/wp-content/uploads/2016/06/International-Statistics-for-Water-Services-2014.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	USA
932	0.027	2013	Cubic Meter	Monthly	Statutory price	Drinking water	\N	\N	doi:10.5923/j.env.20130302.05	USD	\N	\N	\N	\N	\N	\N	\N	\N	SAU
933	0.04	2013	Cubic Meter	Monthly	Statutory price	Drinking water	\N	\N	doi:10.5923/j.env.20130302.05	USD	\N	\N	\N	\N	\N	\N	\N	\N	SAU
934	0.53	2013	Cubic Meter	Monthly	Statutory price	Drinking water	\N	\N	doi:10.5923/j.env.20130302.05	USD	\N	\N	\N	\N	\N	\N	\N	\N	SAU
935	1.07	2013	Cubic Meter	Monthly	Statutory price	Drinking water	\N	\N	doi:10.5923/j.env.20130302.05	USD	\N	\N	\N	\N	\N	\N	\N	\N	SAU
936	1.6	2013	Cubic Meter	Monthly	Statutory price	Drinking water	\N	\N	doi:10.5923/j.env.20130302.05	USD	\N	\N	\N	\N	\N	\N	\N	\N	SAU
937	5.72	2019	Cubic Meter	\N	Transactional price	Residential water	Copenhagen	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	\N	\N	\N	\N	DNK
938	2.83	2019	Cubic Meter	\N	Transactional price	Residential water	Dublin	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	\N	\N	\N	\N	IRL
939	2.89	2019	Cubic Meter	\N	Transactional price	Residential water	Portland	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	Oregon	\N	\N	\N	USA
940	3.28	2019	Cubic Meter	\N	Transactional price	Residential water	Seattle	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	Washington	\N	\N	\N	USA
941	2.49	2019	Cubic Meter	\N	Transactional price	Residential water	Calgary	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	Alberta	\N	\N	\N	CAN
942	2.31	2019	Cubic Meter	\N	Transactional price	Residential water	Sydney	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	New South Wales	\N	\N	\N	AUS
943	3.62	2019	Cubic Meter	\N	Transactional price	Residential water	Toronto	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	Ontario	\N	\N	\N	CAN
944	3.77	2019	Cubic Meter	\N	Transactional price	Residential water	San Diego	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	California	\N	\N	\N	USA
945	1.74	2019	Cubic Meter	\N	Transactional price	Residential water	New York	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	New York	\N	\N	\N	USA
946	1.07	2019	Cubic Meter	\N	Transactional price	Residential water	Metro Vancouver	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	British Columbia	\N	\N	\N	CAN
947	2.32	2019	Cubic Meter	\N	Transactional price	Residential water	Los Angeles	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	California	\N	\N	\N	USA
948	0.74	2019	Cubic Meter	\N	Transactional price	Residential water	Pheonix	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	CAD	\N	\N	\N	\N	Arizona	\N	\N	\N	USA
949	0.768	2019	Cubic Meter	\N	Transactional price	Residential water	Brisbane	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	AUD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
950	1.489	2019	Cubic Meter	\N	Transactional price	Residential water	Brisbane	\N	http://www.metrovancouver.org/services/water/WaterPublications/ResidentialWaterMeteringinMV-BestPracticesGuide.pdf	AUD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
955	0.19	2012	Cubic Meter	\N	Transactional price	Industry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	CYP
956	0.56	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	CYP
957	0.77	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	CYP
958	0.1	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	FRA
959	0.15	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	FRA
960	0.75	2012	Cubic Meter	\N	Transactional price	industry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	FRA
961	1.1	2012	Cubic Meter	\N	Transactional price	Industry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	FRA
962	3.4	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	FRA
963	1.42	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	FRA
964	1.45	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	FRA
965	0.022	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	MEX
966	0.32	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	MEX
967	0.35	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	MEX
968	0.8	2012	Cubic Meter	\N	Transactional price	Industry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	NLD
969	1.64	2012	Cubic Meter	\N	Transactional price	Indsutry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	NLD
970	1	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	NLD
971	2	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	NLD
972	0.00071	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ROU
973	0.57	2012	Cubic Meter	\N	Transactional price	Indsutry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ROU
974	0.57	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ROU
975	0.0262	2012	Cubic Meter	\N	Transactional price	Agriculture	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
976	1.75	2012	Cubic Meter	\N	Transactional price	Industry	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
977	1.47	2012	Cubic Meter	\N	Transactional price	Domestic	\N	\N	https://ec.europa.eu/environment/water/quantity/pdf/agriculture_report.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
978	0.095	2007	Cubic Meter	\N	Transactional price	Irrigation	Duero	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
979	0.15	2007	Cubic Meter	\N	Transactional price	Irrigation	Ebro	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
980	0.15	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadalquivir	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
981	0.048	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadiana	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
982	0.074	2007	Cubic Meter	\N	Transactional price	Irrigation	Jucar	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
983	0.163	2007	Cubic Meter	\N	Transactional price	Irrigation	Segura	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
984	0.1	2007	Cubic Meter	\N	Transactional price	Irrigation	Tagus	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
985	0.012	2007	Cubic Meter	\N	Transactional price	Irrigation	Duero	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
986	0.011	2007	Cubic Meter	\N	Transactional price	Irrigation	Ebro	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
987	0.035	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadalquivir	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
988	0.025	2007	Cubic Meter	\N	Transactional price	Irrigation	Guadiana	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
989	0.02	2007	Cubic Meter	\N	Transactional price	Irrigation	Jucar	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
990	0.038	2007	Cubic Meter	\N	Transactional price	Irrigation	Segura	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
991	0.02	2007	Cubic Meter	\N	Transactional price	Irrigation	Tagus	\N	https://www.oecd.org/eu/45015101.pdf	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
992	0.22	2007	Cubic Meter	\N	Transactional price	Irrigation	Distrito de Riego	\N	https://www.oecd.org/eu/45015101.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
993	0.42	2007	Cubic Meter	\N	Transactional price	Irrigation	Alto Rio Lerma	\N	https://www.oecd.org/eu/45015101.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
994	0.028	2007	Cubic Meter	\N	Transactional price	Irrigation	Michoacan	\N	https://www.oecd.org/eu/45015101.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
995	0.034	2007	Cubic Meter	\N	Transactional price	Irrigation	Michoacan	\N	https://www.oecd.org/eu/45015101.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
996	0.051	2007	Cubic Meter	\N	Transactional price	Irrigation	Guanajuato	\N	https://www.oecd.org/eu/45015101.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
997	0.057	2007	Cubic Meter	\N	Transactional price	Irrigation	Guanajuato	\N	https://www.oecd.org/eu/45015101.pdf	USD	\N	\N	\N	\N	\N	\N	\N	\N	MEX
998	0.01	2020	Cubic Meter	\N	Transactional price	\N	Alicante	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
999	0.61	2020	Cubic Meter	\N	Transactional price	\N	Barcelona	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1000	0.57	2020	Cubic Meter	\N	Transactional price	\N	Bilbao	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1133	0.27	2010	Cubic Meter	\N	Transactional price	\N	Gjirokaster - rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1001	0.79	2020	Cubic Meter	\N	Transactional price	\N	Cordoba	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1002	0.38	2020	Cubic Meter	\N	Transactional price	\N	Gijon	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1003	1.21	2020	Cubic Meter	\N	Transactional price	\N	Las Palmas de Gran Canaria	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1004	0.13	2020	Cubic Meter	\N	Transactional price	\N	Madrid	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1005	0.21	2020	Cubic Meter	\N	Transactional price	\N	Malaga	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1006	0.99	2020	Cubic Meter	\N	Transactional price	\N	Murcia	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1007	0.6	2020	Cubic Meter	\N	Transactional price	\N	Palma de Mallorca	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1008	0.5	2020	Cubic Meter	\N	Transactional price	\N	Sevilla	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1009	0.47	2020	Cubic Meter	\N	Transactional price	\N	Valencia	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1010	0.27	2020	Cubic Meter	\N	Transactional price	\N	Valladolid	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1011	0.39	2020	Cubic Meter	\N	Transactional price	\N	Vigo	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1012	0.21	2020	Cubic Meter	\N	Transactional price	\N	Zaragoza	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1013	2.56	2020	Cubic Meter	\N	Transactional price	\N	Alicante	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1014	3.04	2020	Cubic Meter	\N	Transactional price	\N	Barcelona	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1015	1.25	2020	Cubic Meter	\N	Transactional price	\N	Bilbao	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1016	1.23	2020	Cubic Meter	\N	Transactional price	\N	Cordoba	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1017	0.71	2020	Cubic Meter	\N	Transactional price	\N	Gijon	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1018	3.17	2020	Cubic Meter	\N	Transactional price	\N	Las Palmas de Gran Canaria	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1019	0.5	2020	Cubic Meter	\N	Transactional price	\N	Madrid	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1020	1.41	2020	Cubic Meter	\N	Transactional price	\N	Malaga	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1021	2.64	2020	Cubic Meter	\N	Transactional price	\N	Murcia	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1022	5.76	2020	Cubic Meter	\N	Transactional price	\N	Palma de Mallorca	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1023	1.61	2020	Cubic Meter	\N	Transactional price	\N	Sevilla	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1024	0.55	2020	Cubic Meter	\N	Transactional price	\N	Valencia	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1025	0.66	2020	Cubic Meter	\N	Transactional price	\N	Valladolid	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1026	1.17	2020	Cubic Meter	\N	Transactional price	\N	Vigo	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1027	1.26	2020	Cubic Meter	\N	Transactional price	\N	Zaragoza	\N	https://oxfordre.com/publichealth/view/10.1093/acrefore/9780190632366.001.0001/acrefore-9780190632366-e-246	EUR	\N	\N	\N	\N	\N	\N	\N	\N	ESP
1028	32.8	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Johor	\N	\N	\N	MYS
1029	33.3	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Johor	\N	\N	\N	MYS
1030	16.4	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1031	16.5	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1032	16.6	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1033	16.8	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1034	16.4	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1035	16.6	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1036	16.8	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1037	17.1	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1038	16.05	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1039	16.15	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1040	16.2	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kedah	\N	\N	\N	MYS
1041	18.92	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kelantan	\N	\N	\N	MYS
1042	19.46	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kelantan	\N	\N	\N	MYS
1043	19.5	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Kelantan	\N	\N	\N	MYS
1044	27	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Melaka	\N	\N	\N	MYS
1045	27.05	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Melaka	\N	\N	\N	MYS
1046	27.15	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Melaka	\N	\N	\N	MYS
1047	16.85	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Negeri Sembilan	\N	\N	\N	MYS
1048	17.7	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Negeri Sembilan	\N	\N	\N	MYS
1049	30.92	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pahang	\N	\N	\N	MYS
1050	30.84	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pahang	\N	\N	\N	MYS
1051	21.45	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pahang	\N	\N	\N	MYS
1052	10.99	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pahang	\N	\N	\N	MYS
1053	1.45	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pahang	\N	\N	\N	MYS
1054	12.85	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pulau Pinang	\N	\N	\N	MYS
1055	13.05	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pulau Pinang	\N	\N	\N	MYS
1056	13.3	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pulau Pinang	\N	\N	\N	MYS
1057	13.45	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pulau Pinang	\N	\N	\N	MYS
1058	15	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pulau Pinang	\N	\N	\N	MYS
1059	57	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Pulau Pinang	\N	\N	\N	MYS
1060	13.2	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Perak	\N	\N	\N	MYS
1061	13.4	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Perak	\N	\N	\N	MYS
1062	13.61	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Perak	\N	\N	\N	MYS
1063	9.3	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Perlis	\N	\N	\N	MYS
1064	6.1	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Perlis	\N	\N	\N	MYS
1065	51.15	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Terengganu	\N	\N	\N	MYS
1066	15.95	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Terengganu	\N	\N	\N	MYS
1067	16.15	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Terengganu	\N	\N	\N	MYS
1068	18.7	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Wilayah Persekutuan Labuan	\N	\N	\N	MYS
1069	19.2	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Wilayah Persekutuan Labuan	\N	\N	\N	MYS
1070	38.07	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Wilayah Persekutuan Kuala Lumpur	\N	\N	\N	MYS
1071	38.28	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Wilayah Persekutuan Kuala Lumpur	\N	\N	\N	MYS
1072	71.6	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sabah	\N	\N	\N	MYS
1073	72	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sabah	\N	\N	\N	MYS
1074	24.1	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sabah	\N	\N	\N	MYS
1075	24.5	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sabah	\N	\N	\N	MYS
1076	22.97	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1077	23.06	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1078	19.53	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1079	19.65	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1080	25.25	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1134	0.51	2014	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1081	25.52	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1082	24.2	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1083	25.41	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1084	20.9	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1085	21.89	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1086	19.53	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1087	19.65	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1088	22.95	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1089	23.2	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1090	20.88	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1091	23.2	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1092	20.88	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1093	20.96	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1094	17.75	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1095	17.85	2017	Cubic Meter	\N	Statutory price	Industrial	\N	\N	https://www.mida.gov.my/wp-content/uploads/2021/04/CODB-ENGLISH-Utilities.pdf	MYR	\N	\N	\N	\N	Sarawak	\N	\N	\N	MYS
1096	2.21	2019	Cubic Meter	\N	Transactional price	\N	Tokyo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1097	0.96	2019	Cubic Meter	\N	Transactional price	\N	Kawasaki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1098	1.13	2019	Cubic Meter	\N	Transactional price	\N	Yokohama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1099	1.5	2019	Cubic Meter	\N	Transactional price	\N	Chiba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1100	2.37	2019	Cubic Meter	\N	Transactional price	\N	Niigata	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1101	1.14	2019	Cubic Meter	\N	Transactional price	\N	Hamamatsu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1102	2.02	2019	Cubic Meter	\N	Transactional price	\N	Sendai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1103	1.28	2019	Cubic Meter	\N	Transactional price	\N	Nagoya	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1104	1.26	2019	Cubic Meter	\N	Transactional price	\N	Kyoto	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1105	0.97	2019	Cubic Meter	\N	Transactional price	\N	Osaka	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1106	0.11	2019	Cubic Meter	\N	Transactional price	\N	Sakai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1107	1.09	2019	Cubic Meter	\N	Transactional price	\N	Kobe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1108	1.36	2019	Cubic Meter	\N	Transactional price	\N	Okayama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1109	0.94	2019	Cubic Meter	\N	Transactional price	\N	Hiroshima	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1110	1.09	2019	Cubic Meter	\N	Transactional price	\N	Kitakyushu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1111	1.4	2019	Cubic Meter	\N	Transactional price	\N	Kamamoto	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1112	1.54	2019	Cubic Meter	\N	Transactional price	\N	Fukuoka	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1113	0.75	2019	Cubic Meter	\N	Transactional price	\N	Ulsan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1114	0.77	2019	Cubic Meter	\N	Transactional price	\N	Donghae	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	JPN
1115	0.57	2012	Cubic Meter	\N	Transactional price	\N	Tirane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1116	0.71	2013	Cubic Meter	\N	Transactional price	\N	Durres	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1117	0.58	2015	Cubic Meter	\N	Transactional price	\N	Sarande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1118	0.42	2007	Cubic Meter	\N	Transactional price	\N	Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1119	0.56	2012	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1120	0.83	2014	Cubic Meter	\N	Transactional price	\N	Lezhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1121	0.85	2014	Cubic Meter	\N	Transactional price	\N	Korce	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1122	0.42	2006	Cubic Meter	\N	Transactional price	\N	Elber	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1123	0.51	2012	Cubic Meter	\N	Transactional price	\N	Shkoder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1124	0.52	2013	Cubic Meter	\N	Transactional price	\N	Permet	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1125	0.28	2013	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1126	0.36	2012	Cubic Meter	\N	Transactional price	\N	Novosele	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1127	0.48	2014	Cubic Meter	\N	Transactional price	\N	Puke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1128	0.55	2012	Cubic Meter	\N	Transactional price	\N	Shkoder-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1129	0.43	2015	Cubic Meter	\N	Transactional price	\N	Elbasan-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1130	0.38	2015	Cubic Meter	\N	Transactional price	\N	Korce-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1131	0.7	2014	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1132	0.66	2006	Cubic Meter	\N	Transactional price	\N	Lushnje-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1135	0.41	2008	Cubic Meter	\N	Transactional price	\N	Rubik	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1136	0.45	2012	Cubic Meter	\N	Transactional price	\N	Bilisht	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1137	0.33	2012	Cubic Meter	\N	Transactional price	\N	Mirdite	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1138	0.57	2013	Cubic Meter	\N	Transactional price	\N	Rrogozhine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1139	0.76	2014	Cubic Meter	\N	Transactional price	\N	Fier	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1140	0.43	2012	Cubic Meter	\N	Transactional price	\N	Librazhd	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1141	0.33	2005	Cubic Meter	\N	Transactional price	\N	Fush-Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1142	0.4	2010	Cubic Meter	\N	Transactional price	\N	Kavaje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1143	0.32	2010	Cubic Meter	\N	Transactional price	\N	Selenice	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1144	0.35	2010	Cubic Meter	\N	Transactional price	\N	Peqin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1145	0.31	2014	Cubic Meter	\N	Transactional price	\N	Peshkopi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1146	0.36	2011	Cubic Meter	\N	Transactional price	\N	Gramsh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1147	0.26	2013	Cubic Meter	\N	Transactional price	\N	Bulqize	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1148	0.45	2014	Cubic Meter	\N	Transactional price	\N	Tepelene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1149	0.39	2010	Cubic Meter	\N	Transactional price	\N	Polican	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1150	0.41	2015	Cubic Meter	\N	Transactional price	\N	Erseke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1151	0.29	2004	Cubic Meter	\N	Transactional price	\N	Kukes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1152	0.38	2011	Cubic Meter	\N	Transactional price	\N	Kurbin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1153	0.72	2008	Cubic Meter	\N	Transactional price	\N	Delvine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1154	0.48	2007	Cubic Meter	\N	Transactional price	\N	Ura-Vajgurore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1155	0.39	2007	Cubic Meter	\N	Transactional price	\N	Kraste .	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1156	0.36	2011	Cubic Meter	\N	Transactional price	\N	Orikum	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1157	0.4	2016	Cubic Meter	\N	Transactional price	\N	Bashkia Puke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1158	0.18	2016	Cubic Meter	\N	Transactional price	\N	Tropoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1159	0.71	2013	Cubic Meter	\N	Transactional price	\N	Pogradec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1160	0.26	2016	Cubic Meter	\N	Transactional price	\N	Corovode	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1161	0.51	2017	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1162	0.84	2017	Cubic Meter	\N	Transactional price	\N	Durres	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1163	0.45	2017	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1164	0.33	2017	Cubic Meter	\N	Transactional price	\N	Gramsh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1165	0.64	2017	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1166	0.63	2018	Cubic Meter	\N	Transactional price	\N	Kozare	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1167	0.28	2018	Cubic Meter	\N	Transactional price	\N	Antigone	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1168	0.9	2018	Cubic Meter	\N	Transactional price	\N	Korce	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1169	0.68	2018	Cubic Meter	\N	Transactional price	\N	Malsi e Madhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1170	0.87	2018	Cubic Meter	\N	Transactional price	\N	Tirane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1171	0.77	2019	Cubic Meter	\N	Transactional price	\N	Delvine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1172	0.58	2019	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1173	0.34	2019	Cubic Meter	\N	Transactional price	\N	Antigone	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1174	0.54	2019	Cubic Meter	\N	Transactional price	\N	Librazhd	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1175	0.68	2019	Cubic Meter	\N	Transactional price	\N	Malsi e Madhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1176	0.63	2019	Cubic Meter	\N	Transactional price	\N	Polican	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1177	0.53	2019	Cubic Meter	\N	Transactional price	\N	Vau Dejes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1178	0.39	2019	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1179	0.61	2019	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1180	0.73	2019	Cubic Meter	\N	Transactional price	\N	Bashkia Himare	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1181	0.45	2019	Cubic Meter	\N	Transactional price	\N	Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1182	0.73	2019	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1183	0.36	2018	Cubic Meter	\N	Transactional price	\N	Qukes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1184	0.73	2019	Cubic Meter	\N	Transactional price	\N	Allkaj	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1185	0.55	2019	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1186	0.4	2019	Cubic Meter	\N	Transactional price	\N	Tropoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1187	0.5	2019	Cubic Meter	\N	Transactional price	\N	Roshnik	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1188	0.45	2012	Cubic Meter	\N	Transactional price	\N	Devoll	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1189	0.25	2015	Cubic Meter	\N	Transactional price	\N	Diber	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1190	0.48	2018	Cubic Meter	\N	Transactional price	\N	Mollaj	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1191	0.48	2018	Cubic Meter	\N	Transactional price	\N	Bulgarec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1192	0.37	2018	Cubic Meter	\N	Transactional price	\N	Drenove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1193	0.37	2018	Cubic Meter	\N	Transactional price	\N	Voskopoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1194	0.63	2020	Cubic Meter	\N	Transactional price	\N	Roskovec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1195	0.46	2018	Cubic Meter	\N	Transactional price	\N	Skrapar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1196	0.51	2019	Cubic Meter	\N	Transactional price	\N	Bajram Curri	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1197	0.84	2020	Cubic Meter	\N	Transactional price	\N	Vore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1198	0.94	2021	Cubic Meter	\N	Transactional price	\N	Patos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1199	0.63	2020	Cubic Meter	\N	Transactional price	\N	Peqin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1200	0.82	2020	Cubic Meter	\N	Transactional price	\N	Pogradec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1201	0.85	2021	Cubic Meter	\N	Transactional price	\N	Sarande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1202	0.52	2012	Cubic Meter	\N	Transactional price	\N	Tirane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1203	0.66	2013	Cubic Meter	\N	Transactional price	\N	Durres	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1204	0.51	2015	Cubic Meter	\N	Transactional price	\N	Sarande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1205	0.42	2007	Cubic Meter	\N	Transactional price	\N	Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1206	0.51	2012	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1207	0.72	2014	Cubic Meter	\N	Transactional price	\N	Lezhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1208	0.78	2014	Cubic Meter	\N	Transactional price	\N	Korce	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1209	0.42	2006	Cubic Meter	\N	Transactional price	\N	Elber	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1210	0.46	2012	Cubic Meter	\N	Transactional price	\N	Shkoder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1211	0.47	2013	Cubic Meter	\N	Transactional price	\N	Permet	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1212	0.28	2013	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1213	0.36	2012	Cubic Meter	\N	Transactional price	\N	Novosele	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1214	0.43	2014	Cubic Meter	\N	Transactional price	\N	Puke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1215	0.55	2012	Cubic Meter	\N	Transactional price	\N	Shkoder-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1216	0.38	2015	Cubic Meter	\N	Transactional price	\N	Elbasan-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1217	0.36	2015	Cubic Meter	\N	Transactional price	\N	Korce-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1218	0.65	2014	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1219	0.66	2006	Cubic Meter	\N	Transactional price	\N	Lushnje-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1220	0.27	2010	Cubic Meter	\N	Transactional price	\N	Gjirokaster - rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1221	0.47	2014	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1222	0.41	2008	Cubic Meter	\N	Transactional price	\N	Rubik	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1223	0.43	2012	Cubic Meter	\N	Transactional price	\N	Bilisht	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1224	0.33	2012	Cubic Meter	\N	Transactional price	\N	Mirdite	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1225	0.55	2013	Cubic Meter	\N	Transactional price	\N	Rrogozhine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1226	0.65	2014	Cubic Meter	\N	Transactional price	\N	Fier	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1227	0.43	2012	Cubic Meter	\N	Transactional price	\N	Librazhd	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1228	0.33	2005	Cubic Meter	\N	Transactional price	\N	Fush-Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1229	0.4	2010	Cubic Meter	\N	Transactional price	\N	Kavaje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1230	0.32	2010	Cubic Meter	\N	Transactional price	\N	Selenice	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1231	0.33	2010	Cubic Meter	\N	Transactional price	\N	Peqin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1232	0.31	2014	Cubic Meter	\N	Transactional price	\N	Peshkopi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1233	0.36	2011	Cubic Meter	\N	Transactional price	\N	Gramsh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1234	0.21	2013	Cubic Meter	\N	Transactional price	\N	Bulqize	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1235	0.4	2014	Cubic Meter	\N	Transactional price	\N	Tepelene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1236	0.39	2010	Cubic Meter	\N	Transactional price	\N	Polican	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1237	0.36	2015	Cubic Meter	\N	Transactional price	\N	Erseke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1238	0.29	2004	Cubic Meter	\N	Transactional price	\N	Kukes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1239	0.35	2011	Cubic Meter	\N	Transactional price	\N	Kurbin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1240	0.72	2008	Cubic Meter	\N	Transactional price	\N	Delvine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1241	0.48	2007	Cubic Meter	\N	Transactional price	\N	Ura-Vajgurore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1242	0.39	2007	Cubic Meter	\N	Transactional price	\N	Kraste .	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1243	0.31	2011	Cubic Meter	\N	Transactional price	\N	Orikum	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1244	0.36	2016	Cubic Meter	\N	Transactional price	\N	Bashkia Puke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1245	0.18	2016	Cubic Meter	\N	Transactional price	\N	Tropoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1246	0.7	2013	Cubic Meter	\N	Transactional price	\N	Pogradec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1247	0.26	2016	Cubic Meter	\N	Transactional price	\N	Corovode	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1248	0.47	2017	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1249	0.77	2017	Cubic Meter	\N	Transactional price	\N	Durres	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1250	0.42	2017	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1251	0.3	2017	Cubic Meter	\N	Transactional price	\N	Gramsh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1252	0.6	2017	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1253	0.57	2018	Cubic Meter	\N	Transactional price	\N	Kozare	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1254	0.28	2018	Cubic Meter	\N	Transactional price	\N	Antigone	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1255	0.83	2018	Cubic Meter	\N	Transactional price	\N	Korce	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1256	0.59	2018	Cubic Meter	\N	Transactional price	\N	Malsi e Madhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1257	0.76	2018	Cubic Meter	\N	Transactional price	\N	Tirane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1258	0.68	2019	Cubic Meter	\N	Transactional price	\N	Delvine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1259	0.53	2019	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1260	0.29	2019	Cubic Meter	\N	Transactional price	\N	Antigone	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1261	0.49	2019	Cubic Meter	\N	Transactional price	\N	Librazhd	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1262	0.59	2019	Cubic Meter	\N	Transactional price	\N	Malsi e Madhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1263	0.58	2019	Cubic Meter	\N	Transactional price	\N	Polican	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1264	0.48	2019	Cubic Meter	\N	Transactional price	\N	Vau Dejes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1265	0.35	2019	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1266	0.56	2019	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1267	0.63	2019	Cubic Meter	\N	Transactional price	\N	Bashkia Himare	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1268	0.4	2019	Cubic Meter	\N	Transactional price	\N	Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1269	0.68	2019	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1270	0.31	2018	Cubic Meter	\N	Transactional price	\N	Qukes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1271	0.68	2019	Cubic Meter	\N	Transactional price	\N	Allkaj	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1272	0.5	2019	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1273	0.35	2019	Cubic Meter	\N	Transactional price	\N	Tropoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1274	0.45	2019	Cubic Meter	\N	Transactional price	\N	Roshnik	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1275	0.43	2012	Cubic Meter	\N	Transactional price	\N	Devoll	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1276	0.25	2015	Cubic Meter	\N	Transactional price	\N	Diber	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1277	0.43	2018	Cubic Meter	\N	Transactional price	\N	Mollaj	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1278	0.43	2018	Cubic Meter	\N	Transactional price	\N	Bulgarec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1279	0.32	2018	Cubic Meter	\N	Transactional price	\N	Drenove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1280	0.32	2018	Cubic Meter	\N	Transactional price	\N	Voskopoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1281	0.58	2020	Cubic Meter	\N	Transactional price	\N	Roskovec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1282	0.41	2018	Cubic Meter	\N	Transactional price	\N	Skrapar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1283	0.46	2019	Cubic Meter	\N	Transactional price	\N	Bajram Curri	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1284	0.74	2020	Cubic Meter	\N	Transactional price	\N	Vore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1285	0.84	2021	Cubic Meter	\N	Transactional price	\N	Patos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1286	0.57	2020	Cubic Meter	\N	Transactional price	\N	Peqin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1287	0.72	2020	Cubic Meter	\N	Transactional price	\N	Pogradec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1288	0.74	2021	Cubic Meter	\N	Transactional price	\N	Sarande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1289	0.51	2012	Cubic Meter	\N	Transactional price	\N	Tirane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1290	0.64	2013	Cubic Meter	\N	Transactional price	\N	Durres	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1291	0.5	2015	Cubic Meter	\N	Transactional price	\N	Sarande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1292	0.42	2007	Cubic Meter	\N	Transactional price	\N	Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1293	0.49	2012	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1294	0.7	2014	Cubic Meter	\N	Transactional price	\N	Lezhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1295	0.77	2014	Cubic Meter	\N	Transactional price	\N	Korce	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1296	0.42	2006	Cubic Meter	\N	Transactional price	\N	Elber	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1297	0.45	2012	Cubic Meter	\N	Transactional price	\N	Shkoder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1298	0.46	2013	Cubic Meter	\N	Transactional price	\N	Permet	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1299	0.28	2013	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1300	0.36	2012	Cubic Meter	\N	Transactional price	\N	Novosele	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1301	0.42	2014	Cubic Meter	\N	Transactional price	\N	Puke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1302	0.55	2012	Cubic Meter	\N	Transactional price	\N	Shkoder-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1303	0.37	2015	Cubic Meter	\N	Transactional price	\N	Elbasan-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1304	0.35	2015	Cubic Meter	\N	Transactional price	\N	Korce-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1305	0.64	2014	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1306	0.66	2006	Cubic Meter	\N	Transactional price	\N	Lushnje-rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1307	0.27	2010	Cubic Meter	\N	Transactional price	\N	Gjirokaster - rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1308	0.46	2014	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1309	0.41	2008	Cubic Meter	\N	Transactional price	\N	Rubik	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1310	0.42	2012	Cubic Meter	\N	Transactional price	\N	Bilisht	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1311	0.33	2012	Cubic Meter	\N	Transactional price	\N	Mirdite	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1312	0.54	2013	Cubic Meter	\N	Transactional price	\N	Rrogozhine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1313	0.63	2014	Cubic Meter	\N	Transactional price	\N	Fier	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1314	0.43	2012	Cubic Meter	\N	Transactional price	\N	Librazhd	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1315	0.33	2005	Cubic Meter	\N	Transactional price	\N	Fush-Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1316	0.4	2010	Cubic Meter	\N	Transactional price	\N	Kavaje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1317	0.32	2010	Cubic Meter	\N	Transactional price	\N	Selenice	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1318	0.32	2010	Cubic Meter	\N	Transactional price	\N	Peqin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1319	0.31	2014	Cubic Meter	\N	Transactional price	\N	Peshkopi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1320	0.36	2011	Cubic Meter	\N	Transactional price	\N	Gramsh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1321	0.2	2013	Cubic Meter	\N	Transactional price	\N	Bulqize	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1322	0.39	2014	Cubic Meter	\N	Transactional price	\N	Tepelene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1323	0.39	2010	Cubic Meter	\N	Transactional price	\N	Polican	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1324	0.35	2015	Cubic Meter	\N	Transactional price	\N	Erseke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1325	0.29	2004	Cubic Meter	\N	Transactional price	\N	Kukes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1326	0.35	2011	Cubic Meter	\N	Transactional price	\N	Kurbin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1327	0.72	2008	Cubic Meter	\N	Transactional price	\N	Delvine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1328	0.48	2007	Cubic Meter	\N	Transactional price	\N	Ura-Vajgurore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1329	0.39	2007	Cubic Meter	\N	Transactional price	\N	Kraste .	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1330	0.3	2011	Cubic Meter	\N	Transactional price	\N	Orikum	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1331	0.35	2016	Cubic Meter	\N	Transactional price	\N	Bashkia Puke	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1332	0.18	2016	Cubic Meter	\N	Transactional price	\N	Tropoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1333	0.69	2013	Cubic Meter	\N	Transactional price	\N	Pogradec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1334	0.26	2016	Cubic Meter	\N	Transactional price	\N	Corovode	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1335	0.46	2017	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1336	0.76	2017	Cubic Meter	\N	Transactional price	\N	Durres	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1337	0.41	2017	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1338	0.3	2017	Cubic Meter	\N	Transactional price	\N	Gramsh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1339	0.59	2017	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1340	0.56	2018	Cubic Meter	\N	Transactional price	\N	Kozare	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1341	0.28	2018	Cubic Meter	\N	Transactional price	\N	Antigone	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1342	0.81	2018	Cubic Meter	\N	Transactional price	\N	Korce	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1343	0.57	2018	Cubic Meter	\N	Transactional price	\N	Malsi e Madhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1344	0.74	2018	Cubic Meter	\N	Transactional price	\N	Tirane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1345	0.66	2019	Cubic Meter	\N	Transactional price	\N	Delvine	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1346	0.52	2019	Cubic Meter	\N	Transactional price	\N	Gjirokaster	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1347	0.29	2019	Cubic Meter	\N	Transactional price	\N	Antigone	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1348	0.48	2019	Cubic Meter	\N	Transactional price	\N	Librazhd	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1349	0.57	2019	Cubic Meter	\N	Transactional price	\N	Malsi e Madhe	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1350	0.57	2019	Cubic Meter	\N	Transactional price	\N	Polican	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1351	0.47	2019	Cubic Meter	\N	Transactional price	\N	Vau Dejes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1352	0.34	2019	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1353	0.55	2019	Cubic Meter	\N	Transactional price	\N	Berat Kucove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1354	0.61	2019	Cubic Meter	\N	Transactional price	\N	Bashkia Himare	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1355	0.39	2019	Cubic Meter	\N	Transactional price	\N	Kruje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1356	0.67	2019	Cubic Meter	\N	Transactional price	\N	Lushnje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1357	0.29	2018	Cubic Meter	\N	Transactional price	\N	Qukes	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1358	0.67	2019	Cubic Meter	\N	Transactional price	\N	Allkaj	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1359	0.49	2019	Cubic Meter	\N	Transactional price	\N	Vlore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1360	0.34	2019	Cubic Meter	\N	Transactional price	\N	Tropoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1361	0.44	2019	Cubic Meter	\N	Transactional price	\N	Roshnik	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1362	0.42	2012	Cubic Meter	\N	Transactional price	\N	Devoll	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1363	0.25	2015	Cubic Meter	\N	Transactional price	\N	Diber	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1364	0.42	2018	Cubic Meter	\N	Transactional price	\N	Mollaj	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1365	0.42	2018	Cubic Meter	\N	Transactional price	\N	Bulgarec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1366	0.31	2018	Cubic Meter	\N	Transactional price	\N	Drenove	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1367	0.31	2018	Cubic Meter	\N	Transactional price	\N	Voskopoje	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1368	0.57	2020	Cubic Meter	\N	Transactional price	\N	Roskovec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1369	0.4	2018	Cubic Meter	\N	Transactional price	\N	Skrapar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1370	0.45	2019	Cubic Meter	\N	Transactional price	\N	Bajram Curri	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1371	0.72	2020	Cubic Meter	\N	Transactional price	\N	Vore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1372	0.81	2021	Cubic Meter	\N	Transactional price	\N	Patos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1373	0.56	2020	Cubic Meter	\N	Transactional price	\N	Peqin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1374	0.7	2020	Cubic Meter	\N	Transactional price	\N	Pogradec	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1375	0.72	2021	Cubic Meter	\N	Transactional price	\N	Sarande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ALB
1376	0.63	2015	Cubic Meter	\N	Transactional price	\N	S�o Paulo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1377	1.3	2015	Cubic Meter	\N	Transactional price	\N	Florian�polis	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1378	0.72	2012	Cubic Meter	\N	Transactional price	\N	Macap�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1379	1	2008	Cubic Meter	\N	Transactional price	\N	Bel�m	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1380	0.97	2015	Cubic Meter	\N	Transactional price	\N	State of Piau�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1381	1.06	2014	Cubic Meter	\N	Transactional price	\N	Fortaleza	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1382	1.42	2015	Cubic Meter	\N	Transactional price	\N	Macei�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1383	0.94	2015	Cubic Meter	\N	Transactional price	\N	Porto Velho	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1384	1.1	2015	Cubic Meter	\N	Transactional price	\N	Jo�o Pessoa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1385	1.15	2015	Cubic Meter	\N	Transactional price	\N	Recife	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1386	0.99	2015	Cubic Meter	\N	Transactional price	\N	Curitiba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1387	1.17	2015	Cubic Meter	\N	Transactional price	\N	Bras�lia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1388	0.75	2015	Cubic Meter	\N	Transactional price	\N	Limoeiro do Norte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1389	1.21	2015	Cubic Meter	\N	Transactional price	\N	Campo Grande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1390	1.24	2015	Cubic Meter	\N	Transactional price	\N	Aracaju	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1391	1.17	2015	Cubic Meter	\N	Transactional price	\N	Salvador	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1392	1.24	2015	Cubic Meter	\N	Transactional price	\N	Belo Horizonte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1393	1.03	2015	Cubic Meter	\N	Transactional price	\N	Goi�nia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1394	0.66	2015	Cubic Meter	\N	Transactional price	\N	Itapemirim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1395	1.13	2015	Cubic Meter	\N	Transactional price	\N	Capinzal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1396	0.51	2015	Cubic Meter	\N	Transactional price	\N	Boa Vista	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1397	0.8	2015	Cubic Meter	\N	Transactional price	\N	Vit�ria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1398	0.76	2015	Cubic Meter	\N	Transactional price	\N	Marechal C�ndido Rondon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1399	0.87	2015	Cubic Meter	\N	Transactional price	\N	Joa�aba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1400	0.56	2015	Cubic Meter	\N	Transactional price	\N	Aracruz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1401	0.42	2015	Cubic Meter	\N	Transactional price	\N	Oliveira	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1402	0.8	2015	Cubic Meter	\N	Transactional price	\N	Leme	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1403	0.85	2013	Cubic Meter	\N	Transactional price	\N	Mat�o	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1404	0.69	2015	Cubic Meter	\N	Transactional price	\N	Jacare�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1405	0.89	2015	Cubic Meter	\N	Transactional price	\N	Rio de Janeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1406	1	2015	Cubic Meter	\N	Transactional price	\N	Natal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1407	0.52	2011	Cubic Meter	\N	Transactional price	\N	Cod�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1408	0.63	2014	Cubic Meter	\N	Transactional price	\N	Caxias	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1409	1.02	2011	Cubic Meter	\N	Transactional price	\N	Catu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1410	0.9	2013	Cubic Meter	\N	Transactional price	\N	Est�ncia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1411	2.1	2015	Cubic Meter	\N	Transactional price	\N	Cabo Frio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1412	2	2015	Cubic Meter	\N	Transactional price	\N	Araruama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1413	0.74	2015	Cubic Meter	\N	Transactional price	\N	Morada Nova	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1414	0.76	2013	Cubic Meter	\N	Transactional price	\N	Macarani	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1415	0.91	2015	Cubic Meter	\N	Transactional price	\N	Penedo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1416	0.75	2015	Cubic Meter	\N	Transactional price	\N	Ribeir�o	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1417	0.39	2015	Cubic Meter	\N	Transactional price	\N	Formiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1418	0.64	2014	Cubic Meter	\N	Transactional price	\N	Coqueiral	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1419	0.56	2014	Cubic Meter	\N	Transactional price	\N	Gar�a	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1420	0.67	2015	Cubic Meter	\N	Transactional price	\N	Guarulhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1421	0.42	2015	Cubic Meter	\N	Transactional price	\N	Mogi Gua�u	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1422	0.51	2015	Cubic Meter	\N	Transactional price	\N	Governador Valadares	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1423	0.4	2015	Cubic Meter	\N	Transactional price	\N	Gua�u�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1424	0.66	2015	Cubic Meter	\N	Transactional price	\N	Ourinhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1425	0.64	2015	Cubic Meter	\N	Transactional price	\N	Pirapora	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1426	1.02	2015	Cubic Meter	\N	Transactional price	\N	Pa�o do Lumiar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1427	0.46	2015	Cubic Meter	\N	Transactional price	\N	Araguatins	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1428	0.93	2012	Cubic Meter	\N	Transactional price	\N	Nova Xavantina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1429	0.44	2016	Cubic Meter	\N	Transactional price	\N	Linhares	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1430	0.37	2015	Cubic Meter	\N	Transactional price	\N	Ita�na	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1431	0.8	2016	Cubic Meter	\N	Transactional price	\N	S�o Miguel do Guam�/PA	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1432	0.27	2016	Cubic Meter	\N	Transactional price	\N	1s de Lind�ia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1433	0.39	2016	Cubic Meter	\N	Transactional price	\N	Galileia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1434	0.43	2015	Cubic Meter	\N	Transactional price	\N	Vicosa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1435	0.18	2016	Cubic Meter	\N	Transactional price	\N	Casimiro de Abreu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1436	0.37	2016	Cubic Meter	\N	Transactional price	\N	Cruzeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1437	0.66	2016	Cubic Meter	\N	Transactional price	\N	Itabirito	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1438	0.68	2015	Cubic Meter	\N	Transactional price	\N	Jataizinho	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1439	0.76	2014	Cubic Meter	\N	Transactional price	\N	Lagoa Formosa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1440	0.65	2015	Cubic Meter	\N	Transactional price	\N	Porto Feliz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1441	0.4	2015	Cubic Meter	\N	Transactional price	\N	Sacramento	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1442	0.48	2016	Cubic Meter	\N	Transactional price	\N	S�o Carlos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1443	0.41	2016	Cubic Meter	\N	Transactional price	\N	Sorocaba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1444	0.44	2016	Cubic Meter	\N	Transactional price	\N	Volta Redonda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1445	2.06	2016	Cubic Meter	\N	Transactional price	\N	Porto Alegre	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1446	0.56	2015	Cubic Meter	\N	Transactional price	\N	Macap�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1447	0.49	2016	Cubic Meter	\N	Transactional price	\N	Bel�m	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1448	1.09	2016	Cubic Meter	\N	Transactional price	\N	Curitiba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1449	0.84	2016	Cubic Meter	\N	Transactional price	\N	Joa�aba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1450	1.84	2016	Cubic Meter	\N	Transactional price	\N	Cabo Frio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1451	1.58	2016	Cubic Meter	\N	Transactional price	\N	Araruama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1452	0.65	2016	Cubic Meter	\N	Transactional price	\N	Ourinhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1453	1.02	2016	Cubic Meter	\N	Transactional price	\N	State of Piau�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1454	0.86	2016	Cubic Meter	\N	Transactional price	\N	Fortaleza	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1455	0.9	2016	Cubic Meter	\N	Transactional price	\N	Jo�o Pessoa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1456	1.62	2016	Cubic Meter	\N	Transactional price	\N	Macei�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1457	0.98	2016	Cubic Meter	\N	Transactional price	\N	Recife	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1458	1.09	2016	Cubic Meter	\N	Transactional price	\N	Aracaju	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1459	1.14	2016	Cubic Meter	\N	Transactional price	\N	Salvador	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1460	1.02	2016	Cubic Meter	\N	Transactional price	\N	Rio de Janeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1461	0.97	2016	Cubic Meter	\N	Transactional price	\N	Vit�ria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1462	1.14	2016	Cubic Meter	\N	Transactional price	\N	Belo Horizonte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1463	0.77	2016	Cubic Meter	\N	Transactional price	\N	S�o Paulo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1464	1.59	2016	Cubic Meter	\N	Transactional price	\N	Florian�polis	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1465	1.03	2016	Cubic Meter	\N	Transactional price	\N	Bras�lia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1466	1.47	2016	Cubic Meter	\N	Transactional price	\N	Goi�nia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1467	1.39	2016	Cubic Meter	\N	Transactional price	\N	Campo Grande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1468	0.72	2016	Cubic Meter	\N	Transactional price	\N	Marechal C�ndido Rondon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1469	1.1	2016	Cubic Meter	\N	Transactional price	\N	Capinzal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1470	0.78	2016	Cubic Meter	\N	Transactional price	\N	Limoeiro do Norte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1471	0.41	2016	Cubic Meter	\N	Transactional price	\N	Macarani	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1472	0.25	2016	Cubic Meter	\N	Transactional price	\N	Campo Belo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1473	0.38	2016	Cubic Meter	\N	Transactional price	\N	Formiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1474	0.6	2016	Cubic Meter	\N	Transactional price	\N	Gar�a	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1475	0.47	2016	Cubic Meter	\N	Transactional price	\N	Gua�u�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1476	0.98	2015	Cubic Meter	\N	Transactional price	\N	S�o Paulo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1477	2.07	2015	Cubic Meter	\N	Transactional price	\N	Florian�polis	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1478	0.9	2012	Cubic Meter	\N	Transactional price	\N	Macap�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1479	1.66	2008	Cubic Meter	\N	Transactional price	\N	Bel�m	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1480	1.78	2015	Cubic Meter	\N	Transactional price	\N	State of Piau�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1481	1.81	2014	Cubic Meter	\N	Transactional price	\N	Fortaleza	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1482	2.24	2015	Cubic Meter	\N	Transactional price	\N	Macei�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1483	1.42	2015	Cubic Meter	\N	Transactional price	\N	Porto Velho	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1484	1.73	2015	Cubic Meter	\N	Transactional price	\N	Jo�o Pessoa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1485	1.59	2015	Cubic Meter	\N	Transactional price	\N	Recife	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1486	1.54	2015	Cubic Meter	\N	Transactional price	\N	Curitiba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1487	2.62	2015	Cubic Meter	\N	Transactional price	\N	Bras�lia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1488	1.38	2015	Cubic Meter	\N	Transactional price	\N	Limoeiro do Norte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1489	1.81	2015	Cubic Meter	\N	Transactional price	\N	Campo Grande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1490	2.85	2015	Cubic Meter	\N	Transactional price	\N	Aracaju	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1491	2.35	2015	Cubic Meter	\N	Transactional price	\N	Salvador	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1492	1.97	2015	Cubic Meter	\N	Transactional price	\N	Belo Horizonte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1493	1.34	2015	Cubic Meter	\N	Transactional price	\N	Goi�nia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1494	1.36	2015	Cubic Meter	\N	Transactional price	\N	Itapemirim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1495	1.66	2015	Cubic Meter	\N	Transactional price	\N	Capinzal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1496	0.51	2015	Cubic Meter	\N	Transactional price	\N	Boa Vista	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1497	1.44	2015	Cubic Meter	\N	Transactional price	\N	Vit�ria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1498	0.87	2015	Cubic Meter	\N	Transactional price	\N	Marechal C�ndido Rondon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1499	1.23	2015	Cubic Meter	\N	Transactional price	\N	Joa�aba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1500	0.8	2015	Cubic Meter	\N	Transactional price	\N	Aracruz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1501	0.7	2015	Cubic Meter	\N	Transactional price	\N	Oliveira	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1502	1.14	2015	Cubic Meter	\N	Transactional price	\N	Leme	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1503	1.35	2013	Cubic Meter	\N	Transactional price	\N	Mat�o	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1504	1.07	2015	Cubic Meter	\N	Transactional price	\N	Jacare�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1505	2.2	2015	Cubic Meter	\N	Transactional price	\N	Rio de Janeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1506	1.37	2015	Cubic Meter	\N	Transactional price	\N	Natal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1507	0.16	2011	Cubic Meter	\N	Transactional price	\N	Cod�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1508	0.87	2014	Cubic Meter	\N	Transactional price	\N	Caxias	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1509	1.19	2011	Cubic Meter	\N	Transactional price	\N	Catu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1510	2.34	2013	Cubic Meter	\N	Transactional price	\N	Est�ncia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1511	4.25	2015	Cubic Meter	\N	Transactional price	\N	Cabo Frio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1512	3.98	2015	Cubic Meter	\N	Transactional price	\N	Araruama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1513	1.2	2015	Cubic Meter	\N	Transactional price	\N	Morada Nova	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1514	1.06	2013	Cubic Meter	\N	Transactional price	\N	Macarani	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1515	1.46	2015	Cubic Meter	\N	Transactional price	\N	Penedo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1516	1.6	2015	Cubic Meter	\N	Transactional price	\N	Ribeir�o	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1517	0.51	2015	Cubic Meter	\N	Transactional price	\N	Formiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1518	0.97	2014	Cubic Meter	\N	Transactional price	\N	Coqueiral	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1519	1.42	2014	Cubic Meter	\N	Transactional price	\N	Gar�a	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1520	1.61	2015	Cubic Meter	\N	Transactional price	\N	Guarulhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1521	1.51	2015	Cubic Meter	\N	Transactional price	\N	Mogi Gua�u	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1522	1.2	2015	Cubic Meter	\N	Transactional price	\N	Governador Valadares	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1523	0.54	2015	Cubic Meter	\N	Transactional price	\N	Gua�u�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1524	1.36	2015	Cubic Meter	\N	Transactional price	\N	Ourinhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1525	0.96	2015	Cubic Meter	\N	Transactional price	\N	Pirapora	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1526	2.13	2015	Cubic Meter	\N	Transactional price	\N	Pa�o do Lumiar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1527	0.57	2015	Cubic Meter	\N	Transactional price	\N	Araguatins	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1528	2.06	2012	Cubic Meter	\N	Transactional price	\N	Nova Xavantina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1529	0.63	2016	Cubic Meter	\N	Transactional price	\N	Linhares	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1530	0.61	2015	Cubic Meter	\N	Transactional price	\N	Ita�na	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1531	1.17	2016	Cubic Meter	\N	Transactional price	\N	S�o Miguel do Guam�/PA	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1532	0.6	2016	Cubic Meter	\N	Transactional price	\N	1s de Lind�ia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1533	0.53	2016	Cubic Meter	\N	Transactional price	\N	Galileia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1534	0.95	2015	Cubic Meter	\N	Transactional price	\N	Vicosa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1535	0.37	2016	Cubic Meter	\N	Transactional price	\N	Casimiro de Abreu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1536	0.63	2016	Cubic Meter	\N	Transactional price	\N	Cruzeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1537	0.88	2016	Cubic Meter	\N	Transactional price	\N	Itabirito	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1538	1.15	2015	Cubic Meter	\N	Transactional price	\N	Jataizinho	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1539	1.11	2014	Cubic Meter	\N	Transactional price	\N	Lagoa Formosa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1540	0.91	2015	Cubic Meter	\N	Transactional price	\N	Porto Feliz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1541	0.58	2015	Cubic Meter	\N	Transactional price	\N	Sacramento	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1542	1.05	2016	Cubic Meter	\N	Transactional price	\N	S�o Carlos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1543	0.95	2016	Cubic Meter	\N	Transactional price	\N	Sorocaba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1544	1.12	2016	Cubic Meter	\N	Transactional price	\N	Volta Redonda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1545	1.82	2016	Cubic Meter	\N	Transactional price	\N	Porto Alegre	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1546	0.69	2015	Cubic Meter	\N	Transactional price	\N	Macap�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1547	0.81	2016	Cubic Meter	\N	Transactional price	\N	Bel�m	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1548	1.71	2016	Cubic Meter	\N	Transactional price	\N	Curitiba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1549	1.19	2016	Cubic Meter	\N	Transactional price	\N	Joa�aba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1550	3.72	2016	Cubic Meter	\N	Transactional price	\N	Cabo Frio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1551	3.15	2016	Cubic Meter	\N	Transactional price	\N	Araruama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1552	1.32	2016	Cubic Meter	\N	Transactional price	\N	Ourinhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1553	1.88	2016	Cubic Meter	\N	Transactional price	\N	State of Piau�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1554	1.5	2016	Cubic Meter	\N	Transactional price	\N	Fortaleza	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1555	1.41	2016	Cubic Meter	\N	Transactional price	\N	Jo�o Pessoa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1556	2.57	2016	Cubic Meter	\N	Transactional price	\N	Macei�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1557	1.35	2016	Cubic Meter	\N	Transactional price	\N	Recife	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1558	2.5	2016	Cubic Meter	\N	Transactional price	\N	Aracaju	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1559	2.3	2016	Cubic Meter	\N	Transactional price	\N	Salvador	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1560	2.5	2016	Cubic Meter	\N	Transactional price	\N	Rio de Janeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1561	1.74	2016	Cubic Meter	\N	Transactional price	\N	Vit�ria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1562	2.01	2016	Cubic Meter	\N	Transactional price	\N	Belo Horizonte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1563	1.84	2016	Cubic Meter	\N	Transactional price	\N	S�o Paulo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1564	2.53	2016	Cubic Meter	\N	Transactional price	\N	Florian�polis	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1565	2.31	2016	Cubic Meter	\N	Transactional price	\N	Bras�lia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1566	1.92	2016	Cubic Meter	\N	Transactional price	\N	Goi�nia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1567	2.07	2016	Cubic Meter	\N	Transactional price	\N	Campo Grande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1568	0.91	2016	Cubic Meter	\N	Transactional price	\N	Marechal C�ndido Rondon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1569	1.62	2016	Cubic Meter	\N	Transactional price	\N	Capinzal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1570	1.42	2016	Cubic Meter	\N	Transactional price	\N	Limoeiro do Norte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1571	0.57	2016	Cubic Meter	\N	Transactional price	\N	Macarani	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1572	0.71	2016	Cubic Meter	\N	Transactional price	\N	Campo Belo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1573	0.49	2016	Cubic Meter	\N	Transactional price	\N	Formiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1574	1.34	2016	Cubic Meter	\N	Transactional price	\N	Gar�a	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1575	0.64	2016	Cubic Meter	\N	Transactional price	\N	Gua�u�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1576	1.21	2015	Cubic Meter	\N	Transactional price	\N	S�o Paulo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1577	2.6	2015	Cubic Meter	\N	Transactional price	\N	Florian�polis	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1578	1.22	2012	Cubic Meter	\N	Transactional price	\N	Macap�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1579	2.53	2008	Cubic Meter	\N	Transactional price	\N	Bel�m	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1580	2.1	2015	Cubic Meter	\N	Transactional price	\N	State of Piau�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1581	2.9	2014	Cubic Meter	\N	Transactional price	\N	Fortaleza	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1582	2.47	2015	Cubic Meter	\N	Transactional price	\N	Macei�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1583	1.81	2015	Cubic Meter	\N	Transactional price	\N	Porto Velho	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1584	2.02	2015	Cubic Meter	\N	Transactional price	\N	Jo�o Pessoa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1585	2.23	2015	Cubic Meter	\N	Transactional price	\N	Recife	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1586	1.85	2015	Cubic Meter	\N	Transactional price	\N	Curitiba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1587	3.41	2015	Cubic Meter	\N	Transactional price	\N	Bras�lia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1588	1.96	2015	Cubic Meter	\N	Transactional price	\N	Limoeiro do Norte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1589	2.2	2015	Cubic Meter	\N	Transactional price	\N	Campo Grande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1590	4.34	2015	Cubic Meter	\N	Transactional price	\N	Aracaju	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1591	3.16	2015	Cubic Meter	\N	Transactional price	\N	Salvador	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1592	2.67	2015	Cubic Meter	\N	Transactional price	\N	Belo Horizonte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1593	1.67	2015	Cubic Meter	\N	Transactional price	\N	Goi�nia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1594	1.93	2015	Cubic Meter	\N	Transactional price	\N	Itapemirim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1595	1.98	2015	Cubic Meter	\N	Transactional price	\N	Capinzal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1596	0.51	2015	Cubic Meter	\N	Transactional price	\N	Boa Vista	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1597	1.65	2015	Cubic Meter	\N	Transactional price	\N	Vit�ria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1598	1.08	2015	Cubic Meter	\N	Transactional price	\N	Marechal C�ndido Rondon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1599	1.24	2015	Cubic Meter	\N	Transactional price	\N	Joa�aba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1600	0.91	2015	Cubic Meter	\N	Transactional price	\N	Aracruz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1601	1.07	2015	Cubic Meter	\N	Transactional price	\N	Oliveira	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1602	1.56	2015	Cubic Meter	\N	Transactional price	\N	Leme	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1603	2.49	2013	Cubic Meter	\N	Transactional price	\N	Mat�o	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1604	1.32	2015	Cubic Meter	\N	Transactional price	\N	Jacare�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1605	4.49	2015	Cubic Meter	\N	Transactional price	\N	Rio de Janeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1606	1.75	2015	Cubic Meter	\N	Transactional price	\N	Natal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1607	0.08	2011	Cubic Meter	\N	Transactional price	\N	Cod�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1608	1.09	2014	Cubic Meter	\N	Transactional price	\N	Caxias	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1609	1.39	2011	Cubic Meter	\N	Transactional price	\N	Catu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1610	3.6	2013	Cubic Meter	\N	Transactional price	\N	Est�ncia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1611	6.95	2015	Cubic Meter	\N	Transactional price	\N	Cabo Frio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1612	6.93	2015	Cubic Meter	\N	Transactional price	\N	Araruama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1613	1.02	2015	Cubic Meter	\N	Transactional price	\N	Morada Nova	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1614	1.17	2013	Cubic Meter	\N	Transactional price	\N	Macarani	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1615	1.86	2015	Cubic Meter	\N	Transactional price	\N	Penedo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1616	2.06	2015	Cubic Meter	\N	Transactional price	\N	Ribeir�o	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1617	0.6	2015	Cubic Meter	\N	Transactional price	\N	Formiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1618	1.11	2014	Cubic Meter	\N	Transactional price	\N	Coqueiral	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1619	2.11	2014	Cubic Meter	\N	Transactional price	\N	Gar�a	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1620	2.02	2015	Cubic Meter	\N	Transactional price	\N	Guarulhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1621	1.92	2015	Cubic Meter	\N	Transactional price	\N	Mogi Gua�u	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1622	1.71	2015	Cubic Meter	\N	Transactional price	\N	Governador Valadares	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1623	0.61	2015	Cubic Meter	\N	Transactional price	\N	Gua�u�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1624	1.93	2015	Cubic Meter	\N	Transactional price	\N	Ourinhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1625	1.18	2015	Cubic Meter	\N	Transactional price	\N	Pirapora	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1626	3.4	2015	Cubic Meter	\N	Transactional price	\N	Pa�o do Lumiar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1627	0.7	2015	Cubic Meter	\N	Transactional price	\N	Araguatins	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1628	2.88	2012	Cubic Meter	\N	Transactional price	\N	Nova Xavantina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1629	0.72	2016	Cubic Meter	\N	Transactional price	\N	Linhares	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1630	0.75	2015	Cubic Meter	\N	Transactional price	\N	Ita�na	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1631	1.33	2016	Cubic Meter	\N	Transactional price	\N	S�o Miguel do Guam�/PA	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1632	1.09	2016	Cubic Meter	\N	Transactional price	\N	1s de Lind�ia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1633	0.67	2016	Cubic Meter	\N	Transactional price	\N	Galileia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1634	1.23	2015	Cubic Meter	\N	Transactional price	\N	Vicosa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1635	0.47	2016	Cubic Meter	\N	Transactional price	\N	Casimiro de Abreu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1636	0.79	2016	Cubic Meter	\N	Transactional price	\N	Cruzeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1637	1.11	2016	Cubic Meter	\N	Transactional price	\N	Itabirito	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1638	1.52	2015	Cubic Meter	\N	Transactional price	\N	Jataizinho	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1639	1.33	2014	Cubic Meter	\N	Transactional price	\N	Lagoa Formosa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1640	1.15	2015	Cubic Meter	\N	Transactional price	\N	Porto Feliz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1641	0.74	2015	Cubic Meter	\N	Transactional price	\N	Sacramento	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1642	1.4	2016	Cubic Meter	\N	Transactional price	\N	S�o Carlos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1643	1.19	2016	Cubic Meter	\N	Transactional price	\N	Sorocaba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1644	1.41	2016	Cubic Meter	\N	Transactional price	\N	Volta Redonda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1645	1.77	2016	Cubic Meter	\N	Transactional price	\N	Porto Alegre	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1646	0.94	2015	Cubic Meter	\N	Transactional price	\N	Macap�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1647	1.23	2016	Cubic Meter	\N	Transactional price	\N	Bel�m	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1648	2.05	2016	Cubic Meter	\N	Transactional price	\N	Curitiba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1649	1.2	2016	Cubic Meter	\N	Transactional price	\N	Joa�aba	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1650	6.08	2016	Cubic Meter	\N	Transactional price	\N	Cabo Frio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1651	5.48	2016	Cubic Meter	\N	Transactional price	\N	Araruama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1652	1.88	2016	Cubic Meter	\N	Transactional price	\N	Ourinhos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1653	2.22	2016	Cubic Meter	\N	Transactional price	\N	State of Piau�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1654	2.42	2016	Cubic Meter	\N	Transactional price	\N	Fortaleza	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1655	1.65	2016	Cubic Meter	\N	Transactional price	\N	Jo�o Pessoa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1656	2.84	2016	Cubic Meter	\N	Transactional price	\N	Macei�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1657	1.9	2016	Cubic Meter	\N	Transactional price	\N	Recife	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1658	3.81	2016	Cubic Meter	\N	Transactional price	\N	Aracaju	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1659	3.1	2016	Cubic Meter	\N	Transactional price	\N	Salvador	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1660	5.11	2016	Cubic Meter	\N	Transactional price	\N	Rio de Janeiro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1661	1.99	2016	Cubic Meter	\N	Transactional price	\N	Vit�ria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1662	2.7	2016	Cubic Meter	\N	Transactional price	\N	Belo Horizonte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1663	2.31	2016	Cubic Meter	\N	Transactional price	\N	S�o Paulo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1664	3.19	2016	Cubic Meter	\N	Transactional price	\N	Florian�polis	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1665	3.02	2016	Cubic Meter	\N	Transactional price	\N	Bras�lia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1666	2.4	2016	Cubic Meter	\N	Transactional price	\N	Goi�nia	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1667	2.51	2016	Cubic Meter	\N	Transactional price	\N	Campo Grande	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1668	1.07	2016	Cubic Meter	\N	Transactional price	\N	Marechal C�ndido Rondon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1669	1.93	2016	Cubic Meter	\N	Transactional price	\N	Capinzal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1670	2.03	2016	Cubic Meter	\N	Transactional price	\N	Limoeiro do Norte	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1671	0.63	2016	Cubic Meter	\N	Transactional price	\N	Macarani	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1672	0.96	2016	Cubic Meter	\N	Transactional price	\N	Campo Belo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1673	0.58	2016	Cubic Meter	\N	Transactional price	\N	Formiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1674	1.97	2016	Cubic Meter	\N	Transactional price	\N	Gar�a	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1675	0.73	2016	Cubic Meter	\N	Transactional price	\N	Gua�u�	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BRA
1676	3.25	2015	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1677	2.43	2015	Cubic Meter	\N	Transactional price	\N	Sydney	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1678	3	2015	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1679	2.47	2015	Cubic Meter	\N	Transactional price	\N	Barwon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1680	1.58	2015	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1681	1.9	2015	Cubic Meter	\N	Transactional price	\N	Busselton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1682	2.85	2015	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1683	3.29	2015	Cubic Meter	\N	Transactional price	\N	Whyalla	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1684	1.77	2015	Cubic Meter	\N	Transactional price	\N	Bunbury	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1685	2.55	2015	Cubic Meter	\N	Transactional price	\N	Ballina Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1686	2.05	2015	Cubic Meter	\N	Transactional price	\N	Bathhurst	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1687	2.94	2015	Cubic Meter	\N	Transactional price	\N	Bega Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1688	1.95	2015	Cubic Meter	\N	Transactional price	\N	Cairns	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1689	2.24	2015	Cubic Meter	\N	Transactional price	\N	Central Gippsland Region	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1690	2.64	2015	Cubic Meter	\N	Transactional price	\N	Central Highlands Region, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1691	2.66	2015	Cubic Meter	\N	Transactional price	\N	Coffs Harbour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1692	2.62	2015	Cubic Meter	\N	Transactional price	\N	Coliban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1693	2.54	2015	Cubic Meter	\N	Transactional price	\N	Dubbo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1694	2.05	2015	Cubic Meter	\N	Transactional price	\N	Rockhampton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1695	3.22	2015	Cubic Meter	\N	Transactional price	\N	Gosford	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1696	3.23	2015	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1697	1.78	2015	Cubic Meter	\N	Transactional price	\N	Hunter	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1698	3.31	2015	Cubic Meter	\N	Transactional price	\N	Kempsey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1699	4.09	2015	Cubic Meter	\N	Transactional price	\N	Logan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1700	3.16	2015	Cubic Meter	\N	Transactional price	\N	Taree, NSW	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1701	2.49	2015	Cubic Meter	\N	Transactional price	\N	Wodonga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1702	3.96	2018	Cubic Meter	\N	Transactional price	\N	Queanbeyan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1703	3.01	2015	Cubic Meter	\N	Transactional price	\N	Port Macquarie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1704	2.59	2015	Cubic Meter	\N	Transactional price	\N	Alice Springs	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1705	1.67	2015	Cubic Meter	\N	Transactional price	\N	Riverina Water	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1706	1.53	2015	Cubic Meter	\N	Transactional price	\N	Shoalhaven	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1707	3.11	2015	Cubic Meter	\N	Transactional price	\N	Heatherton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1708	2.75	2015	Cubic Meter	\N	Transactional price	\N	Townswille	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1709	2.15	2015	Cubic Meter	\N	Transactional price	\N	Wannon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1710	2.79	2015	Cubic Meter	\N	Transactional price	\N	Mackay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1711	2.78	2015	Cubic Meter	\N	Transactional price	\N	Sunbury, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1712	3.71	2011	Cubic Meter	\N	Transactional price	\N	Westernport	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1713	2.04	2015	Cubic Meter	\N	Transactional price	\N	Wingecarribee Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1714	2.95	2015	Cubic Meter	\N	Transactional price	\N	Yarra Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1715	2.15	2015	Cubic Meter	\N	Transactional price	\N	Launceston	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1716	1.81	2015	Cubic Meter	\N	Transactional price	\N	Caboolture QLD	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1717	2.43	2015	Cubic Meter	\N	Transactional price	\N	Goldenfields	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1718	3.38	2015	Cubic Meter	\N	Transactional price	\N	Toowoomba Regional Council	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1719	3.8	2015	Cubic Meter	\N	Transactional price	\N	City of Gold Coast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1720	2.58	2009	Cubic Meter	\N	Transactional price	\N	Byron	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1721	2.49	2015	Cubic Meter	\N	Transactional price	\N	Bairnsdale VIC	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1722	4.03	2015	Cubic Meter	\N	Transactional price	\N	Ipswich,	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1723	1.57	2016	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1724	3.41	2016	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1725	2.56	2016	Cubic Meter	\N	Transactional price	\N	Dubbo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1726	3.36	2016	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1727	2.83	2016	Cubic Meter	\N	Transactional price	\N	Coliban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1728	3.09	2016	Cubic Meter	\N	Transactional price	\N	Townswille	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1729	2.7	2016	Cubic Meter	\N	Transactional price	\N	Bairnsdale VIC	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1730	3.41	2016	Cubic Meter	\N	Transactional price	\N	Ipswich,	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1731	2.67	2016	Cubic Meter	\N	Transactional price	\N	Goldenfields	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1732	4.15	2016	Cubic Meter	\N	Transactional price	\N	Logan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1733	1.6	2016	Cubic Meter	\N	Transactional price	\N	Shoalhaven	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1734	2.43	2016	Cubic Meter	\N	Transactional price	\N	Ballina Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1735	2.38	2016	Cubic Meter	\N	Transactional price	\N	Barwon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1736	2.9	2016	Cubic Meter	\N	Transactional price	\N	Bega Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1737	2.19	2016	Cubic Meter	\N	Transactional price	\N	Central Gippsland Region	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1738	2.17	2016	Cubic Meter	\N	Transactional price	\N	Central Highlands Region, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1739	2.76	2016	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1740	2.79	2017	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1741	1.6	2016	Cubic Meter	\N	Transactional price	\N	Coffs Harbour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1742	2.52	2016	Cubic Meter	\N	Transactional price	\N	Gosford	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1743	3.19	2016	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1744	1.78	2016	Cubic Meter	\N	Transactional price	\N	Hunter	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1745	2.87	2016	Cubic Meter	\N	Transactional price	\N	Kempsey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1746	3.3	2016	Cubic Meter	\N	Transactional price	\N	Taree, NSW	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1747	2.44	2016	Cubic Meter	\N	Transactional price	\N	Wodonga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1748	2.86	2016	Cubic Meter	\N	Transactional price	\N	Port Macquarie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1749	2.64	2016	Cubic Meter	\N	Transactional price	\N	Alice Springs	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1750	4.02	2017	Cubic Meter	\N	Transactional price	\N	Queanbeyan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1751	3.82	2016	Cubic Meter	\N	Transactional price	\N	Caboolture QLD	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1752	2.1	2016	Cubic Meter	\N	Transactional price	\N	Launceston	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1753	2.69	2016	Cubic Meter	\N	Transactional price	\N	Yarra Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1754	3.03	2016	Cubic Meter	\N	Transactional price	\N	Westernport	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1755	2.18	2016	Cubic Meter	\N	Transactional price	\N	Sunbury, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1756	2.7	2016	Cubic Meter	\N	Transactional price	\N	Mackay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1757	2.06	2016	Cubic Meter	\N	Transactional price	\N	Wannon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1758	1.86	2016	Cubic Meter	\N	Transactional price	\N	Sydney	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1759	2.8	2016	Cubic Meter	\N	Transactional price	\N	Foster, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1760	2.07	2016	Cubic Meter	\N	Transactional price	\N	Heatherton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1761	3.11	2016	Cubic Meter	\N	Transactional price	\N	Whyalla	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1762	0.8	2016	Cubic Meter	\N	Transactional price	\N	Bunbury	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1763	2.08	2016	Cubic Meter	\N	Transactional price	\N	Bathhurst	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1764	2.06	2016	Cubic Meter	\N	Transactional price	\N	Rockhampton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1765	1.7	2016	Cubic Meter	\N	Transactional price	\N	Riverina Water	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1766	2.33	2016	Cubic Meter	\N	Transactional price	\N	Toowoomba Regional Council	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1767	1.61	2016	Cubic Meter	\N	Transactional price	\N	Busselton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1768	3.73	2016	Cubic Meter	\N	Transactional price	\N	City of Gold Coast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1769	1.91	2016	Cubic Meter	\N	Transactional price	\N	Cairns	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1770	1.81	2016	Cubic Meter	\N	Transactional price	\N	Clarence Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1771	2.71	2016	Cubic Meter	\N	Transactional price	\N	Eurobodalla Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1772	3.64	2017	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1773	3.02	2017	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1774	1.53	2017	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1775	3.36	2017	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1776	2.96	2015	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1777	1.89	2015	Cubic Meter	\N	Transactional price	\N	Sydney	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1778	0.9	2015	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1779	1.95	2015	Cubic Meter	\N	Transactional price	\N	Barwon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1780	1.08	2015	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1781	2.05	2015	Cubic Meter	\N	Transactional price	\N	Busselton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1782	2.86	2015	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1783	2.82	2015	Cubic Meter	\N	Transactional price	\N	Whyalla	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1784	1.77	2015	Cubic Meter	\N	Transactional price	\N	Bunbury	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1785	2.23	2015	Cubic Meter	\N	Transactional price	\N	Ballina Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1786	1.99	2015	Cubic Meter	\N	Transactional price	\N	Bathhurst	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1787	2.34	2015	Cubic Meter	\N	Transactional price	\N	Bega Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1788	1.19	2015	Cubic Meter	\N	Transactional price	\N	Cairns	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1789	1.73	2015	Cubic Meter	\N	Transactional price	\N	Central Gippsland Region	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1790	1.95	2015	Cubic Meter	\N	Transactional price	\N	Central Highlands Region, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1791	2.64	2015	Cubic Meter	\N	Transactional price	\N	Coffs Harbour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1792	1.96	2015	Cubic Meter	\N	Transactional price	\N	Coliban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1793	1.79	2015	Cubic Meter	\N	Transactional price	\N	Dubbo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1794	1.15	2015	Cubic Meter	\N	Transactional price	\N	Rockhampton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1795	2.18	2015	Cubic Meter	\N	Transactional price	\N	Gosford	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1796	1.88	2015	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1797	1.73	2015	Cubic Meter	\N	Transactional price	\N	Hunter	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1798	2.69	2015	Cubic Meter	\N	Transactional price	\N	Kempsey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1799	3.21	2015	Cubic Meter	\N	Transactional price	\N	Logan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1800	2.69	2015	Cubic Meter	\N	Transactional price	\N	Taree, NSW	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1801	1.9	2015	Cubic Meter	\N	Transactional price	\N	Wodonga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1802	3.2	2018	Cubic Meter	\N	Transactional price	\N	Queanbeyan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1803	3.5	2015	Cubic Meter	\N	Transactional price	\N	Port Macquarie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1804	1.76	2015	Cubic Meter	\N	Transactional price	\N	Alice Springs	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1805	1.3	2015	Cubic Meter	\N	Transactional price	\N	Riverina Water	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1806	1.3	2015	Cubic Meter	\N	Transactional price	\N	Shoalhaven	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1807	2.74	2015	Cubic Meter	\N	Transactional price	\N	Heatherton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1808	2.8	2015	Cubic Meter	\N	Transactional price	\N	Townswille	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1809	2.26	2015	Cubic Meter	\N	Transactional price	\N	Wannon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1810	2.08	2015	Cubic Meter	\N	Transactional price	\N	Mackay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1811	2.77	2015	Cubic Meter	\N	Transactional price	\N	Sunbury, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1812	2.55	2011	Cubic Meter	\N	Transactional price	\N	Westernport	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1813	2	2015	Cubic Meter	\N	Transactional price	\N	Wingecarribee Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1814	3.06	2015	Cubic Meter	\N	Transactional price	\N	Yarra Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1815	1.17	2015	Cubic Meter	\N	Transactional price	\N	Launceston	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1816	1.16	2015	Cubic Meter	\N	Transactional price	\N	Caboolture QLD	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1817	1.9	2015	Cubic Meter	\N	Transactional price	\N	Goldenfields	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1818	2.88	2015	Cubic Meter	\N	Transactional price	\N	Toowoomba Regional Council	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1819	3.17	2015	Cubic Meter	\N	Transactional price	\N	City of Gold Coast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1820	1.91	2009	Cubic Meter	\N	Transactional price	\N	Byron	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1821	1.83	2015	Cubic Meter	\N	Transactional price	\N	Bairnsdale VIC	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1822	3.35	2015	Cubic Meter	\N	Transactional price	\N	Ipswich,	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1823	1.08	2016	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1824	3.11	2016	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1825	1.8	2016	Cubic Meter	\N	Transactional price	\N	Dubbo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1826	1.01	2016	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1827	2.11	2016	Cubic Meter	\N	Transactional price	\N	Coliban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1828	3.13	2016	Cubic Meter	\N	Transactional price	\N	Townswille	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1829	2	2016	Cubic Meter	\N	Transactional price	\N	Bairnsdale VIC	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1830	3.11	2016	Cubic Meter	\N	Transactional price	\N	Ipswich,	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1831	2.08	2016	Cubic Meter	\N	Transactional price	\N	Goldenfields	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1832	3.26	2016	Cubic Meter	\N	Transactional price	\N	Logan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1833	1.37	2016	Cubic Meter	\N	Transactional price	\N	Shoalhaven	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1834	2.19	2016	Cubic Meter	\N	Transactional price	\N	Ballina Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1835	1.88	2016	Cubic Meter	\N	Transactional price	\N	Barwon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1836	2.3	2016	Cubic Meter	\N	Transactional price	\N	Bega Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1837	1.7	2016	Cubic Meter	\N	Transactional price	\N	Central Gippsland Region	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1838	1.79	2016	Cubic Meter	\N	Transactional price	\N	Central Highlands Region, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1839	2.77	2016	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1840	2.33	2017	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1841	1.38	2016	Cubic Meter	\N	Transactional price	\N	Coffs Harbour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1842	1.95	2016	Cubic Meter	\N	Transactional price	\N	Gosford	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1843	1.85	2016	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1844	1.71	2016	Cubic Meter	\N	Transactional price	\N	Hunter	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1845	2.5	2016	Cubic Meter	\N	Transactional price	\N	Kempsey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1846	2.82	2016	Cubic Meter	\N	Transactional price	\N	Taree, NSW	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1847	1.86	2016	Cubic Meter	\N	Transactional price	\N	Wodonga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1848	3.42	2016	Cubic Meter	\N	Transactional price	\N	Port Macquarie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1849	1.79	2016	Cubic Meter	\N	Transactional price	\N	Alice Springs	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1850	3.25	2017	Cubic Meter	\N	Transactional price	\N	Queanbeyan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1851	3.17	2016	Cubic Meter	\N	Transactional price	\N	Caboolture QLD	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1852	1.15	2016	Cubic Meter	\N	Transactional price	\N	Launceston	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1853	2.91	2016	Cubic Meter	\N	Transactional price	\N	Yarra Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1854	1.93	2016	Cubic Meter	\N	Transactional price	\N	Westernport	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1855	2.2	2016	Cubic Meter	\N	Transactional price	\N	Sunbury, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1856	2.01	2016	Cubic Meter	\N	Transactional price	\N	Mackay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1857	2.17	2016	Cubic Meter	\N	Transactional price	\N	Wannon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1858	1.6	2016	Cubic Meter	\N	Transactional price	\N	Sydney	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1859	1.95	2016	Cubic Meter	\N	Transactional price	\N	Foster, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1860	2.48	2016	Cubic Meter	\N	Transactional price	\N	Heatherton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1861	2.65	2016	Cubic Meter	\N	Transactional price	\N	Whyalla	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1862	1.45	2016	Cubic Meter	\N	Transactional price	\N	Bunbury	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1863	2.02	2016	Cubic Meter	\N	Transactional price	\N	Bathhurst	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1864	1.15	2016	Cubic Meter	\N	Transactional price	\N	Rockhampton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1865	1.33	2016	Cubic Meter	\N	Transactional price	\N	Riverina Water	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1866	1.73	2016	Cubic Meter	\N	Transactional price	\N	Toowoomba Regional Council	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1867	1.33	2016	Cubic Meter	\N	Transactional price	\N	Busselton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1868	3.11	2016	Cubic Meter	\N	Transactional price	\N	City of Gold Coast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1869	1.17	2016	Cubic Meter	\N	Transactional price	\N	Cairns	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1870	2.03	2016	Cubic Meter	\N	Transactional price	\N	Clarence Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1871	2.65	2016	Cubic Meter	\N	Transactional price	\N	Eurobodalla Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1872	3.29	2017	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1873	0.91	2017	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1874	1.05	2017	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1875	1.95	2017	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1876	2.97	2015	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1877	1.78	2015	Cubic Meter	\N	Transactional price	\N	Sydney	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1878	1.19	2015	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1879	1.84	2015	Cubic Meter	\N	Transactional price	\N	Barwon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1880	0.98	2015	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1881	2.08	2015	Cubic Meter	\N	Transactional price	\N	Busselton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1882	3.04	2015	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1883	2.81	2015	Cubic Meter	\N	Transactional price	\N	Whyalla	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1884	2.06	2015	Cubic Meter	\N	Transactional price	\N	Bunbury	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1885	2.32	2015	Cubic Meter	\N	Transactional price	\N	Ballina Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1886	2.03	2015	Cubic Meter	\N	Transactional price	\N	Bathhurst	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1887	2.21	2015	Cubic Meter	\N	Transactional price	\N	Bega Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1888	1.03	2015	Cubic Meter	\N	Transactional price	\N	Cairns	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1889	1.62	2015	Cubic Meter	\N	Transactional price	\N	Central Gippsland Region	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1890	1.81	2015	Cubic Meter	\N	Transactional price	\N	Central Highlands Region, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1891	2.86	2015	Cubic Meter	\N	Transactional price	\N	Coffs Harbour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1892	1.82	2015	Cubic Meter	\N	Transactional price	\N	Coliban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1893	1.63	2015	Cubic Meter	\N	Transactional price	\N	Dubbo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1894	1.42	2015	Cubic Meter	\N	Transactional price	\N	Rockhampton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1895	1.96	2015	Cubic Meter	\N	Transactional price	\N	Gosford	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1896	1.59	2015	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1897	1.72	2015	Cubic Meter	\N	Transactional price	\N	Hunter	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1898	2.56	2015	Cubic Meter	\N	Transactional price	\N	Kempsey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1899	3.02	2015	Cubic Meter	\N	Transactional price	\N	Logan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1900	2.6	2015	Cubic Meter	\N	Transactional price	\N	Taree, NSW	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1901	1.77	2015	Cubic Meter	\N	Transactional price	\N	Wodonga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1902	3.04	2018	Cubic Meter	\N	Transactional price	\N	Queanbeyan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1903	3.82	2015	Cubic Meter	\N	Transactional price	\N	Port Macquarie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1904	1.58	2015	Cubic Meter	\N	Transactional price	\N	Alice Springs	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1905	1.42	2015	Cubic Meter	\N	Transactional price	\N	Riverina Water	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1906	1.25	2015	Cubic Meter	\N	Transactional price	\N	Shoalhaven	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1907	2.74	2015	Cubic Meter	\N	Transactional price	\N	Heatherton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1908	2.96	2015	Cubic Meter	\N	Transactional price	\N	Townswille	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1909	2.41	2015	Cubic Meter	\N	Transactional price	\N	Wannon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1910	2.02	2015	Cubic Meter	\N	Transactional price	\N	Mackay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1911	3.04	2015	Cubic Meter	\N	Transactional price	\N	Sunbury, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1912	2.46	2011	Cubic Meter	\N	Transactional price	\N	Westernport	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1913	2.02	2015	Cubic Meter	\N	Transactional price	\N	Wingecarribee Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1914	3.27	2015	Cubic Meter	\N	Transactional price	\N	Yarra Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1915	0.96	2015	Cubic Meter	\N	Transactional price	\N	Launceston	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1916	1.09	2015	Cubic Meter	\N	Transactional price	\N	Caboolture QLD	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1917	1.78	2015	Cubic Meter	\N	Transactional price	\N	Goldenfields	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1918	2.77	2015	Cubic Meter	\N	Transactional price	\N	Toowoomba Regional Council	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1919	3.03	2015	Cubic Meter	\N	Transactional price	\N	City of Gold Coast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1920	1.99	2009	Cubic Meter	\N	Transactional price	\N	Byron	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1921	1.69	2015	Cubic Meter	\N	Transactional price	\N	Bairnsdale VIC	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1922	3.38	2015	Cubic Meter	\N	Transactional price	\N	Ipswich,	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1923	0.97	2016	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1924	3.12	2016	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1925	1.64	2016	Cubic Meter	\N	Transactional price	\N	Dubbo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1926	1.33	2016	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1927	1.96	2016	Cubic Meter	\N	Transactional price	\N	Coliban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1928	3.31	2016	Cubic Meter	\N	Transactional price	\N	Townswille	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1929	1.85	2016	Cubic Meter	\N	Transactional price	\N	Bairnsdale VIC	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1930	3.12	2016	Cubic Meter	\N	Transactional price	\N	Ipswich,	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1931	1.96	2016	Cubic Meter	\N	Transactional price	\N	Goldenfields	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1932	3.07	2016	Cubic Meter	\N	Transactional price	\N	Logan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1933	1.32	2016	Cubic Meter	\N	Transactional price	\N	Shoalhaven	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1934	2.3	2016	Cubic Meter	\N	Transactional price	\N	Ballina Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1935	1.78	2016	Cubic Meter	\N	Transactional price	\N	Barwon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1936	2.17	2016	Cubic Meter	\N	Transactional price	\N	Bega Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1937	1.59	2016	Cubic Meter	\N	Transactional price	\N	Central Gippsland Region	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1938	1.71	2016	Cubic Meter	\N	Transactional price	\N	Central Highlands Region, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1939	2.94	2016	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1940	2.23	2017	Cubic Meter	\N	Transactional price	\N	City West	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1941	1.45	2016	Cubic Meter	\N	Transactional price	\N	Coffs Harbour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1942	1.83	2016	Cubic Meter	\N	Transactional price	\N	Gosford	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1943	1.57	2016	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1944	1.69	2016	Cubic Meter	\N	Transactional price	\N	Hunter	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1945	2.49	2016	Cubic Meter	\N	Transactional price	\N	Kempsey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1946	2.72	2016	Cubic Meter	\N	Transactional price	\N	Taree, NSW	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1947	1.74	2016	Cubic Meter	\N	Transactional price	\N	Wodonga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1948	3.75	2016	Cubic Meter	\N	Transactional price	\N	Port Macquarie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1949	1.61	2016	Cubic Meter	\N	Transactional price	\N	Alice Springs	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1950	3.09	2017	Cubic Meter	\N	Transactional price	\N	Queanbeyan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1951	3.1	2016	Cubic Meter	\N	Transactional price	\N	Caboolture QLD	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1952	0.94	2016	Cubic Meter	\N	Transactional price	\N	Launceston	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1953	3.15	2016	Cubic Meter	\N	Transactional price	\N	Yarra Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1954	1.69	2016	Cubic Meter	\N	Transactional price	\N	Westernport	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1955	2.34	2016	Cubic Meter	\N	Transactional price	\N	Sunbury, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1956	1.96	2016	Cubic Meter	\N	Transactional price	\N	Mackay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1957	2.31	2016	Cubic Meter	\N	Transactional price	\N	Wannon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1958	1.54	2016	Cubic Meter	\N	Transactional price	\N	Sydney	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1959	1.77	2016	Cubic Meter	\N	Transactional price	\N	Foster, Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1960	2.65	2016	Cubic Meter	\N	Transactional price	\N	Heatherton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1961	2.63	2016	Cubic Meter	\N	Transactional price	\N	Whyalla	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1962	1.88	2016	Cubic Meter	\N	Transactional price	\N	Bunbury	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1963	2.07	2016	Cubic Meter	\N	Transactional price	\N	Bathhurst	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1964	1.43	2016	Cubic Meter	\N	Transactional price	\N	Rockhampton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1965	1.44	2016	Cubic Meter	\N	Transactional price	\N	Riverina Water	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1966	1.6	2016	Cubic Meter	\N	Transactional price	\N	Toowoomba Regional Council	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1967	1.71	2016	Cubic Meter	\N	Transactional price	\N	Busselton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1968	2.98	2016	Cubic Meter	\N	Transactional price	\N	City of Gold Coast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1969	1.01	2016	Cubic Meter	\N	Transactional price	\N	Cairns	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1970	2.38	2016	Cubic Meter	\N	Transactional price	\N	Clarence Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1971	2.63	2016	Cubic Meter	\N	Transactional price	\N	Eurobodalla Shire	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1972	3.28	2017	Cubic Meter	\N	Transactional price	\N	Brisbane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1973	1.19	2017	Cubic Meter	\N	Transactional price	\N	Townsville	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1974	0.95	2017	Cubic Meter	\N	Transactional price	\N	Goulburn Valley	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1975	1.65	2017	Cubic Meter	\N	Transactional price	\N	Horsham	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	AUS
1976	2.43	2015	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1977	2.01	2015	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1978	1.41	2015	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1979	2.47	2015	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1980	1.88	2015	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1981	1.17	2014	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1982	1.17	2015	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1983	1.53	2016	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1984	1.12	2016	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1985	1.54	2016	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1986	1.92	2016	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1987	1.74	2014	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1988	1.53	2016	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1989	1.7	2015	Cubic Meter	\N	Transactional price	\N	Halifax	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1990	1.52	2016	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1991	1.97	2016	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1992	2.08	2016	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1993	2.42	2016	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1994	1.44	2015	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1995	2.41	2016	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1996	0.93	2016	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1997	1.02	2016	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1998	2.05	2016	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
1999	2.02	2016	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2000	1.51	2015	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2001	1.68	2016	Cubic Meter	\N	Transactional price	\N	Halifax	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2002	1.37	2016	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2003	1.41	2016	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2004	2.51	2017	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2005	0.99	2017	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2006	1.09	2017	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2007	1.47	2016	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2008	2.07	2017	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2009	2.09	2017	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2010	1.64	2017	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2011	1.21	2017	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2012	1.95	2017	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2013	1.57	2017	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2014	2.39	2017	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2015	1.38	2017	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2016	2.04	2017	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2017	1.7	2017	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2018	1.49	2017	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2019	1.62	2017	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2020	2.07	2017	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2021	1.33	2017	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2022	2.64	2017	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2023	2.14	2018	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2024	1.79	2018	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2025	1.34	2018	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2026	1.86	2018	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2027	2.7	2018	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2028	2.37	2018	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2029	1.09	2018	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2030	2.15	2018	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2031	1.82	2018	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2032	1.23	2018	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2033	1.64	2018	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2034	2.27	2018	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2035	2.1	2018	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2036	1.56	2018	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2037	2.9	2018	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2038	1.61	2018	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2039	1.45	2018	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2040	1.92	2019	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2041	1.3	2019	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2042	2.04	2019	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2043	1.73	2019	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2044	2.7	2019	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2045	2.17	2019	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2046	2.83	2019	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2047	1.04	2019	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2048	1.21	2019	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2049	2.53	2019	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2050	1.85	2019	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2051	1.54	2019	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2052	2.09	2019	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2053	1.69	2019	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2054	1.64	2019	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2055	2.68	2020	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2056	1.94	2020	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2057	1.77	2020	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2058	2.19	2020	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2059	1.85	2020	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2060	2.85	2020	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2061	3.06	2020	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2062	1.13	2020	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2063	2.36	2020	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2064	1.37	2020	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2065	1.42	2020	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2066	1.65	2020	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2067	2.36	2020	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2068	1.44	2019	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2069	1.49	2020	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2070	2.09	2020	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2071	1.92	2020	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2072	1.42	2020	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2073	1.75	2020	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2074	1.92	2021	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2075	1.84	2021	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2076	1.8	2015	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2077	1.84	2015	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2078	1.41	2015	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2079	1.18	2015	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2080	1.44	2015	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2081	0.94	2014	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2082	0.88	2015	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2083	1.26	2016	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2084	1.03	2016	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2085	1.54	2016	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2086	1.62	2016	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2087	1.32	2014	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2088	1.09	2016	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2089	1	2015	Cubic Meter	\N	Transactional price	\N	Halifax	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2090	0.96	2016	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2091	0.97	2016	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2092	1.76	2016	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2093	1.64	2016	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2094	1.92	2015	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2095	1.15	2016	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2096	0.75	2016	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2097	0.77	2016	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2098	1.52	2016	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2099	1.85	2016	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2100	1.15	2015	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2101	1.03	2016	Cubic Meter	\N	Transactional price	\N	Halifax	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2102	1.82	2016	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2103	1.08	2016	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2104	1.2	2017	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2105	0.8	2017	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2106	0.82	2017	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2107	1.35	2016	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2108	1.53	2017	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2109	1.56	2017	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2110	1.36	2017	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2111	1.11	2017	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2112	1.7	2017	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2113	0.99	2017	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2114	2.06	2017	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2115	1.38	2017	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2116	1.86	2017	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2117	1.7	2017	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2118	1.15	2017	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2119	1.15	2017	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2120	1.04	2017	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2121	1.77	2017	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2122	1.79	2017	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2123	1.57	2018	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2124	1.5	2018	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2125	1.23	2018	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2126	1.16	2018	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2127	2.33	2018	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2128	1.73	2018	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2129	0.89	2018	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2130	1.87	2018	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2131	1.82	2018	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2132	0.93	2018	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2133	1.27	2018	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2134	1.17	2018	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2135	1.95	2018	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2136	1.56	2018	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2137	1.96	2018	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2138	1.14	2018	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2139	1.93	2018	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2140	1.4	2019	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2141	1.19	2019	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2142	1.78	2019	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2143	1.08	2019	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2144	1.83	2019	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2145	1.11	2019	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2146	2.43	2019	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2147	0.85	2019	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2148	0.93	2019	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2149	1.21	2019	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2150	1.85	2019	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2151	1.21	2019	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2152	1.94	2019	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2153	1.41	2019	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2154	1.17	2019	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2155	1.28	2020	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2156	1.4	2020	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2157	1.48	2020	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2158	1.91	2020	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2159	1.08	2020	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2160	1.92	2020	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2161	2.64	2020	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2162	0.93	2020	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2163	1.21	2020	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2164	1.06	2020	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2165	1.31	2020	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2166	1.3	2020	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2167	1.68	2020	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2168	1.92	2019	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2169	1.98	2020	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2170	1.9	2020	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2171	1.92	2020	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2172	1.3	2020	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2173	1.24	2020	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2174	1.37	2021	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2175	1.55	2021	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2176	1.66	2015	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2177	1.92	2015	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2178	1.41	2015	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2179	1.18	2015	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2180	1.34	2015	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2181	0.89	2014	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2182	0.82	2015	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2183	1.2	2016	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2184	1.01	2016	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2185	1.54	2016	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2186	1.21	2016	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2187	1.23	2014	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2188	1	2016	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2189	0.85	2015	Cubic Meter	\N	Transactional price	\N	Halifax	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2190	0.84	2016	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2191	0.76	2016	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2192	1.77	2016	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2193	1.47	2016	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2194	2.52	2015	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2195	1.15	2016	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2196	0.71	2016	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2197	0.71	2016	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2198	1.4	2016	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2199	1.94	2016	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2200	1.07	2015	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2201	0.89	2016	Cubic Meter	\N	Transactional price	\N	Halifax	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2202	2.39	2016	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2203	1.01	2016	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2204	1.2	2017	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2205	0.76	2017	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2206	0.76	2017	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2207	1.32	2016	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2208	1.42	2017	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2209	1.44	2017	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2210	1.3	2017	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2211	1.09	2017	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2212	1.28	2017	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2213	0.87	2017	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2214	2.08	2017	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2215	1.38	2017	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2216	1.94	2017	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2217	1.7	2017	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2218	1.07	2017	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2219	1.05	2017	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2220	0.82	2017	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2221	2.32	2017	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2222	1.61	2017	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2223	1.45	2018	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2224	1.43	2018	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2225	1.21	2018	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2226	0.95	2018	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2227	2.35	2018	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2228	1.59	2018	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2229	0.84	2018	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2230	1.41	2018	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2231	1.82	2018	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2232	0.87	2018	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2233	1.19	2018	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2234	0.93	2018	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2235	2.05	2018	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2236	1.56	2018	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2237	1.76	2018	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2238	1.04	2018	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2239	2.54	2018	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2240	1.29	2019	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2241	1.16	2019	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2242	1.34	2019	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2243	0.89	2019	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2244	1.65	2019	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2245	0.89	2019	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2246	2.46	2019	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2247	0.81	2019	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2248	0.87	2019	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2249	1.21	2019	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2250	1.85	2019	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2251	1.14	2019	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2252	2.04	2019	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2253	1.37	2019	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2254	1.07	2019	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2255	1.28	2020	Cubic Meter	\N	Transactional price	\N	Burnaby	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2256	1.28	2020	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2257	1.42	2020	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2258	1.43	2020	Cubic Meter	\N	Transactional price	\N	London	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2259	0.91	2020	Cubic Meter	\N	Transactional price	\N	Oshawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2260	1.72	2020	Cubic Meter	\N	Transactional price	\N	Regina	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2261	2.68	2020	Cubic Meter	\N	Transactional price	\N	Saskatoon	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2262	0.89	2020	Cubic Meter	\N	Transactional price	\N	Surrey	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2263	0.97	2020	Cubic Meter	\N	Transactional price	\N	Windsor	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2264	1	2020	Cubic Meter	\N	Transactional price	\N	Vancouver	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2265	1.28	2020	Cubic Meter	\N	Transactional price	\N	Hamilton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2266	1.23	2020	Cubic Meter	\N	Transactional price	\N	Victoria	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2267	1.53	2020	Cubic Meter	\N	Transactional price	\N	Winnipeg	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2268	2.52	2019	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2269	2.61	2020	Cubic Meter	\N	Transactional price	\N	Barrie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2270	1.99	2020	Cubic Meter	\N	Transactional price	\N	Edmonton	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2271	1.92	2020	Cubic Meter	\N	Transactional price	\N	Kitchener	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2272	1.29	2020	Cubic Meter	\N	Transactional price	\N	Ottawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2273	1.13	2020	Cubic Meter	\N	Transactional price	\N	St. Catharines	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2274	1.25	2021	Cubic Meter	\N	Transactional price	\N	Calgary	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2275	1.49	2021	Cubic Meter	\N	Transactional price	\N	Guelph	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	CAN
2276	0.1	2015	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2277	0.1	2015	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2278	0.1	2015	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2279	0.1	2015	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2280	0.1	2015	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2281	0.1	2015	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2282	0.1	2015	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2283	0.1	2015	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2284	0.14	2016	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2285	0.14	2016	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2286	0.27	2017	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2287	0.27	2017	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2288	0.14	2017	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2289	0.14	2017	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2290	0.27	2017	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2291	0.14	2017	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2292	0.3	2017	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2293	0.3	2017	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2294	0.3	2017	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2295	0.3	2017	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2296	0.29	2018	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2297	0.3	2017	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2298	0.28	2017	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2299	0.4	2018	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2300	0.4	2018	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2301	0.4	2018	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2302	0.4	2018	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2303	0.38	2018	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2304	0.4	2018	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2305	0.4	2018	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2306	0.4	2018	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2307	0.4	2018	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2308	0.4	2018	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2309	0.4	2018	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2310	0.4	2018	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2311	0.4	2018	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2312	0.32	2018	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2313	0.4	2018	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2314	0.3	2017	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2315	0.39	2019	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2316	0.39	2019	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2317	0.39	2019	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2318	0.39	2019	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2319	0.39	2019	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2320	0.39	2019	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2321	0.39	2019	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2322	0.39	2019	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2323	0.39	2019	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2324	0.39	2019	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2325	0.39	2019	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2326	0.39	2019	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2327	0.43	2020	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2328	0.44	2020	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2329	0.43	2020	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2330	0.44	2020	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2331	0.44	2020	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2332	0.43	2020	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2333	0.42	2020	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2334	0.44	2020	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2335	0.44	2020	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2336	0.43	2020	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2337	0.44	2020	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2338	0.39	2019	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2339	0.44	2020	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2340	0.52	2020	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2341	0.4	2021	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2342	0.4	2021	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2343	0.4	2021	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2344	0.4	2021	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2345	0.4	2021	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2346	0.4	2021	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2347	0.4	2021	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2348	0.4	2021	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2349	0.4	2021	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2350	0.4	2021	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2351	0.4	2021	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2352	0.36	2021	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2353	0.4	2021	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2354	0.4	2021	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2355	0.41	2021	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2356	0.4	2015	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2357	0.29	2015	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2358	0.35	2015	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2359	0.44	2015	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2360	0.42	2015	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2361	0.4	2015	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2362	0.43	2015	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2363	0.44	2015	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2364	0.32	2016	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2365	0.27	2016	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2366	0.36	2017	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2367	0.37	2017	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2368	0.3	2017	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2369	0.28	2017	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2370	0.37	2017	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2371	0.33	2017	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2372	0.37	2017	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2373	0.38	2017	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2374	0.37	2017	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2375	0.38	2017	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2376	0.35	2018	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2377	0.38	2017	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2378	0.39	2017	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2379	0.4	2018	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2380	0.4	2018	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2381	0.43	2018	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2382	0.44	2018	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2383	0.41	2018	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2384	0.43	2018	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2385	0.44	2018	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2386	0.44	2018	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2387	0.43	2018	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2388	0.43	2018	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2389	0.4	2018	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2390	0.43	2018	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2391	0.4	2018	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2392	0.38	2018	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2393	0.4	2018	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2394	0.37	2017	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2395	0.4	2019	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2396	0.4	2019	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2397	0.42	2019	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2398	0.4	2019	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2399	0.39	2019	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2400	0.41	2019	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2401	0.42	2019	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2402	0.41	2019	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2403	0.41	2019	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2404	0.42	2019	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2405	0.4	2019	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2406	0.41	2019	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2407	0.43	2020	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2408	0.46	2020	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2409	0.43	2020	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2410	0.48	2020	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2411	0.47	2020	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2412	0.43	2020	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2413	0.42	2020	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2414	0.46	2020	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2415	0.49	2020	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2416	0.43	2020	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2417	0.47	2020	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2418	0.41	2019	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2419	0.46	2020	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2420	0.57	2020	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2421	0.4	2021	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2422	0.4	2021	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2423	0.43	2021	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2424	0.42	2021	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2425	0.4	2021	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2426	0.43	2021	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2427	0.42	2021	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2428	0.43	2021	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2429	0.4	2021	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2430	0.42	2021	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2431	0.42	2021	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2432	0.36	2021	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2433	0.43	2021	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2434	0.42	2021	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2435	0.44	2021	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2436	0.48	2015	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2437	0.33	2015	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2438	0.41	2015	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2439	0.52	2015	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2440	0.5	2015	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2441	0.48	2015	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2442	0.51	2015	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2443	0.52	2015	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2444	0.37	2016	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2445	0.31	2016	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2446	0.38	2017	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2447	0.4	2017	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2448	0.34	2017	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2449	0.32	2017	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2450	0.4	2017	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2451	0.38	2017	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2452	0.39	2017	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2453	0.41	2017	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2454	0.39	2017	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2455	0.41	2017	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2456	0.36	2018	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2457	0.41	2017	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2458	0.42	2017	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2459	0.4	2018	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2460	0.4	2018	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2461	0.43	2018	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2462	0.45	2018	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2463	0.41	2018	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2464	0.43	2018	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2465	0.44	2018	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2466	0.44	2018	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2467	0.43	2018	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2468	0.43	2018	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2469	0.4	2018	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2470	0.43	2018	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2471	0.4	2018	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2472	0.4	2018	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2473	0.4	2018	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2474	0.39	2017	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2475	0.4	2019	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2476	0.4	2019	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2477	0.42	2019	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2478	0.4	2019	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2479	0.39	2019	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2480	0.42	2019	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2481	0.42	2019	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2482	0.42	2019	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2483	0.42	2019	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2484	0.42	2019	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2485	0.4	2019	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2486	0.42	2019	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2487	0.43	2020	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2488	0.46	2020	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2489	0.43	2020	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2490	0.48	2020	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2491	0.48	2020	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2492	0.43	2020	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2493	0.42	2020	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2494	0.46	2020	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2495	0.5	2020	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2496	0.43	2020	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2497	0.48	2020	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2498	0.42	2019	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2499	0.46	2020	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2500	0.58	2020	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2501	0.4	2021	Cubic Meter	\N	Transactional price	\N	Baranovichy	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2502	0.4	2021	Cubic Meter	\N	Transactional price	\N	Brest	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2503	0.44	2021	Cubic Meter	\N	Transactional price	\N	Gomel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2504	0.43	2021	Cubic Meter	\N	Transactional price	\N	Grodno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2505	0.4	2021	Cubic Meter	\N	Transactional price	\N	Kobrin	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2506	0.44	2021	Cubic Meter	\N	Transactional price	\N	Mogilev	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2507	0.42	2021	Cubic Meter	\N	Transactional price	\N	Molodechno	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2508	0.44	2021	Cubic Meter	\N	Transactional price	\N	Orsha	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2509	0.4	2021	Cubic Meter	\N	Transactional price	\N	Pinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2510	0.43	2021	Cubic Meter	\N	Transactional price	\N	Slonim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2511	0.42	2021	Cubic Meter	\N	Transactional price	\N	Zhodino	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2512	0.36	2021	Cubic Meter	\N	Transactional price	\N	Minsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2513	0.44	2021	Cubic Meter	\N	Transactional price	\N	Vitebsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2514	0.42	2021	Cubic Meter	\N	Transactional price	\N	Borisov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2515	0.45	2021	Cubic Meter	\N	Transactional price	\N	Shklov	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	BLR
2516	0.14	2014	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2517	0.52	2007	Cubic Meter	\N	Transactional price	\N	Dire Dawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2518	0.2	2013	Cubic Meter	\N	Transactional price	\N	Ambo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2519	0.2	2013	Cubic Meter	\N	Transactional price	\N	Debremarkos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2520	0.24	2013	Cubic Meter	\N	Transactional price	\N	Gondar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2521	0.25	2013	Cubic Meter	\N	Transactional price	\N	Dessie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2522	0.33	2013	Cubic Meter	\N	Transactional price	\N	Shashemene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2523	0.19	2013	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2524	0.32	2013	Cubic Meter	\N	Transactional price	\N	Wukro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2525	0.13	2016	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2526	0.11	2019	Cubic Meter	\N	Transactional price	\N	Hawassa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2527	0.18	2019	Cubic Meter	\N	Transactional price	\N	Adama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2528	0.16	2019	Cubic Meter	\N	Transactional price	\N	Bahirdar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2529	0.32	2019	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2530	0.16	2019	Cubic Meter	\N	Transactional price	\N	Harar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2531	0.2	2020	Cubic Meter	\N	Transactional price	\N	Adama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2532	0.1	2019	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2533	0.23	2017	Cubic Meter	\N	Transactional price	\N	Arba Minch	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2534	0.43	2020	Cubic Meter	\N	Transactional price	\N	Asella	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2535	0.32	2018	Cubic Meter	\N	Transactional price	\N	Asossa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2536	0.2	2020	Cubic Meter	\N	Transactional price	\N	Bishoftu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2537	0.3	2019	Cubic Meter	\N	Transactional price	\N	Debrebirihane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2538	0.22	2020	Cubic Meter	\N	Transactional price	\N	Dessie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2539	0.17	2020	Cubic Meter	\N	Transactional price	\N	Dire Dawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2540	0.2	2020	Cubic Meter	\N	Transactional price	\N	Gambela	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2541	0.28	2020	Cubic Meter	\N	Transactional price	\N	Harar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2542	0.17	2020	Cubic Meter	\N	Transactional price	\N	Hawassa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2543	0.16	2020	Cubic Meter	\N	Transactional price	\N	Jimma	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2544	0.18	2020	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2545	0.17	2020	Cubic Meter	\N	Transactional price	\N	Nekemete	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2546	0.08	2020	Cubic Meter	\N	Transactional price	\N	Semera-Logiya	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2547	0.18	2020	Cubic Meter	\N	Transactional price	\N	Shashemene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2548	0.28	2020	Cubic Meter	\N	Transactional price	\N	Welaita Sodo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2549	0.43	2020	Cubic Meter	\N	Transactional price	\N	Degahabour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2550	0.14	2020	Cubic Meter	\N	Transactional price	\N	Jigjiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2551	0.21	2014	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2552	0.65	2007	Cubic Meter	\N	Transactional price	\N	Dire Dawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2553	0.23	2013	Cubic Meter	\N	Transactional price	\N	Ambo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2554	0.25	2013	Cubic Meter	\N	Transactional price	\N	Debremarkos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2555	0.27	2013	Cubic Meter	\N	Transactional price	\N	Gondar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2556	0.36	2013	Cubic Meter	\N	Transactional price	\N	Dessie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2557	0.36	2013	Cubic Meter	\N	Transactional price	\N	Shashemene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2558	0.28	2013	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2559	0.69	2013	Cubic Meter	\N	Transactional price	\N	Wukro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2560	0.21	2016	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2561	0.16	2019	Cubic Meter	\N	Transactional price	\N	Hawassa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2562	0.24	2019	Cubic Meter	\N	Transactional price	\N	Adama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2563	0.23	2019	Cubic Meter	\N	Transactional price	\N	Bahirdar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2564	0.45	2019	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2565	0.3	2019	Cubic Meter	\N	Transactional price	\N	Harar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2566	0.25	2020	Cubic Meter	\N	Transactional price	\N	Adama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2567	0.15	2019	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2568	0.33	2017	Cubic Meter	\N	Transactional price	\N	Arba Minch	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2569	0.58	2020	Cubic Meter	\N	Transactional price	\N	Asella	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2570	0.68	2018	Cubic Meter	\N	Transactional price	\N	Asossa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2571	0.25	2020	Cubic Meter	\N	Transactional price	\N	Bishoftu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2572	0.39	2019	Cubic Meter	\N	Transactional price	\N	Debrebirihane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2573	0.26	2020	Cubic Meter	\N	Transactional price	\N	Dessie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2574	0.28	2020	Cubic Meter	\N	Transactional price	\N	Dire Dawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2575	0.25	2020	Cubic Meter	\N	Transactional price	\N	Gambela	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2576	0.61	2020	Cubic Meter	\N	Transactional price	\N	Harar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2577	0.23	2020	Cubic Meter	\N	Transactional price	\N	Hawassa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2578	0.2	2020	Cubic Meter	\N	Transactional price	\N	Jimma	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2579	0.26	2020	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2580	0.24	2020	Cubic Meter	\N	Transactional price	\N	Nekemete	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2581	0.11	2020	Cubic Meter	\N	Transactional price	\N	Semera-Logiya	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2582	0.21	2020	Cubic Meter	\N	Transactional price	\N	Shashemene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2583	0.35	2020	Cubic Meter	\N	Transactional price	\N	Welaita Sodo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2584	0.43	2020	Cubic Meter	\N	Transactional price	\N	Degahabour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2585	0.24	2020	Cubic Meter	\N	Transactional price	\N	Jigjiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2586	0.25	2014	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2587	0.69	2007	Cubic Meter	\N	Transactional price	\N	Dire Dawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2588	0.24	2013	Cubic Meter	\N	Transactional price	\N	Ambo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2589	0.27	2013	Cubic Meter	\N	Transactional price	\N	Debremarkos	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2590	0.28	2013	Cubic Meter	\N	Transactional price	\N	Gondar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2591	0.4	2013	Cubic Meter	\N	Transactional price	\N	Dessie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2592	0.37	2013	Cubic Meter	\N	Transactional price	\N	Shashemene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2593	0.3	2013	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2594	0.34	2013	Cubic Meter	\N	Transactional price	\N	Wukro	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2595	0.25	2016	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2596	0.18	2019	Cubic Meter	\N	Transactional price	\N	Hawassa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2597	0.26	2019	Cubic Meter	\N	Transactional price	\N	Adama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2598	0.26	2019	Cubic Meter	\N	Transactional price	\N	Bahirdar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2599	0.49	2019	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2600	0.38	2019	Cubic Meter	\N	Transactional price	\N	Harar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2601	0.26	2020	Cubic Meter	\N	Transactional price	\N	Adama	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2602	0.18	2019	Cubic Meter	\N	Transactional price	\N	Addis Ababa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2603	0.36	2017	Cubic Meter	\N	Transactional price	\N	Arba Minch	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2604	0.61	2020	Cubic Meter	\N	Transactional price	\N	Asella	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2605	0.79	2018	Cubic Meter	\N	Transactional price	\N	Asossa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2606	0.26	2020	Cubic Meter	\N	Transactional price	\N	Bishoftu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2607	0.42	2019	Cubic Meter	\N	Transactional price	\N	Debrebirihane	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2608	0.28	2020	Cubic Meter	\N	Transactional price	\N	Dessie	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2609	0.31	2020	Cubic Meter	\N	Transactional price	\N	Dire Dawa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2610	0.27	2020	Cubic Meter	\N	Transactional price	\N	Gambela	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2611	0.71	2020	Cubic Meter	\N	Transactional price	\N	Harar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2612	0.24	2020	Cubic Meter	\N	Transactional price	\N	Hawassa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2613	0.22	2020	Cubic Meter	\N	Transactional price	\N	Jimma	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2614	0.32	2020	Cubic Meter	\N	Transactional price	\N	Mekelle	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2615	0.26	2020	Cubic Meter	\N	Transactional price	\N	Nekemete	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2616	0.12	2020	Cubic Meter	\N	Transactional price	\N	Semera-Logiya	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2617	0.21	2020	Cubic Meter	\N	Transactional price	\N	Shashemene	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2618	0.38	2020	Cubic Meter	\N	Transactional price	\N	Welaita Sodo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2619	0.43	2020	Cubic Meter	\N	Transactional price	\N	Degahabour	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2620	0.27	2020	Cubic Meter	\N	Transactional price	\N	Jigjiga	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	ETH
2621	1.81	2015	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2622	1.81	2015	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2623	1.67	2016	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2624	1.67	2016	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2625	1.64	2017	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2626	1.64	2017	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2627	1.88	2018	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2628	1.88	2018	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2629	1.85	2019	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2630	1.85	2019	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2631	2.92	2019	Cubic Meter	\N	Transactional price	\N	Turku	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2632	2.34	2019	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2633	1.85	2019	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2634	2.08	2019	Cubic Meter	\N	Transactional price	\N	Oulu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2635	2.61	2019	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2636	2.39	2016	Cubic Meter	\N	Transactional price	\N	Lahti	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2637	4.21	2018	Cubic Meter	\N	Transactional price	\N	Jyv�skyl�n	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2638	2.05	2016	Cubic Meter	\N	Transactional price	\N	Salo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2639	2.44	2019	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2640	1.84	2020	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2641	1.84	2020	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2642	2.45	2020	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2643	2.6	2020	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2644	2.2	2020	Cubic Meter	\N	Transactional price	\N	Salo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2645	2.39	2020	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2646	2.86	2019	Cubic Meter	\N	Transactional price	\N	Turku	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2647	1.84	2020	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2648	2.08	2021	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2649	2.08	2021	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2650	2.78	2021	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2651	4.47	2021	Cubic Meter	\N	Transactional price	\N	Jyv�skyl�n	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2652	2.9	2021	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2653	2.3	2021	Cubic Meter	\N	Transactional price	\N	Oulu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2654	2.72	2021	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2655	2.08	2021	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2656	1.68	2015	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2657	1.68	2015	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2658	1.55	2016	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2659	1.55	2016	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2660	1.52	2017	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2661	1.52	2017	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2662	1.75	2018	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2663	1.75	2018	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2664	1.72	2019	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2665	1.72	2019	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2666	2.33	2019	Cubic Meter	\N	Transactional price	\N	Turku	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2667	1.89	2019	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2668	1.72	2019	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2669	1.84	2019	Cubic Meter	\N	Transactional price	\N	Oulu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2670	2.37	2019	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2671	1.87	2016	Cubic Meter	\N	Transactional price	\N	Lahti	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2672	2.91	2018	Cubic Meter	\N	Transactional price	\N	Jyv�skyl�n	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2673	1.86	2016	Cubic Meter	\N	Transactional price	\N	Salo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2674	2.28	2019	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2675	1.71	2020	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2676	1.71	2020	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2677	2.29	2020	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2678	2.37	2020	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2679	2.01	2020	Cubic Meter	\N	Transactional price	\N	Salo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2680	1.88	2020	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2681	2.27	2019	Cubic Meter	\N	Transactional price	\N	Turku	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2682	1.71	2020	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2683	1.93	2021	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2684	1.93	2021	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2685	2.6	2021	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2686	3.06	2021	Cubic Meter	\N	Transactional price	\N	Jyv�skyl�n	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2687	2.64	2021	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2688	2.04	2021	Cubic Meter	\N	Transactional price	\N	Oulu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2689	2.09	2021	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2690	1.93	2021	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2691	1.65	2015	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2692	1.65	2015	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2693	1.53	2016	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2694	1.53	2016	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2695	1.5	2017	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2696	1.5	2017	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2697	1.72	2018	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2698	1.72	2018	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2699	1.69	2019	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2700	1.69	2019	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2701	2.2	2019	Cubic Meter	\N	Transactional price	\N	Turku	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2702	1.8	2019	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2703	1.69	2019	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2704	1.8	2019	Cubic Meter	\N	Transactional price	\N	Oulu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2705	2.32	2019	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2706	1.76	2016	Cubic Meter	\N	Transactional price	\N	Lahti	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2707	2.63	2018	Cubic Meter	\N	Transactional price	\N	Jyv�skyl�n	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2708	1.82	2016	Cubic Meter	\N	Transactional price	\N	Salo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2709	2.25	2019	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2710	1.68	2020	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2711	1.68	2020	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2712	2.26	2020	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2713	2.32	2020	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2714	1.97	2020	Cubic Meter	\N	Transactional price	\N	Salo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2715	1.78	2020	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2716	2.14	2019	Cubic Meter	\N	Transactional price	\N	Turku	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2717	1.68	2020	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2718	1.9	2021	Cubic Meter	\N	Transactional price	\N	Espoo	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2719	1.9	2021	Cubic Meter	\N	Transactional price	\N	Helsinki	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2720	2.56	2021	Cubic Meter	\N	Transactional price	\N	Joensuu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2721	2.75	2021	Cubic Meter	\N	Transactional price	\N	Jyv�skyl�n	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2722	2.58	2021	Cubic Meter	\N	Transactional price	\N	Kuopio	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2723	1.99	2021	Cubic Meter	\N	Transactional price	\N	Oulu	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2724	1.96	2021	Cubic Meter	\N	Transactional price	\N	Tampere	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2725	1.9	2021	Cubic Meter	\N	Transactional price	\N	Vantaa	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	FIN
2726	0.2	2014	Cubic Meter	\N	Transactional price	\N	Bangalore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2727	0.08	2015	Cubic Meter	\N	Transactional price	\N	Chennai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2728	0.42	2015	Cubic Meter	\N	Transactional price	\N	Muglisara, Surat	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2729	0.1	2008	Cubic Meter	\N	Transactional price	\N	Amritsar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2730	0.07	2011	Cubic Meter	\N	Transactional price	\N	Chandigarh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2731	0.25	2015	Cubic Meter	\N	Transactional price	\N	Kolhapur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2732	0.22	2015	Cubic Meter	\N	Transactional price	\N	Delhi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2733	0.31	2015	Cubic Meter	\N	Transactional price	\N	Rajasthan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2734	0.53	2011	Cubic Meter	\N	Transactional price	\N	Khairatabad, Hyderabad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2735	0.23	2014	Cubic Meter	\N	Transactional price	\N	Near Matha Mandir, Bhoapal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2736	0.07	2017	Cubic Meter	\N	Transactional price	\N	Chandigarh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2737	0.34	2017	Cubic Meter	\N	Transactional price	\N	Rajasthan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2738	0.08	2015	Cubic Meter	\N	Transactional price	\N	Nal ghar, Raipur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2739	0.04	2016	Cubic Meter	\N	Transactional price	\N	Visakhapatnam	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2740	0.09	2017	Cubic Meter	\N	Transactional price	\N	Kolkata	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2741	0.1	2014	Cubic Meter	\N	Transactional price	\N	Nagpur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2742	0.07	2016	Cubic Meter	\N	Transactional price	\N	Brihanmumbai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2743	0.1	2013	Cubic Meter	\N	Transactional price	\N	Coimbatore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2744	0.07	2017	Cubic Meter	\N	Transactional price	\N	Gurugram	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2745	0.1	2013	Cubic Meter	\N	Transactional price	\N	Noida	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2746	0.12	2017	Cubic Meter	\N	Transactional price	\N	Guwahati	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2747	0.08	2013	Cubic Meter	\N	Transactional price	\N	Navi Mumbai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2748	0.14	2013	Cubic Meter	\N	Transactional price	\N	Panvel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2749	0.08	2014	Cubic Meter	\N	Transactional price	\N	Sikkim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2750	0.15	2012	Cubic Meter	\N	Transactional price	\N	Hubli-Dharwad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2751	0.16	2008	Cubic Meter	\N	Transactional price	\N	Meghalaya - Urban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2752	0.1	2008	Cubic Meter	\N	Transactional price	\N	Meghalaya - Rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2753	0.04	2017	Cubic Meter	\N	Transactional price	\N	Gandhinagar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2754	0.09	2017	Cubic Meter	\N	Transactional price	\N	Puducherry	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2755	0.03	2017	Cubic Meter	\N	Transactional price	\N	Haryana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2756	0.24	2018	Cubic Meter	\N	Transactional price	\N	Delhi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2757	0.11	2017	Cubic Meter	\N	Transactional price	\N	Aurangabad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2758	0.12	2019	Cubic Meter	\N	Transactional price	\N	Chennai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2759	0.32	2014	Cubic Meter	\N	Transactional price	\N	Bangalore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2760	0.26	2015	Cubic Meter	\N	Transactional price	\N	Chennai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2761	0.12	2015	Cubic Meter	\N	Transactional price	\N	Muglisara, Surat	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2762	0.1	2008	Cubic Meter	\N	Transactional price	\N	Amritsar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2763	0.1	2011	Cubic Meter	\N	Transactional price	\N	Chandigarh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2764	0.15	2015	Cubic Meter	\N	Transactional price	\N	Kolhapur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2765	0.41	2015	Cubic Meter	\N	Transactional price	\N	Delhi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2766	0.14	2015	Cubic Meter	\N	Transactional price	\N	Rajasthan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2767	0.23	2011	Cubic Meter	\N	Transactional price	\N	Khairatabad, Hyderabad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2768	0.23	2014	Cubic Meter	\N	Transactional price	\N	Near Matha Mandir, Bhoapal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2769	0.12	2017	Cubic Meter	\N	Transactional price	\N	Chandigarh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2770	0.15	2017	Cubic Meter	\N	Transactional price	\N	Rajasthan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2771	0.11	2015	Cubic Meter	\N	Transactional price	\N	Nal ghar, Raipur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2772	0.06	2016	Cubic Meter	\N	Transactional price	\N	Visakhapatnam	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2773	0.09	2017	Cubic Meter	\N	Transactional price	\N	Kolkata	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2774	0.16	2014	Cubic Meter	\N	Transactional price	\N	Nagpur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2775	0.07	2016	Cubic Meter	\N	Transactional price	\N	Brihanmumbai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2776	0.11	2013	Cubic Meter	\N	Transactional price	\N	Coimbatore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2777	0.12	2017	Cubic Meter	\N	Transactional price	\N	Gurugram	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2778	0.1	2013	Cubic Meter	\N	Transactional price	\N	Noida	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2779	0.19	2017	Cubic Meter	\N	Transactional price	\N	Guwahati	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2780	0.08	2013	Cubic Meter	\N	Transactional price	\N	Navi Mumbai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2781	0.14	2013	Cubic Meter	\N	Transactional price	\N	Panvel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2782	0.12	2014	Cubic Meter	\N	Transactional price	\N	Sikkim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2783	0.19	2012	Cubic Meter	\N	Transactional price	\N	Hubli-Dharwad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2784	0.16	2008	Cubic Meter	\N	Transactional price	\N	Meghalaya - Urban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2785	0.1	2008	Cubic Meter	\N	Transactional price	\N	Meghalaya - Rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2786	0.04	2017	Cubic Meter	\N	Transactional price	\N	Gandhinagar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2787	0.05	2017	Cubic Meter	\N	Transactional price	\N	Puducherry	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2788	0.03	2017	Cubic Meter	\N	Transactional price	\N	Haryana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2789	0.48	2018	Cubic Meter	\N	Transactional price	\N	Delhi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2790	0.11	2017	Cubic Meter	\N	Transactional price	\N	Aurangabad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2791	0.38	2019	Cubic Meter	\N	Transactional price	\N	Chennai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2792	0.54	2014	Cubic Meter	\N	Transactional price	\N	Bangalore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2793	0.32	2015	Cubic Meter	\N	Transactional price	\N	Chennai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2794	0.15	2015	Cubic Meter	\N	Transactional price	\N	Muglisara, Surat	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2795	0.1	2008	Cubic Meter	\N	Transactional price	\N	Amritsar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2796	0.13	2011	Cubic Meter	\N	Transactional price	\N	Chandigarh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2797	0.13	2015	Cubic Meter	\N	Transactional price	\N	Kolhapur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2798	0.49	2015	Cubic Meter	\N	Transactional price	\N	Delhi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2799	0.11	2015	Cubic Meter	\N	Transactional price	\N	Rajasthan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2800	0.37	2011	Cubic Meter	\N	Transactional price	\N	Khairatabad, Hyderabad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2801	0.23	2014	Cubic Meter	\N	Transactional price	\N	Near Matha Mandir, Bhoapal	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2802	0.13	2017	Cubic Meter	\N	Transactional price	\N	Chandigarh	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2803	0.12	2017	Cubic Meter	\N	Transactional price	\N	Rajasthan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2804	0.13	2015	Cubic Meter	\N	Transactional price	\N	Nal ghar, Raipur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2805	0.06	2016	Cubic Meter	\N	Transactional price	\N	Visakhapatnam	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2806	0.09	2017	Cubic Meter	\N	Transactional price	\N	Kolkata	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2807	0.21	2014	Cubic Meter	\N	Transactional price	\N	Nagpur	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2808	0.07	2016	Cubic Meter	\N	Transactional price	\N	Brihanmumbai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2809	0.12	2013	Cubic Meter	\N	Transactional price	\N	Coimbatore	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2810	0.13	2017	Cubic Meter	\N	Transactional price	\N	Gurugram	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2811	0.1	2013	Cubic Meter	\N	Transactional price	\N	Noida	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2812	0.21	2017	Cubic Meter	\N	Transactional price	\N	Guwahati	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2813	0.08	2013	Cubic Meter	\N	Transactional price	\N	Navi Mumbai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2814	0.14	2013	Cubic Meter	\N	Transactional price	\N	Panvel	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2815	0.21	2014	Cubic Meter	\N	Transactional price	\N	Sikkim	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2816	0.2	2012	Cubic Meter	\N	Transactional price	\N	Hubli-Dharwad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2817	0.16	2008	Cubic Meter	\N	Transactional price	\N	Meghalaya - Urban	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2818	0.1	2008	Cubic Meter	\N	Transactional price	\N	Meghalaya - Rural	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2819	0.04	2017	Cubic Meter	\N	Transactional price	\N	Gandhinagar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2820	0.05	2017	Cubic Meter	\N	Transactional price	\N	Puducherry	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2821	0.03	2017	Cubic Meter	\N	Transactional price	\N	Haryana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2822	0.59	2018	Cubic Meter	\N	Transactional price	\N	Delhi	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2823	0.11	2017	Cubic Meter	\N	Transactional price	\N	Aurangabad	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2824	0.47	2019	Cubic Meter	\N	Transactional price	\N	Chennai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	IND
2825	0.23	2014	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2826	0.36	2014	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2827	0.15	2015	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2828	0.14	2014	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2829	0.14	2014	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2830	0.13	2014	Cubic Meter	\N	Transactional price	\N	Ridder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2831	0.25	2014	Cubic Meter	\N	Transactional price	\N	Zyryanovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2832	0.51	2014	Cubic Meter	\N	Transactional price	\N	Serebriansk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2833	0.14	2016	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2834	0.18	2016	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2835	0.27	2016	Cubic Meter	\N	Transactional price	\N	Aqtau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2836	0.33	2016	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2837	0.22	2016	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2838	0.32	2016	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2839	0.22	2016	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2840	0.21	2016	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2841	0.18	2016	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2842	0.14	2016	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2843	0.16	2016	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2844	0.08	2016	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2845	0.22	2016	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2846	0.11	2016	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2847	0.2	2016	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2848	0.22	2016	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2849	0.24	2017	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2850	0.23	2017	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2851	0.25	2017	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2852	0.24	2017	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2853	0.14	2017	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2854	0.15	2017	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2855	0.2	2017	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2856	0.19	2017	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2857	0.11	2017	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2858	0.09	2017	Cubic Meter	\N	Transactional price	\N	Ridder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2859	0.17	2017	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2860	0.18	2017	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2861	0.18	2017	Cubic Meter	\N	Transactional price	\N	Zyryanovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2862	0.25	2018	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2863	0.25	2018	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2864	0.27	2017	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2865	0.27	2018	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2866	0.22	2019	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2867	0.15	2019	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2868	0.11	2019	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2869	0.27	2019	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2870	0.27	2019	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2871	0.16	2019	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2872	0.1	2019	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2873	0.16	2019	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2874	0.19	2018	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2875	0.29	2018	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2876	0.12	2019	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2877	0.17	2019	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2878	0.2	2019	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2879	0.13	2018	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2880	0.14	2019	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2881	0.22	2020	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2882	0.13	2020	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2883	0.16	2019	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2884	0.12	2020	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2885	0.22	2020	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2886	0.1	2020	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2887	0.21	2020	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2888	0.31	2019	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2889	0.12	2019	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2890	0.16	2020	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2891	0.12	2019	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2892	0.2	2019	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2893	0.16	2020	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2894	0.26	2020	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2895	0.12	2020	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2896	0.3	2020	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2897	0.16	2020	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2898	0.12	2020	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2899	0.12	2020	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2900	0.18	2021	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2901	0.22	2021	Cubic Meter	\N	Transactional price	\N	Kapshagay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2902	0.12	2021	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2903	0.12	2021	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2904	0.24	2020	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2905	0.13	2020	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2906	0.11	2020	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2907	0.13	2021	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2908	0.14	2021	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2909	0.09	2021	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2910	0.25	2014	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2911	0.36	2014	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2912	0.15	2015	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2913	0.14	2014	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2914	0.14	2014	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2915	0.13	2014	Cubic Meter	\N	Transactional price	\N	Ridder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2916	0.25	2014	Cubic Meter	\N	Transactional price	\N	Zyryanovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2917	0.51	2014	Cubic Meter	\N	Transactional price	\N	Serebriansk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2918	0.14	2016	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2919	0.18	2016	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2920	0.27	2016	Cubic Meter	\N	Transactional price	\N	Aqtau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2921	0.33	2016	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2922	0.22	2016	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2923	0.32	2016	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2924	0.22	2016	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2925	0.21	2016	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2926	0.18	2016	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2927	0.14	2016	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2928	0.16	2016	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2929	0.08	2016	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2930	0.22	2016	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2931	0.11	2016	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2932	0.2	2016	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2933	0.22	2016	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2934	0.24	2017	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2935	0.23	2017	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2936	0.25	2017	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2937	0.24	2017	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2938	0.14	2017	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2939	0.15	2017	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2940	0.2	2017	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2941	0.19	2017	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2942	0.11	2017	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2943	0.09	2017	Cubic Meter	\N	Transactional price	\N	Ridder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2944	0.17	2017	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2945	0.19	2017	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2946	0.18	2017	Cubic Meter	\N	Transactional price	\N	Zyryanovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2947	0.25	2018	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2948	0.25	2018	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2949	0.27	2017	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2950	0.27	2018	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2951	0.22	2019	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2952	0.15	2019	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2953	0.11	2019	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2954	0.27	2019	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2955	0.27	2019	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2956	0.16	2019	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2957	0.1	2019	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2958	0.16	2019	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2959	0.19	2018	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2960	0.29	2018	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2961	0.12	2019	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2962	0.17	2019	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2963	0.2	2019	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2964	0.13	2018	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2965	0.14	2019	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2966	0.22	2020	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2967	0.13	2020	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2968	0.16	2019	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2969	0.12	2020	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2970	0.22	2020	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2971	0.1	2020	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2972	0.21	2020	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2973	0.31	2019	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2974	0.12	2019	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2975	0.16	2020	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2976	0.12	2019	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2977	0.2	2019	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2978	0.16	2020	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2979	0.26	2020	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2980	0.12	2020	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2981	0.3	2020	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2982	0.16	2020	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2983	0.12	2020	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2984	0.12	2020	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2985	0.18	2021	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2986	0.22	2021	Cubic Meter	\N	Transactional price	\N	Kapshagay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2987	0.12	2021	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2988	0.12	2021	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2989	0.24	2020	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2990	0.13	2020	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2991	0.11	2020	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2992	0.13	2021	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2993	0.14	2021	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2994	0.09	2021	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2995	0.25	2014	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2996	0.36	2014	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2997	0.15	2015	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2998	0.14	2014	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
2999	0.14	2014	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3000	0.13	2014	Cubic Meter	\N	Transactional price	\N	Ridder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3001	0.25	2014	Cubic Meter	\N	Transactional price	\N	Zyryanovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3002	0.51	2014	Cubic Meter	\N	Transactional price	\N	Serebriansk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3003	0.14	2016	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3004	0.18	2016	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3005	0.27	2016	Cubic Meter	\N	Transactional price	\N	Aqtau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3006	0.33	2016	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3007	0.22	2016	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3008	0.32	2016	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3009	0.22	2016	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3010	0.21	2016	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3011	0.18	2016	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3012	0.14	2016	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3013	0.16	2016	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3014	0.08	2016	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3015	0.22	2016	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3016	0.11	2016	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3017	0.2	2016	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3018	0.22	2016	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3019	0.24	2017	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3020	0.23	2017	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3021	0.25	2017	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3022	0.24	2017	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3023	0.14	2017	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3024	0.15	2017	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3025	0.2	2017	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3026	0.19	2017	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3027	0.11	2017	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3028	0.09	2017	Cubic Meter	\N	Transactional price	\N	Ridder	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3029	0.17	2017	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3030	0.19	2017	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3031	0.18	2017	Cubic Meter	\N	Transactional price	\N	Zyryanovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3032	0.25	2018	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3033	0.25	2018	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3034	0.27	2017	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3035	0.27	2018	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3036	0.22	2019	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3037	0.15	2019	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3038	0.11	2019	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3039	0.27	2019	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3040	0.27	2019	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3041	0.16	2019	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3042	0.1	2019	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3043	0.16	2019	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3044	0.19	2018	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3045	0.29	2018	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3046	0.12	2019	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3047	0.17	2019	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3048	0.2	2019	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3049	0.13	2018	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3050	0.14	2019	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3051	0.22	2020	Cubic Meter	\N	Transactional price	\N	Aktyubinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3052	0.13	2020	Cubic Meter	\N	Transactional price	\N	Almaty	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3053	0.16	2019	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3054	0.12	2020	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3055	0.22	2020	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3056	0.1	2020	Cubic Meter	\N	Transactional price	\N	Pavlodar	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3057	0.21	2020	Cubic Meter	\N	Transactional price	\N	Petropavlovsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3058	0.31	2019	Cubic Meter	\N	Transactional price	\N	Shymkent	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3059	0.12	2019	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3060	0.16	2020	Cubic Meter	\N	Transactional price	\N	Turkestan	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3061	0.12	2019	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3062	0.2	2019	Cubic Meter	\N	Transactional price	\N	Kokshetau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3063	0.16	2020	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3064	0.26	2020	Cubic Meter	\N	Transactional price	\N	Karaganda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3065	0.12	2020	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3066	0.3	2020	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3067	0.16	2020	Cubic Meter	\N	Transactional price	\N	Almaty Oblast	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3068	0.12	2020	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3069	0.12	2020	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3070	0.18	2021	Cubic Meter	\N	Transactional price	\N	Kostanai	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3071	0.22	2021	Cubic Meter	\N	Transactional price	\N	Kapshagay	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3072	0.12	2021	Cubic Meter	\N	Transactional price	\N	Ust Kamenogorsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3073	0.12	2021	Cubic Meter	\N	Transactional price	\N	Astana	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3074	0.24	2020	Cubic Meter	\N	Transactional price	\N	Atyrau	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3075	0.13	2020	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3076	0.11	2020	Cubic Meter	\N	Transactional price	\N	Kyzylorda	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3077	0.13	2021	Cubic Meter	\N	Transactional price	\N	Semipalatinsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3078	0.14	2021	Cubic Meter	\N	Transactional price	\N	Taraz	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
3079	0.09	2021	Cubic Meter	\N	Transactional price	\N	Uralsk	\N	https://tariffs.ib-net.org/sites	USD	\N	\N	\N	\N	\N	\N	\N	\N	KAZ
\.


--
-- Data for Name: water_impact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_impact (water_impact_id, water_impact_name, water_impact_description, water_impact_source) FROM stdin;
\.


--
-- Data for Name: water_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_source (water_source_id, water_source_name, water_source_description) FROM stdin;
\.


--
-- Data for Name: water_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_type (water_type_id, water_type_name, water_type_description) FROM stdin;
\.


--
-- Data for Name: water_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_user (water_sect_id, water_sect_name, water_sect_description, water_sect_source) FROM stdin;
\.


--
-- Name: region_reg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_reg_id_seq', 4743, true);


--
-- Name: value_price_vp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.value_price_vp_id_seq', 3079, true);


--
-- Name: community community_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.community
    ADD CONSTRAINT community_pkey PRIMARY KEY (com_id);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (cmp_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (nat_id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (curr_id);


--
-- Name: non_human non_human_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.non_human
    ADD CONSTRAINT non_human_pkey PRIMARY KEY (nh_id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (reg_id);


--
-- Name: researcher researcher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.researcher
    ADD CONSTRAINT researcher_pkey PRIMARY KEY (rsc_id);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (src_uri);


--
-- Name: value_price value_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_pkey PRIMARY KEY (vp_id);


--
-- Name: water_impact water_impact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_impact
    ADD CONSTRAINT water_impact_pkey PRIMARY KEY (water_impact_id);


--
-- Name: water_source water_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_source
    ADD CONSTRAINT water_source_pkey PRIMARY KEY (water_source_id);


--
-- Name: water_type water_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_type
    ADD CONSTRAINT water_type_pkey PRIMARY KEY (water_type_id);


--
-- Name: water_user water_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_user
    ADD CONSTRAINT water_user_pkey PRIMARY KEY (water_sect_id);


--
-- Name: community community_nation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.community
    ADD CONSTRAINT community_nation_id_fkey FOREIGN KEY (nation_id) REFERENCES public.country(nat_id);


--
-- Name: company company_nation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_nation_id_fkey FOREIGN KEY (nation_id) REFERENCES public.country(nat_id);


--
-- Name: currency currency_nation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_nation_id_fkey FOREIGN KEY (nation_id) REFERENCES public.country(nat_id);


--
-- Name: region region_nation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_nation_id_fkey FOREIGN KEY (nation_id) REFERENCES public.country(nat_id);


--
-- Name: source source_community_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_community_id_fkey FOREIGN KEY (community_id) REFERENCES public.community(com_id);


--
-- Name: source source_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(cmp_id);


--
-- Name: source source_nation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_nation_id_fkey FOREIGN KEY (nation_id) REFERENCES public.country(nat_id);


--
-- Name: value_price value_price_community_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_community_id_fkey FOREIGN KEY (community_id) REFERENCES public.community(com_id);


--
-- Name: value_price value_price_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(cmp_id);


--
-- Name: value_price value_price_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.value_price
    ADD CONSTRAINT value_price_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currency(curr_id);


--
-- PostgreSQL database dump complete
--

