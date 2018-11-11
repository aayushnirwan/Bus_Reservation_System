<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
background-color: #B85EF5;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
    text-align= center;
    border-spacing: 5px;
    background-color: #C9D7DC  ;
}
th, td {
    padding: 15px;
    
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/Booking";%>
   <%!String USER = "root";%>
   <%!String PASS = "";%>
   <%!Connection con = null;%>
   <%
   Statement stmt=null;
   ResultSet rs=null;

		try
		{
		   Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt=con.createStatement();
		 if(session.getAttribute("Type") == null||session.getAttribute("Type").equals(0))
			response.sendRedirect("Login.jsp");
		stmt=con.createStatement();
        String sql="SELECT * FROM `buses`";
        rs=stmt.executeQuery(sql);
  %>
  <h1>Welcome Admin</h1>
 	<center><h2>Buses Running Now..</h2></center>
     <table style="width:100%">
    
        <tr>
        <th>Bus Id</th>
        <th>From</th>
        <th>To</th>
        <th>Seats</th>
        <th>Fare</th>
        </tr>
        
        <%
     while(rs.next()) {
     String bf = rs.getString("busfrom");
     String bt = rs.getString("busto");
     int seat = rs.getInt("seats");
     int fare = rs.getInt("fare");
     int bid = rs.getInt("id");
     
     out.println("<td>" + bid+ "</td>");
     out.println("<td>" + bf+ "</td>");
     out.println("<td>" + bt+ "</td>");
     out.println("<td>" + seat+ "</td>");
     out.println("<td>" + fare+ "</td></tr>");
   
     }
		%>
		</table>
		<br>
		<center><h1>Add Buses</h1>
		<form action="AddBus.jsp" method="post">
		BusId :  <input type="text" name="busid" >
		From :   <input type="text" name="from" >
		To :     <input type="text" name="to" >
		Seats :  <input type="text" name="seats" >
		Fare :   <input type="text" name="fare" ><br><br>
		<input type="submit" value="Add Bus"/></form><br><br>
		<form action="Logout.jsp">
		<input type="submit" value="Logout"/></form></center>
		
		<%}catch(Exception e)
		{
			//e.printStackTrace();
			out.println(e);
		}
		finally
		{
			try{
			stmt.close();
			con.close();
			}catch(Exception e)
			{
				//e.printStackTrace();
				out.println(e);
			}
		}
   %>
</body>
</html>