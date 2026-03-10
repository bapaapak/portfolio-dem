<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasTable('purchase_requests')) return;
        // Drop the foreign key constraint first
        DB::statement('ALTER TABLE purchase_requests DROP FOREIGN KEY fk_pr_item');

        // Make the column nullable
        DB::statement('ALTER TABLE purchase_requests MODIFY budget_item_id INT(11) NULL');

        // Re-add the foreign key with ON DELETE SET NULL
        DB::statement('ALTER TABLE purchase_requests ADD CONSTRAINT fk_pr_item FOREIGN KEY (budget_item_id) REFERENCES budget_items(id) ON DELETE SET NULL');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement('ALTER TABLE purchase_requests DROP FOREIGN KEY fk_pr_item');
        DB::statement('ALTER TABLE purchase_requests MODIFY budget_item_id INT(11) NOT NULL');
        DB::statement('ALTER TABLE purchase_requests ADD CONSTRAINT fk_pr_item FOREIGN KEY (budget_item_id) REFERENCES budget_items(id)');
    }
};
