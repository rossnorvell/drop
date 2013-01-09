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

	if(isset($_GET['general']) && $_SESSION['STATS_PANEL']){
		$d = clean($_POST);
		$temp = $d['want'];
		$cols = array();
		foreach($temp as $k => $v){
			$cols[] = $k;
		}
		
		$in = makeList($cols);
		$like="";
		$where = $d['include'];
		$or = "";
		$hasWhere = false;
		foreach($where as $k => $v){
			if($v != ""){
				$hasWhere = true;
				$like =  $like. $or. " $k LIKE '%$v%' ";			
				$or = " OR "; 
			}
		}
		if($hasWhere){
		$qry = "SELECT $in FROM dp_student WHERE $like";
		}else{
			$qry = "SELECT $in FROM dp_student ";
		}
		$res = SQLQuery($qry);
		$html = "";
		$html = $html . "<tr>";
			foreach($cols as $column){
				$html = $html . "<th align=left >".$column."</th>";
			}
		$html = $html . "</tr>";
		while($row = mysql_fetch_assoc($res)){
			$html = $html . "<tr>";
				foreach($cols as $column){
					$html = $html . "<td>".$row[$column]."</td>";
				}
			$html = $html . "</tr>";
		}
		echo "<table border=0 style='width:100%' halign=left >$html</table>";
	}

	
	mysql_close($link);
	
?>