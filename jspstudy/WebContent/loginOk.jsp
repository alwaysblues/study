<%@page import="ex.member.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ex.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	MemberDAO dao = MemberDAO.getInstance();
	int checkNum = dao.userCheck(id,pw);
	MemberVO vo;
%>

<% if(checkNum == 0){ %>
<Script language="javascript">
	alert("비밀번호가 틀립니다.");
	history.back();
</Script>
<%	
	}else if (checkNum == 1){ 	
		out.println("select");
		session.setAttribute("VailiMem", "ok");
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		response.sendRedirect("main.jsp");
	} else { %>
<script language="javascript">
alert("존재하지 않는 아이디입니다.");
history.back();
</script>
<%	
	}
%>
	


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>