<?php namespace Acorn\Location;

use System\Classes\PluginBase;
use Acorn\User\Models\User;
use Acorn\User\Models\UserGroup;
use Acorn\User\Controllers\Users;
use Acorn\User\Controllers\UserGroups;
use Acorn\Location\Models\Location;
use Acorn\Location\Models\Address;

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
            $model->belongsToMany['addresses'] = [
                Address::class,
                'table' => 'acorn_location_user_address'
            ];
        });

        Users::extendFormFields(function ($form, $model, $context) {
            if ($model instanceof User) {
                $form->addTabFields([
                    'addresses' => [
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
                    'addresses' => [
                        'label'    => 'acorn.location::lang.models.address.label_plural',
                        'type'     => 'partial',
                        'path'     => 'multi',
                        'relation' => 'addresses',
                        'sortable' => true,
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
}
