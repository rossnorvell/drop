<?php require_once('auth.php');
		require_once('config.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	function copyright(){
		echo "<div style='width:100%;margin-top:15px;text-align:center;color:#CCC;font-weight:normal;'>Copyright &copy; <a style='font-weight:normal;color:#C0C0C0;' href='http://www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div>";
	}	
		
	//oh? I'm sorry does your cleaner function no handle array's? Mine does.
	function STD_HTML($in){
		$res=$in;		
		if(is_array($res)){
			foreach($res as $k=>$v){
				$res[$k]=STD_HTML($v);	
			}
			return $res;
		}
		else{
			$res = trim($res);//front & back whitespace
			$res = preg_replace('/\s\s+/', ' ', $res);//trim out "     a lot    of spacing" to "a lot of spacing"
			//if server add by default
			if (get_magic_quotes_gpc()) {
				$res = stripslashes($res);
			}
			$res = nl2br(htmlspecialchars($res));//don't do this the other way around...
			//$res = mysql_real_escape_string($res);//this throws a shit fit...idk why yet.
		  return $res;
		}
	}
	function Connect(){
		$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);
		$db = mysql_select_db(DB_DATABASE);
	}
	function Disconnect(){mysql_close();}
	
	function SQLQuery($qry,$close=false){
		$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);
		$db = mysql_select_db(DB_DATABASE);
		$res = mysql_query($qry);
			if($close){mysql_close($link);}
		return $res;
	}	
	function logThat($message){
		$qry = "INSERT INTO dp_log(memember_id, message) VALUES(".$_SESSION['MEMBER_ID'].",'".clean($message)."')";
		return SQLQuery($qry,true);
	}
	function history($student_id, $message){
		$qry = "INSERT INTO dp_history(student_id,memember_id, message) VALUES(".clean($student_id).",".$_SESSION['MEMBER_ID'].",'".clean($message)."')";
		return SQLQuery($qry,true);
	}
	function clean($something) {
		$s = $something;
		if(is_array($s)){
			foreach($s as $k=>$v){
				$s[$k]=clean($v);
			}
		   return $s;
		}else{		
			if(get_magic_quotes_gpc()) {
				$s = stripslashes($s);
			}
			//this needs an sql connection to be present
			return mysql_real_escape_string($s);
		}
	}
	function SQLDate($s){
		return "'".date("Y-m-d",strtotime($s))."'";
	}
	
	function selectMenu($options, $selected="", $extra=""){
		$res ="<select $extra>";
		foreach($options as $index => $value){
			$res.="<option ".($selected==$index ? "selected=selected":"")." value=\"$index\">$value</option>";
		}
		$res .="</select>";
	  return $res;
	}
	function tableArray($table, $val, $text){
		$tbl = array();
		$qry = "SELECT $val,$text FROM ".$table." ORDER BY $text ASC";
		$res = SQLQuery($qry);
		while($row = mysql_fetch_assoc($res)){
			$tbl[$row[$val]]=$row[$text];
		}
	  return $tbl;
	}
	//used in the select menu list
	function specialArray($table,$col="name"){
		$special = array();
		$qry = "SELECT * FROM ".$table." ORDER BY $col ASC";
		$res = SQLQuery($qry);
		$special['Other'] = "Other";
		while($row = mysql_fetch_assoc($res)){
			$val = str_replace("&","&amp;",$row[$col]);
			$special[$val]=$val;
		}
	  return $special;
	}
	function mirrorKeys($r){
		$res = array();
		foreach($r as $k){
			$res[$k]=$k;
		}
	  return $res;
	}
	
	function phoneFormat($num){
		$bad = array(".","(",")","-"," ");
		$phone = str_replace($bad,"",$num);
		$goodNum = substr($phone,0,3).".".substr($phone,3,3).".".substr($phone,6,7);
		return $goodNum;
	}
	function dateFormat($d){
		return date("m/d/Y",strtotime($d));
	}
	//makes an array a list like "hi, there, my name is, Ross"
	function makeList($aray, $rev=false){
		$res="";
		$commaTrick=" ";
		$temp = "";
		foreach($aray as $k => $v){
			if($rev){
				$temp = $k;
			}else{
				$temp = $v;
			}			
			$res=$res.($commaTrick.$temp);
			$commaTrick=", ";
		}
		return $res;
	}
	
	function isDateBetween($dt_start, $dt_check, $dt_end){ 
	  if(strtotime($dt_check) > strtotime($dt_start) && strtotime($dt_check) < strtotime($dt_end)){ 
		return true; 
	  } 
	  return false; 
	}
	
?>
