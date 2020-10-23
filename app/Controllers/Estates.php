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
			'form_title_add' => 'Add Project',
			'form_title_update' => 'Edit Project',
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
			'est_willhaben_title',
			'est_willhaben_url',
			'est_website_url',
			'est_matterport_url',
			'est_created_at',
			'est_updated_at',
			'est_deleted_at',
			'est_status'
			];
		$where = null;//['u_status =' => 'Active'];
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
		$fields['est_id'] = ['label' => 'Objekt-ID'];
		$fields['est_id'] = [
			'label' => 'Estate',
			'required' => true,
			'type' => 'dropdown',
			'relation' => [
				'table' => 'estates',
				'primary_key' => 'u_id',
				'display' => ['u_name','u_description'],
				'order_by' => 'est_id',
				'order' => 'ASC'
				],
			
			]; 
		$fields['tags'] = [
			'label' => 'Tags',
			'required' => true,
			//'type' => 'multiselect',			//oder 
			'type' => 'checkboxes', //  #tutorial 34:05
			'relation' => [
				'save_table' => 'estate_tags',
				'parent_field' => 'pt_estate_id',
				'child_field' => 'pt_tag_id',
				'inner_class' => 'col-6 col-sm-3',  //  wenn 'type' => 'checkboxes'   #tutorial 34:05
				'table' => 'tags',
				'primary_key' => 't_id',
				'display' => ['t_name'],
				'order_by' => 't_name',
				'order' => 'ASC'
				],
			
			];  // mit der Angabe 'relation' wird das 'estates'-table mit 'users'-table verknüpft  HR 21.10.20 NK  #3 tutorial 8:25
		$fields['est_description'] = ['label' => 'Description', 'type' => 'editor'];
		$fields['est_start_date'] = ['label' => 'Starts at', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['est_end_date'] = ['label' => 'Ends at', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['est_title'] = ['label' => 'Title', 'required' => true];
		$fields['est_status'] = ['label' => 'Status', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['est_price'] = ['label' => 'Price', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['est_created_at'] = ['type' => 'unset'];
		$fields['est_updated_at'] = ['type' => 'unset'];
		return $fields;
	}

	//--------------------------------------------------------------------

}
