<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Atelier DevOps</title>

        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="css/app.css">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1>Atelier DevOps</h1>

            <div class="list">
                @foreach ($articles as $article)
                    <article class="article card">
                        <img class="card-img-top" src="{{  $article->image }}" alt="{{ $article->title }}" />
                        <div class="article__body card-body">
                            <h2 class="card-title">{{ $article->title }}</h2>
                            <p class="card-text">{{  $article->body }}</p>
                            <p class="card-text align-right"><small class="text-muted">Publié le 18 septembre 1967</small></p>
                        </div>
                    </article>
                @endforeach
            </div>
        </div>
    </body>
</html>
