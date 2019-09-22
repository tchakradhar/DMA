<div class="col-md-10 mt-4 px-5 ">
	<div class="source-title ">
		<h4 class="text-danger text-center"><b></b></h4>
	</div>
	<div>
		<div class="row bg-danger">
			<div class="col-md-6">Source DB</div>
			<div class="col-md-6">Target Environment</div>
		</div>
		<table class=" table table-striped">
			<tr scope="col" class="table-danger">
				<th>Source Schema</th>
				<th>Source Table Names</th>
				<th>Target Schema</th>
				<th>Target Table Names</th>
			</tr>
			<tr scope="col" class="table table-striped" >
				<td>
					<div class="d-block">
						<?php if( !empty($this->session->userdata('selected_schemas'))){
							$schema_list_sel = json_decode($this->session->userdata('selected_schemas'));
							foreach ( $schema_list_sel  as $key => $value) {
								echo "<span class=' d-block py-2 '>".$value->label."</span>";
								}
							}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
						<?php if( !empty($this->session->userdata('selected_tables'))){
							$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
							foreach ( $schema_list_sel  as $key => $value) { //echo $value;
								echo "<form method='Post' action=''>
								<input type='hidden' name='schema' value='$value->label'>
								<input type='hidden' name='table' value='$value->id'>
								<button class='d-block py-2 migrate_button'>".$value->id."</button></form>";
								}
							} 
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
						<?php foreach ($target as $row) {
								echo "<span class=' d-block py-2'>PUBLIC</span>";
						} ?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php if( !empty($this->session->userdata('selected_tables'))){
							$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
							foreach ( $schema_list_sel  as $key => $value) { //echo $value;
								echo "<span class=' d-block py-2 '>".$value->id."</span>";
								}
						} ?>	
					</div>
				</td>
			</tr>
		</table>
	</div>
		
</div>
<?php if($database_list == 'Amazon RedShift'){?>
<div class="col-md-10 mt-4 px-5 table_view <?php if(count($Table_Details)>0){echo 'd-block';} ?>">
<table class=" table table-striped">
			<tr scope="col" class="table-danger">
				<th>Source Table</th>
				<th>Source Column</th>
				<th>Source Data Type</th>
				<th>Target Table</th>
				<th>Target Column</th>
				<th>Target Data Type</th>
			</tr>
			<tr scope="col" class="table table-striped" >
				<td>
					<div class="d-block">
						<?php foreach($Table_Details  as $k) {
								echo "<span class=' d-block py-2 '>".$k['table_name']."</span>";
							}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<span class=' d-block py-2 '>".$k['column_name']."</span>";
								}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<span class=' d-block py-2 '>".$k['data_type']."</span>";
								}
						?>	
					</div>	
					</div>
				</td>
				<td>
					<div class="d-block">
						<?php foreach($Table_Details  as $k) {
								echo "<input class=' d-block py-2 ' value=".$k['table_name'].">";
							}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<input class=' d-block py-2 ' value=".$k['column_name'].">";
								}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<input class=' d-block py-2 ' value=".$k['data_type'].">";
								}
						?>	
					</div>	
					</div>
				</td>
			</tr>
		</table>
</div>
<?php }else{?>
	<div class="col-md-10 mt-4 px-5 table_view <?php if(count($Table_Details)>0){echo 'd-block';} ?>">
<table class=" table table-striped">
			<tr scope="col" class="table-danger">
				<th>Source Table</th>
				<th>Source Column</th>
				<th>Source Data Type</th>
				<th>Target Table</th>
				<th>Target Column</th>
				<th>Target Data Type</th>
			</tr>
			<tr scope="col" class="table table-striped" >
				<td>
					<div class="d-block">
						<?php foreach($Table_Details  as $k) {
								echo "<span class=' d-block py-2 '>".$k['TABLE_NAME']."</span>";
							}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<span class=' d-block py-2 '>".$k['COLUMN_NAME']."</span>";
								}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<span class=' d-block py-2 '>".$k['DATA_TYPE']."</span>";
								}
						?>	
					</div>	
					</div>
				</td>
				<td>
					<div class="d-block">
						<?php foreach($Table_Details  as $k) {
								echo "<input class=' d-block py-2 ' value=".$k['TABLE_NAME'].">";
							}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<input class=' d-block py-2 ' value=".$k['COLUMN_NAME'].">";
								}
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
					<?php foreach ( $Table_Details  as $k) {
								echo "<input class=' d-block py-2 ' value=".$k['DATA_TYPE'].">";
								}
						?>	
					</div>	
					</div>
				</td>
			</tr>
		</table>
</div>
<?php }?>
<a  class="text-decoration-none btn btn-success text-light" href="<?php echo base_url();?>migration">Migrate </a>			

<script>
function display_table()
{
	// var y = x.split('.');
	// var schema = y[0];
	// var table = y[1];
	// alert(table);
	console.log('schema');
	$('.table_view').show();
}
</script>