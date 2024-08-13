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
		// form태그에서 method속성 값을 post로 할 경우,
		// 아래와 같이 인코딩 처리를 반드시 해야 한다.
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
	%>
	<h2>name = <%= name %></h2>
</body>
</html>





