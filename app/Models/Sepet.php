<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;

class Sepet extends Model
{
    use SoftDeletes;

    protected $table = "sepet";

    protected $guarded = [];

    const CREATED_AT = 'olusturma_tarihi';
    const UPDATED_AT = 'guncelleme_tarihi';
    const DELETED_AT = 'silinme_tarihi';

    public function siparis()
    {
        return $this->hasOne('App\Models\Siparis');
    }

    public function sepet_urunler()
    {
        //Bir sepete ait birden fazla ürün olabilir.
        return $this->hasMany('App\Models\SepetUrun');
    }

    public static function aktif_sepet_id()
    {
        //->whereRaw('si.id is null') :SİPARİŞ TABLOSUNDA KAYDI OLMAYANI BUL
        $aktif_sepet = DB::table('sepet as s')
            ->leftJoin('siparis as si', 'si.sepet_id', '=', 's.id')
            ->where('s.kullanici_id', auth()->id())
            ->whereRaw('si.id is null')
            ->orderByDesc('s.olusturma_tarihi')
            ->select('s.id')
            ->first();

        if (!is_null($aktif_sepet)) return $aktif_sepet->id;
    }

    public function sepet_urun_adet()
    {
        //Doğrudadn aktif model ile ilgili kaydı döndürür
        return DB::table('sepet_urun')->where('sepet_id', $this->id)->sum('adet');
    }

    public function kullanici()
    {
        return $this->belongsTo('App\Models\Kullanici');
    }
}
