<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Codeigniter</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta content='yes' name='apple-mobile-web-app-capable' />
	<link rel="apple-touch-icon"/>
	<meta name="format-detection"/>
	<meta name="handheldfriendly"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
	<meta http-equiv="Content-Type" content="application/json; charset=utf-8"/>
	<meta name="google-site-verification" content="NCYBhBMASrkn-T8jjnFq7HpFIumU1RZQBsjYmm3iZhI" />
	<meta name="msvalidate.01" content="34EE64F313AF492DBCE864814BBBC9B5" />
	<meta name="resource-type" content="document" />
	<meta http-equiv="content-Language" content="en"/>
	<meta name="revisit-after" content="2 days" />
	<meta name="robots" content="index, follow" />
	<meta name="language" content="en-us" />
	<meta name="rating" content="general" />
	<meta name="distribution" content="global" />
	<meta name="generator" content="eclipse"/>
	<link rel="stylesheet" href="<?php echo base_url();?>assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo base_url();?>assets/css/style.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/jquery.transfer.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>icon_font/css/icon_font.css"/>
	<link href="<?php echo base_url();?>assets/css/picklist.css" rel="stylesheet">
	<link rel="stylesheet" href="<?php echo base_url();?>assets/css/jquery.mCustomScrollbar.min.css"/>
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
	<script type="text/javascript">
		var weblink = "<?php echo base_url(); ?>";
	</script>
