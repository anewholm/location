<?php return [
    'plugin' => [
        'name' => 'Location',
        'description' => 'Saved locations'
    ],
    'models' => [
        'general' => [
            'id' => 'ID',
            'name' => 'Name',
            'type' => 'Type',
            'image' => 'Image',
            'select' => 'Select',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ],
        'location' => [
            'address' => 'Address',
            'parent' => 'Containing location',
            'vicinity' => 'Vicinity',
            'city' => 'City',
            'postalcode' => 'Postal Code',
            'country' => 'Country',
            'state' => 'State',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude',
            'add_area' => 'Add area >>',
            'add_gps' => 'Set GPS >>',
            'google_address' => 'Lookup on Google Maps',
        ],
    ],
];
