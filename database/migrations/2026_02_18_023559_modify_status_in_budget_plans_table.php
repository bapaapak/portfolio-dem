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
        if (!Schema::hasTable('budget_plans')) return;
        \Illuminate\Support\Facades\DB::statement("ALTER TABLE `budget_plans` MODIFY COLUMN `status` ENUM('Draft', 'Submitted', 'Approved', 'Rejected') NOT NULL DEFAULT 'Draft'");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        \Illuminate\Support\Facades\DB::statement("ALTER TABLE `budget_plans` MODIFY COLUMN `status` ENUM('Draft', 'Approved', 'Rejected') NOT NULL DEFAULT 'Draft'");
    }
};
