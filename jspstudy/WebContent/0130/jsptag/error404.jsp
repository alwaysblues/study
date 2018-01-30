<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--     에러페이지인거 아니까 그냥 진행하라는 의미 -->
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
404에러입니다.<br>
<%= exception.getMessage() %>
</body>
</html>