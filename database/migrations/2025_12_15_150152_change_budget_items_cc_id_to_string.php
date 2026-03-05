<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Drop foreign keys first
        Schema::table('budget_items', function (Blueprint $table) {
            // Try to drop foreign key constraints
            $table->dropForeign('fk_item_cc');
            $table->dropForeign('fk_item_io');
        });
        
        // Change column types
        Schema::table('budget_items', function (Blueprint $table) {
            $table->string('cc_id', 50)->nullable()->change();
            $table->string('io_id', 50)->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('budget_items', function (Blueprint $table) {
            $table->unsignedBigInteger('cc_id')->nullable()->change();
            $table->unsignedBigInteger('io_id')->nullable()->change();
        });
    }
};
