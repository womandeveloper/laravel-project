<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class Yonetim
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        /*
         * yonetim guard'ını kullanan bir giriş gerçekleştirildiyse ve
         * bu giriş yapan kullanıcının use yönetici user değeri 1 ise
         * return $next($request) : hiçbir sorun yok nolmal şekilde bu sayfayı aç
         * gerektiği gibi değilse oturum aç'a yönlendir
         * */
        if (Auth::guard('yonetim')->check() && Auth::guard('yonetim')->user()->yonetici_mi)
        {
            return $next($request);
        }

        return redirect()->route('yonetim.oturumac');
    }
}
