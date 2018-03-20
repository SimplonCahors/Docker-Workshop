<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
  /**
   * List article
   *
   * @return Response
   */
  public function list()
  {
    $articles = $users = \DB::table('articles')->get();
    return view('welcome', ['articles' => $articles]);
  }
}
