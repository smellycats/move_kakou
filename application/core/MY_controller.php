<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin_Controller extends CI_Controller
{    
    public function __construct()
    {
        parent::__construct();
         
        $this->load->helper('url');
		
		//$this->output->enable_profiler(TRUE);
        $this->load->library('session');

		$this->_check_login();
    }
     
    /**
     * 检查用户是否登录
     *
     * @access  protected
     * @return  void
     */
    protected function _check_login()
    {
        #session_start();
     	
        $user = array(
            'user_id' => 3
        );
        $this->session->set_userdata($user);
    }

}