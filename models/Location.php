<?php namespace Acorn\Location\Models;

use Acorn\Model;
use Acorn\Models\Server;
use System\Models\File;

// Useful
use BackendAuth;
use \Backend\Models\User;
use \Backend\Models\UserGroup;
use Exception;
use Flash;

/**
 * Model
 */
class Location extends Model
{
    use \Winter\Storm\Database\Traits\Validation;

    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;


    /**
     * @var string The database table used by the model.
     */
    public $table = 'acorn_location_locations';

    public $hasMany = [];
    public $belongsTo = [
        'address' => Address::class,
        'user_group' => UserGroup::class,
        'type' => Type::class,
        'server'  => Server::class,
    ];

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var array Attribute names to encode and decode using JSON.
     */
    public $jsonable = [];
}
