<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		table {
			width: 350px;
			border-collapse: collapse;
			border-bottom: 1px solid black;
		}
		table th {
			background-color: blue;
			color: white;
			height: 30px;
		}
		a {
			text-decoration: none;
			color: black;
		}
		a:hover {
			color: blue;
		}		
	</style>
</head>
<body>
	<div align="center">
		<h1><a href="index.jsp">CAFE24 호스팅 연습예제</a></h1>
		<h3>회원 가입</h3>
		<form method="post" action="joinPro.jsp">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="pw"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>







