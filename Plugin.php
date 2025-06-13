<?php namespace Acorn\Location;

use System\Classes\PluginBase;
use Acorn\User\Models\User;
use Acorn\User\Models\UserGroup;
use Acorn\User\Controllers\Users;
use Acorn\User\Controllers\UserGroups;
use Acorn\Location\Models\Location;

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
            $model->belongsTo['location'] = Location::class;
        });

        Users::extendFormFields(function ($form, $model, $context) {
            if ($model instanceof User) {
                $form->addFields([
                    'location' => [
                        'label'       => 'acorn.location::lang.models.location.label',
                        'span'        => 'auto',
                        'type'        => 'relation',
                        'placeholder' => 'backend::lang.form.select',
                    ],
                ]);
            }
        });

        Users::extendListColumns(function ($list, $model) {
            if ($model instanceof User) {
                $list->addColumns([
                    'location' => [
                        'type'     => 'text',
                        'relation' => 'location',
                        'select'   => 'name',
                        'sortable' => true,
                    ],
                ]);
            }
        });

        // ------------------------------------------------ UserGroup location
        UserGroup::extend(function ($model){
            $model->belongsTo['location'] = Location::class;
        });

        UserGroups::extendFormFields(function ($form, $model, $context) {
            if ($model instanceof UserGroup) {
                $form->addFields([
                    'location' => [
                        'label'       => 'acorn.location::lang.models.location.label',
                        'span'        => 'auto',
                        'type'        => 'relation',
                        'placeholder' => 'backend::lang.form.select',
                    ],
                ]);
            }
        });

        UserGroups::extendListColumns(function ($list, $model) {
            if ($model instanceof UserGroup) {
                $list->addColumns([
                    'location' => [
                        'type'     => 'text',
                        'relation' => 'location',
                        'select'   => 'name',
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
