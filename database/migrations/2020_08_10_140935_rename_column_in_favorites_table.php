<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameColumnInFavoritesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::table('favorites', function (Blueprint $table) {
            $table->renameColumn('character_id', 'marvel_character_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::table('favorites', function (Blueprint $table) {
            $table->renameColumn('marvel_character_id', 'character_id');
        });
    }
}
