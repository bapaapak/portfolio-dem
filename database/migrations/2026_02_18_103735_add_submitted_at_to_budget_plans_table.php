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
        if (!Schema::hasTable('budget_plans')) {
            return;
        }
        Schema::table('budget_plans', function (Blueprint $table) {
            $table->timestamp('submitted_at')->nullable()->after('status');
        });
    }

    public function down(): void
    {
        Schema::table('budget_plans', function (Blueprint $table) {
            $table->dropColumn('submitted_at');
        });
    }
};
