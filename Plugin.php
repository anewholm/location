<?php namespace Acorn\Location;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
    /**
     * @var array Plugin dependencies
     * Requires Winter.Location for Google API lookup and Country/States
     */
    public $require = ['Winter.Location'];

    public function registerComponents()
    {
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
