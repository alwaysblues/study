<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
	String result;
	String massage;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	
	result = (String)session.getAttribute("result");
	out.print(result);
	if(result!=null){
		if(result.equals("false")){
			massage = "회원탈퇴를 위해 비밀번호 입력해주세요.";
		} else {
			massage = "비밀번호가 틀립니다. 다시 확인해주세요.";
		}
	} else {
		massage = "회원탈퇴를 위해 비밀번호 입력해주세요.";
	}
%>
<%=massage %>
<form action="DeleteOk" method="post">
	<input type="hidden" name="id" value="<%=session.getAttribute("id") %>">
	<input type="password" name="pw" size="10"><br/>
	<input type="submit" size="5">
</form>


</body>
</html>