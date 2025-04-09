<?php namespace Acorn\Location\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Types Backend Controller
 */
class Types extends Controller
{
    /**
     * @var array Behaviors that are implemented by this controller.
     */
    public $implement = [
        \Backend\Behaviors\FormController::class,
        \Backend\Behaviors\ListController::class,
    ];

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Acorn.Location', 'location', 'types');
    }
}
