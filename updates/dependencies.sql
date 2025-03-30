-- Changes to Acorn.User UserGroups to add facility (location)
ALTER TABLE IF EXISTS public.acorn_user_user_groups
    ADD COLUMN location_id uuid;

ALTER TABLE ONLY public.acorn_user_user_groups
    ADD CONSTRAINT location_id FOREIGN KEY (location_id) REFERENCES public.acorn_location_locations(id) 
        ON DELETE SET NULL
        NOT VALID;
