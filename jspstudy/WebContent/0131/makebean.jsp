<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="student" class="ex.jspbean.Student" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:setProperty property="name" value="홍길동" name="student"/>
<jsp:setProperty property="age" value="13" name="student"/>
<jsp:setProperty property="grade" value="6" name="student"/>
<jsp:setProperty property="studentNum" value="7" name="student"/>

<%-- <jsp:forward page="useobject.jsp"/> --%>

<a href="useobject.jsp">go useobject</a><br>
<a href="useobject2.jsp">go useobject2</a>
</body>
</html>