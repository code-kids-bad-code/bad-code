<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    //
    protected $table = 'table_department';
    protected $primaryKey = 'id';
    protected $fillable = ['college_id','name','logo','created_at','created_by'];
}
