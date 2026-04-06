<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class EnsureProfilesAspirationImageColumnExists extends Migration
{
    public function up(): void
    {
        if (!Schema::hasColumn('profiles', 'aspiration_image')) {
            Schema::table('profiles', function (Blueprint $table) {
                $table->string('aspiration_image')->nullable()->after('career_milestones');
            });
        }
    }

    public function down(): void
    {
        // Keep column in place on rollback to avoid dropping production data unexpectedly.
    }
}
