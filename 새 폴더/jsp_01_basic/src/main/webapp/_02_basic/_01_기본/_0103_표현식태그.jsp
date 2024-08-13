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
				[2] 표현식(Expression) 태그  : <%=     %>
					자바의 출력문과 같은역활을한다. 
					글자만 출력했을때는 html 에 그냥 적으나 표현식을 사용하나 차이가없지만,
					연산식을 사용해보면 그차이를 알수있다.
 		--%>

			반갑습니다. 
			<br/>
			<%= "안녕하세요." %>	
			
			<hr/>
			
			10 + 3 
			<br/>
			<%= 10 + 3 %>
</body>
</html>