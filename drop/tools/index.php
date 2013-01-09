<?php require('../auth.php');
	require('../util.php');
	require('../config.php');
	function pretty_print($good,$bad,$result){
		echo ($result ? "<span style='color:green'>$good</span>" : "<span style='color:red'>$bad</span>")."<br/>";
	}
	
	if(isset($_GET['clean'])){
		echo "Started Cleaning....<br/>";
		
		//delete messages
		$qry = "SELECT count(*) as total FROM messages";
		$res = SQLQuery($qry);
		while($row = mysql_fetch_assoc($res)){
			echo $row['total']." Messages Found.<br/>";
		}
		$qry = "DELETE FROM messages WHERE 1";
		$res = SQLQuery($qry);
		echo "Deleted Messages Found.<br/>";
		
		//SELECT * FROM dp_student WHERE lastUpdate<ADDDATE(CURDATE(), INTERVAL -5 YEAR)
		$qry = "SELECT COUNT(*) as total FROM dp_student WHERE lastUpdate<ADDDATE(CURDATE(), INTERVAL -5 YEAR)";
		$res = SQLQuery($qry);
		while($row = mysql_fetch_assoc($res)){
			echo $row['total']." Expired Students Found.<br/>";
		}
		//go through & delete all information associated with them.. intake, contact, accommodations, (maybe) dp_history
		$qry = "SELECT * FROM dp_student WHERE lastUpdate<ADDDATE(CURDATE(), INTERVAL -5 YEAR)";
		$res = SQLQuery($qry);
		while($student = mysql_fetch_assoc($res)){
			$name = $student['firstname']." ".$student['lastname'];
			//delete all contacts
			$del_qry = "DELETE FROM dp_contact WHERE student_id=".$student['id'];
			pretty_print("Successfully Deleted $name&#39's Contacts",
						"Unsuccessfully Deleted $name&#39's Contacts",
							SQLQuery($del_qry));
			//DELETE ALL ASSOCIATED ACCOMMODATIONS
			$fetch="SELECT * FROM dp_accommodations WHERE student_id=".$student['id'];
			$accoms = SQLQuery($fetch);
			while($accom = mysql_fetch_assoc($accoms)){
				$id = $accom['accommodation_id'];
				$q = "DELETE FROM tie_class_accoms WHERE accommodation_id=$id";
				SQLQuery($q);
				$q = "DELETE FROM tie_exam_accoms WHERE accommodation_id=$id";
				SQLQuery($q);
			}
			$del_qry = "DELETE FROM dp_accommodations WHERE student_id=".$student['id'];
			pretty_print("Successfully Deleted $name&#39's Accommodations",
						"Unsuccessfully Deleted $name&#39's Accommodations",
							SQLQuery($del_qry));
			//DELETE ALL ASSOCIATED INTAKES
			$fetch="SELECT * FROM dp_intake WHERE student_id=".$student['id'];
			$intakes = SQLQuery($fetch);
			while($intake = mysql_fetch_assoc($intakes)){
				$id = $intake['intake_id'];
				$q = "DELETE FROM tie_service_intake WHERE intake_id=$id";
				SQLQuery($q);
				$q = "DELETE FROM tie_limitation_intake WHERE intake_id=$id";
				SQLQuery($q);
			}
			$del_qry = "DELETE FROM dp_intake WHERE student_id=".$student['id'];
			pretty_print("Successfully Deleted $name&#39's Intakes",
						"Unsuccessfully Deleted $name&#39's Intakes",
							SQLQuery($del_qry));
			
			//finally delete the student
			$del_qry = "DELETE FROM dp_student WHERE id=".$student['id'];
			pretty_print("<b>Successfully Deleted $name (ignore any red associated with student)</b>",
						"<b>Unsuccessfully Deleted $name!</b>",
							SQLQuery($del_qry));
		}
		//do the phone# fix after this though
		echo "<br/>Clean Complete";
		log("cleaned drop");
	}
	
	
?>