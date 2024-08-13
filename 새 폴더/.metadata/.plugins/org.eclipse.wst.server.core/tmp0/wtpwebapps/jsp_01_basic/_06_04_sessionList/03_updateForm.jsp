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
		Object obj = null;
	
		obj = session.getAttribute("max");
		int max = (int)obj;
		
		obj = session.getAttribute("count");
		int count = (int)obj;
		
		obj = session.getAttribute("list");
		int[] list = (int[])obj;
		
		String str = request.getParameter("index");
		int index = Integer.parseInt(str);
	%>
	<h1>수정하기</h1>
	
	<form action="04_updatePro.jsp">
		<p><%= list[index] %>의 값을 수정합니다.</p>
		수정할 값 입력 : <input type="number" name="updateNum">
		<input type="hidden" name="index" value="<%= index %>">
		<input type="submit" value="수정하기">
	</form>
</body>
</html>