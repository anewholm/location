--
-- PostgreSQL database dump
--

\restrict niC4FVKPKWleIyePZ0zb2RKBI8SivbvRYENmP7aybFeXrecPEGB3H1anaIq1wyh

-- Dumped from database version 16.10 (Ubuntu 16.10-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-1.pgdg24.04+1)

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

ALTER TABLE IF EXISTS ONLY public.acorn_location_user_addresses DROP CONSTRAINT IF EXISTS user_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_user_group_location DROP CONSTRAINT IF EXISTS user_group_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_types DROP CONSTRAINT IF EXISTS types_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS type_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_address_types DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_types DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_area_types DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_gps DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS server_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_types DROP CONSTRAINT IF EXISTS parent_type_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS parent_area_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS locations_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_user_group_location DROP CONSTRAINT IF EXISTS location_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS gps_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS gps_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_gps DROP CONSTRAINT IF EXISTS gps_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS areas_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_area_types DROP CONSTRAINT IF EXISTS area_types_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS area_type_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS area_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_address_types DROP CONSTRAINT IF EXISTS addresses_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS addresses_created_by_user;
ALTER TABLE IF EXISTS ONLY public.acorn_location_user_addresses DROP CONSTRAINT IF EXISTS address_type_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_user_addresses DROP CONSTRAINT IF EXISTS address_id;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS address_id;
DROP TRIGGER IF EXISTS tr_acorn_location_types_server_id ON public.acorn_location_types;
DROP TRIGGER IF EXISTS tr_acorn_location_types_new_replicated_row ON public.acorn_location_types;
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
DROP TRIGGER IF EXISTS tr_acorn_location_address_types_server_id ON public.acorn_location_address_types;
DROP TRIGGER IF EXISTS tr_acorn_location_address_types_new_replicated_row ON public.acorn_location_address_types;
DROP INDEX IF EXISTS public.fki_type_id;
DROP INDEX IF EXISTS public.fki_location_id;
DROP INDEX IF EXISTS public.fki_address_type_id;
DROP INDEX IF EXISTS public.fki_address_id;
DROP INDEX IF EXISTS public.dr_acorn_location_types_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_location_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_gps_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_areas_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_area_types_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_addresses_replica_identity;
DROP INDEX IF EXISTS public.dr_acorn_location_address_types_replica_identity;
ALTER TABLE IF EXISTS ONLY public.acorn_location_area_types DROP CONSTRAINT IF EXISTS name;
ALTER TABLE IF EXISTS ONLY public.acorn_location_types DROP CONSTRAINT IF EXISTS location_types_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_types DROP CONSTRAINT IF EXISTS location_type_name_unique;
ALTER TABLE IF EXISTS ONLY public.acorn_location_locations DROP CONSTRAINT IF EXISTS location_locations_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_gps DROP CONSTRAINT IF EXISTS location_gps_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS location_areas_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_area_types DROP CONSTRAINT IF EXISTS location_area_types_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_addresses DROP CONSTRAINT IF EXISTS location_addresses_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_address_types DROP CONSTRAINT IF EXISTS location_address_types_pkey;
ALTER TABLE IF EXISTS ONLY public.acorn_location_areas DROP CONSTRAINT IF EXISTS area_area_type;
ALTER TABLE IF EXISTS ONLY public.acorn_location_lookup DROP CONSTRAINT IF EXISTS acorn_location_location_pkey;
DROP TABLE IF EXISTS public.acorn_location_types;
DROP TABLE IF EXISTS public.acorn_location_lookup;
DROP VIEW IF EXISTS public.acorn_location_location_links;
DROP TABLE IF EXISTS public.acorn_location_user_group_location;
DROP TABLE IF EXISTS public.acorn_location_gps;
DROP TABLE IF EXISTS public.acorn_location_areas;
DROP TABLE IF EXISTS public.acorn_location_area_types;
DROP TABLE IF EXISTS public.acorn_location_addresses;
DROP TABLE IF EXISTS public.acorn_location_address_types;
DROP VIEW IF EXISTS public.acorn_location_address_links;
DROP TABLE IF EXISTS public.acorn_location_user_addresses;
DROP TABLE IF EXISTS public.acorn_location_locations;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acorn_location_locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_locations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    address_id uuid NOT NULL,
    name character varying(2048) NOT NULL,
    description text,
    image character varying(2048),
    server_id uuid NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    created_by_user_id uuid,
    response text,
    type_id uuid
);


