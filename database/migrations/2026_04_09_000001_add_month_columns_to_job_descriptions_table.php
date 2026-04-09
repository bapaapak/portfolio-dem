<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            if (!Schema::hasColumn('job_descriptions', 'month')) {
                $table->unsignedTinyInteger('month')->nullable()->after('year');
            }
            if (!Schema::hasColumn('job_descriptions', 'month_end')) {
                $table->unsignedTinyInteger('month_end')->nullable()->after('year_end');
            }
        });
    }

    public function down(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            $table->dropColumn(['month', 'month_end']);
        });
    }
};
