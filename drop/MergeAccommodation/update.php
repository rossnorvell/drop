<?php
	error_reporting(0);
	require_once("../auth.php");
	require('../config.php');
	require('../util.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	
	$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);
	$db = mysql_select_db(DB_DATABASE);
	
	
	if(isset($_SESSION['EDIT_CONFIGS'])){
		if(isset($_GET['update_merge'])){
			$d = clean($_POST);
			print_r($d);
			$qry ="UPDATE dp_configs SET dept_name='".$d['name']."', location='".$d['location']."',merge_text='".$d['text']."', phone_num='".$d['phone']."', email='".$d['email']."' LIMIT 1";
			echo $qry;
			SQLQuery($qry);
		}
	}
	
	
?>