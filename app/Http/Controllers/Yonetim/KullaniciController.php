<?php

namespace App\Http\Controllers\Yonetim;

use App\Models\Kullanici;
use App\Models\KullaniciDetay;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class KullaniciController extends Controller
{
    public function index()
    {
        //filled:aranan değeri doldurulmuşsa
        if (request()->filled('aranan')) {
            request()->flash();
            $aranan = request('aranan');
            $list = Kullanici::where('adsoyad', 'like', "%$aranan%")
                ->orWhere('email', 'like', "%$aranan%")
                ->orderByDesc('olusturma_tarihi')
                ->paginate(8)
                ->appends('aranan', $aranan);
        } else {
            $list = Kullanici::orderByDesc('olusturma_tarihi')->paginate(8);    //orderBy('olusturma_tarihi','desc');
        }

        return view('yonetim.kullanici.index', compact('list'));
    }

    public function  oturumac(){
        if(request()->isMethod('POST')){
            $this->validate(request(), [
                'email' => 'required|email',
                'sifre' => 'required'
            ]);
            $credentials = [
                'email'       => request()->get('email'),   //veya request('email') de diyebilirsin
                'password'    => request()->get('sifre'),
                'yonetici_mi' => 1,
                'aktif_mi'    => 1
            ];
            /*
             * form'dan aldığımız değer sifre olsa bile attempt içinde
             * kullanacağımız değişken değerini password olarak tanımlamalıyız çünkü
             * laravel attempt fonksiyonu ile giriş işlemini yaparken bu lanlarda password
             * için özel bir değişken kullanmakta ve dolayısıyla formdan aldığımız değer farklı
             * bile olsa sabit olarak password kullanılmalıdır veritabanına kayıt yaparken şifre
             * diye kayıt etmesi için model dosyasında getAuthPassword metodunu override etmiştik
             *
             * bu true değerini alacaktır ve true değeri de giriş işleminin
             * beni hatırla özelliği ile gerçekleşmesini sağlayacaktır
             * */
            if(Auth::guard('yonetim')->attempt($credentials,request()->has('benihatirla'))){
                return redirect()->route('yonetim.anasayfa');
            }
            else{
                //withInput:email alanını otoatik doldurmasını sağlar
                //withErrors:sayfaya gönderilen tüm hataları error.blade yazdırır
                return back()->withInput()->withErrors(['email' => 'Giriş hatalı!']);
            }
        }
        return view('yonetim.oturumac');
    }

    public function oturumukapat()
    {
        //Yönetimle ilgili giriş işlemini sonlandır
        Auth::guard('yonetim')->logout();
        request()->session()->flush();
        request()->session()->regenerate();

        return redirect()->route('yonetim.oturumac');
    }

    public function form($id = 0)
    {
        //Boş bir kullanıcı kaydı oluştur
        $entry = new Kullanici;
        if ($id > 0) {
            $entry = Kullanici::find($id);
        }

        return view('yonetim.kullanici.form', compact('entry'));
    }
    public function kaydet($id = 0)
    {
        $this->validate(request(), [
            'adsoyad' => 'required',
            'email'   => 'required|email'
        ]);
        //only : Sadece belirlediğim değerleri al
        $data = request()->only('adsoyad', 'email');
        //filled : belirlenen alanın dolu olup olmadığını kontrol eder. Şifre alanı doldurulmuş ise güncellemeye dahil et
        if (request()->filled('sifre')) {
            $data['sifre'] = Hash::make(request('sifre'));
        }
        /*
         * has: Bir alanın doldurulup doldurulmadığını kontrol eder.
         * Daha doğrusu checkbox alanları için bir nevi seçilmiş mi anlamını ifade ediyor.
         * Çünkü checkbox alanları seçilmezse request ile gönderilmiyor.
         * Bu yüzden bunu filled ile değil HAS ile kontrol ediyoruz         *
         * */
        //has: checkbox alanları için seçilmiş mi kontrolü sağlar(gönderilmiş mi)
        $data['aktif_mi'] = request()->has('aktif_mi') && request('aktif_mi') == 1 ? 1 : 0;
        $data['yonetici_mi'] = request()->has('yonetici_mi') && request('yonetici_mi') == 1 ? 1 : 0;

        if ($id > 0) {
            $entry = Kullanici::where('id', $id)->firstOrFail();
            $entry->update($data);
        } else {
            $entry = Kullanici::create($data);
        }

        KullaniciDetay::updateOrCreate(
            ['kullanici_id' => $entry->id],
            [
                //request()->only('adres', 'telefon','ceptelefonu');  :::  Kolon adları aynı ise kullanabilirsin
                'adres'       => request('adres'),
                'telefon'     => request('telefon'),
                'ceptelefonu' => request('ceptelefonu')
            ]
        );

        return redirect()
            ->route('yonetim.kullanici.duzenle', $entry->id)
            ->with('mesaj', ($id > 0 ? 'Güncellendi' : 'Kaydedildi'))
            ->with('mesaj_tur', 'success');
    }

    public function sil($id)
    {
        Kullanici::destroy($id);

        return redirect()
            ->route('yonetim.kullanici')
            ->with('mesaj', 'Kayıt silindi')
            ->with('mesaj_tur', 'success');
    }
}
