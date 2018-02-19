<%@page import="ex.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="ex.member.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<%
	MemberDAO dao = MemberDAO.getInstance();
	if(dao.checkId(vo.getId()) == MemberDAO.MEMBER_EXISTENT) {
%>

<script language="javascript">
	arlet("아이디가 이미 존재합니다.");
	histor.back();
	
// 	histor.go(-2);  <-- 두번째 뒤로 보낼때 이런식으로 사용
</script>

<%
} else {
	
	int ri = dao.insertMember(vo);
	if(ri== MemberDAO.MEMBER_JOIN_SUCCESS){
		session.setAttribute("id", vo.getId());
%>

<script language="javascript">
	alert("회원가입을 축하드립니다.");
	document.location.href="login.jsp";
</script>

<%	
	} else {
%>

<script language="javascript">

	alert("회원가입에 실패하였습니다.");
	history.back();
	
</script>


<%		
	}
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