<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 페이지를 바로 이동할 때 response를 사용한다. --%>
	<h1>response</h1>
	
	<%
		System.out.println("response");
		response.sendRedirect("_04_responseNext.jsp");
	%>
</body>
</html>




