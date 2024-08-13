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
		데이터를 두개보낼경우
		예를 들어 아이디는 qwer , 비밀번호는 1234 라고할경우
		
		_1203_loginPro.jsp?memberId=qwer&memberPw=1234
		
		위와같이 보내진다. 
		
		처음에는 ?가 붙고 그뒤로 전달되는 데이터가 여러개이면 그뒤부터는 구분자로 & 가 붙는다.
		
		
		
		
	 --%>

	<form action="_1203_loginPro.jsp">
		아이디 : <input type="text" name="memberId">
		비밀번호 : <input type="text" name="memberPw">
		<input type="submit">
	</form>
</body>
</html>