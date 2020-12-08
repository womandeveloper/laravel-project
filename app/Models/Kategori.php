<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Kategori extends Model
{
    //Bu model SoftDeletes yapısıyla çalışacak silindiği anda tablodan silinmeyecek tabloya silinme tarihini ekleyecek
    use SoftDeletes;
    //Tablo adımızı belirtmezsek kategori--s tablosuu arar
    protected  $table = "kategori";
    //Eloquent yapısı ile create yaptığımız zaman güvenlik amaçlı hata alırız bu nedenle bu alanların girilebilir lduğunu belirtmeliyiz
    //protected $fillable = ['kategori_adi','slug'];
    protected  $guarded = [];
    /*
    slug alanının hiçbir şekilde eklenebilir olmasını istemiyorum
    protected $guarded = ['slug'];
    $guarded alanını boş bir dizi olarak ayarlarsak  veritabanına her türlü kolonu ekleyebilir olduğunu söyleriz.Tek tek fillable ile girmekten kurtuluruz
    protected  $guarded = [];
    */
    //Biz isimlerimizi ne kdr türkçeleştirsekte Laravel bunu haala kendi isimleriyle arar o nedenle belirtmeliyiz
    const CREATED_AT = 'olusturulma_tarihi';
    const UPDATED_AT = 'guncelleme_tarihi';
    const DELETED_AT = 'silinme_tarihi';

    public function urunler(){
        return $this->belongsToMany('App\Models\Urun','kategori_urun');
    }
    public function ust_kategori() {
        return $this->belongsTo('App\Models\Kategori', 'ust_id')->withDefault([
            'kategori_adi' => 'Ana Kategori'
        ]);
    }
}
