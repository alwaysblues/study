<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<%!
// 선언
	int i = 10;
	String str = "ABCD";
%>
<%!
	public int sum(int a, int b){
	return a+b;
}
%>    

<%
	out.println("i = " + i + "<br>");
	out.println("str = " + str + "<br>");
	out.println("sum(5+3) = " + sum(5,3) + "<br>");
	
%>

i = <%=i %> <br>
str = <%=str %><br>
sum(5+3) = <%=sum(5,3)%>

<table border=2>
<tr>
	<td>i</td>
	<td>str</td>
	<td>sum</td>
</tr>
<tr>
	<td><%=i %></td>
	<td><%=str %></td>
	<td><%=sum(5,3)%></td>
</tr>
</table>



<!-- 

<%
// 스크립트릿 표현식
	int i = 0;
	while(true){
		i++;
		out.println("2 * " + i + " = " + (2*i) + "<br>");
	
%>
======================<br>
<%
	if(i >= 9) break;
	}
%>


 -->




</body>
</html>