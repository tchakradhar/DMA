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
								echo "<span class=' d-block py-2 '>".$value->id."</span>";
								}
							} 
						?>	
					</div>
				</td>
				<td>
					<div class="d-block">
						<?php if( !empty($this->session->userdata('t_schema'))){
								echo "<span class=' d-block py-2 '>".$this->session->userdata('t_schema')."</span>";
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
		<a  class="text-decoration-none btn btn-success text-light" href="<?php echo base_url();?>migration">Migration </a>
</div>
    