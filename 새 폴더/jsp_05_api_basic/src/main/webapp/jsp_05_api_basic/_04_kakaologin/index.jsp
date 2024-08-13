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
		if(session.getAttribute("log") == null) {
	%>
		<button onclick="location.href='_sample_kakao.jsp'">로그인</button>
	<% } else { %>
		<button onclick="location.href='_sample_logout.jsp'">로그아웃</button>
	<% } %>
</body>	
</html>