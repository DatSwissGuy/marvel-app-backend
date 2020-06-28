<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ModifyFavoritesTable extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::table('favorites', function (Blueprint $table) {
            $table->unsignedInteger('character_id')->nullable()->change();
            $table->string('image_url', 2048)->nullable()->change();
            $table->string('character_name', 32)->nullable()->change();
            $table->unsignedbigInteger('character_table_id')->nullable();
            $table->foreign('character_table_id')->references('id')->on('characters');
        });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::table('favorites', function (Blueprint $table) {
            $table->dropForeign('favorites_character_table_id_foreign');
            $table->dropColumn('character_table_id');
        });
    }
}
