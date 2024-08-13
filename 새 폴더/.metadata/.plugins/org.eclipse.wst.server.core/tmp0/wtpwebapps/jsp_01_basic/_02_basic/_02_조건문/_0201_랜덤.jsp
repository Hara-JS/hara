<%@page import="java.util.Random"%>
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
		[랜덤 사용법]
			자바에서와 마찬가지로 랜덤은 임포트 해야한다. 
			가장윗줄을 보면 임포트되어있다. 			
			Directive 태그는 기본설정이외에 임포트기능을 가지고있다. 		
			임포트되면 자바에서 사용하듯이 사용할수있다. 
			
		[임포트하는방법]
			<%@page import="java.util.Random"%>
	 --%>

	<%	
		Random ran = new Random();
		int a = ran.nextInt(10);
	%>
	
	<%=a %>
	
	<hr/>
	
	
</body>
</html>