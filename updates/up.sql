--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)

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

ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_area_types DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_gps DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS parent_area_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS locations_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS gps_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS gps_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_gps DROP CONSTRAINT IF EXISTS gps_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS created_at;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS backend_user_group_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS areas_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_area_types DROP CONSTRAINT IF EXISTS area_types_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS area_type_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS area_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS addresses_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS address_id;
DROP TRIGGER IF EXISTS tr_acorn_location_locations_server_id ON public.acorn_location_locations;
DROP TRIGGER IF EXISTS tr_acorn_location_locations_new_replicated_row ON public.acorn_location_locations;
DROP TRIGGER IF EXISTS tr_acorn_location_gps_server_id ON public.acorn_location_gps;
DROP TRIGGER IF EXISTS tr_acorn_location_gps_new_replicated_row ON public.acorn_location_gps;
DROP TRIGGER IF EXISTS tr_acorn_location_areas_server_id ON public.acorn_location_areas;
DROP TRIGGER IF EXISTS tr_acorn_location_areas_new_replicated_row ON public.acorn_location_areas;
DROP TRIGGER IF EXISTS tr_acorn_location_area_types_server_id ON public.acorn_location_area_types;
DROP TRIGGER IF EXISTS tr_acorn_location_area_types_new_replicated_row ON public.acorn_location_area_types;
DROP TRIGGER IF EXISTS tr_acorn_location_addresses_server_id ON public.acorn_location_addresses;
DROP TRIGGER IF EXISTS tr_acorn_location_addresses_new_replicated_row ON public.acorn_location_addresses;
DROP INDEX IF EXISTS public.dr_acorn_location_location_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_gps_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_areas_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_area_types_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_addresses_replica_identity;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS location_locations_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_gps DROP CONSTRAINT IF EXISTS location_gps_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS location_areas_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_area_types DROP CONSTRAINT IF EXISTS location_area_types_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS location_addresses_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_lookup DROP CONSTRAINT IF EXISTS acorn_location_location_pkey;
ALTER TABLE IF EXISTS public.acorn_location_lookup ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.acorn_location_locations;
DROP SEQUENCE IF EXISTS public.acorn_location_location_id_seq;
DROP TABLE IF EXISTS public.acorn_location_lookup;
DROP TABLE IF EXISTS public.acorn_location_gps;
DROP TABLE IF EXISTS public.acorn_location_areas;
DROP TABLE IF EXISTS public.acorn_location_area_types;
DROP TABLE IF EXISTS public.acorn_location_addresses;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acorn_location_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_addresses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    number character varying(1024),
    image character varying(2048),
    area_id uuid NOT NULL,
    gps_id uuid,
    server_id uuid NOT NULL,
    created_by_user_id integer,
    created_at integer,
    response text
);


--
-- Name: acorn_location_area_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_area_types (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    server_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by_user_id integer,
    response text
);


--
-- Name: acorn_location_areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_areas (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    area_type_id uuid NOT NULL,
    parent_area_id uuid,
    gps_id uuid,
    server_id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    is_current_version boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by_user_id integer,
    response text
);


--
-- Name: acorn_location_gps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_gps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    longitude double precision,
    latitude double precision,
    server_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by_user_id integer,
    response text
);


--
-- Name: acorn_location_lookup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_lookup (
    id integer NOT NULL,
    address character varying(1024) NOT NULL,
    city character varying(1024) NOT NULL,
    zip character varying(1024) NOT NULL,
    country_code character varying(1024) NOT NULL,
    state_code character varying(1024) NOT NULL,
    latitude character varying(1024) NOT NULL,
    longitude character varying(1024) NOT NULL,
    vicinity character varying(1024) NOT NULL
);


--
-- Name: acorn_location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.acorn_location_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acorn_location_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.acorn_location_location_id_seq OWNED BY public.acorn_location_lookup.id;


--
-- Name: acorn_location_locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_locations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    address_id uuid NOT NULL,
    name character varying(2048) NOT NULL,
    image character varying(2048),
    server_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by_user_id integer,
    response text,
    backend_user_group_id integer
);


--
-- Name: acorn_location_lookup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_lookup ALTER COLUMN id SET DEFAULT nextval('public.acorn_location_location_id_seq'::regclass);


--
-- Name: acorn_location_lookup acorn_location_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_lookup
    ADD CONSTRAINT acorn_location_location_pkey PRIMARY KEY (id);


--
-- Name: acorn_location_addresses location_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_addresses
    ADD CONSTRAINT location_addresses_pkey PRIMARY KEY (id);


--
-- Name: acorn_location_area_types location_area_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_area_types
    ADD CONSTRAINT location_area_types_pkey PRIMARY KEY (id);


--
-- Name: acorn_location_areas location_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT location_areas_pkey PRIMARY KEY (id);


--
-- Name: acorn_location_gps location_gps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_gps
    ADD CONSTRAINT location_gps_pkey PRIMARY KEY (id);


--
-- Name: acorn_location_locations location_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT location_locations_pkey PRIMARY KEY (id);


--
-- Name: dr_acorn_location_addresses_replica_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dr_acorn_location_addresses_replica_identity ON public.acorn_location_addresses USING btree (server_id, id);


--
-- Name: dr_acorn_location_area_types_replica_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dr_acorn_location_area_types_replica_identity ON public.acorn_location_area_types USING btree (server_id, id);


--
-- Name: dr_acorn_location_areas_replica_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dr_acorn_location_areas_replica_identity ON public.acorn_location_areas USING btree (server_id, id);


