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
        if (!Schema::hasColumn('experiences', 'logo')) {
            Schema::table('experiences', function (Blueprint $table) {
                $table->string('logo')->nullable()->after('company');
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('experiences', 'logo')) {
            Schema::table('experiences', function (Blueprint $table) {
                $table->dropColumn('logo');
            });
        }
    }
};
