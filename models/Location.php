<?php namespace Acorn\Location\Models;

use Acorn\Model;

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

    public $hasMany = [
        'children' => [Location::class, 'key' => 'parent_area_id'],
    ];
    public $belongsTo = [
        'parent' => [Location::class, 'key' => 'parent_area_id'],
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