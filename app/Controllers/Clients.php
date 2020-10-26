<?php namespace App\Controllers;

use App\Libraries\Crud;

class Clients extends BaseController
{

	protected $crud;

	function __construct () 
	{
		$params = [
			'table' => 'clients',
			'dev' => false,
			'fields' => $this->field_options(),
			'form_title_add' => 'Add Client',
			'form_submit' => 'Add',
			'table_title' => 'Clients',
			'form_submit_update' => 'Update',
			'base' => '',
		];

		$this->crud  = new Crud($params, service('request'));
	}

	public function index()
	{
		$page = 1;
		if (isset($_GET['page'])) {
			$page = (int) $_GET['page'];
			$page = max(1, $page);
		}

		$data['title'] = $this->crud->getTableTitle();

		$per_page = 10;
		$columns = ['cli_id', 'cli_last_name', 'cli_first_name'];
		// $where = ['t_status' => 'Active']; nur aktive Tag anzeigen
		$where = null;
		$order = [
			['cli_last_name', 'ASC']
		] ;

	
		$data['table'] = $this->crud->view($page, $per_page, $columns, $where, $order);
		return view('admin/clients/table', $data);
	}

	protected function field_options(){
		$fields = [];

		$fields['cli_id'] = ['label' => 'Client-ID'];
		$fields['tags'] = [
			'label' => 'Tags',
			'required' => false,
			'type' => 'checkboxes',
			'relation' => [
				'save_table' => 'clients_tags_relations',
				'parent_field' => 'ctr_cli_id', // client_id
				'child_field' => 'ctr_ct_id', //client_tag_id
				'inner_class' => 'col-6 col-sm-3',
				'table' => 'clienttags',
				'primary_key' => 'ct_id',
				'display' => 'ct_name',
				'order_by' => 'ct_name',
				'order' => 'ASC'
			]
		];

		$fields['cli_first_name'] = ['label' => 'Vorname',  'required' => true,  'helper' => 'Vornamen eingeben', 'class' => 'col-4 col-sm-4'];
		$fields['cli_last_name'] = ['label' => 'Familienname',  'required' => true,  'helper' => 'Vornamen eingeben', 'class' => 'col-4 col-sm-4'];
		$fields['cli_academic_degree'] = ['label' => 'akad. Titel',   'class' => 'col-4 col-sm-4'];
		$fields['cli_email'] = ['label' => 'Email',  'required' => true, 'class' => 'col-3 col-sm-3'];
		$fields['cli_phone'] = ['label' => 'Telefon',  'required' => true, 'class' => 'col-3 col-sm-3'];
		$fields['cli_street'] = ['label' => 'Strasse',  'required' => true, 'class' => 'col-4 col-sm-4'];
		$fields['cli_zip'] = ['label' => 'PLZ',  'required' => true, 'class' => 'col-3 col-sm-3'];
		$fields['cli_town'] = ['label' => 'Ort',  'required' => true, 'class' => 'col-3 col-sm-3'];

		return $fields;
	}

	public function add(){
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getAddTitle();
		
		if(is_array($form) && isset($form['redirect'])){
			return redirect()->to($form['redirect']);
		}
		
		return view('admin/clients/form', $data);
	}
	
	public function edit($id){

		if(!$this->crud->current_values($id)){			// Eintrg nicht vorhanden
			return redirect()->to($this->crud->getBase() . '/' . $this->crud->getTable());
		}
		$data['item_id'] = $id;
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getEditTitle();
		
		if(is_array($form) && isset($form['redirect'])){
			return redirect()->to($form['redirect']);
		}
		
		return view('admin/clients/form', $data);
	}
	//--------------------------------------------------------------------

}
