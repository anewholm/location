do $BODY$
declare pid uuid;
begin
	-- id & name are unique
	insert into acorn_location_area_types(id, name) values('1ecf9d88-e963-4563-9dea-d9ef246977eb'::uuid, 'City')    on conflict(id) do nothing;
	insert into acorn_location_area_types(id, name) values('4c09bda0-32fe-41da-933e-d7fc441e15ce'::uuid, 'Village') on conflict(id) do nothing;
	insert into acorn_location_area_types(id, name) values('4eb637b9-7a39-4c90-9308-8c01929b019c'::uuid, 'Town')    on conflict(id) do nothing;
	insert into acorn_location_area_types(id, name) values('558b28b3-46b3-4e4e-84ce-021376882018'::uuid, 'Canton')  on conflict(id) do nothing;
	insert into acorn_location_area_types(id, name) values('8dfda3c6-3f2c-4a3a-a72a-f4e9391dd282'::uuid, 'Country') on conflict(id) do nothing;
	insert into acorn_location_area_types(id, name) values('b3de00b7-c169-40d5-9546-4d5f5715b014'::uuid, 'Comune')  on conflict(id) do nothing;

	insert into acorn_location_address_types(id, name) values('c5755550-9399-11f0-878f-976a78a3440c'::uuid, 'Birth Place')    on conflict(id) do nothing;
	insert into acorn_location_address_types(id, name) values('c57555d2-9399-11f0-8790-6360674ea76c'::uuid, 'Home') on conflict(id) do nothing;

	-- Syria & Cities
	insert into acorn_location_areas(id, name, area_type_id, parent_area_id)
		select 'a5ef5bf7-685d-428f-8e22-6cc61585ef53'::uuid, 'Syria', atp.id, NULL 
		from acorn_location_area_types atp
		where atp.name = 'Country' 
		on conflict(id) do nothing
		returning id into pid;
	insert into acorn_location_areas(id, name, area_type_id, parent_area_id)
		select 'bcf399c9-f540-4af9-9bde-a9b8604f6945'::uuid, 'Cezîra', atp.id, ar.id
		from acorn_location_areas ar,
		acorn_location_area_types atp
		where ar.name = 'Syria'
		and atp.name = 'Canton'
		on conflict(id) do nothing;
	insert into acorn_location_gps(id, longitude, latitude)
		values('dc102d24-150a-4c29-be41-c19a05c96441'::uuid, 37.0343936,41.2146239) 
		on conflict(id) do nothing
		returning id into pid;
	insert into acorn_location_areas(id, name, area_type_id, parent_area_id, gps_id)
		select 'dd7f024b-dab4-4fe4-bf3d-e296b75bbb78'::uuid, 'Qamişlo', atp.id, 
			(select id from acorn_location_areas where name='Cezîra' limit 1),
			pid
		from acorn_location_area_types atp
		where atp.name = 'City'
		on conflict(id) do nothing;
	insert into acorn_location_gps(id, longitude, latitude)
		values('89f754c0-d880-4998-9591-add8b6957f69'::uuid, 36.5166478,40.7416334) 
		on conflict(id) do nothing
		returning id into pid;
	insert into acorn_location_areas(id, name, area_type_id, parent_area_id, gps_id)
		select '089b779b-c6e3-4e4e-b147-f6e6df7887d0'::uuid, 'Al Hêseke', atp.id, 
			(select id from acorn_location_areas where name='Cezîra' limit 1),
			pid
		from acorn_location_area_types atp
		where atp.name = 'City'
		on conflict(id) do nothing;

	-- Facility types
	-- id & name are unique
	insert into acorn_location_types(id, name) values('c6fc851a-03f2-41f7-a40d-8ec5c1931149'::uuid, 'Office')    on conflict(id) do nothing;
	insert into acorn_location_types(id, name) values('f7d9ea09-bb0a-4518-931f-d3bb9cdbe978'::uuid, 'Supplier')  on conflict(id) do nothing;
	insert into acorn_location_types(id, name) values('ff4b2f0a-36e8-4210-8d13-b444faf21625'::uuid, 'Warehouse') on conflict(id) do nothing;
end
$BODY$;
