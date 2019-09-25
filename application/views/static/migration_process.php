<div class="col-md-12 mt-4 px-5 ">
	<div class="source-title ">
		<h4 class="text-danger text-center"><b></b></h4>
	</div>
	<div>
		<div class="row bg-danger">
			<div class="col-md-6">Source DB</div>
			<div class="col-md-6">Target Environment</div>
		</div>
<table id="Preview_Table" class="table table-bordered">
	<thead>
	<tr scope="col" class="table-danger">
		<th>Source Schema</th>
		<th>Source Table Name</th>
		<th>Target Schema</th>
		<th>Target Table Name</th>
	</tr>
	</thead>
	<tbody>
<tr scope="col">
	<td class="p-0">
		<div class="d-block">
			<?php if( !empty($this->session->userdata('selected_tables'))){
				$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
				foreach ( $schema_list_sel  as $key => $value) {
					$schema_n = explode('.',$value->label);
					$schema_nam = $schema_n[0];
					echo "<span class='border p-2 d-block py-2 '>".$schema_nam."</span>";
					}
				}?>	
		</div>
	</td>
	<td class="p-0">
<div class="d-block">
	<?php if( !empty($this->session->userdata('selected_tables'))){
		$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
		foreach ( $schema_list_sel  as $key => $value) { //echo $value;
			echo "<form method='Post' action=''><input type='hidden' name='schema' value='$value->label'>
			<input type='hidden' name='table' value='$value->id'>
			<button class='border p-2 d-block py-2 migrate_button'>".$value->id."</button></form>";
			}
		}
	?>	
</div>
</td>
<td class="p-0">
	<div class="d-block">
		<?php if( !empty($this->session->userdata('selected_tables'))){
			$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
			foreach ( $schema_list_sel  as $key => $value) {
				$schema_n = explode('.',$value->label);
				$schema_nam = $schema_n[0];
				echo "<input class='w-100 border p-2 d-block' type='text' value='$schema_nam'>";
				}
			}?>	
	</div>
	</td>
	<td class="p-0">
<div class="d-block">
	<?php if( !empty($this->session->userdata('selected_tables'))){
		$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
		foreach ( $schema_list_sel  as $key => $value) { //echo $value;
			echo "<input class='w-100 border p-2 d-block' value='$value->id'>";
			}
		}
	?>	
</div>
</td>
</tr>
</tbody>
		</table>
	</div>
</div>
<?php if($database_list == 'Amazon RedShift'){?>
<div class="col-md-10 mt-4 px-5 table_view <?php if(count($Table_Details)>0){echo 'd-block';} ?>">
<table class=" table table-bordered">
	<tr scope="col" class="table-danger">
		<!-- <th>Source Table</th> -->
		<th>Source Column</th>
		<th>Source Data Type</th>
		<!-- <th>Target Table</th> -->
		<th>Target Column</th>
		<th>Target Data Type</th>
	</tr>
	<tr scope="col" class="" >
		<!-- <td>
			<div class="d-block"><?php //foreach($Table_Details  as $k) {echo "<span class=' d-block py-2 '>".$k['table_name']."</span>";}?></div>
		</td> -->
		<td class="p-0">
			<div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<span class='border p-2  d-block py-2 '>".$k['column_name']."</span>";}?></div>
		</td>
		<td class="p-0">
			<div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<span class='border p-2  d-block py-2 '>".$k['data_type']."</span>";}?></div>	
			</div>
		</td>
		<!-- <td>
			<div class="d-block"><?php //foreach($Table_Details  as $k) {echo "<input class=' d-block py-2 ' value=".$k['table_name'].">";}?></div>
		</td> -->
		<td class="p-0">
			<div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<input class='w-100 border p-2  d-block py-2 ' value=".$k['column_name'].">";}?></div>
		</td>
		<td class="p-0">
			<div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<input class='w-100 border p-2  d-block py-2 ' value=".$k['data_type'].">";}?></div>	
			</div>
		</td>
	</tr>
</table>
</div>
<?php }else{?>
	<div class="col-md-10 mt-4 px-5 table_view <?php if(count($Table_Details)>0){echo 'd-block';} ?>">
<table class=" table table-bordered">
			<tr scope="col" class="bg-danger">
				<!-- <th>Source Table</th> -->
				<th>Source Column</th>
				<th>Source Data Type</th>
				<!-- <th>Target Table</th> -->
				<th>Target Column</th>
				<th>Target Data Type</th>
			</tr>
			<tr scope="col" class="" >
<!-- <td><div class="d-block"><?php //foreach($Table_Details  as $k) {echo "<span class=' d-block py-2 '>".$k['TABLE_NAME']."</span>";}?></div></td> -->
		<td class="p-0"><div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<span class='border p-2  d-block py-2 '>".$k['COLUMN_NAME']."</span>";}?></div></td>
		<td class="p-0"><div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<span class='border p-2  d-block py-2 '>".$k['DATA_TYPE']."</span>";}?></div></div></td>
<!-- <td><div class="d-block"><?php //foreach($Table_Details  as $k) {//	echo "<input class=' d-block py-2 ' value=".$k['TABLE_NAME'].">";//	}?></div></td> -->
		<td class="p-0"><div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<input class='w-100 border p-2  d-block py-2 ' value=".$k['COLUMN_NAME'].">";}?></div></td>
		<td class="p-0"><div class="d-block"><?php foreach ( $Table_Details  as $k) {echo "<input class='w-100 border p-2  d-block py-2 ' value=".$k['DATA_TYPE'].">";}?></div></div>		</td>
			</tr>
		</table>
</div>
<?php }?>
<a  class="text-decoration-none btn btn-success text-light" href="<?php echo base_url();?>migration">Migrate </a>			