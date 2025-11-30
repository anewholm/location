<?php namespace Acorn\Location\Controllers;

use BackendMenu;
use Acorn\Controller;

class Locations extends Controller
{
    public $bodyClass = 'compact-container';

    public $implement = [        
        \Acorn\Behaviors\FormController::class,
        \Acorn\Behaviors\ListController::class,
        \Backend\Behaviors\ReorderController::class,
    ];

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Acorn.Location', 'location', 'locations');
    }
}
