<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            if (!Schema::hasColumn('job_descriptions', 'title_en')) {
                $table->string('title_en')->nullable()->after('title');
            }
            if (!Schema::hasColumn('job_descriptions', 'description_en')) {
                $table->text('description_en')->nullable()->after('description');
            }
            if (!Schema::hasColumn('job_descriptions', 'items_en')) {
                $table->json('items_en')->nullable()->after('items');
            }
        });

        Schema::table('obstacle_challenges', function (Blueprint $table) {
            if (!Schema::hasColumn('obstacle_challenges', 'title_en')) {
                $table->string('title_en')->nullable()->after('title');
            }
            if (!Schema::hasColumn('obstacle_challenges', 'description_en')) {
                $table->text('description_en')->nullable()->after('description');
            }
            if (!Schema::hasColumn('obstacle_challenges', 'items_en')) {
                $table->json('items_en')->nullable()->after('items');
            }
        });
    }

    public function down(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            $table->dropColumn(['title_en', 'description_en', 'items_en']);
        });

        Schema::table('obstacle_challenges', function (Blueprint $table) {
            $table->dropColumn(['title_en', 'description_en', 'items_en']);
        });
    }
};
