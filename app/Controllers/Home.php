<?php

namespace App\Controllers;

class Home extends BaseController
{
    
    public $paginaModel = NULL;

    public function __construct()
    {
        $this->paginaModel =model('paginaModel');
    }
    

    public function index()
    {
        $data = $this->paginaModel->usuarios_lst();
        echo  var_dump ($data);
        //return view('welcome_message');
    }


}
