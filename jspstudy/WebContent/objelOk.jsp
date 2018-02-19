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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
id : <%=id %><br>
pw : <%=pw %><br>
<hr>
id : ${param.id }<br>
pw : ${param.pw}<br>
<hr>
id : ${param["id"] }<br>
pw : ${param["pw"] }<br>

<hr>
app : ${applicationScope.app_name}<br>
ses : ${sessionScope.ses_name}<br>
page : ${pageScope.page_name}<br>
request : ${requestScope.req_name}<br>

</body>
</html>