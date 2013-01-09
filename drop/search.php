<?php require_once('auth.php');
	  require_once('util.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	$students = array();	
	$noDups = array();
	$terms = sanitize($_GET['term']);
	$terms = explode(" ",preg_replace("[ -]","",$terms));
	foreach($terms as $term){
		$term = "%".$term."%";
		$qry="SELECT id,firstname,middlename,lastname,univId FROM `dp_student` WHERE (firstname LIKE '$term' OR lastname LIKE '$term' OR univId LIKE '$term' ) ORDER BY lastname LIMIT 10";
		
		$res = SQLQuery($qry);	
		while($row=mysql_fetch_assoc($res)){
			$info = $row['firstname']." ".$row['middlename'].". ".$row['lastname']." - ".$row['univId'];
			$noDups[$info] = array(
				'label'=>$info,
				'value'=>$info,
				'id'=>$row['id']
				);			
		}
	}
	mysql_close();	
	foreach($noDups as $v){
		$students[] = $v;
	}
	echo json_encode($students);
?>