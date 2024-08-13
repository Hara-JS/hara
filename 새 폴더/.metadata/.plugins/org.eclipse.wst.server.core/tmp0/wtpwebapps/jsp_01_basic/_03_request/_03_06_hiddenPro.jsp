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
	
	strNum = request.getParameter("result");	 
	int result = Integer.parseInt(strNum);
	
%>
 <%=num1 %> * <%=num2 %> = <%=result %> <br>

 <a href="_03_06_hiddenForm.jsp">돌아기가</a>
</body>
</html>