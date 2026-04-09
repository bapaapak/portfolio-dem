<?php

namespace App\Models\Concerns;

use Illuminate\Support\Facades\Cache;

trait ClearsHomeCache
{
    protected static function bootClearsHomeCache(): void
    {
        static::saved(fn () => Cache::forget('home_index_payload_v1'));
        static::deleted(fn () => Cache::forget('home_index_payload_v1'));
    }
}
