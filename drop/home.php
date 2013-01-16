<?php require_once('auth.php');
require_once('util.php');
/*
	Copyright © Ross Norvell 2012
	All rights reserved.
	rnorvell.com
*/



	/* for later use */
	$qry="SELECT member_id,firstname,lastname FROM `members` ";
	$res = SQLQuery($qry);
	$specialists = array();
	while($row=mysql_fetch_assoc($res)){
		$specialists[$row['member_id']]=$row['firstname']." ".$row['lastname'];
	}


	$semesters = array();
	$semOpts= array("Fall","Spring","Summer","Summer II","Maymester","Wintermester");
	$year = date('Y');
	for($y = $year-1;$y<=$year+1;$y++){
		foreach($semOpts as $s){
			$sem = $s." ".$y;
			$semesters[$sem]=$sem;
		}
	}
	/* make sure we have the rows to display */
	$qry = "SELECT count(*) as total from dp_student";
	$res = SQLQuery($qry);
	$row = mysql_fetch_assoc($res);
	$_SESSION['STATS_PANEL'] = $_SESSION['STATS_PANEL'] && $row['total']>0;
	
 ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="imagetoolbar" content="no" />
	<title>Home | drop</title>
	
	<link id="jquery_ui_theme_loader" rel="stylesheet" href="jquery-ui-custom/css/custom-theme/jquery-ui-1.8.20.custom.css">
	<script src="jquery-ui-custom/js/jquery-1.7.2.min.js"></script>
	<script src="jquery-ui-custom/js/jquery-ui-1.8.20.custom.min.js"></script>
	
	<!-- Style Includes -->
	<link type="text/css" href="jquery-ui-custom/window/css/jquery.window.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="jquery-ui-custom/noty/css/jquery.noty.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-ui-custom/noty/css/noty_theme_twitter.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-ui-custom/chart/jquery.jqplot.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-ui-custom/qtip/jquery.qtip.css"/>
		
	<!-- jQuery Library -->
	<script type="text/javascript" src="jquery-ui-custom/window/js/jquery.window.js"></script>
	<script type="text/javascript" src="jquery-ui-custom/window/js/common.js"></script>
	<script type="text/javascript" src="jquery-ui-custom/noty/js/jquery.noty.js"></script>
	<script type="text/javascript" src="jquery-ui-custom/chart/jquery.jqplot.js"></script>
	<!--[if lt IE 9]><script type="text/javascript" src="jquery-ui-custom/chart/excanvas.js"></script><![endif]-->
	<script type="text/javascript" src="jquery-ui-custom/chart/plugins/jqplot.pieRenderer.min.js"></script>
	<!-- qtip library -->
	<script type="text/javascript" src="jquery-ui-custom/qtip/jquery.qtip.js"></script>
	<!-- editor -->
	<script type="text/javascript" src="javascript-ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="javascript-ckeditor/adapters/jquery.js"></script>
		
	
	<link rel="stylesheet" href="style.css" />
	<style type="text/css">
		input[type=text],input[type=password] {
			font-size: 13px !important;
			height: 16px !important;
		}
		textarea{
			font-size : 13px !important;
		}
		.top{
			cursor:pointer;
		}
	</style>
	
	<script type="text/javascript">
		$current_student = "";
		function l(s){/* console.log(s); */}
		function notify(html,good){
			good = (typeof good === 'undefined') ? true : good;
			type = (good) ? 'success' : 'error';
			noty({layout : 'topCenter', theme : 'noty_theme_twitter', type : type, text:html,  timeout : 5000 });
		}
		function reset(div_id){
			$("#"+div_id).find("input[type=text]").val("");
			$("#"+div_id).find("input[type=checkbox]:checked").trigger('click');			
		}
		function objectFill(id,names){
			var u = new Object();
			for(i=0;i<names.length;i++){
				u[names[i]] = $(id+" input[name="+names[i]+"]").val();
				if(u[names[i]]===undefined){
					u[names[i]] = $(id+" select[name="+names[i]+"]").val();
					if(u[names[i]]===undefined){
						u[names[i]] = $(id+" textarea[name="+names[i]+"]").val();
					}
				}
			}
		  return u;
		}
		
	<?php if($_SESSION['CAN_VIEW']){?>
		function doSearch(key){
			$.ajax({
				  url: 'search.php?term='+key,
				  type:'GET',
				  success: function(data) {
					var studs = $.parseJSON(data);
					var html = "<h2 style='margin-bottom:1px;'>Results for <em>"+key+"</em></h2>(<a style='cursor:pointer;' onclick='$(\"#active_results\").fadeOut(600);' >Hide Results</a>)<br/><br/>";
					for(i=0;i<studs.length;i++){
						html+="<a style='color:#0073EA;' href='student.php?student="+studs[i].id+"'>"+studs[i].label+"</a><br/>";
					}
					$("#active_results").html(html);
					$("#active_results").fadeIn(600);
					
				  }
				});
		}
	<?php } ?>
		$accom_classes = new Array();
		function createClasses(crn, course, roomloc, prof, section){
			var genclass = crn+"_class";
			var gen = "<div class='"+genclass+"' style='font-wieght:bold;color:#0073EA;'>"+course+"</div>  ";
			$accom_classes.push(
				{crn: crn,
				course: course, 
				section: section,
				room_loc : roomloc,
				prof : prof}
			);//cleared after submission
			
			$("#classes").append(gen);
			var gentext = "Course: "+course + "<br/>" 
						  +"CRN :"+crn+"<br/>"
						  +"Room :"+roomloc+"<br/>"
						  +"Prof :"+prof+"<br/>"
						  +"Section :"+section;
						  
			$('.'+genclass).qtip({
				content: {
					text: gentext
				},
				position: {
					target: 'mouse'
				}
			});
		}
		$(document).ready(function() {
			$.jqplot.config.enablePlugins = true;
			
			$("#active_results").hide();
			$(".date").datepicker({
				changeMonth: true,
				changeYear: true,
				yearRange: '1915:2040'        				
			});
			function iconToggle(id,img1,img2,otherID){
				$(id).click(function(){					
					$(otherID).toggle(600);
					if($(id+" img").attr('src')==img1){
						$(id+" img").attr('src',img2);
					   var destination = $(otherID).offset().top;
					   $("html:not(:animated),body:not(:animated)").animate({ scrollTop: destination-20}, 990 );
					   return false;
					}else{
						$(id+" img").attr('src',img1);
					}
				});
			}
			$(".top").bind('click',function(e){
				var destination = $("#content").offset().top;
				$("html:not(:animated),body:not(:animated)").animate({ scrollTop: destination-20}, 990 );
				return false;
			});
		<?php if($_SESSION['CAN_VIEW']){?>
			$("#search_field").autocomplete({
				source: "search.php",
				minLength: 2,
				select: function( event, ui ) {	
					window.open('student.php?student='+ui.item.id);
					/*
					console.log( ui.item ?
						"Selected: " + ui.item.value + " aka " + ui.item.id :
						"Nothing selected, input was " + this.value );
					*/
				}
			});
			$('#search_field').bind('keypress',function(e){
				var code = e.keyCode || e.which;
				if(code == 13) { 
				   doSearch($('#search_field').val());
				}
			});
			$("#searchbutton").bind('click',function(e){
				doSearch($('#search_field').val());
			});
		<?php } ?>
			
		<?php if($_SESSION['CREATES_ACCOMS']){?>
			$("#accom_tabs").tabs();
			$("#accom_tabs ul").removeClass('ui-helper-clearfix ui-widget-header');
			$(".accom_student_search").autocomplete({
				source: "search.php",
				minLength: 2,
				select: function( event, ui ) {
					$("#student_id_hidden").attr('value',ui.item.id);
				}
			});
			
			$("#accommodations").hide();
			iconToggle("#accommodation",'images/heart.png','images/heart_blue.png',"#accommodations");
			$(".addclass").bind('click', function(e){
				var html = "<table>"+
						"<tr><td><b>CRN: </b> <input  type=text id='crn' /></td></tr>"+
						"<tr><td><b>Course: </b> <input type=text id='course' /></td></tr>"+
						"<tr><td><b>Section: </b> <input size=2 type=text id='section' /></td></tr>"+
						"<tr><td><b>Room Location: </b> <input type=text id='room_loc' /></td></tr>"+
						"<tr><td><b>Professor: </b> <input type=text id='prof' /></td></tr>"+
						"<tr><td><button id='classadderbutton' >Add Class </button></td></tr></table>";
				$win = $.window({
				   showModal: true,
				   modalOpacity: 0.5,
				   width:400,
				   height:300,
				   y:20,
				   title: "Add a Class",
				   content: html
				});
				$("#classadderbutton").click(function(e){
					createClasses(
						$("#crn").val(), 
						$("#course").val(), 
						$("#room_loc").val(), 
						$("#prof").val(), 
						$("#section").val()						
					);
					$win.close();
				});
			});
			
			$(".classOptions_extra").hide();
			$(".classOptions").bind('click', function(e){
				var SortaId = $(this).val();
				var consId = "extraclass_"+SortaId;
				$("#"+consId).toggle();
			});
			$(".examOptions_extra").hide();
			$(".examOptions").bind('click', function(e){
				var SortaId = $(this).val();
				var consId = "extraexam_"+SortaId;
				$("#"+consId).toggle();
			});
			
			$(".updateAccom").bind('click',function(e){
				var id = "#accom_tabs";
				
				$a = new Object();
					var names = ["student_id","accom_date","semester","member_id","otherClassAccoms","classAccomNotes","otherExamAccoms","examAccomNotes","extendedTimeEssay","extendedTimeMath","altExamForm"];
					for(i=0;i<names.length;i++){
						$a[names[i]] = $(id+" input[name="+names[i]+"]").val();
						if($a[names[i]]===undefined){
							$a[names[i]] = $(id+" select[name="+names[i]+"]").val();
							if($a[names[i]]===undefined){
								$a[names[i]] = $(id+" textarea[name="+names[i]+"]").val();
							}
						}
					}
					
					$classOptionsChecked = new Array();
					$(id+" .classOptions:checked").each(function(){
						$classOptionsChecked.push($(this).val());
					});					
					$classOptions_extra = new Array();
					for(i=0;i<$classOptionsChecked.length;i++){
						var d = $classOptionsChecked[i];
						$classOptions_extra[d]=($("#extraclass_"+d).val());
					}
					
					$examOptionsChecked = new Array();
					$(id+" .examOptions:checked").each(function(){
						$examOptionsChecked.push($(this).val());
					});
					
					$examOptions_extra = new Array();
					for(i=0;i<$examOptionsChecked.length;i++){
						var d = $examOptionsChecked[i];
						$examOptions_extra[d]=($("#extraexam_"+d).val());
					}
					$a.classAccoms = $classOptionsChecked;
					$a.classAccoms_extra = $classOptions_extra;
					$a.examAccoms = $examOptionsChecked;
					$a.examAccoms_extra = $examOptions_extra;
					//load up the possible mutliple classes
					$a.crn = new Array();
					$a.section = new Array();
					$a.room_loc = new Array();
					$a.prof = new Array();
					$a.course = new Array();
					for (i=0;i<$accom_classes.length;i++){
						var t = $accom_classes[i];
						$a.crn.push(t.crn);
						$a.section.push(t.section);
						$a.room_loc.push(t.room_loc);
						$a.prof.push(t.prof);
						$a.course.push(t.course);
					}
					var temp = id.split("_");
					$a.accommodation_id = temp[1];
				l($a);
				$.ajax({
				  url: 'accommodation/index.php?new=1',
				  type: 'POST',
				  data:$a,
				  success: function(data) {
					notify("Accommodation Made Successfully!");
					var id = "accom_tabs";
					//clear out data
					reset(id);
					$("#"+id+" .classOptions").attr('checked', false);
					$("#"+id+" .examOptions").attr('checked', false);
					$a = new Array();
					$("#classes").html("");
					
					//'close' accommodations					
					$("#accommodation").trigger('click');					
				  }
				});
				
			});
		<?php } ?>	
			
			
		<?php if($_SESSION['CREATES_INTAKE']){?>
			$(".intake_student_search").autocomplete({
				source: "search.php",
				minLength: 2,
				select: function( event, ui ) {
					$("#intake_student_id_hidden").attr('value',ui.item.id);
				}
			});
			$("#intakes").hide();
			iconToggle("#intake",'images/article.png','images/article_blue.png',"#intakes");
			
			$(".createIntake").bind('click',function(e){
				var id = "#intake_form";
				
				$a = new Object();
					var names = [
								"tertiaryDis"
								,"primaryDesc"
								,"secondaryDesc",
								,"tertiaryDesc",
								,"secondaryDis"
								,"recommendation"
								,"primaryDis"
								,"otherDis"
								,"medications"
								,"intake_notes"
								,"followup_notes"
								,"followup_date"
								,"docStatus"
								,"docNeeded"
								,"docExp"
								,"docDate"
							];
					
					for(i=0;i<names.length;i++){
						$a[names[i]] = $(id+" input[name="+names[i]+"]").val();
						if($a[names[i]]===undefined){
							$a[names[i]] = $(id+" select[name="+names[i]+"]").val();
							if($a[names[i]]===undefined){
								$a[names[i]] = $(id+" textarea[name="+names[i]+"]").val();
							}
						}
					}
					$limitationsChecked = new Array();
					$(id+" .limitationOptions:checked").each(function(){
						$limitationsChecked.push($(this).val());
					});
					$serviceChecked = new Array();
					$(id+" .serviceOptions:checked").each(function(){
						$serviceChecked.push($(this).val());
					});
				
				$a.student_id = $("#intake_student_id_hidden").val();
				$a.services = $serviceChecked;
				$a.limitations = $limitationsChecked;
				
				$.ajax({
				  url: 'intake/index.php?new=1',
				  type: 'POST',
				  data:$a,
				  success: function(data) {
					//clear out data
					for(i=0;i<names.length;i++){
						$(id+" input[name="+names[i]+"]").val("");
						if($a[names[i]]===undefined){
							$(id+" select[name="+names[i]+"]").val("");
							if($a[names[i]]===undefined){
								$(id+" textarea[name="+names[i]+"]").val("");
							}
						}
					}
					$(id+" .limitationOptions").attr('checked', false);
					$(id+" .serviceOptions").attr('checked', false);
					$("#intake").trigger('click');
					notify("Intake Created Successfully!");
				  }
				});
				
			});
		<?php } ?>	
			
			
		<?php if($_SESSION['CREATES_CONTACT']){?>
			$("#contacts").hide();
			iconToggle("#history",'images/book.png','images/book_blue.png',"#contacts");
			
			$(".contact_student_search").autocomplete({
				source: "search.php",
				minLength: 2,
				select: function( event, ui ) {
					$("#contact_student_id_hidden").attr('value',ui.item.id);
				}
			});
			$("#submit_contact").bind('click',function(e){
				var id = "#contacts";
				$s = new Object();
				var names = ["other", "con_date", "length", "notes","purpose_id","contact_type_id"];
				for(i=0;i<names.length;i++){
					$s[names[i]] = $(id+" input[name="+names[i]+"]").val();
					if($s[names[i]]===undefined){
						$s[names[i]] = $(id+" select[name="+names[i]+"]").val();
						if($s[names[i]]===undefined){
							$s[names[i]] = $(id+" textarea[name="+names[i]+"]").val();
						}
					}
				}
				$s.student_id = $("#contact_student_id_hidden").val();
				
				$.ajax({
				  url: 'contact/index.php?new=1',
				  type: 'POST',
				  data:$s,
				  success: function(data) {
					//clear out data
					for(i=0;i<names.length;i++){
						$(id+" input[name="+names[i]+"]").val("");
						if($s[names[i]]===undefined){
							$(id+" select[name="+names[i]+"]").val("");
							if($s[names[i]]===undefined){
								$(id+" textarea[name="+names[i]+"]").val("");
							}
						}
					}				  
					$("#history").trigger('click');
					notify("Contact Created Successfully!");
				  }
				});
				
			});
		<?php } ?>
			
			
		<?php if($_SESSION['CREATES_STUDENT']){?>
			$("#information").hide();
			iconToggle("#student",'images/user.png','images/user_blue.png',"#information");
		
			$(".updateStudent").bind('click',function(e){
				var id = "#information";
				$s = new Object();
				var names = ["veteran", "univId","endOfService","studentType",  "studentStatus", "race", "phoneNum", "permZip", "permState", "permStAddress2", "permStAddress", "permCountry", "permCity", "ok2sendConfMessage", "ok2leaveConfMessage", "notes", "minor", "middlename", "major", "locZip", "locState", "locStAddress2", "locStAddress", "locCountry", "locCity", "lastname", "gender", "firstname", "ferpaOnFile", "emergencyRelation", "emergencyPhoneNum", "emergencyLast", "emergencyFirst", "email", "dateOfBirth", "creditLoad", "college", "citizen", "GPA", "EnrollmentStatus"];
				for(i=0;i<names.length;i++){
					$s[names[i]] = $(id+" input[name="+names[i]+"]").val();
					if($s[names[i]]===undefined){
						$s[names[i]] = $(id+" select[name="+names[i]+"]").val();
						if($s[names[i]]===undefined){
							$s[names[i]] = $(id+" textarea[name="+names[i]+"]").val();
						}
					}
				}
				
				//get the checked inputs
				$("#information input:checked").each(function(t){
						$s[$(this).attr('name')]="1";//defaults to "on" idk why, but this will make sure we know
					});
				
				
				$.ajax({
				  url: 'student/index.php?new=1',
				  type: 'POST',
				  data:$s,
				  success: function(data) {
					//clear out data
					for(i=0;i<names.length;i++){
						$(id+" input[name="+names[i]+"]").val("");
						if($s[names[i]]===undefined){
							$(id+" select[name="+names[i]+"]").val("");
							if($s[names[i]]===undefined){
								$(id+" textarea[name="+names[i]+"]").val("");
							}
						}
					}
					
					$("#student").trigger('click');
					notify("Student Created Successfully!");
				  }
				});
					
			});
		<?php } ?>	
			
		
		<?php if($_SESSION['ADMIN_PANEL']){ ?>
								
			<?php if($_SESSION['EDIT_GROUP']){ ?>
				$("#editGroup_menu").hide();
				iconToggle("#editGroup",'images/editGroup.png','images/editGroup_blue.png',"#editGroup_menu");
				$("[id^='group_']").hide();
				$('.updateGroupSubmit').bind('click',function(){
					var id = "#"+$(this).parent().parent().parent().parent().parent().attr('id');
					perms = [];
					$(id + " input:checked").each(function(){
						perms.push($(this).val());
					});
					var group = id.split("_");
					group  = group[1];
					$.ajax({
					  url: 'group/index.php?update=1',
					  type: 'POST',
					  data:{group:group,perms:perms},
					  success: function(data) {
						notify("Successfully updated group! <br/>*Changes will take effect next login.");
						$("#editGroup").trigger('click');
					  }
					});
				});
			<? } ?>
			<?php if($_SESSION['ADD_GROUP']){ ?>
				$("#addGroup_menu").hide();
				iconToggle("#addGroup",'images/addGroup.png','images/addGroup_blue.png',"#addGroup_menu");
				$(".addGroupSubmit").bind('click',function(){
					var name = $("#addGroup_menu input[type=text]").val();
					var perms = [];
					$("#addGroup_menu input:checked").each(function(){
						perms.push($(this).val());
					});
					$.ajax({
					  url: 'group/index.php?new=1',
					  type: 'POST',
					  data:{name:name,perms:perms},
					  success: function(data) {
						$("#addGroup_menu input").attr('checked', false);
						$("#addGroup_menu input").val("");
						notify("Successfully made the \""+name+"\" group! <br/>*If this does not show up at first, reload the page.");
						$("#addGroup").trigger('click');
					  }
					});
				});
			<? } ?>
			<?php if($_SESSION['EDIT_USER']){ ?>
				var id = "#editUser_menu";
				$(id).hide();
				iconToggle("#editUser",'images/editUser.png','images/editUser_blue.png',id);
				$(".userUpdate").bind('click',function(){
					$u = new Object();
					var tr = $(this).parent().parent();
					tr.find("td :input").each(function(){
						$u[$(this).attr('class')]=$(this).val();
						});
					$.ajax({
					  url: 'user/index.php?update=1',
					  type: 'POST',
					  data:$u,
					  success: function(data) {
						notify("Successfully updated "+$u.firstname+" "+$u.lastname);
						$("#editUser").trigger('click');
					  }
					});
				});
				$(".userDelete").bind('click',function(){
					$u = new Object();
					var tr = $(this).parent().parent();
					tr.find("td :input").each(function(){
						$u[$(this).attr('class')]=$(this).val();
						});
					$.ajax({
					  url: 'user/index.php?delete=1',
					  type: 'POST',
					  data:$u,
					  success: function(data) {
						notify("Successfully Deleted "+$u.firstname+" "+$u.lastname);
						$("#editUser").trigger('click');
					  }
					});
				});
			<? } ?>
			<?php if($_SESSION['ADD_USER']){ ?>
				var id = "#addUser_menu";
				$(id).hide();
				iconToggle("#addUser",'images/addUser.png','images/addUser_blue.png',id);
				$(".register").bind('click',function(e){
					$u = new Object();
					var names = ["lastname","firstname","cpassword","passwd","login","group_id"];
					$u = objectFill(id,names);
					if($u.cpassword == $u.passwd){
						$.ajax({
						  url: 'user/index.php?new=1',
						  type: 'POST',
						  data:$u,
						  success: function(data) {
							$("#addUser_menu input").val("");
							notify("Successfully Added "+$u.firstname+" "+$u.lastname);
							$("#addUser").trigger('click');
						  }
						});
					}else{
						notify("Passwords do not match.",false);
					}
				});
			<? } ?>
			<?php if($_SESSION['CLEAN_DROP']){ ?>
				$("#cleandrop_menu").hide();
				iconToggle("#cleandrop",'images/box.png','images/box_blue.png',"#cleandrop_menu");
				$(".startCleaning").bind('click',function(){
					$.ajax({
					  url: 'tools/index.php?clean=1',
					  type: 'POST',
					  success: function(data) {
						$("#cleaningLog").html(data);
					  }
					});
				});
			<? } ?>
			<?php if($_SESSION['EDIT_CONFIGS']){ ?>
				$('.jquery_ckeditor').ckeditor( function() { /* callback code */ }, { skin : 'office2003' } );
				$(".update_configs").bind('click',function(){
					$.ajax({
					  url: 'MergeAccommodation/update.php?update_merge=1',
					  type: 'POST',
					  data:{text:$('.jquery_ckeditor').ckeditorGet().getData(),
							email: $('.dept_email').val(),
							location: $('.dept_loc').val(),
							name: $('.dept_name').val(),
							phone:$(".dept_phone").val()
							},
					  success: function(data) {
						notify("Successfully Updated Configurations!");
						
					  }
					});
				});
				$("#editconfigs_menu").hide();
				iconToggle("#editconfigs",'images/list.png','images/list_blue.png',"#editconfigs_menu");
			<?php } ?>
			<?php if($_SESSION['ALTER_FORMS']){ ?>
				$("#alterForms_menu").hide();
				iconToggle("#alterForms",'images/brush.png','images/brush_blue.png',"#alterForms_menu");
				$(".contact_type_update").click(function(e){
					var opt = $("#contact_type_opts").val();
					var name = $("#contact_type_name").val();
					$.ajax({
					  url: 'contact/update.php?update_type=1',
					  type: 'POST',
					  data:{description:name,contact_type_id:opt},
					  success: function(data) {
						notify("Successfully Updated to "+name);
						$("#contact_type_opts option[value='"+opt+"']").text(name)
					  }
					});
				});
				$(".contact_type_delete").click(function(e){
					var opt = $("#contact_type_opts").val();
					var name = $("#contact_type_opts").val();
					$.ajax({
					  url: 'contact/update.php?delete_type=1',
					  type: 'POST',
					  data:{description:name,contact_type_id:opt},
					  success: function(data) {
						notify("Successfully Deleted ");
						$("#contact_type_opts option[value='"+opt+"']").remove();
					  }
					});
				});
				$(".contact_type_add").click(function(e){
					var opt = $("#contact_type_opts").val();
					var name = $("#contact_type_name").val();
					$.ajax({
					  url: 'contact/update.php?new_type=1',
					  type: 'POST',
					  data:{description:name},
					  success: function(data) {
						notify("Successfully Added "+name+" (refresh to see)");
					  }
					});
				});
				$(".contact_purpose_update").click(function(e){
					var opt = $("#contact_purpose_opts").val();
					var name = $("#contact_purpose_name").val();
					$.ajax({
					  url: 'contact/update.php?update_purpose=1',
					  type: 'POST',
					  data:{description:name,purpose_id:opt},
					  success: function(data) {
						notify("Successfully Updated to "+name);
						$("#contact_purpose_opts option[value='"+opt+"']").text(name)
					  }
					});
				});
				$(".contact_purpose_delete").click(function(e){
					var opt = $("#contact_purpose_opts").val();
					var name = $("#contact_purpose_opts").val();
					$.ajax({
					  url: 'contact/update.php?delete_purpose=1',
					  type: 'POST',
					  data:{description:name,purpose_id:opt},
					  success: function(data) {
						notify("Successfully Deleted ");
						$("#contact_purpose_opts option[value='"+opt+"']").remove();
					  }
					});
				});
				$(".contact_purpose_add").click(function(e){
					var opt = $("#contact_purpose_opts").val();
					var name = $("#contact_purpose_name").val();
					$.ajax({
					  url: 'contact/update.php?new_purpose=1',
					  type: 'POST',
					  data:{description:name},
					  success: function(data) {
						notify("Successfully Added "+name+" (refresh to see)");
					  }
					});
				});
				$(".intake_lim_update").click(function(e){
					var opt = $("#intake_lim_opts").val();
					var name = $("#intake_lim_name").val();
					$.ajax({
					  url: 'intake/update.php?update_lims=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Updated to "+name);
						$("#intake_lim_opts option[value='"+opt+"']").text(name)
					  }
					});
				});
				$(".intake_lim_delete").click(function(e){
					var opt = $("#intake_lim_opts").val();
					var name = $("#intake_lim_opts").val();
					$.ajax({
					  url: 'intake/update.php?delete_lims=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Deleted ");
						$("#intake_lim_opts option[value='"+opt+"']").remove();
					  }
					});
				});
				$(".intake_lim_add").click(function(e){
					var opt = $("#intake_lim_opts").val();
					var name = $("#intake_lim_name").val();
					$.ajax({
					  url: 'intake/update.php?add_lims=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Added "+name+" (refresh to see)");
					  }
					});
				});
				$(".intake_serv_update").click(function(e){
					var opt = $("#intake_serv_opts").val();
					var name = $("#intake_serv_name").val();
					$.ajax({
					  url: 'intake/update.php?update_serv=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Updated to "+name);
						$("#intake_serv_opts option[value='"+opt+"']").text(name)
					  }
					});
				});
				$(".intake_serv_delete").click(function(e){
					var opt = $("#intake_serv_opts").val();
					var name = $("#intake_serv_opts").val();
					$.ajax({
					  url: 'intake/update.php?delete_serv=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Deleted ");
						$("#intake_serv_opts option[value='"+opt+"']").remove();
					  }
					});
				});
				$(".intake_serv_add").click(function(e){
					var opt = $("#intake_serv_opts").val();
					var name = $("#intake_serv_name").val();
					$.ajax({
					  url: 'intake/update.php?add_serv=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Added "+name+" (refresh to see)");
					  }
					});
				});
				
				// accommodation crap
				
				$(".accom_class_update").click(function(e){
					var opt = $("#accom_class_opts").val();
					var name = $("#accom_class_name").val();
					$.ajax({
					  url: 'accommodation/update.php?update_class=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Updated to "+name);
						$("#accom_class_opts option[value='"+opt+"']").text(name)
					  }
					});
				});
				$(".accom_class_delete").click(function(e){
					var opt = $("#accom_class_opts").val();
					var name = $("#accom_class_opts").val();
					$.ajax({
					  url: 'accommodation/update.php?delete_class=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Deleted ");
						$("#accom_class_opts option[value='"+opt+"']").remove();
					  }
					});
				});
				$(".accom_class_add").click(function(e){
					var opt = $("#accom_class_opts").val();
					var name = $("#accom_class_name").val();
					$.ajax({
					  url: 'accommodation/update.php?add_class=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Added "+name+" (refresh to see)");
					  }
					});
				});
				$(".accom_exam_update").click(function(e){
					var opt = $("#accom_exam_opts").val();
					var name = $("#accom_exam_name").val();
					$.ajax({
					  url: 'accommodation/update.php?update_exam=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Updated to "+name);
						$("#accom_exam_opts option[value='"+opt+"']").text(name)
					  }
					});
				});
				$(".accom_exam_delete").click(function(e){
					var opt = $("#accom_exam_opts").val();
					var name = $("#accom_exam_opts").val();
					$.ajax({
					  url: 'accommodation/update.php?delete_exam=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Deleted ");
						$("#accom_exam_opts option[value='"+opt+"']").remove();
					  }
					});
				});
				$(".accom_exam_add").click(function(e){
					var opt = $("#accom_exam_opts").val();
					var name = $("#accom_exam_name").val();
					$.ajax({
					  url: 'accommodation/update.php?add_exam=1',
					  type: 'POST',
					  data:{name:name,opt:opt},
					  success: function(data) {
						notify("Successfully Added "+name+" (refresh to see)");
					  }
					});
				});
			<? } ?>
		<?php } ?>	
		
		$("#statistics_menu").hide();
		$("#query_menu").hide();
		
		<?php if($_SESSION['STATS_PANEL']){ ?>				
				plot1 = $.jqplot('chart1', 
					[
						[                      
							<?php 
								
									$qry = "SELECT EnrollmentStatus, count(*) as total from dp_student group by EnrollmentStatus having EnrollmentStatus not like \"\"";
									$res = SQLQuery($qry);
									$comma = "";
							
									while($row = mysql_fetch_assoc($res)){
										echo $comma."['".$row['EnrollmentStatus']."',".$row['total']."]\n";
										$comma = ", ";
									}			
																
							?>
						]
					], 
					{					
						title: ' Student Class Standings ',
						grid: {
							drawBorder: false,
							drawGridlines: false,
							background: 'transparent',
							shadow:false
						},
						seriesDefaults: {
							shadow: true, 
							renderer: jQuery.jqplot.PieRenderer, 
							rendererOptions: { padding: 10, sliceMargin: 3, showDataLabels: true } 
						  }, 
						seriesColors:['#1cd201','#ebba00','#ee3401','#0097f0','#fb6704','#6904fb'],
						legend: { show:true, location: 'e', fontSize: 16 }
					}
				);
				$("#statistics_menu").hide();
					iconToggle("#statistics",'images/pie.png','images/pie_blue.png',"#statistics_menu");
				
				$("#query_menu").hide();
					iconToggle("#query",'images/fork.png','images/fork_blue.png',"#query_menu");
				
				
				
				$(".student_query").bind('click',function(){
					var iinclude = new Object();
					var iwant = new Object();

					$("#query_menu input:text").each(function(){
						iinclude[$(this).attr('name')]=$(this).val();
					});
					l(iinclude);
					l("checked");
					$("#query_menu input:checked").each(function(){
						iwant[$(this).attr('name')]=1;
					});
					$.ajax({
					  url: 'student/query.php?general=1',
					  type: 'POST',
					  data:{want: iwant, include:iinclude },
					  success: function(data) {
						notify("Query Run Successfully!");
						$("#query_results").fadeOut(300);
						$("#query_results").html(data);
						$("#query_results").fadeIn(500);
					  }
					});
				});
				
				
				
			<?php } ?>
			
		
		
			
			$("#drop_logo").mouseover(function(){
				if($('#drop_logo img').attr('src')=='images/drop.png'){
					$('#drop_logo img').attr('src','images/drop_hover.png');
				}
			});
			$("#drop_logo").mouseleave(function(){
				if($('#drop_logo img').attr('src')=='images/drop_hover.png'){
					$('#drop_logo img').attr('src','images/drop.png');
				}
			});
			$("#allmessages").click(function(){
				$.ajax({
					type     : "POST",
					cache    : false,
					url      : "messages.php",
					data     : "getData=RossISAwesome",
					success: function(html) {
						$.window({
						   showModal: false,
						   modalOpacity: 0.5,
						   width:600,
						   height:500,
						   y:20,
						   title: "Last 3 Days of Messages",
						   content: html
						});
					}
				});
				
			});

			$("#messageForm").submit(function() {
			  //send out the message to the database
			  $.ajax({
				  type: "POST",
				  url: "messages.php",//in database give access to this....
				  data: "add="+$("#messageContent").val(),
				  success: function(msg){$("#messageContent").val("");$('#messageContent').focus();}//probably better to tell if fail or succeed, but idc right now
				});
			  return false;//never 'submit' the form
			});
			$("#notification").click(function() {
				//$("#notification").fadeOut("slow");
				$.ajax({
				  type: "POST",
				  url: "clear.php",
				  data: "clear=RossWasHere",
				  success: function(msg){$("#notification").fadeOut("slow");}
				});	
			});
			
			$('#chatbutton').click(function(){
				if($('#chatbutton img').attr('src')=='images/chatOffline.png'){
					$('#chatbutton img').attr('src','images/chatOnline.png');
					
					$('#messageArea').fadeIn("slow");
					//start updating the chat area
					var chat = setInterval(function(){
						//check for the offline button
						if($('#chatbutton').html()==='<img src="images/chatOffline.png">'){
							clearInterval(chat);
						}
						//we are online so, update some text area with the latest messages.
						else{
							$.ajax({
							  type: "POST",
							  cache: false,
							  url: "messages.php",//in database give access to this....
							  data: "time=3",
							  success: function(msg){
								if(msg.length>2){
									$('#forMessages').prepend("<b>"+msg+"</b>");
									}
							  }
							});
						}
					},1400);
				}
				else{//you're offline
					$('#chatbutton img').attr('src','images/chatOffline.png');
					$('#messageArea').fadeOut("slow");
				}				
				
			}).trigger('click');
			
			
		});
	</script>

