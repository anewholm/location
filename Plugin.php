<?php namespace Acorn\Location;

use System\Classes\PluginBase;
use Acorn\User\Models\User;
use Acorn\User\Models\UserGroup;
use Acorn\User\Controllers\Users;
use Acorn\User\Controllers\UserGroups;
use Acorn\Location\Models\Location;
use Acorn\Location\Models\UserAddress;

class Plugin extends PluginBase
{
    /**
     * @var array Plugin dependencies
     * Requires Winter.Location for Google API lookup and Country/States
     */
    public $require = ['Winter.Location', 'Acorn.User'];

    public function boot()
    {
        // ------------------------------------------------ User location
        User::extend(function ($model){
            $model->hasMany['user_addresses'] = [
                UserAddress::class,
                'table' => 'acorn_location_user_addresses'
            ];
        });

        Users::extendFormFields(function ($form, $model, $context) {
            if ($model instanceof User) {
                $form->addTabFields([
                    'user_addresses' => [
                        'label'       => 'acorn.location::lang.models.address.label_plural',
                        'span'        => 'storm',
                        'type'        => 'relationmanager',
                        'cssClass'    => 'nolabel col-xs-12',
                        'tab'         => 'acorn.location::lang.models.address.label_plural',
                    ],
                ]);
            }
        });

        Users::extendListColumns(function ($list, $model) {
            if ($model instanceof User) {
                $list->addColumns([
                    'user_addresses' => [
                        'label'     => 'acorn.location::lang.models.address.label_plural',
                        'type'      => 'partial',
                        'path'      => 'multi',
                        'relation'  => 'user_addresses',
                        'valueFrom' => 'name',
                        'sortable'  => true,
                    ],
                ]);
            }
        });

        // ------------------------------------------------ UserGroup location
        UserGroup::extend(function ($model){
            $model->belongsToMany['locations'] = [
                Location::class,
                'table' => 'acorn_location_user_group_location'
            ];
        });

        UserGroups::extendFormFields(function ($form, $model, $context) {
            if ($model instanceof UserGroup) {
                $form->addFields([
                    'locations' => [
                        'label'       => 'acorn.location::lang.models.location.label_plural',
                        'span'        => 'auto',
                        'type'        => 'relation',
                    ],
                ]);
            }
        });

        UserGroups::extendListColumns(function ($list, $model) {
            if ($model instanceof UserGroup) {
                $list->addColumns([
                    'locations' => [
                        'label'    => 'acorn.location::lang.models.location.label_plural',
                        'type'     => 'partial',
                        'path'     => 'multi',
                        'relation' => 'locations',
                        'sortable' => true,
                    ],
                ]);
            }
        });
    }

    public function registerSettings()
    {
        return [
            'settings' => [
                'label'       => 'acorn.location::lang.models.settings.label_plural',
                'description' => 'acorn.location::lang.models.settings.description',
                'category'    => 'Acorn',
                'icon'        => 'icon-location',
                'class'       => 'Acorn\Location\Models\Settings',
                'order'       => 500,
                'keywords'    => 'location',
                'permissions' => ['acorn.location.settings']
            ]
        ];
    }

    public function registerPermissions() 
    {
        return [
            'acorn.location.manage_locations' => [
                'label' => 'acorn.location::lang.permissions.manage_locations',
                'tab'   => 'acorn.location::lang.plugin.name'
            ],
            'acorn.location.location_create' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.location_create'
            ],
            'acorn.location.location_delete' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.location_delete'
            ],
            'acorn.location.locationtype_create' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.locationtype_create'
            ],
            'acorn.location.locationtype_delete' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.locationtype_delete'
            ],

            'acorn.location.area_create' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.area_create'
            ],
            'acorn.location.area_delete' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.area_delete'
            ],
            
            'acorn.location.areatype_create' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.areatype_create'
            ],
            'acorn.location.areatype_delete' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.areatype_delete'
            ],

            'acorn.location.address_create' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.address_create'
            ],
            'acorn.location.address_delete' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.address_delete'
            ],

            'acorn.location.addresstype_create' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.addresstype_create'
            ],
            'acorn.location.addresstype_delete' => [
                'tab' => 'acorn.location::lang.plugin.name',
                'label' => 'acorn.location::lang.permissions.addresstype_delete'
            ],
        ];
    }    
}
