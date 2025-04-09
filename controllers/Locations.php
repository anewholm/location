<?php namespace AcornAssociated\Location\Controllers;

use AcornAssociated\Controller;
use BackendMenu;

class Locations extends Controller
{
    public $implement = [        'AcornAssociated\Behaviors\ListController',        'Backend\Behaviors\FormController',        'Backend\Behaviors\ReorderController'    ];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';
    public $reorderConfig = 'config_reorder.yaml';

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('AcornAssociated.Location', 'location-main-menu-item');
    }
}
