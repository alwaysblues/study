<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션은 내장객체여서 객체생성 없이 쓰면 된다.
	session.setAttribute("mySessionName", "mySessionData");
	session.setAttribute("myNum", 12345);
%>
<a href="getsession.jsp">get session</a>
</body>
</html>