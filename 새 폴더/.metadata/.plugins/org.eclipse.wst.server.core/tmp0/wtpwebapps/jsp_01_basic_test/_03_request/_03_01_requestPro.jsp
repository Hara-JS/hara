<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 폼에서 데이터를 처리
	데이터 가져오는 법 request.getParameter("name") --%>
	<%
	String strAge = request.getParameter("age");

	int age = Integer.parseInt(strAge);
	%>

	당신의 나이 :
	<%=age%>
	세 입니다.
	
</body>
</html>

