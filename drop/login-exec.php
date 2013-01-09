<?php session_start();
	//session_cache_expire(60);//1 hour
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	
	//Include database connection details
	require_once('config.php');
	
	//Array to store validation errors
	$errmsg_arr = array();
	
	//Validation error flag
	$errflag = false;
	
	//Connect to mysql server
	$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);
	if(!$link) {
		die('Failed to connect to server: ' . mysql_error());
	}
	
	//Select database
	$db = mysql_select_db(DB_DATABASE);
	if(!$db) {
		die("Unable to select database");
	}
	
	//Function to sanitize values received from the form. Prevents SQL injection
	function clean($str) {
		$str = @trim($str);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		return mysql_real_escape_string($str);
	}
	
	//Sanitize the POST values
	$login = clean($_POST['login']);
	$password = clean($_POST['password']);
	
	//Input Validations
	if($login == '') {
		$errmsg_arr[] = 'Login ID missing';
		$errflag = true;
	}
	if($password == '') {
		$errmsg_arr[] = 'Password missing';
		$errflag = true;
	}
	
	//If there are input validations, redirect back to the login form
	if($errflag) {
		$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
		session_write_close();
		header("location: index.php");
		exit();
	}
	
	//Create query
	$qry="SELECT *
			FROM `members`
			NATURAL JOIN `group`
			WHERE login = '$login' AND passwd='".md5($_POST['password'])."'";
	$result=mysql_query($qry);
	
	//Check whether the query was successful or not
	if($result) {
			//Login Successful
			session_regenerate_id();
			while ($member = mysql_fetch_array($result, MYSQL_ASSOC)) {
				//these are going to be the same throughout...
				$_SESSION['MEMBER_ID'] = $member['member_id'];
				$_SESSION['GROUP_ID'] = $member['group_id'];
				
				$_SESSION['CREATES_ACCOMS'] = $member['createAccoms'];
				$_SESSION['CREATES_CONTACT'] = $member['createContact'];
				$_SESSION['CREATES_INTAKE'] = $member['createIntake'];
				$_SESSION['CREATES_STUDENT'] = $member['createStudent'];
				$_SESSION['CAN_VIEW'] = $member['canView'];
				$_SESSION['DELETES_ACCOMS'] = $member['deleteAccoms'];
				$_SESSION['DELETES_CONTACT'] = $member['deleteContact'];
				$_SESSION['DELETES_INTAKE'] = $member['deleteIntake'];
				$_SESSION['DELETES_STUDENT'] = $member['deleteStudent'];
				$_SESSION['ADMIN_PANEL'] = $member['adminPanel'];
					$_SESSION['EDIT_USER'] = $member['editUser'];
					$_SESSION['ADD_USER'] = $member['addUser'];
					$_SESSION['EDIT_GROUP'] = $member['editGroup'];
					$_SESSION['ADD_GROUP'] = $member['addGroup'];
					$_SESSION['CLEAN_DROP'] = $member['springCleaning'];
					$_SESSION['EDIT_CONFIGS'] = $member['editConfigs'];	
					$_SESSION['ALTER_FORMS'] = $member['alterForms'];
				$_SESSION['STATS_PANEL'] = $member['statisticsPanel'];				
				
				$_SESSION['FIRST_NAME'] = $member['firstname'];
				$_SESSION['LAST_NAME'] = $member['lastname'];
			}
			$_SESSION['notification']="";//for now, we'll make it so messages appear also.
			session_write_close();
			header("location: home.php");
			exit();			
		}
	else {
		//Login failed
		header("location: login-failed.php");
		exit();
	}
?>
