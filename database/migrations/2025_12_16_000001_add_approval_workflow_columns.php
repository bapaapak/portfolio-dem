<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Add approval columns to purchase_requests
        Schema::table('purchase_requests', function (Blueprint $table) {
            $table->string('current_approver_role')->nullable()->after('status');
            $table->unsignedBigInteger('dept_head_id')->nullable();
            $table->timestamp('dept_head_approved_at')->nullable();
            $table->unsignedBigInteger('finance_id')->nullable();
            $table->timestamp('finance_approved_at')->nullable();
            $table->unsignedBigInteger('div_head_id')->nullable();
            $table->timestamp('div_head_approved_at')->nullable();
            $table->unsignedBigInteger('purchasing_id')->nullable();
            $table->timestamp('purchasing_executed_at')->nullable();
        });

        // Add approval columns to budget_plans
        Schema::table('budget_plans', function (Blueprint $table) {
            $table->string('current_approver_role')->nullable()->after('status');
            $table->unsignedBigInteger('dept_head_id')->nullable();
            $table->timestamp('dept_head_approved_at')->nullable();
            $table->unsignedBigInteger('div_head_id')->nullable();
            $table->timestamp('div_head_approved_at')->nullable();
            $table->unsignedBigInteger('finance_id')->nullable();
            $table->timestamp('finance_approved_at')->nullable();
        });
    }

    public function down(): void
    {
        Schema::table('purchase_requests', function (Blueprint $table) {
            $table->dropColumn([
                'current_approver_role',
                'dept_head_id', 'dept_head_approved_at',
                'finance_id', 'finance_approved_at',
                'div_head_id', 'div_head_approved_at',
                'purchasing_id', 'purchasing_executed_at'
            ]);
        });

        Schema::table('budget_plans', function (Blueprint $table) {
            $table->dropColumn([
                'current_approver_role',
                'dept_head_id', 'dept_head_approved_at',
                'div_head_id', 'div_head_approved_at',
                'finance_id', 'finance_approved_at'
            ]);
        });
    }
};
