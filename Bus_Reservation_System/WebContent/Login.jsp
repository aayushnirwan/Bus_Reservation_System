<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Login</title></head>
<style>
body {
background-color: #F3F020;
}
</style>
<body>
	<br><br>
	<center><h1>Welcome to Kamlesh Bus Services</h1></center>
	
	<center><h2>Login</h2>
	<% 
	if(session.getAttribute("Type")==null);
	else if(session.getAttribute("Type").equals(0))
		response.sendRedirect("Welcome.jsp");
	else if(session.getAttribute("Type").equals(1))
		response.sendRedirect("Admin.jsp");
	%>
	<form action="process.jsp" method="post">
	Username  <input type="text" name="usr"/><br><br>
	Password  <input type="password" name="pwd"/><br><br>
	User  <input type="radio" value="0" name="type"/>
	Admin  <input type="radio" value="1" name="type"/><br><br>
	<input type="submit" value="Login"/></form></center>
</body>
</html>
