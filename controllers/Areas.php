<?php namespace AcornAssociated\Location\Controllers;

use BackendMenu;
use AcornAssociated\Controller;

/**
 * Area Backend Controller
 */
class Areas extends Controller
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

        BackendMenu::setContext('AcornAssociated.Location', 'locations', 'areas');
    }
}
