<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            $table->longText('illustration_image_data')->nullable()->after('illustration_image');
        });

        Schema::table('experiences', function (Blueprint $table) {
            $table->longText('logo_data')->nullable()->after('logo');
        });

        Schema::table('education', function (Blueprint $table) {
            $table->longText('logo_data')->nullable()->after('logo');
        });

        Schema::table('committee_activities', function (Blueprint $table) {
            $table->longText('image_data')->nullable()->after('image');
        });

        Schema::table('profiles', function (Blueprint $table) {
            $table->longText('aspiration_image_data')->nullable()->after('aspiration_image');
        });
    }

    public function down(): void
    {
        Schema::table('job_descriptions', function (Blueprint $table) {
            $table->dropColumn('illustration_image_data');
        });
        Schema::table('experiences', function (Blueprint $table) {
            $table->dropColumn('logo_data');
        });
        Schema::table('education', function (Blueprint $table) {
            $table->dropColumn('logo_data');
        });
        Schema::table('committee_activities', function (Blueprint $table) {
            $table->dropColumn('image_data');
        });
        Schema::table('profiles', function (Blueprint $table) {
            $table->dropColumn('aspiration_image_data');
        });
    }
};
