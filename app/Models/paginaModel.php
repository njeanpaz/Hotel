<?php

namespace App\Models;

use CodeIgniter\Model;

class paginaModel extends Model
{
    public function usuarios_lst(){
        $sql = "SELECT *FROM tbl_usuarios;";
        $query = $this->db->query($sql);
        $result = $query->getResult();

        if(count($result)>=1){
            return $result;
        }else{
            return NULL;
        }

    }

    public function get_menu(){
        $sql = "SELECT *FROM tbl_menu;";
        $query = $this->db->query($sql);
        $result = $query->getResult();

        return $result;

    }
}