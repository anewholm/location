<?php namespace AcornAssociated\Location;

use System\Classes\PluginBase;
use AcornAssociated\User\Models\UserGroup;
use AcornAssociated\User\Controllers\UserGroups;
use AcornAssociated\Location\Models\Location;

class Plugin extends PluginBase
{
    /**
     * @var array Plugin dependencies
     * Requires Winter.Location for Google API lookup and Country/States
     */
    public $require = ['Winter.Location', 'AcornAssociated.User'];

    public function boot()
    {
        UserGroup::extend(function ($model){
            $model->belongsTo['location'] = Location::class;
        });

        UserGroups::extendFormFields(function ($form, $model, $context) {
            if ($model instanceof UserGroup) {
                $form->addFields([
                    'location' => [
                        'label'       => 'acornassociated.location::lang.models.location.label',
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
                'label'       => 'acornassociated.location::lang.models.settings.label_plural',
                'description' => 'acornassociated.location::lang.models.settings.description',
                'category'    => 'AcornAssociated',
                'icon'        => 'icon-location',
                'class'       => 'AcornAssociated\Location\Models\Settings',
                'order'       => 500,
                'keywords'    => 'location',
                'permissions' => ['acornassociated.location.settings']
            ]
        ];
    }
}
