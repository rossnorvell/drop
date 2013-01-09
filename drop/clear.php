<?php
	require_once('auth.php');
	if(isset($_POST['blargy'])){
		$_SESSION['notification'].="blargy ";
	}
	if(isset($_POST['clear'])){
		$_SESSION['notification']="";
	}
?>

