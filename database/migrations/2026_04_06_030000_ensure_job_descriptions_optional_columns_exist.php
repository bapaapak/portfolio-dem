<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('job_descriptions')) {
            return;
        }

        Schema::table('job_descriptions', function (Blueprint $table) {
            if (!Schema::hasColumn('job_descriptions', 'year')) {
                $table->year('year')->nullable()->after('type');
            }

            if (!Schema::hasColumn('job_descriptions', 'year_end')) {
                $table->smallInteger('year_end')->nullable()->after('year');
            }

            if (!Schema::hasColumn('job_descriptions', 'illustration_image')) {
                $table->string('illustration_image')->nullable()->after('items');
            }
        });
    }

    public function down(): void
    {
        // Intentionally left empty to avoid dropping production data.
    }
};
