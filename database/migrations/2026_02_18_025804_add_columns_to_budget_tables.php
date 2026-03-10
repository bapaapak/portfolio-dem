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
        if (Schema::hasTable('budget_plans')) {
            Schema::table('budget_plans', function (Blueprint $table) {
                $table->string('purpose', 50)->nullable()->after('description');
            });
        }

        if (Schema::hasTable('budget_items')) {
            Schema::table('budget_items', function (Blueprint $table) {
                $table->string('brand_spec', 255)->nullable()->after('item_name');
                $table->string('application_process', 255)->nullable()->after('process');
                $table->enum('condition_status', ['Ready', 'Not Ready'])->nullable()->after('application_process');
                $table->text('condition_notes')->nullable()->after('condition_status');
                $table->string('target_schedule', 50)->nullable()->after('total_amount');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('budget_plans', function (Blueprint $table) {
            $table->dropColumn('purpose');
        });

        Schema::table('budget_items', function (Blueprint $table) {
            $table->dropColumn(['brand_spec', 'application_process', 'condition_status', 'condition_notes', 'target_schedule']);
        });
    }
};
