--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_types character varying,
    description text,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
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
    name character varying(50) NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
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
    has_life boolean,
    planet_types character varying,
    distance_from_earth numeric,
    is_spherical boolean,
    description text,
    age_in_millions_of_years numeric,
    star_id integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    is_sperical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


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
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 'The nearest spiral galaxy to the Milky Way.', 10000, 2537000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Barred Spiral', 'The galaxy that contains our solar system.', 13000, 0);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral', 'A classic spiral galaxy known for its grand design.', 5000, 23000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 'Known for its bright nucleus and dark dust lane.', 10000, 28000000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', 'The third-largest member of our Local Group.', 3000, 3000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Giant Elliptical', 'Famous for containing a supermassive black hole.', 13000, 53000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Miranda', 6, 'One of the moons of Uranus, known for its dramatic surface.', true, 4.5, 1290000);
INSERT INTO public.moon VALUES (12, 'Titania', 6, 'The largest moon of Uranus.', true, 4.5, 436000);
INSERT INTO public.moon VALUES (13, 'Oberon', 6, 'The second-largest moon of Uranus.', true, 4.5, 583000);
INSERT INTO public.moon VALUES (14, 'Triton', 7, 'The largest moon of Neptune, known for its retrograde orbit.', true, 4.5, 3548000);
INSERT INTO public.moon VALUES (15, 'Nereid', 7, 'The second-largest moon of Neptune.', true, 4.5, 5500000);
INSERT INTO public.moon VALUES (16, 'Charon', 8, 'The largest moon of Pluto, nearly half its size.', true, 4.5, 1975000);
INSERT INTO public.moon VALUES (17, 'Styx', 8, 'One of the smaller moons of Pluto.', true, 4.5, 1975000);
INSERT INTO public.moon VALUES (18, 'Nix', 8, 'Another small moon of Pluto.', true, 4.5, 1975000);
INSERT INTO public.moon VALUES (19, 'Kerberos', 8, 'The smallest moon of Pluto.', true, 4.5, 1975000);
INSERT INTO public.moon VALUES (20, 'Ganymedes', 4, 'A moon of Jupiter, not to be confused with Ganymede.', true, 4.5, 1070000);
INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earths only natural satellite.', true, 4.5, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'The larger of Mars two moons.', true, 4.3, 6000);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'The smaller and outer moon of Mars.', true, 4.3, 23000);
INSERT INTO public.moon VALUES (4, 'Io', 4, 'A volcanic moon of Jupiter and the most geologically active body in the solar system.', true, 4.5, 421700);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 'An icy moon of Jupiter with a subsurface ocean.', true, 4.5, 670900);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 'The largest moon in the solar system and has its own magnetic field.', true, 4.5, 1070000);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 'A heavily cratered moon of Jupiter.', true, 4.5, 1883000);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 'The largest moon of Saturn, known for its dense atmosphere.', true, 4.5, 1270000);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 'The second-largest moon of Saturn.', true, 4.5, 527000);
INSERT INTO public.moon VALUES (10, 'Enceladus', 5, 'Known for its geysers, which shoot water vapor into space.', true, 4.5, 2380000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Terrestrial', 0, true, 'The planet we live on.', 4.5, 3);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Terrestrial', 225000000, true, 'The red planet with the largest volcano.', 4.6, 3);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'Terrestrial', 41400000, true, 'The hottest planet in our solar system.', 4.5, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 'Gas Giant', 588000000, true, 'The largest planet in our solar system.', 4.6, 3);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 'Gas Giant', 1200000000, true, 'Known for its rings.', 4.5, 3);
INSERT INTO public.planet VALUES (6, 'Mercury', false, 'Terrestrial', 91700000, true, 'The closest planet to the Sun.', 4.5, 3);
INSERT INTO public.planet VALUES (7, 'Proxima b', true, 'Exoplanet', 4.24, true, 'An exoplanet in the habitable zone of Proxima Centauri.', 1.3, 3);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', true, 'Exoplanet', 500, true, 'An Earth-sized exoplanet in the habitable zone.', 1.5, 4);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', true, 'Exoplanet', 20.3, true, 'An exoplanet that may harbor life.', 1.0, 5);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', false, 'Gas Giant', 159, true, 'A gas giant with a known atmosphere.', 0.5, 6);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', true, 'Exoplanet', 39.5, true, 'An Earth-sized planet in a system with multiple planets.', 1.0, 2);
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', true, 'Exoplanet', 40.0, true, 'A super-Earth in the habitable zone.', 1.0, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'The brightest star in the night sky.', true, 200, 8.6);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'A red supergiant star in the constellation Orion.', true, 100, 642.5);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 'The closest known star to the Sun.', true, 4000, 4.24);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 2, 'A large star in the Alpha Centauri star system.', true, 5800, 4.37);
INSERT INTO public.star VALUES (5, 'Vega', 3, 'A bright star in the constellation Lyra.', true, 455, 25);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'A blue supergiant star also in Orion.', true, 800, 863);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun', 'The star at the center of our solar system.', 4600, 0, true, 2);
INSERT INTO public.sun VALUES (2, 'Alpha Centauri A', 'One of the closest stars to Earth.', 5800, 4, true, 2);
INSERT INTO public.sun VALUES (3, 'Sirius A', 'The brightest star in the night sky.', 200, 9, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_moon_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon_uniq UNIQUE (name);


--
-- Name: planet name_planet_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet_uniq UNIQUE (name);


--
-- Name: star name_star_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star_uniq UNIQUE (name);


--
-- Name: sun name_sun_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT name_sun_uniq UNIQUE (name);


--
-- Name: galaxy name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_uniq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


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
-- Name: sun sun_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

