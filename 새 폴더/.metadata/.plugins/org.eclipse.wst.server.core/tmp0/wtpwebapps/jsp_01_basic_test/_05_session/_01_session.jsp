<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- session은 request와 달리 브라우저가 실행되는 동안 처음부터 끝까지 데이터가 유지

	세션 저장 : session.setAttribute(키, 값);

	세션 꺼내오기 : Object obj = session.getAttribute(키);
		- 키로 데이터를 꺼내올 수 있으며, Object로 반환
	
	세션 지우기 : session.removeAttribute(키);
		- 키로 세션에 저장된 데이터를 삭제할 수 있음
	
	세션 모두 지우기 : session.invalidate();
 	
 	--%>

	<%
	int x = 10;
	int y = 29;

	session.setAttribute("x", x);
	session.setAttribute("y", y);
	%>

	<a href="_01_sessionPro1.jsp"> 다음 페이지 1 </a>



</body>
</html>




