<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>5초 위에 F5를 누르면 다 사라짐</h1>

	<%
		String[] name = (String[]) session.getAttribute("name");
		int[] score = (int[]) session.getAttribute("score");
	%>

	<% 	if (name != null && score != null) { %>
		<%	for (int i = 0; i < name.length; i++) { %>
			<%=name[i]%>, <%=score[i]%>,
		<% } %>
	<% } %>
	
</body>
</html>

