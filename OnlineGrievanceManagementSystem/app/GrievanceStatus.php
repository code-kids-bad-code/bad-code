<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GrievanceStatus extends Model
{
    //
    protected $table = 'table_grievance_status';
    protected $primaryKey = 'id';
    protected $fillable = ['grievance_id', 'status', 'eta', 'level', 'created_at'];
}
