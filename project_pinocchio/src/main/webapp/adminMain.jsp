<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hara</title>
</head>
<body>
	<%-- top --%>
	<jsp:include page="header.jsp" />
	
	<div align="center">
		<h1>관리자 페이지</h1>
		<a href="logoutPro.jsp">로그아웃</a><br>
		<a href="adminUserList.jsp">회원관리</a>
		<br><br>
		<input type="button" value="메인화면" onclick="location.href='main.jsp'">
	</div>
	
	<%-- bottom --%>
	<jsp:include page="footer.jsp" />
</body>
</html>