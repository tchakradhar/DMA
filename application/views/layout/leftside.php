<div class="wrapper">
<nav id="sidebar">
      <div class="sidebar-header">
        <a href="<?php echo base_url();?>">
          <img src="<?php echo  base_url();?>assets/images/Migration_logo.png" style="width:120px;margin:auto;display:block;">
        </a>
      </div>
<div class="sidebar accordion" id="accordionExample">
<?php
if($pagename=='home'){} else if($pagename=='config'){ ?>
  <?php if(count($AllconfigList)>0){
                 foreach ($AllconfigList as $key => $value) {  //print_r( $value);?>
  <div class="col-12 py-2 mt-2 pl-1 border-bottom">
            <b><?php echo $value['database_list']; ?></b> 
    </div>
    <?php }  }?>

 <?php } else {
?>
  <div class="col-12 py-2 mt-2 pl-1 border-bottom">
            <?php if($this->session->userdata('jobname') != ''){
                echo "<b>".$this->session->userdata('jobname')."</b>";
            }
                else{?>
            <b>Job Name</b> <?php } ?>
    </div>
    <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link text-dark" type="button" data-toggle="collapse" data-target="#collapse11" aria-expanded="true" aria-controls="collapseOne">
          <b>Source Connection <i class="fa fa-angle-down"></i></b>
        </button>
      </h2>
    </div>
    <div id="collapse11" class="collapse <?php if($this->session->userdata('conn_name')) { echo  'show'; }?> " aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
      <?php if($this->session->userdata('conn_name')){ ?>
                <div class="card-header" id="headingOne">
                  <h2 class="mb-0">
                    <button class="btn btn-link text-dark ml-0" type="button" data-toggle="collapse" data-target="#collapsetwo" aria-expanded="true" aria-controls="collapsetwo">
                      
                     <?php       echo "<b>".$this->session->userdata('conn_name')."</b>";
                        ?> 
                    </button>
                  </h2>
                </div>
                <?php  }?> 
                <div class="card-header" id="headingOne">
                  <h2 class="mb-0">
                    <button class="btn btn-link text-dark ml-2" type="button" data-toggle="collapse" data-target="#collapsetwo" aria-expanded="true" aria-controls="collapsetwo">
                      
                      <?php if( count($source)>0){
                            echo "<b>".$source[0]['database_list']."</b>";
                        }
                        else
                          {
                            echo "<b>Select Database</b>";
                          }?>
                    </button>
                  </h2>
                </div>
                <div class="card-header" id="headingOne">
                  <h2 class="mb-0">
                    <button class="btn btn-link  text-dark text-left ml-3" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                      <!-- <b>Select Schemas</b> -->
                      <?php 
                //       if( count($schema)>0){
                //  foreach ($schema as $key => $value) {
                //         echo "<b>".$value['schema_list']."</b><br>";
                //      }
                //     }
              //print_r($this->session->userdata('selected_tables'));
                    if( !empty($this->session->userdata('selected_tables'))){
                      $schema_list_sel = json_decode($this->session->userdata('selected_tables'));
                      foreach ( $schema_list_sel  as $key => $value) {
                          echo "<b>".$value->label."</b><br>";
                       }
                    } else 
                    if( !empty($this->session->userdata('selected_schemas'))){
                      $schema_list_sel = json_decode($this->session->userdata('selected_schemas'));
                      foreach ( $schema_list_sel  as $key => $value) {
                          echo "<b>".$value->label."</b><br>";
                       }
                      }
                    else{
                       echo "<b>Select Schemas</b>";
                    }
                        ?> 
                    </button>
                  </h2>
                </div>
               <?php if( empty($this->session->userdata('selected_schemas'))){       ?>
                <div class="card-header" id="headingOne">
                      <h2 class="mb-0">
                        <button class="btn btn-link  text-dark ml-3" type="button" data-toggle="collapse" data-target="#collapsefour" aria-expanded="true" aria-controls="collapsefour">
                         <!--  <b>Select Tables</b> -->
                          <?php  echo "<b>Select Tables</b>";
                          ?>
                        </button>
                      </h2>
                </div>
              <?php }?> 
      </div>
    </div>
  </div>
  <div class="card">
  <div class="card-header" id="headingOne">
    <h2 class="mb-0">
      <button class="btn btn-link  text-dark" type="button" data-toggle="collapse" data-target="#collapsefive" aria-expanded="true" aria-controls="collapseOne">
        <b>Target Connection <i class="fa fa-angle-down"></i></b>
      </button>
    </h2>
  </div>
  <div id="collapsefive" class="collapse target_body ml-3 p-2 <?php if(count($target)>0){ echo 'show'; }?>" aria-labelledby="headingOne" data-parent="#accordionExample">
    <div class="card-body ">
        <?php if(count($target)>0){
                foreach ($target as $key => $value) {
                      echo "<b>".$value['snow_flake']."</b><br>";
                }
          }?> 
    </div>
  </div>
  </div>
  <div class="col-12 py-2 mt-2 pl-2 border-bottom">
      <b>Table Creation</b>
  </div> 
  <div class="col-12 py-2 mt-2 pl-2 border-bottom">
      <b>Data Migration</b>
  </div> 
  <div class="col-12 py-2 mt-2 pl-2 border-bottom">
      <b>Summary</b>
  </div>  
<?php }?>
</div>
</nav>