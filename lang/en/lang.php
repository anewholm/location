<?php return [
    'plugin' => [
        'name' => 'Facilities',
        'description' => 'Saved facility',
        'api_key_required' => 'A Google API key is required for Google address lookup'
    ],
    'permissions' => [
        'manage_locations' => 'Manage Facilities'
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
            'user_group' => 'Group',
            'user' => 'Person',
            'from_user_group' => 'From Group'
        ],
        'settings' => [
            'label' => 'Location Setting',
            'label_plural' => 'Location Settings',
            'label_short_plural' => 'Settings',
            'description' => 'Manage location based settings',
            'google_address_lookup' => 'Google address lookup',
            'google_address_lookup_comment' => 'Requires <a href="/backend/system/settings/update/winter/location/settings#primarytab-winterlocationlangsettingscredentials-tab">API key</a>',
        ],
        'location' => [
            'label' => 'Facility',
            'label_plural' => 'Facilities',
            'create_area' => 'Create area >>',
            'add_gps' => 'Set GPS >>',
            'initial_location' => 'Initial Location'
        ],
        'type' => [
            'label' => 'Type',
            'label_plural' => 'Types',
            'parent' => 'Parent Type'
        ],
        'lookup' => [
            'label' => 'Lookup',
            'label_plural' => 'Lookups',
            'address' => 'Address',
            'google_address' => 'Lookup on Google Maps',
            'vicinity' => 'Vicinity',
            'city' => 'City',
            'postalcode' => 'Postal Code',
            'zip' => 'Postal Code',
            'country_code' => 'Country Code',
            'state_code' => 'State Code',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude'
        ],
        'area' => [
            'label' => 'Area',
            'label_plural' => 'Areas',
            'parent' => 'Containing Area'
        ],
        'address' => [
            'label' => 'Address',
            'label_plural' => 'Addresses',
            'number' => 'Number',
            'street' => 'Street',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude',
            'auto_location' => 'Create an associated Location',
            'select_existing' => 'Select an existing Address'
        ],
        'gps' => [
            'label' => 'GPS',
            'label_plural' => 'GPSs',
            'longitude' => 'Longitude',
            'latitude' => 'Latitude'
        ],
        'areatype' => [
            'label' => 'Area Type',
            'label_plural' => 'Area Types'
        ]
    ]
];