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
				[4] 스크립트릿(Scriptlet) 태그    : <%     %>
					자바의 영역을 설정할때 사용한다.
					
					그안은 완전히 자바영역으로 자바의 변수들을 사용할수있다. 
 		--%>

		<%
		
			String name = "김철수";
			System.out.println(name);
			
			int a = 10 + 3;
			System.out.println(a);
		
		%>	
		
		
	</body>
</html>