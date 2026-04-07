<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('company_profiles', function (Blueprint $table) {
            if (!Schema::hasColumn('company_profiles', 'logo_data')) {
                $table->longText('logo_data')->nullable()->after('logo');
            }
            if (!Schema::hasColumn('company_profiles', 'plant_1_image_data')) {
                $table->longText('plant_1_image_data')->nullable()->after('plant_1_image');
            }
            if (!Schema::hasColumn('company_profiles', 'plant_2_image_data')) {
                $table->longText('plant_2_image_data')->nullable()->after('plant_2_image');
            }
            if (!Schema::hasColumn('company_profiles', 'director_image_data')) {
                $table->longText('director_image_data')->nullable()->after('director_image');
            }
            if (!Schema::hasColumn('company_profiles', 'triputra_dna_image_data')) {
                $table->longText('triputra_dna_image_data')->nullable()->after('triputra_dna_image');
            }
        });
    }

    public function down(): void
    {
        Schema::table('company_profiles', function (Blueprint $table) {
            $table->dropColumn(['logo_data', 'plant_1_image_data', 'plant_2_image_data', 'director_image_data', 'triputra_dna_image_data']);
        });
    }
};
