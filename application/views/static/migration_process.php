
        <div class="col-md-10 mt-4 px-5 ">

	       	<div class="source-title ">
		        <h4 class="text-danger text-center"><b></b></h4>
		    </div>
		    <div>
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
								<?php 
								foreach ($source as $row) {
					    			 echo "<span class=' d-block py-2 '>".$row['database_list']."</span>";

								} 
								?>	
		    				</div>
		    			</td>
		    			<td>
		    				<div class="d-block">
								<?php 
								// foreach ($schema as $row) {
					    		// 	 echo "<span class=' d-block py-2 '>".$row['schema_list']."</span>";

								// }
								if( !empty($this->session->userdata('selected_schemas'))){
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
								<?php
								//  foreach ($tables as $row) {
					    		// 	 echo "<span class=' d-block py-2 '>".$row['table_list']."</span>";

								// } 
								if( !empty($this->session->userdata('selected_tables'))){
									$schema_list_sel = json_decode($this->session->userdata('selected_tables'));
									foreach ( $schema_list_sel  as $key => $value) { //echo $value;
										echo "<span class=' d-block py-2 '>".$value->id."</span>";
										
										//echo "<b>".$value->label."</b><br>";
									 }
								  } 
								?>	
		    				</div>
		    				
		    			</td>
		    			<td>
		    				<div class="d-block">
		    					<?php foreach ($target as $row) {
					    			 echo "<span class=' d-block py-2 '>".$row['snow_flake']."</span>";

					    		} ?>	
		    				</div>
		    			</td>
		    			<td>
		    				<div class="d-block">
		    					<?php foreach ($target as $row) {
					    			 echo "<span class=' d-block py-2 '>".$row['snow_flake']."</span>";

					    		} ?>	
		    				</div>
		    			</td>
		    			<td>
		    				<div class="d-block">
		    					<?php foreach ($target as $row) {
					    			 echo "<span class=' d-block py-2 '>".$row['snow_flake']."</span>";

					    		} ?>	
		    				</div>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
        	 <a  class="text-decoration-none btn btn-success text-light" href="<?php echo base_url();?>migration">
                                  Migration </a>
        </div>
    