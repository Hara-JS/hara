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
		
		int updateNum = Integer.parseInt(request.getParameter("updateNum"));
		int index = Integer.parseInt(request.getParameter("index"));
		
		list[index] = updateNum;
		
		System.out.println("[메세지]수정을 완료하였습니다.");
		
		response.sendRedirect("01_list.jsp");
	%>
	
	
</body>
</html>