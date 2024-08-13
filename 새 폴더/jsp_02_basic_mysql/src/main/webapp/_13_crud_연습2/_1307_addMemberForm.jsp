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
		<h3>[추가]학생정보를 입력하세요.</h3>
		<form action="_1307_addMemberFormPro.jsp">
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="studentNumber"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="male">남
						<input type="radio" name="gender" value="female">여
					</td>
				</tr>
				<tr>
					<td>국어</td>
					<td><input type="text" name="kor"></td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="math"></td>
				</tr>
			</table>
			
			<input type="submit">
		</form>
	</div>
</body>
</html>