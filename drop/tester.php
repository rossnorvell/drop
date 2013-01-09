<?php
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
		Actually a test function at this point...
	*/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Tester</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="content">
	
	<?php 
		// Select a,b,c, ... x 
		//	FROM table/(select query)
		
		// Could you parse out a,b,c? I say yes. 
		function pretty_name($s){
			return preg_replace("/[^A-Za-z0-9_ ()]/","",$s);
		}
		function html_from_sql($qry){
			$qry = trim($qry);
			$html="<form method='post' action='query.php' >\n<table border=0 >\n";
			$matches = array();
			$pattern = "/^(SELECT)(.+)(FROM)/si";
			preg_match($pattern,$qry, $matches);
			$param = preg_replace("/FROM/i","",preg_replace("/SELECT/i","",trim($matches[0])));
			$params = explode(",",$param);
			
			foreach ($params as $key => $value) {
				$params[$key] = trim($value);
			}
			
			//now map the nice name to the actual name
			$map = array();
			foreach ($params as $value) {
				$temp = preg_split("/[\s]+as[\s]+/i",$value);//something      as      somethingelse
				if( count($temp) < 2){ // no ' as ' in there, just a regular table name
					$temp = array($value,$value);
				}
				$map[pretty_name($temp[1])]=$temp[0];//[First Name]=>firstname
			}
			//build up the inputs
			foreach($map as $nice => $table){
				$html=$html."<tr><td><b>$nice</b> = </td><td><input type='text' name='$table' /></td></tr>\n";
			}
			$html=$html."<tr><td></td><td><input style='float:right;' type=submit value='Run Query' /></td>";
			$html=$html."\n</table></form>\n";
			return $html;
		}
		//specify parameters (for all things selected)
		
		$qry=(" SELECT firstname     as      \"First Name\", lastname as Last , SUM(intake_id) AS \"Total Sum\"  
FROM (
dp_student
NATURAL JOIN dp_intake
) GROUP BY FIRSTNAME,LASTNAME");//special exception for *? & WHERE IF NO GROUP BY  , HAVING IF GROUP BY 
		echo $qry;
		
		echo "<br/><br/><em>Produces: </em><br/>";
		echo "<br/>";
		echo html_from_sql($qry);
	?>
	
</div>
<div style='width:100%;margin-top:15px;text-align:center;color:#CCC;font-weight:normal;'>Copyright &copy; <a style='font-weight:normal;color:#C0C0C0;' href='http://www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div></body>
</html>
