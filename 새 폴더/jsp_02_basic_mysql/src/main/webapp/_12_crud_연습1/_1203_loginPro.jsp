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
		
	
	 --%>


	 <%
	 	String id = request.getParameter("memberId");
	 	String pw = request.getParameter("memberPw");
	 %>
	 
	<h1>이곳은 loginPro 입니다.</h1>
	<%=id %>
	<%=pw %>
	
	<a href="_1203_loginMember.jsp">되돌아가기</a>
</body>
</html>