<?php namespace AcornAssociated\Location;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
    /**
     * @var array Plugin dependencies
     */
    public $require = ['Winter.Location', 'AcornAssociated.User'];

    public function registerComponents()
    {
    }

    public function registerSettings()
    {
    }
}
