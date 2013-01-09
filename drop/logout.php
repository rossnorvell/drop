<?php session_start();
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
	//Unset the variables stored in session
	$_SESSION = array(); 	
	if (isset($_SESSION)){     
		unset($_SESSION);     
		session_destroy(); 
		
		$cookieParams = session_get_cookie_params();
		setcookie(session_name(), '', 1, $cookieParams['path'], $cookieParams['domain'], $cookieParams['secure'], $cookieParams['httponly']);
		session_unset();     
	}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Logged Out</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="content">

	<h1>Logged Out </h1>
	<hr />

	<h4 align="center" class="err">Congrats on that outstanding logout...wow!<br />
	  <br/>Try <a href="index.php" style="color:#0073EA;">logging in</a> &amp; trying it again. </h4>
</div>
<div style='width:100%;margin-top:15px;text-align:center;color:#CCC;font-weight:normal;'>Copyright &copy; <a style='font-weight:normal;color:#C0C0C0;' href='http://www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div></body>
</html>