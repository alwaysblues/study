<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if(session.getAttribute("VailiMem") == null){
		response.sendRedirect("login.jsp");
	}
	
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> <%= name %>(<%= id %>님) 환영합니다.</h1>
<form action="logout.jsp" method="post">
	<input type="submit" value="logout">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" onclick="javascript:window.location='modifymember.jsp'" value="정보수정">
</form>
</body>
</html>