<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Index
 *
 * This is vehicle info rest
 *
 * @package		CodeIgniter
 * @subpackage	Cgs Rest Server
 * @category	Controller
 * @author		Fire
*/


class Index extends CI_Controller
{
	public function __construct()
    {
        // Construct our parent class
        parent::__construct();

        $this->load->helper('url');
        $this->load->helper('date');
        $this->load->helper('my');

        $this->load->config('myconfig');

        $this->load->library('session');

        $this->load->model('Mkakou');
    }
    
    /**
     * 默认控制器
     * 
     * @return void
     */
    public function index()
    {
        $this->load->view('login');
        //$this->admin();
    }

    /**
     * 保存登录信息
     * 
     * @return void
     */
    public function login()
    {
        #$input_data = json_decode(trim(file_get_contents('php://input')), true);
        #echo json_encode(array('success'=>true, 'msg'=>'done'));

        $array['username'] = $this->input->post('username');
        $array['password'] = $this->input->post('password');
        $this->session->set_userdata($array);
    }

    /**
     * 后台首页
     * 
     * @return void
     */
    public function admin()
    {
        $this->load->view('index');
    }

    /**
     * 图片上传
     * 
     * @return void
     */
    public function upload()
    {
        $this->load->view('upload');
    }

    public function test()
    {
        $url = 'http://127.0.0.1:5000/token';
        $post_data = array(
            'username' => 'smstest',
            'password' => 'showmethemoney'
        );
        $result = h_send_post($url, json_encode($post_data));

        var_dump(json_decode($result));
    }

    public function test2()
    {
        $input_data = json_decode(trim(file_get_contents('php://input')), true);

        echo json_encode(array('success' => true, 'msg' => 'done'));
    }

    public function load_data()
    {
        $this->get_carinfo();
    }

    /**
     * 获取car_info表数据
     * 
     * @return void
     */
    public function get_carinfo()
    {
        $q_arr = $this->input->get(NULL, true);

        if (empty(@$q_arr['st'])) {
            $q_arr['st'] = mdate("%Y-%m-%d %H:%i:%s", strtotime("-2 hours"));
        }
        if (empty(@$q_arr['et'])) {
            $q_arr['et'] = mdate("%Y-%m-%d %H:%i:%s");
        }
        $query = $this->Mkakou->getCarInfo($q_arr, $q_arr['limit'], $q_arr['offset']);
        $total_count = $this->Mkakou->getCarInfo($q_arr, 0, $q_arr['offset'])->row()->sum;
        $items = [];
        foreach($query->result_array() as $id => $row) {
            $items[$id]['id'] = $q_arr['offset']+$id+1;
            $items[$id]['date_upload'] = $row['date_upload'];
            $items[$id]['date_created'] = $row['date_created'];
            $items[$id]['hphm'] = $row['hphm'];
            $items[$id]['wc'] = $row['wc'];
            $items[$id]['place_name'] = $row['place_name'];
            $items[$id]['img_path'] = $row['img_path'];
        }

        echo json_encode(array('total_count'=> $total_count, 'items'=> $items));
    }

}