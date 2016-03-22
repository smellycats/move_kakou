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
    }
    
    /**
     * 默认控制器
     * 
     * @return void
     */
    public function index()
    {
        #$this->load->view('login');
        $this->admin();
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


        echo json_encode(array('success'=>true, 'msg'=>'done'));
    }

    public function load_data()
    {
        $items = [
            array('id'=> 1, 'date_created'=> '2016-03-21 12:34:56', 'hphm'=>'粤L12345', 'place_name'=>'水门'),
            array('id'=> 2, 'date_created'=> '2016-03-21 12:34:56', 'hphm'=>'粤L12345', 'place_name'=>'水门'),
            array('id'=> 3, 'date_created'=> '2016-03-21 12:34:56', 'hphm'=>'粤L12345', 'place_name'=>'水门'),
            array('id'=> 4, 'date_created'=> '2016-03-21 12:34:56', 'hphm'=>'粤L12345', 'place_name'=>'水门')
        ];

        echo json_encode(array('total_count'=> 4, 'items'=> $items));
    }

}