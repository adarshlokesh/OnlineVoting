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
	background-position: left;
	}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 300px;
    background-color: #f1f1f1;
}

li a {
    display: block;
    color: #000;
    padding: 16px 0 16px 16px;
    text-decoration: none;
}
#list{
	float:left;
}

/* Change the link color on hover */
li a:hover {
    background-color: #555;
    color: white;
}

</style>
<script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}
//function preventBack(){window.history.forward();}
//  setTimeout("preventBack()", 0);
//  window.onunload=function(){null};
</script>

</head>
<body>
<form name="welcome">
<div id="list">
<ul>
  <li><a style="font-size:25px;" href="addcand.jsp">Add Candidate</a>
  <a style="font-size:25px;" href="adddetails.jsp">Add Voter</a>
  <a style="font-size:25px;" href="addvoter.jsp">Change Password</a>
  <a style="font-size:25px;" href="viewCandidates.jsp">View Candidates</a>
  <a style="font-size:25px;" href="viewvoter.jsp">View Voters</a>
  <a style="font-size:25px;" href="results.jsp">Results</a>
  <a style="font-size:25px;" href="query.jsp">Queries</a>
  <a style="font-size:25px;" href="login.jsp">Logout</a></li> 
</ul>
</div>
</form>
</body>
</html>