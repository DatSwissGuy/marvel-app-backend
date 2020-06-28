<?php

use App\Character;
use App\Favorite;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class FavoritesToCharacters extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public
    function up() {
        $oldData = Favorite::all();
        foreach ($oldData as $data) {
            $character = Character::firstOrCreate([
                'marvel_character_id' => $data->character_id,
                'character_name' => $data->character_name,
                'image_url' => $data->image_url
            ]);
            Favorite::where('id', $data->id)->update([
                'character_table_id' => $character->id
            ]);
        }
        Schema::table('favorites', function (Blueprint $table) {
            $table->dropForeign('favorites_user_id_foreign');
            $table->dropUnique(['user_id', 'character_id']);
            $table->dropColumn('character_id');
            $table->dropColumn('character_name');
            $table->dropColumn('image_url');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public
    function down() {
        Schema::table('favorites', function (Blueprint $table) {
            $table->unsignedInteger('character_id');
            $table->string('image_url', 2048);
            $table->string('character_name', 32);
        });
    }
}
