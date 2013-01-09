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
		//update the limitations part on intake
		if(isset($_GET['update_lims'])){
			$d = clean($_POST);
			$name = $d['name'];
			$opt = $d['opt'];
			$qry = "UPDATE dp_limitations SET limitation_name='$name' WHERE limitation_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		//delete limitations part on intake
		if(isset($_GET['delete_lims'])){
			$d = clean($_POST);
			$opt = $d['opt'];
			$qry = "DELETE FROM dp_limitations WHERE limitation_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		
		//add limitations part on intake
		if(isset($_GET['add_lims'])){
			$d = clean($_POST);
			$name = $d['name'];
			$qry = "INSERT INTO dp_limitations(limitation_name) VALUES('$name')";
			SQLQuery($qry);
		}
		
		//update the limitations part on intake
		if(isset($_GET['update_serv'])){
			$d = clean($_POST);
			$name = $d['name'];
			$opt = $d['opt'];
			$qry = "UPDATE dp_services SET service_name='$name' WHERE service_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		//delete limitations part on intake
		if(isset($_GET['delete_serv'])){
			$d = clean($_POST);
			$opt = $d['opt'];
			$qry = "DELETE FROM dp_services WHERE service_id=$opt LIMIT 1";
			SQLQuery($qry);
		}
		
		//add limitations part on intake
		if(isset($_GET['add_serv'])){
			$d = clean($_POST);
			$name = $d['name'];
			$qry = "INSERT INTO dp_services(service_name) VALUES('$name')";
			SQLQuery($qry);
		}
	}
	
		
	mysql_close($link);
	
?>