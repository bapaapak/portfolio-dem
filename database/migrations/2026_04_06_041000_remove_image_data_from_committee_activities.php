<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('committee_activities') || !Schema::hasColumn('committee_activities', 'image_data')) {
            return;
        }

        DB::table('committee_activities')->whereNotNull('image_data')->update(['image_data' => null]);

        Schema::table('committee_activities', function (Blueprint $table) {
            $table->dropColumn('image_data');
        });
    }

    public function down(): void
    {
        if (!Schema::hasTable('committee_activities') || Schema::hasColumn('committee_activities', 'image_data')) {
            return;
        }

        Schema::table('committee_activities', function (Blueprint $table) {
            $table->longText('image_data')->nullable()->after('image');
        });
    }
};