</head>
<body>
<?php $this->load->view($layout);?>
<script src="<?php echo base_url();?>assets/js/jquery-3.4.1.min.js"></script>	
<script src="<?php echo base_url();?>assets/js/popper.min.js"></script>
<script src="<?php echo base_url();?>assets/js/bootstrap.min.js"></script>
<script src="<?php echo base_url();?>assets/js/jquery.transfer.js"></script>
<script src="<?php echo base_url();?>assets/js/picklist.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
</script>
<?php if($pagename == "SchemaList"){ ?>
<script type="text/javascript">
$(function () {
	$('.select.selected').find('select').attr('id','schema_select');
	$.ajax({
		url: weblink + "schema-lists/",
		type:"GET",
		datatype:"json",
		success:function(result){
			result = JSON.parse(result);
			//localStorage.setItem("selected_schemas",result);
			//console.log(localStorage.getItem("selected_schemas"));
			console.log(result);
			if(result.status == 'success'){
				var data = {
	                available: result.data,
	                selected: []
	            };
	            // var selVal = '';
	            // result.schema_selected.forEach(function(currentValue, index, arr){
	            //     	if(!selVal) {
	            //     	selVal = currentValue.id; 
	            //     	} else {
	            //     	selVal = selVal + ',' + currentValue.id;
	            //     	}
	            //     });
	            // document.getElementById("schema_list").value = selVal;
	            var a = $('#list').pickList({
	                data: data,
	            });
	            $('#button').on('click', function () {
	                console.log(a.pickList('getSelected'));
	            });
	            a.on('picklist.remove', function (event, v) {
	                console.log(v);

	                // var selVal = "";
	                // v.forEach(function(currentValue, index, arr){
	                // 	if(!selVal) {
	                // 	selVal = currentValue.id; 
	                // 	} else {
	                // 	selVal = selVal + ',' + currentValue.id;
	                // 	}
	                // });
	                //   document.getElementById("schema_list").value = selVal;
	                // console.log(selVal);
	            });
	            a.on('picklist.add', function (event, v) {
	                console.log(v);
	                // var selVal = "";
	                // v.forEach(function(currentValue, index, arr){
	                // 	console.log(currentValue);
	                // 	if(!selVal) {
	                // 	selVal = currentValue.id; 
	                // 	} else {
	                // 	selVal = selVal + ',' + currentValue.id;
	                // 	}
	                // });
	                //   document.getElementById("schema_list").value = selVal;
	                // console.log(selVal);
	            });
			}		 	
		}
	});
});
</script>
<?php } else if($pagename == 'TableList'){ ?>
	<script type="text/javascript">
		console.log('table');
$(function () {
	$('.select.selected').find('select').attr('id','schema_select');
	$.ajax({
		url:weblink + "table-with-schema/",
		type:"GET",
		datatype:"json",
		success:function(result){
			result = JSON.parse(result);
			//localStorage.setItem("selected_schemas",result);
			//console.log(localStorage.getItem("selected_schemas"));
			console.log(result);
			if(result.status == 'success'){
				var data = {
	                available: result.data,
	                selected: []
	            };
	            // var selVal = '';
	            // result.schema_selected.forEach(function(currentValue, index, arr){
	            //     	if(!selVal) {
	            //     	selVal = currentValue.id; 
	            //     	} else {
	            //     	selVal = selVal + ',' + currentValue.id;
	            //     	}
	            //     });
	            // document.getElementById("schema_list").value = selVal;
	            var a = $('#list').pickList({
	                data: data,
	            });
	            $('#button').on('click', function () {
	                console.log(a.pickList('getSelected'));
	            });
	            a.on('picklist.remove', function (event, v) {
	                console.log(v);

	                // var selVal = "";
	                // v.forEach(function(currentValue, index, arr){
	                // 	if(!selVal) {
	                // 	selVal = currentValue.id; 
	                // 	} else {
	                // 	selVal = selVal + ',' + currentValue.id;
	                // 	}
	                // });
	                //   document.getElementById("schema_list").value = selVal;
	                // console.log(selVal);
	            });
	            a.on('picklist.add', function (event, v) {
	                console.log(v);
	                // var selVal = "";
	                // v.forEach(function(currentValue, index, arr){
	                // 	console.log(currentValue);
	                // 	if(!selVal) {
	                // 	selVal = currentValue.id; 
	                // 	} else {
	                // 	selVal = selVal + ',' + currentValue.id;
	                // 	}
	                // });
	                //   document.getElementById("schema_list").value = selVal;
	                // console.log(selVal);
	            });
			}		 	
		}
	});
});
</script>
<?php } if($pagename == "TargetSchemaList"){ ?>
<script type="text/javascript">
$(function () {
	$('.select.selected').find('select').attr('id','schema_select');
	$.ajax({
		url: weblink + "target-schema-lists/",
		type:"GET",
		datatype:"json",
		success:function(result){
			result = JSON.parse(result);
			//localStorage.setItem("selected_schemas",result);
			//console.log(localStorage.getItem("selected_schemas"));
			console.log(result);
			if(result.status == 'success'){
				var data = {
	                available: result.data,
	                selected: []
	            };
	            // var selVal = '';
	            // result.schema_selected.forEach(function(currentValue, index, arr){
	            //     	if(!selVal) {
	            //     	selVal = currentValue.id; 
	            //     	} else {
	            //     	selVal = selVal + ',' + currentValue.id;
	            //     	}
	            //     });
	            // document.getElementById("schema_list").value = selVal;
	            var a = $('#list').pickList({
	                data: data,
	            });
	            $('#button').on('click', function () {
	                console.log(a.pickList('getSelected'));
	            });
	            a.on('picklist.remove', function (event, v) {
	                console.log(v);

	                // var selVal = "";
	                // v.forEach(function(currentValue, index, arr){
	                // 	if(!selVal) {
	                // 	selVal = currentValue.id; 
	                // 	} else {
	                // 	selVal = selVal + ',' + currentValue.id;
	                // 	}
	                // });
	                //   document.getElementById("schema_list").value = selVal;
	                // console.log(selVal);
	            });
	            a.on('picklist.add', function (event, v) {
	                console.log(v);
	                // var selVal = "";
	                // v.forEach(function(currentValue, index, arr){
	                // 	console.log(currentValue);
	                // 	if(!selVal) {
	                // 	selVal = currentValue.id; 
	                // 	} else {
	                // 	selVal = selVal + ',' + currentValue.id;
	                // 	}
	                // });
	                //   document.getElementById("schema_list").value = selVal;
	                // console.log(selVal);
	            });
			}		 	
		}
	});
});
</script>
<?php } ?>
<?php //print_r( $this->session->userdata());?>
</body>
</html>