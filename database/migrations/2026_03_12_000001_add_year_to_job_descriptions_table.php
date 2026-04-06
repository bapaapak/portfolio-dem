<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasColumn('job_descriptions', 'year')) {
            Schema::table('job_descriptions', function (Blueprint $table) {
                $table->year('year')->nullable()->after('type');
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('job_descriptions', 'year')) {
            Schema::table('job_descriptions', function (Blueprint $table) {
                $table->dropColumn('year');
            });
        }
    }
};
