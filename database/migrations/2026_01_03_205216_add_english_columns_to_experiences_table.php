<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('experiences', function (Blueprint $table) {
            $table->string('title_en')->nullable()->after('title');
            $table->string('company_en')->nullable()->after('company');
            $table->string('location_en')->nullable()->after('location');
            $table->text('description_en')->nullable()->after('description');
        });
    }

    public function down()
    {
        Schema::table('experiences', function (Blueprint $table) {
            $table->dropColumn(['title_en', 'company_en', 'location_en', 'description_en']);
        });
    }
};
