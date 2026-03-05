<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\VisitorLog;
use Illuminate\Support\Facades\Log;

use Illuminate\Support\Facades\Http;

class LogVisitorActivity
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        // Skip logging for admin routes, assets, or api if needed
        if (!$request->is('admin/*') && !$request->is('_debugbar/*')) {
             try {
                $uniqueVisitorId = session()->getId(); // Could use session to dedup if needed, but for now simple log
                
                $ip = $request->ip();
                $location = [];

                // Simple check for local/private IP to avoid unnecessary API calls
                if ($ip == '127.0.0.1' || $ip == '::1') {
                    $location = [
                        'country' => 'Localhost',
                        'city' => 'Local Machine',
                        'region' => 'Dev Env'
                    ];
                } else {
                    // Fetch location from ip-api.com (free, no key, limited to 45 req/min)
                    // In production, use queue or a robust service with caching
                    try {
                        $response = Http::timeout(2)->get("http://ip-api.com/json/{$ip}");
                        if ($response->successful()) {
                            $data = $response->json();
                            if ($data['status'] === 'success') {
                                $location = [
                                    'country' => $data['country'] ?? null,
                                    'city' => $data['city'] ?? null,
                                    'region' => $data['regionName'] ?? null,
                                ];
                            }
                        }
                    } catch (\Exception $e) {
                        // Ignore API failures, just log without location
                    }
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
            } catch (\Exception $e) {
                // Fail silently so we don't break the app if logging fails
                Log::error('Visitor Logging Failed: ' . $e->getMessage());
            }
        }

        return $next($request);
    }
}
