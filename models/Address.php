<?php

namespace Acorn\Location\Models;

use Acorn\Model;
use Acorn\Models\Server;

/**
 * Address Model
 */
class Address extends Model
{
    use \Winter\Storm\Database\Traits\Validation;

    /**
     * @var string The database table used by the model.
     */
    public $table = 'acorn_location_addresses';

    /**
     * @var array Guarded fields
     */
    protected $guarded = [];

    /**
     * @var array Fillable fields
     */
    protected $fillable = [];

    /**
     * @var array Validation rules for attributes
     */
    public $rules = [
        'area' => 'required',
    ];

    /**
     * @var array Attributes to be cast to native types
     */
    protected $casts = [];

    /**
     * @var array Attributes to be cast to JSON
     */
    protected $jsonable = [];

    /**
     * @var array Attributes to be appended to the API representation of the model (ex. toArray())
     */
    protected $appends = [];

    /**
     * @var array Attributes to be removed from the API representation of the model (ex. toArray())
     */
    protected $hidden = [];

    /**
     * @var array Attributes to be cast to Argon (Carbon) instances
     */
    public $timestamps = FALSE;
    protected $dates = [];

    /**
     * @var array Relations
     */
    public $hasOne = [];
    public $hasMany = [
        'location' => Location::class,
    ];
    public $hasOneThrough = [];
    public $hasManyThrough = [];
    public $belongsTo = [
        'area' => Area::class,
        'gps'  => GPS::class,
        'server' => Server::class,
    ];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];

    protected function getFullyQualifiedNameAttribute()
    {
        $this->load('area');
        $areaFQName = ($this->area ? $this->area->fullyQualifiedName() : trans('no_area'));
        return "$this->name, $this->number ($areaFQName)";
    }

    public function fullyQualifiedName()
    {
        return $this->fully_qualified_name;
    }

    public static function menuitemCount()
    {
        return self::count();
    }
}
