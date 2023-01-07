<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\Subcategory;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
class ProductController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth')->only(['list']);
        $this->middleware('auth:api')->only(['store', 'update', 'delete']);

    }

    public function list()
    {
        $categories = Category::all();
        $subcategories = Subcategory::all();
        $suppliers = Supplier::all();
        return view('product.index', compact('categories', 'subcategories', 'suppliers'));
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::with('category', 'subcategory', 'supplier')->get();

        return response()->json([
            'data' => $products

        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)

    {
        $validator = Validator::make($request->all(), [
            'id_kategori' => 'required',
            'id_supplier' => 'required',
            'id_subkategori' => 'required',
            'nama_barang' => 'required',
            'gambar' => 'required',
            'deskripsi' => 'required',
            'harga' => 'required',
            'gambar' => 'required|image|mimes:jpg,png,jpeg,webp',

        ]);

        if ($validator->fails()){
            return response()->json(
                $validator->errors().
                422
            );
        }

        $input =$request->all();

        if ($request->has('gambar')){
            $gambar =$request->file('gambar');
            $nama_gambar = time() . rand(1,9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        }




        $Product = Product::create($input);

        return response()->json([
            'success' => true,
            'data' => $Product
        ]);


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $Product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $Product)
    {

        return response()->json([
            'success' => true,
            'data' => $Product
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $Product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $Product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $Product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $Product)
    {
        $validator = Validator::make($request->all(), [
            'id_kategori' => 'required',
            'id_supplier' => 'required',
            'id_subkategori' => 'required',
            'nama_barang' => 'required',
            'gambar' => 'required',
            'deskripsi' => 'required',
            'harga' => 'required',
            'gambar' => 'required|image|mimes:jpg,png,jpeg,webp',

        ]);

        if ($validator->fails()){
            return response()->json(
                $validator->errors().
                422
            );
        }

        $input =$request->all();

        if ($request->has('gambar')){
            File::delete('uploads/' . $Product->gambar);
            $gambar =$request->file('gambar');
            $nama_gambar = time() . rand(1,9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        }else{
            unset($input['gambar']);
        }


        $Product->update($input);

        return response()->json([
            'success' => true,
            'message' => 'success',
            'data' => $Product
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $Product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $Product)
    {
        File::delete('uploads/' . $Product->gambar);
        $Product->delete();

        return response()->json([
            'success' => true,
            'message' => 'success'
        ]);
    }
}
