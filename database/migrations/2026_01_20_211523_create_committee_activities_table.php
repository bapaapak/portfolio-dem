<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('committee_activities', function (Blueprint $table) {
            $table->id();
            $table->string('title');                    // Nama kegiatan/acara
            $table->string('title_en')->nullable();     // English title
            $table->string('role');                     // Peran dalam kepanitiaan
            $table->string('role_en')->nullable();      // English role
            $table->text('description')->nullable();    // Deskripsi kegiatan
            $table->text('description_en')->nullable(); // English description
            $table->string('organization')->nullable(); // Organisasi penyelenggara
            $table->date('event_date')->nullable();     // Tanggal acara
            $table->date('end_date')->nullable();       // Tanggal akhir (jika range)
            $table->string('location')->nullable();     // Lokasi
            $table->string('image')->nullable();        // Gambar/foto kegiatan
            $table->integer('order')->default(0);       // Urutan tampil
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('committee_activities');
    }
};
