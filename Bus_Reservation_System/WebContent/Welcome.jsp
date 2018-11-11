<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {background-color: #13C6FF;}
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
<title><%= session.getAttribute("Name")  %></title>
</head>
<body>
		<% 
		if(session.getAttribute("Type")==null||session.getAttribute("Type").equals(1))
			response.sendRedirect("Login.jsp");
		 String name = session.getAttribute("Name").toString();
		 out.println("<h2>Welcome " + name + "</h2>");
		%>
		
		  <center><h2>Your Previous Bookings</h2></center>
   <%@ page import ="java.util.*,java.sql.*,java.io.*"%>
   <%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/Booking";%>
   <%!String USER = "root";%>
   <%!String PASS = "";%>
   <%!Connection con = null;%>
   <%
      Statement stmt = null;
      ResultSet rs=null;


      try
      {
         Class.forName(JDBC_DRIVER);
         con=DriverManager.getConnection(DB_URL,USER,PASS);
         stmt=con.createStatement();
         String sql="SELECT * FROM `history` where `usr` = '"+ name + "'";
         rs=stmt.executeQuery(sql);
   %>
  
      <table style="width:100%">
     
         <tr>
         <th>Date</th>
         <th>Bus Id</th>
         <th>From</th>
         <th>To</th>
         <th>Seats</th>
         <th>Total Fare</th>
         </tr>
         
         <%
      while(rs.next()) {
      String bf = rs.getString("bf");
      String bt = rs.getString("bt");
      int seat = rs.getInt("seats");
      int fare = rs.getInt("fare");
      int bid = rs.getInt("bid");
      String date = rs.getString("date");%>
      <tr>
      <% 
      out.println("<td>" + date+ "</td>");
      out.println("<td>" + bid+ "</td>");
      out.println("<td>" + bf+ "</td>");
      out.println("<td>" + bt+ "</td>");
      out.println("<td>" + seat+ "</td>");
      out.println("<td>" + fare+ "</td>");
      %>
      </tr>
      <%
   }
      }catch(Exception e)
         {
            e.printStackTrace();
         }
         finally
         {
            try{
               rs.close();
               stmt.close();
               con.close();
            }catch(Exception e){}
         }
         %>
        </table>
		<br><br>
		
		<center><h2>Book a Bus</h2>
		<form action="check.jsp" method="post">
		
		From  : <input type="text" name="from">
		To    : <input type="text" name="to">
		Seats : <input type="text" name="seats">
		Date  : <input type="text" name="date"><br><br>
		
		<input type="submit" value="Check Availability"/></form><br>
		<form action="Logout.jsp">
		<input type="submit" value="Logout"/></form>
		</center>
</body>
</html>