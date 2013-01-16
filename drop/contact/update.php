<?php require('../auth.php');
	require('../util.php');
	require('../config.php');
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
if($_SESSION['ALTER_FORMS']){
	$data = $_POST;
	if(isset($_GET['new_purpose'])){
		insert("dp_purpose",$data);
	}
	else if(isset($_GET['update_purpose'])){
		$id = $data['purpose_id'];
		unset($data['purpose_id']);
		update("dp_purpose",$data,"purpose_id=$id",1);
	}
	else if(isset($_GET['delete_purpose'])){
		$id = $data['purpose_id'];
		unset($data['purpose_id']);		
		delete("dp_purpose","purpose_id=$id" ,1);
	}
	else if(isset($_GET['delete_type'])){
		$id = $data['contact_type_id'];
		unset($data['contact_type_id']);		
		delete("dp_contact_type","contact_type_id=$id" ,1);
	}
	else if(isset($_GET['update_type'])){
		$id = $data['contact_type_id'];
		unset($data['contact_type_id']);		
		update("dp_contact_type",$data,"contact_type_id=$id" ,1);
	}
	else if(isset($_GET['new_type'])){insert("dp_contact_type",$data);}
	else{/* You didn't set the right thing.... */}
}
?>