--
-- Name: acorn_location_user_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_user_addresses (
    user_id uuid NOT NULL,
    address_id uuid NOT NULL,
    current boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    address_type_id uuid,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: acorn_location_address_links; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.acorn_location_address_links AS
 SELECT acorn_location_user_addresses.address_id AS event_id,
    'public'::character varying(2048) AS schema,
    'acorn_location_user_addresses'::character varying(2048) AS "table",
    'address_id'::character varying(2048) AS "column",
    'Acorn\Location\Models\UserAddress'::text AS model_type,
    acorn_location_user_addresses.id AS model_id
   FROM public.acorn_location_user_addresses
UNION ALL
 SELECT acorn_location_locations.address_id AS event_id,
    'public'::character varying(2048) AS schema,
    'acorn_location_locations'::character varying(2048) AS "table",
    'address_id'::character varying(2048) AS "column",
    'Acorn\Location\Models\Location'::text AS model_type,
    acorn_location_locations.id AS model_id
   FROM public.acorn_location_locations;


--
-- Name: acorn_location_address_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_address_types (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    number character varying(1024),
    image character varying(2048),
    description text,
    server_id uuid NOT NULL,
    created_by_user_id uuid,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    import_source text,
    response text
);


--
-- Name: acorn_location_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_addresses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    number character varying(1024),
    image character varying(2048),
    description text,
    area_id uuid NOT NULL,
    gps_id uuid,
    server_id uuid NOT NULL,
    created_by_user_id uuid,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    response text,
    lookup_id uuid,
    import_source text
);


--
-- Name: acorn_location_area_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_area_types (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    description text,
    server_id uuid NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    created_by_user_id uuid,
    response text
);


--
-- Name: acorn_location_areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_areas (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    description text,
    area_type_id uuid NOT NULL,
    parent_id uuid,
    gps_id uuid,
    server_id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    is_current_version boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    created_by_user_id uuid,
    response text,
    import_source text,
    nest_right integer,
    nest_left integer,
    nest_depth integer
);


--
-- Name: acorn_location_gps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_gps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    longitude double precision,
    latitude double precision,
    server_id uuid NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    created_by_user_id uuid,
    response text
);


--
-- Name: acorn_location_user_group_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_user_group_location (
    user_group_id uuid NOT NULL,
    location_id uuid NOT NULL,
    current boolean DEFAULT true NOT NULL
);


--
-- Name: acorn_location_location_links; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.acorn_location_location_links AS
 SELECT acorn_university_entities.location_id AS event_id,
    'public'::character varying(2048) AS schema,
    'acorn_university_entities'::character varying(2048) AS "table",
    'location_id'::character varying(2048) AS "column",
    'Acorn\University\Models\Entity'::text AS model_type,
    acorn_university_entities.id AS model_id
   FROM public.acorn_university_entities
UNION ALL
 SELECT acorn_location_user_group_location.location_id AS event_id,
    'public'::character varying(2048) AS schema,
    'acorn_location_user_group_location'::character varying(2048) AS "table",
    'location_id'::character varying(2048) AS "column",
    'Acorn\Location\Models\UserGroupLocation'::text AS model_type,
    NULL::uuid AS model_id
   FROM public.acorn_location_user_group_location
UNION ALL
 SELECT acorn_exam_centres.location_id AS event_id,
    'public'::character varying(2048) AS schema,
    'acorn_exam_centres'::character varying(2048) AS "table",
    'location_id'::character varying(2048) AS "column",
    'Acorn\Exam\Models\Centre'::text AS model_type,
    acorn_exam_centres.id AS model_id
   FROM public.acorn_exam_centres
UNION ALL
 SELECT acorn_servers.location_id AS event_id,
    'public'::character varying(2048) AS schema,
    'acorn_servers'::character varying(2048) AS "table",
    'location_id'::character varying(2048) AS "column",
    'Acorn\\Models\Server'::text AS model_type,
    acorn_servers.id AS model_id
   FROM public.acorn_servers;


--
-- Name: acorn_location_lookup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_lookup (
    id uuid NOT NULL,
    address character varying(1024) NOT NULL,
    city character varying(1024) NOT NULL,
    zip character varying(1024) NOT NULL,
    country_code character varying(1024) NOT NULL,
    state_code character varying(1024) NOT NULL,
    latitude character varying(1024) NOT NULL,
    longitude character varying(1024) NOT NULL,
    vicinity character varying(1024) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL
);


--
-- Name: acorn_location_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acorn_location_types (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(1024) NOT NULL,
    description text,
    parent_type_id uuid,
    server_id uuid NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    created_by_user_id uuid,
    response text,
    colour character varying(1024),
    image character varying(1024)
);


--
-- Name: acorn_location_lookup acorn_location_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_lookup
    ADD CONSTRAINT acorn_location_location_pkey PRIMARY KEY (id);


--
-- Name: acorn_location_areas area_area_type; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT area_area_type UNIQUE (name, area_type_id);


--
-- Name: acorn_location_address_types location_address_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_address_types
    ADD CONSTRAINT location_address_types_pkey PRIMARY KEY (id);


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
-- Name: acorn_location_types location_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_types
    ADD CONSTRAINT location_type_name_unique UNIQUE (name);


--
-- Name: acorn_location_types location_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_types
    ADD CONSTRAINT location_types_pkey PRIMARY KEY (id);


