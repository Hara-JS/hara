<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>5초 뒤에 F5를 눌러보세요!</h2>
	<hr>
	<%
		String[] name = (String[])session.getAttribute("name");
		int[] score = (int[])session.getAttribute("score");
	%>
	
	<% if(name != null && score != null) { %>
		<% for(int i=0; i<name.length; i++) { %>
				<%= name[i] %>, <%= score[i] %>
		<% } %>	
	<% } %>
</body>
</html>

