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
		$name = $d['name'];
		$perms = $d['perms'];
		
		$cols = "";
		$vals = "";
		$comma = "";
		foreach($perms as $v){
			$cols.=$comma.$v;
			$vals.=$comma."'1'";
			$comma = ",";
		}
		$qry = "INSERT INTO `group` ($cols,name) VALUES($vals,'$name')";
		echo $qry;
		$res = mysql_query($qry);
	}
	if(isset($_GET['update'])){
		$d = clean($_POST);
		$group = $d['group'];
		$perms = $d['perms'];
		
		$columns = array();
		$qry = "SHOW COLUMNS FROM `group`";
		$res = mysql_query($qry);
		while($row = mysql_fetch_assoc($res)){
			$columns[$row['Field']] = 0;
		}
		unset($columns['name']);
		unset($columns['group_id']);
		$set="";
		$comma = "";
		foreach($columns as $k=>$v){
			$set .= $comma.$k."=0";
			$comma = ",";
		}
		$qry = "UPDATE `group` SET $set WHERE group_id=$group LIMIT 1";//make everything 0 
		$res = mysql_query($qry);
		
		$set="";
		$comma = "";
		foreach($perms as $k){
			$set .= $comma.$k."='1'";
			$comma = ",";
		}
		$qry = "UPDATE `group` SET $set WHERE group_id=$group LIMIT 1";
		$res = mysql_query($qry);
	}
	
	mysql_close($link);
	
?>