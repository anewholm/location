<?php namespace Acorn\Location\Controllers;

use BackendMenu;
use Acorn\Controller;

/**
 * Area Backend Controller
 */
class Areas extends Controller
{
    public $bodyClass = 'compact-container';
    public $implement = [
        \Acorn\Behaviors\FormController::class,
        \Acorn\Behaviors\ListController::class,
    ];

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Acorn.Location', 'locations', 'areas');
    }
}
