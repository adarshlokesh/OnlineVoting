<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  include file="admintask.jsp"  %>   
       <%@ page import="java.sql.*" %>
        <%ResultSet rs =null;%>
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
	margin-top: 30px;
	font-size:25px;
	}
</style>
<script>

	window.location.hash="no-back-button";
	window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
	window.onhashchange=function(){window.location.hash="no-back-button";}

  //function preventBack(){window.history.forward();}
  //setTimeout("preventBack()",0);
  //window.onunload=function(){null};
</script>
</head>
<body>
<form name="results" id="check" action="Validate" method="post">
<input type="hidden" name="fromwhere" value="result">
<center>
<table id="section" border="1">
<tr>
			<th>Voter id</th>
			<th>Name</th>
			<th>AdharNo</th>
			<th>BID</th>
		
</tr>
		
<%
Integer aid=(Integer)session.getAttribute("aid");
System.out.println(aid);
//int count = 0;
//int bid=0;
String qry = "select * from canview where bid in(select bid from admin where aid="+aid+")";

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","admin");
	PreparedStatement stat = con.prepareStatement(qry);
	
	rs = stat.executeQuery();
	
	while(rs.next()){
		
%>



<tr>
			<td><%= rs.getInt("cid")%></td>
			<td><%= rs.getString("name")%></td>
			<td><%= rs.getInt("vid")%></td>
			<td><%= rs.getInt("bid")%></td>
			
		
</tr>
        <% } %>

<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
</table>


<br><br>
</center>
</form>
</body>
</html>