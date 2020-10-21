<?php namespace App\Controllers;

use App\Libraries\Crud;

class Tags extends BaseController
{

	protected $crud;
		// $base = null, //prefix uri or parrent controller.
		// $action = 'add',  //determine create or update // default is create (add)
		// $table, //string
		// $table_title, //string
		// $form_title_add, //string
		// $form_title_update, //string
		// $form_submit, //string
		// $form_submit_update, //string
		// $fields = [], //array of field options: (type, required, label),
		// $id,  //primary key value
		// $id_field,  //primary key field
		// $current_values, //will get current form values before updating
		// $db, //db connection instance
		// $model, //db connection instance
		// $request;
		//
	function __construct () {
		$params = [
			'table' => 'tags',
			'dev' => false,
			'fields' => $this->field_options(),
			'form_title_add' => 'Add Tag',
			'form_submit' => 'Add',
			'table_title' => 'Tags',
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
		$columns = ['t_id', 't_name'];
		// $where = ['t_status' => 'Active']; nur aktive Tag anzeigen
		$where = null;
		$order = [
			['t_name', 'ASC']
		] ;

	
		$data['table'] = $this->crud->view($page, $per_page, $columns, $where, $order);
		return view('admin/tags/table', $data);
	}

	protected function field_options(){
		$fields = [];
		// die Reihenfolge der Felder in der Anzeige richtet sich NUR nach der Reihenfolge in der Datenbank und kann
		// sonst nicht geändert werden / CRUD Tutorial #2 1:25 https://youtu.be/cFHEIjIsofo
		$fields['t_id'] = ['label' => 'ID'];
		$fields['t_name'] = ['label' => 'Bezeichnung',  'required' => true,  'helper' => 'Bezeichnung eingeben', 'class' => 'col-12 col-sm-6]'];

		return $fields;
	}

	public function add(){
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getAddTitle();
		
		if(is_array($form) && isset($form['redirect'])){
			return redirect()->to($form['redirect']);
		}
		
		return view('admin/tags/form', $data);
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
		
		return view('admin/tags/form', $data);
	}
	//--------------------------------------------------------------------

}
