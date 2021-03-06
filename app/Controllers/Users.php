<?php namespace App\Controllers;

use App\Libraries\Crud;

class Users extends BaseController
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
			'table' => 'users',
			'dev' => false,
			'fields' => $this->field_options(),
			'form_title_add' => 'Add User',
			'form_submit' => 'Add',
			'table_title' => 'Users',
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
		$columns = ['u_id', 'u_firstname', 'u_lastname', 'u_email', 'u_status'];
		// $where = ['u_status' => 'Active']; nur aktive User anzeigen
		$where = null;
		$order = [
			['u_id', 'ASC']
		] ;

	
		$data['table'] = $this->crud->view($page, $per_page, $columns, $where, $order);
		return view('admin/users/table', $data);
	}

	protected function field_options(){
		$fields = [];
		// die Reihenfolge der Felder in der Anzeige richtet sich NUR nach der Reihenfolge in der Datenbank und kann
		// sonst nicht geändert werden / CRUD Tutorial #2 1:25 https://youtu.be/cFHEIjIsofo
		$fields['u_id'] = ['label' => 'ID'];
		$fields['u_firstname'] = ['label' => 'Vorname',  'required' => true,  'helper' => 'Vornamen eingeben', 'class' => 'col-12 col-sm-6]'];
		$fields['u_lastname'] = ['label' => 'Familienname', 'required' => true, 'helper' => 'Familiennamen eingeben', 'class' => 'col-12 col-sm-6]'];
		$fields['u_email'] = ['label' => 'Email', 'unique' => [true, 'u_email'], 'required' => true];
		// $fields['u_status'] = ['label' => 'Status', 'type' => 'unset'];  // type => unset verhindert Anzeige des Feldes Status bei dieser form
		$fields['u_status'] = ['label' => 'Status']; 
		$fields['u_created_at'] = ['label' => 'angelegt am','only_edit' =>true];
		$fields['u_password'] = ['label' => 'Passwort',
				'only_add' => true, 
				'type' => 'password', 
				'class' => 'col-12 col-sm-6',
				'confirm' => true, 
				'password_hash' => true ];  //only_add läßt nur bei der add form und nicht bei der edit form das feld erscheinen
																										// confirm erstellt automatisch ein Bestätigungsfeld ür das Passwort

		return $fields;
	}

	public function add(){
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getAddTitle();
		
		if(is_array($form) && isset($form['redirect'])){
			return redirect()->to($form['redirect']);
		}
		
		return view('admin/users/form', $data);
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
		
		return view('admin/users/form', $data);
	}
	//--------------------------------------------------------------------

}
