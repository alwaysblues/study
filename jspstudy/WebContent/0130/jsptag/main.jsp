<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>main.jsp</h1>

<!-- 	include와 다른점은 주소가 변하지 않고 해당 페이지로 전송한다 
		뒤로가기 허용하지 않는다. -->
<jsp:forward page="sub.jsp">
	<jsp:param name="id" value="abc"/>
	<jsp:param name="pw" value="123"/>
</jsp:forward>

</body>
</html>