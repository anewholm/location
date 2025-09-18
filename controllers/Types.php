<?php namespace Acorn\Location\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Types Backend Controller
 */
class Types extends Controller
{
    public $bodyClass = 'compact-container';
    public $implement = [
        \Acorn\Behaviors\FormController::class,
        \Acorn\Behaviors\ListController::class,
    ];

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Acorn.Location', 'location', 'types');
    }
}
