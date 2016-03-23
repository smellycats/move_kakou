<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mkakou extends CI_Model
{
    /**
     * Construct a madmin instance
     *
     */
	public function __construct()
	{
		parent::__construct();
	}
	
    /**
     * 根据条件查询车辆信息
     * 
     * @param array data
     * @return object
     */
	public function getCarInfo($data, $limit, $offset)
	{
		$this->db->where('date_created >=', $data['st']);
		$this->db->where('date_created <', $data['et']);
		if (isset($data['hphm'])) {
			$this->db->where('hphm', $data['hphm']);
		}
		if (isset($data['place_name'])) {
			$this->db->like('place_name', $data['place_name'], 'both');
		}
		
		if ($limit == 0) {
			$this->db->select('count(*) as sum');
			return $this->db->get('car_info');
		}
		$this->db->limit($limit, $offset);

		return $this->db->get('car_info');
	}
	
}
?>

