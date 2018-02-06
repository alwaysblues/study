<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection con;
	Statement stmt;
	ResultSet resultSet;
	
	
	String driver = "com.mysql.jdbc.Driver";
	// 	server url / database
	String url = "jdbc:mysql://localhost:3306/jspdb";
	String uid = "root";
	String upw = "mysql";
	String sql = "Select * from NameCard";


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url,uid,upw);
		stmt = con.createStatement();
		resultSet = stmt.executeQuery(sql);
		
		while(resultSet.next()){
			String id = resultSet.getString("id");
			String name = resultSet.getString("name");
			String phone = resultSet.getString("phone");
			
			out.println("id:" + id + ", name: " + name + ", phone:" + phone);
			
		}
		
	} catch(Exception e) {
	 
		out.println(e.getMessage());
		
	} finally {
		
		try{
			if(resultSet != null) resultSet.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		
		}catch(Exception e){
			
		}
			
		
	}
	
%>
</body>
</html>