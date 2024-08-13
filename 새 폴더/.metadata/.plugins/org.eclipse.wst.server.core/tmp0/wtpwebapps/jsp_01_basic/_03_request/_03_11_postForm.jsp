<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/*
			form 의 옵션중 method="post" 를설정하면 전달되는 데이터가 암호화되어 보이지않는다. 
		*/
	%>
	
	<form action="_03_11_postPro.jsp" method="post">
		id : <input type="text" name="id"> <br>
		pw : <input type="text" name="pw" >
		<input type="submit" value="전송하기">
	</form>
	
	
</body>
</html>