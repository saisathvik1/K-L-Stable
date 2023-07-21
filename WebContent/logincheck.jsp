<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
	<% 
		String uname1=request.getParameter("uname");
		String pwd1=request.getParameter("pwd");
		String cmd="select * from register where uname=? and pwd=?";
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","261261");
			PreparedStatement ps=con.prepareStatement(cmd);
			ps.setString(1,uname1);
			ps.setString(2,pwd1);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				//out.println("Success");
				response.sendRedirect("parking.html");
			}
			else{
				//out.println("failure");
				response.sendRedirect("Invalid.html");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	%>
</body>
</html>