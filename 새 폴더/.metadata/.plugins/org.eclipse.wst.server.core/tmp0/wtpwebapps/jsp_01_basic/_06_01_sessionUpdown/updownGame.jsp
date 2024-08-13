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
		Object obj = null;
		
		obj = session.getAttribute("com");
		int com = (int)obj;
		
		obj = session.getAttribute("cheat");
		int cheat = (int)obj;
	%>
	<h1>업다운 게임</h1>
	<h5>1~100 사이의 랜덤 숫자 맞추기</h5>
	
	<% if(cheat == 0) { %>
		<button onclick="window.location.href='resultPro.jsp'">정답 확인</button>
	<% } else if(cheat == 1) { %>
		<%= com %>
	<% } %>	
	<form action="updownGamePro.jsp">
		<input type="text" name="me" value="0">
		<input type="submit" value="전송">
	</form>
	
</body>
</html>