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
        Schema::create('business_process_flows', function (Blueprint $table) {
            $table->id();
            $table->string('role'); // e.g., CUSTOMER, MKT
            $table->text('action'); // e.g., RFI/RFQ
            $table->text('description')->nullable(); 
            $table->string('badge_text')->nullable(); // e.g., MAGANG
            $table->string('badge_color')->nullable(); // e.g., green, blue
            $table->integer('step_order')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('business_process_flows');
    }
};
