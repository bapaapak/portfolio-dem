<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\VisitorLog;
use Illuminate\Http\Request;

class VisitorController extends Controller
{
    public function index()
    {
        $visitors = VisitorLog::latest()->paginate(20);
        return view('admin.visitors.index', compact('visitors'));
    }
}
