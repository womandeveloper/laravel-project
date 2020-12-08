<?php

namespace App\Http\Controllers;

use App\Models\Siparis;
use Illuminate\Http\Request;

class SiparisController extends Controller
{
    public function index(){
        //Siparis::all():tüm siparişleri çekmemi sğlar
        //whereHas:ilişkili bir tabloda filtreleme ypmayı sağlar
        //Sipariş tablosu  sepet ile ilişkili bu yzdn sepet içerisinde filtreleme gerçekleştircez
        $siparisler = Siparis::with('sepet')
            ->whereHas('sepet',function ($query){
                $query->where('kullanici_id', auth()->id());
            })
            ->orderByDesc('olusturma_tarihi')->get();
        return view('siparisler',compact('siparisler'));
    }

    public function detay($id)
    {
        $siparis = Siparis::with('sepet.sepet_urunler.urun')
            ->whereHas('sepet', function($query) {
                $query->where('kullanici_id', auth()->id());
            })
            ->where('siparis.id', $id)
            ->firstOrFail();

        return view('siparis', compact('siparis'));
    }
}
