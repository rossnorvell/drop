<?php
	/*
		Copyright © Ross Norvell 2012
		All rights reserved.
		rnorvell.com
	*/
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>Login</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="style.css">
<style>
fieldset { border:1px solid #ccc;padding:10px; }

legend {
  padding: 5px 5px;
  border:1px solid #ccc;
  color:#ccc;
  font-size:90%;
  text-align:left;
  }
</style>

</HEAD>
<BODY> 

<div id="content">
	<h1>Hey There!</h1>
	<hr />

<FORM style="width:375px;" id=loginform method="post" action="login-exec.php">
<fieldset>
<legend>Login</legend>
<LABEL for=login><b>Username:</b></LABEL>
  <INPUT id=login type=text name=login> <br/>
  <LABEL for=password><b>Password:&nbsp;<b></LABEL>
  <INPUT id=password type=password name=password>
  <BUTTON name=submit style="float:right;" type=submit value="Submit"><STRONG>LOGIN</STRONG></BUTTON>
  </fieldset>
  </FORM>
</div>
<SCRIPT type=text/javascript>
var firstInput = document.getElementById("login");
firstInput.focus();
</SCRIPT>
<div style='width:100%;margin-top:10px;text-align:center;color:#CCC;'>Copyright &copy; <a style='color:#C0C0C0;' href='www.rnorvell.com'>Ross Norvell</a> 2012<br/>All rights reserved.</div>
</body></HTML>
