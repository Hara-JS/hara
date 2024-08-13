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
		session은 request와 달리 브라우저가 실행되는 동안
		처음부터 끝까지 데이터가 유지된다.
		
		[1] 세션 저장하기
			(1) session.setAttribute(키, 값);
			(2) 키라는 이름으로 값을 저장할 수 있다.
			
		[2] 세션 꺼내오기
			(1) Object obj = session.getAttribute(키);
			(2) 키로 데이터를 꺼내올 수 있으며, Object 타입으로 반환된다.
		[3] 세션 지우기
			(1) session.removeAttribute(키);
			(2) 키로 세션에 저장된 데이터를 삭제할 수 있다.
		[4] 세션 모두 지우기
			(1) session.invalidate();
			(2) 모든 세션을 삭제할 수 있다.
	 --%>
	 
	 <%
	 	int x = 10;
	 	int y = 20;
	 	
	 	session.setAttribute("x", x);
	 	session.setAttribute("y", y);
	 %>
	 
	 <a href="_01_sessionPro1.jsp">다음 페이지1</a>
</body>
</html>




