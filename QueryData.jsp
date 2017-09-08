<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>


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

}

</style>
<script type="text/javascript">
</script>
</head>
<body>
<center>
<table  id="section" border="1">
<%


try
{
	String qry = request.getParameter("query");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","admin");
	PreparedStatement stat = con.prepareStatement(qry);
	if(qry.startsWith("select")){
	ResultSet rs = stat.executeQuery();
	 ResultSetMetaData rsMetaData = rs.getMetaData();

	    int numberOfColumns = rsMetaData.getColumnCount();
	   

	   

	      
	   
%>
	<tr>
<% 
for (int i = 1; i <= numberOfColumns; i++) {
    
    System.out.println("column:"+rsMetaData.getColumnName(i));

%>
	<th><%=rsMetaData.getColumnName(i) %></th>
	
<%
	    }
%>
	</tr>
<% 	    
	while(rs.next()){
	
%>
<tr>
<% 	    
	
		for (int i = 1; i <= numberOfColumns; i++) {
		System.out.println("value:"+rs.getObject(rsMetaData.getColumnName(i)));
%>
<td><%=rs.getObject(rsMetaData.getColumnName(i)) %></td>

<%} %>

</tr>

<%
		
		}
	}
	else{
		stat.executeUpdate();	
		%>
<b>Successfully Updated</b>		
<%	}
}
catch(Exception e){
%>
<div style="color: red">	
<b>SQL Exception</b>
</div>
<% 	System.out.println("Exception is "+e);
}
%>
</table>
</center>
</body>
</html>