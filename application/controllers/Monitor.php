<?php

use Scrap\Scrap;

class Monitor extends CI_Controller
{

    function __construct()
    {
        parent::__construct();

        $this->load->model('MonitorModel', 'monitor');
        $this->load->model('AbsentModel', 'absent');
        if (!isset($this->session->userdata['logged_in'])) {
            redirect(base_url('auth/login'));
        }
    }

    public function setView($path, $data = NULL)
    {
        $this->load->view('partial/header');
        $this->load->view($path, $data);
        $this->load->view('partial/footer');
    }

    public function index()
    {
        add_css([
            "assets/global/DataTables/datatables.min.css",
            "assets/global/select2/css/select2.min.css"
        ]);

        add_js([
            "assets/global/DataTables/datatables.min.js",
            "assets/global/select2/js/select2.min.js",
            "assets/pages/scripts/index.js"
        ]);

        $data['hashtags'] = $this->monitor->getAllHashtag();
        $data['groups'] = $this->monitor->getAllGroup();
        $this->setView('index', $data);
    }

    public function target()
    {
        $data['group'] = $this->monitor->getGroupTarget();
        $this->setView('target', $data);
    }

    public function hashtags()
    {
        //its a get

        if ($this->input->server('REQUEST_METHOD') == 'GET') {
            $data['hashtags'] = $this->monitor->getAllHashtag();
            $this->setView('hashtag', $data);
        }
        //its a post

        else if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $data['text'] = $this->input->post('hashtag');
            $this->db->set('deadline','NOW() + INTERVAL 6 HOUR',FALSE);
            $this->db->insert('pp_hashtag', $data);
            redirect('monitor/hashtags');
        }
    }

    public function add_group()
    {
        $data['group_name'] = $this->input->post('group_name');
        $data['created_date'] = date('Y-m-d');
        $this->db->insert('pp_group_target', $data);
        redirect('monitor/target');
    }

    public function group_detail($id_group)
    {
        $data['all_target'] = $this->monitor->getAllTargetByGroup($id_group);

        add_css([
            "assets/global/DataTables/datatables.min.css"
        ]);

        add_js(
            [
                "assets/global/DataTables/datatables.min.js",
                "assets/pages/scripts/group_detail.js"
            ]
        );
        $this->setView('detail_group', $data);
    }


    // target

    public function add_user_target()
    {
        $targets = $this->input->post('targets');

        $targets = explode(',', $targets);
        $id_group = $this->input->post('id_group');

        $i = 0;

        foreach ($targets as $username) {
            $data[$i]['username'] = $username;
            $data[$i]['id_group'] = $id_group;
            $i++;
        }

        $this->db->insert_batch('pp_target', $data);
        redirect('monitor/group_detail/' . $id_group);
    }




    public function delete_user_target($id_target)
    {
        $this->db->where('id_target', $id_target);
        $this->db->delete('pp_target');
    }



    // monitor post
    function fetchData($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        $response = curl_exec($ch);
        return $response;
    }


    function fetchHashtagPostList($hashtag)
    {
        $hash_base_url = "https://www.instagram.com/explore/tags/$hashtag/";
        // fetch data satu2
        $hash_fetch_url = $hash_base_url . "?__a=1";
        while (1) {
            $fetched_data = $this->fetchData($hash_fetch_url);
            $resp_data = json_decode($fetched_data);
            foreach ($resp_data->graphql->hashtag->edge_hashtag_to_media->edges as $node) {
                $media_posts[] = $node->node;
            }
            if ($resp_data->graphql->hashtag->edge_hashtag_to_media->page_info->has_next_page) {
                $hash_fetch_url = $hash_base_url . "?__a=1&max_id=" . $resp_data->graphql->hashtag->edge_hashtag_to_media->page_info->end_cursor;
            } else {
                break;
            }
        }
        if (isset($media_posts)) {
            return $media_posts;
        } else {
            return NULL;
        }
    }

    function compareMonitorStatus($targetList, $posts, &$postedcnt, $hashtag)
    {
        foreach ($targetList as $target) {
            $target['posted'] = false;
            $target['shortcode'] = "";
            $target['postTime'] = "";
            $monResult[] = $target;
        }

        if ($posts != NULL) {
            foreach ($posts as $post) {
                $id = $post->owner->id;
                $x = 0;
                foreach ($monResult as $user) {
                    if ($user['useruid'] == $id) {
                        $shortcode = $post->shortcode;
                        $post_time = (int) $post->taken_at_timestamp;
                        $monResult[$x]['posted'] = true;
                        $monResult[$x]['shortcode'] = $shortcode;
                        $monResult[$x]['timestamp'] = $post_time + (3600 * 7 * 24);
                        $monResult[$x]['postTime'] = gmdate("Y-m-d H:i:s", $post_time + (3600 * 24 * 7));
                        $postedcnt++;
                        break;
                    }
                    $x++;
                }
            }
        }
        $tag = $this->db->get_where('pp_hashtag', ['text' => $hashtag])->row();
        $now = date("Y-m-d H:i:s");
        foreach ($monResult as $user) {
            
            if($user['useruid']){
                if (($user['posted'] && date("Y-m-d H:i:s",$user['timestamp']) >= $tag->deadline) || (!$user['posted'] && $now >= $tag->deadline)) {
                    $this->absent->insertAbsent($user['useruid'], $hashtag);
                } else {
                    $this->absent->deleteAbsent($user['useruid'], $hashtag);
                }
            }
            
            $totalAbsent = count($this->db->get_where('pp_absent', ["user_id" => $user['useruid']])->result());
            $this->db->set('total_absence', $totalAbsent);
            $this->db->where('useruid', $user['useruid']);
            $this->db->update('pp_target');
        }
        return $monResult;
    }

    public function doMonitoring()
    {
        $hashtag = $this->input->get('hashtag');
        $id_group = $this->input->get('target');

        $targetList = $this->monitor->getUsernameUidByGroup($id_group);


        $posts = $this->fetchHashtagPostList($hashtag);
        if ($posts != NULL) {
            $postCount = count($posts);
        } else {
            $postCount = 0;
        }

        $monStatus = $this->compareMonitorStatus($targetList, $posts, $postedcnt, $hashtag);

        $data = array(
            'hashtag' => $hashtag,
            'userCount' => count($targetList),
            'postCount' => $postCount,
            'userThatPosted' => $postedcnt,
            'monitorStatus' => $monStatus
        );
        // echo json_encode($data);
        $this->load->view('monitorData', $data, false);
    }


    public function scrap($id_group)
    {
        require_once FCPATH . "/legendary/Scrap.php";

        $users = $this->monitor->getUsernameByGroup($id_group);

        foreach ($users as $item) {
            $usernames[] = $item->username;
                
        }

        $scrap = new Scrap($usernames);
        $scrap->scrap();

        // echo json_encode();
        $this->monitor->updateDataTarget($scrap->getResult());
        // redirect('monitor/group_detail/'.$id_group);
    }

    public function export_excel()
    {
        $id_group = $this->uri->segment(3, 0);
        $data['all_target'] = $this->monitor->getAllTargetByGroup($id_group);

        $this->load->view('cetak', $data);
    }
}
