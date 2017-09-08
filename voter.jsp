<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  include file="first.html"  %>    

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
	document.getElementById("passworderror").innerHTML="";
	var username = document.forms["loginpage1"]["VID"].value;
	var password = document.forms["loginpage1"]["Ano"].value;
	if(username==null || username==""){		
		document.getElementById("usererror").innerHTML="Voter ID Required";
		
		return false;
	}
	if(password==null || password==""){
		document.getElementById("passworderror").innerHTML="Aadhar Card No Required";
		return false;
	}
	
}
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}
<% session.invalidate();%>
//function preventBack(){window.history.forward();}
//setTimeout("preventBack()", 0);
//window.onunload=function(){null};
</script>
</head>
<body>
<form name="loginpage1" action="Validate" method="post">
<input type="hidden" name="fromwhere" value="loginpage1">
<div id="section">
<table>
<tr>Voter ID  <input type="text" name="VID" style="font-size: 20px;"></input></tr>
<div id="usererror" style="color: red"></div>
<br>
<tr>Aadhar Card No <input type="text" name="Ano" style="font-size: 20px;"></input></tr>
<div id="passworderror" style="color: red"></div>

<br>
<div id = "errordiv" align="left">
<%
if(request.getAttribute("message") != null){ 
%>

<font color="red">
<%=request.getAttribute("message") %>
</font>	
<%	
}
%>
</div>
<br>
<tr><input type="submit" value="LOGIN" style="font-size:20px; width:150px; height:30px;" onclick="return validateLogin()"></input></tr>
<br><br>
</table>
</div>
</form>
</body>
</html>