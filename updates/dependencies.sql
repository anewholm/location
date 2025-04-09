-- Changes to AcornAssociated.User UserGroups to add facility (location)
ALTER TABLE IF EXISTS public.acornassociated_user_user_groups
    ADD COLUMN location_id uuid;

ALTER TABLE ONLY public.acornassociated_user_user_groups
    ADD CONSTRAINT location_id FOREIGN KEY (location_id) REFERENCES public.acornassociated_location_locations(id) 
        ON DELETE SET NULL
        NOT VALID;

-- Changes to AcornAssociated Servers to add facility (location)
ALTER TABLE IF EXISTS public.acornassociated_servers
    ADD COLUMN location_id uuid;
ALTER TABLE IF EXISTS public.acornassociated_servers
    ADD CONSTRAINT location_id FOREIGN KEY (location_id)
    REFERENCES public.acornassociated_location_locations (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;