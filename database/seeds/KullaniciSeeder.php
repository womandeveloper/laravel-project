<?php

use App\Models\Kullanici;
use App\Models\KullaniciDetay;
use Illuminate\Database\Seeder;

class KullaniciSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Faker\Generator $faker)
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        Kullanici::truncate();
        KullaniciDetay::truncate();
        /*
         * bcrypt: Bunun yerine istersen Hash::make kütüphanesini de kullanabilirsin bcrypt buda benzer işlemi gerçekleştirir
         * */
        $kullanici_yonetici = Kullanici::create([
            'adsoyad'     => 'Çağla Öztürk',
            'email'       => 'angel_of_the_hell_16@hotmail.com',
            'sifre'       => bcrypt('123456'),
            'aktif_mi'    => 1,
            'yonetici_mi' => 1
        ]);
        $kullanici_yonetici->detay()->create([
            'adres'       => 'İstanbul',
            'telefon'     => '(312) 444 55 66',
            'ceptelefonu' => '(555) 444 55 66'
        ]);

        for ($i = 0; $i < 50; $i++) {
            $kullanici_musteri = Kullanici::create([
                'adsoyad'     => $faker->name,
                'email'       => $faker->unique()->safeEmail,
                'sifre'       => bcrypt('123456'),
                'aktif_mi'    => 1,
                'yonetici_mi' => 0
            ]);

            $kullanici_musteri->detay()->create([
                'adres'       => $faker->address,
                'telefon'     => $faker->e164PhoneNumber,
                'ceptelefonu' => $faker->e164PhoneNumber
            ]);
        }

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
