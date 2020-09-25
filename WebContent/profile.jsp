<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.sql.SQLException,java.sql.Connection,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JDBC in JSP</title>
</head>
<body>
	<!-- THIS IS HOW WE USE JDBC IN JSP  -->
	<%
		String link="jdbc:mysql://localhost:3306/profilejsp";
		String user="root";
		String pass="toor";
	%>
	<%
		String sql="SELECT * FROM student WHERE id=?";
		Class.forName("com.mysql.jdbc.Driver");
		try(Connection conn=DriverManager.getConnection(link,user,pass)){
			PreparedStatement statement=conn.prepareStatement(sql);
			statement.setInt(1,21172);
			ResultSet result=statement.executeQuery();
			result.next();
				int id=result.getInt(1);
				int marks=result.getInt(2);
				String name=result.getString(3);
				out.println("ID:"+id);
				out.println("Marks:"+marks);
				out.println("Name:"+name);
					
		}catch(SQLException e){
			out.println(e.getMessage());
		}
		catch(Exception e){
			out.println(e.getMessage());
		}
	%>

</body>
</html>