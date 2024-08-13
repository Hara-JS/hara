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
			표현식과 스크립트릿 태그를 이용해서 jsp 파일을 작성한다. 
			
			표현식태그안에서 변수설정을 하고, 스크립트릿 태그를 활용해서 html에 그변수값을 출력한다. 
		
		 --%>
	

		<%
		
			String name = "김철수";
			System.out.println(name);
			
			int a = 10 + 3;
			System.out.println(a);
		
		%>	
		
		<%=name %>
		<hr/>
		<%=a %>
		
		
	</body>
</html>