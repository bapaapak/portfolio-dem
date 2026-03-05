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
        Schema::create('automation_strategies', function (Blueprint $table) {
            $table->id();
            $table->enum('term_type', ['short', 'middle', 'long'])->default('short');
            $table->enum('category', ['manufacturing', 'digitalization'])->default('manufacturing');
            $table->string('title');
            $table->json('items')->nullable(); // Array of bullet points
            $table->integer('order')->default(0);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('automation_strategies');
    }
};
