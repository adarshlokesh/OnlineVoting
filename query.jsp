<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="admintask.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
	background-image: url("BOOK.jpg");
	height: 70%;
	background-position: left;
	}
#section{
	float: left;
	font-size: 30px;
	margin-left:40px;
	padding-top: 20px;
}
</style>
<script>
function getCustomers()
{
	 var str = document.forms["qry"]["id"].value;
	 
	 var xmlhttp;    
	 if (str=="")
	   {
	   document.getElementById("custData").innerHTML="";
	   return;
	   }
	 if (window.XMLHttpRequest)
	   {// code for IE7+, Firefox, Chrome, Opera, Safari
	   xmlhttp=new XMLHttpRequest();
	   }
	 else
	   {// code for IE6, IE5
	   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	   }
	 xmlhttp.onreadystatechange=function()
	   {
	   if (xmlhttp.readyState==4 && xmlhttp.status==200)
	     {
	     document.getElementById("custData").innerHTML=xmlhttp.responseText;
	     }
	   }
	 xmlhttp.open("GET","QueryData.jsp?query="+str,true);
	 xmlhttp.send();
}
</script>

</head>
<body>
<form id="section" name="qry">

Enter Query  <input type="text" name="id" style="font-size: 20px;width: 100%;"></input><br><br>
<input type="button" name ="Submit" value="Execute"  style="font-size: 20px;" onclick="getCustomers()"></input> 
<br><br>
<div id="custData"></div>
</form>
</body>
</html>