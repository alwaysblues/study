<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("id") != null){%>
<jsp:forward page="main.jsp"></jsp:forward>
<%} %>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="loginOk.jsp" method="post">
	id	:	<input type="text" name="id" size="20"><br>
	pw	:	<input type="text" name="pw" size="20">
			<input type="submit" value="로그인">
<!-- 			자바의 Objeft처럼 자바스크립트에는 document 위에 상위인 window가 존재  -->
			<input type="button" onclick="window.location='joinmember.jsp'" value="회원가입">

</form>
</body>
</html>