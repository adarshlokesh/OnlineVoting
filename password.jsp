<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="first.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body{
	background-image: url("BOOK.jpg");
	height: 70%;
	}
#section{
	float: left;
	font-size: 30px;
	margin-left:40px;
	padding-top: 50px;
}

</style>
<script type="text/javascript">
function validateLogin(){
	document.getElementById("usererror").innerHTML="";
	
	var username = document.forms["password"]["password"].value;
	
	if(username==null || username==""){		
		document.getElementById("usererror").innerHTML="Password Required";
		
		return false;
	}
	
	
}
</script>
</head>
<body>
<form name="password" action="Validate" method="post">
<input type="hidden" name="fromwhere" value="password">
<div id="section">
<table>
<br>
<br>
<tr>Enter the password <input type="password" name="password" style="font-size: 20px;"></input></tr>
<div id="usererror" style="color: red"></div>
<br>
<br>

<br>
<tr><input type="submit" value="LOGIN" style="font-size:20px; width:150px; height:30px;" onclick="return validateLogin()"></input></tr>
<br><br>
</table>
</div>
</form>
</body>
</html>