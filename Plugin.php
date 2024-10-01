<?php namespace Acorn\Location;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
    /**
     * @var array Plugin dependencies
     */
    public $require = ['Winter.Location', 'Acorn.User'];

    public function registerComponents()
    {
    }

    public function registerSettings()
    {
    }
}
