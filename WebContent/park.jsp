<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Parking</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.io.*" %>
	<% 
		String type=request.getParameter("type");
		String sid=request.getParameter("id_no");
		String vehicle_no=request.getParameter("vehicle_no");
		String slot=request.getParameter("slot");
		//String check="select type from parking where sid='no' and slot=?";
		String update = "insert into parking values(?,?,?,?)";
		try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","261261");
				//PreparedStatement ps= con.prepareStatement(check);
				//ps.setString(1,slot);
				PreparedStatement stmt = con.prepareStatement(update);
				stmt.setString(1,sid);
				stmt.setString(2,type);
				stmt.setString(3,vehicle_no);
				stmt.setString(4,slot);
				stmt.executeUpdate();
				response.sendRedirect("success.html");
			}	
				
				
			catch(Exception e)
			{
				response.sendRedirect("fail.html");
			}
		
	
	%>
</body>
</html>