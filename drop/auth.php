<?php session_start();
	error_reporting(E_ALL & ~E_DEPRECATED);

	//session_cache_expire(60);//1 hour
	
	
	//Function to sanitize values received from the form. Prevents SQL injection
	function sanitize($s) {
		$str = @trim($s);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		
		return preg_replace("[']","\'",$str);
	}
	
	
			
	//Check whether the session variable SESS_MEMBER_ID is present or not
	if(!isset($_SESSION['MEMBER_ID']) || (trim($_SESSION['MEMBER_ID']) == '')) {
		header("location: access-denied.php");
		exit();
	}
	
?>
