<?php require('../auth.php');
	require('../config.php');
	require('../util.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	
	$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);
	$db = mysql_select_db(DB_DATABASE);
	
if($_SESSION['CREATES_ACCOMS']){
	if(isset($_GET['update'])){
		$d = clean($_POST);
			$id = $d['accommodation_id'];
			$accom_date = SQLDate($d['accom_date']);
			$student_id = $d['student_id'];
			$classAccoms = $d['classAccoms'];
			$classAccoms_extra = $d['classAccoms_extra'];
			$examAccoms = $d['examAccoms'];
			$examAccoms_extra = $d['examAccoms_extra'];
		
			//unset them, so they don't interfer in loop
			unset($d['accommodation_id']);
			unset($d['accom_date']);
			unset($d['student_id']);
			unset($d['classAccoms']);
			unset($d['examAccoms']);	
			unset($d['classAccoms_extra']);
			unset($d['examAccoms_extra']);			
			
		$set="";
		$comma = "";
		foreach($d as $k=>$v){
			$set .= $comma.$k."='".$v."'";
			$comma = ",";
		}
		$qry = "UPDATE dp_accommodations SET ".$set.",accom_date='$accom_date' WHERE accommodation_id=$id AND student_id=$student_id";
		$res = mysql_query($qry);
		
		//update the class & exam accoms databases
		
		if($examAccoms != null){
			$qry="DELETE FROM tie_exam_accoms WHERE accommodation_id=$id";
			$res = mysql_query($qry);
			
			$qry="INSERT INTO tie_exam_accoms(accommodation_id,exam_accom_id,specifically) VALUES ";
			$comma = "";
			foreach($examAccoms as $k){
				$qry.=$comma."($id,$k,'".$examAccoms_extra[$k]."')";
				$comma=",";
			}
			$res = mysql_query($qry);
		}
		if($classAccoms != null){
			$qry="DELETE FROM tie_class_accoms WHERE accommodation_id=$id";
			$res = mysql_query($qry);
			
			$qry="INSERT INTO tie_class_accoms(accommodation_id,class_accom_id,specifically) VALUES ";
			$comma = "";
			foreach($classAccoms as $k){
				$qry.=$comma."($id,$k,'".$classAccoms_extra[$k]."')";
				$comma=",";
			}
			$res = mysql_query($qry);
		}
		
	   logThat("updated accommodation");
	}
	
	if(isset($_GET['new'])){
		$d = clean($_POST);
			$accom_date = SQLDate($d['accom_date']);
			$classAccoms = $d['classAccoms'];
			$classAccoms_extra = $d['classAccoms_extra'];
			$examAccoms = $d['examAccoms'];
			$examAccoms_extra = $d['examAccoms_extra'];
			
			//unset them, so they don't interfer in loop
			unset($d['accom_date']);
			unset($d['classAccoms']);
			unset($d['classAccoms_extra']);
			unset($d['examAccoms']);			
			unset($d['examAccoms_extra']);
			
		
		//possible many class accoms being created..., crn, course, room_loc, prof, section
		$course = $d['course'];
		$crn = $d['crn'];
		$room_loc = $d['room_loc'];
		$prof = $d['prof'];
		$section = $d['section'];
		unset( $d['course']) ;
		unset($d['crn']);
		unset($d['room_loc']);
		unset($d['prof']);
		unset($d['section']);
		print_r($course);
	
		for($i=0;$i<count($course);++$i){
			//get the next auto_increment
			$result = mysql_query("SHOW TABLE STATUS LIKE 'dp_accommodations'");
			$row = mysql_fetch_assoc($result);
			$accommodation_id = $row['Auto_increment'];//the next one that is
			mysql_free_result($result);
			//for the extra accoms + checkboxes later
			$d['accommodation_id']=$accommodation_id;
		
			$comma = "";
			$columns = "";
			$values = "";
			foreach($d as $col=>$val){
				$columns.=$comma.$col;
				$values .=$comma."'".$val."'";
				$comma = ",";
			}
			$qry = "INSERT INTO dp_accommodations($columns,course,crn,room_loc,prof,section,accom_date) VALUES($values,'".$course[$i]."','".$crn[$i]."','".$room_loc[$i]."','".$prof[$i]."','".$section[$i]."',$accom_date)";
			echo $qry;
			$res = mysql_query($qry);
			
			//update the class & exam accoms databases
			if($examAccoms != null){
				$qry="INSERT INTO tie_exam_accoms(accommodation_id,exam_accom_id, specifically) VALUES ";
				$comma = "";
				foreach($examAccoms as $k){
					$qry.=$comma."($accommodation_id,$k,'".$examAccoms_extra[$k]."')";
					$comma=",";
				}
				echo $qry;
				$res = mysql_query($qry);
			}
			if($classAccoms != null){
				$qry="INSERT INTO tie_class_accoms(accommodation_id,class_accom_id, specifically) VALUES ";
				$comma = "";
				foreach($classAccoms as $k){
					$qry.=$comma."($accommodation_id,$k,'".$classAccoms_extra[$k]."')";
					$comma=",";
				}
				$res = mysql_query($qry);
			}
			//logThat("created accommodation");
		}
	}

}	
		
		
	mysql_close($link);
	
?>