<%
	session.removeAttribute("Name");
	session.removeAttribute("Type");
	session.removeAttribute("Bus_ID");
	session.removeAttribute("SeatsU");
	session.removeAttribute("SeatsD");
	session.removeAttribute("bus_fr");
	session.removeAttribute("bus_to");
	session.removeAttribute("Date");
	session.removeAttribute("Total");
	response.sendRedirect("Login.jsp");
%>