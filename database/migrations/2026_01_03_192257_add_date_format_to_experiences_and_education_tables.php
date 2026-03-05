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
        Schema::table('experiences', function (Blueprint $table) {
            $table->string('date_format')->default('F Y')->after('end_date'); // 'F Y' (January 2024), 'Y' (2024)
        });

        Schema::table('education', function (Blueprint $table) {
            $table->string('date_format')->default('Y')->after('end_date'); // Education usually defaults to Year
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('experiences', function (Blueprint $table) {
            $table->dropColumn('date_format');
        });

        Schema::table('education', function (Blueprint $table) {
            $table->dropColumn('date_format');
        });
    }
};
