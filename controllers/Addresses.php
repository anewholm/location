<?php namespace Acorn\Location\Controllers;

use BackendMenu;
use Acorn\Controller;

/**
 * Address Backend Controller
 */
class Addresses extends Controller
{
    public $bodyClass = 'compact-container';
    public $implement = [
        \Acorn\Behaviors\FormController::class,
        \Acorn\Behaviors\ListController::class,
    ];

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Acorn.Location', 'locations', 'addresses');
    }
}
