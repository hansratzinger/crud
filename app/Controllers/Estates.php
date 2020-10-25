<?php

namespace App\Controllers;

use App\Libraries\Crud;


class Estates extends BaseController
{
	protected $crud;

	function __construct()
	{
		$params = [
			'table' => 'estates',
			'dev' => false,			//true - Show MySQL schema
			'fields' => $this->field_options(),
			'form_title_add' => 'Add Estate',
			'form_title_update' => 'Edit Estate',
			'form_submit' => 'Add',
			'table_title' => 'Estates',
			'form_submit_update' => 'Update',
			'base' => '',

		];

		$this->crud = new Crud($params, service('request'));
	}

	public function index()
	{
		$page = 1;
		if (isset($_GET['page'])) {
			$page = (int) $_GET['page'];
			$page = max(1, $page);
		}

		$data['title'] = $this->crud->getTableTitle();

		$per_page = 20;
		$columns = [
			'est_id',
			'est_name',
			'est_street',
			'est_house_numer',
			'est_block',
			'est_door_number',
			'est_zip',
			'est_town',
			'est_country',
			'est_description',
			'est_status',
			'est_type',
			'est_contract_type',
			'est_rooms',
			'est_expanse',
			'est_floor',
			'est_available',
			'est_building_type',
			'est_condition',
			'est_price',
			'est_costs',
			'est_brokerage',
			'est_heating',
			'est_energy_class',
			'est_energy_hwb',
			'est_information',
			'est_title_willhaben',
			'est_url_willhaben',
			'est_url_website',
			'est_url_googlemaps',
			'est_matterport_url',
			'est_created_at',
			'est_updated_at',
			'est_deleted_at'
			];
		$where = null;//['est_status =' => 'Active'];
		$order = [
			['est_id', 'DESC']
		];
		$data['table'] = $this->crud->view($page, $per_page, $columns, $where, $order);
		return view('admin/estates/table', $data);
	}

	public function add(){
		
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getAddTitle();

		if(is_array($form) && isset($form['redirect']))
			return redirect()->to($form['redirect']);

		return view('admin/estates/form', $data);
	}

	public function edit($id)
	{
		if(!$this->crud->current_values($id))
			return redirect()->to($this->crud->getBase() . '/' . $this->crud->getTable());

			$data['item_id'] = $id;
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getEditTitle();

		if (is_array($form) && isset($form['redirect']))
			return redirect()->to($form['redirect']);
		
		return view('admin/estates/form', $data);
	}


	protected function field_options()
	{
		$fields = [];
		
		$fields['est_id'] = [
			'label' => 'Objekt-ID',
			'required' => true,
			'type' => 'dropdown',
			'relation' => [
			'table' => 'tags',
			'primary_key' => 't_id',
			'display' => ['est_name','est_description'],
			'order_by' => 'est_id',
			'order' => 'ASC'
				],
		
			]; 
		$fields['tags'] = [
			'label' => 'Tags',
			'required' => true,
			//'type' => 'multiselect',			//oder 
			'type' => 'checkboxes', //  #3 tutorial 34:05
			'relation' => [
				'save_table' => 'estate_tags',
				'parent_field' => 'est_id',
				'child_field' => 't_id',
				'inner_class' => 'col-6 col-sm-3',  //  wenn 'type' => 'checkboxes'   #tutorial 34:05
				'table' => 'tags',
				'primary_key' => 't_id',
				'display' => ['t_name'],
				'order_by' => 't_name',
				'order' => 'ASC'
				]			
			];  // mit der Angabe 'relation' wird das 'estates'-table mit 'users'-table verknüpft  HR 21.10.20 NK  #3 tutorial 8:25
		$fields['est_description'] = ['label' => 'Description', 'type' => 'editor','class' => 'col-sm-6]'];
		$fields['est_start_date'] = ['label' => 'Starts at', 'required' => true, 'class' => 'col-sm-6'];
		$fields['est_end_date'] = ['label' => 'Ends at', 'required' => true, 'class' => 'col-sm-6'];
		$fields['est_title'] = ['label' => 'Title', 'required' => true];
		$fields['est_status'] = ['label' => 'Status', 'required' => true, 'class' => 'col-sm-6'];
		$fields['est_price'] = ['label' => 'Price', 'required' => true, 'class' => 'col-sm-6'];
		$fields['est_created_at'] = ['type' => 'unset'];
		$fields['est_updated_at'] = ['type' => 'unset'];
		return $fields;
	}

	//--------------------------------------------------------------------

}
