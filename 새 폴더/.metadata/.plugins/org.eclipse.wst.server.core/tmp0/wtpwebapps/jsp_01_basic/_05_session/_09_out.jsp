<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>out 내장 객체 </h2>
	<h2> out.println()활용</h2>
	  
	<%
		String name = "[자바에서 HTML을 출력할 수 있다.]";
		out.println("출력되는 내용은 <h2>" + name + "</h2> 입니다.");
	%>
	  
	<h2>위와 같은 내용 출력</h2> 
	출력되는 내용은 <b><%=name %></b> 입니다.
</body>
</html>




