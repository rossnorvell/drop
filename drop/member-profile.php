<?php
	require_once('auth.php');
	require_once('menu/functions.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Member Profile</title>
<link href="loginmodule.css" rel="stylesheet" type="text/css" />
	<?php getDockHeader($_SESSION['SESS_MEMBER_ID']);?>
</head>


<body>

<h1><?php echo $_SESSION['SESS_FIRST_NAME'];?>&#39;s Profile</h1>

<div id = "my_content">profile stuff...</div>

	<?php getDock($_SESSION['SESS_MEMBER_ID']);?>


<div style='width:100%;margin-top:15px;text-align:center;color:#CCC;font-weight:normal;'>Copyright &copy; <a style='font-weight:normal;color:#C0C0C0;' href='http://www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div></body>
</html>
