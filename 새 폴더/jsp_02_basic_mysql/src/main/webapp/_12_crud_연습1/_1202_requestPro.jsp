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
		?뒤에 str=안녕하세요 를 찾아야하는데, request 라는 함수를 이용한다. 
		
		request.getParameter(name에저장된내용);	
	
	 --%>
	 <%
	 	String a = request.getParameter("str");
	 %>
	 
	<h1>이곳은 requestPro 입니다.</h1>
	<%=a %>
	
	
</body>
</html>