<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    //
    protected $table = 'user_student';
    protected $primaryKey = 'id';
    protected $fillable = ['user_id','name','profile_picture','college_id','university_id','branch','registration_number','reset_token','course','year','registration_status'];
}