--
-- Name: dr_acorn_location_gps_replica_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dr_acorn_location_gps_replica_identity ON public.acorn_location_gps USING btree (server_id, id);


--
-- Name: dr_acorn_location_location_replica_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dr_acorn_location_location_replica_identity ON public.acorn_location_locations USING btree (server_id, id);


--
-- Name: acorn_location_addresses tr_acorn_location_addresses_new_replicated_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_addresses_new_replicated_row BEFORE INSERT ON public.acorn_location_addresses FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_new_replicated_row();

ALTER TABLE public.acorn_location_addresses ENABLE ALWAYS TRIGGER tr_acorn_location_addresses_new_replicated_row;


--
-- Name: acorn_location_addresses tr_acorn_location_addresses_server_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_addresses_server_id BEFORE INSERT ON public.acorn_location_addresses FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_server_id();


--
-- Name: acorn_location_area_types tr_acorn_location_area_types_new_replicated_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_area_types_new_replicated_row BEFORE INSERT ON public.acorn_location_area_types FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_new_replicated_row();

ALTER TABLE public.acorn_location_area_types ENABLE ALWAYS TRIGGER tr_acorn_location_area_types_new_replicated_row;


--
-- Name: acorn_location_area_types tr_acorn_location_area_types_server_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_area_types_server_id BEFORE INSERT ON public.acorn_location_area_types FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_server_id();


--
-- Name: acorn_location_areas tr_acorn_location_areas_new_replicated_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_areas_new_replicated_row BEFORE INSERT ON public.acorn_location_areas FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_new_replicated_row();

ALTER TABLE public.acorn_location_areas ENABLE ALWAYS TRIGGER tr_acorn_location_areas_new_replicated_row;


--
-- Name: acorn_location_areas tr_acorn_location_areas_server_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_areas_server_id BEFORE INSERT ON public.acorn_location_areas FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_server_id();


--
-- Name: acorn_location_gps tr_acorn_location_gps_new_replicated_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_gps_new_replicated_row BEFORE INSERT ON public.acorn_location_gps FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_new_replicated_row();

ALTER TABLE public.acorn_location_gps ENABLE ALWAYS TRIGGER tr_acorn_location_gps_new_replicated_row;


--
-- Name: acorn_location_gps tr_acorn_location_gps_server_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_gps_server_id BEFORE INSERT ON public.acorn_location_gps FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_server_id();


--
-- Name: acorn_location_locations tr_acorn_location_locations_new_replicated_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_locations_new_replicated_row BEFORE INSERT ON public.acorn_location_locations FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_new_replicated_row();

ALTER TABLE public.acorn_location_locations ENABLE ALWAYS TRIGGER tr_acorn_location_locations_new_replicated_row;


--
-- Name: acorn_location_locations tr_acorn_location_locations_server_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_locations_server_id BEFORE INSERT ON public.acorn_location_locations FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_server_id();


--
-- Name: acorn_location_locations address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES public.acorn_location_addresses(id) NOT VALID;


--
-- Name: acorn_location_addresses addresses_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_addresses
    ADD CONSTRAINT addresses_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.backend_users(id);


--
-- Name: acorn_location_addresses area_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_addresses
    ADD CONSTRAINT area_id FOREIGN KEY (area_id) REFERENCES public.acorn_location_areas(id) NOT VALID;


--
-- Name: acorn_location_areas area_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT area_type_id FOREIGN KEY (area_type_id) REFERENCES public.acorn_location_area_types(id);


--
-- Name: acorn_location_area_types area_types_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_area_types
    ADD CONSTRAINT area_types_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.backend_users(id);


--
-- Name: acorn_location_areas areas_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT areas_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.backend_users(id);


--
-- Name: acorn_location_locations backend_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT backend_user_group_id FOREIGN KEY (backend_user_group_id) REFERENCES public.backend_user_groups(id);


--
-- Name: acorn_location_addresses created_at; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_addresses
    ADD CONSTRAINT created_at FOREIGN KEY (created_at) REFERENCES public.acorn_calendar_event(id);


--
-- Name: acorn_location_gps gps_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_gps
    ADD CONSTRAINT gps_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.backend_users(id);


--
-- Name: acorn_location_areas gps_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT gps_id FOREIGN KEY (gps_id) REFERENCES public.acorn_location_gps(id);


--
-- Name: acorn_location_addresses gps_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_addresses
    ADD CONSTRAINT gps_id FOREIGN KEY (gps_id) REFERENCES public.acorn_location_gps(id) NOT VALID;


--
-- Name: acorn_location_locations locations_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT locations_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.backend_users(id);


--
-- Name: acorn_location_areas parent_area_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT parent_area_id FOREIGN KEY (parent_area_id) REFERENCES public.acorn_location_areas(id) NOT VALID;


--
-- Name: acorn_location_locations server_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT server_id FOREIGN KEY (server_id) REFERENCES public.acorn_servers(id);


--
-- Name: acorn_location_gps server_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_gps
    ADD CONSTRAINT server_id FOREIGN KEY (server_id) REFERENCES public.acorn_servers(id);


--
-- Name: acorn_location_addresses server_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_addresses
    ADD CONSTRAINT server_id FOREIGN KEY (server_id) REFERENCES public.acorn_servers(id);


--
-- Name: acorn_location_area_types server_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_area_types
    ADD CONSTRAINT server_id FOREIGN KEY (server_id) REFERENCES public.acorn_servers(id);


--
-- Name: acorn_location_areas server_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT server_id FOREIGN KEY (server_id) REFERENCES public.acorn_servers(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public;
