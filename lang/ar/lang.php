<?php

return [
    'plugin' => [
        'name' => 'مرافق',
        'description' => 'Saved facilities',
        'api_key_required' => 'مفتاح API الخاص بـ Google مطلوب للبحث عن عنوان Google',
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

            'qrcode_name' => 'رمز QR',
            'scan_qrcode' => 'مسح الرمز',
            'find_by_qrcode' => 'البحث بواسطة الرمز',
            'save_and_print' => 'حفظ وطباعة',
            'correct_and_print' => 'حفظ التصحيح وطباعته',
            'print' => 'Print',
            'user_group' => 'المجموعة',
            'user' => 'المستخدم',
            'from_user_group' => 'من المجموعة',

            'or' => 'أو',
            'centre_id' => 'معرف المركز',
            'leaf_id' => 'معرف الفرع',
        ],
        'location' => [
            'label' => 'الموقع',
            'label_plural' => 'المواقع',
            'initial_location' => 'الموقع الأولي',
            'parent' => 'Containing location',
            'create_area' => 'إنشاء منطقة >>',
            'set_area' => 'Set area >>',
            'add_gps' => 'Set GPS >>',
        ],
        'lookup' => [
            'label' => 'Lookup',
            'label_plural' => 'Lookups',
            'address' => 'Address',
            'google_address' => 'البحث على خرائط جوجل',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude',
            'vicinity' => 'Vicinity',
            'city' => 'مدينة',
            'postalcode' => 'Postal Code',
            'country' => 'Country',
            'state' => 'State',
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
