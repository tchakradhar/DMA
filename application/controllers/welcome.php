<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
	function general(){
		$data['layout'] = 'layout/layout';
		$data['header'] = 'layout/header';
		$data['footer'] = 'layout/footer';
		$data['leftside']='layout/leftside';
		$data['source']=$this->public_model->get_source_preview();
		$data['schema']=$this->public_model->get_schema_preview();
		$data['tables']=$this->public_model->get_tables_preview();
		$data['target']= $this->public_model->get_target_preview();
		$data['job_list']= $this->public_model->get_job_list();
		$data['job_details']= $this->public_model->getJobDetails();
		return $data;
	}
	public function index()
	{
		$data = $this->general();
		$this->session->sess_destroy();
		$data['rec']= $this->public_model->clear_status();
		$data['pagename']='home';
		$data['body']='static/home';
		$this->load->view('welcome',$data);
	}
	public function migration($sel = '')
	{
		$data = $this->general();
		//  $this->session->sess_destroy();
		$data['rec']= $this->public_model->clear_status();
		$data['pagename']='migration';
		$data['result']='';
		if($sel){$data['result']='Migration has been completed';}
		$data['body']='static/migration';
		$this->load->view('welcome',$data);
	}
	public function preview()
	{
		$data = $this->general();
		$data['rec']=$this->public_model->get_data_preview();
		$data['rec_target']=$this->public_model->get_target_preview();
		$data['pagename']='preview';
		$data['body']='static/preview';
		$this->load->view('welcome',$data);
	}
	public function create_job($id = 0,$c_id=0)
	{
		$data = $this->general();
		$data['selected_id'] = 0;
		$data['connect_db'] =[];
		// $user_session_items = array(
        //     'connection' ,
		// 	'host' 		,
		// 	'port'			,
		// 	'user_name'		,
		// 	'password'		,
		// 	'database_name',
		// 	'db_list_name'	,
		// 	'schemas'		,
		// 	'conn_name' 	,
    	// 	'schema_lists' 	,
		// 	'schemas' 		,
    	// 	'selected_schemas' ,
    	// 	'table_lists' 	,
    	// 	'tables' 		,
		// 	'selected_tables' ,
		// 	't_connection' 	,
		// 	't_host' 		,
		// 	't_port'		,
		// 	't_user_name'		,
		// 	't_password'		,
		// 	't_warehouse'		,
		// 	't_database_list'	,
		// 	't_database_name'	,
		// 	't_schema'			,
		// 	't_name',
		// 	'jobname',
		// 			'job_id',
        //             'status'
        // );
		// $this->session->unset_userdata($user_session_items);
		if(!empty($id) && !empty($c_id))
		{
			$res = $this->public_model->get_conn_info($c_id);
			foreach($res as $r)
			{
				$name = $r['name'];
				$host = $r['hosturl'];
				$port = $r['port'];
				$userid = $r['userid'];
				$password = $r['password'];
				$database_name = $r['database_name'];
				$database_list = $r['database_list'];
			}
			if($database_list == 'Amazon RedShift'){
			$conn = "Driver={Devart ODBC Driver for Amazon Redshift};Server=$host;Database=$database_name;Port=$port";
			$x = odbc_connect($conn,$userid,$password);
			if($x){echo 'success';}else {echo 'failed';}
			}else if($database_list == 'Oracle'){
				$conn = "Driver={Devart ODBC Driver for Oracle};
				Server=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$host)(PORT=$port)(DATABASE=$database_name))(CONNECT_DATA=(SID=orcl)));";
				$x = odbc_connect($conn,$userid,$password);
				if($x){echo 'success';}else {echo 'failed';}	
			}else if($database_list == 'MYSQL'){
				$conn = mysqli_connect($host,$userid,$password,$database_name);
				if($conn){echo 'success';}else {echo 'failed';}
			}
			$jobdata = array(
				'connection' 	=>$conn,
				'host' 			=>$host,
				'port'			=>$port,
				'user_name'		=>$userid,
				'password'		=>$password,
				'database_name'	=>$database_name,
				'db_list_name'	=>$database_list,
				'conn_name' => $name
			);
		   $this->session->set_userdata($jobdata);
		}
		if($id){	
			$data['selected_id'] = $id;		
			$this->public_model->set_schema_update($id);
			$data['connect_db'] = $this->public_model->get_db_config($id);
		}
		// if($id && $c_id){
		// 	$data['selected_id'] = $id;		
		// 	$this->public_model->set_schema_update($id);
		// 	$res_conn = $this->public_model->update_db_config($c_id,$this->session->userdata('job_id'));
		// 	$jobdata = array(
		// 		'conn_name' =>$res_conn[0]['name']				
		// 	);
		//    $this->session->set_userdata($jobdata);
		// }
		$data['rec']= $this->public_model->get_dbnames_source();
		foreach ($data['rec'] as $key => $value) {
			if($value['status'] == 1){
				$data['selected_id'] = $value['id'];					
			}
		}
		$data['pagename']='current_job';
		$data['body']='static/create-job';
		$this->load->view('welcome',$data);
	}
	public function target($id=0)
	{
		$data = $this->general();
		$data['selected_id'] = 0;
		$data['selected_targetname'] = "";
		if($id){	
			$data['selected_id'] = $id;
			 $this->public_model->set_target_update($id);
			 $session_id=$this->session->userdata('job_id');	
			 $this->public_model->get_target_update($id,$session_id);
			 $this->public_model->get_job_update_complete($session_id);
		}
		$data['rec']= $this->public_model->get_target_dbnames();
		foreach ($data['rec'] as $key => $value) {
			if($value['status'] == 1){
				$data['selected_id'] = $value['id'];
				$data['selected_targetname'] = $value['snow_flake'];					
			}
		}
		$data['pagename']='target';
		$data['body']='static/target';
		$this->load->view('welcome',$data);
	}
	function check_conn($id)
	{
		$res = $this->public_model->get_conn_info($id);
		foreach($res as $r)
		{
			$name = $r['name'];
			$host = $r['hosturl'];
			$port = $r['port'];
			$userid = $r['userid'];
			$password = $r['password'];
			$database_name = $r['database_name'];
			$database_list = $r['database_list'];
		}
		if($database_list == 'Amazon RedShift'){
		$conn = "Driver={Devart ODBC Driver for Amazon Redshift};Server=$host;Database=$database_name;Port=$port";
		$x = odbc_connect($conn,$userid,$password);
		if($x){echo 'success';}else {echo 'failed';}
		}else if($database_list == 'Oracle'){
			$conn = "Driver={Devart ODBC Driver for Oracle};
			Server=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$host)(PORT=$port)(DATABASE=$database_name))(CONNECT_DATA=(SID=orcl)));";
			$x = odbc_connect($conn,$userid,$password);
			if($x){echo 'success';}else {echo 'failed';}	
		}else if($database_list == 'MYSQL'){
			$x = mysqli_connect($host,$userid,$password,$database_name);
			if($x){echo 'success';}else {echo 'failed';}
		}
	}
	function check_conn_target($id)
	{
		$res = $this->public_model->get_conn_info_target($id);
		foreach($res as $r)
		{
			$name = $r['name'];
			$host = $r['hosturl'];
			$port = $r['port'];
			$userid = $r['userid'];
			$password = $r['password'];
			$database_name = $r['database_name'];
			$database_list = $r['snow_flake'];
			$warehouse = $r['warehouse'];
		}
		$conn = "Driver={CData ODBC Driver for Snowflake};url=$host;warehouse=$warehouse;Database=$database_name;";
		$jobdata = array(
			't_connection' 	=>$conn,
			't_host' 			=>$host,
			't_port'			=>$port,
			't_user_name'		=>$userid,
			't_password'		=>$password,
			't_warehouse'		=>$warehouse,
			't_database_list'	=>$database_list,
			't_database_name'	=>$database_name,
			't_schema'			=>'PUBLIC',
			't_name'=> $name
		);
		$x = odbc_connect($conn,$userid,$password);
		// $sql = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG = 'TEST_DB' AND TABLE_SCHEMA = 'PUBLIC'";
		// $query = odbc_exec($x, $sql);
		// while ($d = odbc_fetch_array($query)) {
		// 	$arrReturn[] = $d['TABLE_NAME'];
		// }
		//$this->session->set_userdata('target_table_lists',$arrReturn);
	   $this->session->set_userdata($jobdata);
		if($x){echo 'success';} else {echo 'failed';}	
	}
	function config()
	{
		if(isset($_POST['id']))
		{
		  $id=$_POST['id'];
		  $this->public_model->delete_config_rec($id);
		}
		if($this->input->post('update'))
		{
			$config_id=$this->input->post('config_id');
			$db_type=$this->input->post('type');
			$host=$this->input->post('host');
			$port=$this->input->post('port');
			$warehouse=$this->input->post('warehouse');
			$database=$this->input->post('database_name');
			$user=$this->input->post('user');
			$password=$this->input->post('password');
			$this->public_model->update_config($config_id,$db_type,$host,$port,$warehouse,$database,$user,$password);
		}
		if($this->input->post('insert'))
		{
			$name=$this->input->post('name');
			$db_type=$this->input->post('type');
			$host=$this->input->post('new_host');
			$port=$this->input->post('new_port');
			$warehouse=$this->input->post('new_warehouse');
			$database=$this->input->post('database_name');
			$user=$this->input->post('new_user');
			$password=$this->input->post('new_password');
			$this->public_model->insert_config($name,$db_type,$host,$port,$warehouse,$database,$user,$password);
		}
		$data = $this->general();
		$data['pagename']='config';
		$data['body']='static/config';		
		$data['snow_flake']=$this->public_model->get_data_snow_flake();
		$data['mysql']=$this->public_model->get_data_mysql();
		$data['oracle']=$this->public_model->get_data_oracle();
		$data['sql']=$this->public_model->get_data_sql();
		$data['redshift']=$this->public_model->get_data_redshift();
		$data['postgresql']=$this->public_model->get_data_postgresql();
		$data['AllconfigList']=$this->public_model->getAllConfigList();
		$data['dbNameList']= $this->public_model->get_dbnames();
		$this->load->view('welcome',$data);
	}
	function get_database_record($id)
	{
		$rec=$this->public_model->get_database_record($id);
		echo json_encode($rec);
	}
	function get_connection_data($id)
	{
		$rec=$this->public_model->get_connection_records($id);
		echo json_encode($rec);
	}
	function schema_list($id = 0)
	{
		$data = $this->general();
		if($id){
		} else {
			redirect('/create-job');
		}
		$data['pagename']='SchemaList';
		$data['body']='static/schema';
		$this->load->view('welcome',$data);
	}
	function target_schema_list($id = 0)
	{
		$data = $this->general();
		if($id){
		} else {
			redirect('/target');
		}
		$data['pagename']='TargetSchemaList';
		$data['body']='static/schema';
		$this->load->view('welcome',$data);
	}
	function Adding_Schema_Sessions($left_schemas = 0, $right_selected_schemas = 0)
	{
		$j_id = $this->session->userdata('job_id');
		$left_schemas = $this->input->post('schemas');
		$right_selected_schemas = $this->input->post('selected_schemas');
		$left = json_encode($left_schemas);
		$right = json_encode($right_selected_schemas);
		$this->session->set_userdata('schemas',json_encode($left_schemas));
		$this->session->set_userdata('selected_schemas',json_encode($right_selected_schemas));
		$schemas = $this->public_model->insert_session_schema_table($j_id,$left, $right);
	}
	function Adding_tables_Sessions($schemas = 0, $selected_schemas = 0)
	{
		$tables = $this->input->post('tables');
		$selected_tables = $this->input->post('selected_tables');
		$this->session->set_userdata('tables',json_encode($tables));
		$this->session->set_userdata('selected_tables',json_encode($selected_tables));
	}
	// function Target_Schema_Lists()
	// {
	// 	$session = $this->session->userdata();
	// 	$conn=$this->session->userdata('connection');
	// 	$user_name = $this->session->userdata('user_name');
	// 	$password = $this->session->userdata('password');
	// 	$database_list = $this->session->userdata('db_list_name');
	// 	$x = odbc_connect($conn,$user_name,$password);
	// 	$sql = 'SHOW SCHEMAS';
	// 	$query = odbc_exec($x, $sql);
	// 	while ($d = odbc_fetch_array($query)) {
	// 		$arrReturn[] = $d;
	// 	}
	// 	$schema_lists = array();
	// 	foreach($arrReturn as $schema)
	// 	{
	// 		$data = array();
	// 		$data['id'] = $schema['USERNAME'];
	// 		$data['label'] = $schema['USERNAME'];
	// 		array_push($schema_lists, $data);
	// 	}
	// 	$this->session->set_userdata('target_schema_lists',json_encode($schema_lists));
	// 	$rec = array();
	// 	$rec['status'] = "success";
	// 	$rec['code'] = "1001";
	// 	$rec['data'] = $schema_lists;
	// 	echo json_encode($rec);
	// }
	function Schema_Lists()
	{
		
		$session = $this->session->userdata();
		// print_r($session);exit;
		$conn=$this->session->userdata('connection');
		$user_name = $this->session->userdata('user_name');
		$password = $this->session->userdata('password');
		$database_list = $this->session->userdata('db_list_name');
		$x = odbc_connect($conn,$user_name,$password);
		if($database_list == 'Oracle'){
			$sql = 'select USERNAME from SYS.ALL_USERS';
		}else if($database_list == 'Amazon RedShift'){
			$sql = 'select nspname from pg_namespace';
		}
		$query = odbc_exec($x, $sql);
		while ($d = odbc_fetch_array($query)) {
			$arrReturn[] = $d;
		}
		$schema_lists = array();
		foreach($arrReturn as $schema)
		{
			$data = array();
			if($database_list == 'Amazon RedShift'){
				$data['id'] = $schema['nspname'];
				$data['label'] = $schema['nspname'];
			}else if($database_list == 'Oracle'){
				$data['id'] = $schema['USERNAME'];
				$data['label'] = $schema['USERNAME'];
			}
			array_push($schema_lists, $data);
		}
		$this->session->set_userdata('schema_lists',json_encode($schema_lists));
		$rec = array();
		$rec['status'] = "success";
		$rec['code'] = "1001";
		$rec['data'] = $schema_lists;
		echo json_encode($rec);
	}
	public function schemas($id=1)
	{
		$rec = array();
		$rec['schema'] = $this->public_model->get_schema($id, 0);
		$rec['schema_selected'] =$this->public_model->get_schema($id, 1);
		$rec['status'] = "success";
		$rec['code'] = "1001";
		echo json_encode($rec);
	}
	public function schemas_update($id=0)
	{
		$schema = $this->input->post('id');
		$session_id=$this->session->userdata('job_id');
		$rec = array();
		$rec['status'] = "success";
		$rec['code'] = "1001";
		$this->public_model->schema_list_updste($schema,$session_id);
		echo json_encode($rec);
	}
	public function table_update($id=0)
	{
		$schema = $this->input->post('id');
		$session_id=$this->session->userdata('job_id');
		$rec = array();
		$rec['status'] = "success";
		$rec['code'] = "1001";
			$this->public_model->table_list_updste($schema,$session_id);
		echo json_encode($rec);
	}
	public function table_list($id=1)
	{
		$rec = array();
		$rec['schema'] = $this->public_model->get_table($id, 0);
		$rec['schema_selected'] =$this->public_model->get_table($id, 1);
		$rec['status'] = "success";
		$rec['code'] = "1001";
		echo json_encode($rec);
	}
	function table_with_schema()
	{
		$conn=$this->session->userdata('connection');
		$db_name = $this->session->userdata('database_name');
		$user_name = $this->session->userdata('user_name');
		$password = $this->session->userdata('password');
		$database_list = $this->session->userdata('db_list_name');
		$selected_schemas = $this->session->userdata('selected_schemas');
		$s_schemas = json_decode($selected_schemas);
		foreach($s_schemas as $s)
		{
			$Schema_s[] = $s->label;
		}
		$Schema_Lists = "'" . implode ( "', '", $Schema_s ) . "'";
		$arrReturn = array();
		$x = odbc_connect($conn,$user_name,$password);
		if($database_list == 'Oracle'){
			$sql = "SELECT DISTINCT OWNER, OBJECT_NAME FROM ALL_OBJECTS WHERE OBJECT_TYPE = 'TABLE' AND OWNER in ($Schema_Lists)";
		}else if($database_list == 'Amazon RedShift'){
			$sql = "Select * from information_schema.tables where table_schema in ($Schema_Lists)";
		}
		$query = odbc_exec($x, $sql);
		while ($d = odbc_fetch_array($query)) {
			$arrReturn[] = $d;
		}
		$table_lists = array();
		foreach($arrReturn as $schema)
		{
			$data = array();
			if($database_list == 'Amazon RedShift'){
				$data['id'] = $schema['table_name'];
				$data['label'] =  $schema['table_schema'].'.'.$schema['table_name'];
			}else if($database_list == 'Oracle'){
				$data['id'] = $schema['OBJECT_NAME'];
				$data['label'] =  $schema['OWNER'].'.'.$schema['OBJECT_NAME'];
			}
			array_push($table_lists, $data);
		}
		$this->session->set_userdata('table_lists',json_encode($table_lists));
		$rec = array();
		$rec['status'] = "success";
		$rec['code'] = "1001";
		$rec['data'] = $table_lists;
		echo json_encode($rec);
	}
	public function table()
	{
		$data = $this->general();
		$data['pagename']='TableList';
		$data['body']='static/table';
		$this->load->view('welcome',$data);
	}
	public function source_update($id)
	{
		 $this->public_model->set_schema_update($id);
	}
	public function new_crete_job()
	{
		
		// $this->session->sess_destroy();
		$user_session_items = array(
			    'connection' ,
				'host' 		,
				'port'			,
				'user_name'		,
				'password'		,
				'database_name',
				'db_list_name'	,
				'schemas'		,
				'conn_name' 	,
				'schema_lists' 	,
				'schemas' 		,
				'selected_schemas' ,
				'table_lists' 	,
				'tables' 		,
				'selected_tables' ,
				't_connection' 	,
				't_host' 		,
				't_port'		,
				't_user_name'		,
				't_password'		,
				't_warehouse'		,
				't_database_list'	,
				't_database_name'	,
				't_schema'			,
				't_name',
				'jobname',
						'job_id',
			            'status'
			);
			$this->session->unset_userdata($user_session_items);
		if($this->input->post('submit'))
		{
			$job_name=$this->input->post('job_name');
			$this->public_model->new_create_job($job_name);
			$x= $this->public_model->get_job_data();
			 	$jobdata = array(
                    'jobname' =>$x[0]['j_name'],
					'job_id'=>$x[0]['joblistid'],
                    'status'=>$x[0]['status']      
                );
               $this->session->set_userdata($jobdata);
			redirect('/create-job');
		}
	}
	public function migration_process($id=0){
		$data = $this->general();
		$T_table_list = $this->session->userdata('target_table_lists');
		$data['schema']=$this->public_model->get_job_schema($id);
		$data['tables']=$this->public_model->get_job_tables($id);
		$data['target']=$this->public_model->get_job_target($id);
		$data['Table_Details'] = [];
		//print_r($this->session->userdata());exit;
		if($id){
			$res = $this->public_model->getJobList($id);
			if(!empty($res[0]['j_name'])){
				$this->session->set_userdata('jobname',$res[0]['j_name']);}
			if(!empty($res[0]['s_conn'])){
				$this->session->set_userdata('conn_name',$res[0]['s_conn']);}
			if(!empty($res[0]['s_db'])){
			$this->session->set_userdata('db_list_name',$res[0]['s_db']);}
			if(!empty($res[0]['s_schema_l'])){
			$this->session->set_userdata('schemas',$res[0]['s_schema_l']);}
			if(!empty($res[0]['s_schema_r'])){
			$this->session->set_userdata('selected_schemas',$res[0]['s_schema_r']);}
			if(!empty($res[0]['s_table_l'])){
			$this->session->set_userdata('tables', $res[0]['s_table_l']);}
			if(!empty($res[0]['s_table_r'])){
			$this->session->set_userdata('selected_tables', $res[0]['s_table_r']);}
			if(!empty($res[0]['t_conn'])){
			$this->session->set_userdata('t_name', $res[0]['t_conn']);}
			if(!empty($res[0]['t_db'])){
			$this->session->set_userdata('t_database_list', $res[0]['t_db']);}
			if(!empty($res[0]['t_schema'])){
			$this->session->set_userdata('t_schema', $res[0]['t_schema']);}

		} else {
			if($this->session->userdata('job_id')){
			$job_data = array(
				's_conn' => $this->session->userdata('conn_name'),
				's_db' => $this->session->userdata('db_list_name'),
				's_schema_l' => $this->session->userdata('schemas'),
				's_schema_r' => $this->session->userdata('selected_schemas'),
				's_table_l' => $this->session->userdata('tables'),
				's_table_r' => $this->session->userdata('selected_tables'),
				't_conn' =>$this->session->userdata('t_name') ,
				't_db' => $this->session->userdata('t_database_list'),
				't_schema' =>$this->session->userdata('t_schema'),
				'status' => 'completed',
			 );
			$this->public_model->insertJobList($job_data, $this->session->userdata('job_id'));
			}
		}
		$data['config']=$this->public_model->get_job_config($id);
		$conn=$this->session->userdata('connection');
		$user_name = $this->session->userdata('user_name');
		$password = $this->session->userdata('password');
		$database_list = $this->session->userdata('db_list_name');
		$schema_name = $this->session->userdata('schema');
		if($this->input->post('schema'))
		{
			$schema = $this->input->post('schema');
			$schema_n = explode('.',$schema);
			$schema_nam = $schema_n[0];
			$table = $this->input->post('table');
			//echo $schema_nam.' - '.$table;exit;
			$x = odbc_connect($conn,$user_name,$password);
			if($database_list == 'Oracle'){
				$sql = "select col.column_id, 
				col.owner as schema_name, col.table_name, col.column_name, col.data_type from sys.all_tab_columns col
				 inner join sys.all_tables t on col.owner = t.owner and col.table_name = t.table_name where col.owner = '$schema_nam' 
				 and col.table_name = '$table' order by col.column_id;";
			}else if($database_list == 'Amazon RedShift'){
				$sql = "select table_name, column_name, data_type from information_schema.columns
		 				where table_name = '$table' and table_schema = '$schema_nam' order by ordinal_position;";
			}
			$query = odbc_exec($x, $sql);
			while ($d = odbc_fetch_array($query)) {
				$arrReturn[] = $d;
			}
			//print_r($arrReturn);exit;
			$data['Table_Details'] = $arrReturn;
		}
		$data['database_list'] = $database_list;
		$data['table_names'] = $T_table_list;
		$data['pagename']='migration_process';
		$data['body']='static/migration_process';
		$this->load->view('welcome',$data);
	}	
}