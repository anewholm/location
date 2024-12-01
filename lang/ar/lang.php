<?php

return [
    'plugin' => [
        'name' => 'مرافق',
        'description' => 'Saved facilities',
        'api_key_required' => 'مفتاح API الخاص بـ Google مطلوب للبحث عن عنوان Google',
    ],
    'permissions' => [
        'manage_locations' => 'إدارة المواقع',
    ],
    'models' => [
        'general' => [
            'id' => 'المعرف',
            'name' => 'الأسم',
            'type' => 'النوع',
            'image' => 'الصور',
            'select' => 'إختيار',
            'created_at' => 'تم التسجيل في',
            'updated_at' => 'تم التحديث في',

            'user_group' => 'المجموعة',
            'user' => 'المستخدم',
            'from_user_group' => 'من المجموعة',
        ],
        'location' => [
            'label' => 'الموقع',
            'label_plural' => 'المواقع',
            'create_area' => 'إنشاء منطقة >>',
            'add_gps' => 'Set GPS >>',
            'initial_location' => 'الموقع الأولي',
        ],
        'type' => [
            'label' => 'Type',
            'label_plural' => 'Types',
            'parent' => 'Parent Type',
        ],
        'lookup' => [
            'label' => 'Lookup',
            'label_plural' => 'Lookups',
            'address' => 'Address',

            'google_address' => 'البحث على خرائط جوجل',

            'vicinity' => 'Vicinity',
            'city' => 'مدينة',
            'postalcode' => 'Postal Code',
            'zip' => 'Postal Code',
            'country_code' => 'Country code',
            'state_code' => 'State code',
            'latitude' => 'خط العرض',
            'longitude' => 'خط الطول',
        ],
        'area' => [
            'label' => 'منطقة',
            'label_plural' => 'مناطق',
            'parent' => 'محتوى المنطقة',
        ],
        'address' => [
            'label' => 'العنوان',
            'label_plural' => 'العناوين',
            'number' => 'الرقم',
            'street' => 'الشارع',
            'longitude' => 'خط الطول',
            'latitude' => 'خط العرض',
            'auto_location' => 'إنشاء موقع مرتبط',
            'select_existing' => 'حدد عنوانًا موجودًا',
        ],
        'gps' => [
            'label' => 'موقع الخريط',
            'label_plural' => 'موقع الخرائط',
            'longitude' => 'خط الطول',
            'latitude' => 'خط العرض',
        ],
        'areatype' => [
            'label' => 'نوع المنطقة',
            'label_plural' => 'أنواع المناطق',
        ],
    ],
];
