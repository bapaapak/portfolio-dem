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
        Schema::dropIfExists('skills');
        
        Schema::create('skills', function (Blueprint $table) {
            $table->id();
            $table->string('category');
            $table->text('items');
            $table->enum('type', ['technical', 'soft'])->default('technical');
            $table->integer('order')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('skills', function (Blueprint $table) {
            $table->dropColumn(['category', 'items', 'type']);
            $table->string('name')->after('id');
            $table->integer('percentage')->default(0)->after('name');
        });
    }
};
