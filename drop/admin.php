<?php
	//require_once('auth.php');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="imagetoolbar" content="no" />
	<title>Home | DROP</title>
	<script type="text/javascript" src="./jquery/1.4/jquery.min.js"></script>
	<script>
		!window.jQuery && document.write('<script src="jquery-1.4.3.min.js"><\/script>');
	</script>
	<script type="text/javascript" src="./fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="./fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="./fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="style.css" />
	
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contact").fancybox({
				'titlePosition'	: 'inside',
				'overlayShow'	: true,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'
			});
			$("#addUser").fancybox({
				'titlePosition'	: 'inside',
				'overlayShow'	: true,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'
			});
			$("#accommodation").fancybox({
				'titlePosition'	: 'inside',
				'overlayShow'	: true,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'
			});
			$("#intake").fancybox({
				'titlePosition'	: 'inside',
				'overlayShow'	: true,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'
			});
			$("#notification").click(function() {
				//$("#notification").fadeOut("slow");
				$.ajax({
				  type: "POST",
				  url: "clear.php",
				  data: "clear=DoItJohn",
				  success: function(msg){$("#notification").fadeOut("slow");}
				});	
			});
			
		});
	</script>
		
</head>
<body>



<div id="content">
	<h1>drop <span>v1.0.1</span><span style="float:right;">Hey <?php echo $_SESSION['SESS_FIRST_NAME']; ?>! (<a style="color: #009ACD;" href="logout.php">not you?</a>)</span></h1>
	
	<hr />
		<div id="notification">		
			<?php //these will be notification of things done... 
				echo "<b>".$_SESSION['notification']."</b>";
			?>
		</div>

	<h3>
		Core Modules
	</h3>

	<ul>
	
	 <li>
		<a id="accommodation" href="#accommodation_content" title="<b>Accommodation Form</b>">
			<div style="text-align:center;width:120px;">
				<img src="images/aperture.png" alt="Accommodation form" border="0" /><br/>
				Accommodations
			</div>
		</a>
	  </li>
	
	  <li>
		<a id="contact" href="#contact_content" title="<b>Contact Form</b>">
			<div style="text-align:center;width:100px;">
				<img src="images/mail.png" alt="Contact form" border="0" /><br/>
				Contact Form
			</div>
		</a>
	  </li>
	  
	  <li>
		<a id="intake" href="#intake_content" title="<b>Intake Form</b>">
			<div style="text-align:center;width:100px;">
				<img src="images/article.png" alt="Intake form" border="0" /><br/>
				Intake Form
			</div>
		</a>
	  </li>
	  
	  <li>
		<a id="addUser" href="#addUser_content" title="<b>Add User</b>">
			<div style="text-align:center;width:100px;">
				<img src="images/user.png" alt="Student form" border="0" /><br/>
				Add User
			</div>
		</a>
	  </li>
	  
	  
	</ul>
	<div style="display: none;">
		<div id="contact_content" style="width:800px;height:450px;overflow:auto;">
			<?php include("Form_Contact/index.php"); ?>
		</div>
	</div>
	
	<div style="display: none;">
		<div id="addUser_content" style="width:400px;height:250px;overflow:auto;">
			<?php include("register-form.php"); ?>
		</div>
	</div>
	
	<div style="display: none;">
		<div id="accommodation_content" style="width:800px;height:450px;overflow:auto;">
			<p>Not implemented yet</p>
		</div>
	</div>
	
	<div style="display: none;">
		<div id="intake_content" style="width:800px;height:450px;overflow:auto;">
			<?php include("Form_Intake/index.php"); ?>
		</div>
	</div>

</div>
<div style='width:100%;margin-top:15px;text-align:center;color:#CCC;font-weight:normal;'>Copyright &copy; <a style='font-weight:normal;color:#C0C0C0;' href='http://www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div></body>
</html>
