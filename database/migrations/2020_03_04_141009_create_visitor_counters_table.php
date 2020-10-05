<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVisitorCountersTable extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('visitor_counters', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('character_id');
            $table->unsignedInteger('visits')->default(0);
            $table->unique(['character_id']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('visitor_counters');
    }
}
