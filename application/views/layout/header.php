<div id="content">
<?php
date_default_timezone_set('Asia/Kolkata');
?>
<nav class="navbar navbar-expand-lg navbar-light bg-light col-12 navbar_style">
<div class="container-fluid">
    <button type="button" id="sidebarCollapse" class="btn btn-info"><i class="fas fa-bars"></i></button>
        <!-- <a href="<?php echo base_url();?>" class="navbar-brand">
            <img src="<?php echo  base_url();?>assets/images/Migration_logo.png" style="width:140px;margin:auto;display:block;">
        </a> -->
        <h3>DMA</h3>
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link" href="<?php echo base_url();?>config" class="nav-item nav-link text-light">Configuration</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Job List</a>
                <div class="dropdown-menu">
                    <?php foreach ($job_details as $row) {?>
                    <a class="dropdown-item" href="<?php echo base_url();?>migration-process/<?php echo $row['joblistid'];?>"> <?php echo $row['j_name'];?></a>
                    <?php } ?>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" data-toggle='modal' data-target='#GSCCModal' >Create Job</a>
                </div>
            </li>
        </ul>
        <div class="navbar-nav2 ">
            <p class="name mb-0">Hello User</p>
            <p class="mb-0"><?php echo date('m-d-Y h:i:s A');?></p>
        </div> 
</div>
</nav>
<div id="GSCCModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog custom-modeal-body" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">Create Job</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body pb-2">
            <form action="<?php echo base_url();?>new_crete_job" method="POST">
            <div class="form-group">
                    <label for="recipient-name" class="col-form-label"> Name:</label>
                    <input type="text" class="form-control"  id="job_name" name="job_name">
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" name="submit" value="Create">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
                
            </form>
        </div>
    </div>
</div>
</div>