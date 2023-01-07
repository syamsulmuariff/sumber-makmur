<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\TestimoniController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ReportController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function(){
    Route::post('admin', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
    Route::post('logout', [AuthController::class, 'logout']);



});

Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'categories' => CategoryController::class

    ]);
});

Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'subcategories' => SubcategoryController::class

    ]);
});
Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'suppliers' => SupplierController::class
    ]);
});

Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'products' => ProductController::class
    ]);
});

Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'members' => MemberController::class
    ]);
});

Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'testimonis' => TestimoniController::class
    ]);
});

Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'reviews' => ReviewController::class
    ]);
});

Route::group([
    'middleware' => 'api'
], function(){
    Route::resources([
        'orders' => OrderController::class
    ]);

Route::get('pesanan/baru', [OrderController::class, 'baru']);
Route::get('pesanan/dikonfirmasi', [OrderController::class, 'dikonfirmasi']);
Route::get('pesanan/dikemas', [OrderController::class, 'dikemas']);
Route::get('pesanan/dikirim', [OrderController::class, 'dikirim']);
Route::get('pesanan/diterima', [OrderController::class, 'diterima']);
Route::get('pesanan/selesai', [OrderController::class, 'selesai']);

Route::post('pesanan/ubah_status/{order}', [OrderController::class, 'ubah_status']);

Route::get('reports', [ReportController::class, 'index']);
});
