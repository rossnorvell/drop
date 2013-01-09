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

	if(isset($_GET['new'])){
		$d = clean($_POST);
		unset($d['cpassword']);
		$d['passwd']=md5($d['passwd']);
		
		$cols = "";
		$vals = "";
		$comma = "";
		foreach($d as $k=>$v){
			$cols.=$comma.$k;
			$vals.=$comma."'".$v."'";
			$comma = ",";
		}
		$qry = "INSERT INTO members($cols) VALUES($vals)";
		$res = mysql_query($qry);
	}
	if(isset($_GET['update'])){
		$d = clean($_POST);
		$id = $d['member_id'];
		unset($d['member_id']);	
		unset($d['undefined']);//bug in js
		
		$set="";
		$comma = "";
		foreach($d as $k=>$v){
			$set .= $comma.$k."='".$v."'";
			$comma = ",";
		}
		$qry = "UPDATE members SET $set WHERE member_id=$id LIMIT 1";
		$res = mysql_query($qry);
		echo $qry;
	}
	if(isset($_GET['delete'])){
		$d = clean($_POST);
		$id = $d['member_id'];
		unset($d['member_id']);	
		
		$set="";
		$comma = "";
		foreach($d as $k=>$v){
			$set .= $comma.$k."='".$v."'";
			$comma = ",";
		}
		$qry = "DELETE FROM members WHERE member_id=$id LIMIT 1";
		$res = mysql_query($qry);
	}
	
	mysql_close($link);
	
?>