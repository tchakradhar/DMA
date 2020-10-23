<div class="col-md-12 mt-4 px-5 ">
	<div class="source-title ">
		<h4 class="text-danger text-center"><b></b></h4>
	</div>
	<div>
<table id="Preview_Table" class="table table-bordered">
<thead>
<tr scope="col" class="table-danger">
	<th colspan="2">Source DB</th>
	<th colspan="2">Target Environment</th>
</tr>
<tr scope="col" class="table-gray">
	<th>Source Schema</th>
	<th>Source Table Name</th>
	<th>Target Schema</th>
	<th>Target Table Name</th>
</tr>
</thead>
<tbody>
<tr scope="col">
<form method='post' action=''>
	<td class="p-0">
		<div class="d-block">
			<?php if( !empty($this->session->userdata('selected_tables'))){
				$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
				//print_r($schema_list_sel);
				foreach ( $schema_list_sel  as $key => $value) {
					$schema_n = explode('.',$value->label);
					$schema_nam = $schema_n[0];
					echo "<span class='border p-2 d-block py-2 bg-gray'>".$schema_nam."</span>";
					}
				}?>	
		</div>
	</td>
	<td class="p-0">
<div class="d-block">
	<?php if( !empty($this->session->userdata('selected_tables'))){
		$schema_list_sel = json_decode($this->session->userdata('selected_tables'));$v=0;
		foreach ( $schema_list_sel  as $key => $value) { 
					$schema_nv = explode('.',$value->label);
			echo "<a class='border p-2 d-block py-2 migrate_button bg-gray' 
			href='".base_url()."migration-process/".$this->session->userdata('job_id')."/$schema_nv[0]/$schema_nv[1]/$v'>".$value->id."</a>";
			$v++;
			}
		}
	?>	
</div>
</td>
<td class="p-0">
	<div class="d-block input-icons">
	<?php  if( !empty($this->session->userdata('seleted_target'))){
		$schema_list_sel = json_decode($this->session->userdata('seleted_target'));
		//echo $this->session->userdata('seleted_target').' target';
		//print_r($schema_list_sel);
		foreach ( $schema_list_sel  as $key => $value) {
			$schema_n = explode('.',$value->label);
			$schema_nam = $schema_n[0];
			echo "<input class='w-100 border p-2 d-block input-field' type='text' name='new_schema[]' value='$schema_nam'>";
		}
	}?>	
	</div>
	</td>
	<td class="p-0">
<div class="d-block input-icons">
	<?php if( !empty($this->session->userdata('seleted_target'))){
		$schema_list_sel = json_decode($this->session->userdata('seleted_target'));
		foreach ( $schema_list_sel  as $key => $value) {
			echo "<input class='w-100 border p-2 d-block input-field' name='new_table[]' value='$value->id'>";
		}
	}
	?>	
</div>
</td>
</tr>
</tbody>
</table>
<input type="submit" value="Save" class="float-right py-2 btn btn-success" name="schema_edit_from"/>
</form>
</div>
</div>
<form action="" method="post">
<?php if($database_list == 'Amazon RedShift'){?>
<div class="col-md-10 mt-4 px-5 table_view <?php if(count($Table_Details)>0){echo 'd-block';} ?>">
<table class=" table table-bordered">
	<tr scope="col" class="table-gray">
	<th>Source Column</th>
	<th>Source Data Type</th>
	<th>Target Column</th>
	<th>Target Data Type</th>
	</tr>
	<tr scope="col" class="" >
		<td class="p-0">
			<div class="d-block"><?php foreach($Table_Details as $k) 
			{echo "<span class='border p-2 bg-gray d-block py-2'>".$k['column_name']."</span>";}?></div>
		</td>
		<td class="p-0">
			<div class="d-block"><?php foreach($Table_Details as $k) 
			{echo "<span class='border p-2 bg-gray d-block py-2'>".$k['data_type']."</span>";}?></div></div>
		</td>
		<td class="p-0">
			<div class="d-block input-icons"><?php foreach($Table_Details as $k) 
			{echo "<input class='w-100 border p-2 input-field d-block py-2' name='column_name[]' value=".$k['column_name'].">";}?></div>
		</td>
		<td class="p-0">
			<div class="d-block input-icons"><?php foreach($Table_Details as $k) 
			{echo "<input class='w-100 border p-2 input-field d-block py-2' name='data_type[]' value=".$k['data_type'].">";}?></div></div>
		</td>
	</tr>
</table>
</div>
<?php }else{?>
<div class="col-md-10 mt-4 px-5 table_view <?php if(count($Table_Details)>0){echo 'd-block';} ?>">
<table class=" table table-bordered">
	<tr scope="col" class="table-gray">
	<th>Source Column</th>
	<th>Source Data Type</th>
	<th>Target Column</th>
	<th>Target Data Type</th>
	</tr>
	<tr scope="col" class="">
		<td class="p-0"><div class="d-block"><?php foreach($Table_Details as $k) 
		{echo "<span class='border p-2 bg-gray d-block py-2'>".$k['COLUMN_NAME']."</span>";}?></div></td>
		<td class="p-0"><div class="d-block"><?php foreach($Table_Details as $k) 
		{echo "<span class='border p-2 bg-gray d-block py-2'>".$k['DATA_TYPE']."</span>";}?></div></div></td>
		<td class="p-0"><div class="d-block input-icons"><?php foreach($Table_Details as $k) 
		{echo "<input class='w-100 border p-2 input-field d-block py-2' name='column_name[]' value=".$k['COLUMN_NAME'].">";}?></div></td>
		<td class="p-0"><div class="d-block input-icons"><?php foreach($Table_Details as $k) 
		{echo "<input class='w-100 border p-2 input-field d-block py-2' name='data_type[]' value=".$k['DATA_TYPE'].">";}?></div></div></td>
	</tr>
</table>
</div>
<?php }?>
<div class="col-12 text-center">
<input class='border d-inline-block mr-3 p-2 py-2 btn btn-success' type="submit" name="table_data_save" value="Save" />
<input class='border d-inline-block p-2 py-2 btn btn-success' type="submit" name="migrate" value="Migrate" />
</div>
</form>