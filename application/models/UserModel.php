<?php 

class UserModel extends CI_Model {


    public function getUserByUsername($username){
        $this->db->where('username',$username);
        return $this->db->get('pp_admin');
    }
}