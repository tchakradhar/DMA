
<div class="col-md-12 mt-4 px-5 ">

    <div class="configuration_page">
        <div class="row mb-4">
            <button class="btn float-right btn-danger" data-toggle='modal' data-target='#myModal1' id="New_Conn">New Conection</button>
        </div>
        <div class="Avail_Conn">Available Connections</div>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog custom-modeal-body" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Add New Connection</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pb-2">
                        <form action="<?php echo base_url(); ?>insert_config" method="POST">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Connection Name:</label>
                                <input type="text" class="form-control"  id="host" name="name">
                            </div>
                                <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Type:</label>
                            <select class="form-control database_list" name="type" onchange="Check_SF()" style="border-left: none; border-right: none; border-top:none;">
                                <?php foreach ($dbNameList as $key => $value) { ?>
                                    <option value="<?php echo $value['id'];?>"><?php echo $value['database_list'];?></option>
                                <?php } ?>
                            </select>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Host Name:</label>
                                <input type="text" class="form-control" id="new_host" name="new_host">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Port:</label>
                                <input type="text" class="form-control" id="" name="new_port">
                            </div>
                            <div class="form-group W_none">
                                <label for="recipient-name" class="col-form-label">Warehouse:</label>
                                <input type="text" class="form-control" id="" name="new_warehouse">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Database:</label>
                                <input type="text" class="form-control" id="" name="database_name">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">User Name:</label>
                                <input type="text" class="form-control" id="" name="new_user">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Password:</label>
                                <input type="password" class="form-control" id="" name="new_password">
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" name="insert" value="Submit">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <?php 
if($redshift)
{
    ?>
    <h5 class="text-danger"><?php if($redshift[0]['database_id']==1){ echo "Amazon RedShift
"; }  ?></h5>
            <div class="row">
                <div class="col">
                    <h6>Connection Name</h6></div>
                <div class="col">
                    <h6>Host Name</h6></div>
                <div class="col">
                    <h6>Port</h6></div>
                <div class="col">
                    <h6>Database</h6></div>
                <div class="col">
                    <h6>Username</h6></div>
                <div class="col">
                    <h6>Action</h6></div>
            </div>
    <?php
   foreach ($redshift as $key => $value) { ?>
            <div class="row mt-1">
            <div class="col">
                <p class="text-secondary"><?php echo $value['name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['hosturl']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['port']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['database_name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['userid']; ?></p>
            </div>
            <div class="col py-0 ">
            <a href="#" id="<?php echo $value['id']; ?>"  onclick="get_record(this.id)" data-toggle='modal' data-target='#myModal'> <i class="fa fa-edit" ></i></a><a href="" id="<?php echo $value['id']; ?>"  onclick="delete_record(this.id)"> 
                 <i class="fa fa-trash" ></i>
            </a>
            <i data-target='#myModal2' onclick="Check_Conn(<?php echo $value['id'];?>)" class="fa fa-check-circle" ></i>
            </div>
             </div>
  <?php
  }  
}
?>
<!-- sql server -->
<?php 
if($postgresql)
{
    ?>
    <h5 class="text-danger"><?php if($postgresql[0]['database_id']==2){ echo "PostgreSQL"; }  ?></h5>
            <div class="row">
                <div class="col">
                    <h6>Connection Name</h6></div>
                <div class="col">
                    <h6>Host Name</h6></div>
                <div class="col">
                    <h6>Port</h6></div>
                <div class="col">
                    <h6>Database</h6></div>
                <div class="col">
                    <h6>Username</h6></div>
                <div class="col">
                    <h6>Action</h6></div>
            </div>
    <?php
   foreach ($postgresql as $key => $value) { ?>
            <div class="row mt-1">
            <div class="col">
                <p class="text-secondary"><?php echo $value['name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['hosturl']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['port']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['database_name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['userid']; ?></p>
            </div>
             
            <div class="col py-0 ">
                <a href="#" id="<?php echo $value['id']; ?>"  onclick="get_record(this.id)" data-toggle='modal' data-target='#myModal'> <i class="fa fa-edit" ></i></a>
                <a href="#" id="<?php echo $value['id']; ?>"  onclick="delete_record(this.id)"><i class="fa fa-trash" ></i> </a>
                <i data-toggle='modal' data-target='#myModal2' class="fa fa-check-circle" ></i>
            </div>

             </div>
  <?php
  }  
}
?>
<!-- Mysql -->

<!-- Netezza -->
<?php 
if($oracle)
{
    ?>
    <h5 class="text-danger"><?php if($oracle[0]['database_id']==3){ echo "Oracle "; }  ?></h5>
            <div class="row">
                <div class="col">
                    <h6>Connection Name</h6></div>
                <div class="col">
                    <h6>Host Name</h6></div>
                <div class="col">
                    <h6>Port</h6></div>
                <div class="col">
                    <h6>Database</h6></div>
                <div class="col">
                    <h6>Username</h6></div>
                <div class="col">
                    <h6>Action</h6></div>
            </div>
    <?php
   foreach ($oracle as $key => $value) { ?>
            <div class="row mt-1">
            <div class="col">
                <p class="text-secondary"><?php echo $value['name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['hosturl']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['port']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['database_name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['userid']; ?></p>
            </div>
             
            <div class="col py-0 "><a href="#" id="<?php echo $value['id']; ?>"  onclick="get_record(this.id)" data-toggle='modal' data-target='#myModal'> <i class="fa fa-edit" ></i></a><a href="" id="<?php echo $value['id']; ?>"  onclick="delete_record(this.id)"> 
                 <i class="fa fa-trash" ></i></a>
                 <i data-toggle='modal' onclick="Check_Conn(<?php echo $value['id'];?>)" class="fa fa-check-circle" ></i>
            </div>
             </div>
  <?php
  }  
}

if($sql)
{
    ?>
    <h5 class="text-danger"><?php if($sql[0]['database_id']==4){ echo "MS SQL Server "; }  ?></h5>
            <div class="row">
                <div class="col">
                    <h6>Connection Name</h6></div>
                <div class="col">
                    <h6>Host Name</h6></div>
                <div class="col">
                    <h6>Port</h6></div>
                <div class="col">
                    <h6>Database</h6></div>
                <div class="col">
                    <h6>Username</h6></div>
                <div class="col">
                    <h6>Action</h6></div>
            </div>
    <?php
   foreach ($sql as $key => $value) { ?>
            <div class="row mt-1">
            <div class="col">
                <p class="text-secondary"><?php echo $value['name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['hosturl']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['port']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['database_name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['userid']; ?></p>
            </div>
             
            <div class="col py-0 "><a href="#" id="<?php echo $value['id']; ?>"  onclick="get_record(this.id)" data-toggle='modal' data-target='#myModal'> <i class="fa fa-edit" ></i></a><a href="" id="<?php echo $value['id']; ?>"  onclick="delete_record(this.id)"> 
                 <i class="fa fa-trash" ></i></a>
                 <i data-toggle='modal' data-target='#myModal2' class="fa fa-check-circle" ></i>
            </div>
             </div>
  <?php
  }  
}

if($mysql)
{
    ?>
    <h5 class="text-danger"><?php if($mysql[0]['database_id']==5){ echo "MySQL"; }  ?></h5>
            <div class="row">
                <div class="col">
                    <h6>Connection Name</h6></div>
                <div class="col">
                    <h6>Host Name</h6></div>
                <div class="col">
                    <h6>Port</h6></div>
                <div class="col">
                    <h6>Database</h6></div>
                <div class="col">
                    <h6>Username</h6></div>
                <div class="col">
                    <h6>Action</h6></div>
            </div>
    <?php
   foreach ($mysql as $key => $value) { ?>
            <div class="row mt-1">
            <div class="col">
                <p class="text-secondary"><?php echo $value['name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['hosturl']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['port']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['database_name']; ?></p>
            </div>
            <div class="col">
                <p class="text-secondary"><?php echo $value['userid']; ?></p>
            </div>
             
            <div class="col py-0 "><a href="#" id="<?php echo $value['id']; ?>"  onclick="get_record(this.id)" data-toggle='modal' data-target='#myModal'> <i class="fa fa-edit" ></i></a><a href="" id="<?php echo $value['id']; ?>"  onclick="delete_record(this.id)"> 
                 <i class="fa fa-trash" ></i></a>
                 <i data-toggle='modal' onclick="Check_Conn(<?php echo $value['id'];?>)" class="fa fa-check-circle" ></i>
            </div>
             </div>
  <?php
  }  
}        
if($snow_flake)
{
    ?>
    <h5 class="text-danger"><?php if($snow_flake[0]['database_id']==6){ echo "Snow Flake"; }  ?></h5>
            <div class="row">
                <div class="col-md-2">
                    <h6>Connection Name</h6></div>
                <div class="col-md-3">
                    <h6>Host Name</h6></div>
                <div class="col-md-1">
                    <h6>Port</h6></div>
                <div class="col-md-2">
                    <h6>Warehouse</h6></div>
                <div class="col-md-1">
                    <h6>Database</h6></div>
                <div class="col-md-1">
                    <h6>Username</h6></div>
                <div class="col-md-2">
                    <h6>Action</h6></div>
            </div>
    <?php
   foreach ($snow_flake as $key => $value) { ?>
            <div class="row mt-1">
            <div class="col-md-2">
                <p class="text-secondary"><?php echo $value['name']; ?></p>
            </div>
            <div class="col-md-3">
                <p class="text-secondary"><?php echo $value['hosturl']; ?></p>
            </div>
            <div class="col-md-1">
                <p class="text-secondary"><?php echo $value['port']; ?></p>
            </div>
            <div class="col-md-2">
                <p class="text-secondary"><?php echo $value['warehouse']; ?></p>
            </div>
            <div class="col-md-1">
                <p class="text-secondary"><?php echo $value['database_name']; ?></p>
            </div>
            <div class="col-md-1">
                <p class="text-secondary"><?php echo $value['userid']; ?></p>
            </div>
            <div class="col-md-2 py-0 "><a href="#" id="<?php echo $value['id']; ?>"  onclick="get_record(this.id)" data-toggle='modal' data-target='#myModal'> <i class="fa fa-edit" ></i></a><a href="" id="<?php echo $value['id']; ?>"  onclick="delete_record(this.id)"> 
                 <i class="fa fa-trash" ></i></a>
                 <i data-toggle='modal' onclick="Check_Conn_Target(<?php echo $value['id'];?>)" class="fa fa-check-circle" ></i>
            </div>
             </div>
  <?php
  }  
}
?>               
</div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog custom-modeal-body" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">Edit Connection</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-2">
                    <form action="<?php echo base_url(); ?>update_connection" method="POST">
                            <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Connection Name:</label>
                            <input type="text" class="form-control"  id="name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Type:</label>
                            <select class="form-control database_list database_list_edit" name="type" onchange="Check_SF_edit()" style="border-left: none; border-right: none; border-top:none;">
                            <?php foreach ($dbNameList as $key => $value) { ?>
                                <option  value="<?php echo $value['id'];?>"><?php echo $value['database_list'];?></option>
                            <?php } ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Host Name:</label>
                            <input type="text" class="form-control"  id="hosturl_L" name="host">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Port:</label>
                            <input type="text" class="form-control"  id="port" name="port">
                        </div>
                        <?php foreach ($dbNameList as $key => $value) { $db_id = $value['id']; }
                            if($db_id > 6){?>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Warehouse:</label>
                            <input type="text" class="form-control" id="warehouse" name="warehouse">
                        </div>
                        <?php }?>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Database:</label>
                            <input type="text" class="form-control"  id="database" name="database_name">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">User Name:</label>
                            <input type="text" class="form-control"  id="user" name="user">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Password:</label>
                            <input type="password" class="form-control"  id="password" name="password">
                        </div>
                        <input type='hidden' name="config_id" id="config_id">
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" name="update" value="Submit">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog custom-modeal-body" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Test Connection</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pb-2">
                <div class="form-group">
                   <h5> Connection Success!</h5>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function get_record(id)
    {
            $.ajax(
            {
                type:"POST",
            url:"<?php echo base_url();?>get_database_record/"+id,
            datatype:"json",
            success:function(data)
            { 
                var rec=$.parseJSON(data);
                $("#name").val(rec[0].name);
                $("#hosturl_L").val(rec[0].hosturl);
                $("#port").val(rec[0].port);
                $("#database").val(rec[0].database_name);
                $("#warehouse").val(rec[0].warehouse);
                $("#user").val(rec[0].userid);
                $("#password").val(rec[0].password);
                $("#config_id").val(rec[0].id);
                var c=rec[0].database_id;
                $('select[name^="type"] option[value="'+c+'"]').attr("selected","selected");
                console.log(data);
            }
        });
    }
    function delete_record(id)
    {
            $.ajax({
                url: "<?php echo base_url();?>config_delete_rec",
                type: "post",
                data: {id:id},
                success: function(res) {
                    console.log(res);
                }
            });
            location.href='config';
            alert('Record Deleted Successfully');
    }
    function Check_Conn(id)
    {
        //console.log(id+"Test");
            $.ajax({
                url: "<?php echo base_url();?>check-conn/"+id,
                type: "post",
                data: {id:id},
                success: function(res) {
                    console.log(res);
                    if(res == 'success'){alert('Connection Established Successfully');}else {alert('Error Establishing Connection  ');}
                }
            });
           // location.href='config.php'; 
    }
    function Check_Conn_Target(id)
    {
        //console.log(id+"Test");
            $.ajax({
                url: "<?php echo base_url();?>check-conn-target/"+id,
                type: "post",
                data: {id:id},
                success: function(res) {
                    console.log(res);
                    if(res == 'success'){alert('Connection Established Successfully');}else {alert('Error Establishing Connection  ');}
                }
            });
           // location.href='config.php'; 
    }
    function Check_SF()
    {
        var y = $('.database_list').val();
        if(y >= 6){$('.W_none').show();}else{$('.W_none').hide();}
    }
    function Check_SF_edit()
    {
        var x = $('.database_list_edit').val();
        if(x >= 6){$('.W_none').show();}else{$('.W_none').hide();}
    }
    
</script>