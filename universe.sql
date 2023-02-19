--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass_relative_to_earth numeric(7,5) NOT NULL,
    orbital_period_in_years numeric(5,1) NOT NULL,
    number_of_confirmed_moons integer NOT NULL,
    star_id integer
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    meaning_of_name text,
    designation character varying(60) NOT NULL,
    is_visible_to_naked_eye boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    equatorial_diameter_relative_to_earth numeric(5,3) NOT NULL,
    orbital_period_in_days numeric(6,3),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass_relative_to_earth numeric(6,3),
    orbital_period_in_years numeric(8,3),
    rotation_period_in_days numeric(5,2),
    has_moons boolean NOT NULL,
    number_of_confirmed_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth_in_light_years numeric(9,4) NOT NULL,
    absolute_magnitude numeric(5,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Pluto', 0.00220, 247.9, 5, 1);
INSERT INTO public.dwarf_planet VALUES (2, 'Ceres', 0.00016, 4.6, 0, 1);
INSERT INTO public.dwarf_planet VALUES (3, 'Eris', 0.00280, 559.0, 1, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The appearance from Earth of the galaxy — a band of light', 'N/A', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is known as the Chained Lady or the Chained Woman in English. It was known as Mulier Catenata (chained woman) in Latin and al-Maraat al Musalsalah in Arabic.', 'NGC 224', true);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', 'NGC 4622', false);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'It has a spectacular dark band of absorbing dust in front of its bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', 'NGC 4826', true);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 'It resembles the Eye of Sauron from The Lord of the Rings', 'NGC 4151', false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Its exhibits gravitaional disturbances that cause it to appear like a whirlpool', 'NGC 5194', false);
INSERT INTO public.galaxy VALUES (7, 'Butterfly Galaxies', 'Twin galaxies that look similar to a butterfly.', 'NGC 4567, NGC 4568', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.272, 27.322, 3);
INSERT INTO public.moon VALUES (2, 'Io', 0.285, 1.769, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 0.246, 3.551, 5);
INSERT INTO public.moon VALUES (6, 'Phobos', 0.002, NULL, 4);
INSERT INTO public.moon VALUES (7, 'Deimos', 0.001, NULL, 4);
INSERT INTO public.moon VALUES (8, 'Mimas', 0.031, 0.942, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 0.040, 1.370, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 0.084, 1.888, 6);
INSERT INTO public.moon VALUES (5, 'Callisto', 0.378, 16.689, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 0.246, 7.155, 5);
INSERT INTO public.moon VALUES (11, 'Dione', 0.088, 2.737, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 0.120, 4.518, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 0.404, 15.945, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 0.115, 79.322, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 0.037, 1.414, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 0.091, 2.520, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 0.092, 4.144, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 0.124, 8.706, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 0.119, 13.460, 7);
INSERT INTO public.moon VALUES (20, 'Hyperion', 0.042, 21.276, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.060, 0.240, 58.65, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.810, 0.620, 243.02, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.000, 1.000, 1.00, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.110, 1.880, 1.03, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.830, 11.860, 0.41, true, 92, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.160, 29.450, 0.44, true, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.540, 84.020, 0.72, true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.150, 164.790, 0.67, true, 14, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-11b', 2.780, 0.028, NULL, false, 0, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-11c', 5.000, 0.036, NULL, false, 0, 5);
INSERT INTO public.planet VALUES (11, 'Kepler-186b', 1.240, 0.011, NULL, false, 0, 6);
INSERT INTO public.planet VALUES (12, 'Keler-186f', 1.710, 0.356, NULL, false, 0, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.0000, 4.85, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.2465, 15.53, 1);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 4.3441, 4.38, 1);
INSERT INTO public.star VALUES (4, 'Toliman', 4.3441, 5.71, 1);
INSERT INTO public.star VALUES (5, 'Kepler-11', 2150.0000, 4.70, 1);
INSERT INTO public.star VALUES (6, 'Kepler-186', 579.2300, NULL, 1);
INSERT INTO public.star VALUES (7, 'Deneb', 2615.0000, -8.38, 1);


--
-- Name: dwarf_planet_dwarf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

