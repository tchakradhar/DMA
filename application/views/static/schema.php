<style>
.buttons {
    width: 20%;
    margin: 10px auto;
}
</style>
<div class="schema_style" style="">
    <div class="text-danger text-uppercase font-weight-bold d-block text-center mb-3">Schemas</div>
    <div id="list"></div>
    <div class="buttons">
        <input type="hidden" name="schema_list" value="" id="schema_list">
        <button class="btn btn-sm btn-block btn-danger px-5 py-2 text-light" onclick="SchemaListSelected()">Next</button>  
    </div>
</div>
<script type="text/javascript">
function SchemaListSelected(){
    var selbox =  document.getElementsByClassName("dropdown_select_list");
    var schma_box_list= [];
    for (var i=0, iLen=selbox[0].options.length; i<iLen; i++) {
        schma_box_list.push({'id':selbox[0].options[i].value, 'label': selbox[0].options[i].value});
    }
    var schma_box_list_selected = [];
    for (var i=0, iLen=selbox[1].options.length; i<iLen; i++) {
        schma_box_list_selected.push({'id':selbox[1].options[i].value, 'label': selbox[1].options[i].value});
    }
    console.log(schma_box_list);
    console.log(schma_box_list_selected);
    if(schma_box_list_selected == ''){
    window.alert('select Schemas');
    }else{
        $.ajax({
            url: weblink + "add-schemas-session/",
            type:"POST",
            datatype:"json",
            data: {'schemas': schma_box_list, 'selected_schemas': schma_box_list_selected },
            success:function(result){
                result = JSON.parse(result);
                if(result.status == 'success'){    
                    window.location.href = weblink + 'table';          
                }
            }
        });
        $.ajax({
            url: weblink + "schemas-update/",
            type:"POST",
            datatype:"json",
            data: {'selected': schma_box_list_selected },
            success:function(result){
                result = JSON.parse(result);
                if(result.status == 'success'){    
                    window.location.href = weblink + 'table';          
                }
            }
        });
    }
}
</script>