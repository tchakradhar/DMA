<style>
.buttons {
    width: 20%;
    margin: 10px auto;
}
</style>
<div class="schema_style">
    <div id="list"></div>
    <div class="buttons">
        <input type="hidden" name="schema_list" value="" id="schema_list">
        <button class="btn btn-sm btn-block btn-danger px-5 py-2 text-light" onclick="SchemaListSelected()"> Next
        </button>  
    </div>
</div>
<script type="text/javascript">
function SchemaListSelected(){
    var selbox =  document.getElementsByClassName("dropdown_select_list");
    var schemaList = "";
    console.log(selbox[1].options);
    var schma_box_list= [];
    for (var i=0, iLen=selbox[0].options.length; i<iLen; i++) {
        schma_box_list.push({'id':selbox[0].options[i].value, 'label': selbox[0].options[i].label});
    }
    var schma_box_list_selected = [];
    for (var i=0, iLen=selbox[1].options.length; i<iLen; i++) {
        schma_box_list_selected.push({'id':selbox[1].options[i].value, 'label': selbox[1].options[i].label});
    }
    console.log(schma_box_list);
    console.log(schma_box_list_selected);
    $.ajax({
        //alert('Hi');
        url: weblink + "add-tables-session/",
        type:"POST",
        datatype:"json",
        data: {'tables': schma_box_list, 'selected_tables': schma_box_list_selected },
        success:function(result){
            //result = JSON.parse(result);
            window.location.href = weblink + 'target'; 
            // if(result.status == 'success'){    
            //     window.location.href = weblink + 'table';          
            // }
        }
    });
    if(schma_box_list_selected == ''){
        window.alert('select tables');
    } else {
        // $.ajax({
        //     url: weblink + "table-with-schema/",
        //     type:"POST",
        //     datatype:"json",
        //     data: {'selected': schma_box_list_selected},
        //     success:function(result){
        //         result = JSON.parse(result);
        //         if(result.status == 'success'){
        //             window.location.href = weblink + 'target'  ;          
        //         }
        //     }
        // });
    }
}
</script>