<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sub.jsp</h1>
<%!
	String id, pw;
%>
<%
	id = request.getParameter("id");
	pw = request.getParameter("pw");
%>

아이디 : <%=id %> 입니다.<br>
비밀번호 : <%=pw%> 입니다.

</body>
</html>