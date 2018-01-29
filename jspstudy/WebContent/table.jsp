<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>HTML공부</h1>
	<h2>HTML TABLE 공부</h1>
	<h3>HTML TABLE TR</h1>


	<table border="1">
		<tr>
<!-- 			colspan(행병합) -->
			<td colspan="3">3 X 3</td>		
		</tr>
		<tr>
			<th>첫번째</th>
			<th>두번째</th>
			<th>세번째</th>
		</tr>
		<tr>
<!-- 			rowspan(열병합) 사용시 합병하는것을 개수로 포함하여 다른 행의 td 개수를 맞추어야 한다 -->
			<td rowspan="3">11</td>
			<td>12</td>
			<td>12</td>
		</tr>
		<tr>
<!-- 			<td>21</td> -->
			<td>22</td>
			<td>23</td>
		</tr>
		<tr>
<!-- 			<td>31</td> -->
			<td>32</td>
			<td>33</td>
		</tr>
	</table>
<!--  
	<ul>
		<li>1</li>
		<li>2</li>
		<li>3</li>
	</ul>
-->	

<table border="1">
	<tr>
		<td colspan="5">구구단</td>
	</tr>

<%
		int i = 0;
		int j = 0;
		for(i=2;i<10;i++){
%>		

	<tr>
		<td colspan="5" ><%= i%>단</td>
	</tr>

<% 
			for(j=1;j<10;j++){
%>

	<tr>
		<td><%= i %></td>
		<td>*</td>
		<td><%= j %></td>
		<td>=</td>
		<td><%= i*j %></td><br>
	</td>	
			
<%
			}
		}
%>
</table>




</body>
</html>