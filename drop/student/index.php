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
if($_SESSION['CREATES_STUDENT']){	
	if(isset($_GET['update'])){
		$d = clean($_POST);
			//unset them, so they don't interfer in loop
			unset($d['lastUpdate']);
			$dateOfBirth = SQLDate($d['dateOfBirth']);
				unset($d['dateOfBirth']);
			if($d['citizen']!='1'){$d['citizen']=0;}
			if($d['ferpaOnFile']!='1'){$d['ferpaOnFile']=0;}
			if($d['veteran']!='1'){$d['veteran']=0;}
			if($d['ok2leaveConfMessage']!='1'){$d['ok2leaveConfMessage']=0;}
			if($d['ok2sendConfMessage']!='1'){$d['ok2sendConfMessage']=0;}
			
			
		$set="";
		$comma = "";
		foreach($d as $k=>$v){
			$set .= $comma.$k."='".$v."'";
			$comma = ",";
		}
		$qry = "UPDATE dp_student SET ".$set.",dateOfBirth=$dateOfBirth,lastUpdate=NOW() WHERE id=".$d['id'];
		$res = mysql_query($qry);
		//echo $qry;
		history($d['id'],"updated student");
		logThat("updated student");
	}
	
	if(isset($_GET['new'])){
		$d = clean($_POST);
			//unset them, so they don't interfer in loop
			unset($d['lastUpdate']);
			$dateOfBirth = SQLDate($d['dateOfBirth']);
				unset($d['dateOfBirth']);
			$endOfService = SQLDate($d['endOfService']);
				unset($d['endOfService']);
			if($d['citizen']!='1'){$d['citizen']=0;}
			if($d['ferpaOnFile']!='1'){$d['ferpaOnFile']=0;}
			if($d['veteran']!='1'){$d['veteran']=0;}
			if($d['ok2leaveConfMessage']!='1'){$d['ok2leaveConfMessage']=0;}
			if($d['ok2sendConfMessage']!='1'){$d['ok2sendConfMessage']=0;}
			
			
		$comma = "";
		$columns = "";
		$values = "";
		foreach($d as $col=>$val){
			$columns.=$comma.$col;
			$values .=$comma."'".$val."'";
			$comma = ",";
		}
		$qry = "INSERT INTO dp_student($columns,dateOfBirth,endOfService,lastUpdate) VALUES($values,$dateOfBirth,$endOfService,NOW())";
		$res = mysql_query($qry);
		logThat("created student");
	}

}	
	mysql_close($link);
	
?>