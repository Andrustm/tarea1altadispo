--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-10-17 21:33:21

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
-- TOC entry 202 (class 1259 OID 24624)
-- Name: movesets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movesets (
    id_user integer,
    id_pokemon integer,
    moveset text,
    id_moveset integer NOT NULL
);


ALTER TABLE public.movesets OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16427)
-- Name: movesets_id_moveset_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movesets_id_moveset_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.movesets_id_moveset_seq OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24693)
-- Name: movesets_id_moveset_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movesets_id_moveset_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movesets_id_moveset_seq1 OWNER TO postgres;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 204
-- Name: movesets_id_moveset_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movesets_id_moveset_seq1 OWNED BY public.movesets.id_moveset;


--
-- TOC entry 201 (class 1259 OID 24619)
-- Name: pokemons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemons (
    id_pokemon integer NOT NULL,
    name character varying,
    type character varying,
    stats character varying
);


ALTER TABLE public.pokemons OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24632)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    usuario character varying,
    clave character varying
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 2863 (class 2604 OID 24695)
-- Name: movesets id_moveset; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movesets ALTER COLUMN id_moveset SET DEFAULT nextval('public.movesets_id_moveset_seq1'::regclass);


--
-- TOC entry 3004 (class 0 OID 24624)
-- Dependencies: 202
-- Data for Name: movesets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movesets (id_user, id_pokemon, moveset, id_moveset) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 24619)
-- Dependencies: 201
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemons (id_pokemon, name, type, stats) FROM stdin;
1	Snorlax	Normal	160, 110, 65, 65, 110, 30
2	Blastoise	Water	79, 83, 100, 85, 105, 78
3	Charizard	Fire/Flying	78, 84, 78, 109, 85, 100
4	Pikachu	Electric	35, 55, 30, 50, 40, 90
5	Venusaur	Grass/Poison	80, 82, 83, 100, 100, 80
\.


--
-- TOC entry 3005 (class 0 OID 24632)
-- Dependencies: 203
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, usuario, clave) FROM stdin;
1	andru	andru
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 200
-- Name: movesets_id_moveset_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movesets_id_moveset_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 204
-- Name: movesets_id_moveset_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movesets_id_moveset_seq1', 55, true);


--
-- TOC entry 2867 (class 2606 OID 24703)
-- Name: movesets movesets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movesets
    ADD CONSTRAINT movesets_pkey PRIMARY KEY (id_moveset);


--
-- TOC entry 2865 (class 2606 OID 24623)
-- Name: pokemons pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pkey PRIMARY KEY (id_pokemon);


--
-- TOC entry 2869 (class 2606 OID 24641)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2870 (class 2606 OID 24642)
-- Name: movesets fk_commit_pokemon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movesets
    ADD CONSTRAINT fk_commit_pokemon FOREIGN KEY (id_pokemon) REFERENCES public.pokemons(id_pokemon) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2871 (class 2606 OID 24647)
-- Name: movesets fk_commit_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movesets
    ADD CONSTRAINT fk_commit_user FOREIGN KEY (id_user) REFERENCES public.usuarios(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2022-10-17 21:33:22

--
-- PostgreSQL database dump complete
--

