<?php

namespace App\Controllers;

use App\Libraries\Crud;


class Objects extends BaseController
{
	protected $crud;

	function __construct()
	{
		$params = [
			'table' => 'objects',
			'dev' => false,			//true - Show MySQL schema
			'fields' => $this->field_options(),
			'form_title_add' => 'Add Project',
			'form_title_update' => 'Edit Project',
			'form_submit' => 'Add',
			'table_title' => 'Objects',
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
			'o_id',
			'o_name',
			'o_street',
			'o_house_numer',
			'o_block',
			'o_door_number',
			'o_zip',
			'o_town',
			'o_country',
			'o_description',
			'o_willhaben_title',
			'o_willhaben_url',
			'o_website_url',
			'o_matterport_url',
			'o_created_at',
			'o_updated_at',
			'o_deleted_at',
			'o_status'
			];
		$where = null;//['u_status =' => 'Active'];
		$order = [
			['o_id', 'DESC']
		];
		$data['table'] = $this->crud->view($page, $per_page, $columns, $where, $order);
		return view('admin/objects/table', $data);
	}

	public function add(){
		
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getAddTitle();

		if(is_array($form) && isset($form['redirect']))
			return redirect()->to($form['redirect']);

		return view('admin/objects/form', $data);
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
		
		return view('admin/objects/form', $data);
	}


	protected function field_options()
	{
		$fields = [];
		$fields['o_id'] = ['label' => 'ID'];
		$fields['o_id'] = [
			'label' => 'Object',
			'required' => true,
			'type' => 'dropdown',
			'relation' => [
				'table' => 'objects',
				'primary_key' => 'u_id',
				'display' => ['u_name','u_description'],
				'order_by' => 'o_id',
				'order' => 'ASC'
				],
			
			]; 
		$fields['tags'] = [
			'label' => 'Tags',
			'required' => true,
			//'type' => 'multiselect',			//oder 
			'type' => 'checkboxes', //  #tutorial 34:05
			'relation' => [
				'save_table' => 'object_tags',
				'parent_field' => 'pt_object_id',
				'child_field' => 'pt_tag_id',
				'inner_class' => 'col-6 col-sm-3',  //  wenn 'type' => 'checkboxes'   #tutorial 34:05
				'table' => 'tags',
				'primary_key' => 't_id',
				'display' => ['t_name'],
				'order_by' => 't_name',
				'order' => 'ASC'
				],
			
			];  // mit der Angabe 'relation' wird das 'object'-table mit 'users'-table verknüpft  HR 21.10.20 NK  #3 tutorial 8:25
		$fields['o_description'] = ['label' => 'Description', 'type' => 'editor'];
		$fields['o_start_date'] = ['label' => 'Starts at', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['o_end_date'] = ['label' => 'Ends at', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['o_title'] = ['label' => 'Title', 'required' => true];
		$fields['o_status'] = ['label' => 'Status', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['o_price'] = ['label' => 'Price', 'required' => true, 'class' => 'col-12 col-sm-6'];
		$fields['o_created_at'] = ['type' => 'unset'];
		$fields['o_updated_at'] = ['type' => 'unset'];
		return $fields;
	}

	//--------------------------------------------------------------------

}
