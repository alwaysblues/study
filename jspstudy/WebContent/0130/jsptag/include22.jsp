<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String id, pw;
%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
아이디는 <%= id %> 이고,<br>
비밀번호는 <%= pw %>

	<%@ include file="include11.jsp" %>