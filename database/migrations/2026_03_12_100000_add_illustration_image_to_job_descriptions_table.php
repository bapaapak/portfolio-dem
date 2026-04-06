<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasColumn('job_descriptions', 'illustration_image')) {
            Schema::table('job_descriptions', function (Blueprint $table) {
                $table->string('illustration_image')->nullable()->after('items');
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('job_descriptions', 'illustration_image')) {
            Schema::table('job_descriptions', function (Blueprint $table) {
                $table->dropColumn('illustration_image');
            });
        }
    }
};
