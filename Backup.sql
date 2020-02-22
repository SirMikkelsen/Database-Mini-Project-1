--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-02-22 15:40:13

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16599)
-- Name: car_maintenance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_maintenance (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    start_dtm timestamp without time zone NOT NULL,
    end_dtm timestamp without time zone NOT NULL,
    type character varying(255) NOT NULL,
    note character varying(255),
    cost integer,
    incident_id uuid
);


ALTER TABLE public.car_maintenance OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16581)
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    license character varying(7) NOT NULL,
    vin character varying(20) NOT NULL,
    model character varying(255) NOT NULL,
    purchase_dtm timestamp without time zone NOT NULL,
    ended_dtm timestamp without time zone,
    lesson_id uuid,
    exam_id uuid,
    car_maintenance_id uuid,
    incident_id uuid
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16572)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    birthday date NOT NULL,
    start_dtm timestamp without time zone NOT NULL,
    end_dtm timestamp without time zone,
    lesson_id uuid,
    exam_id uuid
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16593)
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    start_dtm timestamp without time zone NOT NULL,
    end_dtm timestamp without time zone NOT NULL,
    result character varying(255)
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16608)
-- Name: incidents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidents (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    date timestamp without time zone NOT NULL,
    note character varying(255)
);


ALTER TABLE public.incidents OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16587)
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    type character varying(255) NOT NULL,
    start_dtm timestamp without time zone NOT NULL,
    end_dtm timestamp without time zone NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16563)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    lesson_id uuid,
    exam_id uuid
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 16599)
-- Dependencies: 210
-- Data for Name: car_maintenance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_maintenance (id, start_dtm, end_dtm, type, note, cost, incident_id) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 16581)
-- Dependencies: 207
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, license, vin, model, purchase_dtm, ended_dtm, lesson_id, exam_id, car_maintenance_id, incident_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 16572)
-- Dependencies: 206
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, first_name, last_name, birthday, start_dtm, end_dtm, lesson_id, exam_id) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 16593)
-- Dependencies: 209
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams (id, start_dtm, end_dtm, result) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 16608)
-- Dependencies: 211
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidents (id, date, note) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 16587)
-- Dependencies: 208
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (id, type, start_dtm, end_dtm) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 16563)
-- Dependencies: 205
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, first_name, last_name, type, lesson_id, exam_id) FROM stdin;
\.


--
-- TOC entry 2745 (class 2606 OID 16607)
-- Name: car_maintenance car_maintenance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_maintenance
    ADD CONSTRAINT car_maintenance_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 16586)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 16580)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 16598)
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 16613)
-- Name: incidents incidents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 16592)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 16571)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 16624)
-- Name: cars fk_car_maintenance; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT fk_car_maintenance FOREIGN KEY (car_maintenance_id) REFERENCES public.car_maintenance(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 16644)
-- Name: car_maintenance fk_car_maintenance_incident; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_maintenance
    ADD CONSTRAINT fk_car_maintenance_incident FOREIGN KEY (incident_id) REFERENCES public.incidents(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2751 (class 2606 OID 16654)
-- Name: clients fk_clients_exam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_clients_exam FOREIGN KEY (exam_id) REFERENCES public.exams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2750 (class 2606 OID 16639)
-- Name: clients fk_clients_lesson; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_clients_lesson FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2753 (class 2606 OID 16619)
-- Name: cars fk_exams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT fk_exams FOREIGN KEY (exam_id) REFERENCES public.exams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2755 (class 2606 OID 16629)
-- Name: cars fk_incidents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT fk_incidents FOREIGN KEY (incident_id) REFERENCES public.incidents(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2752 (class 2606 OID 16614)
-- Name: cars fk_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT fk_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2749 (class 2606 OID 16649)
-- Name: staff fk_staff_exam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT fk_staff_exam FOREIGN KEY (exam_id) REFERENCES public.exams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2748 (class 2606 OID 16634)
-- Name: staff fk_staff_lesson; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT fk_staff_lesson FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2020-02-22 15:40:13

--
-- PostgreSQL database dump complete
--

