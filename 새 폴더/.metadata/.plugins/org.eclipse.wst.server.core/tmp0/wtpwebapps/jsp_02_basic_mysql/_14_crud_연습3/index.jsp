<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>메인 페이지</h1>
		
		<table border="1">
			<tr>			
				<% String log = (String)session.getAttribute("log"); %>
				<%	if(log == null) {	%>
						<td ><a href="joinForm.jsp">회원가입</a></td>
						<td ><a href="loginForm.jsp">로그인</a></td>
						<td ><a href="adminLoginForm.jsp">관리자</a></td>
				<%	} else {	%>
						<td> <%=log %> 님 로그인중 </td>
						<td ><a href="logoutPro.jsp">로그아웃</a></td>
						<td ><a href="updateForm.jsp">회원정보수정</a></td>
						<td ><a href="deleteForm.jsp">회원탈퇴</a></td>
				<%	}	%>			
			</tr>
		</table>
	</div>
</body>
</html>