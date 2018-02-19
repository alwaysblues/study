
<%@page import="ex.member.MemberVO"%>
<%@page import="ex.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("UTF-8");
MemberDAO dao = MemberDAO.getInstance();
String id = session.getAttribute("id").toString();
String pw = session.getAttribute("pw").toString();
MemberVO vo = dao.selectUser(id,pw);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	if(document.modify_form.pw.value == null){
		alert("비밀번호를 확인해주세요");
	} else {
		document.modify_form.submit();
	}
</script>
</head>
<body>

<form action="modifyaction.jsp" method="post" name="modify_form">
	id		:	<input type="text" id="id" name="id" size="20" value="<%= vo.getId() %>"><br>
	pw		:	<input type="password" id="pw" name="pw" size="20"><br>
	name	:	<input type="text" id="name" name="name" size="20" value="<%= vo.getName() %>"><br>
	email	:	<input type="text" name="email" size="20" value="<%= vo.getEmail() %>"><br>
	address	:	<input type="text" name="address" size="20" value="<%= vo.getAddress() %>">
				<input type="button" onclick="modify_check();" value="수정하기">
</form>

</body>
</html>