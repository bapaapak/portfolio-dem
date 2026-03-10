<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('purchase_requests')) {
            return;
        }
        Schema::table('purchase_requests', function (Blueprint $table) {
            $table->string('gl_account', 50)->nullable()->after('asset_no');
            $table->string('storage_location', 50)->nullable()->after('gl_account');
            $table->date('due_date')->nullable()->after('storage_location');
        });
    }

    public function down(): void
    {
        Schema::table('purchase_requests', function (Blueprint $table) {
            $table->dropColumn(['gl_account', 'storage_location', 'due_date']);
        });
    }
};
