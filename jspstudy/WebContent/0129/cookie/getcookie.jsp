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
	Cookie[] cookies = request.getCookies();

	for(Cookie cookie: cookies){ // cookies에서 순서대로 cookie 객체로 꺼내온다. (꺼내올 것의 변수,객체형 : 가져올 객체)
		String str = cookie.getName();
		if(str.equals("cookieN")){
			out.println("cookie name : " +  cookie.getName()+ "<br>");
			out.println("cookie value : " +  cookie.getValue()+ "<br>");
			out.println("<br>");
			
		}
		
	}


%>
<a href="delcookie.jsp">del cookie</a>
</body>
</html>