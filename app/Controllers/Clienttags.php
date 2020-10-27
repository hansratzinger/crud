<?php namespace App\Controllers;

use App\Libraries\Crud;

class Clienttags extends BaseController
{

	protected $crud;

	function __construct () {
		$params = [
			'table' => 'clienttags',
			'dev' => false,
			'fields' => $this->field_options(),
			'form_title_add' => 'Add Tag',
			'form_submit' => 'Add',
			'table_title' => 'Clienttags',
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
		$columns = [
			// 'ct_id',
			'ct_name'
			];
		// $where = ['t_status' => 'Active']; nur aktive Tag anzeigen
		$where = null;
		$order = [
			['ct_name', 'ASC']
		] ;

	
		$data['table'] = $this->crud->view($page, $per_page, $columns, $where, $order);
		return view('admin/clienttags/table', $data);
	}

	protected function field_options(){
		$fields = [];
		// die Reihenfolge der Felder in der Anzeige richtet sich NUR nach der Reihenfolge in der Datenbank und kann
		// sonst nicht geändert werden / CRUD Tutorial #2 1:25 https://youtu.be/cFHEIjIsofo
		$fields['ct_id'] = ['label' => 'ID'];
		$fields['ct_name'] = ['label' => 'Bezeichnung',  'required' => true,  'helper' => 'Bezeichnung eingeben', 'class' => 'col-12 col-sm-6]'];

		return $fields;
	}

	public function add(){
		$data['form'] = $form = $this->crud->form();
		$data['title'] = $this->crud->getAddTitle();
		
		if(is_array($form) && isset($form['redirect'])){
			return redirect()->to($form['redirect']);
		}
		
		return view('admin/clienttags/form', $data);
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
		
		return view('admin/clienttags/form', $data);
	}
	//--------------------------------------------------------------------

}
