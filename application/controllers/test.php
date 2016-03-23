<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Index
 *
 * This is vehicle info rest
 *
 * @package		CodeIgniter
 * @subpackage	Test Rest Server
 * @category	Controller
 * @author		Fire
*/


class Test extends Admin_Controller
{
	public function __construct()
    {
        // Construct our parent class
        parent::__construct();

        $this->load->helper('url');
        $this->load->helper('date');
        $this->load->helper('my');

        $this->load->config('myconfig');

        #$this->load->library('session');
    }
    
    /**
     * 默认控制器
     * 
     * @return void
     */
    public function index()
    {
        #$this->load->view('login');
        $this->test();
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

    public function test3()
    {
        $this->load->model('Mkakou');
        $q['st'] = '2015-12-25 13:51:17';
        $q['et'] = '2015-12-25 14:09:28';
        $q['hphm'] = '粤L12345';
        $limit = 10;
        $offset = 0;
        $data = $this->Mkakou->getCarInfo($q, $limit, $offset)->result_array();
        var_dump($data);
        $da = $this->Mkakou->getCarInfo($q, 0, $offset)->row();
        var_dump($da);
    }

    public function show_session()
    {
        #var_dump($_SESSION);
        var_dump($this->session->userdata('user_id'));
    }

}