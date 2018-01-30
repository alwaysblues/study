<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 오류가 날 경우 보낼 페이지를 설정     -->
<%-- <%@ page errorPage="errorPage.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String id, pw;
%>
<%
	id = "testId";
	pw = "secret";
%>

	<jsp:forward page="include22.jsp">
		<jsp:param name="id" value="admin"/>
		<jsp:param name="pw" value="1q2q3q"/>
	</jsp:forward>
	
	
<%-- 	<jsp:include page="include11.jsp" flush="ture"> --%>

	<%@ include file="include11.jsp" %>

</body>
</html>