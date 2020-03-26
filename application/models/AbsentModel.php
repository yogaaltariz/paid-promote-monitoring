<?php

class AbsentModel extends CI_Model
{
    public function insertAbsent($user_id, $hastag)
    {
        $this->db->select('*');
        $this->db->from('pp_absent');
        $this->db->where('hastag', $hastag);
        $this->db->where('user_id', $user_id);
        if (count($this->db->get()->result()) == 0) {
            $data = [
                'user_id' => $user_id,
                'hastag' => $hastag
            ];

            $this->db->insert('pp_absent', $data);
        }
    }

    public function deleteAbsent($user_id, $hastag)
    {
        $this->db->where('user_id', $user_id);
        $this->db->where('hastag', $hastag);
        $this->db->delete('pp_absent');
    }
}
