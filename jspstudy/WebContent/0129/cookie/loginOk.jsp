<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String id,pw;
%>
<%
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	
	if(id.equals("abcde") && pw.equals("12345")){
		Cookie cookie = new Cookie("id","pw");
		cookie.setMaxAge(60*5);
		response.addCookie(cookie);
		response.sendRedirect("welcome.jsp");
	}else{
		response.sendRedirect("logintest.html");
	}
%>


</body>
</html>