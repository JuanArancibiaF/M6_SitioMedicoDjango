--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: juan
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO juan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: juan
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO juan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: juan
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: form_examenes; Type: TABLE; Schema: public; Owner: juan
--

CREATE TABLE public.form_examenes (
    id integer NOT NULL,
    orina integer NOT NULL,
    glucosa integer NOT NULL,
    colesterol integer NOT NULL,
    triglicerido integer NOT NULL,
    bilirrubina integer NOT NULL,
    fecha date NOT NULL,
    paciente_id character varying(10) NOT NULL
);


ALTER TABLE public.form_examenes OWNER TO juan;

--
-- Name: form_examenes_id_seq; Type: SEQUENCE; Schema: public; Owner: juan
--

CREATE SEQUENCE public.form_examenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_examenes_id_seq OWNER TO juan;

--
-- Name: form_examenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: juan
--

ALTER SEQUENCE public.form_examenes_id_seq OWNED BY public.form_examenes.id;


--
-- Name: form_pacientes; Type: TABLE; Schema: public; Owner: juan
--

CREATE TABLE public.form_pacientes (
    rut character varying(10) NOT NULL,
    nombre character varying(25) NOT NULL,
    apellido character varying(25) NOT NULL,
    email character varying(50) NOT NULL,
    tutor character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    enfermedades character varying(50) NOT NULL
);


ALTER TABLE public.form_pacientes OWNER TO juan;

--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: juan
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: form_examenes id; Type: DEFAULT; Schema: public; Owner: juan
--

ALTER TABLE ONLY public.form_examenes ALTER COLUMN id SET DEFAULT nextval('public.form_examenes_id_seq'::regclass);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: juan
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	form	0001_initial	2021-02-23 21:15:15.677356-03
\.


--
-- Data for Name: form_examenes; Type: TABLE DATA; Schema: public; Owner: juan
--

COPY public.form_examenes (id, orina, glucosa, colesterol, triglicerido, bilirrubina, fecha, paciente_id) FROM stdin;
1	122	124	234	98	236	2021-02-23	13992802-4
2	120	234	350	231	250	2021-01-01	19220125-k
3	120	234	550	231	290	2021-01-02	22055784-7
4	111	213	322	322	321	2021-01-10	10100200-1
5	121	313	422	422	101	2021-01-15	10100200-1
6	415	513	722	122	581	2021-01-16	10100200-1
7	85	81	128	223	108	2021-02-14	13992802-4
8	555	444	333	222	111	2021-02-14	13992802-4
9	254	242	244	41	152	2021-01-15	13992802-4
\.


--
-- Data for Name: form_pacientes; Type: TABLE DATA; Schema: public; Owner: juan
--

COPY public.form_pacientes (rut, nombre, apellido, email, tutor, direccion, enfermedades) FROM stdin;
13992802-4	Juan	Arancibia	jaf@outlook.com	no	republica 504	no
22055784-7	Mariana	Mottura	Mariana.m@outlook.com	no	Santa Maria 250	no
10100200-1	Waldo	Cornejo	wc@gmail.com	Jonathan Olave	San Felipe 587	no
13992802-7	juan	arancibia	juan.antonio.arancibia@gmail.com	jg	Av. Republica 504, casa 22,	f
15727891-8	Carolina	Andrade	ca.andrade@gmail.com	Luis	Av. Limache	no
15777958-4	Arturo	Vidal	av.choro@gmail.com	El Pitbull	Cerrillos 584	no
11025147-1	Macarena	Sitchel	ma.si@gmail.com	no	Candelaria 584	no
12789321-8	Carlitos	Saul	dead@gmail.com	no	Cementerio La Rioja s/n	no
8999888-0	Pedro	Ruminot	ru@gmail.com	El guaton salinas	Caserio 12	no
19220125-k	Luciano	San Martin	luciano.sm@outlook.com	Aang	Cementerio La Rioja s/n	no
22036111-1	Anita	Alvarado	geisha@outlook.com	El Japo	La Dehesa 666	no
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: juan
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 1, true);


--
-- Name: form_examenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: juan
--

SELECT pg_catalog.setval('public.form_examenes_id_seq', 9, true);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: juan
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: form_examenes form_examenes_pkey; Type: CONSTRAINT; Schema: public; Owner: juan
--

ALTER TABLE ONLY public.form_examenes
    ADD CONSTRAINT form_examenes_pkey PRIMARY KEY (id);


--
-- Name: form_pacientes form_pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: juan
--

ALTER TABLE ONLY public.form_pacientes
    ADD CONSTRAINT form_pacientes_pkey PRIMARY KEY (rut);


--
-- Name: form_examenes_paciente_id_2215f28c; Type: INDEX; Schema: public; Owner: juan
--

CREATE INDEX form_examenes_paciente_id_2215f28c ON public.form_examenes USING btree (paciente_id);


--
-- Name: form_examenes_paciente_id_2215f28c_like; Type: INDEX; Schema: public; Owner: juan
--

CREATE INDEX form_examenes_paciente_id_2215f28c_like ON public.form_examenes USING btree (paciente_id varchar_pattern_ops);


--
-- Name: form_pacientes_rut_23a60fc5_like; Type: INDEX; Schema: public; Owner: juan
--

CREATE INDEX form_pacientes_rut_23a60fc5_like ON public.form_pacientes USING btree (rut varchar_pattern_ops);


--
-- Name: form_examenes form_examenes_paciente_id_2215f28c_fk_form_pacientes_rut; Type: FK CONSTRAINT; Schema: public; Owner: juan
--

ALTER TABLE ONLY public.form_examenes
    ADD CONSTRAINT form_examenes_paciente_id_2215f28c_fk_form_pacientes_rut FOREIGN KEY (paciente_id) REFERENCES public.form_pacientes(rut) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

