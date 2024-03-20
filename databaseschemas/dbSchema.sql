--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2024-03-19 16:17:08

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
-- TOC entry 215 (class 1259 OID 17694)
-- Name: clubs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clubs (
    club_id integer NOT NULL,
    club_code character varying(255),
    name character varying(255),
    domestic_competition_id character varying(255),
    total_market_value double precision,
    squad_size integer,
    average_age double precision,
    foreigners_number integer,
    foreigners_percentage double precision,
    national_team_players integer,
    stadium_name character varying(255),
    stadium_seats integer,
    net_transfer_record character varying(255),
    coach_name character varying(255),
    last_season integer,
    url character varying(255)
);


ALTER TABLE public.clubs OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17710)
-- Name: competition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competition (
    competition_id character varying(255) NOT NULL,
    competition_code character varying(255),
    name character varying(255),
    sub_type character varying(255),
    type character varying(255),
    country_id integer,
    country_name character varying(255),
    domestic_league_code character varying(255),
    confederation character varying(255),
    url character varying(255)
);


ALTER TABLE public.competition OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17665)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    name character varying(100),
    last_season integer,
    current_club_id integer,
    player_code character varying(100),
    country_of_birth character varying(100),
    city_of_birth character varying(100),
    country_of_citizenship character varying(100),
    date_of_birth timestamp without time zone,
    sub_position character varying(100),
    "position" character varying(100),
    foot character varying(100),
    height_in_cm double precision,
    market_value_in_eur double precision,
    highest_market_value_in_eur double precision,
    contract_expiration_date timestamp without time zone,
    agent_name character varying(100),
    image_url character varying(100),
    url character varying(100),
    current_club_domestic_competition_id character varying(100),
    current_club_name character varying(100)
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 3183 (class 2606 OID 17700)
-- Name: clubs clubs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clubs
    ADD CONSTRAINT clubs_pkey PRIMARY KEY (club_id);


--
-- TOC entry 3185 (class 2606 OID 17716)
-- Name: competition competition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition
    ADD CONSTRAINT competition_pkey PRIMARY KEY (competition_id);


--
-- TOC entry 3181 (class 2606 OID 17693)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- TOC entry 3186 (class 2606 OID 17705)
-- Name: players clubs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT clubs FOREIGN KEY (current_club_id) REFERENCES public.clubs(club_id) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3187 (class 2606 OID 17717)
-- Name: clubs competition; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clubs
    ADD CONSTRAINT competition FOREIGN KEY (domestic_competition_id) REFERENCES public.competition(competition_id) ON UPDATE CASCADE NOT VALID;


-- Completed on 2024-03-19 16:17:08

--
-- PostgreSQL database dump complete
--

