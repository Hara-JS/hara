<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String strNum = request.getParameter("num1");	 
		int num1 = Integer.parseInt(strNum);
		strNum = request.getParameter("num2");	 
		int num2 = Integer.parseInt(strNum);
	
	%>
	
	 <h2>더큰숫자찾기</h2>
	 
	 <%if(num1 > num2) {%>
	 	<%=num1 %>
	 <%}else if(num2 > num1){ %>
	 	<%=num2 %>
	 <%} %>
</body>
</html>