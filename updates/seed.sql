do $BODY$
declare pid uuid;
begin
	insert into public.acorn_location_area_types(name) values('Country');
	insert into public.acorn_location_area_types(name) values('Canton');
	insert into public.acorn_location_area_types(name) values('City');
	insert into public.acorn_location_area_types(name) values('Village');
	insert into public.acorn_location_area_types(name) values('Town');
	insert into public.acorn_location_area_types(name) values('Comune');

	insert into public.acorn_location_areas(name, area_type_id, parent_area_id)
		select 'Syria', id, NULL from public.acorn_location_area_types atp
		where atp.name = 'Country' returning id into pid;
	insert into public.acorn_location_areas(name, area_type_id, parent_area_id)
		select 'Cezîra', id, pid
		from public.acorn_location_area_types atp
		where atp.name = 'Canton';
	insert into public.acorn_location_gps(longitude, latitude)
		values(37.0343936,41.2146239) returning id into pid;
	insert into public.acorn_location_areas(name, area_type_id, parent_area_id, gps_id)
		select 'Qamişlo', id, (select id from public.acorn_location_areas where name='Cezîra' limit 1),
				pid
		from public.acorn_location_area_types atp
		where atp.name = 'City';
	insert into public.acorn_location_gps(longitude, latitude)
		values(36.5166478,40.7416334) returning id into pid;
	insert into public.acorn_location_areas(name, area_type_id, parent_area_id, gps_id)
		select 'Al Hêseke', id, (select id from public.acorn_location_areas where name='Cezîra' limit 1),
				pid
		from public.acorn_location_area_types atp
		where atp.name = 'City';

	-- Facility types
	insert into public.acorn_location_types(name) values('Office');
	insert into public.acorn_location_types(name) values('Warehouse');
	insert into public.acorn_location_types(name) values('Supplier');
end
$BODY$;
