<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String name, id, pw, major, protocol;
	String[] hobbys;
	int i = 0;
%>

<%
 	request.setCharacterEncoding("UTF-8");
	
	name = request.getParameter("name");
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	major = request.getParameter("major");
	protocol = request.getParameter("protocol");
	
// 	String[] getParameterValues(String args)
	hobbys = request.getParameterValues("hobby");
%>

이름 : <%=name %><br>
아이디 : <%=id%><br>
비밀번호 : <%=pw%><br>
전공 : <%=major%><br>
프로토콜 : <%=protocol%><br>

<%
	String key; 
	Enumeration<String> params = request.getParameterNames(); // 파라미터값이 차례대로 입력됨 ["name","id","pw",hobby","major","protocol"]
	while(params.hasMoreElements()){
		key = params.nextElement();
		
		if(key.equals("hobby")){
			for (String item : hobbys){
				out.println(key + i + " : " + item + "<br>");
				i++;
			}
		}else{
			out.println(key + " : " + request.getParameter(key)+ "<br>");
		}
				
	}
	



%>

	


</body>
</html>