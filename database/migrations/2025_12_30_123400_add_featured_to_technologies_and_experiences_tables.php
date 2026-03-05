<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('technologies', function (Blueprint $table) {
            $table->boolean('featured')->default(false)->after('is_active');
        });

        Schema::table('experiences', function (Blueprint $table) {
            $table->boolean('featured')->default(false)->after('order');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('technologies', function (Blueprint $table) {
            $table->dropColumn('featured');
        });

        Schema::table('experiences', function (Blueprint $table) {
            $table->dropColumn('featured');
        });
    }
};
