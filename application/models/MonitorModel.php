<?php

class MonitorModel extends CI_Model {

    public function getGroupTarget(){
        $this->db->select('g.*,COUNT(t.id_target) as jumlah_target');
        $this->db->from('pp_group_target g');
        $this->db->join('pp_target t','g.id_group = t.id_group','LEFT');
        $this->db->group_by('t.id_group');
        return $this->db->get()->result();
    }

    public function getAllTargetByGroup($id_group){
        $this->db->select('p.*');
        $this->db->from('pp_target p');
        $this->db->where('id_group',$id_group);
        $this->db->order_by('is_public');
        return $this->db->get()->result();
    }

    public function getUsernameByGroup($id_group){
        $this->db->select('username');
        $this->db->from('pp_target');
        $this->db->where('id_group',$id_group);
        $this->db->where('useruid',null);
        $this->db->limit(20);
        return $this->db->get()->result();
    }

    public function updateDataTarget($data){
        $this->db->update_batch('pp_target',$data,'username');
    }

    public function getUsernameUidByGroup($id_group){
        $this->db->select('username,useruid');
        $this->db->from('pp_target');
        $this->db->where('id_group',$id_group);

        return $this->db->get()->result_array();
    }

    public function getAllHashtag(){
        $this->db->select('*');
        $this->db->from('pp_hashtag');
        return $this->db->get()->result();
    }

    public function getAllGroup(){
        return $this->db->get('pp_group_target')->result();
    }
}