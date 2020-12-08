<?php

use Illuminate\Database\Seeder;

//DB sınıfını kullandığımız için bu sınıfı çağırmalıyız
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(KategoriTableSeeder::class);
        $this->call(UrunTableSeeder::class);
        $this->call(KullaniciSeeder::class);
    }
}
