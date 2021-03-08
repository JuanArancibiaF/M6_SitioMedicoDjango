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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO luciano;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO luciano;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO luciano;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO luciano;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO luciano;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO luciano;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO luciano;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO luciano;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO luciano;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO luciano;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO luciano;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO luciano;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO luciano;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO luciano;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO luciano;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO luciano;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO luciano;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO luciano;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO luciano;

--
-- Name: form_examenes; Type: TABLE; Schema: public; Owner: luciano
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


ALTER TABLE public.form_examenes OWNER TO luciano;

--
-- Name: form_examenes_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.form_examenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_examenes_id_seq OWNER TO luciano;

--
-- Name: form_examenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.form_examenes_id_seq OWNED BY public.form_examenes.id;


--
-- Name: form_funcionario; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.form_funcionario (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    rol character varying(50) NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE public.form_funcionario OWNER TO luciano;

--
-- Name: form_funcionario_id_seq; Type: SEQUENCE; Schema: public; Owner: luciano
--

CREATE SEQUENCE public.form_funcionario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_funcionario_id_seq OWNER TO luciano;

--
-- Name: form_funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciano
--

ALTER SEQUENCE public.form_funcionario_id_seq OWNED BY public.form_funcionario.id;


--
-- Name: form_pacientes; Type: TABLE; Schema: public; Owner: luciano
--

CREATE TABLE public.form_pacientes (
    rut character varying(10) NOT NULL,
    nombre character varying(25) NOT NULL,
    apellido character varying(25) NOT NULL,
    email character varying(50) NOT NULL,
    tutor character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    enfermedades character varying(50) NOT NULL,
    rol character varying(50) NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE public.form_pacientes OWNER TO luciano;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: form_examenes id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_examenes ALTER COLUMN id SET DEFAULT nextval('public.form_examenes_id_seq'::regclass);


--
-- Name: form_funcionario id; Type: DEFAULT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_funcionario ALTER COLUMN id SET DEFAULT nextval('public.form_funcionario_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add pacientes	7	add_pacientes
26	Can change pacientes	7	change_pacientes
27	Can delete pacientes	7	delete_pacientes
28	Can view pacientes	7	view_pacientes
29	Can add funcionario	8	add_funcionario
30	Can change funcionario	8	change_funcionario
31	Can delete funcionario	8	delete_funcionario
32	Can view funcionario	8	view_funcionario
33	Can add examenes	9	add_examenes
34	Can change examenes	9	change_examenes
35	Can delete examenes	9	delete_examenes
36	Can view examenes	9	view_examenes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$216000$SOLsSQXsDd83$qJ8eEC9B6D6t8rXrTr4OeCeqZfMI9BDiU3Byr5aATao=	\N	f	waldo			wc@gmail.com	f	t	2021-03-07 21:44:43.525751-03
1	pbkdf2_sha256$216000$8bAJLcHjGzS9$ShMUdMtLDOCTbsKCcvNsbLm3mR0AMi+dj5H18/yVamo=	2021-03-07 21:50:25.329447-03	t	intersalud			admin@intersalud.cl	t	t	2021-03-07 21:38:52.349525-03
3	pbkdf2_sha256$216000$OYg75rk5XO4r$/ibqrvpxPGAb9mttX5roQhJmgkOoisHvetw1jtArQP4=	2021-03-07 21:52:01.017406-03	f	luis			ld@gmail.com	t	t	2021-03-07 21:51:12.095658-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	form	pacientes
8	form	funcionario
9	form	examenes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-07 21:35:32.76523-03
2	auth	0001_initial	2021-03-07 21:35:33.227846-03
3	admin	0001_initial	2021-03-07 21:35:33.723274-03
4	admin	0002_logentry_remove_auto_add	2021-03-07 21:35:33.79608-03
5	admin	0003_logentry_add_action_flag_choices	2021-03-07 21:35:33.806054-03
6	contenttypes	0002_remove_content_type_name	2021-03-07 21:35:33.830986-03
7	auth	0002_alter_permission_name_max_length	2021-03-07 21:35:33.841956-03
8	auth	0003_alter_user_email_max_length	2021-03-07 21:35:33.851931-03
9	auth	0004_alter_user_username_opts	2021-03-07 21:35:33.862904-03
10	auth	0005_alter_user_last_login_null	2021-03-07 21:35:33.872877-03
11	auth	0006_require_contenttypes_0002	2021-03-07 21:35:33.876866-03
12	auth	0007_alter_validators_add_error_messages	2021-03-07 21:35:33.88983-03
13	auth	0008_alter_user_username_max_length	2021-03-07 21:35:33.952011-03
14	auth	0009_alter_user_last_name_max_length	2021-03-07 21:35:33.960986-03
15	auth	0010_alter_group_name_max_length	2021-03-07 21:35:33.973953-03
16	auth	0011_update_proxy_permissions	2021-03-07 21:35:33.982934-03
17	auth	0012_alter_user_first_name_max_length	2021-03-07 21:35:33.995898-03
18	form	0001_initial	2021-03-07 21:35:34.211978-03
19	sessions	0001_initial	2021-03-07 21:35:34.412469-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1mkr28q7pjyekhsdk1rp4j3u9uj9dd28	.eJxVjEEOwiAQRe_C2hAEyoBL9z0DGTqDVA0kpV0Z765NutDtf-_9l4i4rSVunZc4k7gII06_W8LpwXUHdMd6a3JqdV3mJHdFHrTLsRE_r4f7d1Cwl28N1jsVKCOrAcArHc7gnFWQ2QWwGhETK0oENmlvNGc_aENMgRhc8uL9Acg4N8A:1lJ47t:nL6uBHl6mLHJdPL2nzrlT6kjAURJBN92xFLbyaneyXo	2021-03-21 21:52:01.02041-03
\.


--
-- Data for Name: form_examenes; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.form_examenes (id, orina, glucosa, colesterol, triglicerido, bilirrubina, fecha, paciente_id) FROM stdin;
1	150	250	111	457	85	2021-01-15	10123123-1
2	475	451	452	125	741	2021-01-20	10123123-1
3	158	410	410	300	140	2021-02-05	10123123-1
4	148	235	120	120	250	2021-03-01	10123123-1
\.


--
-- Data for Name: form_funcionario; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.form_funcionario (id, nombre, rol, usuario_id) FROM stdin;
1	Luis Debia	medico	3
\.


--
-- Data for Name: form_pacientes; Type: TABLE DATA; Schema: public; Owner: luciano
--

COPY public.form_pacientes (rut, nombre, apellido, email, tutor, direccion, enfermedades, rol, usuario_id) FROM stdin;
10123123-1	waldo	cornejo	wc@gmail.com	Luciano	San Felipe 123	no	paciente	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: form_examenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.form_examenes_id_seq', 4, true);


--
-- Name: form_funcionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciano
--

SELECT pg_catalog.setval('public.form_funcionario_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: form_examenes form_examenes_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_examenes
    ADD CONSTRAINT form_examenes_pkey PRIMARY KEY (id);


--
-- Name: form_funcionario form_funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_funcionario
    ADD CONSTRAINT form_funcionario_pkey PRIMARY KEY (id);


--
-- Name: form_funcionario form_funcionario_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_funcionario
    ADD CONSTRAINT form_funcionario_usuario_id_key UNIQUE (usuario_id);


--
-- Name: form_pacientes form_pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_pacientes
    ADD CONSTRAINT form_pacientes_pkey PRIMARY KEY (rut);


--
-- Name: form_pacientes form_pacientes_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_pacientes
    ADD CONSTRAINT form_pacientes_usuario_id_key UNIQUE (usuario_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: form_examenes_paciente_id_2215f28c; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX form_examenes_paciente_id_2215f28c ON public.form_examenes USING btree (paciente_id);


--
-- Name: form_examenes_paciente_id_2215f28c_like; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX form_examenes_paciente_id_2215f28c_like ON public.form_examenes USING btree (paciente_id varchar_pattern_ops);


--
-- Name: form_pacientes_rut_23a60fc5_like; Type: INDEX; Schema: public; Owner: luciano
--

CREATE INDEX form_pacientes_rut_23a60fc5_like ON public.form_pacientes USING btree (rut varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_examenes form_examenes_paciente_id_2215f28c_fk_form_pacientes_rut; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_examenes
    ADD CONSTRAINT form_examenes_paciente_id_2215f28c_fk_form_pacientes_rut FOREIGN KEY (paciente_id) REFERENCES public.form_pacientes(rut) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_funcionario form_funcionario_usuario_id_926f20fc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_funcionario
    ADD CONSTRAINT form_funcionario_usuario_id_926f20fc_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_pacientes form_pacientes_usuario_id_0ca705b2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciano
--

ALTER TABLE ONLY public.form_pacientes
    ADD CONSTRAINT form_pacientes_usuario_id_0ca705b2_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

