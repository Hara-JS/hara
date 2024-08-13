<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	Object obj = session.getAttribute("name");
	String[] name = (String[]) obj;

	obj = session.getAttribute("score");
	int[] score = (int[]) obj;
	%>

	<%
	for (int i = 0; i < name.length; i++) {
	%>

	<%=name[i]%>

	<%
	}
	%>
	<hr>
	<%
	for (int i = 0; i < score.length; i++) {
	%>
	<%=score[i]%>

	<%
	}
	%>

</body>
</html>