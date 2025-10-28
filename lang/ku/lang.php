<?php return [
    'plugin' => [
        'name' => 'Sercavan',
        'description' => 'Sercava xilas kirî',
        'api_key_required' => 'Ji bo lêgerîna navnîşana Google pêdivî ye ku mifteya API ya Google hebe'
    ],
    'permissions' => [
        'manage_locations' => 'Rêvebirina Sercavan'
    ],
    'models' => [
        'general' => [
            'id' => 'ID',
            'name' => 'Nav',
            'type' => 'Cure',
            'image' => 'Wêne',
            'select' => 'Hilbijêre',
            'created_at' => 'Çêkirî li',
            'updated_at' => 'Nûve kirî li',
            'user_group' => 'Koma',
            'user' => 'Kes',
            'from_user_group' => 'Ji koma'
        ],
        'settings' => [
            'label' => 'Mîhengên Cihê',
            'label_plural' => 'Mîhengên Cihan',
            'label_short_plural' => 'Mîheng',
            'description' => 'Rêvebirina mîhengên li ser cih',
            'google_address_lookup' => 'Lêgerîna navnîşana Google',
            'google_address_lookup_comment' => 'Pêdivî ye <a href="/backend/system/settings/update/winter/location/settings#primarytab-winterlocationlangsettingscredentials-tab">mifteya API</a>'
        ],
        'location' => [
            'label' => 'Sercav',
            'label_plural' => 'Sercavan',
            'create_area' => 'Qada nû çêbike >>',
            'add_gps' => 'GPS saz bike >>',
            'initial_location' => 'Cihê destpêkê'
        ],
        'type' => [
            'label' => 'Cure',
            'label_plural' => 'Cureyan',
            'parent' => 'Cureya Dêran'
        ],
        'lookup' => [
            'label' => 'Lêgerîn',
            'label_plural' => 'Lêgerînên',
            'address' => 'Navnîşan',
            'google_address' => 'Lêgerîn li Google Maps',
            'vicinity' => 'Nêzîkî',
            'city' => 'Bajar',
            'postalcode' => 'Koda Postê',
            'zip' => 'Koda Postê',
            'country_code' => 'Koda Welatê',
            'state_code' => 'Koda Dewletê',
            'latitude' => 'Erşîf',
            'longitude' => 'Dirêjî'
        ],
        'area' => [
            'label' => 'Qada',
            'label_plural' => 'Qadan',
            'parent' => 'Qada Têkildar'
        ],
        'address' => [
            'label' => 'Navnîşan',
            'label_plural' => 'Navnîşan',
            'number' => 'Hejmara',
            'street' => 'Çiyayê',
            'latitude' => 'Erşîf',
            'longitude' => 'Dirêjî',
            'auto_location' => 'Cihê girêdayî biafirîne',
            'select_existing' => 'Navnîşana berdest hilbijêre'
        ],
        'gps' => [
            'label' => 'GPS',
            'label_plural' => 'GPSan',
            'longitude' => 'Dirêjî',
            'latitude' => 'Erşîf'
        ],
        'areatype' => [
            'label' => 'Cureya Qada',
            'label_plural' => 'Cureyan Qada'
        ],
        'addresstype' => [
            'label' => 'Cureyê navnîşanê',
            'label_plural' => 'Cureyên navnîşanê'
        ],
    ]
];
