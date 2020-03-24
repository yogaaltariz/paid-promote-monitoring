<?php


class Auth extends CI_Controller {
    

    function __construct(){
        parent::__construct();
        $this->load->model('UserModel','login');
    }


    function sendJson($arr){
		return $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($arr));
    }
    
    public function login(){

        if ($this->input->server('REQUEST_METHOD') == 'GET'){
            $this->load->view('login');
        }
        //its a post

        else if ($this->input->server('REQUEST_METHOD') == 'POST'){
            $result['csrfName'] = $this->security->get_csrf_token_name();
            $result['csrfHash'] = $this->security->get_csrf_hash();

            $this->load->library('form_validation');
            $this->form_validation->set_rules('username','Username','required');
            $this->form_validation->set_rules('password','password','required');
            $this->form_validation->set_message('required', '{field} harus diinput');

            if ($this->form_validation->run() == FALSE){
                $result['status'] = false;
                $this->sendJson($result);
            }else {
                $username = $this->input->post('username');
                $password = $this->input->post('password');
               

                $user_db = $this->login->getUserByUsername($username);

                if($user_db->num_rows() > 0){
                    $user = $user_db->row_array();
                    $password_db = $user['password'];
                    if(password_verify($password,$password_db)){
                        $user['logged_in'] = true;
                        $this->session->set_userdata($user);
                        $result['message'] = "Login berhasil";
                        $result['next'] = base_url('');
                        $result['status'] = true;

                        $this->sendJson($result);

                    }else {
                        $result['status'] = false;
                        $result['message'] = "Password salah";
                        $this->sendJson($result);
                    }
                }else {
                    $result['status'] = false;
                    $result['message'] = "Username tidak ditemukan";
                    $this->sendJson($result);
                }
            }
        }
    }

    public function logout(){
        $this->session->sess_destroy();
        redirect(base_url('auth/login'));
    }
}