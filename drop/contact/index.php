<?php require('../auth.php');
	require('../util.php');
	require('../config.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
if($_SESSION['CREATES_CONTACT']){
	if(isset($_GET['new'])){
		Connect();
		$d = clean($_POST);
		$date = SQLDate($d['con_date']);
		unset($d['con_date']);
		unset($d['undefined']);
		print_r($d);
		$cols = "";
		$vals = "";
		$comma = "";
		foreach($d as $k => $v){
			$cols = $cols.$comma.$k;
			$vals = $vals.$comma."'".$v."'";			
			$comma = ", ";
		}
		$qry = "INSERT INTO dp_contact($cols,con_date,member_id) VALUES($vals,$date,".$_SESSION['MEMBER_ID'].")";
		
		echo $qry;
		$res  = SQLQuery($qry);
		logThat("created contact");
		Disconnect();
	}
	if(isset($_GET['update'])){
		Connect();		
		$d = clean($_POST);
		$date = SQLDate($d['con_date']);
		unset($d['con_date']);
		$qry = "update dp_contact set student_id='".$d['student_id']."',purpose_id='".$d['purpose_id']."',contact_type_id='".$d['contact_type_id']."',other='".$d['other']."',length='".$d['length']."',notes='".$d['notes']."',con_date=$date,member_id='".$_SESSION['MEMBER_ID']."' WHERE con_id=".$d['con_id']." LIMIT 1";
		echo $qry;
		$res  = SQLQuery($qry);
		logThat("contact updated");
		Disconnect();
	}
}
?>