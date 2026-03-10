<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasTable('budget_items')) return;
        if (Schema::hasColumn('budget_items', 'model')) return;
        Schema::table('budget_items', function (Blueprint $table) {
            $table->string('model')->nullable()->after('item_name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('budget_items', function (Blueprint $table) {
            $table->dropColumn('model');
        });
    }
};
