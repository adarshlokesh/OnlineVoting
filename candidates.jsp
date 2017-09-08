<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  include file="first.html"  %>   
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

	    function OneRadio() {
	        if ($('input[type=radio]:checked').size() > 0){
	        	return true;
	        }
	        
	        else{
		    	alert("Please check a Radio Button");
		    	return false;
		    }
	    }
	   
	window.location.hash="no-back-button";
	window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
	window.onhashchange=function(){window.location.hash="no-back-button";}

  //function preventBack(){window.history.forward();}
  //setTimeout("preventBack()",0);
  //window.onunload=function(){null};
</script>
</head>
<body>
<form name="remove" id="check" action="Validate" method="post">
<input type="hidden" name="fromwhere" value="remove">
<center>
<table id="section" border="1">
<tr>
			<th>Candidate id</th>
			<th>Candidate Name</th>
			<th>Select</th>
		
</tr>
		
<%
Integer vid=(Integer)session.getAttribute("vid1");
System.out.println(vid);
int count = 0;
int bid=0;
//String qry = "select * from voters where vid="+vid;
//String qry1= "select c.cid,v.name from candidates c,voters v where c.vid=v.vid and v.bid=?";
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","admin");
	//PreparedStatement stat = con.prepareStatement(qry);
	//stat.setInt(1, usn);
	CallableStatement cs = con.prepareCall("{call getBid(?,?)}");
	int vts;
	cs.registerOutParameter(2,java.sql.Types.INTEGER);
	cs.setInt(1,vid);
	cs.execute();
	vts = cs.getInt(2);
	/*if(rs.next()){
		bid=rs.getInt("bid");
	}*/
	System.out.println("vts:"+vts);
	PreparedStatement stat1 = con.prepareStatement("select c.cid,v.name from candidates c,voters v where c.vid=v.vid and v.bid="+vts);
	//stat.setInt(1, bid);
	ResultSet rs1 = stat1.executeQuery();
	while(rs1.next()){
		
%>



<tr>
			<td><%= rs1.getInt("cid")%></td>
			<td><%= rs1.getString("name")%></td>
			<td><input type="radio" id="remember" name="cid" value="<%= rs1.getInt("cid")%>"></td>
		
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
<input type="submit" value="Submit" style="font-size:20px; width:150px; height:30px;" onclick="return OneRadio()"></input>
</center>
</form>
</body>
</html>