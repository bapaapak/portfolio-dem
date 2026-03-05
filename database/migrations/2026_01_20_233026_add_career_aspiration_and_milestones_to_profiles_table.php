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
        Schema::table('profiles', function (Blueprint $table) {
            $table->text('career_aspiration')->nullable()->after('story');
            $table->text('career_aspiration_id')->nullable()->after('career_aspiration');
            $table->json('career_milestones')->nullable()->after('career_aspiration_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('profiles', function (Blueprint $table) {
            $table->dropColumn(['career_aspiration', 'career_aspiration_id', 'career_milestones']);
        });
    }
};