</head>
<body>


<div id="notification" style="text-align:center;width:100%;"></div>
<div id="content">
	<h1 style="margin-bottom:0px;" ><a href='home.php' id='drop_logo'><img alt="drop" title="drop" height="35" src="images/drop.png" border=0 /></a>
	<span style="float:right;margin-top:15px;">Hey <?php echo $_SESSION['FIRST_NAME']; ?>! (<a style="color:#0073EA;" href="logout.php">not you?</a>)</span>
	<div id="chatbutton" style="background-color:transparent;cursor: pointer; cursor: hand;border:none;margin:15px 10px 0 10px;width:20px;text-align:center;float:right;"><img src="images/chatOffline.png" /></div>
	</h1>
	
	<hr />
		

	<h3>
		Core Modules
	</h3>

	<ul>
	<?php if($_SESSION['CREATES_ACCOMS']){?>
	 <li>
		<a id="accommodation" href="#" title="Accommodation Form">
			<div style="text-align: center;width: 120px;">
				<img src="images/heart.png" alt="Accommodation form" border="0" /><br/>
				Accommodation
			</div>
		</a>
	  </li>
	<?php } ?>
	<?php if($_SESSION['CREATES_CONTACT']){?>
	  <li>
		<a id="history" href="#" title="History">
			<div style="text-align: center;width: 150px;">
				<img src="images/book.png" alt="history" border="0" /><br/>
				Contact Form
			</div>
		</a>
	  </li>
	<?php } ?>
	<?php if($_SESSION['CREATES_INTAKE']){?>
	  <li>
		<a id="intake" href="#" title="Intake Form">
			<div style="text-align: center;width: 150px;">
				<img src="images/article.png" alt="Intake form" border="0" /><br/>
				Intake Form
			</div>
		</a>
	  </li>
	<?php } ?>
	<?php if($_SESSION['CREATES_STUDENT']){?>
	  <li>
		<a id="student" href="#" title="<Student Form">
			<div style="text-align: center;width: 150px;">
				<img src="images/user.png" alt="Student form" border="0" /><br/>
				Student Form
			</div>
		</a>
	  </li>
	<?php } ?>
	<?php if($_SESSION['CAN_VIEW']){?>
	   <li style="border:none;border-left:1px solid #ccc;">
			<div style="text-align:center;width:320px;border:none;">
				<input size=30 type=text id="search_field"/>
				<img id='searchbutton' src="images/search.png" style="cursor:pointer;height:17px;border:none;" height=16 alt="Search" border="0" />
			</div>
	  </li>
	<?php } ?>  
	
	
	
	
	<?php if($_SESSION['ADMIN_PANEL']){?>
		<h3 style='margin-top:30px;'>
			Administration Modules
		</h3>
		
		<?php if($_SESSION['ADD_USER']){ ?>
		<li>
			<a id="addUser" href="#" title="Add User">
				<div style="text-align: center;width: 120px;">
					<img src="images/addUser.png" alt="Add User" border="0" /><br/>
					Add User
				</div>
			</a>
		 </li>
		<?php } ?>
		<?php if($_SESSION['EDIT_USER']){ ?>
		 <li>
			<a id="editUser" href="#" title="Edit User">
				<div style="text-align: center;width: 120px;">
					<img src="images/editUser.png" alt="Edit User" border="0" /><br/>
					Edit User
				</div>
			</a>
		 </li>
		<?php } ?>
		<?php if($_SESSION['ADD_GROUP']){ ?>
		 <li>
			<a id="addGroup" href="#" title="Add Group">
				<div style="text-align: center;width: 120px;">
					<img src="images/addGroup.png" alt="Add Group" border="0" /><br/>
					Add Group
				</div>
			</a>
		 </li>
		<?php } ?>
		<?php if($_SESSION['EDIT_GROUP']){ ?>
		 <li>
			<a id="editGroup" href="#" title="Edit Group">
				<div style="text-align: center;width: 120px;">
					<img src="images/editGroup.png" alt="Edit Group" border="0" /><br/>
					Edit Group
				</div>
			</a>
		 </li>
		<?php } ?>
		<?php if($_SESSION['CLEAN_DROP']){ ?>
		 <li>
			<a id="cleandrop" href="#" title="Clean Drop">
				<div style="text-align: center;width: 120px;">
					<img src="images/box.png" alt="Clean drop" border="0" /><br/>
					Spring Cleaning
				</div>
			</a>
		 </li>
		<?php } ?>
		<?php if($_SESSION['EDIT_CONFIGS']){ ?>
		 <li>
			<a id="editconfigs" href="#" title="drop configs">
				<div style="text-align: center;width: 120px;">
					<img src="images/list.png" alt="drop configurations" border="0" /><br/>
					Configurations
				</div>
			</a>
		 </li>
		<?php } ?> 
		<?php if($_SESSION['ALTER_FORMS']){ ?>
		 <li>
			<a id="alterForms" href="#" title="Alter Forms">
				<div style="text-align: center;width: 120px;">
					<img src="images/brush.png" alt="Alter Forms" border="0" /><br/>
					Alter Forms
				</div>
			</a>
		 </li>
		<?php } ?> 
	<?php } /* end of admin panel */ ?>

	
	
	<?php if($_SESSION['STATS_PANEL']){ ?>
		<h3 style='margin-top:20px;'>
			Statistics Modules
		</h3>
	
		 <li>
			<a id="statistics" href="#" title="Statistics">
				<div style="text-align: center;width: 120px;">
					<img src="images/pie.png" alt="Statistics" border="0" /><br/>
					drop
				</div>
			</a>
		 </li>
		 <li>
			<a id="query" href="#" title="Query Maker">
				<div style="text-align: center;width: 120px;">
					<img src="images/fork.png" alt="Query" border="0" /><br/>
					Query Maker
				</div>
			</a>
		 </li>
	<?php } ?>
	  
	  
	 
	</ul>
	

