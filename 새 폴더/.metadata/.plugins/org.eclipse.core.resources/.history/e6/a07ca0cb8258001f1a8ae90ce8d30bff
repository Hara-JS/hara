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
		String[] name = {"김철수", "이만수", "최영희", "박준범"};
		int[] score = {87, 100, 42, 98};
		
		session.setAttribute("name", name);
		session.setAttribute("score", score);
		
		// session에 저장된 데이터가 5초간 유지 후, 삭제된다.
		session.setMaxInactiveInterval(5);
		
		response.sendRedirect("_06_setTimePro.jsp");
	%>
</body>
</html>


