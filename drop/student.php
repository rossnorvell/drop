<?php require_once('auth.php');
		require_once('util.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/	
	$id = "";
	if(isset($_GET['student'])){
		$id = sanitize($_GET['student']);
	}
	
	$accoms=array();
	$contacts=array();
	$intakes=array();
	$info=array();
	
	$qry="SELECT * FROM `dp_accommodations` NATURAL JOIN `members` WHERE student_id='".$id."' order by semester";
	$res = SQLQuery($qry);
	while($row=mysql_fetch_assoc($res)){
		$accoms[]=$row;
	}
	
	$qry="SELECT * FROM `dp_contact` NATURAL JOIN `members` WHERE student_id='".$id."' ORDER BY con_date DESC";
	$res = SQLQuery($qry);
	while($row=mysql_fetch_assoc($res)){
		$contacts[]=$row;
	}
	
	$qry="SELECT * FROM `dp_intake` NATURAL JOIN `members` WHERE student_id='".$id."'";
	$res = SQLQuery($qry);
	while($row=mysql_fetch_assoc($res)){
		$intakes[]=$row;
	}
	
	$qry="SELECT * FROM `dp_student` WHERE id='".$id."'";
	$res = SQLQuery($qry);
	$info=mysql_fetch_assoc($res);
	
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
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http: //www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http: //www.w3.org/1999/xhtml" xml: lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="imagetoolbar" content="no" />
	<title><?php echo $info['firstname']." ".$info['lastname']; ?> | drop</title>
	
	<link id="jquery_ui_theme_loader" rel="stylesheet" href="jquery-ui-custom/css/custom-theme/jquery-ui-1.8.20.custom.css">
	<script src="jquery-ui-custom/js/jquery-1.7.2.min.js"></script>
	<script src="jquery-ui-custom/js/jquery-ui-1.8.20.custom.min.js"></script>
	
	<!-- Style Includes -->
	<link rel="stylesheet" type="text/css" href="jquery-ui-custom/noty/css/jquery.noty.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-ui-custom/noty/css/noty_theme_twitter.css"/>
	
	<!-- jQuery Library -->
	<script type="text/javascript" src="jquery-ui-custom/noty/js/jquery.noty.js"></script>
	
	
	
	<link rel="stylesheet" href="style.css" />
	<style type="text/css">
		input[type=text] {
			font-size: 13px !important;
			height: 16px !important;
		}
		textarea{
			font-size : 13px !important;
		}
		.date{}
		.examOptions{}
		.classOptions{}
		.updateAccom{}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
			function l(s){/*console.log(s);*/}
			function notify(html,good){
				good = (typeof good === 'undefined') ? true : good;
				type = (good) ? 'success' : 'error';
				noty({layout : 'topCenter', theme : 'noty_theme_twitter', type : type, text:html,  timeout : 5000 });
			}
			$(".date").datepicker({
				changeMonth: true,
				changeYear: true			
			});
		<?php if($_SESSION['CREATES_STUDENT']){?>	
			$(".updateStudent").bind('click',function(e){
				var id = "#information";
				$s = new Object();
				var names = [<?php 
								$comma = "";
								foreach($info as $k=>$v){
									echo $comma."\"$k\"";
									$comma=",";
								}
							?>];
				for(i in names){
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
				$s.id = "<?php echo $id; ?>";
				
					
				
				$.ajax({
				  url: 'student/index.php?update=1',
				  type: 'POST',
				  data:$s,
				  success: function(data) {
					//l(data);
					$("#student").trigger('click');
					notify("Successfully Updated Student");
				  }
				});
					
			});
		<?php } ?>
		<?php if($_SESSION['CREATES_ACCOMS']){?>
			$(".classOptions").bind('click', function(e){
				var SortaId = $(this).val();
				var consId = "extraclass_"+SortaId;
				$("#"+consId).toggle();
			});
			$(".examOptions").bind('click', function(e){
				var SortaId = $(this).val();
				var consId = "extraexam_"+SortaId;
				$("#"+consId).toggle();
			});
			
			$(".updateAccom").bind('click',function(e){
				var temp = $(this).parents();
				var id = "";
				for(i in temp){
					var str = temp[i].id;
					if (str !== undefined && str.toLowerCase().indexOf("accom_") >= 0){
						id = "#"+str;
					}
				}
				$a = new Object();
					$a.student_id = "<?php echo $id; ?>";
					var names = ["accom_date","semester","member_id","crn","course","section","room_loc","prof","otherClassAccoms","classAccomNotes","otherExamAccoms","examAccomNotes","extendedTimeEssay","extendedTimeMath","altExamForm"];
					for(i in names){
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
					var temp = id.split("_");
					$a.accommodation_id = temp[1];
					
				
				$.ajax({
				  url: 'accommodation/index.php?update=1',
				  type: 'POST',
				  data:$a,
				  success: function(data) {
					//l(data);
					$(id).toggle(600);
					notify("Successfully Updated Accommodation");
				  }
				});
				
			});
		<?php } ?>
		<?php if($_SESSION['CREATES_INTAKE']){?>	
			$(".updateIntake").bind('click',function(e){
				var temp = $(this).parents();
				var id = "";
				for(i in temp){
					var str = temp[i].id;
					if (str !== undefined && str.toLowerCase().indexOf("intake_") >= 0){
						id = "#"+str;
					}
				}
				
				$a = new Object();
					var names = ["tertiaryDis"
								,"student_id"
								,"primaryDesc",
								,"secondaryDesc"
								,"tertiaryDesc"
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
					
					for(i in names){
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
				
				$a.student_id = "<?php echo $id; ?>";
				$a.services = $serviceChecked;
				$a.limitations = $limitationsChecked;
				var temp = id.split("_");
				$a.intake_id = temp[1];
				
				$.ajax({
				  url: 'intake/index.php?update=1',
				  type: 'POST',
				  data:$a,
				  success: function(data) {
					//l(data);
					$(id).toggle(600);
					notify("Successfully Updated Intake");
				  }
				});
				
			});
		<?php } ?>
		<?php if($_SESSION['CREATES_CONTACT']){?>
			$(".update_contact").bind('click',function(e){
				var div = $(this).parent().parent().parent().parent().parent().parent();
				$data = new Object();
				id = "#"+div.attr('id');
				var selects = div.find('select');
				var inputs = div.find('input');
				var textarea = div.find('textarea');
				
				for( i=0;i<selects.length;i++ ){
					var t = $(selects[i]);
					$data[t.attr('name')]=t.val();
					}
				for( i=0;i<inputs.length;i++ ){
					var t = $(inputs[i]);
					$data[t.attr('name')]=t.val();
					}
				for( i=0;i<textarea.length;i++ ){
					var t = $(textarea[i]);
					$data[t.attr('name')]=t.val();
					}
				$data.student_id = "<?php echo $id; ?>";
				$.ajax({
				  url: 'contact/index.php?update=1',
				  type: 'POST',
				  data:$data,
				  success: function(data) {
					//l(data);
					$(id).toggle(600);
					notify("Successfully Updated Intake");
				  }
				});
			});
		<?php } ?>
			
			
			
			
			
			
			
			
			
			
			
			$("#accommodations").hide();
			<?php
				foreach($accoms as $a){
					echo "\$('#accom_".$a['accommodation_id']."').hide().tabs();\n";
					echo "\$('#accom_".$a['accommodation_id']." ul').removeClass('ui-helper-clearfix ui-widget-header');\n";
				}
			?>
			$("#accommodation").click(function(){
				$("#accommodations").toggle(600);
					
					if($("#accommodation img").attr('src')=='images/heart.png'){
						$("#accommodation img").attr('src','images/heart_blue.png');
					}else{
						$("#accommodation img").attr('src','images/heart.png');
					}
			});
			
			$("#contacts").hide();
			$("#history").click(function(){
				$("#contacts").toggle(600);
					if($("#history img").attr('src')=='images/book.png'){
						$("#history img").attr('src','images/book_blue.png');
					}else{
						$("#history img").attr('src','images/book.png');
					}
			});
			<?php
				foreach($contacts as $con){
					echo "\$(\"#".$con['con_id']."click\").attr(\"onclick\",\"\$('#".$con['con_id']."c').toggle(650)\");";
					echo "\$(\"#".$con['con_id']."c\").hide();";
				}
			?>
			
			
			$("#information").hide();
			$("#student").click(function(){					
				$("#information").toggle(600);
				if($("#student img").attr('src')=='images/user.png'){
					$("#student img").attr('src','images/user_blue.png');
				}else{
					$("#student img").attr('src','images/user.png');
				}
			});
			
			$("#intakes").hide();
			$("#intake").click(function(){
					$("#intakes").toggle(600);
					if($("#intake img").attr('src')=='images/article.png'){
						$("#intake img").attr('src','images/article_blue.png');
					}else{
						$("#intake img").attr('src','images/article.png');
					}
			});
			<?php
				foreach($intakes as $in){
					echo "\$(\"#".$in['intake_id']."iclick\").attr(\"onclick\",\"\$('#intake_".$in['intake_id']."').toggle(650)\");";
					echo "\$(\"#intake_".$in['intake_id']."\").hide();";
				}
			?>	
	
		
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
			
			
		});
	</script>

</head>
<body>



<div id="content">
	<h1 style="margin-bottom: 0px;" ><a href='home.php' id='drop_logo'><img alt="drop" title="drop" height="35" src="images/drop.png" border=0 /></a>
	<span style="float: right;margin-top: 15px;">Hey <?php echo $_SESSION['FIRST_NAME']; ?>! (<a style="color: #0073EA;" href="logout.php">not you?</a>)</span>
	</h1>
	
	<hr />
		<div id="notification">		
			<?php //these will be notification of things done... 
				echo "<b>".$_SESSION['notification'].((strlen($_SESSION['notification'])>2)?" (Click to disappear)": "")."</b>";
			?>
		</div>

	<h3 style="color: #000000;">
		<?php echo $info['firstname']." ".$info['middlename']." ".$info['lastname']." | #".$info['univId']; ?>
	</h3>

	<ul>
	
	 <?php if($_SESSION['CREATES_ACCOMS']){?>
	 <li>
		<a id="accommodation" href="#" title="<b>Accommodation Form</b>">
			<div style="text-align: center;width: 120px;">
				<img src="images/heart.png" alt="Accommodation form" border="0" /><br/>
				Accommodations
			</div>
		</a>
	  </li>
	<?php } ?>
	<?php if($_SESSION['CREATES_CONTACT']){?>
	  <li>
		<a id="history" href="#" title="History">
			<div style="text-align: center;width: 150px;">
				<img src="images/book.png" alt="history" border="0" /><br/>
				History
			</div>
		</a>
	  </li>
	<?php } ?>
	<?php if($_SESSION['CREATES_INTAKE']){?>
	  <li>
		<a id="intake" href="#" title="<b>Intake Form</b>">
			<div style="text-align: center;width: 150px;">
				<img src="images/article.png" alt="Intake form" border="0" /><br/>
				Intakes
			</div>
		</a>
	  </li>
	<?php } ?>
	<?php if($_SESSION['CREATES_STUDENT']){?>
	  <li>
		<a id="student" href="#" title="<b>Student Form</b>">
			<div style="text-align: center;width: 150px;">
				<img src="images/user.png" alt="Student form" border="0" /><br/>
				Student
			</div>
		</a>
	  </li>
	<?php } ?>
	  
	  <div id="active_results"></div>
	  
	 
	</ul>
	
</div>
<?php if($_SESSION['CAN_VIEW']){?>
	<div class="contentLook" id="accommodations">
		
		<h1>Accommodations</h1><div style='margin-left: 15px;'>
			<?php
				$semCheck = "";
				foreach($accoms as $acc){
					if($semCheck!=$acc['semester']){
						$anchor ="MergeAccommodation/index.php?fname=".$info['firstname']."&lname=".$info['lastname']."&semester=".$acc['semester']."&student_id=".$id;
						echo " <br/><a style=\"color: #0073EA;\" href=\"$anchor\" target=\"_blank\">(Print ".$acc['semester'].")</a><br/>";
					  $semCheck = $acc['semester'];
					}
					echo "&nbsp;&nbsp;&nbsp;<a href='#' onclick='\$(\"#accom_".$acc['accommodation_id']."\").toggle(600)' style=\"color: #0093EA;\">".$acc['course']." - ".$acc['semester']."</a>";
					echo "<br/>";
					
					echo "<div style='' id='accom_".$acc['accommodation_id']."' >";
						echo "<ul>";
						echo "<li><a href='#accom_course_'".$acc['accommodation_id'].">Course Info</a></li>"; 
						echo "<li><a href='#accom_class_'".$acc['accommodation_id'].">Class Accommodations</a></li>"; 
						echo "<li><a href='#accom_exam_'".$acc['accommodation_id'].">Exam Accommodations</a></li>"; 
						echo "</ul>";
						
						echo "<div id='accom_course_'".$acc['accommodation_id']."'>";
							echo "<br/><p><table style='width:100%'>";
							  echo "<tr>";
								echo "<td><b>Name: </b> ".$info['firstname']." ".$info['lastname']."</td>";
								echo "<td><b>Date: </b> <input name='accom_date' type=text class='date' value='".dateFormat($acc['accom_date'])."' /></td>";
								echo "<td><b>Specialist: </b> ".selectMenu($specialists,$acc['member_id'],"name='member_id'")."</td>";
							  echo "</tr>";
							  
							  echo "<tr>";
								echo "<td><b>Semester: </b> ".selectMenu($semesters,$acc['semester'],"name='semester'")."</td>";
								echo "<td><b>CRN: </b> <input type=text value='".$acc['crn']."' name='crn' /></td>";
								echo "<td><b>Course: </b> <input type=text value='".$acc['course']."' name='course' /></td>";
							  echo "</tr>";
							
							  echo "<tr>";
								echo "<td><b>Section: </b> <input size=2 type=text value='".$acc['section']."' name='section' /></td>";
								echo "<td><b>Room Location: </b> <input type=text value='".$acc['room_loc']."' name='room_loc' /></td>";
								echo "<td><b>Professor: </b> <input type=text value='".$acc['prof']."' name='prof' /></td>";
							  echo "</tr>";
							
							echo "</table></p>";
						echo "</div>";
						
						
						
						echo "<div id='accom_class_'".$acc['accommodation_id']."'>";
							echo "<br/><p><table style='width:100%'>";
							    $class_accoms = array();
								$qry = "SELECT class_accom_id,specifically FROM tie_class_accoms WHERE accommodation_id=".$acc['accommodation_id'];
								$res = SQLQuery($qry);
								while($row=mysql_fetch_assoc($res)){
									$class_accoms[$row['class_accom_id']]=true;
									$class_accoms[$row['class_accom_id']."_extra"] = $row['specifically'];
								}
								
								$qry="SELECT * FROM `dp_class_accommodations` ORDER BY class_option ASC";
								$res = SQLQuery($qry);
								$rows = mysql_num_rows($res)/4;
								$count = 0;
								while($row=mysql_fetch_assoc($res)){
									if($count==0){
										echo "<tr>";
									}
									$show = isset($class_accoms[$row['class_accom_id']]);
									$visible = ($show ? "":"style='display:none;'");
									$checked = ($show ? "checked='checked'" : "");
									$row['specifically'] = (isset($class_accoms[$row['class_accom_id']."_extra"]) ? $class_accoms[$row['class_accom_id']."_extra"] :"" );
															
									echo "<td><input class='classOptions' type=checkbox ".$checked." value=\"".$row['class_accom_id']."\"/>".$row['class_option']."<input id='extraclass_".$row['class_accom_id']."' placeholder='   ...   ' value='".$row['specifically']."' $visible type=text class='classOptions_extra' /></td>";
									
									if($count==3){echo "</tr>";}
									$count=($count+1)%4;
								}
								if($count>1){echo "</tr>";}
								
							  echo "<tr>";
								echo "<td><b>Other Class Accommodations</b></td>";
								echo "<td><textarea style='height:40px' name='otherClassAccoms'>".$acc['otherClassAccoms']."</textarea></td>";
								echo "<td><b>Class Accommodation Notes</b></td>";
								echo "<td><textarea style='height:40px' name='classAccomNotes' >".$acc['classAccomNotes']."</textarea></td>";
							  echo "</tr>";
							
							echo "</table></p>";
						echo "</div>";
						
						echo "<div id='accom_exam_'".$acc['accommodation_id']."'>";
							echo "<br/><p><table style='width:100%'>";
							    $exam_accoms = array();
								$qry = "SELECT exam_accom_id,specifically FROM tie_exam_accoms WHERE accommodation_id=".$acc['accommodation_id'];
								$res = SQLQuery($qry);
								while($row=mysql_fetch_assoc($res)){
									$exam_accoms[$row['exam_accom_id']]=true;
									$exam_accoms[$row['exam_accom_id']."_extra"] = $row['specifically'];
								}
								
								$qry="SELECT * FROM `dp_exam_accommodations` ORDER BY exam_option ASC";
								$res = SQLQuery($qry);
								$rows = mysql_num_rows($res)/4;
								$count = 0;
								while($row=mysql_fetch_assoc($res)){
									if($count==0){
										echo "<tr>";
									}
									$show = isset($exam_accoms[$row['exam_accom_id']]);
									$visible = ($show ? "":"style='display:none;'");
									$checked = ($show ? "checked='checked'" : "");
									
									$row['specifically'] = (isset($exam_accoms[$row['exam_accom_id']."_extra"]) ? $exam_accoms[$row['exam_accom_id']."_extra"] :"" );
									echo "<td><input class='examOptions' type=checkbox $checked value=\"".$row['exam_accom_id']."\"/>".$row['exam_option']."<input id='extraexam_".$row['exam_accom_id']."' placeholder='   ...   ' value='".$row['specifically']."' $visible type=text class='examOptions_extra' /></td>";
									
									if($count==3){echo "</tr>";}
									$count=($count+1)%4;
								}
								if($count>1){echo "</tr>";}
								
							  echo "<tr>";
								echo "<td><b>Other Exam Accommodations</b></td>";
								echo "<td><textarea style='height:40px' name='otherExamAccoms' >".$acc['otherExamAccoms']."</textarea></td>";
								echo "<td><b>Exam Accommodation Notes</b></td>";
								echo "<td><textarea style='height:40px' name='examAccomNotes' >".$acc['examAccomNotes']."</textarea></td>";
							  echo "</tr>";
							  
							  echo "<tr>";
								$times = array("0"=>"0%",
												"1"=>"100%",
												".75"=>"75%",
												".5"=>"50%",
												".25"=>"25%");
												
								echo "<td><b>Extended Time (Essay): </b>".selectMenu($times,$acc['extendedTimeEssay'],"name='extendedTimeEssay'")."</td>";
								echo "<td><b>Extended Time (Math): </b>".selectMenu($times,$acc['extendedTimeMath'],"name='extendedTimeMath'")."</td>";
								echo "<td><b>Alt Exam Form: </b>".selectMenu(array(
																			""=>"",
																			"Answers Allowed on Test, rather scantron"=>"Answers Allowed on Test, rather scantron",
																			"Essay"=>"Essay",
																			"More Frequent Tests"=>"More Frequent Tests",
																			"Multiple Choice"=>"Multiple Choice",
																			"No Powerpoint Tests"=>"No Powerpoint Tests",
																			"Short Answer"=>"Short Answer"),$acc['altExamForm'],"style='width:70px;' name='altExamForm' ")."</td>";
								echo "<td><button class='updateAccom' >Update Accommodation</button></td>";
							  echo "</tr>";
							
							echo "</table></p>";
						echo "</div>";
						
					echo "</div>";
				}
			?>
			
		</div>	
		
	</div>
	<div class="contentLook" id="contacts">
		<h1>History</h1><div style='margin-left: 15px;'>
			<?php
				foreach($contacts as $con){
					echo "<a id=\"".$con['con_id']."click\" style=\"color: #0073EA;font-weight: bold;cursor: pointer;\"> 
					Contact on ".date('F jS, Y',strtotime($con['con_date']))." with ".$con['firstname']." ".$con['lastname']."</a><br/>";
					
				
				?>
					<div class="contentLook" style='margin-bottom:30px;margin-right:500px;height:280px;width:350px;' id="<?php echo $con['con_id']; ?>c">
						<div style='margin-left: 10px;'>
							<table>
							<h2> </h2>
							<input type="hidden" name='con_id' value="<?php echo $con['con_id']; ?>" />
							<tr>
								<td><em>Date: </em></td><td>
									<input type=text name='con_date' class='date' value="<?php echo date('m/j/Y',strtotime($con['con_date'])); ?>" />
								</td>
							</tr>
							<tr>
								<td><em>Contact Type: </em></td><td>
									<?php echo selectMenu(tableArray("dp_contact_type","contact_type_id","description"),$con['contact_type_id'],"name='contact_type_id'"); ?>
								</td>
							</tr>
							<tr>
								<td><em>Purpose: </em></td><td>
									<?php echo selectMenu(tableArray("dp_purpose","purpose_id","description"),$con['purpose_id'],"name='purpose_id'"); ?>
								</td>
							</tr>
							<tr>
								<td><em>Other: </em></td><td><input type=text name='other' value="<?php echo $con['other']; ?>"/></td>
							</tr>
							<tr>	
								<td><em>Length: </em></td><td><input type=text size=2 name='length' value="<?php echo $con['length']; ?>" /> minutes</td>
							</tr>
							<tr>	
								<td><em>Notes: </em></td><td><textarea name='notes' style='width:330px;height:100px;'><?php echo STD_HTML($con['notes']); ?></textarea></td> 
							</tr>
							
							<tr>
								<td></td><td><button class='update_contact' style='float:right;'>Update Contact</button></td>
							</tr>
							
							</table>
						</div>
						<br/>
						
					</div>
				<?php
				}
			?>
		</div>
	</div>
	<div class="contentLook" id="intakes">
		<h1>Intake Information </h1><div style='margin-left: 15px;'>
			<?php
				foreach($intakes as $in){
					echo "<a id=\"".$in['intake_id']."iclick\" style=\"color: #0073EA;font-weight: bold;cursor: pointer;\">Intake on ".date('F jS, Y',strtotime($in['intake_date']))." with ".$in['firstname']." ".$in['lastname']."</a><br/>";
					echo "<div style=\"margin-left: 25px;\" id=\"intake_".$in['intake_id']."\">";
						/* content of the intake */
						echo "<table border=0 style=\"align: left;border-spacing: 10px 15px;\">";
							echo "<tr>";
								echo "<td><h2 style=\"margin-bottom: 1px;\">Disability</h2></td>";
								echo "<td> </td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td><b>Primary Disability: </b> </td><td>".selectMenu(specialArray("dp_disabilities"),$in['primaryDis'],"name='primaryDis'")."</td>";
								echo "<td><b>Secondary Disability: </b> </td><td>".selectMenu(specialArray("dp_disabilities"),$in['secondaryDis'],"name='secondaryDis'")."</td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td><b>Description: </b> </td><td><textarea style='height:40px;' name='primaryDesc'>".$in['primaryDesc']."</textarea></td>";
								echo "<td><b>Description: </b> </td><td><textarea style='height:40px;' name='secondaryDesc'>".$in['secondaryDesc']."</textarea></td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td><b>Tertiary Disability: </b> </td><td>".selectMenu(specialArray("dp_disabilities"),$in['tertiaryDis'],"name='tertiaryDis'")."</td>";
								echo "<td><b>Other Disability: </b> </td><td><textarea style='height:40px;' name='otherDis'>".$in['otherDis']."</textarea></td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td><b>Description: </b> </td><td><textarea style='height:40px;' name='tertiaryDesc'>".$in['tertiaryDesc']."</textarea></td>";
								echo "<td></td>";
							echo "</tr>";
							
							echo "<tr>";
								echo "<td><h2 style=\"margin-bottom: 1px;\">Documentation</h2></td>";
								echo "<td> </td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td><b>Status: </b> </td><td>".selectMenu(specialArray("dp_intake_doc_status","status_name"),$in['docStatus'],"name='docStatus'")."</td>";
								echo "<td><b>Submited: </b> </td><td><input class='date' type=text value='".dateFormat($in['docDate'])."' name='docDate' /></td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td><b>Expiration: </b> </td><td><input name='docExp' class='date' type=text ".((strtotime($in['docExp'])>time())?("style=\"color: green;\""): ("style=\"color: red;\""))." value='".dateFormat($in['docExp'])."' /></td>";
								echo "<td><b ".($in['docNeeded']==null ? "style='color:green;'" : "style='color:red;'").">Needed: </b> </td><td><textarea style='height:40px;' name='docNeeded' >".$in['docNeeded']."</textarea></td>";
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
							$intake_limitations = array();
							$qry = "SELECT limitation_id FROM tie_limitation_intake WHERE intake_id=".$in['intake_id'];
							$res = SQLQuery($qry);
							while($row=mysql_fetch_assoc($res)){
								$intake_limitations[$row['limitation_id']]=true;
							}
							
							//limitations
							$qry="SELECT * FROM `dp_limitations` ORDER BY limitation_name ASC";
								$res = SQLQuery($qry);
								$rows = mysql_num_rows($res)/4;
								$count = 0;
								while($row=mysql_fetch_assoc($res)){
									if($count==0){
										echo "<tr>";
									}
									$checked = (isset($intake_limitations[$row['limitation_id']])) ? "checked='checked'" : ""; 
									echo "<td><input class='limitationOptions' type=checkbox $checked value=\"".$row['limitation_id']."\"/>".$row['limitation_name']."</td>";
									
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
							
							$intake_services = array();
							$qry = "SELECT service_id FROM tie_service_intake WHERE intake_id=".$in['intake_id'];
							$res = SQLQuery($qry);
							while($row=mysql_fetch_assoc($res)){
								$intake_services[$row['service_id']]=true;
							}
						
							//services
							$qry="SELECT * FROM `dp_services` ORDER BY service_name ASC";
								$res = SQLQuery($qry);
								$rows = mysql_num_rows($res)/4;
								$count = 0;
								while($row=mysql_fetch_assoc($res)){
									if($count==0){
										echo "<tr>";
									}
									$checked = (isset($intake_services[$row['service_id']])) ? "checked='checked'" : ""; 
									echo "<td><input class='serviceOptions' type=checkbox  $checked value=\"".$row['service_id']."\"/>".$row['service_name']."</td>";
									
									if($count==3){echo "</tr>";}
									$count=($count+1)%4;
								}
								if($count>1){echo "</tr>";}
							
							
							
							echo "<tr>";
								echo "<td><b>Medications: </b> <textarea name='medications' style='height:50px;'>".$in['medications']."</textarea></td>";
								//swap this out in db
								echo "<td><b>Intake Notes: </b> <textarea name='intake_notes' style='height:50px;'>".$in['intake_notes']."</textarea></td>";
								echo "<td><b>Recommendation: </b> <textarea name='recommendation' style='height:50px;'>".$in['recommendation']."</textarea></td>";
								echo "<td><b>Follow Up: </b> <input type=text name='followup_date' class='date' value='".dateFormat($in['followup_date'])."' /><br/><textarea name='followup_notes' style='height:40px;'>".$in['followup_notes']."</textarea></td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td> </td>";
								echo "<td> </td>";
								echo "<td> </td>";
								echo "<td><button class='updateIntake'>Update Intake</button></td>";
							echo "</tr>";
						echo "</table>";
						
					echo "</div><br/>";
				}
			?>
		</div>
		
	</div>
	<div class="contentLook" id="information">
	 	<h1 style='margin-bottom:0px;'>Student </h1>
		<table border=0 valign=top style="align: left;border-spacing: 15px 10px;width: 100%;">
			<tr>
				<td><b>Name: </b><input type="text" size=10 name="firstname" value="<?php echo $info['firstname']; ?>" /> <input type="text" size=10 name="middlename" value="<?php echo $info['middlename']; ?>" /> <input type="text" size=10 name="lastname" value="<?php echo $info['lastname']; ?>" /></td>
				<td></td>
				<td></td>
				<td><b>University #</b><input type="text" size=9 name="univId" value="<?php echo $info['univId']; ?>" /></td>
			</tr>
			<tr>
			<td>
			<b>Race: </b><?php echo selectMenu(array("Unspecified"=>"Unspecified",
											"Asian"=>"Asian",
											"Black"=>"Black",
											"Latino"=>"Lation",
											"Other"=>"Other",
											"White"=>"White"),$info['race'],"name='race'")." ( <input type='checkbox' name='citizen' ".($info['citizen'] ? "checked=checked": "")."/> Citizen )"; ?>
			</td>
			<td>
			<b>Gender: </b>
			<?php echo selectMenu(array("Female"=>"Female","Male"=>"Male"),$info['gender'],"name='gender'"); ?>
			</td>
			<td>
			<b>Born: </b><input type="text" style="font-size: 13px;height: 16px;" size=10 name="dateOfBirth" class="date" value="<?php echo dateFormat($info['dateOfBirth']); ?>" />
			</td>
			
			<td>
			<b>Student Status: </b><?php echo selectMenu(array("End Service (SHRED)"=>"End Service (SHRED)",
															"Housing"=>"Housing",
															"Housing &amp; Accoms"=>"Housing &amp; Accoms",
															"Inactive"=>"Inactive",
															"Never used services"=>"Never used services",
															"New (1st Year)"=>"New (1st Year)",
															"Prospective"=>"Prospective",
															"Returning"=>"Returning",
															"Temporary"=>"Temporary",
															"Transfer (1st Semester)"=>"Transfer (1st Semester)",
															"Withdraw Notification"=>"Withdraw Notification"),$info['studentStatus'],"name='studentStatus'"); ?>
			</td>
			</tr>
			
			<tr>
				<td>
					<b>Student Type: </b><?php echo selectMenu(array("Active"=>"Active",
																	"Prospective"=>"Prospective",
																	"End Service(SHRED)"=>"End Service (SHRED)",
																	"Inactive"=>"Inactive"),$info['studentType'],"name='studentType'"); ?>
				</td>
				<td></td>
				<td></td>
				<td>
						<b>End Services on: </b><input type="text" style="font-size: 13px;height: 16px;" size=10 value="<?php echo dateFormat($info['endOfService']); ?>" name="endOfService" class="date" />
				</td>
			</tr>
			
			</table>
			<br/>
			
			<h1 style='margin-bottom:0px;'>School </h1>
			<table style="align: left;border-spacing: 15px 10px;width: 100%;">
			<tr>
				<td>
				<b>GPA: </b><input style="font-size: 13px;height: 16px;" size=3 type=text name=GPA value="<?php echo $info['GPA']; ?>" />
				</td>
				
				<td style="width:250px;">
					<b>Enrollment Status: </b> <?php echo selectMenu(array("Freshman"=>"Freshman",
																		   "Sophomore"=>"Sophomore",
																		   "Junior"=>"Junior",
																		   "Senior"=>"Senior",
																		   "Graduate"=>"Graduate"),$info['EnrollmentStatus'], "name='EnrollmentStatus'"); ?>
				</td>
				<td>
					<b>Credit Load: </b> <?php echo selectMenu(array("Full-Time"=>"Full-Time",
																	  "Part-Time"=>"Part-Time"),$info['creditLoad'],"name='creditLoad'"); ?>
				</td>
				<td>
					<b>College: </b> <?php echo selectMenu(specialArray("dp_colleges"),$info['college'], "name='college' style='width:200px;'"); ?>	
				</td>
			</tr>
			<tr>
				<td>
					<b>Major: </b> <?php echo selectMenu(specialArray("dp_majors"),$info['major'], "name='major' style='width:130px;'"); ?>	
				</td>
				<td>
					<b>Minor: </b> <?php echo selectMenu(specialArray("dp_majors"),$info['minor'], "name='minor' style='width:130px;'"); ?>	
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
					<b>Phone #: </b><input style="font-size: 13px;height: 16px;" size=13 type=text name=phoneNum value="<?php echo phoneFormat($info['phoneNum']); ?>" />
				</td>
				<td>
					<b>Email: </b><input style="font-size: 13px;height: 16px;" type=text name=email value="<?php echo $info['email']; ?>" />
				</td>
				
				<td>
					<b>Emergency Contact: </b><br/><input type=text size=9 name='emergencyFirst' value="<?php echo $info['emergencyFirst'] ?>" />
						<input type=text name='emergencyLast' size=9 value="<?php echo $info['emergencyLast']; ?>" /><br/>
						<input type=text name='emergencyRelation' size=9 value="<?php echo $info['emergencyRelation']; ?>" />
				</td>
				<td>
					<b>Emergency&#39;s Phone #: </b><input type=text name='emergencyPhoneNum' value="<?php echo phoneFormat($info['emergencyPhoneNum']); ?>" />
				</td>
			</tr>
			<tr>
				<td>
					<b>Local Address: </b><br/>
						<input type=text name=locStAddress value="<?php echo $info['locStAddress']; ?>" /><br/>
						<input type=text name=locStAddress2 value="<?php echo $info['locStAddress2']; ?>" /><br/>
						<input type=text name=locCity value="<?php echo $info['locCity']; ?>" /><br/>
						<input type=text name=locZip size=5 value="<?php echo $info['locZip']; ?>" /> <input type=text name=locState size=2 value="<?php echo $info['locState']; ?>" /><br/>
						<input type=text name=locCountry value="<?php echo $info['locCountry']; ?>" />
				</td>
				<td>
					<b>Permanent Address: </b><br/>
						<input type=text name=permStAddress value="<?php echo $info['permStAddress']; ?>" /><br/>
						<input type=text name=permStAddress2 value="<?php echo $info['permStAddress2']; ?>" /><br/>
						<input type=text name=permCity value="<?php echo $info['permCity']; ?>" /><br/>
						<input type=text name=permZip size=5 value="<?php echo $info['permZip']; ?>" /> <input type=text name=permState size=2 value="<?php echo $info['permState']; ?>" /><br/>
						<input type=text name=permCountry value="<?php echo $info['permCountry']; ?>" />
				</td>
				<td style="width:280px;">
					<input type=checkbox name='ok2sendConfMessage' <?php echo ($info['ok2sendConfMessage']?"checked=checked": ""); ?> /><b>OK to Send Confidential Messages</b><br/>
					<input type=checkbox name='ok2leaveConfMessage' <?php echo ($info['ok2leaveConfMessage']?"checked=checked": ""); ?> /><b>OK to Leave Confidential Messages</b><br/>
					<input type=checkbox name='ferpaOnFile' <?php echo ($info['ferpaOnFile']?"checked=checked": ""); ?> /><b>FERPA On File </b><br/>
					<input type=checkbox name='veteran' <?php echo ($info['veteran']?"checked=checked": ""); ?> /><b>Veteran Of United States </b><br/>
					
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					
				</td>
			</tr>
		</table>
		<br/>
		
		<b>Notes: </b> <textarea style="height:80px;width:500px;margin-right:30px;" name=notes><?php echo $info['notes']; ?></textarea>
		<button style="margin-top:50px;float:right;margin-right:20px;" class="updateStudent">Update Student Information</button>				
	
	</div>
<?php } ?>


<div style='width:100%;margin-top:15px;text-align:center;color:#CCC;font-weight:normal;'>Copyright &copy; <a style='font-weight:normal;color:#C0C0C0;' href='http://www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div></body>
</html>