</div>

	 <div id="active_results" class='contentLook' ></div>


	<?php if($_SESSION['STATS_PANEL']){ ?>
		<div class="contentLook" id="statistics_menu">
		<h2>drop Statistics <span class='top'><img src='images/home.png' alt='' border=0 /></span></h2>
			
			<?php 
				$qry = "SELECT COUNT(*) as total FROM dp_student";
				$res = SQLQuery($qry);
				$row = mysql_fetch_assoc($res);
				
			?>
			<h3>Total Students: <span style='color:green;'><?php echo $row['total']; ?></span></h3>
			
			 <div id="chart1" style="margin-top:20px; margin-left:20px; width:660px; height:300px;"></div>
    
		</div>
		
		<div class='contentLook' id='query_menu'>
			<div class='query_student'>
				<h2>Student Information Query <span class='top'><img src='images/home.png' alt='' border=0 /></span></h2>
				<table style='width:100%' >
					<?php
						$qry = "show columns from dp_student";
						$res = SQLQuery($qry);
						while($row = mysql_fetch_assoc($res)){
							$name = $row['Field'];
							echo "<tr><td><input type=checkbox name=\"$name\" /></td><td>$name</td><td><input type=text value='' name=\"$name\"</td></tr>\n";
						}
					?>
					<tr>
					<tr><td></td><td></td><td><button class='student_query'>Query</button></td>
					</tr>
				</table>
				<div id="query_results" style='margin-top:15px;' ></div>
			</div>
		</div>		
	<?php } ?>
	
	<?php if($_SESSION['ADD_USER']){ ?>	
		<div class="contentLook" id="addUser_menu">
			<h2>Create User <span class='top'><img src='images/home.png' alt='' border=0 /></span></h2>
			<table border="0" cellpadding="2" cellspacing="0">
				<tr>
				  <th>First Name </th>
				  <td><input name="firstname" type="text" /></td>
				</tr>
				<tr>
				  <th>Last Name </th>
				  <td><input name="lastname" type="text"   /></td>
				</tr>
				<tr>
				  <th width="124">Login</th>
				  <td width="168"><input name="login" type="text"  /></td>
				</tr>
				<tr>
				  <th>Password</th>
				  <td><input name="passwd" type="password"  name="password" /></td>
				</tr>
				<tr>
				  <th>Confirm Password </th>
				  <td><input name="cpassword" type="password" name="cpassword" /></td>
				</tr>
				<tr>
				  <th>Permission Group</th>
				  <td><?php echo selectMenu(tableArray("`group`","group_id","name"),"","name='group_id'"); ?></td>
				</tr>
				<tr>
				  <td>&nbsp;</td>
				  <td><button class='register'>Register</button></td>
				</tr>
		  </table>
		</div>
	<?php } ?>
	<?php if($_SESSION['EDIT_USER']){ ?>
		<div class="contentLook" id="editUser_menu">
				<?php
					$groups = tableArray("`group`","group_id","name");
					
					$qry = "SELECT member_id, firstname, lastname, login, group_id FROM members";
					$res = SQLQuery($qry);
				?>
				<h2>Edit User <span class='top'><img src='images/home.png' alt='' border=0 /></span></h2>
				<table style="text-align:left;align:left;border-spacing: 10px 5px;">
				  <thead>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Login</th>
					<th>Group</th>
					<th></th>
				  </thead>
				  <tbody>
				<?php
					while($row = mysql_fetch_assoc($res)){
						echo "<tr>";
							echo "<td><input class='firstname' type=text value='".$row['firstname']."' /></td>";
							echo "<td><input class='lastname' type=text value='".$row['lastname']."' /></td>";
							echo "<td><input class='login' type=text value='".$row['login']."' />";
							echo "<input class='member_id' type=hidden value='".$row['member_id']."' /></td>";
							echo "<td>".selectMenu($groups,$row['group_id'],"class='group_id'")."</td>";
							echo "<td><span class='userUpdate'> <button>Update</button> </span></td>";
							echo "<td><span class='userDelete'> <button>Delete</button> </span></td>";
						echo "</tr>";
					}
				?>
				</tbody>
				</table>
		</div>
	<? } ?>
	<?php if($_SESSION['EDIT_GROUP']){ ?>
		<div class="contentLook" id="editGroup_menu">
			<h2>Edit Group <span class='top'><img src='images/home.png' alt='' border=0 /></span></h2>
					<?php
						$qry = "SELECT * FROM `group`";
						$res = SQLQuery($qry);
						while($row = mysql_fetch_assoc($res)){
							?>
							<a style='cursor:pointer;font-weight:bold;' onclick="$('#group_<?php echo $row['group_id']; ?>').toggle(600);"><?php echo $row['name']; ?></a><br/>
								<div id='group_<?php echo $row['group_id']; ?>'>
								<table style="text-align:left;align:left;border-spacing: 10px 5px;" >
									<tr>
										<td><input type=checkbox <?php echo $row['createAccoms']==1 ? "checked='checked'":"";?> value='createAccoms' /> Create Accommodations</td>
										<td><input type=checkbox <?php echo $row['createContact']==1 ? "checked='checked'":"";?> value='createContact' /> Create Contacts</td>
										<td><input type=checkbox <?php echo $row['createIntake']==1 ? "checked='checked'":"";?>  value='createIntake' /> Create Intakes</td>
										<td><input type=checkbox <?php echo $row['createStudent']==1 ? "checked='checked'":"";?>  value='createStudent' /> Create Student</td>
									</tr>
									<tr>
										<td><input type=checkbox <?php echo $row['deleteAccoms']==1 ? "checked='checked'":"";?>  value='deleteAccoms' /> Delete Accommodations</td>
										<td><input type=checkbox <?php echo $row['deleteContact']==1 ? "checked='checked'":"";?>  value='deleteContact' /> Delete Contacts</td>
										<td><input type=checkbox <?php echo $row['deleteIntake']==1 ? "checked='checked'":"";?>  value='deleteIntake' /> Delete Intakes</td>
										<td><input type=checkbox <?php echo $row['deleteStudent']==1 ? "checked='checked'":"";?>  value='deleteStudent' /> Delete Student</td>
									</tr>
									<tr>
										<td><input type=checkbox <?php echo $row['canView']==1 ? "checked='checked'":"";?>  value='canView' /> View &amp; Search Students</td>
										<td><input type=checkbox <?php echo $row['adminPanel']==1 ? "checked='checked'":"";?>  value='adminPanel' /> Administration Panel</td>
										<td><input type=checkbox <?php echo $row['statisticsPanel']==1 ? "checked='checked'":"";?>  value='statisticsPanel' /> Statistics Panel</td>
										<td><input type=checkbox <?php echo $row['logs']==1 ? "checked='checked'":"";?>  value='logs' /> See Member Logs</td>
									</tr>
									<tr>
										<td><input type=checkbox <?php echo $row['editUser']==1 ? "checked='checked'":"";?>  value='editUser' /> Edit User</td>
										<td><input type=checkbox <?php echo $row['addUser']==1 ? "checked='checked'":"";?>  value='addUser' /> Add User</td>
										<td><input type=checkbox <?php echo $row['addGroup']==1 ? "checked='checked'":"";?>  value='addGroup' /> Add Group</td>
										<td><input type=checkbox <?php echo $row['editGroup']==1 ? "checked='checked'":"";?>  value='editGroup' /> Edit Group</td>
									</tr>
									<tr>
										<td><input type=checkbox <?php echo $row['springCleaning']==1 ? "checked='checked'":"";?> value='springCleaning' /> Clean Drop</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td><button class='updateGroupSubmit' >Update Group</button></td>
									</tr>
								</table>
								</div>
							<?php
						}
					?>
		</div>
	<? } ?>
	<?php if($_SESSION['ADD_GROUP']){ ?>
		<div class="contentLook" id="addGroup_menu">
			<h2>Add Group <span class='top'><img src='images/home.png' alt='' border=0 /></span></h2>
				<table style="text-align:left;align:left;border-spacing: 10px 5px;">
					<tr>
						<td><b>Name: </b><input type=text name='name' /></td>
					</tr>
				</table>
				<table style="text-align:left;align:left;border-spacing: 10px 5px;" >
					<tr>
						<td><input type=checkbox value='createAccoms' /> Create Accommodations</td>
						<td><input type=checkbox value='createContact' /> Create Contacts</td>
						<td><input type=checkbox value='createIntake' /> Create Intakes</td>
						<td><input type=checkbox value='createStudent' /> Create Student</td>
					</tr>
					<tr>
						<td><input type=checkbox value='deleteAccoms' /> Delete Accommodations</td>
						<td><input type=checkbox value='deleteContact' /> Delete Contacts</td>
						<td><input type=checkbox value='deleteIntake' /> Delete Intakes</td>
						<td><input type=checkbox value='deleteStudent' /> Delete Student</td>
					</tr>
					<tr>
						<td><input type=checkbox value='canView' /> View &amp; Search Students</td>
						<td><input type=checkbox value='adminPanel' /> Administration Panel</td>
						<td><input type=checkbox value='statisticsPanel' /> Statistics Panel</td>
						<td><input type=checkbox value='alterForms' /> Alter Forms</td>
					</tr>
					<tr>
						<td><input type=checkbox value='editUser' /> Edit User</td>
						<td><input type=checkbox value='addUser' /> Add User</td>
						<td><input type=checkbox value='addGroup' /> Add Group</td>
						<td><input type=checkbox value='editGroup' /> Edit Group</td>
					</tr>
					<tr>
						<td><input type=checkbox value='springCleaning' /> Clean Drop</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><button class='addGroupSubmit' >Add Group</button></td>
					</tr>
				</table>
		</div>
	<? } ?>
	<?php if($_SESSION['CLEAN_DROP']){ ?>
		<div class="contentLook" id="cleandrop_menu">
			<h2>Spring Cleaning  <span class='top'><img src='images/home.png' alt='' border=0 /></span></h2>
			<p>	
				This is a feature used for clearing out what drop considers <q>useless data</q>.
				It is designed to make drop faster &amp; more efficient, but does delete students who have
				expired. (Greater that 5 years in the system)<br/>
				<em>Here is a list of what it will be cleaning:</em> 
				<div style='font-weight:bold;margin-top:5px;color:#000000;'>
				- Clearing Messages<br/>
				- Completely Clearing Students &gt; 5 years in the system<br/>
				</div>
				<br/><br/><br/>
				<button class='startCleaning' style='width:140px;height:100px;'>Start Cleaning</button>
				<div id='cleaningLog' style='width:100%;margin-top:15px;'></div>
			</p>
		</div>	
	<?php } ?>
	<?php if($_SESSION['EDIT_CONFIGS']){ ?>
		<div class="contentLook" id="editconfigs_menu">
			<br/>
			<p><!-- Instructions --> </p>
			<br/>
			<div class='jquery_ckeditor'>			
				<?php //Original Content
					$qry="SELECT * FROM dp_configs LIMIT 1";
					$res = SQLQuery($qry);
					$data = mysql_fetch_assoc($res);
					echo ($data['merge_text']);
				?>			
			</div>
			<label>Department Name: <input type=text class='dept_name' value="<?php echo $data['dept_name']; ?>"  /></label><br/>
			<label>Department Email: <input type=text class='dept_email' value="<?php echo $data['email']; ?>" /></label><br/>
			<label>Department Location: <input type=text class='dept_loc' value="<?php echo $data['location']; ?>" /></label><br/>
			<label>Department Phone: <input type=text class='dept_phone' value="<?php echo $data['phone_num']; ?>" /></label>
			<br/>
			<button class='update_configs' >Update</button>
		</div>	
	<?php } ?>
	<?php if($_SESSION['ALTER_FORMS']){ ?>
		<div class="contentLook" id="alterForms_menu">
			<h2> Accommodation Form </h2>
			<div style='margin-left:15px;'>
				<h3>Class Accommodations</h3>
					<select id='accom_class_opts'>
						<?php 
							$qry = "SELECT * FROM dp_class_accommodations ORDER BY class_option ";
							$res = SQLQuery($qry);
							while($row = mysql_fetch_assoc($res)){
								$v = $row['class_accom_id'];
								$n = $row['class_option'];
								echo "<option value='$v'>$n</option>\n";
							}
						?>
					</select>
					New Name: <input type=text id='accom_class_name'/>
					<button class="accom_class_update">Update</button>
					<button class="accom_class_delete">Delete</button>
					<button class="accom_class_add">Add</button>
					
					
					<h3>Exam Accommodations</h3>
					<select id='accom_exam_opts'>
						<?php 
							$qry = "SELECT * FROM dp_exam_accommodations ORDER BY exam_option ";
							$res = SQLQuery($qry);
							while($row = mysql_fetch_assoc($res)){
								$v = $row['exam_accom_id'];
								$n = $row['exam_option'];
								echo "<option value='$v'>$n</option>\n";
							}
						?>
					</select>
					New Name: <input type=text id='accom_exam_name'/>
					<button class="accom_exam_update">Update</button>
					<button class="accom_exam_delete">Delete</button>
					<button class="accom_exam_add">Add</button>
					
					 
			</div>
			<h2> Contact Form </h2>
			<div style='margin-left:15px;'>
				<h3>Purpose</h3>
					<select id='contact_purpose_opts'>
						<?php 
							$qry = "SELECT * FROM dp_purpose ORDER BY description ";
							$res = SQLQuery($qry);
							while($row = mysql_fetch_assoc($res)){
								$v = $row['purpose_id'];
								$n = $row['description'];
								echo "<option value='$v'>$n</option>\n";
							}
						?>
					</select>
					New Name: <input type=text id='contact_purpose_name'/>
					<button class="contact_purpose_update">Update</button>
					<button class="contact_purpose_delete">Delete</button>
					<button class="contact_purpose_add">Add</button>
				<h3>Contact Type</h3>
					<select id='contact_type_opts'>
						<?php 
							$qry = "SELECT * FROM dp_contact_type ORDER BY description ";
							$res = SQLQuery($qry);
							while($row = mysql_fetch_assoc($res)){
								$v = $row['contact_type_id'];
								$n = $row['description'];
								echo "<option value='$v'>$n</option>\n";
							}
						?>
					</select>
					New Name: <input type=text id='contact_type_name'/>
					<button class="contact_type_update">Update</button>
					<button class="contact_type_delete">Delete</button>
					<button class="contact_type_add">Add</button>
					
										
					 
			</div>			
			<h2> Intake Form </h2>
			<div style='margin-left:15px;'>
				<h3>Limitations &amp; Learning</h3>
					<select id='intake_lim_opts'>
						<?php 
							$qry = "SELECT * FROM dp_limitations ORDER BY limitation_name ";
							$res = SQLQuery($qry);
							while($row = mysql_fetch_assoc($res)){
								$v = $row['limitation_id'];
								$n = $row['limitation_name'];
								echo "<option value='$v'>$n</option>\n";
							}
						?>
					</select>
					New Name: <input type=text id='intake_lim_name'/>
					<button class="intake_lim_update">Update</button>
					<button class="intake_lim_delete">Delete</button>
					<button class="intake_lim_add">Add</button>
					
					
					<h3>Additional Services</h3>
					<select id='intake_serv_opts'>
						<?php 
							$qry = "SELECT * FROM dp_services ORDER BY service_name ";
							$res = SQLQuery($qry);
							while($row = mysql_fetch_assoc($res)){
								$v = $row['service_id'];
								$n = $row['service_name'];
								echo "<option value='$v'>$n</option>\n";
							}
						?>
					</select>
					New Name: <input type=text id='intake_serv_name'/>
					<button class="intake_serv_update">Update</button>
					<button class="intake_serv_delete">Delete</button>
					<button class="intake_serv_add">Add</button>
					
					 
			</div>
		</div>
	<?php } ?>
	
	<?php if($_SESSION['CREATES_ACCOMS']){?>	
		<div class="contentLook" id="accommodations">
			
			<h1>Accommodations <span class='top'><img src='images/home.png' alt='' border=0 /></span></h1><div style='margin-left: 15px;'>
				<?php
						echo "<div style='' id='accom_tabs' >";
							echo "<ul>";
							echo "<li><a href='#accom_course'>Course Info</a></li>"; 
							echo "<li><a href='#accom_class'>Class Accommodations</a></li>"; 
							echo "<li><a href='#accom_exam'>Exam Accommodations</a></li>"; 
							echo "</ul>";
							
							echo "<div id='accom_course'>";
								echo "<br/><p><table style='width:100%'>";
								  echo "<tr>";
									echo "<td><b>Name: </b><input type=text class='accom_student_search' /><input id='student_id_hidden' type=hidden name='student_id' value='' /> </td>";
									echo "<td><b>Date: </b> <input name='accom_date' type=text class='date'  /></td>";
									echo "<td><b>Specialist: </b> ".selectMenu($specialists,"","name='member_id'")."</td>";
								  echo "</tr>";
								  
								  echo "<tr>";
									echo "<td><b>Semester: </b> ".selectMenu($semesters,"","name='semester'")."</td>";
									echo "<td><button class='addclass'>Add Class</button></td>";
									
									//echo "<td><b>CRN: </b> <input type=text name='crn' /></td>";
									//echo "<td><b>Course: </b> <input type=text name='course' /></td>";
								  echo "</tr>";
								
								  echo "<tr>";
									echo "<td><div id='classes'></div></td>";
			
								 echo "</tr>";
								
								echo "</table></p>";
							echo "</div>";
							
							
							
							echo "<div id='accom_class'>";
								echo "<br/><p><table style='width:100%'>";
									
									$qry="SELECT * FROM `dp_class_accommodations` ORDER BY class_option ASC";
									$res = SQLQuery($qry);
									$rows = mysql_num_rows($res)/4;
									$count = 0;
									while($row=mysql_fetch_assoc($res)){
										if($count==0){
											echo "<tr>";
										}
										
										echo "<td><input class='classOptions' type=checkbox value=\"".$row['class_accom_id']."\"/>".$row['class_option']."<input id='extraclass_".$row['class_accom_id']."' placeholder='   ...   ' type=text class='classOptions_extra' /></td>";
										
										if($count==3){echo "</tr>";}
										$count=($count+1)%4;
									}
									if($count>0){echo "</tr>";}
									
								  echo "<tr>";
									echo "<td><b>Other Class Accommodations</b></td>";
									echo "<td><textarea style='height:40px' name='otherClassAccoms'></textarea></td>";
									echo "<td><b>Class Accommodation Notes</b></td>";
									echo "<td><textarea style='height:40px' name='classAccomNotes' ></textarea></td>";
								  echo "</tr>";
								
								echo "</table></p>";
							echo "</div>";
							
							echo "<div id='accom_exam'>";
								echo "<br/><p><table style='width:100%'>";
									
									$qry="SELECT * FROM `dp_exam_accommodations` ORDER BY exam_option ASC";
									$res = SQLQuery($qry);
									$rows = mysql_num_rows($res)/4;
									$count = 0;
									while($row=mysql_fetch_assoc($res)){
										if($count==0){
											echo "<tr>";
										}
										echo "<td><input class='examOptions' type=checkbox value=\"".$row['exam_accom_id']."\"/>".$row['exam_option']."<input id='extraexam_".$row['exam_accom_id']."' placeholder='   ...   ' type=text class='examOptions_extra' /></td>";
										
										if($count==3){echo "</tr>";}
										$count=($count+1)%4;
									}
									if($count>0){echo "</tr>";}
									
								  echo "<tr>";
									echo "<td><b>Other Exam Accommodations</b></td>";
									echo "<td><textarea style='height:40px' name='otherExamAccoms' >".""."</textarea></td>";
									echo "<td><b>Exam Accommodation Notes</b></td>";
									echo "<td><textarea style='height:40px' name='examAccomNotes' >".""."</textarea></td>";
								  echo "</tr>";
								  
								  echo "<tr>";
									$times = array("0"=>"0%",
													"1"=>"100%",
													".75"=>"75%",
													".5"=>"50%",
													".25"=>"25%");
													
									echo "<td><b>Extended Time (Essay): </b>".selectMenu($times,"","name='extendedTimeEssay'")."</td>";
									echo "<td><b>Extended Time (Math): </b>".selectMenu($times,"","name='extendedTimeMath'")."</td>";
									echo "<td><b>Alt Exam Form: </b>".selectMenu(array(
																				""=>"",
																				"Answers Allowed on Test, rather scantron"=>"Answers Allowed on Test, rather scantron",
																				"Essay"=>"Essay",
																				"More Frequent Tests"=>"More Frequent Tests",
																				"Multiple Choice"=>"Multiple Choice",
																				"No Powerpoint Tests"=>"No Powerpoint Tests",
																				"Short Answer"=>"Short Answer"),"","style='width:70px;' name='altExamForm' ")."</td>";
									echo "<td><button class='updateAccom' >Create Accommodation</button></td>";
								  echo "</tr>";
								
								echo "</table></p>";
							echo "</div>";
							
						echo "</div>";
					
				?>
				
			</div>	
			
		</div>
	<?php } ?>
	<?php if($_SESSION['CREATES_CONTACT']){?>	
		<div class="contentLook" id="contacts">
			<h1>Contact <span class='top'><img src='images/home.png' alt='' border=0 /></span></h1><div style='margin-left: 15px;'>
				<table>
				<tr>
					<td><em>Name: </em></td><td><input type=text class='contact_student_search' /><input type=hidden id='contact_student_id_hidden' />
				</tr>
				<tr>
					<td><em>Date: </em></td><td><input name="con_date" type=text value="<?php echo date("m/d/Y"); ?>" class='date' />
				</tr>
				<tr>
					<td><em>Contact Type: </em></td><td>
						<?php echo selectMenu(tableArray("dp_contact_type","contact_type_id","description"),"","name='contact_type_id'"); ?>
					</td>
				</tr>
				<tr>
					<td><em>Purpose: </em></td><td>
						<?php echo selectMenu(tableArray("dp_purpose","purpose_id","description"),"","name='purpose_id'"); ?>
					</td>
				</tr>
				<tr>
					<td><em>Other: </em></td><td><input type=text name='other' /></td>
				</tr>
				<tr>	
					<td><em>Length: </em></td><td><input type=text size=2 name='length' /> minutes</td>
				</tr>
				<tr>	
					<td><em>Notes: </em></td><td><textarea name='notes' style='height:40px;'></textarea></td> 
				</tr>
				<tr>
					<td></td><td><button id='submit_contact' style='float:right;'>Create Contact</button></td>
				</tr>
				</table>
			</div><br/>
				
			</div>
		</div>
	<?php } ?>
	<?php if($_SESSION['CREATES_INTAKE']){?>	
		<div class="contentLook" id="intakes">
			<h1>Intake Information <span class='top'><img src='images/home.png' alt='' border=0 /></span> </h1><div style='margin-left: 15px;'>
				<?php
						echo "<div style=\"margin-left: 25px;\" id=\"intake_form\">";
							/* content of the intake */
							echo "<table border=0 style=\"align: left;border-spacing: 10px 15px;\">";
								echo "<tr>";
									echo "<td><b style=\"margin-bottom: 1px;\">Name </b>";
									echo "<input type=text class='intake_student_search' /><input type=hidden id='intake_student_id_hidden' /></td>";
									echo "<td></td>";
								echo "</tr>";
								
								echo "<tr>";
									echo "<td><h2 style=\"margin-bottom: 1px;\">Disability</h2></td>";
									echo "<td> </td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><b>Primary Disability: </b> </td><td>".selectMenu(specialArray("dp_disabilities"),"","name='primaryDis'")."</td>";
									echo "<td><b>Secondary Disability: </b> </td><td>".selectMenu(specialArray("dp_disabilities"),"","name='secondaryDis'")."</td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><b>Description: </b> </td><td><textarea style='height:40px;' name='primaryDesc'></textarea></td>";
									echo "<td><b>Description: </b> </td><td><textarea style='height:40px;' name='secondaryDesc'></textarea></td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><b>Tertiary Disability: </b> </td><td>".selectMenu(specialArray("dp_disabilities"),"","name='tertiaryDis'")."</td>";
									echo "<td><b>Other Disability: </b> </td><td><textarea style='height:40px;' name='otherDis'>".""."</textarea></td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><b>Description: </b> </td><td><textarea style='height:40px;' name='tertiaryDesc'></textarea></td>";
									echo "<td></td>";
								echo "</tr>";
								
								echo "<tr>";
									echo "<td><h2 style=\"margin-bottom: 1px;\">Documentation</h2></td>";
									echo "<td> </td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><b>Status: </b> </td><td>".selectMenu(specialArray("dp_intake_doc_status","status_name"),"","name='docStatus'")."</td>";
									echo "<td><b>Submited: </b> </td><td><input class='date' type=text name='docDate' /></td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><b>Provisional Expiration: </b> </td><td><input name='docExp' class='date' type=text /></td>";
									echo "<td><b>Needed:</b></td><td><textarea name='docNeeded' style='height:40px;'></textarea></td>";
								echo "</tr>";
								
								echo "</table>";
								
								echo "<table>";
								/* stuff I can't classify limits etc. */
								echo "<tr>";
									echo "<td><h2 style=\"margin-bottom: 1px;\">Limitations &amp; Learning</h2></td>";
									echo "<td> </td>";
									echo "<td> </td>";
									echo "<td> </td>";
								echo "</tr>";
								
								//limitations
								$qry="SELECT * FROM `dp_limitations` ORDER BY limitation_name ASC";
									$res = SQLQuery($qry);
									$rows = mysql_num_rows($res)/4;
									$count = 0;
									while($row=mysql_fetch_assoc($res)){
										if($count==0){
											echo "<tr>";
										}
										echo "<td><input class='limitationOptions' type=checkbox value=\"".$row['limitation_id']."\"/>".$row['limitation_name']."</td>";
										
										if($count==3){echo "</tr>";}
										$count=($count+1)%4;
									}
									if($count>1){echo "</tr>";}
								
								
								echo "<tr>";
									echo "<td><h2 style=\"margin-bottom: 1px;\">Additional Services</h2></td>";
									echo "<td> </td>";
									echo "<td> </td>";
									echo "<td> </td>";
								echo "</tr>";
								
								
								//services
								$qry="SELECT * FROM `dp_services` ORDER BY service_name ASC";
									$res = SQLQuery($qry);
									$rows = mysql_num_rows($res)/4;
									$count = 0;
									while($row=mysql_fetch_assoc($res)){
										if($count==0){
											echo "<tr>";
										}
										echo "<td><input class='serviceOptions' type=checkbox value=\"".$row['service_id']."\"/>".$row['service_name']."</td>";
										
										if($count==3){echo "</tr>";}
										$count=($count+1)%4;
									}
									if($count>1){echo "</tr>";}
								
								
								
								echo "<tr>";
									echo "<td><b>Medications: </b> <textarea name='medications' style='height:50px;'>".""."</textarea></td>";
									//swap this out in db
									echo "<td><b>Intake Notes: </b> <textarea name='intake_notes' style='height:50px;'>".""."</textarea></td>";
									echo "<td><b>Recommendation: </b> <textarea name='recommendation' style='height:50px;'>".""."</textarea></td>";
									echo "<td><b>Follow Up: </b> <input type=text name='followup_date' class='date'><br/> <textarea name='followup_notes' style='height:40px;'></textarea></td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td> </td>";
									echo "<td> </td>";
									echo "<td> </td>";
									echo "<td><button class='createIntake'>Create Intake</button></td>";
								echo "</tr>";
							echo "</table>";
							
						echo "</div><br/>";
					
				?>
			</div>
			
		</div>
	<?php } ?>
	<?php if($_SESSION['CREATES_STUDENT']){?>
		<div class="contentLook" id="information">
			<h1 style='margin-bottom:0px;'>Student  <span class='top'><img src='images/home.png' alt='' border=0 /></span></h1>
			<table border=0 valign=top style="align: left;border-spacing: 15px 10px;width: 100%;">
				<tr>
					<td><b>Name: </b><input type="text" size=10 name="firstname" /> <input type="text" size=10 name="middlename" /> <input type="text" size=10 name="lastname" /></td>
					<td></td>
					<td></td>
					<td><b>University #</b><input type="text" size=9 name="univId" /></td>
				</tr>
				<tr>
				<td>
				<b>Race: </b><?php echo selectMenu(array("Unspecified"=>"Unspecified",
												"Asian"=>"Asian",
												"Black"=>"Black",
												"Latino"=>"Latino",
												"Other"=>"Other",
												"White"=>"White"),"","name='race'")." ( <input type='checkbox' name='citizen' checked='checked' /> Citizen )"; ?>
				</td>
				<td>
				<b>Gender: </b>
				<?php echo selectMenu(array("Female"=>"Female","Male"=>"Male"),"","name='gender'"); ?>
				</td>
				<td>
				<b>Born: </b><input type="text" style="font-size: 13px;height: 16px;" size=10 name="dateOfBirth" class="date" />
				</td>
				
				<td>
				<b>Student Status: </b><?php echo selectMenu(array(
																"Housing"=>"Housing",
																"New (1st Year)"=>"New (1st Year)",
																"Prospective"=>"Prospective",
																"Provisional"=>"Provisional",
																"Returning"=>"Returning"
																)
																,"","name='studentStatus'"); ?>
				</td>
				</tr>
				
				<tr>
					<td>
						<b>Student Type: </b><?php echo selectMenu(array("Active"=>"Active",
																		"Prospective"=>"Prospective",
																		"End Service(SHRED)"=>"End Service (SHRED)",
																		"Inactive"=>"Inactive"),"","name='studentType'"); ?>
					</td>
					<td></td>
					<td></td>
					<td>
							<b>End Services on: </b><input type="text" style="font-size: 13px;height: 16px;" size=10 name="endOfService" class="date" />
					</td>
				</tr>
				
				
				</table>
				<br/>
				
				<h1 style='margin-bottom:0px;'>School </h1>
				<table style="align: left;border-spacing: 15px 10px;width: 100%;">
				<tr>
					<td>
					<b>GPA: </b><input style="font-size: 13px;height: 16px;" size=3 type=text name=GPA  />
					</td>
					
					<td style="width:250px;">
						<b>Enrollment Status: </b> <?php echo selectMenu(array("Freshman"=>"Freshman",
																			   "Sophomore"=>"Sophomore",
																			   "Junior"=>"Junior",
																			   "Senior"=>"Senior",
																			   "Graduate"=>"Graduate"),"", "name='EnrollmentStatus'"); ?>
					</td>
					<td>
						<b>Credit Load: </b> <?php echo selectMenu(array("Full-Time"=>"Full-Time",
																		  "Part-Time"=>"Part-Time"),"","name='creditLoad'"); ?>
					</td>
					<td>
						<b>College: </b> <?php echo selectMenu(specialArray("dp_colleges"),"", "name='college' style='width:200px;'"); ?>	
					</td>
				</tr>
				<tr>
					<td>
						<b>Major: </b> <?php echo selectMenu(specialArray("dp_majors"),"", "name='major' style='width:130px;'"); ?>	
					</td>
					<td>
						<b>Minor: </b> <?php echo selectMenu(specialArray("dp_majors"),"", "name='minor' style='width:130px;'"); ?>	
					</td>
					
					<td></td>
					<td></td>
				</tr>
				
				</table>
				<br/>
				
				<h1 style='margin-bottom:0px;'>Contact &amp; Other </h1>
				<table style="align: left;border-spacing: 15px 10px;width: 100%;">
				<tr>
					<td>
						<b>Phone #: </b><input style="font-size: 13px;height: 16px;" size=13 type=text name=phoneNum />
					</td>
					<td>
						<b>Email: </b><input style="font-size: 13px;height: 16px;" type=text name=email  />
					</td>
					
					<td>
						<b>Emergency Contact: </b><br/><input type=text size=9 name='emergencyFirst'  />
							<input type=text name='emergencyLast' size=9  /><br/>
							<input type=text name='emergencyRelation' size=9  />
					</td>
					<td>
						<b>Emergency&#39;s Phone #: </b><input type=text name='emergencyPhoneNum' />
					</td>
				</tr>
				<tr>
					<td>
						<b>Local Address: </b><br/>
							<input type=text name=locStAddress  /><br/>
							<input type=text name=locStAddress2  /><br/>
							<input type=text name=locCity  /><br/>
							<input type=text name=locZip size=5  /><input type=text name=locState size=2 /><br/>
							<input type=text name=locCountry  />
					</td>
					<td>
						<b>Permanent Address: </b><br/>
							<input type=text name=permStAddress  /><br/>
							<input type=text name=permStAddress2  /><br/>
							<input type=text name=permCity  /><br/>
							<input type=text name=permZip size=5  /><input type=text name=permState size=2 /><br/>
							<input type=text name=permCountry  />
					</td>
					<td style="width:280px;">
						<input type=checkbox name='ok2sendConfMessage'  /><b>OK to Send Confidential Messages</b><br/>
						<input type=checkbox name='ok2leaveConfMessage'  /><b>OK to Leave Confidential Messages</b><br/>
						<input type=checkbox name='ferpaOnFile'  /><b>FERPA On File </b><br/>
						<input type=checkbox name='veteran'  /><b>Veteran Of United States </b><br/>
						
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						
					</td>
				</tr>
			</table>
			<br/>
			
			<b>Notes: </b> <textarea style="height:80px;width:500px;margin-right:30px;" name=notes></textarea>
			<button style="margin-top:50px;float:right;margin-right:20px;" class="updateStudent">Create Student</button>				
		
		</div>
	<?php } ?>


<!-- after content the messages area -->
<div class="contentLook" style="padding-bottom:7px;" id="messageArea">
<h2 style='float:left;position:absolute;' >Group Chat</h2><br/><br/>
<button id="allmessages" style="border:none;float:right;margin-right:0px;margin-top:5px;background-color:transparent;cursor: pointer; cursor: hand;" border=0 ><img src="./images/allmail.png" alt="Get More Messages" border=0 /></button>
	<div id="forMessages" style="margin:10px;text-align:left;width:760px;height:160px;overflow:auto;">
		
	</div>
		<br/>
	<hr/>
	<form id="messageForm" action="">
		<input type=text name='message' id='messageContent' style="margin:0;padding:0;width:400px;"/> 
		<input style="cursor:pointer;height:1.5em; width:5em" type=submit value="Send" />
	</form>
</div>




<div style='width:100%;margin-top:15px;text-align:center;color:#CCC;font-weight:normal;'>Copyright &copy; <a style='font-weight:normal;color:#C0C0C0;' href='http://www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div></body>
</html>
