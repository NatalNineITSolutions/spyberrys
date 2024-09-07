<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AadhaarUser extends Model
{
    use HasFactory;

    protected $table = 'aadhaar_users';

    protected $fillable = [
        'user_id',
        'aadhar_number',
        'aadhar_number_response'
    ];
}
