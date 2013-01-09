<?php require('../auth.php');
	error_reporting(-1);
	require('../config.php');
	require('../util.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	
	$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);
	$db = mysql_select_db(DB_DATABASE);
	
if($_SESSION['CREATES_INTAKE']){	
	if(isset($_GET['update'])){
		$d = clean($_POST);
			$student_id = $d['student_id'];
			$id = $d['intake_id'];
			$docDate = SQLDate($d['docDate']);
			$docExp = SQLDate($d['docExp']);
			$followup_date = SQLDate($d['followup_date']);			
			$services = isset($d['services']) ? $d['services']:null;
			$limitations = isset($d['limitations']) ? $d['limitations'] : null;
		
			//unset them, so they don't interfer in loop
			unset($d['student_id']);
			unset($d['intake_id']);
			unset($d['docDate']);
			unset($d['docExp']);
			unset($d['followup_date']);
			unset($d['services']);
			unset($d['limitations']);
			
			
		$set="";
		$comma = "";
		foreach($d as $k=>$v){
			$set .= $comma.$k."='".$v."'";
			$comma = ",";
		}
		$qry = "UPDATE dp_intake SET ".$set.",docDate=$docDate,docExp=$docExp,followup_date=$followup_date WHERE intake_id=$id AND student_id=$student_id";
		$res = mysql_query($qry);
		
		//update the class & exam accoms databases
		
		if($limitations != null){
			$qry="DELETE FROM tie_limitation_intake WHERE intake_id=$id";
			$res = mysql_query($qry);
			
			$qry="INSERT INTO tie_limitation_intake(intake_id,limitation_id) VALUES ";
			$comma = "";
			foreach($limitations as $k){
				$qry.=$comma."($id,$k)";
				$comma=",";
			}
			$res = mysql_query($qry);
		}
		if($services != null){
			$qry="DELETE FROM tie_service_intake WHERE intake_id=$id";
			$res = mysql_query($qry);
			
			$qry="INSERT INTO tie_service_intake(intake_id,service_id) VALUES ";
			$comma = "";
			foreach($services as $k){
				$qry.=$comma."($id,$k)";
				$comma=",";
			}
			$res = mysql_query($qry);
		}
		logThat("updated intake");
		history($student_id,"updated intake");
	}
	
	if(isset($_GET['new'])){
		$d = clean($_POST);
			$docDate = SQLDate($d['docDate']);
			$docExp = SQLDate($d['docExp']);
			$followup_date = SQLDate($d['followup_date']);
			$services = isset($d['services']) ? $d['services']:null;
			$limitations = isset($d['limitations']) ? $d['limitations'] : null;
		
			//unset them, so they don't interfer in loop
			unset($d['docDate']);
			unset($d['docExp']);
			unset($d['followup_date']);
			unset($d['services']);
			unset($d['limitations']);	
			
		//get the next auto_increment
		$result = mysql_query("SHOW TABLE STATUS LIKE 'dp_intake'");
		$row = mysql_fetch_assoc($result);
		$intake_id = $row['Auto_increment'];//the next one that is
		mysql_free_result($result);		
			$d['intake_id']=$intake_id;
			
		$comma = "";
		$columns = "";
		$values = "";
		foreach($d as $col=>$val){
			$columns.=$comma.$col;
			$values .=$comma."'".$val."'";
			$comma = ",";
		}
		
		$qry = "INSERT INTO dp_intake($columns,docDate,docExp,followup_date,intake_date,member_id) VALUES($values,$docDate,$docExp,$followup_date,NOW(),".$_SESSION['MEMBER_ID'].")";
		$res = mysql_query($qry);
		
		if($services != null){
			$qry="INSERT INTO tie_service_intake(intake_id,service_id) VALUES ";
			$comma = "";
			foreach($services as $k){
				$qry.=$comma."($intake_id,$k)";
				$comma=",";
			}
			$res = mysql_query($qry);
		}
		if($limitations != null){
			$qry="INSERT INTO tie_limitation_intake (intake_id,limitation_id) VALUES ";
			$comma = "";
			foreach($limitations as $k){
				$qry.=$comma."($intake_id,$k)";
				$comma=",";
			}
			$res = mysql_query($qry);
		}
		logThat("created intake");
	}

}
		
	mysql_close($link);
	
?>