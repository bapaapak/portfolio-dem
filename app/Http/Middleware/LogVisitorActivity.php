<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\VisitorLog;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cache;

use Illuminate\Support\Facades\Http;

class LogVisitorActivity
{
    /**
     * Requests that should not trigger visitor logging.
     */
    private function shouldSkip(Request $request): bool
    {
        return $request->is('admin/*')
            || $request->is('_debugbar/*')
            || $request->is('media/*')
            || $request->is('storage/*')
            || $request->is('build/*')
            || $request->is('css/*')
            || $request->is('js/*')
            || $request->is('images/*')
            || $request->is('favicon.ico')
            || $request->is('robots.txt');
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        return $next($request);
    }

    /**
     * Terminable middleware: runs after response has been sent.
     */
    public function terminate(Request $request, $response): void
    {
        if ($this->shouldSkip($request)) {
            return;
        }

        try {
            $ip = $request->ip();
            $location = [];

            if ($ip === '127.0.0.1' || $ip === '::1') {
                $location = [
                    'country' => 'Localhost',
                    'city' => 'Local Machine',
                    'region' => 'Dev Env',
                ];
            } else {
                $cacheKey = 'geo_ip_' . md5($ip);
                $location = Cache::remember($cacheKey, now()->addHours(12), function () use ($ip) {
                    try {
                        $geoResponse = Http::timeout(1)->get("http://ip-api.com/json/{$ip}");

                        if (!$geoResponse->successful()) {
                            return [];
                        }

                        $data = $geoResponse->json();
                        if (($data['status'] ?? null) !== 'success') {
                            return [];
                        }

                        return [
                            'country' => $data['country'] ?? null,
                            'city' => $data['city'] ?? null,
                            'region' => $data['regionName'] ?? null,
                        ];
                    } catch (\Throwable $e) {
                        return [];
                    }
                });
            }

            VisitorLog::create([
                'ip_address' => $ip,
                'url' => $request->fullUrl(),
                'method' => $request->method(),
                'user_agent' => $request->userAgent(),
                'country' => $location['country'] ?? null,
                'city' => $location['city'] ?? null,
                'region' => $location['region'] ?? null,
            ]);
        } catch (\Throwable $e) {
            // Fail silently so this never affects user-facing response.
            Log::error('Visitor Logging Failed: ' . $e->getMessage());
        }
    }
}
