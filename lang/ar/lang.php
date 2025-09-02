<?php return [
    'plugin' => [
        'name' => 'المرافق',
        'description' => 'مرفق محفوظ',
        'api_key_required' => 'مطلوب مفتاح API من Google للبحث عن العنوان في Google'
    ],
    'permissions' => [
        'manage_locations' => 'إدارة المرافق'
    ],
    'models' => [
        'general' => [
            'id' => 'المعرف',
            'name' => 'الاسم',
            'type' => 'النوع',
            'image' => 'الصورة',
            'select' => 'اختر',
            'created_at' => 'تاريخ الإنشاء',
            'updated_at' => 'تاريخ التحديث',
            'user_group' => 'المجموعة',
            'user' => 'الشخص',
            'from_user_group' => 'من المجموعة'
        ],
        'settings' => [
            'label' => 'إعداد الموقع',
            'label_plural' => 'إعدادات المواقع',
            'label_short_plural' => 'الإعدادات',
            'description' => 'إدارة الإعدادات المعتمدة على الموقع',
            'google_address_lookup' => 'البحث عن العنوان عبر Google',
            'google_address_lookup_comment' => 'يتطلب <a href="/backend/system/settings/update/winter/location/settings#primarytab-winterlocationlangsettingscredentials-tab">مفتاح API</a>'
        ],
        'location' => [
            'label' => 'المرفق',
            'label_plural' => 'المرافق',
            'create_area' => 'إنشاء منطقة >>',
            'add_gps' => 'تعيين GPS >>',
            'initial_location' => 'الموقع الأولي'
        ],
        'type' => [
            'label' => 'النوع',
            'label_plural' => 'الأنواع',
            'parent' => 'النوع الرئيسي'
        ],
        'lookup' => [
            'label' => 'البحث',
            'label_plural' => 'البحوث',
            'address' => 'العنوان',
            'google_address' => 'البحث في خرائط Google',
            'vicinity' => 'الجوار',
            'city' => 'المدينة',
            'postalcode' => 'الرمز البريدي',
            'zip' => 'الرمز البريدي',
            'country_code' => 'رمز الدولة',
            'state_code' => 'رمز الولاية',
            'latitude' => 'خط العرض',
            'longitude' => 'خط الطول'
        ],
        'area' => [
            'label' => 'المنطقة',
            'label_plural' => 'المناطق',
            'parent' => 'المنطقة المحتوية'
        ],
        'address' => [
            'label' => 'العنوان',
            'label_plural' => 'عناوين المستخدم',
            'number' => 'الرقم',
            'street' => 'الشارع',
            'latitude' => 'خط العرض',
            'longitude' => 'خط الطول',
            'auto_location' => 'إنشاء موقع مرتبط',
            'select_existing' => 'اختر عنوانًا موجودًا'
        ],
        'gps' => [
            'label' => 'GPS',
            'label_plural' => 'أجهزة GPS',
            'longitude' => 'خط الطول',
            'latitude' => 'خط العرض'
        ],
        'areatype' => [
            'label' => 'نوع المنطقة',
            'label_plural' => 'أنواع المناطق'
        ]
    ]
];
