<div class="col-md-10 mt-4 px-5 ">
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-5">
        <div class="source">
            <div class="source-title bg-danger">
                <h4 class="text-light text-center">Target</h4>
            </div>
            <div>
            <table class="table mb-1" id="schema_list">
                <tbody>
                    <?php foreach ($rec as $row) { ?>
                    <tr class="<?php if($row['status'] == 1){ echo 'selected'; }?>">
                        <td onclick="get_connection(<?= $row['id'] ?>);"><?= $row['snow_flake'] ?></td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
            </div>
            <div class="source-footer bg-danger">
                <div class="row source-footer bg-00b0cc align-items-center justify-content-end pr-5 pb-0 pt-0 mb-1">
            <a  class="text-decoration-none btn bg-087486 text-light" href="<?php echo base_url();?>migration-process/<?php echo $this->session->userdata('job_id'); ?>">Next </a>
        </div>
            </div>
        </div>
    </div>
</div>
<div id="getConModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg custom-modeal-body" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Choose Connection</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pb-2">
                <form action="new_crete_job" method="POST">
                <div class="parent" id="parent"></div>
                </form>
            </div>
        </div>
    </div>
</div> 
<script type="text/javascript">
function source_selected(id){
    window.location.href = weblink + 'target/' + id;
}
function get_connection(id)
{
  $("#getConModal").modal('show');
  var data='   <div class="row">';
  data+='<div class="col col-md-2"><h6>Connection Name</h6></div><div class="col col-md-4"><h6>Host Name</h6></div><div class="col col-md-2"><h6>Port</h6></div><div class="col col-md-2"><h6>Username</h6></div><div class="col col-md-2"><h6>Action</h6></div></div>';
         $.ajax({
            url: weblink + "get_connection_data/"+id,
            type:"GET",
            datatype:"json",
            success:function(result){
                var d= JSON.parse(result);
                for(var i=0;i<d.length;i++)
                {
                    data+='<div class="row mt-1">';
                    data+='<div class="col-md-2 col">'+d[i].name+'</div>';
                    data+='<div class="col-md-4">'+d[i].hosturl+'</div>';
                    data+='<div class="col-md-2 col">'+d[i].port+'</div>';
                    data+='<div class="col-md-2 col">'+d[i].userid+'</div>';
                    data+='<div class="col-md-2 col"><a onclick="return Check_Conn('+d[i].id+','+id+')" class="btn btn-success">Connect</a></div>';
                    data+='</div>';
                }
                $("#parent").html(data);
                console.log(result);
            }
        });
 return false;
}
function Check_Conn(id,did)
{
    $.ajax({
        url: "<?php echo base_url();?>check-conn-target/"+id,
        type: "post",
        data: {id:id},
        success: function(res) {
            if(res == 'success'){
                alert('Connection Established Successfully');
                window.location.href = weblink + 'target/' + did;
            }else{
                alert('Error Establishing Connection');
                return false;
            }
        }
    });
}
</script> 