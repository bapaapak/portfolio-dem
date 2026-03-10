<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('committee_activities', function (Blueprint $table) {
            $table->longText('image_data')->nullable()->after('image');
        });
    }

    public function down(): void
    {
        Schema::table('committee_activities', function (Blueprint $table) {
            $table->dropColumn('image_data');
        });
    }
};
