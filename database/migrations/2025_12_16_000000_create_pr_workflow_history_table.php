<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('pr_workflow_history', function (Blueprint $table) {
            $table->id();
            $table->string('pr_number');
            $table->string('action'); // Submitted, Approved, Rejected, Edited, Created
            $table->text('notes')->nullable();
            $table->unsignedBigInteger('actor_id');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('pr_workflow_history');
    }
};
