<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		프로그램 내내 사용될 변수들은 미리
		index.jsp 페이지에서 session에 저장해 놓는다.
	--%>
	
	<%
		int max = 5;
		int count = 0;

		int[] list = new int[max];
		
		session.setAttribute("max", max);
		session.setAttribute("count", count);
		session.setAttribute("list", list);
	%>
	
	<h1>CRUD</h1>
	<a href="01_list.jsp">전체목록 확인하기</a>
</body>
</html>