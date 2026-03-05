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
        Schema::create('company_profiles', function (Blueprint $table) {
            $table->id();
            $table->string('name')->default('PT DHARMA ELECTRINDO MFG.');
            $table->string('slogan')->nullable()->default('Exist To Contribute');
            $table->longText('description')->nullable();
            
            $table->string('plant_1_name')->nullable();
            $table->string('plant_1_image')->nullable();
            
            $table->string('plant_2_name')->nullable();
            $table->string('plant_2_image')->nullable();
            
            $table->integer('employees_cikarang')->default(0);
            $table->integer('employees_cirebon')->default(0);
            
            $table->string('business_model_title')->default('BISNIS MODEL DEM');
            $table->json('business_models')->nullable(); // Stores array of business items
            
            $table->string('director_name')->nullable();
            $table->string('director_title')->nullable();
            $table->string('director_image')->nullable();
            
            $table->string('triputra_dna_image')->nullable();
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('company_profiles');
    }
};
