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
		
		
		_12_member.sql 파일의 디비를 세팅하고 원하는 회원정보를 검색해보자.
		
		
	 --%>

	<h3>검색할 회원번호를 입력하세요.</h3>
	<form action="_1204_findMemberPro.jsp">
		번호 : <input type="text" name="memberNumber">
		
		<input type="submit">
	</form>
</body>
</html>