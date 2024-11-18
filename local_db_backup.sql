--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

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
-- Name: admin_settings; Type: TABLE; Schema: public; Owner: darkify
--

CREATE TABLE public.admin_settings (
    id bigint NOT NULL,
    setting_key character varying,
    setting_value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admin_settings OWNER TO darkify;

--
-- Name: admin_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: darkify
--

CREATE SEQUENCE public.admin_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_settings_id_seq OWNER TO darkify;

--
-- Name: admin_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: darkify
--

ALTER SEQUENCE public.admin_settings_id_seq OWNED BY public.admin_settings.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: darkify
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO darkify;

--
-- Name: reservations; Type: TABLE; Schema: public; Owner: darkify
--

CREATE TABLE public.reservations (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    table_id bigint NOT NULL,
    reservation_date date,
    time_slot character varying,
    number_of_people integer,
    status character varying DEFAULT 'pending'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    time_slot_id bigint,
    message text
);


ALTER TABLE public.reservations OWNER TO darkify;

--
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: darkify
--

CREATE SEQUENCE public.reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservations_id_seq OWNER TO darkify;

--
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: darkify
--

ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: darkify
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO darkify;

--
-- Name: tables; Type: TABLE; Schema: public; Owner: darkify
--

CREATE TABLE public.tables (
    id bigint NOT NULL,
    table_number integer,
    max_capacity integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "default" character varying,
    availability boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tables OWNER TO darkify;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: darkify
--

CREATE SEQUENCE public.tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tables_id_seq OWNER TO darkify;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: darkify
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: time_slots; Type: TABLE; Schema: public; Owner: darkify
--

CREATE TABLE public.time_slots (
    id bigint NOT NULL,
    slot_time time without time zone,
    max_reservations integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.time_slots OWNER TO darkify;

--
-- Name: time_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: darkify
--

CREATE SEQUENCE public.time_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.time_slots_id_seq OWNER TO darkify;

--
-- Name: time_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: darkify
--

ALTER SEQUENCE public.time_slots_id_seq OWNED BY public.time_slots.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: darkify
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    password_digest character varying,
    admin boolean DEFAULT false,
    role character varying
);


ALTER TABLE public.users OWNER TO darkify;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: darkify
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO darkify;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: darkify
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admin_settings id; Type: DEFAULT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.admin_settings ALTER COLUMN id SET DEFAULT nextval('public.admin_settings_id_seq'::regclass);


--
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: time_slots id; Type: DEFAULT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.time_slots ALTER COLUMN id SET DEFAULT nextval('public.time_slots_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admin_settings; Type: TABLE DATA; Schema: public; Owner: darkify
--

COPY public.admin_settings (id, setting_key, setting_value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: darkify
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-11-15 08:04:55.527592	2024-11-15 08:04:55.527595
schema_sha1	9c6777daaa6ce85cc74b26c38000144a7834a947	2024-11-15 08:04:55.537199	2024-11-15 08:04:55.537203
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: darkify
--

COPY public.reservations (id, user_id, table_id, reservation_date, time_slot, number_of_people, status, created_at, updated_at, time_slot_id, message) FROM stdin;
20	36	10	2024-11-17	\N	2	pending	2024-11-17 11:15:52.839817	2024-11-17 11:15:52.839817	9	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: darkify
--

COPY public.schema_migrations (version) FROM stdin;
0
20241107175407
20241107180000
20241112075106
20241115075446
20241116101240
20241116101241
20241116101242
20241116101243
20241116102826
20241116104301
20241116130213
20241117054839
20241117060455
20241117071248
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: darkify
--

COPY public.tables (id, table_number, max_capacity, created_at, updated_at, "default", availability) FROM stdin;
12	6	8	2024-11-17 08:41:55.430374	2024-11-17 10:14:47.979143	\N	t
10	4	5	2024-11-16 12:49:49.350697	2024-11-17 10:14:49.256436	\N	t
11	5	6	2024-11-16 12:49:57.931211	2024-11-17 10:14:49.740829	\N	t
7	1	4	2024-11-16 12:17:43.425617	2024-11-17 10:17:04.676039	\N	f
9	3	4	2024-11-16 12:17:52.52362	2024-11-17 10:04:09.019789	\N	t
8	2	4	2024-11-16 12:17:47.952004	2024-11-17 10:04:14.986902	\N	f
\.


--
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: darkify
--

COPY public.time_slots (id, slot_time, max_reservations, created_at, updated_at) FROM stdin;
9	16:00:00	2	2024-11-17 09:42:50.677268	2024-11-17 09:42:50.677268
10	07:00:00	3	2024-11-17 09:42:58.336643	2024-11-17 09:42:58.336643
11	04:00:00	2	2024-11-17 09:43:07.720673	2024-11-17 09:43:07.720673
12	20:00:00	4	2024-11-17 09:45:36.429685	2024-11-17 09:45:36.429685
13	18:00:00	2	2024-11-17 09:45:44.445439	2024-11-17 09:45:44.445439
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: darkify
--

COPY public.users (id, name, email, created_at, updated_at, password_digest, admin, role) FROM stdin;
1	Example User	example@railstutorial.org	2024-11-15 08:09:26.797797	2024-11-15 08:09:26.797797	$2a$12$jZLUrgtX9Dipuhln6YSoaOLbg2j2WfX7kg1RJIlO1GS5sBjPBFi6W	t	\N
36	Janzell	oropesajanzell@gmail.com	2024-11-17 06:23:14.65779	2024-11-17 06:23:14.65779	$2a$12$v27GV9RowTGw4saiXhTuQ.bnCskJ0VrNtEZQyOOvYCTTLChb8Sqqe	f	\N
2	Carl janzell	carl.oropesa11@gmail.com	2024-11-15 08:11:19.281777	2024-11-17 08:13:46.151135	$2a$12$UnDDB99iPQhXDqUtVuI5qeT.ybO17q6g2TYlrX0Q2YlEnGv.Z30La	f	\N
35	Admin account	admin@gmail.com	2024-11-16 10:32:52.533653	2024-11-17 08:23:11.066904	$2a$12$e9NYwnU14LAIkuksKLrsUuvswFkPTtTfo20XcGFWYz.CzSu3IbqDy	t	admin
\.


--
-- Name: admin_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: darkify
--

SELECT pg_catalog.setval('public.admin_settings_id_seq', 1, false);


--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: darkify
--

SELECT pg_catalog.setval('public.reservations_id_seq', 20, true);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: darkify
--

SELECT pg_catalog.setval('public.tables_id_seq', 12, true);


--
-- Name: time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: darkify
--

SELECT pg_catalog.setval('public.time_slots_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: darkify
--

SELECT pg_catalog.setval('public.users_id_seq', 36, true);


--
-- Name: admin_settings admin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.admin_settings
    ADD CONSTRAINT admin_settings_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: time_slots time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_reservations_on_table_id; Type: INDEX; Schema: public; Owner: darkify
--

CREATE INDEX index_reservations_on_table_id ON public.reservations USING btree (table_id);


--
-- Name: index_reservations_on_time_slot_id; Type: INDEX; Schema: public; Owner: darkify
--

CREATE INDEX index_reservations_on_time_slot_id ON public.reservations USING btree (time_slot_id);


--
-- Name: index_reservations_on_user_id; Type: INDEX; Schema: public; Owner: darkify
--

CREATE INDEX index_reservations_on_user_id ON public.reservations USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: darkify
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: reservations fk_rails_23ce71128d; Type: FK CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_rails_23ce71128d FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: reservations fk_rails_48a92fce51; Type: FK CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_rails_48a92fce51 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reservations fk_rails_bae5bf9840; Type: FK CONSTRAINT; Schema: public; Owner: darkify
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_rails_bae5bf9840 FOREIGN KEY (time_slot_id) REFERENCES public.time_slots(id);


--
-- PostgreSQL database dump complete
--

