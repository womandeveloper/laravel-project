<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use Illuminate\Http\Request;

class KategoriController extends Controller
{
    public function index($slug_kategoriadi){
        //firstOrFail:kayıt bulunamadıysa hata döndür
        $kategori = Kategori::where('slug', $slug_kategoriadi)->firstOrFail();
        $altkategoriler = Kategori::where('ust_id', $kategori->id)->get();

        /*$order = request()->input('order');
        **$order = request()->query('order');
        */
        $order = request('order');
        if ($order == 'coksatanlar') {

            $urunler = $kategori->urunler()
                ->join('urun_detay', 'urun_detay.urun_id', 'urun.id')
                ->orderBy('urun_detay.goster_cok_satan','desc')
                ->paginate(3);

        } else if ($order == 'yeni') {
            $urunler = $kategori->urunler()
                ->distinct()
                ->orderByDesc('guncelleme_tarihi')
                ->paginate(3);
        } else {
            $urunler = $kategori->urunler()
                ->distinct()
                ->orderByDesc('guncelleme_tarihi')
                ->paginate(3);
        }

        return view('kategori', compact('kategori', 'altkategoriler', 'urunler'));
    }
}
