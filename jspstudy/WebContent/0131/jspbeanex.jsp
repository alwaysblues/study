<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="ex.jspbean.Student" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 페이지에서 설정한 자바빈에 값을 넣을때 사용 
		name = jsp태그 usebean에 설정한 아이디값-->
<jsp:setProperty property="name" value="홍길동" name="student"/>
<jsp:setProperty property="age" value="13" name="student"/>
<jsp:setProperty property="grade" value="6" name="student"/>
<jsp:setProperty property="studentNum" value="7" name="student"/>

이름 : <jsp:getProperty property="name" name="student"/><br>
나이 : <jsp:getProperty property="age" name="student"/><br>
학년	: <jsp:getProperty property="grade" name="student"/><br>
번호 : <jsp:getProperty property="studentNum" name="student"/><br>


</body>
</html>