--
-- Name: acorn_location_area_types name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_area_types
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: dr_acorn_location_address_types_replica_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dr_acorn_location_address_types_replica_identity ON public.acorn_location_address_types USING btree (server_id, id) WITH (fillfactor='100', deduplicate_items='true');


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
-- Name: dr_acorn_location_types_replica_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dr_acorn_location_types_replica_identity ON public.acorn_location_types USING btree (server_id, id);


--
-- Name: fki_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_address_id ON public.acorn_location_user_addresses USING btree (address_id);


--
-- Name: fki_address_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_address_type_id ON public.acorn_location_user_addresses USING btree (address_type_id);


--
-- Name: fki_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_location_id ON public.acorn_location_user_group_location USING btree (location_id);


--
-- Name: fki_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_type_id ON public.acorn_location_locations USING btree (type_id);


--
-- Name: acorn_location_address_types tr_acorn_location_address_types_new_replicated_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_address_types_new_replicated_row BEFORE INSERT ON public.acorn_location_address_types FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_new_replicated_row();

ALTER TABLE public.acorn_location_address_types ENABLE ALWAYS TRIGGER tr_acorn_location_address_types_new_replicated_row;


--
-- Name: acorn_location_address_types tr_acorn_location_address_types_server_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_address_types_server_id BEFORE INSERT ON public.acorn_location_address_types FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_server_id();


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
-- Name: acorn_location_types tr_acorn_location_types_new_replicated_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_types_new_replicated_row BEFORE INSERT ON public.acorn_location_types FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_new_replicated_row();

ALTER TABLE public.acorn_location_types ENABLE ALWAYS TRIGGER tr_acorn_location_types_new_replicated_row;


--
-- Name: acorn_location_types tr_acorn_location_types_server_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tr_acorn_location_types_server_id BEFORE INSERT ON public.acorn_location_types FOR EACH ROW EXECUTE FUNCTION public.fn_acorn_server_id();


--
-- Name: acorn_location_locations address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES public.acorn_location_addresses(id) NOT VALID;


--
-- Name: acorn_location_user_addresses address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_user_addresses
    ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES public.acorn_location_addresses(id) NOT VALID;


--
-- Name: acorn_location_user_addresses address_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_user_addresses
    ADD CONSTRAINT address_type_id FOREIGN KEY (address_type_id) REFERENCES public.acorn_location_address_types(id) NOT VALID;


--
-- Name: acorn_location_addresses addresses_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_addresses
    ADD CONSTRAINT addresses_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.acorn_user_users(id);


--
-- Name: acorn_location_address_types addresses_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_address_types
    ADD CONSTRAINT addresses_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.acorn_user_users(id);


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
    ADD CONSTRAINT area_types_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.acorn_user_users(id);


--
-- Name: acorn_location_areas areas_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT areas_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.acorn_user_users(id);


--
-- Name: acorn_location_gps gps_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_gps
    ADD CONSTRAINT gps_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.acorn_user_users(id);


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
-- Name: acorn_location_user_group_location location_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_user_group_location
    ADD CONSTRAINT location_id FOREIGN KEY (location_id) REFERENCES public.acorn_location_locations(id) ON DELETE SET NULL NOT VALID;


--
-- Name: acorn_location_locations locations_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT locations_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.acorn_user_users(id);


--
-- Name: acorn_location_areas parent_area_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_areas
    ADD CONSTRAINT parent_area_id FOREIGN KEY (parent_id) REFERENCES public.acorn_location_areas(id) NOT VALID;


--
-- Name: acorn_location_types parent_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_types
    ADD CONSTRAINT parent_type_id FOREIGN KEY (parent_type_id) REFERENCES public.acorn_location_types(id);


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
-- Name: acorn_location_types server_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_types
    ADD CONSTRAINT server_id FOREIGN KEY (server_id) REFERENCES public.acorn_servers(id);


--
-- Name: acorn_location_address_types server_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_address_types
    ADD CONSTRAINT server_id FOREIGN KEY (server_id) REFERENCES public.acorn_servers(id);


--
-- Name: acorn_location_locations type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_locations
    ADD CONSTRAINT type_id FOREIGN KEY (type_id) REFERENCES public.acorn_location_types(id) NOT VALID;


--
-- Name: acorn_location_types types_created_by_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_types
    ADD CONSTRAINT types_created_by_user FOREIGN KEY (created_by_user_id) REFERENCES public.acorn_user_users(id);


--
-- Name: acorn_location_user_group_location user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_user_group_location
    ADD CONSTRAINT user_group_id FOREIGN KEY (user_group_id) REFERENCES public.acorn_user_user_groups(id) ON DELETE CASCADE NOT VALID;


--
-- Name: acorn_location_user_addresses user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acorn_location_user_addresses
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.acorn_user_users(id) ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

\unrestrict niC4FVKPKWleIyePZ0zb2RKBI8SivbvRYENmP7aybFeXrecPEGB3H1anaIq1wyh

SET search_path TO public;
