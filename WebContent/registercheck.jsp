
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DataBase Connectivity</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%@ page import = "java.io.*" %>
	<%@ page import="java.lang.*" %>
	<%
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String phno=request.getParameter("phno");
	String gen=request.getParameter("gender");
	String i=request.getParameter("id");
	int id=Integer.parseInt(i);
	try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","261261");
			PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?,?,?,?,?,?)");
			ps.setString(1,fname);
			ps.setString(2,lname);
			ps.setString(3,gen);
			ps.setString(4,email);
			ps.setString(5,phno);
			ps.setString(6,uname);
			ps.setString(7,pwd);
			ps.setInt(8,id);
			ps.executeUpdate();			
			con.close();
	}
	catch(Exception e)
	{		
		out.println(e);		
	}
	%>
	<jsp:forward page="Login.html"/>
	
</body>
</html>