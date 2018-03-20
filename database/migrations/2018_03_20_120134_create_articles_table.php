<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->string('image');
            $table->longText('body');
            $table->timestamps();
        });

        \DB::table('articles')->insert([
          'title' => 'Les nouveautés de Laravel',
          'image' => 'https://www.openaccess.fr/sites/default/files/styles/veille_content/public/laravel.png',
          'body'  => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu leo enim. Pellentesque sollicitudin, 
                        ex sed pretium lacinia, tortor ligula commodo eros, at fringilla purus nulla nec mauris. Fusce vestibulum 
                        ipsum at gravida ullamcorper. Phasellus nec convallis velit, id faucibus nisi. Pellentesque scelerisque.'
        ]);

        \DB::table('articles')->insert([
          'title' => 'Découvrir Docker',
          'image' => 'https://www.lebigdata.fr/wp-content/uploads/2015/05/Docker-660x269.png',
          'body'  => 'Sed eu leo enim. Pellentesque sollicitudin,  ex sed pretium lacinia, tortor ligula commodo eros, at fringilla 
                      purus nulla nec mauris. Fusce vestibulum ipsum at gravida ullamcorper. Phasellus nec convallis velit, id faucibus nisi. 
                      Pellentesque scelerisque.'
        ]);

        \DB::table('articles')->insert([
          'title' => 'Drupal Headless',
          'image' => 'https://build2be.com/sites/build2be.com/files/d8rest.png',
          'body'  => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu leo enim. Pellentesque sollicitudin, 
                        ex sed pretium lacinia, tortor ligula commodo eros, at fringilla purus nulla nec mauris. Fusce vestibulum 
                        ipsum at gravida ullamcorper. Phasellus nec convallis velit, id faucibus nisi. Pellentesque scelerisque.'
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('articles');
    }
}
