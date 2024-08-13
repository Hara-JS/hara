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
	<jsp:include page="01_top.jsp" />
	
	<div align="center">
		<h1>회원탈퇴</h1>
		<form method="post" action="deletePro.jsp">
			<table border="1">
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="입력완료">
					</td>
				</tr>
			</table>		
		</form>
		<br><br>
		<input type="button" value="메인화면" onclick="location.href='main.jsp'">		
	</div>
	
	<%-- bottom --%>
	<jsp:include page="02_bottom.jsp" />
</body>
</html>