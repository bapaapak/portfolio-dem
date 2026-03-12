<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            $table->smallInteger('year_end')->nullable()->after('year');
        });
    }

    public function down(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            $table->dropColumn('year_end');
        });
    }
};
