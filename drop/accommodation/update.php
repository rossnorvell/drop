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
	
	if($_SESSION['ALTER_FORMS']){
		//update the class part on accommodation
		if(isset($_GET['update_class'])){
			$d = clean($_POST);
			$name = $d['name'];
			$opt = $d['opt'];
			$qry = "UPDATE dp_class_accommodations SET class_option='$name' WHERE class_accom_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		//delete class part on accommodation
		if(isset($_GET['delete_class'])){
			$d = clean($_POST);
			$opt = $d['opt'];
			$qry = "DELETE FROM dp_class_accommodations WHERE class_accom_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		
		//add class part on accommodation
		if(isset($_GET['add_class'])){
			$d = clean($_POST);
			$name = $d['name'];
			$qry = "INSERT INTO dp_class_accommodations(class_option) VALUES('$name')";
			SQLQuery($qry);
		}
		
		//update the exam part on accommodation
		if(isset($_GET['update_exam'])){
			$d = clean($_POST);
			$name = $d['name'];
			$opt = $d['opt'];
			$qry = "UPDATE dp_exam_accommodations SET exam_option='$name' WHERE exam_accom_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		//delete exam part on accommodation
		if(isset($_GET['delete_exam'])){
			$d = clean($_POST);
			$opt = $d['opt'];
			$qry = "DELETE FROM dp_exam_accommodations WHERE exam_accom_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		
		//add exam part on accommodation
		if(isset($_GET['add_exam'])){
			$d = clean($_POST);
			$name = $d['name'];
			$qry = "INSERT INTO dp_exam_accommodations(exam_option) VALUES('$name')";
			SQLQuery($qry);
		}
	}
	
		
	mysql_close($link);
	
?>