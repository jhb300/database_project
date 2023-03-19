COPY public.airlinex_aircraft (registration, type_series, passenger_capacity) FROM stdin;
D-ABYA	B748	364
D-AIXP	A359	293
\.


--
-- TOC entry 3515 (class 0 OID 66193)
-- Dependencies: 232
-- Data for Name: airportx_airport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airportx_airport (icao_code, name) FROM stdin;
EDDF	Frankfurt Airport
EDDM	Munich Airport
KJFK	John F. Kennedy International Airport
\.


--
-- TOC entry 3394 (class 0 OID 90379)
-- Dependencies: 247
-- Data for Name: airportx_runway; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airportx_runway (id, length, name, airport_id) FROM stdin;
1	3343	07L	EDDF
2	3343	07C	EDDF
3	4231	18	EDDF
4	2560	04R	KJFK
5	3682	04L	KJFK
6	2560	22L	KJFK
7	3682	22R	KJFK
8	4231	36	EDDF
9	3343	25L	EDDF
10	3343	25R	EDDF
\.


--
-- TOC entry 3520 (class 0 OID 66213)
-- Dependencies: 237
-- Data for Name: airlinex_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlinex_employee (id, first_name, last_name, email, role, based_in_id) FROM stdin;
1	Jürgen	Raps	raps@lufthansa.com	C	EDDF
2	Joong Gi	Joost	joost@lufthansa.com	FO	EDDM
3	Janine	Neumann	neumann@lufthansa.com	CC	EDDF
4	Tobias	Reuter	treuter@lufthansa.com	CC	EDDM
\.


--
-- TOC entry 3523 (class 0 OID 66226)
-- Dependencies: 240
-- Data for Name: airlinex_flight; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlinex_flight (number, departure_time, arrival_time, delay, canceled, aircraft_id, departure_airport_id, destination_airport_id) FROM stdin;
LH470	2023-02-19 09:10:00+01	2023-02-19 17:40:00+01	5	f	D-AIXP	EDDM	KJFK
LH480	2023-02-20 11:12:00+01	2023-02-20 20:10:00+01	0	f	D-ABYA	EDDF	KJFK
LH440	2023-02-21 11:15:00+01	2023-02-21 20:20:00+01	80	f	D-AIXP	KJFK	EDDM
\.


--
-- TOC entry 3518 (class 0 OID 66207)
-- Dependencies: 235
-- Data for Name: airlinex_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlinex_assignment (id, employee_id, flight_id) FROM stdin;
1	1	LH480
2	2	LH480
3	3	LH470
4	4	LH480
5	3	LH480
6	1	LH470
7	2	LH470
8	4	LH470
9	1	LH440
\.


--
-- TOC entry 3522 (class 0 OID 66219)
-- Dependencies: 239
-- Data for Name: airlinex_passenger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlinex_passenger (id, first_name, last_name, status, notes) FROM stdin;
1	James	Bond	P	Likes his drinks stirred, not shaken.
2	Rainer	Zufall	S	Preferes to choose his meals randomly.
\.


--
-- TOC entry 3525 (class 0 OID 66233)
-- Dependencies: 242
-- Data for Name: airlinex_booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlinex_booking (id, "time", canceled, flight_id, passenger_id) FROM stdin;
1	2023-02-19 15:22:41.408284+01	f	LH470	1
2	2023-02-19 15:22:47.910238+01	f	LH480	1
3	2023-02-19 15:22:55.240668+01	f	LH440	1
4	2023-02-19 15:23:01.765973+01	f	LH470	2
5	2023-02-19 15:23:07.689948+01	f	LH480	2
6	2023-02-19 15:23:13.392197+01	f	LH440	2
\.

