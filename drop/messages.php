<?php
	require_once('auth.php');
	require_once('util.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	if(isset($_POST['getData'])){//try and make this a persistant connection to speed up things. 
		//Include database connection details
		require_once('config.php');
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
		$sql="SELECT firstname,lastname,message,posted FROM messages NATURAL JOIN members WHERE posted>=DATE_SUB(NOW(), INTERVAL 3 DAY) ORDER BY posted desc";
		$results=mysql_query($sql,$link) or die("Error In Process");
		while ($row = mysql_fetch_array($results, MYSQL_ASSOC)) {
			printf("<p><span style='color:#cccccc'>%s</span> <span style='color:#0073EA;'>%s %s  </span>%s</p>", date('h:i A',strtotime($row['posted'])),$row["firstname"], $row["lastname"],$row['message']);
		}	
		mysql_close($link);
		
	}
	
	//add data to the database
	if(isset($_POST['add'])){
		$d=array(
			//message_id is auto_increment
			'member_id'=>$_SESSION['MEMBER_ID'],
			'message'=>$_POST['add']
		);
		
		//clean the $d array here...
		$d=STD_HTML($d);
	
		if(strlen(trim($d['message']))>0){
			//Include database connection details
			require_once('config.php');
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
	
			$sql = "INSERT INTO messages(";
			$options="";
			$values="";
			$comma="";
			foreach($d as $key => $value){
				$options.=$comma.sanitize($key);
				$values.=$comma."'".sanitize($value)."'";
				$comma=" ,";
			}
			$sql=$sql.$options.") VALUES (".$values.");";
			//echo $sql."<br/><br/>";
			$results=mysql_query($sql,$link);
	
			mysql_close($link);
		}
	}
	
	if(isset($_POST['time'])){
		//Include database connection details
		require_once('config.php');
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
		
		//do the last hour, or get everything past the last message (which could even be your own)
		if(!isset($_SESSION['lastMessage'])){
			$sql="SELECT firstname,lastname,message,posted FROM messages NATURAL JOIN members ORDER BY posted desc LIMIT 1";
			$results=mysql_query($sql,$link) or die("Error In Message Start Process");
			while ($row = mysql_fetch_array($results, MYSQL_ASSOC)) {
				$_SESSION['lastMessage'] = sanitize($row['message']);
				printf("<p><span style='color:#cccccc'>%s</span> <span style='color:#0073EA;'>%s %s </span>%s (last message)</p>", date('h:i A',strtotime($row['posted'])),$row["firstname"], $row["lastname"],$row["message"]);
			}
			
		}
		if(isset($_SESSION['lastMessage'])){
			$sql="SELECT firstname,lastname,message,posted FROM messages NATURAL JOIN members WHERE posted>(SELECT posted FROM messages WHERE message='".$_SESSION['lastMessage']."' ORDER BY posted desc LIMIT 1) ORDER BY posted desc";
			$results=mysql_query($sql,$link) or die("");//for some reason this die's on the first message call
			while ($row = mysql_fetch_array($results, MYSQL_ASSOC)) {
				printf("<p><span style='color:#cccccc'>%s</span> <span style='color:#0073EA;'>%s %s </span>%s</p>", date('h:i A',strtotime($row['posted'])),$row["firstname"], $row["lastname"],$row['message']);
				$_SESSION['lastMessage']=sanitize($row['message']);
			}			
		}
		mysql_close($link);
	}
?>

