<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		button {
			border-style: none;
			width: 300px;
			height: 150px;
			background-color: white;
			border: 1px solid blue;
			border-radius: 5px;
			font-size: 30px;
			font-weight: bold;
			cursor: pointer;
		}
		button:hover {
			background-color: blue;
			color: white;
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
		
		<button onclick="location.href='joinForm.jsp'">회원가입</button>
		
		<button onclick="location.href='memberList.jsp'">회원정보</button>
		
	</div>
</body>
</html>