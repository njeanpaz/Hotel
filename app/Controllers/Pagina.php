<?php

namespace App\Controllers;

class Pagina extends BaseController
{
    public function index(): string
    {

        return view('layouts/header').view('pagina/home').view('layouts/footer');
    }


}